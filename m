Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9E6C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11310E1CF;
	Thu, 28 Aug 2025 10:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IOkz4/BP";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538D10E1CF
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:32:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45b7c01a708so1281985e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756377155; x=1756981955; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6VvN6iujvz6Zdit4ZVOU1mxCc3x2dozUKY824sy+u7M=;
 b=IOkz4/BPPa3l5Zm5n2XSq22zm5R97+pcDOVXGmgEoN2Cn/RFmirEUEIQ69LBjs2OFR
 cKzyQ4qqrF/pv4Ck/Uhyr5XLVHEvJ6caPU+M5uO6aAWg/WBuhjq1iiL9fhU44XrUZbUC
 Uy7cvRl5/oj1iHxtHqiVKSqCBYGPfhcaVTxOq9QTsI4srCKlkqBmevPewi3j4mGvL/X7
 jfv2Az9mij4pbR5FNI8/2h8r9XQvZymGgGnfhS/buEKZcf2SCvINs9YTffJ+pG+FE7Pz
 45j0cP8HOmYaEeJ1rihjLov9SCdRL4MMbPguwD/oKWMlWc2eyiqQWblGDIf3eu8gUFkM
 nIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756377155; x=1756981955;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6VvN6iujvz6Zdit4ZVOU1mxCc3x2dozUKY824sy+u7M=;
 b=hLoV1tS9h57KMmPnsozvixJdVhOmP2P2IBs+fBqtb3KCThvpBjQYCD6HOCukWpNHei
 3cKSIT93meniWUnZW7Senwh+7kg57SdtO6Fgp+PQ6snetTOQo+oKaY4xsQP0gbU5RrLA
 UYgd+YopUvzVLrKvwnz9ZWhYjnJ0ZWBz2DObUDHVDNasovg8HD7W+0XWAaZx8xLN5+ve
 TdMThEQhH/qAwt74Up8VSW3c+fkT3YRcd1qulYJ+3VhKWVAPysaPyzu1JWJraUFq1as3
 qToZIH1D+0WmbFSmck+m0OlKTcUGcx+LpVhGR5XV0+g8jeHPO1wRTTvKrh2xVQItbf1Z
 njEw==
X-Gm-Message-State: AOJu0Yxb4xV6vWAVG8fRFFMEwBZvEf+pdWyoEw0pMZ4n6AtpA9/2G+zQ
 2FZpQxmh3Mpe2EEWtaFeyo0R3Ab964e0YjrMzWoWXh9/jMwx5r1m5KVaL3GON96oAH0=
X-Gm-Gg: ASbGncsA1wbxKD1nB+uuNqabsr5kh7+NYHrJf+7JZXJYO/2MbmpvnDMO2ST5U2RvWr7
 vlhLiidk5vxXSRLTRnMM7fyHKB5mnMm5AKhiCicA6wlt4Ixs0K70U/uv5k/N1mj+ZmrZzuCEX12
 vBHC4xWV69nNjyetODjEK8bV8bOJ1bWJRCn3a6QllKXJJECyHUi3XLWFmi9dVHB8F5P+4S1cIH/
 5Upylu/0lwAq3gNR1c58Ls0lc6GeuDIe3Gz2IVmDjGIYuIpp05Prym9jRsMU0HZqCyVZu8l+0+Q
 TxvBD1pg75ZYW4UJzdqKblsqSQyrTVg+zZMzjaYHCKMC3T1a7XGPUIoIgCZ9hSzkq5x/WXk9wJc
 uQSYDRXixcbgbjLw7SfIJ4/9nPJ/upgGY5a8aSw==
X-Google-Smtp-Source: AGHT+IFN97ZxyeaMiVQnklQ52oEHI/2Xr6lNexF61aYc2kwxCj9oOX4LXlyxiyMsxMYwZhXegyYpDw==
X-Received: by 2002:a05:6000:2405:b0:3cb:2049:c743 with SMTP id
 ffacd0b85a97d-3cb2049c948mr7433266f8f.52.1756377154714; 
 Thu, 28 Aug 2025 03:32:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cec4cec894sm18219f8f.9.2025.08.28.03.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 03:32:34 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:32:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Reset VMA attributes to default in SVM garbage
 collector
Message-ID: <aLAwP0xAjMpLLpFm@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Himal Prasad Ghimiray,

