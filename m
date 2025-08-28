Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2190C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537EF10E1D1;
	Thu, 28 Aug 2025 10:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G2Z39o3c";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25D10E1D1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:30:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45a1b0cbbbaso6617345e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 03:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756377006; x=1756981806; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dvmomq2qE/to7fR+0xj6i+gEBVrIyXs8j/89zJ6lfTQ=;
 b=G2Z39o3cPLbrVZFqW8mBqPc5DjPR5r0MN/lxrB77R+esGLqdIfuTbF5nnWSgcjjTN3
 3N07kG2Qse+4hWcX6SzWNjIcdw9OQ7B/ONqFq6Q0JXbj7TZDpJlT+SoW9DgTYbjbHOPY
 w0+/riKdfeI9OAD3Y+nV3MQ0fyo2I2Le5fFGXRXCV03S6wR6MGqrhz2egBxOq8Ua3XBj
 aBQBDi+OWrErSUVdSGqg4DSi7P/q/EyTlIY7wLX0MJytE6EMWFgVIHB3S43RC5NDLO6h
 CwCxmLmbFFOA8pP3Z6RAFhsFmIYvu9i+Ikb5RaDuPYI+rHnXax0rgiNQTDDF5i3arrNY
 Sh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756377006; x=1756981806;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dvmomq2qE/to7fR+0xj6i+gEBVrIyXs8j/89zJ6lfTQ=;
 b=eof/+SYogX6YmzTw0dlP0yLUELgBNJkDtARq1y/EKAYMORkzvP/0Avjg+WpJYnksIb
 OSSNNmWVr2YvQnW/FmzvJUX6AYS9qeY/2z2exlanCB2rrFG1b3isJ9G3ixht/rAUjeL2
 eu6XsdmbkWD2hRo07Ha8jXmIktz3/ZDfUzYZknSJ/6tOqjNcsQ/lE1oRd7J5d2SHBQQ8
 k93wmkDT11uw+gzO10ozhbKcIFYl/g12TIxKlrXuAx8ostc5g1jBOsowU1vMhGVFe3R2
 KB11gR3/JgK73qep4w0joNT7YVYEv5gbKAIBKgkEdyYJdpkCoo01vDOTaqEbvyOsPf9s
 lzLQ==
X-Gm-Message-State: AOJu0YxLPUNhT3hzECQIuuBVEdDMvopBsSJttI0n4eAB3kIRDd+PgzHK
 wYuEB6oU7JUaA9HcdYebIJs2D/K7bQj2yfQcug42h3BbM7TBFzjFVvMwd0p5aZhCMJw=
X-Gm-Gg: ASbGncscV52LxpELWt5uaXj+Qd7IOba9oFAA8W0US9xJB9lwNWcqbTj7o/PoeLEeB93
 ywQqEs+cnHqTvE+jOkSjxn9IPzVkOGa3WfmBYRHye2XbHb0XWEm6Wi5AdQhYvt7I7WaFcqOZz6r
 MRQ0NUZa9dZI4dvbVqdHdaMVAkQZGNF85OoMwAnF8W27g5Z6Fkv408mJvvwLjw4X0tlXCVtJpxu
 XI8e1E3LVY/LYnaMYblg+QxSFGg4bgb7VcPMKDV33CBPEc+CTUOs24DYAcJ7peeLXekP1uINi1+
 yrEkaAsW1LHjwxPXHtm8YPpWBXBS/mAtvpmLnhvj56xqGqmaASr7mYrf8Gdyol0lDcT3dkmhnQt
 omp3sqXyRj6poOVccFRW+8ZyrPQVq3nLFnzAMwQ==
X-Google-Smtp-Source: AGHT+IG/Fi0zhu3NCaUore8NGcCcY/Svh64UCQAO99HmPbI/DdiihvOo86vLGFOMiL6EIWQq8PExEg==
X-Received: by 2002:a05:600c:b8d:b0:45b:725e:6ac7 with SMTP id
 5b1f17b1804b1-45b72e505aamr43870195e9.19.1756377006257; 
 Thu, 28 Aug 2025 03:30:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cde21c4867sm2621680f8f.11.2025.08.28.03.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 03:30:05 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:30:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/svm: Consult madvise preferred location in
 prefetch
Message-ID: <aLAvqguScFljSZaW@stanley.mountain>
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

Commit c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location
in prefetch") from Aug 21, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/xe/xe_vm.c:3175 op_lock_and_prep()
	error: uninitialized symbol 'region'.

drivers/gpu/drm/xe/xe_vm.c
    3125 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
    3126                             struct xe_vma_op *op)
    3127 {
    3128         int err = 0;
    3129 
    3130         switch (op->base.op) {
    3131         case DRM_GPUVA_OP_MAP:
    3132                 if (!op->map.invalidate_on_bind)
    3133                         err = vma_lock_and_validate(exec, op->map.vma,
    3134                                                     !xe_vm_in_fault_mode(vm) ||
    3135                                                     op->map.immediate);
    3136                 break;
    3137         case DRM_GPUVA_OP_REMAP:
    3138                 err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
    3139                 if (err)
    3140                         break;
    3141 
    3142                 err = vma_lock_and_validate(exec,
    3143                                             gpuva_to_vma(op->base.remap.unmap->va),
    3144                                             false);
    3145                 if (!err && op->remap.prev)
    3146                         err = vma_lock_and_validate(exec, op->remap.prev, true);
    3147                 if (!err && op->remap.next)
    3148                         err = vma_lock_and_validate(exec, op->remap.next, true);
    3149                 break;
    3150         case DRM_GPUVA_OP_UNMAP:
    3151                 err = check_ufence(gpuva_to_vma(op->base.unmap.va));
    3152                 if (err)
    3153                         break;
    3154 
    3155                 err = vma_lock_and_validate(exec,
    3156                                             gpuva_to_vma(op->base.unmap.va),
    3157                                             false);
    3158                 break;
    3159         case DRM_GPUVA_OP_PREFETCH:
    3160         {
    3161                 struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
    3162                 u32 region;
    3163 
    3164                 if (!xe_vma_is_cpu_addr_mirror(vma)) {
    3165                         region = op->prefetch.region;
    3166                         xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
    3167                                   region <= ARRAY_SIZE(region_to_mem_type));
    3168                 }

region used to be initialized on the else path as well, but now it's not.

    3169 
    3170                 err = vma_lock_and_validate(exec,
    3171                                             gpuva_to_vma(op->base.prefetch.va),
    3172                                             false);
    3173                 if (!err && !xe_vma_has_no_bo(vma))
    3174                         err = xe_bo_migrate(xe_vma_bo(vma),
--> 3175                                             region_to_mem_type[region]);
    3176                 break;
    3177         }
    3178         default:
    3179                 drm_warn(&vm->xe->drm, "NOT POSSIBLE");
    3180         }
    3181 
    3182         return err;
    3183 }

regards,
dan carpenter
