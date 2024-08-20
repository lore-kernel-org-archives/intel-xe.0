Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A036C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E01310E525;
	Tue, 20 Aug 2024 08:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQf6rf8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE25B10E525
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724143504; x=1755679504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4eMJTWnIZvnmL97i1KaEQ0YSxpKhqC8ZDdHrW1eXINU=;
 b=cQf6rf8JtSwf1YegjVTHaflvFIuchGD8eE59zdRksoMp0ZqaDZ9iWvGZ
 afeg6LGM8V+V8I/hoEKLshf7byM8xjtojk9SGGyxTPnhKtojKGH2txnT9
 hxquvQP1xT3SRd1KwEW0qvBt2FumaJwAkDTEhCOqAloquCChNSyWFuV7e
 lG4QUNYJ+E6ZBzyanvGGqmL0UjxMU/I1UUgkrTnBB4WL5qWFBAsRGsBDb
 Ct1ok7C412HSoI7MOBZMlOCHVPiBFPBFyRLeYsJG5zWxIMKQW/IayUQsO
 2QzpIbVSXOpOZuqu4B1a+L2GWdM+kVyb+SyWbMhY9aSJp4IG4yPyHa5kg w==;
X-CSE-ConnectionGUID: J8SwibyPS12Y2/UlE2tpVg==
X-CSE-MsgGUID: xbHdxnbCQpOsyiAiJOEwGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22606792"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22606792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:45:04 -0700
X-CSE-ConnectionGUID: vWTWbpAYRKKIAs03VLk2Ew==
X-CSE-MsgGUID: AZYp15a8S/+WYT/RUZK9/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60701202"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2024 01:45:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/3] drm/xe: Remove unrequired NULL checks in
 xe_sync_entry_cleanup
Date: Tue, 20 Aug 2024 14:32:29 +0530
Message-Id: <20240820090230.3258128-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
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

dma_fence_put() and dma_fence_chain_free() can handle NULL input,
there is no need for NULL check by caller.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index a0675f57a398..436faff09bac 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -249,10 +249,8 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 {
 	if (sync->syncobj)
 		drm_syncobj_put(sync->syncobj);
-	if (sync->fence)
-		dma_fence_put(sync->fence);
-	if (sync->chain_fence)
-		dma_fence_chain_free(sync->chain_fence);
+	dma_fence_put(sync->fence);
+	dma_fence_chain_free(sync->chain_fence);
 	if (sync->ufence)
 		user_fence_put(sync->ufence);
 }
-- 
2.34.1

