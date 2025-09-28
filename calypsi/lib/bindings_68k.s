;;;
;;; Bindings for the Foenix Toolbox public calls
;;;

	.public sys_proc_exit
	.public sys_int_enable_all
	.public sys_int_disable_all
	.public sys_int_restore_all
	.public sys_int_disable
	.public sys_int_enable
	.public sys_int_register
	.public sys_int_pending
	.public sys_int_clear
	.public sys_get_info
	.public sys_chan_read_b
	.public sys_chan_read
	.public sys_chan_readline
	.public sys_chan_write_b
	.public sys_chan_write
	.public sys_chan_status
	.public sys_chan_flush
	.public sys_chan_seek
	.public sys_chan_ioctrl
	.public sys_chan_open
	.public sys_chan_close
	.public sys_chan_swap
	.public sys_chan_device
	.public sys_cdev_register
	.public sys_bdev_register
	.public sys_bdev_read
	.public sys_bdev_write
	.public sys_bdev_status
	.public sys_bdev_flush
	.public sys_bdev_ioctrl
	.public sys_fsys_open
	.public sys_fsys_close
	.public sys_fsys_opendir
	.public sys_fsys_closedir
	.public sys_fsys_readdir
	.public sys_fsys_findfirst
	.public sys_fsys_findnext
	.public sys_fsys_get_label
	.public sys_fsys_set_label
	.public sys_fsys_mkdir
	.public sys_fsys_delete
	.public sys_fsys_rename
	.public sys_fsys_load
	.public sys_fsys_register_loader
	.public sys_fsys_stat
	.public sys_mem_get_ramtop
	.public sys_mem_reserve
	.public sys_time_jiffies
	.public sys_rtc_set_time
	.public sys_rtc_get_time
	.public sys_kbd_scancode
	.public sys_err_message
	.public sys_kbd_layout
	.public sys_proc_run
	.public sys_txt_get_capabilities
	.public sys_txt_set_mode
	.public sys_txt_set_resolution
	.public sys_txt_setsizes
	.public sys_txt_set_xy
	.public sys_txt_get_xy
	.public sys_txt_get_region
	.public sys_txt_set_region
	.public sys_txt_set_color
	.public sys_txt_get_color
	.public sys_txt_set_cursor
	.public sys_txt_set_cursor_visible
	.public sys_txt_set_font
	.public sys_txt_get_sizes
	.public sys_txt_set_border
	.public sys_txt_set_border_color
	.public sys_txt_put
	.public sys_txt_print
	.public sys_kbd_handle_irq
	.public sys_reboot
	.public sys_proc_set_shell
	.public sys_proc_get_result
	.public sys_iecll_ioinit
	.public sys_iecll_in
	.public sys_iecll_eoi
	.public sys_iecll_out
	.public sys_iecll_talk
	.public sys_iecll_talk_sa
	.public sys_iecll_untalk
	.public sys_iecll_listen
	.public sys_iecll_listen_sa
	.public sys_iecll_unlisten
	.public sys_iecll_reset
	.public sys_proc_exit
	.public sys_int_enable_all
	.public sys_int_disable_all
	.public sys_int_restore_all
	.public sys_int_disable
	.public sys_int_enable
	.public sys_int_register
	.public sys_int_pending
	.public sys_int_clear
	.public sys_get_info
	.public sys_chan_read_b
	.public sys_chan_read
	.public sys_chan_readline
	.public sys_chan_write_b
	.public sys_chan_write
	.public sys_chan_status
	.public sys_chan_flush
	.public sys_chan_seek
	.public sys_chan_ioctrl
	.public sys_chan_open
	.public sys_chan_close
	.public sys_chan_swap
	.public sys_chan_device
	.public sys_cdev_register
	.public sys_bdev_register
	.public sys_bdev_read
	.public sys_bdev_write
	.public sys_bdev_status
	.public sys_bdev_flush
	.public sys_bdev_ioctrl
	.public sys_fsys_open
	.public sys_fsys_close
	.public sys_fsys_opendir
	.public sys_fsys_closedir
	.public sys_fsys_readdir
	.public sys_fsys_findfirst
	.public sys_fsys_findnext
	.public sys_fsys_get_label
	.public sys_fsys_set_label
	.public sys_fsys_mkdir
	.public sys_fsys_delete
	.public sys_fsys_rename
	.public sys_fsys_load
	.public sys_fsys_register_loader
	.public sys_fsys_stat
	.public sys_mem_get_ramtop
	.public sys_mem_reserve
	.public sys_time_jiffies
	.public sys_rtc_set_time
	.public sys_rtc_get_time
	.public sys_kbd_scancode
	.public sys_err_message
	.public sys_kbd_layout
	.public sys_proc_run
	.public sys_txt_get_capabilities
	.public sys_txt_set_mode
	.public sys_txt_set_resolution
	.public sys_txt_setsizes
	.public sys_txt_set_xy
	.public sys_txt_get_xy
	.public sys_txt_get_region
	.public sys_txt_set_region
	.public sys_txt_set_color
	.public sys_txt_get_color
	.public sys_txt_set_cursor
	.public sys_txt_set_cursor_visible
	.public sys_txt_set_font
	.public sys_txt_get_sizes
	.public sys_txt_set_border
	.public sys_txt_set_border_color
	.public sys_txt_put
	.public sys_txt_print
	.public sys_kbd_handle_irq
	.public sys_reboot
	.public sys_proc_set_shell
	.public sys_proc_get_result
	.public sys_fsys_set_cwd
	.public sys_fsys_get_cwd

