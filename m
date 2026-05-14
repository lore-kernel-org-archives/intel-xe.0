Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60B1CD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 09:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8750610E09C;
	Thu, 14 May 2026 09:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUxS94kL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39310E09C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778749825; x=1810285825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P1gCfVRAt0Ga93d81KDyV03GheasYoBOFE125bZyRoE=;
 b=EUxS94kLZM8F8XJfccQQMAgpAuk0daby5zNcLAuQ6LXnWI5QfOnsCe7U
 gfNhCtHVFEztCsE1v1crICpKftfkVDpjtiOonBFpMAhwh9rwCKu5SWh97
 x5uQaoVLrdlmx2YXid2j5O2Bvx9ySmdRUGDaftUd/ciK7vzSnJGZQW99M
 89PGkpLd6YhdzQ5/HHLjYQXRCQDaA2DJKj6J7dizHAhbwBnl0StB5wRPd
 saM0QHSaE0I2gvJpLfg82srcngPgrUszlNbImQMw9UqCMJ1wxPv5N1DhG
 4SpSkQLAjL/QHCkHzZ1y/3ozBN+WlLZ91vjwU6nQAb5SQ8i25YgFZ00CB w==;
X-CSE-ConnectionGUID: SMAMiWdwRoWWqko+q6dZfw==
X-CSE-MsgGUID: EpVpS3UhQx6Yiga+q1qFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91150208"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91150208"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 02:10:25 -0700
X-CSE-ConnectionGUID: uGcgfvrYRkOtKFhot3ZJZw==
X-CSE-MsgGUID: HlpWv81mRQKqYYODi8XTvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="243317166"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa005.jf.intel.com with ESMTP; 14 May 2026 02:10:22 -0700
From: "Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
	"Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>,
	Meenakshisundaram@freedesktop.org
Subject: [PATCH] drm/xe/pf: Fix CFI failure in debugfs access
Date: Thu, 14 May 2026 14:33:52 +0530
Message-Id: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Reading debugfs file (/sys/kernel/debug/dri/0/gt*/pf/adverse_events)
with CFI (Control Flow Integrity) enabled, the kernel panics at
xe_gt_debugfs_simple_show+0x82/0xc0.

xe_gt_debugfs_simple_show() declars a function pointer expecting int
return type, but xe_gt_sriov_pf_monitor_print_events() is void return
type, leading to CFI failure and kernel panic.

[507620.973657] CFI failure at xe_gt_debugfs_simple_show+0x82/0xc0 [xe]
(target: xe_gt_sriov_pf_monitor_print_events+0x0/0x130 [xe]; expected
type: 0xd72c7139)
[507620.975434] Oops: invalid opcode: 0000 [#1] SMP NOPTI
[507620.976932] Tainted: [U]=USER, [O]=OOT_MODULE
[507620.977871] RIP: 0010:xe_gt_debugfs_simple_show+0x82/0xc0 [xe]
[507620.984760] Call Trace:
[507620.985204]  ? __cfi___drm_printfn_seq_file+0x10/0x10
[507620.985628]  ? __cfi___drm_puts_seq_file+0x10/0x10
[507620.986008]  seq_read_iter+0x1de/0x550
[507620.986323]  seq_read+0x134/0x170
[507620.986608]  full_proxy_read+0x9a/0x150
[507620.986939]  vfs_read+0xf0/0x390
[507620.987228]  ksys_read+0x74/0x100
[507620.987523]  do_syscall_64+0x61/0xf10
[507620.987842]  ? arch_exit_to_user_mode_prepare+0x9/0xb0
[507620.988243]  asm_fred_entrypoint_user+0x41/0x41
[507620.988602] RIP: 0033:0x784a76af9d57

Fix xe_gt_sriov_pf_monitor_print_events() function by updating to return
an int type.

Fixes: 335d62ade5fe ("drm/xe/pf: Track adverse events notifications from GuC")

Signed-off-by: Meenakshisundaram, Mohanram <mohanram.meenakshisundaram@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c | 6 +++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
index 7d532bded02a..49585d0d1dea 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
@@ -114,8 +114,10 @@ int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
  * VFs with no events are not printed.
  *
  * This function can only be called on PF.
+ *
+ * Return: 0 on success
  */
-void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
+int xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
 {
 	unsigned int n, total_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
 	const struct xe_gt_sriov_monitor *data;
@@ -144,4 +146,6 @@ void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p
 #undef __format
 #undef __value
 	}
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
index 7ca9351a271b..0b8f088d3a16 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
@@ -13,7 +13,7 @@ struct drm_printer;
 struct xe_gt;
 
 void xe_gt_sriov_pf_monitor_flr(struct xe_gt *gt, u32 vfid);
-void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
+int xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
-- 
2.34.1

