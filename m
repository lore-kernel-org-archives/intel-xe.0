Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D773EC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA11E10E569;
	Tue,  5 Dec 2023 15:58:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838C610E569
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701791911; x=1733327911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PnvO1J7VOVgmoxgxYPLfKbmrSlcsMSAjbRLN6kQjbJY=;
 b=KjSVL02KBQqfzjq88nV6t1f9MJy2lvF6SahmlhEbC4n68eBHDx9tyisT
 Zq7o3CcFsG1tbm6xIzOuPav3QtNEcgY/8w38kxd4pclsvCHINOZN4z4o7
 D8KoBG9QRl/5oRifUxLjTAaTEvfnCkX7KqQS/BqASQSho+J3DR+NeFnxi
 yl8PSoGV2BeZM2c0NNacjrAQCwTdxcXd7yLyFGMmUX/QVWNrzQm+bOfTS
 KPX6872uzBViS4C5NQyuXUd8cw10BJXYzMbpzUvDKhRaM0CSgP2omwQlA
 1xsbNf8/A31dg7KVIbdI5I+ab5nbbMRGTb/X4DxDs1VrouZGmMIDnRKsv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15461286"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="15461286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="12369994"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:58:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 07:58:20 -0800
Message-Id: <20231205155820.2133813-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Expand XE_REG_OPTION_MASKED documentation
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expand documentation and add an example to make clear this isn't about
generic masks in registers. Also, fix the doc regarding read operations:
the mask part has no effect on them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 6e20fc2de9ff..c50e7650c09a 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -60,7 +60,16 @@ struct xe_reg_mcr {
 
 /**
  * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
- * read/written bits on the lower 16 bits.
+ * written bits on the lower 16 bits.
+ *
+ * It only applies to registers explicitly marked in bspec with
+ * "Access: Masked". Registers with this option can have write operations to
+ * specific lower bits by setting the corresponding upper bits. Other bits will
+ * not be affected. This allows register writes without needing a RMW cycle and
+ * without caching in software the register value.
+ *
+ * Example: a write with value 0x00010001 will set bit 0 and all other bits
+ * retain their previous values.
  *
  * To be used with XE_REG(). XE_REG_MCR() and XE_REG_INITIALIZER()
  */
-- 
2.40.1

