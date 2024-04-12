Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F78C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5F10EF2A;
	Fri, 12 Apr 2024 09:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwLH0pBY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027A6892E4
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914641; x=1744450641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnL1yEi35beqSfZ+Q62A1YhavDzbHR4/S+JjcG/tjD4=;
 b=lwLH0pBYYU3IuPkIYPw61IplbRaK49H0RiNLhzFtrb9YZtaZSsEAfrga
 zLuycykX3vXrxF83+2V3elI5QGmCgdvVpTWq+6W4XiJKaH1JQSGGw/dAl
 /IPltW1siKEpRAMrl2JZC/eHE4NbUdBxSdGMAGLjwhx5Mvw9Ojp51x0u1
 7uSIIalLK6huzyA6/G+E5UsFIJpUHmqSpTjxVyGtWz8J+xUqG/+JgVSfI
 3Ht52POZXacEZt8bVSqbXm4s/msl8whIkX1KGKAjmd0dUpUwMXglnbtP8
 wktFQp+w9acMny076fEkXDBNAoqfCTbXpLqvN7nr4OPi5hURUPvnd5lzH A==;
X-CSE-ConnectionGUID: k1QBiVTsT1GGWL2+M/c4ZA==
X-CSE-MsgGUID: e7BjsXCITTCAR1gbxGRXeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19075945"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19075945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:01 -0700
X-CSE-ConnectionGUID: M6xxHrhLR9yl8sItGu41Bw==
X-CSE-MsgGUID: JuZrezceQiqObE3VE2UQNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52342152"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:00 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 3/7] drm/xe: Add function to check if BO has single
 placement
Date: Fri, 12 Apr 2024 11:22:45 +0200
Message-ID: <20240412092249.3636-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412092249.3636-1-nirmoy.das@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

A new helper function xe_bo_has_single_placement() to check
if a BO has single placement.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fdeb3691d3f6..281126667ba7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -94,6 +94,20 @@ bool xe_bo_is_stolen(struct xe_bo *bo)
 	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
 }
 
+/**
+ * xe_bo_has_single_placement - check if BO is placed only in one memory location
+ * @bo: The BO
+ *
+ * This function checks whether a given BO is placed in only one memory location.
+ *
+ * Returns: true if the BO is placed in a single memory location, false otherwise.
+ *
+ */
+bool xe_bo_has_single_placement(struct xe_bo *bo)
+{
+	return bo->placement.num_placement == 1;
+}
+
 /**
  * xe_bo_is_stolen_devmem - check if BO is of stolen type accessed via PCI BAR
  * @bo: The BO
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a885b14bf595..6de894c728f5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -206,6 +206,7 @@ bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
+bool xe_bo_has_single_placement(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
-- 
2.42.0

