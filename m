Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87652D58E53
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF0810E431;
	Mon,  2 Mar 2026 04:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rql9AwyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0ED10E430;
 Mon,  2 Mar 2026 04:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772424392; x=1803960392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/Df5iEM2abNKH7kKWydRqVe+ejjPV55Vboay9bXNW8=;
 b=Rql9AwyAG0V3xFeWb3sRqNht6YXOkQsWZfWpbRk4TXk25TBx7yV7eo6f
 It0uU7qGUjt8gQz1vPTETTODe8axAZqTJp1D1ms5MUf4nFZXZPIny5Eed
 SgFNfI0/c9BnHw5yZ93v/khSEMyxaBimqJP9Oc2BCFbu15IRHcGlRl6cp
 QaPvvxR5+2PBQjfxmG9Xha58hMFsu+ykFryhu5oCUGZtcNFB3A+YhN5MB
 7M1TVPhubSxd5fJVax63E0CwH0o/BwdAcqi3mr8i81abB45k6vPbC9v0R
 fMAhNbj/098ZvUNTKmgcbYpNZn6PKS5ulkgtLFcetlTlCYHcDz3zGkzf8 g==;
X-CSE-ConnectionGUID: TmGLOKjsQfKqfFSXiLLfhA==
X-CSE-MsgGUID: slaIt1WXRdmGQx5iEFCXWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77294462"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77294462"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:06:31 -0800
X-CSE-ConnectionGUID: kH7xn9EQS3S3c5VIQHxgow==
X-CSE-MsgGUID: isbm81MLRb2VImMTRmBqkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217541031"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 01 Mar 2026 20:06:30 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND 8/8] drm/i915/backlight: Use default/max brightness for INTEL
 AUX HDR backlight init
Date: Mon,  2 Mar 2026 09:36:13 +0530
Message-Id: <20260302040613.3324049-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302040613.3324049-1-suraj.kandpal@intel.com>
References: <20260302040613.3324049-1-suraj.kandpal@intel.com>
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

If the brightness fetched from VBT/previous state is 0 on backlight
initialization, then set the brightness to a default/max value.
Whenever the minimum brightness is reported as 0 there are chances
we maybe sometimes end up with blank screen. This confuses the user
into thinking the display is acting weird. This occurs in eDP 1.4b
when we use proprietary INTEL AUX HDR DPCD registers to manipulate
brightness via luminance values.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index cedfbf516b5d..b8769930b16e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -442,6 +442,8 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 
 	panel->backlight.level = intel_dp_aux_hdr_get_backlight(connector, pipe);
 	panel->backlight.enabled = panel->backlight.level != 0;
+	if (!panel->backlight.level)
+		panel->backlight.level = panel->backlight.max;
 
 	return 0;
 }
-- 
2.34.1

