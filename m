Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9166AC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 06:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B6410E117;
	Mon,  5 Aug 2024 06:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIIbXTFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9D710E117
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722838870; x=1754374870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oOhhVXV74Z9/eu51mu8D8N0mKWsMKB7tUJ/RxOHN3a0=;
 b=NIIbXTFGsUuw8EJv/dnSdkl7jUs2hJK3hd6MwkUz4EvvUjmF0NUjZ3rQ
 ZZ2W8irgNZmtTm14+Z5BAZso0nvhc1ftRjJDcvZYv0ZxYgOpWYY+CgWzu
 AbyQ16hzhE/fsEkkowh96VoWmDGrVXtHmfYXbFMF+Phq559A5tVp9vkvj
 yz4JLFVny7IFFKUW+pyzf+rHovvuzeDmiyXgbloYdW7a5LMEC7bZz3A0p
 eYuHbT3Ij3K8in92k5wOoAQVEb1ljYL1VJvWzWNOgnXkOfcHs+vFUXDkZ
 ZU+h8+REUxcnbd3dOZqgt1BP49TxnGF1RV3krRGhTor8pYcT7uiVHVqXQ g==;
X-CSE-ConnectionGUID: 2Z6841FKSJiKxhGpLJQY+A==
X-CSE-MsgGUID: IPB1wDXqTh6D/VTrxBuDOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="32154143"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="32154143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:21:09 -0700
X-CSE-ConnectionGUID: 421LlJZPQs2mzPWb7jRn1w==
X-CSE-MsgGUID: qPh0dESwRXKI9ToVX+ij1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="55997167"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:21:07 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/observation: Drop empty sysctl table entry
Date: Sun,  4 Aug 2024 23:20:57 -0700
Message-ID: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
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

An empty sysctl table entry was inadvertently left behind for observation
sysctl. The breaks on 6.11 with the following errors:

[  219.654850] sysctl table check failed: dev/xe/(null) procname is null
[  219.654862] sysctl table check failed: dev/xe/(null) No proc_handler

Drop the empty entry.

Fixes: 8169b2097d88 ("drm/xe/uapi: Rename xe perf layer as xe observation layer")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2419
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_observation.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index fcb584b42a7d5..a78c92a44ec2d 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -66,7 +66,6 @@ static struct ctl_table observation_ctl_table[] = {
 	 .extra1 = SYSCTL_ZERO,
 	 .extra2 = SYSCTL_ONE,
 	 },
-	{}
 };
 
 /**
-- 
2.41.0

