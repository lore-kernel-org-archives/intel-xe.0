Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE8AECE595
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 12:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75B710E55E;
	Mon,  9 Sep 2024 12:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="dCh0coax";
	dkim-atps=neutral
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4E510E729
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 06:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1725692047;
 bh=yfvC59lnVqCax5p/e7Q8hKA5Ouv+EjV+B2EInFi8R5A=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=dCh0coaxxONfzBgSsaWPJ9ccECH3ReXvYMdEF2xi3Ywq8tonOA9R1BWZfm8uqlxPR
 x4DTBJOmIzo5MT5AXh7uwmYw5ak8YfWWyOqrcfcTcz4dUwbFoqJn6DvUyBgExNx7x3
 qRlwhFAbThsYFxbR6fz8k1BmZ7Nwvmx0v49jeFlk=
X-QQ-mid: bizesmtpsz9t1725691920tdbo6nq
X-QQ-Originating-IP: 2x//WS6T9GDsrQzu7lYVmF8PhvXDokIB9AI4L+PR3sg=
Received: from localhost.localdomain ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 07 Sep 2024 14:51:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7215337970466534823
From: He Lugang <helugang@uniontech.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.c
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 He Lugang <helugang@uniontech.com>
Subject: [PATCH 1/3] drm/xe: use devm_add_action_or_reset() helper
Date: Sat,  7 Sep 2024 14:51:52 +0800
Message-ID: <F2C380666CC48547+20240907065152.1660750-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-Mailman-Approved-At: Mon, 09 Sep 2024 12:37:17 +0000
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

Use devm_add_action_or_reset() to release resources in case of failure,
because the cleanup function will be automatically called.

Signed-off-by: He Lugang <helugang@uniontech.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c  | 2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 68a5778b4319..71bcd60d0866 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
 	if (!gt->freq)
 		return -ENOMEM;
 
-	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
+	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index a05c3699e8b9..ec2b8246204b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
 
 	gt->sysfs = &kg->base;
 
-	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
+	return devm_add_action_or_reset(xe->drm.dev, gt_sysfs_fini, gt);
 }
-- 
2.45.2

