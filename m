Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B82FD30CDB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E345410E56F;
	Tue, 13 Jan 2026 23:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHra5RjO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1DE10E571
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vqWnH73boJ/6ZlXMPZM1Kqx56I0F+DDrQKUdu8VaVDs=;
 b=EHra5RjO/b5P3GwRr7Jj7aBFjc2MAas0NttJABjiiBN8VLAfvH54unQ+
 5zvFYRLVqw9uhq7/RAie6e0Oe+iwOX2fT1VcG2CACqsUCBhGXfUkBz315
 NlBA+YfVDGegSxRakQ9pqOG19a3QXFzIiXwbNbLF/RsoTzKfGy3meA+yq
 atUTwkVu8kaM6AMA2fL37RZtzENmAbPycv5LoUF51wBd0yRfcfjWnDZ1T
 8rinZLxsG71agINRaU4/UL4vGBg22poVYWZzytgDC3p9IEP8S/bjRyOv9
 drcnCL3t5aHmZS5Y7mJC0rBpLAKhm8c5qD7tdxHMVSzJLAXwKulmpFCXo A==;
X-CSE-ConnectionGUID: wSYOKfJzRDeV13rFKhH8nw==
X-CSE-MsgGUID: OCaex3LjSbG5Ww7UljFBUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311148"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: DsuhA9bcQZuMb5EpyiplQA==
X-CSE-MsgGUID: SVi1YI8fQ9qhqUx4Jv0ugA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147399"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 43/79] drm/xe: Drop unused headers in xe_memirq.c
Date: Tue, 13 Jan 2026 15:03:48 -0800
Message-ID: <20260113230315.3081153-124-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_memirq.c doesn't use anything from xe_regs.h or xe_map.h.  Drop the
unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index b0c7ce0a5d1e..811e07136efb 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -7,7 +7,6 @@
 
 #include "regs/xe_guc_regs.h"
 #include "regs/xe_irq_regs.h"
-#include "regs/xe_regs.h"
 
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -16,7 +15,6 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
-#include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_tile_printk.h"
 
-- 
2.52.0

