Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71B6CA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E34310E125;
	Tue, 19 Aug 2025 06:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBMjeh9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25610E125
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585558; x=1787121558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3fud4pNbUmGvE3eA44yfjPWJraS7ZszikchzudKotlo=;
 b=UBMjeh9Y8CFWmGhfDG5mGMU8cjzI+0oX9opEKlD91JOqtRheUsQgI7AZ
 hgjDFgZtijEhXiDURbhkYfux9HiVqG2u0cTVQ1K9nvniX87pzj+kHIkOD
 GoAlgu5WF1dikU/8Fr3OXQmvMqHGqmIRa+bXAsWR3iipZjmOZZUMdV1wM
 eNzf7pdH5nqCaLP9b8h08AfyZABwR+oDAP9I47yGJNhQq2NQnF7dcXegU
 UZL/mhOubJWhe1CPJezjKlIup7n20VDPuMkHxI1iQ+lCbHmruqyM8oEOF
 ub0g58GaaVFyPAGOeRUSfsqhNuw2ieEqKZ+yk10Z4s9KiRIdQjs5clvbK Q==;
X-CSE-ConnectionGUID: 1nWRzpaqRTiV/5Zmr6AWEA==
X-CSE-MsgGUID: hhQlpYtUS+2FmsPRfmKE3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966966"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:18 -0700
X-CSE-ConnectionGUID: 21hEhJUZQeujXVvBQk8DmQ==
X-CSE-MsgGUID: tgu0gL/fQOOjfYQxZJg0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009453"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:17 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 1/8] drm/xe: Add Kconfig option for GPU frequency tracing
Date: Tue, 19 Aug 2025 12:04:10 +0530
Message-Id: <20250819063417.918666-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Add CONFIG_DRM_XE_GPUFREQTRACER configuration option to enable
GPU frequency tracing support. This option depends on DRM_XE and
FTRACE and is disabled by default.

The configuration allows users to opt-in to GPU frequency monitoring
and tracing functionality.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 714d5702dfd7..d9d07ec69875 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
 
 	  Use "!*" to block the probe of the driver for all known devices.
 
+config DRM_XE_GPUFREQTRACER
+	bool "Enable XE GPU frequency tracing"
+	depends on DRM_XE && FTRACE
+	default n
+	help
+	  Enable GPU frequency tracing support for Intel XE driver.
+	  This adds an ftrace tracepoint that reports GPU frequency changes
+	  at periodic boundaries (default 5 secs, configurable via the
+	  gpufreq_monitoring_interval_ms module parameter) and
+	  on direct frequency change events.
+
+	  The monitoring interval can be configured at runtime via the sysfs module parameter:
+	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
+
+	  The tracepoint will be available at:
+	  /sys/kernel/debug/tracing/events/power/gpu_frequency
+
+	  Format: {unsigned int state, unsigned int gpu_id}
+	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
+
+	  If unsure, say N.
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
-- 
2.34.1

