Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D947CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 11:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B752F10EB88;
	Fri, 29 Aug 2025 11:26:03 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8887F10EB88
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 11:26:02 +0000 (UTC)
Message-ID: <34171db5-b3d5-4a60-88df-a563e3a69411@lankhorst.se>
Date: Fri, 29 Aug 2025 13:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/guc_pc: Use poll_timeout_us() for waiting
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-2-9832ccd1c8b1@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250828-xe-iopoll-v1-2-9832ccd1c8b1@intel.com>
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



Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
> Convert wait_for_pc_state() and wait_for_act_freq_limit() to
> poll_timeout_us(). This brings 2 changes in behavior: Drop the
> exponential wait and fix a potential much longer sleep.
> 
> usleep_range() will wait anywhere between `wait` and `wait << 1`, so
> it's not correct to assume `slept += wait`.  This code is not really
> accurate. Pairing this with the exponential wait increase, it could be
> waiting much longer than intended.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++--------------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 88557e86d6371..2299a2b2ec81b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/cleanup.h>
>  #include <linux/delay.h>
> +#include <linux/iopoll.h>
>  #include <linux/jiffies.h>
>  #include <linux/ktime.h>
>  #include <linux/wait_bit.h>
> @@ -128,23 +129,16 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>  			     enum slpc_global_state state,
>  			     int timeout_ms)
>  {
> -	int timeout_us = 1000 * timeout_ms;
> -	int slept, wait = 10;
> +	const unsigned long timeout_usec = timeout_ms * USEC_PER_MSEC,
> +			    wait_usec = 20;
> +	int ret;
>  
>  	xe_device_assert_mem_access(pc_to_xe(pc));
>  
> -	for (slept = 0; slept < timeout_us;) {
> -		if (slpc_shared_data_read(pc, header.global_state) == state)
> -			return 0;
> -
> -		usleep_range(wait, wait << 1);
> -		slept += wait;
> -		wait <<= 1;
> -		if (slept + wait > timeout_us)
> -			wait = timeout_us - slept;
> -	}
> +	ret = poll_timeout_us(ret = slpc_shared_data_read(pc, header.global_state) == state,
> +			      ret, wait_usec, timeout_usec, false);
({}, slpc_shared_data_read(pc, ...) == state, ..) is likely more readable?
>  
> -	return -ETIMEDOUT;
> +	return ret;
>  }
With those changes 'ret' can be killed, and you can immediately return poll_timeout_us().
>  
>  static int wait_for_flush_complete(struct xe_guc_pc *pc)
> @@ -161,22 +155,16 @@ static int wait_for_flush_complete(struct xe_guc_pc *pc)
>  
>  static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
>  {
> -	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
> -	int slept, wait = 10;
> -
> -	for (slept = 0; slept < timeout_us;) {
> -		if (xe_guc_pc_get_act_freq(pc) <= freq)
> -			return 0;
> +	const unsigned long timeout_usec = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC,
> +			    wait_usec = 20;
> +	int ret;
>  
> -		usleep_range(wait, wait << 1);
> -		slept += wait;
> -		wait <<= 1;
> -		if (slept + wait > timeout_us)
> -			wait = timeout_us - slept;
> -	}
> +	ret = poll_timeout_us(ret = xe_guc_pc_get_act_freq(pc) <= freq,
> +			      ret, wait_usec, timeout_usec, false);
Same here,
({}, xe_guc_pc_get_act_freq(pc) <= freq,

The ret re-use is a bit fishy. Looks like that variable is not needed at all.

The extra variables also don't need to be defined, shoudl be ok to inline those.

Kind regards,
~Maarten Lankhorst
