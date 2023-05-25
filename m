Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E5FC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967C810E781;
	Thu, 25 May 2023 21:34:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B92C10E780
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050479; x=1716586479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xnOeBE9Jp1JX1c1NLH5BRcUzqoCiC2LkXmR8Wyxp19c=;
 b=MkiTx6MWavyS3YPE+nMhSE9vlRtK9rce+cFj9hsS96z+AvUDlEgr7Vys
 xaGJh3F9bclj6YoHmaUnsSheLS6as33CTaiEP+esrrOuJptQ0GR2ANKki
 WYFPXtoqLkUbmJtpzeJzZlvcOT2JP+z8EA00N+KMtPz4YaAuW01U0fI/Y
 vOtMgJrphisdVRJ68RUEPZOYlfE/4e9YKh4wmJvs1G3AEZgjtcBn1449n
 xBXnzP4jGBDVWozgDFQ9aneKQtZKPA5W5xVLws5MG73Lqd++OJdf+/Zol
 2qPpA/XsBsV5CGsUtwkhlMzG1G5J0JXVvv6jrW/E9uxujVBVIY5KKzwwz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377898"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377898"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970723"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970723"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:33:47 -0700
Message-Id: <20230525213407.3907094-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 01/21] drm/xe: Fix Wa_22011802037 annotation
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

