Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0463EC54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 09:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904CF1123AB;
	Thu, 28 Mar 2024 09:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYSpvRJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912301123A6
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711619127; x=1743155127;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tcQ4DWII7a5vFVqrDp1AZ/G+iqHwm15Ml6TIhcKLkTk=;
 b=cYSpvRJ3koCMVrwBphVHXsUxJwqKsZVwO0tZDvuN2uJ+OThq5ia1VpNV
 zrBqbN58ahPq9+KqFW/lh/RPgobRo6w6qS0qla3feeY735FDo0+GTBrhZ
 vFdBoXIZ8eEZO6AdRb8ezfVI3bku92MPjEyDb2yIEMT60lzOyUxzzDCx5
 t8qeHTseOmMBM1tRbKYmi+0JNZo33+PHiV4axo98Lwx7tAprZPXQBZf5w
 AfdyxtevmXGjWOEGQA92l64uvzjCvMYR7tS5Kuom5GGZwUOxtOsX3KwBv
 J52Z1dapjAODdG5/nPY9egPN5U0+/H8jkR9lOHGNTrtUgfNfV3e30IUqm A==;
X-CSE-ConnectionGUID: zWOPJk8/Ts2x4bFPEVzNzQ==
X-CSE-MsgGUID: n5cU3t5UR8Wm1XegoTNs9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6615442"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6615442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16611731"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:45:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 4/8] drm/ttm: Allow continued swapout after -ENOSPC falure
Date: Thu, 28 Mar 2024 10:44:50 +0100
Message-ID: <20240328094454.272050-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240328094454.272050-1-thomas.hellstrom@linux.intel.com>
References: <20240328094454.272050-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The -ENOSPC failure from ttm_bo_swapout() meant that the lru_lock
was dropped and simply restarting the iteration meant we'd likely
hit the same error again on the same resource. Now that we can
restart the iteration even if the lock was dropped, do that.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e8a6a1dab669..4a030b4bc848 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -168,15 +168,20 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 
 			num_pages = PFN_UP(bo->base.size);
 			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
-			/* ttm_bo_swapout has dropped the lru_lock */
-			if (!ret) {
-				ttm_resource_cursor_fini(&cursor);
-				return num_pages;
-			}
-			if (ret != -EBUSY) {
-				ttm_resource_cursor_fini(&cursor);
-				return ret;
+			/* Couldn't swap out, and retained the lru_lock */
+			if (ret == -EBUSY)
+				continue;
+			/* Couldn't swap out and dropped the lru_lock */
+			if (ret == -ENOSPC) {
+				spin_lock(&bdev->lru_lock);
+				continue;
 			}
+			/*
+			 * Dropped the lock and either succeeded or
+			 * hit an error that forces us to break.
+			 */
+			ttm_resource_cursor_fini(&cursor);
+			return ret ? ret : num_pages;
 		}
 	}
 	ttm_resource_cursor_fini_locked(&cursor);
-- 
2.44.0

