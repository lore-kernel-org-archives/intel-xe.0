Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA03C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 23:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5856D10EDEA;
	Tue,  8 Sep 2026 23:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/Fl7OR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E1B10EDE9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788909537; x=1820445537;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hWzOhHP8Px3fFvgjYvBNGhXuMU6avpqEuZ4oRwTss4Q=;
 b=j/Fl7OR54NPdUQZL8nJxMmCzo1K7IuWSXTd5xIdQeUggtG9ylQ0UnaPL
 9cN/6Mixr2cvPC+WA3FX/KK6pHq/I69A37u46hGufmhS/LbEh9hE4yESt
 ijvTuUPx8QybPINi6uCygZTSEe+3YYpg8N+fgWlWOUTwjsHCQLGPoW4Cq
 c1ndP06Rax7xk5LtvyFAmNV/YcmJPEwZL2Uz99R37HqdS9s0IJRglVffc
 4FCOrggoH+OY9Ndy8JmP/819nD9KxRJeI2pjfQGGi0IgVj5eKRZs/UAic
 Rv2R0ifwXlmOh29Y+bCYl3eoZwjpuAkLBDZTucLVwXsmttrX/3CLqHmvd A==;
X-CSE-ConnectionGUID: HcFlo3fqTKyFEpGTEdk/wA==
X-CSE-MsgGUID: PN6Lyc7FTRilKAD35rIPJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89530424"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89530424"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:18:57 -0700
X-CSE-ConnectionGUID: lojioI3+QUqGlBnJH9yvdw==
X-CSE-MsgGUID: X64lUycPRZW8nnH94bEJNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267485714"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 16:18:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH 1/2] drm/xe/guc: Reject a duplicate deregister-done G2H
Date: Tue,  8 Sep 2026 16:18:56 -0700
Message-ID: <20260908231854.1218934-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
References: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
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

The registered bit is cleared by the first deregister-done, but the
guc_id is only freed once the deferred destroy work has run, so there is
a small window of time where a duplicate deregister can go through
before the guc id is freed. Add an additional check to block a duplicate
deregister.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Reported-by: Martin Hodo <martin.hodo@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228..7339c3cecdc0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3350,8 +3350,15 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
-	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
+	/*
+	 * The registered bit is cleared by the first deregister-done, but the
+	 * guc_id is only freed once the deferred destroy work has run, so the
+	 * lookup above still resolves in between. Checking it here makes a
+	 * duplicate notification an error rather than a second destroy.
+	 */
+	if (!exec_queue_registered(q) || !exec_queue_destroyed(q) ||
+	    exec_queue_pending_disable(q) || exec_queue_pending_enable(q) ||
+	    exec_queue_enabled(q)) {
 		xe_gt_err(guc_to_gt(guc),
 			  "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
 			  atomic_read(&q->guc->state), q->guc->id);
-- 
2.53.0

