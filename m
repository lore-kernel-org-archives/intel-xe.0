Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EABE78487
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 20:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C995A10E029;
	Wed, 24 Dec 2025 20:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gufrj1jW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3E310E029
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766606653; x=1798142653;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e/S/ostBEPZeEz+d7RlPWHeFXpqQRlksVbFEOT/9xDc=;
 b=gufrj1jW/NarSs/b/Trdty+yARfwwDlv62B+ZHDf/Eme4sT11/L4Gl7Z
 Cfe6IDagBEbXPtQvZE4mLVAgRTkAb2IdvvZDtR1NMf2HeWbAXoLhDGlXK
 wOksz9PPoasWdqhUOpo25yf3ESeypFCTE03skla5YwBIPaiRLHtMWYnO/
 8NOQ0F5ef7k4JAHYR9HmyEk/s1SrK11tV9sNG47teZdZABpVlBpOzAsVA
 rKc+0R1Die4x0ru3ACzTIFFJg8QNInZAMFXxcBphIo+e0hcbg98nZyxZN
 STWmPaCnbi92GSOaLkz3HHYU+Be6mKmVuCLpi+n3eCNkUyGXSYMeUiHq0 w==;
X-CSE-ConnectionGUID: 5VBzzEwjRMiFC0a8XYPfaA==
X-CSE-MsgGUID: UtRFo5VETV+8eBFzVThmxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78743336"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="78743336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 12:04:13 -0800
X-CSE-ConnectionGUID: UIde7L9CQT+3kEluSdi+Vg==
X-CSE-MsgGUID: H+nVcSyeS8S+91BfdH/ziQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="200109129"
Received: from khuang2-desk.gar.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.220.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 12:04:12 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD_3002 DMC v2.28
Date: Wed, 24 Dec 2025 17:03:58 -0300
Message-ID: <20251224200401.47180-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.52.0
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

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 2fb6fec6dc99..bb6d15ed75ae 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -130,7 +130,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
-#define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
+#define XE3LPD_3002_DMC_PATH		"i915/xe3lpd_3002_dmc_ver2_28.bin"
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
-- 
2.52.0

