Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61A3CE7A9B
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 16:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9421210E28B;
	Mon, 25 Sep 2023 16:10:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC57710E295
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695658241; x=1727194241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WkA02l12n5BFyCV5aIR2gl9+cqlJxWWeXQGvTh3cwM0=;
 b=ahsujDFIJM9wGGZRcAPvZOXlOUKmSUQtfA/fDghlgqISE+aHD1oN+HYg
 kz+c0QiT/sKy4nbkBpBtb+jwfhwQS9pucdxTgFSCExDBr4bUoOodLtzSi
 2L/m+5z+fkP36DfacX1q06gGeeN0g6Owrz9GRAb5OnKOib1xmYJznWycN
 iBu10Q/5RDo8fhEnuPeSNXM0uWnh9l6mGgou9zRT/CL1Qu7ROUEYZranG
 eKXwdOGRBXcP6m/ilOlY3SVt6cXVFpf/jjKwAzeko82TIsWKI01tBWkB8
 3AYYuWgEdpvTa2nJAHpvnflaYHAQ1cVgcOp1i7X+NpDgvWo8f7zY8zVN4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467577310"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="467577310"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 09:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838604057"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="838604057"
Received: from shekharc-desk.iind.intel.com ([10.190.239.54])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 09:05:53 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 21:35:43 +0530
Message-Id: <20230925160543.915217-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add Wa_18028616096
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Drop UGM per set fragment threshold to 3

BSpec: 54833
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_wa.c           | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e13fbbdf6929..3a4c9bcf793f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -347,6 +347,7 @@
 #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
 
 #define LSC_CHICKEN_BIT_0_UDW			XE_REG_MCR(0xe7c8 + 4)
+#define   UGM_FRAGMENT_THRESHOLD_TO_3		REG_BIT(58 - 32)
 #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
 #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
 #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d84e67a9af07..1450af6cab34 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -374,6 +374,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
 			     PERF_FIX_BALANCING_CFE_DISABLE))
 	},
+	{ XE_RTP_NAME("18028616096"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
+	},
+	{ XE_RTP_NAME("18028616096"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G12),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
+	},
 	{ XE_RTP_NAME("16011620976, 22015475538"),
 	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-- 
2.34.1

