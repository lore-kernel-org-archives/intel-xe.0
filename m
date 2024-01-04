Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F96C47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 10:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A895B10E3F8;
	Thu,  4 Jan 2024 10:19:12 +0000 (UTC)
X-Greylist: delayed 768 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jan 2024 10:19:11 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686C310E400
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 10:19:11 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1704362765; bh=fEXQX4gsjk5O/IBA2aZXkZGS/jUJ+a9QYL19GKpkXko=;
 h=From:To:Cc:Subject:Date:From;
 b=nChsFGGC4CEUERRkEpVaMrNrphCfMXDhOdnqSkn2D6xr4Yr/ynaA7VjE6YuIfFXs8
 tpZ5tRRsv/MQ18rWuHKL1FlY/H9nsAJUER3JNfHXdsITrnr8wr6NKima2CPb1SZZ/z
 s7iZI4lSsLqUpEuAm3o8+v2JT93RBhqb1BXmYXjA80HF2om71Eh9n7WCsN9WXB1Wyb
 9hhcLveh5mzvZipPRF8l6p/IfoXR8pkbPhKi6riW+hWiw31v/Y8ViSKqHV+1mBtVNI
 k7WeBoKIm+LHEFY9uNUafwvtuo57uD15G5/CdFiEu7p8uEhHjm7ghreAq7EflHOl4R
 7p9Ul3ZDmgq/A==
Received: from osharabi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 404A5xCw1204310
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 4 Jan 2024 12:05:59 +0200
Received: (from osharabi@localhost)
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 404A5x9e1204309; 
 Thu, 4 Jan 2024 12:05:59 +0200
From: Ohad Sharabi <osharabi@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: skip register UC debugfs if UC disabled
Date: Thu,  4 Jan 2024 12:05:57 +0200
Message-Id: <20240104100557.1204296-1-osharabi@habana.ai>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When working with execlist we should not register the UC debugfs entries.

Accessing those entries when UC is disabled can lead to a kernel crush
(NULL pointer dereference).

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..bafd55a7fb16 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -245,5 +245,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	xe_uc_debugfs_register(&gt->uc, root);
+	if (xe_device_uc_enabled(xe))
+		xe_uc_debugfs_register(&gt->uc, root);
 }
-- 
2.34.1

