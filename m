Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54414D26D6F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F348A10E909;
	Fri,  9 Jan 2026 16:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrHYF7Nu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D0F10E907
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767976880; x=1799512880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4ADNWoErqwY+e1Sv75ckYfP0mFrEB67NwIXYFR7zLzo=;
 b=SrHYF7Nu3Q75LS5E4rgDAkb2zZhBb3yrE1bwfc3JVQNZlWs7CcYSbIB6
 iUjLRWjFjpD/K5i6bZOWweUYZM7q+/UB0jjTlN2pbcE5NnTyb6gLW6qzj
 NcCEUn5wkLWT3N2RDkpVrgDS9qNLQaM4oqrIWT+4Vhhzrdk+Rqfe3RoAS
 baetRsaGLQJWnFxis3jIFKa/pJaAAq1aQXzeCbofuPA6iwrRR+3pPQbTM
 sjzaJO3eA/4YQzYU10K9LXJgmzbAQm/kFj66J+rxcLQwRq+ya6IlwITkn
 lIkzXUZkkYxgnPnccYMUSgp7rbkwxxNQAu1pcdxf734s9uvaU0xGf/dhs A==;
X-CSE-ConnectionGUID: TDTi5z70RmqMctoQMq4exQ==
X-CSE-MsgGUID: RdoRQirjQkWjUjUujMMrXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73216785"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="73216785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:41:19 -0800
X-CSE-ConnectionGUID: wORzjJVpQ8+Z/eEUxpaYdA==
X-CSE-MsgGUID: 4gxLKtkGQGi+80RnnKE4zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="202713969"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:41:18 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Performance tuning changes
Date: Fri,  9 Jan 2026 22:12:51 +0530
Message-ID: <20260109164250.237044-2-balasubramani.vivekanandan@intel.com>
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

Further updates to performance tuning for Xe2_HPG

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 93643da57428..cc18ddfb7cc0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -135,6 +135,9 @@
 
 #define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
 
+#define CACHE_MODE_0				XE_REG_MCR(0x7000, XE_REG_OPTION_MASKED)
+#define   MSAA_FAST_CLEAR_ENABLED		REG_BIT(5)
+
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 5766fa7742d3..122829c8d14e 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -144,6 +144,11 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
 				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
 	},
+
+	{ XE_RTP_NAME("Tuning: MSAA fast clear"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2002), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_0, MSAA_FAST_CLEAR_ENABLED))
+	},
 };
 
 /**
-- 
2.43.0

