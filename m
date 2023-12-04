Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B823CC4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 10:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7414610E339;
	Mon,  4 Dec 2023 10:58:24 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBAD10E339
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 10:58:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9fdf53abcso9482911fa.1
 for <intel-xe@lists.freedesktop.org>; Mon, 04 Dec 2023 02:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701687499; x=1702292299; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SWr1e2s/htlkB+fHRbk1LWJycFUPO5ljbLAvmkVqL84=;
 b=eWq72Mj0eE1Cv6uK9U6olQlTB7o246B6azqcRlSsSYyqStkddnuU+LIEdbKplpjZ53
 ouK3Sn27tEjgnCyEN1PF4zbeKJ+BEJTNqYlqx9j3sdhxnghgo4dhnr3JPYMLsge1gQUW
 GzofvAkdNUjEfyz2cDs+w0P6cqQp9uUF/ZBok2JKaw6ywqkvDvUDgTttnoppscXfPmdG
 Oo+8hnH+jaukVfwpDAPI+InJK24UWNn2WxY2rWTf0ZBs3UH5muRJMCQF1Kl0RKp1awqu
 gZWgfz15bD6jV77qXa5pHUiqD3Oo02NNBuai4R9AKQ92N8cZdF0xYGXRzVEllAv1iqn0
 JP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701687499; x=1702292299;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SWr1e2s/htlkB+fHRbk1LWJycFUPO5ljbLAvmkVqL84=;
 b=Z+sqeepeZDT/W6B40Pgm2sRlYUFMyovqCyfcz1s6aNo1OPaCNjOYuL0gBpMR/qj42k
 3g8vm+RBEHh7q5pirVupoDLFn1ODMrWKuq9O/7s7xF59SPWJJA/DakbVliPK/DqEW0FS
 3IztA341/GcZZZa1S8R+k2RCTAMXbRraWkZi6HNbC3Hahzv22aW7C6/oovcoiudhzzFR
 4RSahIL6HMZ6onaBM00sZJ9LEVknw38yHjfibOF+VmuoCINgwL1o3rY+Z/98HlTatAAH
 XNWtY79wGBNM82FWdz7nbSFSnl8EXA1x/e65XsaSmtrMXRlXjJarxWhRa/q4VCzSyNt1
 Tg0w==
X-Gm-Message-State: AOJu0Yy1bzBkzAP8qR4VuyaltzlTqwKRdWmlaoSethWcAFB07PCpE1eG
 r5qbkxg6XHo4Hp8QvM3LNEvndp3ZRgvopOZHePaGIKz3Zpw=
X-Google-Smtp-Source: AGHT+IEcWxFAT9LxFXjJiOneayuDwh/Dvn+Px/rVL+fHOa+69Kim49AD8b5hI8r14oFM17Z9cXS5QT45Qhkc8iXCKCE=
X-Received: by 2002:a2e:b542:0:b0:2c9:f5ac:17da with SMTP id
 a2-20020a2eb542000000b002c9f5ac17damr1623468ljn.3.1701687498842; Mon, 04 Dec
 2023 02:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20231204052609.3283031-1-riana.tauro@intel.com>
In-Reply-To: <20231204052609.3283031-1-riana.tauro@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 4 Dec 2023 10:57:51 +0000
Message-ID: <CAM0jSHOk7sGu6tHOmnsYryRf7dNSJM5rk_gqV-+6wF4ZvzNxBQ@mail.gmail.com>
To: Riana Tauro <riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 0/2] Fix deadlock issue on d3cold
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On Mon, 4 Dec 2023 at 05:18, Riana Tauro <riana.tauro@intel.com> wrote:
>
> kernel BOs need to be restored to the same place in VRAM, and with
> d3cold that means that any VRAM allocation can
> potentially steal the spot from kernel BOs which then blows up when
> waking the device up.
>
> However if we end up moving xe_device_mem_access_get() much higher
> up in the hierarchy (start of the gem_create_ioctl) then
> this is no longer possible.
>
> This patch fixes the deadlock issue seen in
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
> Also enables d3cold to get CI results
>
> Riana Tauro (2):
>   RFC drm/xe: Move xe_device_mem_access_get to the top of
>     gem_create_ioctl
>   CI drm/xe: Enable d3cold

Tried this locally on DG2 and it triggers lockdep splats for me when
loading the module, so it looks like a lot more is needed before
turning on d3cold. However I also had to manually set the
d3cold.capable=true. Wondering if we have machines in CI that are
d3cold capable, since BAT results are reporting success?

>
>  drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_pm.h |  2 +-
>  2 files changed, 21 insertions(+), 7 deletions(-)
>
> --
> 2.40.0
>
