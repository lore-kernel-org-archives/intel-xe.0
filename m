Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC40C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7E910E1CD;
	Wed, 22 Jan 2025 21:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bm7ao943";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117C510E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582646; x=1769118646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zj3FiIFks34IM6vOTalITgDj9DSh4qAtfi6oCWJiCwU=;
 b=Bm7ao943w7sYhC2TJFFHWq4DojWYv7C6Yhc8Hlo9bZvNVACu4OapAGwx
 5ojT6RyT49udoqDoGT+SBVoYkfXOqs30lyy7NEcVC3JAV7SSO6He6g+qq
 aXH4Tp1TYbfmjpQgFQgL0O1Hyyj94ERIvYAFSNGlcO3ot55jGKpv3ZEZO
 Q0aZUefgoqOGu0wqhZYHTgaQUvRLBt1Xxz40EYUn5cbsDVFHsvjRmjOKR
 79l60ooml7G+4w17NtAVX415Ll2tlH3SVjQ/A6lLYqafw2Ks8rnPSuxRh
 tvZUqWocWhHL7BtrftDX8rOFktCTFjUYUY6Pc28KQXGyC1BgPEDLKmSXH w==;
X-CSE-ConnectionGUID: DFOKRrKbRw+SeVp45rb2cw==
X-CSE-MsgGUID: cgBY8U84TPuHHJOIVlen1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41730979"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="41730979"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:45 -0800
X-CSE-ConnectionGUID: s3RjL0uiSGaxllSdh/HOcg==
X-CSE-MsgGUID: 4hXlZ+7HSXOPhIR+ppJrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112365848"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:44 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Add reclaim annotation to the PF master mutex
Date: Wed, 22 Jan 2025 22:49:54 +0100
Message-Id: <20250122214955.632-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250122214955.632-1-michal.wajdeczko@intel.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We need to avoid making allocations with PF master mutex held
as we are doing VFs reprovisioning during reset/resume steps.
Add annotation around PF master mutex to catch undesired uses.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 0f721ae17b26..2286a08657b0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -10,6 +10,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_printk.h"
 
 static unsigned int wanted_max_vfs(struct xe_device *xe)
@@ -37,6 +38,13 @@ static bool pf_continue_as_native(struct xe_device *xe, const char *why)
 	return false;
 }
 
+static void pf_primelockdep(struct xe_device *xe)
+{
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(xe_sriov_pf_master_mutex(xe));
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 /**
  * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
  * @xe: the &xe_device to check
@@ -80,9 +88,18 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
  */
 int xe_sriov_pf_init_early(struct xe_device *xe)
 {
+	int err;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
-	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
+	err = drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
+	if (err)
+		return err;
+
+	if (IS_ENABLED(CONFIG_LOCKDEP))
+		pf_primelockdep(xe);
+
+	return 0;
 }
 
 /**
-- 
2.47.1

