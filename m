Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E89CD1283
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 19:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620E8112846;
	Fri, 29 Mar 2024 19:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5DEHq+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E02112843
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 19:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711739089; x=1743275089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4s34JrgIwECGYcX2ToTuruMUlTfE7TGNIswqYE3W5Jc=;
 b=J5DEHq+UTR3zJIOup7P8UolTkC/5BFycH1Nt00dBx+7YiD4QEY5wCaLO
 6R8DfcANxUlMnRUAu/oL8YztfZeUT1ayl95Py4gTfcrKrZPeW5XPuzgki
 HUYAlhv204B/NmZvJnFjfDz+ogJz64Nw5jjMnVdQG51sevT8AxDO58sT3
 bZTOKfwMQuHWBevvFcBKjUR+y+X1/rgfoAaOp7zzYRhMJudbVJrtQ8U6P
 +4sdK+kIx5Ad2hXlSCQhrCZVChL1oFP9lFXGWy2ujXqpZ/gCIVFNn/xaX
 KwRB0x7oo6NwR+G3YjIBEX8z4zvwybUhMEOOcbwRK5Fn62cmUmejEJIE+ Q==;
X-CSE-ConnectionGUID: VlOcazk4TPGHU35O5cMSYw==
X-CSE-MsgGUID: jTkfJ0rHRB6khfb+0WvCrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="10720025"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="10720025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 12:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17151859"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 12:04:48 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH 1/3] drm/xe/xe_guc_submit: Fix exec queue stop race condition
Date: Fri, 29 Mar 2024 11:49:27 -0700
Message-Id: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

Reorder the xe_sched_tdr_queue_imm and set_exec_queue_banned calls in
guc_exec_queue_stop.  This prevents a possible race condition between
the two events.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 13b7e195c7b57..294f40ab6aaf1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1430,8 +1430,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
 				set_exec_queue_banned(q);
+				xe_sched_tdr_queue_imm(&q->guc->sched);
 			}
 		}
 	}
-- 
2.25.1

