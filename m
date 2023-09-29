Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CC5E743ED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F4910E6BE;
	Fri, 29 Sep 2023 05:04:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1DE10E0DD
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695963868; x=1727499868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ibjNsOfkkBi57ElLsX4qpt16CjSUjjnGd92vmNLdFgk=;
 b=NnigjjdwqWfNgfUx6K0XnEcSl8MJS73gjjHMeTeo84rRxQD1FQiwQkuA
 LT/M8goQnO1CMpVzBgZI2ubHgCfP5Qt8jHl9VpqWFH2oGM3ivn0Y9yzUH
 GcIlOHcL32jPFQDQsjQUYqDvLHfPU1kuUca50evIwz51yCvMJirrR7cJN
 mfI7C/ddYNUMsTnJgp9IMV8jYVFN+0a5GRHQfJTeDq93qLs+cHZFttEuT
 k8Qn6WvhPAI1qu7nQ5r/Ev3NKqHYvkRTvcmwMVCGDxriOKO0puG70/m4a
 qxw/3T7fky0nPq7c6Ynj5sAevYp96Bshv+G2NAnn/Y1CdHlLXQjV+QBW0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413142025"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413142025"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865570957"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="865570957"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:02:48 -0700
Message-Id: <20230929050253.3153804-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929050253.3153804-1-lucas.demarchi@intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] drm/xe/vm: Prefer xe_assert() over
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When xelp_pte_encode_addr() was added in commit 99a8844441ba
("drm/xe/migrate: Do not hand-encode pte"), there was no xe pointer for
using xe_assert(). This is not the case anymore, so prefer it over
XE_WARN_ON().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index beffbb1039d3..140a70d91d76 100644
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

