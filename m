Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720CBC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 06:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A8110E586;
	Tue, 16 Jul 2024 06:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcZBbiOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA4610E586
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 06:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721111898; x=1752647898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHBQ3y3ZDWWlvvYbbVyg/eT2kIMJEl4P/PuwLW7Fubw=;
 b=bcZBbiOiiqFU9m3oHXyXYheCM4ozcFFudDuP4LIaN5VW8Efx0km/9N5F
 evrxK105fvAOIP+Fr3grGKr536dez0J/dZp8alRzi35i6uAugp4JsCFvA
 keg+6tq1RKB6KzPGZRF1Kt0dc6cR7IEUbSYLyOULPPBejUdzv71rbXCvg
 B5P7jNWHejxVDhZPKO6kZZ1PBguiqXj0+MjTyCdmn8humFs9hfkB8vx+S
 yEZDNMc7adOdqtWjqPWWDi+hKffkDHCsvunqflxP9+EBq1WWvIAP4fnSV
 OsaK1cnhAFHZXkbQKeViyO5DfDYkmI2kbT2w11qN0vt3cb7Ex4yHd50D4 Q==;
X-CSE-ConnectionGUID: dAQPJ4hSSEOVet4BxcpQxA==
X-CSE-MsgGUID: jaU7IkbqR6i+xIud3bjxJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="12565119"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="12565119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 23:38:17 -0700
X-CSE-ConnectionGUID: E2zi76B3Q4aOiPlEDfv8QQ==
X-CSE-MsgGUID: X6//MQFZSaSzzei2+6gy3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="80960618"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 23:38:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
Subject: [PATCH v3 2/2] drm/xe: Don't suspend device upon wedge
Date: Mon, 15 Jul 2024 23:39:02 -0700
Message-Id: <20240716063902.1390130-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716063902.1390130-1-matthew.brost@intel.com>
References: <20240716063902.1390130-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When wedging a device we shouldn't be suspending device as state for
debug will be lost.

Also this appears to not work as the below stack trace pops upon trying
to resume a wedged device:

[  304.245044] INFO: task cat:12115 blocked for more than 151 seconds.
[  304.251333]       Tainted: G        W          6.10.0-rc7-xe+ #3518
[  304.257617] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  304.265459] task:cat             state:D stack:13384 pid:12115 tgid:12115 ppid:3986   flags:0x00000006
[  304.265465] Call Trace:
[  304.265467]  <TASK>
[  304.265469]  __schedule+0x3c4/0xdf0
[  304.265478]  schedule+0x3c/0x140
[  304.265481]  rpm_resume+0x1cc/0x740
[  304.265484]  ? __pfx_autoremove_wake_function+0x10/0x10
[  304.265489]  __pm_runtime_resume+0x49/0x80
[  304.265494]  guc_info+0x6b/0xb0 [xe]
[  304.265538]  ? __pfx___drm_printfn_seq_file+0x10/0x10
[  304.265541]  ? __pfx___drm_puts_seq_file+0x10/0x10
[  304.265545]  seq_read_iter+0x111/0x4c0
[  304.265551]  seq_read+0xfc/0x140
[  304.265556]  full_proxy_read+0x58/0x80
[  304.265560]  vfs_read+0xa7/0x360
[  304.265563]  ? find_held_lock+0x2b/0x80
[  304.265568]  ksys_read+0x64/0xe0
[  304.265571]  do_syscall_64+0x68/0x140
[  304.265575]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  304.265578] RIP: 0033:0x7f4254d14992
[  304.265580] RSP: 002b:00007ffc558666f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[  304.265583] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f4254d14992
[  304.265584] RDX: 0000000000020000 RSI: 00007f4254ebb000 RDI: 0000000000000003
[  304.265586] RBP: 00007f4254ebb000 R08: 00007f4254eba010 R09: 00007f4254eba010
[  304.265587] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000022000
[  304.265588] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[  304.265593]  </TASK>
[  304.265594]
               Showing all locks held in the system:
[  304.265598] 1 lock held by khungtaskd/57:
[  304.265599]  #0: ffffffff8273b860 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x36/0x1c0
[  304.265607] 3 locks held by kworker/6:1/90:
[  304.265610] 1 lock held by in:imklog/547:
[  304.265611]  #0: ffff88810498cd88 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x76/0xc0
[  304.265620] 1 lock held by dmesg/1310:

Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1e3d3a7e74d5..07aedbaf1821 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -893,6 +893,13 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
 
+static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xe_pm_runtime_put(xe);
+}
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
@@ -911,12 +918,21 @@ void xe_device_declare_wedged(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	u8 id;
+	int err;
 
 	if (xe->wedged.mode == 0) {
 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
 	}
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	if (err) {
+		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. Although device is wedged.\n");
+		return;
+	}
+
+	xe_pm_runtime_get_noresume(xe);
+
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		drm_err(&xe->drm,
-- 
2.34.1

