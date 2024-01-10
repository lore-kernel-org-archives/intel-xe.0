Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0867AC47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C261310E783;
	Wed, 10 Jan 2024 17:46:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379DC10E650
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908798; x=1736444798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3F2T1eGWoq5a81npfIOH/OzPJ8a7ZWz0fgRCO6Mgw+Q=;
 b=V3P4mQj5nrb+zTFIhe8VqC1uGkqvM7pOVS3Uh/Z7uNtKEzDhP911LULa
 XgXOz01WLyxU5B9djxWgf7tfq00BEiH+CRB6IdbjF031w4M6O9WJ+YV9c
 H62BbBK62UK7e78qtGnMgGtYyogcD6ywkZYIJzhVUGa66aIs9fAXLn2/c
 6I/ZUtN+WMCNYMsK6dzMUD0jZO+T/k7MBWKYvnnjaf3PWX56IGE5Dcz/h
 yuHNPHS6Fyzk4+hQLLUdbE4ZFBDPYWKXarydxj3LFJWTi/gBKFhaQiYqy
 JhPfRRqwsINCVq5Oddh2Ghp+TfXrNNo2RGexST7ZdD0YD1Z959iRyl7bf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389031991"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389031991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="24029864"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.210])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:46:37 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe/guc: Move GUC_ID_MAX definition to GuC ABI header
Date: Wed, 10 Jan 2024 18:46:19 +0100
Message-Id: <20240110174622.409-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240110174622.409-1-michal.wajdeczko@intel.com>
References: <20240110174622.409-1-michal.wajdeczko@intel.com>
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

This macro represents GuC firmware capability and shall be defined
in the firmware ABI header. Move it to xe_guc_fwif.h file.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 4dd5a88a7826..949aaf04be42 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -14,6 +14,8 @@
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
 #define G2H_LEN_DW_TLB_INVALIDATE		3
 
+#define GUC_ID_MAX			65535
+
 #define GUC_CONTEXT_DISABLE		0
 #define GUC_CONTEXT_ENABLE		1
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 54ffcfcdd41f..022e93796bf8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -241,7 +241,6 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	mutex_destroy(&guc->submission_state.lock);
 }
 
-#define GUC_ID_MAX		65535
 #define GUC_ID_NUMBER_MLRC	4096
 #define GUC_ID_NUMBER_SLRC	(GUC_ID_MAX - GUC_ID_NUMBER_MLRC)
 #define GUC_ID_START_MLRC	GUC_ID_NUMBER_SLRC
-- 
2.25.1

