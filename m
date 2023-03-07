Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E773C6FD1E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4819D10E3C5;
	Tue,  7 Mar 2023 09:25:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A1F10E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181129; x=1709717129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hhRri9E/ple1rq4INocdg5hRP0TAY6btik8n9f3qIKY=;
 b=kvKfniH0mvU4dpfDf1phaOihSX1YSYbcplORuwz9R0OQCb8fhufHR6gF
 nUgUhfrz4WKxLh3CTVA5GkBixrwOlCmRgs3q33nNJHbf0byYs77mDGXo+
 DfMjYWTMpAU6mf9bHjaYw92KFHYUvBMjRxidHdoCvXnCv/4xZkJL3h970
 RrpAppDlN4T2AHwGYnYEwJ+QjaeOGc40gbuFHxf1XKZUgPaQPw5vDjQlY
 DGLY5NtrTFn0BXyP4L9dFyiOMqfvIeUKzkqx5iKr/hRBvkE7+UIg7Jh41
 ORQ21IOZjgjZ1pHcKR3DqhIR8QdnA7pYfqRX6uxynAfgt+jI7PIQMggi2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079114"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079114"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798799"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798799"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:30 -0800
Message-Id: <20230307092446.1263266-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/19] drm/xe: Constify xe_dss_mask_group_ffs()
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

