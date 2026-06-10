Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA446CD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB8110EB42;
	Wed, 10 Jun 2026 17:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPiOGhOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0057410EB39;
 Wed, 10 Jun 2026 17:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781111274; x=1812647274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xiWiYzycMhRcxQy4OLcbZJ8IAcFNQ7lkB4aiVRv8Nhk=;
 b=hPiOGhOhls0cHccqxDXDu2qc+bO6eU6pYYMkzqWPdKK3bC6yKAiq+bpC
 mjrq4L4rZS5tZilQB0BOf+/nIQGLJabOcXuJqBB7ZUFBBxmu/504AFoq4
 aa5z5RWCN/AnhcMre/lGHmRSLxZ3rS8PZT0JuuUFtiUzYdXI4wZhtRKwo
 YZfFdqIzNvt2m9KRTQQy7k9XR0z42W4hA+Y8loRIF5sX4IQuBL4v06VBL
 QEJ5snatxHSvyCHcHjQb4JdN78fNd7ykaGrr3kmBDI8rsrfESyEN0P7Nu
 u53Yyn3B3LJZgzHxAEx8+5PxkhvZMsnhvIwvz7IqZs0HM/QhDjYDAMUsN A==;
X-CSE-ConnectionGUID: Z2esrowoRoSEor82VQfIyQ==
X-CSE-MsgGUID: YOAX0rEdS2+VrWqbhv/SQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92479138"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92479138"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:53 -0700
X-CSE-ConnectionGUID: 9cpoKzfmSZmkfQFSI2yS+w==
X-CSE-MsgGUID: 2vTkSxczSi+h0k5g540z1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="239882542"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/14] drm/i915/cdclk: Extract bxt_cdclk_pcode_{pre,
 post}_notify()
Date: Wed, 10 Jun 2026 20:06:49 +0300
Message-ID: <20260610170652.5320-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
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

Extract the BXT/GLK pcode notify stuff to a few small helpers.
The plan is to unify these between all the platforms and turn
them into vfuncs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 42 +++++++++++++---------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index bb47fc4c86ee..749e366e60ab 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2226,6 +2226,29 @@ static u32 bxt_cdclk_ctl(struct intel_display *display,
 	return val;
 }
 
+static int bxt_cdclk_pcode_pre_notify(struct intel_display *display)
+{
+	/*
+	 * BSpec requires us to wait up to 150usec, but that leads to
+	 * timeouts; the 2ms used here is based on experiment.
+	 */
+	return intel_parent_pcode_write_timeout(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
+						0x80000000, 2);
+}
+
+static int bxt_cdclk_pcode_post_notify(struct intel_display *display,
+				       const struct intel_cdclk_config *cdclk_config)
+{
+	/*
+	 * The timeout isn't specified, the 2ms used here is based on
+	 * experiment.
+	 * FIXME: Waiting for the request completion could be delayed
+	 * until the next PCODE request based on BSpec.
+	 */
+	return intel_parent_pcode_write_timeout(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
+						cdclk_config->voltage_level, 2);
+}
+
 static void _bxt_set_cdclk(struct intel_display *display,
 			   const struct intel_cdclk_config *cdclk_config,
 			   enum pipe pipe)
@@ -2278,13 +2301,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 	else if (DISPLAY_VER(display) >= 11)
 		ret = skl_cdclk_pcode_pre_notify(display);
 	else
-		/*
-		 * BSpec requires us to wait up to 150usec, but that leads to
-		 * timeouts; the 2ms used here is based on experiment.
-		 */
-		ret = intel_parent_pcode_write_timeout(display,
-						       HSW_PCODE_DE_WRITE_FREQ_REQ,
-						       0x80000000, 2);
+		ret = bxt_cdclk_pcode_pre_notify(display);
 
 	if (ret) {
 		drm_err(display->drm,
@@ -2311,15 +2328,8 @@ static void bxt_set_cdclk(struct intel_display *display,
 	else if (DISPLAY_VER(display) >= 11)
 		ret = skl_cdclk_pcode_post_notify(display, cdclk_config);
 	else
-		/*
-		 * The timeout isn't specified, the 2ms used here is based on
-		 * experiment.
-		 * FIXME: Waiting for the request completion could be delayed
-		 * until the next PCODE request based on BSpec.
-		 */
-		ret = intel_parent_pcode_write_timeout(display,
-						       HSW_PCODE_DE_WRITE_FREQ_REQ,
-						       cdclk_config->voltage_level, 2);
+		ret = bxt_cdclk_pcode_post_notify(display, cdclk_config);
+
 	if (ret)
 		drm_err(display->drm,
 			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
-- 
2.53.0

