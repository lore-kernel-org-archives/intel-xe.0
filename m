Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA11073CA7
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 12:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97F10E638;
	Wed,  8 Apr 2026 12:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRgDcVtV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C4610E631;
 Wed,  8 Apr 2026 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775651498; x=1807187498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gV233AuEmUUT1bQz0y8HaCkqDXtkt7mIug2hz3fcHB4=;
 b=SRgDcVtV7DNwB+GQ1OUIIXI7g6JeJuPrH/YJQ9hIZs+ZasmB41UFmj+c
 LF96agwZopyg+8R9PCne9rlRv1vbJl90yzO8/cfoGEe9uIqX9FChk7bfR
 DQWB4jVCUwxiSbLihE/npbhpFa15ir5a+jjzjKqJpwAo/WGqkZm3LlsN7
 Q4i6PpIljV9O26pAiX6FT3kfbvqBLJhqs/WoMg4fiD+KWgbBLLEM2tzN9
 Aje1GsyBlGaQW9jaswJJ8hGXkHlXB2HftW6H4WheaRaGDSzeLsWZzUjaj
 3TmWvIhtWsg9KcNsmr+xx32xYM+ujv9QJXzGTFHgKl+eEATyUZ+tuTkth A==;
X-CSE-ConnectionGUID: yk9aKmkARwKwd5VuQ/JUIA==
X-CSE-MsgGUID: h3qoK8vURE6lwsE0jgQMXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80519075"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80519075"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:31:38 -0700
X-CSE-ConnectionGUID: TUFFXA1vTEOsoIcsdeHLBQ==
X-CSE-MsgGUID: tIHrtXeqQ/yOjvz7chcKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251782041"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.73])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:31:36 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH v3 4/9] drm/i915: Introduce a new intel_atomic_check_crtcs()
Date: Wed,  8 Apr 2026 15:31:09 +0300
Message-ID: <20260408123115.15716-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
References: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
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

Add a new intel_atomic_check_crtcs() that gets called fairly
early during intel_atomic_check() and start collecting stuff
into it from elsewhere. For now we can suck in the
intel_crtc_min_cdclk() stiff.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aa9e6639f914..11952136c686 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5814,6 +5814,18 @@ static void intel_crtc_check_fastset(const struct intel_crtc_state *old_crtc_sta
 		new_crtc_state->update_pipe = true;
 }
 
+static int intel_atomic_check_crtcs(struct intel_atomic_state *state)
+{
+	struct intel_crtc_state *new_crtc_state;
+	struct intel_crtc *crtc;
+	int i;
+
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+		new_crtc_state->min_cdclk = intel_crtc_min_cdclk(new_crtc_state);
+
+	return 0;
+}
+
 static int intel_atomic_check_crtcs_late(struct intel_atomic_state *state)
 {
 	struct intel_display *display = to_intel_display(state);
@@ -6521,8 +6533,9 @@ int intel_atomic_check(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
-	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
-		new_crtc_state->min_cdclk = intel_crtc_min_cdclk(new_crtc_state);
+	ret = intel_atomic_check_crtcs(state);
+	if (ret)
+		goto fail;
 
 	ret = intel_compute_global_watermarks(state);
 	if (ret)
-- 
2.52.0

