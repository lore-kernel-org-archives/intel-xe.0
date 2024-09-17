Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1B5CAC593
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D308D10E4E9;
	Tue, 17 Sep 2024 17:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M16es8vP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ED310E4E6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595803; x=1758131803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W1R7fz5CoqKlDe0Nf6tYQq1MK1R7PGyj0SE9KUeFfms=;
 b=M16es8vPO4E/4ewDdCVrR+J3JocqmgfgrHM9IXXP6lv8vLHLmXYlrmMM
 xxnpX2dQVb+nbdC43W22o/ICvf5eNeMeoPJK72Yz0y0E5BTnI4faP/WhV
 DSmqUn0okaECPriFIQPAI7Ps7Qn7rcyih1e5iG48iH0y2MIUG6S1ykH+b
 0FfiWD99QqwgYt7+2G1fSRFMU0ErfDGrGdOH63KtLMgIfWoglGHcV9hUj
 0bKlFvA13Av/PiYbT0PZX3an1anOnNXxMN0y98AyAmwUJmzmKH1XX7sCc
 9aZo+QcUFaV2XzK/PRZ/Tfgad7KluMpEGW9rtFxdfcUmPFZo1m40H0+QH w==;
X-CSE-ConnectionGUID: RsdxKOBjQMqT0saiwB4KuA==
X-CSE-MsgGUID: A+uzZbENTUm/Sjlwe9ty4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562011"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562011"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:43 -0700
X-CSE-ConnectionGUID: 7d63tAFOQb2C2k0P8WCY/Q==
X-CSE-MsgGUID: eGkWeIRhTxSpOyof7U8glA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926498"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 11/23] drm/xe/xe_drm_client: Update handling of
 xe_force_wake_get return
Date: Tue, 17 Sep 2024 23:44:13 +0530
Message-Id: <20240917181425.515871-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index c4add8b38bbd..3185125d3dcd 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -278,6 +278,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_hw_engine *hwe;
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
+	xe_wakeref_t fw_ref;
 
 	xe_pm_runtime_get(xe);
 
@@ -296,13 +297,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 			continue;
 
 		fw = xe_hw_engine_to_fw_domain(hwe);
-		if (xe_force_wake_get(gt_to_fw(gt), fw)) {
+
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
+		if (fw_ref != fw) {
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

