Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D92FDEE55
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166B310E107;
	Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUSfhO2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11A610E12C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984549; x=1808520549;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=iqjvFkmCP48Cauc0o9G9R3Ytsp3A69hZR5jtjTCih3s=;
 b=DUSfhO2WgSbzR1Ws+8j1DaNp2Sl/Tbq02+3DFwfMT5oEbeSORiEQddZM
 sxWr0iWHrVvaajMCNqJQyoRS09R1xJ4vie2TJ9nM5IkYCpAuqieHUikuX
 kzzZXoMuVXgw6XwGTdB9dzCH8LAyL/r6NKv0ZzgMw2/FpON/stCyZxiIo
 BIAF0TNJKQTs5MRpBIy2jkRBXD1vSgkKalapJCQNxCKS7ZGni7Nm+FeC8
 BL1mXtP8ZUdOorEwTX+mEOq8zDcoW1V5J80p3r23bkxIHVp9UZMZ460Yv
 ZPcHxc8PWZDWSTjzhvRvge+cn8sFHsGmxF0x7eD89juGYJvEKvsKpItEW A==;
X-CSE-ConnectionGUID: 2e6WVLdBSJG+AI+AMAetqg==
X-CSE-MsgGUID: kivwSc6HR9m3OHpBPtMKkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497068"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: Wbd9jk6iQm2RoGvfCDvLcg==
X-CSE-MsgGUID: 5PdyJeK4QEOhUTykWBn4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696212"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:57 -0700
Subject: [PATCH 10/10] drm/xe: Mark BCS engines as belonging to the GT
 forcewake domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-10-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3388;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=iqjvFkmCP48Cauc0o9G9R3Ytsp3A69hZR5jtjTCih3s=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHf68cvKbx0m9+9oafPGOIQxdqlvdY/2uMKc
 /FazEBw2jKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3wAKCRBNeSQFyHKQ
 BBsYEAC3VyWN/ErJfCAq8lq6zaMJe/Sfquc0zk677Gw0JVlx8lmaQyy9Q5Bkt1PLTQdVkrfn5Zl
 HBYNcGJngRKqq3VRibLhrbQiD+9oeNxx8oJ/N35EZqA7FmCzFuA/B+TPX9ryMYJ0HrSJ/o1/edC
 sJHFhwV6wg7/a/svEwmTrCWMYRMigx9oegnz/3npOBuzZbOCfaIldTw61c/7hmefptqieUXiv/v
 TYVrRXI4tbEnOcTYgIsDPotavc0TVRPb8bVkiMQaCyIB7lOTr0Mts2XSpUZ/rQOacz0JBsn+39K
 2gDZgwBKdMG70BNzB/tJJf5Sa8OVa27b32v/E8o+kz6VbN+IHsE8VsthakqO8mhx5qEaDHfmHhj
 yezTLiaDYfWhWJXrBV/p9xbVxjHMOL/Mv3XMhN3p3bIt3A7nhw3UmYqHOJamZLDF6EjxnZh7833
 YxnmIeTL44rOS1ZvNYj/oB+ekb3/NJpk3gJNXQ6in3B4+Lk5q4+Mvy7axKh8Y7PUh7wdJ+ARPW7
 kb3emKySpmcCvG98R1Put5fWZ40wtsMqLSU+Fol/zAAtD64PhO+ojCNTSlmgr7eRYfUN1YYqODi
 LlQEW+GgYfaIPyP5Dpo0GO8MHO70ydvJEkNtx8SHApcjxBr77CM8cdErsL0Pa0BHJ9QRuITyYNJ
 sHRW7ndxF2NVmFA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

On all platforms supported by the Xe driver, BCS engines are part of the
GT forcewake domain, not the RENDER domain.  Fix the engine list
definition to match the spec.  This mistake didn't really cause any
real problems because the forcewake domain here was only used in a
couple assertions that aren't really necessary and included in the
information dumped during error capture.

Bspec: 66696, 66534, 67609, 71185, 74417, 75242, 78286
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a2a2b296af91..84651088d504 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -67,7 +67,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 0,
 		.irq_offset = ilog2(INTR_BCS(0)),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = BLT_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS1] = {
@@ -75,7 +75,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 1,
 		.irq_offset = ilog2(INTR_BCS(1)),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS1_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS2] = {
@@ -83,7 +83,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 2,
 		.irq_offset = ilog2(INTR_BCS(2)),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS2_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS3] = {
@@ -91,7 +91,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 3,
 		.irq_offset = ilog2(INTR_BCS(3)),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS3_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS4] = {
@@ -99,7 +99,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 4,
 		.irq_offset = ilog2(INTR_BCS(4)),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS4_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS5] = {
@@ -107,7 +107,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 5,
 		.irq_offset = ilog2(INTR_BCS(5)),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS5_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS6] = {
@@ -115,7 +115,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 6,
 		.irq_offset = ilog2(INTR_BCS(6)),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS6_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS7] = {
@@ -123,7 +123,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.irq_offset = ilog2(INTR_BCS(7)),
 		.instance = 7,
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS7_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS8] = {
@@ -131,7 +131,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 8,
 		.irq_offset = ilog2(INTR_BCS8),
-		.domain = XE_FW_RENDER,
+		.domain = XE_FW_GT,
 		.mmio_base = XEHPC_BCS8_RING_BASE,
 	},
 

-- 
2.53.0

