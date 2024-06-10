Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926DCC27C7A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4799010E4A1;
	Mon, 10 Jun 2024 14:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mb4WO2sx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956E010E467
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718029081; x=1749565081;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=n/LVArDCxvw+A+QBYqIrjwusX0FOwuuzX/nkUzxereI=;
 b=mb4WO2sxfziae4FaKqmZ+RYd5HJxEqnP94mIwcMgUruWcnwdESDIjUmP
 XNm3c+FJw+o5vGBsyt6CUVN+PVNipYy0AmgDi0vjV/yxeiCm1S7/Vi3dr
 PmfkFN1CxGpxf5uR9fzEv1tm5Vr81wz/GtsIv2pP85BBFVQd8ZGRnsY35
 64oB3x76z+n8RGjTDqj7E4WV/hUDwvfenH2cmZOc3M11q/P/ZZ8xmkwl/
 EwAqAQfg5gGT7sBsra4/JZn2pe7hMmDH398PR4dk+eYXf70KFPYYG/4HT
 cLBDbPzfqm4Sngz0JfMoqWhHAtz416QREbod+hOmWeG9yH96NAcdu8TpP w==;
X-CSE-ConnectionGUID: V9+O95zkQ1eLB0ddw+WnxA==
X-CSE-MsgGUID: Ogb0fLC6QaiCnK3LWqbSeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14864873"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14864873"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:52 -0700
X-CSE-ConnectionGUID: S84p3kueT12AMy+dWZ6JeQ==
X-CSE-MsgGUID: ROhnAF1pRxa9cZyhrMlQEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70238697"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 08/10] drm/xe: Add pending disable assert to
 handle_sched_done
Date: Mon, 10 Jun 2024 07:18:21 -0700
Message-Id: <20240610141823.2605496-9-matthew.brost@intel.com>
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

Will help catch bugs in GuC state machine.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e697732f1e74..9e1535c2d8f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1607,6 +1607,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
 	} else {
+		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
+
 		clear_exec_queue_pending_disable(q);
 		if (q->guc->suspend_pending) {
 			suspend_fence_signal(q);
-- 
2.34.1

