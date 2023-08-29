Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448C4C6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 08:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04D10E15B;
	Tue, 29 Aug 2023 08:20:59 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A294F10E15B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 08:20:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso61707291fa.3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693297256; x=1693902056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LAlB96Ucl67EhpVNmlR5Ljj5iPLEK7kiB59WJgvgpPg=;
 b=kP/uhdhmkuQiawER9lZVYdfHP1ZjFd9Jiov3ZTVlFXK40sE0IIpJnEsU3TsC1/eU7i
 DS1oiTZLpsXCuFZ7mNNLqRqrfW4pJhSkk84yVcpVUTdMy+oTeGbLkbgQZ7YLNzO7TtS0
 noG+7X8vLU6U8+8QcHuYU39Mki7DPv0r8bF4LysJ7jbOu6aUW3lYKZKnlAolP8K4yfKc
 5gQcUQO7X9Tp6U3dERWBd+msthpnMGlw7A4uVdkieHIrmgeXyc8HD0mjvDISDdZ5ugep
 r+aASJqWATezJDCb+MyLwAM9r3tB2qZPH/vX/ryXBxcAZvJpsJUuBgoJLEltjTJfZbKO
 9UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693297256; x=1693902056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LAlB96Ucl67EhpVNmlR5Ljj5iPLEK7kiB59WJgvgpPg=;
 b=db/zaT3BYCigpmosZy+jex3YeadpIrRY8rDOJ9VdZkJ5PIWmKY4i2d2d9uIUr+4psI
 NObxd+QdYEU55sIssHW6R4N5BfCxve9X60uuP1XDIIdi3jijwSMmh3kv1nIobbfO6k9F
 jUpHZlqCrb/ovxjYJsJTdIsksBscywdCxp2MF2+K9t4Y/h/DflJQcc/Hai858sKedOHB
 G/EitQ/7mEBI13PTtyPx0dR17zTRZxxBI6mtOYswCM5dCJYP3hC3G/SJpPKa2JTatOan
 XqrU9g+EOwuFboCpS5xiiGp+G5SYXKoz4hnlfNF7ryjcM15I7naJlKa1flD1w58BA3gL
 DCvw==
X-Gm-Message-State: AOJu0Yzn/mgI8DcnoRo4sFTYzkm8MDhiwK4xDxo85apDBCZX1xH/Q63w
 IciB72Tp85TSXRebw63okSITgubXJs5wVfHBgI7Z6it7hTI=
X-Google-Smtp-Source: AGHT+IHpBMiZ8nFM7Iqfa36eujj2cKm5JnYaX50G+Y3MPTuzmPDJdwuGMYaYDVrJIEjg18E+pHbqdQGbv7IW4VwekIE=
X-Received: by 2002:a2e:a314:0:b0:2bc:d38e:b500 with SMTP id
 l20-20020a2ea314000000b002bcd38eb500mr16275002lje.42.1693297255585; Tue, 29
 Aug 2023 01:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230829080429.4024-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230829080429.4024-1-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 29 Aug 2023 09:20:27 +0100
Message-ID: <CAM0jSHM+jCNm2Xbm05RybWdUAjRduQVJXZMkVgTc8C3zG6hX2Q@mail.gmail.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023 at 09:04, Niranjana Vishwanathapura
<niranjana.vishwanathapura@intel.com> wrote:
>
> Update Makefile to generate OOB header file for xe_migrate.c
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
