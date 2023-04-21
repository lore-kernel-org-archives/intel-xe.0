Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1903C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 16:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F3710E265;
	Fri, 21 Apr 2023 16:43:39 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C210E265
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 16:43:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4ecb137af7eso1914303e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 09:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095413; x=1684687413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lZBjlRnQQrBvdzKoxOmOuIdMwRd1F/IjbpJJUPlxu6I=;
 b=VFxeFCNCKIXcUTRtMctHUmo9dxaK9jSUmePDXxKq5BxDwwfx8sFP7w1duSoCVfnSli
 azijfV6hwfUQEwV4nKSSVp2ks0jC9dWB4DWH1CUFlNTvo+5g6kNn/uXuWcPyKtGsdFBA
 Vcv9HlZDzymnJpXSxFii78HQFhs06Xcb4Gp4cb6t3MvQcN/niyUv7ALWmtWIeUtk1P3X
 c2e8cxlRD/0sXWsnpICRNK8V3QrWpBfoWEFlajyfNnwigpsstXBYcYixdd/d/A8GeCG3
 yItSkJcocYKVvQDFxlWZTUKMiM89lH6wU718kVU4WmOdypUe7w/qE43GM80K70z4nvoG
 Dk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095413; x=1684687413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZBjlRnQQrBvdzKoxOmOuIdMwRd1F/IjbpJJUPlxu6I=;
 b=ah2wln4sbcY4Zo2WshIqo8feVisRGnmCn7Tduim3VN2gmD/Du1pOG4WfQ5FPNNBrw5
 THEIgo3QoPeTbFaj/E+lLsTaNW6SNx8OkzvGFf7PFAVyPSqHPBiejnr7iCjb8l8viWaw
 4wR29P7D+ta3HvQY6CaEBaWEma5AFtq9c3OL7K5MqJMeg/zdRQ2EeCtBoPOeLKj/RYQH
 2DZ8Fyps1fbH0nNiLW6A7RkyB9XwTBi+8o4MRUqJtlGnuNf2ZgcQlLTklrv0GVQoPAgC
 99AghNhgJuYfQXiyuOQXaiNHDZ5XLA6186E7FLjk6IcPEqou4Li42rIFl7sZTeW05xxG
 LAuQ==
X-Gm-Message-State: AAQBX9cmwc9nZb3KtWiMs5r4Mz47sdRVdBtL1eg/1w/QNLC7QyTWaD3L
 en3Eslpf/y8yMNPtA6mJJN6xAfeG7dA7T6qfnzA=
X-Google-Smtp-Source: AKy350ZgERPPhogT6qvnpQRUMiMCL+aPfQ4kiJ3KBeS8Lf/RZk9Ute7yTaAP7LrZczJNnkdN5Xth/e767s9wqYZiJZw=
X-Received: by 2002:ac2:5142:0:b0:4ee:db35:36cf with SMTP id
 q2-20020ac25142000000b004eedb3536cfmr1568670lfd.10.1682095412574; Fri, 21 Apr
 2023 09:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
 <20230421153852.329899-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230421153852.329899-2-balasubramani.vivekanandan@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 21 Apr 2023 17:43:05 +0100
Message-ID: <CAM0jSHNhE_gv_ZwacK2qRtsgO1oY2oM1J+fU5bmgSK22Nr2=cQ@mail.gmail.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Change log level of error prints
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

On Fri, 21 Apr 2023 at 16:39, Balasubramani Vivekanandan
<balasubramani.vivekanandan@intel.com> wrote:
>
> Error prints are logged using drm_err log level.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 8bd39c3e65ae..7a0fcb37aab0 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -59,8 +59,8 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>
>         ret = pci_resize_resource(pdev, resno, bar_size);
>         if (ret) {
> -               drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe)\n",
> -                        resno, 1 << bar_size, ERR_PTR(ret));
> +               drm_err(&xe->drm, "Failed to resize BAR%d to %dM (%pe)\n",
> +                       resno, 1 << bar_size, ERR_PTR(ret));

Not sure if we should treat it as an error, also there might be
nothing the user can really do. The driver should still be functional.

>                 return -1;
>         }
>
> @@ -119,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
>         }
>
>         if (!root_res) {
> -               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> +               drm_err(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");

Same here.

>                 return -1;
>         }
>
> --
> 2.34.1
>
