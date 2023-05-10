Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABCFC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8932210E484;
	Wed, 10 May 2023 12:13:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DBB10E48C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720792; x=1715256792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/P4Eq/l15+9yc8rjGvZPa9rvXdzFLcM0r7Bna4m0Mc4=;
 b=PgPCNcBPwVgBJ+W921vRYRKtZmoCmuK1zOuIVp6+uG1OyZWrejwCnOA6
 jhf3y/kV3DDo7twZTUvo44FHGvdGe9bBss9WgND5cqMhLADJHp0Jk0cWP
 F3rwGOS2LX6Knp4RcbKz/SnaO0wy59zTTE3J8k7sgJw0CiV8gj2uq7ghi
 WbZrKth4yPfv7BIOU/xxLruXQjjiRpLKUuoLLpi0uOv4gtCavOLSLMQ61
 Ra072VGSau28m3KS/ug6l/kF4r/O+yTKOW7JS/1qnJlHk51ACoQDlRJ4w
 yGh2roIn6d7B7VHSVBH1xCfhdLb7b+tlkaxTgiW+HdbZ8aWv1Qo5EUoBL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268297"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268297"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906457"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906457"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:09 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:50 +0300
Message-Id: <20230510121152.736148-22-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 21/23] drm/i915: Add new frontbuffer
 tracking interface to queue flush
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We want to wait dma fences in dirtyfb ioctl. As we don't want to make
dirtyfb ioctl as blocking call we need to use
dma_fence_add_callback. Callback used for dma_fence_add_callback is
called from atomic context. Due to this we need to add a new
frontbuffer tracking interface to queue flush.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 33 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  4 +++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 6c3f9b4f76cb..e0947d893c52 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -203,6 +203,39 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		frontbuffer_flush(i915, frontbuffer_bits, origin);
 }
 
+static void intel_frontbuffer_flush_work(struct work_struct *work)
+{
+	struct intel_frontbuffer *front =
+		container_of(work, struct intel_frontbuffer, flush_work);
+
+	intel_bo_flush_if_display(front->obj);
+	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
+	intel_frontbuffer_put(front);
+}
+
+/**
+ * intel_frontbuffer_queue_flush - queue flushing frontbuffer object
+ * @front: GEM object to flush
+ *
+ * This function is targeted for our dirty callback for queueing flush when
+ * dma fence is signales
+ */
+void intel_frontbuffer_queue_flush(struct intel_frontbuffer *front)
+{
+	unsigned int frontbuffer_bits;
+
+	if (!front)
+		return;
+
+	frontbuffer_bits = atomic_read(&front->bits);
+	if (!frontbuffer_bits)
+		return;
+
+	kref_get(&front->ref);
+	INIT_WORK(&front->flush_work, intel_frontbuffer_flush_work);
+	schedule_work(&front->flush_work);
+}
+
 static int frontbuffer_active(struct i915_active *ref)
 {
 	struct intel_frontbuffer *front =
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 72d89be3284b..abb51e8bb920 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -46,6 +46,8 @@ struct intel_frontbuffer {
 	struct i915_active write;
 	struct drm_i915_gem_object *obj;
 	struct rcu_head rcu;
+
+	struct work_struct flush_work;
 };
 
 /*
@@ -135,6 +137,8 @@ static inline void intel_frontbuffer_flush(struct intel_frontbuffer *front,
 	__intel_fb_flush(front, origin, frontbuffer_bits);
 }
 
+void intel_frontbuffer_queue_flush(struct intel_frontbuffer *front);
+
 void intel_frontbuffer_track(struct intel_frontbuffer *old,
 			     struct intel_frontbuffer *new,
 			     unsigned int frontbuffer_bits);
-- 
2.34.1

