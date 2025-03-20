Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C54C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 17:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A1D10E1F1;
	Thu, 20 Mar 2025 17:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVc1gEur";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9909510E1F1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 17:11:14 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-301e05b90caso1328175a91.2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742490674; x=1743095474; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2lJXwYQq4FM4hIAl+fX3Gva/jMaD08DDmfgI53IeQZA=;
 b=XVc1gEurCJm3rdKU68TRvtOUGylGkv4ZwIx2jNXsPN4+E6dM5xdT8+yWbjCohyB8EP
 nxbqB0qNsuotE8oQe5G67o9XGl+CmVT1xNFLkxTlTvfQexG76WJ/sfk7uxj/PGC9cN1P
 m/VzG3mBCN+mIU1f0OlzK/j+kiPJ8g02pGUDguh3xPLRlaniDjXz8/sHOe/KOrI+tvmv
 p0uja1LPtEvRoN+wUdgrd22ktmpa7ri46VKhiOl1LI/UPiDrYFrldVZ7QPRN8VyVrMS1
 6rV7TpyGcaPWj5OAFd7A+GTpHbl2EfbHLZxsr8SdZg9XpWNNQnERhRfVEI9cmRcQK7B9
 F+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742490674; x=1743095474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2lJXwYQq4FM4hIAl+fX3Gva/jMaD08DDmfgI53IeQZA=;
 b=ZhnB4reAG8u4q4mBXjTRgKhi40XmxD08dJLoPAPSG06skQrC1TPCsuY5YanNiPMMcF
 3SwSG0erhqTBso335X1FuQQZht6xIzwUf/YK+CMO6Q1PZTtM3vUZr/WYa8FKC//Jov5d
 iNJROjCMMMA12pzsk8+wr/rr7efpzBWHB7veJlSfG/CV+3H+mkeFQGrZd798/fyCTGcO
 FLvjR1tqLhnLYtxYnRQzyv1UtyRcljJ+n0Vq8ZMEf+7yVrob/WZHP/aJJJGf9KGCsS74
 dw+I0DYh4yC5Rm5xrXR2DpqiTpYX60ML+wgzm9m3SIduE5WzPY9zreNibELkVx9TD771
 /hYg==
X-Gm-Message-State: AOJu0YwZZvk5YnvlWJNRL/IyF/rZ/6rmBST4C2xBZVTeFq9JA1x1MQqU
 Iq6dOaVnbSCyHBRR+pzEa9tLlUIxPI/A5toTZXbWgQNhoqOQ3qCtNsxKQWfc3H46+WcPkM8csdG
 ar1lxudwQ33Q3LPRHHpdnWWh0wJ2tve45vHg=
X-Gm-Gg: ASbGncv/neiHhxOUN5Sa5z6punUjt03dYcg83XLZs3C5SmR5XQ4dxFPRuxQxUJFGRkD
 ZPXSVi3PFlO9OUQhTUB1f2nnS4k5NGMX35Uyfen2xm5QdifYxfjL4bY99BsU9N+104HCBJj1Na0
 H1MrjUBlmHD1Vsa0946IJVhYiaa/A=
X-Google-Smtp-Source: AGHT+IERoHnwYvyq2VtiowQ4oCNQYL8f7gqdSOfdmA5pAeagAysxL+TtNy7SZxPnhodFy8606DoNCz+WJIS4PRWrgRg=
X-Received: by 2002:a17:90b:2743:b0:2ea:a25d:3baa with SMTP id
 98e67ed59e1d1-3030fe6e1acmr8602a91.5.1742490673760; Thu, 20 Mar 2025 10:11:13
 -0700 (PDT)
MIME-Version: 1.0
References: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
 <CAJ=qYWR-OqU+RKSFic6OH-eRSzKLGDwR2GJxRjQSYv_ED=c9eA@mail.gmail.com>
 <6be0c617-49b7-44d5-9b75-e0a21703ac9c@igalia.com>
In-Reply-To: <6be0c617-49b7-44d5-9b75-e0a21703ac9c@igalia.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 20 Mar 2025 19:11:01 +0200
X-Gm-Features: AQ5f1JqFbf4UcJxNu2d9nd7Bq5IcJA23CDzbDsIGkO7naYd7lp2bjHxNM2LDag0
Message-ID: <CAJ=qYWQmh_4TMONXA2pfC0RfDtcOu3r3P250dkn2Dey5wVBS2Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] AuxCCS handling and render compression modifiers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com, 
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000a26b170630c93912"
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

--000000000000a26b170630c93912
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll try to find some moment to do bisecting, probably will be next week
when I get to do this.

/Juha-Pekka

to 20. maalisk. 2025 klo 10.25 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
kirjoitti:

