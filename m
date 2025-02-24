Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AD5C021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF40710E467;
	Mon, 24 Feb 2025 13:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUR/qXZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD6810E13C;
 Mon, 24 Feb 2025 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740378571; x=1771914571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=laEDbm9/x9wmxq0hXEMV1vil8qcnHTnbLGCqENpA8jA=;
 b=hUR/qXZd8SlMkPRSI2QgESpFEE9rHBelalNbzuK2bC2wjlixjXk0qp34
 gnhc7AUe46K6MRaVT5rFNGhKINrcxh0AtjJaC/qfpWdTSnjkRta6JxcZm
 d821HGFSJknVsr9IbmJluiWNU8If9dBZR0IN452iZhnHp61+sKQMBtgEl
 m4Jz9ky/cfuGYxxOBDJft35KQBxn0QhfkrG8KkKyIlwkBZFkVWV7Wrkxu
 3jhxwraxqjFY7KmAGrZHQEus0gf54dtUiOK4V3KvqinnZx5VKZRGdJX1K
 q76yYBGCXGIustWPnINxLid2Mkq7K5pPj8lhd2h7GJCCaffYNrZRCRe+k Q==;
X-CSE-ConnectionGUID: mBzaGD0zRQyHGmHSPfLJvg==
X-CSE-MsgGUID: ZPo6vBZ+SqKC9jTsbdDFXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="28719636"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="28719636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 22:29:31 -0800
X-CSE-ConnectionGUID: XM2bMvCISe+IaYi1ebgIUw==
X-CSE-MsgGUID: UoKjTPwlS5CB5fHlgakpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120076440"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 22:29:31 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 01/20] drm/i915/vrr: Remove unwanted comment
Date: Mon, 24 Feb 2025 11:46:58 +0530
Message-ID: <20250224061717.1095226-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250224061717.1095226-1-ankit.k.nautiyal@intel.com>
References: <20250224061717.1095226-1-ankit.k.nautiyal@intel.com>
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

The comment about fixed average vtotal is incorrect.
Remove it.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index cac49319026d..106bfaf6649b 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -276,11 +276,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	 */
 	crtc_state->vrr.vmin -= intel_vrr_flipline_offset(display);
 
-	/*
-	 * When panel is VRR capable and userspace has
-	 * not enabled adaptive sync mode then Fixed Average
-	 * Vtotal mode should be enabled.
-	 */
 	if (crtc_state->uapi.vrr_enabled) {
 		crtc_state->vrr.enable = true;
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
-- 
2.45.2

