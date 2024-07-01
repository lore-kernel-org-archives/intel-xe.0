Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA9BC2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 19:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10EB10E038;
	Mon,  1 Jul 2024 19:39:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DA610E038;
 Mon,  1 Jul 2024 19:39:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Fix_global-out-of-bo?=
 =?utf-8?q?unds_in_rule=5Fmatches?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 19:39:06 -0000
Message-ID: <171986274673.3396.11965655776827293708@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701153702.21824-1-nirmoy.das@intel.com>
In-Reply-To: <20240701153702.21824-1-nirmoy.das@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix global-out-of-bounds in rule_matches
URL   : https://patchwork.freedesktop.org/series/135604/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:38:33] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:38:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[19:39:02] Starting KUnit Kernel (1/1)...
[19:39:02] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:39:03] =================== guc_dbm (7 subtests) ===================
[19:39:03] [PASSED] test_empty
[19:39:03] [PASSED] test_default
[19:39:03] ======================== test_size  ========================
[19:39:03] [PASSED] 4
[19:39:03] [PASSED] 8
[19:39:03] [PASSED] 32
[19:39:03] [PASSED] 256
[19:39:03] ==================== [PASSED] test_size ====================
[19:39:03] ======================= test_reuse  ========================
[19:39:03] [PASSED] 4
[19:39:03] [PASSED] 8
[19:39:03] [PASSED] 32
[19:39:03] [PASSED] 256
[19:39:03] =================== [PASSED] test_reuse ====================
[19:39:03] =================== test_range_overlap  ====================
[19:39:03] [PASSED] 4
[19:39:03] [PASSED] 8
[19:39:03] [PASSED] 32
[19:39:03] [PASSED] 256
[19:39:03] =============== [PASSED] test_range_overlap ================
[19:39:03] =================== test_range_compact  ====================
[19:39:03] [PASSED] 4
[19:39:03] [PASSED] 8
[19:39:03] [PASSED] 32
[19:39:03] [PASSED] 256
[19:39:03] =============== [PASSED] test_range_compact ================
[19:39:03] ==================== test_range_spare  =====================
[19:39:03] [PASSED] 4
[19:39:03] [PASSED] 8
[19:39:03] [PASSED] 32
[19:39:03] [PASSED] 256
[19:39:03] ================ [PASSED] test_range_spare =================
[19:39:03] ===================== [PASSED] guc_dbm =====================
[19:39:03] =================== guc_idm (6 subtests) ===================
[19:39:03] [PASSED] bad_init
[19:39:03] [PASSED] no_init
[19:39:03] [PASSED] init_fini
[19:39:03] [PASSED] check_used
[19:39:03] [PASSED] check_quota
[19:39:03] [PASSED] check_all
[19:39:03] ===================== [PASSED] guc_idm =====================
[19:39:03] ================== no_relay (3 subtests) ===================
[19:39:03] [PASSED] xe_drops_guc2pf_if_not_ready
[19:39:03] [PASSED] xe_drops_guc2vf_if_not_ready
[19:39:03] [PASSED] xe_rejects_send_if_not_ready
[19:39:03] ==================== [PASSED] no_relay =====================
[19:39:03] ================== pf_relay (14 subtests) ==================
[19:39:03] [PASSED] pf_rejects_guc2pf_too_short
[19:39:03] [PASSED] pf_rejects_guc2pf_too_long
[19:39:03] [PASSED] pf_rejects_guc2pf_no_payload
[19:39:03] [PASSED] pf_fails_no_payload
[19:39:03] [PASSED] pf_fails_bad_origin
[19:39:03] [PASSED] pf_fails_bad_type
[19:39:03] [PASSED] pf_txn_reports_error
[19:39:03] [PASSED] pf_txn_sends_pf2guc
[19:39:03] [PASSED] pf_sends_pf2guc
[19:39:03] [SKIPPED] pf_loopback_nop
[19:39:03] [SKIPPED] pf_loopback_echo
[19:39:03] [SKIPPED] pf_loopback_fail
[19:39:03] [SKIPPED] pf_loopback_busy
[19:39:03] [SKIPPED] pf_loopback_retry
[19:39:03] ==================== [PASSED] pf_relay =====================
[19:39:03] ================== vf_relay (3 subtests) ===================
[19:39:03] [PASSED] vf_rejects_guc2vf_too_short
[19:39:03] [PASSED] vf_rejects_guc2vf_too_long
[19:39:03] [PASSED] vf_rejects_guc2vf_no_payload
[19:39:03] ==================== [PASSED] vf_relay =====================
[19:39:03] ================= pf_service (11 subtests) =================
[19:39:03] [PASSED] pf_negotiate_any
[19:39:03] [PASSED] pf_negotiate_base_match
[19:39:03] [PASSED] pf_negotiate_base_newer
[19:39:03] [PASSED] pf_negotiate_base_next
[19:39:03] [SKIPPED] pf_negotiate_base_older
[19:39:03] [PASSED] pf_negotiate_base_prev
[19:39:03] [PASSED] pf_negotiate_latest_match
[19:39:03] [PASSED] pf_negotiate_latest_newer
[19:39:03] [PASSED] pf_negotiate_latest_next
[19:39:03] [SKIPPED] pf_negotiate_latest_older
[19:39:03] [SKIPPED] pf_negotiate_latest_prev
[19:39:03] =================== [PASSED] pf_service ====================
[19:39:03] ===================== lmtt (1 subtest) =====================
[19:39:03] ======================== test_ops  =========================
[19:39:03] [PASSED] 2-level
[19:39:03] [PASSED] multi-level
[19:39:03] ==================== [PASSED] test_ops =====================
[19:39:03] ====================== [PASSED] lmtt =======================
[19:39:03] ==================== xe_bo (2 subtests) ====================
[19:39:03] [SKIPPED] xe_ccs_migrate_kunit
[19:39:03] [SKIPPED] xe_bo_evict_kunit
[19:39:03] ===================== [SKIPPED] xe_bo ======================
[19:39:03] ================== xe_dma_buf (1 subtest) ==================
[19:39:03] [SKIPPED] xe_dma_buf_kunit
[19:39:03] =================== [SKIPPED] xe_dma_buf ===================
[19:39:03] ================== xe_migrate (1 subtest) ==================
[19:39:03] [SKIPPED] xe_migrate_sanity_kunit
[19:39:03] =================== [SKIPPED] xe_migrate ===================
[19:39:03] =================== xe_mocs (2 subtests) ===================
[19:39:03] [SKIPPED] xe_live_mocs_kernel_kunit
[19:39:03] [SKIPPED] xe_live_mocs_reset_kunit
[19:39:03] ==================== [SKIPPED] xe_mocs =====================
[19:39:03] ==================== args (11 subtests) ====================
[19:39:03] [PASSED] count_args_test
[19:39:03] [PASSED] call_args_example
[19:39:03] [PASSED] call_args_test
[19:39:03] [PASSED] drop_first_arg_example
[19:39:03] [PASSED] drop_first_arg_test
[19:39:03] [PASSED] first_arg_example
[19:39:03] [PASSED] first_arg_test
[19:39:03] [PASSED] last_arg_example
[19:39:03] [PASSED] last_arg_test
[19:39:03] [PASSED] pick_arg_example
[19:39:03] [PASSED] sep_comma_example
[19:39:03] ====================== [PASSED] args =======================
[19:39:03] =================== xe_pci (2 subtests) ====================
[19:39:03] [PASSED] xe_gmdid_graphics_ip
[19:39:03] [PASSED] xe_gmdid_media_ip
[19:39:03] ===================== [PASSED] xe_pci ======================
[19:39:03] ==================== xe_rtp (1 subtest) ====================
[19:39:03] ================== xe_rtp_process_tests  ===================
[19:39:03] [PASSED] coalesce-same-reg
[19:39:03] [PASSED] no-match-no-add
[19:39:03] ------------[ cut here ]------------
[19:39:03] WARNING: CPU: 0 PID: 181 at drivers/gpu/drm/xe/xe_rtp.c:137 rule_matches+0x356/0x410
[19:39:03] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] drm_WARN_ON(!rcount)
[19:39:03] CPU: 0 PID: 181 Comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc5 #1
[19:39:03] Stack:
[19:39:03]  60470a30 605da7e5 605da7e5 00000001
[19:39:03]  ffffff00 605da7e5 603bb806 00000089
[19:39:03]  a1883c88 6049e089 a1883cd0 00000000
[19:39:03] Call Trace:
[19:39:03]  [<60030579>] ? os_is_signal_stack+0x19/0x30
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<604697e2>] ? show_stack.cold+0x9e/0xef
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<6049e089>] ? dump_stack_lvl+0x6a/0xb2
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<6003b831>] ? __warn+0x111/0x120
[19:39:03]  [<60465ef0>] ? xas_store+0x0/0x860
[19:39:03]  [<6046ae6f>] ? warn_slowpath_fmt+0xd0/0xde
[19:39:03]  [<60466af1>] ? xa_store+0x51/0x60
[19:39:03]  [<604ac59c>] ? _raw_spin_unlock+0x2c/0x30
[19:39:03]  [<60466af1>] ? xa_store+0x51/0x60
[19:39:03]  [<603baba5>] ? xe_reg_sr_add+0xd5/0x1a0
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<603bb7c4>] ? rule_matches+0x314/0x410
[19:39:03]  [<603bbad3>] ? xe_rtp_process_to_sr+0x93/0x1b0
[19:39:03]  [<603e225e>] ? xe_rtp_process_tests+0x7e/0x430
[19:39:03]  [<60030370>] ? um_set_signals+0x0/0x70
[19:39:03]  [<60030b7c>] ? os_nsecs+0x1c/0x30
[19:39:03]  [<604a1740>] ? schedule_preempt_disabled+0x0/0x20
[19:39:03]  [<600b9470>] ? ktime_get_ts64+0x0/0x290
[19:39:03]  [<60297300>] ? kunit_try_run_case+0x60/0xd0
[19:39:03]  [<604ac640>] ? _raw_spin_unlock_irqrestore+0x0/0x90
[19:39:03]  [<600648e9>] ? __kthread_parkme+0x99/0xd0
[19:39:03]  [<604a122e>] ? schedule+0x6e/0x1c0
[19:39:03]  [<602993c6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[19:39:03]  [<602993b0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[19:39:03]  [<60064ef6>] ? kthread+0x106/0x160
[19:39:03]  [<60072c5b>] ? schedule_tail+0x8b/0xe0
[19:39:03]  [<60020146>] ? new_thread_handler+0x86/0xc0
[19:39:03] irq event stamp: 145
[19:39:03] hardirqs last  enabled at (155): [<000000006009b7b6>] console_unlock+0x196/0x1b0
[19:39:03] hardirqs last disabled at (164): [<000000006009b77c>] console_unlock+0x15c/0x1b0
[19:39:03] softirqs last  enabled at (0): [<0000000060037fff>] copy_process+0xa2f/0x2b80
[19:39:03] softirqs last disabled at (0): [<0000000000000000>] 0x0
[19:39:03] ---[ end trace 0000000000000000 ]---
[19:39:03] ------------[ cut here ]------------
[19:39:03] WARNING: CPU: 0 PID: 181 at drivers/gpu/drm/xe/xe_rtp.c:137 rule_matches+0x356/0x410
[19:39:03] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] drm_WARN_ON(!rcount)
[19:39:03] CPU: 0 PID: 181 Comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc5 #1
[19:39:03] Stack:
[19:39:03]  60470a30 605da7e5 605da7e5 00000001
[19:39:03]  ffffff00 605da7e5 603bb806 00000089
[19:39:03]  a1883c88 6049e089 a1883cd0 00000000
[19:39:03] Call Trace:
[19:39:03]  [<60030579>] ? os_is_signal_stack+0x19/0x30
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<604697e2>] ? show_stack.cold+0x9e/0xef
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<6049e089>] ? dump_stack_lvl+0x6a/0xb2
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<6003b831>] ? __warn+0x111/0x120
[19:39:03]  [<60465ef0>] ? xas_store+0x0/0x860
[19:39:03]  [<6046ae6f>] ? warn_slowpath_fmt+0xd0/0xde
[19:39:03]  [<60466af1>] ? xa_store+0x51/0x60
[19:39:03]  [<604ac59c>] ? _raw_spin_unlock+0x2c/0x30
[19:39:03]  [<60466af1>] ? xa_store+0x51/0x60
[19:39:03]  [<603baba5>] ? xe_reg_sr_add+0xd5/0x1a0
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<603bb7c4>] ? rule_matches+0x314/0x410
[19:39:03]  [<603bbad3>] ? xe_rtp_process_to_sr+0x93/0x1b0
[19:39:03]  [<603e225e>] ? xe_rtp_process_tests+0x7e/0x430
[19:39:03]  [<60030370>] ? um_set_signals+0x0/0x70
[19:39:03]  [<60030b7c>] ? os_nsecs+0x1c/0x30
[19:39:03]  [<604a1740>] ? schedule_preempt_disabled+0x0/0x20
[19:39:03]  [<600b9470>] ? ktime_get_ts64+0x0/0x290
[19:39:03]  [<60297300>] ? kunit_try_run_case+0x60/0xd0
[19:39:03]  [<604ac640>] ? _raw_spin_unlock_irqrestore+0x0/0x90
[19:39:03]  [<600648e9>] ? __kthread_parkme+0x99/0xd0
[19:39:03]  [<604a122e>] ? schedule+0x6e/0x1c0
[19:39:03]  [<602993c6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[19:39:03]  [<602993b0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[19:39:03]  [<60064ef6>] ? kthread+0x106/0x160
[19:39:03]  [<60072c5b>] ? schedule_tail+0x8b/0xe0
[19:39:03]  [<60020146>] ? new_thread_handler+0x86/0xc0
[19:39:03] irq event stamp: 233
[19:39:03] hardirqs last  enabled at (243): [<000000006009b7b6>] console_unlock+0x196/0x1b0
[19:39:03] hardirqs last disabled at (252): [<000000006009b77c>] console_unlock+0x15c/0x1b0
[19:39:03] softirqs last  enabled at (0): [<0000000060037fff>] copy_process+0xa2f/0x2b80
[19:39:03] softirqs last disabled at (0): [<0000000000000000>] 0x0
[19:39:03] ---[ end trace 0000000000000000 ]---
[19:39:03] ------------[ cut here ]------------
[19:39:03] WARNING: CPU: 0 PID: 181 at drivers/gpu/drm/xe/xe_rtp.c:137 rule_matches+0x356/0x410
[19:39:03] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] drm_WARN_ON(!rcount)
[19:39:03] CPU: 0 PID: 181 Comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc5 #1
[19:39:03] Stack:
[19:39:03]  60470a30 605da7e5 605da7e5 00000001
[19:39:03]  ffffff00 605da7e5 603bb806 00000089
[19:39:03]  a1883c88 6049e089 a1883cd0 00000000
[19:39:03] Call Trace:
[19:39:03]  [<60030579>] ? os_is_signal_stack+0x19/0x30
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<604697e2>] ? show_stack.cold+0x9e/0xef
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<6049e089>] ? dump_stack_lvl+0x6a/0xb2
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<6003b831>] ? __warn+0x111/0x120
[19:39:03]  [<60465ef0>] ? xas_store+0x0/0x860
[19:39:03]  [<6046ae6f>] ? warn_slowpath_fmt+0xd0/0xde
[19:39:03]  [<60466af1>] ? xa_store+0x51/0x60
[19:39:03]  [<604ac59c>] ? _raw_spin_unlock+0x2c/0x30
[19:39:03]  [<60466af1>] ? xa_store+0x51/0x60
[19:39:03]  [<603baba5>] ? xe_reg_sr_add+0xd5/0x1a0
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<603bb7c4>] ? rule_matches+0x314/0x410
[19:39:03]  [<603bbad3>] ? xe_rtp_process_to_sr+0x93/0x1b0
[19:39:03]  [<603e225e>] ? xe_rtp_process_tests+0x7e/0x430
[19:39:03]  [<60030370>] ? um_set_signals+0x0/0x70
[19:39:03]  [<60030b7c>] ? os_nsecs+0x1c/0x30
[19:39:03]  [<604a1740>] ? schedule_preempt_disabled+0x0/0x20
[19:39:03]  [<600b9470>] ? ktime_get_ts64+0x0/0x290
[19:39:03]  [<60297300>] ? kunit_try_run_case+0x60/0xd0
[19:39:03]  [<604ac640>] ? _raw_spin_unlock_irqrestore+0x0/0x90
[19:39:03]  [<600648e9>] ? __kthread_parkme+0x99/0xd0
[19:39:03]  [<604a122e>] ? schedule+0x6e/0x1c0
[19:39:03]  [<602993c6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[19:39:03]  [<602993b0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[19:39:03]  [<60064ef6>] ? kthread+0x106/0x160
[19:39:03]  [<60072c5b>] ? schedule_tail+0x8b/0xe0
[19:39:03]  [<60020146>] ? new_thread_handler+0x86/0xc0
[19:39:03] irq event stamp: 321
[19:39:03] hardirqs last  enabled at (331): [<000000006009b7b6>] console_unlock+0x196/0x1b0
[19:39:03] hardirqs last disabled at (340): [<000000006009b77c>] console_unlock+0x15c/0x1b0
[19:39:03] softirqs last  enabled at (0): [<0000000060037fff>] copy_process+0xa2f/0x2b80
[19:39:03] softirqs last disabled at (0): [<0000000000000000>] 0x0
[19:39:03] ---[ end trace 0000000000000000 ]---
[19:39:03]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:312
[19:39:03]     Expected sr_entry->clr_bits == param->expected_clr_bits, but
[19:39:03]         sr_entry->clr_bits == 1 (0x1)
[19:39:03]         param->expected_clr_bits == 7 (0x7)
[19:39:03]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:313
[19:39:03]     Expected sr_entry->set_bits == param->expected_set_bits, but
[19:39:03]         sr_entry->set_bits == 1 (0x1)
[19:39:03]         param->expected_set_bits == 7 (0x7)
[19:39:03] [FAILED] match-or
[19:39:03] ------------[ cut here ]------------
[19:39:03] WARNING: CPU: 0 PID: 183 at drivers/gpu/drm/xe/xe_rtp.c:137 rule_matches+0x356/0x410
stty: 'standard input': Inappropriate ioctl for device
[19:39:03] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] drm_WARN_ON(!rcount)
[19:39:03] CPU: 0 PID: 183 Comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc5 #1
[19:39:03] Stack:
[19:39:03]  60470a30 605da7e5 605da7e5 00000001
[19:39:03]  ffffff00 605da7e5 603bb806 00000089
[19:39:03]  a1883c88 6049e089 a1883cd0 00000000
[19:39:03] Call Trace:
[19:39:03]  [<60030579>] ? os_is_signal_stack+0x19/0x30
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<604697e2>] ? show_stack.cold+0x9e/0xef
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<6049e089>] ? dump_stack_lvl+0x6a/0xb2
[19:39:03]  [<60470a30>] ? _printk+0x0/0x9f
[19:39:03]  [<6003b831>] ? __warn+0x111/0x120
[19:39:03]  [<6046ae6f>] ? warn_slowpath_fmt+0xd0/0xde
[19:39:03]  [<6008558d>] ? find_held_lock+0x3d/0xa0
[19:39:03]  [<60030370>] ? um_set_signals+0x0/0x70
[19:39:03]  [<60030370>] ? um_set_signals+0x0/0x70
[19:39:03]  [<6009120d>] ? lock_release+0x1cd/0x360
[19:39:03]  [<60030370>] ? um_set_signals+0x0/0x70
[19:39:03]  [<6008c9eb>] ? lockdep_hardirqs_on_prepare+0x12b/0x320
[19:39:03]  [<603bb806>] ? rule_matches+0x356/0x410
[19:39:03]  [<603bb7c4>] ? rule_matches+0x314/0x410
[19:39:03]  [<604ac697>] ? _raw_spin_unlock_irqrestore+0x57/0x90
[19:39:03]  [<603bbad3>] ? xe_rtp_process_to_sr+0x93/0x1b0
[19:39:03]  [<603e225e>] ? xe_rtp_process_tests+0x7e/0x430
[19:39:03]  [<60030370>] ? um_set_signals+0x0/0x70
[19:39:03]  [<60030b7c>] ? os_nsecs+0x1c/0x30
[19:39:03]  [<604a1740>] ? schedule_preempt_disabled+0x0/0x20
[19:39:03]  [<600b9470>] ? ktime_get_ts64+0x0/0x290
[19:39:03]  [<60297300>] ? kunit_try_run_case+0x60/0xd0
[19:39:03]  [<604ac640>] ? _raw_spin_unlock_irqrestore+0x0/0x90
[19:39:03]  [<600648e9>] ? __kthread_parkme+0x99/0xd0
[19:39:03]  [<604a122e>] ? schedule+0x6e/0x1c0
[19:39:03]  [<602993c6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[19:39:03]  [<602993b0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[19:39:03]  [<60064ef6>] ? kthread+0x106/0x160
[19:39:03]  [<60072c5b>] ? schedule_tail+0x8b/0xe0
[19:39:03]  [<60020146>] ? new_thread_handler+0x86/0xc0
[19:39:03] irq event stamp: 147
[19:39:03] hardirqs last  enabled at (157): [<000000006009b7b6>] console_unlock+0x196/0x1b0
[19:39:03] hardirqs last disabled at (166): [<000000006009b77c>] console_unlock+0x15c/0x1b0
[19:39:03] softirqs last  enabled at (0): [<0000000060037fff>] copy_process+0xa2f/0x2b80
[19:39:03] softirqs last disabled at (0): [<0000000000000000>] 0x0
[19:39:03] ---[ end trace 0000000000000000 ]---
[19:39:03]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:310
[19:39:03]     Expected count == param->expected_count, but
[19:39:03]         count == 1 (0x1)
[19:39:03]         param->expected_count == 0 (0x0)
[19:39:03]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:312
[19:39:03]     Expected sr_entry->clr_bits == param->expected_clr_bits, but
[19:39:03]         sr_entry->clr_bits == 4 (0x4)
[19:39:03]         param->expected_clr_bits == 0 (0x0)
[19:39:03]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:313
[19:39:03]     Expected sr_entry->set_bits == param->expected_set_bits, but
[19:39:03]         sr_entry->set_bits == 4 (0x4)
[19:39:03]         param->expected_set_bits == 0 (0x0)
[19:39:03] [FAILED] match-or-xfail
[19:39:03] [PASSED] no-match-no-add-multiple-rules
[19:39:03] [PASSED] two-regs-two-entries
[19:39:03] [PASSED] clr-one-set-other
[19:39:03] [PASSED] set-field
[19:39:03] [PASSED] conflict-duplicate
[19:39:03] [PASSED] conflict-not-disjoint
[19:39:03] [PASSED] conflict-reg-type
[19:39:03] # xe_rtp_process_tests: pass:9 fail:2 skip:0 total:11
[19:39:03] ============== [FAILED] xe_rtp_process_tests ===============
[19:39:03]     # module: xe_test
[19:39:03] # Totals: pass:9 fail:2 skip:0 total:11
[19:39:03] ===================== [FAILED] xe_rtp ======================
[19:39:03] ==================== xe_wa (1 subtest) =====================
[19:39:03] ======================== xe_wa_gt  =========================
[19:39:03] [PASSED] TIGERLAKE (B0)
[19:39:03] [PASSED] DG1 (A0)
[19:39:03] [PASSED] DG1 (B0)
[19:39:03] [PASSED] ALDERLAKE_S (A0)
[19:39:03] [PASSED] ALDERLAKE_S (B0)
[19:39:03] [PASSED] ALDERLAKE_S (C0)
[19:39:03] [PASSED] ALDERLAKE_S (D0)
[19:39:03] [PASSED] ALDERLAKE_P (A0)
[19:39:03] [PASSED] ALDERLAKE_P (B0)
[19:39:03] [PASSED] ALDERLAKE_P (C0)
[19:39:03] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:39:03] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:39:03] [PASSED] DG2_G10 (C0)
[19:39:03] [PASSED] DG2_G11 (B1)
[19:39:03] [PASSED] DG2_G12 (A1)
[19:39:03] [PASSED] METEORLAKE (g:A0, m:A0)
[19:39:03] [PASSED] METEORLAKE (g:A0, m:A0)
[19:39:03] [PASSED] METEORLAKE (g:A0, m:A0)
[19:39:03] [PASSED] LUNARLAKE (g:A0, m:A0)
[19:39:03] [PASSED] LUNARLAKE (g:B0, m:A0)
[19:39:03] ==================== [PASSED] xe_wa_gt =====================
[19:39:03] ====================== [PASSED] xe_wa ======================
[19:39:03] ============================================================
[19:39:03] Testing complete. Ran 111 tests: passed: 95, failed: 2, skipped: 14
[19:39:03] Failures: xe_rtp
[19:39:03] Elapsed time: 30.030s total, 4.260s configuring, 25.492s building, 0.229s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


