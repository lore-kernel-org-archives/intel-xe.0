Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD4C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 05:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3305910E6D0;
	Wed, 30 Apr 2025 05:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkPsf3tD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4839D10E6D0
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 05:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745989879; x=1777525879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k8BbfT+CphABLe9evvG3bNLaSXkr+EcuKi3OMZmWF5c=;
 b=PkPsf3tDPbDtWfqEfNG/wthMzDpVf/IFq/Fui8vbcbEcY0OLVayrPXO6
 kzRsqMB5MMjRwsEVnQ2tBbTrLDp6eNZ5k7v/757703ZjFhYUvhcb5Rc2K
 yDtqDT/J+aFR9ywkvuhp9iOerMtgWWgy2+3aPwbLmhUc3mCEoWUulDuGM
 8gr+gSuMYodra752yhneF5jYOjDNwBvM+IIkAczJ9mKK9u9vx9RSnsXtK
 MBvG40QTySV3sYBlrx17q3cs+1EmcQq9QOTjHxnigJ2Xy9uJtoFU0r9Ak
 c55O9edpxu5dCDsgHNgU1xDCR99QdeEp67rRcol+qsWZRRQowLYnHta+7 Q==;
X-CSE-ConnectionGUID: rUh+nVeHQNWPtLY5uJ7V7w==
X-CSE-MsgGUID: UyiEL8m4S/O4L+eu1W8oJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58268736"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="58268736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 22:11:16 -0700
X-CSE-ConnectionGUID: psbSZ5RGSdKW4ibY3WGwjg==
X-CSE-MsgGUID: ZFgZGK0zQ7iGysTM3FRVTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133912646"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 22:11:15 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, kees@kernel.org,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Use copy_from_user() instead of
 __copy_from_user()
Date: Tue, 29 Apr 2025 22:11:11 -0700
Message-ID: <c8b410629c1825f5b16537974a3cee11b2d911f2.1745989733.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

copy_from_user() has more checks and is more safer than
__copy_from_user()

Fixes: 1537ec85ebd7 ("drm/xe/uapi: Introduce API for EU stall sampling")
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index e2bb156c71fb..96732613b4b7 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -283,7 +283,7 @@ static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension
 	int err;
 	u32 idx;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
@@ -313,7 +313,7 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
 	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
-	err = __copy_from_user(&ext, address, sizeof(ext));
+	err = copy_from_user(&ext, address, sizeof(ext));
 	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-- 
2.48.1

