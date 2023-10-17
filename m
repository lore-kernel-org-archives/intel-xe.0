Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B40CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 07:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4BA10E28A;
	Tue, 17 Oct 2023 07:59:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5714C10E281
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697529589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9Tx6gsKNLBlsQavHNGdhteUF9QO0P3cguwO27i3pv8=;
 b=GPWFmvpxPw4tAmUe59e+4GBX8PoFe9R79ZTigunaA30CVj2apxTacLf+6V7w3nNfVeZk+y
 4HH838g1ACQStYqX1C/LC7A/qDIFnLgGYjGWgO6jnoOYr/dT8OP9QDDKSCmOKz8vmBzwjg
 e12icjCxoJOklEVuOz1RrfSiMMVTEzg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-x50E_OuCO9KZCg7UdFz2Zg-1; Tue, 17 Oct 2023 03:59:42 -0400
X-MC-Unique: x50E_OuCO9KZCg7UdFz2Zg-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5079a3362afso3876846e87.3
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 00:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697529278; x=1698134078;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9Tx6gsKNLBlsQavHNGdhteUF9QO0P3cguwO27i3pv8=;
 b=dKA9dULKNhr5SjVQfCljehePmMI3Zvd6uDM4UvU/e93eHBr4STbKd2uq2hhlAypJOO
 OzXH8etoHGTiRASpuDvzYhlMlMYZS7DpAZ4qq9GqoqAQgztfmyxqpK9nowPT+lKS6YmI
 E3kz2AqbJWtvkCYz5fjGHlksrF9xeT4uUiA6TrPYsruEPwCIK0Ad3kYANujeKGlLqDwF
 QQounDwQ6hHMlDQvBXX38ivht+AMklPR0a9jiCD9/NP6KcUS6ft7ApmNre5RpoF/RZ3Q
 yy6zZWkr9v4nHVOzinBTJT9uiXgfymR1JgBrM2B2OyoyiKIg/69hWFeLxhfvaLBAgDYT
 ZsxQ==
X-Gm-Message-State: AOJu0YzjyVDoL+2vS4aH0HobqB84VuoHHvEGnG5gemrCNMDoqj1dUIUD
 kNwBfsQKbvYjKcg+n2aofU+ErK25igAFjkAJft3f1yoOKFO9qyKjRhsiApnJd/FOxXgFK5piKTn
 c3JXVWHGtYf4pjpmTzHglKjsoIZQ=
X-Received: by 2002:ac2:528a:0:b0:500:75e5:a2f0 with SMTP id
 q10-20020ac2528a000000b0050075e5a2f0mr1170037lfm.51.1697529278762; 
 Tue, 17 Oct 2023 00:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnj+02Gz6CBN/FvIxOvYBZmLKxkQG31upVGnOZzsxW/NOKskPJB/h4jHjz/vk7FZYVE3xDeQ==
X-Received: by 2002:ac2:528a:0:b0:500:75e5:a2f0 with SMTP id
 q10-20020ac2528a000000b0050075e5a2f0mr1169938lfm.51.1697529275395; 
 Tue, 17 Oct 2023 00:54:35 -0700 (PDT)
Received: from polis (198.red-81-39-42.dynamicip.rima-tde.net. [81.39.42.198])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a5d58d6000000b0031980783d78sm1064892wrf.54.2023.10.17.00.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 00:54:34 -0700 (PDT)
Date: Tue, 17 Oct 2023 09:54:32 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZS49uJq9kqJ2ueOv@polis>
References: <20231010142725.8920-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20231010142725.8920-1-thomas.hellstrom@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/gpuvm: Dual-licence the drm_gpuvm code
 GPL-2.0 OR MIT
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
Cc: daniel@ffwll.ch, airlied@gmail.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 04:27:24PM +0200, Thomas Hellström wrote:
> Dual-licence in order to make it possible for other non-GPL os'es
> to re-implement the code. The use of EXPORT_SYMBOL_GPL() is intentionally
> left untouched to prevent use of drm_gpuvm as a proxy for non-GPL drivers
> to access GPL-only kernel symbols.
> 
> Much of the ideas and algorithms used in the drm_gpuvm code is already
> present in one way or another in MIT-licensed code.
> 
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: airlied@gmail.com
> Cc: daniel@ffwll.ch
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Acked-by: Danilo Krummrich <dakr@redhat.com>

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 2 +-
>  include/drm/drm_gpuvm.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 02ce6baacdad..08c088319652 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
>   * Copyright (c) 2022 Red Hat.
>   *
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 361fea5cb849..21bbf11415b3 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  
>  #ifndef __DRM_GPUVM_H__
>  #define __DRM_GPUVM_H__
> -- 
> 2.41.0
> 

