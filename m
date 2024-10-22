Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB45D0E6FC
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 11:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBAA10E66B;
	Tue, 22 Oct 2024 11:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kp/U3Ml6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB2810E66B
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729595878; x=1761131878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dX4PCM750aGwSjE0gUVM3jFl+hSs1YgHAvCD4mBi/pQ=;
 b=Kp/U3Ml6tYSz6SqwhSv5dPxWAhp+RT6fZ3PCWCBzXgax0V33PNDF9C+V
 G4DVcXDVViocgilUocifO5xG62cErSPG1izmxUNHjNcUwmHygfB/4ph06
 uA8bca/7gsVwrkX7lzHxxemT3++OqdDscV5CwfUU08rV9IKahf483LSKG
 L0hhndDQBbfKR2/8e4LFxrUeHK8/tuBNZ52s4jqLv9kqxdnFdTQAEdPjm
 4V/LgvnOXM2K+EiOslT+ytaITz+rkqWmhihvtAGOCh83fUes/uu5xRr03
 e6YlXT11o76PPApboGZ4fAlY6rSaHeCxWEQw4oIRdrhfrxvUAx9S6d87k Q==;
X-CSE-ConnectionGUID: hHo63nsXQ2qK1lc8dMRubg==
X-CSE-MsgGUID: st1u/8uZR3e54w1+yOJNjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29232825"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="29232825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 04:17:57 -0700
X-CSE-ConnectionGUID: WKjHeiXGT/GfvfzhLiFh8w==
X-CSE-MsgGUID: fXUyqQiXSI2tz6zcy7vixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84628735"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 04:17:55 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm/xe: Don't restart parallel queues multiple times on GT
 reset
Date: Tue, 22 Oct 2024 12:35:55 +0200
Message-ID: <20241022103555.731557-1-nirmoy.das@intel.com>
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

v2: don't use exec_queue_enabled() which could race,
    do the same for xe_guc_submit_stop (Matt B)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0b81972ff651..0a7c4cb9272d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1745,8 +1745,13 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 	mutex_lock(&guc->submission_state.lock);
 
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		/* Prevent redundant attempts to stop parallel queues */
+		if (q->guc->id != index)
+			continue;
+
 		guc_exec_queue_stop(guc, q);
+	}
 
 	mutex_unlock(&guc->submission_state.lock);
 
@@ -1784,8 +1789,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		/* Prevent redundant attempts to start parallel queues */
+		if (q->guc->id != index)
+			continue;
+
 		guc_exec_queue_start(q);
+	}
 	mutex_unlock(&guc->submission_state.lock);
 
 	wake_up_all(&guc->ct.wq);
-- 
2.46.0

