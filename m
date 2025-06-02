Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D386C54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 06:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C071410E139;
	Mon,  2 Jun 2025 06:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NHf8x5dx";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2D910E139
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 06:19:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-450cfb6a794so22731185e9.1
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Jun 2025 23:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748845160; x=1749449960; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IT5vqvwOspSDiBmBFrL1UB2oNCzpkkPcbBj98IhrcSA=;
 b=NHf8x5dxDNUBEG0ipfxkxkr3KoctKE1n2TjxT+P48knm8rGgny6SntBkYmvwYPOM6L
 5cEf3hiD0Tjh07Gw1dDpeCT0BH5DGWvSQEVutjzoLyYyr7KFDgk4uMyxvyhcmWc+rBcr
 dAZypJKMTQTBC5Bh+XLPqhI/QiJwibBQgQhXA6qso3iAF2x7KsFiwjHSfuSF4Qx+2JoS
 lyq7Lml8bT7Lp3gkqgcHkgbfW020EBQiR/e4G3RMgeySa3YKr9APvINHh+TMlDkfUUdE
 Qo/aajxhear/tKPWPNqb+q1bnvC9LTW8Qo/4cwp0KjwYGhd3+NRLmYdG74mlgSkEMmW3
 DsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748845160; x=1749449960;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IT5vqvwOspSDiBmBFrL1UB2oNCzpkkPcbBj98IhrcSA=;
 b=qK6msKgw8oCrYB/dT53szkwAtn2rUmxpjR+Fnpp43bQvb0saigS42I9CVY/5o3WOSI
 lP6ObwjcBFYtkh1TPd1VCe6mbZSNQdDZVbfcXK6XZbQ3bzH1GdvMMQrzigzTeDZ3YyHH
 BHnrRB1GtWML5KpRoFcyyQVYXIbmlX2g8ovSXdtBVsqKsIwgJj6EorUL+ztoQkGU8F7D
 6dscF8jWW1e1f1AWRISct6yUheyHQnuGJm+JSsS5EtDkaYrXukJ7ROdCDHKWtuZVKhVA
 QSSt4JERzOW5d+qAXDSS/xPa7Ocn1eburwqrfSyttMArugdWmtwu6W6TogRF++se9Nsc
 PGnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu0YTgaaQOXZGiZMhin0Bo9DSeOJzT4TwdV2ioJH91IiMyczOng6AV7ZigRu49oS0M4Ja8sy8fZg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp3aPJl1yf1XlXuQ2AMussP/DHY4hQQdpmV1EnG90KKv6Xm8RB
 2vODTMUUBtgw0teksCuMP+ubDh+f5vvHCzJIPwTj+AtZ8nXjd+mZYdcJtIFRD14S7UA=
X-Gm-Gg: ASbGnctkijUTfc/UsmGcrUU5syi6IWjfl85bwwHw6dqub4mGSwabvtPyyIGi4oB252T
 9dY6PBNiwzE+F8NNxL76dm2xDFFvjMhpvZmI7NXJZ++JvnhtUmZt/JTalQDtb0N6skbj7iaKnlp
 xEUbMLWb+ESb0FH56rqLeiuRkT0i4FMMOV6nluKrehp+266nXFat1ZptW+fW7zW0Dk2ZRy+S8xF
 ASIcGkQrX122VMsaxMFot+UH67ntfeg+mF1hNIizWjFPCQljPyHS8dc8m8WTh1BOyPfsw5ecGyM
 cAJ8FM5pWQj4Ak7CM5ZzDoiS4a4MqdAkvBALhdiMjb7N0+4JWbZKet4=
X-Google-Smtp-Source: AGHT+IFUJ26+dlg55xw3hspSgcyX/wWZSVOWg45+KpmdVFhcuhM9vFylL6S1uqLEhcd1ZwyWpfYFCg==
X-Received: by 2002:a05:600c:4688:b0:44a:ac77:26d5 with SMTP id
 5b1f17b1804b1-450d64fedb2mr112371855e9.14.1748845160283; 
 Sun, 01 Jun 2025 23:19:20 -0700 (PDT)
Received: from localhost ([41.210.143.146])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4f00972c1sm13837801f8f.68.2025.06.01.23.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 23:19:19 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:19:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 05/19] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <202505300251.vkfxetWu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527164003.1068118-6-himal.prasad.ghimiray@intel.com>
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
patch link:    https://lore.kernel.org/r/20250527164003.1068118-6-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 05/19] drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300251.vkfxetWu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505300251.vkfxetWu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2492 new_vma() error: 'vma' dereferencing possible ERR_PTR()

vim +/vma +2492 drivers/gpu/drm/xe/xe_vm.c

