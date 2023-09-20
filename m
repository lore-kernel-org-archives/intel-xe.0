Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE06CE79AF
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185B410E16E;
	Wed, 20 Sep 2023 09:54:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E838310E16E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:54:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AB52ACE1A7E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EACEC433C8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695203659;
 bh=UfCPTczEM5zgEFw+PixAt073yb58hmqxGAy9fBWok4Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aGN+6Q4e8yfvS+jLtjDFvx+CO53eAJ4VXfO2pk9mzshtTIgYbEo3chGPNh4a+rye7
 +2IRgVpL3dZ9QtK4WYgB9tgOvCOClsByCuENqmF18/9n3cNW/P1hyCQPKC7WjNV3hh
 VdpjGjg2WPy6iZKgS3EAVP4I0JkPM13jBJsogT+x1PMvTCB7oB4pjJF2NHxLCV9876
 UjjMjzThfixNBesLveRavbmnSxDsltLXHYG++6My+QO7Slgx2hZ6KXPnaSnPIVBxq1
 bqmAzVg2n128Y7o8nNxgw76/ClyhqWccYnBIqZK8VvDei0/hEhHyKkzDxim0OpkKMs
 qR1SHRqfuw9nw==
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-59c0d329a8bso48309807b3.1
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 02:54:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywe1m2WMB4Q2QHQ/t6Pm8omxFVzyF+hg+gLHuCNEkla4IedwzIy
 sPvRDupjj3O21Hp9XhTChozRHtudnkrV+B/JoTk=
X-Google-Smtp-Source: AGHT+IEnp/Gii/Xo0z6sItVClgh4HwiHI1n9fILlHfBGXd/RFgj7k22qdLq+YElqfBgsIWqjNe4AN+Kxij3gTQUWQRM=
X-Received: by 2002:a81:81c2:0:b0:591:8d06:e4e8 with SMTP id
 r185-20020a8181c2000000b005918d06e4e8mr2147355ywf.38.1695203658279; Wed, 20
 Sep 2023 02:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230919084609.15768-1-thomas.hellstrom@linux.intel.com>
 <CAFCwf13CzJCvO6GbyJnqak7rLJS-Eps8DU-uBgs9P_3T2Bn-xw@mail.gmail.com>
 <64012c3f-036d-f95d-c177-875fc1b1a0e8@linux.intel.com>
In-Reply-To: <64012c3f-036d-f95d-c177-875fc1b1a0e8@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 20 Sep 2023 12:53:51 +0300
X-Gmail-Original-Message-ID: <CAFCwf10=kX_8PLRLtfC8kHDLhLmNApcBqxVAPM7MXcPQRrrgwg@mail.gmail.com>
Message-ID: <CAFCwf10=kX_8PLRLtfC8kHDLhLmNApcBqxVAPM7MXcPQRrrgwg@mail.gmail.com>
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

On Wed, Sep 20, 2023 at 12:52=E2=80=AFPM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 9/20/23 11:35, Oded Gabbay wrote:
> > On Tue, Sep 19, 2023 at 11:46=E2=80=AFAM Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> >> For now only support pinning in TT memory, for two reasons:
> >> 1) Avoid pinning in a placement not accessible to some importers.
> >> 2) Pinning in VRAM requires PIN accounting which is a to-do.
> >>
> >> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> >> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com=
>
> >> ---
> >>   drivers/gpu/drm/xe/xe_dma_buf.c | 25 +++++++++++++++++++++----
> >>   1 file changed, 21 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_d=
ma_buf.c
> >> index 09343b8b3e96..bd8d51e7f93f 100644
> >> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> >> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> >> @@ -49,13 +49,30 @@ static int xe_dma_buf_pin(struct dma_buf_attachmen=
t *attach)
> >>   {
> >>          struct drm_gem_object *obj =3D attach->dmabuf->priv;
> >>          struct xe_bo *bo =3D gem_to_xe_bo(obj);
> >> +       struct xe_device *xe =3D xe_bo_device(bo);
> >> +       int ret;
> >>
> >>          /*
> >> -        * Migrate to TT first to increase the chance of non-p2p clien=
ts
> >> -        * can attach.
> >> +        * For now only support pinning in TT memory, for two reasons:
> >> +        * 1) Avoid pinning in a placement not accessible to some impo=
rters.
> >> +        * 2) Pinning in VRAM requires PIN accounting which is a to-do=
.
> >>           */
> >> -       (void)xe_bo_migrate(bo, XE_PL_TT);
> >> -       xe_bo_pin_external(bo);
> >> +       if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement !=3D XE=
_PL_TT) {
> >> +               drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf=
 pin.\n");
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       ret =3D xe_bo_migrate(bo, XE_PL_TT);
> >> +       if (ret) {
> >> +               if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> >> +                       drm_dbg(&xe->drm,
> >> +                               "Failed migrating dma-buf to TT memory=
: %pe\n",
> >> +                               ERR_PTR(ret));
> >> +               return ret;
> >> +       }
> >> +
> >> +       ret =3D xe_bo_pin_external(bo);
> >> +       xe_assert(xe, !ret);
> >>
> >>          return 0;
> >>   }
> >> --
> >> 2.41.0
> >>
> > Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
>
> Thanks for revieiwing, Oded. Just sent a v2 with a kunit test update to
> reflect the changes. Please let me know if there are any issues with that=
.
>
No issues, looks fine.
Oded

> /Thomas
>
> > Thanks,
> > Oded
