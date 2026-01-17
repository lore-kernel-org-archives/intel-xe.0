Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD83C98312
	for <intel-xe@archiver.kernel.org>; Sat, 17 Jan 2026 06:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CB310E043;
	Sat, 17 Jan 2026 06:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RD1qVmhP";
	dkim-atps=neutral
Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com
 [209.85.222.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C78F10E011
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Jan 2026 06:03:05 +0000 (UTC)
Received: by mail-ua1-f97.google.com with SMTP id
 a1e0cc1a2514c-94120e0acbeso1700728241.2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768629784; x=1769234584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFsT2dGHTyCAADslGY171NyLANiIjRRH6CwURcYpLG8=;
 b=EFeQ05+yjlqWyjmHFMUJhzc6DUMiqqUrHZ7RS/aMPQ3A2n7xW4nzGZc+MCOglg5pDe
 EwsJmu+cIgq4x80Wa5aSgXoYSw/rm6Ci0qmjbaVedmK4Rq25oMCiPCCyQcbuSexap4QV
 TDewRrjKM+579g7CZWwk4qn6cTT8vT/YQlo1xFr+YuvoSG0BhCdVidlZpWjqKYPHj+HS
 a/vELjvq2mlcTLss1gV0S4sOGCoRcv/wxw96+554Zp/Nt827p0xgDoAzUrSj1cOS+cBx
 IOGTXjeVWDbosuBozslqnO8XxQIvu1N1uBnZdcq8b/VHUduCxiUQjhYOjrUlEVQezAgt
 7THw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe7oaAPBGzeBABaCHavNi3YrGowAloU6t0MTXaHsZ3QxAnYvLaMu9lGr3ILcha7SHDg6XVf1dbIw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbcSfVgt1NnffSX5oT5OHIlLzrIHgxbyVZLSVEVXIkUdZ+rSS3
 qfaoKmXClvj87UXwmTdKm4E/v4OZyvk7FJncRr1kHljtiink9B+M7S0T6IH2CKf7FWPFjSrgA6A
 dC+ShUwq74gLsJRW0NPxNx0VP6bkq9aZBRUJqFXzPIjkGS3ZjMx4SbkjYPVTQUbk8JyNa2l597J
 mSlLZ9xMmXct7nRzJ4GMvPO+foKzjh1WJnvd2jidTLJVxKO1zUiMB51PEfI8RinRDBwvlwZL1/9
 1rCOZ48drlvC/BbNyo=
X-Gm-Gg: AY/fxX7St2dxduCWjxoB3mnArMmOt22PnTsoUd6k6F2jyzy6x0+KG487OqED4JA68xP
 BXj6fiWFJ4bCx1jRoPqDCGLebab8/yedA4tN+1NDT6ybiZnrJSAHR7+/xlJc8aPhtarzqKqmTpR
 AAsoSyBShySq2IAduG755/5xc9fAvO5j0krbG3FamWh6JS+K7dOKIrJu0d5hSw5wXI1fIDyJnZU
 hGCAFX9rzTgYqwM90YNQFtclaEMfKavWQ7+t2ZV10mq/WiDI3BrOXigvBd7NsEy7+GztdBqwb4m
 JN/YzK23YAzjQ3w/XaVZ+iRjTOjmLH1++D55EN2KEyTTII2c9HhYAP1Mgdzr/TlBL6ua6UN/6hD
 h4TiF7hdCtoEB/4+/3/6LuF9HAvfv5/+9Mdj36Jqqy2I5afZhLqYr9PSLpT1jhBFJKwPo7Oaf7J
 Q+ctpPYdDToufnJGEhUhSEcHAESVVD5DRFHt/jqA6d7g==
X-Received: by 2002:a05:6102:3f0d:b0:5e1:866c:4f8a with SMTP id
 ada2fe7eead31-5f1a5513039mr2190347137.20.1768629784130; 
 Fri, 16 Jan 2026 22:03:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
 by smtp-relay.gmail.com with ESMTPS id
 ada2fe7eead31-5f1a6d10c51sm537757137.3.2026.01.16.22.03.03
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Jan 2026 22:03:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-59b7b7a46a5so2372664e87.3
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1768629782; x=1769234582;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JFsT2dGHTyCAADslGY171NyLANiIjRRH6CwURcYpLG8=;
 b=RD1qVmhPmlh93FGrfVJZ/+JJfBivhguwW8wEdfalHnHGSJ6yT5U0jNWNEbQ+U6c47+
 sxAQkiRLkdBeno5oHYat+Gby2EjyaxqAmJSlNiTS0DhQu/lQPtMG0VObIv0qxRVQapBX
 xjM0ivmW0QQQwrLq2xstaN6+rUn7EWmel0PDc=
X-Forwarded-Encrypted: i=1;
 AJvYcCUTt85HBTDAVZ+td9f9B3B148g1X5zoc+YfGF6zP+mMpVMiUr9f3AmOmSYLvs4jAjssfUR57oq9Kw==@lists.freedesktop.org
X-Received: by 2002:a05:6512:10cb:b0:598:f262:15c7 with SMTP id
 2adb3069b0e04-59baeef7c0amr1501688e87.25.1768629781469; 
 Fri, 16 Jan 2026 22:03:01 -0800 (PST)
X-Received: by 2002:a05:6512:10cb:b0:598:f262:15c7 with SMTP id
 2adb3069b0e04-59baeef7c0amr1501644e87.25.1768629780919; Fri, 16 Jan 2026
 22:03:00 -0800 (PST)
MIME-Version: 1.0
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
 <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
 <CABQX2QMn_dTh2h44LRwB7+RxGqK3Jn+QCx38xWrzpNJG5SZ9-Q@mail.gmail.com>
 <f3643c19-c250-4927-b39d-37d2494c7c84@suse.de>
In-Reply-To: <f3643c19-c250-4927-b39d-37d2494c7c84@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Sat, 17 Jan 2026 01:02:48 -0500
X-Gm-Features: AZwV_QiUnz_If_z8Rkd9UgQ6zWILOg85OCTnKGucjTIyh0yZ4kAyPDhffMT5Rew
Message-ID: <CABQX2QM0_6DJtrahJS7x9iF_wcSZRc4dohEiPnMCtAg7Vt7JPQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
 Ce Sun <cesun102@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Deepak Rawat <drawat.floss@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Hans de Goede <hansg@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Helge Deller <deller@gmx.de>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 spice-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000ef8dcc06488f3575"
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

--000000000000ef8dcc06488f3575
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 2:58=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 16.01.26 um 04:59 schrieb Zack Rusin:
> > On Thu, Jan 15, 2026 at 6:02=E2=80=AFAM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> That's really not going to work. For example, in the current series, y=
ou
> >> invoke devm_aperture_remove_conflicting_pci_devices_done() after
> >> drm_mode_reset(), drm_dev_register() and drm_client_setup().
> > That's perfectly fine,
> > devm_aperture_remove_conflicting_pci_devices_done is removing the
> > reload behavior not doing anything.
> >
> > This series, essentially, just adds a "defer" statement to
> > aperture_remove_conflicting_pci_devices that says
> >
> > "reload sysfb if this driver unloads".
> >
> > devm_aperture_remove_conflicting_pci_devices_done just cancels that def=
er.
>
> Exactly. And if that reload happens after the hardware state has been
> changed, the result is undefined.

This is all predicated on drivers actually cleaning up after
themselves. I don't think any amount of good will or api design is
going to fix device specific state mismatches.

> The current recovery/reload is not reliable in any case. A number of
> high-profile devs have also said that it doesn't work with their driver.
> The same is true for ast. So the current approach is not going to happen.
>
> > There also might be the case of some crazy behavior, e.g. pci bar
> > resize in the driver makes the vga hardware crash or something, in
> > which case, yea, we should definitely skip this patch, at least until
> > those drivers properly cleanup on exit.
>
> There's nothing crazy here. It's standard probing code.
>
> If you want to to move forward, my suggestion is to look at the proposal
> with the aperture_funcs callbacks that control sysfb device access. And
> from there, build a full prototype with one or two drivers.

I don't think that approach is going to work. I don't think there's
anything that can be done if drivers didn't cleanup everything they've
done that might have broken sysfb on unload. I'm going to drop it
then, it's obviously a shame because it works fine with virtualized
drivers and they're ones that would likely profit from this the most
but I'm sceptical that I could do full system state set reset in a
generalized fashion for hw drivers or that the work required would be
worth the payoff.

z

--000000000000ef8dcc06488f3575
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBCK
e4A3z3CqFQe3IsyXO5x3uXMpy+yDDD7NQNrNRe7NMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDExNzA2MDMwMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBADnfpLDRtY3ZBZL7ltI8Yiq6c5TD0Tv/FGci0rA9
txHbRGMB2w3d8WiU4il+YNMHiRyF/mcsSF+E/SIuH/aWtoRV6uao8r12CQ+B+hgxLtBMZ8Gq/ZSF
Ygy6pZG95T6EeyeDoH9VLfcFey4WfC/Mnfu2R7fPJxZihHras/uGgHcga0YhzuyHXB8eXvnDKvST
hcbY0XvAHAFdItfmWdb/CGGfPkVKwtmwj0wRKu90qvMLh7TTNok8Mggcw5Y9mcvnkBcw3ae8DZKT
hC8kPEAjk0glu1GFV9fZ62/LuAH0OkZw/b7+fLmEFbwOb17yrKMWw/H9rihgpjw1NYOlWePvmC4=
--000000000000ef8dcc06488f3575--
