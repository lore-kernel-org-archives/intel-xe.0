Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DB9C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 00:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2D110E120;
	Wed, 15 Mar 2023 00:51:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85F10E120
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 00:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678841486; x=1710377486;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OKorAaK2FDX9uPgEAfG2VCVKyXZvor+hv0j1EApHUCk=;
 b=VGYdq8qDaVrpUZsCLuwu6NvtJHImcq5h3Tsed8y0VEpzwXBPtMI2rvZl
 xKq9Il0ex/A4oe/MlYmaIWy8mnI4TSQC5PfI1hxpRmJYEdZwBWu1Arnyp
 lotPzsqmXjr075nWrJK7WmhXBEywu1EYiAemV92bjOxAquYTrzhZEwwAM
 +OGXX6m6WbXZw7YSdwmPB2QX8z/lKxfljyeO0v358RtzYmRxbgnv5es6o
 RZuR9GvNiZhn0xpVp9FmoglcVvU+JjFElifIhcx+hbfQw37vqWpPYeHPc
 ACKptaK3pGdnm/7s7fkfxxOPInSVvynPGdmnJJfTZ3sGtw5JFCGgV6NHR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335064009"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="335064009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 17:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709485079"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="709485079"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 17:51:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Mar 2023 17:49:02 -0700
Message-Id: <20230315004902.2622613-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Silence kernel-doc warnings related to
 display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a "private:" comment to the part of the struct that is not expected
to be documented, the one with display-related fields. This silence the
following warnings:

	$ find drivers/gpu/drm/xe -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*'  |  xargs ./scripts/kernel-doc -Werror  -none
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'display' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'pch_type' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'pch_id' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'wm_lv_0_adjust_needed' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_channels' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'symmetric_memory' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'type' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_qgv_points' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'num_psf_gv_points' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'dram_info' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'runtime_pm' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'sb_lock' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'skl_preferred_vco_freq' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'max_dotclk_freq' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'hti_state' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'snps_phy_failed_calibration' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'modeset_restore_state' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'global_obj_list' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'de_irq_mask' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'display_irqs_enabled' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'enabled_irq_mask' not described in 'xe_device'
	drivers/gpu/drm/xe/xe_device_types.h:316: warning: Function parameter or member 'params' not described in 'xe_device'
	22 warnings as Errors

Fixes: 19026b7eb521 ("drm/xe: Remove i915 header dependency when building without display")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 034e0956f4ea..4c65598652e8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -244,6 +244,8 @@ struct xe_device {
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
+	/* private: */
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	/*
 	 * Any fields below this point are the ones used by display.
-- 
2.39.0

