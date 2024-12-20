Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F67E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B228310F047;
	Fri, 20 Dec 2024 19:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/tzZh4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3438E10E011
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723741; x=1766259741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xxlo8rh04NZOBU/oYi3prZNU69OjxH7Em7EipX/+AMQ=;
 b=X/tzZh4Exnq+qILwDo1Tn/pBQr8cid6TxdP9T6xjwHItq/lHKB5CEVoY
 cYrOnUHUMHVODSZGYwbCei1sBUFsXNoIrk+WfpOfTI9mgrhEZXchqhkgZ
 k9SJhFZi/ivNEZADWcUx0ff484p9TXamRuLpeuMBisEcRRhQziXRUqgLu
 LPV6Kh5tYv2OMgpA2AV8FyXLqstIo9SCqi0TssEybgds2+0lpxFhKhCbf
 84fX00J4U4hEGib53erR5PF3rwxeXQnXC9eSUcR2Tbj6bzFrNHpNy1Xzu
 HgY48DJp0ndVbGcDaRMuxYpehCfvZ1lkYg6Z6HJKuBz8dHeJI6rXOGLLo g==;
X-CSE-ConnectionGUID: e1rLT6tzRW2mwl1D9P2sDg==
X-CSE-MsgGUID: Fdby/eYwSvG3EXOHb2m4bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965214"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:20 -0800
X-CSE-ConnectionGUID: cRdgE9kEScKSlOUJUeQ2bw==
X-CSE-MsgGUID: zDLCmsCgSTyiH/KYMp6nsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075428"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:18 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 02/11] drm/xe/sa: Drop redundant NULL assignments
Date: Fri, 20 Dec 2024 20:41:55 +0100
Message-Id: <20241220194205.995-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241220194205.995-1-michal.wajdeczko@intel.com>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
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

The sa_manager is drmm_kzalloc'ed so all members are already zero.
And in case of kvzalloc() failure we are not returning pointer to
the sa_manager at all, so no point in resetting .bo member.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 4e7aba445ebc..eb314ca75355 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -44,8 +44,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	if (!sa_manager)
 		return ERR_PTR(-ENOMEM);
 
-	sa_manager->bo = NULL;
-
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
@@ -61,10 +59,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 
 	if (bo->vmap.is_iomem) {
 		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
-		if (!sa_manager->cpu_ptr) {
-			sa_manager->bo = NULL;
+		if (!sa_manager->cpu_ptr)
 			return ERR_PTR(-ENOMEM);
-		}
 	} else {
 		sa_manager->cpu_ptr = bo->vmap.vaddr;
 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
-- 
2.47.1

