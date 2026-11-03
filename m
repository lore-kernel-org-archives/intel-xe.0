Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A11606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lKJJWnoq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE7810F367;
	Tue,  3 Nov 2026 06:10:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0968510F367
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686194; x=1825222194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AiGTF1ghTJCgCnnr4f9L5lk82bft7QOaaw3aRtjoRiw=;
 b=lKJJWnoqbTDWJxU4ik3TOxPtsbB4OijJAb6mATtdzFwCqMIVdlXN5eKs
 zYcPV3VzjS/ZlJDVYWbMVE9dDhStgdE83lPUX+Kc/NgNuQ29xpEAxjUyP
 gPekAgodHfHq1sq30cRU+8r3FaQs/qRBd3mKNfyXTCEz5W5RzT1FysBsk
 xHadJCKGiB5w4a361JN5plWYvyl6Z4uByU7f9QnmO11AcUKRsmGnkIREw
 sP5y65v/j7tLxxoznWUYlhSKxsurzaP15vj/VZdAX7LXOkOj91TGB3OU1
 55xVc0YJVsLrAC+wEAR6bFzi9r55wWkwx4HSn4xMtjA7xT5Y5tHoQOtq9 g==;
X-CSE-ConnectionGUID: N0swZWSST0e1XpvvR5HwRg==
X-CSE-MsgGUID: MM2nJNssSaS32R9L0Oxjgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276703"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:54 -0800
X-CSE-ConnectionGUID: jeWrvV4GRJC7fgs/4kzzHA==
X-CSE-MsgGUID: wCE2rn9tTqus+312+PuJDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446347"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:51 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v3 3/7] drm/xe/ras: Treat non-fatal PCIe errors as recovered
Date: Tue,  3 Nov 2026 11:39:33 +0530
Message-ID: <20261103060929.1586783-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261103060929.1586783-9-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
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

