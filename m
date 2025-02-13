Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3080C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 22:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675B510E1A1;
	Thu, 13 Feb 2025 22:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLaV8Bdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE7310E1A1
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739486188; x=1771022188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dv6vlQnQ4Ga/Ka6EBPVhD3EDOSlQoK9Mq+UaLGKH2I4=;
 b=OLaV8BdcLUlT4mHFgp9SxGlOZkGHHNc9G8oUUJ+ns8xSek1FJS1/d/is
 fygOBsBUZ6w8wwepOfkLdGPXi6F3Mpr5T3KRDOKVOrsgtQxnluIoUt26U
 iMZ7ZyYDQmBoQRKJPXwIRu5nrQ5wcgmJadJJ+GqI/PNWFF1o/GEZj3M9x
 Ktfvfeun+6eNkjvoa9pD/Ocy0zuEn2ca09+k2ICe0KRftHrAFoqEUL9P+
 ExcsWbe6j7f/gRhaXie3DC2AYfs91q9rmsKXBdCssxqWFYOZ2vuEA7bDt
 d+wyw+nMPDrzb2/He3H1HwIX8MRTzvlZcpWZO1KLfWqo1AgdKjtzGR8Lv A==;
X-CSE-ConnectionGUID: GkBwZWY5Q9WB+rcsp5APdg==
X-CSE-MsgGUID: Yzj6IbGHSZaFbgSBDP8daA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40331769"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40331769"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:36:28 -0800
X-CSE-ConnectionGUID: 9CKvtXDUQXepPkufxZEsSA==
X-CSE-MsgGUID: CqSf9uV9Tsi1SLUHP9O3nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144218373"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2025 14:36:26 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fei Yang <fei.yang@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/debugfs: fixed the return value of wedged_mode_set
Date: Fri, 14 Feb 2025 06:36:15 +0800
Message-ID: <20250213223615.2327367-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

It is generally expected that the write() function should return a
positive value indicating the number of bytes written or a negative
error code if an error occurs. Returning 0 is unusual and can lead
to unexpected behavior.

When the user program writes the same value to wedged_mode twice in
a row, a lockup will occur, because the value expected to be
returned by the write() function inside the program should be equal
to the actual written value instead of 0.

To reproduce the issue:
echo 1 > /sys/kernel/debug/dri/0/wedged_mode
echo 1 > /sys/kernel/debug/dri/0/wedged_mode   <- lockup here

Signed-off-by: Xin Wang <x.wang@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 56cb3788e752..b46075edf60a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -167,7 +167,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 		return -EINVAL;
 
 	if (xe->wedged.mode == wedged_mode)
-		return 0;
+		return size;
 
 	xe->wedged.mode = wedged_mode;
 
-- 
2.43.0

