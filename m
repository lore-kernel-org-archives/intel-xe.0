Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C3BC35FFF
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006BC10E283;
	Tue, 17 Sep 2024 12:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSK8U7+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2A910E283
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574607; x=1758110607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HkmMsuCgwK9giQsu0RyM/V2uG4f4CEqEehExhHcd4z0=;
 b=DSK8U7+YlH4U8Xd1Mbl55westZO5dGBuiXlA6KvMwHy2OntAVGvPKrPR
 4YmpYfxVvJL0QF4NnVSDPIdPHRNCW2TAiAkmqqwvc0JTlSxbog9U7gg0D
 WD/QyaWafw7p9K0iZbQuJrOE6SKklIjAGl00EQaPCWOhVfYZd/YndpnLK
 DbYT5m13CnvIE7LP5hterO/BHRg3VuLXWjZ8Oiv9gmAPk5QuFWDpPD2Av
 oXXPrAko6GZHOT2ESZnmK8pxSMJ94XC/FK5pRQFScgaDDYwLvsc6Ha64Y
 RRKkJIrIK0puoU/Un8rIupsSEdw9KUYf9ofLdZ6IzZaLjwBAUkNCKO6d8 w==;
X-CSE-ConnectionGUID: gFjO7Ak6TjKLW5UALJ1ujQ==
X-CSE-MsgGUID: S+k6X/TVSgK21/VGquVQvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210557"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:27 -0700
X-CSE-ConnectionGUID: vZiqqcR2Q5eY4XFRc7UKpg==
X-CSE-MsgGUID: xx4CDJGoSUKbgO1wdNAEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388393"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 04/23] drm/xe/hdcp: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 17:51:07 +0530
Message-Id: <20240917122126.438448-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented
domain mask, the return value will be 0 for single domains (excluding
XE_FORCEWAKE_ALL) in the event of a failure. Modify the return
handling of xe_force_wake_get() accordingly and pass the return value as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>(#rev2)
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 6619a40aed15..60827740df5b 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -41,6 +41,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
+	xe_wakeref_t fw_ref;
 
 	if (!gsc && !xe_uc_fw_is_enabled(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
@@ -49,7 +50,8 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	}
 
 	xe_pm_runtime_get(xe);
-	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC)) {
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref) {
 		drm_dbg_kms(&xe->drm,
 			    "failed to get forcewake to check proxy status\n");
 		ret = false;
@@ -59,7 +61,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	if (!xe_gsc_proxy_init_done(gsc))
 		ret = false;
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 out:
 	xe_pm_runtime_put(xe);
 	return ret;
-- 
2.34.1

