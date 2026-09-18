Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7D0C982DF
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 15:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE6710F0C3;
	Fri, 18 Sep 2026 15:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ViZbifj8";
	dkim-atps=neutral
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com
 [74.125.230.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C302210F39A
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:54:39 +0000 (UTC)
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-91058dd77a2so8793876d6.3
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 06:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789739679; cv=none;
 d=google.com; s=arc-20260327;
 b=ogmowHY85ESTP3lZw8p22VDq5Ryda8FBQeNBwUxkTPhWa/4FyF8S3Kerpyjshw/MB9
 qwejXmP/4O4jcuYvI/prmLHPBhxyxQOBO/9bw/QhY769O5Qto4GhWn/pZaCk+QTjWwMT
 DYZ9Qoog2H19XvRiDI6TTwgqmZUd0GRdNItSQ6Ao1WJt7yEjFICWHD/XfVsMWoCh8VZO
 YMDy9CMgG8pIzeXKabI23s0yz3LwTxuvcyxZltkF8cs+5VEiDa1IljS2cjwecSfValPB
 a/ecwpIArMVlNvnDK6e+s2ikYirXtuQCRWS6zpLBNCgpDEnj5HjBGTOi9knVepw5L5BL
 qLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=S9k8FKG4j03MJBTpWsc8b7htP2TIjKMqy+TI/78aQ4Q=;
 fh=ctjCSeoMG0Qxvz67WH+dh/jlO8V8TL6cQpglm/9dyB4=;
 b=OGoDF3grmnXs4nYG9jyV4LyayLxI1wEd1MAyTH/eFhbDOLypLhr1OxqfuVulJTJ2Xq
 gQC0CNmhQ8/Rb2czc0WSIhnVbAqluVjaSYVTfPL7D040bOiH2PZcLrzRNeL3T5jkE/WA
 GuF0aQBQjuVLLJb1EPCkQ70LgU+G57DuS0crKPsBsWWWiLDFav+ZE302GoxDL8GilVTu
 psFvCBsAu8lVLCFMxPEQgtEYtxa5y15eQi1Gic/h19RvkCQPtXxykcSl44D4vEN/tZy3
 vfEqxMftdLp/wqU2dNnDw7DW0EXDfMYx2FET77HD7pkxFuluw/bSSrlJ4ZWgI/1DvgLm
 wemw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789739679; x=1790344479; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=S9k8FKG4j03MJBTpWsc8b7htP2TIjKMqy+TI/78aQ4Q=;
 b=ViZbifj8LsRotP3z7bXZ6zsLT3ZnYn/CmIL+O0SqEKpLqnL1C9CWIhQAGh3oIbhpCZ
 0BpAN/ao9s6f/WAmdekCTSwpOx+z3Fm+2dgLfx/MH3k5d7/PDJ2O08kz2mSSgktsAu5t
 F7GLU/fBs81VjPvfJTq6xuwhXYPj+qw+9kgP5SikZUZHan8emynkVSmrYVj6eWLqaFC2
 HPn+5Y+i74x05524BFriAZFdP4Rzq2L7wbg01nWxRKuOhPGVz/Ps15Ym+n1hcMq66Lqs
 ZVRGjLby2WtAYi5DtK6iVee/N6CkCVhm3dQZBVzhzuuut4A/xti7OCucsJWcABzA35Fh
 Ep3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789739679; x=1790344479;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=S9k8FKG4j03MJBTpWsc8b7htP2TIjKMqy+TI/78aQ4Q=;
 b=reonyc9zdk2OyS7qA3u+IcVHxYk+VbTk5aqMlUz35GSSP0a9idSJ/lidI1bPCqx/qq
 Oc9Ibk5umzX7GhAMfeAslIzdToun3Aov1Z9i902nq1i422JYaZePLjbF8nDQ1Cn3U+6n
 BNs1Y3fwvaj8iRPPhNT8ezqu6ynvuQv1YxalN2gNIqLmGZWlMtjvRzNDiR8SGuHicmsg
 O1NqOCEQU6tWXOxB1WNPIgVqJAh7bis3xTTkx/sLLpQEfs98AlzA2Z9uUGPr/quNUOxy
 7kpsgQzUKDpfCqNHYo9iHByUe0evXbiqnJuiWxz+C9QSIhXy0EVshbhpKsrCz8oZcVk2
 YfDg==
X-Forwarded-Encrypted: i=1;
 AKwUvByhJIk18/TMiVX2QHDjP+uKr+6wYAH4Q31cJkH569GcxCLGQZuc+UcaxbgwVsWzR+af4NCRNAZ3KQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++k4vT2fCNwYLrt50C7zF2jE/MCwi9BlGiUdZ6x5CNSkSQBZw46m
 SyjSzix88LOzyvEg/7GXUuuPGZVrmjgd6zVJ77rNV/IFPWIn7tiMcV6Py8nl5oB0chPQooVlIJt
 gxgiOD+tlH10zFDlD1jU9HqNAwRwtBvM=
X-Gm-Gg: AYBFou1CkEYbps9h1E57pS/a511qKJOuF1/PFTROVHEhigB2WBlVjQFEenrBZwyz7l0
 +ypoYn7f3+Kc4wP+K3OJWb1eob9fGhSXjLTWDzIxVIte9ZZ6RkGOZUPzTejKetKZg2QZZWnHODl
 FYVHPkV1fvmMEhLJgaICZ9JpdlaEuTEuKL7BGR9iDF6QvcWBOj3rrbd/gwTa6u+qc0IpkGPLhbo
 jXRKmegIh5jSErB5fVAlJuNANIkGLUGIdYdvZWBqw7b0Yt3Gr89ulU1Vp3X7rbzK+yPqkav7s4x
 VQI1Iq9xqAFPPRsK53PCM/+4k63l8uCxQicAz/J4KHUSH99ZJo6GLUCQ1v5UCLF688gmnGOWvma
 Hzsgpz1PIMbOYoDl+qg==
X-Received: by 2002:ad4:5c69:0:b0:912:517b:918 with SMTP id
 6a1803df08f44-91254cf9991mr42645216d6.55.1789739676490; Fri, 18 Sep 2026
 06:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260905142500.17666-1-zhoulol888@gmail.com>
 <20260915064200.23171-1-zhoulol888@gmail.com>
 <69d0f3f3566521e516e439e818a619766561567c@intel.com>
 <CAEnyS7FrjPdkErjnNO5bOkEvrRdGfWYNB-GnhjpB2iKYFMJx5g@mail.gmail.com>
In-Reply-To: <CAEnyS7FrjPdkErjnNO5bOkEvrRdGfWYNB-GnhjpB2iKYFMJx5g@mail.gmail.com>
From: Activate Windows <zhoulol888@gmail.com>
Date: Fri, 18 Sep 2026 21:54:24 +0800
X-Gm-Features: AcwNN1WIs6CkWfPv2-lF5nz3B4wj_E4yv2c-VP8ml3oZP8t0e1qvS-gWSEP-GOc
Message-ID: <CAEnyS7GUNiOCReMzVrOqutxbpaOPX+AxJ5AueTvQbgODyVweWA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe/display: Remove invalid initial plane PTE check
 for iGPU
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000a85d1e065bc23d7f"
X-Mailman-Approved-At: Fri, 18 Sep 2026 15:27:49 +0000
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

--000000000000a85d1e065bc23d7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please drop this. Removing the check changes nothing, so the PTE check
isn't the cause. Sorry for the noise.

On Tue, Sep 15, 2026 at 9:59=E2=80=AFPM Activate Windows <zhoulol888@gmail.=
com>
wrote:

> Thank you.
> Follow-up: reading 0d5d5d0c2c72, the check assumes GRAPHICS_VERx100(xe)
> >=3D 1270 stands in for "MTL+ with LMEMBAR". On the PTL I hit this on, th=
e
> initial plane is rejected.
>
> I'm working out whether the BIOS PTE actually lacks XE_GGTT_PTE_DM there
> -- I'll follow up with a proper v2. I don't have the machine in front of =
me
> for a few days.
>
> On Tue, Sep 15, 2026 at 4:40=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com>
> wrote:
>
>> On Tue, 15 Sep 2026, Andrew Zhou <zhoulol888@gmail.com> wrote:
>> > Pantherlake integrated graphics can have the XE_GGTT_PTEDM bit set in
>> > the BIOS-initialised framebuffer PTE. The validation rejects this and
>> > fails to create the initial framebuffer, resulting in static.
>> >
>> > Remove the too-strict validation. Since this was the only caller of
>> > need_pte_local() outside the DGFX path, the helper is now
>> > unconditionally true there; fold the check and drop the dead
>> > need_pte_local() and has_lmembar() helpers.
>> >
>> > Signed-off-by: Andrew Zhou <zhoulol888@gmail.com>
>> > Tested-by: Andrew Zhou <zhoulol888@gmail.com>
>> > Tested-on: Intel Core Ultra X7 358H, integrated graphics, B0 stepping
>>
>> This is basically a revert of 0d5d5d0c2c72 ("drm/xe: Check the PTE local
>> memory bit for initial FB in stolen"). You'd do well to dig a bit of git
>> blame and see what changed, why, and by whom.
>>
>> Cc: Ville, Maarten, Matthew
>>
>>
>> BR,
>> Jani.
>>
>> > ---
>> > v1 -> v2:
>> > - Drop need_pte_local() and has_lmembar(), now dead after removing the
>> >   iGPU validation (sashiko)
>> > ---
>> >  drivers/gpu/drm/xe/display/xe_initial_plane.c | 20 +-----------------=
-
>> >  1 file changed, 1 insertion(+), 19 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> b/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> > index 0f86b7303..3484b3033 100644
>> > --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> > +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
>> > @@ -27,16 +27,6 @@ static bool is_pte_local(u64 pte)
>> >       return pte & XE_GGTT_PTE_DM;
>> >  }
>> >
>> > -static bool has_lmembar(struct xe_device *xe)
>> > -{
>> > -     return GRAPHICS_VERx100(xe) >=3D 1270;
>> > -}
>> > -
>> > -static bool need_pte_local(struct xe_device *xe)
>> > -{
>> > -     return IS_DGFX(xe) || has_lmembar(xe);
>> > -}
>> > -
>> >  static struct xe_bo *
>> >  initial_plane_bo(struct xe_device *xe,
>> >                struct intel_initial_plane_config *plane_config)
>> > @@ -60,7 +50,7 @@ initial_plane_bo(struct xe_device *xe,
>> >       if (IS_DGFX(xe)) {
>> >               u64 pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
>> >
>> > -             if (is_pte_local(pte) !=3D need_pte_local(xe)) {
>> > +             if (!is_pte_local(pte)) {
>> >                       drm_err(&xe->drm, "Initial plane PTE has bad
>> local memory bit\n");
>> >                       return NULL;
>> >               }
>> > @@ -85,7 +75,6 @@ initial_plane_bo(struct xe_device *xe,
>> >                           &phys_base);
>> >       } else {
>> >               struct ttm_resource_manager *stolen;
>> > -             u64 pte;
>> >
>> >               stolen =3D ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>> >               if (!stolen) {
>> > @@ -93,13 +82,6 @@ initial_plane_bo(struct xe_device *xe,
>> >                       return NULL;
>> >               }
>> >
>> > -             pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
>> > -
>> > -             if (is_pte_local(pte) !=3D need_pte_local(xe)) {
>> > -                     drm_err(&xe->drm, "Initial plane PTE has bad
>> local memory bit\n");
>> > -                     return NULL;
>> > -             }
>> > -
>> >               phys_base =3D base;
>> >               flags |=3D XE_BO_FLAG_STOLEN;
>>
>> --
>> Jani Nikula, Intel
>>
>

--000000000000a85d1e065bc23d7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please drop this. Removing the check changes nothing, so t=
he PTE check isn&#39;t the cause. Sorry for the noise.</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Sep 15, 2026 at 9:59=E2=80=AFPM Activate Windows &lt;<a href=3D"m=
ailto:zhoulol888@gmail.com">zhoulol888@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr">Thank you.<br><span>Follow-up: reading 0d5d5d0c2c72, the check ass=
umes </span><code>GRAPHICS_VERx100(xe) &gt;=3D 1270</code><span> stands in =
for &quot;MTL+ with LMEMBAR&quot;. On the PTL I hit this on, the initial pl=
ane is rejected.=C2=A0<br><br>I&#39;m working out whether the BIOS PTE actu=
ally lacks XE_GGTT_PTE_DM there -- I&#39;ll follow up with a proper v2. I d=
on&#39;t have the machine in front of me for a few days.</span></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep =
15, 2026 at 4:40=E2=80=AFPM Jani Nikula &lt;<a href=3D"mailto:jani.nikula@l=
inux.intel.com" target=3D"_blank">jani.nikula@linux.intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 15 Sep=
 2026, Andrew Zhou &lt;<a href=3D"mailto:zhoulol888@gmail.com" target=3D"_b=
lank">zhoulol888@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div>

--000000000000a85d1e065bc23d7f--
