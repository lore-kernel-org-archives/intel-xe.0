Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FEFCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2B710FD41;
	Wed, 14 Oct 2026 12:06:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCF610FD4B;
 Wed, 14 Oct 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979561; x=1823515561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPXKvBYpToVUKvmAJgwBynuMxgVmDzvybTWJz7fWE1o=;
 b=mdGpPJSaFQzbu1DeJ7wF7umy0zNil8JPSKMyeQMDnDZn4EmXo4F44I3o
 HwRLsxnqaDQ2JHGoRM1B97sNbz4DuYGPUbaywAkfVnyMYk5oAMGfAy1A2
 Cwp1LmO1c8iLqoabNFpLpfiWHRndKiJODEPlxN8lgVAMLNTmymnWxirKJ
 6KHQOSl/vl0neOoZ43Iju7NZNiDJv5MBQCcY+vm2+5N+l3j8Iq+MY6BYM
 CKGYy8Ux3NCMQDtpGbonXdeM0lpLoQp6uAplv1liKfPdd5I+MhhXW9CDH
 3MHlsxAlt47Z8gHjcy4lmgn0vR0xqktg6tq3/3jFkergKWl+UQLx6j8Pg g==;
X-CSE-ConnectionGUID: 3EyWplwdQJuUZBKMzYPKJg==
X-CSE-MsgGUID: OQHhqIMLTDacM2BciemFRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="726962"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="726962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:06:01 -0700
X-CSE-ConnectionGUID: mfwthpetS+unoR5qRd6sdg==
X-CSE-MsgGUID: fygACMmjSKilUNcekIYp9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1359286"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:06:00 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/de: Implement intel_de_rmw() by hand
Date: Wed, 14 Oct 2026 15:05:40 +0300
Message-ID: <20261014120542.29675-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
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

Replace the intel_uncore_rmw() usage with a hand rolled
implementation in intel_de.h. The intel_de_rmw_fw()
counterpart is already implemented identically.

I chose to do the straightforward implementation of just
using intel_de_{read,write}() and drop the extra wakelock
stuff. That does mean that we drop the wakelock reference
between the read and the write, but since the wakelock release
happens via a delayed work this should not cause any actual
difference under normal circumstances.

This will reduce the uncore usage footprint of intel_de.h,
which will help with cleaning up the final uncore i915 vs. xe
mess.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 76f698cfa354..3339567496e9 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -70,15 +70,13 @@ intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val)
 static inline u32
 intel_de_rmw(struct intel_display *display, intel_reg_t reg, u32 clear, u32 set)
 {
-	u32 val;
-
-	intel_dmc_wl_get(display, reg);
-
-	val = intel_uncore_rmw(__to_uncore(display), reg, clear, set);
+	u32 old, val;
 
-	intel_dmc_wl_put(display, reg);
+	old = intel_de_read(display, reg);
+	val = (old & ~clear) | set;
+	intel_de_write(display, reg, val);
 
-	return val;
+	return old;
 }
 
 int intel_de_wait_us(struct intel_display *display, intel_reg_t reg,
-- 
2.55.0

