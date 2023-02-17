Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F995C61DA4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7887210E138;
	Fri, 17 Feb 2023 00:53:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300FB10E1AA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595185; x=1708131185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X0w+aa1YtqUMdsOkaPvZabyul2MXGKcc1sJgASXIKqQ=;
 b=UE8BWrPWVwQUSL7hX2hMJ5LhO+wMyv2zxbu/K6K/vSSzwwmB5lV8YRR5
 eYFKv5yVUZvUmxxfklRyhhDM9KKUEg7Xgq151uA0hcrrCb9EnYMe/sj+P
 goGDAO5NQo4MmFYrpOWPNrv6twpu7i9s5Smx8O1vSCpkJMPSW2gwQeZw0
 DN9j6G+C7JXpR7H0UkD4BhPiwbQ+jSGgHf4quKqIBLlzGENQHgp072ljh
 zSbG35vHf/Ai1wi1tLUSZkc9eVvASR9qsoZYXBIM62GlgIdJIS7pHMbDu
 nwgYGSp6qafakcPTftVNFOfi9r9VfLfc7nn+1TKt5U9bxr5yIesuA+1QT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602196"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602196"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417775"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417775"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:18 -0800
Message-Id: <20230217005226.106499-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/11] drm/xe/guc: Remove i915_regs.h include
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
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915_regs.h is not needed, particularly in a header file. What is needed
is i915_reg_defs.h for use of _MMIO() and similar macros.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
index 1e16a9b76ddc..513a7e0c8a5a 100644
--- a/drivers/gpu/drm/xe/xe_guc_reg.h
+++ b/drivers/gpu/drm/xe/xe_guc_reg.h
@@ -9,7 +9,7 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
-#include "i915_reg.h"
+#include "i915_reg_defs.h"
 
 /* Definitions of GuC H/W registers, bits, etc */
 
-- 
2.39.0

