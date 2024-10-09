Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0B9D0D79C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B1A10EAF5;
	Fri, 11 Oct 2024 13:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="hS++04Th";
	dkim-atps=neutral
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1667D10E804
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 20:50:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so151264a12.2
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Oct 2024 13:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc.com.np; s=everest; t=1728507007; x=1729111807;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U6AlyAiK8jIW99PS/mbC0CEBkjDKR+IRpZZi78iD0gY=;
 b=hS++04ThniCCP8JGDGcAbqjynPPC5HBVvOZx/Qh3IdLn5Cn1RtRfF+WZMyJWdseAEn
 2o77xiykGMHebkyZjc9/ie/GgxvFeDIpVIVx8q8JErTML9tuBErMwY2nk32m1409LnoW
 Vw5/qehYM+UItI0hhwuGQdzfW9muNTQUE0eV5q+4VZ57IAc3nUrapiR4M2cSWPkeJfBf
 D1Fnn6ZxSixmJlOPEWG2rzBIcbgR8kpO2rD8+ChAlXWICod6EdTerUNcX0KVyFB/lQxb
 mOGQ9OHiojNNbg7VxglNkWehhQU9lMiYSbWdETYU0/uEAJyIpHrhoFeabkPQzy6jwsI4
 2p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728507007; x=1729111807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6AlyAiK8jIW99PS/mbC0CEBkjDKR+IRpZZi78iD0gY=;
 b=XPibdg+QGQrOQ4CJ/rt3nLEzl36LiVgh8j7b/U/9nN49o1s1hAXorzzGbtuaeadY6L
 UKyK5aiE3hTi3mnh2w/bcGW0gRzrHkR0mzZtEc3VS8Pr/J63/KXsgOjFsD4Zl1Qp54HD
 RPE5cIUB+IUDng86MVcSTC97mB8beRvHBmDJCBaClOkYDhu5NiVshqj4qu5iXQ6JSw6r
 ffwTSAvIZxdpwybWXKTs8H9hkS47ow0Eh7MxNnUY+aEG5YCsqc/HyqOyFq5Llc8ojVfC
 OOTR/ukSk/lodMNTkjVd94A+M/c77M0OJ/yLcPAdB6Bp6SuljBW3aoJDVF7pArFvZ11d
 /1lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwxp2v6mHqcGSmf+tnx/He9VrCshWnkwE+5AVPErv/NpVPFG4bwDqAA56IEqpRwSEvDLiaFvmRyg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMgZzgZR9YB7nxgWVZVjtbkomwZ+6iGtEZSL2pFTF5qYevDlPc
 n0broYCtTeISBXm+n7k5Y75r1smAIBIeIT451MUPUpQozu5rNDDiDTNQ19mrKFdoznlQko4Q3Sd
 3dh+nXYy4/wmVctCXWxZ/8WAzayiRsOrxWtZPZQ==
X-Google-Smtp-Source: AGHT+IHZQ//C/LT9bz4MtZcmxJW5GzbBzoSV9zKUThFSFKoiavT+2C93cS1UjaGvXK3AnSkDwkQ7q5RXVs+r0/IWRVo=
X-Received: by 2002:a17:907:7ba9:b0:a99:442e:34ac with SMTP id
 a640c23a62f3a-a999e8c9f03mr127272866b.40.1728507007259; Wed, 09 Oct 2024
 13:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241009184951.4991-1-everestkc@everestkc.com.np>
 <07d9eb6e-87d3-4428-aaa4-8721a6844404@stanley.mountain>
In-Reply-To: <07d9eb6e-87d3-4428-aaa4-8721a6844404@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 9 Oct 2024 14:49:55 -0600
Message-ID: <CAEO-vhEGtBX1sb3MYm18+MBGEgrFfNpzatBT46kcN9_Wh=NFMQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/xe/guc: Fix dereference before Null check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 skhan@linuxfoundation.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 11 Oct 2024 13:55:28 +0000
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

On Wed, Oct 9, 2024 at 2:35=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Wed, Oct 09, 2024 at 12:49:49PM -0600, Everest K.C. wrote:
> > The pointer list->list was derefrenced before the Null check
> > resulting in possibility of Null pointer derefrencing.
> > This patch moves the Null check outside the for loop, so that
> > the check is performed before the derefrencing.
> >
> > This issue was reported by Coverity Scan.
> >
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>
> You need to add a Fixes tag.
Will add it and send a V2.
> > ---
> >  drivers/gpu/drm/xe/xe_guc_capture.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/x=
e_guc_capture.c
> > index 41262bda20ed..de63c622747d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > @@ -1537,13 +1537,13 @@ read_reg_to_node(struct xe_hw_engine *hwe, cons=
t struct __guc_mmio_reg_descr_gro
> >       if (!regs)
> >               return;
> >
> > +     if (!list->list)
> > +             return;
>
> Could you merge this with the other sanity checks at the start of the fun=
ction.
>
> -       if (!list || list->num_regs =3D=3D 0)
> +       if (!list || !list->list || list->num_regs =3D=3D 0)
That looks better. Will do that in V2 and send it.
> The list->list pointer can't actually be NULL.  It comes from
> guc_capture_get_one_list(), so if the reglists[i].list pointer is NULL it
> returns NULL.  However, obviously checking for NULL after a dereference i=
s not
> the correct so it's worth fixing and probably deserves a Fixes tag.  Alth=
ough it
> doesn't affect runtime, adding a Fixes tag helps backporters know they ca=
n
> automatically ignore this one because the commit it's fixing is very rece=
nt.
>
> regards,
> dan carpenter
>
