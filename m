Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93322C3DA64
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 03:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2E310E0A3;
	Fri, 26 Jul 2024 03:29:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195810E0A3;
 Fri, 26 Jul 2024 03:29:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Fix_rtp_when_processing_OOB_wo?=
 =?utf-8?q?rkarounds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 03:29:19 -0000
Message-ID: <172196455978.384626.11141993965873300369@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725220956.737987-1-lucas.demarchi@intel.com>
In-Reply-To: <20240725220956.737987-1-lucas.demarchi@intel.com>
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

Series: Fix rtp when processing OOB workarounds (rev2)
URL   : https://patchwork.freedesktop.org/series/136538/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[03:28:46] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:28:50] Building KUnit Kernel ...
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

[03:29:15] Starting KUnit Kernel (1/1)...
[03:29:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[03:29:16] =================== guc_dbm (7 subtests) ===================
[03:29:16] [PASSED] test_empty
[03:29:16] [PASSED] test_default
[03:29:16] ======================== test_size  ========================
[03:29:16] [PASSED] 4
[03:29:16] [PASSED] 8
[03:29:16] [PASSED] 32
[03:29:16] [PASSED] 256
[03:29:16] ==================== [PASSED] test_size ====================
[03:29:16] ======================= test_reuse  ========================
[03:29:16] [PASSED] 4
[03:29:16] [PASSED] 8
[03:29:16] [PASSED] 32
[03:29:16] [PASSED] 256
[03:29:16] =================== [PASSED] test_reuse ====================
[03:29:16] =================== test_range_overlap  ====================
[03:29:16] [PASSED] 4
[03:29:16] [PASSED] 8
[03:29:16] [PASSED] 32
[03:29:16] [PASSED] 256
[03:29:16] =============== [PASSED] test_range_overlap ================
[03:29:16] =================== test_range_compact  ====================
[03:29:16] [PASSED] 4
[03:29:16] [PASSED] 8
[03:29:16] [PASSED] 32
[03:29:16] [PASSED] 256
[03:29:16] =============== [PASSED] test_range_compact ================
[03:29:16] ==================== test_range_spare  =====================
[03:29:16] [PASSED] 4
[03:29:16] [PASSED] 8
[03:29:16] [PASSED] 32
[03:29:16] [PASSED] 256
[03:29:16] ================ [PASSED] test_range_spare =================
[03:29:16] ===================== [PASSED] guc_dbm =====================
[03:29:16] =================== guc_idm (6 subtests) ===================
[03:29:16] [PASSED] bad_init
[03:29:16] [PASSED] no_init
[03:29:16] [PASSED] init_fini
[03:29:16] [PASSED] check_used
[03:29:16] [PASSED] check_quota
[03:29:16] [PASSED] check_all
[03:29:16] ===================== [PASSED] guc_idm =====================
[03:29:16] ================== no_relay (3 subtests) ===================
[03:29:16] [PASSED] xe_drops_guc2pf_if_not_ready
[03:29:16] [PASSED] xe_drops_guc2vf_if_not_ready
[03:29:16] [PASSED] xe_rejects_send_if_not_ready
[03:29:16] ==================== [PASSED] no_relay =====================
[03:29:16] ================== pf_relay (14 subtests) ==================
[03:29:16] [PASSED] pf_rejects_guc2pf_too_short
[03:29:16] [PASSED] pf_rejects_guc2pf_too_long
[03:29:16] [PASSED] pf_rejects_guc2pf_no_payload
[03:29:16] [PASSED] pf_fails_no_payload
[03:29:16] [PASSED] pf_fails_bad_origin
[03:29:16] [PASSED] pf_fails_bad_type
[03:29:16] [PASSED] pf_txn_reports_error
[03:29:16] [PASSED] pf_txn_sends_pf2guc
[03:29:16] [PASSED] pf_sends_pf2guc
[03:29:16] [SKIPPED] pf_loopback_nop
[03:29:16] [SKIPPED] pf_loopback_echo
[03:29:16] [SKIPPED] pf_loopback_fail
[03:29:16] [SKIPPED] pf_loopback_busy
[03:29:16] [SKIPPED] pf_loopback_retry
[03:29:16] ==================== [PASSED] pf_relay =====================
[03:29:16] ================== vf_relay (3 subtests) ===================
[03:29:16] [PASSED] vf_rejects_guc2vf_too_short
[03:29:16] [PASSED] vf_rejects_guc2vf_too_long
[03:29:16] [PASSED] vf_rejects_guc2vf_no_payload
[03:29:16] ==================== [PASSED] vf_relay =====================
[03:29:16] ================= pf_service (11 subtests) =================
[03:29:16] [PASSED] pf_negotiate_any
[03:29:16] [PASSED] pf_negotiate_base_match
[03:29:16] [PASSED] pf_negotiate_base_newer
[03:29:16] [PASSED] pf_negotiate_base_next
[03:29:16] [SKIPPED] pf_negotiate_base_older
[03:29:16] [PASSED] pf_negotiate_base_prev
[03:29:16] [PASSED] pf_negotiate_latest_match
[03:29:16] [PASSED] pf_negotiate_latest_newer
[03:29:16] [PASSED] pf_negotiate_latest_next
[03:29:16] [SKIPPED] pf_negotiate_latest_older
[03:29:16] [SKIPPED] pf_negotiate_latest_prev
[03:29:16] =================== [PASSED] pf_service ====================
[03:29:16] ===================== lmtt (1 subtest) =====================
[03:29:16] ======================== test_ops  =========================
[03:29:16] [PASSED] 2-level
[03:29:16] [PASSED] multi-level
[03:29:16] ==================== [PASSED] test_ops =====================
[03:29:16] ====================== [PASSED] lmtt =======================
[03:29:16] =================== xe_mocs (2 subtests) ===================
[03:29:16] ================ xe_live_mocs_kernel_kunit  ================
[03:29:16] =========== [SKIPPED] xe_live_mocs_kernel_kunit ============
[03:29:16] ================ xe_live_mocs_reset_kunit  =================
[03:29:16] ============ [SKIPPED] xe_live_mocs_reset_kunit ============
[03:29:16] ==================== [SKIPPED] xe_mocs =====================
[03:29:16] ================= xe_migrate (2 subtests) ==================
[03:29:16] ================= xe_migrate_sanity_kunit  =================
[03:29:16] ============ [SKIPPED] xe_migrate_sanity_kunit =============
[03:29:16] ================== xe_validate_ccs_kunit  ==================
[03:29:16] ============= [SKIPPED] xe_validate_ccs_kunit ==============
[03:29:16] =================== [SKIPPED] xe_migrate ===================
[03:29:16] ================== xe_dma_buf (1 subtest) ==================
[03:29:16] ==================== xe_dma_buf_kunit  =====================
[03:29:16] ================ [SKIPPED] xe_dma_buf_kunit ================
[03:29:16] =================== [SKIPPED] xe_dma_buf ===================
[03:29:16] ==================== xe_bo (2 subtests) ====================
[03:29:16] ================== xe_ccs_migrate_kunit  ===================
[03:29:16] ============== [SKIPPED] xe_ccs_migrate_kunit ==============
[03:29:16] ==================== xe_bo_evict_kunit  ====================
[03:29:16] =============== [SKIPPED] xe_bo_evict_kunit ================
[03:29:16] ===================== [SKIPPED] xe_bo ======================
[03:29:16] ==================== args (11 subtests) ====================
[03:29:16] [PASSED] count_args_test
[03:29:16] [PASSED] call_args_example
[03:29:16] [PASSED] call_args_test
[03:29:16] [PASSED] drop_first_arg_example
[03:29:16] [PASSED] drop_first_arg_test
[03:29:16] [PASSED] first_arg_example
[03:29:16] [PASSED] first_arg_test
[03:29:16] [PASSED] last_arg_example
[03:29:16] [PASSED] last_arg_test
[03:29:16] [PASSED] pick_arg_example
[03:29:16] [PASSED] sep_comma_example
[03:29:16] ====================== [PASSED] args =======================
[03:29:16] =================== xe_pci (2 subtests) ====================
[03:29:16] [PASSED] xe_gmdid_graphics_ip
[03:29:16] [PASSED] xe_gmdid_media_ip
[03:29:16] ===================== [PASSED] xe_pci ======================
[03:29:16] ==================== xe_rtp (1 subtest) ====================
[03:29:16] ================== xe_rtp_process_tests  ===================
[03:29:16] [FAILED] coalesce-same-reg
[03:29:16] # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16] Expected active == param->expected_active, but
[03:29:16]     active == 33 (0x21)
[03:29:16]     param->expected_active == 1 (0x1)
[03:29:16] [FAILED] no-match-no-add
[03:29:16] # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16] Expected active == param->expected_active, but
[03:29:16]     active == 39 (0x27)
[03:29:16]     param->expected_active == 7 (0x7)
[03:29:16] [FAILED] match-or
[03:29:16] ------------[ cut here ]------------
[03:29:16] WARNING: CPU: 0 PID: 172 at drivers/gpu/drm/xe/xe_rtp.c:137 rule_matches+0x35e/0x410
[03:29:16] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] drm_WARN_ON(!rcount)
[03:29:16] CPU: 0 PID: 172 Comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc7 #1
[03:29:16] Stack:
[03:29:16]  6047536f 605e1815 605e1815 00000001
[03:29:16]  ffffff00 605e1815 603c023e 00000089
[03:29:16]  a0893c88 604a38c1 a0893cd0 00000000
[03:29:16] Call Trace:
[03:29:16]  [<60030579>] ? os_is_signal_stack+0x19/0x30
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<6046e142>] ? show_stack.cold+0x9e/0xef
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<603c023e>] ? rule_matches+0x35e/0x410
[03:29:16]  [<604a38c1>] ? dump_stack_lvl+0x6a/0xb2
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<6003b831>] ? __warn+0x111/0x120
[03:29:16]  [<6046f7db>] ? warn_slowpath_fmt+0xd0/0xde
[03:29:16]  [<600855cd>] ? find_held_lock+0x3d/0xa0
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<6009124d>] ? lock_release+0x1cd/0x360
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<6008ca2b>] ? lockdep_hardirqs_on_prepare+0x12b/0x320
[03:29:16]  [<603c023e>] ? rule_matches+0x35e/0x410
[03:29:16]  [<603c01fc>] ? rule_matches+0x31c/0x410
[03:29:16]  [<604b1ed7>] ? _raw_spin_unlock_irqrestore+0x57/0x90
[03:29:16]  [<603c04f3>] ? xe_rtp_process_to_sr+0x93/0x1c0
[03:29:16]  [<603e6b6f>] ? xe_rtp_process_tests+0xaf/0x4b0
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<60030b7c>] ? os_nsecs+0x1c/0x30
[03:29:16]  [<604a6f80>] ? schedule_preempt_disabled+0x0/0x20
[03:29:16]  [<600b9390>] ? ktime_get_ts64+0x0/0x290
[03:29:16]  [<60297520>] ? kunit_try_run_case+0x60/0xd0
[03:29:16]  [<604b1e80>] ? _raw_spin_unlock_irqrestore+0x0/0x90
[03:29:16]  [<60064929>] ? __kthread_parkme+0x99/0xd0
[03:29:16]  [<604a6a6e>] ? schedule+0x6e/0x1c0
[03:29:16]  [<602995e6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[03:29:16]  [<602995d0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[03:29:16]  [<60064f36>] ? kthread+0x106/0x160
[03:29:16]  [<60072c9b>] ? schedule_tail+0x8b/0xe0
[03:29:16]  [<60020146>] ? new_thread_handler+0x86/0xc0
[03:29:16] irq event stamp: 145
[03:29:16] hardirqs last  enabled at (155): [<000000006009b7b6>] console_unlock+0x196/0x1b0
[03:29:16] hardirqs last disabled at (164): [<000000006009b77c>] console_unlock+0x15c/0x1b0
[03:29:16] softirqs last  enabled at (0): [<0000000060037fff>] copy_process+0xa2f/0x2b80
[03:29:16] softirqs last disabled at (0): [<0000000000000000>] 0x0
[03:29:16] ---[ end trace 0000000000000000 ]---
[03:29:16] ------------[ cut here ]------------
[03:29:16] WARNING: CPU: 0 PID: 172 at drivers/gpu/drm/xe/xe_rtp.c:137 rule_matches+0x35e/0x410
[03:29:16] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] drm_WARN_ON(!rcount)
[03:29:16] CPU: 0 PID: 172 Comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc7 #1
[03:29:16] Stack:
[03:29:16]  6047536f 605e1815 605e1815 00000001
[03:29:16]  ffffff00 605e1815 603c023e 00000089
[03:29:16]  a0893c88 604a38c1 a0893cd0 00000000
[03:29:16] Call Trace:
[03:29:16]  [<60030579>] ? os_is_signal_stack+0x19/0x30
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<6046e142>] ? show_stack.cold+0x9e/0xef
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<603c023e>] ? rule_matches+0x35e/0x410
[03:29:16]  [<604a38c1>] ? dump_stack_lvl+0x6a/0xb2
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<6003b831>] ? __warn+0x111/0x120
[03:29:16]  [<6046f7db>] ? warn_slowpath_fmt+0xd0/0xde
[03:29:16]  [<600855cd>] ? find_held_lock+0x3d/0xa0
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<6009124d>] ? lock_release+0x1cd/0x360
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<6008ca2b>] ? lockdep_hardirqs_on_prepare+0x12b/0x320
[03:29:16]  [<603c023e>] ? rule_matches+0x35e/0x410
[03:29:16]  [<603c01fc>] ? rule_matches+0x31c/0x410
[03:29:16]  [<603c04f3>] ? xe_rtp_process_to_sr+0x93/0x1c0
[03:29:16]  [<603e6b6f>] ? xe_rtp_process_tests+0xaf/0x4b0
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<60030b7c>] ? os_nsecs+0x1c/0x30
[03:29:16]  [<604a6f80>] ? schedule_preempt_disabled+0x0/0x20
[03:29:16]  [<600b9390>] ? ktime_get_ts64+0x0/0x290
[03:29:16]  [<60297520>] ? kunit_try_run_case+0x60/0xd0
[03:29:16]  [<604b1e80>] ? _raw_spin_unlock_irqrestore+0x0/0x90
[03:29:16]  [<60064929>] ? __kthread_parkme+0x99/0xd0
[03:29:16]  [<604a6a6e>] ? schedule+0x6e/0x1c0
[03:29:16]  [<602995e6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[03:29:16]  [<602995d0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[03:29:16]  [<60064f36>] ? kthread+0x106/0x160
[03:29:16]  [<60072c9b>] ? schedule_tail+0x8b/0xe0
[03:29:16]  [<60020146>] ? new_thread_handler+0x86/0xc0
[03:29:16] irq event stamp: 233
[03:29:16] hardirqs last  enabled at (243): [<000000006009b7b6>] console_unlock+0x196/0x1b0
[03:29:16] hardirqs last disabled at (252): [<000000006009b77c>] console_unlock+0x15c/0x1b0
[03:29:16] softirqs last  enabled at (0): [<0000000060037fff>] copy_process+0xa2f/0x2b80
[03:29:16] softirqs last disabled at (0): [<0000000000000000>] 0x0
[03:29:16] ---[ end trace 0000000000000000 ]---
[03:29:16] ------------[ cut here ]------------
[03:29:16] WARNING: CPU: 0 PID: 172 at drivers/gpu/drm/xe/xe_rtp.c:137 rule_matches+0x35e/0x410
[03:29:16] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] drm_WARN_ON(!rcount)
[03:29:16] CPU: 0 PID: 172 Comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc7 #1
[03:29:16] Stack:
[03:29:16]  6047536f 605e1815 605e1815 00000001
[03:29:16]  ffffff00 605e1815 603c023e 00000089
[03:29:16]  a0893c88 604a38c1 a0893cd0 00000000
[03:29:16] Call Trace:
[03:29:16]  [<60030579>] ? os_is_signal_stack+0x19/0x30
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<6046e142>] ? show_stack.cold+0x9e/0xef
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<603c023e>] ? rule_matches+0x35e/0x410
[03:29:16]  [<604a38c1>] ? dump_stack_lvl+0x6a/0xb2
[03:29:16]  [<6047536f>] ? _printk+0x0/0x9f
[03:29:16]  [<6003b831>] ? __warn+0x111/0x120
[03:29:16]  [<6046f7db>] ? warn_slowpath_fmt+0xd0/0xde
[03:29:16]  [<600855cd>] ? find_held_lock+0x3d/0xa0
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<6009124d>] ? lock_release+0x1cd/0x360
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<6008ca2b>] ? lockdep_hardirqs_on_prepare+0x12b/0x320
[03:29:16]  [<603c023e>] ? rule_matches+0x35e/0x410
[03:29:16]  [<603c01fc>] ? rule_matches+0x31c/0x410
[03:29:16]  [<603c04f3>] ? xe_rtp_process_to_sr+0x93/0x1c0
[03:29:16]  [<603e6b6f>] ? xe_rtp_process_tests+0xaf/0x4b0
[03:29:16]  [<60030370>] ? um_set_signals+0x0/0x70
[03:29:16]  [<60030b7c>] ? os_nsecs+0x1c/0x30
[03:29:16]  [<604a6f80>] ? schedule_preempt_disabled+0x0/0x20
[03:29:16]  [<600b9390>] ? ktime_get_ts64+0x0/0x290
[03:29:16]  [<60297520>] ? kunit_try_run_case+0x60/0xd0
[03:29:16]  [<604b1e80>] ? _raw_spin_unlock_irqrestore+0x0/0x90
[03:29:16]  [<60064929>] ? __kthread_parkme+0x99/0xd0
stty: 'standard input': Inappropriate ioctl for device
[03:29:16]  [<604a6a6e>] ? schedule+0x6e/0x1c0
[03:29:16]  [<602995e6>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
[03:29:16]  [<602995d0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
[03:29:16]  [<60064f36>] ? kthread+0x106/0x160
[03:29:16]  [<60072c9b>] ? schedule_tail+0x8b/0xe0
[03:29:16]  [<60020146>] ? new_thread_handler+0x86/0xc0
[03:29:16] irq event stamp: 321
[03:29:16] hardirqs last  enabled at (331): [<000000006009b7b6>] console_unlock+0x196/0x1b0
[03:29:16] hardirqs last disabled at (340): [<000000006009b77c>] console_unlock+0x15c/0x1b0
[03:29:16] softirqs last  enabled at (0): [<0000000060037fff>] copy_process+0xa2f/0x2b80
[03:29:16] softirqs last disabled at (0): [<0000000000000000>] 0x0
[03:29:16] ---[ end trace 0000000000000000 ]---
[03:29:16]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16]     Expected active == param->expected_active, but
[03:29:16]         active == 32 (0x20)
[03:29:16]         param->expected_active == 0 (0x0)
[03:29:16] [FAILED] match-or-xfail
[03:29:16] # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16] Expected active == param->expected_active, but
[03:29:16]     active == 35 (0x23)
[03:29:16]     param->expected_active == 1 (0x1)
[03:29:16] [FAILED] no-match-no-add-multiple-rules
[03:29:16] # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16] Expected active == param->expected_active, but
[03:29:16]     active == 35 (0x23)
[03:29:16]     param->expected_active == 3 (0x3)
[03:29:16] [FAILED] two-regs-two-entries
[03:29:16] # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16] Expected active == param->expected_active, but
[03:29:16]     active == 35 (0x23)
[03:29:16]     param->expected_active == 3 (0x3)
[03:29:16] [FAILED] clr-one-set-other
[03:29:16] # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16] Expected active == param->expected_active, but
[03:29:16]     active == 35 (0x23)
[03:29:16]     param->expected_active == 1 (0x1)
[03:29:16] [FAILED] set-field
[03:29:16] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] *ERROR* GT0: discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no, mcr: no): ret=-22
[03:29:16]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16]     Expected active == param->expected_active, but
[03:29:16]         active == 35 (0x23)
[03:29:16]         param->expected_active == 3 (0x3)
[03:29:16] [FAILED] conflict-duplicate
[03:29:16] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] *ERROR* GT0: discarding save-restore reg 0001 (clear: 00000003, set: 00000000, masked: no, mcr: no): ret=-22
[03:29:16]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16]     Expected active == param->expected_active, but
[03:29:16]         active == 35 (0x23)
[03:29:16]         param->expected_active == 3 (0x3)
[03:29:16] [FAILED] conflict-not-disjoint
[03:29:16] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] *ERROR* GT0: discarding save-restore reg 0001 (clear: 00000002, set: 00000002, masked: no, mcr: yes): ret=-22
[03:29:16] drm-kunit-mock-device xe_rtp_process_tests.drm-kunit-mock-device: [drm] *ERROR* GT0: discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: yes, mcr: no): ret=-22
[03:29:16]     # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16]     Expected active == param->expected_active, but
[03:29:16]         active == 39 (0x27)
[03:29:16]         param->expected_active == 7 (0x7)
[03:29:16] [FAILED] conflict-reg-type
[03:29:16] # xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:329
[03:29:16] Expected active == param->expected_active, but
[03:29:16]     active == 35 (0x23)
[03:29:16]     param->expected_active == 3 (0x3)
[03:29:16] # xe_rtp_process_tests: pass:0 fail:11 skip:0 total:11
[03:29:16] ============== [FAILED] xe_rtp_process_tests ===============
[03:29:16]     # module: xe_test
[03:29:16] # Totals: pass:0 fail:11 skip:0 total:11
[03:29:16] ===================== [FAILED] xe_rtp ======================
[03:29:16] ==================== xe_wa (1 subtest) =====================
[03:29:16] ======================== xe_wa_gt  =========================
[03:29:16] [PASSED] TIGERLAKE (B0)
[03:29:16] [PASSED] DG1 (A0)
[03:29:16] [PASSED] DG1 (B0)
[03:29:16] [PASSED] ALDERLAKE_S (A0)
[03:29:16] [PASSED] ALDERLAKE_S (B0)
[03:29:16] [PASSED] ALDERLAKE_S (C0)
[03:29:16] [PASSED] ALDERLAKE_S (D0)
[03:29:16] [PASSED] ALDERLAKE_P (A0)
[03:29:16] [PASSED] ALDERLAKE_P (B0)
[03:29:16] [PASSED] ALDERLAKE_P (C0)
[03:29:16] [PASSED] ALDERLAKE_S_RPLS (D0)
[03:29:16] [PASSED] ALDERLAKE_P_RPLU (E0)
[03:29:16] [PASSED] DG2_G10 (C0)
[03:29:16] [PASSED] DG2_G11 (B1)
[03:29:16] [PASSED] DG2_G12 (A1)
[03:29:16] [PASSED] METEORLAKE (g:A0, m:A0)
[03:29:16] [PASSED] METEORLAKE (g:A0, m:A0)
[03:29:16] [PASSED] METEORLAKE (g:A0, m:A0)
[03:29:16] [PASSED] LUNARLAKE (g:A0, m:A0)
[03:29:16] [PASSED] LUNARLAKE (g:B0, m:A0)
[03:29:16] [PASSED] BATTLEMAGE (g:A0, m:A1)
[03:29:16] ==================== [PASSED] xe_wa_gt =====================
[03:29:16] ====================== [PASSED] xe_wa ======================
[03:29:16] ============================================================
[03:29:16] Testing complete. Ran 113 tests: passed: 87, failed: 11, skipped: 15
[03:29:16] Failures: xe_rtp
[03:29:16] Elapsed time: 29.871s total, 4.267s configuring, 25.335s building, 0.220s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


