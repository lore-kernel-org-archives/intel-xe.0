Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873E6C2A082
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3356210E39C;
	Mon,  5 Jan 2026 04:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6k7ZyuD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F6C10E289
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585766; x=1799121766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t/QJS1kyW7MxnTtUzvIUjSpo+9hANRIMUiQJFqWsIWQ=;
 b=l6k7ZyuDS8PZYd824Jw0v2vJcFI270BHzuBGwZk/jn6TsNbXf01w5TXw
 MirAfYUqw22AkCSlXOfxdxpz9RvlAcMFrx7MOTYw0vF3VJZLgpSQ2DMd2
 LOAtjQSDt0KhTdUWcQEjVtEf5PoFCKjTNvCKrUCUP/Rk3LiV0zA9lhlys
 9TttZnCXdPAyjlOCl+jnFFBH8Ox2eZmBESQASPUCmM+5eDTlndGS9WkmT
 PXoNC/60FwyVRTeUonTKPEQsIgGUVMTn+7hvkekpZt16PVTaNHHdIfYVH
 wBCBsWfFKh0uNuF4fPwCwcZpycsfRo71Ep6zJEaDOvoBFOY64lemuHRJs g==;
X-CSE-ConnectionGUID: 6925ggJLSqmLT4jXq2emEg==
X-CSE-MsgGUID: nfCwKMhFSRiGLqvbPkxpSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856269"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856269"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:45 -0800
X-CSE-ConnectionGUID: TCs4TrA/RoSl7hqCHZM+SQ==
X-CSE-MsgGUID: m1sl5c16SgyXomccQJbLkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060677"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 14/22] drm/xe: Fix Kconfig.profile newlines
Date: Sun,  4 Jan 2026 20:02:29 -0800
Message-Id: <20260105040237.1307873-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Add missing newlines between Kconfig options in Kconfig.profile to
improve readability.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 7530df998148..594acedf7b56 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -5,24 +5,28 @@ config DRM_XE_JOB_TIMEOUT_MAX
 	help
 	  Configures the default max job timeout after which job will
 	  be forcefully taken away from scheduler.
+
 config DRM_XE_JOB_TIMEOUT_MIN
 	int "Default min job timeout (ms)"
 	default 1 # milliseconds
 	help
 	  Configures the default min job timeout after which job will
 	  be forcefully taken away from scheduler.
+
 config DRM_XE_TIMESLICE_MAX
 	int "Default max timeslice duration (us)"
 	default 10000000 # microseconds
 	help
 	  Configures the default max timeslice duration between multiple
 	  contexts by guc scheduling.
+
 config DRM_XE_TIMESLICE_MIN
 	int "Default min timeslice duration (us)"
 	default 1 # microseconds
 	help
 	  Configures the default min timeslice duration between multiple
 	  contexts by guc scheduling.
+
 config DRM_XE_PREEMPT_TIMEOUT
 	int "Preempt timeout (us, jiffy granularity)"
 	default 640000 # microseconds
@@ -31,6 +35,7 @@ config DRM_XE_PREEMPT_TIMEOUT
 	  when submitting a new context. If the current context does not hit
 	  an arbitration point and yield to HW before the timer expires, the
 	  HW will be reset to allow the more important context to execute.
+
 config DRM_XE_PREEMPT_TIMEOUT_MAX
 	int "Default max preempt timeout (us)"
 	default 10000000 # microseconds
@@ -38,6 +43,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
 	  Configures the default max preempt timeout after which context
 	  will be forcefully taken away and higher priority context will
 	  run.
+
 config DRM_XE_PREEMPT_TIMEOUT_MIN
 	int "Default min preempt timeout (us)"
 	default 1 # microseconds
@@ -45,6 +51,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MIN
 	  Configures the default min preempt timeout after which context
 	  will be forcefully taken away and higher priority context will
 	  run.
+
 config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	bool "Default configuration of limitation on scheduler timeout"
 	default y
-- 
2.34.1

