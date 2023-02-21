Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F093DC61DA3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A5C10E656;
	Tue, 21 Feb 2023 19:41:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C6310E656
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008478; x=1708544478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S7nhhFhzZEmHvVf7JBUyXJc+h9QAL1W0Mpm4NZ7zy4A=;
 b=K6CsK20Ylwpb0PKJw7oeDdYGeDz+lgsVE/SAKdIq9iK1UFU6Q3cqdi3F
 TpnXw5By1TA+1l63TRwth3TcE1ZAD4gMZXrwaMUt4r4XtXxXuwS9NmVg0
 Jjbfuk5fxZcFnGzT5Mri/In7KYpDzI2wuRbEuLZXXI1Cl7EqksL6edOlU
 OWEY6CfIS2cRWNEMMKe8Cc+GKbC9mYlBgT846lCNJabXX99A5bbMVw+Ps
 37sF/WHOUDOu3f/nrWu9Uoo3c87UWc/5XRyoG9DMwjVzfmko/sXK+eHeK
 nsLrzwQgw3FGmYLtB0V+E+urEc2vU0j01czRIJiI3tBYmZI8NyS2DVPgF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735707"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622218"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622218"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:59 -0800
Message-Id: <20230221194002.819026-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 10/13] drm/xe: Remove dependency on
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The only thing really needed is the base offset, MCHBAR_MIRROR_BASE_SNB.
Remove the include and just define it inplace.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d91dad8638ef..5a8d827ba770 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -21,12 +21,12 @@
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

