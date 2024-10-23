Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5E6CE8E9B
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 17:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9748710E97E;
	Thu, 24 Oct 2024 17:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="2GD40DV3";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE27D10E861
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 20:59:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso2094435e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 13:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729717186;
 x=1730321986; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqBQuVSIycI00hdpx3lR5ACuKRsYQWaJxf8hFYYXxOk=;
 b=2GD40DV3/wtd3ZHfBuc6vDkpeir3z7MsTNDQ04i+EqLYyJrfBn8B56olYo8NdYRiMz
 P+SehQHrDEzqbjct8Vp5bkp/WWBwLE9GNKU6Lxd6OaHY2b8W/qi+mnulAPfd47ta4eRE
 29KqTukhnrCsTEmsKOgf5FqGPpUUjYZoTSUhVh2+KZ4Gg/yZ/LwABtf2z0LkP0mXWaji
 s12eYLB1/dOgz6pozG0XlmmgmpnS8RnR/YJtQGj1BUdQf/4bFL2S7l6Kw2ecSjMDlo+7
 mUReXI71zqXgLKFax9GncaN9uROk6pLBo52GLex4yOwk2k3W72Xb54Kb4ym93pB6BEmA
 CUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729717186; x=1730321986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqBQuVSIycI00hdpx3lR5ACuKRsYQWaJxf8hFYYXxOk=;
 b=jg6v+T960s5i1PFTa7mjtDge5Fd+24Qm0QD5QaWcSchaa7A7eywfyxFQoaCHCeWErE
 Lz57BOV2VRaxE9pRh70b1frY/1d216Y6OKCjj98W7aofHQHa9tm59jOkJyi87ro4AiI/
 mHy4RtmQPWnJ5XQGzj8VFjKz5nwjsbFKgZRrnowG1dZwalOLK80GlaldI3mBPWaCoQBw
 WIlNnqW9YSU2fLe+PbRxOb9jeFPo6vJj1lXK1QrX8nPoHOWtGkqoUJvGKhzvm1WLiY8D
 sqFJLwVDG0+213JNFEa++xjtCkEHxQYbry01Yj3WA4SlzCorV5tFZZd+hXLabGY5RETC
 kjyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBdFJsijl7QVoTfKspzHjeG8716vJkbtqVcKbM0pineDgH9n82ygekqnc3Hg65Jos0+ldai1eodw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNIbiwurujG2uRY9rZGQkD9SLC/INo2OB9rjxjXLeS8mn1n5km
 bEEzrSyB5dmOsGRbhSiqXr++E1wK8m6hN898jXqEixciZqE0GmDsBCDNHNsRBgfFHSp+OUHEQk7
 fCOAnFxBdFSIM3HhycKBhblyUoQsIVLOgx7Iqkg==
X-Google-Smtp-Source: AGHT+IELL8lRAg7cArEXQHvrs//3nuGQjeroLsRRDAQdATMPf9GdpSIb/13x+Z9wrbZRpZVIDhudm8c3MtPuKR4g+mo=
X-Received: by 2002:a5d:5b92:0:b0:37d:43f1:57fd with SMTP id
 ffacd0b85a97d-37efcef528emr2325118f8f.6.1729717185866; Wed, 23 Oct 2024
 13:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241010165801.3913-1-everestkc@everestkc.com.np>
 <ZxlYbVOLPQv-oWrv@intel.com>
In-Reply-To: <ZxlYbVOLPQv-oWrv@intel.com>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 23 Oct 2024 14:59:34 -0600
Message-ID: <CAEO-vhGzRxths0OG_MJEPqocyQ5C0hDXvJRWfYYv74qnCbCVCg@mail.gmail.com>
Subject: Re: [PATCH V4] drm/xe/guc: Fix dereference before NULL check
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org, 
 dan.carpenter@linaro.org, michal.wajdeczko@intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Oct 2024 17:37:53 +0000
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

On Wed, Oct 23, 2024 at 2:11=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
>
> On Thu, Oct 10, 2024 at 10:57:59AM -0600, Everest K.C. wrote:
> > The pointer list->list is dereferenced before the NULL check.
> > Fix this by moving the NULL check outside the for loop, so that
> > the check is performed before the dereferencing.
> > The list->list pointer cannot be NULL so this has no effect on runtime.
> > It's just a correctness issue.
> >
> > This issue was reported by Coverity Scan.
> > https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssu=
e=3D1600335
> >
> > Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into captu=
re list")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > V3 -> V4: - Corrected the Fixes tag
> >           - Added Reviewed-by tag
>
> For some reason it looks like nor CI nor lore has this v4 version.
Yeah, I just checked that and it's something strange.
> could you please resubmit it?
Yes, let me send it right away.
> > V2 -> V3: - Changed Null to NULL in the changelog
> >           - Corrected typo in the changelong
> >           - Added more description to the changelong
> >         - Fixed the link for Coverity Report
> >         - Removed the space after the Fixes tag
> > V1 -> V2: - Combined the `!list->list` check in preexisting if statemen=
t
> >         - Added Fixes tag
> >         - Added the link to the Coverity Scan report
> >
> >  drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/x=
e_guc_capture.c
> > index 41262bda20ed..947c3a6d0e5a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > @@ -1531,7 +1531,7 @@ read_reg_to_node(struct xe_hw_engine *hwe, const =
struct __guc_mmio_reg_descr_gro
> >  {
> >       int i;
> >
> > -     if (!list || list->num_regs =3D=3D 0)
> > +     if (!list || !list->list || list->num_regs =3D=3D 0)
> >               return;
> >
> >       if (!regs)
> > @@ -1541,9 +1541,6 @@ read_reg_to_node(struct xe_hw_engine *hwe, const =
struct __guc_mmio_reg_descr_gro
> >               struct __guc_mmio_reg_descr desc =3D list->list[i];
> >               u32 value;
> >
> > -             if (!list->list)
> > -                     return;
> > -
> >               if (list->type =3D=3D GUC_STATE_CAPTURE_TYPE_ENGINE_INSTA=
NCE) {
> >                       value =3D xe_hw_engine_mmio_read32(hwe, desc.reg)=
;
> >               } else {
> > --
> > 2.43.0
> >

With Regards,
Everest K C
