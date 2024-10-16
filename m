Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351BBD206A4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 07:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0015510E6A1;
	Wed, 16 Oct 2024 07:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxNZpeT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0ED10E6A1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729063432; x=1760599432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XZ2wsoTDkX45falAqSMfHlV5+RTSS9JVybZQ3y0aggE=;
 b=HxNZpeT3I2mRVeMg+fEa5Q6X6U/+4+8hDsQSvHhO5Aekcvei63sl+dVU
 c+ukH9XF2hFtVas/WfrgZKBd75xA/PDF/vKWoumxb3QQ/TkAF9il1OxLi
 MlMZ7pYKXPGN2HaIAfSoyGhMTW2vyeqG1zvrP3/R2DPPZ3uGJj9zRpasz
 yNrL7R8ntAYJyD2l95tG5g3bLS30a7GJhtN+wVxWBwtL2P8nvdaFj7NxZ
 J+oMkuIAfuMO70e0zcHMCpRhSMZE+ZDYbOhjWbeVlRRM8bG4oy1yvuA5S
 jgdg+2JsaUqHJmu0Gj98If6nC9eV2mLLBeKSz+YX7tJZnc/1lsKiPvXtp g==;
X-CSE-ConnectionGUID: 3jFF1Vy3SJ20iltq26f6sg==
X-CSE-MsgGUID: 2vtaXvm4S6+5HhFMRbEj0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28694116"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="28694116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 00:23:51 -0700
X-CSE-ConnectionGUID: cIlxuYnPTHOnF4pWyahjvg==
X-CSE-MsgGUID: vlFTuijfT6u5PlqPGhjPKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82797705"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2024 00:23:51 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
Date: Wed, 16 Oct 2024 12:54:36 +0530
Message-Id: <20241016072436.261438-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930112146.2673086-1-nemesa.garg@intel.com>
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
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

Disable the support for odd x pan for even xsize for NV12
format as underrun issue is seen.

WA: 16024459452

v2: Replace HSD with WA in commit message [Suraj]
    Modified the condition for handling odd panning

v3: Simplified the condition for checking hsub
    Using older framework for wa as rev1[Jani]

v4: Modify the condition for hsub [Sai Teja]
    Initialize hsub in else path [Dan]

v5: Replace IS_LUNARLAKE with display version.
    Resolve nitpicks[Jani]

v6: Replace -EINVAL with hsub [Suraj]
    Remove src_w check as not required

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e979786aa5cf..2d7ca6e62926 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1031,6 +1031,11 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 		 */
 		hsub = 1;
 		vsub = 1;
+
+		/* Wa_16023981245 */
+		if (DISPLAY_VER(i915) == 20 && fb->format->format == DRM_FORMAT_NV12 &&
+		    src_x % 2 != 0)
+			hsub = 2;
 	} else {
 		hsub = fb->format->hsub;
 		vsub = fb->format->vsub;
-- 
2.25.1

