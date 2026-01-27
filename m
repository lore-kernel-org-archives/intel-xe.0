Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8083D2FEDF
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 21:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A6310E5C9;
	Tue, 27 Jan 2026 21:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIZLfxyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D8510E5C9
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 21:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769547913; x=1801083913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okk4djVqRomkgTk2gtJietnXFVbvJR42gHgADUEBkQ4=;
 b=OIZLfxyjdooO5/Dt6M9eQ47jTwsna2iP2AygLwRec1ETbd9A4hg+ze61
 BgunaF+CVy7N47hln/hI9Oq7BuEk/hAZxB5iCBVwA4Np67IDdvx3/+t2P
 7aYzzX5zKT+zOw8cxk0mLUStu7OCcQDf1bMKii/3EpB+mpK9Vmu+BKvGg
 MCvzfwjg0xk5XAY48ptXyC6QnscycBtzlBbtOZegCgWC+ug0x7QVXB8fB
 s0Ze9yFKOyO+hgiPADvFGwewmxIMA7CIRKtQKD4cBqBgevgJ9/HFBUDCa
 Qwm69id48gUckOcNduYG5GGe0sBFxkX+jHQrQFXoxferPeBkkoe0nJ148 g==;
X-CSE-ConnectionGUID: k1C9m2M6SaqnCBGEVHKENg==
X-CSE-MsgGUID: I9p3y3I7QSe5QG88UmNgvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70797622"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70797622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 13:05:13 -0800
X-CSE-ConnectionGUID: 0O8TXVYzQ0uBUH8MaWqMpA==
X-CSE-MsgGUID: 3b7eLYmNR5y0HlPYBpxNAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="231035914"
Received: from mahadzix-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 13:05:11 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 4/5] drm/xe/pf: Define admin_only as real flag
Date: Tue, 27 Jan 2026 22:05:01 +0100
Message-ID: <20260127210501.794-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121214218.2817-5-michal.wajdeczko@intel.com>
References: <20260121214218.2817-5-michal.wajdeczko@intel.com>
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

Instead of doing guesses each time during the runtime, set flag
admin_only once during PF's initialization.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: update flag in kunit test (CI)
---
 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c | 2 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                       | 6 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h               | 3 ++-
 drivers/gpu/drm/xe/xe_sriov_pf_types.h                 | 3 +++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 42bfc4bcfbcf..3889dc3e49ca 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -15,7 +15,7 @@
 static void pf_set_admin_mode(struct xe_device *xe, bool enable)
 {
 	/* should match logic of xe_sriov_pf_admin_only() */
-	xe->info.probe_display = !enable;
+	xe->sriov.pf.admin_only = enable;
 	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 33bd754d138f..919f176a19eb 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -20,6 +20,11 @@
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
 
+static bool wanted_admin_only(struct xe_device *xe)
+{
+	return !xe->info.probe_display;
+}
+
 static unsigned int wanted_max_vfs(struct xe_device *xe)
 {
 	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
@@ -74,6 +79,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
 
 	pf_reduce_totalvfs(xe, newlimit);
 
+	xe->sriov.pf.admin_only = wanted_admin_only(xe);
 	xe->sriov.pf.device_total_vfs = totalvfs;
 	xe->sriov.pf.driver_max_vfs = newlimit;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 9054fdc34597..0fcc6cec4afc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -56,7 +56,8 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
  */
 static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
 {
-	return !xe->info.probe_display;
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	return xe->sriov.pf.admin_only;
 }
 
 static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index b0253e1ae5da..080cf10512f4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -36,6 +36,9 @@ struct xe_sriov_metadata {
  * @XE_SRIOV_MODE_PF mode.
  */
 struct xe_device_pf {
+	/** @admin_only: PF functionality focused on VFs management only. */
+	bool admin_only;
+
 	/** @device_total_vfs: Maximum number of VFs supported by the device. */
 	u16 device_total_vfs;
 
-- 
2.47.1

