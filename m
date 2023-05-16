Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB867C7EE24
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7ECA10E37C;
	Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3E410E378
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XDaP9IvvlB+CadIhDo43pqoAvxKYl+GjmUmPGjBgaGc=;
 b=IT3i/Qt9nWB0w2MlrDfKb8m64rjrwGIjNo9pPjV4UlqmKk1EApAaLk52
 GLUv97Ap7hzWyPGFK9uREbdaQ4340ld45obX9i5KXXGrQvw4r7CQtERms
 K0lzzQIjOTN0PlBJCKS4QVWYT8SA4pUmnPyv1aXr8k7wVI726OiJFA8/3
 IPdRtoPrHrGDV5dNFOiD00O9llaGCLRMcjT+AUQChc+2fusL9+lyH7+2s
 aiuKEDEFxx+nO1iw3hL0M9b7uOSsqhefVu1O3W+nQwcmRkIgtNA1UMfb/
 oFeH/H9FEaELg55cij8UWBDYRxUXRT+pPGtFNh8AE7ot9uKegMD76OWp6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013378"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013378"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530851"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530851"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:42 -0700
Message-Id: <20230516221950.3512818-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/9] drm/xe: Fix Wa_22011802037 annotation
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It was missing one digit, so not showing up as a proper WA number. Add
the missing number and annotate it with a FIXME as there are more to be
implemented to consider this WA done: ensure CS is stop before doing a
reset, wait for pending.

Also, this WA applies to platforms up to graphics version 1270 (with the
exception of MTL A*, that are not supported in xe). Fix platform check.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eb4af4c71124..1b5d0b6ad180 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -162,9 +162,11 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
-	 * Wa_2201180203
+	 * Wa_22011802037: FIXME - there's more to be done than simply setting
+	 * this flag: make sure each CS is stopped when preparing for GT reset
+	 * and wait for pending MI_FW.
 	 */
-	if (GRAPHICS_VER(xe) <= 12)
+	if (GRAPHICS_VERx100(xe) < 1270)
 		flags |= GUC_WA_PRE_PARSER;
 
 	/* Wa_16011777198 */
-- 
2.40.1

