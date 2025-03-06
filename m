Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0FBC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0405210E7F3;
	Thu,  6 Mar 2025 22:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbPT8iEh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775510E7F3
 for <Intel-Xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741301308; x=1772837308;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2Iie9tWG0/EFDjPp82ewK9/7NSqK3Kk4SndvM5suoZo=;
 b=SbPT8iEh9oSzZticj2CM5vazasKpbsYtupCcTvpNgky0V0yOIKz07DDY
 g0lKb39KDN/58/hOTISgbONSI0/IYLE64WDdwjwzv8i/axGCTmepEk45w
 4MlAvTNs1BW+La9G1b0O6ulCj5yw0NpZ+KnMW0n/iJyhk8TankXJ/iC7w
 Helz6xy5z15kWhyrlZRte395ChyD9B1dFvOxlBcK2rIPpZNY0WsUbdEYv
 rN3NBkY1nvG2dsysmjFugOinTsSwYX19Qe4rl83pLvUnJ13ovUh5IrvmA
 BSY4xQPC2oCw9yYNA3r9qQr8ZOarbpI+UF25uFrCtgCpHHkXjY6sXaGy2 Q==;
X-CSE-ConnectionGUID: KtOsJ2XfSZukkdNx4gJR0g==
X-CSE-MsgGUID: +E+gqA2mRtGkintknan65w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42477156"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="42477156"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:48:28 -0800
X-CSE-ConnectionGUID: Dndu8ZwiQwijgXnGgKYZ2w==
X-CSE-MsgGUID: HlBuZX5cS4uWifl9JEB+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119666871"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 14:48:26 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 838983545C;
 Thu,  6 Mar 2025 22:48:25 +0000 (GMT)
Message-ID: <a72ac04b-dbe6-4840-8f5b-475bac782382@intel.com>
Date: Thu, 6 Mar 2025 23:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Track FAST_REQ H2Gs to report where errors
 came from
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
References: <20250221031444.3820965-1-John.C.Harrison@Intel.com>
 <eaf6cf82-6d5b-4e2b-9a61-bc61d447c5ae@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <eaf6cf82-6d5b-4e2b-9a61-bc61d447c5ae@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 06.03.2025 02:15, Daniele Ceraolo Spurio wrote:
> 
> 
> On 2/20/2025 7:14 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Most H2G messages are FAST_REQ which means no synchronous response is
>> expected. The messages are sent as fire-and-forget with no tracking.
>> However, errors can still be returned when something goes unexpectedly
>> wrong. That leads to confusion due to not being able to match up the
>> error response to the originating H2G.
>>
>> So add support for tracking the FAST_REQ H2Gs and matching up an error
>> response to its originator. This is only enabled in XE_DEBUG builds
>> given that such errors should never happen in a working system and
>> there is an overhead for the tracking.
>>
>> Further, if XE_DEBUG_GUC is enabled then even more memory and time is
>> used to record the call stack of each H2G and report that with an
>> error. That makes it much easier to work out where a specific H2G came
>> from if there are multiple code paths that can send it.
>>
>> Note, rather than create an extra Kconfig define for just this
>> feature, the XE_LARGE_GUC_BUFFER option has been re-used and renamed
>> to XE_DEBUG_GUC and is now just a general purpose 'verbose GuC debug'
>> option.
>>
>> Lastly, add a define to document FAST_REQ error 0x30C as being the
>> error most recently hit. Not sure why it was previously missing.
>>
>> Original-i915-code: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig.debug        |  10 ++-
>>   drivers/gpu/drm/xe/abi/guc_errors_abi.h |   1 +
>>   drivers/gpu/drm/xe/xe_guc_ct.c          | 106 +++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_guc_ct_types.h    |  15 ++++
>>   drivers/gpu/drm/xe/xe_guc_log.h         |   2 +-
>>   5 files changed, 111 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/
>> Kconfig.debug
>> index 0d749ed44878..ef2c456c3f2a 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -86,12 +86,16 @@ config DRM_XE_KUNIT_TEST
>>           If in doubt, say "N".
>>   -config DRM_XE_LARGE_GUC_BUFFER
>> -        bool "Enable larger guc log buffer"
>> +config DRM_XE_DEBUG_GUC
> 
> Do we need a maintainer ack for this rename?
> 
>> +        bool "Enable extra GuC related debug options"
>> +        depends on DRM_XE_DEBUG
>>           default n
>> +        select STACKDEPOT
>>           help
>>             Choose this option when debugging guc issues.
>> -          Buffer should be large enough for complex issues.
>> +          The GuC log buffer is increased to the maximum allowed,
>> which should
>> +          be large enough for complex issues. It also enables

s/It/This config

>> recording of the
>> +          stack when tracking FAST_REQ messages.
>>               Recommended for driver developers only.
>>   diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/
>> drm/xe/abi/guc_errors_abi.h
>> index 2c627a21648f..c25ea52a6e61 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> @@ -40,6 +40,7 @@ enum xe_guc_response_status {
>>       XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
>>       XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
>>       XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
>> +    XE_GUC_RESPONSE_STATUS_HW_TIMEOUT                   = 0x30C,

we don't use/need this specific error code in this patch, so maybe its
definition deserves a separate patch?

>>       XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
>>       XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
>>       XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/
>> xe_guc_ct.c
>> index 72ad576fc18e..2d59934b87dc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -624,6 +624,43 @@ static void g2h_release_space(struct xe_guc_ct
>> *ct, u32 g2h_len)
>>       spin_unlock_irq(&ct->fast_lock);
>>   }
>>   +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)

do we really want to be left without any clue when FAST_REQ action fails
on the production build? without saving the stack, the cost of tracking
all fast-requests should be really negligible

>> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
>> +{
>> +    unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +    unsigned long entries[SZ_32];
>> +    unsigned int n;
>> +
>> +    n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
>> +
>> +    /* May be called under spinlock, so avoid sleeping */
>> +    ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
> 
> From the name it looks like this "save" should be matched by a "delete",
> but I can't find any docs explicitly stating how this should be used and

from DOC:

 * Does not increment the refcount on the saved stack trace; see
 * stack_depot_save_flags() for more details.

saved stack trace will be kept in the depot forever ...

> other examples (both in i915 and outside) seem to also be missing the
> delete, so I'm assuming this is the correct way to use this.

we only have few points from where we send FAST_REQ so it shouldn't be a
problem if traces will stay in the depot even after we remove the driver

> 
>> +#endif
>> +    ct->fast_req[slot].fence = fence;
>> +    ct->fast_req[slot].action = action;
>> +}
>> +#endif
>> +
>> +/*
>> + * The CT protocol accepts a 16 bits fence. This field is fully owned
>> by the
>> + * driver, the GuC will just copy it to the reply message. Since we
>> need to
>> + * be able to distinguish between replies to REQUEST and FAST_REQUEST
>> messages,
>> + * we use one bit of the seqno as an indicator for that and a rolling
>> counter
>> + * for the remaining 15 bits.
>> + */
>> +#define CT_SEQNO_MASK GENMASK(14, 0)
>> +#define CT_SEQNO_UNTRACKED BIT(15)
>> +static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>> +{
>> +    u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>> +
>> +    if (!is_g2h_fence)
>> +        seqno |= CT_SEQNO_UNTRACKED;
>> +
>> +    return seqno;
>> +}
>> +
>>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header
>> and one DW HxG header */
>>     static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32
>> len,
>> @@ -715,6 +752,12 @@ static int h2g_write(struct xe_guc_ct *ct, const
>> u32 *action, u32 len,
>>       xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action,
>> len * sizeof(u32));
>>       xe_device_wmb(xe);
>>   +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +    if (ct_fence_value & CT_SEQNO_UNTRACKED)
>> +        fast_req_track(ct, ct_fence_value,
>> +                   FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>> +#endif
>> +
>>       /* Update local copies */
>>       h2g->info.tail = (tail + full_len) % h2g->info.size;
>>       h2g_reserve_space(ct, full_len);
>> @@ -732,25 +775,6 @@ static int h2g_write(struct xe_guc_ct *ct, const
>> u32 *action, u32 len,
>>       return -EPIPE;
>>   }
>>   -/*
>> - * The CT protocol accepts a 16 bits fence. This field is fully owned
>> by the
>> - * driver, the GuC will just copy it to the reply message. Since we
>> need to
>> - * be able to distinguish between replies to REQUEST and FAST_REQUEST
>> messages,
>> - * we use one bit of the seqno as an indicator for that and a rolling
>> counter
>> - * for the remaining 15 bits.
>> - */
>> -#define CT_SEQNO_MASK GENMASK(14, 0)
>> -#define CT_SEQNO_UNTRACKED BIT(15)
>> -static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>> -{
>> -    u32 seqno = ct->fence_seqno++ & CT_SEQNO_MASK;
>> -
>> -    if (!is_g2h_fence)
>> -        seqno |= CT_SEQNO_UNTRACKED;
>> -
>> -    return seqno;
>> -}
>> -
>>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32
>> *action,
>>                   u32 len, u32 g2h_len, u32 num_g2h,
>>                   struct g2h_fence *g2h_fence)
>> @@ -1141,6 +1165,47 @@ static int guc_crash_process_msg(struct
>> xe_guc_ct *ct, u32 action)
>>       return 0;
>>   }
>>   +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
>> +{
>> +    unsigned int n;
>> +    bool found = false;
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +    char *buf;
>> +#endif
>> +
>> +    lockdep_assert_held(&ct->lock);
>> +
>> +    for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
>> +        if (ct->fast_req[n].fence != fence)
>> +            continue;
>> +        found = true;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +        buf = kmalloc(SZ_4K, GFP_NOWAIT);
>> +        if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf,
>> SZ_4K, 0))
>> +            xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action
>> %#04x sent at\n%s",
>> +                  fence, ct->fast_req[n].action, buf);
>> +        else
>> +            xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action
>> %#04x [failed to retrieve stack]\n",
>> +                  fence, ct->fast_req[n].action);
>> +        kfree(buf);
>> +#else
>> +        xe_gt_err(ct_to_gt(ct), "Fence 0x%x was used by action %#04x\n",
>> +              fence, ct->fast_req[n].action);
>> +#endif
>> +        break;
>> +    }
>> +
>> +    if (!found)
>> +        xe_gt_warn(ct_to_gt(ct), "FAST_REQ G2H fence 0x%x not found!
>> \n", fence);
> 
> Not convinced about this error message. the fast_req array is only 32
> entries deep, so it wouldn't be weird for entries to be overwritten in a
> busy system, but the read I get from this message is that something is
> wrong with the fact that we didn't find the fence. Maybe go for
> something like: "FAST_REQ G2H fence 0x%x action unknown". Not a blocker.
> 
>> +}
>> +#else
>> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
>> +{
>> +}
>> +#endif
> 
> nit: for fast_req_track() you only define the function under
> CONFIG_DRM_XE_DEBUG and then you conditionally call it based on the
> define, while here you define it for both cases and call it
> unconditionally. Not a blocker, it just seems weird to have different
> approaches.
> 
>> +
>>   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>   {
>>       struct xe_gt *gt =  ct_to_gt(ct);
>> @@ -1169,6 +1234,9 @@ static int parse_g2h_response(struct xe_guc_ct
>> *ct, u32 *msg, u32 len)
>>           else
>>               xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G
>> fence 0x%x!\n",
>>                     type, fence);

