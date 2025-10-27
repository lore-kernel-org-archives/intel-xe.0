Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484FECCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052DD10E19A;
	Mon, 27 Oct 2025 21:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzRAKB1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939D210E19A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601334; x=1793137334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s52KzzcKYEOdAGVoeR1IWUNkdJIHvX4m9HcQOwHV2Wg=;
 b=BzRAKB1pMl2E+DqG2kCe1xAP71YfkTz9IHZafDtJhuBYOn4BxRKKJKIW
 b6HBVRfIg24Jat9D+150HhxT6vJd10Rv4gmbarMMPbw7Db+2k9hdF8aIO
 p90bnIUa4ozeF/W2K8zPXn9aX61H+zkgekZ0WjvRThLa8KVW76GjkMrIu
 kBED1SgPfxAzbTL1k/dAwqCEXdvQZoFm0EeBkJnWTksZTDT2bARlDwfFW
 1TUXDWpKMrDhC0MK5zaZpv81msviZyMRrLtVe8Dpn7Gk1kwmoWIVEAIhD
 EjyitYuV2Nl5nDZKAI+HELDzArYS1PCbcHSRAW2kVh7bCJZdwgioZxwnC Q==;
X-CSE-ConnectionGUID: hYUHFuAWRXWNc2KNh8nUZw==
X-CSE-MsgGUID: HugEQR4IT9W65y1NEk5gEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66309417"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="66309417"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:14 -0700
X-CSE-ConnectionGUID: uJDQ4gSNRTG5ZGSE+k4kQg==
X-CSE-MsgGUID: kn7dlKRDR/aLSi0O5KkXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="215819830"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 27 Oct 2025 14:42:14 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3] drm/xe/uc: Change assertion to error on huc authentication
 failure
Date: Mon, 27 Oct 2025 17:42:12 -0400
Message-Id: <20251027214212.2856903-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

The fault injection test can cause the xe_huc_auth function to fail.
This is an intentional failure, so in this scenario we don't want to
throw an assert and taint the kernel, because that will impact CI
execution.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
History:
v3: Add return code check, update message text
v2: Update commit comments
    Remove warning comment
---
 drivers/gpu/drm/xe/xe_uc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..40aed4a66bac 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -218,9 +218,12 @@ int xe_uc_load_hw(struct xe_uc *uc)
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
-	/* We don't fail the driver load if HuC fails to auth, but let's warn */
+	/* We don't fail the driver load if HuC fails to auth */
 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
-	xe_gt_assert(uc_to_gt(uc), !ret);
+	if (ret)
+		xe_gt_err(uc_to_gt(uc),
+			  "HuC authentication failed (%pe), continuing with no HuC\n",
+			  ERR_PTR(ret));
 
 	/* GSC load is async */
 	xe_gsc_load_start(&uc->gsc);
-- 
2.34.1

