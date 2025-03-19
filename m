Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CD7C35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 13:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFFC10E4FD;
	Wed, 19 Mar 2025 13:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lWln/sqA";
	dkim-atps=neutral
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD20D10E4FD
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Mar 2025 13:41:17 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2f9d3d0f55dso8333005a91.1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Mar 2025 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742391677; x=1742996477; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEwNg3rjwvwXugja3csrHhUgqyIiWf+qcL+Ew8o1zsQ=;
 b=lWln/sqAQ/3LqMXUO3ZJKI3X0UASE6fZdJHvQjIAfR4yResbxCBxLfOXSs3K40vgMz
 jnxyYxNiDe/niCyt3enLjskiUMDR03sEWg3kfak0l6mVdamFcyi7KVJzs2p0B1o2ojfH
 YoHIrO3p4XVxgvBgthDGTIC7VU7prIc0/Bzbn9kHO/A9FfFd0PfwbczTbWksFF+jQpkf
 AmdvhWSwk1nFPHWzqBzWxrM7VdihWVEXh7xQpZ6cxBn6ajlc/VZJ/QxB+xpcoBs1bfZD
 PFEvXoPTIcZa1JS8MTj8I4PaqNE3O7w7/Q1rF2JAydTlyNCTs8N3E5EiHgL39qjgmk59
 vfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742391677; x=1742996477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEwNg3rjwvwXugja3csrHhUgqyIiWf+qcL+Ew8o1zsQ=;
 b=D+zeycTXyXIB3uPoPA02XewvXmhVQ02rhSn1U6HEnWqH/VaUNFi8WNDS1v4lqJqHat
 2zoGpsHDsJHyXDSCU7wH1q4UAlteFZ0nzyqqwOoSv1KYKfL3MWoWx+vgqDMJiscvT+wc
 XwAL8JVOiaXRKW0ELKVkggHn17oGAHPqiHFN9DvYt7xlVn2dc7LuE5/C336FRBC7Ls9B
 qQd/Wlg/KIRDnkBfemGBH6UTLfHV5+ld6a5/2vdalw3e2lShVIBDMnmzzhkI+Eu4N0ZW
 fQZp3xsqTXr8tl2U173H8AqTo25tNljPoSEpMgN/xJHIgWmro3xR+o+JpHj1KTEMEVlh
 KV5g==
X-Gm-Message-State: AOJu0Yx8BxhL72pXjAxVYbWOHtwtrtG314hGEDy9NltYGnSM5BNge79j
 Qs9lqoJIksUkexT64L+rkSDeYq9B7bEpNRoCcf8rRZAX3ukzm4zegSOsg6alktad/9gaVUOi0sG
 UKvKpC2F08T0eX/SWgKwNbrI1aFM=
X-Gm-Gg: ASbGnctZEEPCCpJzzLGb+K7HT5drpFwHvXwxzPF6QnNDqH/gORWauXubqXoGYB8fcn0
 nyD9gxeEop6Ye2MX2X1SJzE1pWBtv8txiTsFoQboLlB7NmK5iVgQh2KCsCiKfiL7fZudUNI4Nvg
 qEl8Skx0sbo5zMSXWqhpNNJ6l86AG06jKpVmOKSK8=
X-Google-Smtp-Source: AGHT+IEWf2TmMnh2JMy3j5Kkvjs3LU8VE1qNEQ9kusApGf3ad8lgqxwa/IPwFz3BFXERqrm25aOsaJ62Gzg9VA/oJt0=
X-Received: by 2002:a17:90b:3a4f:b0:2ee:94d1:7a89 with SMTP id
 98e67ed59e1d1-301bde388bfmr4082838a91.1.1742391677158; Wed, 19 Mar 2025
 06:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 19 Mar 2025 15:41:05 +0200
X-Gm-Features: AQ5f1JonzRHW2491A9ZepKK-InIixgI-d5rzjRSC4X3Q-HDSdfsvOmC2os6BVWA
Message-ID: <CAJ=qYWR-OqU+RKSFic6OH-eRSzKLGDwR2GJxRjQSYv_ED=c9eA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] AuxCCS handling and render compression modifiers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com, 
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Tvrtko,

I did quick run with these patches. With these changes on top of
today's drm-tip I got a complete system freeze on mtl and its variants
when do modprobe. I had kgdb enabled but I wasn't even thrown there,
the machine went completely unresponsive. On 3/3 tries modprobe xe
always completely froze the box.

/Juha-Pekka


On Tue, Mar 18, 2025 at 6:22=E2=80=AFPM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> A series to fix and add xe support for AuxCSS framebuffers via DPT.
>
> Currently the auxiliary buffer data isn't mapped into the page tables at =
all so
> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for=
 Xe")
> had to disable the support.
>
> On top of that there are missing flushes and invalidations both from the =
ring
> buffer side and from the CPU side.
>
> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
>
>   [PLANE:32:plane 1A]: type=3DPRI
>           uapi: [FB:242] AR30 little-endian (0x30335241),0x10000000000000=
8,2880x1800, visible=3Dvisible, src=3D2880.000000x1800.000000+0.000000+0.00=
0000, dst=3D2880x1800+0+0, rotation=3D0 (0x00000001)
>           hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,=
2880x1800, visible=3Dyes, src=3D2880.000000x1800.000000+0.000000+0.000000, =
dst=3D2880x1800+0+0, rotation=3D0 (0x00000001)
>
> Display seems working fine - no artefacts, no DMAR/PIPE faults. CI also a=
ppears
> to be happy with v2.
>
> v2:
>  * More patches added to fix kms_flip_tiling.
>
> v3:
>  * Rebased after some cleanup patches from v2 were merged.
>  * Added people to Cc as suggested by Rodrigo.
>  * Adjusted last patch title. (Rodrigo)
>  * Apply GGTT flushing only to iomapped system memory buffers.
>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Tvrtko Ursulin (8):
>   drm/xe: Add ring buffer handling for AuxCCS
>   drm/xe: Use fb cached min alignment
>   drm/xe: Reduce DPT table alignment as in i915
>   drm/xe: Flush GGTT writes after populating DPT
>   drm/xe: Handle DPT in system memory
>   drm/xe: Force flush system memory AuxCCS framebuffers before scan out
>   drm/xe/display: Add support for AuxCCS
>   drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
>
>  .../drm/i915/display/skl_universal_plane.c    |   6 -
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 ++++++++++++++----
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>  drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 173 +++++++++--------
>  drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>  8 files changed, 261 insertions(+), 123 deletions(-)
>
> --
> 2.48.0
>
