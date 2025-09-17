Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA7DCAC5A0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87AD10E63D;
	Wed, 17 Sep 2025 03:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiSgsKnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E34310E40E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080783; x=1789616783;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aDwu2lYfD4NdM01C2y+1DIDXu09EoXDhrrARukObJE0=;
 b=DiSgsKnKtabyzxH7k7Vbe3RC/jHXxPJToXr0oIgU5lIM/rcY4siAUbps
 Teb4RobTWFGMfo447by+ntMuTgsSwcGdjnj6XIao4xjSMwVOdjipwqiHM
 +glFsvVR1zm5Eiud59dj2fx/X5TUuhf8p8RfPYirF8G9bJAMH25DjLUxw
 XsSTvumTq/0Py7HptBkmce2VrjHvkylIVwzlZ2+ZlYMsBLFyQPAQcm0nW
 TiUHdZBowV+jyRoflifErfv59J9wUJmD4P8ik3Lhy4suo7RcNIHf8uhRy
 oJWXihHBLkIvRg+OGeeQv7pNg9lOVafqbyxTaGlv83VECWKaLpz6H/ptt Q==;
X-CSE-ConnectionGUID: jKaLBGrfTLGuj8sxhxCbIA==
X-CSE-MsgGUID: eUC0W+YHQS2ATNKEgI68AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060810"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:23 -0700
X-CSE-ConnectionGUID: LHuOyHYuSSa00SMfe9D90w==
X-CSE-MsgGUID: 9KoWKVl8SMWQhR4BQ0LXvQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 28/28] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
Date: Tue, 16 Sep 2025 20:46:15 -0700
Message-Id: <20250917034615.3977603-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

A race condition exists where a paused VF's H2G request can be processed
and subsequently rejected. This rejection results in a FAST_REQ failure
being delivered to the KMD, which then terminates the CT via a dead
worker and triggers a GT reset—an undesirable outcome.

This workaround mitigates the issue by checking if a VF post-migration
recovery is in progress and aborting these adverse actions accordingly.
The GuC firmware will address this bug in an upcoming release. Once that
version is available and VF migration depends on it, this workaround can
be safely removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 27a8b317548a..61d514457d98 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1389,6 +1389,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		fast_req_report(ct, fence);
 
+		/* FIXME: W/A race in the GuC, will get in firmware soon */
+		if (xe_gt_sriov_vf_recovery_inprogress(gt))
+			return 0;
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
-- 
2.34.1

