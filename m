Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52774CAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF7910E6ED;
	Wed, 24 Sep 2025 11:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FyTqFo59";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9203710E0C2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 09:51:12 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2698d47e776so39547755ad.1
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758621072; x=1759225872; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ujUSntEdEB2Zj8RW3cXBNzPb5lb7mNEARj7gYfxpl6o=;
 b=FyTqFo59LR881O8bttoiJQAwYYxYL6jDUsrfJMd+3alFfFPvYIucMYLOtzgxC3ldIA
 +w9a6mfM8C7It7K7A2OnQCgw9MdiTZiUw5Y0Zwwn9JSznoc2FuzBZQ8q1Rx5Lh7VSDpO
 UHmH5X+3cw30kP4riy330UWuisgviH5bWXHra9Dg+tp5a4SpjO6ei5GsnZ9QC+AVGQIG
 QL6lIv3uyfiEPPtaR3uI5+fROleylB6XfrKRAoaFtllnbiLs20jTLJYhDin1Lq3jdJUJ
 xHu1/n2Z4mqaGv4ASqVbJ+enJsaMwHEgR47exmvcY2XVqCUkjaRMWlUrDy7WkDUs6zzn
 qTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758621072; x=1759225872;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ujUSntEdEB2Zj8RW3cXBNzPb5lb7mNEARj7gYfxpl6o=;
 b=muIDNAodR2tlTuUL9khY5Ki3CiqCtF3HJtaXGtFCvtyYGSIIistQtdKBX4sa69RCqL
 5fcYymHHbw1RAjXtP5lsuQuybsb5FHFengJ/ic+J4kUKnjzcb4RVdPW0IfT9wQYGNG/T
 Z6P3mxA1Iluk9B1BhHfv4JObAd9CgPIWviRDyKMgyltB6OWs34vHzN512YmpK4fhSqbY
 WQ/mOnyYGw4mkAXZYoWaIU8YUZomibUub2IW/9aBHIsVkVWkO7VPB9AU+kb3PzFzkbQP
 aO3Rys4HyhBsAt5L/n+4hDrbIev+IXF78SX0ilf2Puqq45a2eJQRaWUSHtmW/ZD69SfP
 NGJA==
X-Gm-Message-State: AOJu0Yy4SWtQPzAGWJObjlyO3G8O0agzRhsmvjU/eWQk5XZMywKdRhpi
 Np9wstvI29nMZgVJlXTzRynfyUOqiEyN9+QRPE35bggEa9YFsiaKIUclBk99xdN2C2m19ovOtsm
 g+WqXt862VO84jQFbSEbB+4F6rSXlvg9W5NXL4gOwRHhpJFZBXcaguD8A5A==
X-Gm-Gg: ASbGncuvN64pMOlo2JRRLHIQSlq323Ww3Ggx+LFFu2GOibu9j1HPg75gS157HUZpeSC
 D73oKwx8TZh9KL8yTbY6ORYpYE24K/60CEkfurM5GDCQFOn3QGVLtqbu9oiEO1/P5IuMewySyNQ
 rASn+cJj1Gt5tNAU7iig7boZ/uRlpDPSa176zXENPeIbbz72X7/u4mYJ3ryh/gVv4MtFg8BE7Yn
 qKSvYeQ4nN5/sbcyvsg/2VqMNUeBraWRUowY+G7gVld6Va9tiI=
X-Google-Smtp-Source: AGHT+IFHus42Ak5ruWRhTAyg3xMfr+guDvkTkhHI6eHQ3GvPvUzkyf4uNtM2sp4MCW+8IQd4OjacMuEUwlCpUIFW7h0=
X-Received: by 2002:a17:902:ecc5:b0:264:c886:8188 with SMTP id
 d9443c01a7336-27cc2c98b42mr26887555ad.24.1758621071785; Tue, 23 Sep 2025
 02:51:11 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Sep 2025 15:21:00 +0530
X-Gm-Features: AS18NWCTfgTcnoVtFJ38FtxMSy0NvoryOqAycB2FQR-fdtYRDlc0bdIbrsPkR5s
Message-ID: <CA+G9fYuZZUQq=7qPavXnHZtX9oQ=amfYVeYRZu3SHfD0ReD6nQ@mail.gmail.com>
Subject: next-20250922: xe_device_sysfs.c:300:25: error: label 'cleanup' used
 but not defined
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
 Linux Regressions <regressions@lists.linux.dev>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Anders Roxell <anders.roxell@linaro.org>,
 Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 24 Sep 2025 11:59:10 +0000
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

The arm64 and x86_64 builds failed on the Linux next-20250922 tag build due
to following build warnings / errors with gcc and clang toolchain.

First seen on next-20250922
Good: next-20250919
Bad: next-20250922

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250922: xe_device_sysfs.c:300:25: error: label
'cleanup' used but not defined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
drivers/gpu/drm/xe/xe_device_sysfs.c: In function 'xe_device_sysfs_init':
drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup'
used but not defined
  300 |                         goto cleanup;
      |                         ^~~~

## Source
* Kernel version: 6.17.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250922
* Git commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
* Architectures: arm64, x86_64
* Toolchains: gcc-13 and clang-20
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29968978/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250922/log-parser-build-gcc/gcc-compiler-drivers_gpu_drm_xe_xe_device_sysfs_c-error-label-cleanup-used-but-not-defined/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/config

--
Linaro LKFT
