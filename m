Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10748CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 00:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35658113037;
	Wed, 10 Apr 2024 00:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Niq7lTaP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E59F113036
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Apr 2024 00:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712708808; x=1744244808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w2mH1ivJhjfpPC/+rj8OC16fuigO9Rpi34biBuRqCNM=;
 b=Niq7lTaPQ+677nqp9lmI2meF/j6Xy9oW2lj5SWzGoY5KUujoH2qcI3GB
 lt0amOYN3+tB2Y1hjTvfVb1jJcRiicFjk+2gTVuRMPsFgKCO3A4/+C+fD
 7bGcM4Y63fjxeItWnSOeMTsjLAZgDvvtttrahhGN2gtnW+nBi1me/Cd0w
 1XkTaKu/HuFv3C6cUdbb37AzvqnDCE2CXP3lmCSRXY5t+8T1c2NJ5jroJ
 q9OaNbAy94FXDwcMwASLWk/m9KVKpdMIfszg8Oxm7VWpr4cLmt7Fprohc
 1satRX/y3lizsZL+4nV5nWYDcFr6/6NE03EzocjX/B6da/OgmQlnnLqMw g==;
X-CSE-ConnectionGUID: gTAj3mRkQJCtXryExf/BSA==
X-CSE-MsgGUID: kJrSANhcSQO1unlPVIS0zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7907002"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7907002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 17:26:47 -0700
X-CSE-ConnectionGUID: rAx93y83T4CBsMaCH+M4fg==
X-CSE-MsgGUID: T3rDViSbSOKmQDFh0jJ8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51359633"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa002.jf.intel.com with ESMTP; 09 Apr 2024 17:26:46 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/2] drm/xe/lnl: Enable more GuC based workarounds
Date: Tue,  9 Apr 2024 17:26:45 -0700
Message-ID: <20240410002646.3002394-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240410002646.3002394-1-John.C.Harrison@Intel.com>
References: <20240410002646.3002394-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There are a couple of new workarounds for LNL that are implemented in
the GuC firmware. The KMD needs to enable them explicitly.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 5dd45e06f0b6..0972113f6b81 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -324,6 +324,8 @@ enum  {
  */
 enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
+	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
+	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 757cbbb87869..678ece366056 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -318,6 +318,14 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable_simple(ads,
 					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
 					&offset, &remain);
+	if (XE_WA(gt, 18024947630))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
+					&offset, &remain);
+	if (XE_WA(gt, 16022287689))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
+					&offset, &remain);
 
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 98a81468bc8e..5759b7bc1b70 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -21,3 +21,6 @@
 		PLATFORM(DG2)
 14018094691	GRAPHICS_VERSION(2004)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
+18024947630	GRAPHICS_VERSION(2004)
+		MEDIA_VERSION(2000)
+16022287689	GRAPHICS_VERSION(2004)
-- 
2.43.2

