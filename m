Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41A0C021A6
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 07:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9006D10E382;
	Mon, 17 Feb 2025 07:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ3IQwz9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1197C10E374;
 Mon, 17 Feb 2025 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739775673; x=1771311673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2gc0yaJeo0/3R8MxaCQ9/QkgxDdcCP7/68kUa03sQZA=;
 b=QQ3IQwz9KmhcM2gTjddBEaxXxDcVOIfXdkNuKQvKDJnyxMcvjdpn6F2Q
 IgTGRRdX2iNZfDmi8f3H5MdTCgcB64qOgGy/q6KScwlQTpir5/mvcose5
 kAjbXpPAla9JyV/i4XFFkddmT7oJzrSHVRJGuEgiIqJxpKXuas/FViAVP
 4xUWIEBbmdU0w42l7YEnZlTQLJAwzlNzkulSsUksrzOWR6Fn/gfEraMOe
 r4o7UKtj3hj/gpZyAnRcTERFP6XhTWGGScKa3lzSSq1U9yfEbbnN3NG24
 BYBtpXLjZ8dcS+e1aViG9uObQgnckASLSe2g8JYhx6/enOMcLINeCR+/R w==;
X-CSE-ConnectionGUID: +cShpAmCRwyeoN6+Lazc4Q==
X-CSE-MsgGUID: n/9o4o4+RIyj5j2qlzNpqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="39676269"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="39676269"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 23:01:13 -0800
X-CSE-ConnectionGUID: x9gPQw7+Q3C09FHbICALOw==
X-CSE-MsgGUID: 1eyu9LiTRpWUoFmPOSoLvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114233509"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Feb 2025 23:01:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 17 Feb 2025 09:01:09 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH v2 7/8] drm/i915: Un-invert {i9xx,i965}_error_mask()
Date: Mon, 17 Feb 2025 09:00:46 +0200
Message-ID: <20250217070047.953-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250217070047.953-1-ville.syrjala@linux.intel.com>
References: <20250217070047.953-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make life a bit more straightforward by removing the bitwise
not from {i9xx,i965}_error_mask() and instead do it when feeding
the value to gen2_error_init(). Make life a bit easier I think.

Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index bba0a0acf0ae..da130e1b5cc1 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -838,10 +838,10 @@ static u32 i9xx_error_mask(struct drm_i915_private *i915)
 	 * so we just have to mask off all page table errors via EMR.
 	 */
 	if (HAS_FBC(i915))
-		return ~I915_ERROR_MEMORY_REFRESH;
+		return I915_ERROR_MEMORY_REFRESH;
 	else
-		return ~(I915_ERROR_PAGE_TABLE |
-			 I915_ERROR_MEMORY_REFRESH);
+		return I915_ERROR_PAGE_TABLE |
+			I915_ERROR_MEMORY_REFRESH;
 }
 
 static void i9xx_error_irq_ack(struct drm_i915_private *dev_priv,
@@ -900,7 +900,7 @@ static void i915_irq_postinstall(struct drm_i915_private *dev_priv)
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	u32 enable_mask;
 
-	gen2_error_init(uncore, GEN2_ERROR_REGS, i9xx_error_mask(dev_priv));
+	gen2_error_init(uncore, GEN2_ERROR_REGS, ~i9xx_error_mask(dev_priv));
 
 	dev_priv->irq_mask =
 		~(I915_DISPLAY_PIPE_A_EVENT_INTERRUPT |
@@ -1011,13 +1011,13 @@ static u32 i965_error_mask(struct drm_i915_private *i915)
 	 * so we can always enable the page table errors.
 	 */
 	if (IS_G4X(i915))
-		return ~(GM45_ERROR_PAGE_TABLE |
-			 GM45_ERROR_MEM_PRIV |
-			 GM45_ERROR_CP_PRIV |
-			 I915_ERROR_MEMORY_REFRESH);
+		return GM45_ERROR_PAGE_TABLE |
+			GM45_ERROR_MEM_PRIV |
+			GM45_ERROR_CP_PRIV |
+			I915_ERROR_MEMORY_REFRESH;
 	else
-		return ~(I915_ERROR_PAGE_TABLE |
-			 I915_ERROR_MEMORY_REFRESH);
+		return I915_ERROR_PAGE_TABLE |
+			I915_ERROR_MEMORY_REFRESH;
 }
 
 static void i965_irq_postinstall(struct drm_i915_private *dev_priv)
@@ -1025,7 +1025,7 @@ static void i965_irq_postinstall(struct drm_i915_private *dev_priv)
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	u32 enable_mask;
 
-	gen2_error_init(uncore, GEN2_ERROR_REGS, i965_error_mask(dev_priv));
+	gen2_error_init(uncore, GEN2_ERROR_REGS, ~i965_error_mask(dev_priv));
 
 	dev_priv->irq_mask =
 		~(I915_ASLE_INTERRUPT |
-- 
2.45.3

