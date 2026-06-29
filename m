Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23F8C43602
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 14:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810A10E7DF;
	Mon, 29 Jun 2026 14:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJveN/yT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECDB10E490
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782742121; x=1814278121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TAFxMJ5cprVxTVOzmik/hOOijXT73Q6fiEzRmDU858I=;
 b=aJveN/yTAD1Pqk+vs07d8itz+0GWqGObOmj4aL5Nb/Ap+YQpdoOuAKPO
 8rpJmZg1w/lJxifPMt6C9LaRhLL4s5oih67+VHg7pPCPDt6XswLlreHiK
 FMiO9asYpSU4ywHozRhDM4IEbMsyp3zxg1byTyK6HQQSv706zNYSYF8Wc
 E+ieMyfhX50MgIIc3psd8+g0y8tMFJNkhj+/2HOlJ+tg0jtQPmJNIuX4D
 e5pCd+WJ7H7/nxbb+N+WRXw7qcMAY4hF6bKRX9gp1/+2fbY+Ir3d/AUvH
 a+uwerCOK0kVjACx+iFkQP1Y/Z454UMsHs/vkrNt2b/vFiHJzcInRbyCj Q==;
X-CSE-ConnectionGUID: yhv3/z6RSza8v+jhlmHnxQ==
X-CSE-MsgGUID: XYW/DZGhQuq2c+cWM1Ur1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="100972684"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="100972684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 07:08:41 -0700
X-CSE-ConnectionGUID: YO3zt0J6RPKJjqYwndQpxw==
X-CSE-MsgGUID: 6fmCbHgXQ06b/1HlVckw6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="256369863"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa005.jf.intel.com with ESMTP; 29 Jun 2026 07:08:38 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 2/2] drm/xe/guc: Preserve HW error state in wedged mode 2
Date: Mon, 29 Jun 2026 10:08:36 -0400
Message-Id: <20260629140836.2074349-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629140836.2074349-1-zhanjun.dong@intel.com>
References: <20260629140836.2074349-1-zhanjun.dong@intel.com>
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

When HW reports an uncorrectable error, debugging the root cause may
require halting the GPU in the error state so scan dumps can be collected
and inspected.

Use wedged_mode=2 for this debug mode. In this mode, Xe already avoids GPU
reset on hangs, so also skip the engine reset cleanup path for GuC
uncorrectable error reports to keep the HW state intact.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 29ccabc4b7a4..05fa4e466461 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3024,8 +3024,10 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	trace_xe_guc_uncorrectable_error(q);
 
-	/* Treat the same as engine reset */
-	xe_guc_exec_queue_reset_trigger_cleanup(q);
+	if (guc_to_xe(guc)->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+		/* Treat the same as engine reset */
+		xe_guc_exec_queue_reset_trigger_cleanup(q);
+	}
 
 	return 0;
 }
-- 
2.34.1

