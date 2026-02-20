Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8C7C5ACD9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CA710E3AE;
	Fri, 20 Feb 2026 17:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORwqmnP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335C10E3AE
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771606928; x=1803142928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cx0U99au+NfI2H19aHsE/mvm01shoSAdkyY9HIFPkUY=;
 b=ORwqmnP4LSEWwK5tcoXHpdw1vVH7iQCn/CDAWvPM+ybrHQh3ToeElv1x
 mK0Mr2h9yowBhlSQodIwA4V9HKWWYGO/GR7U9nAWHR0iPPY09rUo8nmBY
 8v6ZR4wWWnLPmrgu86ozA960mMi3lY+AbtTW3hXAEsJEti5uynaixgeG8
 7ZXPZ6JOdMMJVconSaLuBFpgthBDO2BA2x3hNVohamvTIsSkm34VTuXOM
 Dn96L047x3mq+6/Nu8g9IV21QLSguYXG9lHNzcjxt1uJW+hTVf1lBIqmA
 KJIfOdLQFbFYAwEbYkci9rhXtuyX6hkZ7rFg+H1FQ8bxL8ivqMEMRSLLC A==;
X-CSE-ConnectionGUID: RyrgH6/UTFKZlh+IzBbrOw==
X-CSE-MsgGUID: C7OCtB4lSsuJ05X2PR/0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98163702"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98163702"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:02:08 -0800
X-CSE-ConnectionGUID: LHVLd4MsT1S367h0AVaOfA==
X-CSE-MsgGUID: CZ/s4QRHSiGY76ixZUB5tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="237860894"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:02:08 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 3/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State
 for xe3p_xpc"
Date: Fri, 20 Feb 2026 09:01:39 -0800
Message-ID: <20260220170137.328131-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220170137.328131-5-julia.filipchuk@intel.com>
References: <20260220170137.328131-5-julia.filipchuk@intel.com>
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

