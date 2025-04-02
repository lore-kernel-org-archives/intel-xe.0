Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF44C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 11:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0663810E756;
	Wed,  2 Apr 2025 11:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TuvWnttI";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684EB10E759
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 11:42:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22928d629faso89139405ad.3
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743594174; x=1744198974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i1HdLdg02a2Is2vxytGG8VpxqsLSxRtrxidh5xerlfY=;
 b=TuvWnttIk9WkvTq1V5FA0YwFdJeM8VB65yC8wihoR5107oBqzuBn3kOzzlF2DLkb9p
 zGa1C8dc3mdVmuMZOJC+xTZMRbjaZu4a4DCuyrMgijRoI0N+yfDQUjUETn5JA7fmOrTR
 0s7Hv/izKEepdoY5RCYnLk69NnSqXFgNdmMLwG2xNBZlfiiRW6pyvAMTIt6a3On62iff
 Y5wnwAZ5a5WnaEz6vf++CMrFJoyEPndanCMUoLghDwL9fA8yxy4wqptSABS8HA0mett6
 gt3F3szGMtz1uI5TIeWHyJE+WW52Aj62spYmhx8Ul0fojIleYjzkVZeA2o3zQMTlMeVF
 92WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743594174; x=1744198974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i1HdLdg02a2Is2vxytGG8VpxqsLSxRtrxidh5xerlfY=;
 b=IoOX4TxH5NQF9Z+A3us0s1GXD72EWjX+SqQ0yC5w9JP/FtfWOSKzGBiGd7wFQr0egI
 qkJN4DkfWC8mL6xQvUqDEVZg1Q7bCWmI07T2kQiiZP+kKqm745/RsSV/G24FWrp1CiYJ
 O4O8NXzlj9ELI1dx2TGVa+59jRnRZze44+t8y5Ky8ycaMRzOTMD0v+Oa5guVxPK+dYGv
 UeEPhh0y0qupg9k63AQkyhShuOje2aVLwJdvH8KnSBwldeJOswVMZsDX/yrAaNx6lUeW
 UfO2WtGbkMAYGC1pn7btXsetmYcbfcr2Cxb017VoIaqElOUTR7pewC1cmbqB0JksonTW
 fmCw==
X-Gm-Message-State: AOJu0Yx3feRCbL8I8TT7Slo9G5zAbb7zCmNsnqaxricH6yzEK27ukQf/
 Eliac9gUsb/AbH9j7t/TjUf+xmlCXDmcY+qqvxVNKkuT4e4/6dsiiL/+d1YwO+wScanydzxldFQ
 7sCESB7UTW1r574qvdpG0nkDSTTy4TtIHs4HQQw==
X-Gm-Gg: ASbGncv6dh0TUn+iwpjDfwYnYmvQeMtSjjBS1KvRW8dKbzRAGsB3RU3fgm3wBWF/dt2
 1W2q5E4MLrhnNPMaivT3LWF5Zriz1XFA0a/YF3aVrH1CjuX867tsCzfdKDqiFCfwVbxCtRn7ZrK
 PX+agMjbd0j58yhr4YH14sGIeHtYZY
X-Google-Smtp-Source: AGHT+IH/R/K9IugX0y2CvzIMOXD2wH/hEamf4R0c9pm7PgC5i4kSMdYkreMp7A6PQQGAOvfFITcxdnI/+Rc/laVyWrY=
X-Received: by 2002:a17:902:ce84:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-2292fa0294emr239066175ad.49.1743594173848; Wed, 02 Apr 2025
 04:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 2 Apr 2025 14:42:40 +0300
X-Gm-Features: AQ5f1JrkRHB5dpsgAVxVuuDp2SWixG09EbD8_dZzkj-Eft89rPIVWgTrLQcam9I
Message-ID: <CAJ=qYWSj2ingLCapCSrYz5OgJoP_A_SgvPMkeYH+p4jEqBhS8w@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] AuxCCS handling and render compression modifiers
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

I was going to run tests on your patches but there had just been
changes onto emit_pipe_invalidate() exactly at place where you had
added WA_14016712196 handling, so I didn't go figuring out what's the
correct form. Can you do rebase and I'll see what I get with mtl.

/Juha-Pekka

On Fri, Mar 28, 2025 at 6:35=E2=80=AFPM Tvrtko Ursulin
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
> On top of that there are missing flushes, invalidations and similar.
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
> Display working fine - no artefacts, no DMAR/PIPE faults.
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
> v4:
>  * Added patch for potentially misplaced Wa_14016712196.
>  * Fixed (hopefully) MAX_JOB_SIZE_DW on Meteorlake.
>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Tvrtko Ursulin (9):
>   drm/xe/xelpg: Move Wa_14016712196 to the invalidate path
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
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 +++++++++++++----
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |   2 +
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>  drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 190 ++++++++++--------
>  drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>  8 files changed, 273 insertions(+), 129 deletions(-)
>
> --
> 2.48.0
>