Commit a2eb8aec3ebe ("drm/xe: Reset VMA attributes to default in SVM
garbage collector") from Aug 21, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_vm.c:4442 xe_vm_alloc_vma()
	error: uninitialized symbol 'default_pat'.

drivers/gpu/drm/xe/xe_vm.c
    4396 static int xe_vm_alloc_vma(struct xe_vm *vm,
    4397                            struct drm_gpuvm_map_req *map_req,
    4398                            bool is_madvise)
    4399 {
    4400         struct xe_vma_ops vops;
    4401         struct drm_gpuva_ops *ops = NULL;
    4402         struct drm_gpuva_op *__op;
    4403         bool is_cpu_addr_mirror = false;
    4404         bool remap_op = false;
    4405         struct xe_vma_mem_attr tmp_attr;
    4406         u16 default_pat;
    4407         int err;
    4408 
    4409         lockdep_assert_held_write(&vm->lock);
    4410 
    4411         if (is_madvise)
    4412                 ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
    4413         else
    4414                 ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
    4415 
    4416         if (IS_ERR(ops))
    4417                 return PTR_ERR(ops);
    4418 
    4419         if (list_empty(&ops->list)) {
    4420                 err = 0;
    4421                 goto free_ops;
    4422         }
    4423 
    4424         drm_gpuva_for_each_op(__op, ops) {
    4425                 struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
    4426                 struct xe_vma *vma = NULL;
    4427 
    4428                 if (!is_madvise) {
    4429                         if (__op->op == DRM_GPUVA_OP_UNMAP) {
    4430                                 vma = gpuva_to_vma(op->base.unmap.va);
    4431                                 XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
    4432                                 default_pat = vma->attr.default_pat_index;
    4433                         }
    4434 
    4435                         if (__op->op == DRM_GPUVA_OP_REMAP) {
    4436                                 vma = gpuva_to_vma(op->base.remap.unmap->va);
    4437                                 default_pat = vma->attr.default_pat_index;
    4438                         }
    4439 
    4440                         if (__op->op == DRM_GPUVA_OP_MAP) {
    4441                                 op->map.is_cpu_addr_mirror = true;
--> 4442                                 op->map.pat_index = default_pat;

Maybe we *know* the __ops are always in a specifc order so
REMAP and UNMAP come before MAP??

    4443                         }
    4444                 } else {
    4445                         if (__op->op == DRM_GPUVA_OP_REMAP) {
    4446                                 vma = gpuva_to_vma(op->base.remap.unmap->va);
    4447                                 xe_assert(vm->xe, !remap_op);
    4448                                 xe_assert(vm->xe, xe_vma_has_no_bo(vma));
    4449                                 remap_op = true;
    4450 
    4451                                 if (xe_vma_is_cpu_addr_mirror(vma))
    4452                                         is_cpu_addr_mirror = true;
    4453                                 else
    4454                                         is_cpu_addr_mirror = false;
    4455                         }
    4456 
    4457                         if (__op->op == DRM_GPUVA_OP_MAP) {
    4458                                 xe_assert(vm->xe, remap_op);
    4459                                 remap_op = false;
    4460                                 /*
    4461                                  * In case of madvise ops DRM_GPUVA_OP_MAP is
    4462                                  * always after DRM_GPUVA_OP_REMAP, so ensure
    4463                                  * we assign op->map.is_cpu_addr_mirror true
    4464                                  * if REMAP is for xe_vma_is_cpu_addr_mirror vma
    4465                                  */
    4466                                 op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
    4467                         }
    4468                 }
    4469                 print_op(vm->xe, __op);
    4470         }
    4471 
    4472         xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
    4473 
    4474         if (is_madvise)
    4475                 vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
    4476 
    4477         err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
    4478         if (err)
    4479                 goto unwind_ops;
    4480 
    4481         xe_vm_lock(vm, false);
    4482 
    4483         drm_gpuva_for_each_op(__op, ops) {
    4484                 struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
    4485                 struct xe_vma *vma;
    4486 
    4487                 if (__op->op == DRM_GPUVA_OP_UNMAP) {
    4488                         vma = gpuva_to_vma(op->base.unmap.va);
    4489                         /* There should be no unmap for madvise */
    4490                         if (is_madvise)
    4491                                 XE_WARN_ON("UNEXPECTED UNMAP");
    4492 
    4493                         xe_vma_destroy(vma, NULL);
    4494                 } else if (__op->op == DRM_GPUVA_OP_REMAP) {
    4495                         vma = gpuva_to_vma(op->base.remap.unmap->va);
    4496                         /* In case of madvise ops Store attributes for REMAP UNMAPPED
    4497                          * VMA, so they can be assigned to newly MAP created vma.
    4498                          */
    4499                         if (is_madvise)
    4500                                 tmp_attr = vma->attr;
    4501 
    4502                         xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
    4503                 } else if (__op->op == DRM_GPUVA_OP_MAP) {
    4504                         vma = op->map.vma;
    4505                         /* In case of madvise call, MAP will always be follwed by REMAP.
    4506                          * Therefore temp_attr will always have sane values, making it safe to
    4507                          * copy them to new vma.
    4508                          */
    4509                         if (is_madvise)
    4510                                 vma->attr = tmp_attr;
    4511                 }
    4512         }
    4513 
    4514         xe_vm_unlock(vm);
    4515         drm_gpuva_ops_free(&vm->gpuvm, ops);
    4516         return 0;
    4517 
    4518 unwind_ops:
    4519         vm_bind_ioctl_ops_unwind(vm, &ops, 1);
    4520 free_ops:
    4521         drm_gpuva_ops_free(&vm->gpuvm, ops);
    4522         return err;
    4523 }

regards,
dan carpenter
