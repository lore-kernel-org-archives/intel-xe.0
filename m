Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFD3C30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32A210E268;
	Wed, 26 Jun 2024 21:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgQjwopH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B1A10E268
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719436513; x=1750972513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JrVvTzTLmS2jnpLDqMV9suUaq/d67njL8lTm67xipKc=;
 b=RgQjwopHYwCH4ha6VuhnTidYec7u528oiI+noqbS2gyfW6sieyZpreVl
 ShKtTuN3p5GrMoF+YmMdDSYHz0N3SotcP7cAWkwrD2LYOlwUGiGTgCU11
 SX3QGngR7NvVLVS1DstZan5QGJShRdKE5AKR1qdVDOfaMZtc+GwNkE1B/
 sLUjRC87T71PZn2EnBa5BJ/T0713H6Ci6tpS+gqHCmkYv8pjpEdlU3vhl
 kZhEXFupbQEOaA41BTFmXaKStGuUBSIzeowFIXTkzMkGPhlp0K7/ZOmbq
 rwNK0+MrbqOxxeyi28lCzJLe3Cq0C4OxPXCKV4uLa5pnOrciCuBYUSlZ9 Q==;
X-CSE-ConnectionGUID: OSty3fyVTKy8q1mnDtxIlg==
X-CSE-MsgGUID: 8vVliKySTaic/WaeUxhLEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16278562"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="16278562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:15:09 -0700
X-CSE-ConnectionGUID: yWIxbqkMSraua2n97solSA==
X-CSE-MsgGUID: 1w0Y+VV/S7KYta6wnb0ukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="49056201"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:15:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 1/7] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Date: Wed, 26 Jun 2024 14:15:40 -0700
Message-Id: <20240626211546.4099339-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626211546.4099339-1-matthew.brost@intel.com>
References: <20240626211546.4099339-1-matthew.brost@intel.com>
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
index 05f933787860..af62783d34ac 100644
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

