Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E617C77B7C
	for <intel-xe@archiver.kernel.org>; Sat, 13 May 2023 05:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F6F10E039;
	Sat, 13 May 2023 05:08:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C320B10E039
 for <intel-xe@lists.freedesktop.org>; Sat, 13 May 2023 05:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683954533; x=1715490533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9LYjDMkkpObmp6o1Hwiblhy4Fvcn5Rtu21xzLYs19Ys=;
 b=Cgb2BT1VmzOBmc6IOO8DYvMoOB5aMnE1S0uyoh3I3WxFY/+pAQnVpV2i
 J+1ClwPm1hhdCKuf6zuQ/oy7Ygu4cXDM8uqBstDlsDSqtpup4do3nrSSN
 9ZnyF5cZU/0E1EWEZTJ2qnDHA5a1UVz+wSSODiFayEXcwgLZ/BYIHxHXZ
 fcFaHwLhn0PaIqxsPDomgTfx1p45R5ypqo+BIHQO9Jbxk3kH5jO/CPKuU
 rq0RTA/+Hdpx2K4/QHf5S8zbetTi6AH30wR71KmSsuysElXgFWx1+FFZK
 4NBOgx83F29YXGQVx0y3pbovEXYDi7DBCc3C60uAw0mdkO7AHQ4SZL+jp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331294327"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="331294327"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 22:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="650848816"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="650848816"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 22:08:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 22:08:30 -0700
Message-Id: <20230513050830.3240970-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Annotate desc of platforms with
 display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix race when pushing the display annotation on desc struct and
enabling ADL-N.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 18d58d916fff..66af8a621876 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -222,7 +222,8 @@ static const struct xe_device_desc adl_n_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_N),
-	.has_llc = 1,
+	.has_display = true,
+	.has_llc = true,
 	.require_force_probe = true,
 };
 
-- 
2.40.1

