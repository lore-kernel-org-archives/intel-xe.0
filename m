Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2B9C54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEEC10E0AE;
	Fri, 23 May 2025 19:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWzA1eKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BF410E0AE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026822; x=1779562822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zZkQPrOWz9t9zy6CLUbpHFxEOKK2DfWWIF4T94QYUl4=;
 b=QWzA1eKiSxzHqUJMpOGlLlpAxhCO7RUnvFMpQoCShtIXGXgGHYEuRH/g
 WQoShbmRYcO1Lvfpk91f+WXdB+IY9WmRhkduuglgf/K0yHC2SD/E5HGGd
 /xqykBZhe0BsggsYd/1FGCHV06Tvl/HMq7uZ+bH1frZNCYQQ2Q04JW/e2
 fEP/33R0lMG6FDVXH+JyvHfoEMaTUgg1y1KxgnCrrfQ6eoGlxWcAm4Xkq
 AgxjetQ2RVEbAbvN15bgljize+Sz+VBFEBBsjMSCHA/FAWulpYuso4pY5
 aVx2acrRHfbuD4L6xNXb3OGADQndNx/gDqIN45oUe2Mxh8O2VADDzhdE6 w==;
X-CSE-ConnectionGUID: +IjsjZZDS329yYDjRHz/FA==
X-CSE-MsgGUID: Sz/h9b/gReudixXymWalMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61498652"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="61498652"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 12:00:21 -0700
X-CSE-ConnectionGUID: GjhHGIOTS3eYo6/QDwjDkg==
X-CSE-MsgGUID: lyU9Bz4+RleHuBmYKWtL/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141759049"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 12:00:17 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH v3 09/11] drm/xe/pm: D3Cold target state
Date: Sat, 24 May 2025 00:31:53 +0530
Message-Id: <20250523190155.2623462-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523190155.2623462-1-badal.nilawar@intel.com>
References: <20250523190155.2623462-1-badal.nilawar@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Trade-off D3Cold target state based upon current vram usage.
If vram usage is greater than vram_d3cold_threshold and GPU
is VRSR capable target D3Cold state is D3Cold-VRSR
otherwise target state is D3Cold-Off.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b86e95493cb5..1e061bfc3e52 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -113,6 +113,14 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
 			 &xe_pm_runtime_d3cold_map);
 }
 
+static void xe_pm_suspend_prepare(struct xe_device *xe)
+{
+	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE)
+		xe_pm_d3cold_target_state_toggle(xe);
+	else
+		xe->d3cold.target_state = XE_D3COLD_OFF;
+}
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -128,6 +136,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Suspending device\n");
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
+	xe_pm_suspend_prepare(xe);
+
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
 		goto err;
@@ -948,10 +958,14 @@ void xe_pm_d3cold_target_state_toggle(struct xe_device *xe)
 
 	if (total_vram_used_mb < xe->d3cold.vram_threshold)
 		xe->d3cold.target_state = XE_D3COLD_OFF;
+	else if (xe->d3cold.vrsr_capable)
+		xe->d3cold.target_state = XE_D3COLD_VRSR;
 	else
 		xe->d3cold.target_state = XE_D3HOT;
 
 	mutex_unlock(&xe->d3cold.lock);
+
+	drm_dbg(&xe->drm, "Xe D3cold target state %d\n", xe->d3cold.target_state);
 }
 
 /**
-- 
2.34.1

