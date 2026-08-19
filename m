Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C37C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D2E10E142;
	Wed, 19 Aug 2026 14:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I0aykMg7";
	dkim-atps=neutral
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ECB10E130
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 14:46:48 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so155527066b.2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787150807; x=1787755607;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OSCot2pCSk3hHSz91wsSuI86JXqDJ2hDA18HgPNG+K0=;
 b=I0aykMg7B1kX7dGil9XKw1fWb1Vx7fXVSoA1SbyWg780TxM+tdY/p1F0cpP3vqCcLZ
 AX3SU588uySUcKdf8cRfpa2MnvqnfGahEuhuQQc7uG6XZfWvffRbznSD2X1TDwpzYi+r
 qF5SzN9IdkdPpIQUjh0fL4wdcu+Mb161Pf7tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787150807; x=1787755607;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OSCot2pCSk3hHSz91wsSuI86JXqDJ2hDA18HgPNG+K0=;
 b=qRdlgx4f3YflV5iOGcHpka1NioKEh6RDGRweIrknBAg6MZUCoiXwx74bI3iDYvjHDo
 rJzoBUR3x5iY4p/6gLNTifM2v9cvOLwL72sR+55LsHXag0NC2ZrC49cvBPDUoq+PWFXt
 hOKzeqP4qSty8AyvxbpKHZ9e+zdJ+w2I8gMkrKpCzsmBsqdv0oaHyWDqxrHP0GuLMxCg
 t1v2q2+ELKR1G7X1kKdm6L705cZ1x24axICHX2pYwgPdJemLat2nnLuT8nrhu7d2eNL7
 i17M1o5XkkECpsR9QhHCwXgfq85xDFKdLYmOcyrbaFYducBypS+MO79MBYnhXUNBWfpD
 VaWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrHsC+uDmT944U3tRsSUbtoDhEdg1T44s1LOAen6C71xrBqPgx1wO2mO0fDx8EDfHHdHGTGtsRLKQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkmgboiQKP4r3zOzhu2K2IGB5kQdTXNtPgsnwlmTo9+gksVSIK
 DyOjgqV+5ZsfrjvXspBAHNplN6vyWhmjpZvGrgvRM49wyU3K/2+VlLJgN8xXhuSxBqrg4H0LBEt
 d/u617Ws=
X-Gm-Gg: AR+sD137tujmeLZd1idtlqOxbq2+D4T/U2P426QAxX4L2NvLEtPtrHYx2SlUgX6H4jW
 HOFpS/8KJLHwfBbFdbQF9E9t/uCIsAOrTvKxSEdX77JZfe+VpGTCani1A6ywedC9HiInphM45Y+
 VBI6f7f0K/bI2wS0rTaJgCUfVajCISeLo1u59xagvTVoCqYHURwDTjvpxbiYu8DXOj90c7vtq78
 A5zTVF3g/PZj+OuFIxBradH4gcOJTr13MxllRij+ZjNyaLj+dAW/ofUW2E3nCBtyuKw4chHbX2+
 w2MvpIyee5s8TAzQ+zE0QqSdslgtUZlAnQTf2hK16ZNi78Mw+ApH+qL7MpcswDWGOW+LbmOZ+nC
 4X26N9pjtnYrYGn/y5XL3ucnsb461W364E52rIIriMmgd/nTobFk7ioQtkdjBXprpt0YEwghoiO
 12DQmbXA2epUEJx6XEAEZzeV+Fh7kwTFG1tCdK82hwe9tQqBTD+e14tzdObNvkFtp//EHm8ku2j
 /3zyvZm4iLRfmnl5YxLtKoEaO+q8dLEA8KMfA==
X-Received: by 2002:a17:907:6d1c:b0:c21:34a3:4d9c with SMTP id
 a640c23a62f3a-c242e255affmr370853066b.21.1787150806967; 
 Wed, 19 Aug 2026 07:46:46 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c243c7c40edsm93079066b.11.2026.08.19.07.46.46
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 07:46:46 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6a36982a875so1777636a12.0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 07:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0jn1khC29QEh4fNgEyh9M0NZ3Iezfi3JcBDLbNyLg/G/bFj9W/K4oVSAwLe4A2CMHSL12AM+AxQ==@lists.freedesktop.org
X-Received: by 2002:a05:6402:2403:b0:6a3:e813:8457 with SMTP id
 4fb4d7f45d1cf-6a4032f9c61mr3585093a12.12.1787150806331; Wed, 19 Aug 2026
 07:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
 <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
 <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
 <CAADWXX-pfvA3mKWSjdahnihAXHQB2VP9BOJDCXonG3Q_nxurLg@mail.gmail.com>
 <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
 <CAHk-=whyk2-u_1bTh5ZTeX6jW3HgAtjJh0mV_oWtgsqCe=3w7g@mail.gmail.com>
 <aoWHKmz17HQo2uy5@gsse-cloud1.jf.intel.com>
In-Reply-To: <aoWHKmz17HQo2uy5@gsse-cloud1.jf.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Aug 2026 07:46:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjv7SCjtg6JGDabGMXdqobx+WHogHfQeMPF2g_HmAU5qg@mail.gmail.com>
X-Gm-Features: AcwNN1XSfxuGhCEkqbxxdrVDPc4dzGAfkF59OcVsFeLb7hasE9yujONmHOn6O7Y
Message-ID: <CAHk-=wjv7SCjtg6JGDabGMXdqobx+WHogHfQeMPF2g_HmAU5qg@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 19 Aug 2026 at 03:36, Matthew Brost <matthew.brost@intel.com> wrote:
>
> What is the kernel verison here? Is it trying to integrate all the PRs
> for 7.3 into an RC release? Or is this the released 7.2?

That was just tip-of-tree as of yesterday evening - it just has two
small commits on top that are due to how I do my local builds, which
clean up some generated assembly and switch to using clang by default
(because I'm too lazy to use the proper way).

So it was commit

  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")

from this merge window, with no drm merges done yet.

No, the reason it stopped working was just user space doing something
new when I did an update. Plain Fedora 44.

> I'm looking into it now, and based on the dmesg output, it seems to hang
> fairly after boot, so something is going wrong very quickly. I'll
> analyze the devcoredump and see if the problem is obvious.

Yes, it hangs basically when logging in the first time. It shows the
login screen, I can type my password, but then it's done.

With the standard Fedora 44 kernel, it also hung, although at a
slightly different point.

               Linus
