Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0697C7EE2D
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A90210E3BB;
	Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD24310E3B1
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jI/z3gCrZLlUaT3YxJjy9/YlFEgwL4V8Z0U85n3QPSg=;
 b=Bgr3xlTE1CIGjA2i8IfpJBFBYUW2ChE5eHG6TlJfONupFxR6N+UYYu0K
 2Ukr6WIXBRuJRNRIIEfCIcYTFwcXxk4tWT0ELt2EyseD/u1KqyfbGJVq5
 B4EG0xMl3QjBxtluDYQ3uMkuojLyspgINCnu3vWdrBhTWu8UXBYj7E6VF
 ijqZLKLYHUcsllQ0fB79ARF6TjZB/Oqc+dOXGWrWWuZmMQn9zUmYNUqJF
 jUzdeiSw1Oac5iq7QPc8J0quRxDtz7TexHqE9HOsm9OSwKB7+Y96fQQZ0
 +60e6MZLxEaTVs96jw22Uxv7P4OnbczbkNQBxn6uQwZNToAU/PbO+jTvM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323830"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323830"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439436"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439436"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:47 -0700
Message-Id: <20230504073250.1436293-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073250.1436293-1-lucas.demarchi@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe: Fix Wa_22011802037 annotation
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
index 62b4fcf84acf..f7d32b744247 100644
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