sys_proc_exit                .equlab 0x000400
sys_int_enable_all           .equlab 0x000404
sys_int_disable_all          .equlab 0x000408
sys_int_restore_all          .equlab 0x00040C
sys_int_disable              .equlab 0x000410
sys_int_enable               .equlab 0x000414
sys_int_register             .equlab 0x000418
sys_int_pending              .equlab 0x00041C
sys_int_clear                .equlab 0x000420
sys_get_info                 .equlab 0x000424
sys_chan_read_b              .equlab 0x000428
sys_chan_read                .equlab 0x00042C
sys_chan_readline            .equlab 0x000430
sys_chan_write_b             .equlab 0x000434
sys_chan_write               .equlab 0x000438
sys_chan_status              .equlab 0x00043C
sys_chan_flush               .equlab 0x000440
sys_chan_seek                .equlab 0x000444
sys_chan_ioctrl              .equlab 0x000448
sys_chan_open                .equlab 0x00044C
sys_chan_close               .equlab 0x000450
sys_chan_swap                .equlab 0x000454
sys_chan_device              .equlab 0x000458
sys_cdev_register            .equlab 0x00045C
sys_bdev_register            .equlab 0x000460
sys_bdev_read                .equlab 0x000464
sys_bdev_write               .equlab 0x000468
sys_bdev_status              .equlab 0x00046C
sys_bdev_flush               .equlab 0x000470
sys_bdev_ioctrl              .equlab 0x000474
sys_fsys_open                .equlab 0x000478
sys_fsys_close               .equlab 0x00047C
sys_fsys_opendir             .equlab 0x000480
sys_fsys_closedir            .equlab 0x000484
sys_fsys_readdir             .equlab 0x000488
sys_fsys_findfirst           .equlab 0x00048C
sys_fsys_findnext            .equlab 0x000490
sys_fsys_get_label           .equlab 0x000494
sys_fsys_set_label           .equlab 0x000498
sys_fsys_mkdir               .equlab 0x00049C
sys_fsys_delete              .equlab 0x0004A0
sys_fsys_rename              .equlab 0x0004A4
sys_fsys_load                .equlab 0x0004A8
sys_fsys_register_loader     .equlab 0x0004AC
sys_fsys_stat                .equlab 0x0004B0
sys_mem_get_ramtop           .equlab 0x0004B4
sys_mem_reserve              .equlab 0x0004B8
sys_time_jiffies             .equlab 0x0004BC
sys_rtc_set_time             .equlab 0x0004C0
sys_rtc_get_time             .equlab 0x0004C4
sys_kbd_scancode             .equlab 0x0004C8
sys_err_message              .equlab 0x0004CC
sys_kbd_layout               .equlab 0x0004D0
sys_proc_run                 .equlab 0x0004D4
sys_txt_get_capabilities     .equlab 0x0004D8
sys_txt_set_mode             .equlab 0x0004DC
sys_txt_set_resolution       .equlab 0x0004E0
sys_txt_setsizes             .equlab 0x0004E4
sys_txt_set_xy               .equlab 0x0004E8
sys_txt_get_xy               .equlab 0x0004EC
sys_txt_get_region           .equlab 0x0004F0
sys_txt_set_region           .equlab 0x0004F4
sys_txt_set_color            .equlab 0x0004F8
sys_txt_get_color            .equlab 0x0004FC
sys_txt_set_cursor           .equlab 0x000500
sys_txt_set_cursor_visible   .equlab 0x000504
sys_txt_set_font             .equlab 0x000508
sys_txt_get_sizes            .equlab 0x00050C
sys_txt_set_border           .equlab 0x000510
sys_txt_set_border_color     .equlab 0x000514
sys_txt_put                  .equlab 0x000518
sys_txt_print                .equlab 0x00051C
sys_kbd_handle_irq           .equlab 0x000520
sys_reboot                   .equlab 0x000524
sys_proc_set_shell           .equlab 0x000528
sys_proc_get_result          .equlab 0x00052C
sys_iecll_ioinit             .equlab 0xFFE130
sys_iecll_in                 .equlab 0xFFE134
sys_iecll_eoi                .equlab 0xFFE138
sys_iecll_out                .equlab 0xFFE13C
sys_iecll_talk               .equlab 0xFFE140
sys_iecll_talk_sa            .equlab 0xFFE144
sys_iecll_untalk             .equlab 0xFFE148
sys_iecll_listen             .equlab 0xFFE14C
sys_iecll_listen_sa          .equlab 0xFFE150
sys_iecll_unlisten           .equlab 0xFFE154
sys_iecll_reset              .equlab 0xFFE158
sys_proc_exit                .equlab 0x000400
sys_int_enable_all           .equlab 0x000404
sys_int_disable_all          .equlab 0x000408
sys_int_restore_all          .equlab 0x00040C
sys_int_disable              .equlab 0x000410
sys_int_enable               .equlab 0x000414
sys_int_register             .equlab 0x000418
sys_int_pending              .equlab 0x00041C
sys_int_clear                .equlab 0x000420
sys_get_info                 .equlab 0x000424
sys_chan_read_b              .equlab 0x000428
sys_chan_read                .equlab 0x00042C
sys_chan_readline            .equlab 0x000430
sys_chan_write_b             .equlab 0x000434
sys_chan_write               .equlab 0x000438
sys_chan_status              .equlab 0x00043C
sys_chan_flush               .equlab 0x000440
sys_chan_seek                .equlab 0x000444
sys_chan_ioctrl              .equlab 0x000448
sys_chan_open                .equlab 0x00044C
sys_chan_close               .equlab 0x000450
sys_chan_swap                .equlab 0x000454
sys_chan_device              .equlab 0x000458
sys_cdev_register            .equlab 0x00045C
sys_bdev_register            .equlab 0x000460
sys_bdev_read                .equlab 0x000464
sys_bdev_write               .equlab 0x000468
sys_bdev_status              .equlab 0x00046C
sys_bdev_flush               .equlab 0x000470
sys_bdev_ioctrl              .equlab 0x000474
sys_fsys_open                .equlab 0x000478
sys_fsys_close               .equlab 0x00047C
sys_fsys_opendir             .equlab 0x000480
sys_fsys_closedir            .equlab 0x000484
sys_fsys_readdir             .equlab 0x000488
sys_fsys_findfirst           .equlab 0x00048C
sys_fsys_findnext            .equlab 0x000490
sys_fsys_get_label           .equlab 0x000494
sys_fsys_set_label           .equlab 0x000498
sys_fsys_mkdir               .equlab 0x00049C
sys_fsys_delete              .equlab 0x0004A0
sys_fsys_rename              .equlab 0x0004A4
sys_fsys_load                .equlab 0x0004A8
sys_fsys_register_loader     .equlab 0x0004AC
sys_fsys_stat                .equlab 0x0004B0
sys_mem_get_ramtop           .equlab 0x0004B4
sys_mem_reserve              .equlab 0x0004B8
sys_time_jiffies             .equlab 0x0004BC
sys_rtc_set_time             .equlab 0x0004C0
sys_rtc_get_time             .equlab 0x0004C4
sys_kbd_scancode             .equlab 0x0004C8
sys_err_message              .equlab 0x0004CC
sys_kbd_layout               .equlab 0x0004D0
sys_proc_run                 .equlab 0x0004D4
sys_txt_get_capabilities     .equlab 0x0004D8
sys_txt_set_mode             .equlab 0x0004DC
sys_txt_set_resolution       .equlab 0x0004E0
sys_txt_setsizes             .equlab 0x0004E4
sys_txt_set_xy               .equlab 0x0004E8
sys_txt_get_xy               .equlab 0x0004EC
sys_txt_get_region           .equlab 0x0004F0
sys_txt_set_region           .equlab 0x0004F4
sys_txt_set_color            .equlab 0x0004F8
sys_txt_get_color            .equlab 0x0004FC
sys_txt_set_cursor           .equlab 0x000500
sys_txt_set_cursor_visible   .equlab 0x000504
sys_txt_set_font             .equlab 0x000508
sys_txt_get_sizes            .equlab 0x00050C
sys_txt_set_border           .equlab 0x000510
sys_txt_set_border_color     .equlab 0x000514
sys_txt_put                  .equlab 0x000518
sys_txt_print                .equlab 0x00051C
sys_kbd_handle_irq           .equlab 0x000520
sys_reboot                   .equlab 0x000524
sys_proc_set_shell           .equlab 0x000528
sys_proc_get_result          .equlab 0x00052C
sys_fsys_set_cwd             .equlab 0x000530
sys_fsys_get_cwd             .equlab 0x000534
