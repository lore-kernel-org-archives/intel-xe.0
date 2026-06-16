Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A45CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 10:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DDB10EF4A;
	Wed, 17 Jun 2026 10:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YBCNELCM";
	dkim-atps=neutral
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED70010EA25
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 11:10:23 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-7e2f9471acbso5040117b3.1
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 04:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781608223; cv=none;
 d=google.com; s=arc-20240605;
 b=bzvNw4W9qXjTg6VokWyNPJ8vrEZbhLOyugUf4fR6qHRzt8IF4r57u1DeFyyrWMsslf
 3I0Z/fdXzci50GOUIJQcZB+k6Q1uk3YWqcNOuut9Wcn+V/lIS3QzUup4wxy/r9zYoSCA
 JNX4sNfZiJrXl376ryc7INqQ7qOkv1abLCUKRx/OKOCct7piZiQ2Jzd5KsDDtHZaJpze
 j8ZnaaWiTT96ESg6kqnKIedcmG9TePuBWrth/Esa8hZM+uUZ35uNXsLCPkhpjozIAYjU
 b19qONIBuuNPHfxmDyYl1LcbDRu3P24gIGnuTYQbdrZTGdRu0ssEI9/71Lalx5pcWVve
 4oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XnQGf3/5vCqgVWqxY/DGqYxzXTgm/RoqiCdxmqh6DjI=;
 fh=Q/6JOeLTM0Uce52pgmEocxIXTNEnaAd8dEqAZj7NpqY=;
 b=iLqh0YfOGRrHNcjntT642sfriPm4Ojr4TXTiXGYGzQst6CMrao2D2pNhKTf4VLuktm
 mSD5vUYoYiBi1DgTVWZDUk9z0+l8zJ8Zsr3YchFjrmJ3wop2N8Hy4ugsjS8H6S9RTAuQ
 k8CqNQHxWW1Nf8fCUvwmB+WF8xc/XkkfFjFb6Idt7MCSNukMZZj2mph89Mbw8p+DAlNX
 3XkScVCDPQFQTRRan/nv/+w4GgHd/9hnwg+gll3/HG4XCzM9mV/RSt1pVtzXDjPYbkXT
 mMVJXBg3rywzz8iRJg+kOoXwjBNwgQJPESlo06hWMCQTHRdTYUA3uRxUTpPCPiXc6hLh
 tCGw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781608223; x=1782213023; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XnQGf3/5vCqgVWqxY/DGqYxzXTgm/RoqiCdxmqh6DjI=;
 b=YBCNELCMGkpbaySp97/fGqoguhpdq1WdGOdZN5pEHnjpoDWxTKMSNvPa4xNs8AIWJi
 uwDawC5rcw0sGBuA8ypNmRcATMa3UGN4UZjQWkQAe1kPj/eODKH2JeaUIOYFf1s5zWNk
 iSbAYFyWW64StBBU2sLAEoIEF358tZjV6bDI6S9od6UCxZCzh0KF4dLFYxD93ErGfkTW
 ykKM3TZODeA8lURwqrFYxl8EU1AAGvKwl2m1kfDUfCaHd6LWWWgvw+k3UoGv7MZBTTDS
 wUHdD9liJamaTvKzExzR/8cclIZMfOZTqloT1S+Ep6vF/34/Cl8pErHVPTDAE2jwJYh8
 UXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781608223; x=1782213023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XnQGf3/5vCqgVWqxY/DGqYxzXTgm/RoqiCdxmqh6DjI=;
 b=o8vnwdBXZLih+iMruEM9we2pdwzpWVF2uB/aPLVo6ZpGGmSXLZWtvocn+KnDLghYXF
 ZCkgLU3R6USAGn1LQ3Y89roTsXrtnnQsJ7sBJWhfInjkwCQ4/Q0m00y00cuAP2h0jeYg
 +WzsQW2vDamsI2K7TKxLDvS8RHMWfWdEqNJjNbC+AeMaoM9ZH5EGMEN+cA1hlfHIdh+a
 +6tH3HqaSR5mL+AbkITn80cjEFMe3oumsRT5+bhLdHFdhf4I09HOtJShpJm6RK3RLIqg
 6r9n2tfeAialMEZmZn7cgtSI4+3PVRTaS104ELLszEGZ/FdjCkGRCoO7taG++SKSvvle
 VWsw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8F1Q3LUwi34ntioOu+CVCqDzG3WEjhwjQtEsaRxXWxhjeUYwd+VocMEDRfVRVejFGhQymvomAiog==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8pQxHdKQ/SsungHDhqwiAabmTZgSV5gQQ9Oq2ON0ZxmiInVL6
 sGse4jr5gDSPS+VlsJZN44cbZUAeurobwoe20HsLD7CFIExbPrNKG+EeCpYQP4al/xcdFibCTYV
 lHHzspFiaF06Cjbc6hAy9/T4vvrHWU0s=
