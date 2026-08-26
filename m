Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6756FC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2544F10ED11;
	Wed, 26 Aug 2026 13:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGTTRLqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6068310ED1A;
 Wed, 26 Aug 2026 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751641; x=1819287641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dL/KCAujNfKx4kRwlpxg+qwn0eKH5ctrIM/GhxrccE8=;
 b=TGTTRLqM0s0u/LOiH6Gfy+RnOTlD0Yl8YXHuH6QkBQhDvO5vJAN182fT
 0cdWjoCk5ROSYUKk7oNCrQzLSVWn1/vL2omX8l42TUsWk7fEsmqG2KUd6
 zrp9xHE4wGeQyoNEYyJg/Gyt1lPDsBBCwrgV/5RYMI09FhiVLTmQLzxfo
 Ymx1jGJNBLLCNV+T73QpQg8wYxg1m0DLnwuIFm4ogg4HP9T1xQ+byS3Xn
 QhYjOc/v7mvBtGrFGIyxoy4UtEudS7adkvpfYGgtC6FY/ENTYzZ5hZdap
 pWVbpYLFr/9CgKTLhi4vtHyzDAoQo2RsmzTVoVMhyAw98C9NXs9qscQ0n Q==;
X-CSE-ConnectionGUID: id+4ihu6TMC7bovht22CXw==
X-CSE-MsgGUID: euI+pgLTT6i6dB1Z1PDJiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88152244"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88152244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:41 -0700
X-CSE-ConnectionGUID: ++O/uwT7StiJ4auBZWnMMw==
X-CSE-MsgGUID: ReRS/XmdRGSjENcSXIvmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264980472"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:39 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 01/14] drm/i915/cdclk: Don't bail if pcode post nofify fails
Date: Wed, 26 Aug 2026 16:40:20 +0300
Message-ID: <20260826134033.13976-2-ville.syrjala@linux.intel.com>
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

We already changed the actual cdclk frequency by the time we do
the pcode post notify. So skipping the subsequent readout is plain
wrong.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 75ada941d113..c3206c9de239 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2328,12 +2328,10 @@ static void bxt_set_cdclk(struct intel_display *display,
 						       HSW_PCODE_DE_WRITE_FREQ_REQ,
 						       cdclk_config->voltage_level, 2);
 	}
-	if (ret) {
+	if (ret)
 		drm_err(display->drm,
 			"PCode CDCLK freq set failed, (err %d, freq %d)\n",
 			ret, cdclk);
-		return;
-	}
 
 	intel_update_cdclk(display);
 
-- 
2.54.0

