Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C492C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 12:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C609C12A3C6;
	Wed, 21 May 2025 12:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJVRhm09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B6E11BFF9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747830331; x=1779366331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=152ZwFWUh06qnAh4XTuUUtrQbLg5HiiK3hLJxrI8UX4=;
 b=UJVRhm09ZeaYGS/feVFSriXwSUTih0o/DrZyCkuBMgGRh/Frvi6FtE5M
 Qhn3rkA0Htrtk9+N8adAF/RZAWcToBfwRxJPQ83357QlPnKCCApvBl43f
 RN0uoftqdN/AxXtmQp+88qsnUFoNzfV9NESDK6RNiDkkle0udOjNJZkGA
 JElkkcQ9osUTnTWYDRPYrDkse3ckIkuQOKWgjDV8fYAKUuAwFY7WZl9d9
 22zNYl1SRJhk/+EsPCnT24PvXDYLihSI118hBNogUYOm6g+QqFJR77wVD
 3hcmLTehgKs2v+8Sp29h5R1i9tEU1JQbUE7FpTX6wby7SCzI74fjxaygZ w==;
X-CSE-ConnectionGUID: qFg0a5ZTQ/GDI73yNBBnpQ==
X-CSE-MsgGUID: So/uLFNSS7egVB2+DKR8mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72324585"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="72324585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:31 -0700
X-CSE-ConnectionGUID: bAqGRg6kTfe3u2fEPpbnpw==
X-CSE-MsgGUID: h6d7w8ucSWqjQbtle14wYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139945571"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:29 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v6 4/4] drm/xe/pf: Allow upon-any-hang wedged mode only in
 debug config
Date: Wed, 21 May 2025 14:25:11 +0200
Message-Id: <20250521122511.5760-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250521122511.5760-1-lukasz.laguna@intel.com>
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c495d499edff..35ae9eba7526 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1186,7 +1186,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
 			mode, xe_device_wedged_mode_to_string(mode),
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-- 
2.40.0

