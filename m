Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B64AC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D0110E124;
	Tue, 11 Jun 2024 14:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKGuJb3M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDADA10E67F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116832; x=1749652832;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A+8+efegt5CKT3GNwIzyQwaIn+0fJXa45p9engR+03s=;
 b=bKGuJb3MqDDN7fyAL/3qmA6G9n+2O5+C0i2KDbwz84kicn2tzw8ycRZd
 6L07Xqs9iUDuLxdjJe8s3R3S/K2T/3z2CFaidEOtIgzn3RWX1kJc0yRoZ
 idFFp92p8VoSnpaj/F+VXtf/mPySePdQEy1OLtRM8ZLwxKoHpPKFSQ4uI
 tQDwjauAFha2jRgOXyHeRW5Mw3sF1Dg+lzqXxYjcwNH3PYc+nG7U4vFnO
 J4ZrdiiGrbiQJp1kTnX/uC08ZqVCI+4EYG6rR0zR2ml4l2Wo9vzDj1fA8
 VNTTJqNSr3vEMdloWj8Wx5Fs0cuP+ZucZixeAmYeQ85oOus14BwAGvoG/ w==;
X-CSE-ConnectionGUID: N9q8HGWTTbuFksZ3282CEQ==
X-CSE-MsgGUID: dWCdhv9aSyWoq1yY6uTFCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784569"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:21 -0700
X-CSE-ConnectionGUID: rdUABpENSaCsCX8w08uHQg==
X-CSE-MsgGUID: yyZ7/RXUSaiYBc+/KwAe0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590322"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 10/11] drm/xe: Add killed, banned,
 or wedged as stick bit during GuC reset
Date: Tue, 11 Jun 2024 07:40:52 -0700
Message-Id: <20240611144053.2805091-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
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

These bits should be persistent across reset, treat them as such.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 25240b50a59c..671c72caf0ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1444,7 +1444,9 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
-	atomic_and(EXEC_QUEUE_STATE_DESTROYED | EXEC_QUEUE_STATE_SUSPENDED,
+	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
+		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
+		   EXEC_QUEUE_STATE_SUSPENDED,
 		   &q->guc->state);
 	q->guc->resume_time = 0;
 	trace_xe_exec_queue_stop(q);
-- 
2.34.1

