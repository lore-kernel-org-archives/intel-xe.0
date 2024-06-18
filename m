Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C13C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F356A10E72B;
	Tue, 18 Jun 2024 17:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bY7qogO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B6710E75C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718730876; x=1750266876;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JrVvTzTLmS2jnpLDqMV9suUaq/d67njL8lTm67xipKc=;
 b=bY7qogO66I0BU4K+Jk4wVVUkQHu+CZRqbI3E78l6w4j3qLidUHFBnWjt
 ENfukO5lpZlcpgyx8zr36VQLbGNaHnUlIbtHcfNiGla4rr/uRz+qbV2UN
 mUBf5YJ23zzYbQg3cIq2YDwhW9ob7/ZWR+C+I4bULETkKLgFH+WGO20e3
 Y5vQWsKmSqszRv0xpDlgkySa/K7bioqJMZU/wC97UMYtQPblXXBPIBWB2
 ksy+wq6+4pmzh76h0CZsvOeElPbcIa9YiMuEhpMVZLhIEsdtHbZrUZjMN
 gi7aFk8Nq2grI55AVl02yN9vmHVRnf+c0UjGC7MXGyOM/lS9jYYFlMv68 g==;
X-CSE-ConnectionGUID: +/8c//a1SFOnsQO7FVVbCQ==
X-CSE-MsgGUID: SLd5icdERSKUixw4rSSlWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26754430"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26754430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
X-CSE-ConnectionGUID: j3VzTX44T7mw/gxIToqYSw==
X-CSE-MsgGUID: OjpbNOymQyeQskcPWjVrCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46583652"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/7] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Date: Tue, 18 Jun 2024 10:15:03 -0700
Message-Id: <20240618171509.3336601-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618171509.3336601-1-matthew.brost@intel.com>
References: <20240618171509.3336601-1-matthew.brost@intel.com>
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

