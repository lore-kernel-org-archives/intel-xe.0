Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00A3C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 18:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B44710EFED;
	Thu,  1 Feb 2024 18:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5Pygi1f";
	dkim-atps=neutral
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 18:55:15 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5738E10EFED
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706813715; x=1738349715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hjXY0HRFRk7qIfArdjBnkh0uLQBdhUQgHSfJ+XAyANQ=;
 b=X5Pygi1fnMJozLiYB7Ss8BNC+E3gQ4jkVDfLODgGUqA7tclWNKNA9K0C
 dXnbZIrtRsO9cjK5QI8CiI/rLnNY+f7y281B03+Cjpyq7pFD8I9KErqaz
 2P/vMSxhrdo9AQrAwZ4Q1QD0isAnGE9tk/njYqwWBToSq6unSJ0Nb0Ckb
 W9vwmeyLLzeqgkyTlGXopvfMxA7HTZ8D6fCIbKP/oEimyjaHf4ROmzv+v
 gCrWPJm225iUeBWhVUb1cY3BmJK1jy3M5bFVaAj9nchlJRJmYjKuBbtiV
 wP959at9MJsImaUixfxc7wHGXYJN39vsgZ1R/l13tYJlcdZ5ZH/gqZeRw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="165545"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="165545"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 10:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="184118"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 10:48:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Drop rebind argument from xe_pt_prepare_bind
Date: Thu,  1 Feb 2024 10:48:44 -0800
Message-Id: <20240201184844.2317004-1-matthew.brost@intel.com>
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

This is unused, drop it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..359867612398 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -861,8 +861,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
-		   struct xe_vm_pgtable_update *entries, u32 *num_entries,
-		   bool rebind)
+		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	int err;
 
@@ -1218,7 +1217,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
 	       xe_vma_start(vma), xe_vma_end(vma), q);
 
-	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
+	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
 	if (err)
 		goto err;
 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-- 
2.34.1

