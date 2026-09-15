Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA1C88E7B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 14:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77C10E5C4;
	Tue, 15 Sep 2026 14:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pG52829U";
	dkim-atps=neutral
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AC210E2CC
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 13:59:18 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-90cc64570deso11346476d6.0
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 06:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789480758; cv=none;
 d=google.com; s=arc-20260327;
 b=pq0SQroo3UCyRigFm77+YHP4f8JY0ANj9cSUThbevM6z6EGQ8+NRIsAIVIl3/csK4k
 QPbhld87qZm+9Uy2xFrGMIxxgJ4NpMyOJJ3mE4ccAcHrIoW+KM2Tsm7i541xaFE62AvD
 ptAIW6nigzVQXvcp1kpfr6R5EOQy5F/bE2gcgO+eQkTX2XOgLcZDR7awwSHxE4eIVyKi
 SIJptq2xNutaeg5mU/w/k9Q5vRGCX7W9EtMpL5HceVVmhZwDsnriOi14pI321DTZz+Gz
 VIu2epKGCoSU1mDRxOqTnwgjrQqv7s3W+T/gPvls45xLNT+fRFODSwTWNiDkDIvW0/O7
 ksrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qtYpuKUyAlpc4Ck0pC2uxBVaD63r9WyFlbfA/VDUwk0=;
 fh=uO3XaDVrPdwfTozRbsPHAyzmiaJgGvvwXl7tDZIWyKk=;
 b=OFhH25sUrurUgCvlIKBbXnWpS1WWZbBYn/S31WpTXWH5jLWzjlYhh9t5aLtiRogNgA
 Q6CHAycAZviiro45tvbBjQy9Ig04eQHgbKNQ4gV9NQjhDwt21AqWAwEckDo/N7gQDEEs
 ZrOeuKsHXT1yhR/NXigDhIAWCgsuhhjl19eE7Cv/+uLj9Nvcz93yaCdQ4E4PyxilHl6P
 B9STgsj+5Q14qmdMZsKiD646nPxh7qLDSVZ0klpPBfmSnCCyHwKjsXCwuJPfkiCI7VFs
 RW7al9wgvgfsBE3pWJ577fmloO1sGoRjeY0imG5bfhWU2KjJsxsDQjEydsh1wJKj6+oe
 i28w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789480758; x=1790085558; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qtYpuKUyAlpc4Ck0pC2uxBVaD63r9WyFlbfA/VDUwk0=;
 b=pG52829Ut1IqxJphqI2yqA2U7m3G+wm9LAGwQdlZ2d3ZhfAzfpBIq2lk8kqxPDC9XX
 hrCYmPNjMmWD73xjV0Y/T1kVU5TzlIg61aSkM+nwgGLGyYplHakXKjZpTRe3p66r9/+a
 VD11Hvs0zAkC34hfVZTHljuq+T0vRn/RDQ2I+agE7q9FfZjtLq/a25k46NWy2VVyDini
 ILnHKh7gVXMpDTSGEwPdjnBeruvXK1I8SAmmy7nmxU/Nw+YfDxAM3NKw4VgnwRgR99x6
 GSt4KgegNr+Xk9ooGKCLmBdm6S4hmd0zOrdXwzaIyqfmAP7ub1UqnbIAWj6GyZs6udY4
 balw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789480758; x=1790085558;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qtYpuKUyAlpc4Ck0pC2uxBVaD63r9WyFlbfA/VDUwk0=;
 b=1z2Y7bhDFWorrC2vb9+Vqb7EI/n7xrqdaCEV0jGLFYgKBHqYEbDtvNlnoimefN3LkN
 bOyjg6fpprdLBiOXZG03AzjFCcSR2NXehvswaUJc1umKedPUkDUXI06xVPyNfq3MgV8n
 ECHBkQASNCurBCWCODwe3TDWHapcGhpNufqHjSL9+f9peTQ1INIyDhBMMmNJzlrihJwv
 XFtrgz/8R+CsWNN1qZ3uuX08gu97LfERX/7i+yYImbf/AvBtiOkWNL0GVn1WjINEI6cp
 JtKHfdyKCv5EAbO9Aqrpvt7ZhK9gY5kB45FUT8Yj5NNJUAxvs4aHOfJDM/D437ie8xV+
 0wRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpHpRwl+o8W2Snv8DlNif9SgU1k2K+O2kjo2ehfDHQslUlHYmWeszNrzO61WXohSMY0WQR6lJP3A==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kXBP1QCKVQhwRr6m4xJSkYUJFL4sDAArFHJ91BuI8S0xwMd6tm
 kdueJQ8EGlvzJ9UNtvM8FBxZi8zBU9N5QdwVTfPU+I+GKfe6uZni0O40hRu179AqoQ6BqaODCR5
 ManfdnCrU/jZ0Ms6MHD+ZedA+bRu3nUk=
