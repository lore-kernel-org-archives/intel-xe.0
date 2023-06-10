Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0204AC7EE2F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jun 2023 00:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD35810E178;
	Sat, 10 Jun 2023 00:12:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C5F10E121
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jun 2023 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686355951; x=1717891951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xg6nU7eaVlV6YiHfOkbwcYIeAxMd1W2eVbFrsObcZeI=;
 b=DYik2f+XM07E/1TGscWbjSj+2V/DMJb9Qs+sGGsyLF9DUtKfIH8Kxv7b
 Zi/+w/3vBPXZ7qBiRpwpMNVPCuV/QZ5yQFnSkkfFfLg2NAzcXfdsB06si
 AE0+jiKlW1Lz9KPDiIQ9e7ppCv7Fk66wo0QB2n53ydhdh9iPS8T8GjE3C
 Pza4X/hjZSV+Pmo1ayKLD0j7n8h2Q/hrOfz4P3EtZJ+CnVhK8VXC1AxKQ
 G7WHX7GUh8LjXoqqnFm2+l/kO+UKdJz9yKg1TnSikmGRkMPSh4l+6zkdx
 0FkRN2pb3mZhKfJ35unEnekw9YRvDbmtvoJztiSx9XsFIhhZYi7uGUhkQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355199679"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="355199679"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743647067"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="743647067"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 17:12:25 -0700
Message-Id: <20230610001226.4577-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
References: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 2/3] drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allow preemption timeout for compute engines to be specified as a
config option. The purpose is actually to give compute tasks longer
time to reach a pre-emption point after a pre-emption request has been
issued. This is necessary because Gen12 does not support mid-thread
pre-emption and compute tasks can have long running threads.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_engine.c     |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 27be86adc6cb..454a49b206c9 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -10,3 +10,17 @@ config DRM_XE_PREEMPT_TIMEOUT
           This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
 
           May be 0 to disable the timeout.
+
+config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
+        int "Preempt timeout for compute engines (ms, jiffy granularity)"
+        default 7500 # milliseconds
+        help
+          How long to wait (in milliseconds) for a preemption event to occur
+          when submitting a new context to a compute capable engine. If the
+          current context does not hit an arbitration point and yield to HW
+          before the timer expires, the HW will be reset to allow the more
+          important context to execute.
+
+          This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
+
+          May be 0 to disable the timeout.
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index cdc4bfdaf015..99c34cab0d15 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -32,6 +32,13 @@ static inline void xe_engine_set_preempt_timeout(struct xe_engine *e)
 	e->sched_props.preempt_timeout_us =
 		CONFIG_DRM_XE_PREEMPT_TIMEOUT * 1000;
 #endif
+
+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE)
+	if (e->class == XE_ENGINE_CLASS_RENDER ||
+	    e->class == XE_ENGINE_CLASS_COMPUTE)
+		e->sched_props.preempt_timeout_us =
+			CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE * 1000;
+#endif
 }
 
 static struct xe_engine *__xe_engine_create(struct xe_device *xe,
-- 
2.21.0.rc0.32.g243a4c7e27

