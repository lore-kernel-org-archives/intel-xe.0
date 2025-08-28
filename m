Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F96CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 14:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AA310E9EF;
	Thu, 28 Aug 2025 14:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RhK6YWzO";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE1010E9EF
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 14:29:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b618e067eso14891555e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756391341; x=1756996141; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1f31cAVAcbV8o7BqD907WaT1ofs6HFrfjO0XMJIlxm0=;
 b=RhK6YWzOcu9NvIMtGMLuBoU1PvhyJzbhnO5/6lGao5Qf+jZU35KljY6eyic6C+vjj6
 w07k5CA6SpZtAqNbINKE7bOc8Opnx4/WuowWHEFFRkzhVXN0qXu6/N1hrYidkaZOJRzD
 4Djuszwq0Gck9ZpSa8v0a2H+aMkgZtScPHKxERD1sLFMZ2pMAI2KnGkClUhHl5LDy3yj
 ak8OhJJf9Md33UaKEK7Ml0wWuhYHTTzAFT/w7X4WH0WsaEtfc9dGAagLpLkil2Nx+3/u
 KZ1u8g5LteaiiMVbEPl+wnvYonZJlfGgyFqV1kToINefbyDFTZ3gPpIKudKzui1YePc4
 SrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756391341; x=1756996141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1f31cAVAcbV8o7BqD907WaT1ofs6HFrfjO0XMJIlxm0=;
 b=K12tRu5kuAdvJKVTPJQRx2i1UDvN1mXKTzl+U/HMarNHqias6NRiHFhAe7XsKtOii1
 7XivooQwhDsffyGQ0UHk1ibNVk69rQBPPcvygVbbcM+e/CJacWqPPFE27zTAv/yUOs+z
 fFZ7CJSAU3NIA84u2YZLeLvO+D0mnQ/BwdafQIMpazVyU1XfxGmcbSOoX9ThiJy1e9Z8
 RQ9uAELKZ8Og9jQZTTIgxCPZaskuK+ZDF12/wS+/MeNXqtXzwq5Pc7fL3AH/bDiuyD7q
 //b1xAcIj4vj8prplUPa523qnZK7vFQ4Kx4hoVBqsxfG8KRgT7SbrXFHzeZ4jEwQJ07I
 fnNg==
X-Gm-Message-State: AOJu0YyPXmPzjsrgCkITNKnWvA/XBsy7SesDSNWIdiWMeHyNapf8oxMT
 7wbtwA14cAoj0GBOTcdqNajauesDeUnsOpQYiZpW2YrZ9WdXKWqjRKYUuc3eHiW36jA=
X-Gm-Gg: ASbGncutOtOAfLjFTE2tAjghveIWWHXE8/loS3fCderkVFLS5/vNgGRzCX/czqvcBRp
 g+eJSlqfil6WAbbvz003ES4gSupBz97KX3LX8E+vIY8MSEscRzK2mTtySJK+2PKU+stVrp/28Zy
 XQzBK0gHqMCVpvF4ZLTlfSAN9yrOUYgU/FGCtQIGVVJMkR1pRH1F7zVWK2MnbJUvSVMpPtRGm+T
 2WT3eE6nIYhQIxTud0QpXNtktVfU9H3GyJcxNyXMSOgXHsY/Ie4Y2kKYD+Yyl5YrQ6E95Wsc0ng
 xEqHZ6uJIgqLdhsFiPM32/iqsecuEmAoHJB17h3s4IZ+EXcpD/AvfjFYOuiiUHCozLDXDSj0hI0
 7v/QYvi3IjlGhB6Bbe1y7CMmeCE0=
X-Google-Smtp-Source: AGHT+IGpvIk+CWvqi2wokhU4y293WrpG6/fX2AQpfJlAOowJ9dAyFAnZ5wknFYdGxXSxOio9YsCkKw==
X-Received: by 2002:a05:600c:601:b0:45b:7d1f:98bd with SMTP id
 5b1f17b1804b1-45b7d1f9ffemr9300225e9.9.1756391341112; 
 Thu, 28 Aug 2025 07:29:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b797bbc37sm37764275e9.6.2025.08.28.07.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 07:29:00 -0700 (PDT)
Date: Thu, 28 Aug 2025 17:28:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [bug report] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Message-ID: <aLBnqXH8fWCuVC9A@stanley.mountain>
References: <aLAwP0xAjMpLLpFm@stanley.mountain>
 <8e37eb4d-eaba-4e28-bda3-52b9a76a6936@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e37eb4d-eaba-4e28-bda3-52b9a76a6936@intel.com>
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

On Thu, Aug 28, 2025 at 04:18:11PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 28-08-2025 16:02, Dan Carpenter wrote:
> > Hello Himal Prasad Ghimiray,
> > 
> > Commit a2eb8aec3ebe ("drm/xe: Reset VMA attributes to default in SVM
> > garbage collector") from Aug 21, 2025 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> > 	drivers/gpu/drm/xe/xe_vm.c:4442 xe_vm_alloc_vma()
> > 	error: uninitialized symbol 'default_pat'.
> > 
> > drivers/gpu/drm/xe/xe_vm.c
> >      4396 static int xe_vm_alloc_vma(struct xe_vm *vm,
> >      4397                            struct drm_gpuvm_map_req *map_req,
> >      4398                            bool is_madvise)
> >      4399 {
> >      4400         struct xe_vma_ops vops;
> >      4401         struct drm_gpuva_ops *ops = NULL;
> >      4402         struct drm_gpuva_op *__op;
> >      4403         bool is_cpu_addr_mirror = false;
> >      4404         bool remap_op = false;
> >      4405         struct xe_vma_mem_attr tmp_attr;
> >      4406         u16 default_pat;
> >      4407         int err;
> >      4408
> >      4409         lockdep_assert_held_write(&vm->lock);
> >      4410
> >      4411         if (is_madvise)
> >      4412                 ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
> >      4413         else
> >      4414                 ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
> >      4415
> >      4416         if (IS_ERR(ops))
> >      4417                 return PTR_ERR(ops);
> >      4418
> >      4419         if (list_empty(&ops->list)) {
> >      4420                 err = 0;
> >      4421                 goto free_ops;
> >      4422         }
> >      4423
> >      4424         drm_gpuva_for_each_op(__op, ops) {
> >      4425                 struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> >      4426                 struct xe_vma *vma = NULL;
> >      4427
> >      4428                 if (!is_madvise) {
> >      4429                         if (__op->op == DRM_GPUVA_OP_UNMAP) {
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> >      4430                                 vma = gpuva_to_vma(op->base.unmap.va);
> >      4431                                 XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> >      4432                                 default_pat = vma->attr.default_pat_index;
> >      4433                         }
> >      4434
> >      4435                         if (__op->op == DRM_GPUVA_OP_REMAP) {
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> >      4436                                 vma = gpuva_to_vma(op->base.remap.unmap->va);
> >      4437                                 default_pat = vma->attr.default_pat_index;
> >      4438                         }
> >      4439
> >      4440                         if (__op->op == DRM_GPUVA_OP_MAP) {
> >      4441                                 op->map.is_cpu_addr_mirror = true;
> > --> 4442                                 op->map.pat_index = default_pat;
> > 
> > Maybe we *know* the __ops are always in a specifc order so
> > REMAP and UNMAP come before MAP??
> 
> True MAP is always follwed by REMAP.

s/followed by/preceeded by/...  For this to avoid an uninitialized
variable bug we first have to process the UNMAP or REMAP before we
process the MAP.  The more I look at this the  more if feels like a
bug, but okay...

regards,
dan carpenter

