Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE9D7495D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 07:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9978E10EC98;
	Fri, 19 Dec 2025 07:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1NB4/+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392D210EC98
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766130926; x=1797666926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lwfACT4O76XKuDxXW9YZ/4gKE6iAluPJ15DylvZoAAI=;
 b=F1NB4/+jxeUGgLe7es4uIIbcaiHxIlcXFgd5HAXLsCco7g9qY9OoTKw4
 /6ogJTRTZTIVgTaoF3hzsQ++kDMGdA8cbdv5csk9lz8U/rNM7NHcBzrPo
 n88LH7TczKE/YgVVci6yk092hmdIcQSc9FTVdKj/lH/c43OtFcxIFcjt5
 0X7J+FBTfbSOv++jYKN/5Pc2KeNFRAj0jB84fJAvW+13kAvMv5Ms8lHCm
 GpafQejqfEIcM4Uj/Vxb76a7qQ3pjzUVkKwJHVf4jHNNWqM7QwCAiKnOQ
 Yt74jLGccnbnSycgbI4iILUacGFlwN9iG+mnzvw5mG54dPVyAly2OWk6O g==;
X-CSE-ConnectionGUID: h16+okbRR16BIYoL7qYKmg==
X-CSE-MsgGUID: kVvzJuHZRRaQMKXYaG7dyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78804286"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78804286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:55:26 -0800
X-CSE-ConnectionGUID: QVCn+XfRSgKoVdtFKi0B4w==
X-CSE-MsgGUID: QiQ3ckcRQ2O1RE9yj3eWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198051638"
Received: from osgcshtiger.sh.intel.com ([10.239.70.161])
 by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 23:55:25 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Xin Wang <x.wang@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Remove incorrect code introduced during merge
Date: Fri, 19 Dec 2025 07:55:20 +0000
Message-Id: <20251219075520.3992811-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.34.1
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

Remove redundant code introduced by merge in xe_exec_queue.c

Fixes: ce0478b02ed2 ("Merge tag 'v6.18-rc6' into drm-next")
Signed-off-by: Jia Yao <jia.yao@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cb45962be14c..41023a464480 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -494,9 +494,6 @@ void xe_exec_queue_destroy(struct kref *ref)
 
 	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) == 0);
 
-	if (q->ufence_syncobj)
-		drm_syncobj_put(q->ufence_syncobj);
-
 	if (q->ufence_syncobj)
 		drm_syncobj_put(q->ufence_syncobj);
 
-- 
2.34.1

