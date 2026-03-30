Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A01061B2A
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 23:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74C410E7C7;
	Mon, 30 Mar 2026 23:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9nlhvpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E16310E7C5;
 Mon, 30 Mar 2026 23:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774914830; x=1806450830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2J9pJYR9OBaDyUDs7S6czDxuVQwC42FxmNUYNth4J98=;
 b=c9nlhvplW6W2Vx2c0pFARxVRtxMGGGOnbBycMqvBMiZZsHs/wylGqhR7
 rxk0e8wq6/45WeoU5kiueQgUgSA2INpHYP8cWpq4dh0zWHooedbyKwF8f
 QWA5gL5u96/4j0Wd7bebwbpZemdE/88DdjWaH/DLjm11c8EI1aGBYQHHU
 lYI3LTBJ1l4viwp8y5TXi2kaiSyHQkMlxGIqo9H2hs1VioRcVjj3D5xYr
 ugX+VEm/8iGVJmLZe8xUAifCf/GzSPVrcWd/TJff9w8nPYVBPcn+2IcqH
 NnSTjp5cEoX/F92s+Du7FkSChVfeylG0miV0vzJ2DlwELENZtn5gN1nNa A==;
X-CSE-ConnectionGUID: pHbvP09tTeyNPJRd2ekFBQ==
X-CSE-MsgGUID: QAWrucncReWU5W52cSajgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75979234"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75979234"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:53:49 -0700
X-CSE-ConnectionGUID: e881prwtT76zNOZx41fBaQ==
X-CSE-MsgGUID: uB+4/V7xQkeu9hB8FSiBRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225208174"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:53:48 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 1/9] drm/i915/hdmi: Add missing intel_pfit_mode_valid() for
 4:2:0 also modes
Date: Tue, 31 Mar 2026 02:53:31 +0300
Message-ID: <20260330235339.29479-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
References: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
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

intel_hdmi_mode_valid() is calling intel_pfit_mode_valid() only
on the first attempt (4:2:0 for "4:2:0 only" modes, 4:4:4 for
everything else). Add the call also for the "4:2:0 also" modes case
so that we actually know the pipe scaler can actually produce the
4:2:0 output.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 05e898d10a2b..072b0554cc24 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2079,6 +2079,11 @@ intel_hdmi_mode_valid(struct drm_connector *_connector,
 			return status;
 
 		sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+
+		status = intel_pfit_mode_valid(display, mode, sink_format, 0);
+		if (status != MODE_OK)
+			return status;
+
 		status = intel_hdmi_mode_clock_valid(&connector->base, clock, has_hdmi_sink,
 						     sink_format);
 		if (status != MODE_OK)
-- 
2.52.0

