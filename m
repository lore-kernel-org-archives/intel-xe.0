Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F46C36008
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 17:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC3810E1F1;
	Tue, 25 Mar 2025 17:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MQaQve26";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7AC10E1F1
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 17:39:38 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-226185948ffso116298525ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742924378; x=1743529178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qISGuxV/z/MDdV8wnXu0JIDdtQsAKOh+36pFFGEjP90=;
 b=MQaQve26hOCWXHT3dUEUfOQsPVC6D8fu/IYisIJnxjGfJLtbyErDFSftFVuN5k4oM0
 hFu4BDX32ORNFQmmTFyCPaD8Ir7ZWx11zJUprJnuPL1STCNEbdyWPhmfcSBOl6NuAY0h
 Xw/qUXcmD/ixjFtfG1ZytwE8gnQLj52JRv/youbMru4hstR0ik/PxSY5o000W53UgTGs
 e2WeH3me5ylqnCAGOTOG+jjWjkE5rFdcLcJoOhahu3GEPOqhE6XTcIAlsA0pp8ghkOVn
 nDga5GMyhWBt8J2gG+n/PtSn984xr1QdgwDTSh9f+jtYKYIx3k7COKfBN23BKPRVtV9g
 m6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742924378; x=1743529178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qISGuxV/z/MDdV8wnXu0JIDdtQsAKOh+36pFFGEjP90=;
 b=htzg1ZKD5Oq7WQ4zUtsRE7UtSx55/maBpO+ScSWPEz7duJLC1uqXn0fGRSXrBuY9So
 CMY0TjBguV1JSCBHrTTekDC+x8Vb+OE2DVAGJY2SjLDsQp+6Oac8Zf5zvI6UKz7+3MGh
 k4bHlfIvwX6h6d5Z3l84txmnQxcymItE9/c3kxTGzT/ye2xbGeFGsCCuRwQnv9OFpStL
 eFC+9KnUbeNgN3ZSqGaSFbeJqYZGopro1PzidoTnIBTJfKm0xNv/eSQURZ+x6fMTYQGK
 hLdmb+X65ZLf3NEQKeLRyiEeTmaH/7neUCgE/KzDuZFcQAreqd4XhzauDCuRTHnd58VK
 2LYw==
X-Gm-Message-State: AOJu0YzHuT8Ngg0urVKP8n1GZb465AdhzRPPjfVAQY1rkm7lw5Q2ObFZ
 7wVIs4aH/ROJDyaC1XCfhLqMgXYmk+NeethkQzd3Uvr+VH+6v30m1VEkpCRGI1nXLVy9KGW8gc1
 veiSeWYYzEukXqcElWPEjSYi9Pq8LwZwxUfcHrr/B
X-Gm-Gg: ASbGncvy/ME0Bjje/s7ap1zTFtDsQo9NwrzZsgE+cP5+UgB0ozXKBWvd2/CwpiCsZL+
 ar+qQG6Pso6YTOEP6uTsPmYX7BQ+8bN5B0IfrUKDn0/xdWTlD4ScVZ5fkzKV523ZmGZTVEkNVci
 Y+nIN1KVZNtWUeMK65xGymwee+sLqmjKdsfoAr9A==
X-Google-Smtp-Source: AGHT+IETrsRnH8oFGSTq3GuqSSYTN9z8/ZTYSzoi0JG3ka3HYCxl53nlOH1sdyjVB4LDX3HFrMKCG0E26CoX/WidzJs=
X-Received: by 2002:a17:90b:3d07:b0:2ee:8430:b831 with SMTP id
 98e67ed59e1d1-3030fe72766mr29777068a91.2.1742924377603; Tue, 25 Mar 2025
 10:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
 <CAJ=qYWR-OqU+RKSFic6OH-eRSzKLGDwR2GJxRjQSYv_ED=c9eA@mail.gmail.com>
 <6be0c617-49b7-44d5-9b75-e0a21703ac9c@igalia.com>
 <CAJ=qYWQmh_4TMONXA2pfC0RfDtcOu3r3P250dkn2Dey5wVBS2Q@mail.gmail.com>
In-Reply-To: <CAJ=qYWQmh_4TMONXA2pfC0RfDtcOu3r3P250dkn2Dey5wVBS2Q@mail.gmail.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 25 Mar 2025 19:39:24 +0200
X-Gm-Features: AQ5f1JpB9Lb8mnZyScEiVf0mVCYik_XYExL-iDOj98ciAFyf6iuTy7ewhLsJqWE
Message-ID: <CAJ=qYWRUzgyP2+Smj6p_RKfKkGzdnhs11YQG8Hs2+0Q8JNfNVg@mail.gmail.com>
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

First patch that freezes mtl for me is

Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Tue Mar 18 16:22:16 2025 +0000

    drm/xe: Add ring buffer handling for AuxCCS

    Align the ring buffer handling of required AuxCCS flushes and
    invalidations with the reference implementation from i915.

    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>


If it's of any use, last messages I saw on dmesg are

