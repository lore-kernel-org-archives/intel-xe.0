Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C341E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 11:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F1C10E5C4;
	Thu,  5 Dec 2024 11:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9Fmi58e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FD610E5C4
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733399040; x=1764935040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n+x1pIJjNfvIgy3xw8K31DI2iRX6JG7FfduX731pJWE=;
 b=b9Fmi58eGvbr/Wp8Kyg4nxEkz/4+VA4NLrv3z11TLf9S0fY92/1f74nV
 G7i3HRlaKKdzGivLBGA1wEF4QubRy0Om/KAwy00ucSyrJzXhc+idFLWGd
 XK2uJWW+aBkyMe6s9j3KyiGPkbSu2/e10aEfqQWaIf2PLMANzUq5xGKml
 rXjLdQOGTVr5Ugdj3wdBZydq7ODqyCG2hTzdirGYN2hgTqUpsymsxUqSC
 V01wwLaGn+ZPW9urubF+SMsqTcN2+bIJ+dBV3+NvVV/L+zbPoLv1lz7pZ
 By+WU6OePjehGuR3WJ+DKVS6TEt/DXOti09xNdt/hmbexFugiIl1TlIJT A==;
X-CSE-ConnectionGUID: RhlHIKFiQZKB4XDwGYOoZA==
X-CSE-MsgGUID: +WF3EiIdRWWqthYkss6vDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44376693"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="44376693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:44:00 -0800
X-CSE-ConnectionGUID: BmAM3tYUTS+Z1M9zzWt8Ag==
X-CSE-MsgGUID: m/UIEkzMSSCoF22RjwIFUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="131499502"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:43:58 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Use non-interruptible wait when moving BO to
 system
Date: Thu,  5 Dec 2024 13:02:52 +0100
Message-ID: <20241205120253.2015537-1-nirmoy.das@intel.com>
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
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 73689dd7d672..b2aa368a23f8 100644
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

