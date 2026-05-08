Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9358CD484A
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 14:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F3A10E7B5;
	Mon, 11 May 2026 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VByT4egl";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1720010F340
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 06:45:31 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2baca4df358so8965435ad.2
 for <intel-xe@lists.freedesktop.org>; Thu, 07 May 2026 23:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778222730; x=1778827530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2A39dF+p7aFgXp967/D764wgb7uWfzZBjZMIRm9YyxU=;
 b=VByT4eglxBcBZAL10CkkLovFZgbLQKKrNE0nKGgyZiTKYuYUQUj5YlpFTmWC09n6wR
 8jwzgOKOoywKwjsdaK5MPYRsDkPl8GgB6MUVxUefBHHyv/JfOA6fcRzBUgOnOXPMCVyP
 I6VJAQ/Wf+eUoIAUHW8an8B9HD04OJdjGfHsOhPPq6twcH/IyDZOuHJV4mzg3m89bUEl
 5U/deMv1eJpic7CaPEWU9PrUta8UJ+kw1t+3ceSsX+drdCQ8andscWvXc8k6wktyjBio
 dBtn6TJmD/YSc3SqEa/QIOGLer0YRp5Nt0yRF6PL2phHk85nmPmH6g9IutQKgPxVVwPv
 yvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778222730; x=1778827530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2A39dF+p7aFgXp967/D764wgb7uWfzZBjZMIRm9YyxU=;
 b=dYyaB0pwVsf/MjGBS5/v3F/9hil+Qgt8pNiVyndUhoFMGqEQH5ChKfQ3zsgu9rdsjj
 5bGvyboRN8RxyjuZrxsz5+/EGDje8lgNdsSNSlnLvOp7mft4OLoW65TAELAVsRMXNgp2
 mS89zuyHXXyRDv8qakUdic2camwbb063HqoIDB8JONb6ivv8U3GdiHV75v2d8LBzhCvk
 PjDwX6KaXDppslPNyvfVEwORm9seJFNK2zAbJTpZaMLRw28XuLx4UrN6QKd3cE5tVoz/
 iIAYnrzt61tro3e0EfSdswhbQmRExnBCz7bB31ud48NyjvYnrWtlan61NhOleHRDyJuZ
 kVVA==
X-Gm-Message-State: AOJu0Ywl5csqHbJCoYWfLx0TA/FkISRg/9r3WlHAZiYCy2eNdNaVpUo/
 hU6GCaiSL3ATJ7y7k1WEH/Zz/YMh8w0/5+CegR54p2gpPLPhYRpRnb+Z65XhmJg=
X-Gm-Gg: Acq92OE4ewMVhGMaVBY+qGQoeEWZ1mNO3i/EsP48Ho8G90qf58Bl94GACdcLsHiJ0+f
 yCdkBOAmLWai0jJW6fZziTWEh57LeqOWniqnZsFkk8JLtjUXy42FE/pnkwWjYMR2bfG+joERnWh
 +laeQzePOR2hr32Q3XDVk01K+riSXAyR9WVCO7GI0+XZGQRf+5zgrn++YS21QUTecrxsRcRW1L9
 FqjCL94abUGMYASwIZ0eH8Wd9YfF2d+euDSZafnXqzqzoug0lDUV8Xmr/44qSCk6jRhABUpepcM
 VbpKc3UsNgOXVacVNV0dkCnb1Wk5nky1m5c8ZU/fJNjkhNWfL5gOYhCmDuRyTXNbx9RDl3ZF/Q1
 3tL6t6Tv90qAwgks705mhDuyHEoPgevQKKDypIPWCkAcQ0Imx24cYkEL1FkQtLszJsNfvbNcRIq
 WaQ0CX3zSVIImN0JdqfbQWEFfwIKBzs6ncSn6iCbpC0JHjQkLVsXyp1PhcJxKNFTkBBOuf0ht9u
 g2bMSpUt7p8NB8=
X-Received: by 2002:a17:902:7798:b0:2b2:5503:1b8c with SMTP id
 d9443c01a7336-2ba794b7f8fmr79747875ad.11.1778222730082; 
 Thu, 07 May 2026 23:45:30 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([202.177.225.148])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e6199csm13223695ad.55.2026.05.07.23.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 23:45:29 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, stable@vger.kernel.org,
 Ramesh Adhikari <adhikari.resume@gmail.com>
Subject: [PATCH v3] drm/xe: Add bounds check for num_binds to prevent memory
 exhaustion
Date: Fri,  8 May 2026 12:15:10 +0530
Message-ID: <20260508064510.158728-1-adhikari.resume@gmail.com>
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

