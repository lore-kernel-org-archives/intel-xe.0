Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB7CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 11:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B0610E034;
	Mon, 30 Sep 2024 11:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9kBvgd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC80510E034
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 11:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727695280; x=1759231280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XTRdgdUmdv7JH3G1us1ufDpxGXV3aFLRxrCEhwdUt7o=;
 b=A9kBvgd0iBCgF0s+xGodILj5IkoZESBsqPbTHfrC9hWD619uscPa0MXF
 1ww2vmRRG3Lh8UUuA+ioU6Ct6hxCHsBGV9WGNcU5MPSavLShcapI11BEn
 8zhtxmgTG1oUOpy2h+x86ojK8IQLn48EkSOIoE0W4RcmTQU7eQWanWd6t
 C2+3lb0hQWrI0fKq7Jy5qIH2nirNQNI9IPNQBHXYsYK4lgS0xxO8XEl6G
 VqPSN0taV9Vlm165nop1NqTvTDoQxu1av43jOk3fofPn7soF5FHYCoIgj
 QFR9dEfOOHcTZylnnnE80yy7A0n/b8fbjYO3YuIxVMC8NKjT5nFg27QgO w==;
X-CSE-ConnectionGUID: Lti80XpwQIqhOEPN40FQWw==
X-CSE-MsgGUID: lkUfaZxKTZWmn96A3owgdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26901193"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26901193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:21:19 -0700
X-CSE-ConnectionGUID: aIqYOPBzRFaj+6iI80j2PA==
X-CSE-MsgGUID: WXS9US8uTs+h7bPMMD40mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="110748285"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 04:21:18 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
Date: Mon, 30 Sep 2024 16:51:46 +0530
Message-Id: <20240930112146.2673086-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

Disable the support for odd x pan for even xsize for NV12 format as underrun
issue is seen.

WA: 16024459452

v2: Replace HSD with WA in commit message [Suraj]
    Modified the condition for handling odd panning

v3: Simplified the condition for checking hsub
    Using older framework for wa as rev1[Jani]

v4: Modify the condition for hsub [Sai Teja]
    Initialize hsub in else path [Dan]

v5: Replace IS_LUNARLAKE with display version.
    Resolve nitpicks[Jani]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e979786aa5cf..e3401a4f7992 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1029,6 +1029,14 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 		 * This allows NV12 and P0xx formats to have odd size and/or odd
 		 * source coordinates on DISPLAY_VER(i915) >= 20
 		 */
+		/*
+		 *  Wa_16023981245 for display version 20.
+		 *  Do not support odd x-panning for even xsize for NV12.
+		 */
+		if (DISPLAY_VER(i915) == 20 && fb->format->format == DRM_FORMAT_NV12 &&
+		    src_x % 2 != 0 && src_w % 2 == 0)
+			return -EINVAL;
+
 		hsub = 1;
 		vsub = 1;
 	} else {
-- 
2.25.1

