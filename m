Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A458C54ECC
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 10:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FFB10E0C5;
	Wed, 28 Aug 2024 10:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJmu1HnE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE610E0C5
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724841844; x=1756377844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lVsX83B0f5Cr/blwSq1KWLPR6SPIvQFpb72+6iRazqc=;
 b=jJmu1HnEnWOhzdRxJ5HziM7uNCH9smu0geFt/mC4oxBUNdS0LSgmJREv
 enbuLax/x0E6a7s+nY/w4KIWQlYwnxeHoapkyke/VeaOcj3B7bYkoJk5A
 6/X02J87iWJkRdBE7q96XECOsQ1DUevQbPav3U6DbEUTDdlLh2haK0nG8
 ZVqxZ0COVkW5tMfQV1jNNuXx3R+fHz1bf8QlOS2asZx/fqtrw29SIWfk5
 ekKnxPwy7HvGGSvaTD/+tdjwYbjm3bTvnGwtt23q3oqC0HZ3ia0ePnp6D
 78DdHZlMEdM3bx/MXD4403vL7hmAnTOXQHjUhs+A9KvzxADoU0SwK96G9 Q==;
X-CSE-ConnectionGUID: mHNvMjfKRT6ClyzOR1IdBg==
X-CSE-MsgGUID: PDvo203eTD2vV/qL67MwKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45881583"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="45881583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 03:44:03 -0700
X-CSE-ConnectionGUID: ebcMjllWQ0KvXLn2ttJOxw==
X-CSE-MsgGUID: bHZWNIIdQa25A0UX9eCYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="93971276"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.176])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 03:44:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: prevent potential UAF in pf_provision_vf_ggtt()
Date: Wed, 28 Aug 2024 11:43:42 +0100
Message-ID: <20240828104341.180111-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

The node ptr can point to an already freed ptr, if we hit the path with
an already allocated node. We later dereference that pointer with:

	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));

which is a potential UAF. Fix this by not stashing the ptr for node.
Also since it is likely a bad idea to leave config->ggtt_region pointing
to a stale ptr, also set that to NULL by calling
pf_release_vf_config_ggtt() instead of pf_release_ggtt().

Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 41ed07b153b5..be198a426cdc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -390,7 +390,7 @@ static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_confi
 static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = config->ggtt_region;
+	struct xe_ggtt_node *node;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	u64 alignment = pf_get_ggtt_alignment(gt);
@@ -402,14 +402,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (xe_ggtt_node_allocated(node)) {
+	if (xe_ggtt_node_allocated(config->ggtt_region)) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
 
-		pf_release_ggtt(tile, node);
+		pf_release_vf_config_ggtt(gt, config);
 	}
-	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
+	xe_gt_assert(gt, !xe_ggtt_node_allocated(config->ggtt_region));
 
 	if (!size)
 		return 0;
-- 
2.46.0

