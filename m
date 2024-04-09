Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C29CD1299
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9B0112F1D;
	Tue,  9 Apr 2024 20:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zt6JIt8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80298112F19
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693094; x=1744229094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B7u0UJRqlWMGRyqfKtEUVLVkmrYGEm83buA732OZ5UY=;
 b=Zt6JIt8/f2FeQNcRwW848iLdtm1hBStfmUenC8694xevK4u8UhiQgiFH
 NGXs35N45zPvQbsoSNoXFkTA/9HaEkmZD6hPzkOg4Xdgxes4QyyxDdq2J
 kFhTJmWcwPQ1PdGRoc2kn174I3NkfXCLD5tnMJZWl3w7DuJIJDTEGqTjm
 Uw0nuXY3JaiGuYaDDqs1C+gRi3kPS+DsuylUqPEAcTMjIjugZuILpfGfO
 hwrJZWkgaIzCu0DBAyWSB8W7/khasaPQXtILw5HfQxZPPX4gLSwIp7owe
 9e7+8XVxEkbDy2riSrAcVVjsaGqRI5ooiybPmd5PZKAQCgMRM1AadNUNT A==;
X-CSE-ConnectionGUID: kzvSq+cuRgGLjWegiTeYCQ==
X-CSE-MsgGUID: pQSqq2E8RSyUHlu5UFzO8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803751"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803751"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: KeHSo89LTmKa3Ryzb6sD4A==
X-CSE-MsgGUID: TSSjPLL5Qcq8T3+NioW+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773754"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 14/31] drm/xe: Introduce helper to get tile from memory region
Date: Tue,  9 Apr 2024 16:17:25 -0400
Message-Id: <20240409201742.3042626-15-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Introduce a simple helper to retrieve tile from memory region

v1: move the function to xe_device.h (Matt)
    improve commit message, add kerneldoc (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 74eb9833d4d8..68082357aebd 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -178,4 +178,12 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 void xe_device_put_deferred(struct xe_device *xe, struct llist_node *deferred);
 
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

