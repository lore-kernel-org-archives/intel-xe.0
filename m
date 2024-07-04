Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921A4C3271F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 04:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5746D10E8AB;
	Thu,  4 Jul 2024 04:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G76e6dxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF61D10E552
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720066574; x=1751602574;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vT3BrYcAdyB4M8QwsVUZiCRs2mmotMXtK9X3IdU7kFM=;
 b=G76e6dxb9tpBCnr86iGlwDOY6H5G1Y1BhFTtVDJvRe3z/7sv54zxyHKP
 hxOWHAbPjpASXshGG1xwoxoxM7BXcnQNcr4xz2OpRrIJO8NbbftajVX+m
 hwiUeUQO8YoIcduc5lx98AA68Ee+w9Db/D9MB/5+MohezDVNAyYdZK/XA
 QI3kY30ySVRlrRNVICqi/0ywil2F8TQwAq4mMSW/my7gT8NpmVhKHRD4w
 sldiPG1vn5oQaboE8va3B1KPdobsUsS39B+mgWNQ/tPP0jrFui5xqFham
 MCowX7JuB8BTRXrVNnexRUqKOKEQlE1gb1OCnUijKD+JTmCK9rlHNd8Ul A==;
X-CSE-ConnectionGUID: j6wnMVtWQfGZe60GNWSQuw==
X-CSE-MsgGUID: 8kGadRWUTqyXsp6z82gqfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="20228407"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="20228407"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:16:13 -0700
X-CSE-ConnectionGUID: KmwwNifaRj2kZAVq/TQGxQ==
X-CSE-MsgGUID: IYK+CwvPQd6qoMErrvka/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="47217271"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:16:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 1/7] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Date: Wed,  3 Jul 2024 21:16:46 -0700
Message-Id: <20240704041652.272920-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704041652.272920-1-matthew.brost@intel.com>
References: <20240704041652.272920-1-matthew.brost@intel.com>
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

Engine is old nomenclature, replace with exec queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 ++++-----
 drivers/gpu/drm/xe/xe_migrate.h | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c9f5673353ee..ef5ad0efc5dd 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -84,15 +84,14 @@ struct xe_migrate {
 #define MAX_PTE_PER_SDI 0x1FE
 
 /**
- * xe_tile_migrate_engine() - Get this tile's migrate engine.
+ * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
  * @tile: The tile.
  *
- * Returns the default migrate engine of this tile.
- * TODO: Perhaps this function is slightly misplaced, and even unneeded?
+ * Returns the default migrate exec queue of this tile.
  *
- * Return: The default migrate engine
+ * Return: The default migrate exec queue
  */
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
 {
 	return tile->migrate->q;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 951f19318ea4..a5bcaafe4a99 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -106,5 +106,5 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
 #endif
-- 
2.34.1

