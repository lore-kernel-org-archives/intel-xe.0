Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08DC7EE31
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C81A10E430;
	Tue, 30 May 2023 21:16:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CB710E430
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481366; x=1717017366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJXEqOoJqEms3sgGfoL6aiGQbb330HVwCj/M9CTP96w=;
 b=C6D8KVZT9rXjtXYDvtbBcYFAZp1CyWKO/KUID5E+U1tOr5vwyJBK6NcB
 BqBVx4Q1WIP7USFDOU1866CYaYlPsom0g0NSPkqFKvNHtLWGGgynYhIJJ
 khoprLrKCQklQxUfp+8YK66p/K/CPXfdbWRinsZuY80ylbw6x2iArlGa6
 rfZ7/XMI/ozyhY2ciZLmkJXKBbxeaIXQ6onmXuP2tIn15Hlmuy2P/rEe7
 pOF8aTDSLGVCvP3QCapGtsOmMlcpT/dOaAvOOXf2kGV1CzHdsH1NcyRIr
 OZ2mDTbiwzDFVX+ePPl8io69ityD9xEnvuC4/HhcYdmrXJGNNfb5S3oya w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311928"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311928"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139376"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139376"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:22 -0700
Message-Id: <20230530211549.2632538-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 04/31] fixup! drm/xe: keep pulling
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

