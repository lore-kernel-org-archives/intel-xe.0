Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA88C05024
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 21:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A948310E568;
	Wed, 20 Sep 2023 21:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2A010E568
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695244855; x=1726780855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8BluPmOdT5IzeBkubLdlIUo8XMurWhIvncs4fxNnDSU=;
 b=JI7gJGhEY0uyxyAHbcC4kt7em+JGvuk8daOPrZwGkG+WPO1hWM6yhxs0
 d8M4wtFsviO44+TCU+8YfpjzzYF7ljkPXVpnjprmkBwh36RL9AzZlrj/L
 gRYZgF6yA9T+gSpvQw+2XvMziD6+yRE3TmHhEVh/ID6ZYSbvJYjt4Onm3
 slihMCrEXzXtkeN8GZraYwWoDkMQm8qRPCPBy+Ut93rY3zle3cdwydq56
 uqWYZH+dukqTEyTT7rGAY14oSN47eTIx5b7yLKG1gwixj7PEaRcBDYDoe
 8L/d5fGZF4xLVfVUlF1DL4e04HVXE9GWoYLL+nxS5IdtYfDhXJpEq+ghN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383088522"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="383088522"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862156375"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="862156375"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:20:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 14:21:03 -0700
Message-Id: <20230920212103.2145677-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920212103.2145677-1-lucas.demarchi@intel.com>
References: <20230920212103.2145677-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/xe2: Report number of Xe2 EUs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With Xe2, one bit in the fuse enables one Xe2 EU.  Note that although
Bspec 62564 still refers to 1 bit == a pair of EUs, this is about the
legacy number according to Bspec 70820.

Bspec: 70820, 70821, 62564
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 011ad7f2325c..878f3ed7bc26 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -49,8 +49,8 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 	if (GRAPHICS_VERx100(xe) < 1250)
 		reg_val = ~reg_val & XELP_EU_MASK;
 
-	/* On PVC, one bit = one EU */
-	if (GRAPHICS_VERx100(xe) == 1260) {
+	if (GRAPHICS_VERx100(xe) >= 2000 || GRAPHICS_VERx100(xe) == 1260) {
+		/* One bit == one EU */
 		val = reg_val;
 	} else {
 		/* All other platforms, one bit = 2 EU */
-- 
2.40.1

