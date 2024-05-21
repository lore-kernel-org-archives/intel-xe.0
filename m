Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C52C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 20:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2D310E0D7;
	Tue, 21 May 2024 20:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIwnTbu1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3606B10E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716322636; x=1747858636;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OyUvoOhJmLUJd4ksuj5VILmN5qYcVlBtjyRqYWy4Kio=;
 b=dIwnTbu1TmIEpCMaATMYnDdpoDUyK9nwurhb9SS7pX37MISD+x9/hqtX
 UPh2WqnH24eGyWUz0Jg2KEi1Byc7TurRQMApy5CeMTpfRpMUtx2IDDWtB
 cLQUNQPUWJiUz4X6WGw7Lj40afX6V/4r/OUo+o13SgQzZpkSRfixyonp5
 K8qKT6Aac5p1cNOTWFReWVr0nnHkB7bq14rUx1Yw5HpRAYp+eCsr8ZN/2
 032VjphPwW9Ija8HlVAIIu0PU+pOEjREto3tppxkQ1Aptx8I3fBjqOtYY
 X0JMvDHk5DCw/w9OvX/EnwQoRdJEFO8Lb8yLiHtZYIjcgS82+vx9RELvm Q==;
X-CSE-ConnectionGUID: 7EBd/+klSGylEaGHXPVe3A==
X-CSE-MsgGUID: w7Yp+vN4THC5/nLVDOxYtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12724308"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12724308"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:17:15 -0700
X-CSE-ConnectionGUID: va7iWvSiTM6pqb1VLTq1JA==
X-CSE-MsgGUID: TwRG/X4MT3+YNlCVRQzGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37874957"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:17:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Properly handle alloc_guc_id() failure
Date: Tue, 21 May 2024 13:17:11 -0700
Message-ID: <20240521201711.4934-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Release the submission_state lock if alloc_guc_id() fails.

v2: Add Fixes tag and CC stable kernel

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ad2b8067d071..c0b901c5565b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1304,6 +1304,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return 0;
 
 err_entity:
+	mutex_unlock(&guc->submission_state.lock);
 	xe_sched_entity_fini(&ge->entity);
 err_sched:
 	xe_sched_fini(&ge->sched);
-- 
2.43.0

