Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A43DCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 08:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1323610E01F;
	Fri, 12 Sep 2025 08:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPe9wn2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C8D10E01F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757664328; x=1789200328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P7eKybBUSGTHH0ylWbgaPwDjSipFlEulChqYoECxyu8=;
 b=PPe9wn2HBnJhMIYp4f/MWR/tsr88tr+0xxghMgb8l1EbSGV8+TnF1nGZ
 97fgRVdEnsaJhnAdJ+hDHXbnrmf0EaIsp6UYkNTP9lWZqILG+aOcJ6E2I
 mHA3zkDWchRe2rcRQPBqFGMTi0Q6nLAXEuJE/pKImWy0rN2rJK+VCs4vp
 DUid5OCoiLhUE4rXKRj0Kb1d8yXRMi1jivJTU+1DnlPswrs8/aC60KsZb
 Z7k5FWt6Ew/+XjiMeX6a+GAZDTDNRxRp1+v+5Zl9zWqUe6694qH5JmzXo
 mDAJqlzNQBGM1gOymF5bzOj83TTWxd0vOTYgxccTqDA3tukeoqJG3oE8e g==;
X-CSE-ConnectionGUID: Wzb5EDVuSrSF3WqgnxhN1A==
X-CSE-MsgGUID: 7cvIp7nmS/ufzH4owgDECQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59866292"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="59866292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 01:05:27 -0700
X-CSE-ConnectionGUID: rKzWM6gBTvmOtgnaVQO/lA==
X-CSE-MsgGUID: 4tB7BWR4RfmOhPyO+wJS4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173077004"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 01:05:25 -0700
Date: Fri, 12 Sep 2025 10:05:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v4 6/6] drm/xe/configfs: Add post context restore bb
Message-ID: <aMPUQcgJsZARb8P4@black.igk.intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-6-c8f7e48f7eae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-wa-bb-cmds-v4-6-c8f7e48f7eae@intel.com>
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

On Thu, Sep 11, 2025 at 12:36:30PM -0700, Lucas De Marchi wrote:
> Allow the user to specify commands to execute during a context restore.
> Currently it's possible to parse 2 types of actions:
> 
> 	- cmd: the instructions are added as is to the bb
> 	- reg: just use the address and value, without worrying about
> 	  encoding the right LRI instruction. This is possibly the most
> 	  useful use case, so added a dedicated action for that.
> 
> This also prepares for future BBs: mid context restore and rc6 context
> restore that can re-use the same parsing functions.

...

> @@ -123,11 +156,18 @@
>   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
>   */
>  
> +/* Similar to struct xe_bb, but not tied to HW (yet) */

Should I assume we plan to do it at some point?

> +struct wa_bb {
> +	u32 *cs;
> +	u32 len; /* in dwords */
> +};

...

> +static ssize_t wa_bb_show(struct xe_config_group_device *dev,
> +			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
> +			  char *data, size_t sz)
> +{
> +	char *p = data;
> +
> +	guard(mutex)(&dev->lock);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		enum xe_engine_class ec = engine_info[i].engine_class;
> +		size_t len;
> +
> +		if (!wa_bb[ec].len)
> +			continue;
> +
> +		len = snprintf(p, sz, "%s:", engine_info[i].cls);
> +		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> +			return -ENOBUFS;
> +
> +		for (size_t j = 0; j < wa_bb[ec].len; j++) {
> +			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);

Should we use '0x' prefix?

> +			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
> +				return -ENOBUFS;
> +		}
> +
> +		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
> +			return -ENOBUFS;
> +	}
> +
> +	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
> +		return -ENOBUFS;
> +
> +	/* Reserve one more to match check for '\0' */
> +	if (!data)
> +		p++;
> +
> +	return p - data;
> +}

...

> +static ssize_t parse_wa_bb_lines(const char *lines,
> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> +{
> +	ssize_t dwords = 0, ret;
> +	const char *p;
> +
> +	for (p = lines; *p; p++) {

I found it to be zeroed page but does it gurantee termination at page
boundary? (just thinking out loud about overrun cases)

> +		const struct engine_info *info = NULL;
> +		u32 val, val2;
> +
> +		/* Also allow empty lines */
> +		p += strspn(p, " \t\n");
> +		if (!*p)
> +			break;
> +
> +		ret = parse_engine(p, " \t\n", NULL, &info);

Nit: Can we work without a double pointer? I've always found it easier to read.

> +		if (ret < 0)
> +			return ret;
> +
> +		p += ret;
> +		p += strspn(p, " \t");
> +
> +		if (str_has_prefix(p, "cmd")) {
> +			for (p += strlen("cmd"); *p;) {
> +				ret = parse_hex(p, &val);
> +				if (ret < 0)
> +					return -EINVAL;
> +				if (!ret)
> +					break;
> +
> +				p += ret;
> +				dwords++;
> +				wa_bb_append(&wa_bb[info->engine_class], val);
> +			}
> +		} else if (str_has_prefix(p, "reg")) {
> +			p += strlen("reg");
> +			ret = parse_hex(p, &val);
> +			if (ret <= 0)
> +				return -EINVAL;
> +
> +			p += ret;
> +			ret = parse_hex(p, &val2);
> +			if (ret <= 0)
> +				return -EINVAL;
> +
> +			p += ret;
> +			dwords += 3;
> +			wa_bb_append(&wa_bb[info->engine_class],
> +				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
> +			wa_bb_append(&wa_bb[info->engine_class], val);
> +			wa_bb_append(&wa_bb[info->engine_class], val2);
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return dwords;
> +}

...

> +CONFIGFS_ATTR(, ctx_restore_post_bb);

I know this is alphabetic order but let's be consistent, either at the top ...

>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
> @@ -379,6 +640,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
>  	&attr_survivability_mode,
> +	&attr_ctx_restore_post_bb,

... or bottom.

>  	NULL,
>  };

...

> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f337954066f55..c706585611d55 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -8,6 +8,7 @@
>  #include <generated/xe_wa_oob.h>
>  
>  #include <linux/ascii85.h>
> +#include <linux/panic.h>
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "instructions/xe_gfxpipe_commands.h"
> @@ -1120,6 +1121,12 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>  	if (count > max_len)
>  		return -ENOSPC;
>  
> +	/*
> +	 * This should be used only for tests and validation. Taint the kernel
> +	 * as anything could be submitted directly in context switches
> +	 */
> +	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);

I know we add wa_bb support in this patch but perhaps this belongs to
previous patch?

Raag

>  	memcpy(cmd, user_batch, count * sizeof(u32));
>  	cmd += count;
>  
> 
> -- 
> 2.50.1
> 
