Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5E3C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 20:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D10810E863;
	Wed,  4 Jun 2025 20:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fd+sMnTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02E610E864
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749068962; x=1780604962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3zTSExgdmGhy6y+qU+52IeYgXYfl2bPkAPRQdUtvdVU=;
 b=Fd+sMnTPdsJ3A83rfUZV/otvYDsNooK5qVtivf+Q7ej5V3rrmMJj8jn/
 cprsCIKlEwwXkm3ZXq7UqkxKMCq6vZsdl1u9P6rU5BsSp6rQNRxq+7Mg5
 bSYxzmxFhosTxoUm3xVq0vb66Mkaskx+r53LjO9X8ggHT1TUaaZk1v9mZ
 dcnQV/F6QasBlMP6KXk+1rDEuHOMks7TrFtzH9SIROFzK/lqM7L1t8XVY
 SFxosl/a5dJFW6ZqWchsxcxnplq0PYLYWYvc8tYHJeB8jE4pnVF+5UXqV
 YnWMunizsA5fjZ9I5kEkHBRM+HEglfZM6HdOZzq2XpAt8jTr6CTl9Ku1V Q==;
X-CSE-ConnectionGUID: 7ZL58fTIQSC/JUXagLoYVw==
X-CSE-MsgGUID: AhuNg6svSnm5gHx5eWcEqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51039071"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="51039071"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:22 -0700
X-CSE-ConnectionGUID: rNksfTSHRRiWGbCLcN484Q==
X-CSE-MsgGUID: 916wjBZyQyW4/15szyxs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145257217"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/3] drm/xe/topology: Use register array size instead magic
 number
Date: Wed,  4 Jun 2025 22:29:07 +0200
Message-Id: <20250604202908.769-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250604202908.769-1-michal.wajdeczko@intel.com>
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
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

Since we keep registers in the array we can simply count them and
stop relying on magic number when checking if didn't make mistake.

Also we can switch to use xe_gt_assert() since it could be just
our programming mistake during platform bringup, no need to keep
drm_WARN() in the production driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 62bfb6e1a166..048743913b36 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -236,8 +236,8 @@ xe_gt_topology_init(struct xe_gt *gt)
 	 * Register counts returned shouldn't exceed the number of registers
 	 * passed as parameters below.
 	 */
-	drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
-	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
+	xe_gt_assert(gt, num_geometry_regs <= ARRAY_SIZE(geometry_regs));
+	xe_gt_assert(gt, num_compute_regs <= ARRAY_SIZE(compute_regs));
 
 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
 		      num_geometry_regs, geometry_regs);
-- 
2.47.1

