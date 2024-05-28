Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2086CC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 10:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B636D10E513;
	Tue, 28 May 2024 10:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVbHHUe+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CB110E513
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716891984; x=1748427984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IIavUqYQj7tXQlMH74CNmodQ/A3/7w8V52v8I3DyiQs=;
 b=nVbHHUe+v0q7+/4xgMSsS0vCIUgPJgG1r5pj80y4UTGJaPF6s8RibnUq
 PWm2jNeD6qWhVj06aNJefV5YqKzMeiO3whCaG/iLCIHKw0hEq0undDm8N
 eDKMrJ/xUXTEgY3ZavG5X1SZ+2VnStbX8Im6PBJ3q+QSGtNZE6L3IQqns
 fg5SdL8SmBNSm7FTTc2hO9ugPTz5kWLMJ6FubOWrtzt7H8YENuGsevZjz
 laYK5vq3t44DPnpzbeg4yUSGsYt0LNIJuBlbjSrXdjocHJj3wPvYJE+/q
 LVvjs4yHgLxPOUHXu4JqUq5Vfgb47pk+iUtIJMio/hg6huG8wd5WlZF/I A==;
X-CSE-ConnectionGUID: QDDmzW2FQEKJfnkOrWoQpQ==
X-CSE-MsgGUID: Hk7trdWnRMSXAWDWAZCd/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13101094"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13101094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:26:23 -0700
X-CSE-ConnectionGUID: uBNCigoeTvKS8OlJONRHpg==
X-CSE-MsgGUID: PcfceLyQQ/eSd25wqap49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35109717"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:26:23 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/client: Check return value of  xe_force_wake_get
Date: Tue, 28 May 2024 12:11:32 +0200
Message-ID: <20240528101132.14788-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() can return error so check it's return value
before reading gpu_timestamp value.

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..0c13395ffd34 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_gt *gt;
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
-	u64 gpu_timestamp;
+	u64 gpu_timestamp = 0;
 
 	xe_pm_runtime_get(xe);
 
@@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+			break;
+
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 		break;
-- 
2.42.0

