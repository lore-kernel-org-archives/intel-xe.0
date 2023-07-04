Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDFFEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 08:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AEA10E2B2;
	Tue,  4 Jul 2023 08:23:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CE410E2B1
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 08:23:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5925261121
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 08:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FBEC433C8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 08:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688459012;
 bh=wlPemmYhClK+V7C/MqpwGq0y9H8ZGQhZbE5WkxEU1eA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XvJaocUA/uK0xjpW+hR/aNopzrwVcXfoh6IkNlgRyxGDtssssLyOJSsvqujHYJ6ft
 9qsMirXBwJU7ndMls9JUteBI+/6BeBGYgH+ALlDIS6EJzJFm79a4CTv11x/98xwd8U
 aXM3Z0/cw6FcQwzmNvP6T5Y/7L2xoyrGvispI+iLKR7HXiarwecBGTcCGVqgIsULl8
 r5sVKsrR4LPP8XBT83LhtXt0aka9tbV5AQNy6u8/0M904vJU7DSxjX3OYxPvlKcrVR
 Ey5cBEQy+IzofmNJbkBZubHx+/qZkSxqbM7ZJmDzrr3VA32+ID3zNb8wP4rLN6P+3u
 reaG6kt2X4joQ==
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-bc379e4c1cbso6221772276.2
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Jul 2023 01:23:32 -0700 (PDT)
X-Gm-Message-State: ABy/qLYV0dvUaG0RPtk8OEiwNzfncy5CNChvexy4HGGPLhF7Sgog97MA
 jxkoNySi7RduXhvTFc4+h4Dm1+T1hUdhlx1Kyyg=
X-Google-Smtp-Source: APBJJlGQPb3vWycU/LJRN082wu9eag2zcQKZZRd9WJVDyWJ8yOnXzhd8NNwANmzjYVfhLBu2NUqEoWXhejgU7648pxQ=
X-Received: by 2002:a25:d615:0:b0:ba7:ca1d:70f3 with SMTP id
 n21-20020a25d615000000b00ba7ca1d70f3mr13585632ybg.39.1688459011815; Tue, 04
 Jul 2023 01:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230703190105.148419-1-jose.souza@intel.com>
In-Reply-To: <20230703190105.148419-1-jose.souza@intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 4 Jul 2023 11:23:05 +0300
X-Gmail-Original-Message-ID: <CAFCwf13GCjaCRU3n6gJUe+AiegYo8K4YxJWuMhhQD=iQ+=bxJA@mail.gmail.com>
Message-ID: <CAFCwf13GCjaCRU3n6gJUe+AiegYo8K4YxJWuMhhQD=iQ+=bxJA@mail.gmail.com>
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Make explicit that exec uAPI expects
 canonical addresses
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 3, 2023 at 10:01=E2=80=AFPM Jos=C3=A9 Roberto de Souza
<jose.souza@intel.com> wrote:
>
> The batch buffer address in exec uAPI is used when emitting
> MI_BATCH_BUFFER_START that expect canonical addresses in future
> platforms, for current ones the bits above 57 for PVC and 47 for
> other platforms are ignored.
>
> So the safest approach is to require canonical address for all
> platforms supported by Xe to avoid uAPI breaks.
What do you mean by uAPI break ?
If the user gives a wrong address, won't the device simply issue a
page fault and/or a different error event that will cause the job to
terminate ?
Are you explicitly checking all addresses that are given by the user ?
I don't understand why this check warrants a dedicated check in the driver.
imo, you should never validate user input if it will just cause the
gpu to issue a page fault and/or an error interrupt

Oded

>
> BSpec: 60223 59475 45718
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 ++++++
>  drivers/gpu/drm/xe/xe_device.h | 2 ++
>  drivers/gpu/drm/xe/xe_exec.c   | 8 ++++++++
>  include/uapi/drm/xe_drm.h      | 4 ++--
>  4 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 07ae208af809d..887aed80a20e9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -437,3 +437,9 @@ void xe_device_mem_access_put(struct xe_device *xe)
>
>         XE_WARN_ON(ref < 0);
>  }
> +
> +u64 xe_device_canonical_addr(struct xe_device *xe, u64 address)
> +{
> +       const int high_address_bit =3D xe->info.dma_mask_size > 47 ? 57 :=
 47;
> +       return sign_extend64(address, high_address_bit);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> index 779f71d066e6e..4df4f52f946ea 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -140,6 +140,8 @@ static inline struct xe_force_wake * gt_to_fw(struct =
xe_gt *gt)
>  void xe_device_mem_access_get(struct xe_device *xe);
>  void xe_device_mem_access_put(struct xe_device *xe);
>
> +u64 xe_device_canonical_addr(struct xe_device *xe, u64 address);
> +
>  static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>  {
>         return atomic_read(&xe->mem_access.ref);
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index c52edff9a3584..ba6e82112e4be 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -231,6 +231,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data=
, struct drm_file *file)
>                 }
>         }
>
> +       for (i =3D 0; i < engine->width; i++) {
> +               const u64 canonical_addr =3D xe_device_canonical_addr(xe,=
 addresses[i]);
> +               if (XE_IOCTL_ERR(xe, addresses[i] !=3D canonical_addr)) {
> +                       err =3D -EINVAL;
> +                       goto err_syncs;
> +               }
> +       }
> +
>         /*
>          * We can't install a job into the VM dma-resv shared slot before=
 an
>          * async VM bind passed in as a fence without the risk of deadloc=
king as
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e890b131af918..72dc2161fd232 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -811,8 +811,8 @@ struct drm_xe_exec {
>         __u64 syncs;
>
>         /**
> -        * @address: address of batch buffer if num_batch_buffer =3D=3D 1=
 or an
> -        * array of batch buffer addresses
> +        * @address: canonical address of batch buffer if num_batch_buffe=
r =3D=3D 1
> +        * or an array of batch buffer canonical addresses
>          */
>         __u64 address;
>
> --
> 2.41.0
>
