Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE1FD8FD8
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7062810E9D4;
	Thu, 26 Feb 2026 16:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AwRMxKjA";
	dkim-atps=neutral
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B0810E9D4
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:53:34 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-12739fe9a0eso70690c88.2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 08:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124814; cv=none;
 d=google.com; s=arc-20240605;
 b=ZrKdgBXXL2uvBzWYcSANhbndzPUpMasJi1lABz68SOsbe3mWcxAepBduH10iAtYafQ
 JCSD8kSW/3Hc0bSpoEqER4ZbVBfooytFi+E5zrlDdNg1J0lqgpoY6+iaKOwZdWzaJSMj
 pypu5ffsY3emkOfZsgNJ+dVhb2DlmvSGv04E0cmj2NMbOIFULZz7HBVsDEX4OzPAEBKU
 WPV1Gk/t1x/cKEcFS2nInXAlXG/KL0NmPjHzNRZgR7MWV1UnkcobsNZ1C/K4v2npTCPj
 Uakljq6/2pdMYyyuxFzVXdFZ1cENJMXdwz2r4H3lez3Z5MMurlsfQpTPkHG0vB5gucmT
 SYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nSMaYfcAaczcS5xedZ+A5sc4SxyyrrIlz7xrQ4/9ZI0=;
 fh=4+7lr30TZmEgAAhv4Kr7bPfZK/N4w9bSQxRQdc/sV4U=;
 b=UxXkoVSqKZNjGdTQKixGZvokhK9dVJ3Xkqf1+cMApDtNMIetaLiSS7qGi4mUokunBe
 B36r6BlffPDrCSHMSUVOr2ITnDtVNXFqHmoMB4hiHJQB4meHAkguKGDoOAHbIs5O0D//
 SZ80KTttbr+tyTFRNZZsxeE1b62plDRtRUHO3CdJrHLInowD1ePWly9kKC3YHO3BY6C9
 ayeYJhmCjSuND9geTI+qRpp+DWMkw70p18tPsIyocpZdD/1teg7XjJ1+Unp7jNVLL62y
 53IX9z1i2u5HGPCWI7fhb41OWspc3D25pmHQ1bR77FJ8ZC2Ij5aIciiL/sI7+isxyw65
 pirg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772124814; x=1772729614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSMaYfcAaczcS5xedZ+A5sc4SxyyrrIlz7xrQ4/9ZI0=;
 b=AwRMxKjAsUHiqfy4c/NJU4iuytLg90dnQ1QgihGt1xQRJdeAyQMrZyu0G8NEyQhUkt
 7FaRwbg6t0fpIbM1ZCMyvvkP4dlYZG4EuzcB1osHkObpDPujyvU6vnt2zsQPXMzeV8vG
 ZTwRGTAPN2s+V+C2uIjrbIFXHAPrigJe/dhxNZy5RE8R0ZgyW+no0zfIjEt1EnY3dWVp
 bUSaedoY+sA3+L9vWmyitg+Ni+zuJW5fjSqRufqmfaXKVVxl8MJXal9BVJ+RotOSYk9p
 JSqzoGZ+DmUSWEyVBEw7Su9jgp4DOEsxiErdgvrabRauHF5b79K3Uo2qbzEApETKiPUo
 qHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772124814; x=1772729614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nSMaYfcAaczcS5xedZ+A5sc4SxyyrrIlz7xrQ4/9ZI0=;
 b=ED2rgiPzfVSWWdsJO2Yyj3sTgHP+WPt8CQiimmLwTBCtVfS/nKuqaxFd51wFhA39j2
 F84bdv+izViHJuwX+qf5NNOVL3qpmk0l1KO3jiPgclGFnqnmyO6swRYrJhnxglZk2K2w
 kuZhh4tOc0ECEdS8Q3mR/oqumrRpwG2OkFqvo41hyvgI66lzC6C8WGQDad1s2wHe+Ytc
 tTNnNa2mOsgpem0Sb5zhXPon4Fui1MEkJTzgBaZ2CHEX185xfIH3ADFzSIoWXdoiUM8/
 5XOWlmRA/hm+eCPVP8P/euAHxH4ZU9SZIBOC90OyJXHvZAztcrccP8Cskjt2nEBVGtla
 rSpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0sugNdOIgAV/E1CHGrkf+dU48Rag5xhKOfE3oBhVPljIWw/b5qM+3RAqOLY0XUyr9n2ejtZANRg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsRXEhWeZ/fxGxMkaPsDAXYcb2GNUwOOKdGYRlEczO1+MBOCDi
 JwxIfr5+xVU2atn2HuAlKzUkFyS02M7tCsf2fAdmxp4TaG3DjkFyXaDNcExQ1RZo1G2TXMUI4I7
 v+/mgerEz8QQDN4So9la7rxDWKEP7KDI=
