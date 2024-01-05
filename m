Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD3C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 17:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731710E661;
	Fri,  5 Jan 2024 17:11:05 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB80910E5E3
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 12:20:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e3ab65709so1775625e9.3
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Jan 2024 04:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457226; x=1705062026; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CWCHZKbV0nCInnBBb4G3T1/9XNnm41DOrT+nUORhlYo=;
 b=adlTZbVfcL3xTudjiKCEFL8J2E3hkzsdX97ImIfNO5JCCd6T2O/jJCrliFl2epObDq
 c/lB8xg5y+0PRhN/ijuYZLMdqUhhe65Ngafvb9JkuQH/qIqWzUza+2aRPdj+t5I/Yemq
 bFPMpaSJTcxMotlwzdRIzcmp2+VJrsBj8gUx7uQMcdVSblGfrkqplBk7zVpgdg8pkScI
 dczQvFFQodh7qyPYfh8SZYqM2202PyT+g0Ayez4yVShysqO7dAcNppNfaqFOjUjUqL4c
 Hs13o5S4c1kK3TUrKQmhabkkIDOyUPSsz71ur/UQWGClx5QmNxyWn7GnZZrLxoMjpkE7
 BX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457226; x=1705062026;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CWCHZKbV0nCInnBBb4G3T1/9XNnm41DOrT+nUORhlYo=;
 b=ccLsNDnCmsSyhLykM8JOROjAFDQGHP89QfLWw8RxKbbVprG1//ReaVe+TCu2t/6co8
 yp0dc46JPhTnWfHl/qkSi13Mr2eQSwLwnhIMPKTshQ7ZpZvQLqkWNDCZi6JdttFx9FZ6
 wgsMvsEFBc338fPOsC0sazrmoVd4I5Jnji00ekJ69L7fw06uw3dJly/CV0tnptq1a2Zi
 h46fyNWMzdX2slxd3wkVPYtKofOgo09ESluPltJj0IBm44tHVuee/YxUDGn2oeZnBg4X
 KlUkhhBDgsyUdiSN6R5AbMWPqkxNKaYEKA5m3VM0xFYa7KiOAvWFGNdexun5LVVWmePO
 ly4g==
X-Gm-Message-State: AOJu0Yy2M0Tf+MxIaa65CIn8dSsDjgYrXJNNbl75TcCsPxJ/HTnl2fI7
 8gn35tajqoEPGluGyJ5Es6LovABFe9bsLw==
X-Google-Smtp-Source: AGHT+IEWKVWrdQKSakz2/Ts2zXXX/VWHLXpgdrXQ5rusD+EMlDGmLVQVh6dERCys1XLkof94JDbgvQ==
X-Received: by 2002:a05:600c:3595:b0:40d:8d45:aae4 with SMTP id
 p21-20020a05600c359500b0040d8d45aae4mr1238303wmq.173.1704457226169; 
 Fri, 05 Jan 2024 04:20:26 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b0040b3d8907fesm1420756wmb.29.2024.01.05.04.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:20:25 -0800 (PST)
Date: Fri, 5 Jan 2024 15:20:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
Message-ID: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Fri, 05 Jan 2024 17:11:05 +0000
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
Cc: kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Drop the "&vm->lock" before returning.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9180f2d2d71d..4aa7979fe6bf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -332,13 +332,13 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	down_write(&vm->lock);
 	err = drm_gpuvm_exec_lock(&vm_exec);
 	if (err)
-		return err;
+		goto out_up_write;
 
 	pfence = xe_preempt_fence_create(q, q->compute.context,
 					 ++q->compute.seqno);
 	if (!pfence) {
 		err = -ENOMEM;
-		goto out_unlock;
+		goto out_fini;
 	}
 
 	list_add(&q->compute.link, &vm->preempt.exec_queues);
@@ -361,8 +361,9 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	up_read(&vm->userptr.notifier_lock);
 
-out_unlock:
+out_fini:
 	drm_exec_fini(exec);
+out_up_write:
 	up_write(&vm->lock);
 
 	return err;
-- 
2.42.0

