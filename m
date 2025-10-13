Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3DFCCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3810E504;
	Mon, 13 Oct 2025 22:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ej24mwMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DB110E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760394698; x=1791930698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J22DxhY/6Q7j5YBpLwLzadMpD7hddoViC/SRggOVS1Q=;
 b=ej24mwMQ7qQCyrHuLW+cfcKRtx4pVVzy3R+sew3uRu+z6jcn9ITwtgLt
 k7ThI2OppTHddP5Ndlv7AbyRnvs8oHD3fi6yTPehUb3q/eL1mtpZyWVsY
 SqKHWnbW8AvaUAxkMkQeHuE6GJ5TGbrnccg1tBoUuH7TiAmXYd3mTkziB
 eHW9ch3k5/Wc9YVHoPURvWEIHqlplfC6RF35A8tIvJzHks/P2ANwn9Aea
 XgkgdIykpgaZnWBxhSAcF09kDGR7kMiBN9rIzuiKCm1SRbiunXf9+gkw6
 4bU8P38m60teE9H31yckRfEa3qM8SdSYhjX0FldoKLBS6miBJt+tS34lK A==;
X-CSE-ConnectionGUID: FBm7PeqgQCOfF9RhOHhPfg==
X-CSE-MsgGUID: 9n7K4QVES1WyJ4f4d0QwUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="79987312"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="79987312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:38 -0700
X-CSE-ConnectionGUID: a7BL7N+wSXC148yJOVqgLw==
X-CSE-MsgGUID: /bauBoU6QDajyPj2Si27iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="212677591"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 6/7] drm/xe: Kick start GPU scheduler on teardown
Date: Mon, 13 Oct 2025 22:31:34 +0000
Message-Id: <20251013223135.189357-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013223135.189357-1-stuart.summers@intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
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

Ensure all remaining GPU scheduler messages are processed
on teardown. We already have a wait here, but if the
scheduler was stopped while we have outstanding transactions,
those queues will never be fully drained.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5ec1e4a83d68..c923f13a13ef 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -276,6 +276,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	/*
+	 * Kick start the scheduler here to ensure any remaining
+	 * messages are processed
+	 */
+	xe_guc_submit_start(guc);
+
 	ret = wait_event_timeout(guc->submission_state.fini_wq,
 				 xa_empty(&guc->submission_state.exec_queue_lookup),
 				 HZ * 5);
-- 
2.34.1

