Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DB3C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 05:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5730F10E00D;
	Tue, 26 Mar 2024 05:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNyZwxPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F02B10E00D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 05:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711432387; x=1742968387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+5p7u3k0J93nv+C4LDTmStvgrRtfBAurC0BJP7RXyyA=;
 b=UNyZwxPPXnP0zeOhKlqmvVri6SfVplqRSGdPgq5Fo7pQa1bMGmDxiLpP
 DgV/kecUHEQxtkXWIq2aDYbwYr0AngXxd5gKnSqwDm66kxt9LOejN2V+k
 a1iOo24A6HasJOu+JoOm+AwmFgR8fl2ZtYhkdVIn7OWPNSr1unqw8M6YK
 uQin/nMLLexxzF7wg52V6bkPrZj2Ky6eU+kdYpt5at0jZ812wAOBJO0ZF
 CtXdVqU2UxYuyeJrwJUkjHpeGZ0dF8VJTqT/D+e88VwncnQFdya8oBy+Z
 jBi73+XfRllbUJE38c+qzXE1sjVm5gecsdLUXGOsa4TEMj5+fCwxBqWrq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6329184"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6329184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="53314581"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:53:06 -0700
Date: Tue, 26 Mar 2024 06:53:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/xe/xe2: Send flat_ccs value in struct
 drm_xe_query_config
Message-ID: <20240326055301.nggiizcrwysxqv3y@zkempczy-mobl2>
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
 <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
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

On Tue, Mar 26, 2024 at 03:10:31AM -0700, Akshata Jahagirdar wrote:
> Currently, we don't have any check in IGT testcases if platform supports
> compression or not. Send this flat_ccs value as part of the struct
> drm_xe_query_config so that we can read this value in the igt testcases
> and proceed accordingly.
> Fixes: VLK-56136

Drop this id.

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 3 +++
>  include/uapi/drm/xe_drm.h     | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e80321b34918..8a3a3117491c 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -332,6 +332,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	config->num_params = num_params;
>  	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>  		xe->info.devid | (xe->info.revid << 16);
> +	if (xe->info.has_flat_ccs)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS;
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f44a19ae9333..08783234bae1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -405,6 +405,7 @@ struct drm_xe_query_config {
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> -- 
> 2.34.1
> 

Code looks correct imo, but you should get an ack for that
uapi change, so from me (with commit msg fixed):

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
