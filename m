Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B22606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cLwFtiZ8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6699B10E4C1;
	Thu, 12 Nov 2026 06:07:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3572410E4C1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794463647; x=1825999647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c1K2Sx2CqXH5GeXdgmBkGBNt3RT4EZzIJVHwJx56Wqo=;
 b=cLwFtiZ8sDy9kKcIZlY7VE8uAw0FduqSAshTc8kIyItZdGxLq0jqWqlN
 DxejZ/p8V18UTBPtSXaWKtD/n3BfYFVw+pkhJINg2v6yq0iYGEuF63Zuc
 8092XHy/QX8SeZsaw03Xz4kkxYq/5f7dm8uErBypr4mZYpHOMj4WCxcIG
 fuLrqSCmTyTBE30T6u4bcfNsqBp1vcMbSDikPkO1JhKDjkXDJCCmXFD3W
 XVoZkr0xp6HJeE/J2V6nPSvmawa2ByOnBu7DrNjTplkrmmBAg8r8GejHd
 PEbRIsqf4yFWpyhUP++y/YuUQMcERQyKUJ3WgX/iTXUz32czfKEQgSFg5 g==;
X-CSE-ConnectionGUID: lPfe0D3dTHephRxd2zLRWQ==
X-CSE-MsgGUID: l+O0yXwNS2OT7eInaXfNIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3265009"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3265009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:27 -0800
X-CSE-ConnectionGUID: drkaRgYsTP6+tcOEIvRKCg==
X-CSE-MsgGUID: T4FVMR8BQYOFIeOnei7Z2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8576232"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:24 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v5 4/8] drm/xe/ras: Treat non-fatal PCIe errors as recovered
Date: Thu, 12 Nov 2026 11:37:06 +0530
Message-ID: <20261112060701.3327125-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112060701.3327125-10-riana.tauro@intel.com>
References: <20261112060701.3327125-10-riana.tauro@intel.com>
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