[  +0,004882] xe 0000:00:02.0: [drm:xe_guc_capture_steered_list_init
[xe]] GT0: capture found 48 ext-regs.
[  +0,021150] xe 0000:00:02.0: [drm:xe_guc_ads_populate [xe]] GT0: ADS
capture alloc size changed from 45056 to 20480
[  +0,000765] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load
still in progress, timeouts =3D 0, freq =3D 2250MHz (req 2250MHz), status
=3D 0x00000072 [0x39/00]
[  +0,005246] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load
still in progress, timeouts =3D 0, freq =3D 2250MHz (req 2250MHz), status
=3D 0x80000534 [0x1A/05]
[  +0,001414] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: init
took 6ms, freq =3D 2250MHz (req =3D 2250MHz), before =3D 2250MHz, status =
=3D
0x8002F034, timeouts =3D 0
[  +0,000282] xe 0000:00:02.0: [drm:xe_guc_ct_enable [xe]] GT0: GuC CT
communication channel enabled
[  +0,000973] xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]]
GT0: LRC WA rcs0 save-restore batch
[  +0,000075] xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]]
GT0: REG[0x7004] =3D 0x08000800
[  +0,000070] xe 0000:00:02.0: [drm:xe_gt_record_default_lrcs [xe]]
GT0: REG[0x7044] =3D 0x00200020


/Juha-Pekka

On Thu, Mar 20, 2025 at 7:11=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
<juhapekka.heikkila@gmail.com> wrote:
>
> I'll try to find some moment to do bisecting, probably will be next week =
when I get to do this.
>
> /Juha-Pekka
>
> to 20. maalisk. 2025 klo 10.25 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>=
 kirjoitti:
>>
>>
>> Hi,
>>
>> On 19/03/2025 13:41, Juha-Pekka Heikkil=C3=A4 wrote:
>> > Hi Tvrtko,
>> >
>> > I did quick run with these patches. With these changes on top of
>> > today's drm-tip I got a complete system freeze on mtl and its variants
>> > when do modprobe. I had kgdb enabled but I wasn't even thrown there,
>> > the machine went completely unresponsive. On 3/3 tries modprobe xe
>> > always completely froze the box.
>>
>> I don't have MTL to try and neither apparently does CI, which otherwise
>> seems happy, as is my ADL-P laptop.
>>
>> Would you have time to bisect? Or maybe netconsole to see what explodes?
>>
>> Not much comes to mind looking at the patches.. Maybe something runs to
>> early before something else is initialised. Guessing only.
>>
>> Regards,
>>
>> Tvrtko
>>
>> > On Tue, Mar 18, 2025 at 6:22=E2=80=AFPM Tvrtko Ursulin
>> > <tvrtko.ursulin@igalia.com> wrote:
>> >>
>> >> A series to fix and add xe support for AuxCSS framebuffers via DPT.
>> >>
>> >> Currently the auxiliary buffer data isn't mapped into the page tables=
 at all so
>> >> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built=
 for Xe")
>> >> had to disable the support.
>> >>
>> >> On top of that there are missing flushes and invalidations both from =
the ring
>> >> buffer side and from the CPU side.
>> >>
>> >> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
>> >>
>> >>    [PLANE:32:plane 1A]: type=3DPRI
>> >>            uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000=
000008,2880x1800, visible=3Dvisible, src=3D2880.000000x1800.000000+0.000000=
+0.000000, dst=3D2880x1800+0+0, rotation=3D0 (0x00000001)
>> >>            hw: [FB:242] AR30 little-endian (0x30335241),0x10000000000=
0008,2880x1800, visible=3Dyes, src=3D2880.000000x1800.000000+0.000000+0.000=
000, dst=3D2880x1800+0+0, rotation=3D0 (0x00000001)
>> >>
>> >> Display seems working fine - no artefacts, no DMAR/PIPE faults. CI al=
so appears
>> >> to be happy with v2.
>> >>
>> >> v2:
>> >>   * More patches added to fix kms_flip_tiling.
>> >>
>> >> v3:
>> >>   * Rebased after some cleanup patches from v2 were merged.
>> >>   * Added people to Cc as suggested by Rodrigo.
>> >>   * Adjusted last patch title. (Rodrigo)
>> >>   * Apply GGTT flushing only to iomapped system memory buffers.
>> >>
>> >> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
>> >> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> >> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >>
>> >> Tvrtko Ursulin (8):
>> >>    drm/xe: Add ring buffer handling for AuxCCS
>> >>    drm/xe: Use fb cached min alignment
>> >>    drm/xe: Reduce DPT table alignment as in i915
>> >>    drm/xe: Flush GGTT writes after populating DPT
>> >>    drm/xe: Handle DPT in system memory
>> >>    drm/xe: Force flush system memory AuxCCS framebuffers before scan =
out
>> >>    drm/xe/display: Add support for AuxCCS
>> >>    drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
>> >>
>> >>   .../drm/i915/display/skl_universal_plane.c    |   6 -
>> >>   drivers/gpu/drm/xe/display/xe_fb_pin.c        | 181 ++++++++++++++-=
---
>> >>   .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
>> >>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>> >>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>> >>   drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
>> >>   drivers/gpu/drm/xe/xe_ring_ops.c              | 173 +++++++++------=
--
>> >>   drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>> >>   8 files changed, 261 insertions(+), 123 deletions(-)
>> >>
>> >> --
>> >> 2.48.0
>> >>
>>
