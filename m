Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10280CD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 17:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A5C10E0D2;
	Thu, 14 May 2026 17:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOOfpDSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CD510E0D2
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 17:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778781395; x=1810317395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ItjcVBPg+GqEV79K+LjgsvJ+yzQ6zz9XeLFmKnMVt24=;
 b=bOOfpDShlLTA2NGnbuXvFLeYJTCeO4jOuHsYPK7rHUYjPtZmLJ3VMWW2
 1pHY6BXVGq5d+l5A+WTgj94ar6JqZy0bZUVmyGLe9Cm+hC5fjwjlmwpr/
 BM0LS8myuWqW8VzpgitkLjVQUjW2Sum/h1KLmrsjdDX9nyTZdYgMu+ncp
 hDYIHPG/4CbI0w7XD7VjZBL6rW3him6avWC9Ifbjnc0EvpAkJaxkBcN0z
 75JnJlKtMk2a03DLQpqN69JX4yuAd7K+1e1ilwG4Wkh8s+9eS5YKbs0s1
 uo7+qml2RUg4qgk9iXq0EZI8m+EluSb/Bb/rmQ94K9kCq8BjXkEjcDbWb A==;
X-CSE-ConnectionGUID: aLHiKpoVSGWtpreqVGG5OQ==
X-CSE-MsgGUID: UYZaIyT7ToSeUtsj6CzKmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79762758"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="79762758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 10:56:35 -0700
X-CSE-ConnectionGUID: Uy4MWd7yQdCN9efT83JwlA==
X-CSE-MsgGUID: 6oUc2TE1Qsq1cwp2BVsGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="235407363"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 10:56:34 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH v2 1/1] drm/xe/pf: Fix CFI failure in debugfs access
Date: Thu, 14 May 2026 23:19:18 +0530
Message-Id: <20260514174918.1556357-2-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514174918.1556357-1-mohanram.meenakshisundaram@intel.com>
References: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
 <20260514174918.1556357-1-mohanram.meenakshisundaram@intel.com>
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

xe_gt_debugfs_simple_show() declare a function pointer expecting int
return type, but xe_gt_sriov_pf_monitor_print_events() is void return
type, leading to CFI failure and kernel panic.

[507620.973657] CFI failure at xe_gt_debugfs_simple_show+0x82/0xc0 [xe]
(target: xe_gt_sriov_pf_monitor_print_events+0x0/0x130 [xe]; expected
type: 0xd72c7139)

Fix xe_gt_sriov_pf_monitor_print_events() function by updating to return
an int type.

Fixes: 1c99d3d3edab ("drm/xe/pf: Expose PF monitor details via debugfs")
Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c | 6 +++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
index 7d532bded02a..a85ba4435378 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
@@ -114,8 +114,10 @@ int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
  * VFs with no events are not printed.
  *
  * This function can only be called on PF.
+ *
+ * Return: always 0
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

