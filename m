Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B757606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fsm/rPWf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5283910EA7C;
	Mon, 26 Oct 2026 06:05:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89A910EA8C
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994732; x=1824530732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zLlpbss3uGEDK41ReWqS1YvkAHRLVGbTIbxN7pzfil8=;
 b=fsm/rPWfBrzE+iEZNHfR0vIQ/PnXM8F3qTN8fnAO2gohqDbJVa84kcJC
 bNOV73/JPq7PV7nWsrIeNQR7lSb86xlyYhgcTQwh4WOR6EpF8rHiyLJwt
 29DjOPXmNwOS/nHLxjk2SGCJe5sOYHKxkIGZl25TE5hEjp4xrFmdVjo5m
 BrURcZ00Ac2tNXtglsXOgua1NlwwWmZ+fjyY4ehUdWmxZE9sSC9wCnx5O
 38QgBQg7tobtrR0REkubNa0DhaetNRNK/ZHEWL+OXUtuR8rROEMAbQ/a5
 zD95nSiG321vzt8mpP+kymB3pBfBzOHC5gnFeeS7qBxjEUjBIuoS+u0Sx w==;
X-CSE-ConnectionGUID: ARgBDRnoSNiVpWbCdeatbw==
X-CSE-MsgGUID: /Rj6VPqpQwKPaA+4umbQFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531033"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:32 -0700
X-CSE-ConnectionGUID: XTOEDx5oQtayGkbD3Ksf9g==
X-CSE-MsgGUID: 284gAHxPTm6WjB17olodEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557332"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:29 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 5/9] drm/xe/ras: Treat non-fatal PCIe errors as recovered
Date: Mon, 26 Oct 2026 11:35:04 +0530
Message-ID: <20261026060459.771448-16-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
---
 drivers/gpu/drm/xe/xe_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index e6a0ee468b17..2b1a7cb01b0d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -747,7 +747,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 	}
 
 	if (!xe->info.has_sysctrl)
-		return XE_RAS_RECOVERY_ACTION_RESET;
+		return XE_RAS_RECOVERY_ACTION_RECOVERED;
 
 	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
 	/* Default action */
-- 
2.47.1

