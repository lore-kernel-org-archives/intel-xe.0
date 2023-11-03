Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5018AC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 21:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235CE10EAD0;
	Fri,  3 Nov 2023 21:14:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4E010EAD0
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699046063; x=1730582063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7TqzzHfDzXPmgZnN4gV61l3eIUIihivCQYMN/IBm+4I=;
 b=i1RvOkXS20/okmfq+srIb9Yi5R0frV/s6NmFOaYA8+q3w6oKPkpev65A
 Pzkt1a6tLS8+4k7dd0YTzBvat8of0ywlLIXj27CF1SGEh9VQS7FAwRwz5
 lYFqWQ/EshnU3snJQL2ERvwMzZdWdi4or86K+nGl5q9TUm56a3YitO6iD
 Q+hAIdQhbPne6/1srtPInE2Af0S5Mzh3cvCqZJymH74TiLEWf3WdGaTjQ
 foMSvkS7EYupEqcwsgOfth533sjgb7G5MVqJhUCN9lDtWfUKEDfccV3Tu
 4LLI++aD+jp3Y/Uv1ftWtn++JpL0n9mPtxTu2HCNzoH1hQP23oymVrZ6v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391895371"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="391895371"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 14:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738197211"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="738197211"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 14:14:08 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:03:24 -0700
Message-Id: <20231103210324.1115369-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: clear the serviced bits on
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

v3: Rebase

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Paulo Zanoni <paulo.r.zanoni@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

