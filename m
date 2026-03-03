Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02DFEDEBF3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 20:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AAE10E8B4;
	Tue,  3 Mar 2026 20:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2fdTUjs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0532B10E8B3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772568877; x=1804104877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oig6CaDD5aNW2kUOprh46AeMd/iDbvha1IYyunjaqNM=;
 b=L2fdTUjsRRl9rFrb3mv3DOcU8jeUGEHrvbW6X7E8c/+pIFdyyuMSRaLr
 FzbuilAF681qDhQc0RKbqYPRWs4tTEfp8OkI75QUHAPV3XClThKVBrzFX
 LwBfjPRrO7ZrfI+eK5noRbo6TI/vibl8Ak+43GXycx6tNaajj3kT2E/4P
 2Q839s0Taf70FQTz5ajoAoyRcJAJ9OEYU6wSlaI8FM52B4s8U3ZrOWDPN
 3sd22fPRjU6WTXACgiINz0ZjJqjX5GYspZ80wiXRAUkbWkPfR4RjLsR+L
 INHWfooGRVJrPavZNXsxyIGu0hkRgJ/rmpViH2ETJG8YFIfqQnaW4s6N8 g==;
X-CSE-ConnectionGUID: lslDCg7uTeeVPiWEFYp5fw==
X-CSE-MsgGUID: YjgxQWOoQ8yzETOMONhdaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99096715"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99096715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:37 -0800
X-CSE-ConnectionGUID: xnDQfAAXSxO8boCg3A9pcQ==
X-CSE-MsgGUID: HiH7YbfrRQqtxIZTUXGl0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="256005834"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe: Add PR_CTR_CTRL/THRSH register definitions
Date: Tue,  3 Mar 2026 21:13:52 +0100
Message-ID: <20260303201354.17948-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303201354.17948-1-michal.wajdeczko@intel.com>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
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

The Watchdog Counter Control and Watchdog Counter Threshold
registers are needed for watchdog programming. This watchdog
will generate the "Media Hang Notify" interrupt.

Bspec: 45999, 46000
Bspec: 60373, 60374
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index dc5a4fafa70c..1b4a7e9a703d 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -132,6 +132,14 @@
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
+#define PR_CTR_CTRL(base)			XE_REG((base) + 0x178)
+#define   CTR_COUNT_SELECT_FF			REG_BIT(31)
+#define   CTR_LOGIC_OP_MASK			REG_GENMASK(30, 0)
+#define     CTR_START				0
+#define     CTR_STOP				1
+#define   CTR_LOGIC_OP(OP)			REG_FIELD_PREP(CTR_LOGIC_OP_MASK, CTR_##OP)
+#define PR_CTR_THRSH(base)			XE_REG((base) + 0x17c)
+
 #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
 #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
 
-- 
2.47.1

