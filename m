Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C01C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 13:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7373010E812;
	Thu,  9 Mar 2023 13:18:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADD210E812
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678367904; x=1709903904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RXLHJo9tnTBEYGpORHDahqPCFS2Sf0H0VJPOptoxpyw=;
 b=dR5oo71KZYtoOUX4FiTycMQinO185wtrds0bYVAYf8C/ddJbHnrCQFi3
 GWkmi+mur+rusNR7er76EMgPB0bf1JirMUZfs3lMuDTfj61gHnTmbMFDO
 s13jOLby0QwRfwQYhiGr0Lq+WzvACMtZL+YJtY10Ah0IBdfJCjc6lVBrw
 SrEelkb4QL3IQCa8ezGNlVC8fOQ4Bs07e5Q0iJeWFOGUsAvzUCOOc0eVj
 A73RTDQ0n7a6zJ4EJEw4SJVDHq3iOS8c8kpcn8dbvGVeBOVe0tWykPmDN
 C/6eVLX7kXVVhqeyRrDwWwgwn3RUBYiEPMnDOgw1k1e88kzh9kO/dXAW0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320270618"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="320270618"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 05:18:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654746679"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="654746679"
Received: from rtauro-desk.iind.intel.com ([10.190.239.41])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 05:18:22 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Mar 2023 18:48:56 +0530
Message-Id: <20230309131856.1480173-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix overflow in vram manager
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The overflow caused xe_bo_restore_kernel to return an error
Fix overflow in vram manager alloc function.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 643365b18bc7..159ca7105df1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -118,7 +118,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 
 		cur_size = size;
 
-		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
+		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
 			/*
 			 * Except for actual range allocation, modify the size and
 			 * min_block_size conforming to continuous flag enablement
-- 
2.39.1

