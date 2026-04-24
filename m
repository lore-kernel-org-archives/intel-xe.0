Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEF7FED3FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6FA10E125;
	Fri, 24 Apr 2026 20:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN5fSYKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B794D10E119
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=dAvJtiXX/ZoNsOunsf/+B7q29D5fsBqPjJ9HSk6IZDA=;
 b=gN5fSYKz4KIADFfZMuyoZePhwaCAWxBeStHbgLmgjBZbGKQMtvimdT6e
 n5C9XGQbYAnVSQnAcJIa6+wtymlS7EwUeHFnlsvUEeRDBpRuphupLZxY0
 V+UfudFpf4efurwzGGIzaEzo6Ql909UYZkHRZiksD+ZDV8lxbjXvq8bSe
 cti8tDWBKzFrV0cqtuvnCIA5JxFUa1yTgQkRHXINrxFUCE9eZUaM1kKXD
 hJEPreLUqWaa15B1jCg1b7aDwqis6DMqub1DoYxWPEOfjGBbnZuR8W2Qb
 LUgd0v35aOK/YUbGXq4CiSWJmsVxEe4wYbQpDDCJR/zKYlece71QsYODV A==;
X-CSE-ConnectionGUID: Xds6WpeZQtOqQL56sYp8Qg==
X-CSE-MsgGUID: W1GviAxAQEypL+CioAm3Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80633998"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80633998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: rn3jLTxBRUO4bCqeqm9NZQ==
X-CSE-MsgGUID: aR8RkX0nTQKSzvvWaxD3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560134"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:14 -0700
Subject: [PATCH v2 04/10] drm/xe: Move HWSTAM programming to RTP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-4-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=dAvJtiXX/ZoNsOunsf/+B7q29D5fsBqPjJ9HSk6IZDA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eUqxrTVan8u8J/Ge6B2sH1f4e9JgERYjaHs
 fM1+pkkf6yJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlAAKCRBNeSQFyHKQ
 BMyaD/9xk2yQCnQABPGwoxmPHjmR2iq2JeF8nYqpEJ6HZxNccGBcw9CrULriKOPHtN2GguILTR0
 cFTSjqa/Z/HV1C/MuaReFPNd4N3sBnK/77k5VTTsz4k4Q+SVPrJH/SBi0n4Y8CvcfJd3Nu+tIqA
 HDxp39r+4ZgVt4GjFA6m4v2yjX7QnrKQ/41/4+MQu/gw10HSEZGIbIBIEGFwfLL9sAX8UXeQj4u
 ySc4oAnYLHiqEdDy6OLkL6PoNp8APizC4Ep5w2H84rLcE+rKvnp9yDQgRD30suag51XPAoMmc83
 GywUOj3AKMOk9k4qtZXsFsB4LtdeHjeN0TnL6klOfKwr6CiYo4HQ0rEO/LUP0xnTZtUG4wSDzWl
 OrtBj8YGBHAl15LwRf9tegqWqZsDwjt/LBqrhi4pNfmrR3W8sI+zNAt3A7BzTz8fAqZZoSRqq+i
 hrZLfTbkAVC7xmSnwRIwEcg7pwHQnHolaqxukfCPAUk6+Yctc60Ee6aQ3k249xNcUhy7qYF3/bd
 e5+q3BVrmKct+cf4O0l9P8O9twVC0rTjE+kf+9PA8/hoTtK/JBxUMyGvFLGDcH3wslNTOACnxXu
 96ReFI8VQJqht+dHhw96xt04bj2I9WTL6AF1w9Asg0r2JMpDq7xQBa3Jo6aMPqKaQWsj2Cgjmu2
 kChgzGLHdHCMdUg==
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

The write to RING_HWSTAM to disable hardware status page writes on
interrupt was unnecessarily open-coded in xe_hw_engine_enable_ring();
it's preferable to do such programming in the engine_entries[] RTP table
since gets reflected/verified in debugfs, and will also automatically
ensure that the register is properly saved/restored around engine
resets.

In this case the HWSTAM register wasn't explicitly added to the GuC ADS'
save-restore list, so there was the potential for the value to be lost
on engine resets.  This doesn't seem to have happened in practice, so
likely the GuC firmware is automatically saving/restoring this register
on our behalf, but we shouldn't rely on this implicit behavior going
forward.

One other slight change with this patch is that HWSTAM will now be
programmed on the vestigial execlist (non-GuC) initialization path.
Since the register's default value is 0x0 and the documentation
indicates that it's only legal to leave a single bit unmasked at a time,
this likely would have been an illegal situation if the execlist code
were actually usable.

Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0419cd045090..ec47e17b4119 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -327,7 +327,6 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	u32 ring_mode = REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
-	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe->hwsp));
 
@@ -437,6 +436,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   ring_cmd_cctl_val,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
+		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+		  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		/*
 		 * To allow the GSC engine to go idle on MTL we need to enable
 		 * idle messaging and set the hysteresis value (we use 0xA=5us

-- 
2.53.0

