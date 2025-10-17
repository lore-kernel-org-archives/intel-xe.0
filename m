Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE0CCD1A4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C62010EAED;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iclZpCfc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D262D10EAE5
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668037; x=1792204037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3egOkSK9X8VujUiKftZ+Eo5yaETYp/smxwoVP4pM9M=;
 b=iclZpCfcQEV0evchNJSzIvibm/+3E2LgZ/yY1Mb0Ewd9WiglSEagrkRg
 kSMHTPwvvHdJ/cfZutA3vY2vD0V4oQ6dMfb49maC4podHSYOEV2OZhVBb
 fiXJ4IA1oiEJgQcK4Nx7uqDcWxGkFhdP1MEJ2Yqh0YBu3Htpii7ab0Mg3
 +SpK7dBUX4Fk2GUor9YtsLOfAQh8ScVko3EyaMKc0Mqf4tT55cWSAQIfW
 cNeQoPFU53+USCLNBVIvytAktvVN3FqPx5fa2s/0rf9KHzJN/HZ7z2Eoq
 Rig83GbFXJmdk2L0ulvV/H5X6w7xcaspkAMsKcw2wAwQnSIONhqkeJCMd w==;
X-CSE-ConnectionGUID: 1a0gthCjSZ6N8/WYYiNRmA==
X-CSE-MsgGUID: G46wpEBYS+2FF2nBwV4+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739212"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
X-CSE-ConnectionGUID: cc0PMD9+QZC7n7jYf8YDLA==
X-CSE-MsgGUID: Te6R5plrRbOPrg/yRDXVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089183"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v3 09/24] drm/xe: Dump CURRENT_LRCA register
Date: Thu, 16 Oct 2025 19:26:28 -0700
Message-ID: <20251016-xe3p-v3-9-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
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
Signed-off-by: Wang Xin <x.wang@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Extract CURRENT_LRCA from other patch dumping xe3p-specific register
    (Matt Roper)
v3: Drop bit definition that is not used now (Matt Roper)
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index f4c3e1187a00a..0c02d0fe55315 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -141,6 +141,8 @@
 #define   INHIBIT_SWITCH_UNTIL_PREEMPTED	REG_BIT(31)
 #define   IDLE_DELAY				REG_GENMASK(20, 0)
 
+#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
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

