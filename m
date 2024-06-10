Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394C1C27C78
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B947810E49D;
	Mon, 10 Jun 2024 14:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMTHnHuM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5726410E467
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718029082; x=1749565082;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=O3keWOTlKlaVGB4aQSeuoKVgZKx0oQO2l6lbsRg9WYg=;
 b=GMTHnHuMo+QqqmAgPkUmL+W1lB4iYu74oatISYODMHM5ZSiiGsf4/F3t
 HN9w0I1zFltVKuNG03j5TR29e9yRKESid+qIACLUPzaxI+m3pzjmUlXDn
 Ezd9jVS2JSw4loMUM3mgSYp0UA1zzU/en/KspTSGhQ/PbzskXAyMpwV5w
 r2mv/QoTNwyVM4bmcr+r+k6A3BdsL/1v+WJy6KICnkilFWbrZmXC7OnYg
 ahly+MiYX5Pk+6VABh3z39aWkqNREIPTgICkZtrvYRfTQLpl4evhCxJaT
 UZY0H0rRK5GVrtslAiwpni2mOaFhQ6rIwjXFVMxNban0D2pHlswQxxANN A==;
X-CSE-ConnectionGUID: lcd6Vn0RQ164ElFI7SDEMQ==
X-CSE-MsgGUID: 1aAYcG63S7WZaoiBLvkIbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14864871"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14864871"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:52 -0700
X-CSE-ConnectionGUID: sh4bMdkfRbuPux6zdu35Lw==
X-CSE-MsgGUID: pWTi+4nZSBOdhpYu2y5s1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70238694"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
Date: Mon, 10 Jun 2024 07:18:19 -0700
Message-Id: <20240610141823.2605496-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610141823.2605496-1-matthew.brost@intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
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

Include G2H handler name when an unexpected error state messages.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4464ba337d12..766ff8e48dde 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1632,8 +1632,8 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(!exec_queue_pending_enable(q) &&
 		     !exec_queue_pending_disable(q))) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		drm_err(&xe->drm, "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d",
+			atomic_read(&q->guc->state), q->guc->id);
 		return -EPROTO;
 	}
 
@@ -1671,8 +1671,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		drm_err(&xe->drm, "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
+			atomic_read(&q->guc->state), q->guc->id);
 		return -EPROTO;
 	}
 
-- 
2.34.1

