Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511FDCD98D2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 01:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BD010ED62;
	Wed, 17 Jun 2026 01:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgZq4sB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1A410ED9D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 01:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781661268; x=1813197268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PiRREBlJS9E/153pSI5ISt3DMEPRQxvYtqvnXOe5z3M=;
 b=mgZq4sB+bppKWFUjsHhcM+HW9O4HEBonq+thxcNW7Fi6nQatuY4ppetJ
 Qmr4thw7WYWYOwogmx4xUKTKDFVlYJ6ciJr5SR/omaFAfZ15yHTywC4y7
 A05DsEfDT4aKgo98zxeOwwYkhy/ddIXsxhZ8ccduRIihhdsy61hYklgWI
 E5SXI2wgbk7QpuQsS8Z+QPb+e1igjDWMorgU0eSSUrM7Lxnte9SYTaieQ
 N7IBm3HqXzrHzQJlu9QfcuCI/KpZf3RojXelNqihKjxVwH01ICoBFCgAm
 dvfCXp4/eKKYEABMQVMAFscmdB9/bCa2iRZ6bihYG/pYl0Iq3LNdFuBCu g==;
X-CSE-ConnectionGUID: z3XeGzC1TAS72/TadSxA4w==
X-CSE-MsgGUID: erHIxR+MRGqR9X6/HKoGCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82456699"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82456699"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
X-CSE-ConnectionGUID: gAEEwmGQTee3qss07jrzow==
X-CSE-MsgGUID: H78j7Rq8RDax2cXyd8Ms2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246801638"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 4/4] drm/xe/oa: Stop whitelisting OA status register
Date: Tue, 16 Jun 2026 18:54:22 -0700
Message-ID: <20260617015422.226177-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617015422.226177-1-ashutosh.dixit@intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
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

We are now providing OA status through DRM_XE_OBSERVATION_IOCTL_STATUS,
even for mmap. So we don't need to whitelist OA status register and we can
save one nonpriv slot per OA unit.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 880079473c26b..c07e0a38c0a4c 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -104,27 +104,23 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
-#define WHITELIST_OA_MMIO_TRG(trg, status, tail_buf) \
+#define WHITELIST_OA_MMIO_TRG(trg, tail_buf) \
 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
 	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
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
-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_TAIL_POINTER)
+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_TAIL_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-- 
2.54.0

