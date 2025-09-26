Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EA8CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 20:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EF410EADF;
	Fri, 26 Sep 2025 20:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBjBPeP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68F010E139
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758917361; x=1790453361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xZs3jGKCQIu+6tk3r9Hznyugdqa+GaKap+rLlH69x0=;
 b=bBjBPeP2GsTmHUmaJbwaA+25amti64f6iYeuZcibqJ+oEz1xKiNc465+
 MlqApWhdq1LiTUQqc3GV6eym6iuwUlblH77a35kfaZ57z7vYL0MbZivHe
 hHaor28UJoqaPaeZs0iSsbDoIAHWR0cC8TcEvgFkPD/y9WWzG/Wcf3NJO
 TwXFfGhrbgZZRFaX8ZEXyICeENmsBrtSS/6cPWriKIwUiGbvATPj+qiJY
 ynO3wrBPha4KaZpuClHnDIC9UMiCmFpuHqc+dtRx94Z1n2HKesunf3xEA
 hSpzZYxTwGEYPcq6L7P4ZVDmmDSb+XvaJ5GRgm3/FpAgxzelqWVl4wQZT Q==;
X-CSE-ConnectionGUID: bnD1m1glRdiN5eAiMzaN5A==
X-CSE-MsgGUID: WSQF7tjlQvCJ6YGHVJ3ZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72352463"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72352463"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:20 -0700
X-CSE-ConnectionGUID: aZA4PTHPSNe6v3B5vSQhAg==
X-CSE-MsgGUID: RQ+gBBnzSkiE5UFaAVscbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177634933"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 1/5] drm/xe: Guard against NULL GT in xe_sriov_vf.c
Date: Fri, 26 Sep 2025 20:09:19 +0000
Message-ID: <20250926200917.164618-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926200917.164618-7-jonathan.cavitt@intel.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
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
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Add guards against this in xe_sriov_vf.c:
- Use xe_root_mmio_gt instead of xe_device_get_gt for the gt id 0 case.
- Assert the return value of xe_device_get_gt when this is not possible.

v2: Use xe_assert in vf_post_migration_recovery (Michal)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cdd9f8e78b2a..2c9cef191826 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -178,7 +178,7 @@ static void vf_migration_init_early(struct xe_device *xe)
 	if (!IS_DGFX(xe)) {
 		struct xe_uc_fw_version guc_version;
 
-		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
+		xe_gt_sriov_vf_guc_versions(xe_root_mmio_gt(xe), NULL, &guc_version);
 		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
 			return vf_disable_migration(xe,
 						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
@@ -361,6 +361,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
 		struct xe_gt *gt = xe_device_get_gt(xe, id);
 
+		xe_assert(xe, gt);
+
 		err = gt_vf_post_migration_fixups(gt);
 		if (err)
 			goto fail;
-- 
2.43.0

