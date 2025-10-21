Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97992CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 16:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467C10E632;
	Tue, 21 Oct 2025 16:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ORvjyIrd";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719DE10E629
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 16:47:43 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-292fd52d527so3625575ad.2
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761065263; x=1761670063;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OT9BDqZbtTZ8FlPJwy4YL51bMKIbhKLdUmKCp9QkH1I=;
 b=ORvjyIrdb0D39//8gGZgi08gVpJf3JfzJuyxzi/Pf5TEGeZbNXpg54qALJpFu+L/W7
 /mnSqhC5SUBzxqzqulBVrug1tSe1CsUcVdZ81ui+3xp83CgFyHP8sMXoamnU55vqUQVv
 gddnwzoDPescN/SWcjFnEB+OmewC0TNU9zTy7Vf3BWEYyU+eUM5VJbFdptuLtggSy4Hn
 7rOicDuCYTI/MpV/UpwIt+8qvrMlHI1AinC91HPfl6/mmSILmPpYMzOh9op5Vp+BoqlX
 R4XMwioqhltRw2nZ55rQx8gZJTe7B6kF8px0sggUpV1IEJImEb3Pu6SElK5sPCcLMl/v
 dRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761065263; x=1761670063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OT9BDqZbtTZ8FlPJwy4YL51bMKIbhKLdUmKCp9QkH1I=;
 b=R4x0OAI736s0fLo++5RbbMbxhIl32xFBAOL0Ni942b0DyM8SGnid9DzEN/jBI8+8/E
 Oa20mFtlGAhtSV3LpzaDaMNzGo8PNDX+BiKNjrX8ljXSQeicUAI+QVM+xYc9Liqfp0eG
 9Is6QlYjX1b1Mb/eP6IWhRBbRHLRtf5HEuQhFNZ1/kfjFXh/FJBAWDZQwJTiBC2ljUQ3
 GVmIsr+hLgBPra0PZ5DCUDfCw46rhESnWt81OqXUGftLtTCL55Q8cz3qtrI8+1kyOwnB
 +BI0Qkef9UOkcOl49mDJ5KmYTOSCeMATR1m/sk43rhE8FK0DiDryupVhknv6lifKJrgA
 jwcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEo9IIv7RWLR2X41uylzsfHGevjPGiFBtZvmdeMjljiJQv5EhQmDxBrvfQTFoirZxoMOun+6nZJA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNPP6/pv4bu6sMwapWmtW1bV7PzrM8/JNADTHb6Tq0u1KMrQot
 WYLctaxesIJZhuTJf4itm2jpY01a94kzQoW6/SY7d4FqscgS17Sg0bt8cTewjxoDmA==
X-Gm-Gg: ASbGncsrGI/McmORkffh4yKo8H5bMFJlrTY/STXebuGtL1SSEmG4PRKzr+Gs/Wl2ijA
 IX1CpA/xOmm1H6C0k3pfu7Z0/rCE8DhFvWQ+Wti+KV00m5UsyUv5+vgIJIzkkwFmJNABIG+azWY
 wlBGXW7TIbtL3VygQT81OIwiPJOHOmrcDWo32lMl4mepx7/CLyfP40qQyp6evyOsBijfIaTWFeR
 Q+LoBD/Y6uQyusNQZGYGLfd6KdpmFsk20gFkqTZAH0V6aYId6d8g/ZazvLjnnWevI7yckRsBis7
 WZ9ppEWNpwwRNd3sfqfEKofMzk2Kp1twXmdPjnlVmJRJ/9oEUIR/zv2PBtQ04vUIiu6R0t+Rr72
 K77BTS+AOmkUaDaT3Prig2+ynEUaKyaWrWnI3wytbNRD1gQQ5Xj70R+E+lTtQk6iM5BzAt5xcwe
 DFqSpb0w4J+EMAWDsQxPQqWiwpHaHWXUixU21kgBe7O9o=
X-Google-Smtp-Source: AGHT+IGansT+A0rkfAhKvQNOk21vPK7u8dZSK91Dy5X88gGuQfgY22M2jXK6HVEdK0aJoNY/t4sDOg==
X-Received: by 2002:a17:902:ce12:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-290c9ca2a4bmr199750875ad.13.1761065262494; 
 Tue, 21 Oct 2025 09:47:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ef0c:c990:b2a8:9da9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29246ec0847sm114116915ad.22.2025.10.21.09.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:47:42 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:47:36 -0700
From: Ryan Neph <ryanneph@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe/configfs: fix clang warnings for missing
 parameter name
Message-ID: <qgugikjwzoc2ia7no5x5jspgu6dx6p6yeuhpxkqfsdggxtk5ty@ptmw53oycmnk>
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
 <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
 <20251020110513.48d18788@pumpkin> <20251021063957.GA757076@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021063957.GA757076@ax162>
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

On Tue, Oct 21, 2025 at 08:39:57AM +0200, Nathan Chancellor wrote:
> On Mon, Oct 20, 2025 at 11:05:13AM +0100, David Laight wrote:
> > On Fri, 17 Oct 2025 12:46:26 -0700
> > Ryan Neph <ryanneph@google.com> wrote:
> > 
> > > Fixes warning from clang-17 that look like:
> > > 
> > > drivers/gpu/drm/xe/xe_configfs.h:35:97: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
> > >    35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > 
> > Why did that become invalid?
> > It has pretty much always been used - and can be used to avoid -Wshadow warnings.
> > This looks like a clang bug.
> > And you'd want a specific -W 'knob' for it as well.
> > 
> > At a guess the C2x extension lets the name be omitted in the function body for
> > an unused parameter (the same as C++).
> > I think that is the 'definition' and the ones being changed here are the 'declaration'.
> > But I might be wrong.
> 
> I don't think you read the patch clearly enough. Both declarations and
> 'static inline' definitions are being updated in this patch, likely for
> consistency rather than necessity (but the commit message could call
> this out). I don't see how there is a clang bug here.

Correct. The warning is generated for the stub definitions on the false branch of the
`#if IS_ENABLED(CONFIG_CONFIGFS_FS)`.

The pure declarations on the true side of the branch don't need a named variable but I included them for
consistency. I can mention this in the commit message for v2 if desired.

> 
> > > 
> > > Signed-off-by: Ryan Neph <ryanneph@google.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_configfs.h | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > > index fed57be0b90e146d57d966bab0e55e1723513997..a0d614b37efd54b89390f04a238aef1a8d4df4e2 100644
> > > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > @@ -21,9 +21,9 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
> > >  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
> > >  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> > >  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> > > -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class class,
> > >  				       const u32 **cs);
> > > -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class class,
> > >  					const u32 **cs);
> > >  #ifdef CONFIG_PCI_IOV
> > >  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> > > @@ -37,9 +37,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
> > >  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
> > >  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> > >  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> > > -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> > > +						     enum xe_engine_class class,
> > >  						     const u32 **cs) { return 0; }
> > > -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > > +						      enum xe_engine_class class,
> > >  						      const u32 **cs) { return 0; }
> > >  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
> > >  #endif
> > > 
> > 
