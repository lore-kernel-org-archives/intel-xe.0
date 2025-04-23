Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F1AC369D3
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 09:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D2E10E0E9;
	Wed, 23 Apr 2025 09:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dutlIwft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97DD10E0E9
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Apr 2025 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745399911; x=1776935911;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xPOJSddEogosETQuWAHinFKScHuT4rAnCubZTFrh/m0=;
 b=dutlIwft8XhxLoOSzZUCDt6lj5t+zfl/wTIooHBw233rny5iWJrgzy/e
 vBGwYbrWC7TyF2n3NKOtHjHpc/oCTPiBY7HJwgMhNZgwIGif4SYJvFm01
 5TZoFqIS2YUyZPe9ywkDqkG6lJK7zOVyKG/5aB8RKTv0/K/ksT+4yK8QL
 v2wA/qHJqgr/vDwB396UzXgrfBSdoNGl9VRVVlPiYHFm5RxNp8p+qNuJk
 8pdwJjLK46uZhbujdM0vc3wSX3x7RBPtWPfXI6wSxTauxR6w42ELhSYBv
 7pBR+Oz8+yPuY3XzV0pm1RII25Vhyq9+rWM9WgdtftYmsfsN4sa/7vSms Q==;
X-CSE-ConnectionGUID: 8qZ9YyGIT7aKIrAXKexOjQ==
X-CSE-MsgGUID: V4Ry3SKTS8uXSzpvwQIoyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46865711"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46865711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 02:18:31 -0700
X-CSE-ConnectionGUID: gtzpBZPaSDOipsaEluk3Bw==
X-CSE-MsgGUID: SMjDV4ZSRYim1/We6nOgdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132005360"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 23 Apr 2025 02:18:29 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 85D3C33BEE;
 Wed, 23 Apr 2025 10:18:27 +0100 (IST)
Message-ID: <a062464d-b736-43f2-a33c-9e1c689af5e3@intel.com>
Date: Wed, 23 Apr 2025 11:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Track FAST_REQ H2Gs to report where
 errors came from
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250326193240.4165833-1-John.C.Harrison@Intel.com>
 <20250326193240.4165833-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250326193240.4165833-3-John.C.Harrison@Intel.com>
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



On 26.03.2025 20:32, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Most H2G messages are FAST_REQ which means no synchronous response is
> expected. The messages are sent as fire-and-forget with no tracking.
> However, errors can still be returned when something goes unexpectedly
> wrong. That leads to confusion due to not being able to match up the
> error response to the originating H2G.
> 
> So add support for tracking the FAST_REQ H2Gs and matching up an error
> response to its originator. This is only enabled in XE_DEBUG builds
> given that such errors should never happen in a working system and
> there is an overhead for the tracking.
> 
> Further, if XE_DEBUG_GUC is enabled then even more memory and time is
> used to record the call stack of each H2G and report that with the
> error. That makes it much easier to work out where a specific H2G came
> from if there are multiple code paths that can send it.
> 
> Note, rather than create an extra Kconfig define for just this
> feature, the XE_LARGE_GUC_BUFFER option has been re-used and renamed
> to XE_DEBUG_GUC and is now just a general purpose 'verbose GuC debug'
> option.

shouldn't the Kconfig change be in a separate patch ?

