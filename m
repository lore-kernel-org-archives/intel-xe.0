Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10A7C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DB110E5F6;
	Tue,  7 Nov 2023 13:51:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7935A10E5F6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699365090; x=1730901090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vxaiLcGzfNk0ddfcrq6pq99BkBv8gE1W9AOZ6yAzypg=;
 b=IMzGqsf0TgogrycIHP8SP+g5jbuQ1k83TA1lvUMBTf0L3wv7599dEwqC
 HN5AISENPR4dU/xp0tjGOyQVyV1WOCgQI5THj35PIEVvV4EhpTPm+oJdb
 mG1S7uPmemlxsnFmR9fvX+ls4hSBruedpbvtGfCjITqcTHHTpLnGjoM0H
 sd2j//+FJQLi9IOx2/6GRx+JvlJ+BV6La4AI+4B0QoDZo5NDns4NEVL7g
 zw6cs5JrISH5lJc1TTZJXy6n0H9CyNWfcz4m+a3sEUjM5Pa6uFS0hnI5n
 YqsAOtmGLWCcK+0fhj6ve8jLmx616mF+kohATaQ185vQU+nXKqwazQS2B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420618980"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="420618980"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="762705107"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="762705107"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:27 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue,  7 Nov 2023 15:46:03 +0200
Message-Id: <20231107134606.316651-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107134606.316651-1-alexander.usyskin@intel.com>
References: <20231107134606.316651-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] mei: hdcp: match without driver name
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove dependency on i915 driver name in component_match function.
Use PCI header information to match Intel graphics device.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hdcp/mei_hdcp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index 51359cc5ece9..f8759a6c9ed3 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/mei.h>
 #include <linux/mei_cl_bus.h>
@@ -781,9 +782,18 @@ static int mei_hdcp_component_match(struct device *dev, int subcomponent,
 				    void *data)
 {
 	struct device *base = data;
+	struct pci_dev *pdev;
 
-	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
-	    subcomponent != I915_COMPONENT_HDCP)
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
+	    pdev->vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (subcomponent != I915_COMPONENT_HDCP)
 		return 0;
 
 	base = base->parent;
-- 
2.34.1

