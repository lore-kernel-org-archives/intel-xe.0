Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBEAC28B26
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 10:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844D410EB4F;
	Fri,  7 Mar 2025 10:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6K3A58+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1CF10EB49;
 Fri,  7 Mar 2025 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741344774; x=1772880774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VEuzruUgAHJn4jpTWHJ15d6soITmSTRigC0gYYcd8As=;
 b=X6K3A58+ZamyOTbMWZK6HNk4BejhMp3RLt1gJsgpOEvzx/xgnDaAIP8x
 ey3S+tSdPBoaI6VbhfYFVpc7I+yMngb0vNnOzrpK742RGuOnPTaM9rvN4
 zjswir6FesOsytgxRZXbIgIWpQyEaTDV26jftpdvssNu+8POkd8cCyc0L
 mF/Dzhvz8p3WT7m71tlVUSomkIlwUECZalmNz3sKUFlO/f/lVFeVBqo2/
 /h5PgLYfYNh9C2CQcXNJy2hqbfwMIV3TvTsq/LbOLBBy/oSBA3ibW+kP7
 Nu8kirg+TLVOxKaiIE/mNV0HVcvSX3U54wCcsd+wABenIpo8wHFSd2giK w==;
X-CSE-ConnectionGUID: tjpCZH2yR9azfmvnyjVzEw==
X-CSE-MsgGUID: v727+RQlScmQTW2w1aMMIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42301648"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42301648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:52:53 -0800
X-CSE-ConnectionGUID: 1bBo56gFS7mpezxIlpjIDg==
X-CSE-MsgGUID: uyLCMbxnR9SP3oo1Sw0wtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123481572"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.100])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:52:52 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [RFC PATCH 03/11] drm/i915/dmc: Add PIPEDMC_EVT_CTL register
 definition
Date: Fri,  7 Mar 2025 12:52:29 +0200
Message-ID: <20250307105237.2909849-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307105237.2909849-1-jouni.hogander@intel.com>
References: <20250307105237.2909849-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

To implement workaround for underrun on idle PSR HW issue (Wa_16025596647)
we need PIPEDMC_EVT_CTL_4 register. Add PIPEDMC_EVT_CTL_4 register
definitions.

Bspec: 67576

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index 1bf446f96a10..2f1e3cb1a247 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -21,6 +21,12 @@
 #define MTL_PIPEDMC_CONTROL		_MMIO(0x45250)
 #define  PIPEDMC_ENABLE_MTL(pipe)	REG_BIT(((pipe) - PIPE_A) * 4)
 
+#define _MTL_PIPEDMC_EVT_CTL_4_A	0x5f044
+#define _MTL_PIPEDMC_EVT_CTL_4_B	0x5f444
+#define MTL_PIPEDMC_EVT_CTL_4(pipe)	_MMIO_PIPE(pipe,		\
+						   _MTL_PIPEDMC_EVT_CTL_4_A, \
+						   _MTL_PIPEDMC_EVT_CTL_4_B)
+
 #define _ADLP_PIPEDMC_REG_MMIO_BASE_A	0x5f000
 #define _TGL_PIPEDMC_REG_MMIO_BASE_A	0x92000
 
-- 
2.43.0