>
> Hi,
>
> On 19/03/2025 13:41, Juha-Pekka Heikkil=C3=A4 wrote:
> > Hi Tvrtko,
> >
> > I did quick run with these patches. With these changes on top of
> > today's drm-tip I got a complete system freeze on mtl and its variants
> > when do modprobe. I had kgdb enabled but I wasn't even thrown there,
> > the machine went completely unresponsive. On 3/3 tries modprobe xe
> > always completely froze the box.
>
> I don't have MTL to try and neither apparently does CI, which otherwise
> seems happy, as is my ADL-P laptop.
>
> Would you have time to bisect? Or maybe netconsole to see what explodes?
>
> Not much comes to mind looking at the patches.. Maybe something runs to
> early before something else is initialised. Guessing only.
>
> Regards,
>
> Tvrtko
>
> > On Tue, Mar 18, 2025 at 6:22=E2=80=AFPM Tvrtko Ursulin
> > <tvrtko.ursulin@igalia.com> wrote:
> >>
> >> A series to fix and add xe support for AuxCSS framebuffers via DPT.
> >>
> >> Currently the auxiliary buffer data isn't mapped into the page tables
> at all so
> >> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built
> for Xe")
> >> had to disable the support.
> >>
> >> On top of that there are missing flushes and invalidations both from
> the ring
> >> buffer side and from the CPU side.
> >>
> >> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
> >>
> >>    [PLANE:32:plane 1A]: type=3DPRI
> >>            uapi: [FB:242] AR30 little-endian
> (0x30335241),0x100000000000008,2880x1800, visible=3Dvisible,
> src=3D2880.000000x1800.000000+0.000000+0.000000, dst=3D2880x1800+0+0,
> rotation=3D0 (0x00000001)
> >>            hw: [FB:242] AR30 little-endian
> (0x30335241),0x100000000000008,2880x1800, visible=3Dyes,
> src=3D2880.000000x1800.000000+0.000000+0.000000, dst=3D2880x1800+0+0,
> rotation=3D0 (0x00000001)
> >>
> >> Display seems working fine - no artefacts, no DMAR/PIPE faults. CI als=
o
> appears
> >> to be happy with v2.
> >>
> >> v2:
> >>   * More patches added to fix kms_flip_tiling.
> >>
> >> v3:
> >>   * Rebased after some cleanup patches from v2 were merged.
> >>   * Added people to Cc as suggested by Rodrigo.
> >>   * Adjusted last patch title. (Rodrigo)
> >>   * Apply GGTT flushing only to iomapped system memory buffers.
> >>
> >> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> >> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >>
> >> Tvrtko Ursulin (8):
> >>    drm/xe: Add ring buffer handling for AuxCCS
> >>    drm/xe: Use fb cached min alignment
> >>    drm/xe: Reduce DPT table alignment as in i915
> >>    drm/xe: Flush GGTT writes after populating DPT
> >>    drm/xe: Handle DPT in system memory
> >>    drm/xe: Force flush system memory AuxCCS framebuffers before scan o=
ut
> >>    drm/xe/display: Add support for AuxCCS
> >>    drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
> >>
> >>   .../drm/i915/display/skl_universal_plane.c    |   6 -
> >>   drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 ++++++++++++++--=
--
> >>   .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
> >>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
> >>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
> >>   drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
> >>   drivers/gpu/drm/xe/xe_ring_ops.c              | 173 +++++++++-------=
-
> >>   drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
> >>   8 files changed, 261 insertions(+), 123 deletions(-)
> >>
> >> --
> >> 2.48.0
> >>
>
>

--000000000000a26b170630c93912
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;ll try to find some moment to do bisecting, pr=
obably will be next week when I get to do this.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">/Juha-Pekka<br><br><div class=3D"gmail_quote gmail_=
quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">to 20. =
maalisk. 2025 klo 10.25 Tvrtko Ursulin &lt;<a href=3D"mailto:tvrtko.ursulin=
@igalia.com">tvrtko.ursulin@igalia.com</a>&gt; kirjoitti:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
Hi,<br>
<br>
On 19/03/2025 13:41, Juha-Pekka Heikkil=C3=A4 wrote:<br>
&gt; Hi Tvrtko,<br>
&gt; <br>
&gt; I did quick run with these patches. With these changes on top of<br>
&gt; today&#39;s drm-tip I got a complete system freeze on mtl and its vari=
ants<br>
&gt; when do modprobe. I had kgdb enabled but I wasn&#39;t even thrown ther=
e,<br>
&gt; the machine went completely unresponsive. On 3/3 tries modprobe xe<br>
&gt; always completely froze the box.<br>
<br>
I don&#39;t have MTL to try and neither apparently does CI, which otherwise=
 <br>
seems happy, as is my ADL-P laptop.<br>
<br>
Would you have time to bisect? Or maybe netconsole to see what explodes?<br=
>
<br>
Not much comes to mind looking at the patches.. Maybe something runs to <br=
>
early before something else is initialised. Guessing only.<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
<br>
&gt; On Tue, Mar 18, 2025 at 6:22=E2=80=AFPM Tvrtko Ursulin<br>
&gt; &lt;<a href=3D"mailto:tvrtko.ursulin@igalia.com" target=3D"_blank" rel=
=3D"noreferrer">tvrtko.ursulin@igalia.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; A series to fix and add xe support for AuxCSS framebuffers via DPT=
.<br>
&gt;&gt;<br>
&gt;&gt; Currently the auxiliary buffer data isn&#39;t mapped into the page=
 tables at all so<br>
