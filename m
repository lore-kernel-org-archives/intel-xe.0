Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0281FC7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 11:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C5010E276;
	Mon, 29 May 2023 11:43:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9685B10E276
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 11:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685360599; x=1716896599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hRzss76GhgHncG9fm7JX+YSsxIcVuYe66EX2lOqNX3s=;
 b=RXqvVcruqUvyqxlSR5QjcfSj1+FQ/PuQllRNw0K1Na4MF9b8KeEJUA33
 tx1BrX0WkTWs7V1Y8i9eEUIxMDRg/uKCN87/t7xkxs5qcBczQg91DnYew
 QBAEaEKmg9j0zAFpJcPsAGKcOfwhFu4Vw0I4ysUUX77bUxvgYYOHMHaCS
 okxtg3AXR1MCZYlAZshzYNH1hZzHxd/1vqQWxWjy8NHB1/sCw9eiHQi5c
 PIWtqQnxXs4UpW1jz/jEDC7C9lsczPemKUvD7Ba5tgDXagRgwYxIb1Y62
 uuH7+PMgeL/+wISN9/4C61uGHcsXX9rfrNznvWXvmDPHPhPv5EAJXvwK2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353530787"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="353530787"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 04:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="952717947"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="952717947"
Received: from ssavadax-mobl.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.96.191])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 04:43:16 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 17:13:05 +0530
Message-Id: <20230529114305.506111-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display support
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Printing HDCP feature missing log at KERN_ERR log level upsets CI.
Reduce it to KERN_INFO log level.
Also correct a typo in the log.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 43d3ad50dc54..5c02675bbb09 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -7,7 +7,7 @@
 
 int intel_hdcp_gsc_init(struct drm_i915_private *i915)
 {
-	drm_err(&i915->drm, "HCDP support not yet implemented\n");
+	drm_info(&i915->drm, "HDCP support not yet implemented\n");
 	return -ENODEV;
 }
 
-- 
2.25.1

