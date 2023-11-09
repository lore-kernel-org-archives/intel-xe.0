Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510E4C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 17:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3B110E0E4;
	Thu,  9 Nov 2023 17:08:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F54810E0E4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699549683; x=1731085683;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ac7AS314dkSBSDYMHAZ/BoINYm3SRLymOFmce3MQ/vU=;
 b=Q9ZJy4QfylEvXMr/9tvLiT0joY/+opNwdt1NtDVNZ2dutHaeApsCCRGC
 fUD2Bq+/viw/ahQgTSN6sVbqbv40lBPErbSRF/pTgbobfeKsVJVm2Beib
 x840Ugm1yU+tGlS6VO6HNpu7JDhdJqSxsKBUWkQ4BR/9Uw7E9r04dQTkL
 eFYmLecReKsTkXKv1nSJdexAlPvsPwTzOgXEoxhAir8CT3vL3POfrdP6W
 OQFRlWInAWOm4mF/hl5D0FvfAj14+lK+IgzGnYBcBuhzb51MFexmgNKXO
 zDHTzYGejnT9y397ieSvkG7CX6Wq5C+3nZGqdZwq5s0j2vPNCsq7W0l2y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454330514"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454330514"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="833883173"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="833883173"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:08:01 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 09:07:54 -0800
Message-ID: <20231109170754.3836109-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/rtp: Fix displayed whitelisted register
 range
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix displayed whitelisted register range. For example, with:

	XE_RTP_ACTIONS(WHITELIST(0xdafc, RING_FORCE_TO_NONPRIV_RANGE_4))

Before we would show:
	xe REG[0xdaf0-0xdaff]: allow read access

With this patch we show:
	xe REG[0xdafc-0xdb0b]: allow read access

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index e66ae1bdaf9c0..4bc07bbdd7e8e 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -88,26 +88,16 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
 {
 	u32 val = entry->set_bits;
 	const char *access_str = "(invalid)";
-	unsigned int range_bit = 2;
-	u32 range_start, range_end;
+	u32 range_start, range_end, range_bits;
+	u32 range[] = { 1, 4, 16, 64 };
 	bool deny;
 
 	deny = val & RING_FORCE_TO_NONPRIV_DENY;
+	BUILD_BUG_ON(ARRAY_SIZE(range) - 1 != RING_FORCE_TO_NONPRIV_RANGE_MASK);
+	range_bits = val & RING_FORCE_TO_NONPRIV_RANGE_MASK;
 
-	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
-	case RING_FORCE_TO_NONPRIV_RANGE_4:
-		range_bit = 4;
-		break;
-	case RING_FORCE_TO_NONPRIV_RANGE_16:
-		range_bit = 6;
-		break;
-	case RING_FORCE_TO_NONPRIV_RANGE_64:
-		range_bit = 8;
-		break;
-	}
-
-	range_start = reg & REG_GENMASK(25, range_bit);
-	range_end = range_start | REG_GENMASK(range_bit, 0);
+	range_start = reg & RING_FORCE_TO_NONPRIV_ADDRESS_MASK;
+	range_end = range_start + range[range_bits] * 4 - 1;
 
 	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
 	case RING_FORCE_TO_NONPRIV_ACCESS_RW:
-- 
2.41.0

