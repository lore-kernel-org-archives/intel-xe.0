Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747B9C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 10:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4704B10E4BC;
	Wed,  7 Jun 2023 10:05:29 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEE810E4B2
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686132326; x=1717668326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Hb9oYCY541Kb/VobVvfVBbIq43gZ7eqDjnFzcZNwe8=;
 b=dQfhljNHxPhxh6TZe0jMm+br+e31AOkDutwsVUokYHJJjtaYwnVnJeUd
 2unN3ksC2WbrtZHN3/HcpzVDLv3khhGgmecn8AWVK5wmZeBX5ckejFNec
 Sv3UwhyfvMFE9EqdSdpKS2/4jx+GrNs7E4ywR4upHI/JTpWuJVPT07Vt3
 8zKM6i0NpEqBR6rB6hJg3h9Ttxpv1TfPPLGOaG2t/XBiIOywnHBGChcz6
 tjMkF5al+MujQ4ASLEC+uR0wyBhs3QAQ87G+/mgepWqVTAUKUDJq8DHrK
 S9EO9KZCZd5gLU9NHgL8ae+P8h1cd7QQ30IRBZWQGh/iJy3yyoESvo6A0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356954279"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="356954279"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 03:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="1039539923"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="1039539923"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2023 03:05:25 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 15:41:02 +0530
Message-Id: <20230607101103.2127088-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 2/3] drm/xe: Add GTs under respective tile
 sysfs
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

TODO: Currently we have gt0 under tile0 and gt1 under tile1
on multi-tile. This GT indexing still under discussion, when
it is concluded we need to revisit this change.

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

