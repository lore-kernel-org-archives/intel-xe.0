Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A50C5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 23:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39610E00D;
	Mon, 26 Aug 2024 23:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7nQIyA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8810E00D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 23:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724714954; x=1756250954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1IcEEIFx/FdrRuWUSYROMAcPfjXEHXFo2E2aGPNCuzU=;
 b=h7nQIyA9mUQ2IfxBZ4/6xW2B3NG3GOtVpcH2UnFCY/ZvrZ/Yj7auvV8S
 QhLNTSENx74we7+5mxgbc7Kfqo6LdaguXKTqMLep+TVLNuJpQPZs6wJk5
 M22Al1jsDty1IGa0AxbWlZdtHw+ckbMIYL0wlqlwx2ucyBxCqijvKRVsQ
 qo4Ft2MG5UhPXmXxZ9Car1Pv0k5X58K98HbaniOVnnibhoElg5y8CECt9
 jwOM57UWN1jvwfM+ZhtwxQ0CpheO64zjtz1mPW+/wNByVy2QPJ7zHuI+Q
 PcUYnyTbjP+Gc4xLtx4dFX0LWxgzxVmSWvxNpz8QsApGco0MqZOKUYpWv w==;
X-CSE-ConnectionGUID: K6z683hHSU2nwVCV9fgniA==
X-CSE-MsgGUID: oSTih2jhRjevVtjyhQW/GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23050302"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="23050302"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 16:29:14 -0700
X-CSE-ConnectionGUID: Tv0kUibIRuCnt3OuTAx6kg==
X-CSE-MsgGUID: 235/hzuQTEe5usbHjefOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="93462490"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 16:29:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Guy Zadicario <guy.zadicario@intel.com>
Subject: [PATCH] drm/xe/oa: Insert wmb/sfence before enabling OA
Date: Mon, 26 Aug 2024 16:29:06 -0700
Message-ID: <20240826232906.1849613-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

In some simulation environments, we occasionally see warnings such as "OAG
Buffer register is not programmed (has value 0). Register offset db08".
This means OA has been enabled before it has been fully configured. Or, the
register write enabling OA has overtaken previous OA configuration register
writes.

Therefore, insert a wmb/sfence to preserve OA register write ordering
before enabling OA.

Reported-by: Guy Zadicario <guy.zadicario@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4d4541e0b24c0..02a6baa3c37d9 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -440,6 +440,9 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
+	/* Flush previous writes to HW before enabling OA */
+	wmb();
+
 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
 }
 
-- 
2.41.0

