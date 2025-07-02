Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3943C83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 03:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A0410E6A4;
	Wed,  2 Jul 2025 03:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8p196Y7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523B010E69D
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 03:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751428628; x=1782964628;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LHWlDRvYXeZYhF17gHhWZ6qDWNb+xWavMvGGDcsluvk=;
 b=d8p196Y7atgndBNz6Ulo2dE6e2Aag6CQNcQ8B/SJsndqmmq1qFNS3JAH
 0pLx9q9FJDMr+B2hjhZb5CA6t13iosC9AoPKsoOdxInLZDZzNNmA/uI3V
 FHUHj3OVPMT8wcopGhbN8uukRTOs6FtYJM0E5VDWcdYtJA7SRIFRXOhrR
 NCYaXgkkZJjCzabmbo40whmi5Mrk4a8lU/fsm5cx0lzDAXh5tI3id07R5
 SlmR7ZYWTJkku7EvSOqN4USzZcW1NfFZLUwmkUD/H9mbJUwbu16+pD6+E
 CZvFURlnb6wuxVQ3YH14WfQG8EowTy3cHD10Z3GKO9YGIXAIzVa+OyzlL Q==;
X-CSE-ConnectionGUID: kfx0izHmQz+DKNBJpA30nQ==
X-CSE-MsgGUID: HHkTwF1MQH2DXnRD7a6z0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="63957160"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="63957160"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 20:57:07 -0700
X-CSE-ConnectionGUID: 3z+ShsNRRa+NFoQt00TtVQ==
X-CSE-MsgGUID: uCsgrMNNSXCPnJPsQZProw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="177626655"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 20:57:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] Revert "drm/xe/xe2: Enable Indirect Ring State support for
 Xe2"
Date: Tue,  1 Jul 2025 20:58:46 -0700
Message-Id: <20250702035846.3178344-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

This reverts commit fe0154cf8222d9e38c60ccc124adb2f9b5272371.

Seeng unexplained random failures during LRC context switches with
indirect ring state enabled. Indirect ring state is not required for any
current features, disable for now until failures can be root caused.

Cc: stable@vger.kernel.org
Fixes: fe0154cf8222 ("drm/xe/xe2: Enable Indirect Ring State support for Xe2")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..4070acb268df 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -141,7 +141,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
-	.has_indirect_ring_state = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-- 
2.34.1

