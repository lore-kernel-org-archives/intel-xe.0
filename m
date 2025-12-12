Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80B2D4336E
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 06:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47D610E42B;
	Fri, 12 Dec 2025 06:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fndDlXUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5644810E422
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 06:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765520337; x=1797056337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PoHfjX0tmm3bGlkbC84MSJH3KYlLUH8R3NLCPcJkz3c=;
 b=fndDlXUjVBFI+KKqowQVu5lw2oI6zw7IapfQuaeh/AFErxOlhZ9NjsSi
 QyUWbRLBzAxGRkjuXfNFFg22v1FjQjHb8X2pI/+COeuwV4fxJywDfBGPf
 cvrc0nlhww238FP4CoIcgnopVZVitDN3yNUeKD0w+q6tsLOj0f6dbGdec
 SJt3KelTABnyeHdu9vC/I3ritBdr41uKcG6pDaitlzShhbR5MnUESPZVQ
 7LGvIbfI+WpkTJNddRVmH5vx/kRETsfK7fVvnJ5RCPYNs/zbIeweOPVOb
 1NM27ezmNhniBlQXd7xTic9NRqQZhfBBC+ZA8QUnWuOQxKYkzk9+LnwTf g==;
X-CSE-ConnectionGUID: PEI8CWyBRYalltO0YhbRBQ==
X-CSE-MsgGUID: mX3p1csHRRWXWUJ8qF9uRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67557156"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67557156"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
X-CSE-ConnectionGUID: 4ExH2p7ASb6Y9JyseUSV6A==
X-CSE-MsgGUID: NG6YBP7USBClBcJdcAznqw==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>, peter.senna@intel.com
Subject: [PATCH 3/3] drm/xe/eustall: Disallow 0 EU stall property values
Date: Thu, 11 Dec 2025 22:18:50 -0800
Message-ID: <20251212061850.1565459-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
References: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
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

An EU stall property value of 0 is invalid and will cause a NPD.

Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6453
Fixes: 1537ec85ebd7 ("drm/xe/uapi: Introduce API for EU stall sampling")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 97dfb7945b7ac..a5c36a317a707 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -315,7 +315,7 @@ static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension
 		return -EFAULT;
 
 	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad))
+	    XE_IOCTL_DBG(xe, !ext.property) || XE_IOCTL_DBG(xe, ext.pad))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
-- 
2.48.1

