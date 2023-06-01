Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C11DC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB4510E519;
	Thu,  1 Jun 2023 00:04:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3910E1F0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577853; x=1717113853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ga7ssFBmADzMlmFBhQ2Wgi9o/xrY6r1gZcLUCF3P+Ec=;
 b=fQDazzxJ2OD/wHII74DHKz9E+uv9sca1kAikuFkeSprd/gTTM3eylmPJ
 UDnQObHl5eS2U5LrCdDggI/yKZnqopCRKK/krMTvTFVzom9dBKA6bPIrv
 wEacG/JXSyxbcq6LDGG0Qz/fdsk1w3tMH6S+OHZ8xd9+YEFkuhX2eYKdE
 EditYPsEDBkg0x+WsPF2bC9zzwcABZZ2mLDJEHzgbYenWzuGDfNZGFzdM
 93s9tpfwbLfgc0Z0RBov0aMZ0zOXPe3Oq/2jvH7PnV+0HaIa3Qe/Fg9zG
 6OEw2mlTmqmCVpwswnmqa1axhuoNJzJida/AsP1jL49gSPOwDIVjAc+AE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996833"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996833"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556184"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556184"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:43 -0700
Message-Id: <20230601000403.432517-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 11/31] fixup! drm/xe/display: Implement
 display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 41540b27775c..39dd97acae08 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -51,7 +51,6 @@ static struct xe_bo *
 initial_plane_bo(struct xe_device *xe,
 		 struct intel_initial_plane_config *plane_config)
 {
-	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_bo *bo;
 	resource_size_t phys_base;
@@ -84,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= gt0->mem.vram.size) {
+		if (phys_base >= tile0->mem.vram.size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
-- 
2.40.1

