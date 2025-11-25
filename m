Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3099FD0E6E8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 13:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FEF10E3FF;
	Tue, 25 Nov 2025 13:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gd3nDASj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F7410E3FF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078886; x=1795614886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=haTfyx6aX+QGeie49xm+RRW1CgYwbm7Wiahy5Jvw3z8=;
 b=Gd3nDASjoGs/bgwpMUpmF4E1iZjJXT9vIiRae3KCeLDeTczKlPgxgz59
 H9YF4DPH3y4M04GIualZCaYwJKeT+IG4hWU37yzjdDGh3DzKj1Mt9ZKYw
 5g1yUhW54VJhIckUWBHYmiaRsxrIXFT0dYIZZRtF4pmL7fJcP383HeO9y
 LjzafABpiVOcjyINGmu4fPA9jisXpKtwHdEZ1hdiBq1unuryNzqYGGLdS
 9O6Ey3lwH7bHsxH++FJRRRUs5mnZW31SKYssH6lxltszI2ynys00yp1cq
 hiBeNVl8ow5vSBa/t7Biu8CMhmp8+YoYQX565udqrtlBi1XKCDLXUwfEK w==;
X-CSE-ConnectionGUID: 7C6O50kmTbmqffmr0PYZag==
X-CSE-MsgGUID: XdDLteiwTk6yhzbSr+dLYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802564"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65802564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:45 -0800
X-CSE-ConnectionGUID: qMshM4C4S9uhFg0nNm/yWw==
X-CSE-MsgGUID: imI6JHsxT46q4NyyvKTsYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196954022"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:44 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v10 4/4] drm/xe/pf: Allow upon-any-hang wedged mode only in
 debug config
Date: Tue, 25 Nov 2025 14:54:22 +0100
Message-Id: <20251125135422.11244-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251125135422.11244-1-lukasz.laguna@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
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

The GuC reset policy is global, so disabling it on PF can affect all
running VFs. To avoid unintended side effects, restrict setting
upon-any-hang (2) wedged mode on the PF to debug builds only.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index da12924f191c..d7c36b86bc7b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1302,7 +1302,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
 			mode, xe_wedged_mode_to_string(mode),
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-- 
2.40.0

