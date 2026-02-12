Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28762EE36AE
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 17:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E227910E286;
	Thu, 12 Feb 2026 17:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mSbKzM+w";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F88F10E787
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 17:32:39 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso647685ad.1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 09:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770917559; cv=none;
 d=google.com; s=arc-20240605;
 b=dWAJ/5iWLGeOxFEu61elhusFfHn7St2pU1ieWSUW2dc6IwI3nMayIlAmxC4h3NxQKS
 x7EQy91HOrJ+D80qHpN02Tn1w258RpK2fLBDYiWL/efIsXg6l2LG0MWCDa+EOQ5vUpQC
 JAJ8XUajEgnwhhYb+iMHyPT2y6k8YmeLXLFt95J6PdVmq2u1oz3+1A9fireMNCEvlDcX
 VITeEBQViWUNitbzdRYjM3Q5TJO39nDjWQ6XEhq/PWFtVMDjdeAj8Gn7b62cVYyEzZSv
 z6OhoPPsguJKPipNRNRCPCEIUyiWq22ITBzmSbRXc7BMRSRBdwojI3NEyD/6YSaInfn6
 hR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KJWO+CWz2+ZX1hwrogxjvfwO0uyUciYnaKJTLU1x3oY=;
 fh=RFppEzO4elKhGEbrAkH0pVrVCwuXjdpbMgvSHH9pWZc=;
 b=WIhLGvCZ2xTUe2XlPiAuR08henKtAGb3doy8Rl2aev8DPipWbqS9Ammb028jlcH+8C
 RyCGx32ZlBYHDSn8vFapFIoEEG3wHhqsyxveS44SV80+NJ0Am0+WMvy6RWaL+eXVP5zn
 2URUKaspJ7gnQcY/ZHgweFg+SDiB4w/RqpAs7ZqcpzNQ3pzATiaUDZYu+YNiKDlulMX6
 1ulWfH5+BD9P/sbjvZHmHQKskR8huAQzn+ldhJOMh7olFlvMxi32LsUFBk3cUx3b5TSX
 vdPLLzanW3N158To/eQaeLcQJvyzqOPRm/Sa8ycET2r3KSN7Gm1yOuLJMQg5dwaR5pYJ
 vevA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770917559; x=1771522359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJWO+CWz2+ZX1hwrogxjvfwO0uyUciYnaKJTLU1x3oY=;
 b=mSbKzM+w/Boi49/ccyMoUtgk6U+QYiUcaC3amaoDs6hF0sjcDUxaMzEHUZn6MiVezL
 jOaUqazxh+PUz4ztQYcRPq4z/JYAigEKNS8C7ecPFn8kHY0eYtYmZk2Vnn5Bjd3oBaNP
 KuirHhwlUhYVCeDuskFzreTSltNzSnygp1pbTVBsBr98NCcY9IqWCVHH1yxucw8tIPC9
 q8bC8rZaXxfJXMeX+eaJ4N1iohwft9Ah2GS0c7pcMXICUDCByu1++7w8XN12uUuARi/C
 T4Gqc2ixuvRHMjD4H78p4t0PoQepWnvXFNQ0mYDgUzAYJndwmJQwroAgqN4JlLAbQFHs
 xaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770917559; x=1771522359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KJWO+CWz2+ZX1hwrogxjvfwO0uyUciYnaKJTLU1x3oY=;
 b=t6pJ2H0D4nHxyEVjfn8xlub3Mc6rZ0bfZ9VDyEhN0BfTUkUVTjfNb3UDpgC95r45NN
 pwK/KolEi17tL0d9vgzB8p4XWqT8CWRfJWFFgjNVvZg0W0Lxl22q/ocCduufth6vFdg2
 t+oo2mdSQLYdI7epJKD1+8yuK8SgJ210zIb4g0AdTm65qs2QQyyym5Li6RkxU7ESXn6+
 AaWyZkI869r3wj2c6Cl+jAmA5AgL3VpDuhHPNU+FQ5l23cmVfLK4CclJ+vtWgFJ6CPNR
 ILDCwVSY67VADaLgxdYxys4YZc4G0iMd+v6xeuloZ+i8ZMpWKZOjOUHu1jnralAib1/+
 9N3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF1tcaJTXlDZL2quwH4UW5BUBtr+AJoDeP3aO78X7icghvqO2xpyBGm10zCBnq3hdNn7EefIBUNQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjiaZUaFWM20Wjf9pzyMS7rxKdqOxMoh/AEQ5pAHh3P5Ldt1he
 gtvs1zXwzmXS1nlxmp+rraNytml3NpFxwRVmRFrS34EXcZL6YnbdjbjnqtHBdENzPh5qRrVx3/R
 fJehngmM5mb/KHQVN+g/3A7w0s+6+uUFNlVqz+Qk=
