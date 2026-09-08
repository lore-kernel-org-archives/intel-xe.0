Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A93C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 08:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1689A10EAA3;
	Tue,  8 Sep 2026 08:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtzuSSmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4066010E25D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788854707; x=1820390707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wFl0lWlXLy/WFh95i16R9HYTrY8QMdCpAc9RHeOhLC8=;
 b=AtzuSSmrYAM6wi9o/tQPx30UUDSoSHZxds9Bn4mJW5e7/z1wyaBEmqg4
 f927lZzGTseolZjcU3ZCwyHZUipgyBBZPQ9JS7YI3k8/RAFl2GKZ2frwl
 DHS/wn1s9O1c0KtFRgg8GEhORkXEhZ+MxVQ/LhW2pU5bjJfbngAd4+86D
 6yWgPHSWL620XAtsi0gEK9SA7ODqu5CByeEH4ZxR9QO6oO7qjego/EG1f
 3p3MxB26r5gRoxw+kkPLII2kFkQ2JNFWtlFXWP0p1aPGVLpx3okST6QsG
 oU9D17J6m0jkuyzZFlvx4UYBZfcOM1gTXMOox5Ak1jV0OZgf3nFlPcOyj A==;
X-CSE-ConnectionGUID: gDLB+G3oTWCLzNv0B/ULZQ==
X-CSE-MsgGUID: cHJ2ICjNSRmwG9htNUWh0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76809872"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="76809872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:05:06 -0700
X-CSE-ConnectionGUID: WhTp9AttRTCJCv+Aly+amA==
X-CSE-MsgGUID: 4AdYqC1BTDm79XGGb6mpFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269193548"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa006.jf.intel.com with ESMTP; 08 Sep 2026 01:05:06 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/ras: Fix sysctrl and drm-ras discrepancy
Date: Tue,  8 Sep 2026 13:34:43 +0530
Message-ID: <20260908080443.2255617-1-raag.jadav@intel.com>
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

There are cases where a reported error is valid for sysctrl but it's not
exposed as a valid uapi through drm-ras. We allow such error to be logged
but it's redundant to try to send an error-event for it. Early return such
cases and prevent misleading drm-ras error-event failures.

Fixes: 6a9493e47075 ("drm/xe/xe_ras: Report correctable/uncorrectable error events to userspace")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..522d891da4a0 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -288,6 +288,13 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	u32 value;
 	int ret;
 
+	drm_severity = xe_to_drm_ras_severity(severity);
+	drm_component = xe_to_drm_ras_component(component);
+
+	/* Not all sysctrl reported errors are valid uapi */
+	if (drm_severity == DRM_XE_RAS_ERR_SEV_MAX || drm_component == DRM_XE_RAS_ERR_COMP_MAX)
+		return;
+
 	counter.common.severity = severity;
 	counter.common.component = component;
 
@@ -295,9 +302,6 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	if (ret)
 		return;
 
-	drm_severity = xe_to_drm_ras_severity(severity);
-	drm_component = xe_to_drm_ras_component(component);
-
 	xe_drm_ras_event(xe, drm_component, drm_severity, value);
 }
 
-- 
2.43.0

