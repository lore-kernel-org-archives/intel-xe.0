Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A6DC001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 23:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2A510E4CE;
	Wed, 26 Jul 2023 23:21:50 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C744A10E4CC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 23:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690413705; x=1721949705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nP9SBkNcW1+VhHKL3E4S8DX93WoCSp24qIMM8TgHhHg=;
 b=IXzsOPcgl7uopKtsa9cTmj9uwViq903FixvX+6s0iWS6+xvCOAgoGpTL
 aW17DlGI1CrNwH/rtBxfa0PPcw/+gOwnnhv0QVAwy9otLKBRpOX5T7ngQ
 S47pnvyWosFy3XyHgbLFk2zWI+yxAy0ARWaAJEiVb4odr9+g3eUKRsIS1
 4qkZU/x42cgRgx677I57YwFJUs28SbI+voLhNhVxGFSf+0rTX6I5Cm81F
 XdLMHTu3LQ9KFSHScRwOs6Myh78SD9Rcdm15rUDNjPNTZ+pgHH6DHYjyT
 ubcdnB3SwyxyHZuPKblEw+LO4wdvMfqcM7mTxcq0r/rN/SNPVXmPPHqbG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367031371"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="367031371"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 16:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726715219"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="726715219"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 16:21:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 04:56:48 +0530
Message-Id: <20230726232650.3873897-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 1/3] fault-inject: Include linux/types.h by
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Functions should_fail_alloc_page, should_failslab, and __should_failslab
are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
bool and gfp_t types, which are treated as unknown when
CONFIG_FAULT_INJECTION is disabled because the inclusion of linux/types.h
is missing.

Fixes: 6ff1cb355e62 ("[PATCH] fault-injection capabilities infrastructure")

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
v2:
- Add fixes tag (Badal)
- Rectify Cc. (Lucas)

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

