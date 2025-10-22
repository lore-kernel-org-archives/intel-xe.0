Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CAFCCD1A5
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 00:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A514310E672;
	Wed, 22 Oct 2025 00:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmWcudFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F8D10E672
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761094543; x=1792630543;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ddpKJyrbWYyWNA0TFxthq4YhYpDBZPgT+GnOJqatdK0=;
 b=QmWcudFNdf4V2plPVNVM+HtSjaQkhxQSgcdxqIXetvZeV3lU7XfGlUBP
 HK4vUr32hElil2PBoX9SOd5LQoIOBImWn2lgNk3HmPZHkpV1FAxRK+tzt
 YZr/DLpwL3IPCRdR+Lz6jbSbOvUfiP6A/PPQV1TeDyUuKg4euYUYAFez2
 W7l4F25G4qr6nuO6GFy8z9OGoQPThrrsWt0ZqWlOhnJ/LMzdEK3YRKb0i
 E3GHQ1b5nIivpbKr4iYNwqdLqMM+Ilsymu/X/1Pvp+uIkuuoA8hEED4le
 39fzpwO8T94pX12cVCwNzi9WvTANCRdawGiUppjJRsg1jagN6QXLzWcTt Q==;
X-CSE-ConnectionGUID: UnqaEQyfR3ypUQysvxsupQ==
X-CSE-MsgGUID: icEwMQcJRV6cLz7FtSjTQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50807412"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="50807412"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:42 -0700
X-CSE-ConnectionGUID: Zt7tqhDSQuaRNe4xMndVFQ==
X-CSE-MsgGUID: Pb2QsFxFSO2qmkST9jAPFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="182938776"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: Check return value of GGTT workqueue allocation
Date: Tue, 21 Oct 2025 17:55:36 -0700
Message-Id: <20251022005538.828980-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022005538.828980-1-matthew.brost@intel.com>
References: <20251022005538.828980-1-matthew.brost@intel.com>
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

Workqueue allocation can fail, so check the return value of the GGTT
workqueue allocation and fail driver initialization if the allocation
fails.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 40680f0c49a1..20d226d90c50 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -312,6 +312,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt->pt_ops = &xelp_pt_ops;
 
 	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
+	if (!ggtt->wq)
+		return -ENOMEM;
+
 	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
-- 
2.34.1

