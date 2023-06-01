Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5404CC7EE32
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F4810E5CE;
	Thu,  1 Jun 2023 20:30:37 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5904C10E5C0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651431; x=1717187431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20Wv6MLlcIJQChkrIubReRo5KvBuR5CQbAnKZZx52nM=;
 b=mnc5iOZm9d/AwS67Cihddz/XT2qQzNMznKOZ8iebR/DxNa/2UfT7693V
 4iZOAZFNO39bTKUjYdD4u99teqI4Q2XMG9DEdIKIhKnzeaH5uZ4H33JIM
 Ea4nHUT9vh/8pS2l4ZRp0SyWf+cnbZy/quWRehx35RXwqhfmpp2XhmToy
 1recYl64tz9X7Gzj/EjU/LbxEBqEpTdkSk65B/2szp/ggBpWTYiD7RSTo
 s7FSTXdCP6iW47au34cbML1BUohD8MrQ6eVPKSHZoxs4UmVfgW8iqWwET
 1fogrBa9RratHXLpyyYKeQF+2LBd8pfTlB3XUgzBklidfeWi24+RFZjdL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102503"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102503"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493218"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493218"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:29:58 -0700
Message-Id: <20230601203025.615494-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 04/31] fixup! drm/xe/display: Implement display
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

