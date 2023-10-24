Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E7FC07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 22:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2F110E4E9;
	Tue, 24 Oct 2023 22:04:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513AC10E4E9
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 22:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698185059; x=1729721059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8z3s6rM2PUO2MOSPqyM1odPIGWv5kgXRW1GQTEEsueA=;
 b=C7Z4l6X5Zk3QujdtPFCh4VU9h5+jDJ5F+AhhAhqGOBcVS63rmvir27FW
 MM28u0aKhUrR16kSRh0oSNRQ+R5ts3HdnkmgtDdHbzR6nUWg1yV5wo/ex
 4Vm9o2ognJ2Y6QioR0lP6ncRy0XW6x8/7MNgyfFOscpHfrherYEyWalAW
 PD9fKm7Jo6dpTdytpzr+uuCfLtmtrz96upbQnr+9uIoZMB7CUuI8LQz1N
 07FLxdM3KM2K/KF0jqh+MFfLSWw2xIgcEEERmCiM7bCEpVdJJyTbDTBaP
 G6BSFk9U1+jcXf5E2jt2Tt8EYWUdnuIMFQANf9uP/JTdmlBu1THJZYoml A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="386998597"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="386998597"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 15:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="824446006"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="824446006"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 15:04:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 15:04:12 -0700
Message-Id: <20231024220412.223868-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix WA 14010918519 write to wrong
 register
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

FORCE_SLM_FENCE_SCOPE_TO_TILE and FORCE_UGM_FENCE_SCOPE_TO_TILE are in
the up dword of LSC_CHICKEN_BIT_0 register. Also, the 14010918519
workaround only applies to early steppings, A*. Eventually those should
be dropped, like they were in commit eaeb4b361452 ("drm/i915/dg2: Drop
pre-production GT workarounds"), so let's make sure they are annotated
appropriately.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 1450af6cab34..b4b13d05ef26 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -352,9 +352,9 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
 	},
 	{ XE_RTP_NAME("14010918519"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
 			     FORCE_SLM_FENCE_SCOPE_TO_TILE |
 			     FORCE_UGM_FENCE_SCOPE_TO_TILE,
 			     /*
-- 
2.40.1

