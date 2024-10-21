Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9536BD17141
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 21:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62ABC10E06B;
	Mon, 21 Oct 2024 21:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKIagdDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DE910E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 21:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729547628; x=1761083628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PNMwCXB7uy0BV+uqz+GJWFXCb3UEn/TKNu2g8Th5dRw=;
 b=oKIagdDnVYbkOlQjM8LR+aMJqiAoueDCiEJ41qmG22JzzGaYBJ7T8Ozm
 ORKMjne00kLakAsYfHqsxt9pRAV+YQzj15KcFhxLn+DNrKn5ErjCH2iI2
 E9y+SyLSbT8eaybu+ek7wicH2F5i0UUrSIQ1kiIJzzB8xk4DUnvt2N3T8
 8RQDzQNvtPKCvsslKGOxlSvu7ZbhP9Rb9d+O+NHY8tbanjSPiWq6Nf/xS
 HacrdrdZeUS/Gz2rY8HP3zJmqzGEIVZ7NmrzFhaHXeVtlCN6ocGJqALau
 x4ukyrX8IzzG6sSFlBaCLYXYlOYQ74VasrP/vjg0JPjjBU31KQZ3w8lzd g==;
X-CSE-ConnectionGUID: TKEKkE86SF6yMn9k9t400A==
X-CSE-MsgGUID: DzTcViLyRtK48ynyjm4LYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46522292"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46522292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:53:47 -0700
X-CSE-ConnectionGUID: wf+27hq7S82pn0tzDYQkPQ==
X-CSE-MsgGUID: /PH3DApSS0e1f2TP7k4DZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79590619"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:53:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Don't restart parallel queues multiple times on GT
 reset
Date: Mon, 21 Oct 2024 23:11:46 +0200
Message-ID: <20241021211146.3842483-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

In case of parallel submissions multiple GuC id will point to the
same exec queue and on GT reset such exec queues will get restarted
multiple times which is not desirable.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0b81972ff651..6aeb007eaf06 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1784,8 +1784,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		/* Skip restarting parallel queues */
+		if (exec_queue_enabled(q) && xe_exec_queue_is_parallel(q))
+			continue;
+
 		guc_exec_queue_start(q);
+	}
 	mutex_unlock(&guc->submission_state.lock);
 
 	wake_up_all(&guc->ct.wq);
-- 
2.46.0

