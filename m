Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78458C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 14:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340C710E4AC;
	Mon, 18 Mar 2024 14:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O65RC5sE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3007E10E4AC
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710770628; x=1742306628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fi0FOSo2EcBqHL9mchu4NwB5nQedq98Hsr/3WY7IDjs=;
 b=O65RC5sECbP7xHum6MNihO803p2dNDSbpOY4SxPVf0i2DxxPqmBvURnK
 j77Sy4dJFF79eLecoR+pn6349DvGeVQ/y9QjRYmNgB/PRDyBwaCDWIV8k
 e4ssnIjAFOLrTQR/at/lv8qBCUuI5bDZp7oE3n+LLK11ZgFZUCGYrSt/J
 3vGB7Qi9s0F4udruY/L5GpylN7p/KJQXl4KFAglFvLaONQmfO2OiKmKVr
 hUWerZDKXAAFKEb602rZQEfbs6RJbpCVk7EDg8VAK+OVm8kGeskSaQipH
 SAPN0wlfvKOsqX9UOotuRJk3QglW7Ysnhn4mUqwfI5Z21VPGpwmMgu4cn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="23098537"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="23098537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44410214"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:03:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix potential integer overflow in page size
 calculation
Date: Mon, 18 Mar 2024 14:49:59 +0100
Message-ID: <20240318135000.13032-1-nirmoy.das@intel.com>
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

