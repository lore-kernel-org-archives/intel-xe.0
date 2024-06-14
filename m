Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53289C2BA16
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC3410EE69;
	Fri, 14 Jun 2024 21:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0WNXk/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC910E2BE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401657; x=1749937657;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p4LU9IVVHOKYvkHMgZztRqGqcrOXHZi1qcEgwDn7kV4=;
 b=O0WNXk/f7i/DF8q4GQXzdjeu/jzvS3r1fg70tkizINnh+HwTb0iB6tem
 +PmcN3fx42+rNS9n/9XoQ2/NwRz4SqtQnmODgPuLXr/+15IEYJDz7Q0W1
 eVMd78L3hZ0dnMhn09RvYWD9A9ZMCWrMmYnLXUN/R+vW+SyJKo4QnsC3A
 Skkq5DfJMqYYepHERxu33pjzbm9yO5nKTjBz7eB4MdTVECz184XWJ2/1U
 +TgyNnZyjvpe8tXLSS52RESoz7uZXXYDoVd7poU+C9FUX+5P3XSgo1Zr+
 tsjd3I9MaH4jq8lkWpeJnBISmjynnN0CRRaXSGvpjq5c0V04RyjJEr2sm A==;
X-CSE-ConnectionGUID: hTKC2LC/RDWpPRnDiobmsQ==
X-CSE-MsgGUID: GcOqapTxRmC3sQw2vUeswA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886593"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: w0H/dtYxSeaGptrsuOxO4A==
X-CSE-MsgGUID: ilscJJy6SFyljqvlaKwetw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572427"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 33/44] drm/xe: Introduce helper to get tile from memory region
Date: Fri, 14 Jun 2024 17:58:06 -0400
Message-Id: <20240614215817.1097633-33-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

Introduce a simple helper to retrieve tile from memory region

v1: move the function to xe_device.h (Matt)
    improve commit message, add kerneldoc (Thomas)
v2: move the function to xe_tile.h (Matt)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 1c9e42ade6b0..091c5a98110a 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -15,4 +15,12 @@ int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
+/**
+ * xe_mem_region_to_tile() - retrieve tile from memory region
+ * @mr: the memory region we retrieve tile from
+ */
+static inline struct xe_tile *xe_mem_region_to_tile(struct xe_mem_region *mr)
+{
+	return container_of(mr, struct xe_tile, mem.vram);
+}
 #endif
-- 
2.26.3

