Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ECCC77B7F
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3999710E5AC;
	Fri,  5 May 2023 08:31:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526310E5AC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275488; x=1714811488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEmyrvS76N3WfmYTcbNGmyDH2GgbOPXj8iD88wDok3E=;
 b=jczb3Iq6OYdK/3ILUlU6tbXbtCa51HM8Tsokp7xg+OiIAopEGiCP1Xnb
 UnXQLSbRUEF0RsJOBEiin89Atqu30ZKkzDrPanK42tVoJked4KeQ58duO
 YeNwNKlqnELl+JexFl6dkz+Q+GA2CHeUNDe2kFZwQDXSxCmgmjN6HZ4sW
 +ZtUqlRrQ7D6hsWHWjzKvzVqfCswTYMMF1HTsavN1sJW8EtiS0ZkFmweA
 Cvs+qNwl55KHxm5Up+ZnMSaBIZav2HUuAvEI9NP/2WzAOkKl0iw1iyIo8
 7HU//5Lr8gF23pS1PsE/iDQoqBVS+4p4z4oVeu1ymGIb7Vdmo8T9k7XVx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783336"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783336"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749698"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749698"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:25 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:54 +0300
Message-Id: <20230505082956.2247875-19-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 18/20] drm/i915: Add new frontbuffer tracking
 interface to queue flush
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
Cc: jani.nikula@intel.com,
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
index 5eb46991185c..0dc7d5942a4a 100644
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
index 73d4581aba2c..3eb5c86476d3 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -48,6 +48,8 @@ struct intel_frontbuffer {
 	struct i915_active write;
 	struct drm_i915_gem_object *obj;
 	struct rcu_head rcu;
+
+	struct work_struct flush_work;
 };
 
 /*
@@ -164,6 +166,8 @@ static inline void intel_frontbuffer_flush(struct intel_frontbuffer *front,
 	__intel_fb_flush(front, origin, frontbuffer_bits);
 }
 
+void intel_frontbuffer_queue_flush(struct intel_frontbuffer *front);
+
 void intel_frontbuffer_track(struct intel_frontbuffer *old,
 			     struct intel_frontbuffer *new,
 			     unsigned int frontbuffer_bits);
-- 
2.34.1

