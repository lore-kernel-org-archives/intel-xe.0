Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A54AC5CFCF
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D411410F0B9;
	Wed, 12 Aug 2026 17:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fokx7XBH";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514410F02F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 14:35:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47fe377a217so634227f8f.1
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 07:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786545340; cv=none;
 d=google.com; s=arc-20260327;
 b=KeWCVwRvCP4VuarVngujCTWvGi7NN6NpSgVNzFgHfYV8b7KB/9FbO0pCSoyPTcWJRj
 VOr84YztTmeFWbYnOYyBw5N2y8vchUm/BmriDN800Z5Dgs6vZAc+R3kOUbuiZp0v4b17
 JrqlyLC/faSFDea3YaxRywL7McpDBlXHgzIINA3E49ZpDyIFlEcpLOWY6EkpdRbvbBlR
 cLVRagcoj+zbMLqnb+XnCe9ympcjeNSRtVkJAqCBGPLeXYKPJsMfwJ+64J2cTuY0l0UC
 2OedpinsgMt/QDLMoCBalsppnOAXBhdCoif448NOlFfdaX2ZIfr5xz4D154bU2Oz0bR/
 2OZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=4Cgpz0cWApImlFACTHN8IU5QRwWcDMSez31Kh68z/1U=;
 fh=GiCMe/pjz1Ahl66Q8z8sfH5lH2rQVWVjYvN6lSZ9tx4=;
 b=lCJGefGVMBvEan0r9VGP9D71bX9lYn5h/PTT26RzUiMr/PTx4mmPD83JbkBlO8ii8a
 Lgxg3XLwzf8ugrEuxFnjuFWBFUn5S3LUcPNN3kpji/k1VNfbUVyq574UbTV4GStrtbJB
 FwC6RCh216ER2gswPBdEpiZi4Cgn9tRW0pFGiAIhyu+Sy+fRGKsiFIGntTECXa6bqdcI
 HPNxSzmIEuwH+xl1c35+IM3/Y2s3zZq8abSWM/WEszV4WBaKuXmO0+OT/dBtBw4GHWLn
 SfTWimd6ne+TletEkLETAqRzuUcq4LjBCWSW9Uk9vUVnJay+vQgK9SB0l1d06rA57GA1
 vaPQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786545340; x=1787150140; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4Cgpz0cWApImlFACTHN8IU5QRwWcDMSez31Kh68z/1U=;
 b=Fokx7XBH6sHhAkHCU3RNVgQMuhWv2fw2HVF+UDumfi8ZdOCMC0EYiRkKfTWihiTXSD
 yI/04u1hqk//w1gXYQPbOxSKY6pgLlduEznWPu/xRAVTHH+kkx/C+uarQHQyZeGyFv7R
 I9H1K0S1DVZWYnHGSvBzn5fkPfHJXN/uGSXHrj8ybz3SCdWbiz5Ur2cCL+i94a0i2BZE
 7zC62ZETBh4EUsQEbxWVyZBZ/oJvZihF5eyLt03ONJuahjembxcqUPpVTVeTjQWJtSMy
 tDwxL6VOOUgvxKNqXzNozqlkQ7LdT8ecZExiVwyKuyhrxOFywHp/jAPPOsLQsq7aWaJb
 ZprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786545340; x=1787150140;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=4Cgpz0cWApImlFACTHN8IU5QRwWcDMSez31Kh68z/1U=;
 b=VhgZagyggtNkuFYINy9cd6/cQiZw5HSsmUSbyWOGQ0zuvj/sqq/2KURtwT5e/1b4y/
 JUiOVEJ0/Z31J/oAVb6uPUoNIbj5274/mWw6pt+bDmU0VDVeZ/kX8cxP9gRZIO70QiRb
 RApdmHQb+bA0u2TlcpwtvxBmySNdHHlqeEXCjlEKMhXeMHEwyeNLKrJ9cTt8hbu9UspH
 NTdulWu64GrEiVh8mn4Mj4Ov1wWZwf6Vko0z/6XJpk0n39TPmbaInNiLym/2ONa9BsDk
 mEgaUfKbjRRV1KpBw3DVvdu4Q7B+VtbLP31IqImlXzUoifMC1Lttl0Ht7CMEseOFRJ8v
 b1Og==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr0iwPgJD03eLTnI1swohPr74a7thTihm/onbklODHVLvq/nXXPrdKLSTQyZWbkTFZj7E5L0+GknA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxct96IvATZn4uwLhFW0MhTpMXRTq65wB27bUU5GW92lKI296Uw
 7DodIaQC5lnO2jsJxTXfsLJ6xYiSnhVWY4hw4qMO9sEjzfrdPiIyTazE6K1LCW98nuworEHWhVz
 xu+jBtmXqPA4RN6H2tuxfRcKfe7Vyh3U=
