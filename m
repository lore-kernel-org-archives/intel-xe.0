Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C9C4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 14:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946A810F08B;
	Mon, 22 Jan 2024 14:33:19 +0000 (UTC)
X-Greylist: delayed 548 seconds by postgrey-1.36 at gabe;
 Sun, 21 Jan 2024 12:29:16 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369A410E03C
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jan 2024 12:29:15 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1705839594; bh=BK6cZfSY9umB0FwaK6z3/5edUCbi4rtmxXtB8V1rGSY=;
 h=From:To:Cc:Subject:Date:From;
 b=KrIG2CMZY849j5o3/Cj++FWuAxIBBvZ6jH3Bzb70DWoWGOKwauo73NwPCh6zajr3J
 rCZso+bPUUioR+lbEY0OE+IEaScTPNLt/4vaQqx2Q7KnbO5/BxcO2RoGePxcO9XDe0
 NxIpL9bvfBIeU3ntwYxdm+fCQ/90AdyOXw5ojrZImfeaNFK70A8hPFr/WonFP2CXB0
 ktN88D/Ls6MA6lXK6h1VBUGjwljZj0Do1C1PUympY7xPHH6z1KLA6NM3icxh/S3eoW
 ATTf+ymXlx16I+dwI05nNuEDingAonm5jDiec7FyWMQwMIHmayagukc9436Pyx0+2y
 kCHR2ng2PebDA==
Received: from mhaimovski-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 40LCJn6H3969527
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 21 Jan 2024 14:19:49 +0200
Received: (from mhaimovski@localhost)
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 40LCJnZV3969526;
 Sun, 21 Jan 2024 14:19:49 +0200
From: Moti Haimovski <mhaimovski@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/vm: bugfix in xe_vm_create_ioctl
Date: Sun, 21 Jan 2024 14:19:46 +0200
Message-Id: <20240121121946.3969513-1-mhaimovski@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Jan 2024 14:33:16 +0000
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
Cc: mhaimovski@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix xe_vm_create_ioctl routine not freeing the vm-id allocated to it
when the function fails.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>

---

Changes in v2:
- Removed internal ticket info from commit message. (Lucas, Tomer)
- Modified the name of the goto error labels in xe_vm_create_ioctl
  according the review suggestions. (Tomer T)

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/xe_vm.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7ea0f151d223..dc609e3cc094 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1855,10 +1855,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	mutex_lock(&xef->vm.lock);
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->vm.lock);
-	if (err) {
-		xe_vm_close_and_put(vm);
-		return err;
-	}
+	if (err)
+		goto err_close_and_put;
 
 	if (xe->info.has_asid) {
 		mutex_lock(&xe->usm.lock);
@@ -1866,11 +1864,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 				      XA_LIMIT(1, XE_MAX_ASID - 1),
 				      &xe->usm.next_asid, GFP_KERNEL);
 		mutex_unlock(&xe->usm.lock);
-		if (err < 0) {
-			xe_vm_close_and_put(vm);
-			return err;
-		}
-		err = 0;
+		if (err < 0)
+			goto err_free_id;
+
 		vm->usm.asid = asid;
 	}
 
@@ -1888,6 +1884,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 #endif
 
 	return 0;
+
+err_free_id:
+	mutex_lock(&xef->vm.lock);
+	xa_erase(&xef->vm.xa, id);
+	mutex_unlock(&xef->vm.lock);
+err_close_and_put:
+	xe_vm_close_and_put(vm);
+
+	return err;
 }
 
 int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
-- 
2.34.1

