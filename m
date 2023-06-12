Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16569C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAAD10E2B8;
	Mon, 12 Jun 2023 17:14:43 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5DA10E2B8
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590082; x=1718126082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qENs9McVbsuxs13j8EQnzBY8+/wNLmswlG/6rCjFhE4=;
 b=efjfWrZqOiEVfhS0h4ot5N9VfF7iRCm1uz6nydAaSwu8s6drEsrWMxA2
 AkTyEoZKxoNIn9RQB6RKhYAHNBp2aEaa9QhhKD9LDTBcexHUfqLELpw0K
 Fq7RuT3EZ6k4kuVRnxdDfLHw8QXWX+uE4hEpOY8QqmFZcfrPpgJA9ztKi
 rZHujo/QtNWBnJCS9b6WuVnzdmvR530JvSItVAfF/V2Kd1C5s+QPIjleH
 lJSDqcEaceOrI4KJWISUGeYzK1x3NAzaY8Y6Fl2xATM/SVNQQwMXJRK5Y
 ztdOH3prHbaf04NMJDJlvxvPuMlwh32x/FMoY60FcScNryTKs2xcuA6kB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792744"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715168"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715168"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:16 +0100
Message-Id: <20230612171225.88689-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 03/12] drm/xe/debugfs: grab mem_access around
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

We need keep the device awake when performing any kind of mmio operation.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/279
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

