Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9AC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF55E10E62A;
	Fri,  2 Feb 2024 22:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvqEUJvL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5232E10E62A
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706913332; x=1738449332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DFHIHXMrqNFqPDpurjAZ4kEAOn/3eq51Hhf+vQMy8zQ=;
 b=OvqEUJvL/777xGoMRb4qjNueTsEZ1m2uMjEdOnQHOEojLlr8GypsBtMm
 03wLj8bxRHzkzjUiHKxCqvSXTtA5SwKlnrJTZpHGpsiOoq+v1FEzbSYVj
 bly4rE4Viaj103mfNwlJD4oI+5F/2BpdYvH4Y3JjmHLyZyPDRIGsBvKG5
 9zBHcYu+L8sD9ULrsag4fY13t1ltlPPY0V0DiUarpltP5g1AIHWYOqjhm
 cWjeD9zzC8E9gwMtlNVbJT9t4ezY1aqAwJDFq7igiZPXDILio+6eDr3cQ
 WXiyA5uU7xiheHQhqA0BSFmtSo3R1wXNugZEPAShhIl1b3pBCYyR63nHG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3215496"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3215496"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:35:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="192792"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:35:32 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
	carlos.santa@intel.com
Subject: [PATCH] drm/xe/xe_gt_idle: Drop redundant newline in name
Date: Fri,  2 Feb 2024 14:35:25 -0800
Message-ID: <20240202223525.3221158-1-ashutosh.dixit@intel.com>
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

Newline in name is redunant and produces an unnecessary empty line during
'cat name'.

Fixes: 27a1a1e2e47d ("drm/xe: stringify the argument to avoid potential vulnerability")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 9358f73368896..42fdc7f688d0e 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -87,7 +87,7 @@ static ssize_t name_show(struct device *dev,
 {
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 
-	return sysfs_emit(buff, "%s\n", gtidle->name);
+	return sysfs_emit(buff, "%s", gtidle->name);
 }
 static DEVICE_ATTR_RO(name);
 
-- 
2.41.0

