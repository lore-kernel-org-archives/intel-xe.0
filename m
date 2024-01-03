Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0CCC47079
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 07:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B36010E1EA;
	Wed,  3 Jan 2024 07:13:01 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48410E093
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 07:12:59 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1704265969; bh=sb2d79nw+iMmqlBWN7HXQlIdGycXZ12vmz2x8Xe18HQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ibVuwSL9SaMrCi7VvSGxcVcExgNQ02MOiveT1V57GVo3qjpcpjtGLX5IkmIUni5Bb
 kq0gaFgDEw4mVB+GRFYHKBa9V7aIg9j+vVOTa865TMF13S8nzzOGrtY1bwJ6T9OOk0
 qCQeisuJsQ7onojsinh+j1MnxK5cT8c0QPcVPdz96whLYFaOllRH8oPLxA0Kwvx5Ue
 B+vfpnpg9ho9zeqzb9hgdHksudBjHFG0sIZaGd5Hs7vJBdhnTlDskWPZHUFbr3VCLz
 tLoBex1axfutJQXNZaJLUeSENzLUobzdQTyCS+znY9KgXEy7CQgsvGB2Teh/yBSEUp
 Zv+ogH1bvSokA==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 4037ChNh1978986; Wed, 3 Jan 2024 09:12:43 +0200
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/xe: add a new debugfs file - mmio
Date: Wed,  3 Jan 2024 09:12:42 +0200
Message-Id: <20240103071243.1978967-1-kelbaz@habana.ai>
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
Cc: daniel@ffwll.ch, rodrigo.vivi@intel.com
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
index c56fd7d59f05..c24637ff09d8 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -97,12 +97,22 @@ static int forcewake_release(struct inode *inode, struct file *file)
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
@@ -141,6 +151,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
 
+	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
+
 #ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
 #endif
-- 
2.34.1

