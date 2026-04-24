Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668C3FED3FE
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4BB10E3F6;
	Fri, 24 Apr 2026 20:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XScYC/U4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ECA10E1B4
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=tmKXPCJd517FgTiV/ADwm8i/COZa3Aqp2jdf3i7bq8Y=;
 b=XScYC/U4kHxjQwl/xt+6P4xaZcqtWTOa5802gQHFhcjDyUNwxoUso9V9
 IBxE/NwHg1fgHiPRcJXTdUuI2Imx4I7PEhKv7khzgFhwjei4lR78A7DVc
 ANOfn2I3ZSIsk3Jcp/lFUGE3g8q0Y+LeChEBF5BLxjBaveXiEyIu7MpJI
 YYbbg/Vj8uNMOZBl1W4lNaxz2KcpEhDWdc94LN3YlJfLJ1hbo6ErHpdOZ
 YVhRlWIv6HHiHS9ndpkcneF1k7oKckZIG9p8TEhV1pLJi9dVe8MFkPke1
 ZUIZb9r2AvUpSsfBIiX0Q12MqB8ShkaxW191D1o2yo+EUw2q1Amz1OTir A==;
X-CSE-ConnectionGUID: HZ9FA5YUTOCJtgNwuz3XvA==
X-CSE-MsgGUID: vx2BjlpLSsKWWUVRuqJ5uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80634004"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80634004"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: QR4rgKChSaitW4SULjFkdw==
X-CSE-MsgGUID: 6iszikKKSjyO8OU8AYvRfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560151"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:20 -0700
Subject: [PATCH v2 10/10] drm/xe: Mark BCS engines as belonging to the GT
 forcewake domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-10-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=tmKXPCJd517FgTiV/ADwm8i/COZa3Aqp2jdf3i7bq8Y=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eVI+XU/APzS+lqk1RZ78yOdB/6+So6+GZYN
 7uxW8ubWD2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlQAKCRBNeSQFyHKQ
 BFI6D/4tRMsA7scC+v7qQ5ZZhJvUc+crCGh52sw7JxKIc9Crp+paDTmEsNksMiwXtrFF/igo4B6
 ZoAH9YGhVV6iVLBkxXY0DEu9GCBty62r5NWgrUcFpcApeCR3T4KHjxJCnYcWvnhz6NT4U/vQFI3
 qYb8efG1Mx/YUid9Ty83zuAf2PTLIH4Fm6gMv0Wvne1PrMXN0EQSyLrAidulP4TJ+K7ZxMtUbWC
 Ufuge1Nf3PV+G2uRihpd5leQiLg4PLLDFk1T5a7msfRY1z3R58V+nfVKYANeOvYpTS99p7nYrzk
 9lwOccWpHqenc1FJLUf1FwJ0EN8KBV4DIU3gxw3etdlWAPM92pxB1EyZ1O4cQT0Aa3ROjuhcDS/
 2N0jidurXv93XF72mvhbHf8K0YkbO189I7vy2LMGkJVoayddpHvrqtorrojXVZdKdTOS9o/hGsJ
 JDunHa1k5yUuvuKOWz+J9QDzQMF+96bmF8toVjP3/iChDvUuAdBlJGbj7uqBkTWKMRfnTM063f7
 ciRSxkG3x1kXGCQZwI6FLjaMQI8Px/+zBzuWYWy+taAC0ecCcS9NF0B+W9wZnccdCBRel7Xvm40
 vfXrKKAS5FP2yDNti5A3Tz9750L7b/3vRMvF3IGzLPewA2ETB3nuE2IBAlRhUzYWux+bxzIPa59
 aX3EzSB8OHnE0MQ==
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
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b3da832a5414..0f0e08bcc182 100644
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

