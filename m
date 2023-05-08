Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7813AC77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8410E08F;
	Mon,  8 May 2023 01:15:44 +0000 (UTC)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D977910E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:15:41 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-545d82e1a1bso1323038eaf.2
 for <intel-xe@lists.freedesktop.org>; Sun, 07 May 2023 18:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683508540; x=1686100540;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vZH3Q58HOloSbqgdNI4ZLY47iD/uQDc0fI95pFdv9kc=;
 b=nsRS8sgyomT72H9buO+Tuk47ldiOjdpz+oNnhOGEgMgiI+8Ijwy/qKnYmWNkBnBgQK
 4LsRf9kakkg//YD5ndMnWVw3TNWvMcahCOzGrLENsRMVOyeeS9bSypPIUo1AYGd93nxl
 aqSScuJhbilVEnuujgVWKEumvcrSMD7vtpAMZT2Y7CG/wCBHiae93Snw1qsg79CZQCic
 jyxCQJYmYPNKIvq9WoYUdWX1pzZPFug0lS/1aW/3EGK5vuVE2eW9ufJ20EEsZmo8KFA2
 iFJtFUe/VSARyTWUzt4k3oTYt7FsX0ElP450DPqnHo50JclXF3BPZksuYMv5mguvV5l0
 i1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683508540; x=1686100540;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZH3Q58HOloSbqgdNI4ZLY47iD/uQDc0fI95pFdv9kc=;
 b=ZiFfZqwl0Cl/MfvGkHAgnAzMotgduBKQIUnjDA1bTHgc8jBGFnabeOo39YRGzQ3cKb
 ihm1h3MoGAnmFsGiWAmqlKOGYBiPHmrT5+B5+Tzleqq/fR+zTc/BtBdG5MEw0HICTSP2
 PFI+B01WvJD2muuYi005ASmDPTQ7b+ud0jLFPXrOw/JcIVcq3YvniwRjM3DJthQAjWPb
 nttNR8AOgm7Ygdv0niQDvv4ZN1pVrkhoRcB8YnmmBXPrlwaPGfpeksnzCJOtuuh22uoD
 ybJowdJR9oRIqWvH6Lm2QClJGm3cRM+anonSLBs05tYVGbN8n8jpDhhF9umYnuU4MRwW
 5j3A==
X-Gm-Message-State: AC+VfDzh0+7hdhwQcsEgJ2A/1ZMW59vsXCN2DxQBjyRzGEId1jqYcUs3
 AN23ev+es/C8cUzg4EGo6mxvqvoZ3nlHIX9S+/HZQEWcGE0=
X-Google-Smtp-Source: ACHHUZ4oHF5oEiHD8ye1tOdaHOOZJUWRfQzL0UH2fTsSHWgJz3KuyTqr1YRSEYxdpZQtU8d3jysmUKXtAZZE36qu25A=
X-Received: by 2002:a4a:d217:0:b0:547:4f42:8ef9 with SMTP id
 c23-20020a4ad217000000b005474f428ef9mr3954407oos.6.1683508540452; Sun, 07 May
 2023 18:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-8-matthew.brost@intel.com>
 <ZFVNqF+iqsN059E3@rdvivi-mobl4>
 <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Sun, 7 May 2023 18:15:29 -0700
Message-ID: <CA+aRtua9NwSTVMhNinVmotuqawwmQzvdR28t3MpJ3LN6QjRSaA@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="00000000000087b60f05fb24609d"
Subject: Re: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external
 BOs in VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, intel-xe@lists.freedesktop.org,
 Matthew Brost <mattthew.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--00000000000087b60f05fb24609d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

s/it external/it's external/

Otherwise, the description looks good.

On Sun, May 7, 2023 at 6:08=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om>
wrote:

> On Fri, May 05, 2023 at 02:40:40PM -0400, Rodrigo Vivi wrote:
> > On Mon, May 01, 2023 at 05:17:03PM -0700, Matthew Brost wrote:
> > > Not needed and causes some issues with bulk LRU moves.
> >
> > I'm confused with this explanation and the code below.
> > could you please provide a bit more wording here?
> >
>
> We only need to try to lock a BO if it external as non-external BOs
> share the dma-resv with the already locked VM. Trying to lock
> non-external BOs caused an issue (list corruption) in an uncoming patch
> which adds bulk LRU move. Since this code isn't needed, remove it.
>
> ^^^ How about this.
>
> > >
> > > Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 272f0f7f24fe..6c427ff92c44 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm,
> struct xe_vma *vma,
> > >              */
> > >             xe_bo_get(vbo);
> > >
> > > -           tv_bo.bo =3D &vbo->ttm;
> > > -           tv_bo.num_shared =3D 1;
> > > -           list_add(&tv_bo.head, &objs);
> > > +           if (!vbo->vm) {
> > > +                   tv_bo.bo =3D &vbo->ttm;
> > > +                   tv_bo.num_shared =3D 1;
> > > +                   list_add(&tv_bo.head, &objs);
> > > +           }
> > >     }
> > >
> > >  again:
> > > --
> > > 2.34.1
> > >
>

--00000000000087b60f05fb24609d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>s/it external/it&#39;s external/</div><div><br></div>=
<div>Otherwise, the description looks good.<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 7, 2023 =
at 6:08=E2=80=AFPM Matthew Brost &lt;<a href=3D"mailto:matthew.brost@intel.=
com">matthew.brost@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Fri, May 05, 2023 at 02:40:40PM -0400, Rodri=
go Vivi wrote:<br>
&gt; On Mon, May 01, 2023 at 05:17:03PM -0700, Matthew Brost wrote:<br>
&gt; &gt; Not needed and causes some issues with bulk LRU moves.<br>
&gt; <br>
&gt; I&#39;m confused with this explanation and the code below.<br>
&gt; could you please provide a bit more wording here?<br>
&gt; <br>
<br>
We only need to try to lock a BO if it external as non-external BOs<br>
share the dma-resv with the already locked VM. Trying to lock<br>
non-external BOs caused an issue (list corruption) in an uncoming patch<br>
which adds bulk LRU move. Since this code isn&#39;t needed, remove it.<br>
<br>
^^^ How about this.<br>
<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Matthew Brost &lt;<a href=3D"mailto:mattthew.brost=
@intel.com" target=3D"_blank">mattthew.brost@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_v=
m.c<br>
&gt; &gt; index 272f0f7f24fe..6c427ff92c44 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/xe/xe_vm.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/xe/xe_vm.c<br>
&gt; &gt; @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm,=
 struct xe_vma *vma,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe_bo_get(vbo);<br=
>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://tv_bo=
.bo" rel=3D"noreferrer" target=3D"_blank">tv_bo.bo</a> =3D &amp;vbo-&gt;ttm=
;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tv_bo.num_shared =3D 1;=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;tv_bo.hea=
d, &amp;objs);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vbo-&gt;vm) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<a href=3D"http://tv_bo.bo" rel=3D"noreferrer" target=3D"_blank">tv_b=
o.bo</a> =3D &amp;vbo-&gt;ttm;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tv_bo.num_shared =3D 1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0list_add(&amp;tv_bo.head, &amp;objs);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 again:<br>
&gt; &gt; -- <br>
&gt; &gt; 2.34.1<br>
&gt; &gt; <br>
</blockquote></div>

--00000000000087b60f05fb24609d--