> 
> v2: Some re-wording of comments and prints, more consistent use of #if
> vs stub functions - review feedback from Daniele & Michal).
> 
> Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug     |  10 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 109 ++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  15 ++++
>  drivers/gpu/drm/xe/xe_guc_log.h      |   2 +-
>  4 files changed, 113 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 0d749ed44878..66b601b17de6 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -86,12 +86,16 @@ config DRM_XE_KUNIT_TEST
>  
>  	  If in doubt, say "N".
>  
> -config DRM_XE_LARGE_GUC_BUFFER
> -        bool "Enable larger guc log buffer"
> +config DRM_XE_DEBUG_GUC
> +        bool "Enable extra GuC related debug options"
> +        depends on DRM_XE_DEBUG
>          default n
> +        select STACKDEPOT
>          help
>            Choose this option when debugging guc issues.
> -          Buffer should be large enough for complex issues.
> +          The GuC log buffer is increased to the maximum allowed, which should
> +          be large enough for complex issues. This config also enables
> +          recording of the stack when tracking FAST_REQ messages.
>  
>            Recommended for driver developers only.
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 72ad576fc18e..ac87c93fbf24 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -624,6 +624,47 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  	spin_unlock_irq(&ct->fast_lock);
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
> +{
> +	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	unsigned long entries[SZ_32];
> +	unsigned int n;
> +
> +	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
> +
> +	/* May be called under spinlock, so avoid sleeping */
> +	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
> +#endif
> +	ct->fast_req[slot].fence = fence;
> +	ct->fast_req[slot].action = action;
> +}
> +#else
> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
> +{
> +}
> +#endif
> +
> +/*
> + * The CT protocol accepts a 16 bits fence. This field is fully owned by the
> + * driver, the GuC will just copy it to the reply message. Since we need to
> + * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
> + * we use one bit of the seqno as an indicator for that and a rolling counter
> + * for the remaining 15 bits.
> + */
> +#define CT_SEQNO_MASK GENMASK(14, 0)
> +#define CT_SEQNO_UNTRACKED BIT(15)
> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> +{
> +	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
> +
> +	if (!is_g2h_fence)
> +		seqno |= CT_SEQNO_UNTRACKED;
> +
> +	return seqno;
> +}
> +
>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>  
>  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -715,6 +756,10 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
>  	xe_device_wmb(xe);
>  
> +	if (ct_fence_value & CT_SEQNO_UNTRACKED)
> +		fast_req_track(ct, ct_fence_value,
> +			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
> +
>  	/* Update local copies */
>  	h2g->info.tail = (tail + full_len) % h2g->info.size;
>  	h2g_reserve_space(ct, full_len);
> @@ -732,25 +777,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return -EPIPE;
>  }
>  
> -/*
> - * The CT protocol accepts a 16 bits fence. This field is fully owned by the
> - * driver, the GuC will just copy it to the reply message. Since we need to
> - * be able to distinguish between replies to REQUEST and FAST_REQUEST messages,
> - * we use one bit of the seqno as an indicator for that and a rolling counter
> - * for the remaining 15 bits.
> - */
> -#define CT_SEQNO_MASK GENMASK(14, 0)
> -#define CT_SEQNO_UNTRACKED BIT(15)
> -static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> -{
> -	u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
> -
> -	if (!is_g2h_fence)
> -		seqno |= CT_SEQNO_UNTRACKED;
> -
> -	return seqno;
> -}
> -
>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
>  				struct g2h_fence *g2h_fence)
> @@ -1141,6 +1167,48 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
> +{
> +	struct xe_gt *gt = ct_to_gt(ct);
> +	unsigned int n;
> +	bool found = false;

what about the 'rev xmas tree order' rule ?

> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	char *buf;
> +#endif
> +
> +	lockdep_assert_held(&ct->lock);
> +
> +	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
> +		if (ct->fast_req[n].fence != fence)
> +			continue;
> +		found = true;
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +		buf = kmalloc(SZ_4K, GFP_NOWAIT);
> +		if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf, SZ_4K, 0))
> +			xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s",
> +				  fence, ct->fast_req[n].action, buf);
> +		else
> +			xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
> +				  fence, ct->fast_req[n].action);
> +		kfree(buf);
> +#else
> +		xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
> +			  fence, ct->fast_req[n].action);
> +#endif
> +		break;
> +	}
> +
> +	if (!found)
> +		xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped?\n", fence);

nit: maybe print also current last-fast-fence to allow estimate the diff
between what we track vs this fence?

> +}
> +#else
> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
> +{
> +}
> +#endif
> +
>  static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt =  ct_to_gt(ct);
> @@ -1169,6 +1237,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		else
>  			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>  				  type, fence);
> +
> +		fast_req_report(ct, fence);
> +
>  		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>  
>  		return -EPROTO;

nit: for RESPONSE_FAILURE this shouldn't be -EPROTO as errors, even if
unexpected, are part of the HXG protocol, maybe -ECANCELED or -ECOMM?

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 8e1b9d981d61..f58cea36c3c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/iosys-map.h>
>  #include <linux/spinlock_types.h>
> +#include <linux/stackdepot.h>
>  #include <linux/wait.h>
>  #include <linux/xarray.h>
>  
> @@ -104,6 +105,18 @@ struct xe_dead_ct {
>  	/** snapshot_log: copy of GuC log at point of error */
>  	struct xe_guc_log_snapshot *snapshot_log;
>  };
> +
> +/** struct xe_fast_req_fence - Used to track FAST_REQ messages by fence to match error responses */
> +struct xe_fast_req_fence {
> +	/** @fence: sequence number sent in H2G and return in G2H error */
> +	u16 fence;
> +	/** @action: H2G action code */
> +	u16 action;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	/** @stack: call stack from when the H2G was sent */
> +	depot_stack_handle_t stack;
> +#endif
> +};
>  #endif

I still believe that even on non-debug config we should be prepared to
provide at least minimum information about potential fast-req failure,
just without full stack, like we do for normal requests, where we also
don't expect them to be failing on production builds...

>  
>  /**
> @@ -152,6 +165,8 @@ struct xe_guc_ct {
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  	/** @dead: information for debugging dead CTs */
>  	struct xe_dead_ct dead;
> +	/** @fast_req: history of FAST_REQ messages for matching with G2H error responses*/
> +	struct xe_fast_req_fence fast_req[SZ_32];
>  #endif
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 5b896f5fafaf..f1e2b0be90a9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -12,7 +12,7 @@
>  struct drm_printer;
>  struct xe_device;
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>  #define CRASH_BUFFER_SIZE       SZ_1M
>  #define DEBUG_BUFFER_SIZE       SZ_8M
>  #define CAPTURE_BUFFER_SIZE     SZ_2M

mostly nits, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

