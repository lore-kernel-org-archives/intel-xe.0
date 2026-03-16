Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4570F53D81
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 18:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7927510E088;
	Mon, 16 Mar 2026 18:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GH3IjhrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345DC10E088
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 18:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773684520; x=1805220520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kkS4USlJUeJuM7if/Dul2GUkLTcqaDp2z7gCvrOQmXM=;
 b=GH3IjhrXxY2GKutRHagEQ6T1VSHKGK8mY/lnwmkmWf+xjuU8sYjSqHCl
 07JlhML/6ddxMunBq03v5L71FxZnT1m2TFCxMLFKJzxlOANIwTetsB7Hc
 ucMp06S8i0pCzNjD0yQWrSCdjER2FGGO88f8sbD9mgHUMyqDf1pyXa360
 aU2HPtrbIFy1xaJFr68BqfJy5jakF/26bB+qNwY1VRA8tM9AYt9oNEW1R
 xRLorU755pI+7ekVJyiAwW06ZZGumoatcKj6RkzNMBEXsvwFJtwIeTUg8
 YcTPCZEBDLfAAB1XecnCSzBKjpwGSpdiVbBsI4eMWnecSd535ShTl4Itf Q==;
X-CSE-ConnectionGUID: pwlHPqGzQJyCkXsHf9eGhQ==
X-CSE-MsgGUID: eElIaXMVTSeM5nGi8UW95g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85026007"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85026007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:08:28 -0700
X-CSE-ConnectionGUID: kyLLP0EiQs6OOpnZV4DyMQ==
X-CSE-MsgGUID: CaLlReJLQ1O3+NdD3irUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222213743"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 11:08:27 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 3/4] drm/xe: Fix kernel-doc comment syntax issues in header
 files
Date: Mon, 16 Mar 2026 18:03:18 +0000
Message-ID: <20260316180322.1721237-9-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316180322.1721237-6-shuicheng.lin@intel.com>
References: <20260316180322.1721237-6-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix doc comment formatting that does not conform to kernel-doc syntax
rules:

- xe_guc_relay_types.h: Add missing space after '/**' in member doc
  comment (/**@lock -> /** @lock)
- xe_oa_types.h: Fix struct documentation to use proper kernel-doc
  format (/** @xe_oa_buffer: -> /** struct xe_oa_buffer -)
- xe_pagefault_types.h: Use dash instead of colon as separator in
  struct doc (struct xe_pagefault_queue: -> struct xe_pagefault_queue -)

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay_types.h | 2 +-
 drivers/gpu/drm/xe/xe_oa_types.h        | 4 +++-
 drivers/gpu/drm/xe/xe_pagefault_types.h | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay_types.h b/drivers/gpu/drm/xe/xe_guc_relay_types.h
index 20eee10856b2..b99a6686416b 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_relay_types.h
@@ -15,7 +15,7 @@
  * struct xe_guc_relay - Data used by the VF-PF Relay Communication over GuC.
  */
 struct xe_guc_relay {
-	/**@lock: protects all internal data. */
+	/** @lock: protects all internal data. */
 	spinlock_t lock;
 
 	/** @worker: dispatches incoming action messages. */
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index acd78bc14822..0c48c1e0c2c6 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -154,7 +154,9 @@ struct xe_oa {
 	u16 oa_unit_ids;
 };
 
-/** @xe_oa_buffer: State of the stream OA buffer */
+/**
+ * struct xe_oa_buffer - State of the stream OA buffer
+ */
 struct xe_oa_buffer {
 	/** @format: data format */
 	const struct xe_oa_format *format;
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index aa3cfae01b9c..c4ee625b93dd 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -112,7 +112,7 @@ struct xe_pagefault {
 };
 
 /**
- * struct xe_pagefault_queue: Xe pagefault queue (consumer)
+ * struct xe_pagefault_queue - Xe pagefault queue (consumer)
  *
  * Used to capture all device page faults for deferred processing. Size this
  * queue to absorb the device’s worst-case number of outstanding faults.
-- 
2.43.0

