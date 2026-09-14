Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68E3C88E72
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 21:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ABB10E581;
	Mon, 14 Sep 2026 21:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eh0bgvCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7019310E581
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 21:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789422815; x=1820958815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DL8f6s4dmeZeIe65Yg2tdQp0OkdVgpOC5BBKG8HSajg=;
 b=eh0bgvCTmgI075Np1TkO2nMMjPzJDC4BoDHsWIX9CfpiaRxwJfuaxLuU
 Z7XJJvKIbVGAsiS9Zi83NuPrDdsV+D40fiKPXt/TYXvLR/oZO+mwxHhbu
 dhwzyTAGbkqcjJK2nnpnq8lp+G49MJ9EYvy0VQ92A5mP7tTF8xXbepTfE
 qIeVrcB5xZVJsTABCAItslHQPX1KuFq4YkB+W30tvJM6mDEbVATWoxi6B
 n+x+oDea99dZU5lR8ovVH2xGHwlvrqb6pqA8exuxo6hq3PN03VH+93DNt
 +Ivns8ubnZTP7yl+aj5nxrJqbjVP3DHlNc6TbhLaVlIn8Qh36mSDr0iRB Q==;
X-CSE-ConnectionGUID: dEjV++vKQQmysRcAt5SztQ==
X-CSE-MsgGUID: nIBcgfNOSy2ZtEd3qDYlaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101128968"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101128968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 14:53:35 -0700
X-CSE-ConnectionGUID: elNev7yhSG2Duc0nkmYeeQ==
X-CSE-MsgGUID: NGN8r4+dSjmDvDiQpDQxyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273276419"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa009.jf.intel.com with ESMTP; 14 Sep 2026 14:53:34 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/tlb_inval: Treat wedged-device invalidations as
 complete
Date: Mon, 14 Sep 2026 21:53:18 +0000
Message-Id: <20260914215318.200603-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910232734.93054-1-shuicheng.lin@intel.com>
References: <20260910232734.93054-1-shuicheng.lin@intel.com>
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

A TLB invalidation issued on a wedged device fails with
-ENOTRECOVERABLE. xe_tlb_inval_issue() squashes only -ECANCELED, so the
error reaches callers that treat it as unexpected and WARN, tainting the
kernel on a wedge that was deliberately caused:

  ggtt_invalidate_gt_tlb()     drivers/gpu/drm/xe/xe_ggtt.c
  xe_svm_invalidate()          drivers/gpu/drm/xe/xe_svm.c
  xe_bo_trigger_rebind()       drivers/gpu/drm/xe/xe_bo.c
  xe_vma_userptr_do_inval()    drivers/gpu/drm/xe/xe_userptr.c

igt@xe_exec_reset@gt-reset-fault-injection hits the GGTT one, turning an
otherwise passing run into an abort:

  *ERROR* SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
  Tile0: GT1: Failed to invalidate GGTT (-ENOTRECOVERABLE)
  WARNING: drivers/gpu/drm/xe/xe_ggtt.c:588 at ggtt_invalidate_gt_tlb
  Workqueue: xe-guc-destroy-wq __guc_exec_queue_destroy_async [xe]
   ggtt_node_remove+0xe3/0x100 [xe]
   xe_ggtt_remove_bo+0x89/0x2c0 [xe]
   xe_ttm_bo_destroy+0xcb/0x330 [xe]
   ...
   xe_lrc_destroy+0x74/0x90 [xe]
   xe_exec_queue_fini+0x2d/0x60 [xe]

-ECANCELED and -ENOTRECOVERABLE mean the same thing at this layer: the
message was dropped rather than delivered, and the fence has already
been signalled before the error is returned, so there is nothing left to
wait for. Squash both.

A wedged device is only recovered by a fresh initialisation, so the
error return in xe_bo_trigger_rebind() becomes unreachable by design.

v2: fix all invalidation paths. (Sashiko)

Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
Assisted-by: Claude:claude-opus-5
Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 7c3bf32d9258..dd1030de9ab6 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -280,7 +280,8 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
 		xe_tlb_inval_fence_signal_unlocked((__fence));	\
 	mutex_unlock(&(__tlb_inval)->seqno_lock);		\
 								\
-	__ret == -ECANCELED ? 0 : __ret;			\
+	/* Undelivered: fence already signalled, report done */	\
+	(__ret == -ECANCELED || __ret == -ENOTRECOVERABLE) ? 0 : __ret;	\
 })
 
 /**
-- 
2.43.0

