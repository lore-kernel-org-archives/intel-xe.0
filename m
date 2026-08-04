Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35613C55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 05:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715A10E0E8;
	Tue,  4 Aug 2026 05:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hEOvqSwh";
	dkim-atps=neutral
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621E610E0E8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 05:36:29 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-cbb662575d3so2319884a12.0
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Aug 2026 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785821789; x=1786426589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+hkRY/ltFYYzhEs+YCfW2ElzdqnJr+KjWc3ylW6/ZoA=;
 b=hEOvqSwhZQdNlEBS4cXDMEuwzgdgHGzMrUt1jvlj/fcVdXo+N+xtBPtgIdIoP5PNMJ
 GfqkcFGJgr/Fdk5VNCvgUvAYvUL12igKJoivqL1nBrAljFUDvnrNmgkh87GX0r2phunA
 JIXpDwi7znRxcjx3NwvU/WVuf2afkb4kBo9tfEYC7C50xbQ2eaZL36CcYqjX4+IgROL4
 HQKBOjyZ2ENh77CFa77+FzoTRURB8zGDaRbQC8pQu8xVlxt47SSCuW5lbbBlZTj9giyz
 b/cn2B3ixGXOiYi28FrDPPwOxQS9LmxxCoK18aQWHHe0PCADV9EN2hOSf46D4tzVLFob
 +U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785821789; x=1786426589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+hkRY/ltFYYzhEs+YCfW2ElzdqnJr+KjWc3ylW6/ZoA=;
 b=ftzqn0LOvQfXkk0x7HL7pm/wP1f78Z5FzVnpebY4wGhdlNvBDeQ/EWxU2jwW4CLnLW
 QYbPPNz2anh2GDMiNp3sT2WukaLfr8X4HZ6sypuVkaf3yluoJtAMIvQ42kRkFRORovrV
 2Tps9MapQD+JnC0cQEzfzWgILgj8H7yI3Nn94gG5rrcvzY6uZZN8x14qp1hWwfWhQBLM
 sSutZOXy+CZEqritBqHvRYNMfzVqqsH9nfKJW3YpaJwK0qS3YpldBnypzbZ6ds0orYen
 Z8RqiIW62uEC5AmxxwyZMzFy3dvSJvPhxVL8G3jZ/9ZpwD/sO5LXdhdnllX6LSRzTzDA
 SL2g==
X-Gm-Message-State: AOJu0YzEQ081CfiFyLmsHv1mTSK1Y6m/5n8eaM7Jv2+IGXHNpw35YaM9
 64grnjrvzwvppHOSrNk38VdvbegbGEtMYESvL+Ag/BJc+er5ZHG3NUGI79K35tsAuw==
X-Gm-Gg: AR+sD11nzNIDK7lp4k5cfTmAFdWIHX/7xiZMloe3xoNQcJ127L6fFm3X4gbKEm6PKCB
 qe/dz9OvcPznIIZIhTA2x3nTPYXLbnfv3q8R4OAtghvUXe91pE7ERHLIrp8rGsADcn9kln0zU0v
 I1yEe1YQeDuNF2D17TdHCDWTYsXEDwGchMJik5wKwpdqP5CBXuhzm/Rwoc5T3PVJ9cpoPUt7A1l
 HRMGEMb3WsNR+Sd1e4P6Ds6vtLS+BKFSNmrEstRp6ML3EuHFvmNdBb1LLc1R16wrjXQxiexaaSE
 DnsXgJLOip/9QU0cIaNa+LN6Ig2Bgs8BtPJznT4tN40Z1F5tXtLGwiU1wHX4msgBIdsUlRNsGHL
 XT7w6U3dXYL54SmcjtGZLhvtC7nZREbejC6A6UR0gzJerumafD8rIl715D1nd8Ih1HdUUHii0JN
 s5qnXzDeuWinu+c0Xfy69F6V1XMV9U7EdnDEljtGUCrbN2D8+dt++QyJF72Ipp/wSE6yl7UBCgE
 mDOyjA91CA/TYVRTiPtlXff21fFlWRHKOnnFl83
X-Received: by 2002:a05:6a21:a8f:b0:3bd:4698:e7c4 with SMTP id
 adf61e73a8af0-3c92a9c08a5mr12412321637.42.1785821788716; 
 Mon, 03 Aug 2026 22:36:28 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([58.146.106.116])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3153e04491dsm59639975eec.16.2026.08.03.22.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 22:36:28 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, stable@vger.kernel.org,
 Ramesh Adhikari <adhikari.resume@gmail.com>
Subject: [PATCH v5] drm/xe: Add bounds check for num_binds to prevent memory
 exhaustion
Date: Tue,  4 Aug 2026 11:06:00 +0530
Message-ID: <20260804053601.58437-1-adhikari.resume@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506180636.23771-1-adhikari.resume@gmail.com>
References: <20260506180636.23771-1-adhikari.resume@gmail.com>
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

Note on v3/v4: I sent v3 twice (2026-05-07, 2026-05-08) and v4
(2026-05-09) addressing the feedback below, but none of them appear to
have reached the list or Patchwork - likely a subscription/moderation
issue on my end that should now be resolved. Resending the same content
as v5 in case v3/v4 never arrived:

  v4: 20260509172309.58377-1-adhikari.resume@gmail.com (2026-05-09)
  v3: 20260508064510.158728-1-adhikari.resume@gmail.com (2026-05-08)
  v3: (resend, 2026-05-07, same content)

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

+    /* Prevent unbounded allocations in vm_bind_ioctl_ops_create loop */
+    if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
+        err = -ENOBUFS;
+        goto put_vm;
+    }
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
