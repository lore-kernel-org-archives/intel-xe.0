Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F0DC47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 14:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF8010F089;
	Mon, 22 Jan 2024 14:33:17 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFAD10EC91
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 10:24:46 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1705919074; bh=RG3xGY2VsnJP2Ec3t2CjkIfWkNWGKgv5RRgCK42zVvM=;
 h=From:To:Cc:Subject:Date:From;
 b=Vra/PsVP8B6DuVj7Ro9PrGu483JFWeSaLeWI1hMasdQkpr7DAPKngFDTSykX8LL/U
 mQtAD+gDUb/AitKbsoS2qwkpfJJZSweCNtPuxKPgawwKTnhQ3SE/CY4jFDNf7CzgzA
 3al7KSaL0u3v3YJEe3tqzUMCHgYdOzZquufAaiBC9lh3SzsXabzxX2NHs4Z81/07PL
 5Dlx46VxBktNT27KqSk8+nm1vVEklXuMikHrHMr3kdpf7SHvymV8uZJSMP8DC8QQmf
 zms/KlDgoc+ISISor7VDKBJ9Y6EqSQI+OzCuExub81tisA6Ms8+qasbi3tdkeH/KMF
 6Qo3vOlbPflXw==
Received: from mhaimovski-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 40MAOTw84008115
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 22 Jan 2024 12:24:29 +0200
Received: (from mhaimovski@localhost)
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 40MAOTYN4008114;
 Mon, 22 Jan 2024 12:24:29 +0200
From: Moti Haimovski <mhaimovski@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe/vm: bugfix in xe_vm_create_ioctl
Date: Mon, 22 Jan 2024 12:24:24 +0200
Message-Id: <20240122102424.4008095-1-mhaimovski@habana.ai>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix xe_vm_create_ioctl routine not freeing the vm-id allocated to it
when the function fails.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

---
Changes in v3:
- Added "Fixes" to commit message. (Matthew B)
- Added "Reviewed-by: Matthew Brost". (Matthew B)

Changes in v2:
- Removed internal ticket info from commit message. (Lucas, Tomer)
- Modified the name of the goto error labels in xe_vm_create_ioctl
  according the review suggestions. (Tomer T)
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