X-Gm-Gg: Acq92OFcD0kMahEJJ3nmmqCuSPn6dNyj3stRn2N8UPfRXIYyfBOMuPMTG+42ej7uA+l
 EcPaL9kZM+XlfluAUxaHwGji+37JE97jgWz4kcDQ4jOOvLY6aAFyIbTa90IVe6g249EwgzmEnf4
 owgu55CJvCrP9UjqzlvTukg+0qaXCriw3EsEOlu5qUi0sERmgZYbU69iALuwPQFsOutusBeaaYF
 pQSfrKEhDy7zpT4W5rzT2ONRpd49PpbqbMjil/hQJx+jbTVE0ASzaZhVh1ElC/wCKlQZ5ozHDXm
 JA95ZJmPGQRBgVyDXZmcD1pLqZFQyGmAM0qNRenA7IBLNhzvTYxazgdKODhKRvk=
X-Received: by 2002:a05:690c:e3c9:b0:7f0:d73e:99b4 with SMTP id
 00721157ae682-7f7b9524a9amr111398567b3.7.1781608222575; Tue, 16 Jun 2026
 04:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260616-fec-v2-0-49a22680138c@intel.com>
 <9827508667e0b19e939284e7989a47df278667f7@intel.com>
In-Reply-To: <9827508667e0b19e939284e7989a47df278667f7@intel.com>
From: Stephen Fuhry <fuhrysteve@gmail.com>
Date: Tue, 16 Jun 2026 07:10:11 -0400
X-Gm-Features: AVVi8CfddeaXSDOf8qsmrNlny4rpNYBN6cmdcKLZIMrdtNAAvNLuHoROx0Tuz1w
Message-ID: <CAEraX5w2fFBkoEzCt3kK+rrWCsDxBtM+AX4=fmDFUAS-vJxMMA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Unify fec enable/disable across the mst streams
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000003c504306545cfd34"
X-Mailman-Approved-At: Wed, 17 Jun 2026 10:06:59 +0000
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

--0000000000003c504306545cfd34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

I'm the user who reported the underlying bug -- happy to provide some
concrete grounding for why the problem is real and the fix is at the
right level.

The symptom: replug of a ThinkPad USB-C Dock Gen2 (DP-MST, two
monitors, DSC+FEC on both) triggers a cascade of ~40 fec_enable
fastset mismatches in a ~3 second window, forcing repeated full
modesets that cause a ~2 minute display cycling loop before the
topology settles. The cascade is visible in dmesg even on a clean
drm-tip build with no patches applied.

Arun's analysis is correct. The root cause is exactly the per-port /
per-stream mismatch he described: when only one MST stream is in the
atomic commit, intel_pipe_config_compare() computes fec_enable=3Dfalse
for that stream, but the sibling stream has already enabled FEC at the
HW level (DP_TP_CTL_FEC_ENABLE is link-wide), so the fastset check
fails and falls back to a full modeset. That modeset commits one
stream at a time, perpetuating the mismatch for the other stream on
the next check, and so on.

With both patches applied (tested on 7.0.10 + series/168418), the
replug is completely clean: zero fec_enable mismatches, no full
modeset, displays come back in normal hotplug time.

The complexity in the patch comes from the problem itself: FEC
genuinely is link-wide at HW but per-stream in the driver's state.
Any fix has to either unify the per-stream state before the fastset
comparison or avoid comparing the per-stream state for a per-link HW
bit. The unify approach Arun has here is the most direct way to make
the driver's state consistent with the hardware's invariant.

Stephen Fuhry

On Tue, Jun 16, 2026 at 4:01=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com>
wrote:

