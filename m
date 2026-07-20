Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F74C44525
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A5310E84E;
	Mon, 20 Jul 2026 09:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRk9mzkG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7DF10E870;
 Mon, 20 Jul 2026 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538736; x=1816074736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SA/nr8lacWLsdsk6/U3R7mwU9gFlN9kPPbFExGn0jzY=;
 b=IRk9mzkGaGiwyEJwLp1wxvROeu7d9RJ7mmbTFnIHA46I8U3rIrbuTYEr
 61TsfhtGBsOnwE7TF43uatykEjMnr47YdC53wjXhXEKn4jVP2H5LUqXGY
 +39oJ++wBCu+S350NBvWhGp8JrZlCqEH3TXnrfAGP5M+EGynVZEx7S9/1
 M4iIreo3a6Ku3BVPsUg64L38+S7bToxhz6dd7HxiNL26pA4tGRGP8ngYs
 LA60l8jOA5UgZuflhS0vMOvyzzl+amPt6OHEKCvxrRXfrHKpkSBUVJ/Hk
 ZveKnd5jzld/2IpukJFiRXc/eyLu1GQkAddiGIQZrVY5MfhNgqIEHR6J8 Q==;
X-CSE-ConnectionGUID: 74bjBiLVQF+sEQ7c8fR5Aw==
X-CSE-MsgGUID: pxf0U84wRQSGc0ftDNRqrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102664822"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102664822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:12:15 -0700
X-CSE-ConnectionGUID: uiUaqIw0RByGvc3oO1cztw==
X-CSE-MsgGUID: tGOyzNx4SOepVDkV1vq2EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260963504"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2026 02:12:14 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v4 9/9] drm/i915/vrr: Enable cmrr
Date: Mon, 20 Jul 2026 14:31:41 +0530
Message-ID: <20260720090142.2864289-10-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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

Enable CMRR during compute config and add related state
checker for the same.

--v2:
- Everything else except enable compute to handle before this patch
(Chaitanya)

--v3:
- Remove redundant return from compute config

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index ae9824e679f3..c6177833f795 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -287,6 +287,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
 						   crtc_state->vrr.cmrr.cmrr_n,
 						   &crtc_state->vrr.cmrr.cmrr_m);
+
+	crtc_state->vrr.cmrr.enable = true;
 }
 
 static
-- 
2.48.1

