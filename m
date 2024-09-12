Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B186EEE241
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB7E10EC24;
	Thu, 12 Sep 2024 18:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azqOqaIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23610EC24
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167501; x=1757703501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YJ/yCBCKtJLOgdZoGBXaBnvjN6c+96Wszpk8T3UR1jM=;
 b=azqOqaIqd+y4n/65UESqjMQCnmyHCYyMYbRaH7Wf1VK8AEe3ZibDEVHP
 rNb0mraZptwAqoElpR8wReZuFmLO8WW5bqy7hly+EQy9SnTdK3fcF8zoT
 8f5e8hg5x4jynX8UIurw0M89OrkqXWPZqI+PW7arT02Yn8ioVNGsdKkBO
 o4vnYuT9vQmr4kK11irbYxL/swnKxMQ8j300G1wPk6dfJlJzPZxBXK+ib
 w0g4SPwlUqkx/afiY0B9l9HuborNb04UsWl/HNL8vFpRyFZrm+dPg4k6u
 SgWqgokE2+AhkLi4Tpc8DvpFqI7rN4CFYAq0K59u+Dvm9QnSgj8pb/Lfi A==;
X-CSE-ConnectionGUID: jkF+nYsmTkWb9Uc5D5Yp8g==
X-CSE-MsgGUID: WkqPnMFiTAq7izzfiB7gjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202963"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:20 -0700
X-CSE-ConnectionGUID: Bnz1ZuWeQJG8HQmmOyHACQ==
X-CSE-MsgGUID: xfY+xqWHT3WhsG/fe5q19w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910156"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 11/23] drm/xe/xe_drm_client: Update handling of
 xe_force_wake_get return
Date: Fri, 13 Sep 2024 00:45:51 +0530
Message-Id: <20240912191603.194964-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

Since xe_force_wake_get() now returns a domain mask with an incremented
reference count, a return value of 0 indicates a failure, while a
non-zero return value that matches the input domain parameter signifies
success.

Update the return handling of xe_force_wake_get() to reflect this, and
ensure that the return value is passed to xe_force_wake_put().

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index c4add8b38bbd..01f643f6aaba 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -278,6 +278,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
+	int fw_ref;
 
 	xe_pm_runtime_get(xe);
 
@@ -296,13 +297,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 			continue;
 
 		fw = xe_hw_engine_to_fw_domain(hwe);
-		if (xe_force_wake_get(gt_to_fw(gt), fw)) {
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
+		if (fw_ref != fw) {
 			hwe = NULL;
+			XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 			break;
 		}
 
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw));
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 		break;
 	}
 
-- 
2.34.1