X-Gm-Gg: AYBFou0MrRzQ6IHLrbFcl8MQkSK5smqXZfhefYyY63I0xuf8vmtCMHxwCv9IKoxh7xx
 mTLCIFuHkQ0P+wFRenOdbsIPpXdjRElUe8gngBKSSkk9AERQqz1bfCLPMD94Pm4Rmvf2yQchzB1
 68f2K9uLjf0s+JDV6smvE0W8bDlCDZrTsmGy/Ai8vCkwMhzba3uF2XQW86DhjSZYyyywqcYWvhj
 njU+H0WZXHWe1bQunw2Sp2uunag1xZfuvP9IBPYIrwvTC4u1qy9joos0Ll490NSKp5/Ca0kAYPy
 52qluWiOprxDTxrTiiuhzdktrM5RbEREWdbULsixGgk3Gaoe/EGXGhrK3f5WTVQEdKVadU38++k
 KrsIS1qpQyjJlTAym55g=
X-Received: by 2002:a05:6214:428c:b0:910:6ca7:cad4 with SMTP id
 6a1803df08f44-91234347c67mr48629936d6.5.1789480757416; Tue, 15 Sep 2026
 06:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260905142500.17666-1-zhoulol888@gmail.com>
 <20260915064200.23171-1-zhoulol888@gmail.com>
 <69d0f3f3566521e516e439e818a619766561567c@intel.com>
In-Reply-To: <69d0f3f3566521e516e439e818a619766561567c@intel.com>
From: Activate Windows <zhoulol888@gmail.com>
Date: Tue, 15 Sep 2026 21:59:06 +0800
X-Gm-Features: AcwNN1V-PMybVCwMGP9Ri_2RLLkQkWkHW6MDdwoRi03kcrCMTtjQFFHabyW8iaM
Message-ID: <CAEnyS7FrjPdkErjnNO5bOkEvrRdGfWYNB-GnhjpB2iKYFMJx5g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe/display: Remove invalid initial plane PTE check
 for iGPU
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000e0da58065b85f47d"
X-Mailman-Approved-At: Tue, 15 Sep 2026 14:13:02 +0000
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

--000000000000e0da58065b85f47d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you.
Follow-up: reading 0d5d5d0c2c72, the check assumes GRAPHICS_VERx100(xe) >=
=3D
1270 stands in for "MTL+ with LMEMBAR". On the PTL I hit this on, the
initial plane is rejected.

I'm working out whether the BIOS PTE actually lacks XE_GGTT_PTE_DM there --
I'll follow up with a proper v2. I don't have the machine in front of me
for a few days.

On Tue, Sep 15, 2026 at 4:40=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com>
wrote:

