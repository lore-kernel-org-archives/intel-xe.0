Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B471CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 16:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4910E4A5;
	Mon, 22 Sep 2025 16:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBhV3dff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E06210E4A5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758560309; x=1790096309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XzxzR9X5Czi1/5Rf9V2mge4X7UJGHUPEH6PRsp4tMbM=;
 b=VBhV3dff4RhTMLJnfCHFIQTq6sPAprXfYlUyu/xYD6qDuFRakZ7IsbPJ
 fCf0L/6GgUx6wmm9ehtE2lQEvyRuO35DfT1SU2HzvVF12OsamPDarerE7
 jhHd4dSEZ1ghduxqLeYnqwJ/6BtdxA2Ksn+hE3Tn3YcFwnKuqUVc0oe72
 jm4I7N6lUuiKsf+VczgSDHxS63CLMEA73b0J6h+hoL7rlUjJR9BBQ5jII
 vNGkTV7XlAf1/TUKnhjRMP6ySodhjzd0flFJnzD0ObGuSMbPyBpJQC1UV
 2P8KPki6zbgso64dZDWpIYqSJth6EPKYuclBdYXJfy1SzIM/nOpNB+BPp Q==;
X-CSE-ConnectionGUID: ceM/U/GgT3q/EQT2ACmu5Q==
X-CSE-MsgGUID: OCaTK9rORLyIKCGrzMjEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78270200"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="78270200"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:58:28 -0700
X-CSE-ConnectionGUID: QDzLTZHtQ5qErtcprm3ePQ==
X-CSE-MsgGUID: Q9aUX3BXRjOJB2SxdraFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176349992"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:58:26 -0700
Date: Mon, 22 Sep 2025 18:58:23 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Message-ID: <aNGAL1PgMYt6T13H@black.igk.intel.com>
References: <20250922155544.67712-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922155544.67712-1-jonathan.cavitt@intel.com>
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

On Mon, Sep 22, 2025 at 03:55:44PM +0000, Jonathan Cavitt wrote:
> lookup_engine_info is described as such:
> 
> "Lookup engine_info. If @mask is not NULL, reduce the mask according to
> the instance in @pattern"
> 
> According to the description, we should be exiting the execution early
> if mask is NULL.  However, we appear to only do this if mask AND pattern
> are NULL, as opposed to when mask OR pattern are NULL.  Fix this.
> 
> Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 8a9b950e7a6d..0c048d4a33ab 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
>  			continue;
>  
>  		pattern += strlen(engine_info[i].cls);
> -		if (!mask && !*pattern)
> +		if (!mask || !*pattern)

Perhaps the expectation with lookup_engine_info("rcs", &mask) is what
needs to be documented?

Raag

>  			return &engine_info[i];
>  
>  		if (!strcmp(pattern, "*")) {
> -- 
> 2.43.0
> 
