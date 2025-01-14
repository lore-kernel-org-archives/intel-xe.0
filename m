Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD9FC02180
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 00:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB3410E092;
	Tue, 14 Jan 2025 00:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiIFX44Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C3410E092
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 00:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736814283; x=1768350283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kzRHaZxzpyQXThOawXDuKGIAEEE9+ymXaJ02TOmJXo0=;
 b=AiIFX44Yz1cYOyiEl2YkZNhWL9i7TVFXDmBL3lbVYrVNzemrRuvWr1I1
 3Z0QD9tZdmmQZV7Yd3NSy3VC6y3pPpcHQLirapOLBjsg6DMlMhWU26kZ5
 onHO+6RPy/WmFAS9RFH40+FkabnwCrfvwjc20s+LhiolPxrP/zxUDGc4H
 afFLD3goXsu0Yu2NKjiWMZYiRlTCNApzl2WfmfeezY2g8AtcvT/o9MrBY
 rVuYYrZuHaA1s3yFcyTW5DJ1OsQOaipPaGlmmGR6sAQjgwGv39c9O3sOa
 lDMx8b4n3VyV1JPyolf5S7zWGqn8cmsciI4FN3opjg3t0BLqYOAaJLbzT w==;
X-CSE-ConnectionGUID: JwWZ9KswTlavBzwBGIJF7Q==
X-CSE-MsgGUID: TO35Di1+StC/l9YUeYkLig==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36309138"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="36309138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 16:24:42 -0800
X-CSE-ConnectionGUID: bs6zAypmToiVwYooCgWrQg==
X-CSE-MsgGUID: JGNUcnA6QNq6e7jssMswBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="104463320"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 16:24:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, balasubramani.vivekanandan@intel.com,
 jose.souza@intel.com, paulo.r.zanoni@intel.com
Subject: [PATCH v2] drm/xe: Mark ComputeCS read mode as UC on iGPU
Date: Mon, 13 Jan 2025 16:25:07 -0800
Message-Id: <20250114002507.114087-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

RING_CMD_CCTL read index should be UC on iGPU parts due to L3 caching
structure. Having this as WB blocks ULLS from being enabled. Change to
UC to unblock ULLS on iGPU.

v2:
 - Drop internal communications commnet, bspec is updated

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: stable@vger.kernel.org
Fixes: 328e089bfb37 ("drm/xe: Leverage ComputeCS read L3 caching")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ac9c666a9652..fc447751fe78 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -422,7 +422,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	 * Bspec: 72161
 	 */
 	const u8 mocs_write_idx = gt->mocs.uc_index;
-	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE &&
+	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
 				 (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC) ?
 				 gt->mocs.wb_index : gt->mocs.uc_index;
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
-- 
2.34.1

