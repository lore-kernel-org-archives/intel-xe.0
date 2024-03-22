Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEA1C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 15:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA268112541;
	Fri, 22 Mar 2024 15:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeNaurol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2E711253C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711120058; x=1742656058;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=VqfN6m9leDcWYv/A/H24L+OEet1KUt2sehwMxWP+nwU=;
 b=AeNaurolvT3qAhYisqft4StCWmUoPPBX3JBh0ZJ7URgSYsVUhKDeMK+W
 q6p7fU7HoPHaDbBN6rk6x+EGr2x98mSpGe31jI9Cr0mYKBLt6kxL9X74C
 0qgrjgRX6Um9V4uhfx6nTkq7aG4lHGXyyJxmhEan20xoRQmc1macxjW+3
 WFFOs5siUzNiTwi55Ipysz7Qd81NpJlrR7zPdvWLbsIz8C66jXNwu6+fP
 REjeAqOk/qGgT8tRwaU9u7H5Gd4TogcpgKms5elVxja5kfK8ptD0h4Ew5
 8YSBhSCE+LsixXDlvENSTpyStn4cf7oo3nHgI70p2H6wjzN6L7/151Jw8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6036503"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6036503"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 08:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19502753"
Received: from ghoshsu1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.6])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 08:07:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Fix END redefinition
In-Reply-To: <20240322145037.196548-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322145037.196548-1-lucas.demarchi@intel.com>
Date: Fri, 22 Mar 2024 17:07:31 +0200
Message-ID: <87msqqjoek.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 22 Mar 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> mips declares an END macro in its headers so it can't be used without
> namespace in a driver like xe.
>
> Instead of coming up with a longer name, just remove the macro and
> replace its use with 0 since it's still clear what that means:
> set_offsets() was already using that implicitly when checking the data
> variable.
>
> Closes: http://kisskb.ellerman.id.au/kisskb/buildresult/15143996/
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>
> Complete series that needs closer scrutiny:
> https://lore.kernel.org/intel-xe/20240321221726.102193-1-lucas.demarchi@intel.com/
>
> Sending this by itself for CI coverage.
>
>  drivers/gpu/drm/xe/xe_lrc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8c85e90220de..2bbf008b83ff 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -97,7 +97,6 @@ static void set_offsets(u32 *regs,
>  #define REG16(x) \
>  	(((x) >> 9) | BIT(7) | BUILD_BUG_ON_ZERO(x >= 0x10000)), \
>  	(((x) >> 2) & 0x7f)
> -#define END 0
>  {
>  	const u32 base = hwe->mmio_base;
>  
> @@ -168,7 +167,7 @@ static const u8 gen12_xcs_offsets[] = {
>  	REG16(0x274),
>  	REG16(0x270),
>  
> -	END
> +	0
>  };
>  
>  static const u8 dg2_xcs_offsets[] = {
> @@ -202,7 +201,7 @@ static const u8 dg2_xcs_offsets[] = {
>  	REG16(0x274),
>  	REG16(0x270),
>  
> -	END
> +	0
>  };
>  
>  static const u8 gen12_rcs_offsets[] = {
> @@ -298,7 +297,7 @@ static const u8 gen12_rcs_offsets[] = {
>  	REG(0x084),
>  	NOP(1),
>  
> -	END
> +	0
>  };
>  
>  static const u8 xehp_rcs_offsets[] = {
> @@ -339,7 +338,7 @@ static const u8 xehp_rcs_offsets[] = {
>  	LRI(1, 0),
>  	REG(0x0c8),
>  
> -	END
> +	0
>  };
>  
>  static const u8 dg2_rcs_offsets[] = {
> @@ -382,7 +381,7 @@ static const u8 dg2_rcs_offsets[] = {
>  	LRI(1, 0),
>  	REG(0x0c8),
>  
> -	END
> +	0
>  };
>  
>  static const u8 mtl_rcs_offsets[] = {
> @@ -425,7 +424,7 @@ static const u8 mtl_rcs_offsets[] = {
>  	LRI(1, 0),
>  	REG(0x0c8),
>  
> -	END
> +	0
>  };
>  
>  #define XE2_CTX_COMMON \
> @@ -471,7 +470,7 @@ static const u8 xe2_rcs_offsets[] = {
>  	LRI(1, 0),              /* [0x47] */
>  	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
>  
> -	END
> +	0
>  };
>  
>  static const u8 xe2_bcs_offsets[] = {
> @@ -482,16 +481,15 @@ static const u8 xe2_bcs_offsets[] = {
>  	REG16(0x200),           /* [0x42] BCS_SWCTRL */
>  	REG16(0x204),           /* [0x44] BLIT_CCTL */
>  
> -	END
> +	0
>  };
>  
>  static const u8 xe2_xcs_offsets[] = {
>  	XE2_CTX_COMMON,
>  
> -	END
> +	0
>  };
>  
> -#undef END
>  #undef REG16
>  #undef REG
>  #undef LRI

-- 
Jani Nikula, Intel
