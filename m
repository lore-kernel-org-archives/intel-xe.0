Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFA0606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hYTIvWIa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE2D1120E6;
	Thu, 19 Nov 2026 00:29:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B976C1120EA
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795048157; x=1826584157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rxb+LmKSSPeSq6zqGr9T0bGQr0I2tf0OoEuOQDZDF58=;
 b=hYTIvWIaWBbgJ7vaTNl+l8CEMYq8HTw05/lUzjt6S5N+U6lVR9/nDQw7
 8+gtfmGA6nq6/j/eyIaSV3YH+WxbsroTte+Q2tiGI4LRGSx6opUfSurPz
 J9zvcsKT/yD6ecoS5ciUk+rhZKbLYTvHNlmkmoA4B10sh0f0xGPXTNuCS
 6xfuR8riCAXd8R9ksZAxItd6B1JRfeVX66ZITsMDId64RFyaUSmWqVf6X
 Oa4Zp5hpTLyXI1wKmcJmjbi4WJtPj9ib+LLXKNa0bblbDJztnL9OmTB+d
 1HBUJTtjwlrlcX/ZbuXSk3JaLxxOvHph6gd9Fmk6VM9ZkeKFtK6yX/jaN w==;
X-CSE-ConnectionGUID: Yqv1jISUR/WT8gu2ot+/kg==
X-CSE-MsgGUID: PD+xsm07QyqsFg8joootFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3876668"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3876668"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
X-CSE-ConnectionGUID: AYtRtPHhQUOzGF5nl2Fgpg==
X-CSE-MsgGUID: qAvaxQJASfOQ4TqbSBwFrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10081564"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v8 7/8] drm/xe/oa: Free the OA buffer and the stream after the
 stream destroy
Date: Wed, 18 Nov 2026 16:27:45 -0800
Message-ID: <20261119002737.3899877-17-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
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

The OA buffer is now freed after the runtime PM reference is dropped.
Removing its GGTT node wakes the device if it is suspended by then.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f3eceeb34e7b..223419347eb7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -929,8 +929,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	WRITE_ONCE(u->exclusive_stream, NULL);
 
-	mutex_destroy(&stream->stream_lock);
-
 	xe_oa_stream_drain(stream);
 
 	if (stream->sample)
@@ -939,8 +937,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_oa_disable_metric_set(stream);
 	xe_exec_queue_put(stream->k_exec_q);
 
-	xe_oa_free_oa_buffer(stream);
-
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
@@ -1772,7 +1768,6 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 
 	drm_syncobj_put(stream->ufence_syncobj);
 	xe_pm_runtime_put(gt_to_xe(stream->gt));
-	kfree(stream);
 }
 
 static int xe_oa_release(struct inode *inode, struct file *file)
@@ -1784,6 +1779,10 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
 
+	xe_oa_free_oa_buffer(stream);
+	mutex_destroy(&stream->stream_lock);
+	kfree(stream);
+
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
 
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

