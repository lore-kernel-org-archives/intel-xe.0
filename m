Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C47C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66D10F339;
	Thu, 13 Aug 2026 13:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BvH+6PSF";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50D910E48E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 01:46:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so2366235e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 18:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786585582; cv=none;
 d=google.com; s=arc-20260327;
 b=dkQgv7thaaRqrAUm3VmtQziJfdbadGAtdsbmOBLtPjqneZsiMA77F7Ar1iwxKEsF34
 PokdjyXWDXXSzBGChjF8sVAtjqwazkC8x7WWMma07yvl3bYKPpk3tTgjorl+RV6+UdMV
 TID2omMb/tyDbiOc0u00FLR/gKCtAAmkqv9j6ToC8E7oeNCjlRRrxfU7hQTUj2Bk5TZn
 KRr7xpP3iPCZxieZH10Bnm3qUunymtf3IQEEM2MjnSWbgvLfadUjPlvK32LX2mstbM49
 0JuIm8C6IX7m5t8pVCnHyJbGp9rpKydjJCEhedvW69UwCoER0b2+MDyk3flF2GI8tLdn
 Ur/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
 fh=1vVz+K4xC2+XxktPCFXYlyaKfMw6OuMlM7YpyiiiNnY=;
 b=BX2AIZIimuhpXqXPxLZEUwDr68HwbRM+SGs/qKJM7kbr49XfllyGagFJoaEnZ+bGp3
 cXwQKJzb1lfzTaOMr75dtC04Tnd3F1w8+CnF87pZqVEwobo40ep/WAEcwQSdaJmW/Z/1
 rj5QK/1YgsNEmj7rGqY0hZgrNBv9ZTLlHA6VavW6gOCy1SrS3i4Et8anshpXiskH34rQ
 eNGoSUyxVnnhzQ9qigzdbeCTRmzkoqzVmYRl9nzGwwBLT3aC5jCowqk13PlCyLi1Nepp
 /5RCt/M6wscnh+RGI/a9qdv5LCX54l7GSNUlf1GCZtYArl437UaQoL4nhxi4x2FpAWBa
 mXDQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786585582; x=1787190382; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
 b=BvH+6PSFi1oKCpfaztIcLAhielaCp3GIo1i1LhWOaxXREEQzvCmqqUw1HhDbsDALw0
 FcUHSDEd4mmwfV8X0TMcjOrdovHN8YQRAu2ROgi9xm37ehwkKx0Nvkz3DwAlTocdxsMu
 xczwdoJBvoNGUwZbx4/U1J+uFM2BeEGbzj1965VTQQibXNyUJvb763p/UkP4xc1+XGVz
 IvdFf4HMfzlsM03jSQpf1//K7TbeC5zUaX4rXu1OXpN/0GJ2muDEA2BQeBhXj2OQxVNq
 Ngir+fIwjeY+gFjuN5IDvdgM3fBeIHj+y2wHESG7BEIaVv0uEbnLG9j9NpmXyZ01YgDh
 Qnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786585582; x=1787190382;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
 b=IrTyYPSAzJXWG7upB5xoaGGbdhsPto+o6yC4trIuqSVNmoQ4OxpSDUUWHtlbkQENT8
 ruRSaMqwfu5CsxYbzV4Mvx69kONNeVlT+1/rPt/8xGRIboeCYvL43uH8bYHWOSenU8SM
 wPY0IkBJHF8lNKF6Oo6kPnbCJwXgR/pVrnUeRrHQR5KB8N5H5b+w7wW8S8vzVT/OWr/7
 3c969703jVqZgy1wwjmMm/yo11N4wHTuuoKn5iYPhRy7eAaJlaN4GNtGCEQZh6fNBHZA
 tkJDMADAEwpMsEnVzGK0/s3Q2Yu3//0qfyR5SLqI/WBUvXAJdRMAGg26jHmsYXYbfibV
 VzKw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr7ylkMMyhCqPAaK4YNF7wWlWYaB+6YFxGTElxSgQll9DaVhtANtf5Q2mucCctL6YMk+NOvGhsk3A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhy6MEJysk2ss1diePwvN6xpAgXKEj6Qp3Rs6wNaVkeI0NU+8M
 PXhy3s6N1uVQVjN0sgIj7dEpMIwZBmoLwvJFsLP9l+wG1Dqf73KFTomToRLHnoC47/gZNjeXFuf
 n7Ncnz7bTmeqQYfgzPHMbgnGsjCBIdnkTMcvcvc3y5btF
