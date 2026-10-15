Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC24CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 12:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB8010E1E4;
	Thu, 15 Oct 2026 12:15:41 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAF710EBC1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 10:25:45 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-354ba08cfd1so8512192eec.1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792059945; x=1792664745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F9+8qJXYIs+6iS8q/9Zgf4xjmHf09yWUVJ++iLRt+bQ=;
 b=XTDRVg17Zhc/ELWBbGTsnEqoyOvp8OfsD0f+iZeZQK+nFU4ggDxumdmjo7bOGK7bEF
 uFqnFiig77r1fvtWiesDv6V9QqnZa2BsiJbL9nWSqDutnSvWGAYUlVrkH0E0sJzJ1+Mm
 bRYw4CT+tcYBy1h+E+cLzquzdciVKPiia7N+RzEl1GZfhxDwCw/OAfEK0ZvFgDGKlch2
 RnEOpEn0ngCMw66SyeetPZM7GRTuYCKCmwLcLfp7m6IsBEUtnWY1eK2bdJIvjtTY4Fxm
 MHvqqFNiquWKVgQ65Kbtl0hMAoDFWGqYOT+JS9kNY6ZALhi2WphYi5gIxue/FP8xjQ6x
 WCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059945; x=1792664745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=F9+8qJXYIs+6iS8q/9Zgf4xjmHf09yWUVJ++iLRt+bQ=;
 b=laeqO0iNnVRyzEFh49sUaI5icKMwvOjsGppJqQxBVGg6YIsGo/3fuoY8r6W5G80Pf7
 XaSLUGPZlvI7YcvKALLAcxRU+hMdSadQG2fj4fYA9qwlrYX1gHMGNefmSE2Hosuuq1/E
 V0OAWX3La+jmyNn0PFTuXnOy9r7w+IpwLTAddUyb4PHCOm/o4E5CEZ+RseZjvlIXryS6
 e7RjvDJlpehjr/q9OLuA8POVhRQUw5KJQ4gJxfJhBOh6KPYl/FUv8tn6PMttW3f14Gb9
 x8Hk7uv41Ix9ikvbqi0CKl/cc6r0Gt/mydpVIE97zKrww2fgzowpJ6Hw9Z5uN+0ph4EA
 75Dw==
X-Gm-Message-State: AFq9FYIaoD8cWqpTN0n+q45DzShac+dIKKqpUN87y46C7A89Kv1WscJ8
 WQqUbaQo3u4HfsTWLSL/98It6uRvcAAOCgJxhv5txvPmila6dmX+UU5a
X-Gm-Gg: AYBFou0SfPQ0UVSgq3KgKCo8Q7Nl40Nu5BDrUfdY1bKXJckPxIO3bbDBgfV9wJxwyxX
 FrOegVn+jV8LOHWoORE89I6cLE93WXepZip8vpOH2KIrsEJDpv251cPU5YmteaSJpu5fjlhYBQs
 qvU0duzYzsjapLdeFy4C8h1AjVqtDvXQ7NlEp9zZ2Pr1e6I1/ikQmT75HarTQHHFnGoMGLwwIzJ
 VJie4W+US2RDd0AEls8MnrSmXwIws3an2mLirZgC87gGJXK2JDYzlcaxLdxErKF8QIzIU9q03KU
 a7hWA9AVmNjM6rxDUm68uvJSVR6y5/ApKJ74d77tSPkLx/O21fSpmUT6M8uwt1tPDx+ZwlEGXKk
 i0pbHuDWlKCkkqIQTBk7rCNZzr0NIGYr4CID49aF4HPV5hi+5xJ2mdVtKr1WTN1/T1HHo+n/aI/
 SZo7iYeMKRtSHo0ecKB0/dTlOhbj7ZQv+ewvzhXI50/8xMxTSuljzOI6ah/U5Rfjkf3nB1JeZJB
 mDE5PdeyK9D
