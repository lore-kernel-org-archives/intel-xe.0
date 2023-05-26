Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6859DC7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393BE10E829;
	Fri, 26 May 2023 16:44:15 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0D10E823
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119452; x=1716655452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xnOeBE9Jp1JX1c1NLH5BRcUzqoCiC2LkXmR8Wyxp19c=;
 b=KI9UwhAQz7gNiG/01JVgzNw4OPbrqVQSnwBfVIGzztB9CAx9gC4rK/zH
 LIC22eN7kb/ompXwvAfNQZe7pjcsTHphUfZxuIlXJuqwPRG4qZP3Db/d4
 isJ0+kOb+LM5C6XSKwZ79W6P+JCcha4YsXILRlNof7IN/p0xyPQF0+jDl
 NuNkBOq0X8T04JgKDu5iyjcCzATAI/HmpigURjZpfgdYwtDEV518P4VRJ
 Nau8EpJlD2BKQHbcqODtbVWwX58SaDiXEv+i8qmIzTiJ+qj2pQbG9KgQS
 VfYG+0kCmCx4kIbC82P3L6hlslBj7mFBgX8HDAQxKaWBTwhqU3sABSz4E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628372"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628372"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151448"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151448"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:38 -0700
Message-Id: <20230526164358.86393-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 01/21] drm/xe: Fix Wa_22011802037 annotation
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

It was missing one digit, so not showing up as a proper WA number. Add
the missing number and annotate it with a FIXME as there are more to be
implemented to consider this WA done: ensure CS is stop before doing a
reset, wait for pending.

Also, this WA applies to platforms up to graphics version 1270 (with the
exception of MTL A*, that are not supported in xe). Fix platform check.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/284
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 71f18b32d09b..a8e249205bff 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -160,9 +160,11 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
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

