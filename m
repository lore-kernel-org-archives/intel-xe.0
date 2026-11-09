Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F39B606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RXbn50IO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDAF10F1D6;
	Mon,  9 Nov 2026 11:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1564B10F1E1
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794224767; x=1825760767;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RqbbpOQkOLSwZZ3fe+8wNOHaiXv0m/HWBdt3wAVq7wI=;
 b=RXbn50IOuC6ul7na48CLkTdTADAdnfLxRCD5ugRfVt7yzOyVGJU459Ua
 1zzoESRMAv3e6p2rzi0uxF8Tu5DpZfDRGVU1a9OXC9DhNn+mkO9sAnR2d
 W3AmAqE+p3Rt8QFCDaW10tuY9/D6ZZ9x3dV10hcB1JbptfxQtAZ9SoA1S
 J85Q5UJHsJAihxPjalENGhxZOmlcy+86XaaLSFqLh1+u8qMgtSF1rdkCO
 JDWskapz1YHwTQTlMh8H78iEi+2RtktmQOqAjUoH4SDiHrjle2XUoCocB
 56gCWDqhYvs43G8cq9EWth9MkbUTf4nThIRsTojsMbS/jTSf/dJsIboKm g==;
X-CSE-ConnectionGUID: GLSFVMmkQiCN3t0Ig/GNcQ==
X-CSE-MsgGUID: anV/vCaSSx+R0NIiexOTBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2944064"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2944064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:07 -0800
X-CSE-ConnectionGUID: LleliCFtQb+vGaNg8cImBQ==
X-CSE-MsgGUID: gBFaBm18TZKfomALIqfwLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8174663"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Extract xe_gu_misc_irq_{postinstall,reset}()
Date: Mon,  9 Nov 2026 13:45:52 +0200
Message-ID: <20261109114554.19597-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make the GU_MISC interrupt setup a bit nicer by extracting
it to its own functions.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 320fc64e7d4f..7c39d7a3cf8a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -645,6 +645,12 @@ static void vf_irq_reset(struct xe_device *xe)
 	}
 }
 
+static void xe_gu_misc_irq_reset(struct xe_device *xe)
+{
+	mask_and_disable(xe_device_get_root_tile(xe),
+			 GU_MISC_IRQ_OFFSET);
+}
+
 static void xe_irq_reset(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -665,8 +671,7 @@ static void xe_irq_reset(struct xe_device *xe)
 			xelp_irq_reset(tile);
 	}
 
-	tile = xe_device_get_root_tile(xe);
-	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
+	xe_gu_misc_irq_reset(xe);
 	xe_display_irq_reset(xe);
 	xe_i2c_irq_reset(xe);
 
@@ -696,6 +701,16 @@ static void vf_irq_postinstall(struct xe_device *xe)
 		xe_assert(xe, xe_device_has_memirq(xe));
 }
 
+static void xe_gu_misc_irq_postinstall(struct xe_device *xe)
+{
+	/*
+	 * ASLE backlight operations are reported via GUnit GSE interrupts
+	 * on the root tile.
+	 */
+	unmask_and_enable(xe_device_get_root_tile(xe),
+			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
+}
+
 static void xe_irq_postinstall(struct xe_device *xe)
 {
 	if (IS_SRIOV_VF(xe))
@@ -711,13 +726,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
 
 	xe_display_irq_postinstall(xe);
 	xe_i2c_irq_postinstall(xe);
-
-	/*
-	 * ASLE backlight operations are reported via GUnit GSE interrupts
-	 * on the root tile.
-	 */
-	unmask_and_enable(xe_device_get_root_tile(xe),
-			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
+	xe_gu_misc_irq_postinstall(xe);
 
 	/* Enable top-level interrupts */
 	if (GRAPHICS_VERx100(xe) >= 1210)
-- 
2.56.0