> On Tue, 16 Jun 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > First version of the patch included only one patch i.e the ref count
> > https://patchwork.freedesktop.org/series/167664/
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> > Arun R Murthy (2):
> >       drm/i915/mst: Unify fec_enable across mst streams
> >       drm/i915/display: Refcount for fec enable/disable
> >
> >  drivers/gpu/drm/i915/display/intel_ddi.c           | 58
> ++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_ddi.h           |  1 +
> >  drivers/gpu/drm/i915/display/intel_display_types.h |  3 +
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c        | 70
> ++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_modeset_setup.c |  6 ++
> >  5 files changed, 138 insertions(+)
>
> Okay, this may seem a bit unfair, since I haven't dug deep into the
> problem, but I really have a hard time believing this level of
> complexity is required for FEC.
>
>
> BR,
> Jani.
>
>
> > ---
> > base-commit: c585a0a7e48a48aca80f7c0acb7294c7bf301bb7
> > change-id: 20260616-fec-82a3d27e0f11
> >
> > Best regards,
>
> --
> Jani Nikula, Intel
>

--0000000000003c504306545cfd34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jani,</div><div><br></div><div>I&#39;m the user wh=
o reported the underlying bug -- happy to provide some</div>concrete ground=
ing for why the problem is real and the fix is at the<br>right level.<br><b=
r>The symptom: replug of a ThinkPad USB-C Dock Gen2 (DP-MST, two<br>monitor=
s, DSC+FEC on both) triggers a cascade of ~40 fec_enable<br>fastset mismatc=
hes in a ~3 second window, forcing repeated full<br>modesets that cause a ~=
2 minute display cycling loop before the<br>topology settles. The cascade i=
s visible in dmesg even on a clean<br>drm-tip build with no patches applied=
.<br><br>Arun&#39;s analysis is correct. The root cause is exactly the per-=
port /<br>per-stream mismatch he described: when only one MST stream is in =
the<br>atomic commit, intel_pipe_config_compare() computes fec_enable=3Dfal=
se<br>for that stream, but the sibling stream has already enabled FEC at th=
e<br>HW level (DP_TP_CTL_FEC_ENABLE is link-wide), so the fastset check<br>=
fails and falls back to a full modeset. That modeset commits one<br>stream =
at a time, perpetuating the mismatch for the other stream on<br>the next ch=
eck, and so on.<br><br>With both patches applied (tested on 7.0.10 + series=
/168418), the<br>replug is completely clean: zero fec_enable mismatches, no=
 full<br>modeset, displays come back in normal hotplug time.<br><br>The com=
plexity in the patch comes from the problem itself: FEC<br>genuinely is lin=
k-wide at HW but per-stream in the driver&#39;s state.<br>Any fix has to ei=
ther unify the per-stream state before the fastset<br>comparison or avoid c=
omparing the per-stream state for a per-link HW<br>bit. The unify approach =
Arun has here is the most direct way to make<br>the driver&#39;s state cons=
istent with the hardware&#39;s invariant.<br><br>Stephen Fuhry</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Jun 16, 2026 at 4:01=E2=80=AFAM Jani Nikula &lt;<a href=3D=
"mailto:jani.nikula@linux.intel.com">jani.nikula@linux.intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 16 =
Jun 2026, Arun R Murthy &lt;<a href=3D"mailto:arun.r.murthy@intel.com" targ=
et=3D"_blank">arun.r.murthy@intel.com</a>&gt; wrote:<br>
&gt; First version of the patch included only one patch i.e the ref count<b=
r>
&gt; <a href=3D"https://patchwork.freedesktop.org/series/167664/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.freedesktop.org/series/167664=
/</a><br>
&gt;<br>
&gt; Signed-off-by: Arun R Murthy &lt;<a href=3D"mailto:arun.r.murthy@intel=
.com" target=3D"_blank">arun.r.murthy@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; Arun R Murthy (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm/i915/mst: Unify fec_enable across mst st=
reams<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm/i915/display: Refcount for fec enable/di=
sable<br>
&gt;<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_ddi.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 58 ++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_ddi.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_display_types.h |=C2=A0 3 +<b=
r>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_dp_mst.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 70 ++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_modeset_setup.c |=C2=A0 6 ++<=
br>
&gt;=C2=A0 5 files changed, 138 insertions(+)<br>
<br>
Okay, this may seem a bit unfair, since I haven&#39;t dug deep into the<br>
problem, but I really have a hard time believing this level of<br>
complexity is required for FEC.<br>
<br>
<br>
BR,<br>
Jani.<br>
<br>
<br>
&gt; ---<br>
&gt; base-commit: c585a0a7e48a48aca80f7c0acb7294c7bf301bb7<br>
&gt; change-id: 20260616-fec-82a3d27e0f11<br>
&gt;<br>
&gt; Best regards,<br>
<br>
-- <br>
Jani Nikula, Intel<br>
</blockquote></div>

--0000000000003c504306545cfd34--
