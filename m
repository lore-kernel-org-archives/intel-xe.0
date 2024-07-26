Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8652FC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 17:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2F810E9EA;
	Fri, 26 Jul 2024 17:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9a1TRGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB5410E4A7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722014295; x=1753550295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XVROHRZZU/vOVx4MgmhcIw0AKbRyPU2omIZdJgGYwdA=;
 b=I9a1TRGvE3oAxDt4CP0QJT9t4Ce0+3Mz7HxjS5ZIjRCL0k8hzuOp+lLY
 I3h2MdxrUdzop1+eoSbkQtbleLOpIsto6XKpANbpQlvrrJdGP9wsak8VN
 YxfTk9Tiqbsd5YPaZu0GcahA6xGXtpkx6p7xNY1k26Cl0ZzFWkbJwWN0/
 qITpOgEF4lwM95aK/CsStLvV86JCiIDTrHGZ9bVDQHaJos6Qs77GT/aOD
 KzErKd6c6P604IYT6+kjYO+NXM5e0V9UKIBFwXrgjPXoC41gMpMvYE9e0
 IlxOoDgsnLduH3299w6TQPBTVszQbAnWCUixc40x8yqBrnByIN5WWC9NF A==;
X-CSE-ConnectionGUID: g3Qm204mT3ag4UMy5wYzNA==
X-CSE-MsgGUID: xiKZrUuKSiWS5pfwImHY1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="42347931"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="42347931"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:18:15 -0700
X-CSE-ConnectionGUID: ah3pC+8kSbGWQN9SBZSL8g==
X-CSE-MsgGUID: FDZzCgRDQbiwH4mhCt3cZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53262768"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:18:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/migrate: Future-proof compressed PAT check
Date: Fri, 26 Jul 2024 10:17:58 -0700
Message-ID: <20240726171757.2728819-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

Although all current Xe2 platforms support FlatCCS, we probably
shouldn't assume that will be universally true forever.  In the past
we've had platforms like PVC that didn't support compression, and the
same could show up again at some point in the future.  Future-proof the
migration code by adding an explicit check for FlatCCS support to the
condition that decides whether to use a compressed PAT index for
migration.

While we're at it, we can drop the IS_DGFX check since it's redundant
with the src_is_vram check (only dGPUs have VRAM).

Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c007f68503d4..6f24aaf58252 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -781,7 +781,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
-	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
+	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
+		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
-- 
2.45.2