X-Gm-Gg: AR+sD13TuuwjdQLBgCPzaGioshzK9HeFH2BMC7tNfj8lBuvvSixMwhU+D4SCtnXsO7z
 Efqs8EKg9bwZD2kKctFx1y1L5eU4mHjrtoozMg6aaxjOlP5tvr/7z076cN8NtIU6nNxGf6uqqkM
 ARvKCW1+vAavj6IojieCrMuzKvrXN63rsX28iJsA1JZ2yZlIWPqsLCThbdfONFO/HPHvX9D6H+x
 eoKX0PsC1XKVY/YZx7mAhTIMqUKxsOoGzWV2SiVzxojWiDtjBeWZc89aX2Z+6iKyW1AkKvG6MJa
 4HtZB9I2aAoo/sKrQu1+eZZBnkYAPPbMbA7s919fsG8W
X-Received: by 2002:a05:6000:4281:b0:47f:96e6:70a with SMTP id
 ffacd0b85a97d-481528bf608mr7525297f8f.0.1786545340144; Wed, 12 Aug 2026
 07:35:40 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5ZC05rab?= <rpwtsama@gmail.com>
Date: Wed, 12 Aug 2026 22:35:26 +0800
X-Gm-Features: AUfX_mxbmGloEkTFNTD0VElyswP7v1uUnHrZug9G_iEZ1UTNZ_MSc8ZGrW36qSM
Message-ID: <CAF38RzLJihCvga6UgkPPR+A1jY33bf1T083CfDy+pfBuzYcdjg@mail.gmail.com>
Subject: [REGRESSION] Panther Lake 8086:b082 internal eDP black after xe
 takeover since 7.1.6, still present in 7.1.8
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000005fe1230658da807b"
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:20 +0000
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

--0000000000005fe1230658da807b
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting an Intel xe display regression on a Panther Lake laptop. The
problem started with Linux 7.1.6 and is still reproducible with Linux 7.1.8.

System:

   - Laptop: Lenovo ThinkPad T14p Gen 4 (2026)
   - CPU: Intel Core Ultra 9 388H, Panther Lake
   - GPU: Intel integrated graphics, PCI ID 8086
   - Driver: xe
   - Display: internal eDP panel
   - Distribution: Arch Linux x86_64
   - Desktop: KDE Plasma on Wayland

Regression status:

   - Known good: 7.1.5-arch1-2
   - First known bad: 7.1.6-arch1-1
   - Latest tested bad: 7.1.8

The issue is fully reproducible with both 7.1.6 and 7.1.8. Downgrading only
the kernel to 7.1.5-arch1-2 makes the problem disappear.

Steps to reproduce:

   1. Disconnect all external displays.
   2. Cold boot the laptop.
   3. The Lenovo firmware logo and systemd-boot menu are displayed normally.
   4. Select the Arch Linux boot entry.
   5. When the xe driver takes over from the firmware framebuffer, the
   internal panel becomes completely black.
   6. Close and reopen the laptop lid.
   7. The internal panel starts working normally.

The issue occurs on every boot. Connecting an external display changes the
behavior and may allow the internal panel to initialize.

The failure coincides with the following kernel messages:

fbcon: xedrmfb (fb0) is primary device
xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun
xe 0000:00:02.0: [drm] fb0: xedrmfb frame buffer device

