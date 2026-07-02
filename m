Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECBFC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 01:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BC310E3FB;
	Thu,  2 Jul 2026 01:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCk0eKJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACFF10E3FB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782954077; x=1814490077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WJhrroYeWnSP8hFjCstAdgWVI9pqXfWQ4CofRlp7/sU=;
 b=VCk0eKJ1Exybeuc6C7tkN6c0RqZeEGqcYbp4C5emslvOqnaUzBM53QEI
 nipkNgQxuiphhUIufDH29ECdkglBAJd2vixZe3wuOpbArp/2KZHs9oFlC
 Toi7LDb6QQABqKCyBmGb+1vvDg8VIqudWhVjMDgRw34KVnCBYhfhXorHX
 HDOqmssxeXJXBafOCtUx7hHi5QHxtk9H+Nr3EkgcpNUfapTzsM7CvRDpa
 5ZX4OAbR7KIW75z4GbTEEIXUgqpGvQ78EjVQS/B5HXJSacH++yEABStGh
 nM734ZAzxxZU3Q/TW9TIORxIB9kSEqnu7EmWcDGiJAW0AahI5J4RzUI37 g==;
X-CSE-ConnectionGUID: Ph0tZtfCQDKYs+gpWqNO3w==
X-CSE-MsgGUID: gY2w9eUHQye+n4kCFKG92A==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94350415"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="94350415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 18:01:17 -0700
X-CSE-ConnectionGUID: In/FTxozS0WWcaRhSFJZcg==
X-CSE-MsgGUID: r5/bmZ+CQ2aO1UOakOpp4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="252850680"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa007.jf.intel.com with ESMTP; 01 Jul 2026 18:01:17 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v1 1/2] drm/xe: Use IBC v3 on PTL
Date: Wed,  1 Jul 2026 17:56:13 -0700
Message-Id: <20260702005614.2621735-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
References: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
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

Intelligent Bias Control (IBC) v3 algorithm in GuC has PTL specific
optimizations. This version selection param is only available GuC 70.48.0
onwards.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_pc.c                | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index ce5c59517528..57baa68bcba4 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -119,6 +119,7 @@ enum slpc_param_id {
 	SLPC_PARAM_STRATEGIES = 26,
 	SLPC_PARAM_POWER_PROFILE = 27,
 	SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY = 28,
+	SLPC_PARAM_SET_IBC_VERSION = 29,
 	SLPC_MAX_PARAM = 32,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 59f2fa79ad42..0d55d6b00cd9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1236,6 +1236,15 @@ static int pc_modify_defaults(struct xe_guc_pc *pc)
 		ret = pc_action_set_dcc(pc, false);
 		if (unlikely(ret))
 			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
+
+		if (xe_gt_is_main_type(gt) &&
+		    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 48, 0)) {
+			ret = pc_action_set_param(pc,
+						  SLPC_PARAM_SET_IBC_VERSION,
+						  3);
+			if (unlikely(ret))
+				xe_gt_err(gt, "Failed to modify IBC version: %pe\n", ERR_PTR(ret));
+		}
 	}
 
 	return ret;
-- 
2.38.1

