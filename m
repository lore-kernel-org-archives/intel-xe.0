Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859EFC00528
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEDA10E3DE;
	Tue, 25 Jul 2023 15:46:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F82A10E3DE
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690299976; x=1721835976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+jMb/Q8IPrEdfuPHdxpVPEc85TiG5r0bGhBC6vkl8yA=;
 b=lk21L1g/m0URk+Ccl+/uYh9KAOQlTFM0WKNR31HXgr4Xx131Zt6sfny1
 5R2f6nKhB6FvaF7flcmmUjMXCF1sbUewzrl/nZ41J2DtPKunmN38/m6Hx
 jOYpLeR+3eIwWNaKNUfPnjdh6AuEXDVCVe/a7Z3DVz8iVvPKMeoja83ss
 15bI6/NQQZYbhlpMhNBHaLJrdcGR3iEEjM2KKWeLjk2ab3xtjA157aiZD
 HIQ5kRbxEZcCnWa5rusnmde5yhCbA0AfRMeHSGKjEH1Xu+tWBgxZ8zIp/
 UBwqWm+MC6qHSmo/WW4k0QSMpdhnt2dMcykff5vCa/4pAKl9/o09RqrRp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352667247"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="352667247"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729395470"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="729395470"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 08:46:12 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 21:21:13 +0530
Message-Id: <20230725155115.3759312-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725155115.3759312-1-himal.prasad.ghimiray@intel.com>
References: <20230725155115.3759312-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 1/3] fault-inject: Include linux/types.h by
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
Cc: Jens Axboe <axboe@kernel.dk>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Akinobu Mita <akinobu.mita@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Functions should_fail_alloc_page, should_failslab, and __should_failslab
are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
bool and gfp_t types, which are treated as unknown when CONFIG_FAULT_INJECTION
is disabled because the inclusion of linux/types.h is missing.

Fixes: 6ff1cb355e62 ("[PATCH] fault-injection capabilities infrastructure")

v2:
- Add fixes tag (Badal)
- Rectify Cc. (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org
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

