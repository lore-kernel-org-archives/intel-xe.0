Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE52DEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 11:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A98310E234;
	Mon, 17 Jul 2023 11:25:44 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B87910E0EE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689593143; x=1721129143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=invoOD6CCJ1cHbUaXLv5OCMbhTDmFV4nrcYHX/hhJjo=;
 b=hgziLBIijNjiQTCdeYoMIYpr3mm9nsFiHRplnxHWr7vdSsFWQblSvy3/
 N42+HL++EQuW7E0E30H6WDh0Zb0aiFu18O5ngWaEOPnyIxZJ3FbYbpti/
 CRDGNMdoMzA0m+fs72JXzVb8qlNVhhHJiiwliAXZ1dBuIV2VXxvnVJJYi
 aZPuQF77Ue/7lat4olZFuWdp+kZHb6HsCFOnlcwzh+6jLFMudpYpigAWh
 Iq36/lP3j04Ow4H43bAGvttN5AtCe4iz9WvrNbIVSV7OsfgnQY1ufqErr
 4Xfyj5eihi8bQU1XXPxTrnrrD9Cs7DkVV3aFQzvpFMqm3jE6CDPpK9e5J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365948469"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="365948469"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="897174845"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="897174845"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 12:25:06 +0100
Message-ID: <20230717112502.32379-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717112502.32379-12-matthew.auld@intel.com>
References: <20230717112502.32379-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v14 03/10] drm/xe/debugfs: grab mem_access around
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
2.41.0

