Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A459C7EE2C
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6332610E22F;
	Tue,  6 Jun 2023 11:07:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6790110E21F
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686049638; x=1717585638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvv/OLGM/XqGM3luzBYPJ4A10gk0qSUlLi5VdZbCJSM=;
 b=iCr4WFRMaLMaFXMTa3v1nzsYIW3RIfvojMbwwFP9vM/05d7ltD4fs9rJ
 eZcmsYyEQK56RfQGTTdA6tDJFmr1k2A//fo/NjO6CmTglbXyoXUiG3mVn
 iR6X7aB7RJAZAJOUyVrZpv5J0o8JGHTpVW9luWcYdiJRb+H0FUZcKdmvO
 1PAWNhbOu/cRliHxuMKyyC6Jm8+nGpbjE6dTuLWj3m5AivE8RqAdHcSY5
 bJj5YrayYaL7bgWQNkL+lLbcjiXpw/x4KUeMFCxAIh6by/16T7iMU4jRp
 jXzkWYEWBBsVH0/YQbUpoMaNpZlrtfmPqeXsCRssGroESE8iOClr0hsRM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443013968"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443013968"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955711826"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955711826"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 04:07:17 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:42:54 +0530
Message-Id: <20230606111255.2072426-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add GTs under respective tile sysfs
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

With the separation of xe_tile and xe_gt, We now consider
a PCI device (xe_device) to contain one or more tiles (struct xe_tile).
Each tile will contain one or two GTs (struct xe_gt).
So lets align sysfs paths accordingly.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index c01cc689058c..13570987a756 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -31,7 +31,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
 
 int xe_gt_sysfs_init(struct xe_gt *gt)
 {
-	struct device *dev = gt_to_xe(gt)->drm.dev;
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct kobj_gt *kg;
 	int err;
 
@@ -42,7 +42,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
 	kg->gt = gt;
 
-	err = kobject_add(&kg->base, &dev->kobj, "gt%d", gt->info.id);
+	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
 	if (err) {
 		kobject_put(&kg->base);
 		return err;
-- 
2.25.1

