Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD8D73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 17:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E23189CAC;
	Thu, 29 Jan 2026 17:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1VJQpYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4C089CAC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769708793; x=1801244793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BacZudDG+27mSWVX7b8pcF2XbGthrboivc2qgQhsJq0=;
 b=I1VJQpYpXQ+nRgmPzlSla5U8znZO2+lRwT+zYNAJ4oirxdsJfvwnFBIa
 gqSX/biaAJy6dS8YUMO5ESmxfRM/EL+YWh4EP/foiLK+HCAo4X0vB0KfN
 dg1sBKd9UHg3Wv/AMmDpToS9CTGfaZ0GhoR75+ZUlDfcsZiMZX9HtPEZo
 FhlshnHU07YL6BxKT+Q644xSS3niV4xIAG4IjGbR/DE2YJhFdY8OA8fBm
 BRnrQyCIwE7xehbHW3fuBmnmtyQkC8x08dKiAFhg6vuUrRzkbfGzq8BJu
 D3LAoCENNj6pN0hdVPeOawTWE2s3FLcXGhl5SyGAOmlXStcTuZFFgb5/A g==;
X-CSE-ConnectionGUID: SOgSwXAHQ2yPBuiOexOWDQ==
X-CSE-MsgGUID: 0LxnZpwOSAGoXavUyymXdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70992676"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70992676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:46:33 -0800
X-CSE-ConnectionGUID: C06oD2zNTSu34q6+7q8kCw==
X-CSE-MsgGUID: WYcZGzCXQVClZ1kXcYv54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208434432"
Received: from cs3n1.iind.intel.com ([10.223.246.30])
 by orviesa009.jf.intel.com with ESMTP; 29 Jan 2026 09:46:29 -0800
From: "Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
	"Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>,
	Meenakshisundaram@freedesktop.org
Subject: [PATCH] drm/xe/guc: Fix CFI panic due to function signature mismatch
Date: Fri, 30 Jan 2026 00:06:59 +0530
Message-ID: <20260129183659.492395-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.43.0
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

When reading GuC debugfs file (/sys/kernel/debug/dri/0/gt0/uc/guc_info)
with CFI (Control Flow Integrity) enabled, the kernel panics at
guc_debugfs_show+0x9f.

Root cause: guc_debugfs_show() declares a function pointer expecting
int (*print)(struct xe_guc *, struct drm_printer *),
but xe_guc_print_info() was defined with void return type.
CFI detects this type mismatch at the indirect call site.

Fix: Change xe_guc_print_info() to return int instead of void, matching
the expected function signature. Return -ETIMEDOUT on force_wake failure
and 0 on success.

Panic trace:
RIP: 0010:guc_debugfs_show+0x9f/0xe0 [xe]
Code: 30 4c 8b 79 18 4c 89 f7 e8 0e 1c ea ff 48 81 c3 c8 0e 00 00 48 8d
75 a8 48 89 df 4d 89 fb 41 ba ce f8 df 2b 45 03 53 f1 74 02 <0f> 0b 2e
2e 2e 41 ff d3 89 c3 4c 89 f7 e8 9f 1c ea ff 65 48 8b 05
RSP: 0018:ffffa92527137c78 EFLAGS: 00010296
RAX: 0000000000000000 RBX: ffff97ccc794cef0 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffa92527137c78 RDI: ffff97ccc794cef0
RBP: ffffa92527137cd0 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000f2ce2a60 R11: ffffffffc0a225b0 R12: 0000000000000001
R13: ffffa92527137d40 R14: ffff97ccc793c000 R15: ffffffffc0a225b0
FS:  00007ef156f07f88(0000) GS:ffff97d08452f000(0000) knlGS:0000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000607d74864115 CR3: 00000001708d8003 CR4: 0000000000f72eb0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __cfi___drm_printfn_seq_file+0x10/0x10
 ? __cfi___drm_puts_seq_file+0x10/0x10
 seq_read_iter+0x1e0/0x4e0
 seq_read+0x126/0x160
 full_proxy_read+0xa0/0x150
 vfs_read+0xf2/0x380
 ? putname+0x5c/0x70
 ksys_read+0x75/0xf0
 __x64_sys_read+0x1a/0x30
 x64_sys_call+0x2581/0x2ce0
 do_syscall_64+0x62/0xfa0
 ? exc_page_fault+0x83/0xd0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Signed-off-by: Meenakshisundaram, Mohanram <mohanram.meenakshisundaram@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
 drivers/gpu/drm/xe/xe_guc.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2efc4678fa73..2d27a64c8c9e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1672,7 +1672,7 @@ void xe_guc_runtime_resume(struct xe_guc *guc)
 	xe_guc_submit_unpause(guc);
 }
 
-void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
+int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 status;
@@ -1683,7 +1683,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (!fw_ref.domains)
-			return;
+			return -ETIMEDOUT;
 
 		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
 
@@ -1709,6 +1709,8 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	drm_puts(p, "\n");
 	xe_guc_submit_print(guc, p);
+
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index a169f231cbd8..66e7edc70ed9 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -53,7 +53,7 @@ int xe_guc_self_cfg32(struct xe_guc *guc, u16 key, u32 val);
 int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val);
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir);
 void xe_guc_sanitize(struct xe_guc *guc);
-void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
+int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
 int xe_guc_reset_prepare(struct xe_guc *guc);
 void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
-- 
2.43.0

