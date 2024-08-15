Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE480C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 16:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9B10E479;
	Thu, 15 Aug 2024 16:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjwAkPsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9904E10E479
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723739290; x=1755275290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XzEhsgNRvFm8Ie0J0dFrdWYbh4tt5EcbgyN5aoFr7KI=;
 b=WjwAkPsGQs4j7x5v9KX684Lfj1P+A/YSeeYnKU/Mr4ttd7Y/Tn4zUouV
 1dZvWSZqaukRcqYgK/z38HNoofNbttsPIY3NVn3zvGvMnI2byds2scj19
 8koVkS5Y4eQM0Xl+xgfV95utadpC7uFR+AZAPOdWzJ8RV8Xc4wvD7S7M/
 h9eiH6CMKwYIdnYdr1UhlSQk2MESjPMxhrS6GMnYMYA+XQdaaDgpTQ6TI
 Oaae7+Rg3ru1MLM6nY5Uust7qrmoYwputSQ+3bmigia32zyDIF5GnN5mm
 bhfUqlbUfVemsfAo/PfoOMauvPWEc6ONMKNwm9O+oXAZdDuIUQeXeUE7u g==;
X-CSE-ConnectionGUID: JLTZxcqFQAq5NTq2HXZGBw==
X-CSE-MsgGUID: /vKQGHq0SyWV4903OpNJ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25767662"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="25767662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:28:09 -0700
X-CSE-ConnectionGUID: DZ/2j0P3Q7GhiMdRLw2XhQ==
X-CSE-MsgGUID: Bw+B1D8lQNWJWu63IMo4Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="63815577"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:28:08 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Destroy dangling oa streams when xe_file is
 removed
Date: Thu, 15 Aug 2024 09:27:58 -0700
Message-ID: <20240815162758.36495-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815162758.36495-1-jose.souza@intel.com>
References: <20240815162758.36495-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If an application opens an oa stream and for whatever reason it don't
close the stream the oa unit associeted with it will never be release,
so no other application can use it.
The only workaround was to unload the driver or reboot.

So here adding a list of oa stream and and when a xe_file is closed
it will also destroy all oa stream with the same xe_file.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   |  2 ++
 drivers/gpu/drm/xe/xe_oa.c       | 28 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_oa.h       |  1 +
 drivers/gpu/drm/xe/xe_oa_types.h |  8 ++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2063283871503..b098685ed3636 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -158,6 +158,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 
 	xe_pm_runtime_get(xe);
 
+	xe_oa_file_destroy_stream(xef);
+
 	/*
 	 * No need for exec_queue.lock here as there is no contention for it
 	 * when FD is closing as IOCTLs presumably can't be modifying the
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4be722b92f90b..4a01a928dd8ee 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -70,6 +70,7 @@ struct flex {
 };
 
 struct xe_oa_open_param {
+	struct xe_file *xef;
 	u32 oa_unit_id;
 	bool sample;
 	u32 metric_set;
@@ -839,6 +840,9 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
 
 	xe_oa_free_configs(stream);
+
+	lockdep_assert_held(&stream->oa->streams_lock);
+	list_del(&stream->list_node);
 }
 
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
@@ -1480,11 +1484,15 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 		goto exit;
 	}
 
+	stream->xef = param->xef;
 	stream->oa = oa;
 	ret = xe_oa_stream_init(stream, param);
 	if (ret)
 		goto err_free;
 
+	lockdep_assert_held(&oa->streams_lock);
+	list_add(&stream->list_node, &oa->streams);
+
 	if (!param->disabled) {
 		ret = xe_oa_enable_locked(stream);
 		if (ret)
@@ -1797,7 +1805,9 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_oa *oa = &xe->oa;
 	struct xe_file *xef = to_xe_file(file);
-	struct xe_oa_open_param param = {};
+	struct xe_oa_open_param param = {
+		.xef = xef,
+	};
 	const struct xe_oa_format *f;
 	bool privileged_op = true;
 	int ret;
@@ -2470,6 +2480,7 @@ int xe_oa_init(struct xe_device *xe)
 	oa->xe = xe;
 	oa->oa_formats = oa_formats;
 
+	INIT_LIST_HEAD(&oa->streams);
 	mutex_init(&oa->streams_lock);
 
 	drmm_mutex_init(&oa->xe->drm, &oa->metrics_lock);
@@ -2511,3 +2522,18 @@ void xe_oa_fini(struct xe_device *xe)
 	mutex_destroy(&oa->streams_lock);
 	oa->xe = NULL;
 }
+
+void
+xe_oa_file_destroy_stream(struct xe_file *xef)
+{
+	struct xe_device *xe = xef->xe;
+	struct xe_oa *oa = &xe->oa;
+	struct xe_oa_stream *stream, *n;
+
+	mutex_lock(&oa->streams_lock);
+	list_for_each_entry_safe(stream, n, &oa->streams, list_node) {
+		if (stream->xef == xef)
+			xe_oa_destroy_locked(stream);
+	}
+	mutex_unlock(&oa->streams_lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 87a38820c317d..7d6ee9ff89c74 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -16,6 +16,7 @@ struct xe_hw_engine;
 
 int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
+void xe_oa_file_destroy_stream(struct xe_file *xef);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
 int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 17e17b5b93640..a035786e101c9 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -148,6 +148,8 @@ struct xe_oa {
 	u16 oa_unit_ids;
 
 	struct mutex streams_lock;
+
+	struct list_head streams;
 };
 
 /** @xe_oa_buffer: State of the stream OA buffer */
@@ -178,9 +180,15 @@ struct xe_oa_buffer {
  * struct xe_oa_stream - state for a single open stream FD
  */
 struct xe_oa_stream {
+	/** @node: node of the list of stream  */
+	struct list_head list_node;
+
 	/** @oa: xe_oa backpointer */
 	struct xe_oa *oa;
 
+	/** @xe_file: xe_file that created this stream */
+	struct xe_file *xef;
+
 	/** @gt: gt associated with the oa stream */
 	struct xe_gt *gt;
 
-- 
2.46.0

