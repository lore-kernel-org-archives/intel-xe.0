Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C3BCD98EC
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 01:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1310ED9D;
	Wed, 17 Jun 2026 01:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbC0jbEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AA610ED62
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 01:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781661267; x=1813197267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqPrMSRCTfVjmSDbhCpI5dxc5ytpqO9zJ8vbGAo4yMk=;
 b=DbC0jbEg+Ut9L7AJCZa2DpP5Xhnlo2qgiIGJQDRn6EJnH/IG/43J8XqH
 Z/3SmpP29pCzqjIj2qjYUHJaoYawuFR4B77AAd9EfyueqcAKsJ3nCpf06
 1SEuHZB1zgmQrx+vtZGbfonZNyfLWyFTQH7YIPk92jabs3KaRGIjFnoxr
 LXejZwdf/IKWPwqfXwhStJTgeU6fah01Ba1peWsi3HoZPGg427JvBdq3C
 FciLe0dvCfwTAqJKRrhqIKTJFU7ylmKNtULe01crjOvrCzXQkVLp4UvNM
 Okv/ABt+PUqCmIPocgcDHkuf3vqjaGIb1LuCys6JBszVj+QeS4+9Rmbhe A==;
X-CSE-ConnectionGUID: F04ODOkoTuyGC7XaTr1ttQ==
X-CSE-MsgGUID: mLvlQqLbQmS67fYQcAKqdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82456697"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82456697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
X-CSE-ConnectionGUID: KOzCdJexS7+uyaHYkwHS/Q==
X-CSE-MsgGUID: Oz3okEsARqy4+ExCh7WTVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246801632"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 2/4] drm/xe/oa: Fix offset alignment for MERT
 WHITELIST_OA_MERT_MMIO_TRG
Date: Tue, 16 Jun 2026 18:54:20 -0700
Message-ID: <20260617015422.226177-3-ashutosh.dixit@intel.com>
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

'tail_buf' argument for WHITELIST_OA_MERT_MMIO_TRG was previously
wrong (not multiple of 16). Fix this.

Fixes: ec02e49f21bc ("drm/xe/rtp: Whitelist OAMERT MMIO trigger registers")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index a17ebacc1455b..880079473c26b 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -124,7 +124,7 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
 
 #define WHITELIST_OA_MERT_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_TAIL_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-- 
2.54.0