b06d47be7c83165 Matthew Brost         2023-07-07  2444  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2445  			      struct xe_vma_mem_attr attr, unsigned int flags)
b06d47be7c83165 Matthew Brost         2023-07-07  2446  {
b06d47be7c83165 Matthew Brost         2023-07-07  2447  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
24f947d58fe554c Thomas Hellström      2023-12-12  2448  	struct drm_exec exec;
b06d47be7c83165 Matthew Brost         2023-07-07  2449  	struct xe_vma *vma;
33991ae8f40a824 Matthew Brost         2024-06-17  2450  	int err = 0;
b06d47be7c83165 Matthew Brost         2023-07-07  2451  
b06d47be7c83165 Matthew Brost         2023-07-07  2452  	lockdep_assert_held_write(&vm->lock);
b06d47be7c83165 Matthew Brost         2023-07-07  2453  
b06d47be7c83165 Matthew Brost         2023-07-07  2454  	if (bo) {
d2197029026021e Dave Airlie           2023-12-22  2455  		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
24f947d58fe554c Thomas Hellström      2023-12-12  2456  		drm_exec_until_all_locked(&exec) {
24f947d58fe554c Thomas Hellström      2023-12-12  2457  			err = 0;
24f947d58fe554c Thomas Hellström      2023-12-12  2458  			if (!bo->vm) {
24f947d58fe554c Thomas Hellström      2023-12-12  2459  				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
24f947d58fe554c Thomas Hellström      2023-12-12  2460  				drm_exec_retry_on_contention(&exec);
24f947d58fe554c Thomas Hellström      2023-12-12  2461  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2462  			if (!err) {
24f947d58fe554c Thomas Hellström      2023-12-12  2463  				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
24f947d58fe554c Thomas Hellström      2023-12-12  2464  				drm_exec_retry_on_contention(&exec);
24f947d58fe554c Thomas Hellström      2023-12-12  2465  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2466  			if (err) {
24f947d58fe554c Thomas Hellström      2023-12-12  2467  				drm_exec_fini(&exec);
b06d47be7c83165 Matthew Brost         2023-07-07  2468  				return ERR_PTR(err);
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2469  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2470  		}
24f947d58fe554c Thomas Hellström      2023-12-12  2471  	}
b06d47be7c83165 Matthew Brost         2023-07-07  2472  	vma = xe_vma_create(vm, bo, op->gem.offset,
b06d47be7c83165 Matthew Brost         2023-07-07  2473  			    op->va.addr, op->va.addr +
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2474  			    op->va.range - 1, attr.pat_index, flags);
33991ae8f40a824 Matthew Brost         2024-06-17  2475  	if (IS_ERR(vma))
33991ae8f40a824 Matthew Brost         2024-06-17  2476  		goto err_unlock;

Missing "err = PTR_ERR(vma);"

dd08ebf6c3525a7 Matthew Brost         2023-03-30  2477  
33991ae8f40a824 Matthew Brost         2024-06-17  2478  	if (xe_vma_is_userptr(vma))
5bd24e78829ad56 Thomas Hellström      2024-01-31  2479  		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
33991ae8f40a824 Matthew Brost         2024-06-17  2480  	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
b06d47be7c83165 Matthew Brost         2023-07-07  2481  		err = add_preempt_fences(vm, bo);
33991ae8f40a824 Matthew Brost         2024-06-17  2482  
33991ae8f40a824 Matthew Brost         2024-06-17  2483  err_unlock:
33991ae8f40a824 Matthew Brost         2024-06-17  2484  	if (bo)
33991ae8f40a824 Matthew Brost         2024-06-17  2485  		drm_exec_fini(&exec);
33991ae8f40a824 Matthew Brost         2024-06-17  2486  
b06d47be7c83165 Matthew Brost         2023-07-07  2487  	if (err) {
b06d47be7c83165 Matthew Brost         2023-07-07  2488  		prep_vma_destroy(vm, vma, false);
b06d47be7c83165 Matthew Brost         2023-07-07  2489  		xe_vma_destroy_unlocked(vma);
33991ae8f40a824 Matthew Brost         2024-06-17  2490  		vma = ERR_PTR(err);
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2491  	} else {
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27 @2492  		cp_vma_mem_attr(&vma->attr, &attr);
                                                                                        ^^^^
leads to error pointer dereference.

dd08ebf6c3525a7 Matthew Brost         2023-03-30  2493  	}
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2494  
b06d47be7c83165 Matthew Brost         2023-07-07  2495  	return vma;

I was wondering why Smatch doesn't catch the missing error code but
actually we return the error code...  #ABitConfusing

b06d47be7c83165 Matthew Brost         2023-07-07  2496  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

