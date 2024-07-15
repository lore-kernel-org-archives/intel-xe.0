Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794F1C3DA5E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 18:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7AF10E48B;
	Mon, 15 Jul 2024 18:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRaWpEfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350A10E48B
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721066761; x=1752602761;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xr8+GLiHuoV2k5GwhQq19Y4Xt6wQVW+jbmj/ZMlIEyw=;
 b=CRaWpEfFfFhzmiU0jCDfTu2/7dtYa5XIqCcOS1p10lxeuPnsXcy/5NIN
 pELo6xZadopT5dyF0wLdeq2gPAp0/yssp5XICVZD1za+c1LMMQo1zGha+
 KH5hUePp/euxwADNH9Cg/L+g/ONF6lK7QzDuBEizPg3eO0W34e4f79lLB
 SIDGutVQcKEMensvp4YQZvx0Nyktin9WWocZuqke/MgtsFM139ObxwWlb
 Tb8BtJ0QL6qQvGu/Npw9L7J9RrAAaUaSBGFnVAJIXXw34jmrp+PcT770V
 +mu+4kEpgdT2c9lafLI8+AGWPBuVijKfg2nEusCAmwbOWxSuNkWCOYc27 w==;
X-CSE-ConnectionGUID: WypICPDLQ5imPuqr/FtboQ==
X-CSE-MsgGUID: Q8a68eqaSg61cWMeeDVJvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18579912"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18579912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:05:53 -0700
X-CSE-ConnectionGUID: 3UjCdYd0SIipqGW3awO96w==
X-CSE-MsgGUID: 2AlN19VmTHi2FeCHwxVByA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49556559"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.120])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:05:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Normalize NEEDS_64K BO flag
Date: Mon, 15 Jul 2024 20:05:37 +0200
Message-Id: <20240715180538.1418-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240715180538.1418-1-michal.wajdeczko@intel.com>
References: <20240715180538.1418-1-michal.wajdeczko@intel.com>
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

In commit 62742d126631 ("drm/xe: Normalize bo flags macros"),
we normalized all BO flags but XE_BO_NEEDS_64K. Do it now.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c   | 2 +-
 drivers/gpu/drm/xe/xe_bo.h   | 2 +-
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 31192d983d9e..da35b4a21739 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1264,7 +1264,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & XE_BO_NEEDS_64K))) {
+	     (flags & XE_BO_FLAG_NEEDS_64K))) {
 		aligned_size = ALIGN(size, SZ_64K);
 		if (type != ttm_bo_type_device)
 			size = ALIGN(size, SZ_64K);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..2afc50132c2b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -36,7 +36,7 @@
 #define XE_BO_FLAG_PAGETABLE		BIT(12)
 #define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
 #define XE_BO_FLAG_NEEDS_UC		BIT(14)
-#define XE_BO_NEEDS_64K			BIT(15)
+#define XE_BO_FLAG_NEEDS_64K		BIT(15)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(16)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index c5fdb36b6d33..8999ac511555 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -71,7 +71,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 					     lmtt->ops->lmtt_pte_num(level)),
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
-				  XE_BO_NEEDS_64K | XE_BO_FLAG_PINNED);
+				  XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_PINNED);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
-- 
2.43.0

