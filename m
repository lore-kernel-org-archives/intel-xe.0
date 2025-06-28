Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0657C7EE2A
	for <intel-xe@archiver.kernel.org>; Sat, 28 Jun 2025 02:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7B010E0C8;
	Sat, 28 Jun 2025 02:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="bB5Dkimb";
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9779810E0C8
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Jun 2025 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=0HJb919E0V/OlbAjA38o3SKM8D14Aaorr7GdwKuRljg=; b=bB5DkimbiF9cn7ZwkdqSyC4Klm
 0EgyWqLy18SJGQGahb3OA5lCRH+CaLXrHGedULfbHJbQgGSGKAdFeyGj6kQhpCJd1/2k31EkgyqRe
 8qhORd86DGoB7XrgwlcxKWKP0hlWJ0YQ7lkSFX+dr4pB4i8zw8UUcEIDaogHukTfR9ztL3DupL2mh
 Rv9XHL6uN2Prc7dESMw+c1C/bB9KtpTwL0Wmm4pGvGoA2WWiBr0byeIjZNZpO5JxOskLHyxtHTZy1
 rfp77G135+15PqdBgK71m8NvLe6GFYBAvq4+GvNn/wp3+9alpSF04Z8fFvLoVVDH9h4JYARd2ZKB2
 yHjOe9Fg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uVLjm-0000000FZ0K-2VDD; Sat, 28 Jun 2025 02:56:18 +0000
Message-ID: <c495e59e-f1a8-41b5-a6de-cd26bd4eccb7@infradead.org>
Date: Fri, 27 Jun 2025 19:56:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Allow dropping kunit dependency as built-in
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Harry Austen <hpausten@protonmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
 <20250627-xe-kunit-v2-2-756fe5cd56cf@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627-xe-kunit-v2-2-756fe5cd56cf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 6/27/25 1:30 PM, Lucas De Marchi wrote:
> From: Harry Austen <hpausten@protonmail.com>
> 
> Fix Kconfig symbol dependency on KUNIT, which isn't actually required
> for XE to be built-in. However, if KUNIT is enabled, it must be built-in
> too.
> 
> Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=m")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/xe/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 553c29e1030b1..827bc75b8b48f 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe2 Graphics"
> -	depends on DRM && PCI && (m || (y && KUNIT=y))
> +	depends on DRM && PCI
> +	depends on KUNIT || !KUNIT
>  	depends on INTEL_VSEC || !INTEL_VSEC
>  	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
>  	select INTERVAL_TREE
> 

-- 
~Randy
