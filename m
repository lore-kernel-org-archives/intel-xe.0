Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF57FC7EE2D
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF1610E5DB;
	Wed, 24 May 2023 17:57:44 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED17C10E5B0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684951061; x=1716487061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WRr2+r/JCJ3z0vcP/CP0mdaVXMMm+qMm342Od0JCOMs=;
 b=RwwQmmreSjObeoNfkHQHkeYoVZNLo6mxCZ3BlkEl48NN5SttfTwdKZru
 nBHbS5cMK4IxAJ9J1XANMtVmZIx19DeC7b4sbIIsyyIhZYXDtPdA6KgQS
 EeBR+LYrE7Fk8q4UczDIkOBEDXYHH2xLxMy+bfZKfr1Xo1yQP0xogtTBT
 D7rYIXXDc9DlqlpsSSKgB4hhH9iyceyuicheAazUd8TEMAcCJxWx6FEV3
 ImKKGrvcGnZIBaLLwLgDOWStIX391psM8evy6/Gc/nR5ra/mFGU6W3zv4
 KBX+qm/U6DZevG0ean/Zo0M+DnH4+OUARwtF2WE66js8OOlpAkhP8g5u5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333266950"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333266950"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698629073"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698629073"
Received: from cannonro-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:57:01 +0100
Message-Id: <20230524175701.320653-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524175701.320653-1-matthew.auld@intel.com>
References: <20230524175701.320653-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 9/9] drm/xe/debugfs: grab mem_access around
 forcewake
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It looks like we need keep the device awake when holding the forcewake.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/279
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 7827a785b020..047341d5689a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -70,6 +70,8 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	struct xe_gt *gt;
 	u8 id;
 
+	xe_device_mem_access_get(xe);
+
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
@@ -85,6 +87,8 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
+	xe_device_mem_access_put(xe);
+
 	return 0;
 }
 
-- 
2.40.1

