Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F26C47258
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 16:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4A310E0AB;
	Fri, 12 Jan 2024 16:07:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A108910E0AB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705075629; x=1736611629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jJbPzbfqhRZ0VNxGikiqATnkEeaFKmxot/WbvdwKxRo=;
 b=cWiA0yZdn1KOzbcKWI9SMHj2/6HwpPj89+ut67A7OtY/EK92yMg1OR09
 QzUBeGfxy9gu+dsp03eG4vvr2kCb7qC1oUdDOzaC84jHPhiTZf3e69Orb
 OpJRKdM6nLx9SVxTHDF8q/6wZqH37PRt5SIcsn09/14UHCzrOzTi+hjmu
 HK6bVxVtgeKztyWFdtaf7X4HqdNfrWs3ts8BoP6uqKsTOr8q+KRx5ccnb
 6YIYwkRW1A3GvJ1ol7eyTewoYSLHPK4OlpQe/0TS2BSrUcqTTrBsK+vJM
 x0LqBuNqbUrp6DPqUn+lAe0+2sPtxsf6FF/BSSY7TCM9KRW1MsKzN4ORI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="465591886"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="465591886"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="1114255596"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="1114255596"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:07:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Use kstrdup while creating snapshot
Date: Fri, 12 Jan 2024 17:06:52 +0100
Message-Id: <20240112160652.893-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There is no need to copy string step by step, use existing helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e279ef6c527c..3aaab507f37f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -749,7 +749,6 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
-	int len;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
@@ -759,11 +758,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	if (!snapshot)
 		return NULL;
 
-	len = strlen(hwe->name) + 1;
-	snapshot->name = kzalloc(len, GFP_ATOMIC);
-	if (snapshot->name)
-		strscpy(snapshot->name, hwe->name, len);
-
+	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
 	snapshot->class = hwe->class;
 	snapshot->logical_instance = hwe->logical_instance;
 	snapshot->forcewake.domain = hwe->domain;

base-commit: 7a20187068bed91b523795a18219e570f1e84eb1
-- 
2.25.1

