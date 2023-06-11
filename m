Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E71C77B7A
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jun 2023 22:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154F10E14B;
	Sun, 11 Jun 2023 22:25:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A9F10E13C
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jun 2023 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686522300; x=1718058300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O8e2Jm+zGBLkBsblPG4murkAiDoQbwf4mviW8dajoJA=;
 b=KE8R3kMeQp/Rlai7i2i/bQrj05XyIMyP5nfOCnRSIEGHieIAUa5yNXLA
 76E+RtxPoxGW4smUefPmb3FWRAqJ3xPSlCYo922jhnc2oowisGs6JTN+E
 ild94wWHL0dfYU7x+9O/4n2YF63ekuOlN9vf5CZpd/UILLiDVpAvwPNvV
 nVKJ0AdBJGj75oFa6V/SFJc1IzGe6s69NoglRc5q/IatgnkaRLfwclDsU
 oHcSglD89+Aeuig+z0JLREG3RWa7TGIeQUPeIXZIBnXE9+hV+k3LTEUbG
 BL0xlDkH6CfGeAZsX37wuLp+p4/hINp4OxWYxl5WAR01sTJDNEx8gbnms g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347552648"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="347552648"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="957778749"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="957778749"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 11 Jun 2023 15:24:44 -0700
Message-Id: <20230611222447.2837573-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611222447.2837573-1-lucas.demarchi@intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe/guc: Fix typo s/enabled/enable/
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix the log message when it fails to enable CT.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 615cc4d4ad69..22bc9ce846db 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -312,7 +312,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	return 0;
 
 err_out:
-	drm_err(&xe->drm, "Failed to enabled CT (%d)\n", err);
+	drm_err(&xe->drm, "Failed to enable CT (%d)\n", err);
 
 	return err;
 }
-- 
2.40.1

