Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335BAE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C5410E3B4;
	Tue, 10 Dec 2024 15:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGI6VRhb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9634610E3B4
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733846216; x=1765382216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LCjRVWpcZBGhW0HMGCq+B7gwylhE3p+P9sgcf/dKReE=;
 b=cGI6VRhboXvTZJlZDspu5m36gfwjQ9WLYtDhDrkKdvySiwaHJJGNnO2M
 2DSwAAWOPUFRiiA3SKrTXPacVU2bNg51GgsBJF0hT2NMp1oYHGiMFi/Px
 JTjr4WjPjSMSw97av/buZ0zaPoaRiLYX+vas0cU6mCycTkQHOVcXYd9Bh
 3nNKMES90+iL/Z9rUv6zOBOcR9bISHWmxqJKyXBy4x8scO/PzHQVPUjA0
 r/u/IP/SZCgavjrV29Bzjhx20QzW09USpk3kXbLlDjKRK5xZDDTsB58HJ
 fUkuV3w5iqvHUX3+Wyi/bs3XrZP1wDVZ5qxbVzVwYJAthd2LaxrRNJZjv w==;
X-CSE-ConnectionGUID: jYNUIDyGS0uo1/B1OyRdgw==
X-CSE-MsgGUID: zO8ZbIRYQT2qYg8u9Sgcaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34117414"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34117414"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:56:56 -0800
X-CSE-ConnectionGUID: j4QT25vqTeeMRcpPzqtZqg==
X-CSE-MsgGUID: IoGZcrBaTRKQwYZQ8t1kaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95261339"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:56:53 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Use non-interruptible wait when moving BO to
 system
Date: Tue, 10 Dec 2024 17:15:51 +0100
Message-ID: <20241210161552.998242-1-nirmoy.das@intel.com>
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

