Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A969EEF317
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 08:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E171910EB87;
	Thu,  5 Mar 2026 08:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww/3aMwm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B4210EB79;
 Thu,  5 Mar 2026 08:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772698787; x=1804234787;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JhLR2k2eBBkP5LIGAtVMzHop7q7TF293jgVtNpgSMDE=;
 b=Ww/3aMwmaOR3X1NRdHNI09jTa2At7IzMSLD0K0+Y02VcpCjNQtDmV6z0
 KeSlFOmP8Xkx2sqc7vuujpWjxfWN0XnTClfzCDK6EkBgqDhUGi8qORRB2
 6Uag3Nkmo0ng8LgKOUmA4WWzFp1cdXmWzTR669M707XJ8nLfTd1em7dIN
 uSpup8D5a6IVqVg/GFLxpYhIEIevGA5cUjx4jgT/k+BcbD1o0yOdh3VpE
 uw6gH82Zr4K/ZUdwl+NnIm0VOdAfxd7KxY7tNXxgfdRzmeB09PeyUtbUm
 VSkN+beLHrsnEJ3ub4h6FROjGJ076f7q7rytK1NnIVhbQPtQaOUQdRSGY A==;
X-CSE-ConnectionGUID: FUoN5h1PRWaS/jGEgql9jQ==
X-CSE-MsgGUID: K7AlQr69Q4yT3vQp2k9/Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91349169"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="91349169"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:19:46 -0800
X-CSE-ConnectionGUID: FgYsDArfQrSA38Trt+Y/Pg==
X-CSE-MsgGUID: bnmnu0BQRjWIHou7jNEIFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="256492902"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 00:19:41 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 05 Mar 2026 13:48:14 +0530
Subject: [PATCH RFC 4/4] drm/i915/dp: DPRX/LTTPR caps for DP should be read
 once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dp_aux-v1-4-54ee0b5f5158@intel.com>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
In-Reply-To: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
To: Imre Deak <imre.deak@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

The DPRX/LTTPR caps for DP is read on detect and should be read only
once. This value is stored in intl_dp struct and will be retained until
hotplug.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 76a5bfb507c34733db09cd7c2ba9895afcbf6b10..b78fc69cf21dea630313a5c93ff4bd3670f32293 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -250,6 +250,9 @@ int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
 	struct intel_display *display = to_intel_display(intel_dp);
 	int lttpr_count = 0;
 
+	/* this function is meant to be called only once */
+	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
+
 	/*
 	 * Detecting LTTPRs must be avoided on platforms with an AUX timeout
 	 * period < 3.2ms. (see DP Standard v2.0, 2.11.2, 3.6.6.1).

-- 
2.25.1

