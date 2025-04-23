#include <libssh/libssh.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
    if (argc < 4) {
        fprintf(stderr, "Kullanım: %s <ip> <kullanıcı> <şifre>\n", argv[0]);
        return 1;
    }

    const char *ip = argv[1];
    const char *user = argv[2];
    const char *pass = argv[3];

    ssh_session session = ssh_new();
    if (session == NULL) {
        fprintf(stderr, "SSH oturumu oluşturulamadı\n");
        return 1;
    }

    ssh_options_set(session, SSH_OPTIONS_HOST, ip);
    ssh_options_set(session, SSH_OPTIONS_USER, user);
    ssh_options_set(session, SSH_OPTIONS_PORT, &(int){22});  // default port 22

    int rc = ssh_connect(session);
    if (rc != SSH_OK) {
        fprintf(stderr, "Bağlantı hatası: %s\n", ssh_get_error(session));
        ssh_free(session);
        return 1;
    }

    rc = ssh_userauth_password(session, NULL, pass);
    if (rc == SSH_AUTH_SUCCESS) {
        printf("✅ BAŞARILI! %s@%s ile giriş sağlandı.\n", user, ip);
        ssh_disconnect(session);
        ssh_free(session);
        return 0;
    } else {
        printf("❌ Başarısız giriş denemesi: %s\n", pass);
        ssh_disconnect(session);
        ssh_free(session);
        return 1;
    }
}
