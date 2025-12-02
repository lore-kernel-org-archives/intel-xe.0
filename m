Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71FFD11701
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7511410E516;
	Tue,  2 Dec 2025 02:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Opl5QK2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8E910E512
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764643880; x=1796179880;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1WaX3PheUWBeWmQzv+Ufq82PuTo2BZimn13OtUr/Jek=;
 b=Opl5QK2dRG0LTllaGb7UzU7d4Uur7yO1JQKNc80XmsZTW44biYilWc+3
 rhEK2HUXtFzWMsZfeOsZW+xbe3dwkyeCxjf1J9qxo6oIdyFKZ8sfJzhYf
 1EmPIjuebv+RaVGwNETRBsORlSn6AG9wumGXjGyPpleOi0lc/oSsBzyWP
 NTUMEj7Akgbck6GyGEvXlzoO7WA69f0iBso0Q0rVheDOAXkU4rHyj1aJ9
 NZodOMNbCha/6/axQgasbM2bAGJdgHaR1i4WdJaQ89NL9rrzwyBICICkI
 Me3ldSG+p1oCJUSmLAZIjUvN7IcoVw/Ljs37Y4MQkQopNeZCKapXTMLG2 A==;
X-CSE-ConnectionGUID: +xpyCJ9mRtqzaYsqmacmFQ==
X-CSE-MsgGUID: CvtO1Gr7SjGZj4xHowCaUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66635558"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66635558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
X-CSE-ConnectionGUID: 8FCr/Jp4Qum968gqE6PhzQ==
X-CSE-MsgGUID: jLa4kqlOS9ya9vaeSHTzqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194077388"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/5] drm/xe/rtp: Refactor OAG MMIO trigger register
 whitelisting
Date: Mon,  1 Dec 2025 18:51:14 -0800
Message-ID: <20251202025115.373546-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202025115.373546-1-ashutosh.dixit@intel.com>
References: <20251202025115.373546-1-ashutosh.dixit@intel.com>
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

Minor refactor of OAG MMIO trigger register whitelisting for code reuse
with OAM MMIO trigger register whitelisting.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 41 +++++++++++++--------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 7ca360b2c20d6..e8e47aa16a5df 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -67,28 +67,6 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
 	},
-	{ XE_RTP_NAME("oa_reg_render"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
-			 WHITELIST(OAG_OASTATUS,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
-			 WHITELIST(OAG_OAHEADPTR,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
-				   RING_FORCE_TO_NONPRIV_RANGE_4))
-	},
-	{ XE_RTP_NAME("oa_reg_compute"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-		       ENGINE_CLASS(COMPUTE)),
-	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
-			 WHITELIST(OAG_OASTATUS,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
-			 WHITELIST(OAG_OAHEADPTR,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
-				   RING_FORCE_TO_NONPRIV_RANGE_4))
-	},
 	{ XE_RTP_NAME("14024997852"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
@@ -96,6 +74,25 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 			 WHITELIST(VFLSKPD,
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
+
+#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
+	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
+	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
+	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
+
+#define WHITELIST_OAG_MMIO_TRG \
+	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
+
+	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
+	},
+	{ XE_RTP_NAME("oag_mmio_trg_ccs"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(COMPUTE)),
+	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
+	},
 };
 
 static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
-- 
2.48.1

