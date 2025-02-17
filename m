Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081DBC021A6
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 07:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCF610E37D;
	Mon, 17 Feb 2025 07:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIo3xW7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163DA10E37D;
 Mon, 17 Feb 2025 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739775654; x=1771311654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K6HIgMdjre2uqCZgYogyWGI9TdGSS4JOwwxeb3HpUds=;
 b=UIo3xW7FQojpKYKiAyFIe+3zDHpkNc5nDm/D3OMKlENalT4QCM9LS+8V
 t4Qh5U3G2avXWuaZqUfL4M7krSp+pPdIO7IA1ONsoA5TENpuKSFAK/LW3
 PlF02T7SVKxwvO0avqyaPHC/fSPn/NaJkEzilTyVw24aSSfqDf8T0CojM
 mHbpLkbOUQwQuImWZOhAYXQ1+TplVpfHt5CyBknkIAtyoOieXpKyTEGP1
 TOG+obOB9j1Ctf+8AwvTRQRc88ceerqfg9qqb3CzxSPRaFUWDZ+UIti5R
 j2Iav2ql9lSjWlKsf9nssTLniwgzc2IewKdii1esOpIj+ouIU1NFKG4Ay A==;
X-CSE-ConnectionGUID: HQVr/algTrSfZvo++oqfjg==
X-CSE-MsgGUID: Yq9eU3PzSJaYEDK/aOvhAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="39676244"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="39676244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 23:00:53 -0800
X-CSE-ConnectionGUID: vK8kjcz6SqOrGAxJfwR1KQ==
X-CSE-MsgGUID: Dw8WxfarRB2ZJrd5GI/97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114233349"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Feb 2025 23:00:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 17 Feb 2025 09:00:50 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH v2 1/8] drm/i915: Add missing else to the if ladder in missing
 else
Date: Mon, 17 Feb 2025 09:00:40 +0200
Message-ID: <20250217070047.953-2-ville.syrjala@linux.intel.com>
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

The if ladder in gen8_de_pipe_fault_mask() was missing one
else, add it. Doesn't actually matter since each if branch
just returns directly. But the code is less confusing when
you always do things the same way.

Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 880eaed83cd5..d3ba8e2cf5a1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -908,7 +908,7 @@ static u32 gen8_de_pipe_fault_mask(struct drm_i915_private *dev_priv)
 			GEN9_PIPE_PLANE3_FAULT |
 			GEN9_PIPE_PLANE2_FAULT |
 			GEN9_PIPE_PLANE1_FAULT;
-	if (DISPLAY_VER(display) >= 13 || HAS_D12_PLANE_MINIMIZATION(display))
+	else if (DISPLAY_VER(display) >= 13 || HAS_D12_PLANE_MINIMIZATION(display))
 		return GEN12_PIPEDMC_FAULT |
 			GEN9_PIPE_CURSOR_FAULT |
 			GEN11_PIPE_PLANE5_FAULT |
-- 
2.45.3

