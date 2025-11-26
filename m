Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CED1037A
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 03:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BFD10E506;
	Wed, 26 Nov 2025 03:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xv+kLR1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84C310E4FF
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129146; x=1795665146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kiU1Z+ZIZJYwFrf67FvgOuzq9oTDCv89U/mRUzGpZNk=;
 b=Xv+kLR1TlOexwVwKxFcSFUPpxMb4oHyguYuhQPOARPwOY7w4L6hSKepN
 8inQqqsuFS9QeBZZUCs58W71T8hVRopsQ/bKdFNU3xNxOt0KFGee5hyhl
 Sgc6IDxQxCcHLu58/jD41I6YJ4wWJ+DM+Xgm7ypCuDVwUi+hkVsgf7Vvi
 +SNiC3QWu+3wQlBMvLXAfKpnyfvm4IMIsOgDRH8w7jTHSbVSw/AND6csB
 psHNQxXyoIFskyBbk4UrHc58PqFJOosaLnQRfSL0kskYmwKkYcTGnVavT
 Ls5G8l0/a5/R3t/9qYD9ggmNKcAUbWBu2OrXQ7fL8bgLm8wFFR6ZEOfGX Q==;
X-CSE-ConnectionGUID: YhTRbH1KTz+ySnj2YMFKJA==
X-CSE-MsgGUID: 9unc7M8VSauq42Pqu4bjEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76778737"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76778737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
X-CSE-ConnectionGUID: ZyNt0s/pSdOInFgEqAcQsQ==
X-CSE-MsgGUID: xgYCAhoQQUOAs/4mKzrnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193260131"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 4/5] drm/xe/rtp: Refactor OAG MMIO trigger register
 whitelisting
Date: Tue, 25 Nov 2025 19:52:19 -0800
Message-ID: <20251126035220.13089-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126035220.13089-1-ashutosh.dixit@intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
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

