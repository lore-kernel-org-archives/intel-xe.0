Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E8CC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 23:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650C110E0DA;
	Fri,  2 Jun 2023 23:52:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE7210E130
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685749937; x=1717285937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFHqH1CyImKPsWgIMeh0F+SAI3zlfTdWj7h0Qy71K6A=;
 b=EbXDWkpllvniR3MM4ozNsHgX4fil5rJ5gogA0n6VEI0Rqy4DPNFH70QN
 KNnyL3FOB2OJPpLUZZ/Qtc7LL4Sza4FdJU04FMkDTN/2+AGGwNVlVDU9Q
 hsdtUwwtLjJF5ns3bKe0js3grciBwwkFz1qcIuCsnkX0ThXzr6I+gYin8
 6Gec3NoCJKHfgqBHgW68aNw+9kr0mdoNN8iVvLRv0D3KKLWsZz5dpKKKT
 tCRLIaN+j7wxN3Y9O8dsG8JHkvCgUCl6m46sZKP/Y3mUz9khUFkFazEP8
 RvBarco6SLsi4hQmZ7XWB5H+KhqSp1+Xv2ZZTgMKt9Egb3NszlIJ7nAMU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354849610"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="354849610"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658430471"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="658430471"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:52:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 16:52:09 -0700
Message-Id: <20230602235210.1314028-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602235210.1314028-1-matthew.d.roper@intel.com>
References: <20230602235210.1314028-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Initialize MOCS earlier
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_mocs_init_early doesn't touch the hardware, it just sets up internal
software state.  There's no need to perform this step in the "forcewake
held" region.  Moving the init earlier will also make the uc_index
values available earlier which will be important for an upcoming GuC
init patch.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 335148f1cd39..3799e663bad3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -315,8 +315,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	/* Rerun MCR init as we now have hw engine list */
 	xe_gt_mcr_init(gt);
 
-	xe_mocs_init_early(gt);
-
 	err = xe_hw_engines_init_early(gt);
 	if (err)
 		goto err_force_wake;
@@ -429,6 +427,8 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_mocs_init_early(gt);
+
 	xe_gt_sysfs_init(gt);
 
 	err = gt_fw_domain_init(gt);
-- 
2.40.1

