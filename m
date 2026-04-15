Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA78FA0C22
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 03:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBF810E66E;
	Wed, 15 Apr 2026 03:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1uUBDAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C7410E66F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776224137; x=1807760137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lSLDk9tEThgya+GPLZ0z2c+BkvQjopfEDB8njd9SI9c=;
 b=n1uUBDASw8pnJiPzJDIFfvaFxtt2gf9+68yVtgMY+VaV1Jsitbic6dMa
 Xm0F79zABselxSzMAZg2MP5/gtjrIVt5FJ7AQylhTNwGS3fZWQMdTgvrX
 C2QfqqnfnwdaQlTjDPHw+eBj92xtswfkZfTKbioXsdt0vXT5M9Kp9B4Kq
 O6iBa5ou7mghU0ENgSp0hgiPvMaq3YB+YavBqSXlfDw1q+2Z+pM6Oksnm
 PNKTrpCyBmjXf4em/u9rwgB8LsRb313Ov6PkjwDooJeNB9hlBLtiZ+dLj
 lut8gZexVjrret891YyRPqvXtvACIXv1AWYrsl2f3WHKvMyS7Fd6rW9qB g==;
X-CSE-ConnectionGUID: P0llILrjRK+VOiQEukLiKQ==
X-CSE-MsgGUID: Cm45sbX7RUe7jTb+yeBUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76225343"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76225343"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
X-CSE-ConnectionGUID: OyQqBXTATNWpxgi1pPtjUA==
X-CSE-MsgGUID: zlm8jZBLRDuAo06l2t0a0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="232033287"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/3] drm/xe/oa: Don't whitelist OA status registers
Date: Tue, 14 Apr 2026 20:35:30 -0700
Message-ID: <20260415033532.789954-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260415033532.789954-1-ashutosh.dixit@intel.com>
References: <20260415033532.789954-1-ashutosh.dixit@intel.com>
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

OA status registers are not used by UMD's and do not need to be
whitelisted.

Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 8cc313182968d..a4124f00c467f 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -90,27 +90,23 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
-#define WHITELIST_OA_MMIO_TRG(trg, status, head) \
+#define WHITELIST_OA_MMIO_TRG(trg, head) \
 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
 	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
+	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OAHEADPTR)
 
 #define WHITELIST_OAM_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
 	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_0_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
 	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_1_BASE_ADJ), \
-			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
 
 #define WHITELIST_OA_MERT_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_HEAD_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-- 
2.48.1

