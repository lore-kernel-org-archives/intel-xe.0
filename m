Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94699FA1FD3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107C10EEA9;
	Wed, 22 Apr 2026 16:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8ZbhtQm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2997510EEA6;
 Wed, 22 Apr 2026 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875189; x=1808411189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ByLeSMfKVOgg6KdZq+7o0fVFJokJJEaSE4Lm+ysoG54=;
 b=G8ZbhtQm8KlML6x4Ovrtw5Fbx9+s5IUeBlI/CbGZZ9PMI3KDmz8CnLic
 +rN28D/73uk8/rsVommVU+55X/pi+knPTac/ZFw5+jvCKfi+b322P5rRl
 BmxS4cDjD7XwXUzziU3XyNrnndJrulkbm0Fo2sP/2gId644EhgDwoIwsJ
 SiUDz5w6pjgbOl6QpGXkvsA4LpMifAVdQEDoYSn/YgqWfAxT5JGgmXgiD
 Sz96VtIX/GcJNLMJZTZUpbH4vaoj9CsbAUUpcO1hYU+qyScuK6ykz8+N1
 /4wLpswSicU3ycgVVUWr+BWhNawE4IkvhpjmykNtSCV4vjXgc3VdW7JUY Q==;
X-CSE-ConnectionGUID: Pso1xWBYRmyHRHGAnMeimg==
X-CSE-MsgGUID: 5OyHJbXeTTOsU/nuRqU75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95247624"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95247624"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:29 -0700
X-CSE-ConnectionGUID: mpHWINVyQAWIDpWXQiMPjg==
X-CSE-MsgGUID: OInKOhNwQwWMfhw9fsSG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="227816221"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:27 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v2 13/13] drm/i915/display: Add DC3CO count and residency in
 dmc debugfs
Date: Wed, 22 Apr 2026 21:56:21 +0530
Message-ID: <20260422162622.1869831-14-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
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

Expose DC3CO count and residency for xe3lp platforms via debugfs.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c      | 8 +++++++-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a85e2edcb894..3cd960163d28 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1650,7 +1650,13 @@ static int intel_dmc_debugfs_status_show(struct seq_file *m, void *unused)
 		   DMC_VERSION_MINOR(dmc->version));
 
 	if (DISPLAY_VER(display) >= 12) {
-		if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
+		if (DISPLAY_VER(display) >= 35) {
+			seq_printf(m, "DC3CO count: %d\n",
+				   intel_de_read(display, XE3P_DMC_DC3CO_COUNT));
+
+			seq_printf(m, "DC3CO residency: %d\n",
+				   intel_de_read(display, DC_STATE_DC3CO_RESIDENCY));
+		} else if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
 			dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
 		} else {
 			dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index 38e342b45af0..1998549b6318 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -531,6 +531,8 @@ enum pipedmc_event_id {
 #define TGL_DMC_DEBUG3		_MMIO(0x101090)
 #define DG1_DMC_DEBUG3		_MMIO(0x13415c)
 
+#define XE3P_DMC_DC3CO_COUNT	_MMIO(0x8f05C)
+
 #define DMC_WAKELOCK_CFG	_MMIO(0x8F1B0)
 #define  DMC_WAKELOCK_CFG_ENABLE REG_BIT(31)
 #define DMC_WAKELOCK1_CTL	_MMIO(0x8F140)
-- 
2.43.0

