Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7D4C88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 23:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FD810E0CC;
	Thu, 10 Sep 2026 23:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esilD/oa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2826110E0CC
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789082873; x=1820618873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zgT3MUDpGQS7WBIlyy6oiajbBC1KShVexGUwCiJSywc=;
 b=esilD/oaOxJTisWetajDwAe+aE0dRojvBJfhyHP98yT/Z1RdPhk1SBzW
 MsSReZRZbg4nxITJBpin2fVl6QXF6lZSAaqzajaQnpRjZ8eVQqlwq6uL2
 hqIcIUDf2XnjKgL/76SBbJ/+9ci041JMIy6WzPnGNk3Sz5uqGSxQi+gyx
 4FrrK5ccRnFw6R0h8IpOetVDIZS0p0DfNKdLO8bxX2DMA0Q1RLIer/kJQ
 uDX5XrlMF7y1pzFRucAKYBThObHMYni5HBClW7SZ14ZE7yVA7c8Wlv7dK
 I5zJynbQoi8vhpFG+DDSj8JfyIuoJNVEsQvIPeQrkz5y7X5zeC6CaB40I Q==;
X-CSE-ConnectionGUID: 0VL6dg4bTyuw1CBHoTtjRQ==
X-CSE-MsgGUID: YhsCnvmMRl6+KYcf4SvjkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107061607"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="107061607"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 16:27:45 -0700
X-CSE-ConnectionGUID: zVoj8P2HQF6TemdQCxKXgA==
X-CSE-MsgGUID: 7NtAyZXhQpqiDHsAOI3W6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275545339"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 10 Sep 2026 16:27:41 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/tlb_inval: Squash wedged error in GGTT TLB invalidation
Date: Thu, 10 Sep 2026 23:27:34 +0000
Message-Id: <20260910232734.93054-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

A GGTT TLB invalidation issued on a wedged device fails with
-ENOTRECOVERABLE. xe_tlb_inval_issue_op_wait() only squashes -ECANCELED,
so the error reaches ggtt_invalidate_gt_tlb() and trips its
xe_gt_WARN(). The resulting taint turns an otherwise passing
igt@xe_exec_reset@gt-reset-fault-injection run into an abort:

  *ERROR* SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
  Tile0: GT1: Failed to invalidate GGTT (-ENOTRECOVERABLE)
  WARNING: drivers/gpu/drm/xe/xe_ggtt.c:588 at ggtt_invalidate_gt_tlb
  Workqueue: xe-guc-destroy-wq __guc_exec_queue_destroy_async [xe]
   ggtt_node_remove+0xe3/0x100 [xe]
   xe_ggtt_node_remove+0x3f/0xa0 [xe]
   xe_ggtt_remove_bo+0x89/0x2c0 [xe]
   xe_ttm_bo_destroy+0xcb/0x330 [xe]
   ...
   xe_lrc_destroy+0x74/0x90 [xe]
   xe_exec_queue_fini+0x2d/0x60 [xe]

send_tlb_inval_ggtt() only checks that the CT is enabled, not that the
device is usable, so a wedged device still takes the CT send path. There
__guc_ct_send_locked() tests xe_device_wedged() before it looks at the
CT state and drops the message. It can never be delivered, so report it
as cancelled instead.

Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
Assisted-by: Claude:claude-opus-5
Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 111fef781b2a..578cafa5526d 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -75,8 +75,14 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 			seqno,
 			MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 		};
+		int ret;
 
-		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
+		ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
+		/* Device wedged: message not delivered */
+		if (ret == -ENOTRECOVERABLE)
+			return -ECANCELED;
+
+		return ret;
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
 
-- 
2.43.0

