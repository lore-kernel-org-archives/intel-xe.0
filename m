Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045A6D1CA25
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 04:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A334010E2CA;
	Tue,  5 Nov 2024 04:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg/o6kJR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0818910E2CA
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730781298; x=1762317298;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DZ1sA3F2AyzBWQWLrknwRHpxaw0U9zpTfQ+MiflZPAU=;
 b=jg/o6kJRA/lyo+WxnBIN2Ydgr5AI6KwqFg4mq2b+YnJ6+MkxIQbs8okX
 P7GrARVugJiqKTMBEkKxYLR0+9oCzBy6rBe3AxoJduKlAmYEnvCmnmyid
 Pmv6oSMGsU6onpwk3wGO8Vq2OpGOBw+xPoRJa/6HPgg7m7xwqUPacgoLh
 e+K4au5hIuk1XfS2CblXHrDqapVXL46x6PjqSoAce5AZDddELlv5in1ct
 rN+u+IdcjQaMk2j3oVByw3h9UzKila4v1i6uVRsXoOfIdl/inpRDQXvSi
 UHmA5MoewSgdyIB0+z5/5af2sAcuTBKZcoTAHZA9VftUZzXLpN/Zc6TjI g==;
X-CSE-ConnectionGUID: NxPzlgJGQF2sDQAI9OdVwg==
X-CSE-MsgGUID: 8Bpf58cZTsy5RH3a9bmBdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34197692"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34197692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 20:34:57 -0800
X-CSE-ConnectionGUID: wnngJHvSSE+Bf78BG8Hvrg==
X-CSE-MsgGUID: riXN0/DUTT236Su1ACAXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="121350699"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 20:34:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
Date: Mon,  4 Nov 2024 20:35:23 -0800
Message-Id: <20241105043524.4062774-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105043524.4062774-1-matthew.brost@intel.com>
References: <20241105043524.4062774-1-matthew.brost@intel.com>
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

In a couple of places after an exec queue is looked up the exec IOCTL
returns on input errors without dropping the exec queue ref. Fix this
ensuring the exec queue ref is dropped on input error.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable <stable@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f23ac1e2ed88..6de12f91b865 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -132,12 +132,16 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
-		return -EINVAL;
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM)) {
+		err = -EINVAL;
+		goto err_exec_queue;
+	}
 
 	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
-			 q->width != args->num_batch_buffer))
-		return -EINVAL;
+			 q->width != args->num_batch_buffer)) {
+		err = -EINVAL;
+		goto err_exec_queue;
+	}
 
 	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
 		err = -ECANCELED;
-- 
2.34.1

