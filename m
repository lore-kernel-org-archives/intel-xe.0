Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D3ECA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 06:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791CD10E58F;
	Tue,  2 Sep 2025 06:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDaUSOzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332FF10E58F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 06:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756792937; x=1788328937;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4xQTdQQr2J+X+pbYTet4DVJanXriXzzLMQ23Mef2iAI=;
 b=QDaUSOzlC5P4JHCAFpd30AAWG22Cv9xaLDpLRDBFlkR5+2MIsXoYrnTW
 MaMamBX8X9PUpMaoSfZZbosrC6WAlhkQGL5MRk22FMF7EAG7u6WAW7Uh+
 KreUDgMiA2txApsnAhezbds336f8ZouTcLtLhND1EoUHLVuk6MABYdedJ
 tRaeI0JHTS327E7NwflO4mQXMetCVJXUayes4eZyQ5RHiGsS1IReD54lV
 wJ6Z4CGNK2E4cmmd+IfIlprF5DOQuqJdc2rXzwERlRk5XMYCuIdNFtWlf
 OWXGLBqT4rKjwmF9ERGc9lY9EMUmbAPVbpxK7Jeu5mcueAooAezGmNXI/ w==;
X-CSE-ConnectionGUID: sai7K1MMSfaAb9SJ1ge+lQ==
X-CSE-MsgGUID: bRo0EMx2Qxehrk6u5y1jAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="62869422"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="62869422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:00:51 -0700
X-CSE-ConnectionGUID: NY9L7JQPRxG7Kn7PAySZNg==
X-CSE-MsgGUID: vE+h3kCXTV2cw7XZZd0tqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="170736752"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:00:48 -0700
Date: Tue, 2 Sep 2025 08:00:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v2 2/6] drm/xe/configfs: Allow to select by class only
Message-ID: <aLaIDfa45wMxk8zX@black.igk.intel.com>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
 <20250827-wa-bb-cmds-v2-2-3cdf4d63c72a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-wa-bb-cmds-v2-2-3cdf4d63c72a@intel.com>
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

On Wed, Aug 27, 2025 at 03:35:27PM -0700, Lucas De Marchi wrote:
> For a future configfs attribute, it's desirable to select by engine mask
> only as the instance doesn't make sense.
> 
> If the caller is only interested in class, allow lookup_engine_mask() to
> return the matched index if mask is NULL. This allows parse_engine() to
> still return an item if the caller wants to allow parsing a class-only
> string like "rcs", "bcs", "ccs", etc.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 53 ++++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 6cccab5456811..a1d230007cc05 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -150,6 +150,7 @@ static void set_device_defaults(struct xe_config_device *config)
>  struct engine_info {
>  	const char *cls;
>  	u64 mask;
> +	enum xe_engine_class engine_class;
>  };
>  
>  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> @@ -157,12 +158,12 @@ struct engine_info {
>  #define MAX_ENGINE_INSTANCE_CHARS 2
>  
>  static const struct engine_info engine_info[] = {
> -	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
> -	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
> -	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
> -	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
> -	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
> -	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, XE_ENGINE_CLASS_RENDER },
> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, XE_ENGINE_CLASS_COPY },
> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, XE_ENGINE_CLASS_VIDEO_DECODE },
> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, XE_ENGINE_CLASS_VIDEO_ENHANCE },
> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, XE_ENGINE_CLASS_COMPUTE },
> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, XE_ENGINE_CLASS_OTHER },

Should this have ".engine_class =" for consistency?

>  static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
> @@ -251,7 +252,19 @@ static ssize_t engines_allowed_show(struct config_item *item, char *page)
>  	return p - page;
>  }
>  
> -static bool lookup_engine_mask(const char *pattern, u64 *mask)
> +/*
> + * Lookup engine index from engine_info. If @mask is not NULL, reduce the mask
> + * according to the instance in @pattern.
> + *
> + * Examples of inputs:
> + *
> + * - lookup_engine_mask("rcs0", &mask): return "rcs" index from @engine_info and
> + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> + * - lookup_engine_mask("rcs*", &mask): return "rcs" index from @engine_info and
> + *   mask == XE_HW_ENGINE_RCS_MASK
> + * - lookup_engine_mask("rcs", NULL): return "rcs" index from @engine_info
> + */
> +static int lookup_engine_mask(const char *pattern, u64 *mask)

Should this now be lookup_engine_index()?

>  	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>  		u8 instance;
> @@ -261,30 +274,34 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
>  			continue;
>  
>  		pattern += strlen(engine_info[i].cls);
> +		if (!mask && !*pattern)
> +			return i;
>  
>  		if (!strcmp(pattern, "*")) {
>  			*mask = engine_info[i].mask;
> -			return true;
> +			return i;
>  		}
>  
>  		if (kstrtou8(pattern, 10, &instance))
> -			return false;
> +			return -ENOENT;
>  
>  		bit = __ffs64(engine_info[i].mask) + instance;
>  		if (bit >= fls64(engine_info[i].mask))
> -			return false;
> +			return -ENOENT;
>  
>  		*mask = BIT_ULL(bit);
> -		return true;
> +		return i;
>  	}
>  
> -	return false;
> +	return -ENOENT;
>  }
>  
> -static int parse_engine(const char *s, const char *end_chars, u64 *mask)
> +static int parse_engine(const char *s, const char *end_chars, u64 *mask,
> +			const struct engine_info **info)

Considering we're parsing a single entry, do we really need a double pointer?

Raag

>  {
>  	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
>  	size_t len;
> +	int idx;
>  
>  	len = strcspn(s, end_chars);
>  	if (len >= sizeof(buf))
> @@ -293,8 +310,12 @@ static int parse_engine(const char *s, const char *end_chars, u64 *mask)
>  	memcpy(buf, s, len);
>  	buf[len] = '\0';
>  
> -	if (!lookup_engine_mask(buf, mask))
> -		return -ENOENT;
> +	idx = lookup_engine_mask(buf, mask);
> +	if (idx < 0)
> +		return idx;
> +
> +	if (info)
> +		*info = &engine_info[idx];
>  
>  	return len;
>  }
> @@ -307,7 +328,7 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>  	u64 mask, val = 0;
>  
>  	for (p = 0; p < len; p += patternlen + 1) {
> -		patternlen = parse_engine(page + p, ",\n", &mask);
> +		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
>  		if (patternlen < 0)
>  			return -EINVAL;
>  
> 
> -- 
> 2.50.1
> 
