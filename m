Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83543C4167D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 20:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4661210E19C;
	Fri,  3 Nov 2023 20:04:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155B10E19C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 20:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699041863; x=1730577863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TYIDsM7D1KEo5OGkYWDdBHI6rTQahtLXDqeYI8DUyPU=;
 b=MYk/nPcEWd0uhEf/t9D24VwN9dHOSP87j6dzsdR75VPC7e4zMDHMTHI+
 kL1FDdjaQ00HnGbFbg0W7pxwIrxkUEs3M6oTNTnRIJ5VpzGCm4jn9IWGw
 3ThjjtaP7UbOkUDipAR2x0PAMeY0iw7rplnSaDRl21riX8lUDoHALRZT0
 tHf0j7TCiFQUtlHOXTKP2QK89GO62n/gE0Hit6GM6xQQqvLZ20/CHpDtl
 X8UOcf59oxVNlk1MAPZfqE6o5mNgbxJIkUdsI0s6NaZhc+tCTf5IlOSsd
 dCh6NvNhSkvJ5MAlDvOiS2u9dIGUqVEKU0KeR0yh2x1LV7ixqTlAh62tW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420130157"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="420130157"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="2862480"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:04:22 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 12:53:38 -0700
Message-Id: <20231103195338.912645-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: clear the serviced bits on
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
Cc: jonathan.cavitt@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 saurabhg.gupta@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The spec for this register, like many other interrupt related ones,
asks software to write back '1' to clear the serviced bits. Let's
respect the spec.

v2:
- Update commit message
- Add missing CC

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 61350ed32c61a..af3765c3fc0e2 100644
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

