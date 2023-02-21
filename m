Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB6CC64EC4
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C8810E187;
	Tue, 21 Feb 2023 19:41:20 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5C310E357
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008478; x=1708544478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X0w+aa1YtqUMdsOkaPvZabyul2MXGKcc1sJgASXIKqQ=;
 b=eggP5nheoXLy7zbTWzvPo4ACI/XzGEAiIn7dn3vDVJPS8kWcVTbE9IFI
 WomLUeUsYGZ4ddH/sWJJDOfH5+vI2yeGGmr8FP80MmnnW0P8EWeC1Jztd
 E1kv1gxScHQPJxyDFhy4RQvLcRo/0yOrBGxU8kTNt5t8pklx/3buupaRH
 8EOLYE9Sfk6p/lfAnMTaJ8zWmEPGm1YeK4l2tuOW2NmUO8GcDjkrjBSbe
 u/iX37hWKRUcp7XDza0fmGwNBK8N8SaJWgK3oVc+2H0MsLvdNn4kWaUiD
 QiI4VrFu5aFaaE9al5ds5BVGyZboJBor6CJ3GlxzYORRzw66D1DDIhreP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735694"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622193"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622193"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:52 -0800
Message-Id: <20230221194002.819026-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 03/13] drm/xe/guc: Remove i915_regs.h include
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
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
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

