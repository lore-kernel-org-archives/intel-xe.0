Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30C1CD3445
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 17:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F030A10E304;
	Sat,  9 May 2026 17:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JWUoVr+F";
	dkim-atps=neutral
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2187810E304
 for <intel-xe@lists.freedesktop.org>; Sat,  9 May 2026 17:23:21 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3667cf0136fso1334206a91.2
 for <intel-xe@lists.freedesktop.org>; Sat, 09 May 2026 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778347400; x=1778952200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=79yteFN44OLmqQd7A/WzQJLcbKTG20XFMFZdijxLhxE=;
 b=JWUoVr+FtzOxS4ptVAXGYyRdgLAu8OqOxwWP12qXxyhM181BkOCnduaYO0cgoLs1Yl
 y8CRdVihldm9WKECAUFQqtpIDs90hZ7gWr2/c8+44BnKLLkeQ+tiKm6eJ9gcKqwUkKmm
 fXGO5ACJttCKmAbvt9svw9mmHA8gT1DAXmCKRioIhW52Jji+A1x3CYXJaqXRmF+9MFiX
 2DtkUuFpYXimeYdk6dkhUoNbBiAVjKPPJyG2Ls78YvXQlS3jzlvagMPTMvcEK/QMQXuw
 SOVCaNa1/mLZarzFX027spdEQFsCF5eIUQnuBlvW07kw756brrCNcp+XQvSGxzSde354
 tBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778347400; x=1778952200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=79yteFN44OLmqQd7A/WzQJLcbKTG20XFMFZdijxLhxE=;
 b=gUj2df8VU1bPvZfMvRQVTL0lZNV4lnyHrtoA+CyquE4oeK4xmnNM0wGqXFFKkaympJ
 OAKy7c2a5Ev9UcvYMBvp5ql+mDDX3e4ZbLl98FnE373qGHJ9yxuEJ00Q1g0eBsEIyVbI
 FSgtwHnKvUuf8cUhfZ/TZg2ION/SXXcay25aZTxdTSOsMVgT8fhF/hrR+K7/os6E4NM1
 AmyJgrp73ikfu/haCyH2xJS5y1EOk5qfBrsNlUP8lazj2eBSrPEWc5BoIWZd2i4FvPSV
 zbzniFRS5rHDR0ch40fIRn4nxFBnV42gf79qaQMy9Eed68R0j7PJ0IkLX90vn9wIagGp
 CgCw==
X-Gm-Message-State: AOJu0Yy0gNYf3mLezOtSZM6sj0Xd2JVyfiyzV1UbogbG4RgJlnHbFmho
 XcwYvd+C+i+UNj6zP8hnySf/Ch6797hTA+GdrPV99M831/AqpTc72F55Tr+k3ic=
X-Gm-Gg: Acq92OG6dGbP5abaWcVkAebfTtjeiBb7guJawl0H/0YyH2yJSve3z8fnmlIqZQUlrk6
 gH5fFNxvm+mNDNr2LuI8CGxWYBui7yM5opBaxpDQVr/9hXW2hFUJAz6vRN/haTwanFYHUynHEdW
 dGM0ZHXC2qHzdz+hMIFdUSAetTKKouddUSGbOv8Qn7NBC405i7bqk8gD8isC1/FTbkg1rbZg53z
 bHuJ8Gan9fOQpo7tix9Oe0I+v6HykIVi5Wgx27CR94iZJpLJNhWuFfkeDlt7+niBO8rdQxVFYbC
 hqSy6rHOZGgIgOaunxA0Y+z5zUaPmIO+t6nFWVHnunCUC0HDEzyue4vIAyx3GqsNYwEI7gEWnix
 iDJmTzZyu7TRCkG8MD/P6NQXtrb9mMhTZBmAS4QYV9r5ECIU/nuqLWoZtY9QQq4CLMGZ1lXcxGQ
 Eg3CfpNwO+ucgbpuVqSaECkzzOl3y8T0VJUhi8OsyqxvAyiuUP0SJs187j8PiZLH4xF6PsaYL5J
 98=
X-Received: by 2002:a17:902:e544:b0:2bc:7c62:187 with SMTP id
 d9443c01a7336-2bc7c62085bmr35723455ad.29.1778347400276; 
 Sat, 09 May 2026 10:23:20 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([125.19.217.182])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1d271d1sm56826955ad.11.2026.05.09.10.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 10:23:19 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, stable@vger.kernel.org,
 Ramesh Adhikari <adhikari.resume@gmail.com>
Subject: [PATCH v4] drm/xe: Add bounds check for num_binds to prevent memory
 exhaustion
Date: Sat,  9 May 2026 22:53:09 +0530
Message-ID: <20260509172309.58377-1-adhikari.resume@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The xe_vm_bind_ioctl function accepts user-controlled num_binds without
any bounds checking. This follows the same pattern that was fixed for
num_syncs in commit 8e461304009d ("drm/xe: Limit num_syncs to prevent
huge allocations").

While the main allocations (bind_ops, bos, ops arrays) use __GFP_ACCOUNT,
vm_bind_ioctl_ops_create makes additional allocations in a loop that don't:
  - drm_gpuva_ops (16 bytes) at drm_gpuvm.c:2949
  - xe_vma_op (144 bytes) at xe_vm.c:1318

Both use kzalloc_obj() which defaults to GFP_KERNEL without __GFP_ACCOUNT.

For 268M binds, the loop runs 268M times, allocating 160 bytes per iteration.
That's about 43 GB allocated without cgroup accounting before the code even
hits the main allocation (which will fail due to the 4MB kmalloc limit).

Add DRM_XE_MAX_BINDS (65536) limit, checked before any allocations happen.
At 65536 binds, we're allocating ~10MB in the loop, which is reasonable and
won't force unnecessary fallbacks in userspace.

Return -ENOBUFS instead of -EINVAL so Mesa can retry with smaller batches
if needed.

v4: Increased limit to 65536 (64k) per maintainer feedback, changed error
    to -ENOBUFS for graceful retry
v3: Changed to -ENOBUFS, moved check earlier, added allocation analysis
v2: Increased limit from 1024 to 2048 after Mesa source analysis

Cc: stable@vger.kernel.org
Signed-off-by: Ramesh Adhikari <adhikari.resume@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
 include/uapi/drm/xe_drm.h  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a717a2b8dea..1ab020cbdc1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3840,7 +3840,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !vm))
 		return -EINVAL;
 
+	/* Prevent unbounded allocations in vm_bind_ioctl_ops_create loop */
+	if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
+		err = -ENOBUFS;
+		goto put_vm;
+	}
+
 	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
+
 	if (err)
 		goto put_vm;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ae2fda23ce7..33f23f6638e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1606,6 +1606,7 @@ struct drm_xe_exec {
 	__u32 exec_queue_id;
 
 #define DRM_XE_MAX_SYNCS 1024
+#define DRM_XE_MAX_BINDS 65536
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
 	__u32 num_syncs;
 
-- 
2.43.0

