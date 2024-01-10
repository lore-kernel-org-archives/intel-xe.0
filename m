Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B799C47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E97510E561;
	Wed, 10 Jan 2024 01:24:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDED010E561
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 01:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704849846; x=1736385846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7VCY02oH3flaVsyfQWdlqaOi0rSdpiUKhmWDupkGkyI=;
 b=QHT1YgB3dAj7XIr0GO536ymu2qYsLa07jeDn2lPtN4VZW1B/NK+tFOTd
 AtL1lbSmJfcjvgFpp/BgQtNTC7tEukfRUZlo7pcglrdEOQgV5diN46jqy
 7nDjp9SNeZDBFTY4viVLZLop2clZW+P5hsMaFoLKD7Q0a+nyKTQjZqJ2g
 DK9/74RRgjgs9mHV7gl5U8os/KOuJuczYy0BpA3vR2QHBVa4URs44A9HU
 1FsJVZH317BjO+s2Kc3h8R4zMv8Tp37bB9dLHNqv3XQm2gPVI+Bme/iRf
 vHjRi8nBt7CgadOAkmoS++G8IMk6t+9Yzp/u9Al4Kwpc9AormpLljKk4T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395531958"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395531958"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955187875"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955187875"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 1/4] drm/xe: Add build on bug to assert page fault queue
 works
Date: Tue,  9 Jan 2024 17:24:36 -0800
Message-Id: <20240110012439.1400618-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110012439.1400618-1-matthew.brost@intel.com>
References: <20240110012439.1400618-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If PF_QUEUE_NUM_DW % PF_MSG_LEN_DW != 0 then the page fault queue logic
does not work when wrapping occurs. Add a build bug on to assert
PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0 to enforce this restriction and
document the code.

v2:
- s/NUM_PF_QUEUE/PF_QUEUE_NUM_DW (Brian)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 4489aadc7a52..0a61e4413679 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -328,6 +328,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 asid;
 	bool full;
 
+	/*
+	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
+	 */
+	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
+
 	if (unlikely(len != PF_MSG_LEN_DW))
 		return -EPROTO;
 
-- 
2.34.1

