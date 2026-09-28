#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

int main(void) {
    LOG_INF("PixaPulse Satellite Node Starting");
    
    while (1) {
        LOG_DBG("Satellite running");
        k_sleep(K_MSEC(1000));
    }
    
    return 0;
}