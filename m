Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5312CD4F2B
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 08:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D85410E038;
	Fri, 22 Sep 2023 08:18:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D11010E038
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695370721; x=1726906721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LHACCC0plkfOAHsyn15m6BLVRwge3gvHmKeUvcACZ9w=;
 b=LAXCW7a8H1Giqniqix2CVJx4WTRk0VfJCz60d6j2cnoZnsYfRtxxdUQc
 j6KzzSiOdag0Ek88VzxGL7+qQuworkxecXRpulH1+Wo8MLfs78s5fD/SS
 7K3Ko0vQdZTmcmSVaus1vDYRWz3jl3UFT3SmAu8uCPD8qbcybDq7p0/ZK
 Fqa1pPNkP2eLGWIpgDbPzaUCfuUgBE3ua1bs1SUvD0BdVVXPNCx5+Y057
 rLKnDw0VCaC8C5Xzpfqqd/0TNt96jKCUgBt5YDovYda/zZoYUZtIRPwUM
 0NHIXK6uspconELFipnEi8iqIgu9/WxMxh9jm94OIFOWKfs6Xs29bgUrT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="379653487"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="379653487"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 01:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837644659"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="837644659"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by FMSMGA003.fm.intel.com with SMTP; 22 Sep 2023 01:18:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Sep 2023 11:18:37 +0300
Date: Fri, 22 Sep 2023 11:18:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQ1N3V244SX9l71G@intel.com>
References: <20230921210800.170275-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921210800.170275-1-rodrigo.vivi@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [CI 1/3] drm/xe: proper setting of irq enabled flag
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
Cc: Ohad Sharabi <osharabi@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 05:07:58PM -0400, Rodrigo Vivi wrote:
> From: Dani Liberman <dliberman@habana.ai>
> 
> IRQ enabled flag should be set only after request irq succeeds.
> 
> Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
> Signed-off-by: Dani Liberman <dliberman@habana.ai>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index ccb934f8fa34..f98aa1f06c8f 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -590,16 +590,14 @@ int xe_irq_install(struct xe_device *xe)
>  		return -EINVAL;
>  	}
>  
> -	xe->irq.enabled = true;
> -
>  	xe_irq_reset(xe);
>  
>  	err = request_irq(irq, irq_handler,
>  			  IRQF_SHARED, DRIVER_NAME, xe);
> -	if (err < 0) {
> -		xe->irq.enabled = false;
> +	if (err < 0)
>  		return err;
> -	}
> +
> +	xe->irq.enabled = true;

Why does this even exist?

>  
>  	xe_irq_postinstall(xe);
>  
> -- 
> 2.41.0

-- 
Ville Syrjälä
Intel
