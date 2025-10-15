Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A81BCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BA510E76F;
	Wed, 15 Oct 2025 09:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3H/QJno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA1F10E769
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760521284; x=1792057284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=feNPRr4zpJ4vh9Q/i2wz0N5GNR9inzIME1by8BOd5x8=;
 b=K3H/QJnoVhJ/WLlr8v63/AHSpYdJpvvoLQ3NUanyJLbltR2ShcP8Tt+M
 RtwqOxCfQlpMNFm42t3RTsK56TfH8wQgKoPOYwmu7mvpX2gpdEdhPdMd2
 2K3Sx+WLg5HtSbdQihC+mge+fDd0//kOwv2JMKUS1OgJyMl4qQfwy4eAz
 n6CCOWRe+N0XXlVAKBYb71wCDMkJVNO07z85axPxLzQmfw1uQmslnXxg3
 J0+zWB2PEN3f1wEbAJVfClUhxntG5y7IXhR0CEJpyCIEMKQ/IotjMPkN0
 DMSHBGxO9OQSZTMJZKo/tdOsgVdPaLqGp4M/4oyov+qI9J7rursPX+35d A==;
X-CSE-ConnectionGUID: 1FWFDceuQeqn5wfy9n6x1Q==
X-CSE-MsgGUID: 2B830ofFSrCNq/nsMteR+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62588520"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62588520"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:41:24 -0700
X-CSE-ConnectionGUID: wSH810VeRIK/RJl1u41bdw==
X-CSE-MsgGUID: xeTQQNlVS1qKoNYW/hImqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="219272946"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:41:22 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com, sk.anirban@intel.com
Subject: [PATCH] drm/xe: Prevent runtime PM wake while reading rp0 frequency
Date: Wed, 15 Oct 2025 15:16:11 +0530
Message-Id: <20251015094611.1468939-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The rp0 frequency is a fused value that is read once during probe
and then cached, so there’s no need to trigger a runtime wake
when accessing rp0.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 4ff1b6b58d6b..701349251bbc 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -99,13 +99,8 @@ static ssize_t rp0_freq_show(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
-	u32 freq;
 
-	xe_pm_runtime_get(dev_to_xe(dev));
-	freq = xe_guc_pc_get_rp0_freq(pc);
-	xe_pm_runtime_put(dev_to_xe(dev));
-
-	return sysfs_emit(buf, "%d\n", freq);
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
 }
 static struct kobj_attribute attr_rp0_freq = __ATTR_RO(rp0_freq);
 
-- 
2.34.1

