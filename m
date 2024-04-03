Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD57CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 10:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533BC1129C6;
	Wed,  3 Apr 2024 10:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdwAR0KR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5B9112826;
 Wed,  3 Apr 2024 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712141508; x=1743677508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFSyzKrDtDqDcvfqRCvLYsCntufo5yT5P8lczjLoZrs=;
 b=hdwAR0KRS7vh0FiTLTRZq5WgCZgXS186tnX1+h/IQM5+0ZaCOc/dPqCe
 WR9lTeDWC+IXvYO+rtlN6um3yFQt1KFIj8mVzbaA3y0tcBIg6k0lAskcl
 sShsUlXJbNJdvwsSwHr1LfafalvD+qhuha4boY6EHWon5nGdXm7q0MYVF
 2WuO+5dM+elLtRBr6/ohPUZTWMxT+hWebA3M50rGLm8Y4rekxNDV/MNzV
 99d5ea/8ZHF4Iu9Y3U2ERauqhSPvadYEIJeG3PSTHLlaXfnQ9zSbiFq9Q
 wNWo/iZpOwWvz3rXbgAD3+UQeGq4CCKA6W9CAfcKntvZ57q5rqbKaxh2G Q==;
X-CSE-ConnectionGUID: NzrRh1vJRU2tahH+xZ7AcQ==
X-CSE-MsgGUID: zNvmVC7RR7aMSQ8CD5eLMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212129"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:51:24 -0700
X-CSE-ConnectionGUID: LKNmCNTNQ72PQlXs2X7DRQ==
X-CSE-MsgGUID: p6S7You6TkSlPFQcMaUMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18493353"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:51:22 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Clint Taylor <clinton.a.taylor@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 06/25] drm/i915/xe2hpd: Initial cdclk table
Date: Wed,  3 Apr 2024 16:21:04 +0530
Message-Id: <20240403105123.1327669-7-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403105123.1327669-1-balasubramani.vivekanandan@intel.com>
References: <20240403105123.1327669-1-balasubramani.vivekanandan@intel.com>
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

From: Clint Taylor <clinton.a.taylor@intel.com>

Add Xe2_HPD specific CDCLK table and use MTL Funcs.

Bspec: 65243
Cc: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 31aaa9780dfc..da16c308670f 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1444,6 +1444,14 @@ static const struct intel_cdclk_vals xe2lpd_cdclk_table[] = {
 	{}
 };
 
+/*
+ * Xe2_HPD always uses the minimal cdclk table from Wa_15015413771
+ */
+static const struct intel_cdclk_vals xe2hpd_cdclk_table[] = {
+	{ .refclk = 38400, .cdclk = 652800, .ratio = 34, .waveform = 0xffff },
+	{}
+};
+
 static const int cdclk_squash_len = 16;
 
 static int cdclk_squash_divider(u16 waveform)
@@ -3768,6 +3776,9 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 	if (DISPLAY_VER(dev_priv) >= 20) {
 		dev_priv->display.funcs.cdclk = &rplu_cdclk_funcs;
 		dev_priv->display.cdclk.table = xe2lpd_cdclk_table;
+	} else if (DISPLAY_VER_FULL(dev_priv) >= IP_VER(14, 1)) {
+		dev_priv->display.funcs.cdclk = &rplu_cdclk_funcs;
+		dev_priv->display.cdclk.table = xe2hpd_cdclk_table;
 	} else if (DISPLAY_VER(dev_priv) >= 14) {
 		dev_priv->display.funcs.cdclk = &rplu_cdclk_funcs;
 		dev_priv->display.cdclk.table = mtl_cdclk_table;
-- 
2.25.1

