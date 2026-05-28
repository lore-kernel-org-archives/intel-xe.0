Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16220CD6E64
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A972911341C;
	Mon,  1 Jun 2026 14:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="m1RRpBr2";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622A610F6AE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 22:35:45 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a86704c74eso52e87.0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 15:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780007744; cv=none;
 d=google.com; s=arc-20240605;
 b=bRyEAkFPOgrt9D5lsKbWgpQbvoncKwu8Zthj0MUHQnydCZcckg3Ot3pUXZP3+05cKw
 MG6A6y8muYHJSHp4zZfG7FnlhTK9fJyfk8KFUWVtRiJiz7YhtAMaGaSEzdqd4hjt2lVg
 rdZ2Yjf7UWV/VS8v10692wX4OUk8XQLc5MffoT/owA923JCpawvnN5S/7DU30w00NHrc
 p0151Sb37mcmW4wW+ks+x5pvv+AUe21KDBSqsKGehvTOMmMJdk9v77PTm3vTEWMYmrFb
 2noYLza2Ai0IwLrmgZ8tpVlR6x2exesDcS2PMBU2jwoNP/Oe7gWcbPM7eFVBgalEVzgN
 pnYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lIvOXaXwTeXkMfopHgPR/A+WpNgIoLHOtB39AhMBijQ=;
 fh=tBBcPneDIr+aDUyNs3IlFWT/6zkEEE24ileymXhTLcg=;
 b=OprbPxpxKmDwAM9j27xPGxW9RIwaD3OCpUBH+UXXksT2oujAiIBHgcY7FHFz+SBaHa
 cEu2TKbD1VeA7DUg1fORH42Us143VGyWpLUzwwJyoAHKRDfg1o10A5ajObcJRHVon5bI
 yBdpfFsT2Wd6cnzJ5ISjubC6R80ru+bDJkbcZyZi8Zq654bJHDzXIHABhV48F8zu0lBs
 t9I0lE5ro/PONAW6mAqPw3OHKXvch7OjcndyLHz3cEhuNaxm8WvYRk6anAi7zX1OWE/i
 PAmCaSYcE1oU/7aUcGoPdt1Q/nawTclPU16o7bPf+fjC0M9GGdECyg2vgErRB7v+JPvM
 T79g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1780007744; x=1780612544;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lIvOXaXwTeXkMfopHgPR/A+WpNgIoLHOtB39AhMBijQ=;
 b=m1RRpBr2wDctEtcf+a99Nu5WSnIu/AlsHB5SJjKihAAl2d9/MxhfG5LTtNtY490R3h
 08LjySOJ1kof/lxvoKhfnXw1wq7G9e1W+XdbDTdofFv/jBBY3//xjyO8ChV3dByT4n7V
 gtxydKG2rrhUguC8nXGezNlYNCYUbvzlzdkgK4vlrp3tN2PXWyZpgFtKIh8YBOvPRb9h
 Dj0HPd2AJ9TFkdcqUvpBr4bxQfsZ9nFMv138VEYUro8uVOcaroFNJRWi10LDoGNGMj6F
 TCMGb79OWN7/ShjoulAoraih04py3PFyZbF4x+H0OWBeyl+HQP5JX0tpUef7op28t98f
 dROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780007744; x=1780612544;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIvOXaXwTeXkMfopHgPR/A+WpNgIoLHOtB39AhMBijQ=;
 b=ZKhQmyDjKSjWcDYk358JJWYQm30AmpY33K1QjYrFTPF0ZjFkZOkQZq3/EjykK4CW3Z
 VVm+v5rpQCiWsT2lR5mj8lI/7JyY6RqlPYZe6BNitw4l6DelAe9iufFBS5cJI45hFF1R
 qsyfeJcCiIg7wQ/CYPzwSPFIACFdxR2jbaxpr0XItXHlvwJPPXxK/sY10qimUR7mutK7
 liMlcF6umeb9Oa9cKBQa4f8KR7wD9eX8fs8vBExL/wGfM2IOAXBXVhha9UvwkJFuM6LW
 pDw/XD1NbRmubcEdSOu4QFhthhaL/DmOJLAaMVlAzTdZKMCp+WcIO+MaQcBBtV4CPWS8
 V+yg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/kChuhv50yzenTogW3hBrm0RCDHu/7PnlimKGqGimF0PCTxL2K68EnkjNlmp3phmMIU9O2SRJy0Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA1ZKHNDT3p3YcrvfBbQzEDm3bePlYdDOzWuqzcimZn9AWAcGm
 zj7hnw/oyZTV8Q/AjjD0RPsgtwIX1teSy2UP+oGGT7qM9p0+nw6/UEhPYBhy//qSTpqoM2SE72s
 Mp5eSFbA+wktvT2gSELQbQlic6bdZtZzfEdqP3OcP
X-Gm-Gg: Acq92OGCYvSTrDEK4xmrVHPYGlN67q6IdcDWIyvnF825JfKF+Qyw9lTVi3IYhV3VSpV
 v6iakULk4AJ4fzIZ8nVtbWC9ASFBHg+3j7CZ+c5yEncukE8wCWuhC8nx7x04rN0WdlG3u3M6vp1
 p+Ki1IpEEUYSkKSDsDry8bkRRj0Z70GOBl8+HOkXeN3ycVcdct4nuwIVTHU/rxO5B3qRGGT5AMB
 6c6et3usGsz1FWOYkhJSOQDIPR6VGvuRixKEWPeEAD/Pz2HpeGQeBKmfWdvQ4ESSP53PRiRC0fC
 WPUZkeSnSyuDWS17d+e8NafX+Suc3lAD0wSqE8knKabiYsXD8J74p+WOYr8=
