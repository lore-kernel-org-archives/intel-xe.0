Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3942C52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606F10EA64;
	Sat, 10 Aug 2024 01:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5bMDeuu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8010EA59
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eTFwaRsmiOx9rM8pjF7grRgJwMyQNr0J8/2gYIB+xXI=;
 b=l5bMDeuuUQqtfaG5iGyvDBmUxM0C2mFAqZiohMHRV7FWmKVSUqNrDsuV
 U0sJocerQw5FzpT5kk1MBDOgcK8viLNyNl86fC5G9yVXz8OnEhWtInK45
 SPvupQmrFyjxxLSXu2d239GggfBgv3hjsyBicQ8qYDPCSmsdA6TxruO4y
 QYQHMFMA0YbjLYkUvQALbGWZjS0vp6DLZIbhC8lYQxoEyXSKwEYnKspdt
 OrSjGrB2arQ3/p+3Y9c6bn8mPXFcH4FjuKN7raw3dBp//uz+a+/gw8dV3
 X+PHacC085pK4cigJ5i4oRZHPcrFIzAqsNVG04YxVjeyeN+5NlKZtTymR Q==;
X-CSE-ConnectionGUID: wTcecYrvRZuRv5drYMhLVA==
X-CSE-MsgGUID: hDetqp1jR9+6tuyGv/GcQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420036"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:54 -0700
X-CSE-ConnectionGUID: UC/k1x9RRg+WmZXt3s64qQ==
X-CSE-MsgGUID: LpcDrABhTka/4wvXErAzBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813390"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/11] drm/xe: Move HuC init before GuC init
Date: Fri,  9 Aug 2024 18:55:43 -0700
Message-Id: <20240810015544.3443258-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

The GuC fini, also fini the HuC so move HuC init first.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index a3786020838b..732d57875701 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -36,6 +36,10 @@ int xe_uc_init(struct xe_uc *uc)
 {
 	int ret;
 
+	ret = xe_huc_init(&uc->huc);
+	if (ret)
+		goto err;
+
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
@@ -44,10 +48,6 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
-	ret = xe_huc_init(&uc->huc);
-	if (ret)
-		goto err;
-
 	ret = xe_gsc_init(&uc->gsc);
 	if (ret)
 		goto err;
-- 
2.34.1

