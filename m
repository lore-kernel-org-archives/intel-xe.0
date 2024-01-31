Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9479AC47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5933810F174;
	Wed, 31 Jan 2024 20:00:18 +0000 (UTC)
Received: from mail02.habana.ai (unknown [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8EF10F06A
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 20:00:15 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1706731198; bh=tfRDWr2pLerbGU7P9bWKW4KLedPi7Uoj7G9/1YJL1c0=;
 h=From:To:Cc:Subject:Date:From;
 b=HQZD+wy4Z0EdDotzzyH7Ii2tWCM6WfA25aqzgY43UMpRCUp5HE0+YXAKkbguF3Zzn
 bWA1l0ez1Q3E5L/WEeqPB9DXKaVfgYVis92DklG9eThkvM47yTmGOtWatkFEKOVfIg
 qiEkTO85wGwFEgzOODUb3Bk8++teRzL+uFnTUYFJhm8LwsHm06iy+E8t13u+ELu7XI
 CIO/yyOoLqI0H3zpTBln0MCS141Q1xgPnTcPIsTubnl5e8H0Z2DyWd8XEmR7FdSVGZ
 0uEdnv/8GgXem/Wloe9XMJHDs068zSQL7WI764USkCQGudQKMAoTssZ4TN/5ltNpQO
 xxY77Byc+ParQ==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 40VJxrlv852654; Wed, 31 Jan 2024 21:59:53 +0200
From: Koby Elbaz <kelbaz@habana.ai>
To: michal.winiarski@intel.com
Subject: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Date: Wed, 31 Jan 2024 21:59:52 +0200
Message-Id: <20240131195953.852641-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that the former mmio handlers are fully removed, this
debugfs file will be used for mmio access (read/write)
through the debugfs ioctl file operation.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 01db5b27bec5..21b2257aa3a8 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -98,12 +98,22 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static long xe_debugfs_mmio_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
+{
+	return 0;
+}
+
 static const struct file_operations forcewake_all_fops = {
 	.owner = THIS_MODULE,
 	.open = forcewake_open,
 	.release = forcewake_release,
 };
 
+static const struct file_operations mmio_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = xe_debugfs_mmio_ioctl,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -142,6 +152,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
 
+	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
+
 #ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
 #endif
-- 
2.34.1

