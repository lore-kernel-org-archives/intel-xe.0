Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AF6E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 19:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266A510E30B;
	Wed, 18 Feb 2026 19:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSIF7unk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E76A10E30B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771442223; x=1802978223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cx0U99au+NfI2H19aHsE/mvm01shoSAdkyY9HIFPkUY=;
 b=nSIF7unkOJTFgE5vOZRGGBG8SsDOh5hOrwj7h/gOo0FbtHIqPFvtmk2F
 PacbbJpvbcFW0tdhD1PjU65/fPpT2fHi2mtKuQnC9jE1Uu1EVvFji3yWq
 YVQNhNwqVSJ8trdU5Lf5MosiDzqMw79yeyyKMV0+UeHt3dhD1y6rP/sc5
 lRFbGpzoW6kobvBKK/+uxESkWExAFslWWzSinIjZvClRI2hrBlYfxe+h8
 7U80vffXShs+MIv/UGFA+pAbOm+rlwiaWKIOYW7MSGoLD5EMBdgOnEk4y
 ZBthWusgJd1dEl0wSUzI9jzDTHVcKzzPA2KHSBVHkKpZjRji1OXAqR+st g==;
X-CSE-ConnectionGUID: 39rzj1UwS1ibFBybTECnJw==
X-CSE-MsgGUID: rbE+MYgDQ2K1yzRo0FTIWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83629853"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83629853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:17:03 -0800
X-CSE-ConnectionGUID: 0oLzzcTWRj+rObtLOhAKKg==
X-CSE-MsgGUID: HUGHQHx6RZiRscDmfTFrRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="212603369"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:17:03 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v5 3/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State
 for xe3p_xpc"
Date: Wed, 18 Feb 2026 11:15:49 -0800
Message-ID: <20260218191643.4130621-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218191643.4130621-5-julia.filipchuk@intel.com>
References: <20260218191643.4130621-5-julia.filipchuk@intel.com>
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

This reverts commit 81e77c028848b7131d7653dd443a4049334a920b.

With indirect ring state now enabled for all XE2+ platforms this setting
is already set by XE2_GFX_FEATURES macro.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ff8039198da1..6f85cb1ec662 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -124,7 +124,6 @@ static const struct xe_graphics_desc graphics_xe3p_lpg = {
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
-	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
-- 
2.51.0

