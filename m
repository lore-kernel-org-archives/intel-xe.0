Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF825EF4ECA
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 11:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010110E22F;
	Mon,  6 Apr 2026 11:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGji11h2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76AF10E22E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775475929; x=1807011929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpowTC2CFxTLDut1QW2ucgQhJB9+AHPAaZxBNXZSJxU=;
 b=gGji11h2epgY1yZmpicAbkn2y4bs+nMitKhRi9UzfqjXrdLCzNyEVpGn
 +lKGvOj9Dhh8ZiDsJdlKHRVaSbhXs2splDRVZr+w3xbptuAILqXgTMVHu
 sw2B0Mudpub+EnWnGZj719EIdufN03GKz3Fia+zQj5PIQO91aMU+pR5af
 0wYTd85f9mY7H892ohjDmOWwrZTL0Bd8SUxgcnPNQ/V2Fyp6aEnb6T+Fn
 kS6EozMIpJpDERdfuWpPdO7VBP9wDgYI2D/MUrae3M5KkE9jt789n9SA5
 +nVrhv6XutcI/hcWBJr/G6tsrh7Vj2BCV8jMzjQ+Zy/uwytQ6+rGwcZyG w==;
X-CSE-ConnectionGUID: q2T2gXfzQvqMQrk/F+9ytg==
X-CSE-MsgGUID: xFk7Hbu0R6i/f7nKjbywIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87047423"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="87047423"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 04:45:29 -0700
X-CSE-ConnectionGUID: hWn+3zOeQomUGWfLpldMWA==
X-CSE-MsgGUID: hiOPVSZWQJem9HnsFN5WtQ==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2026 04:45:28 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v9 2/3] drm/xe/pf: Derive admin-only PF mode from xe_device
 state
Date: Mon,  6 Apr 2026 11:45:18 +0000
Message-ID: <20260406114515.1043145-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406114515.1043145-5-satyanarayana.k.v.p@intel.com>
References: <20260406114515.1043145-5-satyanarayana.k.v.p@intel.com>
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

Stop tracking admin-only PF mode in a separate `xe->sriov.pf.admin_only`
field and use `xe_device_is_admin_only(xe)` as the single source of
admin mode.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V8 -> V9:
- New commit.
---
 drivers/gpu/drm/xe/xe_sriov_pf.c         | 6 ------
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 3 ++-
 drivers/gpu/drm/xe/xe_sriov_pf_types.h   | 3 ---
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 47a6e0fd66e0..33bd754d138f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -20,11 +20,6 @@
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
 
-static bool wanted_admin_only(struct xe_device *xe)
-{
-	return xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev));
-}
-
 static unsigned int wanted_max_vfs(struct xe_device *xe)
 {
 	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
@@ -79,7 +74,6 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
 
 	pf_reduce_totalvfs(xe, newlimit);
 
-	xe->sriov.pf.admin_only = wanted_admin_only(xe);
 	xe->sriov.pf.device_total_vfs = totalvfs;
 	xe->sriov.pf.driver_max_vfs = newlimit;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 0fcc6cec4afc..19f6f8331c8d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_HELPERS_H_
 
 #include "xe_assert.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_sriov.h"
 #include "xe_sriov_types.h"
@@ -57,7 +58,7 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
 static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
-	return xe->sriov.pf.admin_only;
+	return xe_device_is_admin_only(xe);
 }
 
 static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 080cf10512f4..b0253e1ae5da 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -36,9 +36,6 @@ struct xe_sriov_metadata {
  * @XE_SRIOV_MODE_PF mode.
  */
 struct xe_device_pf {
-	/** @admin_only: PF functionality focused on VFs management only. */
-	bool admin_only;
-
 	/** @device_total_vfs: Maximum number of VFs supported by the device. */
 	u16 device_total_vfs;
 
-- 
2.43.0

