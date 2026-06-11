Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E76CD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 15:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C210E7D9;
	Thu, 11 Jun 2026 15:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUazzl4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BC610E7D9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781193160; x=1812729160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nXeLWjRZ05oyqqNMzT6/AbLxRr6/mP3utP+wBOZjS/U=;
 b=UUazzl4WsLh8Pcki/rANKPu54TkKmKqvLMbeqEcSHo7XRi/luc778VC8
 Z/NdN8Ryiob25eApAPNiDIC/n8zk8kR6j2gCD6KYI+JN3Q3shIQhCQUW/
 9agL9JSm5VzpuJ/1J7TwD79KUhOR0cO+HhObaziKyfbhcZgYOLC82OLB6
 EcIxntGuWQukvzXyijM2gVKEGcU5t3sX5gd/O6TP+TfTUrgQdqsbRUCq3
 0jy05xkg59pCGKr3Y6AYyPxizKOrZj52RtINDcUXaCzSYCOrOqOrSrMnL
 N6vbPlWLxqNnWHypGWEJkhNRrCyP7vntcrT6VX2aWC2dDA+ZcQYLXSBpc w==;
X-CSE-ConnectionGUID: aA0+EKukT6WH4vF5tVV6Mw==
X-CSE-MsgGUID: NuXom302QDOGdtkMCYi8tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92330843"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="92330843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 08:52:40 -0700
X-CSE-ConnectionGUID: okGXgihHRXS6MLs08oV2yQ==
X-CSE-MsgGUID: nEDVAItmRvKR5dk8ZYnIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="250439466"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 08:52:38 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
Date: Thu, 11 Jun 2026 21:58:29 +0530
Message-ID: <20260611162828.3879694-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Apply Wa_16029380221 to Xe3p_LPM.

The Xe3p_LPM media page walker is hard-wired NonCoherent and cannot
observe CPU:WB cached page table data. Force page tables to CPU:WC
by clearing has_cached_pt when MEDIA_VERSION(3500) is detected.

v2: Simplify code comment to avoid duplicating information
    already present in xe_wa_oob.rules. (Gustavo)

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 9 +++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..0d4d525a410b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -948,6 +948,15 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	/*
+	 * Wa_16029380221: The affected GT will always use non-coherent
+	 * access to page tables, so we must do uncached writes from the
+	 * CPU.
+	 */
+	for_each_gt(gt, xe, id)
+		if (XE_GT_WA(gt, 16029380221))
+			xe->info.has_cached_pt = false;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f8a185103b80..9027365f0043 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -65,3 +65,4 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+16029380221	MEDIA_VERSION(3500)
-- 
2.50.1

