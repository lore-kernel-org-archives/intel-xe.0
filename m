Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3314DC77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 10:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EB710E094;
	Tue, 25 Apr 2023 10:47:04 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1A510E094
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 10:47:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8b082d6feso54099421fa.2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682419617; x=1685011617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JUR8cdk5VwdAHQuz5P5J7YfHEnowxa9CKxFUxnOgMuU=;
 b=Z38Xv90B8osH8/ZdpeM3k5nSGqN1DGyPN7yF4XMCu2iFZPtog8mf3EChTlxA7Y9Tmm
 /29eTF3woaCu0W5QRRuKyRKkCvlNHVf/rRonWJru7g3EZ/HCI3Wzn3n58AuaXpHjpftb
 by2jLQo03+nWNoPTMPecMnadDtMlXUoDbpupK1m1zXIehRU0L75HEKwdNp2hpzoEszI0
 ieKC9X9hBKhNiHm7oIff6tozKaEK7rFHdJRCf+cWoTHt3vCk7AQ7aghpx68/qEIgq6zr
 qeZUZ0CKVvlJ1iIbT+Qd5q/RPVVYHBKrBzQ+X3ARGeZblDk9W1Q2DULzQ8zEZWUs+s0w
 KinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682419617; x=1685011617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JUR8cdk5VwdAHQuz5P5J7YfHEnowxa9CKxFUxnOgMuU=;
 b=ZT4OI7LPlv/+jvks7aSbwJEfvSIpEr9zmh2nVxcSDmVKtfjUrF6ACRpThwTU34GHgY
 zOiY3YcsvMa0CIG/W5m9k2yuV2nIYoeXie7vKF4RwDmRbpA8qdLO5KvX+jPuzBlIMlLE
 YPhi7MvVTn2jKt2Rfoi6+8vfsjKr6Ohvm2Cmw++Ho2MQJYHfcWCahda3qeE23FMu305b
 85fr1bFGSxppQK9O30exKmk8h3dhG/S4ntcR/LvSbu60suzaf7a2EevFRXiTmndFUkEI
 aQte+7ObA0Xozxi7LbdPbjzJC9lo+Lhz7m9MMvEbUzQjpGBEseoauu0DBHxD7yXaQUSE
 3V4g==
X-Gm-Message-State: AAQBX9e2s+5DXRXGnDzkqqEwbEcfnEXuFMbugSe9545KiRJKdlXXOViG
 1zpkB1iJY/B/TcxslQNcQFEGuriJxTkrF9HpsSw6/s1MU9Y=
X-Google-Smtp-Source: AKy350aJRXVOt2a5qZUNfyQWAv4xRnZo8URFHhT0cTVmZj2r/OKtGrERA/m+rwD8broAui3AJd9XUyL+rNL/KpsuUro=
X-Received: by 2002:a2e:8011:0:b0:2a8:d13d:8902 with SMTP id
 j17-20020a2e8011000000b002a8d13d8902mr3999817ljg.12.1682419617387; Tue, 25
 Apr 2023 03:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
 <CAM0jSHO_-1KAs-rOBxaaq0hN7B2octzeN3XcGHrWoRbOYMuo6Q@mail.gmail.com>
 <ZEedNrn7vaQmlSYL@bvivekan-mobl>
 <CAM0jSHMXMgHSkQZicOvZobHgyJ2G_z=n+=A9uQbNgSXUo2Rycg@mail.gmail.com>
 <ZEeunzdZ1BrFPWCL@bvivekan-mobl>
In-Reply-To: <ZEeunzdZ1BrFPWCL@bvivekan-mobl>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 25 Apr 2023 11:46:30 +0100
Message-ID: <CAM0jSHNUH9mTyWQftxKT1v=N1e5q5rEB5YBjoHhYVKfngEv0pw@mail.gmail.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Keep all resize bar related
 prints inside xe_resize_vram_bar
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 25 Apr 2023 at 11:43, Balasubramani Vivekanandan
<balasubramani.vivekanandan@intel.com> wrote:
>
> On 25.04.2023 11:25, Matthew Auld wrote:
> > On Tue, 25 Apr 2023 at 10:28, Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com> wrote:
> > >
> > > On 21.04.2023 17:31, Matthew Auld wrote:
> > > > On Fri, 21 Apr 2023 at 16:39, Balasubramani Vivekanandan
> > > > <balasubramani.vivekanandan@intel.com> wrote:
> > > > >
> > > > > xe_resize_vram_bar() function is already printing the status of bar
> > > > > resizing. It has prints covering both success and failure.
> > > > > There is no need of additional prints in the caller which were not so
> > > > > easily to follow.
> > > > >
> > > > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_mmio.c | 15 +++++----------
> > > > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > index 98357c1f109f..8bd39c3e65ae 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > @@ -107,6 +107,8 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> > > > >                         return 0;
> > > > >         }
> > > > >
> > > > > +       drm_info(&xe->drm, "Resizing bar from %llu -> %llu\n", current_size, rebar_size);
> > > >
> > > > Maybe convert to MiB and print the unit?
> > > Will change in the new revision.
> > > >
> > > > > +
> > > > >         while (root->parent)
> > > > >                 root = root->parent;
> > > > >
> > > > > @@ -117,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
> > > > >         }
> > > > >
> > > > >         if (!root_res) {
> > > > > -               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
> > > > > +               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
>
> Print regarding 'Resizable BAR' support is added here. I thought this is
> the point where it would fail if platform lacks resizable BAR support.

Yeah, I think this one usually triggers when MMIO must be < 4G. BAR
resize can still fail even if this never triggers.

>
> Let me add the same print inside _resize_bar() function as well when it
> fails and send a new revision.
>
> > > > >                 return -1;
> > > > >         }
> > > > >
> > > > > @@ -183,7 +185,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > > >         u64 vram_size;
> > > > >         u64 original_size;
> > > > >         u64 usable_size;
> > > > > -       int resize_result, err;
> > > > > +       int err;
> > > > >
> > > > >         if (!IS_DGFX(xe)) {
> > > > >                 xe->mem.vram.mapping = 0;
> > > > > @@ -212,7 +214,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > > >         if (err)
> > > > >                 return err;
> > > > >
> > > > > -       resize_result = xe_resize_vram_bar(xe, vram_size);
> > > > > +       xe_resize_vram_bar(xe, vram_size);
> > > > >         xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> > > > >         xe->mem.vram.io_size = min(usable_size,
> > > > >                                    pci_resource_len(pdev, GEN12_LMEM_BAR));
> > > > > @@ -221,13 +223,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > > >         if (!xe->mem.vram.size)
> > > > >                 return -EIO;
> > > > >
> > > > > -       if (resize_result > 0)
> > > > > -               drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
> > > > > -                        (u64)original_size >> 20,
> > > > > -                        (u64)xe->mem.vram.io_size >> 20);
> > > > > -       else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
> > > > > -               drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
> > > > > -                        (u64)xe->mem.vram.size >> 20);
> > > >
> > > > Should we then update the _resize_bar() fail message to include this
> > > > information?
> > > This messsage is included in the print when resize fails.
> >
> > I mean specifically the "..Consider enabling 'Resizable BAR' support
> > in your BIOS". The 'Resizable BAR' bit should be easy enough to
> > google. Do we print that on resize failure?
>
> See my comments above.
>
> Regards,
> Bala
> >
> > >
> > > Regards,
> > > Bala
> > > >
> > > > >         if (usable_size > xe->mem.vram.io_size)
> > > > >                 drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
> > > > >                          usable_size, xe->mem.vram.io_size);
> > > > > --
> > > > > 2.34.1
> > > > >
