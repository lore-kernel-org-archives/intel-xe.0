Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A849C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0A110E625;
	Fri, 19 May 2023 23:19:01 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D5610E621
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538329; x=1716074329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5k4mn8h+dHspKb+fJvffXEdhw4XwBoglrzkRrx1bSCE=;
 b=Aj7/DBVMmWIFEVkrR5QdOUR7xOPLUn0l9IOY4+5N0Wx+2TjHOzg929Qm
 k4hvgvkye1nrl9uIk7NPXaLq0Zb/+kz1z8+WG0T7UngDURW4Xzf/KlVIB
 czDLn2pqC9X0P0IrbYAtrh/xBiUcpl3B3kQe8V5RflMUSUT0GNda3mhjp
 RCoB3wRfFFCZa35/XXOgZGhv2LhJk10WqYFBaRX/4GITXqXglCyxI+Msq
 HKG5VHJpUnHUe5A+6Z+Cvr57d10sNeM9n+tDaJ/wnnr56u7W93C38DCe2
 i60Um7zj9ei8GavCapSh+sjGppphQOZHBTeTLmP4xzKpsssq5OcGk4mlB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526351"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526351"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888711"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888711"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:07 -0700
Message-Id: <20230519231827.3572452-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/30] fixup! drm/xe/display: Implement
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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
2.40.0

