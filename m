Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365D2D3B99E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 21:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB74D10E214;
	Tue,  9 Dec 2025 21:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aX5pnGfe";
	dkim-atps=neutral
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA2710E219
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 21:57:09 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7baa28f553dso225538b3a.3
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Dec 2025 13:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765317429; x=1765922229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rX+wN9QFogObW9mM6K67XIhoFb2N+khXMzC674vCr8Y=;
 b=aX5pnGfeY9b/mjCvAqVFj8JgKuPcAeb/mo3Au3LeUyyRbBmkJs9ynGnQft6IVSnZQs
 zIwh5vzyiZRtnh6UldlQJny06gIt4vv155XsGvt4SbynAQ/p9yARw5DIb9/HwH9xk75b
 igvWiR0rUM+dGUupPiG9TAJN3jweMjC/Ym5N/rFGEZyjbCjzFZZGlfnXmFjHTaVay39B
 1VGcqcVrFIxaaG1IJveVO2gK4lT0CTDwPivK5hBWK85zwVITeFfbJJYbnOHoGsLfcI7c
 L5LwrBRYAwxQAqmtH1+iFetaLjUEd2uMUZOyhqgOQuT6tcCCfZMzQEyBXz9o6b46QlIM
 PeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765317429; x=1765922229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rX+wN9QFogObW9mM6K67XIhoFb2N+khXMzC674vCr8Y=;
 b=LByzv737scFXUX+eW33x9zRuiKvf1arq4G2HVDRRrTLadGmoe2NArPusG9YLDlqR/5
 S7sGqCX/km6nDSSpAZrymwq2rFt7xp26z0dhKmDQMM0ZWrGQQAGNd7EFVVrzpl7hmIy4
 NU/iNOegJAY48QJCmMAs863NlvVkkbsig4+8Q5el94ZnvXjwMkaqn65cBUVrJ2fH7zhW
 tOuuQVxlY5Zp46jKuWiZMEx21BcliLWv2RZXRHcvNOJLf5IXSJd79b36PeKVo6acwftq
 XXnZ5TECFMx4rV2/e5YobAYaTtXjFaSOEI6Kto0AdVi72354+I62nv7vmzOKTsgzkLHE
 SKmw==
X-Gm-Message-State: AOJu0YwIvHzN1X0aLzMir9VG0o1dM2DcntcCjYt6cDwf4GVWkBlgV2kB
 kKf9L3wnECYFgdRKyU++bHRxJHlSSeNp5ID2gD+zNuWpsuZYHzb7Cx8CEAlZZg9F5Wr6wNaT9mS
 k4xMepnq5M0jUAX/F1l+L1TgbSm5+yf4=
X-Gm-Gg: ASbGncuNQorpgEl5gUeQEpPt9oOpgkQ4C/UBmf7W84esxpjjpqQ1fpCpNVdoR5ev+L1
 cr1os8ZcVMQ+8y02ILSmQtFatGyP98KAR9T+ZB/xDQaIiXNJJcnhl668ZQUQ/l14rgidzPc+CUW
 GFrS46oLoom53QZCQ2tnyLe67jTXmk77mZIXGWxFbAkmxX6y2WSWTtI9N8J1ztY/uPMRGSvP0AY
 hTV5Kx8ZlUrM6xk09MGHFGAoSGnNzmDRyrHsPW8hiBvqk40/vppgcQiRoHMRtNX2Om4XaN92teM
 +bwObA==
X-Google-Smtp-Source: AGHT+IHII9D83D9B/BqGeUZIF7jvP+2QEGFlvAirMNzmIalQpo7195q7ToyoRQ9oqeI7d3G2KScatkwc1poRwQSSwLo=
X-Received: by 2002:a05:7022:2384:b0:11a:5cb2:24a0 with SMTP id
 a92af1059eb24-11f2966a707mr68575c88.1.1765317428882; Tue, 09 Dec 2025
 13:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20251205083934.3602030-6-riana.tauro@intel.com>
In-Reply-To: <20251205083934.3602030-6-riana.tauro@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Dec 2025 16:56:57 -0500
X-Gm-Features: AQt7F2oV5qVpxXbneq_-0cZzGn0SnKZPKQknZi65mhBUpzRoQqkHTme441oL53A
Message-ID: <CADnq5_NJgcnJaZhzF14O+sQkV6nWEx94aO59EfMdf5X=oYTydA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introduce DRM_RAS using generic netlink for RAS
To: Riana Tauro <riana.tauro@intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de, 
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com, 
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com, 
 shubham.kumar@intel.com
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

+ Hawking, Lijo to help review.

On Fri, Dec 5, 2025 at 3:19=E2=80=AFAM Riana Tauro <riana.tauro@intel.com> =
wrote:
>
> This work is a continuation of the great work started by Aravind ([1] and=
 [2])
