Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D59CD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 12:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668E10F0E7;
	Thu,  7 May 2026 12:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hn7i7no8";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FFE10E552
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 18:08:09 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso10189365ad.0
 for <intel-xe@lists.freedesktop.org>; Wed, 06 May 2026 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778090889; x=1778695689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SOFKzq9vyU4IaDOJ+S3dhxhZPfZZAQMLAQILYvOzB5s=;
 b=Hn7i7no8lqQH6fo36a+gMfCs3Wm9zI+G/yH+03hzyz/uPK1tKxpKYsTjZAtCBGLurh
 U9FQV9mjaMGvmDGkAI0OQKCfoC0ZMjTUV2C8pm8CV1m6tq/B3A3dptAP+gSvUp6x+f6+
 fyvbtfJwyzgOby6+9VPv6yUTQ/BHB9U+ifjBp401DtQjjt9SxYno56vYbzWybS/FXXYH
 78DGv6D+C1QT+T9pPA+4QPaEVpK8uzhboG1kqPRE+z4fXl8lSh+NZd6q18MQ1EtJ52f9
 tQdvyykxyKFRBnuccV77O96iizXMK/d12jY2LRDHDkO+siGlNQQSTj2E0iw6vv251Fhi
 p8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778090889; x=1778695689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SOFKzq9vyU4IaDOJ+S3dhxhZPfZZAQMLAQILYvOzB5s=;
 b=dI6R21Obm3WzZTSZd2ukMh1WyBVgDoCcydrt37N9HzjCaApxPIvNjHwnq3evFTGplz
 6CWV9UKuQLYXwrC6x6EO87mCh1A0vy4KRcnucX0zafAC9gv5rjVovM1xVvdotfEd9XtB
 td8WnTstG9TpO/+At+UnhQaTgNzdoEEA0IUfcPTvhEB29OzXKjVIxV6YwTFN9oI8qi/g
 s2c8otHfiuncylu0CJab2YgelAz+fusdFaSmj7PGFvgW7jpApUgrq0/BPHmtHvK2W3Qd
 GmG5L7sq18781g3cJqiTj+LdROX8QKUwhtCBwnJ2etBxw3icWbfYZJgxc7rUNhTzDiWC
 wsxw==
X-Gm-Message-State: AOJu0YwvkW4qAYM7h93eeky1s6j2vAtRQ06pwk9rtL3N7PEGppDeNaNh
 K22hvNAqcqdVvr/XVvuyxvBKbt1DuailLkrObftq/cAlnu5RAKXRovxFnpR3cUQ=
X-Gm-Gg: AeBDietXwJSH7kfuPIGAsv535q8bXbqWo8ZgcEIUgy+3Li2gxLULsLfp4Opq3jy7wr3
 zmckmvh78MLUy4UUpcUGizGTzl06eLVXt6DC9ZFJ0JBiCeEOAK0lmRfReiyuW1rEUuqTR2+M/CV
 uA83zfhmBos6inGbM0iyey1BD4yu7mJjpzAgHxwP5Y2B0ByMoa8hLGfwkFdm3cqEgHh+SGIJ7Jo
 VWo50vHXGXCZzPuGT1VQkG/f5cJ0NbgZilM1lja7Ws+fvwz3SVeUmnXrMxtwGIfqroYALb/LS9g
 vGph1ODO5EzSFekYXkBC1F6ORWiYWhEkmUDGc2qJM/qaiAxK68yLMTQLnfcQOFZBrMREYeTJ3jp
 5CRZnl4fdApZe5aQNt5f1B5ZDpcnM4ehs7MiZ8XpBkoxzRiJsdKqKm5q0Vw04AnRFxDYkwaDfPO
 rGHKAEOdoe4FJ6Gp0YG+fsQ6LI90o6kNEJHP9o6V2grsOziKLkpNB89L1hegitU+U0tdydcvFv4
 20OAXcetDDwinY=
X-Received: by 2002:a17:902:d501:b0:2b0:be79:e521 with SMTP id
 d9443c01a7336-2ba4e5f89e0mr70303685ad.26.1778090888453; 
 Wed, 06 May 2026 11:08:08 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([202.177.225.148])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ba7c038b40sm33581675ad.34.2026.05.06.11.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 11:08:08 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, stable@vger.kernel.org,
 Ramesh Adhikari <adhikari.resume@gmail.com>
Subject: [PATCH] drm/xe: Add bounds check for num_binds to prevent memory
 exhaustion
Date: Wed,  6 May 2026 23:36:36 +0530
Message-ID: <20260506180636.23771-1-adhikari.resume@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 May 2026 12:16:34 +0000
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

bounds checking, allowing arbitrarily large memory allocations. This

follows the same vulnerability pattern that was fixed for num_syncs in

commit 8e461304009d ("drm/xe: Limit num_syncs to prevent huge allocations").

Add DRM_XE_MAX_BINDS (1024) limit and validate num_binds before allocation,

matching the num_syncs fix pattern.

Similar unbounded allocations exist for num_mem_ranges and OA n_regs,

which should be addressed in follow-up patches.

Cc: stable@vger.kernel.org

Signed-off-by: Ramesh <adhikari.resume@gmail.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +++++
 include/uapi/drm/xe_drm.h  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a717a2b8dea..1ff66874f43 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3841,6 +3841,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		return -EINVAL;
 
 	err = vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
+
+	if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
+		err = -EINVAL;
+		goto put_vm;
+	}
 	if (err)
 		goto put_vm;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ae2fda23ce7..804ccb23b11 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1606,6 +1606,7 @@ struct drm_xe_exec {
 	__u32 exec_queue_id;
 
 #define DRM_XE_MAX_SYNCS 1024
+#define DRM_XE_MAX_BINDS 1024
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
 	__u32 num_syncs;
 
-- 
2.43.0

