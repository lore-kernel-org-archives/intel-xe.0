Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F5D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 07:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19310E0A9;
	Wed, 10 Dec 2025 07:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hG0HUk8y";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E6E10E0A9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 07:58:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 35AD843965;
 Wed, 10 Dec 2025 07:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45263C4CEF1;
 Wed, 10 Dec 2025 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765353482;
 bh=WhFbuxjd/z2EJV7G6gtRBsOi13goT7NRDFh2adVBipg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hG0HUk8y35Pzm82Um2QlNkuq0n06zgw3Cc4M/zE0OkpJ5Tw8zHclZIi7wCJjsEe1S
 lRm2k3i9H8JKTUAb5BykIf2SNvI03LuLRvw9CjxqPo2ICeZZKSDkIH2wBYcH6yY3SL
 TjAAlDM7Zu2l3MfeJEwj6NJf4wKoWH12BrV5hyLiU0jbJoTj/CXgTh39RYfDRjzufe
 tckLH/+2arPotjMvWqhOH9ABD+lY0c6q86sBUDzaUfazLwLu0UqXef42hAwnhrskMn
 GsWn6PWV3fL+nP3CAUVkdonxpRDS2PX/xDksbpOrz3LOCXIJEQcTZoCWsoL9wSQCuX
 ASdAVA0c0gscg==
Date: Wed, 10 Dec 2025 16:57:57 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joshua.santosh.ranjan@intel.com,
 shubham.kumar@intel.com, badal.nilawar@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH v3 1/2] drm/xe/xe_survivability: Redesign survivability
 mode
Message-ID: <20251210075757.GA1206705@ax162>
References: <20251208084539.3652902-4-riana.tauro@intel.com>
 <20251208084539.3652902-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208084539.3652902-5-riana.tauro@intel.com>
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

Hi Riana,

On Mon, Dec 08, 2025 at 02:15:41PM +0530, Riana Tauro wrote:
...
>  static void populate_survivability_info(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> +	u32 *info = survivability->info;
>  	struct xe_mmio *mmio;
>  	u32 id = 0, reg_value;
> -	char name[NAME_MAX];
>  	int index;
>  
>  	mmio = xe_root_tile_mmio(xe);
> -	set_survivability_info(mmio, info, id, "Capability Info");
> -	reg_value = info[id].value;
> +	set_survivability_info(mmio, info, CAPABILITY_INFO);
> +	reg_value = info[CAPABILITY_INFO];
>  
>  	if (reg_value & HISTORY_TRACKING) {
> -		id++;
> -		set_survivability_info(mmio, info, id, "Postcode Info");
> +		set_survivability_info(mmio, info, POSTCODE_TRACE);
>  
> -		if (reg_value & OVERFLOW_SUPPORT) {
> -			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
> -			set_survivability_info(mmio, info, id, "Overflow Info");
> -		}
> +		if (reg_value & OVERFLOW_SUPPORT)
> +			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>  	}
>  
>  	if (reg_value & AUXINFO_SUPPORT) {
>  		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>  
> -		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
> -		     id = aux_history_offset(reg_value)) {
> -			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> -			set_survivability_info(mmio, info, id, name);
> +		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
> +			set_survivability_info(mmio, info, id);
> +			id = aux_history_offset(info[id]);
>  		}
>  	}

After this change as commit f4e9fc967afd ("drm/xe/xe_survivability:
Redesign survivability mode") in -next, Clang (and GCC 16, currently in
development) warns that index is set but unused now because it is only
incremented.

  drivers/gpu/drm/xe/xe_survivability_mode.c:147:6: error: variable 'index' set but not used [-Werror,-Wunused-but-set-variable]
    147 |         int index;
        |             ^

  drivers/gpu/drm/xe/xe_survivability_mode.c: In function 'populate_survivability_info':
  drivers/gpu/drm/xe/xe_survivability_mode.c:147:13: error: variable 'index' set but not used [-Werror=unused-but-set-variable=]
    147 |         int index;
        |             ^~~~~

Should this loop be rewritten to drop index or does index need to be
used somewhow?

Cheers,
Nathan
