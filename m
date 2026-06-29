Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFB3C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 17:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A9310E9D6;
	Mon, 29 Jun 2026 17:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+km/ekZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE910E9D6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782754000; x=1814290000;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RKmWkyeOptxT3U5921ln9GSjbBSNwOgTg9JZRmEopBk=;
 b=a+km/ekZpnpOqQkynlpI4W/bP/syn0x9Hk0extgJjnlw5cZpGmjyoOGh
 /LUYzaMR/yIBA+sBkBjW+ggXvhwtln2oTfIX3NrwYDPjxON/leyS4Ge8d
 Ood1tjofPKdqWMYRqVimsQOezEh+bUe+sSfdac9jlSKUJihndgWNqU0eB
 wnJIyjiNrOkqvGczEX5kf9N6SOvE5b6YtdbZoROirJKnrhP/cDFYQqGvE
 tOw1bHTDsCqaJAECx7d9UfQfyIEhdV75vEDgopIfHRY800xaHUGzURGfT
 /G3HA6lZYK/eqUNQh25t+1GWzXxBf6Pw6R9vaJL6OaxKp/OaYa37MT0OQ Q==;
X-CSE-ConnectionGUID: sq5ZiAi8Qq2di822dG11Bg==
X-CSE-MsgGUID: 1Msbx2GkR9mkvwknrgCKWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83651976"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="83651976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 10:26:39 -0700
X-CSE-ConnectionGUID: TMKZo36oR22dkPekmPnAGQ==
X-CSE-MsgGUID: pgCXxcWvRZWPumvH81/ugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="249393153"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 10:26:39 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/oa: Fix offset alignment for MERT
 WHITELIST_OA_MERT_MMIO_TRG
Date: Mon, 29 Jun 2026 10:26:34 -0700
Message-ID: <20260629172634.1100983-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

'head' argument for WHITELIST_OA_MERT_MMIO_TRG was previously wrong (not
multiple of 16). Fix this.

Fixes: ec02e49f21bc ("drm/xe/rtp: Whitelist OAMERT MMIO trigger registers")
Cc: stable@vger.kernel.org
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 67b557f15cda7..5d633bb5f392c 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -129,7 +129,7 @@ static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
 
 #define WHITELIST_OA_MERT_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_TAIL_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-- 
2.54.0

