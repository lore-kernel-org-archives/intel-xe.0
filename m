Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062F7C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 06:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A280810E139;
	Mon,  2 Jun 2025 06:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sMCG3JW6";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DBF10E139
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 06:31:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-450cf2291bbso14026915e9.0
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Jun 2025 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748845888; x=1749450688; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=63ZxHZ2U0UxnfOsPJ5TVYXlam4kwl54w7lSvbobAXnE=;
 b=sMCG3JW6oNBliGEyWC3fXEWo+QDDHudnsJ4U2xQhWyb+WWDt6LE4Jdicb19z0+u6p4
 w9V9Ou2qwRzH1pdya9/vVDaaNeAPGkNXStYyZosyqPAq3yWOXx+olP4mznhB8dsknqgQ
 V+XNB9pZVk1ChhMIiLpWWzA/l5fU6eM37BYXCxMb33Ky8cVcaGyZWRe+m6KPLanzBkxg
 YSWiQMbZkA5ycux7tnel5j93yRGW39CWUfFzADsRb4dSS9x11+l8QjcOl19xiMjnPpFK
 b6JhK/NelCKx7nzdmchWujz6w0ud3MCyF4JwIxb5fGbGuernCJZQR2GwklWLlJ9CjDJ8
 KGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748845888; x=1749450688;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=63ZxHZ2U0UxnfOsPJ5TVYXlam4kwl54w7lSvbobAXnE=;
 b=avx6VYALVBFPDymoTy2Bk2bDEIK7YIf9X1Yo+oBJsxHxhBZa2XFRIvrip8x6wqt0hI
 11madgwYWItGCubvmseoVpNGWGen/ZBMMNKpcz3Uk+pp5MOGfB0yCd5Vwhc8sVu/JQdh
 oqpdTqz8njw0YS0te9vc4kl0scqJp643LGsXM34zwg5HHH/xxoSM/fa+khAkn76UZY1q
 qSN402oTjo/KIMCnLuhbQMJ+6i0qlIFIdkch0z6ZdSiHVVnZvu7ym7WVHouhrly+FJO5
 eQWrqs/5ZxAa609gLmeH8qLVdWTd+8b5pzwNy8U3HkSsBIBagFkcEiME8jEktHpBhgI5
 9ukw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1FzZHCjETk1JhSUbtU2QtA9i6Nb3+bX7v7iSdnYxxB5+SJJebQ9guc87blm4rUP1kP5KDquDY2A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPQviJO1Ap11qIHCr7tA3k13hb93Gd0Fk+G9jvXwMl8hRNsp0U
 vVPquhIx/pwsQhTss33Vc1/5tC+NG2YJIymJvGcSzNY0d1kNnL4OwlbfEqcYNhE5imuaHyJb7C0
 TBa5/
X-Gm-Gg: ASbGncsx2UPtL5FS4/821kQlpNTyw24Qv3xpmHbspWGsedj1ZXonj01c3uOJf5F8pJE
 pvTN6Mf42TZ172serT1V1WBeizq7SdjGypsKoip3/3Vxf25FCG+yD9fwBTnJQTuX0/wl7csIbML
 6QX+U6P0TsGhBxmbHVxit3AtQrvLUAzb//WaOqQRErJW3mjuaA4wotPQHNM+TJEDgGhREKI6ZOe
 EYaYH52bLChJc48qz7pRq76V1nJZRiRLj+evsZqVWc9LZeoVfI8Qia5HKjDYFGr7JcM2QdN9NgA
 Fwfx8+CW9v0gX7JNGxwD4NUIOTg/4+hVXNqRVz6TUoOzuXXY2tH1VM0X/LELANj05RA9KFQaKVo
 3
X-Google-Smtp-Source: AGHT+IEgbUB5OxbY42O0MPSTAaI0bRwcjOZPkIrEdrG+Hk9EtZDYwpk3QV1+IR+72duOmZZMiyuqsQ==
X-Received: by 2002:a05:600c:3b27:b0:450:d00d:d0 with SMTP id
 5b1f17b1804b1-450d6515da1mr89049445e9.19.1748845887937; 
 Sun, 01 Jun 2025 23:31:27 -0700 (PDT)
Received: from localhost ([41.210.143.146])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe73f22sm13524760f8f.43.2025.06.01.23.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 23:31:27 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:31:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase
 of madvise call
Message-ID: <202505300720.uhAJlLnM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
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

Hi Himal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250528-041919
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250527164003.1068118-10-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase of madvise call
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300720.uhAJlLnM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505300720.uhAJlLnM-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:4255 xe_vm_alloc_madvise_vma() warn: variable dereferenced before check 'ops' (see line 4194)

vim +/ops +4255 drivers/gpu/drm/xe/xe_vm.c

524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4175  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4176  {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4177  	struct xe_vma_ops vops;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4178  	struct drm_gpuva_ops *ops = NULL;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4179  	struct drm_gpuva_op *__op;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4180  	bool is_cpu_addr_mirror = false;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4181  	int err;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4182  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4183  	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4184  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4185  	lockdep_assert_held_write(&vm->lock);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4186  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4187  	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4188  	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4189  					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4190  					  NULL, start);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4191  	if (IS_ERR(ops))
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4192  		return PTR_ERR(ops);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4193  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27 @4194  	if (list_empty(&ops->list)) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4195  		err = 0;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4196  		goto free_ops;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4197  	}
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4198  

[ snip ]

524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4252  unwind_ops:
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4253  	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
                                                                                     ^^^^
It might  be nicer to change this...  See below?

524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4254  free_ops:
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27 @4255  	if (ops)
                                                        ^^^^^^^^
This check is unnecessary.

If we applied this diff then it wouldn't look like maybe
vm_bind_ioctl_ops_unwind() frees ops and sets it to NULL?

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5a978da411b0..48723754b0f9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2822,13 +2822,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 }
 
 static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
-				     struct drm_gpuva_ops **ops,
+				     struct drm_gpuva_ops *ops,
 				     int num_ops_list)
 {
 	int i;
 
 	for (i = num_ops_list - 1; i >= 0; --i) {
-		struct drm_gpuva_ops *__ops = ops[i];
+		struct drm_gpuva_ops *__ops = &ops[i];
 		struct drm_gpuva_op *__op;
 
 		if (!__ops)
@@ -3703,7 +3703,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 unwind_ops:
 	if (err && err != -ENODATA)
-		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+		vm_bind_ioctl_ops_unwind(vm, *ops, args->num_binds);
 	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
@@ -3788,7 +3788,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 unwind_ops:
 	if (err && err != -ENODATA)
-		vm_bind_ioctl_ops_unwind(vm, &ops, 1);
+		vm_bind_ioctl_ops_unwind(vm, ops, 1);
 
 	xe_vma_ops_fini(&vops);
 	drm_gpuva_ops_free(&vm->gpuvm, ops);


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

