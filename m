Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E41C5DF70
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 22:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADE410E341;
	Sun, 16 Aug 2026 22:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geKVH+3U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E248210E2F5;
 Sun, 16 Aug 2026 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786920025; x=1818456025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=181G7ShCSmT67RRD6rGCoPLEHPD04RLlPOhJSYeL5SA=;
 b=geKVH+3U231Y1g0WL2Wlqy5NNUCjqra9PNaYWZAzSUYr8W+0Xj5ekcaR
 2Z6Go7mab95bPCbTqNOFTimc+WBmDOm0TmkC+EwBSwtiaDbqCASc3Qlh2
 27rwULVbrXzGkfKfeqXVu0N6iUoa7XuTFhwBlDfJFehqDg/x0xgA/3o9+
 uvqTypgjBOw+/5Bd/AFQlaIoDhOB58mIF+dBweifw5i60BN1JD6H5bccP
 88D72oW1OBT4rnpdzjuooQTwhNS0rIus7ttsLzinjTnyIKJu+fDaclPv9
 N5d0UhjXsX4fBHNNKm/NENT/PGdcynUEH1nsmde0Ants9OCTBSCTAhYFA A==;
X-CSE-ConnectionGUID: XthslXP3RYKAoonPyFMbrA==
X-CSE-MsgGUID: RSWek/8+RkCOqN7oFJ7BWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98761673"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="98761673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:25 -0700
X-CSE-ConnectionGUID: aS21UmtARw+wzwlzqUVyyw==
X-CSE-MsgGUID: CM8ZFiZBTKaA5+jlemzihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="269948337"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.249.236])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:23 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	imre.deak@intel.com
Subject: [RFC PATCH 1/5] drm/xe/pm: add xe_pm_pme_supported() helper
Date: Mon, 17 Aug 2026 01:40:00 +0300
Message-ID: <20260816224005.886035-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816224005.886035-1-vinod.govindapillai@intel.com>
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Introduce the helper to check if the device can signal a wakeup event
while runtime suspended. This can avoid scheduling the HPD polling.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a5289a9df8d2..635bfb1c7f78 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -937,6 +937,27 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
 }
 
+/**
+ * xe_pm_pme_supported - Can the device signal PME from its suspend target state?
+ * @xe: xe device instance
+ *
+ * Determine whether the device can generate a Power Management Event while
+ * runtime suspended.
+ *
+ * Return: true if PME is supported from the target state, false otherwise.
+ */
+bool xe_pm_pme_supported(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	/*
+	 * pci_dev_run_wake() checks dev->pme_support, verifies
+	 * pci_pme_capable() against the state pci_target_state() picks, and
+	 * walks upstream to confirm the wake can actually be routed.
+	 */
+	return pci_dev_run_wake(pdev);
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6d5ab09cb769..16b8699e59ec 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -30,6 +30,7 @@ bool xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
+bool xe_pm_pme_supported(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.0

