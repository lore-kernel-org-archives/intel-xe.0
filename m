Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05C6C61DA4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF6110E3C7;
	Fri, 17 Feb 2023 00:53:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1A10E3BB
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595186; x=1708131186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=davg+QwctMDUwHAkJtydmd2fmWV5G1LDJz1pDtumjaI=;
 b=jp1RWNz2HT8QysQe12PBf6SKtAmRPEOqCvYblNtNDz5M1rGF//eRKJLL
 TFByqOa+avCAlz5czss/vsFzxyovc/DkBYhtART3fQ/Jx7gh/mgFN1cBV
 0od2BBq7ewGZK3BybqbGsh9lzRDz5kAIOcZdreYB8WgdKwo6yo6OI78ig
 6lyaWwCA2hyKkPHXDp40E6qHN92LvEVdiHZz6sbp3dtHZVEJoR5zP55zJ
 CvkMwV2WZoYnZMWhGVHDu52FDnyXrHJAUQ/9IC1YYk3L7q6WnXPukF10O
 IJKhxm53Zl9nn9h/8my/XLzKKWHmbA+QFSvABKqM/fyLzOq4mfrqkh8FV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602210"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602210"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417802"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417802"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:25 -0800
Message-Id: <20230217005226.106499-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/11] drm/xe: Remove dependency on
 intel_mchbar_regs.h
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
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The only thing really needed is the base offset, MCHBAR_MIRROR_BASE_SNB.
Remove the include and just define it inplace.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3465236b0b49..cc7d1007d942 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -20,12 +20,12 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 
-#include "intel_mchbar_regs.h"
+#define MCHBAR_MIRROR_BASE_SNB	0x140000
 
-/* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
-#define   RP0_MASK	REG_GENMASK(7, 0)
-#define   RP1_MASK	REG_GENMASK(15, 8)
-#define   RPN_MASK	REG_GENMASK(23, 16)
+#define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
+#define   RP0_MASK				REG_GENMASK(7, 0)
+#define   RP1_MASK				REG_GENMASK(15, 8)
+#define   RPN_MASK				REG_GENMASK(23, 16)
 
 #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
 #define   RPE_MASK		REG_GENMASK(15, 8)
-- 
2.39.0

