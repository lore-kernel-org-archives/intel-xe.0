Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1D8E83820
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 18:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5F610E3DF;
	Mon, 16 Feb 2026 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktV4Xre9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A38E10E3DF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771266773; x=1802802773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i/roAIcRzTRyG7jJ3dSw9Fd9VpEVyRfSrbU0MjhMgEE=;
 b=ktV4Xre9/8/yqsCFORSi/HFHJFEOxLZlL8Gqt69T/i3TmNF3Uy9+EnTL
 uhbNaKnJCB7fTfsmH6BvyJo87eadLRyYq6HaHx+rDttpi6zPyauTyqp5e
 TLKisLU3LJHfLQ0EDd4dkadt8Ea/2hwVdyM7BR/W3z1zfWrVp16I+DFFK
 VLsAAPozze2d+yrhecrxx0ieCtiSxw/dRhRG/sPgM+lUxiF4/JfJRWjQ0
 IWl2GMzdlsSEs/7hqSQ4dwYIhbtM2gYEBDZbeGjPYSAw1uXeDm7xjo7xu
 zbjGQv61rpH/3fFcLgVdjwsZLUqK721AUzT0ZIku0PJYFEL3Nvt9Nf0hP Q==;
X-CSE-ConnectionGUID: YmC0ARD0QUONzpa5UKhnwg==
X-CSE-MsgGUID: 4rTzt6NnTJ++xyhrGGt3gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72256734"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72256734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:32:52 -0800
X-CSE-ConnectionGUID: ymM9aWABR8KnicISM+QLJA==
X-CSE-MsgGUID: 3WbYo3QPR3WXHSKy0m7ovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="213685930"
Received: from mgrychow-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:32:51 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Don't expose display modparam if no display support
Date: Mon, 16 Feb 2026 19:32:40 +0100
Message-ID: <20260216183240.1308-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

With CONFIG_DRM_XE_DISPLAY=n the display support will be compiled
out, so exposing probe_display modparam is pointless.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_defaults.h | 2 +-
 drivers/gpu/drm/xe/xe_module.c   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 5d5d41d067c5..c8ae1d5f3d60 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -13,7 +13,7 @@
 #define XE_DEFAULT_GUC_LOG_LEVEL		1
 #endif
 
-#define XE_DEFAULT_PROBE_DISPLAY		true
+#define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
 #define XE_DEFAULT_MAX_VFS			~0
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 903d3b433421..4cb578182912 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -39,9 +39,11 @@ MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be p
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
 		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
+#endif
 
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
-- 
2.47.1