&gt;&gt; cf48bddd31de (&quot;drm/i915/display: Disable AuxCCS framebuffers =
if built for Xe&quot;)<br>
&gt;&gt; had to disable the support.<br>
&gt;&gt;<br>
&gt;&gt; On top of that there are missing flushes and invalidations both fr=
om the ring<br>
&gt;&gt; buffer side and from the CPU side.<br>
&gt;&gt;<br>
&gt;&gt; Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 [PLANE:32:plane 1A]: type=3DPRI<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uapi: [FB:242] AR30 littl=
e-endian (0x30335241),0x100000000000008,2880x1800, visible=3Dvisible, src=
=3D2880.000000x1800.000000+0.000000+0.000000, dst=3D2880x1800+0+0, rotation=
=3D0 (0x00000001)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hw: [FB:242] AR30 little-=
endian (0x30335241),0x100000000000008,2880x1800, visible=3Dyes, src=3D2880.=
000000x1800.000000+0.000000+0.000000, dst=3D2880x1800+0+0, rotation=3D0 (0x=
00000001)<br>
&gt;&gt;<br>
&gt;&gt; Display seems working fine - no artefacts, no DMAR/PIPE faults. CI=
 also appears<br>
&gt;&gt; to be happy with v2.<br>
&gt;&gt;<br>
&gt;&gt; v2:<br>
&gt;&gt;=C2=A0 =C2=A0* More patches added to fix kms_flip_tiling.<br>
&gt;&gt;<br>
&gt;&gt; v3:<br>
&gt;&gt;=C2=A0 =C2=A0* Rebased after some cleanup patches from v2 were merg=
ed.<br>
&gt;&gt;=C2=A0 =C2=A0* Added people to Cc as suggested by Rodrigo.<br>
&gt;&gt;=C2=A0 =C2=A0* Adjusted last patch title. (Rodrigo)<br>
&gt;&gt;=C2=A0 =C2=A0* Apply GGTT flushing only to iomapped system memory b=
uffers.<br>
&gt;&gt;<br>
&gt;&gt; Cc: Jos=C3=A9 Roberto de Souza &lt;<a href=3D"mailto:jose.souza@in=
tel.com" target=3D"_blank" rel=3D"noreferrer">jose.souza@intel.com</a>&gt;<=
br>
&gt;&gt; Cc: Juha-Pekka Heikkila &lt;<a href=3D"mailto:juhapekka.heikkila@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">juhapekka.heikkila@gmail.com=
</a>&gt;<br>
&gt;&gt; Cc: Michael J. Ruhl &lt;<a href=3D"mailto:michael.j.ruhl@intel.com=
" target=3D"_blank" rel=3D"noreferrer">michael.j.ruhl@intel.com</a>&gt;<br>
&gt;&gt; Cc: Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@li=
nux.intel.com" target=3D"_blank" rel=3D"noreferrer">ville.syrjala@linux.int=
el.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Tvrtko Ursulin (8):<br>
&gt;&gt;=C2=A0 =C2=A0 drm/xe: Add ring buffer handling for AuxCCS<br>
&gt;&gt;=C2=A0 =C2=A0 drm/xe: Use fb cached min alignment<br>
&gt;&gt;=C2=A0 =C2=A0 drm/xe: Reduce DPT table alignment as in i915<br>
&gt;&gt;=C2=A0 =C2=A0 drm/xe: Flush GGTT writes after populating DPT<br>
&gt;&gt;=C2=A0 =C2=A0 drm/xe: Handle DPT in system memory<br>
&gt;&gt;=C2=A0 =C2=A0 drm/xe: Force flush system memory AuxCCS framebuffers=
 before scan out<br>
&gt;&gt;=C2=A0 =C2=A0 drm/xe/display: Add support for AuxCCS<br>
&gt;&gt;=C2=A0 =C2=A0 drm/i915/display: Expose AuxCCS frame buffer modifier=
s for Xe<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0.../drm/i915/display/skl_universal_plane.c=C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 -<br>
&gt;&gt;=C2=A0 =C2=A0drivers/gpu/drm/xe/display/xe_fb_pin.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 181 ++++++++++++++----<br>
&gt;&gt;=C2=A0 =C2=A0.../gpu/drm/xe/instructions/xe_gpu_commands.h |=C2=A0 =
=C2=A01 +<br>
&gt;&gt;=C2=A0 =C2=A0.../gpu/drm/xe/instructions/xe_mi_commands.h=C2=A0 |=
=C2=A0 =C2=A06 +<br>
&gt;&gt;=C2=A0 =C2=A0drivers/gpu/drm/xe/regs/xe_gt_regs.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
&gt;&gt;=C2=A0 =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 173 +++++++++--------<br>
&gt;&gt;=C2=A0 =C2=A0drivers/gpu/drm/xe/xe_ring_ops_types.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 =C2=A08 files changed, 261 insertions(+), 123 deletions(-)<b=
r>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.48.0<br>
&gt;&gt;<br>
<br>
</blockquote></div></div></div>

--000000000000a26b170630c93912--
