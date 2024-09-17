Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394FDC36018
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098E810E467;
	Tue, 17 Sep 2024 12:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZUWJdo9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C0C10E059
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574642; x=1758110642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D1r/gAiwVQPhqr0EBTmBJ4vXiRucNC0Hm8z3kIDtrHg=;
 b=iZUWJdo9avkEsBj1sFpoe0Gnj1XnLkwEY8e3zQPETIH8+NeNgUEJrN71
 BdYomqcIXhK8BSY3qY5vQ9WXJWfYGnKRAMnWqyGB2M3dJ4gjt8t5RizOW
 GctrWiveCT2laRh++gFpMV0LLt8Cp/+4bXhS6c5cXOzv9wUQxKq2YBoWk
 g0dAfz0ji7GIVHpMYX3MFerE9G0kw0Odhxgy5Ty+O20ymBLWuhY1KT13M
 vbWABRkXiN+TxGWjqCJgy5bL1Y0lWBg8AjX7IsnpSp/dLa5mLZaTbxYcX
 WyljhjVGsRFPRdPnvSrWh576sDmARkQjU38RBFkcrbbfsytU+pOhs6/JI Q==;
X-CSE-ConnectionGUID: dw6IGyR6TQeU3HipAfBgRA==
X-CSE-MsgGUID: 8G+8/XsDQIm7I3/I4QAl0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210726"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:04:02 -0700
X-CSE-ConnectionGUID: 8lo8hKOhQjqbNs7WnYsLvw==
X-CSE-MsgGUID: 8w+vJpRxTkizGpltxO4Byg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388675"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:04:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 22/23] drm/xe: Ensure __must_check for xe_force_wake_get()
 return
Date: Tue, 17 Sep 2024 17:51:25 +0530
Message-Id: <20240917122126.438448-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
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

Add __must_check attribute for xe_force_wake_get().

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (#rev1)
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 drivers/gpu/drm/xe/xe_force_wake.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 802e5927dd81..48aa4fca34b5 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -164,8 +164,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
  * the caller should handle the failure case, potentially returning
  * -ETIMEDOUT.
  */
-xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains)
+xe_wakeref_t __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 6c8c46777b79..43e7aa7bead8 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains);
+xe_wakeref_t __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      xe_wakeref_t domains_mask);
 
-- 
2.34.1

