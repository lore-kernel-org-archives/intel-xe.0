Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A1FCD6E7E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 20:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E2D10E536;
	Fri,  5 Jun 2026 20:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNNzpt2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D1410E536;
 Fri,  5 Jun 2026 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780692062; x=1812228062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xFf2IhF3jsun2dJwoWDFPm66ftLJcXmOmj6M+3U/y/w=;
 b=jNNzpt2ww16HLZmBSdNk5NlcmViM9dqqRqM8/odtLrx2eLvGO/iBfdAr
 ZsKfAO06APeNtwcJtKGtWz71ENRHKD3tKAS38t4RP8E0VDQxJ05PKWy67
 cZxylwTREIRvvG02qvhAVcHzKu8MqCSZ4fGRKCmB/7GWbybIBq2Cj5eIV
 KiqzM5CPihoWOisyhKMUQj2gWKhn8jR6Sa5LDaX1Q/EyBTe5wm53JVpg6
 MUctobg9ltojstSpk4b/HcAlCBKIgk4NHWwx33I2ahkyHhKNVMWTavWmH
 dtIP02d82xQj5xBciGO9sI4vK+YyA+y6QSEAF58hPJbZ4Rur25PXLCRFi A==;
X-CSE-ConnectionGUID: j7e44EK+Tu2GJRXv+1r06g==
X-CSE-MsgGUID: glne0l+6QhWtTMqDKCOIpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="84108062"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="84108062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 13:41:01 -0700
X-CSE-ConnectionGUID: dyogHL0LRaOY4qyRtNq5QQ==
X-CSE-MsgGUID: 9nC3LI41SDq6FXAE0m7A2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="243839417"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 13:40:59 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com, Michal.Wajdeczko@intel.com
Subject: [PATCH v2 4/5] drm/i915: Refactor generic_handle_irq_safe() error
 messages
Date: Sat,  6 Jun 2026 04:40:46 +0800
Message-ID: <20260605204047.3840459-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605204047.3840459-1-jonathan.cavitt@intel.com>
References: <20260605204047.3840459-1-jonathan.cavitt@intel.com>
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

Refactor all error messages resulting from generic_handle_irq_safe()
failures in I915 for clarity.

v2:
- Use drm_err_ratelimited() correctly (jcavitt)

v3:
- Use xe_err_ratelimited() instead (Jadav)
- Split into patch series (jcavitt)

v4:
- Use suggested phrasing (Wajdeczko)

Suggested-by: Raag Jadav <raag.jadav@intel.com>
Suggested-by: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 022ad18044bf..ff2cf479d8e1 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -265,7 +265,7 @@ void intel_lpe_audio_irq_handler(struct intel_display *display)
 	ret = generic_handle_irq_safe(display->audio.lpe.irq);
 	if (ret)
 		drm_err_ratelimited(display->drm,
-				    "error handling LPE audio irq: %d\n", ret);
+				    "LPE audio: irq handling failed (%pe)\n", ERR_PTR(ret));
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
index 050d909fb4f8..c3a9b7d81e3d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
@@ -286,7 +286,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
 
 	ret = generic_handle_irq_safe(gt->gsc.intf[intf_id].irq);
 	if (ret)
-		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
+		gt_err_ratelimited(gt, "GSC: irq handling failed (%pe)\n", PTR_ERR(ret));
 }
 
 void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
-- 
2.53.0

