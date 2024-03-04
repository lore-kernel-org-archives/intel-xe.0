Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2480BC48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D385B112474;
	Mon,  4 Mar 2024 18:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdOpbyrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8B112474;
 Mon,  4 Mar 2024 18:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709577071; x=1741113071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFAysJG0OV9fjUD0Q99nlqDT0ZX5ckS0Zo8Gq9nQu3U=;
 b=BdOpbyrXyWu9CaUUN1lTo5XiHMaFe4O4Y6OrySoZhpAF4W4ZHZDemtVy
 +1NqP4QwdmqGDdQtIov0p6/4mNTn8qvbg6YX1lGCpw1UskgagQcAQEcpp
 v0OT67n3eP1PepNtXJV4oaE2DxGAhPbmIIc4OOhnaBiuG3xG0fgZ3TWFk
 Eacyf9BkOZeVYjD1okGFQoDecCdJGrWirGMt14WuPmrBlbn3Q53dV7bca
 O8XJ1QFWEjYCanjShmmmhctCaXF9pE7Ch/80dQSY4NJMKuv443I0z62S/
 1eApRSkYWBDkdBc+Ro8sbTgypgpYvyfDcchr5jDypJp4J5c9CxqjhuJYc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3943517"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3943517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:31:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="13756462"
Received: from ticela-or-128.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.33.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:31:09 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, vinod.govindapillai@intel.com,
 stanislav.lisovskiy@intel.com, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/8] drm/i915/cdclk: Only compute squash waveform when
 necessary
Date: Mon,  4 Mar 2024 15:30:22 -0300
Message-ID: <20240304183028.195057-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304183028.195057-1-gustavo.sousa@intel.com>
References: <20240304183028.195057-1-gustavo.sousa@intel.com>
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

It is no use computing the squash waveform if we are not going to use
it. Move the call to cdclk_squash_waveform() inside the block guarded by
HAS_CDCLK_SQUASH(dev_priv).

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index bf84bf27213f..cdf3ae766f9e 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2023,10 +2023,11 @@ static void _bxt_set_cdclk(struct drm_i915_private *dev_priv,
 	} else
 		bxt_cdclk_pll_update(dev_priv, vco);
 
-	waveform = cdclk_squash_waveform(dev_priv, cdclk);
+	if (HAS_CDCLK_SQUASH(dev_priv)) {
+		waveform = cdclk_squash_waveform(dev_priv, cdclk);
 
-	if (HAS_CDCLK_SQUASH(dev_priv))
 		dg2_cdclk_squash_program(dev_priv, waveform);
+	}
 
 	intel_de_write(dev_priv, CDCLK_CTL, bxt_cdclk_ctl(dev_priv, cdclk_config, pipe));
 
-- 
2.44.0

