Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8829EE7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 12:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D710E313;
	Fri, 13 Dec 2024 12:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRvXwByn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149CC10E313
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734091518; x=1765627518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LCjRVWpcZBGhW0HMGCq+B7gwylhE3p+P9sgcf/dKReE=;
 b=WRvXwBynEkXZJoBTOX4si7MQfCoVazIreZZeoLfTdnna3racuQHj3TuM
 no7waLd9InTYBppBPrswt8LV+WJ2VPi2PyIdndRL+KKSCUTUyhpmFtblQ
 T85vC+jV3gYXrLA7L/0/gN6f2C3ldvODZqoU3ex9JH1ha6OE3P4cP5uns
 CSq9AbgqepJevF1Fj5dthbriabm8mQq19txv3bNK1ME5ahhTc2MSsUjMx
 pvB/qcTyWdi9GnQ7nRaB8x3aJ7vaDX1BKwWd1BSuNSptE71+6/l8wI2Cc
 HTQ04gH4BkUHp/wW/KLilx0h60E6/w5EZm0BcPIDOwlMjI8KVwYeAG6ke w==;
X-CSE-ConnectionGUID: qNAls1wPRRqe0F0BYBaHmg==
X-CSE-MsgGUID: h9Q/+/wKToOpTZHTg6p3xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45951327"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45951327"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:05:17 -0800
X-CSE-ConnectionGUID: e9UbHqKpS1qpGcwbRqh8MQ==
X-CSE-MsgGUID: 6PC0MzlKRjyG7jMKuPReNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="127330960"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:05:15 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 1/2] drm/xe: Use non-interruptible wait when moving BO to
 system
Date: Fri, 13 Dec 2024 13:24:14 +0100
Message-ID: <20241213122415.3880017-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Ensure a non-interruptible wait is used when moving a bo to
XE_PL_SYSTEM. This prevents dma_mappings from being removed prematurely
while a GPU job is still in progress, even if the CPU receives a
signal during the operation.

Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 283cd0294570..06931df876ab 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -733,7 +733,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	    new_mem->mem_type == XE_PL_SYSTEM) {
 		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
 						     DMA_RESV_USAGE_BOOKKEEP,
-						     true,
+						     false,
 						     MAX_SCHEDULE_TIMEOUT);
 		if (timeout < 0) {
 			ret = timeout;
-- 
2.46.0

