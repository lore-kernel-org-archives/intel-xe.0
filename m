Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66896C4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1853F10E570;
	Wed, 10 Jan 2024 01:24:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC5C10E561
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 01:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704849847; x=1736385847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VgupHyOU2PlVDaWXZgyu4xC44PLB68xOL7qjRi6Genk=;
 b=MkhCFMGAGuc2j8LoXGvHAtScfP0J87RDLppv31VtaH0G8nJgljPc1ise
 r63mT4No2KJzUOkYJXQ9YBTJs3OZT+h+PmbdW6GqXmfE/m0KiLV65TSj5
 Zu6W4uCjKLFTwR1WU1sTgxof25/4lYxF53oKD7Fok4c2kngP2E83IsH0q
 zskmmPhOZ01QAlXBaz+TganxsrkD0nE8YLRV/xd+8Mo8QJBDjden5tPU7
 LG9JRXLxurdkHxqVabtgf2KUj10YLylRPqqGn0dmNDOsT+FPT7zvd678h
 BBbyv/6TYpI/UGRkYSf17Q73ne1DIthXhJtFn9Y9UPdXlrKi0uZnTvmA+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395531960"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395531960"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955187881"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955187881"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/xe: Add build on bug to assert access counter
 queue works
Date: Tue,  9 Jan 2024 17:24:38 -0800
Message-Id: <20240110012439.1400618-4-matthew.brost@intel.com>
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

If ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW != 0 then the access counter queue
logic does not work when wrapping occurs. Add a build bug on to assert
ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW == 0 to enforce this restriction and
document the code.

v2:
- s/NUM_ACC_QUEUE/ACC_QUEUE_NUM_DW (Brian)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3ca715e2ec19..13183088401f 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -629,6 +629,11 @@ int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 asid;
 	bool full;
 
+	/*
+	 * The below logic doesn't work unless ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW == 0
+	 */
+	BUILD_BUG_ON(ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW);
+
 	if (unlikely(len != ACC_MSG_LEN_DW))
 		return -EPROTO;
 
-- 
2.34.1

