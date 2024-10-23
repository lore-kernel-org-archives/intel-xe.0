Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383AFD0BB42
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 22:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA9E10E24C;
	Wed, 23 Oct 2024 22:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvLSp/7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448EF10E24C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 22:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729721494; x=1761257494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wkl0ffAtAwTsMAFRJ36lxDgAOOXDXalB1TtBCuFEOsM=;
 b=SvLSp/7NYV79b9GISFf1ytoQdylo+bck3K+sV0K3cPqV8vWJ55dS0Umg
 GJOQLrtik+5OM5EjCGtpLFdHWJIM7fRDJCk/mmzZlRY1GF0K0mtKwB7Kw
 VBfM6QxvY/d0oiIMO3ylGXf9P7nQ15CsbQQDK8tGp7L/LTXVC0Ew9fu2h
 dTwUYeipkmbX7ApZsApl0aWgWAfyB3VpKq/dtGBe/D1VCMiLxPIU9tB0X
 s2LlEExprNroOxY5GS7nNScB9xljnIs28ptFZnfa2xG17aEZAi9HDKP3V
 7JfHefaUId0J6Xfxum3Po1BrJuiNE2H2Sib/230CyHHHkjxyanTi4w/wu Q==;
X-CSE-ConnectionGUID: U3EL3bvCTly90tOArMg9QA==
X-CSE-MsgGUID: ccv0jsc5RtK3VNxgui7OhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33245384"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="33245384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:11:34 -0700
X-CSE-ConnectionGUID: Wq3BNvxlSQOiTJhvaSzg4A==
X-CSE-MsgGUID: 0jskL8+cSt66C8CodvZVzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80328000"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 15:11:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, thomas.hellstrom@linux.intel.com,
 paulo.r.zanoni@intel.com
Subject: [PATCH] drm/xe: Add mmio read before GGTT invalidate
Date: Wed, 23 Oct 2024 15:12:00 -0700
Message-Id: <20241023221200.1797832-1-matthew.brost@intel.com>
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

On LNL without a mmio read before a GGTT invalidate the GuC can
incorrectly read the GGTT scratch page upon next access leading to jobs
not getting scheduled. A mmio read before a GGTT invalidate seems to fix
this. Since a GGTT invalidate is not a hot code path, blindly do a mmio
read before each GGTT invalidate.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: stable@vger.kernel.org
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3164
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0124ad120c04..30f66277b726 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -401,6 +401,17 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 {
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	/*
+	 * XXX: Barrier for GGTT pages. Unsure exactly why this required but
+	 * without this LNL is having issues with the GuC reading scratch page
+	 * vs. correct GGTT page. See gitlab issue 3164. Not particularly a hot
+	 * code path so blindly do a mmio read here which results in GuC reading
+	 * correct GGTT page.
+	 */
+	xe_mmio_read32(xe_root_tile_mmio(xe), VF_CAP_REG);
+
 	/* Each GT in a tile has its own TLB to cache GGTT lookups */
 	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
-- 
2.34.1

