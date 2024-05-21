Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701E6C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 20:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F02010E0D7;
	Tue, 21 May 2024 20:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9SJhpf6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A8210E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 20:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716322374; x=1747858374;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mnqiN2R+YoKcRMIeCk7KwYbR2fqOCqvBLoiva3lLPbs=;
 b=O9SJhpf6QanvXuLdlv/1frQYcwj7ucAf44iMxJx5aJr8vJLI/moma3Ab
 ErRlDsai2jCjexNeWmmJSxsLFjApR1euBBp/e7rQjRCoxtfdXkZM/hNfx
 UrcElH34cVO/fsHQ8buXQaJ5bPFcrKy2OSPzBAhqUzSAsAhQmiDs3eJts
 oQiTOLvWfMRyu9E7WDISt3yzOVF+oPgvNziouoSBWgbMjN9wICTDC3jQH
 GVyGLjRwxQmjwrKotMnXPo8v2WE6ny0AgTURbozRdbSysDTKzbji3tQdk
 TPtP+gvEGWYAgUEeccltHEM1v0olKMe7EWn2iuNOCodGS4osD5bdPV41k w==;
X-CSE-ConnectionGUID: 6iG/GpyHRSmLYCNFtYT50Q==
X-CSE-MsgGUID: 3sqJupxiRAKEmlVg6bpVAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12659335"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12659335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:12:52 -0700
X-CSE-ConnectionGUID: PV8Fnm4BSzq7P2DIA0KHWg==
X-CSE-MsgGUID: B0QAiQeKQK2l87RIpR8jNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32956555"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:12:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Properly handle alloc_guc_id() failure
Date: Tue, 21 May 2024 13:12:46 -0700
Message-ID: <20240521201246.4749-1-niranjana.vishwanathapura@intel.com>
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