hmm, to some extend, all errors are unexpected, and with this new
tracking we can emit just single but more meaningful message:

// stack available
	"H2G fast request %#x failed: error %#x hint %#x sent from %s\n"

// stack not available
	"H2G fast request %#x failed: error %#x hint %#x\n"

// unknown fence
	"H2G fast request failed: fence %#x error %#x hint %#x\n"

>> +
>> +        fast_req_report(ct, fence);
>> +
>>           CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>>             return -EPROTO;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/
>> xe/xe_guc_ct_types.h
>> index 8e1b9d981d61..c6b89b757a76 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/interrupt.h>
>>   #include <linux/iosys-map.h>
>>   #include <linux/spinlock_types.h>
>> +#include <linux/stackdepot.h>
>>   #include <linux/wait.h>
>>   #include <linux/xarray.h>
>>   @@ -104,6 +105,18 @@ struct xe_dead_ct {
>>       /** snapshot_log: copy of GuC log at point of error */
>>       struct xe_guc_log_snapshot *snapshot_log;
>>   };
>> +
>> +/** struct xe_fast_req_fence - Used to track FAST_REQ messages to
>> match error responses */
>> +struct xe_fast_req_fence {

nit: name is little misleading

struct xe_fast_req_info ?
struct xe_fast_req_tracker ?
struct xe_fast_req_record ?

>> +    /** @fence: sequence number sent in H2G and return in G2H error */
>> +    u16 fence;

rest of the code uses "seqno"

>> +    /** @action: H2G action code */
>> +    u16 action;
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> +    /** @stack: call stack from when the H2G was sent */
>> +    depot_stack_handle_t stack;
>> +#endif
>> +};
> 
> nit: should this whole struct be wrapped in CONFIG_DRM_XE_DEBUG? Not
> sure if any code analyzer would be smart enough to mark it as unused if
> CONFIG_DRM_XE_DEBUG is not set.
> 
> Apart from the nits this looks good to me:
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Daniele
> 
>>   #endif
>>     /**
>> @@ -152,6 +165,8 @@ struct xe_guc_ct {
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>       /** @dead: information for debugging dead CTs */
>>       struct xe_dead_ct dead;
>> +    /** @fast_req: history of FAST_REQ messages for matching with G2H
>> error responses*/
>> +    struct xe_fast_req_fence fast_req[SZ_32];
>>   #endif
>>   };
>>   diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/
>> xe_guc_log.h
>> index 5b896f5fafaf..f1e2b0be90a9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -12,7 +12,7 @@
>>   struct drm_printer;
>>   struct xe_device;
>>   -#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>   #define CRASH_BUFFER_SIZE       SZ_1M
>>   #define DEBUG_BUFFER_SIZE       SZ_8M
>>   #define CAPTURE_BUFFER_SIZE     SZ_2M
> 

