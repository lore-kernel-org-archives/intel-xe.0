Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A792C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 13:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED92710E4AD;
	Wed, 19 Jul 2023 13:51:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ABE10E4A0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689774680; x=1721310680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a0qs8UsO6Ie6hSjJn2LPJlV7H69vQfEVlGTS4kbqV/Q=;
 b=buatwiQ7m5HELS8cqxsiUidT3r4vU5apUvmiUlTshZGW4CNtVw/L2l5j
 +fFEku+5xO4/IsvUGVEzVYo1ljLo++ijVlDMzcB3HeiR71OgupBdSVdpC
 E08TgPTc7SrdsEBnKOaK5D4TTVOquIPJsP8vdrKFUY6YdSYgYtS0hQeDs
 nzIXwvvT1/zGBw95HcxejJsf5E9k4FRffl21BdCSymybJwycMvq6I0aoN
 edD6Ka7etrsq2ulfSSp3wtP5XNy0+UM531DVdjO7azpf4Rj3FLwAjthCI
 rn4/UaoVDL9LZk2wqrzKHqUnLIVXSa8j7GqdW6DzOpx/7rXd/8yDkXC3u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366512203"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366512203"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="897924642"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="897924642"
Received: from vshulan-mobl1.ccr.corp.intel.com (HELO b6cf8bcf6e1c.intel.com)
 ([10.251.223.230])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:51:19 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 13:51:07 +0000
Message-Id: <20230719135108.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719135108.7-1-francois.dugast@intel.com>
References: <20230719135108.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe/execlist: Remove leftover printk
 messages
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
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Those look like leftover debug and are not even being used. If they were
real debug/info, they should be using the drm helpers.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 46293c9bb6a8..3aec37985f32 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -47,8 +47,6 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 lrc_desc;
 
-	printk(KERN_INFO "__start_lrc(%s, 0x%p, %u)\n", hwe->name, lrc, ctx_id);
-
 	lrc_desc = xe_lrc_descriptor(lrc);
 
 	if (GRAPHICS_VERx100(xe) >= 1250) {
@@ -125,9 +123,6 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
 	if (!port->running_exl)
 		return;
 
-	printk(KERN_INFO "__xe_execlist_port_idle(%d:%d)\n", port->hwe->class,
-	       port->hwe->instance);
-
 	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
 	__start_lrc(port->hwe, &port->hwe->kernel_lrc, 0);
 	port->running_exl = NULL;
@@ -176,9 +171,6 @@ static u64 read_execlist_status(struct xe_hw_engine *hwe)
 	lo = xe_mmio_read32(gt, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
 	hi = xe_mmio_read32(gt, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
 
-	printk(KERN_INFO "EXECLIST_STATUS %d:%d = 0x%08x %08x\n", hwe->class,
-	       hwe->instance, hi, lo);
-
 	return lo | (u64)hi << 32;
 }
 
-- 
2.34.1

