Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A76E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 19:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F28110E30D;
	Wed, 18 Feb 2026 19:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGlXNST6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED2510E30D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771441409; x=1802977409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cx0U99au+NfI2H19aHsE/mvm01shoSAdkyY9HIFPkUY=;
 b=iGlXNST6VMis/aoDn42uh3PSY8w347ajVRYGrhFBENRDBV6iDSKzqQO8
 mJiGW6hvGh07ag4O2wfGrPSfS4OM3SH4NgquFGVq+ew7DusS8LEH/CCPk
 iTMOQt3LmYFrxaz9y2nPOrtvkN86Dmiu4VEYV5VW0HlQOJMY/DesPLB+L
 Twnj7FeuUJrMEmUIwbzYn9Gkompm9TFAsobErb0jBRTaZFgoSPrC37wc5
 i+2LeaC4cbUFucEpy5m1V2T8eO+ha+0t9ukkq+ZgKlxYGiFAaAURlS7qu
 ADIFzBsjAZrz7qqX9jbxu4xzdUYcGonJZER4LR7sbHNhhzxPptUEuZSWO g==;
X-CSE-ConnectionGUID: cb3A3sBxRN6e7tenjqKdrA==
X-CSE-MsgGUID: FwbVRLfLSDypg96afOwFdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72592364"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72592364"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:03:29 -0800
X-CSE-ConnectionGUID: 7p0gVc2hRZuM7Gq4+3EDDA==
X-CSE-MsgGUID: 7f9uKtgHTlKXiB+OXP+rIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="237264340"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:03:28 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v4 3/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State
 for xe3p_xpc"
Date: Wed, 18 Feb 2026 11:03:02 -0800
Message-ID: <20260218190308.4124010-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218190308.4124010-5-julia.filipchuk@intel.com>
References: <20260218190308.4124010-5-julia.filipchuk@intel.com>
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

