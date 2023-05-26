Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD2CC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D03B10E06F;
	Fri, 26 May 2023 12:11:13 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8310E7F3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:11:10 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:10:57 +0200
Message-Id: <20230526121101.1619278-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe: Kill small race with userptr
 invalidation
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

Theoretically, we can hit a small race where we hit an invalidation
after taking the lock in read-mode. In this case, take it in write
mode instead.

I don't think this is really an issue, but more of a robustness thing.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index e44076ee2e11..187108c4be6d 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -256,6 +256,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		/* We don't allow execs while the VM is in error state */
 		err = down_read_interruptible(&vm->lock);
 		write_locked = false;
+
+		/* Userptr invalidation while we were still acquiring lock? */
+		if (!err && !xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
+			up_read(&vm->lock);
+			err = down_write_killable(&vm->lock);
+			write_locked = true;
+		}
 	}
 	if (err)
 		goto err_syncs;
-- 
2.34.1

