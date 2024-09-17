Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965EACAC594
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ACC10E4DA;
	Tue, 17 Sep 2024 17:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7FchA3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF510E4DB
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595007; x=1758131007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=byFID3dZon/QeyrclCL+Viqmdfge4nmMJDBXTIDQE+A=;
 b=N7FchA3u2jwa+h2AU8uCcFRd9wla+iJq81cK3pmS9DyRvcMHH3cenzBp
 7s74nS5QmAzUtnLH3iJrB4gF+yoDAwrWmqQRquGhaNjuJPjbFXFibIvEe
 dbT0u+pZJNUKNo4ZYEYtUNQGIJlwxmN0YiB6mterI5WfKEgSyoIz789Zm
 4EmFYBbCEWcmgq3AlmElCQ9y+3xDFnv37vuAHpNtXzHN8C9LnlFsngXY3
 tJdgv+ny8w49vdoLvL+1bdSt4JYZ/jRRJlmMCvwHKdsXinkmpm008rK7N
 yzctILhjTkqZwA/0/hwuN7Nr25fQLvt6ytado0MTlfk3YgsnQktllkklM g==;
X-CSE-ConnectionGUID: 0SM1E2kQRO6FgBvMbZ4HlA==
X-CSE-MsgGUID: x7WpVUS/TQyykdMuG6Ls8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25665231"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25665231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:43:27 -0700
X-CSE-ConnectionGUID: RdIg8wouS8a7jaauCgiFYQ==
X-CSE-MsgGUID: KLZGUkT9TTGMo8FO9P3pFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="70058962"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 17 Sep 2024 10:43:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 1/7] drm/xe: Add null pointer check for xe_migrate_copy
Date: Tue, 17 Sep 2024 10:43:18 -0700
Message-Id: <20240917174324.967870-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917174324.967870-1-zhanjun.dong@intel.com>
References: <20240917174324.967870-1-zhanjun.dong@intel.com>
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

Add null pointer check for parameter src.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cfd31ae49cc1..45bba0d731ec 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -774,14 +774,22 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	u64 src_L0, dst_L0;
 	int pass = 0;
 	int err;
-	bool src_is_pltt = src->mem_type == XE_PL_TT;
-	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
-	bool src_is_vram = mem_type_is_vram(src->mem_type);
-	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
-	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
-		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
-	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
-	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
+	bool src_is_pltt, dst_is_pltt;
+	bool src_is_vram, dst_is_vram;
+	bool copy_ccs, copy_system_ccs;
+	bool use_comp_pat;
+
+	if (!src)
+		return ERR_PTR(-EINVAL);
+
+	src_is_pltt = src->mem_type == XE_PL_TT;
+	dst_is_pltt = dst->mem_type == XE_PL_TT;
+	src_is_vram = mem_type_is_vram(src->mem_type);
+	dst_is_vram = mem_type_is_vram(dst->mem_type);
+	copy_ccs = xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_pages(src_bo) &&
+		xe_bo_needs_ccs_pages(dst_bo);
+	copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	use_comp_pat = xe_device_has_flat_ccs(xe) &&
 		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
-- 
2.34.1