X-Received: by 2002:a05:6512:258a:b0:5aa:4c72:8732 with SMTP id
 2adb3069b0e04-5aa5907530fmr35641e87.10.1780007743102; Thu, 28 May 2026
 15:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
 <ahjBbUwF_8jcXKHY@google.com>
In-Reply-To: <ahjBbUwF_8jcXKHY@google.com>
From: Ray Juang <radford@google.com>
Date: Thu, 28 May 2026 15:35:04 -0700
X-Gm-Features: AVHnY4LLBzoQhstbNlLSXedrI8TTDb0rZTJCtsYcYczc_kkW95WhWrmsyePM5m4
Message-ID: <CAJ4HTqXaeWZ_1s0+m8SrY7V7YGAxwqG69xO6GHSSXdUiEuuokw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] More Fixes for color pipeline
To: Brian Geffon <bgeffon@google.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com, 
 uma.shankar@intel.com, pranay.samala@intel.com, gildekel@google.com, 
 seanpaul@google.com
Content-Type: multipart/alternative; boundary="0000000000003a027e0652e85917"
X-Mailman-Approved-At: Mon, 01 Jun 2026 14:40:04 +0000
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

--0000000000003a027e0652e85917
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks! We've tested the patch series in
https://patchwork.freedesktop.org/series/166293/ and confirmed that they
resolve a severe memory leak contributing to 100-120 kb/s memory growth
during animation or video playback. We also confirmed in our IGT test suite
that the tests pass when the patches were in place. It would be helpful if
we can get the patches in.

On Thu, May 28, 2026 at 3:28=E2=80=AFPM Brian Geffon <bgeffon@google.com> w=
rote:

> On Mon, May 11, 2026 at 11:02:09AM +0530, Chaitanya Kumar Borah wrote:
> > v3:
> > - Re-arrange patches
>
> We've been impacted by this on PTL devices. Ray has tested and can
> provide more details.
>
> In the meantime can we ask that a maintainer take a look?
>
> >
> > v2:
> > - Make dependency on atomic state more explicit (Ville)
> > - handle blobs in hw state clear
> >
> > Chaitanya Kumar Borah (4):
> >   drm/i915/display: Copy color pipeline from plane in the primary joine=
r
> >     pipe
> >   drm/i915/display: Don=E2=80=99t use atomic state back-pointer to deri=
ve color
> >     pipeline
> >   drm/i915: Avoid programming color HW blocks for NV12 Y planes
> >   drm/i915: Fix color blob reference handling in intel_plane_state
> >
> >  drivers/gpu/drm/i915/display/intel_cursor.c   |  2 +-
> >  .../drm/i915/display/intel_initial_plane.c    |  2 +-
> >  drivers/gpu/drm/i915/display/intel_plane.c    | 77 ++++++++++++++-----
> >  drivers/gpu/drm/i915/display/intel_plane.h    |  5 +-
> >  4 files changed, 61 insertions(+), 25 deletions(-)
> >
>
> Thanks!
> Brian
>
> > --
> > 2.25.1
> >
>

--0000000000003a027e0652e85917
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! We&#39;ve tested the patch series in=C2=A0<a href=
=3D"https://patchwork.freedesktop.org/series/166293/" target=3D"_blank">htt=
ps://patchwork.freedesktop.org/series/166293/</a> and confirmed that they r=
esolve a severe memory leak contributing to 100-120 kb/s memory growth duri=
ng animation or video playback. We also confirmed in our IGT test suite tha=
t the tests pass when the patches were in place. It would be helpful if we =
can get the patches in.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, May 28, 2026 at 3:28=E2=80=AFPM Brian Geffon=
 &lt;<a href=3D"mailto:bgeffon@google.com" target=3D"_blank">bgeffon@google=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Mon, May 11, 2026 at 11:02:09AM +0530, Chaitanya Kumar Borah wrote:<=
br>
&gt; v3:<br>
&gt; - Re-arrange patches<br>
<br>
We&#39;ve been impacted by this on PTL devices. Ray has tested and can<br>
provide more details.<br>
<br>
In the meantime can we ask that a maintainer take a look?<br>
<br>
&gt; <br>
&gt; v2:<br>
&gt; - Make dependency on atomic state more explicit (Ville)<br>
&gt; - handle blobs in hw state clear<br>
&gt; <br>
&gt; Chaitanya Kumar Borah (4):<br>
&gt;=C2=A0 =C2=A0drm/i915/display: Copy color pipeline from plane in the pr=
imary joiner<br>
&gt;=C2=A0 =C2=A0 =C2=A0pipe<br>
&gt;=C2=A0 =C2=A0drm/i915/display: Don=E2=80=99t use atomic state back-poin=
ter to derive color<br>
&gt;=C2=A0 =C2=A0 =C2=A0pipeline<br>
&gt;=C2=A0 =C2=A0drm/i915: Avoid programming color HW blocks for NV12 Y pla=
nes<br>
&gt;=C2=A0 =C2=A0drm/i915: Fix color blob reference handling in intel_plane=
_state<br>
&gt; <br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_cursor.c=C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
&gt;=C2=A0 .../drm/i915/display/intel_initial_plane.c=C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_plane.c=C2=A0 =C2=A0 | 77 +++=
+++++++++++-----<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_plane.h=C2=A0 =C2=A0 |=C2=A0 =
5 +-<br>
&gt;=C2=A0 4 files changed, 61 insertions(+), 25 deletions(-)<br>
&gt;<br>
<br>
Thanks!<br>
Brian<br>
<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
</blockquote></div>

--0000000000003a027e0652e85917--
