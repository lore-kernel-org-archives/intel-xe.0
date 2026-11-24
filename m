Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C5606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ICkK57HJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FA310E255;
	Tue, 24 Nov 2026 20:12:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB26110E85E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795551134; x=1827087134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vaAAzmuRMlMBkWYL2mU3I9tuliuqkvaReNbjkNVKN/g=;
 b=ICkK57HJAdXHAzjgA1LaCll8oJnZuAJlFl/Qa8OJbl79FiDWM0t1uJBw
 ks5CPapKjT/xUEH85cMFuuAfQoD30Cwut7mXuB9wu1ilqnTSWsFqy2ci6
 uU4N3xAHSL6CiTsOncRZIuFaCRmOBtXjBhgbZdQx6n0EiESPRqnqvfN5M
 qtG5tWLmNVfPgiHEkwQJeYvCMb6IWOx2mMvu+eZw+qAdrNe3hXS2X5Pla
 U1zf3bjrxHmMdvRZ/xKQV/zF0o/2hKAeLZqtGs2YFrQKBycWAhpJLUptf
 3NJ8NemVWTcgsMvCis3/4oqdo+Ou5wOEayVHsgoH7MdjFPfQFsVRwWah/ Q==;
X-CSE-ConnectionGUID: P4uxxUV7RSmzxtPVvUcKAw==
X-CSE-MsgGUID: H33iMK3ASfm0PuzAY68sJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4305572"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4305572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
X-CSE-ConnectionGUID: LtR45bNcRZWgFX3ch1DWMA==
X-CSE-MsgGUID: DXIwusqwTqaszKHOyeWblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12240637"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v10 6/7] drm/xe/oa: Free the OA buffer and the stream after
 the stream destroy
Date: Tue, 24 Nov 2026 12:11:57 -0800
Message-ID: <20261124201150.405479-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Free the OA buffer, destroy stream_lock and free the stream struct in
the callers, xe_oa_release() and the stream open error path, after
xe_oa_stream_destroy() and xe_oa_destroy_locked() have released the
rest of the stream.

This lets a following patch release the stream resources when the
device goes away, while keeping the stream struct and the OA buffer,
which an mmap may still reference, until the stream fd is released.

The OA buffer is still freed with a runtime PM reference held, by
xe_oa_release() or by the ioctl in the stream open error path, so that
unpinning it can't race with the pinned BO eviction of a D3cold runtime
suspend.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
v2: Free OA buffer with runtime PM held (Sashiko)
---
 drivers/gpu/drm/xe/xe_oa.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 9ce96cac3bf6..d37724e28016 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -930,8 +930,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	WRITE_ONCE(u->exclusive_stream, NULL);
 
-	mutex_destroy(&stream->stream_lock);
-
 	xe_oa_stream_drain(stream);
 
 	if (stream->sample)
@@ -940,8 +938,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_oa_disable_metric_set(stream);
 	xe_exec_queue_put(stream->k_exec_q);
 
-	xe_oa_free_oa_buffer(stream);
-
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
@@ -1770,7 +1766,6 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
-	kfree(stream);
 }
 
 static int xe_oa_release(struct inode *inode, struct file *file)
@@ -1782,6 +1777,10 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
+
+	xe_oa_free_oa_buffer(stream);
+	mutex_destroy(&stream->stream_lock);
+	kfree(stream);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	/* Release the reference the OA stream kept on the driver */
@@ -2052,6 +2051,8 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 		xe_oa_disable_locked(stream);
 err_destroy:
 	xe_oa_stream_destroy(stream);
+	xe_oa_free_oa_buffer(stream);
+	mutex_destroy(&stream->stream_lock);
 err_free:
 	kfree(stream);
 err_syncobj:
-- 
2.55.0

