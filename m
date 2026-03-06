Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B59BFCB624
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 16:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79E010EDA7;
	Fri,  6 Mar 2026 16:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAdOAKpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA75110EDA7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772815942; x=1804351942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnfMgOYi+gT0t3rto+rUpCKO/q9EbgKET+JHf20pJgg=;
 b=CAdOAKpvMQcLttqrT8gS5li16HQOZ5fbQl1h1wi1RkFoGAb7rcEY3/+H
 oXap1R0Tbtm7Qj7c2K6v0YXvTDpSsPQTFlj47IgwqkXkUM4jWOP8nPCbn
 /nz2Y98yE9Dzn/THW7MjrcHLJ0+Ci+XTur6v1poGOFcyWRp8JZS45ZRB+
 KPw4pNeCJoROGbXfFC9sN2jFKkKqoToiyRY2+9HeSbvYtLblOLqHlLcGq
 zAOFmebPb+ZVUVHmO5PrbUbwPBW2tcK/KEGmcRNc9CrmSpiGiwmNqAq5R
 dSQSSsNjMBl9fLsqH+LkLwcan9THjio4+d0pGp5ZjBQKD6UT1Jjw84m8u w==;
X-CSE-ConnectionGUID: bP9DDSk9Sm6TKpTCoTdMbw==
X-CSE-MsgGUID: WwpLyzGES1SIp0S3lbUmoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73843756"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73843756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 08:52:21 -0800
X-CSE-ConnectionGUID: vUbGqBXDTd+TJ8MhYh9TLQ==
X-CSE-MsgGUID: Nb9nkXfuQrKKejaqrK9UAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="223753618"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.55.56])
 by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2026 08:52:20 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Fix exec queue unwind on hw engine group add
 failure
Date: Fri,  6 Mar 2026 16:52:07 +0000
Message-Id: <20260306165207.176758-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306165207.176758-1-shuicheng.lin@intel.com>
References: <20260306165207.176758-1-shuicheng.lin@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When xe_hw_engine_group_add_exec_queue() fails in
xe_exec_queue_create_ioctl(), to undo xe_exec_queue_group_add()
and xe_vm_add_compute_exec_queue(), the code should unwind through
kill_exec_queue rather than directly dropping the queue reference.

Use a new kill_exec_queue_no_del label to skip
xe_hw_engine_group_del_exec_queue() since the queue was never
successfully added to the group.

v2: correct the jump label from delete_queue_group to kill_exec_queue (Matt)
v3: add new label to skip unnecessary del when add failed

Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index af915ccb4925..177d40c4408e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1390,7 +1390,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (q->vm && q->hwe->hw_engine_group) {
 			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
 			if (err)
-				goto put_exec_queue;
+				goto kill_exec_queue_no_del;
 		}
 	}
 
@@ -1410,6 +1410,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 kill_exec_queue:
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
+kill_exec_queue_no_del:
 	xe_exec_queue_kill(q);
 delete_queue_group:
 	if (xe_exec_queue_is_multi_queue_secondary(q))
-- 
2.34.1

