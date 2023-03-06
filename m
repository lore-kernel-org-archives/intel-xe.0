Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9BAC61DA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 17:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316D910E408;
	Mon,  6 Mar 2023 17:50:51 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE0010E408
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678125050; x=1709661050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hhRri9E/ple1rq4INocdg5hRP0TAY6btik8n9f3qIKY=;
 b=agR1Vi4j2CkoOCL9CZ6DMjWYOjYetvyzMg5HNgti83zVZ4Vlu9UmYQx5
 5quLOYXmz0ovQa+/tiOLRvcffTfqo62cga6/vQEeGc9jvEKBQttmMP9JU
 EaVPmzXvJFSe9ktoa0XgND1OZKBEbBbFfrx3OmYkC3e8xQ+6QYosjAFT9
 b1gpq9lIqcID9Z3JcShCTr2l1rZcStq+L8XeKzlF4n6OEocIqInQJYHru
 w0dZpCq7SSV/hkCl3uFMgAVxPGACbBR2bMAEl/DIlJ2LqPdIkOz+T3Exu
 Cm0M/TzgY+rTd7LPMCQ/8Tui2zIkgCLJ8rWzdPNHe2CnieGWGmiTgT1JI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337949799"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="337949799"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676241567"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="676241567"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:50:48 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 09:50:24 -0800
Message-Id: <20230306175025.720323-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230306175025.720323-1-lucas.demarchi@intel.com>
References: <20230306175025.720323-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Constify xe_dss_mask_group_ffs()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Due to how xe_dss_mask_t is implemented, the type is a pointer. Since
this is only used for looking up the bits, make it const so it can be
used together with a const gt passed around.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
 drivers/gpu/drm/xe/xe_gt_topology.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 2123f84be336..967f2349c67a 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -109,7 +109,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
  * groupsize and groupnum are non-zero.
  */
 unsigned int
-xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum)
+xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
 {
 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index b2540dc266f2..2375f005e0c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -15,6 +15,6 @@ void xe_gt_topology_init(struct xe_gt *gt);
 void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 
 unsigned int
-xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum);
+xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
 
 #endif /* _XE_GT_TOPOLOGY_H_ */
-- 
2.39.0

