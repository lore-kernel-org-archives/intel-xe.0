Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3F2CD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5182C10E6B0;
	Mon, 15 Jun 2026 20:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipVf6/kw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E2310E6AD;
 Mon, 15 Jun 2026 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555661; x=1813091661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j56RMQuIwNretR9ManZWvpERiE149X8VYifqKz5+/ik=;
 b=ipVf6/kws8KgeyM2DkZFfgQNoYhPi0Duc76473o1khd5F0d0XUKAj/3p
 J5frOtYEgk1/sa1VA8h5jLKIXAyRGqkCW9t6EQPh7jeOg5YWyQ2q2og+L
 4yizA9nKLLyoBrtQnohmT4qeq5FpSBqQLov+OcwjpJQkYCQMNcbolAXcY
 92O3WUGjC/kxXNwkbu2+ihF2rBUQmDBDayy6UsKM8KvgxgERDPQze0kxg
 vE9DqvGhxS6WBE4U/ahWZAg8Dwfrk1t+89YOtFKIAhH3c8KDJgLxRc7Af
 ITZ/hQX39RTHpyDNqHJxCjRQCkoTs6HV53cnRB7ixucGW1s2UyYnVyauk w==;
X-CSE-ConnectionGUID: GvH7x1KlTIm4Yh9C+zl8qw==
X-CSE-MsgGUID: t442MabRTKiz2GtFqEAIjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694587"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694587"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:21 -0700
X-CSE-ConnectionGUID: 1HqwznclQdW2E4N2hLdGOQ==
X-CSE-MsgGUID: x83YQrQgTp2VGvmWBGjtng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="252538528"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:19 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v3 4/7] drm/i915/bw: Extract icl_init_qgv_info()
Date: Mon, 15 Jun 2026 23:33:52 +0300
Message-ID: <20260615203355.218578-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203355.218578-1-vinod.govindapillai@intel.com>
References: <20260615203355.218578-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Simplify the initialization of qgv points info by extracting
the code to initialize the qgv points info from dram info based
on the memory type.

v2: rebase after Ville's refactoring

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 4557de85fade..6649220d81b4 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -246,12 +246,10 @@ static bool is_y_tile(struct intel_display *display)
 	return !HAS_4TILE(display);
 }
 
-static int icl_get_qgv_points(struct intel_display *display,
-			      const struct dram_info *dram_info,
-			      struct intel_qgv_info *qi)
+static int icl_init_qgv_info(struct intel_display *display,
+			     const struct dram_info *dram_info,
+			     struct intel_qgv_info *qi)
 {
-	int i, ret;
-
 	qi->num_qgv_points = dram_info->num_qgv_points;
 	qi->num_psf_points = dram_info->num_psf_gv_points;
 
@@ -323,6 +321,18 @@ static int icl_get_qgv_points(struct intel_display *display,
 		qi->max_numchannels = 1;
 	}
 
+	return 0;
+}
+
+static int icl_get_qgv_points(struct intel_display *display,
+			      const struct dram_info *dram_info,
+			      struct intel_qgv_info *qi)
+{
+	int i, ret;
+
+	if (icl_init_qgv_info(display, dram_info, qi))
+		return -EINVAL;
+
 	if (drm_WARN_ON(display->drm,
 			qi->num_qgv_points > ARRAY_SIZE(qi->points)))
 		qi->num_qgv_points = ARRAY_SIZE(qi->points);
-- 
2.43.0

