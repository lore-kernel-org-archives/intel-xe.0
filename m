Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5392BCE79AB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2654E10E2AE;
	Wed, 20 Sep 2023 09:36:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5172810E2AE
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:36:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68400B81C96
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19816C433C9
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695202578;
 bh=P7HdvFdkHXPOuwnXhDH+J/hE/l7/IbsGaki66s8+Evs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k1DYKbVAk97Y1WNtOC9/e6DOr7dvKi/FAk0YiGJwQSFzsDbaL4bCehigZrDIywwMu
 V9JHQfCWlkadMeqRKtZaAPLoEs+c0CKLJy/RyuvI+N8imB30vqqPLq51YeMpVMIHEr
 wHsZSZEsen1g3m9xLKHUTxu6xIPrH0YAOPptb/ZXMyOsN9Uqh/9+U1vABPYP6vC2hl
 bdu+UlX/YV0s1qt+OIT+SIfgSnQZnCCSGAkoRYxhaE0Tnov0XpKMfXkwcKvSNNrV+N
 fwfU5ilZIKnmL/DiBkBk4/xp9o3FOKn04I0pkPrszovJvqR4Qw2AKkiJrKqpE2Qwdo
 Brd9u2bFLJ5Gw==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-59be8a2099bso66119007b3.0
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 02:36:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw222BnkeTK5LiFjNBwBvDsrJaCqQE5MUsG+x/PDisg5Yx6Ap8D
 dP/qEBKZSg5YhAcC2BsVM0mzuQaGO4ZtiwnWmsc=
X-Google-Smtp-Source: AGHT+IE3oBgjNEJu8iA7CDt2Mm9wcwiuaJet0HUVEwWyPQ0uNGLIKi4JPZS8YphItOX4TSALf8fpL0obbr9JamfFE7o=
X-Received: by 2002:a0d:f1c5:0:b0:59b:61c2:e8db with SMTP id
 a188-20020a0df1c5000000b0059b61c2e8dbmr2087117ywf.49.1695202577241; Wed, 20
 Sep 2023 02:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230919084609.15768-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230919084609.15768-1-thomas.hellstrom@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 20 Sep 2023 12:35:50 +0300
X-Gmail-Original-Message-ID: <CAFCwf13CzJCvO6GbyJnqak7rLJS-Eps8DU-uBgs9P_3T2Bn-xw@mail.gmail.com>
Message-ID: <CAFCwf13CzJCvO6GbyJnqak7rLJS-Eps8DU-uBgs9P_3T2Bn-xw@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Disallow pinning dma-bufs in VRAM
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

On Tue, Sep 19, 2023 at 11:46=E2=80=AFAM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> For now only support pinning in TT memory, for two reasons:
> 1) Avoid pinning in a placement not accessible to some importers.
> 2) Pinning in VRAM requires PIN accounting which is a to-do.
>
> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_=
buf.c
> index 09343b8b3e96..bd8d51e7f93f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -49,13 +49,30 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *=
attach)
>  {
>         struct drm_gem_object *obj =3D attach->dmabuf->priv;
>         struct xe_bo *bo =3D gem_to_xe_bo(obj);
> +       struct xe_device *xe =3D xe_bo_device(bo);
> +       int ret;
>
>         /*
> -        * Migrate to TT first to increase the chance of non-p2p clients
> -        * can attach.
> +        * For now only support pinning in TT memory, for two reasons:
> +        * 1) Avoid pinning in a placement not accessible to some importe=
rs.
> +        * 2) Pinning in VRAM requires PIN accounting which is a to-do.
>          */
> -       (void)xe_bo_migrate(bo, XE_PL_TT);
> -       xe_bo_pin_external(bo);
> +       if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement !=3D XE_PL=
_TT) {
> +               drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pi=
n.\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D xe_bo_migrate(bo, XE_PL_TT);
> +       if (ret) {
> +               if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> +                       drm_dbg(&xe->drm,
> +                               "Failed migrating dma-buf to TT memory: %=
pe\n",
> +                               ERR_PTR(ret));
> +               return ret;
> +       }
> +
> +       ret =3D xe_bo_pin_external(bo);
> +       xe_assert(xe, !ret);
>
>         return 0;
>  }
> --
> 2.41.0
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Thanks,
Oded
