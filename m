Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF13EC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 19:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A00510E0D7;
	Tue, 21 May 2024 19:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewDkYLLv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCA810E1ED
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716320264; x=1747856264;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CRdtmiGAncrx0vybBWJzNRDQYFmCXN8gaU6sK9R9TLk=;
 b=ewDkYLLvrmss+gtdf8Fgtyau/AGrq6sUY3m5r41RdvazkR5/FhbbEz4R
 FuPeO9l+pL6ZB/s7tBz/mJ/q+WFI8iRKpDcOcNJNri3Mmnjc6oaDyamG/
 0E5X5xxmWbiysC9GxI6AoS+jRKrx/acg85mDpHxMaxziIX49ySeHotwvB
 AkzNtkbq3SiacVL5ETozmbdTDtgrf0KJg7rqPkebajdjOutcvT/DwH0h/
 vFceKkkZsBpQOx6u+Tkl/KTwz9+R5f4NUwkkqRINK2fQ3GkXHEIWMLHcT
 rpwTOhGD6ODumX3ERXZIVsVY6XhNuvh+KHRMpXxyLiqZrwxpJeViwwDCp A==;
X-CSE-ConnectionGUID: 8HjegkdETc6pXUYMSmsaSA==
X-CSE-MsgGUID: wbZFTf2lQuu0HDsYwBPHIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12652590"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12652590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:37:44 -0700
X-CSE-ConnectionGUID: tN6HdX5HRy6qvvXRKo72Og==
X-CSE-MsgGUID: 6vQTM6LESOKz2BcKM0YnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37863794"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:37:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Properly handle alloc_guc_id() failure
Date: Tue, 21 May 2024 12:37:39 -0700
Message-ID: <20240521193739.4298-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

