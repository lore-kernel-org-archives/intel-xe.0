Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3507606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 02:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UUK0ZYwk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0B710E750;
	Tue,  3 Nov 2026 02:18:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9117F10E750
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 02:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793672297; x=1825208297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d8y76Ot/T7OvG6LD5ifyvpkYM2+a1Aa9PTayi8x0m7w=;
 b=UUK0ZYwkXOXPFqs00lN9m6gd5jcrw6awyYYyptVpQYcj7t32KM3M8suz
 5z58e7ddx8/Bfr7W6DIe8A1sCJWM6WPQBOV+ER7I/iDLe7PohIJxHZK1U
 MlBkuc+iGL5jY0M2fs3viIn2xObhiFq0PYn+ZNl4gx/SEmnJqizUspFXa
 gLMg6/1/GHLLZZsIlpRIyWLXgOp27YiLovwc6B66+9OtYdTyW1woWtAEQ
 c2rusJRbbFOgI4ARhai3xb9DAwdbs/pDdiBL0oO38Eli3YumphBbHniiM
 gEpEsbU9jcWe7pVYANpYOE+cj1H1NFkib6kmYGJMs4UoZ0P2L87oApklM A==;
X-CSE-ConnectionGUID: RNzDmY5yTHKEVLdBbsVrIQ==
X-CSE-MsgGUID: MD2MqLmYQfSUl1nbbpmGYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2287133"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2287133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 18:18:12 -0800
X-CSE-ConnectionGUID: qypMA/04TFubv0Jb7lsFmA==
X-CSE-MsgGUID: ExF4gTXkRJCL0xoexFF1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6616069"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2026 18:18:12 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH 1/2] drm/xe/pm: Apply tile workarounds after PCODE
 initialization
Date: Mon,  2 Nov 2026 18:14:17 -0800
Message-ID: <20261103021418.654723-2-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103021418.654723-1-daniel.charles@intel.com>
References: <20261103021418.654723-1-daniel.charles@intel.com>
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

Tile workarounds program SoC registers through MMIO. Wait for PCODE
initialization to complete before applying them during system resume,
since MMIO access may be blocked until SoC initialization completes.

Also apply tile workarounds after PCODE initialization on D3cold runtime
resume, so their register settings are restored after power loss. Keep
both paths ordered before early GT resume.

Fixes: 0d0534750f9d ("drm/xe/wa: Apply tile workarounds at probe/resume")
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 89d64aa6577d1..462357844cb48 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -241,13 +241,13 @@ int xe_pm_resume(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Resuming device\n");
 	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
-	for_each_tile(tile, xe, id)
-		xe_wa_apply_tile_workarounds(tile);
-
 	err = xe_pcode_ready(xe, true);
 	if (err)
 		return err;
 
+	for_each_tile(tile, xe, id)
+		xe_wa_apply_tile_workarounds(tile);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_resume_early(gt);
 
@@ -687,6 +687,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
  */
 int xe_pm_runtime_resume(struct xe_device *xe)
 {
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
 	int err = 0;
@@ -702,6 +703,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		for_each_tile(tile, xe, id)
+			xe_wa_apply_tile_workarounds(tile);
+
 		for_each_gt(gt, xe, id)
 			xe_gt_resume_early(gt);
 
-- 
2.43.0

