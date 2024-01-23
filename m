Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5A7C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 18:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EEB10E843;
	Tue, 23 Jan 2024 18:54:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A1D10E843
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706036093; x=1737572093;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ao/tsilPzm/pN9YO2uJUT5R/x8gdC2Z06sK9qu7NXCs=;
 b=dAzIpoPIP3mIMTtLY8oRr2Kj25lt+RCcORSnqi3CxxW9Q03ETyOTLk2C
 A5TKmyFvZpXDZbf3ZF4pqMj6HMkpCfLMo3q1bqEj4QpM/99MKoJIpIuTC
 s8SFk1n287qTTU197BWHazqHZwGRstfFiInreC8Npg6zVBCBrIWfUM0Qc
 9tFJzR30ZC7BrqjIFVin/pWl+AKqhmLLbDboWEXuz8zhD7mRxMXXLBLTb
 aZPTcts9SmMoLptQ0nhsMJJMA81zDb9d47Xv2QebN+lSPrikqoBW+lGqu
 Y6Z93j+mQ1GqPSFnKusskCeQTvoGcKYxqsHr+OsMDKAJ0jKuPpaI0g7wN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15137080"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15137080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1620408"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:54:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Use LRC prefix rather than CTX prefix in lrc desc
 defines
Date: Tue, 23 Jan 2024 10:55:30 -0800
Message-Id: <20240123185530.1595588-1-matthew.brost@intel.com>
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

Fixes: 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f17e9785355e..c005e56847a1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -23,9 +23,9 @@
 #include "xe_sriov.h"
 #include "xe_vm.h"
 
-#define CTX_VALID				(1 << 0)
-#define CTX_PRIVILEGE				(1 << 8)
-#define CTX_ADDRESSING_MODE_SHIFT		3
+#define LRC_VALID				(1 << 0)
+#define LRC_PRIVILEGE				(1 << 8)
+#define LRC_ADDRESSING_MODE_SHIFT		3
 #define LEGACY_64B_CONTEXT			3
 
 #define ENGINE_CLASS_SHIFT			61
@@ -786,15 +786,15 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				     (q->usm.acc_notify << ACC_NOTIFY_S) |
 				     q->usm.acc_trigger);
 
-	lrc->desc = CTX_VALID;
-	lrc->desc |= LEGACY_64B_CONTEXT << CTX_ADDRESSING_MODE_SHIFT;
+	lrc->desc = LRC_VALID;
+	lrc->desc |= LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
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

