Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D0C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 10:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ACC10E640;
	Wed, 17 Jan 2024 10:52:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7B310E640
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705488770; x=1737024770;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=s+qAKvUffz3ot7+KgqvuIcUnUaBrayJyioJ3bAdGmcQ=;
 b=FHOeW1NibhDmt3F3mQ/r56BKLchtbkJGoT9VRo/t+mjmNCqxpEne8zyD
 /+na8CnWr+Ib5fqRc/pqr1CbpZ8i4amXkDfpn8VTotxsafSo/r6ifNdLX
 cqWTQKj/Uxf32oVys3Vv8cKMgtRzUGdb6R8Je1DoAI2iDW+vrMbcdhpPO
 sCkLJQPHH7Sq++vL1VKohpRhi0vqM1ZNuOlMAkNb58UwS/KFqP5aFfdzk
 3i8HH3u5+bU0xmzZxvvztVbpqQE/YycWmQDTGaoS1ITeCugdZ+q47R84L
 z4T+spTsuSgKREZIBCw/rEBzR+q07s7QvH8wF54O7mNWn6tyRzMNk50PD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="486292282"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="486292282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="1842"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:52:50 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/5] drm/vmwgfx: remove vmw_vram_gmr_placement
Date: Wed, 17 Jan 2024 11:52:32 +0100
Message-ID: <20240117105236.121836-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117105236.121836-1-thomas.hellstrom@linux.intel.com>
References: <20240117105236.121836-1-thomas.hellstrom@linux.intel.com>
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Seems to be unused.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 28 ----------------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3cd5090dedfc..12efecc17df6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -942,7 +942,6 @@ vmw_is_cursor_bypass3_enabled(const struct vmw_private *dev_priv)
 
 extern const size_t vmw_tt_size;
 extern struct ttm_placement vmw_vram_placement;
-extern struct ttm_placement vmw_vram_gmr_placement;
 extern struct ttm_placement vmw_sys_placement;
 extern struct ttm_device_funcs vmw_bo_driver;
 extern const struct vmw_sg_table *
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index af8562c95cc3..a84fffcef8e1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -43,13 +43,6 @@ static const struct ttm_place sys_placement_flags = {
 	.flags = 0
 };
 
-static const struct ttm_place gmr_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = VMW_PL_GMR,
-	.flags = 0
-};
-
 struct ttm_placement vmw_vram_placement = {
 	.num_placement = 1,
 	.placement = &vram_placement_flags,
@@ -57,27 +50,6 @@ struct ttm_placement vmw_vram_placement = {
 	.busy_placement = &vram_placement_flags
 };
 
-static const struct ttm_place vram_gmr_placement_flags[] = {
-	{
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_VRAM,
-		.flags = 0
-	}, {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = VMW_PL_GMR,
-		.flags = 0
-	}
-};
-
-struct ttm_placement vmw_vram_gmr_placement = {
-	.num_placement = 2,
-	.placement = vram_gmr_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &gmr_placement_flags
-};
-
 struct ttm_placement vmw_sys_placement = {
 	.num_placement = 1,
 	.placement = &sys_placement_flags,
-- 
2.43.0

