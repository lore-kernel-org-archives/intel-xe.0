Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA3C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 22:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514D10E2A9;
	Wed, 19 Jun 2024 22:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8j895xO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F75510E2A9
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 22:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718837786; x=1750373786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cWnt3j8nomQS9VMPVLLVNXMLzBpMjGZ02Hk3r2iPyfo=;
 b=M8j895xOwcI2EqlNFzQxzJmcJOISy78z+CdfJfCUNYWqTxlxodGgdfis
 ISgrbV/8eiIum48IjasN0i/HrmAH/fIYhOuGLqlxkEZBvZ0F4BqjuCT2h
 2crNUbX/QspBRona9qCZ8vsknz0jk3hsgUk6A/HaIuT3WuiQHTmMZ9pKM
 Ej306BM0QFD3DNrMxPUPI1IgczjL/sYn1+ZX7NPPAyZ8WHmrNIuBSOax/
 MvPWs17dRdQuuZu8gkPJGlNwdjeBCwsVSoOHF4/cHBJ1XCD0qeq6b74UG
 UtWK3/VZbaiM0cPZ5bIWLOjZSQCtEtgsbPSuTFmopUZ6vpzqzWugMd5Ml Q==;
X-CSE-ConnectionGUID: yKROmFezQ3SP57RJ5u0woA==
X-CSE-MsgGUID: JFwiMrfwRf2v/tmRE1tMLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="18706804"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="18706804"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 15:56:25 -0700
X-CSE-ConnectionGUID: QA9G2CkkTo2WuzplZmF08w==
X-CSE-MsgGUID: RvTAdBp5SbOf3KAEMr+LHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46505142"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 15:56:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/oa: Remove WARN_ON's for unsupported configurations
Date: Wed, 19 Jun 2024 15:56:17 -0700
Message-ID: <20240619225617.3465899-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

The OA ioctl's already have drm_dbg's which are sufficient to tell the user
that OA is not supported on unsupported configurations (execlist mode and
platform gen < 12). Having additional WARN_ON's for these during driver
probe create unnecessary noise. Just remove these WARN_ON's.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 34206e0b6a08..5093a89a31f1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2382,7 +2382,7 @@ int xe_oa_init(struct xe_device *xe)
 	int ret;
 
 	/* Support OA only with GuC submission and Gen12+ */
-	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
+	if (!xe_device_uc_enabled(xe) || GRAPHICS_VER(xe) < 12)
 		return 0;
 
 	oa->xe = xe;
-- 
2.41.0

