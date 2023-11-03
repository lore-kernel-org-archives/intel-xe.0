Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DC2C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 18:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF6110E193;
	Fri,  3 Nov 2023 18:40:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8087A10E193
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699036818; x=1730572818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J7y8jfXW6iZsd0vBLVZbOtmOX9iaZIBZdo6tNefezBI=;
 b=MvSsAZQ1+fl8kJpiQGGVcm8TBvxC0RhsgPYrl5jR7mzTsIz6SKSDR4ia
 BBOFRvfIQhejU4IPQa2MChdDgivSe2efzjAvtKpSpb/JzUacengpMjUqg
 uZ8YjzQujqRJdiNdNpjRrdyXuwnKKBufXkp4vymkhX8sQnTypwEE2Pves
 VFWCHYKQ4CNBKv+CUwIapt2KOk+G53/mJ4o+DW8trZiM9cyrl1SoqOF0w
 NcXwpBw9bVUZ65kEXGOSgX0QLw1sWd59hKCU/MbSI0jIkn8x+Z/I/xGHh
 SCcNBNjXi82jtTCye7+ti21UGV2rwF5QPKYUtVO58DfWqiWTwHIFDz65E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386172089"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="386172089"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 11:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765324134"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="765324134"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 11:40:07 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 11:29:22 -0700
Message-Id: <20231103182922.909972-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: clear the serviced bits on
 INTR_IDENTITY_REG
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
Cc: lucas.demarchi@intel.com, saurabhg.gupta@intel.com,
 jonathan.cavitt@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On XE, we have to write the serviced bits to the
INTR_IDENTITY_REG.  Do so.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 21d5273d7e611..c5315e02fc5bb 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -232,7 +232,7 @@ gt_engine_identity(struct xe_device *xe,
 		return 0;
 	}
 
-	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
+	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), ident);
 
 	return ident;
 }
-- 
2.25.1

