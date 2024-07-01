Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1C4C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 15:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E5C10E24E;
	Mon,  1 Jul 2024 15:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRbbqueK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4B810E24E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719849535; x=1751385535;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ad+oC6nN+l6EP5CTvDAQZ/Y2d6CfesuyGuxxgm0Og9k=;
 b=SRbbqueK1tRX9tIqWDaAYV375kiFJ5iuoMTLzSZHadH4hKu+QCxDWgFH
 Fg7IYu+WcIf2mzosteFVoj6PTZJRXJ8UApf/xotMRiYKCNJPU3QFLD+WD
 OLDg0cZNUoFTHf2P1pW00RdEFkTK4JHJOsuRXP8lYkd23FKEAx5xYqECi
 Ll/F9had/9pIEFV6WvGnp1ZvJ1TsGhGWgbpSiU2bPhtzfY7XoE3KDLuFP
 Y9DZR7jkgUZ9izGudDQkSa9RQJwmUDiUQ2BLoW4qyKmYYulGwEm3gF5hp
 xH8yZKzMxgTMQQWLQQZZ0W2O+1NYSLLVoyF8xla5KTfT2CwgopSTllcKw A==;
X-CSE-ConnectionGUID: P6C6xgPFR/iuRxHgD24rBg==
X-CSE-MsgGUID: /KfWDd70QLeZesRVgvxdqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27580804"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="27580804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:58:46 -0700
X-CSE-ConnectionGUID: 7MLB8lIXRZSW+DPMI3ADWw==
X-CSE-MsgGUID: OGVFDg9CRAW33sD0k1panA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76749448"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.124.115.151])
 ([10.124.115.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:58:47 -0700
Message-ID: <546612aa-7257-43a4-9317-c77ff0b15f72@linux.intel.com>
Date: Mon, 1 Jul 2024 17:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/rtp: Fix out-of-bounds array access
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20240628161726.836734-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240628161726.836734-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 6/28/2024 6:17 PM, Lucas De Marchi wrote:
> Increment the counter before checking for number of rules, otherwise
> when there's no XE_RTP_MATCH_OR an out-of-bounds access is done, as
> reported by kasan:
>
> 	BUG: KASAN: global-out-of-bounds in rule_matches+0xb6d/0x11c0 [xe]
> 	Read of size 1 at addr ffffffffa0a50b70 by task systemd-udevd/243
>
> Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_rtp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 5b27f7c45ea3..02e28274282f 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -121,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
>   			 * Advance rules until we find XE_RTP_MATCH_OR to check
>   			 * if there's another set of conditions to check
>   			 */
> -			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
> +			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
>   				;
>   
>   			if (i >= n_rules)
