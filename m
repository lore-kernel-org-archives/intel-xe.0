Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC88C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF75610E824;
	Fri, 26 May 2023 16:44:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9E310E81A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119455; x=1716655455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G2XzpMqvZCGtnxGLitqfb7UsE78T7gyvBsa0Rs4xX6A=;
 b=ivRqqozw+LQLQVzWfChOG2lhrypvx5xHaNaUSwCvN+bMOoaVPV7+9DGq
 Tec5CeWkDkvUtWPzFOdcGT5Lquu5Mq2RY+hunBdjkkr/o00V8xJLOHonU
 LVhZQJ4Jibp7Z3eavgTm8FDLbN3Jd37HQUPuzkkZIRcqzLfNe81JwpssW
 28+sVQqqdBJ4Dv6o6zAcJV8Jgn7BObZ8EmHHRom48HewbMCDRmg1VKxVp
 6uNRJ8T+93ch5GqGRRJhVziYaMEcTP1hhG+DWgwHP6Zi9ljkI0kadtXuB
 Yw7Lc9jUbtGk9LGmmnfFhIp+N7d+a063Q19t8Zz5ROdFhvKpbKQiY6abn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628388"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628388"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151488"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151488"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:51 -0700
Message-Id: <20230526164358.86393-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 14/21] drm/xe/guc: Port Wa_16011759253 to xe_wa
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

Port Wa_16011759253 to oob. Wa_22011383443, that has the same action,
doesn't need to be ported as it targets early PVC steppings.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 4 +---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 08362db6a886..1b3fbbd74923 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -139,9 +139,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 22012773006))
 		flags |= GUC_WA_POLLCS;
 
-	/* Wa_16011759253 */
-	/* Wa_22011383443 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
+	if (XE_WA(gt, 16011759253))
 		flags |= GUC_WA_GAM_CREDITS;
 
 	/* Wa_14014475959 */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index b54f70eeccf4..9b29a0dd0934 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -1 +1,2 @@
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
+16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
-- 
2.40.1

