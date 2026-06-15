Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F70CD98E0
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A807A10E6B5;
	Mon, 15 Jun 2026 20:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJoW0IJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6936910E69E;
 Mon, 15 Jun 2026 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555666; x=1813091666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GRiIaPdv51kL4tXXaVO8iy7dsTFFqKPi6J+qMjRXRSE=;
 b=DJoW0IJn70ivCnd4L8Xo4UNRhibqQxxhUhYLsfFyUKwesLjOiXp+MLVP
 39pq+iVdNBE2xMkQWnE8wgPgT30DvNgpDBUZTdNp4R+W4dzueZQ3RQrgG
 KokCQ6r+s9oLnXAmRnfgK8uR0e/lQvNKkM0dc8gNVqAnx083cf5mb6rHJ
 MTlXP62K8vR+bCJXVZu1Uw9H8m7HUU/QvTOZDM9LkS4EbkTMmh31X0zNT
 CtljkMeMSJC7gCRsROaF9tUgOnS1K14sKgh6FguPiJ4GB1hlOAHVgzKiR
 NmJru3FyF/YU1zklfBWrejqJ4kd+kNu4RCjIjOacc2zYlqBb8a4NViue/ g==;
X-CSE-ConnectionGUID: GKUWkGeKRy2xy1as0CNgpQ==
X-CSE-MsgGUID: 9xfzkcp8Q/eSGdVXqsoOWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694609"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:26 -0700
X-CSE-ConnectionGUID: UmJch4LxQ62qYrcIhfXyFQ==
X-CSE-MsgGUID: g8W619jyQD6qLCieDfMSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="252538603"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:24 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v3 6/7] drm/i915/bw: avoid replicating the
 update_sagv_status() calls
Date: Mon, 15 Jun 2026 23:33:54 +0300
Message-ID: <20260615203355.218578-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203355.218578-1-vinod.govindapillai@intel.com>
References: <20260615203355.218578-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Now that sgav status update is consolidated, need to update the
sagv status based on the number of QGV points only once after
bw info initialization is done.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 0d89f64db848..db2ee9de5eec 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -593,8 +593,6 @@ static int icl_get_bw_info(struct intel_display *display,
 		}
 	}
 
-	update_sagv_status(display, display->bw.num_qgv_points);
-
 	return 0;
 }
 
@@ -705,8 +703,6 @@ static int tgl_get_bw_info(struct intel_display *display,
 		drm_dbg_kms(display->drm, "PSF GV %d: bw=%u\n", i, display->bw.psf_bw[i]);
 	}
 
-	update_sagv_status(display, display->bw.num_qgv_points);
-
 	return 0;
 }
 
@@ -726,8 +722,6 @@ static void dg2_get_bw_info(struct intel_display *display)
 	/* Bandwidth does not depend on # of planes; set all groups the same */
 	for (i = 1; i < ARRAY_SIZE(display->bw.max); i++)
 		display->bw.max[i] = display->bw.max[0];
-
-	update_sagv_status(display, display->bw.num_qgv_points);
 }
 
 static int xe2_hpd_get_bw_info(struct intel_display *display,
@@ -775,7 +769,6 @@ static int xe2_hpd_get_bw_info(struct intel_display *display,
 	 * battery and plugged-in operation.
 	 */
 	drm_WARN_ON(display->drm, qi.num_qgv_points != 2);
-	update_sagv_status(display, display->bw.num_qgv_points);
 
 	return 0;
 }
@@ -876,6 +869,8 @@ void intel_bw_init_hw(struct intel_display *display)
 	} else if (DISPLAY_VER(display) == 11) {
 		icl_get_bw_info(display, dram_info, soc_bw_params, display_bw_params);
 	}
+
+	update_sagv_status(display, display->bw.num_qgv_points);
 }
 
 static unsigned int intel_bw_num_active_planes(struct intel_display *display,
-- 
2.43.0

