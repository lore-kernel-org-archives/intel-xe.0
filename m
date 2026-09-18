Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697A8C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A2910E8CA;
	Fri, 18 Sep 2026 13:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZIInfBv1";
	dkim-atps=neutral
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com
 [74.125.227.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C86C10F34E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:04:09 +0000 (UTC)
Received: by mail-vs2-f37.google.com with SMTP id
 71dfb90a1353d-5c7e0766671so26214e0c.1
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 06:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789736648; cv=none;
 d=google.com; s=arc-20260327;
 b=MyK8dDMYM568vQ9EMAivvB//kHAq6GgyEp8z6UqCHtVaBC5YBlhNRdXGLYnd1lpv5m
 G6lmIr1QqOYsn1Z73hCRqVyExqm5Ie8FD1PBC75ud868vaqexOgYtldsMknLK3e076+L
 8SlkRTZv5Wlgxjd/CAlk2qEhjHfynrk0SNqil3Z9neXJMVYmzyc6y06S0hBFMWkCdQnd
 OmdybxV4enEPtEZ++5Gy3j36ftNBdmt3lyWx22vVXDhh3Z5vyM0xYTFXdMj7cT/qZz3d
 lGyzs7K2OXHLE16vRWnYM9f6PAmHN9cZZ35QXBHT2Njwlx0uCGf5Qtob8PuR5/7ao1gt
 SPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
 fh=b8QOZW1mdbsQLppAoZX+cMjo+mxeHiKyUZLqvlZp62g=;
 b=OgMMdrfz7XD44oYD/aHMZjwRpKIM+gsqScpVwfdGV3g7XeJcLnUypsRG1W7+457IBm
 lp+UfCF6tyGNSaGtgqfpg15nEiLLf0D9d8fpBpgS999KspPBbVSapnB0Y8yaQ5Uz/0+a
 iyHMbJE8xR0OcZtUW4ZElGuAn3fEk1dzIwWWH8I30urNarV/pGl0K6nCWosboO36t3pP
 wca3H40bASvra+88U6P03jexY1g44yGFZvkBWs2mjeokL4cFJ83vU+CVVD35Qrb9BiKV
 DEvjB+tB3eS2yxaQVX4ezIUEzQMUNga6RTbrATGtuDFK5kQWh8ZxpcLDh4PJR0k3qamR
 jofA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789736648; x=1790341448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
 b=ZIInfBv1jN5x8ITR+uHtKhmyw8qa4JsGLOtkNj9p/Xwl+CQyV+ONuZEufHBF9OezOu
 ffV8dpQhiwyBjdz6KZpwu3Qq0rrm4IaeiWK7jXMRIZspFjisfhdyCIpAScN92HegTLRL
 e4nt7uc4K/hn0w83K2hy324OUkY8HBCfVJUxZVKdUfTlydfl+vTLDP1TCk8wUb5EVX3s
 aFnd2CyI9mLd+BToeW9/7nYBToThm/nr5KB/zWa/bAY/Iq3anmp/Xl4aPGlhjJlNdR4W
 wpwOhR8qnU7kT1l1EYgPUxxZR6MvTb5o9GTu0H6PyhMCqWAbncQ2vOTgDUDQpnQIySMJ
 6cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736648; x=1790341448;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yCLjcMw1rcuu9wX+kCk+ppzWj5O7P6M4vBYFfJC61a8=;
 b=ZMcZfcZNAqnUc9R96w+L4OlxKtyzJEuCx6yq3TlFQjN76uRA+2FhNNq6E7FtdnxK/j
 CZc1PjiInwfgAlA3k1m6PMuchFUNYtjHDWsdopI9EGqwlAkGje6D7/g4t6UZjchv0fQ5
 F3DAb5JwYXsWRnp5q8F4iS3PpyNkSIx1tADhn7qtvYEGtODVkg2gqur3/ny/H3EIucYk
 0jyRL/VkhkVK53usQfrG2ZOwsTuBAlXCs0bcU/A+xqtZnnOTHbXOZ78NvO16ELElShz2
 FUCGPEpBXRtQLCRxSGcb2CtCpwrIGL7vmN+5jrt8u6TqDjzzPSQv6yAGLyF9CydkXYOr
 toVA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcAHztFsK8yvlomWvX+jGXhOVPW5YNE6SH1t8deDqs732wl6YZcF+BgQOxFTzcwbntWrso9lxPmA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++k5/TJkJsRb1AtbZ2XEMEBh4MGJ4IgcoWi1DJFY1kjjOJxBHTud
 Cy9wqvsehlDi4lMyUTIpWmr2AlFSIuvnCf9ADkTWaRxrnOXYw2LbS2qyxHZSlFCmVnM/vTAveQt
 ZFgD4QGlSIZ+HArozFhIazubpPK6iznc=
X-Gm-Gg: AYBFou1k/7p6Pcm5H4NQaGtE/DUlyVyIeJwadjuk+p90LHz28JIaGK/yCG8VvbiOYI5
 uYcvRIhQ36i9zkWThd9eW2gNWjqTYFR+JeoIu3uIBqKat3qQMp1nxvzfPjB9b1yeEqWg6Bczsps
 Qceg4JH3DOZICKkF/zb5OKozP6hR0cvLHxMLsAYkltEAWvhuMG3pf2ABm/oMIIG3CAQubheWaou
 cK+9cwju9uy6U3tkffOwA3lwyiAT+xMIoaCxAukIIvOCebfPduweZo1FEqv61koi3XrK8gt0bcT
 dkBNo5nk95CVUpRJYVZLHamUkV2arjJgrMfXbiaHz8rif25Qbu7Mg883nvYkglc34bezINHUQB5
 EckOkX7VTqs7ql2k8vzkN+dVTU70tyFKiKQF14ZFNpbk=
X-Received: by 2002:a05:6102:5e8b:b0:7a3:2e52:114b with SMTP id
 ada2fe7eead31-7a59dd5f437mr474902137.2.1789736648001; Fri, 18 Sep 2026
 06:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260724025959.142826-1-W_Armin@gmx.de>
 <20260724025959.142826-3-W_Armin@gmx.de>
 <BN9PR12MB514668975E87D570F50B2D91F7A82@BN9PR12MB5146.namprd12.prod.outlook.com>
 <86d0e015-a8f4-4e10-a9b6-a9714d3e0f07@gmx.de>
 <80c4bb47-936b-976b-6ba8-b366f7a455cf@linux.intel.com>
 <11976ed3784675ad241646287a909286a42675a8@intel.com>
 <3ef68773-e07e-437a-98fb-a3c5fc08539c@gmx.de>
 <62d7da838e7042df8456e76190db792093065b57@intel.com>
 <06550473-63c2-4a3e-a5ad-7e23d7b6b050@kernel.org>
 <d696d85c44930d2124054ce11a06d3096c0db04a@intel.com>
In-Reply-To: <d696d85c44930d2124054ce11a06d3096c0db04a@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Sep 2026 09:03:54 -0400
X-Gm-Features: AcwNN1XHNFQcATzjGyaYhKX2aDW9koV5gKbX6KpcatyNovdS0W4jwqBJ2n5fxn8
Message-ID: <CADnq5_PT7s6ixTqDSwe9ai9tUQa04z7UnwhMn7bo7CcsH5Qf0w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ACPI: video: Remove CONFIG_X86 handling from
 nvidia_wmi_ec_supported()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux@weissschuh.net" <linux@weissschuh.net>,
 "rafael@kernel.org" <rafael@kernel.org>, 
 "lenb@kernel.org" <lenb@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, 
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "matthew.brost@intel.com" <matthew.brost@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
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

On Fri, Sep 18, 2026 at 7:01=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 18 Sep 2026, Hans de Goede <hansg@kernel.org> wrote:
> > Hi,
> >
> > On 16-Sep-26 09:16, Jani Nikula wrote:
> >> On Wed, 16 Sep 2026, Armin Wolf <W_Armin@gmx.de> wrote:
> >>> Am 15.09.26 um 14:31 schrieb Jani Nikula:
> >>>
> >>>> On Tue, 15 Sep 2026, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.c=
om> wrote:
> >>>>> GPU people heads up!!
> >>>>>
> >>>>> On Wed, 2 Sep 2026, Armin Wolf wrote:
> >>>>>
> >>>>>> Am 01.09.26 um 23:30 schrieb Deucher, Alexander:
> >>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> index 12e4a41bf1f0..50305630f533 100644
> >>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> @@ -30,9 +30,7 @@ config DRM_AMDGPU
> >>>>>>>>         # ACPI_VIDEO's dependencies must also be selected.
> >>>>>>>>         select INPUT if ACPI
> >>>>>>>>         select ACPI_VIDEO if ACPI
> >>>>>>>> -     # On x86 ACPI_VIDEO also needs ACPI_WMI
> >>>>>>>> -     select X86_PLATFORM_DEVICES if ACPI && X86
> >>>>>>> The change below makes sense, but this one looks like it should r=
emain
> >>>>>>> unless X86_PLATFORM_DEVICES is handled some other way?
> >>>>>>>
> >>>>>>> Alex
> >>>>>> AFAIK the dependency on X86_PLATFORM_DEVICES was only necessary be=
cause
> >>>>>> ACPI-WMI depended on it in the past.
> >>>>>> By now ACPI-WMI neither depends on X86_PLATFORM_DEVICES or X86 any=
more.
> >>>>> Hi all,
> >>>>>
> >>>>> Could more GPU people besides Alex take a look on this. I'd want to=
 make
> >>>>> progress with this series within this cycle but would prefer to hav=
e Acks
> >>>>> from GPU side.
> >>>> I share the same concern with Alex. It seems to me we could now end =
up
> >>>> with x86 configurations without X86_PLATFORM_DEVICES, which handle
> >>>> e.g. backlight on a lot of platforms.
> >>>>
> >>>> I think the safer option might be to go for:
> >>>>
> >>>>    depends on X86_PLATFORM_DEVICES || !X86
> >>>>
> >>>> in all of the cases that select/depend on X86_PLATFORM_DEVICES in dr=
m.
> >>>>
> >>>> The alternative is to find out, and handle the fallout, if any.
> >>>>
> >>>>
> >>>> BR,
> >>>> Jani.
> >>>
> >>> Alright, should i leave the original "select X86_PLATFORM_DEVICES if =
..." statements
> >>> as-is or should is change them to "depends on X86_PLATFORM_DEVICES ||=
 !X86" everywhere?
> >>
> >> There are some places that depends on X86_PLATFORM_DEVICES. I think it=
's
> >> almost always a mistake to have some places select and some places
> >> depends on, and select should anyway be used with care. I'd go for
> >> depends on.
> >
> > I'm a bit late to the party here, sorry.
> >
> > Note that X86_PLATFORM_DEVICES is an option which enables / disables
> > a menu and does nothing more.
> >
> > Enabling it or depending on it by itself does nothing.
> >
> > The select used to be there since it must be selected to be able
> > to select ACPI_WMI (which is no longer the case after this series).
> >
> > To depends on in XE was probably copy pasted from the existing
> > select-s and then changed to a depends and already was a completely
> > no-op since depending on ACPI_WMI was enough as that itself
> > dependend on ACPI_WMI.
> >
> > As for X86_PLATFORM_DEVICES being needed for some backlight
> > interfaces, depending on it by itself does not result in those
> > interfaces being there. That requires enabling the actual drivers
> > providing those interfaces.
> >
> > And I don't think that the GPU drivers should start depending
> > on those since that will become very unyielding.
> >
> > TL;DR: I believe Armin's original patch is fine and this is
> > a welcome cleanup / simplification of the DRM drivers Kconfig
> > bits.
>
> Your explanation makes sense, thanks.

Yeah, sounds good.  Thanks!

Alex

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel
