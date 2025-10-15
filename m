Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F1CCD1A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A4910E90A;
	Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lz7+sHgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DED410E901
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0Wzy9O5/iGJW035E2f7UpFu7fsKGMczueOiF3YVd0s=;
 b=Lz7+sHgn9XTZ9uH0wKLTwzUdpjn7pgdCS29Mc/XR2xxccfkf6uAfJAAR
 pRNTPMEDaBilaXU38AKI10sIMWu9W9XRLtfpPRCCQSSiAuy5YFdGUL/CH
 oru5qxSxOEf72FAMbuDOI8xc3UmL2+5VJXWjYQw91GlAU/BqKFsqujErS
 uqZDgEMcc846Qen2mw98/rUxu+hthXS+q/ai9YnoDSHBfl0s0XkDngT3h
 6M1c5WMv3iwvSk6pl69uHdr8mRqSM/ErpiKOoffyGsWJdPt5iQIrfMQw1
 Dc8mFg5HRljHl+eUAKESjWo6GZTgvasI2ua1uvKjswt6e/WojSSJ06XxV A==;
X-CSE-ConnectionGUID: hF90Z+dPT1edJpdBYMxzLw==
X-CSE-MsgGUID: ianD56mkSbWKwBpNTw5OOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794054"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794054"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: t73jtcF1QBefvl5Roe9gOg==
X-CSE-MsgGUID: 0U20F6zsRy6yymX80aYNWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298287"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 09/22] drm/xe: Dump CURRENT_LRCA register
Date: Wed, 15 Oct 2025 15:06:24 -0700
Message-ID: <20251015-xe3p-v2-9-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Wang Xin <x.wang@intel.com>

Add CURRENT_LRCA to register dump to help debugging.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Wang Xin <x.wang@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Extract CURRENT_LRCA from other patch dumping xe3p-specific register
    (Matt Roper)
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index f4c3e1187a00a..3c05d85902c69 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -141,6 +141,9 @@
 #define   INHIBIT_SWITCH_UNTIL_PREEMPTED	REG_BIT(31)
 #define   IDLE_DELAY				REG_GENMASK(20, 0)
 
+#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
+#define   CURRENT_LRCA_VALID			REG_BIT(0)
+
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 243dad3e24185..8d1bfa2cdb151 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -122,6 +122,7 @@ struct __guc_capture_parsed_output {
 	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
 	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
 	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
+	{ RING_CURRENT_LRCA(0),		REG_32BIT,	0,	0,	0,	"CURRENT_LRCA"}, \
 	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
 	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
 	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \

-- 
2.51.0

