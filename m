Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C31E8FDA3
	for <intel-xe@archiver.kernel.org>; Fri, 26 Dec 2025 13:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEF310E1C7;
	Fri, 26 Dec 2025 13:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJd0qhdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A587610E1C7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Dec 2025 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766756052; x=1798292052;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e/S/ostBEPZeEz+d7RlPWHeFXpqQRlksVbFEOT/9xDc=;
 b=XJd0qhdpC60jkn1HOdqVdrRhEjqC+6tHzrrSLvzx9MOiNWxWfuxwdaZy
 H90seQgC4gzGmwBOG7fQWkPDgZQycqLiTeBoAJBi3mcbJN8gFo2fVEgoS
 N0a3q76tKe3l4T8V2aPermS4FV4EXFusu0Z+KKrDb114e3OduJ2tsQQF3
 WgDuVzwQYITlxOI0RMTk4M/+4sUCCc6ZaDPsyLJZl4RzpgNZQx5WxMPiM
 94scIlg37BLGDKYwXW+2dPUOYbzsmYc3sVMbx52BcVNYL5qiIowf0F/95
 rzmJk9jjh7WVirh7VjUDspD6ZUyvIbcRXregtEl27VJwgi1hWn39TXNmA w==;
X-CSE-ConnectionGUID: N4qrqkyISfu03WBtmkM5QQ==
X-CSE-MsgGUID: t6NjHLi9TYuzCijsgW6rsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68394935"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; d="scan'208";a="68394935"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2025 05:34:12 -0800
X-CSE-ConnectionGUID: h74vMGTKQlCb2FGHVSBmJQ==
X-CSE-MsgGUID: jLwo25W6Qza3zvRr50nOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; d="scan'208";a="200032374"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.124.220.241])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2025 05:34:11 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD_3002 DMC v2.28
Date: Fri, 26 Dec 2025 10:28:24 -0300
Message-ID: <20251226133354.21333-1-gustavo.sousa@intel.com>
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

