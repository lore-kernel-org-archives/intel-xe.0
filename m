Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A7ACF9C73
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBAB10E898;
	Tue, 24 Sep 2024 11:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggF8GwxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE8910E89C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179116; x=1758715116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5j/rwm4f66NUHywPbcX6rxDe/c7SzMRjTZkJtIiQEjQ=;
 b=ggF8GwxUnzr+OnIUfYfq/88cuYZeaixuJI9yAiSXjtJ/PnNXeFC76PF8
 2fsDHNieJRr+qQHEn9upjtt/4EI7Y9nryUjS27sEPAR2ztTKvTR8UB3yI
 ra5Qp2iI2+9SWD6Hjsbn0K6mrQSnxd2aXeJi1FgJ8rFWQs9nUApNjjGfg
 S8phZOvV+/lS9uOVZPrcgqCOO/1mHOM/lwf6ln4xoOBPi0wOs7QSroaXG
 Cm4gkSlF+pem1PcO7jVLWQxqIhhWmzGDPHB3AvNSmySespj7wGGfFGQ6D
 T5KxxIrfdDc23lxF1MXL+Ecw0DUTotgptPjyLsc1GvJPXWNNK/yZNfJyu A==;
X-CSE-ConnectionGUID: QOpup/H+TF+6ASPeAe5uWA==
X-CSE-MsgGUID: xCwNeRCcQq6IuWytJLr6Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957010"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:58:35 -0700
X-CSE-ConnectionGUID: s7rLsZ3iTVy9J31Sf3UBQQ==
X-CSE-MsgGUID: cMF4Ty73Q4S1f+TvmGjXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319109"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:58:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 04/23] drm/xe/hdcp: Update handling of xe_force_wake_get
 return
Date: Tue, 24 Sep 2024 17:46:22 +0530
Message-Id: <20240924121641.1045763-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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

v5
- return unsigned int for xe_force_wake_get()

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
index 6619a40aed15..3567f474b6cb 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -41,6 +41,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
+	unsigned int fw_ref;
 
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

