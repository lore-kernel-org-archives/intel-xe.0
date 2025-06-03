Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B845C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A94210E236;
	Tue,  3 Jun 2025 20:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbWkXgba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67C10E236
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982526; x=1780518526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lym0hqFtHVUHqIwkw973gqEeaVaGfJ4UFE4Qjn6IIs8=;
 b=YbWkXgbaDYkWh3ajWmGRxwCP8nUVTVZIx2WL/5fKnB8mj7xwheqy6Ooz
 Y4YElPz8i5QFDe0irRKWrYgVZp4QOP05MA2p1NgTBIIPG6Cy6gvylznjk
 ai5sIR5wZ0C56rVCvSy95Dwec9w9Qkoa1GaA1zVLJj+JwCkm9MpcA5RVb
 B6ruePs77q9NjBtC0+SzZfJffrm40m0p/FfA00ZJYB7z84uYXZjxdZlzL
 QqRjNqM8vn0Ccs4QAiz247ahtg39FUp1SD6dXG/WBHMBtgVJHAQib700c
 j3EBxbED2jOv4xBRdlZPj9S55t93206bOkOdFm/VZhtkIpCwBMXvvNChS A==;
X-CSE-ConnectionGUID: mewqjrRxQOyvvuA5E6gQng==
X-CSE-MsgGUID: 8+jmmO6uQN6G9dScvzrsVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62396649"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="62396649"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:46 -0700
X-CSE-ConnectionGUID: GIilTfq7Tbqh1qXud4HEYg==
X-CSE-MsgGUID: hwvMOZRwQ9yAxQCeueE9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145583181"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/4] drm/xe: Drop unnecessary include from xe_tile.h
Date: Tue,  3 Jun 2025 22:28:26 +0200
Message-Id: <20250603202826.681-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250603202826.681-1-michal.wajdeczko@intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
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

We don't need to include xe_device_types.h there.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.h       | 3 ++-
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index eb939316d55b..5ade71bda89a 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -6,8 +6,9 @@
 #ifndef _XE_TILE_H_
 #define _XE_TILE_H_
 
-#include "xe_device_types.h"
+#include <linux/types.h>
 
+struct xe_device;
 struct xe_tile;
 
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index b804234a6551..6dcac829839d 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,8 +7,8 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_device_types.h"
 #include "xe_pm.h"
-#include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_vram_freq.h"
 
-- 
2.47.1

