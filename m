Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D75C7EE2F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C5210E1EF;
	Thu,  1 Jun 2023 00:04:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6610E0DB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577851; x=1717113851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJXEqOoJqEms3sgGfoL6aiGQbb330HVwCj/M9CTP96w=;
 b=AEilqxy/Z1jF08kyjaj2jOhryzhVhaWhu4YnD7dlBRZjrZQEQ8oRKRf/
 pIubsb1G39OUAdS57tGj6Vi7nj8JE38uxqjpuUwRq9mifrlJl1HhVvta4
 s6zBbhdLpbT9RA7l2po2H9KEO/kxPXrQ+hyu3ar8/PTx3Mm0fLBghM3be
 dJwCFtwRU1iaTiWXMMtrlaFpbrynEM6XXvTHoOAKL7dzXbDx+RyEcwR0J
 oU9MRQDskKzTImgv/O53lKVMBN7ZW64u2bjDveB+CUDds5i1v9++m9LTq
 UjhoBnfxpD6vrBb4baiamCFWjYIenAqRe+GvxQjhZp0x4KgOjuavPMFKy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996818"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996818"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556156"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556156"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:36 -0700
Message-Id: <20230601000403.432517-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 04/31] fixup! drm/xe: keep pulling
 mem_access_get further back
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

The commit being fixed here probably should have split its own
display-specific changes out into a fixup! patch too.
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

