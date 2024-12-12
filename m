Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E3DE77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594F610ECA0;
	Thu, 12 Dec 2024 01:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGPP+fa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFAA10EC9F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965322; x=1765501322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmk09AAtENqL/6KbbEdSUkeqZcX0lCJ2rqA+R89qZ1s=;
 b=kGPP+fa1dTyfd9158/2DjmxPcbp+aUA0Wt3UnEvg3FocosZWE7Cv5KCp
 eIbTXoV8bp5QpKENkRz7lPoobFu+TWVT1BhkHnYOb2EqbhFsIzPqQcTjq
 qi/jE/4rlk1X7chZh+p8/LH6o89xwZV6pYdpfwkv7vnynM0fzgLqQtod0
 NdnUFPETtNrEiqiatjKsl96kFYkqtnkzljAI4qFm1i98s5U8WwUuSoDSV
 saq0+qcHjLHfzyPBI2XMbdcQiaED43+M6maDCZ53VCLUE19etNx2gsH6q
 4pe0q2YQXfwvRXZ0UqvevrWyJgIcpSVpNLTTzHRoM9ky2rn3surmM+dTK Q==;
X-CSE-ConnectionGUID: 75ZD91BWSq2xBcnsZw2mGA==
X-CSE-MsgGUID: B9PZowmjT/6LvIOrLnyZ6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379790"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379790"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:02 -0800
X-CSE-ConnectionGUID: Zp1phFIjTiCX31eXnANSvw==
X-CSE-MsgGUID: XHGmh78ySgmoBdt98CMZYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856512"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:01 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 04/13] drm/xe/sa: Drop useless is_iomem member
Date: Thu, 12 Dec 2024 02:01:32 +0100
Message-Id: <20241212010141.389-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

We can rely on the sa->bo->vmap.is_iomem instead as sa->bo is
still available at this moment.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c       | 3 +--
 drivers/gpu/drm/xe/xe_sa_types.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index a5e05237b646..b990bd8a49fd 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -24,7 +24,7 @@ static void sa_bo_manager_fini_bo(void *arg)
 {
 	struct xe_sa_manager *sa_manager = arg;
 
-	if (sa_manager->is_iomem)
+	if (sa_manager->bo->vmap.is_iomem)
 		kvfree(sa_manager->cpu_ptr);
 
 	sa_manager->cpu_ptr = NULL;
@@ -55,7 +55,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 		return ERR_CAST(bo);
 	}
 	sa_manager->bo = bo;
-	sa_manager->is_iomem = bo->vmap.is_iomem;
 	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
 
 	if (bo->vmap.is_iomem) {
diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
index 2b070ff1292e..2ef896aeca1d 100644
--- a/drivers/gpu/drm/xe/xe_sa_types.h
+++ b/drivers/gpu/drm/xe/xe_sa_types.h
@@ -14,7 +14,6 @@ struct xe_sa_manager {
 	struct xe_bo *bo;
 	u64 gpu_addr;
 	void *cpu_ptr;
-	bool is_iomem;
 };
 
 #endif
-- 
2.47.1

