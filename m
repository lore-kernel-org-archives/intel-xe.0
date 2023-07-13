Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5822C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1C910E6FE;
	Thu, 13 Jul 2023 15:06:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EB610E6FE
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260800; x=1720796800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J/M5tzCaNMbVAJEr5+x9bAMUG8EN7fY2kjztWbT9B/o=;
 b=SzlUwFV0luDAnZVFKKvn84Bkz/FhfEvWsggFLvEviWzhEQV+aR8Gcxmz
 TwOJp0Qu2rc1nFr7Zt2STy+Ug3E5zzKB/uLDVCfMlDgvaaXgYc2JwTiiJ
 PFFBxEhhl8FS7PTDTUWfoMD3jGpeaIneGB0L08sd/N/UYS7gvXEd9UCPa
 yMqiMrR+x6xZBS3lU9bUykHNPd+FOxWeDNLTrQ/q5Ff8LxSatlYWUD/QD
 zhPHzz/uSkZzqC2bslIIC+HxP4tVSJiq88kuTd0zfUkvPPgAqOFdwI5sH
 nBhT5olnhfiZoBnSPkg+DyWVMtRpZWCc/oQ50Fw91MeFbpFYAvrzdNAiO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856951"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285603"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285603"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:39 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:11 +0000
Message-Id: <20230713150611.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/7] drm/xe: Fix typos
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix minor issues: remove extra ';' and s/Initialise/Initialize/.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 drivers/gpu/drm/xe/xe_vm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8245bbc58770..ce8b35dcbc51 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -200,7 +200,7 @@ static void guc_init_params(struct xe_guc *guc)
 }
 
 /*
- * Initialise the GuC parameter block before starting the firmware
+ * Initialize the GuC parameter block before starting the firmware
  * transfer. These parameters are read by the firmware on startup
  * and cannot be changed thereafter.
  */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6c216350084b..29bf8614c7dd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3352,7 +3352,7 @@ int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	XE_BUG_ON(!ww);
 
 	tv_vm.num_shared = num_resv;
-	tv_vm.bo = xe_vm_ttm_bo(vm);;
+	tv_vm.bo = xe_vm_ttm_bo(vm);
 	list_add_tail(&tv_vm.head, &objs);
 
 	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
-- 
2.34.1

