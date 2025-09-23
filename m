Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40665CAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 11:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B8610E5E8;
	Tue, 23 Sep 2025 11:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaUPBQpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDF810E5E8
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758627225; x=1790163225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/cEtnGQwcCHF+ulSKQASWBfd0HtdDwZLI1qHx6yGfCs=;
 b=GaUPBQpBYLlu+GnNGQemmpBE0lSAK9/dsuzTJvkz57nCKW8jn8HQdEBR
 J+E7sTuOAOpJgYl83k6kMuzoRi7U7OuFHhBtEKfszK3xGX71tXNaDEblI
 Co6FvKaiuz4vXjJRCysya99k8VM5brx/BiF+/CSUV6b7CIBbLL+nS6Usy
 b1jADhClFwAgu62FHgWBhCLB3cDecauRV+NlWJ52zc4LEFsCrePxy8X1e
 MI9J7jODWIh9/ZDi7cIM+AaM9L6HkfCagbLffkveZV/jhdnJGWpvFyN25
 TG7dHiZfyA7TtbObElpzGP8cZWtYKMxW7uT412WorjlElCCV3ILEbq50x Q==;
X-CSE-ConnectionGUID: 4Ws0wd9PSgmAtLHqi783zw==
X-CSE-MsgGUID: 8LTBAe4gQ0q38i/GqJjngQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60843914"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60843914"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:33:45 -0700
X-CSE-ConnectionGUID: mGDum5LjRSGCBbF1N+n5Fg==
X-CSE-MsgGUID: IrdeSpL3SKGKakD8hH7TYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="181908122"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:33:43 -0700
Date: Tue, 23 Sep 2025 13:33:39 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Fix engine class parsing
Message-ID: <aNKFkyQvpvy1c3_X@black.igk.intel.com>
References: <20250922221209.110737-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922221209.110737-2-lucas.demarchi@intel.com>
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

On Mon, Sep 22, 2025 at 03:12:10PM -0700, Lucas De Marchi wrote:
> If mask is NULL, only the engine class should be accepted, so the
> pattern string should be completely parsed. This should fix passing e.g.
> rcs0 to ctx_restore_post_bb when it's only expecting the engine class.

Should we add to the doc so we don't mix up expectations between different
attributes?

Or do we care about the rest of pattern of mask is NULL? Perhaps it'll
allow us to have common expectations between attributes.

Raag

> Reported-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Closes: https://lore.kernel.org/r/20250922155544.67712-1-jonathan.cavitt@intel.com
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 8a9b950e7a6d1..beade13efbae7 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -324,8 +324,8 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
>  			continue;
>  
>  		pattern += strlen(engine_info[i].cls);
> -		if (!mask && !*pattern)
> -			return &engine_info[i];
> +		if (!mask)
> +			return *pattern ? NULL : &engine_info[i];
>  
>  		if (!strcmp(pattern, "*")) {
>  			*mask = engine_info[i].mask;
> -- 
> 2.50.1
> 
