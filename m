Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B7EC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA4910ED19;
	Wed, 26 Aug 2026 13:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1vCyGoz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9481110ED1B;
 Wed, 26 Aug 2026 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751660; x=1819287660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rdn2Tx8zPiWDtXRWK1Si+BZXV1wtVeYpf75c+lB31ZM=;
 b=J1vCyGoz6GWXiJSERoq2OeHZElqza+KdSFg0HjeirZWWMAF3tCFBHzmQ
 /2oVZJMs73O+eKReWJaSdGJuFsZRNW0FVrvuYWYnjitrua+uNk+GOUtKV
 A8ONBP7rjij7JpY/eIJ1hD5vdqJ5GbMdgAe0JRjv5XFRmmpbJszDrfyi9
 vikwGqvPYXRlE6Edy+RUE1kxTsP5+j3RoPU8ce+DNDo2MlPvnAdk+6laT
 6GbGiq9TsnEVd/1n25T0YbJeMGPDI5WL4Q7Hg/S4aWeHQYtuFlEIeky4A
 7vZpSYTyE+LwBJMDTDvp0C/ja4d8vGhRvtZVMMxSOAd0EYgFOEXLa6JC1 w==;
X-CSE-ConnectionGUID: kWQycYqOTqe6qDEQviekuA==
X-CSE-MsgGUID: gwrusWKgQh+Soyh8e+BjfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88360934"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88360934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:00 -0700
X-CSE-ConnectionGUID: mnWF3oQgQrmtaaMB959T8w==
X-CSE-MsgGUID: XZMFGLkpQSmCX84J/A38JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271081688"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:57 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 05/14] drm/i915/cdclk: Stop forcing voltage level to 3 all
 the time on DG2
Date: Wed, 26 Aug 2026 16:40:24 +0300
Message-ID: <20260826134033.13976-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

SKL_CDCLK_PREPARE_FOR_CHANGE == DISPLAY_TO_PCODE_VOLTAGE(3) so
we are currently forcing the voltage level to 3 all the time on
DG2. Remove SKL_CDCLK_PREPARE_FOR_CHANGE from the mask to avoid
this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 052274cd0e19..e05b6e76363c 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2647,7 +2647,6 @@ static void intel_pcode_notify(struct intel_display *display,
 		update_mask |= DISPLAY_TO_PCODE_PIPE_COUNT_VALID;
 
 	ret = intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
-					 SKL_CDCLK_PREPARE_FOR_CHANGE |
 					 update_mask,
 					 SKL_CDCLK_READY_FOR_CHANGE,
 					 SKL_CDCLK_READY_FOR_CHANGE, 3);
-- 
2.54.0