X-Received: by 2002:a05:701b:2086:20b0:149:1b5b:1f25 with SMTP id
 a92af1059eb24-16a5adfc081mr26042391c88.15.1792059944864; 
 Thu, 15 Oct 2026 03:25:44 -0700 (PDT)
Received: from ex-b560m-v5 ([2804:10f8:4586:e200:6d46:b07e:caa4:4492])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-16997c21ff3sm54274363c88.2.2026.10.15.03.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:44 -0700 (PDT)
From: Victor Ferreira <dev.victorferreira@gmail.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 0/9] Add fan control support
Date: Thu, 15 Oct 2026 07:25:21 -0300
Message-ID: <20261015102521.74468-1-dev.victorferreira@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717041757.2759084-1-karthik.poosa@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Oct 2026 12:15:40 +0000
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

Tested v2 on a consumer Battlemage part. The testing I could find for this
series was on an Arc Pro B60 (8086:e211, G31), so here is a data point from the
consumer side of the lineup.

Hardware:  ASRock Arc B580 Steel Legend 12GB OC
           8086:e20b, subsystem 1849:6020, BMG G21
Kernel:    7.2.9 with this series (v2, all 9 patches) applied, no other changes
Userspace: NixOS, xe driver, no lockdown LSM

The PCODE FAN_SPEED_CONTROL mailbox answers on this SKU. Reading proves it
before any write happens: with pwm1_enable=2 the driver pulls the card's own
stock table off the hardware, and the values are sane rather than zeros.

  point  1   10 C -> 26      point  6   80 C -> 153
  point  2   50 C -> 26      point  7   85 C -> 179
  point  3   55 C -> 51      point  8   90 C -> 204
  point  4   70 C -> 77      point  9   95 C -> 230
  point  5   75 C -> 102     point 10  100 C -> 255

Manual control works across the full range. Starting from a fan held at 0 RPM
(pwm1_enable=1, pwm1=0) for eight seconds:

  echo 0 > pwm1_enable    365 -> 2053 -> 3805 RPM within six seconds,
                          holding around 3870 RPM for the full minute
  same minute             package 51 C -> 35 C, vram 56 C -> 40 C

The temperature falling is the part that does not depend on trusting the
tachometer. pwm1_enable=2 hands the card back to its stock curve. pwm1 writes
are correctly refused unless the mode is already 1, and a duty written as 200
reads back as 199, which is the round trip through the percent conversion
rather than a defect. The same measurements on v1 gave the same picture, so
nothing regressed between revisions on this card.

A few observations, offered in case they are useful for the ABI documentation:

- fan1_max reads 3600 on this card while the fan holds around 3870 RPM under
  pwm1_enable=0 (one reading reached 4187). Anything computing a percentage
  from fan1_max will exceed 100 on this SKU.

- pwm1_auto_point*_pwm reflect the ACTIVE table. With a userspace controller
  holding pwm1_enable=1, they read back as that controller's current flat duty,
  not as the stock curve, which is easy to mistake for a broken stock table.
  Only mode 2 shows the stock values above.

- This board has no late binding fan control firmware and is unlikely to get
  one: lb_fan_control_version is empty, and linux-firmware currently ships only
  fan_control_8086_e20b_8086_1100.bin, which is for Intel's own board. Manual
  control works regardless, since it goes through PCODE rather than that blob.
  This seems worth stating explicitly somewhere, because the missing firmware is
  widely assumed to be a prerequisite for any fan control at all.

- Taking the fan manual loses the card's own zero RPM behaviour. Under the stock
  table this card idles with the fan stopped at duty 26, while the same duty
  written manually spins it at roughly 530 RPM. With the fan deliberately
  stopped the card settles at 60-62 C core and 66 C vram and stays there, so
  nothing runs away, but a userspace curve has to pick its own stop threshold.

Tested-by: Victor Ferreira <dev.victorferreira@gmail.com>
