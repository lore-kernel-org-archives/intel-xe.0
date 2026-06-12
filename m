Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15B2CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A55510F61B;
	Fri, 12 Jun 2026 17:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvAjwD4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D402D10F60F;
 Fri, 12 Jun 2026 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285841; x=1812821841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckj1/k5Dtf450O2I8MpGkoAWkbUbSR93Oh1SkQnPeNE=;
 b=ZvAjwD4cK+BinzAxPrk+5LlCWHCSMRVIevMBJ6+vF7RB4yYWjYWamZCL
 euKlHYVPkOobPjiMEds/arq/03oi+XDRJdkKARcSUPyN3JLKny19h8VrN
 LDQBgu3sf5rnb36+f2oH6QjW+RGL3c5N5q1vu9x2JXqhTKDH8a9hhWBYK
 zP8HxiCDt3z5qN4Cg3Kuq4Hk1TvItAfBcSAFci8Lq3W3AWYZNdJa6jtqy
 bHIBlEnOR5wewjPvLxqY4rPVfCC4QdcVXy2mHNlZZ0g/1mPvH3JjcwJGK
 pKflD6hcmiPFBfCuFnWkNYjcAck7uudkSV/kBM/KG7LonwSBur/YkYQ1+ Q==;
X-CSE-ConnectionGUID: CzQSYSEwTBmmFCOZ4LhMkA==
X-CSE-MsgGUID: oEBlwGNSQnufJWhAh1U/RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81965750"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="81965750"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:20 -0700
X-CSE-ConnectionGUID: 2XnAet8FQ4O63P/2ZRkp3g==
X-CSE-MsgGUID: RT9uLRriRWyDhHdxTmswmg==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:19 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915/cdclk: Introduce bxt_cdclk_cd2x_pipe_mask() and
 use it
Date: Fri, 12 Jun 2026 20:36:52 +0300
Message-ID: <20260612173653.7830-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
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

Currently bxt_sanitize_cdclk() assumes that
bxt_cdclk_cd2x_pipe(INVALID_PIPE) gives us the full mask for
for the relevant bitfield. While that is true, it does make the
code a bit confusing to read. Introduce bxt_cdclk_cd2x_pipe_mask()
to make the situation a bit less confusing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index b612ab6f462a..8db79758187d 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1944,6 +1944,16 @@ static void adlp_cdclk_pll_crawl(struct intel_display *display, int vco)
 	display->cdclk.hw.vco = vco;
 }
 
+static u32 bxt_cdclk_cd2x_pipe_mask(struct intel_display *display)
+{
+	if (DISPLAY_VER(display) >= 12)
+		return TGL_CDCLK_CD2X_PIPE_MASK;
+	else if (DISPLAY_VER(display) >= 11)
+		return ICL_CDCLK_CD2X_PIPE_MASK;
+	else
+		return BXT_CDCLK_CD2X_PIPE_MASK;
+}
+
 static u32 bxt_cdclk_cd2x_pipe(struct intel_display *display, enum pipe pipe)
 {
 	if (DISPLAY_VER(display) >= 12) {
@@ -2378,7 +2388,7 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	 * dividers both syncing to an active pipe, or asynchronously
 	 * (PIPE_NONE).
 	 */
-	cdctl &= ~bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	cdctl &= ~bxt_cdclk_cd2x_pipe_mask(display);
 	cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
 
 	if (cdctl != expected) {
-- 
2.53.0