X-Gm-Gg: ATEYQzw7lM+kjBoEGk+LIEgrb9kMjvGOveqOZ28p/V9a6qwgBD7K1mYArxpAYC2VeJQ
 OCLfXJSYaWA90zLCi49H+R4LZLmk/qt7sdSSoAK9yV1YN2+dTowBRtqZCsM2QVibXyx7vvh5lAA
 D+msUWY/2x0OFnaavYNGHqcCrexSZpYcLM86fvcAKE+7jvOuqk8XAfme4eAO3BnVHCVEWsF4eYP
 dG8BgRpmqsYcOUXksHjtzJ3Mj/WNK1fEZ2XTd7kVHX3oEhtmZfTJFeRuTWCorNamgKK4wI6c2Dw
 sE65VhQ+yYBDSbmU5omP6vJVYxAXCFTMAu4Vy5J8bDHqHyJLSclEWFMrGIn6ahSN/DKVvw==
X-Received: by 2002:a05:7022:2383:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-1276acad3efmr4459654c88.1.1772124813724; Thu, 26 Feb 2026
 08:53:33 -0800 (PST)
MIME-Version: 1.0
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-8-yujie.liu@intel.com>
In-Reply-To: <20260226030038.1182961-8-yujie.liu@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Feb 2026 11:53:21 -0500
X-Gm-Features: AaiRm53PhKEH-H8S2VgmZZ1MUIfEIaZDuRwRMb5_ZanlUifF-Xs_VnxnKyGbvPw
Message-ID: <CADnq5_PD3DMPA5WY-wGS+NHmEQRXSx=WQNOygNXt8so-n2L2mA@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/amd/ras: fix kernel-doc warning for
 ras_eeprom_append()
To: Yujie Liu <yujie.liu@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org
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

Applied.  Thanks!

Alex

On Wed, Feb 25, 2026 at 10:02=E2=80=AFPM Yujie Liu <yujie.liu@intel.com> wr=
ote:
>
> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:845 funct=
ion parameter 'ras_core' not described in 'ras_eeprom_append'
> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:845 expec=
ting prototype for ras_core_eeprom_append(). Prototype was for ras_eeprom_a=
ppend() instead
>
> Fixes: 5c3be5defc92 ("drm/amd/ras: Add eeprom ras functions")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c b/drivers/gpu/d=
rm/amd/ras/rascore/ras_eeprom.c
> index cd6b057bdaf3..65c1812a10fb 100644
> --- a/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
> @@ -829,8 +829,8 @@ static int ras_eeprom_update_header(struct ras_eeprom=
_control *control)
>  }
>
>  /**
> - * ras_core_eeprom_append -- append records to the EEPROM RAS table
> - * @control: pointer to control structure
> + * ras_eeprom_append -- append records to the EEPROM RAS table
> + * @ras_core: pointer to ras core context
>   * @record: array of records to append
>   * @num: number of records in @record array
>   *
> --
> 2.43.0
>
