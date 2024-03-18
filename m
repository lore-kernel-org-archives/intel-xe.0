Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404F7C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDCC10EFE1;
	Mon, 18 Mar 2024 09:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSCb12c6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091010F26A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710755375; x=1742291375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RBRt2ElFh99BexzF6lEv6SrMvyqVnourJJfUlVggsMk=;
 b=JSCb12c6z42LI8hGR38yc+AZVz48rNoJOY3vBaxhb+ftcPcLH1JoI9cF
 8H5VCUAb4RMQTIURrmQL4PydZkiGSSwQFk8ztUfM+Q7OHYwWGj98qva2E
 Y9wCtqf+MyJl41obuxEhv/56lAbVnK/Qz848U//wK30CNjZuEOQhE1wXD
 CDxH4f0LXKGS6r/yKQdj1FNpIPWxUuyxlw1kwyhkcOfvZraAalUstP2DS
 e8zzccNOUMZlMqhrIpUiKppIvmckT3uWyM2ztm0W+QUkrZWGQE4edyf15
 gsMsJahmZzks93wAU6SX0xw1/wPYSspHn2eC8RoxKr/sY9iIfm/1tVKIh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="30994308"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="30994308"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13390800"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:49:33 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Drop bogus vma NULL check
Date: Mon, 18 Mar 2024 10:35:47 +0100
Message-ID: <20240318093547.16326-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

The vma pointer can't be NULL here.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7f54bc3e389d..8d3922d2206e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -618,7 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
-	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
+	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
 	    (is_devmem || !IS_DGFX(xe)))
 		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 
-- 
2.42.0

