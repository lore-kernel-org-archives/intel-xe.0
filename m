Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75048CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 19:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3243F10F906;
	Mon,  8 Jun 2026 19:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7NZghKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85EE10F906
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780946337; x=1812482337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jTyx9zM7idJFUAdrSmh0jePQY4+bHLo0mh/ZG6FKjeI=;
 b=K7NZghKw8ILJR9yTn3FjwxwhEeWKcSrvIOy0L9Fm2Od3WH4yqwR4Z66E
 Frx7OjjrRcTohKkFqwB0zAWrzCgMK7/A0OUB3mxJnEYmuGJigM/I2VgYY
 3xMvfhgGSjq6F2jtFIwvpe/v4EvCX2iYozkdwxsUJR2kpIcfrjK0dnMep
 My39aAqjMuqtQdm+zS67XBtLOfKMVV0U+jyiRBduua5Cxi0o/dnUzVPkF
 sfjdmAUWQq2e9ZaxtbvVIV5pj+6pTubQkpsWp7qqKQBqF1kpUXu9Gwd0b
 OJ0/aPWHO27S9difmO0XmTgaI1ivZOtsXw403ewk7BUP7Ydqj9oWAT0BC g==;
X-CSE-ConnectionGUID: qmRfZUV6RRyCCRcYLfphzw==
X-CSE-MsgGUID: xPsnL4JuQhGceyt8csaejA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92019426"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92019426"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:18:57 -0700
X-CSE-ConnectionGUID: MzTy1byBT5CpCSoxYPnWbw==
X-CSE-MsgGUID: 83rFvYycSzKFwe/EAfxTDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244789326"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:18:58 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/9] Revert "drm/xe/pvc: Add GuC firmware definition"
Date: Mon,  8 Jun 2026 12:17:44 -0700
Message-ID: <20260608191831.2337033-12-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608191831.2337033-11-julia.filipchuk@intel.com>
References: <20260608191831.2337033-11-julia.filipchuk@intel.com>
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

This reverts commit 0ed141cf1971ad0bea62b0d537e13f7f6eb49aec.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c0c02ecacf8e..b64db77518bd 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -123,7 +123,6 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.51.0

