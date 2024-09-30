Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF32CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E8B10E2CB;
	Mon, 30 Sep 2024 05:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqGNlh4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDD810E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673232; x=1759209232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z2Ml9fDyobXf+U1Bg0VvDv9auVhBAdiPcN4qjaPVGFE=;
 b=KqGNlh4H2i+qeGLsbrG6AJkj7YwAHzkxe/LIsfeeHQzqy2BsU54xorxs
 apOuuyPD0eAZIOnFCUF2JgS6CXYddMHgyAZVlrwu0hQwxbXzrSipBv6HK
 TfJR5QsMhK67DcRrFDBHZgiLMA13RcG+3LDhnLJM8oaWFJGIISiqnNaPR
 tHhgQvydv9bi7oynAq5VixfUTxPAw+wx2zVHc1CnTqn3qpX/SNlMROdkr
 xfdxFORGOjHh+mXTm5mitvUj0SaVRB2PGbVT0QwWZViwCgzF8J2Vd4XBD
 LvOd7JOnJ7Z7Lb+B9+N18nbgHNXfvNyHyE+HcerxZeQqnOdR5Yq9HW3Sl Q==;
X-CSE-ConnectionGUID: fiFhqt1zT6CTXPk8/UY09A==
X-CSE-MsgGUID: DrnxQgbdRz6TkF4lu/5PWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367971"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367971"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:52 -0700
X-CSE-ConnectionGUID: eve47FFsRGO1Gijny3+VjQ==
X-CSE-MsgGUID: S9VMTQ2OQZy6aZL6oA4ZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752188"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 13/25] drm/xe/xe_drm_client: Update handling of
 xe_force_wake_get return
Date: Mon, 30 Sep 2024 11:01:37 +0530
Message-Id: <20240930053149.1246339-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()

v6
- use xe_force_wake_ref_has_domain()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index fb52a23e28f8..22f0f1a6dfd5 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -278,6 +278,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
+	unsigned int fw_ref;
 
 	xe_pm_runtime_get(xe);
 
@@ -303,13 +304,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 			continue;
 
 		fw = xe_hw_engine_to_fw_domain(hwe);
-		if (xe_force_wake_get(gt_to_fw(gt), fw)) {
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
+		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
 			hwe = NULL;
+			xe_force_wake_put(gt_to_fw(gt), fw_ref);
 			break;
 		}
 
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 		break;
 	}
 
-- 
2.34.1

