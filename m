Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D91C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 21:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EB010E08D;
	Tue, 23 Jan 2024 21:26:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E028C10E08D
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 21:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706045162; x=1737581162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FSXEQtaaLAIrztxCgQSrIKuDGHnePKf7lXXBaJw8BXg=;
 b=mMTZL2/38LuP0OillVk3uDzFMTMYqkMETWe7MIzIdmUfV2kDbffqvFY9
 02wUa5Jtj8JQHrewJg1ncmFAlMnlHsBoxmar3xQDf5CAqgA73AR2Cvmqt
 Dz9WhKD/Wn9zjqbrFuzNpp+p+pSm6ahS5HRpiHeTC72bvHREr0YCqdMaV
 7f4XPKorIsSk8haQplg9PhQhMLi/xVQdj+aeWmGuFqeoENSRpoibnVgK6
 blLVbPQjW87G9Py8YhrmFdMKaUm4in9VJNppFbjJlGaE6xKQcI936OXuL
 13HCOAD9OjlG/UIBwtVR9v+77Aw1BMzLA/NmhULefB45KtIgK3H6JJNiU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15172352"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15172352"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820241601"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="820241601"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:25:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2] drm/xe: Use LRC prefix rather than CTX prefix in lrc desc
 defines
Date: Tue, 23 Jan 2024 13:26:38 -0800
Message-Id: <20240123212638.1605626-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The sparc build fails [1] due to CTX_VALID being redefined. Fix this by
using a better naming convention of LRC_VALID as this define is used in
setting bits in the lrc descriptor. To be uniform, change other define
with LRC prefix too.

[1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112267/

v2:
- s/LEGACY_64B_CONTEXT/LRC_LEGACY_64B_CONTEXT (Lucas)

Fixes: 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f17e9785355e..8c85e90220de 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -23,10 +23,10 @@
 #include "xe_sriov.h"
 #include "xe_vm.h"
 
-#define CTX_VALID				(1 << 0)
-#define CTX_PRIVILEGE				(1 << 8)
-#define CTX_ADDRESSING_MODE_SHIFT		3
-#define LEGACY_64B_CONTEXT			3
+#define LRC_VALID				(1 << 0)
+#define LRC_PRIVILEGE				(1 << 8)
+#define LRC_ADDRESSING_MODE_SHIFT		3
+#define LRC_LEGACY_64B_CONTEXT			3
 
 #define ENGINE_CLASS_SHIFT			61
 #define ENGINE_INSTANCE_SHIFT			48
@@ -786,15 +786,15 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				     (q->usm.acc_notify << ACC_NOTIFY_S) |
 				     q->usm.acc_trigger);
 
-	lrc->desc = CTX_VALID;
-	lrc->desc |= LEGACY_64B_CONTEXT << CTX_ADDRESSING_MODE_SHIFT;
+	lrc->desc = LRC_VALID;
+	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
 	/* TODO: Priority */
 
 	/* While this appears to have something about privileged batches or
 	 * some such, it really just means PPGTT mode.
 	 */
 	if (vm)
-		lrc->desc |= CTX_PRIVILEGE;
+		lrc->desc |= LRC_PRIVILEGE;
 
 	if (GRAPHICS_VERx100(xe) < 1250) {
 		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
-- 
2.34.1

