Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190BEE7545E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA0410E05D;
	Tue,  3 Oct 2023 12:52:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4441010E056
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696337524; x=1727873524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iq0JfmtEapEsOEfn+Xn/BZaj5aasM00H0Nx1/GFZPKk=;
 b=W1umVWL0Erjq52CRLMj0vxI5UXUsYABnThJXu07Iv0jgwSWP40G9xkcr
 e96oQ1x8Jmhyd6kAFB07mW72RxhOWBUuHmR/GHbfFfEPyIeHysTEiPz6H
 Kc+LlXI/DUWYzc3u6j0xaSibZowAY4ML2+uct9tcKhs8upBLUneEOD1jI
 hF8nXY3YCJqHY/39HRNHPSxV+TyNDmY+Yyt51gpDvm7AbzUrudl2lJ/Zg
 8Ue8M8zo6DawT8RuSFewyqrTdiVMvkuRLmrSQygQKb0ePpWMdXfsuvD84
 gXcyAOZN759jHglj8uSMr/x7pQDNVxUXrdjNke/eDB8MT8R0YAjwYJ6Sx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="447022083"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="447022083"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="998005495"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="998005495"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:51:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 05:52:11 -0700
Message-Id: <20231003125217.3350838-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003125217.3350838-1-lucas.demarchi@intel.com>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/7] drm/xe/vm: Prefer xe_assert() over
 XE_WARN_ON()
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When xelp_pte_encode_addr() was added in commit 99a8844441ba
("drm/xe/migrate: Do not hand-encode pte"), there was no xe pointer for
using xe_assert(). This is not the case anymore, so prefer it over
XE_WARN_ON().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 65d7a46c3a39..5f69065a85cb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -17,6 +17,7 @@
 #include <linux/mm.h>
 #include <linux/swap.h>
 
+#include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
@@ -1293,7 +1294,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
 	u64 pte;
 
 	/* Avoid passing random bits directly as flags */
-	XE_WARN_ON(flags & ~XE_PTE_PS64);
+	xe_assert(xe, !(flags & ~XE_PTE_PS64));
 
 	pte = addr;
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-- 
2.40.1