X-Gm-Gg: AR+sD10tUERGHmsy8CrwVVx+qdEu9jS1mFMXz1j0usuJHMOLzkNABhRk3Kz3zxEi8Sm
 2dBqW+MPw+/EDhrS0LzDrGUsjpN7Fe30dyTumsHpiiXZJqfB6Ty9gn9jGmRFgkiqhYFW1FIUAKe
 kcgYVHuNFWHJQI0iR7aamV7Sh56GtKBCNrdfrKqASeVKGKwvQgmSMLac4iCp3OKmtd5MPRbNC/5
 wAgiBASkPwwBUsqiML1wMnw2s+lfotwd0jzyh2xrMc8YBGK+0Dq0rM249ijr4Xi8CC/DFKKO0Wq
 6AyhUsQIg1s839Yymgty/S4HRE+LNfPlRprtdoH5jJoi
X-Received: by 2002:a05:600c:314f:b0:499:59fd:dbfc with SMTP id
 5b1f17b1804b1-499821fafebmr15881525e9.1.1786585581976; Wed, 12 Aug 2026
 18:46:21 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5ZC05rab?= <rpwtsama@gmail.com>
Date: Thu, 13 Aug 2026 09:46:09 +0800
X-Gm-Features: AUfX_mwjykauUGRd7p0JKAKBT_PY18R1a8DeaIypAi_vxLHJDca3Oj2G0IKRXMo
Message-ID: <CAF38RzLOUW1ZB1f+Q2f9mhnYs+t4R2+UQA1PCihz_FKEu-nSew@mail.gmail.com>
Subject: [REGRESSION] Panther Lake 8086:b082 internal eDP black after xe
 takeover since 7.1.6, still present in 7.1.8
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 13 Aug 2026 13:37:16 +0000
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

Hello,

I am reporting an Intel xe display regression on a Panther Lake
laptop. The problem started with Linux 7.1.6 and is still reproducible
with Linux 7.1.8.

System:

Laptop: Lenovo ThinkPad T14p Gen 4 (2026)
CPU: Intel Core Ultra 9 388H, Panther Lake
GPU: Intel integrated graphics, PCI ID 8086
Driver: xe
Display: internal eDP panel
Distribution: Arch Linux x86_64
Desktop: KDE Plasma on Wayland
Regression status:

Known good: 7.1.5-arch1-2
First known bad: 7.1.6-arch1-1
Latest tested bad: 7.1.8
The issue is fully reproducible with both 7.1.6 and 7.1.8. Downgrading
only the kernel to 7.1.5-arch1-2 makes the problem disappear.

Steps to reproduce:

Disconnect all external displays.
Cold boot the laptop.
The Lenovo firmware logo and systemd-boot menu are displayed normally.
Select the Arch Linux boot entry.
When the xe driver takes over from the firmware framebuffer, the
internal panel becomes completely black.
Close and reopen the laptop lid.
The internal panel starts working normally.
The issue occurs on every boot. Connecting an external display changes
the behavior and may allow the internal panel to initialize.

The failure coincides with the following kernel messages:

fbcon: xedrmfb (fb0) is primary device
xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun
xe 0000:00:02.0: [drm] fb0: xedrmfb frame buffer device
Tests performed:

Adding xe.enable_psr=0 does not help.
Disabling my custom xe SR-IOV service and booting without creating any
VF does not help.
Linux 7.1.5-arch1-2 works with the same firmware and userspace.
Linux 7.1.6 and Linux 7.1.8 consistently reproduce the problem.
I have not bisected the exact offending commit.
Full debug dmesg and system information are available in the linked
drm/xe issue:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8902

#regzbot introduced: v7.1.5..v7.1.6

Regards,
rpwtsama
