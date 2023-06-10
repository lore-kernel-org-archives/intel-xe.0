Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A09C7EE25
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jun 2023 00:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75FD10E172;
	Sat, 10 Jun 2023 00:12:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D6B10E16F
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jun 2023 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686355951; x=1717891951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JHtuFJLWT+qHPn1OJKRFcss+znW/chw+XjYmA2F4pYU=;
 b=dPw6WHaq7u80CV1IibLQYRXRvkg34NTJ+TNCW1VAHudYqnU7cmp/+ov0
 vZqQmHSYr/8DL+foL47AB3vnnTiwkM6eQK42aG8m2H7PfX3/owJAU1nRS
 koawrRHSEa9SEWyXTjZTgsf5LnPfQVPK+hhiglqIt12O2D+gQyh259Mg8
 e8T2qeMNi+qH+M5rKL9vLZUdJ3OxFFoWdh9x7HRA1MISPdQ+TalbhPX+o
 x1HAkynniKjqTLHsW2c5MzXPVH+VDFmp0hUXuOMZcqkEEK83p7nqrIaZT
 C+1KDN5gAofxP7vfvv2eJgewIFlB04peJqhupM5tXNgn9SxMKBeXFOgHf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355199680"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="355199680"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743647070"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="743647070"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 17:12:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 17:12:26 -0700
Message-Id: <20230610001226.4577-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
References: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 3/3] drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY
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

Allow preemption timeout for copy engines on a heavy compute systems
to be specified as a config option.

If all copy engines are thrashing away at the PCIe bus, plus all
compute engines doing the same, then the per copy bandwidth becomes
tiny. That results in copy operations that should take milliseconds
actually taking seconds. So bump the pre-emption timeout to allow for
the worst case scenario (currently believed to be around 2s).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_engine.c     |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 454a49b206c9..305014df2871 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -24,3 +24,17 @@ config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
           This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
 
           May be 0 to disable the timeout.
+
+config DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY
+        int "Preempt timeout for copy engines on heavy compute systems (ms, jiffy granularity)"
+        default 2500 # milliseconds
+        help
+          How long to wait (in milliseconds) for a preemption event to occur
+          when submitting a new context to a copy engine on a heavy compute
+          system. If the current context does not hit an arbitration point
+          and yield to HW before the timer expires, the HW will be reset to
+          allow the more important context to execute.
+
+          This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
+
+          May be 0 to disable the timeout.
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 99c34cab0d15..a590254f14e7 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -39,6 +39,13 @@ static inline void xe_engine_set_preempt_timeout(struct xe_engine *e)
 		e->sched_props.preempt_timeout_us =
 			CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE * 1000;
 #endif
+
+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY)
+	if (e->class == XE_ENGINE_CLASS_COPY &&
+	    hweight64(e->gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK) >= 2)
+		e->sched_props.preempt_timeout_us =
+			CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY * 1000;
+#endif
 }
 
 static struct xe_engine *__xe_engine_create(struct xe_device *xe,
-- 
2.21.0.rc0.32.g243a4c7e27

