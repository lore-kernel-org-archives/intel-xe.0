Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29184FA3743
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 11:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB4510E24E;
	Fri, 13 Sep 2024 11:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6KAea34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EBA10E24E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726225313; x=1757761313;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=01AANwsGq4HRdfcge16N9HpNsLLsWgdueW6upvyeimQ=;
 b=b6KAea345oBFwQh/SiZV+jta/mSYvDlOaX+wej9ZdF4Pnbi7ngWkgao1
 v/co3EAnh/RqGGrGCSLjchJuQZfQo28YI+0pZ0MYtRk/MwAJ+k844Jivl
 QCA6FKsa7hupkgrwajuYB/KV8JPdg51rQXUhW7+zD1uj4+UHRJhyzWpuT
 AQY3uxCxk+MkF5ETlja/fSeU7IELLM2WHuvKm2uXvizzAvypUmr9ihgtU
 tLveWyRbjX6ArnntMh29uW/MMayL4GL9qLKODB46RUlmN7Gas77UfUcJD
 mh2pZC5wu028VccQkrQ3KoocEsevy/AFbWfSEznacO8E0iAHRFLzf9bpH w==;
X-CSE-ConnectionGUID: WGDLFI3ESQuHhbR3I4GlkQ==
X-CSE-MsgGUID: xEeMDtS0QNygNZrLMytV3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13511002"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="13511002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:01:52 -0700
X-CSE-ConnectionGUID: 1bbPv6tTQou6SCuUp80iwQ==
X-CSE-MsgGUID: 7Da4lFC3Se2Gz7evp3jcOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="68107125"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 Sep 2024 04:01:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Sep 2024 14:01:49 +0300
Date: Fri, 13 Sep 2024 14:01:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <ZuQbnRfh-wkuMR83@intel.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912190530.435976-1-rodrigo.vivi@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Sep 12, 2024 at 03:05:30PM -0400, Rodrigo Vivi wrote:
> The pci state was saved, but not restored. Restore
> right after the power state transition request like
> every other driver.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5ba4ec229494..6d29ef4b396f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	pci_restore_state(pdev);

Why is xe even doing this stuff by hand instead of letting
the pci core handle it?

> +
>  	err = pci_enable_device(pdev);
>  	if (err)
>  		return err;
> -- 
> 2.46.0

-- 
Ville Syrjälä
Intel
