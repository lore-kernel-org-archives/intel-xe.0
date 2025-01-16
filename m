Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A26CC02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 01:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D580410E549;
	Thu, 16 Jan 2025 01:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SJvt+P+S";
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455EA10E549
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 01:37:17 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3003e203acaso4150781fa.1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 17:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736991435; x=1737596235; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X6JVNMptwqfmUo8tWpx6+M2S/BUGYVkQzk4LkYjLkxM=;
 b=SJvt+P+SRXK+IC19Mc6E13TJm/1c8gLeLI+jMd9vt8NGHIiqBaTBEANSQnVrE6Ddnw
 u6E2rlGa5uqznhPxUiSQDbY0e0FK7f0FRs322lGno8daWa7vo/NCpFyVjCc10OocOASi
 p6nmk6GyPdMc7i7fH//bkVNGfM3XS/mv3rA56cp2egYeQ8y6W5x8tV4FLy5aQYJNTRRY
 7Lkgowe2c9L3UMp6/WJm3MfTK867RuOZ7ngy6fnXaMmJQaU0ZdPyhO2djled8fGmb6MK
 /bltIaJ/TNUJ+7DYrIAKx6c9fGZu+kPQ+eXLf/yuBURwpmlRhsntD0xy1KzU/2OcbY3E
 NslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736991435; x=1737596235;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6JVNMptwqfmUo8tWpx6+M2S/BUGYVkQzk4LkYjLkxM=;
 b=r5RQ6SFdR8iQR7nl7FNnvVZBaLMihWvou7oUbpzB0QfepMvuDHpNrNZPeHt/tW5UXq
 Oake2HZKe5W+BCBJmoJR4daORvNGFsnNC7RmyHVKnAl1M3mKNWw/0p153gmW2q/5Ohnm
 fDnyvjDx6ne6xtuACmmmf9q8hZ358nenZE7d9wZZtGVH0BMYFin2PO4OO7GlDavTNkcY
 5Vkb/vpjbWvIcJOPCYeV5xfygQ9HTOGHg7Sx68oYyAVtDtMZUQfkrfKvfK/bNk5ZGgCz
 Os2sI3LqRssWeuTqueF4MlXCn6hyrIhWomxmlr/3ioCDNg4N9SwYRvhkTz+Rn4Etr5cf
 4JpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRj/f9NEHP1xK/G1UhwDl+sG+aNSFM2CeXLaX0zCsqbmkyeoz96Cx7Wsj0DuU+uJ+dSSlKDDeNgw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhXsE+DwHnvepdVYPz/da78SpD2XB8rqWxxnkYc0kZDOW3cFHI
 e3EFBjQplOKhf8GY1gJ6fCJD7oTOxbojWhx4btawMoc+DqoBkkzgbCyhbxvoxu4=
X-Gm-Gg: ASbGncvnsme30XFmPYxHZ31Sda4pEHJM/aHX2s04GD2VPjHF/ld6t+04Qr6Vo3H0MZ/
 wr1qDpUbclPj2bAiOggsvNvCLtM4M13DzQZBLWBLLC9dbUx0mbSgCQ6+9vkCobYryYc0UbhxYCv
 AVwBFvXLwPdTd2OQL7TYzwTYAaU7fTdIMARn57/6ySOGXYV97wYRMcQbyzKBAPBz1CPtRZbBe6F
 i6Bf0K1Rh2EFJKVRiXaQtQsErxbZuQ11yRHrEPDeuXyQ3p1Xez6oe1MaFnUyhyuVCeEaY4YksAs
 Gye2RwqcHt/LYQntqvwgqRZp+qWYzJpcsKnK
X-Google-Smtp-Source: AGHT+IGjfYuq+KNLYqRLVLFN8rZrdy6vBacFgOKSllEvZrfO/DkBY4VTnS4zf9+dbRULyoWcj+VAog==
X-Received: by 2002:a05:651c:556:b0:304:4e03:f9c7 with SMTP id
 38308e7fff4ca-305f463bbcdmr91695291fa.31.1736991435543; 
 Wed, 15 Jan 2025 17:37:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0e712dsm23490811fa.51.2025.01.15.17.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:37:14 -0800 (PST)
Date: Thu, 16 Jan 2025 03:37:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com, uma.shankar@intel.com,
 Importedfromf20241218-dpst-v7-0-81bfe7d08c2d@intel.com,
 20240705091333.328322-1-mohammed.thasleem@intel.com
Subject: Re: [PATCH v7 07/14] drm/xe: Add histogram support to Xe builds
Message-ID: <45k46w3ir4ytz3eqm5sapbqdzgfbkd7zyy5gl26a4ietlc32u2@c7brxhuuitru>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-7-605cb0271162@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-dpst-v7-7-605cb0271162@intel.com>
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

On Fri, Jan 10, 2025 at 01:15:35AM +0530, Arun R Murthy wrote:
> Histogram added as part of i915/display driver. Adding the same for xe
> as well.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Is building of the Xe driver broken between the previous commit and this
one? In such a case, it needs to be squashed into the previous commit.

> ---
>  drivers/gpu/drm/xe/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed7385616ecce3340ec74580f53a213e3..984def6077efb9b3fcedb2065414173691427e4a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -247,6 +247,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_hdcp.o \
>  	i915-display/intel_hdcp_gsc_message.o \
>  	i915-display/intel_hdmi.o \
> +	i915-display/intel_histogram.o \
>  	i915-display/intel_hotplug.o \
>  	i915-display/intel_hotplug_irq.o \
>  	i915-display/intel_hti.o \
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
