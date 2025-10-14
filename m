Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE13CCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B350C10E670;
	Tue, 14 Oct 2025 16:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd7EWLjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C210E668
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460482; x=1791996482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jozmARNP8CNm7+d8AAwSo9GLRBc1lH8hwYSHwCdMLKE=;
 b=dd7EWLjQ/bCLdZ4RM1Sm4GD4onaVX5/IEx4ixCCK6i8/btEbiryGZVpZ
 ptBW62DmsvblN+RZJfGDVcclEB9kpLk7znYt92irn3WgEFXFs1wQMVLk6
 Hf4FF79PZWUY5p7Nw5MozVwbQeQtWY8aYaV+P7gVs6nJp9NKjjSHNvtH2
 2RH79JEY/fbpZzomJMUvG3Klhbbm8zLj8zoLLODlLt1BiaIbKbkDOaRbW
 T0YxSgqkSG3ylgzCOfHZ4HskJ6kmShx8AMk36y+Q6LPI7FfhoUT9BLKyP
 0/fk76clIl8hnG+wjtywtC9vUuzB75u490ugRFoZNmn/yTReuUigWk5PZ Q==;
X-CSE-ConnectionGUID: 0xlDw5HtSP+mbyxDP2OZHw==
X-CSE-MsgGUID: 9eZH2sXaTMGcV/qT0TKwFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063047"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063047"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:02 -0700
X-CSE-ConnectionGUID: ON7PoVpGSQSs4PvWmrhSbA==
X-CSE-MsgGUID: JaMF36MgSWmu3T//Z8W5tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184693"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 5/7] drm/xe: Guard against NULL GT in xe_pmu.c
Date: Tue, 14 Oct 2025 16:48:04 +0000
Message-ID: <20251014164758.125598-14-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014164758.125598-9-jonathan.cavitt@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_lookup_gt is theoretically able to return NULL in some cases,
but several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Use xe_device_get_gt in places where this is not already covered.
Additionally, only perform xe_force_wake_put in xe_pmu_event_destroy if
gt exists.

v2:
- Pass xe_gt to event_gt_forcewake (Michal)
  - Above necessitated passing xe_gt to event_supported (jcavitt)
- Only perform xe_force_wake_put in xe_pmu_event_destroy if gt exists.

v3:
- Use xe_device_get_gt

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 6c428f1e9e23..60b19d625229 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -140,7 +140,7 @@ static bool event_gt_forcewake(struct perf_event *event)
 	if (!is_engine_event(config) && !is_gt_frequency_event(event))
 		return true;
 
-	gt = xe_device_lookup_gt(xe, config_to_gt_id(config));
+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
 
 	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
 	if (!fw_ref)
@@ -219,7 +219,10 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 
 	if (fw_ref) {
 		gt = xe_device_lookup_gt(xe, config_to_gt_id(event->attr.config));
-		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
+
+		if (gt)
+			xe_force_wake_put(gt_to_fw(gt), *fw_ref);
+
 		kfree(fw_ref);
 		event->pmu_private = NULL;
 	}
-- 
2.43.0