> On Tue, 15 Sep 2026, Andrew Zhou <zhoulol888@gmail.com> wrote:
> > Pantherlake integrated graphics can have the XE_GGTT_PTEDM bit set in
> > the BIOS-initialised framebuffer PTE. The validation rejects this and
> > fails to create the initial framebuffer, resulting in static.
> >
> > Remove the too-strict validation. Since this was the only caller of
> > need_pte_local() outside the DGFX path, the helper is now
> > unconditionally true there; fold the check and drop the dead
> > need_pte_local() and has_lmembar() helpers.
> >
> > Signed-off-by: Andrew Zhou <zhoulol888@gmail.com>
> > Tested-by: Andrew Zhou <zhoulol888@gmail.com>
> > Tested-on: Intel Core Ultra X7 358H, integrated graphics, B0 stepping
>
> This is basically a revert of 0d5d5d0c2c72 ("drm/xe: Check the PTE local
> memory bit for initial FB in stolen"). You'd do well to dig a bit of git
> blame and see what changed, why, and by whom.
>
> Cc: Ville, Maarten, Matthew
>
>
> BR,
> Jani.
>
> > ---
> > v1 -> v2:
> > - Drop need_pte_local() and has_lmembar(), now dead after removing the
> >   iGPU validation (sashiko)
> > ---
> >  drivers/gpu/drm/xe/display/xe_initial_plane.c | 20 +------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > index 0f86b7303..3484b3033 100644
> > --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > @@ -27,16 +27,6 @@ static bool is_pte_local(u64 pte)
> >       return pte & XE_GGTT_PTE_DM;
> >  }
> >
> > -static bool has_lmembar(struct xe_device *xe)
> > -{
> > -     return GRAPHICS_VERx100(xe) >=3D 1270;
> > -}
> > -
> > -static bool need_pte_local(struct xe_device *xe)
> > -{
> > -     return IS_DGFX(xe) || has_lmembar(xe);
> > -}
> > -
> >  static struct xe_bo *
> >  initial_plane_bo(struct xe_device *xe,
> >                struct intel_initial_plane_config *plane_config)
> > @@ -60,7 +50,7 @@ initial_plane_bo(struct xe_device *xe,
> >       if (IS_DGFX(xe)) {
> >               u64 pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
> >
> > -             if (is_pte_local(pte) !=3D need_pte_local(xe)) {
> > +             if (!is_pte_local(pte)) {
> >                       drm_err(&xe->drm, "Initial plane PTE has bad loca=
l
> memory bit\n");
> >                       return NULL;
> >               }
> > @@ -85,7 +75,6 @@ initial_plane_bo(struct xe_device *xe,
> >                           &phys_base);
> >       } else {
> >               struct ttm_resource_manager *stolen;
> > -             u64 pte;
> >
> >               stolen =3D ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> >               if (!stolen) {
> > @@ -93,13 +82,6 @@ initial_plane_bo(struct xe_device *xe,
> >                       return NULL;
> >               }
> >
> > -             pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
> > -
> > -             if (is_pte_local(pte) !=3D need_pte_local(xe)) {
> > -                     drm_err(&xe->drm, "Initial plane PTE has bad loca=
l
> memory bit\n");
> > -                     return NULL;
> > -             }
> > -
> >               phys_base =3D base;
> >               flags |=3D XE_BO_FLAG_STOLEN;
>
> --
> Jani Nikula, Intel
>

--000000000000e0da58065b85f47d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you.<br><span class=3D"gmail-">Foll=
ow-up: reading 0d5d5d0c2c72, the check assumes </span><code>GRAPHICS_VERx10=
0(xe) &gt;=3D 1270</code><span class=3D"gmail-"> stands in for &quot;MTL+ w=
ith LMEMBAR&quot;. On the PTL I hit this on, the initial plane is rejected.=
=C2=A0<br><br>I&#39;m working out whether the BIOS PTE actually lacks XE_GG=
TT_PTE_DM there -- I&#39;ll follow up with a proper v2. I don&#39;t have th=
e machine in front of me for a few days.</span></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Sep 15, 2026 at 4:40=E2=80=AFPM Jani Nikula &lt;<a href=3D"mailto:jani.ni=
kula@linux.intel.com">jani.nikula@linux.intel.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 15 Sep 2026, Andre=
w Zhou &lt;<a href=3D"mailto:zhoulol888@gmail.com" target=3D"_blank">zhoulo=
l888@gmail.com</a>&gt; wrote:<br>
&gt; Pantherlake integrated graphics can have the XE_GGTT_PTEDM bit set in<=
br>
&gt; the BIOS-initialised framebuffer PTE. The validation rejects this and<=
br>
&gt; fails to create the initial framebuffer, resulting in static.<br>
&gt;<br>
&gt; Remove the too-strict validation. Since this was the only caller of<br=
>
&gt; need_pte_local() outside the DGFX path, the helper is now<br>
&gt; unconditionally true there; fold the check and drop the dead<br>
&gt; need_pte_local() and has_lmembar() helpers.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Zhou &lt;<a href=3D"mailto:zhoulol888@gmail.com"=
 target=3D"_blank">zhoulol888@gmail.com</a>&gt;<br>
&gt; Tested-by: Andrew Zhou &lt;<a href=3D"mailto:zhoulol888@gmail.com" tar=
get=3D"_blank">zhoulol888@gmail.com</a>&gt;<br>
&gt; Tested-on: Intel Core Ultra X7 358H, integrated graphics, B0 stepping<=
br>
<br>
This is basically a revert of 0d5d5d0c2c72 (&quot;drm/xe: Check the PTE loc=
al<br>
memory bit for initial FB in stolen&quot;). You&#39;d do well to dig a bit =
of git<br>
blame and see what changed, why, and by whom.<br>
<br>
Cc: Ville, Maarten, Matthew<br>
<br>
<br>
BR,<br>
Jani.<br>
<br>
&gt; ---<br>
&gt; v1 -&gt; v2:<br>
&gt; - Drop need_pte_local() and has_lmembar(), now dead after removing the=
<br>
&gt;=C2=A0 =C2=A0iGPU validation (sashiko)<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/xe/display/xe_initial_plane.c | 20 +------------=
------<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 19 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/g=
pu/drm/xe/display/xe_initial_plane.c<br>
&gt; index 0f86b7303..3484b3033 100644<br>
&gt; --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c<br>
&gt; +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c<br>
&gt; @@ -27,16 +27,6 @@ static bool is_pte_local(u64 pte)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return pte &amp; XE_GGTT_PTE_DM;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static bool has_lmembar(struct xe_device *xe)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return GRAPHICS_VERx100(xe) &gt;=3D 1270;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static bool need_pte_local(struct xe_device *xe)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return IS_DGFX(xe) || has_lmembar(xe);<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 static struct xe_bo *<br>
&gt;=C2=A0 initial_plane_bo(struct xe_device *xe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intel_in=
itial_plane_config *plane_config)<br>
&gt; @@ -60,7 +50,7 @@ initial_plane_bo(struct xe_device *xe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_DGFX(xe)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 pte =3D xe_g=
gtt_read_pte(tile0-&gt;mem.ggtt, base);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_pte_local(pte)=
 !=3D need_pte_local(xe)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!is_pte_local(pte=
)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0drm_err(&amp;xe-&gt;drm, &quot;Initial plane PTE has bad local=
 memory bit\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -85,7 +75,6 @@ initial_plane_bo(struct xe_device *xe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;phys_base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_resou=
rce_manager *stolen;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 pte;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stolen =3D ttm_m=
anager_type(&amp;xe-&gt;ttm, XE_PL_STOLEN);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!stolen) {<b=
r>
&gt; @@ -93,13 +82,6 @@ initial_plane_bo(struct xe_device *xe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D xe_ggtt_read_=
pte(tile0-&gt;mem.ggtt, base);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_pte_local(pte)=
 !=3D need_pte_local(xe)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(&amp;xe-&gt;drm, &quot;Initial plane PTE has bad local memor=
y bit\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phys_base =3D ba=
se;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D XE_BO=
_FLAG_STOLEN;<br>
<br>
-- <br>
Jani Nikula, Intel<br>
</blockquote></div></div>

--000000000000e0da58065b85f47d--
