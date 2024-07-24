Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E98C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 13:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DA910E6B9;
	Wed, 24 Jul 2024 13:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0Jc5Pu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CD110E6B9
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721826393; x=1753362393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EnQJRyEWZN4sVKhiSOyW6XGhQNtI8DLLf8AbtK2xoyo=;
 b=M0Jc5Pu/T8Gsz42N0YcjTh/BnoCNtJ7xqtkyJJ5h3MNUc5ld1DBWSEOa
 L+GevKL3jvEebzNeac5qESPU7u9Q6v3eToJVKROAZtHzeGAl20IsFA4mo
 mo1Ag5aO6K8og1JhYfonr8HVOQ9HSt/+3qVjj3TJPPk3WpsHyjTSwhMCr
 PnmLB2MN3o/uKDxu65+H/C9OWQw7btFvPMTzxhBrc4LnPZ9fTK1brPDrx
 0blYKr4C4rXpxPg0rxm+WPBSkjSeou4/K9V73NcYFnE24rn4/aa3rsJJm
 oxQabOfIcCblHxo80eWhO77yQ+0hvh03cNj9qrrPnmGh6eqh6FHhEIRGB g==;
X-CSE-ConnectionGUID: 6ultkvhZTA64Q6M6jnagwA==
X-CSE-MsgGUID: 9Kw7KDRKSmKXz/xXe40gMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="42030356"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="42030356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 06:06:32 -0700
X-CSE-ConnectionGUID: Cxe5A7egScikrJo9DpsWuQ==
X-CSE-MsgGUID: S8isiWdoTVmjFx8gp+A1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="57124937"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 24 Jul 2024 06:06:29 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, uma.shankar@intel.com,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
Date: Wed, 24 Jul 2024 18:36:07 +0530
Message-Id: <20240724130607.944085-1-nemesa.garg@intel.com>
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

Underrun/corruption issue is seen for NV12 format
for odd panning on LNL due to hardware bug.
Disable the format.

HSD: 16024459452

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e979786aa5cf..f927e6a0b28b 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1029,6 +1029,14 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 		 * This allows NV12 and P0xx formats to have odd size and/or odd
 		 * source coordinates on DISPLAY_VER(i915) >= 20
 		 */
+
+		/*
+		 * Wa_16023981245 for display version 20.
+		 * Disable odd pan for NV12 format.
+		 */
+		if (DISPLAY_VER(i915) == 20 && fb->format->format == DRM_FORMAT_NV12)
+			return 0;
+
 		hsub = 1;
 		vsub = 1;
 	} else {
-- 
2.25.1

