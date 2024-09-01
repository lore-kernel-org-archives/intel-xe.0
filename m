Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27166C54FC6
	for <intel-xe@archiver.kernel.org>; Sun,  1 Sep 2024 04:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC67710E02D;
	Sun,  1 Sep 2024 04:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="OfwuRpD0";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666AD10E02D
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Sep 2024 04:44:03 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1725165836; bh=/yqjZ71myp0b8JA+/fueuP2V7C8I4BK7/EhksjCBIVI=;
 h=From:To:Cc:Subject:Date:From;
 b=OfwuRpD0oqVlSd6pGq6dd7DiAt1h+ELAa3AakQVPv1CsLA6sL0N3+QRJB+muWUMNA
 qMx4k67/PzAfWrjJ/WduAzasks6B3uM6U1LzhvdokLR9J3Es8+UJJ4pmeSgEPwXGhn
 VzoG/jsArJ6W+Bovux1WBsxTzDgd3/V8QeQooKcmtXytVJSHxegOFQzKXjY0JTxKoT
 ZHZw6qh27yzELGsjLJ7m86eOWv3RbIaJCMbyZ16S38X5qIJJL+IrPUVzwNFCjybXph
 6L1SJlyq/doVGb2rbbVnRwwEXGlITWWF2Ncz2DYMTeCsFTUfx9HiEKa20+IVtvwpik
 jEnJV+uhEU4oQ==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 4814hoVP1177287
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 1 Sep 2024 07:43:50 +0300
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 4814hnSS1177286; Sun, 1 Sep 2024 07:43:49 +0300
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, Dafna Hirschfeld <dhirschfeld@habana.ai>
Subject: [PATCH] drm/xe: fix missing 'xe_vm_put'
Date: Sun,  1 Sep 2024 07:42:27 +0300
Message-Id: <20240901044227.1177211-1-dhirschfeld@habana.ai>
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

Fix memleak caused by missing xe_vm_put

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fa4ed168b53b..df3ea337f55c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -252,8 +252,10 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 							   gt->usm.reserved_bcs_instance,
 							   false);
 
-		if (!hwe)
+		if (!hwe) {
+			xe_vm_put(migrate_vm);
 			return ERR_PTR(-EINVAL);
+		}
 
 		q = xe_exec_queue_create(xe, migrate_vm,
 					 BIT(hwe->logical_instance), 1, hwe,
-- 
2.34.1

