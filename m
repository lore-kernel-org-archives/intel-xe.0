Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1A6C83F26
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 00:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E7D10E35D;
	Fri, 25 Jul 2025 00:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goJOMPPf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED36010E0EA
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753402873; x=1784938873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zcrrMVm0tPOIROriwXcXnJK8+bl4JOwkY487X1EYXME=;
 b=goJOMPPfETyAv0v9U8q7dg7xKa0WsROvAIaac4dIF+8j4Wd3eFB+KoWm
 yGR7VnD9/oOxfKhHS48vrVHJd2NuHH0wzNqr5qJGpI28u0ORu0ktbB+PD
 FraR8bX9Mb3eULv90PC7ha6h4YlH+335HEmWZBM0bhyoEMwsMRSihLqX8
 5kdtF7vNj7QYVfSTArQQJU9bzRWBKQelZYXiEznlVZCj/tvsRRmfMDrQd
 9wTXlsugd+EuQyu6md2/nXjs9yccQrMxhrv7/2xjz9bHUGxJuzm97ZJr6
 BYsaLg6UEGvJdRsVeeYvRhOMF6ie8IlIyvIePv+f/8Zx/QNNBVEpzVZYQ w==;
X-CSE-ConnectionGUID: XG/bhhgMSHCSjG+gF2fqFA==
X-CSE-MsgGUID: FN3cxxI1Q5qJZgr8xncvkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59549821"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="59549821"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 17:21:11 -0700
X-CSE-ConnectionGUID: 3WR42jXkQWeWppF69SY40A==
X-CSE-MsgGUID: eLQrBh0sSv+5U22UfPPHLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="191462864"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa002.jf.intel.com with ESMTP; 24 Jul 2025 17:21:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 3/4] drm/xe: Allow freeing of a managed bo
Date: Thu, 24 Jul 2025 17:21:04 -0700
Message-ID: <20250725002111.3906267-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

If a bo is created via xe_managed_bo_create_pin_map() then it cannot be
freed by the driver using xe_bo_unpin_map_no_vm(), or indeed any other
existing function. The DRM layer will still have a pointer stashed
away for later freeing, causing a invalid memory access on driver
unload. So add a helper for releasing the DRM action as well.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ffca1cea5585..472cadcfc4dd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2222,6 +2222,11 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	return bo;
 }
 
+void xe_managed_bo_unpin_map_no_vm(struct xe_device *xe, struct xe_bo *bo)
+{
+	devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, bo);
+}
+
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8cce413b5235..72f4348d0d52 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -122,6 +122,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 					      u64 alignment);
 struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 					   size_t size, u32 flags);
+void xe_managed_bo_unpin_map_no_vm(struct xe_device *xe, struct xe_bo *bo);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags);
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
-- 
2.49.0

