Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB671D0D145
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CBC10E648;
	Wed,  7 Jan 2026 17:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZsGrJB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E9110E648
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808080; x=1799344080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nBr1v1fUCetpZp/pG+uAcDETvhyHliCrvoHHRDcFmJY=;
 b=FZsGrJB7V6gDoUOXTNVzCDfvnFaJl2xzr1Yj7HMFmFBxfM7/YZbdYRZI
 5sgvbWnMmoFd2DhqkE+3IpfmwI5Uo6TgccRVl/bjthAohY+9h4AX1PJ+I
 kbZH9Mfe5Votgo2AWJPBh5yG/bDylqkNZH6I9Vv2YnmNMYu1wS4+e5f8P
 gs7et8s+c2ryZ9DuU/SLYhqvYcyDXPrOfgFB9e4ZbOc5qYJpL25BFBfdA
 /Cr3HhF/JzkpR99fBx2EV7+nluuQpnrZS6CfK+tQIv08keCPnModj1/I9
 pD8aAc0aSTpcZjP0vVyrJYqKnZ0n15ld6LLEolWZbibtvye5ibt8AUxyJ g==;
X-CSE-ConnectionGUID: gNxt4GvNQn2kwZu+mjq2OA==
X-CSE-MsgGUID: xF31J28WQQSQQY4Ipfb9eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="91842131"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="91842131"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:48:00 -0800
X-CSE-ConnectionGUID: 4drSHsIYT/yYCf6SM4V5zw==
X-CSE-MsgGUID: 8rO+ezz6RKKU9vZOEuriog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202191231"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:58 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v12 4/4] drm/xe/pf: Allow upon-any-hang wedged mode only in
 debug config
Date: Wed,  7 Jan 2026 18:47:41 +0100
Message-Id: <20260107174741.29163-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260107174741.29163-1-lukasz.laguna@intel.com>
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
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
index d3431128670e..e400ad5c9f9e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1387,7 +1387,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
 			mode, xe_wedged_mode_to_string(mode),
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-- 
2.40.0

