Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71E0FD88C5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 22:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BBC10E28A;
	Tue, 10 Mar 2026 22:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wm6xN71V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E28010E28A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773183044; x=1804719044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7TaV50Qa41YdJLN4styU8SFbM+hLyS5HBsT1zJWbFR4=;
 b=Wm6xN71V0bRx/izEWCdTzNJY1yophOoAeqw4cTqV4SyHmJEkfm8SGiSe
 6Orsg3iIQpciv5Z6Mdu/naqQLYgQKz2pzuXcjUGE2ZEpX+BaO07I5v7oT
 9ypTma1TsUZ501D435D53yhFuTceZ42rGgH6Qig7R+J23XUnDnYWqtrF6
 aRQ15gQ1qpEDlGtaEQQOXmqcnnKOmvNsbByt6wRdO+NcUlftEzMzssDdA
 bZ5qdAM9KaKB2pCf/xjobeqsyR12PbRY2jrZGDUYrgrEHwNPejJAHm3JZ
 6n7JSOHDW5mZMMILf2ZqtMdDylaIRphkqTKBDWB5uJ0rO/7I2jcGGdP6V Q==;
X-CSE-ConnectionGUID: ew2HhCj9SaiBINI5cvje9Q==
X-CSE-MsgGUID: AN8RBA7+T522hBpSNS7jvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61817886"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="61817886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:43 -0700
X-CSE-ConnectionGUID: hPv0636VTzSXV20oT36wpA==
X-CSE-MsgGUID: vcnmp7loSc6yx8loztAp+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220440998"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 15:50:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 4/7] drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum
 instead of magic number
Date: Tue, 10 Mar 2026 18:50:36 -0400
Message-Id: <20260310225039.1320161-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310225039.1320161-1-zhanjun.dong@intel.com>
References: <20260310225039.1320161-1-zhanjun.dong@intel.com>
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

Replace the magic number 2 with the proper enum value
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET for better code readability
and maintainability.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cb32053d57ec..a145234f662b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1334,12 +1334,13 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (!guc->submission_state.initialized)
 		return;
 
-	if (xe->wedged.mode == 2) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 					       guc_submit_wedged_fini, guc);
 		if (err) {
-			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
-				  "Although device is wedged.\n");
+			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=%s; "
+				  "Although device is wedged.\n",
+				  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
 			return;
 		}
 
-- 
2.34.1

