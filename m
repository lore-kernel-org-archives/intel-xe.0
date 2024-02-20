Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDEFC48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 10:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6871610E035;
	Tue, 20 Feb 2024 10:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qc4WiT2E";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366AC10E332
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 10:44:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a3e6f79e83dso289003666b.2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 02:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708425862; x=1709030662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrCDKSLGBF+EPhPeqLye9+d0pKWdvU78eGSDHzLhgGA=;
 b=Qc4WiT2E7hwKc3XiBPlncbzUq1Y5vXkvpAbZRp3R2e+y1UyM6yWJ85jhm2aERXeCMB
 m25XHjwsqEnWtgGXln8PZYNrzyUk5vIWuUC5Fw7d9UnqUo0ymrKu9Zq6O9Ya2+1tks2k
 LX3iy9Qfjeq0RCKuFiFXEhb1d5WluUQppjYRsI8sxTIysLDFg/kurvWVcGD6zNUsrvfF
 DeyfKaA4r+GAoTxZmLY+2asyl1S2zL9Xe7mmX8WiUqlJoMdLMqRSIm73rQw+fni4Nwk9
 RliWg4xRrH2nDZUG8h1uPsSs5TDKFtNBoG9T5JYw4fXMCYb+YSCQbbfxg617/mbQEtlT
 x3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708425862; x=1709030662;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrCDKSLGBF+EPhPeqLye9+d0pKWdvU78eGSDHzLhgGA=;
 b=Sh/akH7NNrP/5Rpj/hkCGO0GUjFzS0ulGa0hESw1QcCwUfPq76hMLjdRkDQp6UIq1L
 XYo/IsIKORD2JeHzdqLzjPPMavMCg6AKH+dvVe/ndIbXaOjwp56lrEfusCct04+/Zc+B
 +Xj60Qkvc+gfiYVry1D/XWYMfRkibJEqrAsXPVvONcjcfCxupI7UA3MFW9Qxr2IT5WAu
 UgM/QwT2UToOxcdrIhV7BQFtXsYoNpJ3Ss935jr4L02ZqGWeJ1iw3Bp4uC6apkG/WuRa
 2lGrrKzZOHfTiGgiP2xr6xAt089wNy9guKIcdLl/9/Knk6ExjFCwDF2y7r3Va2RV/mue
 yXWw==
X-Gm-Message-State: AOJu0YzeeJZN9V/LyG39KIDwYRcpZVrmWONxdFcPueYCN0RJqiuDpmlM
 NMHJLyDAPiDqiQl+cp5hnCmD2Zj8QHgNVWL2HWdLZv0g4pwJIGtkSyhn4j/REOs=
X-Google-Smtp-Source: AGHT+IGpaDVOBc+qdk3mpfNv5z0zY9/13aoxSNwXvcF5evgl4DyV+P1YWtI0VKYDMzi5kEVUIHqWkw==
X-Received: by 2002:a17:906:288b:b0:a3e:8333:d0b2 with SMTP id
 o11-20020a170906288b00b00a3e8333d0b2mr3042622ejd.23.1708425862415; 
 Tue, 20 Feb 2024 02:44:22 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 un8-20020a170907cb8800b00a3df7003552sm3827729ejc.32.2024.02.20.02.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 02:44:22 -0800 (PST)
Date: Tue, 20 Feb 2024 13:44:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: jose.souza@intel.com
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Set PTE_AE for smem allocations in integrated
 devices
Message-ID: <419dfa52-3702-4834-abe2-6e599779709a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hello José Roberto de Souza,

This is a semi-automatic email about new static checker warnings.

    drivers/gpu/drm/xe/xe_pt.c:616 xe_pt_stage_bind()
    warn: variable dereferenced before check 'vma' (see line 595)

drivers/gpu/drm/xe/xe_pt.c
   594		struct xe_device *xe = tile_to_xe(tile);
   595		struct xe_bo *bo = xe_vma_bo(vma);
                                             ^^^
vma is dereferenced

   596		bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
   597			(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
   598		struct xe_res_cursor curs;
   599		struct xe_pt_stage_bind_walk xe_walk = {
   600			.base = {
   601				.ops = &xe_pt_stage_bind_ops,
   602				.shifts = xe_normal_pt_shifts,
   603				.max_level = XE_PT_HIGHEST_LEVEL,
   604			},
   605			.vm = xe_vma_vm(vma),
   606			.tile = tile,
   607			.curs = &curs,
   608			.va_curs_start = xe_vma_start(vma),
   609			.vma = vma,
   610			.wupd.entries = entries,
   611			.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
   612		};
   613		struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
   614		int ret;
   615	
   616		if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
                    ^^^
The patch adds a check for NULL after we would already have crashed.
Hopefully, the check can be removed.

   617		    (is_devmem || !IS_DGFX(xe)))
   618			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;

regards,
dan carpenter
