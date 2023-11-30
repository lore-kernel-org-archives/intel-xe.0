Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA47C10DC2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 07:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D35710E6BF;
	Thu, 30 Nov 2023 07:27:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B163410E6BD
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 07:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701329219; x=1732865219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ec9LKdxL2xDNyfboKYeZIe6iI2l2xPpp37kkwmaqg8g=;
 b=gHADztDffg0L8asjJY5DV+0t8+W9Fej+l5gmHLI1bw7BoARHHOlRMXYS
 aGwRAmky3BuJ63S6UwFwGGDH6ogtbwTuBP+90Cu5Wu94hpmlP+fzpmaA0
 TDruhlY+GuzZz7PdL50iM/4YnItq0QvPFu+Hk0WV8Ug7BxmQ/fbjWVomR
 5HhTF2xukBsju5u4u0XtnZlHrUkrpOeZjuwKJzuOvXkBWbNLPpPg1tIUY
 toKc6XJJqNSqVIRDtETDeBmS3UWJTtQ1yi7Usbkv/xn8Y5pHNc/bDQYDV
 RoMOpOE7Gj6YraryrllVtEIzxG3iFlnD5T2z+V/5uMpQGvr737GSn/Cjo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="390442161"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="390442161"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 23:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="17290786"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 29 Nov 2023 23:26:57 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 12:44:05 +0530
Message-Id: <20231130071407.606176-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231130071407.606176-1-animesh.manna@intel.com>
References: <20231130071407.606176-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/6] drm/i915/dsb: Re-instate DSB for LUT
 updates
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

With all the known issues sorted out we can start to use
DSB to load the LUTs.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231009132204.15098-3-ville.syrjala@linux.intel.com
(cherry picked from commit 34d8311f4a1c464ae0ce4470f2e3932c1a40d83e)
---
 drivers/gpu/drm/i915/display/intel_color.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4f92fc31059f..40b04aa7d98c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1895,9 +1895,6 @@ void intel_color_prepare_commit(struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 
-	/* FIXME DSB has issues loading LUTs, disable it for now */
-	return;
-
 	if (!crtc_state->hw.active ||
 	    intel_crtc_needs_modeset(crtc_state))
 		return;
-- 
2.29.0

