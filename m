Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10898C44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDC610E88C;
	Wed, 21 Jan 2026 21:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfOKcy/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3991210E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769031757; x=1800567757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X9P43mGSsG9wUQe8IsG3g6RMw/sv1MNqqGkYrvdV8so=;
 b=ZfOKcy/NR8BEbDo0uMrI9epnin7N3QOv5EKoqR368owxlfUGNKptpU3U
 vkoLJ2/Dhh95MErlwnBUdUVwjXbu/QulECHss37CQuaFURU0vK3VVk7is
 TVcmS7ra/C4dLRZKCh2fyqFaWJhjTpIBjXslgGUExb70vLd8kbWuPrVfg
 FXk9krsUr6KozuzDcuhcx5572a/vvRsDV6idFsXFXXZcA/60pUwgHW702
 8eCWBvBT25ca8yyIAjlbAquHiU7RLSZ90zfSrai/93S87KtIWVYRkzOZN
 F5/iOQdprVznsix4gSYoOSub2njKncSN2hoIzpOAogeV5zxq4VOXKnFV7 Q==;
X-CSE-ConnectionGUID: oB5+jA1sT0ezWGsro7aNaQ==
X-CSE-MsgGUID: 7Z9D8q7dTyWGlO+4PevDrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70433943"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70433943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:37 -0800
X-CSE-ConnectionGUID: u3isPiLhRiOeZ/4kerpd8w==
X-CSE-MsgGUID: Py2LFRGOS42RblU5Rq3rvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="205691628"
Received: from lalin-p14sg4.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.33.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:35 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/5] drm/xe/pf: Define admin_only as real flag
Date: Wed, 21 Jan 2026 22:42:15 +0100
Message-ID: <20260121214218.2817-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121214218.2817-1-michal.wajdeczko@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_sriov_pf.c         | 6 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 3 ++-
 drivers/gpu/drm/xe/xe_sriov_pf_types.h   | 3 +++
 3 files changed, 11 insertions(+), 1 deletion(-)

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

