Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F953C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 16:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64210E5B8;
	Mon, 18 Mar 2024 16:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMFU9gDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32B610E5B8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710781051; x=1742317051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fi0FOSo2EcBqHL9mchu4NwB5nQedq98Hsr/3WY7IDjs=;
 b=mMFU9gDpH9CmGITsNcI0fZsrWnMpn7p/GbDHGetSjEIFT6ijDD6d/4WQ
 wZCdyAxiU/IXmSB+TzPjCr0evUixq7bnADNp2UN5aNP+mNyChwGqPwINN
 NGYlx28UrAEyO3tbNJtBV37iDZKWMZb5TZ9mJTBNsWXLt0UbqujYS8tRQ
 xNSAht7xF+eXByxESBkq/k0U4rWopJy3AIATFPoG/hcLZ0kf4FmdeRRbn
 DJ5zDHrsoMUZkkU5KF7NrbCg89EMy6s1KX9FduUk+dgzLVYHn7BtBIika
 CjNT60RQhQiPdL3OpL+MREnco/e8eQMmduHP/rr4pgNVS2LzuN7CPskKn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5441783"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5441783"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 09:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44579565"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 09:57:29 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Fix potential integer overflow in page size
 calculation
Date: Mon, 18 Mar 2024 17:43:41 +0100
Message-ID: <20240318164342.3094-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

