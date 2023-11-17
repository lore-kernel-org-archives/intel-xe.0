Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7613C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 10:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8810C10E73D;
	Fri, 17 Nov 2023 10:12:17 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397BD10E73D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 10:12:16 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so22440581fa.1
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700215934; x=1700820734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALuhVtSc+rbRbd3z+T5Cn+lJrE2KU2vULAjH8c9QL6k=;
 b=i9HBcdG/8r3hznwkQ/ubRiQoaNDGyKqP7AVuUPDf54JP4rsTb40pKpdDWqD0RVSHkW
 MLJToZqz6xsVstn1ozG9z+IPOBuswjHMpw+GXvZVxf52JPPlqlzK3h5d/62Uvpzu/zci
 mZWc7Aut1dsFHTbY6wgvbtL68gPzWTuVDkd5h74CteJisoOO7D41vpNCF4wLLUeDGSQ6
 SCXGEJ5qF3KPJ7M0yT//ftGmf1ps2DnCLgbSQ7JQBMOn0mbVXvdNtdwz05DrzqMw87el
 x3pOk3zvN7no4tfCTLszww+meS5jPRIu6uHkYFvdugc84QjNG1qruS05PsTwe8m1AV6D
 Iw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700215934; x=1700820734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALuhVtSc+rbRbd3z+T5Cn+lJrE2KU2vULAjH8c9QL6k=;
 b=DUfcDhjJoJ1iv1U5KXKyGwoVc4zJfq0b1ypbB4Dk2XZ/zTE7IghIliaQy9WuK6d1m1
 e822G+wIaS7qfXi7DiHDNsNwPsDloivh/bCR8NH5U0MaPHC7XOl/CwgpAi/AYWUFxc94
 kOYxe5atNg3toyGE9+bE49ENnnNEsORM8gKgLv9oK5ExcxV1/0oF8TsJO6sR+NCMRaMU
 Skjt2F1JTt0cIHUvJrhWr8SB4cWmVVyNaywLCZCuPdPk9ttc07SBH5I4+vGaXZ8C+x3/
 uVNR+aXm/Elzpdev0vrN8dMjcwCe7sUW/tsyqbd5lfQJWGtd0mA1DJT51CP2tIffY7d1
 XVdg==
X-Gm-Message-State: AOJu0YwI6OhY50xLZaiFUSSLO3gHaueBcT/bP7wVZgE9Zy0EF/9qrzNS
 Dk+t1raDpJqe51xAuWSXKsd20lKgosPwsRYODio=
X-Google-Smtp-Source: AGHT+IFoI+OogVRbf9+UfwSoysESLULUy0vr8QTn/2HrzueChp/vZWNC2EB0tDou6L8c6CZeyfcNs+QzdQ/woWYvH8U=
X-Received: by 2002:a2e:9e11:0:b0:2c6:ece6:5b65 with SMTP id
 e17-20020a2e9e11000000b002c6ece65b65mr7700090ljk.10.1700215934098; Fri, 17
 Nov 2023 02:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20231009090037.29132-2-matthew.auld@intel.com>
In-Reply-To: <20231009090037.29132-2-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Nov 2023 10:11:46 +0000
Message-ID: <CAM0jSHNYG32TFWjz_UF+TfPkc2WP1KfcfLoRM0a6BXiGTKzuoA@mail.gmail.com>
To: Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe/bo: don't hold dma-resv lock over
 drm_gem_handle_create
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 9 Oct 2023 at 10:01, Matthew Auld <matthew.auld@intel.com> wrote:
>
> This seems to create a locking inversion with object_name_lock. The lock
> is held by drm_prime_fd_to_handle when calling our xe_gem_prime_import
> hook, which might eventually go on to grab the dma-resv lock during the
> attach. However we also have the opposite locking order in
> xe_gem_create_ioctl which is holding the dma-resv lock when calling
> drm_gem_handle_create, which wants to eventually grab object_name_lock:
>
> -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
> <4> [635.739288]        lock_acquire+0x169/0x3d0
> <4> [635.739294]        __ww_mutex_lock.constprop.0+0x164/0x1e60
> <4> [635.739300]        ww_mutex_lock_interruptible+0x42/0x1a0
> <4> [635.739305]        drm_gem_shmem_pin+0x4b/0x140 [drm_shmem_helper]
> <4> [635.739317]        dma_buf_dynamic_attach+0x101/0x430
> <4> [635.739323]        xe_gem_prime_import+0xcc/0x2e0 [xe]
> <4> [635.739499]        drm_prime_fd_to_handle_ioctl+0x184/0x2e0 [drm]
> <4> [635.739594]        drm_ioctl_kernel+0x16f/0x250 [drm]
> <4> [635.739693]        drm_ioctl+0x35e/0x620 [drm]
> <4> [635.739789]        __x64_sys_ioctl+0xb7/0xf0
> <4> [635.739794]        do_syscall_64+0x3c/0x90
> <4> [635.739799]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> <4> [635.739805]
> -> #0 (&dev->object_name_lock){+.+.}-{3:3}:
> <4> [635.739813]        check_prev_add+0x1ba/0x14a0
> <4> [635.739818]        __lock_acquire+0x203e/0x2ff0
> <4> [635.739823]        lock_acquire+0x169/0x3d0
> <4> [635.739827]        __mutex_lock+0x124/0x1310
> <4> [635.739832]        drm_gem_handle_create+0x32/0x50 [drm]
> <4> [635.739927]        xe_gem_create_ioctl+0x1d3/0x550 [xe]
> <4> [635.740102]        drm_ioctl_kernel+0x16f/0x250 [drm]
> <4> [635.740197]        drm_ioctl+0x35e/0x620 [drm]
> <4> [635.740293]        __x64_sys_ioctl+0xb7/0xf0
> <4> [635.740297]        do_syscall_64+0x3c/0x90
> <4> [635.740302]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> <4> [635.740307]
>
> It looks like it should be safe to simply drop the dma-resv lock prior
> to publishing the object when calling drm_gem_handle_create.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/743
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Any takers for this one? This will start triggering in BAT once we merge:
https://patchwork.freedesktop.org/series/124667/

Since that has a new BAT test which triggers the external dma-import
path via VGEM.

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..ff116d3a8861 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1815,14 +1815,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, v=
oid *data,
>                 if (XE_IOCTL_DBG(xe, !vm))
>                         return -ENOENT;
>                 err =3D xe_vm_lock(vm, true);
> -               if (err) {
> -                       xe_vm_put(vm);
> -                       return err;
> -               }
> +               if (err)
> +                       goto out_vm;
>         }
>
>         bo =3D xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>                           bo_flags);
> +
> +       if (vm)
> +               xe_vm_unlock(vm);
> +
>         if (IS_ERR(bo)) {
>                 err =3D PTR_ERR(bo);
>                 goto out_vm;
> @@ -1836,15 +1838,17 @@ int xe_gem_create_ioctl(struct drm_device *dev, v=
oid *data,
>         goto out_put;
>
>  out_bulk:
> -       if (vm && !xe_vm_in_fault_mode(vm))
> +       if (vm && !xe_vm_in_fault_mode(vm)) {
> +               xe_vm_lock(vm, false);
>                 __xe_bo_unset_bulk_move(bo);
> +               xe_vm_unlock(vm);
> +       }
>  out_put:
>         xe_bo_put(bo);
>  out_vm:
> -       if (vm) {
> -               xe_vm_unlock(vm);
> +       if (vm)
>                 xe_vm_put(vm);
> -       }
> +
>         return err;
>  }
>
> --
> 2.41.0
>
