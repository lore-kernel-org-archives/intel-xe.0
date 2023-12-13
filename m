Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71A6C4167D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 17:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2D10E2A3;
	Wed, 13 Dec 2023 17:48:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F4F10E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702489713; x=1734025713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CbRnrE8LV0jUsvfm0y7GgO7Vu/ay0c0Q0pdhaYD4jPo=;
 b=Ilc1HPksvnT1y3tM6djwf5Iw8N03RYkLCtHP4BxHM4nOBA1kOtAhr5+Y
 retUOk8bVI5/cimloOKNIUFPUVhTT8vUQuMmoGoE82N9vgrjgjGdA23d3
 gcV0Bde20/YVIwVey/IZlAz+ezOFGqdidw4/m9mYV9dAtvRmTeXpN7MyL
 l2yHvVQiyD+7OlQXuLJGFTOBtVuMxYfaHqwJLjcc9xsDxpC/obsDcs+7o
 xpbA0XKaY0gnVKtIyU2odbzPKfVbxNCaxQDcDO0yCi7XhD5eVezsp1WnG
 lTHikn1yQCiH/2GKjH41MWZ2xMae2fydkkxyK8K/IN6x2e8MS9OcwAEnA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="461474120"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="461474120"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 09:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="897404193"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="897404193"
Received: from mkroliko-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.11.143])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 09:48:32 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/exec: reserve fence slot for CPU bind
Date: Wed, 13 Dec 2023 17:47:05 +0000
Message-ID: <20231213174703.536989-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213174703.536989-3-matthew.auld@intel.com>
References: <20231213174703.536989-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Looks possible to switch from CPU binding to GPU binding mid exec, and
if that happens for the same dma-resv we might use two fence slots, once
for the dummy fence, and another for the actual GPU bind.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/698
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 63e82e5285bc..0c78a377f453 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -107,12 +107,14 @@ static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 		return ret;
 
 	/*
-	 * 1 fence slot for the final submit, and one more for every per-tile
-	 * bind. Note that there are potentially many vma per object/dma-resv,
-	 * however the fence slot will just be re-used, since they are largely
-	 * the same timeline and the seqno should be in order.
+	 * 1 fence slot for the final submit, and 1 more for every per-tile for
+	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
+	 * many vma per object/dma-resv, however the fence slot will just be
+	 * re-used, since they are largely the same timeline and the seqno
+	 * should be in order. In the case of CPU bind there is dummy fence used
+	 * for all CPU binds, so no need to have a per-tile slot for that.
 	 */
-	num_fences = 1 + vm->xe->info.tile_count;
+	num_fences = 1 + 1 + vm->xe->info.tile_count;
 
 	/*
 	 * We don't know upfront exactly how many fence slots we will need at
-- 
2.43.0

