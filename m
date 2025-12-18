Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A68D6E2A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6C10EA15;
	Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjALr26l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3FD10E84E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072131; x=1797608131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PceUmWAwsrjn+Fk5D6SMqbaeWnKLt2GZnuGSefrds4A=;
 b=OjALr26lggMRbAqRqTWbX3KWeoVa4D8jHLtwG2hUoNNqz+G+EPdfmLjQ
 htAx/Ax0vMNm2u56rewb2gKMkQuxy8oXQTs5X+eHw228ZylyHKYvz4prB
 TRqj0tlqa4mXYX0lzgZzcy7xs35Pyd6v3JlE9vhJFnF2c8LbBujfq754X
 JOif1bzqH5WzRwB5SEdOu0z+17PH1KJJpyxcUlFrwWEgmVhdqpe/3Usti
 v7dgGnOxPli0EIoYJdMoeDOked+oe0sXjITgUwDCMWA6O0TCiLTW+eP81
 vsrrp38Q2TjaPbf1ABBp6l/S3QGehCL9nGcmjgs2sw8LfGeb7xHXTZapJ g==;
X-CSE-ConnectionGUID: QJY6zELQTFurKKAF95LkUg==
X-CSE-MsgGUID: muXmdILQSR6Ly3syVAaruA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67906273"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67906273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:31 -0800
X-CSE-ConnectionGUID: wF3d1LZnTReY3ABYiWb+Sg==
X-CSE-MsgGUID: A1z70OJoQuqsqzQFdLxJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="236042226"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:30 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH 3/6] drm/xe/xe_guc_ct: WRITE_ONCE ct state in
 guc_ct_change_state
Date: Thu, 18 Dec 2025 15:35:31 +0000
Message-ID: <20251218153527.6436-11-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218153527.6436-8-jonathan.cavitt@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
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

Use WRITE_ONCE when operating on ct->state in guc_ct_change_state to
prevent the compiler from ignoring this operation.

Fixes: dc75d03716fe ("drm/xe/guc: Add more GuC CT states")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 38b58590c94b..20ac0438ffb6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -529,7 +529,7 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	if (ct->g2h_outstanding)
 		xe_pm_runtime_put(ct_to_xe(ct));
 	ct->g2h_outstanding = 0;
-	ct->state = state;
+	WRITE_ONCE(ct->state, state);
 
 	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
 		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
-- 
2.43.0

