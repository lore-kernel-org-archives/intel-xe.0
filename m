Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54797C98309
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C51610E26F;
	Fri, 16 Jan 2026 22:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZIS5Tzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8281E10E26A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601570; x=1800137570;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=9gIMR4YWQxPgHrMZxoRpNkPrHPwtr4EWeZnA2g+vXBo=;
 b=DZIS5TzllSpnApaOAX8CyPxJ9Gi7m+aUlg//ek+5SvZUT71oqf25maj/
 aWDfaekcnmlm8J6FysSIM2VfSvlMAkzUNsa6dEujb+WJkDCzsQyXHoNSq
 UCOGqG7wn3rKQ6LxDmyq1v9MqUto2LpHjwSS46s0yN9+sPr72TiTUlwN5
 BR5VhyzfcW1O2ddTWzAlmgJOkKor4V/Bl4eq6oT+VNkjlLHEzOo7RIi2R
 sG/GtEj+OO7ylb9ogd/dblYL0wAJcNBP7L/QM2HL7I+NIQNsrzCYlM3v5
 mESRXbzd/mMbbIfoURb5BeXrwgx6MJknZyxmWwyBsqNYw3igtO5c0ZqQo w==;
X-CSE-ConnectionGUID: eMAvmYk0TQCt31iTvsfeNQ==
X-CSE-MsgGUID: TK4UAJlISF++EqdAL6dpOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123027"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123027"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:49 -0800
X-CSE-ConnectionGUID: P8o284YcTZqRhptHtrNs4g==
X-CSE-MsgGUID: lRqzYPTBR4SWeL3uoTqK3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961803"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:49 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:16 -0300
Subject: [PATCH 08/12] drm/xe: Extract xe_hw_engines_setup_runtime_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-8-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The function xe_hw_engines_init_early() does several runtime checks to
adjust engine_mask and only after that does the hw_engine_init_early()
calls to do the early initialization.

In an upcoming change to xe_wa_test.c, we will want to be able to call
that function without those runtime checks.  So, let's extract them into
a new function called xe_hw_engines_setup_runtime_mask() and have the
current caller of xe_hw_engines_init_early() to call it first.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        | 2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c | 9 ++++++---
 drivers/gpu/drm/xe/xe_hw_engine.h | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 68cd26286956..f7f0c048a00a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -507,6 +507,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	/* Rerun MCR init as we now have hw engine list */
 	xe_gt_mcr_init(gt);
 
+	xe_hw_engines_setup_runtime_mask(gt);
+
 	err = xe_hw_engines_init_early(gt);
 	if (err) {
 		dump_pat_on_error(gt);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8d239291bc7b..c2de6e5d9249 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -868,15 +868,18 @@ static void check_sw_disable(struct xe_gt *gt)
 	}
 }
 
-int xe_hw_engines_init_early(struct xe_gt *gt)
+void xe_hw_engines_setup_runtime_mask(struct xe_gt *gt)
 {
-	int i;
-
 	read_media_fuses(gt);
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
 	check_gsc_availability(gt);
 	check_sw_disable(gt);
+}
+
+int xe_hw_engines_init_early(struct xe_gt *gt)
+{
+	int i;
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 7e897620db65..6729ebf0462c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -49,6 +49,7 @@ struct xe_exec_queue;
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
 #endif
 
+void xe_hw_engines_setup_runtime_mask(struct xe_gt *gt);
 int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);

-- 
2.52.0