X-Gm-Gg: AZuq6aI8tTSmgqFvdCRtPPyGwmmmzI5414GvgU6pBF1EEuMpUtIdajLZTkcASq2KaWX
 C3zWBnVzp9rKjqSq+Q+lCrQH10E6hobHhu/exaUgqeQ+CKAX3Bp9VIAl5TaMrRePRAxrECTsltM
 6cnnp35ilcz8Xwd+iUEyBQL2XgAAH20fzadXISd7KQ0NKoSCci76ort8wBtqoOuJBRLEuV5Y/tg
 6vWsW6TXBnLjW5NtuM9V3AcE7Yf+TdIz7i6aOYZWDlIDy17f4U75/sujbB5yOBmy3fFbPrlpwQP
 CjXDCLCFOSS9zspwCwq8HCCyhqqsftbEkfyVVN8IMQ==
X-Received: by 2002:a17:902:d4c8:b0:2aa:d320:e969 with SMTP id
 d9443c01a7336-2ab3b18986fmr26218815ad.8.1770917558647; Thu, 12 Feb 2026
 09:32:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770379986.git.jani.nikula@intel.com>
In-Reply-To: <cover.1770379986.git.jani.nikula@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 12 Feb 2026 19:32:27 +0200
X-Gm-Features: AZwV_QiZn4TfGQHluDXPNcwCixx5hFSZrHcH64ZJp433UqxfD81wtNyyp1Vdtdk
Message-ID: <CAJ=qYWSJ8n71Y0tE=dqGcwib1Fq7mq=4NKnFsD0sODiUhmcVrA@mail.gmail.com>
Subject: Re: [PATCH 00/10] drm/i915/dpt: refactoring, move to parent interface
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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

I didn't spot anything special on these other than maybe patch
"drm/i915/dpt: switch to i915 runtime pm calls" could use better
commit message.

set is
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Fri, Feb 6, 2026 at 2:13=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
>
> Jani Nikula (10):
>   drm/i915/dpt: move display/intel_dpt.c to i915_dpt.c
>   drm/i915/dpt: pass obj, size instead of framebuffer to
>     intel_dpt_create()
>   drm/i915/dpt: move create/destroy to parent interface
>   drm/i915/dpt: move suspend/resume to parent interface
>   drm/i915/dpt: remove display/intel_dpt.h
>   drm/i915/dpt: drop _common from the DPT file names
>   drm/i915/dpt: switch to i915 runtime pm calls
>   drm/i915/dpt: rename i915 specific functions to i915_dpt_ prefix
>   drm/i915/dpt: rename struct i915_dpt to intel_dpt
>   drm/i915/dpt: pass opaque struct intel_dpt around instead of
>     i915_address_space
>
>  drivers/gpu/drm/i915/Makefile                 |   2 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   1 -
>  .../drm/i915/display/intel_display_types.h    |   2 +-
>  drivers/gpu/drm/i915/display/intel_dpt.c      | 316 +++---------------
>  drivers/gpu/drm/i915/display/intel_dpt.h      |  22 +-
>  .../gpu/drm/i915/display/intel_dpt_common.c   |  35 --
>  .../gpu/drm/i915/display/intel_dpt_common.h   |  13 -
>  drivers/gpu/drm/i915/display/intel_fb.c       |  21 +-
>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |  15 +-
>  drivers/gpu/drm/i915/display/intel_parent.c   |  28 ++
>  drivers/gpu/drm/i915/display/intel_parent.h   |   9 +
>  .../drm/i915/display/skl_universal_plane.c    |   1 -
>  drivers/gpu/drm/i915/i915_dpt.c               | 277 +++++++++++++++
>  drivers/gpu/drm/i915/i915_dpt.h               |  20 ++
>  drivers/gpu/drm/i915/i915_driver.c            |   2 +
>  drivers/gpu/drm/xe/Makefile                   |   2 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  20 --
>  include/drm/intel/display_parent_interface.h  |  11 +
>  18 files changed, 419 insertions(+), 378 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
>  delete mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h
>  create mode 100644 drivers/gpu/drm/i915/i915_dpt.c
>  create mode 100644 drivers/gpu/drm/i915/i915_dpt.h
>
> --
> 2.47.3
>
