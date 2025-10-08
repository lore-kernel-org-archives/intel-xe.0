Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457A8CCD1A2
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823F410E8A8;
	Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieeIph6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD21E10E87D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946708; x=1791482708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kiz+jerG8Hx1DiGBkWQWSS6oHpKcTCE/T9d9vU2nJ8M=;
 b=ieeIph6s3c/nKcu8w3BFaCgVy+Gjb1SvSt1k67dqQQdUmgv8vmctqFne
 F5KR9n8IkOaOv2HHLSUXrXwrvNYxHstekJtcwLYdvFrBP51nCeWkoW6lI
 80P8Vr4DvFgJ6m6EEYUGQvsGg9BCJcgdO3xVCLLEiDcHWTua7GB0VqvDJ
 ieoXRRNYZjKZmD7uTYcLl4U8CR8X32tR0vuOU3KReM97fRP8liL8DtBiz
 GbLMP6nXJVFh0WFS4aW6iT4wwxz46HyEXE1OyPvWmo7vJd5f32s4x9MyD
 6i+AY3urGQc+lmNihzVYjWd0pG0QPqSpWKLQ0cewvxWwdPbjhF9IJODku A==;
X-CSE-ConnectionGUID: tiqzi8vxS5mURlV5iAvA+g==
X-CSE-MsgGUID: GKqpnO4lQOyKIEuAScxtGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067520"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067520"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: lvBeCb6mQ8OeF3SeYhE0MQ==
X-CSE-MsgGUID: RauTY5MSRoiAjd3tFT0JoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593727"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 10/34] drm/xe/vf: Abort H2G sends during VF post-migration
 recovery
Date: Wed,  8 Oct 2025 11:04:36 -0700
Message-Id: <20251008180500.3261209-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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

While VF post-migration recovery is in progress, abort H2G sends with
-ECANCEL. These messages are treated as lost, and TLB invalidation
errors are suppressed. During this phase, the H2G channel is down, and
VF recovery requires the CT lock to proceed.

v3:
 - Use xe_gt_recovery_inprogress (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 47079ab9922c..9f0090ae64a6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -851,7 +851,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence)
 {
-	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	u16 seqno;
 	int ret;
 
@@ -872,7 +872,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
+	if (ct->state == XE_GUC_CT_STATE_STOPPED || xe_gt_recovery_pending(gt)) {
 		ret = -ECANCELED;
 		goto out;
 	}
-- 
2.34.1

