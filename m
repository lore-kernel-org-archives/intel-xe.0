Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4884CCA471
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFA010E2EC;
	Tue, 30 Sep 2025 23:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZceRCxvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FBF10E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759275337; x=1790811337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Cjk6d3lZpOlEHL2h8pC+L/Jd9Az5vRFx/IWh/t+y0s=;
 b=ZceRCxvbULPpGjbrjaVAcjy0c2gvVuik/7j3M5PyyN24dRNgYpqQL/vp
 SUYhVKs0NqKghiPOSH+wsV7wkkS/iDuAlzjKGn4xIE+Zjg5nod8OlUANs
 8qbIymdW5iospa5WvddQEbvnk/7PMnjfL1QjfrhNcJfkJkjJ2eiyIyZQp
 Qrm3e26BHDKCEMPTg43dQJ91l9ETloOCA6LGj3jrDAYqrYDFuvJrik6lV
 HmwEAX6TVeQ4D34g9/fgCPqQtc3+7GE3dlBfvYgWv6pkZGainfTFO6ZVv
 H99n86JkShhe3EopZLwZOTe90S2OtW30U5K62a4j2dd/XE4UfIbdiOCNi A==;
X-CSE-ConnectionGUID: JDvegfj1RU+wg7v2a+o0JA==
X-CSE-MsgGUID: 6S4R7OxvTkKlAqcqnv5xkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72646727"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72646727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:37 -0700
X-CSE-ConnectionGUID: tjs77bHcQ/i9TPoj7D84hg==
X-CSE-MsgGUID: vpSXJxUwQ2GCYvAm2XtPVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177775505"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/6] drm/xe/pf: Log only top level VF state changes
Date: Wed,  1 Oct 2025 01:35:20 +0200
Message-ID: <20250930233525.201263-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930233525.201263-1-michal.wajdeczko@intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
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

The user likely only care about top level VF state changes, any VF
state logs on the per-GT basis can be demoted to the debug level.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c |  6 +++---
 drivers/gpu/drm/xe/xe_sriov_pf_control.c    | 19 ++++++++++++++++---
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 4f7fff892bc0..e582f4d60015 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -616,7 +616,7 @@ int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid)
 	}
 
 	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
-		xe_gt_sriov_info(gt, "VF%u paused!\n", vfid);
+		xe_gt_sriov_dbg(gt, "VF%u paused!\n", vfid);
 		return 0;
 	}
 
@@ -755,7 +755,7 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 		return err;
 
 	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED)) {
-		xe_gt_sriov_info(gt, "VF%u resumed!\n", vfid);
+		xe_gt_sriov_dbg(gt, "VF%u resumed!\n", vfid);
 		return 0;
 	}
 
@@ -896,7 +896,7 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
 		return err;
 
 	if (pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
-		xe_gt_sriov_info(gt, "VF%u stopped!\n", vfid);
+		xe_gt_sriov_dbg(gt, "VF%u stopped!\n", vfid);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 56c0dd382262..fdadd4fbe985 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -6,6 +6,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_sriov_pf_control.h"
+#include "xe_sriov_printk.h"
 
 /**
  * xe_sriov_pf_control_pause_vf() - Pause a VF on all GTs.
@@ -28,7 +29,11 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid)
 		result = result ? -EUCLEAN : err;
 	}
 
-	return result;
+	if (result)
+		return result;
+
+	xe_sriov_info(xe, "VF%u paused!\n", vfid);
+	return 0;
 }
 
 /**
@@ -52,7 +57,11 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid)
 		result = result ? -EUCLEAN : err;
 	}
 
-	return result;
+	if (result)
+		return result;
+
+	xe_sriov_info(xe, "VF%u resumed!\n", vfid);
+	return 0;
 }
 
 /**
@@ -76,7 +85,11 @@ int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid)
 		result = result ? -EUCLEAN : err;
 	}
 
-	return result;
+	if (result)
+		return result;
+
+	xe_sriov_info(xe, "VF%u stopped!\n", vfid);
+	return 0;
 }
 
 /**
-- 
2.47.1

