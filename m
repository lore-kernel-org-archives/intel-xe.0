Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3F606A692
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WmXrcSNg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F6210E925;
	Sat, 21 Nov 2026 02:02:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAEF10E947
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795226530; x=1826762530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4eHDyQvEFlHeEYSPHfmG/DorJ0FhTYsIv9ccKVY19Nc=;
 b=WmXrcSNgZQ65DAFNIpsL1MFbf0pHpB/Bus1H1l0lhBm0JQ/0AimabY1Z
 7W/j4TAB1BYcXoQTovzKjWKasNgJBTdi7zWMl6q6/jZz3K93TrHfHDVCj
 8RuVcXJ6AQVn0M5e2ijQaQJ2p1aD+J8piNIfU2ZpS+4zKXhKjDHN/Z/iw
 s7AnP06dPrlXhlwjPs7nD1jfD0GC5PdLoQjZIXAkp+kD5yBVAujVEhkYY
 UZPzh42+xtK7UMXZcFvqSuZc8uJ5Y6SUVqsUebTFWoj9e12fopm4NQ/+y
 Jtmxo8PE3v4NgNUTeyvjtJAMrKQ8+3VhMzUC8yQbmnysrCMoWLJLu5gLW Q==;
X-CSE-ConnectionGUID: mSOZCehWSCKNrDQZcYjNkg==
X-CSE-MsgGUID: NzvvXtu9RV2gDfkksHz7mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4118798"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4118798"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:55 -0800
X-CSE-ConnectionGUID: Dz6eqE1bS8+9EsL56K/TiQ==
X-CSE-MsgGUID: 5p6nbwdZRGW2jcSCE862yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="11182129"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v9 6/7] drm/xe/oa: Free the OA buffer and the stream after the
 stream destroy
Date: Fri, 20 Nov 2026 18:01:52 -0800
Message-ID: <20261121020145.147384-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
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
---
v2: Free OA buffer with runtime PM held (Sashiko)
---
 drivers/gpu/drm/xe/xe_oa.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3f51dca91c51..9c4c4548c4a0 100644
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
 
@@ -1769,7 +1765,6 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
-	kfree(stream);
 }
 
 static int xe_oa_release(struct inode *inode, struct file *file)
@@ -1781,6 +1776,10 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
+
+	xe_oa_free_oa_buffer(stream);
+	mutex_destroy(&stream->stream_lock);
+	kfree(stream);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	/* Release the reference the OA stream kept on the driver */
@@ -2051,6 +2050,8 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
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

