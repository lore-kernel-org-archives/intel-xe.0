Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5313F9D0FE
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 02:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C37810E158;
	Wed, 15 Apr 2026 02:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmOxyeHA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0B910E158;
 Wed, 15 Apr 2026 02:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776221418; x=1807757418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bFRXXVSoEzIyaWlst7nQdkzE9ezjLKU34mZ/wD8/qQw=;
 b=XmOxyeHA45Uxme6KcjHuxkK3IHhu14N0xVPWLRJqIWhf8RiF/ttmUWTc
 ROaaCw2YDXqUPH07i8gVXq8pD4zM64r+DahpItcWSzU5nUIx8E58moapW
 J54wt2r973ALP3k3JP9Xz63XzBtpiauyxj+dKuUzVVEpkaS3YZO1HNKRT
 G/PKl+vyQusdfQNEurPK9WKqAxAs8+BuxiPA1vpHPeWWJ2A1dIs2LHTRZ
 dIasQhzTT8bMJE8QZcfx/FLv20GinoheYXk0T4MatEjnFyREpCXShOe4p
 PVBJ9VX15qX6mMWNHwl2sLB5pbnN6VrYqNX52jC/LjtMJYsrssiolDMne A==;
X-CSE-ConnectionGUID: 9xE68jlwSp6SDU3+qcsQeQ==
X-CSE-MsgGUID: RxmXKTQdRcSHWiw537stZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88269903"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88269903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 19:50:17 -0700
X-CSE-ConnectionGUID: KV2XhdFHRyGRUz9dI+DNYA==
X-CSE-MsgGUID: slJ9aliVQEyHe3IOWeSDyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235228210"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 14 Apr 2026 19:50:16 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/lt_phy: Update the Tx Swing for DP 1.4
Date: Wed, 15 Apr 2026 08:19:02 +0530
Message-Id: <20260415024902.3188784-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

Update the Tx Swing Level and the Tx pre/post-cursor co-effecients.

BSpec: 74493
HSD: 14019673751
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 395dba8c9e4d..980ab19868b3 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1123,8 +1123,8 @@ static const union intel_ddi_buf_trans_entry _xe3plpd_lt_trans_dp14[] = {
 	{ .lt = { 1, 2, 0, 28, 7  } },
 	{ .lt = { 0, 3, 0, 35, 13 } },
 	{ .lt = { 1, 1, 0, 27, 0  } },
-	{ .lt = { 1, 2, 0, 31, 4  } },
-	{ .lt = { 0, 3, 0, 39, 9  } },
+	{ .lt = { 1, 2, 0, 31, 5  } },
+	{ .lt = { 0, 3, 0, 37, 11 } },
 	{ .lt = { 1, 2, 0, 35, 0  } },
 	{ .lt = { 0, 3, 0, 41, 7  } },
 	{ .lt = { 0, 3, 0, 48, 0  } },
-- 
2.25.1

