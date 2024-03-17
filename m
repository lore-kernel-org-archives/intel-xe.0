Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30028C54E60
	for <intel-xe@archiver.kernel.org>; Sun, 17 Mar 2024 16:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB21110ED7A;
	Sun, 17 Mar 2024 16:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFEb9aDU";
	dkim-atps=neutral
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2870C10ED7A
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Mar 2024 16:14:18 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5a4b35ff84eso175628eaf.2
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Mar 2024 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710692057; x=1711296857; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=1CrtQg3eDqyxxQhKnuesKlP9su1zViMHhRMDXJ4pnqU=;
 b=HFEb9aDU4ecT+i0koBiQuo3XdSMtnIJ4KZMD1b6CaG01aQ+q0Mm5DcbdSouauc2uqI
 SSvfK//WuBttRsoNS44EBSOdv7sQysAHut6/N/Zd0IBtkpxTnpH4LuwORHyCoLxDRzrj
 dPaV8MI3vCLFjgkA4ERMfTG8rbTHGfQM1JBz2ca2tYP8qe6M638fAFhAAowxoXeDH69u
 wWMBP1grfYtVo9nlcpUa/sdMvrW36Xgnw4HW2PSzm10cbwdqYMU5LO/pL/VRV3vuVWjn
 sPbY3Vgf4k6d6JlBBe8+b30heiZXd9d46mjMXypSYv/9GKRvhmcWJf3A7oRrVx/KLqin
 wPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710692057; x=1711296857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1CrtQg3eDqyxxQhKnuesKlP9su1zViMHhRMDXJ4pnqU=;
 b=e+LtGzXpMU+ZwFyWKVY+mtesiw5mQcN5sxVaeFrvkheXn4+RCZ7PPpPUJhY9ukZs7o
 fIU59hd03UquZQLz/o0EbuDN94ITeHzfSo1CHJEjqRqEuaFI3IHpejj7YHexDe3NVT5n
 i5EPv9uSQvIEz3povdtPRQSJlqI8Pn5nOwDpEdi+Tp1Voz2uxbS1IvEN9tUc0T1HaOhM
 2frJ0jI2aAW0P+joDgAqU5aFwd8mXqTqLl8dxHOKq6Y0XDeOuQY4h2PvT8gqi0sQ1UCQ
 fCn8ZGGfTVEgvt0rSskgVPlnTVNYRKhG/JqWlEEdiemMi59wqcP40R4ruxFrMbu9uZ56
 RjpQ==
X-Gm-Message-State: AOJu0YwP20DXt2LPWj6thi2wkMfVYPtlFvukk22VUCsjhUOTZMGL4WUH
 HrFjQDFsCC1r+gNnr3Cv/ECQbJOObNSkwgu226uEYcbNprkspLBK
X-Google-Smtp-Source: AGHT+IGMr1XNnU+JU8QHz/l1FqI/mlUeysjuUve/mk72gECMbhn4gq9yqlQkPdQZ//5Dq8TBHBbZtg==
X-Received: by 2002:a05:6358:4041:b0:17b:8706:fd39 with SMTP id
 a1-20020a056358404100b0017b8706fd39mr14522975rwa.10.1710692056906; 
 Sun, 17 Mar 2024 09:14:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a65624b000000b0059b2316be86sm4877030pgv.46.2024.03.17.09.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 09:14:16 -0700 (PDT)
Date: Sun, 17 Mar 2024 09:14:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [v3,5/5] drm/xe: Enable 32bits build
Message-ID: <d53d2da5-22de-4f81-9fbc-2f54e5da9ac6@roeck-us.net>
References: <20240119001612.2991381-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119001612.2991381-6-lucas.demarchi@intel.com>
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

Hi,

On Thu, Jan 18, 2024 at 04:16:12PM -0800, Lucas De Marchi wrote:
> Now that all the issues with 32bits are fixed, enable it again.
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 1b57ae38210d..1b0ef91a5d2c 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))

I am curious about changes like this. Enabling 32-bit builds results in
build failures for mips_allmodconfig because the driver redefines END.
END is also used as macro in assembler code, the define happens to be
included for mips builds, and it would be difficult to change it there.

Unlike the i915 code, DRM_XE is not marked as depending on x86. This means
it will be built for pretty much all "allmodconfig" builds for all
architectures. Yet, there have been recent complaints about "allmodconfig"
builds of drm code causing build failures on "oddball" architectures.
Is there an assumption that DRM_XE (or DRM in general) is manually
excluded from all architectures where it fails to build ? If so, would
it be possible to mark DRM_XE (and/or DRM in general) as depending on
architectures where it is supported ? Maintaining a set of exclusions
in test builds does not really scale, after all.

Thanks,
Guenter
