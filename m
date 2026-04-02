Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D45FD6AAFF
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B40410E537;
	Thu,  2 Apr 2026 19:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLVtarZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E9510E537
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157493; x=1806693493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qtj/vrS+JM4GiT2geDlM6szKms9rtoLiub5k4jfTOTU=;
 b=ZLVtarZeIQz/CIl95vxxc/BhoTfVv7nUhqyrV5YRDtRZEviewwMlaIOE
 nQFKWeAqcmpRDQcHkicsxoQgpluyniGNaf4i/qrD3AVL6AnYN2aEhWaHq
 iy3E6uj79suTFQGeBnx7Q1e8EDDbaXLIaaVCgf5eChOo3b1HrTMBLsxP5
 8l2CNQ48vIN4VOAYVarPFpWSvD0tYXz7lF1JufxJsAi04fxU/TWTULx7B
 D+4VDFtYU/8lh/5z+jxc03tBz332LogprGB+CRnub7cl3GrrcvWuRXIOC
 LUooGKMcHyrBOKK1ptn8j6WepONUJGb8kkJAgRHaxeF5icgjWe2/q5RxD Q==;
X-CSE-ConnectionGUID: mdqzBpfMRfSCVyg+M8XKJg==
X-CSE-MsgGUID: ZtTS0fdCQE+TlGVfPTK8/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241091"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:13 -0700
X-CSE-ConnectionGUID: zkBGd4dpSjKmM0iwBUivBw==
X-CSE-MsgGUID: ha3Pso8ETYWUQChmhJ6E1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222212984"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 04/13] drm/xe/pf: Print applied policy KLVs
Date: Thu,  2 Apr 2026 21:17:17 +0200
Message-ID: <20260402191726.4932-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402191726.4932-1-michal.wajdeczko@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Under CONFIG_DRM_XE_DEBUG_SRIOV print all policy KLVs sent to the
GuC for better diagnostics.  This is similar what we are already
doing with VF configuration KLVs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 6ab02e96e46c..c88c4e6a9b61 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -68,6 +68,15 @@ static int pf_push_policy_buf_klvs(struct xe_gt *gt, u32 num_klvs,
 		return err;
 	}
 
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		struct drm_printer p = xe_gt_dbg_printer(gt);
+		void *klvs = xe_guc_buf_cpu_ptr(buf);
+
+		xe_gt_sriov_dbg(gt, "pushed policy update with %u KLV%s:\n",
+				num_klvs, str_plural(num_klvs));
+		xe_guc_klv_print(klvs, num_dwords, &p);
+	}
+
 	return 0;
 }
 
-- 
2.47.1

