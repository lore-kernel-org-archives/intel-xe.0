Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADCAC7EE31
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AC910E5E4;
	Thu,  1 Jun 2023 21:52:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6590310E5DC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656367; x=1717192367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20Wv6MLlcIJQChkrIubReRo5KvBuR5CQbAnKZZx52nM=;
 b=B54ktg29II47erb/aDkhDeXf5TXXLhhIP6iF3BHW4RYZBJi92tAZYe9y
 2pW2s081xPupad2bh++LK1S/FFu5PzQK9wOzTGDaQwb4IhYhin5j7rJF3
 F8aPLHxEQlMlXrd1ZRmN28QyD9LLrvM/do+ZAgNwVdmtGXeSBIioXBTdL
 Os2dSSf8c09B67q0o2X0BIKWlhISmuBgOcTRylEieoaMLyN4q8NUhB6a4
 Cx01fqXz7wHrtrLYrZBYFrRoxwnB+b0qYw1JZIFIGPaHcK3GgUbM27XfA
 CZA2J0SjurBY/jfgFQ+bpdxra5VFQk3hgRwBczp2M3t01kk9S3fU6E5XY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313590"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313590"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563559"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563559"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:17 -0700
Message-Id: <20230601215244.678611-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 04/31] fixup! drm/xe/display: Implement display
 support
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

Due to some mis-squashing, the changes we're fixing here actually live
inside "drm/xe: keep pulling mem_access_get further back" at the moment.
But using a fixup! against the display commit since that's where the
changes actually need to land.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d140eee6473d..747fbb06cd83 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -130,7 +130,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(ggtt->gt->xe);
+	xe_device_mem_access_get(gt_to_xe(ggtt->gt));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
 		goto out;
@@ -178,7 +178,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
-	xe_device_mem_access_put(ggtt->gt->xe);
+	xe_device_mem_access_put(gt_to_xe(ggtt->gt));
 	return ret;
 }
 
-- 
2.40.1

