Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B32CD1288
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 19:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBF6112849;
	Fri, 29 Mar 2024 19:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chVcdpk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE05112849
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711739089; x=1743275089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j09te/RsXcr+s1cQ+Ao8lTiqxXz92Dty5+QR2TKzRis=;
 b=chVcdpk10McNxqSHTsb5LfzVlfHDsRiP8BVm5arJH+6dr5jXeEZ7uylh
 udGAeKqMJ7GKzublttbboqs6ILCc6FQHHBEM7S+5Zocqp+wbchztqccf9
 80mPm7dX3tA3axeY+1mhEytiRwcHOS+p7lgYBkS8exJpkopmQfpL8Yt+K
 EvJ4a78zmnbUelVNoM3pRKt+wQQzlZN3Obpg4pSgq5oxrY2Czyh5usHFN
 a5CuaM/ye4+8BYPoWYTYMNKKBvYMm8jlw8pIsIXoM5BLQ9TloG2aQkzeU
 o5fA5w+6a0UOr52HiPRdIRorQ0prIL0nVKoPegtM0+fPY0JyviVhgTcxZ g==;
X-CSE-ConnectionGUID: NLL6zhMTQMmOM3Ov3hKOfg==
X-CSE-MsgGUID: yZnEsHFsROurSt0p9uWIng==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="10720027"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="10720027"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 12:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17151865"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 12:04:48 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH 3/3] drm/xe/xe_guc_submit: Declare reset if banned or killed
Date: Fri, 29 Mar 2024 11:49:29 -0700
Message-Id: <20240329184929.3675256-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
References: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
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

Add an additional condition to the reset_status guc_exec_queue_op that
returns true if the exec queue has been banned or killed.  The
reset_status op is only used for exiting any xe_wait_user_fence_ioctl
that waits on an exec queue without timing out, so doing this will exit
the ioctl early in cases where the exec queue can no longer function,
such as after a GuC stop during a reset.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index bc0b5ec0b2ebd..ac3958c56943a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1371,7 +1371,7 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	return exec_queue_reset(q);
+	return exec_queue_reset(q) || exec_queue_killed_or_banned(q);
 }
 
 /*
-- 
2.25.1

