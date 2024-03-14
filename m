Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D099BC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6C610FA10;
	Thu, 14 Mar 2024 10:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEzcisgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8391210F8EB
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710410909; x=1741946909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HBIhYKfwy3cvsbhcc8kMVAlr6Fxmbw1SZ2ldUWTEX48=;
 b=DEzcisgmkD6yUpX3ctk9aik3Iuu6d45o0b0FOdQRUxyDyXWLEIDXiZ2J
 hpSr/k4EUQXdWyNecVtVkwnlcSIp89hCdQAd4jLXLMo7a9zFCuEiO/PoK
 RzJzkg00M7GFaJXWmJOTbDZwAiYraZn/Nqwq5C97Uru+0Znv6ARnAvKwr
 Q5Dc4ATt+9qyPxbsCWKUOuhx+wX1w2Pif6w9SXoSkasVbmTAWrHkIMsqZ
 E3u8029eitqa8sOZl68p17IPRiREVcrB52gxsM/6ZmRuckz4io0/oMsHt
 ZZTmqfIas0srlkcOTFGtC014owHdBvagBFpw6Vco4viOdO73Ymgf2vO6s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5346234"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5346234"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12127377"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:08:28 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/3] drm/xe: Fix potential integer overflow in page size
 calculation
Date: Thu, 14 Mar 2024 10:54:41 +0100
Message-ID: <20240314095442.32153-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240314095442.32153-1-nirmoy.das@intel.com>
References: <20240314095442.32153-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Explicitly cast tbo->page_alignment to u64 before bit-shifting to
prevent overflow when assigning to min_page_size.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 115ec745e502..0678faf83212 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -91,7 +91,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 
 	min_page_size = mgr->default_page_size;
 	if (tbo->page_alignment)
-		min_page_size = tbo->page_alignment << PAGE_SHIFT;
+		min_page_size = (u64)tbo->page_alignment << PAGE_SHIFT;
 
 	if (WARN_ON(min_page_size < mm->chunk_size)) {
 		err = -EINVAL;
-- 
2.42.0

