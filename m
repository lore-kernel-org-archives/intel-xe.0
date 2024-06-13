Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0BBC2BB9A
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967DB10E96A;
	Thu, 13 Jun 2024 04:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpeRdRD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86410E1C8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252030; x=1749788030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BVupO+Xas3z+gywDTeH4yQ9fbJgnmcg6ZPD6LnCxOwQ=;
 b=UpeRdRD3GXJWmz2W4F6EChSHQkZOr6q4gH2cTiw8F91L7O4V3lGVM1Gw
 CmfOlIqvpxiJf3ANIjj7pU7BGGnO2g1SkSWEFDrBmjtSA3Ban02OS6EAH
 j80FPq7rQZjh5XLL9dgcL/Fo1+GE6Hmhx1hsTY1aFG7j3Vey5frxblwer
 VyRt4ZqeSX+ujSCEfzk9DLjdY9gw1Kz9mz7MENWPd6q8p+EP89s9jIJ5C
 zHebkUs8QlEdrektgjC00kGEhzELBrkCRnrjyp3iG/9KuKxn1eJhW0O/K
 vjEIMGsr2UbpBMKfuQfvbnsbHd9e4JStPxWhNtjQ5Yp5o1GHC12cUasg3 g==;
X-CSE-ConnectionGUID: 8fUOaeJRR7+T+YCykY0O+Q==
X-CSE-MsgGUID: p9sgnlL+S6KtNFPnTnxMgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847972"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
X-CSE-ConnectionGUID: iuZPsNpbR+yIaAWmlaKSZA==
X-CSE-MsgGUID: +84nlxtLQYa5GgbinAaE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476332"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 15/42] drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Date: Thu, 13 Jun 2024 00:24:02 -0400
Message-Id: <20240613042429.637281-15-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Engine is old nomenclature, replace with exec queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 ++++-----
 drivers/gpu/drm/xe/xe_migrate.h | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7e3fb33110d9..5eb039acfcf0 100644
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
2.26.3

