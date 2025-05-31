Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F9AC5B549
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 05:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097A110E26F;
	Sat, 31 May 2025 05:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQZb4Hv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DBF10E26F
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 05:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748668661; x=1780204661;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=HRjAgjX9OMrZ6XyjtzmRyfPAuthhgzjW3dRGd5Xv4JI=;
 b=BQZb4Hv/F1jAZiJU4FbvFzeidj1FgNkx5zMJ37kKJgttqrdhkac0teLc
 8kaZ7pYfHeqZqihWNDslnbKBJScqJxh9OXnYNjsxU+uAQE8NCx4nxdBma
 v1ikHx+gceoJkNc1hE1ySQdXBEJxUUrrhc5VZiF39RUsr2mJmGrKUrk5N
 gt41egafW69vWVTXnp+3kkFGQDJoVe6n0KANjCxwGlxQt7zAnwqZfTD4y
 P7xDoA/DioZCpmEvMjpV/merLgnF4ZDf5WOy/jsxrc7cBgZ4H0ujKYtM5
 DjIP0W1IP4AAJ3FNeq2Gy8roPFzlsZgDEcdUNa/jV3NlYgvjrrOSQM4pK g==;
X-CSE-ConnectionGUID: MuZqr0xfSmOZYwGENbLYlw==
X-CSE-MsgGUID: CDUq4wsiReK3g5uzcij0AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50631044"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50631044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:17:40 -0700
X-CSE-ConnectionGUID: IPgwE5d4T2K6khq5OCrv4w==
X-CSE-MsgGUID: KfnJe80cTB+EHrTZqu8Ssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="175058407"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:17:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:17:33 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 01/10] drm/xe: Correct BMG VSEC header sizing
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
Message-ID: <72b57d0f-c4e6-3515-bd46-062f159c4456@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 30 May 2025, Michael J. Ruhl wrote:

> The intel_vsec_header information for the crashlog feature
> is incorrect.
>
> Update the VSEC header with correct sizing and count.

Does this warrant a Fixes tag?
 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..67238fc57a4d 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
>  	.offset = BMG_DISCOVERY_OFFSET,
>  };
>  
> -static struct intel_vsec_header bmg_punit_crashlog = {
> -	.length = 0x10,
> +static struct intel_vsec_header bmg_crashlog = {
> +	.length = 0x18,
>  	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> +	.num_entries = 2,
> +	.entry_size = 6,
>  	.tbir = 0,
>  	.offset = BMG_DISCOVERY_OFFSET + 0x60,
>  };
>  
> -static struct intel_vsec_header bmg_oobmsm_crashlog = {
> -	.length = 0x10,
> -	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> -	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x78,
> -};
> -
>  static struct intel_vsec_header *bmg_capabilities[] = {
>  	&bmg_telemetry,
> -	&bmg_punit_crashlog,
> -	&bmg_oobmsm_crashlog,
> +	&bmg_crashlog,

Eh, this change goes way beyond what you said in the changelog, was that 
intentional? If yes, please describe and justify all the changes (and 
consider if some of them belong to a separate patch as it sounds like 
there are two or more changes mixed up into this patch).

>  	NULL
>  };
>  
> 

-- 
 i.

