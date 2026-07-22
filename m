Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F13C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8825110E507;
	Wed, 22 Jul 2026 21:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wm2dEDns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F86810E4F8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784757581; x=1816293581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X7IfcPianOZRgbmemx+Qb9jfoONEJ0onaj+yvT7edz4=;
 b=Wm2dEDns08y35BRGgch8KaLlu51ovvUphiSUGnn6LaqPzDYXEAG3fq+f
 llaCmt63UawQF60IgaphMr2dKqHmJhPn6PWlhCKMTlVbJ9DOt/DZeZxvb
 sX0X1VA49eyMUSx1ya9ryDxc1KXjOttdYmJUahCrK7TjAQbeCzst1q7yq
 PzY3mTI7hI+eq8RbIU8uEf4sgIZU2NtRGH/nmzQSYEuz4SK+VqPc6qVpr
 uMvPcXN0+xIS8QKxuo14fqHxrHe7vbYljKY/c7L5+BS4O0DIYZQAeuLYI
 RgahIQ7lTVacTgM0sMrd7vCOEsd8PEJkd8aYEtM+DjeaIVYPDGzkEEdVe A==;
X-CSE-ConnectionGUID: C034cnsnRPCLpHwklgGn1w==
X-CSE-MsgGUID: 4e+e4NMhQmGlsUyNTzlxlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96064391"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="96064391"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:59:40 -0700
X-CSE-ConnectionGUID: FBFOedNVTGWkTTXJxIWo3g==
X-CSE-MsgGUID: +iQhFLQNQhmHbTkyQSdRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="258905551"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:59:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Tales=20A=20=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [RFC PATCH 2/2] drm/xe: Add DRM_XE_DEBUG_FLUSH_WA to force the CPU
 flush workaround on
Date: Wed, 22 Jul 2026 14:59:35 -0700
Message-Id: <20260722215935.1369012-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722215935.1369012-1-matthew.brost@intel.com>
References: <20260722215935.1369012-1-matthew.brost@intel.com>
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

Add a DRM_XE_DEBUG_FLUSH_WA debug Kconfig option, depending on
DRM_XE_DEBUG, that unconditionally forces xe->info.needs_flush_wa on
regardless of the detected host CPU. This lets driver developers
exercise the LNL_FLUSH_WORKQUEUE()/xe_guc_ct_flush_g2h_worker() code
paths (including the new best-effort scheduling-delay detection and
warnings) on CPUs that aren't otherwise affected.

Cc: Tales A. Mendonça <talesam@gmail.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub Copilot:claude-sonnet-5
---
 drivers/gpu/drm/xe/Kconfig.debug     | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++-
 drivers/gpu/drm/xe/xe_pci.c          |  3 ++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01227c77f6d7..f0332e061453 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -112,3 +112,19 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recommended for driver developers only.
 	 If in doubt, say "N".
+
+config DRM_XE_DEBUG_FLUSH_WA
+	bool "Force enable the workqueue/work flush scheduling latency workaround"
+	depends on DRM_XE_DEBUG
+	default n
+	help
+	  Unconditionally enable the workaround for the workqueue/work
+	  scheduling latency issue seen on some Intel hybrid
+	  (Performance + Efficiency core) client CPUs (see
+	  xe_device_has_flush_wa()), regardless of the host CPU actually
+	  running the driver. Useful for exercising/debugging the
+	  workaround's code paths on CPUs that aren't otherwise affected.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 853a39579686..2dfdce200be7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -229,7 +229,8 @@ struct xe_device {
 		 * execution by more than a second. This is a property of the
 		 * host CPU (hybrid Performance + Efficiency core designs up
 		 * to and including Arrow Lake), not of the GPU platform, so
-		 * it must not be inferred from xe->info.platform.
+		 * it must not be inferred from xe->info.platform. Forced on
+		 * unconditionally when CONFIG_DRM_XE_DEBUG_FLUSH_WA=y.
 		 */
 		u8 needs_flush_wa:1;
 	} info;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4d6e1b544188..ff04e37dbea9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -827,7 +827,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	 * paired with a discrete GPU, so this cannot be derived from
 	 * desc/platform.
 	 */
-	xe->info.needs_flush_wa = xe_cpu_has_hybrid_flush_wa();
+	xe->info.needs_flush_wa = IS_ENABLED(CONFIG_DRM_XE_DEBUG_FLUSH_WA) ||
+		xe_cpu_has_hybrid_flush_wa();
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
-- 
2.34.1

