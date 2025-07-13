Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77587C83F1D
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 23:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C83810E183;
	Sun, 13 Jul 2025 23:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkiCKiIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A2110E183
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 23:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752448392; x=1783984392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bsc5yuO44Vn8ysvCDuPrj5Nyc3QNo2rMH8fmlH4Nm5I=;
 b=VkiCKiIziKwM1be2aRZVLeU2SSQPrkt7js5CSlhjUKgv3qcPcigpXvXT
 T8c6rn6wtcMW6doojOvg79vSfMAXJGEQqn5eiKgUWAvcdKSe2lH1sbIeV
 lGslJ+UAIj1wFWPaj0kDZqdfAFjn/UrBHHfjL42krMq29mx1x2Z/P2Mq+
 /nN7jRbaWWB+3f/p1j7aF6SpayAzWdD9wG2p1qYLQ5H0c04OH7lw9eMMI
 VBPIf/GlfXRs63uii1gDoWovfkCJtqidkp9zPNZa2h9xHe0CJ2GfMVJjr
 tywgObNubjk+NPkffV0/4VZSJM32AYHdThx8b+qmZ/dSFcdIuVtOZDLSC A==;
X-CSE-ConnectionGUID: TQ+yvHSHS1Ox06H1I7UE1A==
X-CSE-MsgGUID: ZClgeqYZQvC50O7+P4g8xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54578453"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="54578453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 16:13:12 -0700
X-CSE-ConnectionGUID: UzoSjz7CRMS+bXMuX6iV8w==
X-CSE-MsgGUID: wmTgx9pNRzuiMjOEUt8iMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="194006006"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.223.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 16:13:11 -0700
Date: Sun, 13 Jul 2025 16:13:09 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
 simona@ffwll.ch
Subject: Re: [PATCH v8 03/13] drm/xe: Correct BMG VSEC header sizing
Message-ID: <tyep67rdjk3yxnkxebzkcrhpsje3u5zl2vafaswqlv4vlsfujc@uy7k6drfu2kg>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
 <20250713172943.7335-4-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250713172943.7335-4-michael.j.ruhl@intel.com>
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

On Sun, Jul 13, 2025 at 01:29:33PM -0400, Michael J. Ruhl wrote:
> The intel_vsec_header information for the crashlog feature is
> incorrect.
> 
> Update the VSEC header with correct sizing and count.
> 
> Since the crashlog entries are "merged" (num_entries = 2), the
> separate capabilities entries must be merged as well.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index d279e0ace7d7..8f23a27871b6 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -33,30 +33,19 @@ static struct intel_vsec_header bmg_telemetry = {
>  	.offset = BMG_DISCOVERY_OFFSET,
>  };
>  
> -static struct intel_vsec_header bmg_punit_crashlog = {
> +static struct intel_vsec_header bmg_crashlog = {
>  	.rev = 1,
>  	.length = 0x10,
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
> -	.rev = 1,
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
>  	NULL
>  };
>  
> -- 
> 2.50.0
> 

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
