Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D82C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 22:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFCA11283A;
	Mon, 15 Apr 2024 22:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g98zAfCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9C110EF71
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 22:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713218760; x=1744754760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z4jnSKdo221Mw5uHvrqoD7ix3zSZ9J7nstiYx11z6P0=;
 b=g98zAfCTgnocBBQx3y0Ri0iYta1sLgjJdSCOG3xgoFSHRQaIV9kv9WlN
 h7H2z0addaUbA8ZbeBYHyytodUwmB1v2h0VjnxIMWa18OuK27uBL9SZ3R
 RvZfM8BroQ9MAD36JNS8o7ClP98hzhFnJjqY94F1XK7lkrOADhVj28SMo
 /BtTCaFYAx2LOKgD49Wks4WHuFiUPIsQcHXHVgD+KjZmOXHfpo38zHEGu
 3HrhhuULS+9KZ22i7f4eaakoKnrb/qYKuyS2/9emozU3NW9MIsYWkGAYi
 lN1Zsl/K26O388y+yKONlWpKKlqoaQc24N491n/G+zYkxM1e2w08qukJJ A==;
X-CSE-ConnectionGUID: D9Xz/zxgR/SXG2QZ2r2fBA==
X-CSE-MsgGUID: 9YHpoxlCTBKdmnzpBu0vHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12478157"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="12478157"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 15:06:00 -0700
X-CSE-ConnectionGUID: YafqWniFTKaNmRRVREeh5Q==
X-CSE-MsgGUID: Zf0b2s9hT3Kr73KVako8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22117730"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 15:05:32 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v6 4/4] drm/xe/xe_guc_submit: Declare reset if banned or killed
Date: Mon, 15 Apr 2024 14:50:12 -0700
Message-Id: <20240415215012.2978778-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
References: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
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
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 89cf84a5f888d..f964c0f118323 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1369,7 +1369,7 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	return exec_queue_reset(q);
+	return exec_queue_reset(q) || exec_queue_killed_or_banned(q);
 }
 
 /*
-- 
2.25.1

