Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A8DC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 20:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76110ECF2;
	Fri, 10 May 2024 20:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n10yCEt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F175010E14F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715371258; x=1746907258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dql/2rcrQFx6pZgLEieqtZhFBA/N/FUobRjDkt6obfE=;
 b=n10yCEt4lGiJlC7lTWykZDXJe6PMVwy/PcWRxeIXEomCQmPRBI/wgOWF
 FKAEk4jRdIdg2b9Qb2FGfVVr8KG5HfElE4bPf5HnprVkDEgRht1w813pW
 Q+iTdldYfF9u+AE8kkAqzWQkpZHmOXy3/RG0BatGVsVTgUj9Iy/yUFlnC
 0aJoRJAcjxCINLTr7d9zjSwqN6CNdbX+ZBW023ziqXEEDWcN8K2yBqggh
 DIY3b9ZoNPS0fogC+yvSMHHGJxffXZD2wGEYT9pQh/6dJAiRQICbG1hJv
 7wUAMaLfCMtGzXLHAhqnq/iV6oAfrk7UZ8tWT46cCGohD9JZ/sPbgr/yo g==;
X-CSE-ConnectionGUID: w6m8wE1oSF2Di1Umgp0tWw==
X-CSE-MsgGUID: fVyPFPv/R8Ge8sERG24ntA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="21948548"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="21948548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:00:56 -0700
X-CSE-ConnectionGUID: a4gIoQYLSPyK4n092dB3cQ==
X-CSE-MsgGUID: Tqv4A/tvTvqfpYN8zE54fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29566571"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:00:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com
Subject: [PATCH v7 3/3] drm/xe/xe_guc_submit: Declare reset if banned or
 killed or wedged
Date: Fri, 10 May 2024 12:45:40 -0700
Message-Id: <20240510194540.3246991-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240510194540.3246991-1-jonathan.cavitt@intel.com>
References: <20240510194540.3246991-1-jonathan.cavitt@intel.com>
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
returns true if the exec queue has been banned or killed or wedged.  The
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
index bd507a916c1cf..4efb88e3e0563 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1432,7 +1432,7 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	return exec_queue_reset(q);
+	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
 /*
-- 
2.25.1

