Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C843CED272
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE23D10E470;
	Tue,  8 Oct 2024 06:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lz7DO8Y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431D610E470
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370394; x=1759906394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pL+jlMD+Ds/hu+Kv3acuV25PNGl3s1dLGcjTpmTADo8=;
 b=Lz7DO8Y9qByMwPf7e17caw9UVKxjkJJtulGd1/z6NxxNuQoyS5GIIz8s
 q9O6ers16930cuwQDicBWQn1okvlu4al8yAAySMD3bTmWt1vcXsgG+vwT
 7N8Eak9C4lwwVnvMlTxLHcI8kxOOCwzsxOB0N3pG98SS8s8xDAOc1zfLm
 7Khf6QVh/QGhoRQxVs9/4xWgeS2TPZdObnQVwG4cup7EF5WVY5R/32EIO
 /d9yr/8k549+K6Ez6upZGnsasOTsam+pvfWuG/B2/uSKHINP9/r/S1Hdh
 j2qIlrtPGrX9cPJV5EKd9g7A14xJtffBA72E1bxXgV/WBtI35GXfEIcvH g==;
X-CSE-ConnectionGUID: 9CigiJ7DTtS9vdf+fKOUiw==
X-CSE-MsgGUID: eMm841PCTGWabzjkKaJCnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430444"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:53:14 -0700
X-CSE-ConnectionGUID: mYInG9TJSo6sGmuhd8BX5Q==
X-CSE-MsgGUID: ChU3J2qnSl2pTfaDv5JlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577733"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:53:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 14/26] drm/xe/xe_drm_client: Update handling of
 xe_force_wake_get return
Date: Tue,  8 Oct 2024 12:41:03 +0530
Message-Id: <20241008071115.1862704-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Use helper xe_force_wake_ref_has_domain to
verify all domains are initialized or not. Update the return handling of
xe_force_wake_get() to reflect this behavior, and ensure that the return
value is passed as input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()

v6
- use xe_force_wake_ref_has_domain()

v7
- Fix commit message

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

