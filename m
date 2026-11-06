Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E327606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sj6Lo7hE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5154410E3CD;
	Fri,  6 Nov 2026 07:20:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE0810E3CD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793949618; x=1825485618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c1K2Sx2CqXH5GeXdgmBkGBNt3RT4EZzIJVHwJx56Wqo=;
 b=Sj6Lo7hERQt1gip2ZROWYQj9DGYtbtG41fWH15rZcDOYe1zk2NY9hAbb
 a9F2AgOoo36+XdFnOvMTp4J0C93l6v4sPSSSTvahLRH1Ubn213NykuFnV
 6bbk3MYHOYIZa7XA03Ws8QI49Sj4Men7aQcMBbAxK5XhPrROPaKdP/JtU
 GNEeXafn0oU2xgjIUak4aKQUazPrjaVpJPHPGx78NEsHTKxh0Y5Synb06
 gWniUo2wND7c1tYMsTuXuHG7VckM/RnRpzH3xAEEXOLG/S118lnaXkJD5
 O0kXpIeVM+xA//0CkWddBIMjNwvAhiDYFBD9oyKZwpIJJ/vGbTRvADnNV Q==;
X-CSE-ConnectionGUID: ga4GgQt8SgmOd1M91aCIsA==
X-CSE-MsgGUID: 9xk7oi0nQEqHA89++90YmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659347"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:18 -0800
X-CSE-ConnectionGUID: ZloO33ejRNOwEjYXlWy0JA==
X-CSE-MsgGUID: /vYanDnUR5CeNkglqko+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7549042"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:15 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: [PATCH v4 4/8] drm/xe/ras: Treat non-fatal PCIe errors as recovered
Date: Fri,  6 Nov 2026 12:49:49 +0530
Message-ID: <20261106071944.2693854-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261106071944.2693854-10-riana.tauro@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On systems lacking RAS capability, only PCIe errors are reported, via
AER, not device errors. Non-fatal PCIe errors reported at the Upstream
Switch Port (USP) have no impact on link or device state, so treat
them as recovered without requiring a secondary bus reset (SBR).

Fixes: 25913a062cd4 ("drm/xe/xe_ras: Add support for uncorrectable core-compute errors")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..cd753c82b0ff 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -830,7 +830,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 	}
 
 	if (!xe->info.has_sysctrl)
-		return XE_RAS_RECOVERY_ACTION_RESET;
+		return XE_RAS_RECOVERY_ACTION_RECOVERED;
 
 	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
 	/* Default action */
-- 
2.47.1

