Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574E7C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 15:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2D210E993;
	Fri, 19 Jan 2024 15:19:32 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5110E883
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 17:32:28 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1705599142; bh=dIMHvpJok7NYULS0Pywpc1+oGxbHmr+1IqjKDlln82c=;
 h=From:To:Cc:Subject:Date:From;
 b=URK9HwtzcwTxWKLJyTjDoMipQRaM7jI66NMTQcDxwI/+OW+1x0R4pVZ/GEvE2tA19
 1p0aHzV+PgGb6RsNVe4pVCsTI6z0PhFLULimE9RUcHJXuoGkKAhOidASzOFy9WEyW9
 XCUyY0wmbhvui+pCR8S3JBI22zIDbzJEBl3269WpgrzK4HSGZ262lwY8QdVxuT1cVe
 6ebWEi2ZgwSvbnA6uezIf3WDJvLeples9fKucDhuj1Z0re22vsszI+o2yaDRMjbJwn
 JaIzJG6dFJsEwgujjmqaurc23Cn5qo+Pb7f9XBgFjAfro95OMLXz1q6MUc6comhhzx
 QQ77nWr87Hv8w==
Received: from mhaimovski-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 40IHWHPr3851661
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Jan 2024 19:32:17 +0200
Received: (from mhaimovski@localhost)
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 40IHWHfR3851660;
 Thu, 18 Jan 2024 19:32:17 +0200
From: Moti Haimovski <mhaimovski@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/vm: bugfix in xe_vm_create_ioctl
Date: Thu, 18 Jan 2024 19:31:55 +0200
Message-Id: <20240118173155.3851635-1-mhaimovski@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Jan 2024 15:19:30 +0000
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

Relates to: FSW-1360 xe_vm_create_ioctl does not free vm id on error.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a7e7a0b24099..8dbe13676a2f 100644
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
+		goto err_exit;
 
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
+			goto free_id;
+
 		vm->usm.asid = asid;
 	}
 
@@ -1888,6 +1884,14 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 #endif
 
 	return 0;
+
+free_id:
+	mutex_lock(&xef->vm.lock);
+	xa_erase(&xef->vm.xa, id);
+	mutex_unlock(&xef->vm.lock);
+err_exit:
+	xe_vm_close_and_put(vm);
+	return err;
 }
 
 int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
-- 
2.34.1

