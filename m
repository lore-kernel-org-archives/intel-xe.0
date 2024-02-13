Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08357C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A2810E76A;
	Tue, 13 Feb 2024 21:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6F2pJoz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAC510E393
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707859475; x=1739395475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FOvaImr9zvpPF3gDZCqdqw1FGwXncLD+sKWNX3dfafo=;
 b=a6F2pJozu21zm8Rxs27+KkSAc9N9Ln4wje7E2JObDNPx/96l2CQiqEUk
 2ZlZYbf947O8iyxRYS9/Zw1/sdMBEgx29W2KKex4DQP9xo8+UnSsUhHwe
 /DDOWmxdhDk+eyurBeiwZLnwZixndPuyTUIGXJzfC1tmKU0RbQPY30wcE
 UpswIkom4GpnD7/TdOPRR4/zAK4/ruv64HPtAIpuKaUYGkCiTflzcGnc4
 XikXU5pM8ttvploljdPp5xS3OWV4jCQYdivDnLDVWSyMLhRnWUUYCFXUz
 ll1fmr2DNKcmzwOy64V+WDlsHVovP7fUuC8R5qaBSgKShZ3G9alkZGm4u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1741137"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1741137"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3042912"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:32 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe: Allow vram bo allocations aligned to 64K
Date: Tue, 13 Feb 2024 22:24:16 +0100
Message-Id: <20240213212418.1309-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213212418.1309-1-michal.wajdeczko@intel.com>
References: <20240213212418.1309-1-michal.wajdeczko@intel.com>
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

While today we are getting vram allocations aligned to 64K as the
XE_VRAM_FLAGS_NEED64K flag could be set, we shouldn't only rely on
that flag and we should also allow caller to specify required 64K
alignment explicitly.  Define new XE_BO_NEEDS_64K flag for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 ++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d6a193060cc0..9da8bf506ab0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1256,7 +1256,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
-	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
+	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
+	     (flags & XE_BO_NEEDS_64K))) {
 		aligned_size = ALIGN(size, SZ_64K);
 		if (type != ttm_bo_type_device)
 			size = ALIGN(size, SZ_64K);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index db4b2db6b073..657399b90429 100644
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