Tests performed:

   - Adding xe.enable_psr=0 does not help.
   - Disabling my custom xe SR-IOV service and booting without creating any
   VF does not help.
   - Linux 7.1.5-arch1-2 works with the same firmware and userspace.
   - Linux 7.1.6 and Linux 7.1.8 consistently reproduce the problem.
   - I have not bisected the exact offending commit.

Full debug dmesg and system information are available in the linked drm/xe
issue:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8902

#regzbot introduced: v7.1.5..v7.1.6

Regards,
rpwtsama

--0000000000005fe1230658da807b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Hello,</p><p class=3D"gma=
il-isSelectedEnd">I am reporting an Intel xe display regression on a Panthe=
r Lake laptop. The problem started with Linux 7.1.6 and is still reproducib=
le with Linux 7.1.8.</p><p class=3D"gmail-isSelectedEnd">System:</p><ul><li=
>Laptop: Lenovo ThinkPad T14p Gen 4 (2026)</li><li>CPU: Intel Core Ultra 9 =
388H, Panther Lake</li><li>GPU: Intel integrated graphics, PCI ID 8086</li>=
<li>Driver: xe</li><li>Display: internal eDP panel</li><li>Distribution: Ar=
ch Linux x86_64</li><li>Desktop: KDE Plasma on Wayland</li></ul><p class=3D=
"gmail-isSelectedEnd">Regression status:</p><ul><li>Known good: 7.1.5-arch1=
-2</li><li>First known bad: 7.1.6-arch1-1</li><li>Latest tested bad: 7.1.8<=
/li></ul><p class=3D"gmail-isSelectedEnd">The issue is fully reproducible w=
ith both 7.1.6 and 7.1.8. Downgrading only the kernel to 7.1.5-arch1-2 make=
s the problem disappear.</p><p class=3D"gmail-isSelectedEnd">Steps to repro=
duce:</p><ol start=3D"1"><li>Disconnect all external displays.</li><li>Cold=
 boot the laptop.</li><li>The Lenovo firmware logo and systemd-boot menu ar=
e displayed normally.</li><li>Select the Arch Linux boot entry.</li><li>Whe=
n the xe driver takes over from the firmware framebuffer, the internal pane=
l becomes completely black.</li><li>Close and reopen the laptop lid.</li><l=
i>The internal panel starts working normally.</li></ol><p class=3D"gmail-is=
SelectedEnd">The issue occurs on every boot. Connecting an external display=
 changes the behavior and may allow the internal panel to initialize.</p><p=
 class=3D"gmail-isSelectedEnd">The failure coincides with the following ker=
nel messages:</p><pre dir=3D"ltr"><code dir=3D"ltr">fbcon: xedrmfb (fb0) is=
 primary device
xe 0000:00:02.0: <span class=3D"gmail-text-token-text-primary gmail-cursor-=
text gmail-rounded-sm">[drm]</span> *ERROR* CPU pipe A FIFO underrun
xe 0000:00:02.0: <span class=3D"gmail-text-token-text-primary gmail-cursor-=
text gmail-rounded-sm">[drm]</span> fb0: xedrmfb frame buffer device</code>=
</pre><p class=3D"gmail-isSelectedEnd">Tests performed:</p><ul><li>Adding <=
code dir=3D"ltr">xe.enable_psr=3D0</code> does not help.</li><li>Disabling =
my custom xe SR-IOV service and booting without creating any VF does not he=
lp.</li><li>Linux 7.1.5-arch1-2 works with the same firmware and userspace.=
</li><li>Linux 7.1.6 and Linux 7.1.8 consistently reproduce the problem.</l=
i><li>I have not bisected the exact offending commit.</li></ul><p class=3D"=
gmail-isSelectedEnd">Full debug dmesg and system information are available =
in the linked drm/xe issue:</p><p class=3D"gmail-isSelectedEnd"><a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8902">https://git=
lab.freedesktop.org/drm/xe/kernel/-/work_items/8902</a></p><p class=3D"gmai=
l-isSelectedEnd">#regzbot introduced: v7.1.5..v7.1.6</p><p>Regards,<br><spa=
n class=3D"gmail-text-token-text-primary gmail-cursor-text gmail-rounded-sm=
">rpwtsama</span></p></div>

--0000000000005fe1230658da807b--
