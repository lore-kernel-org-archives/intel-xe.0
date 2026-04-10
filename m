Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69C5F45A12
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 22:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADE810E9DF;
	Fri, 10 Apr 2026 22:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSDDyyJQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08CA10E9DD
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775861467; x=1807397467;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=v47fbyqz6VvGB7gE8Gekc0zoDBhF2hrvU9xiTXeYzOc=;
 b=fSDDyyJQbWOdI1kdUT3lQN/ssjQyrY2xCW5Lf7ls8dAPoTMn2amgny+1
 jSMEISB24av4nukjFG+jM9MjdmDbbcHrKdxdvRq2v1KPKTM47QAzNKWu+
 /UNmjs1rjAHAK6BOVfGjTlWCcAW9P4i4XtNo/HV7QMv7kCaz6UcgTlOMB
 5ZjYb30Elo1m5suvqdDZFGhvMmQDNC9UICIq027VTZeMjkKEx5MJH2jpu
 sqMsC7oicJPFNcnLUb4LeVAuayTzxuoa37Obuwjxn+xVRlQi2m+LEePOP
 j9H0EBT6x/sEIH8mr3BQ/q7Eyx5z6J/mAcKUrtwdimZucctHHifKBOv6H w==;
X-CSE-ConnectionGUID: z+HWFveuSYKwnvo5/1PAag==
X-CSE-MsgGUID: eug6bJ7ATUqUuOu6K5EdcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76849550"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76849550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:07 -0700
X-CSE-ConnectionGUID: DoIf3ABKQV6oZWxOZcp4Wg==
X-CSE-MsgGUID: 47+rBAGoQJuX4+yr0TR+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="222728521"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 10 Apr 2026 15:50:30 -0700
Subject: [PATCH 3/3] drm/xe: Mark ROW_CHICKEN5 as a masked register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-xe3p_tuning-v1-3-e206a62ee38f@intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
In-Reply-To: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=v47fbyqz6VvGB7gE8Gekc0zoDBhF2hrvU9xiTXeYzOc=;
 b=kA0DAAoBTXkkBchykAQByyZiAGnZftqg1pIJh96ikKUGQkgifZTmG0ILxVYIhCwNczqU7uazw
 IkCMwQAAQoAHRYhBMJnwwlEf+tPPyFtrE15JAXIcpAEBQJp2X7aAAoJEE15JAXIcpAEvV8QALPu
 A/33fRAuB/J13PRfnPW194lvTGv3b7iIOgabd7EvnqP/m3j9WZyxVqcXdurkdZaKVfHqZDjWYF4
 56Var9905m4XJfBCnKToJk9qr9dXu5mN3fKdcmZJguOy+TUSaNEYmTbjKq4NtHrNTsLNVXQaPwI
 0+F7hd0LISVShatcwWSjJOhjcXhIB+r1p02EtzxyvTt/OWUYDgc775YN8QD30Cd8STh44C9vV3E
 vLiAH6DNuniu57+F2Q3SfOdPwbzeL8h7ROCKGCC5+YAZS0fuwMbNHTzwJtITG1PpfDo86di+F0o
 OJ57sNnmvy4QgdCMugYIY7PRJXwCQ8kAnn++t4GtgqIWKOWVFZ4UhhZnYu5ke8cASo2yhCldooD
 6aneKyeJKIkrlwtLg/pm8gQJcKhP8kdlAg7wvC7LTaTWHJ5WAls075trKTkgkVSCu08JCLY0Bpg
 P51QgZA2sEu9Axb0vixeU7Mj5Me3aOBIe2duLXlpmw+qSXTigkGxh5Nox5ZMOiB67hIrlBY+/5K
 jcvMn1RO22Up+Whfb2kkImN0mBUvt/425Bcd9rpklVR8/lfeAuDH3/F+1Wudzlo2S5NM1+pTJP0
 VsdlEqbL/LpFQ8vmtY5RZ3HZlvdvF/F5HtTDjXAOd5ns1tyFVk5WpluU+Ev1scZ3/HT9KnNYLUC
 J5d4C
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

ROW_CHICKEN5 is a masked register (i.e., to adjust the value of any of
the lower 16 bits, the corresponding bit in the upper 16 bits must also
be set).  Add the XE_REG_OPTION_MASKED to its definition; failure to do
so will cause workaround updates of this register to not apply properly.

Bspec: 56853
Fixes: 835cd6cbb0d0 ("drm/xe/xe3p_lpg: Add initial workarounds for graphics version 35.10")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index aa267c2f6162..a4472b7acb18 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -584,7 +584,7 @@
 #define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
 #define   LSCFE_SAME_ADDRESS_ATOMICS_COALESCING_DISABLE	REG_BIT(35 - 32)
 
-#define ROW_CHICKEN5				XE_REG_MCR(0xe7f0)
+#define ROW_CHICKEN5				XE_REG_MCR(0xe7f0, XE_REG_OPTION_MASKED)
 #define   CPSS_AWARE_DIS			REG_BIT(3)
 
 #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)

-- 
2.53.0

