Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD2FC021B0
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 00:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585710E8BC;
	Thu, 20 Feb 2025 00:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY7T6F0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BF210E098
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 00:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740010863; x=1771546863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z1w9i47BE1UtY4uScsMNfdaMBpzLKJuLqtJjnKJnNQs=;
 b=RY7T6F0dsCMD6dwYb97ziE+MRTxI3vhjvaPZZDCX4kCM8K9Q0+w+KV0L
 bS+vwb/U3JqcEIM0hBl9ADvCFvMEcVvujgvTw7ysoa5cJ2Y+nCuCps2mx
 7ON1Z24xR3cDZXNh5TOkohzFObcVc3I+9v/eh96VLcbrP7T+tpeSlW5q0
 dXBwH4mf6sSLDQsOj8LYqcc9g2FxvrHR/cMKq69H2BXJGZxzh+9ndldN8
 mqvKQvblhExELE7CSSB0zpQuIdcx58EtRDdgXfgjdkx0Tw11NS/conuJ8
 AslMvDy505X4uZn/NmBGMEnyuINNNm9IU+rgMvvdC9UAoddO7nO/uldDF A==;
X-CSE-ConnectionGUID: fssTXXhyR7WbjGv9I/sKBw==
X-CSE-MsgGUID: ZsIRN1tPT7SQyCZc4XEvRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39961852"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="39961852"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 16:21:03 -0800
X-CSE-ConnectionGUID: Z4AQ8pluRlSxUboCZWmLIw==
X-CSE-MsgGUID: UPbHm89NQaiDJDKYuxUKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114859693"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2025 16:21:01 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 1/2] drm/xe/devcoredump: Fix print typo of offset
Date: Thu, 20 Feb 2025 00:17:09 +0000
Message-Id: <20250220001710.1803749-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220001710.1803749-1-shuicheng.lin@intel.com>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
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

The log should print with "offset" instead of "size".
Correct the typo in the comment.

v2: split kzalloc change and add typo fix in commit message (Lucas)

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 39fe485d2085..60d15e455017 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -237,7 +237,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
-	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
+	 * internally using GFP_KERNEL explicitly. Hence this call must be in the worker
 	 * thread and not in the initial capture call.
 	 */
 	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
@@ -423,7 +423,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
 	if (size & 3)
 		drm_printf(p, "Size not word aligned: %zu", size);
 	if (offset & 3)
-		drm_printf(p, "Offset not word aligned: %zu", size);
+		drm_printf(p, "Offset not word aligned: %zu", offset);
 
 	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
 	if (IS_ERR_OR_NULL(line_buff)) {
-- 
2.25.1

