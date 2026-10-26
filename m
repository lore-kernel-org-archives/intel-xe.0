Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6BC606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZXmKPgF8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD5E10E207;
	Mon, 26 Oct 2026 15:17:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89DD10E207
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793027872; x=1824563872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iiNvOLziOrwNm5P0eCT4L8zREczE/nM/qlIHsszQp5E=;
 b=ZXmKPgF8HplKYOlr+sQoqIet4yGSR6q5Q4x9wyaG9coOhex7NelTWu14
 KRvv20ETQ9DKT9MqPK08Pf2Kbxm18UTdqdiVRNQTSJ5nfQ1qBkWr4BRyY
 IrYZUbEpvA/Uf7RFN3N2T9J9GLwqRKGlgG6I11edpFBxPoovbee4laI1b
 QzuX4AyVz6SW34lv3xcmsP+qsdj2LA6IpCdp00Hglqdr3JWZ2rgsFP/W4
 W+5Bnzzha9tipiRbWHySn3coxCxg4F1VSbzniYuy9xmMC29vuQlKRzdms
 G3cDzmiYwG7dmHiPGOzW8S/YhWGz8gY0yN71S6fe4NYeon70TkoGg9DIT w==;
X-CSE-ConnectionGUID: C9SWIr65TBC3w+a+T2hOJQ==
X-CSE-MsgGUID: uTLAmxjdTaq74rhlnIYw5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1709417"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1709417"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 08:17:51 -0700
X-CSE-ConnectionGUID: jtwNNGMjTOyfyzdRW0NSnw==
X-CSE-MsgGUID: +SoYaoesTH67yHP1O/bDcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4654223"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 08:17:48 -0700
Date: Mon, 26 Oct 2026 16:17:45 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 10/13] drm/xe/xe_ras: Report correctable errors using
 SIGID
Message-ID: <at9vGYtvACOfJftR@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-25-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023043422.681260-25-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:04:32AM +0530, Badal Nilawar wrote:
> Use xe_log_* helper to report correctable errors.
> 
> Example:
> 	xe 0000:03:00.0: [drm] *ERROR* SIGID=203 CORRECTED
> (010200180000000100000000) [Hardware Error]: CORE_COMPUTE: error detected
> 
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
> v4:
>  - Pass structured log component to xe_log_from() (sashiko)
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4408fc530900..cd64baddd8de 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include <linux/bitfield.h>
> +
>  #include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_configfs.h"
> @@ -226,6 +228,12 @@ static u8 ras_sev_to_cper_sev(u8 ras_sev)
>  	}
>  }
>  
> +static u16 ras_comp_to_log_comp(u8 component)

I know xe_log_component_bits is u16 but I'd use u32 here to make this consistent
with __xe_log_emit(), which is ultimately how I think it's going to be consumed.

Raag

> +{
> +	return FIELD_PREP(XE_LOG_COMPONENT_CLASS_MASK, XE_LOG_COMPONENT_CLASS_HARDWARE) |
> +	       FIELD_PREP(XE_LOG_COMPONENT_TYPE_MASK, component);
> +}
> +
>  static inline const char *sev_to_str(u8 severity)
>  {
>  	if (severity >= XE_RAS_SEV_MAX)
> @@ -717,8 +725,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  		if (!ras_counter_is_valid(xe, &errors[id]))
>  			continue;
>  
> -		xe_warn(xe, "[RAS]: %s %s detected\n",
> -			comp_to_str(component), sev_to_str(severity));
> +		xe_log_from(xe, ras_sev_to_cper_sev(severity),
> +			    ras_comp_to_hw_sigid(component),
> +			    ras_comp_to_log_comp(component),
> +			    &errors[id], sizeof(errors[id]),
> +			    "error detected\n");
>  
>  		/* Send event once per component */
>  		if (sent & BIT(component))
> -- 
> 2.54.0
> 
