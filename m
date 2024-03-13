Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7D2C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 10:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DCB10E2EB;
	Wed, 13 Mar 2024 10:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WL6GXj84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1771310E276
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710326510; x=1741862510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jT1Y3ubiUtDLw7u70xNsRyh70MlL1HXtQXD1nLZmp7Y=;
 b=WL6GXj84G8Rq+7PcuTzvNROxTbLbpavxPbARvHcAir330Q2magplVlrp
 RW+hryegTuHhV/GbVtfmCvNnq1NPYuPse2LKlEcnVucRnp2WJl2UgWS5P
 dpfw5sk5S374y3NidCQaVG1BsYkktRbzM+Ce8ZOQ6stwhnKbXT8NKzGVs
 qgoYTYJDS+HZxEtjuUarW8lX5P1fre72DCfFjEDzgsoH42MKogqhSKnc5
 FSMAF8vC8DlLVjkTkrEzz1ZHQkuRntBS6d1IrF0n75/ryDWK/7J6jYvfs
 UMbjnIKbcHZ28nKRgNQZHoZsk4jlAomOgMYjeM+1z94d6PNxeIBGCIvmV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8025286"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8025286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11798984"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Allow VRAM BO allocations aligned to 64K
Date: Wed, 13 Mar 2024 11:41:30 +0100
Message-Id: <20240313104132.1045-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240313104132.1045-1-michal.wajdeczko@intel.com>
References: <20240313104132.1045-1-michal.wajdeczko@intel.com>
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

While today we are getting VRAM allocations aligned to 64K as the
XE_VRAM_FLAGS_NEED64K flag could be set, we shouldn't only rely on
that flag and we should also allow caller to specify required 64K
alignment explicitly.  Define new XE_BO_NEEDS_64K flag for that.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 ++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b89ac6db68a1..3e23739d932b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1255,7 +1255,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
-	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
+	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
+	     (flags & XE_BO_NEEDS_64K))) {
 		aligned_size = ALIGN(size, SZ_64K);
 		if (type != ttm_bo_type_device)
 			size = ALIGN(size, SZ_64K);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c59ad15961ce..87ae8ee7c316 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -45,6 +45,7 @@
 #define XE_BO_PAGETABLE			BIT(12)
 #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
 #define XE_BO_NEEDS_UC			BIT(14)
+#define XE_BO_NEEDS_64K			BIT(15)
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
-- 
2.43.0

