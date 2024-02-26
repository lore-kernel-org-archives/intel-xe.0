Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22266C54E41
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 14:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA3810F0D9;
	Mon, 26 Feb 2024 14:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CPDqNjWS";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A2810EF67
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 14:26:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E951F602F4
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 14:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D3BC433F1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708957594;
 bh=FLJvS+nuYUK1f8xDSC0mEh2+IJua3ufk9cHPHddbB5o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CPDqNjWSKDXe6Y+bi8cFhPrwGJ/PQhhNIjJ4HmVujftv+Ri16xjznZxoCuqoPMcAx
 Nix0Vt07saRRfIgexVA9sKIXZWpk4KwIOiVYic+gUPEck6bejeQqMcqIma0xrxl3a/
 20b5UrJ4btpODglTpAxZ84IOiCIdVtFhhy/3e746xWtdyoZbWToEErgbH/xTCg4wpD
 4SE8M35N4FtKb7TIEFqQicpRGsEDBLRDZzrpf27sGQT/qwiP4tMnTXWuFwSG5S9sLF
 iEe97eXcMz6uCOYZdnDvFiyEUT/+8CGBqkCndkm24YDxYjb8v8smJ2/arGLt9hFLuw
 EYrXQqnZWn+WA==
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-512e39226efso4236994e87.0
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 06:26:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxDea2FtkZPnNoe9SEhF91eeeb2dTCShhe+/BYQaxjxfo9P2teuG4NkCz2hxJKeBkbg/Bb3mhldqLg/AvGGnYTpvFKEXXjGSlbw6iojVg=
X-Gm-Message-State: AOJu0Yy63lYaqGsQ1WYqYRUM/67tI2hIeylWeKOPGWtkk2CQepPvAPcd
 m6wjWJ8GyBgI3f2NsNA53RDRAjkGi+QH8cA0uL/4xItXh0A4tKtgSkAmTi8Yi1ziYus5uIGcjqF
 I6mXxq//uVu73EvulX8IZLOGtmk0=
X-Google-Smtp-Source: AGHT+IHnFfs+ejMaDWFsx0mgqqfHF6w170U+ks5mqFw2Nvy68yQsgpGEQ4LJDLzcnmdIwOKV9IHvAxXsNJbkimG6mjA=
X-Received: by 2002:a05:6512:1093:b0:513:d1:7716 with SMTP id
 j19-20020a056512109300b0051300d17716mr1145538lfg.68.1708957593088; Mon, 26
 Feb 2024 06:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20240221083622.1584492-1-dhirschfeld@habana.ai>
 <87sf1fmn9l.fsf@intel.com>
In-Reply-To: <87sf1fmn9l.fsf@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 26 Feb 2024 23:25:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNASkdW6d77bfoSV36mUmZtYuUvwyMn653N1tZg3q7gM60A@mail.gmail.com>
Message-ID: <CAK7LNASkdW6d77bfoSV36mUmZtYuUvwyMn653N1tZg3q7gM60A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe: Do not include current dir for
 generated/xe_wa_oob.h
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org, 
 ogabbay@kernel.org, obitton@habana.ai, lucas.demarchi@intel.com
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

On Mon, Feb 26, 2024 at 9:19=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 21 Feb 2024, Dafna Hirschfeld <dhirschfeld@habana.ai> wrote:
> > The generated file 'generated/xe_wa_oob.h' is included using:
> > "generated/xe_wa_oob.h"
> > which first look inside the source code. But the file resides
> > in the build directory and should therefore be included using:
> > <generated/xe_wa_oob.h>
>
> Is this documented anywhere?
>
> Is "generated" as a name special?


No.


It works because drivers/gpu/drm/xe/Makefile
has this line:

  subdir-ccflags-y +=3D -I$(obj) -I$(srctree)/$(src)




generated/xe_wa_oob.h is relative to the
include path -I$(obj).


Hence, #include <generated/xe_wa_oob.h> can
include $(obj)/generated/xe_wa_oob.h







>
> Cc: Masahiro.
>
>
> BR,
> Jani.
>
>
> >
> > Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> > ---
> > v2 changes: add newline, change patch title
> >
> >  drivers/gpu/drm/xe/xe_gsc.c            | 3 ++-
> >  drivers/gpu/drm/xe/xe_guc.c            | 3 ++-
> >  drivers/gpu/drm/xe/xe_migrate.c        | 3 ++-
> >  drivers/gpu/drm/xe/xe_ring_ops.c       | 3 ++-
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
> >  drivers/gpu/drm/xe/xe_vm.c             | 3 ++-
> >  drivers/gpu/drm/xe/xe_wa.c             | 3 ++-
> >  7 files changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> > index 0b90fd9ef63a..a61994292c43 100644
> > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > @@ -7,8 +7,9 @@
> >
> >  #include <drm/drm_managed.h>
> >
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "abi/gsc_mkhi_commands_abi.h"
> > -#include "generated/xe_wa_oob.h"
> >  #include "xe_bb.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 868208a39829..fa217f5a386e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -7,9 +7,10 @@
> >
> >  #include <drm/drm_managed.h>
> >
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "abi/guc_actions_abi.h"
> >  #include "abi/guc_errors_abi.h"
> > -#include "generated/xe_wa_oob.h"
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_guc_regs.h"
> >  #include "xe_bo.h"
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_mi=
grate.c
> > index 3d2438dc86ee..a66fdf2d2991 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -12,7 +12,8 @@
> >  #include <drm/ttm/ttm_tt.h>
> >  #include <drm/xe_drm.h>
> >
> > -#include "generated/xe_wa_oob.h"
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "instructions/xe_mi_commands.h"
> >  #include "regs/xe_gpu_commands.h"
> >  #include "tests/xe_test.h"
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_r=
ing_ops.c
> > index d5e9621428ef..c4edffcd4a32 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -5,7 +5,8 @@
> >
> >  #include "xe_ring_ops.h"
> >
> > -#include "generated/xe_wa_oob.h"
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "instructions/xe_mi_commands.h"
> >  #include "regs/xe_engine_regs.h"
> >  #include "regs/xe_gpu_commands.h"
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/x=
e/xe_ttm_stolen_mgr.c
> > index 662f1e9bfc65..3107d2a12426 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > @@ -11,7 +11,8 @@
> >  #include <drm/ttm/ttm_placement.h>
> >  #include <drm/ttm/ttm_range_manager.h>
> >
> > -#include "generated/xe_wa_oob.h"
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_regs.h"
> >  #include "xe_bo.h"
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 836a6e849cda..efe9a0d300c0 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -18,6 +18,8 @@
> >  #include <linux/mm.h>
> >  #include <linux/swap.h>
> >
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "xe_assert.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > @@ -34,7 +36,6 @@
> >  #include "xe_res_cursor.h"
> >  #include "xe_sync.h"
> >  #include "xe_trace.h"
> > -#include "generated/xe_wa_oob.h"
> >  #include "xe_wa.h"
> >
> >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 3299130ba10a..a0264eedd443 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -9,7 +9,8 @@
> >  #include <kunit/visibility.h>
> >  #include <linux/compiler_types.h>
> >
> > -#include "generated/xe_wa_oob.h"
> > +#include <generated/xe_wa_oob.h>
> > +
> >  #include "regs/xe_engine_regs.h"
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_regs.h"
>
> --
> Jani Nikula, Intel



--=20
Best Regards
Masahiro Yamada
