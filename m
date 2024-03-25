Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70909C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 14:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FECD10E940;
	Mon, 25 Mar 2024 14:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBDP0+A6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11A110E943
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711377925; x=1742913925;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9OOsbiNcycVk7pNiJzzD1ed92gkbTxZ5bWGrPNwT+ts=;
 b=QBDP0+A6E6Sxps4aAf7j1ulzL44jpXaS/8JKmaPFmiLek0S5UlVFGZiW
 bfZOgd3SjVGX9D/9RTGvTpAA+S4x3sFmZGq5jnY4LNd+Ql34LN1SSY15B
 p5om1hTuzMRT1QLywQTBUN/+zBxEq6qgM78QWXFlgwy2pSmbnc62W3jjQ
 UMPWHp3izirblJeDt32cJk9uYbbpc+BQoMAkLh6uVDjfI/CoqXKIDewLt
 XEJQXVY9JLRx67PgedjvRFGcIQkz1w7KO20E4Ipd7CfvZ5pYNZq/LMwP/
 WJMrWWb8OwQMtLGxswPTI47sPnj6ilLeM2J2d+f3qCN1w04pKoeg4ZkUp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6319338"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6319338"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20188337"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 25 Mar 2024 07:45:22 -0700
Received: from [10.249.156.183] (unknown [10.249.156.183])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C658128782;
 Mon, 25 Mar 2024 14:45:17 +0000 (GMT)
Message-ID: <79ab191e-f081-43aa-b5a9-1befce243441@intel.com>
Date: Mon, 25 Mar 2024 15:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Add a null pointer check
To: Karthik Poosa <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com, 
 jani.nikula@intel.com
References: <20240325141223.3426250-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240325141223.3426250-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 25.03.2024 15:12, Karthik Poosa wrote:
> Add a missing null pointer check.
> 
> v2: Release resources before returning error. (Riana)
> 
> v3: Update commit message. (Badal)
> 
> v4: Change drm_err to XE_WARN_ON. (Anshuman)
> 
> v5: Fix XE_WARN_ON check. (Riana)
> 
> v6: Update commit message. (Jani)
> 
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cc650a92c2fc..f6837bd6f9a3 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	 * really lost power. Detecting primary Gt power is sufficient.
>  	 */
>  	gt = xe_device_get_gt(xe, 0);

maybe easier way to silence the tool is to use:

	gt = xe_root_mmio_gt(xe);

that don't have a path with NULL as return

> +	if (XE_WARN_ON(!gt)) {

but if you still want to add the WARN for the impossible case then as we
have xe it is better to use drm_WARN_ON()

> +		err = -ENXIO;
> +		goto out;
> +	}
> +
>  	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>  
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
