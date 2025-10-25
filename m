Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67162CCF9E3
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 12:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137C210E0A1;
	Sat, 25 Oct 2025 12:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGiBintQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE1010E0A1
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Oct 2025 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761396558; x=1792932558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f21WHjECj6RoyPCO14FnhbADyFcHLPkr3Cb6/yAKEZI=;
 b=iGiBintQgBlbLVUdLKC99ZG1pAEIJznEldCrGPz3vwxGnm5gKmCzq9oM
 WUK0eoCvhbuZFIA3M6FRAS2fQRK6ztvpn4SuBGs0btVkkr7puVCQ3DAv2
 V5lSYb4IIwGDVfGuz48hDPv7HboRKHvl4yz2QE156m+Ll3ui1YH/19prd
 nPwaPxD7QTbgE6l3zq0Or+BbEZHKeWU+5Om66wsm5JDKDj2QWMtOhCFQF
 gVOzNp9J+f/CTkfqjmTU08NUlTAKgGNSSaRCueO0gY2k/orZcfDtmQUpu
 lvAAF9twnLnDbvyDuY9osr4fhoBa5o/4uig1AQ0g5WXDBaomomkKGni5m A==;
X-CSE-ConnectionGUID: UkiO36FTTd+ll2seHDPPQg==
X-CSE-MsgGUID: 09QUR0RtQ6yxUKpUGDiraA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63587032"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63587032"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:49:18 -0700
X-CSE-ConnectionGUID: n/mJswqZQUqfrNNEbBrQLg==
X-CSE-MsgGUID: EkVKCQl6SzSUMR+/H1agnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="183824804"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:49:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Fix VF FLR synchronization between all GTs
Date: Sat, 25 Oct 2025 14:49:05 +0200
Message-ID: <20251025124906.5264-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

If subsequent VF FLR request is triggered when previous VF FLR
sequence is still being processed, we ignore it as not needed.

But in case of the multi-GT platforms, one GT may already finish
its VF FLR processing and will start a new sequence, which includes
new cross-GT synchronization point.  However, since other GT may
be still busy with post-sync cleanup steps, this will put on hold
this new FLR sequence, which might never finish due to lack of any
future synchronization checkouts.

Add additional cross-GT FLR synchronization point when each GT
ends processing its own FLR sequence.  This should also help to
cover the case when one GT fails FLR processing before reaching
the first synchronization point.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6287
Fixes: 2a8fcf7cc950 ("drm/xe/pf: Synchronize VF FLR between all GTs")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 2e6bd3d1fe1d..9de05db1f090 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -997,6 +997,8 @@ static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START);
+
+		xe_sriov_pf_control_sync_flr(gt_to_xe(gt), vfid);
 	}
 }
 
-- 
2.47.1