> in order to fulfill the RAS requirements and proposal as previously discu=
ssed
> and agreed in the Linux Plumbers accelerator's bof of 2022 [3].
>
> [1]: https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.i=
ddamsetty@linux.intel.com/
> [2]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@lin=
ux.intel.com/
> [3]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summa=
ry.html
>
> During the past review round, Lukas pointed out that netlink had evolved
> in parallel during these years and that now, any new usage of netlink fam=
ilies
> would require the usage of the YAML description and scripts.
>
> With this new requirement in place, the family name is hardcoded in the y=
aml file,
> so we are forced to have a single family name for the entire drm, and the=
n we now
> we are forced to have a registration.
>
> So, while doing the registration, we now created the concept of drm-ras-n=
ode.
> For now the only node type supported is the agreed error-counter. But tha=
t could
> be expanded for other cases like telemetry, requested by Zack for the qua=
lcomm accel
> driver.
>
> In this first version, only querying counter is supported. But also this =
is expandable
> to future introduction of multicast notification and also clearing the co=
unters.
>
> This design with multiple nodes per device is already flexible enough for=
 driver
> to decide if it wants to handle error per device, or per IP block, or per=
 error
> category. I believe this fully attend to the requested AMD feedback in th=
e earlier
> reviews.
>
> So, my proposal is to start simple with this case as is, and then iterate=
 over
> with the drm-ras in tree so we evolve together according to various drive=
r's RAS
> needs.
>
> I have provided a documentation and the first Xe implementation of the co=
unter
> as reference.
>
> Also, it is worth to mention that we have a in-tree pyynl/cli.py tool tha=
t entirely
> exercises this new API, hence I hope this can be the reference code for t=
he uAPI
> usage, while we continue with the plan of introducing IGT tests and tools=
 for this
> and adjusting the internal vendor tools to open with open source developm=
ents and
> changing them to support these flows.
>
> Example:
>
> $ sudo ynl --family drm_ras  --dump list-nodes
> [{'device-name': '0000:03:00.0',
>   'node-id': 0,
>   'node-name': 'correctable-errors',
>   'node-type': 'error-counter'},
>  {'device-name': '0000:03:00.0',
>   'node-id': 1,
>   'node-name': 'nonfatal-errors',
>   'node-type': 'error-counter'},
>  {'device-name': '0000:03:00.0',
>   'node-id': 2,
>   'node-name': 'fatal-errors',
>   'node-type': 'error-counter'}]
>
> $ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id"=
:1}'
> [{'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0},
>  {'error-id': 2, 'error-name': 'SOC Internal Error', 'error-value': 0}]
>
> $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":=
1, "error-id":1}'
> {'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}
>
> IGT : https://patchwork.freedesktop.org/patch/689729/?series=3D157409&rev=
=3D3
>
> Rev2: Fix review comments
>       Add support for GT and SOC errors
>
> Rev3: Add uAPI for errors and nodes
>       Update documentation
>
>
> Riana Tauro (3):
>   drm/xe/xe_drm_ras: Add support for drm ras
>   drm/xe/xe_hw_error: Add support for GT hardware errors
>   drm/xe/xe_hw_error: Add support for PVC SOC errors
>
> Rodrigo Vivi (1):
>   drm/ras: Introduce the DRM RAS infrastructure over generic netlink
>
>  Documentation/gpu/drm-ras.rst              | 109 +++++
>  Documentation/gpu/index.rst                |   1 +
>  Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++
>  drivers/gpu/drm/Kconfig                    |   9 +
>  drivers/gpu/drm/Makefile                   |   1 +
>  drivers/gpu/drm/drm_drv.c                  |   6 +
>  drivers/gpu/drm/drm_ras.c                  | 351 ++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c      |  42 ++
>  drivers/gpu/drm/drm_ras_nl.c               |  54 +++
>  drivers/gpu/drm/xe/Makefile                |   1 +
>  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  68 ++++
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_drm_ras.c            | 199 +++++++++
>  drivers/gpu/drm/xe/xe_drm_ras.h            |  12 +
>  drivers/gpu/drm/xe/xe_drm_ras_types.h      |  40 ++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 444 +++++++++++++++++++--
>  include/drm/drm_ras.h                      |  76 ++++
>  include/drm/drm_ras_genl_family.h          |  17 +
>  include/drm/drm_ras_nl.h                   |  24 ++
>  include/uapi/drm/drm_ras.h                 |  49 +++
>  include/uapi/drm/xe_drm.h                  |  82 ++++
>  21 files changed, 1682 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/gpu/drm-ras.rst
>  create mode 100644 Documentation/netlink/specs/drm_ras.yaml
>  create mode 100644 drivers/gpu/drm/drm_ras.c
>  create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
>  create mode 100644 drivers/gpu/drm/drm_ras_nl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h
>  create mode 100644 include/drm/drm_ras.h
>  create mode 100644 include/drm/drm_ras_genl_family.h
>  create mode 100644 include/drm/drm_ras_nl.h
>  create mode 100644 include/uapi/drm/drm_ras.h
>
> --
> 2.47.1
>
