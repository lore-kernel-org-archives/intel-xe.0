Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46A31061B3F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 12:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC2810EAF7;
	Tue, 31 Mar 2026 12:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyOt8lPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E54F10EB05;
 Tue, 31 Mar 2026 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774959404; x=1806495404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a3dQ+o4TQdQS0ScyzUS9BjxzQSbaSOtPRkeLTyOkfq8=;
 b=hyOt8lPEQOPyp/Hq4YyWqV35pOon9xEFcVgVDN3166efw3klczSAjvKG
 k3Nr4EPGMu2fH3MaAu44ak+dww9ysm6usV7hMCY1GvKSDVW1B3FbkfjID
 NwWh1ll79kqRUKc3wtEvRomj0Hs4G7DBuiaEjQvpxjXz2tWFaKDMnv1i5
 ezN2nXchFXyUWB9jFatinOIcWVC8RwRyFsEof7OK8yqvWM14BTlr3RtYw
 o92xOVPTVIDNnvVHnzL88h5/xDvdcvytxqAZY9tUhHJraWwiB1ylN9gsd
 Tbi4qjbAtLZ4rg7xuFBN5CO6Uk2Ws6m4uLPMpDs/e807xK5K+MH0ayaQv g==;
X-CSE-ConnectionGUID: 9qfdhrDlTda4dNoEz/MyUw==
X-CSE-MsgGUID: 7jZxZmeqQ9q0T0o383oLOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87361421"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="87361421"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 05:16:44 -0700
X-CSE-ConnectionGUID: mId/OBB9Rd+0HSL7slq8hg==
X-CSE-MsgGUID: Xg/GS7DCRG+vadirQshapw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="223469131"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.244])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 05:16:43 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 8/8] drm/i915: remove HAS_PCH_NOP() dependency from clock
 gating
Date: Tue, 31 Mar 2026 15:07:19 +0300
Message-ID: <20260331121608.1016333-9-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331121608.1016333-1-luciano.coelho@intel.com>
References: <20260331121608.1016333-1-luciano.coelho@intel.com>
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

intel_pch_init_clock_gating() already handles unsupported PCH types,
including PCH_NOP, by doing nothing.

Drop the explicit HAS_PCH_NOP() check from the IVB clock gating
path and always call the display helper directly. This removes one
more direct dependency on display-side PCH macros from
intel_clock_gating.c.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/intel_clock_gating.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 12559db84cf4..d185199c43b8 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -290,8 +290,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MASK,
 			 GEN6_MBC_SNPCR_MED);
 
-	if (!HAS_PCH_NOP(display))
-		intel_pch_init_clock_gating(display);
+	intel_pch_init_clock_gating(display);
 
 	gen6_check_mch_setup(i915);
 }
-- 
2.53.0

