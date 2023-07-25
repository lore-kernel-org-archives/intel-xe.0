Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D73CC0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730A110E14D;
	Tue, 25 Jul 2023 15:06:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100A110E14D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690297578; x=1721833578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HcXZxZBQo9uA3qKXrxWPg+alZiBqmMC+9QnwSjZbs8Y=;
 b=CDrJlmYQLZ9tA3d7pk+wkkNH8JJBYUz5Jd9O8HUIZQDElQNHR0Rv1uvj
 jduIvEy+DCOJMyRQD0yjv7qBR3dOT7FUXJlW8fjtHox4TUIR3qdvCuR0m
 EXipJgPoURqWUNCzD8hag23DAQJJOtxTuqorI9pmzdRMB3fvPuuolw/E2
 8pmlMtbtHVJOGwk6smVFZWfD/kwWS7FsikkPt52q4YQlwg4a2kY86loSe
 jDVO6IFIFmG2I7oJzve+NJ2UoE/C9X+RaiKV31o52vZkkMmAtsuQRGLig
 ZI0JiK1DVI062B1xafIBV1a2bmZctwmvh9sCkPgb0PNQboWvzxKJIAqSL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398668570"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="398668570"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="676259118"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="676259118"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 25 Jul 2023 08:04:49 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 20:39:51 +0530
Message-Id: <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
References: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 3/3] fault-inject: Include linux/types.h by
 default.
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
 "Reviewed-by : Rodrigo Vivi" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Functions should_fail_alloc_page, should_failslab, and __should_failslab
are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
bool and gfp_t types, which are treated as unknown when CONFIG_FAULT_INJECTION
is disabled because the inclusion of linux/types.h is missing.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/linux/fault-inject.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
index 481abf530b3c..f83ab2b6cd08 100644
--- a/include/linux/fault-inject.h
+++ b/include/linux/fault-inject.h
@@ -2,9 +2,10 @@
 #ifndef _LINUX_FAULT_INJECT_H
 #define _LINUX_FAULT_INJECT_H
 
+#include <linux/types.h>
+
 #ifdef CONFIG_FAULT_INJECTION
 
-#include <linux/types.h>
 #include <linux/debugfs.h>
 #include <linux/configfs.h>
 #include <linux/ratelimit.h>
-- 
2.25.1

