Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAF9D2FEC0
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 17:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B7410E5A6;
	Tue, 27 Jan 2026 17:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqYgZ3pc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DED10E5A2
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769533498; x=1801069498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5g7eNrockMgk0yivVHjBlRycQ6V13a9tjJgfB5sdCxI=;
 b=TqYgZ3pcOpKGKrnZhfp3Va5QEZGaQf2Hh4603abrw5/2rMcNDK2XYXHD
 iPWMbz6nucWCBQ/klF4HAxf2bh3TTeWMwou9y+8GFofkZahMnhyDI2lNO
 0I1X7UwvAMDoxs/6sEMoLv9nu/RCcVL7TrZxaq7o45dx48fJcDLUzUX0C
 NfQYAkiE6gs2FQrOBALJzvr0SQFDlHvVSXRVBf2TqXqtWA4UHo7qAonpx
 dl/9E3TkugEQ1QUQjpqREYtBrVXsNUysRPSO/OJwhIxx9dSxi8otG8oS0
 7V6nxmUjpRQyg+RkzqM4q83est0Gbk5H0FZ2gYnM8vxj/8Y/2Ew9N+3H4 Q==;
X-CSE-ConnectionGUID: 0jY+jvPQQGKdDZz1907rzw==
X-CSE-MsgGUID: R84B5Z2uSU2KixCvLpYA+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93393522"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93393522"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 09:04:57 -0800
X-CSE-ConnectionGUID: Y2vXN4vtS3mCemYU34N2kA==
X-CSE-MsgGUID: 2Gxn7tzMQECALw/ZuHgKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208039388"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 09:04:57 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v4 1/5] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Date: Tue, 27 Jan 2026 12:04:51 -0500
Message-Id: <20260127170455.618616-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127170455.618616-1-zhanjun.dong@intel.com>
References: <20260127170455.618616-1-zhanjun.dong@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

xe_guc_submit_pause_abort is intended to be called after something
disastrous occurs (e.g., VF migration fails, device wedging, or driver
unload) and should immediately trigger the teardown of remaining
submission state. With that, kill any remaining queues in this function.

Fixes: 7c4b7e34c83b ("drm/xe/vf: Abort VF post migration recovery on failure")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 456f549c16f6..d61bd0094e0b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2774,8 +2774,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
 			continue;
 
 		xe_sched_submission_start(sched);
-		if (exec_queue_killed_or_banned_or_wedged(q))
-			xe_guc_exec_queue_trigger_cleanup(q);
+		guc_exec_queue_kill(q);
 	}
 	mutex_unlock(&guc->submission_state.lock);
 }
-- 
2.34.1

