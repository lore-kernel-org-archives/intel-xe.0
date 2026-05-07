Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C22DCD4851
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 14:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404E510E7C4;
	Mon, 11 May 2026 14:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qwGtatM+";
	dkim-atps=neutral
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4764910F1AB
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 14:58:46 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-364f7c42c62so794569a91.0
 for <intel-xe@lists.freedesktop.org>; Thu, 07 May 2026 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778165925; x=1778770725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2A39dF+p7aFgXp967/D764wgb7uWfzZBjZMIRm9YyxU=;
 b=qwGtatM+EoWHOylvE//9BnPVv0/CNwHYtDe2GhPndaBSjwvXNnO8uQffW//OxdLVTE
 lxsKgfPppDshkN59LC2FiYJIStqDIXSHNm4iC348WuS0Rg8mcZN2N6cY3B9gbWOJO9QV
 sy7isFsGiROCtTqDTpBQclYRbFOKNkkykV2ZWj2+sQhwljp4NVuc3oOInBF1rBVyQQbM
 qEyu+kbU/4ZW6KWF7XnLeXp+9bZ3kj/+JHz3gwOlS3YWxOkN10Ykp286QgNo6sn/N2Xu
 XzX7CGe8jPLuG7MvhCi8EtbpTJscsXWVIlyIHlGi28+LkrGsnjaOdwcdniRgzw42DfON
 qRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778165925; x=1778770725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2A39dF+p7aFgXp967/D764wgb7uWfzZBjZMIRm9YyxU=;
 b=R2XEJSshkqLo6ZNYB4C7AB5Q/JoMXrTfmKH/7eV4yPKpHOmZ2tpFPlDReRXCCKHese
 OSI5piyD7cyLYC183vt6k+0FkYJpGgA8x68L58+7sCIasJvsOb3xy/kQRuNhWtmeaaEx
 FqD5GzuMOdHyBwi6mRUwmLXosG1JV9h+6jQ5M/x8tgFzNliKCfJ+UqtW8V7oXiRVAcjX
 foa3ZEodAFuLSi+hIJrWcPIwxADP5nnZItmkDU2CmBvrOfvrsQ3lYD/I1PbXgue3qQPg
 8BxVlgx4iPIUqbMi8dy3J/ftPQTMWv5oZ3y8BZdPJKg6x3qkpOxSlF6SVSYFagMFrOdQ
 etTQ==
X-Gm-Message-State: AOJu0Yy0i+Upk58mz1AVhTGl5i/TGKbR7vzK1cD10Ggfi12pxUF2efo3
 xc/BBmyA+Xq38/jX3od0lye/LbEmR7vzn6RxDpK0XgcWJNte9zf76w9fjB6lT+U=
X-Gm-Gg: AeBDietNkFgtKDWRP6Up9DU9zWJfiaX+IjWrXQCRuOZc7QkFe7H3cTLSd6cD8K2/p5x
 NtJTaKgnDVzZj+O+Ol4J7HPu29KBXUXtSkmSXUYkjwO958rPxVScVMWSuRqal11t9Wa2Y7cxsfT
 AK89PDq+Aaw20yzYTWMQtIWMDm7lQOejHZ/k6vuxEyBNQvbP820lXuVeNaJko7yv0mEk0pIovd7
 BwERJE6SYH420qH0/cK5qu/sQU8wRODuM8dA+OiGer77bVYWmPqKBoruyggFX0HT+je6zze9hCh
 SAemAQHo7zkIU0RC7ivVqeOI9xFuNWRYdA+soEWEVW0popVsxfMuBIdAWv6w4t+S6J0FzI6rF+i
 zToyG5+WwLjOksOc/LWRB3wExDmpkehNSQ46FZtT/QFb8b/Pu/mcvvv88GJWoybH46dELhhTdhC
 DH0Go8phWQZpKpw+vZQNiK3QtKpCgeKmS1Is9ei9z/4fBzpZylNTKvQjGX8Zc16G0OXKtGcNEL/
 29i7UAAhG1c
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cab3 with SMTP id
 d9443c01a7336-2babe5fccc8mr31855355ad.3.1778165925281; 
 Thu, 07 May 2026 07:58:45 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([137.59.92.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bae752d027sm3775ad.4.2026.05.07.07.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 07:58:44 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, stable@vger.kernel.org,
 Ramesh Adhikari <adhikari.resume@gmail.com>
Subject: [PATCH v3] drm/xe: Add bounds check for num_binds to prevent memory
 exhaustion
Date: Thu,  7 May 2026 20:28:07 +0530
Message-ID: <20260507145807.140317-1-adhikari.resume@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 May 2026 14:41:03 +0000
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

The xe_vm_bind_ioctl function accepts user-controlled num_binds without
any bounds checking. I noticed this follows the same pattern that was
fixed for num_syncs in commit 8e461304009d.

While the main allocations (bind_ops, bos, ops arrays) use __GFP_ACCOUNT,
I found that vm_bind_ioctl_ops_create makes additional allocations in a
loop that don't:

  - drm_gpuva_ops (16 bytes) at drm_gpuvm.c:2949
  - xe_vma_op (144 bytes) at xe_vm.c:1318

Both use kzalloc_obj() which defaults to GFP_KERNEL without __GFP_ACCOUNT.

I traced through what happens with a large num_binds value. For 268M binds,
the loop at line 3971 runs 268M times, allocating 160 bytes per iteration.
That's about 43 GB allocated without cgroup accounting before the code even
hits the main allocation at line 4009 (which will fail because it exceeds
the 4MB kmalloc limit). So even though the big allocation fails, the damage
from the loop allocations already happened.

I'm adding a limit of 2048 binds, checked before any allocations happen.
I found that Mesa uses at most 960 binds in conformance tests (from commit
ba6bbdc291), so 2048 gives about 2x headroom. At 2048 binds, we're only
allocating 320KB in the loop, which seems reasonable.

I'm using -ENOBUFS instead of -EINVAL so Mesa can retry with smaller
batches if needed, as Thomas suggested.

A note on my methodology: I don't have Xe hardware, so this is based on
reading through the code and tracing the allocation paths. I verified the
struct sizes and followed the call chains manually. If I got something
wrong or missed something, please let me know - this is my first kernel
patch and I'm still learning.

v3: Changed to -ENOBUFS, moved the check earlier, added more details
    about the allocations I found

v2: Bumped limit from 1024 to 2048 after looking at Mesa usage

Cc: stable@vger.kernel.org
Signed-off-by: Ramesh Adhikari <adhikari.resume@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ff66874f43..1ab020cbdc1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3840,12 +3840,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !vm))
 		return -EINVAL;
 
-	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
-
+	/* Prevent unbounded allocations in vm_bind_ioctl_ops_create loop */
 	if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
-		err = -EINVAL;
+		err = -ENOBUFS;
 		goto put_vm;
 	}
+
+	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
+
 	if (err)
 		goto put_vm;
 
-- 
2.43.0

