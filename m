Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E696C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 22:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B83010E26C;
	Wed, 19 Jun 2024 22:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC0p+RA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895C810E26C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718836112; x=1750372112;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nuOFRUkEc17QpBBLg34UfDecKajVMKBWJSlpyYQVEgw=;
 b=JC0p+RA0d2hVbbylx1uaZTLC/E1KVn9b0+hBb2QKb3euFb7HJjUXBElN
 EgxdMNiD010QJSsLiQZg6La0IrxuThU4TnvTVENvbf8EaT/UggvIEmiDu
 YvrYMI/pir/h4OAWQgBTZTG+D/uLLrUTe3SMVnIQRgnYBJKFiPRMsuzSO
 MLo+5WsRC09nQ6AMtACp8pPfQoUVQRcnPXzWhef3isgo3r0W4IlrXFJxT
 6ySqwMNkGrsEF3Wb5JgpVpxCFy+mBF6FTIBv/Q64M1O5nZRnqo2oK2Y47
 ytP9/i1M+QD4zZJCgli6vBjSW0KyQCi60wMjqRwgnfkCdKfvGzqZ/gtFO w==;
X-CSE-ConnectionGUID: aY7MFgM2RLG4bL2rDOhiiA==
X-CSE-MsgGUID: 8jRhIXQFT4a1qzEJ0j6DnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26912968"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="26912968"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 15:28:31 -0700
X-CSE-ConnectionGUID: 2nUQXvkBTqyBo8D/EE5mDg==
X-CSE-MsgGUID: iK4YSo5lQzmqCIqlPOARiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42708663"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 15:28:27 -0700
Received: from [10.246.25.139] (unknown [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 512E02FC55;
 Wed, 19 Jun 2024 23:28:25 +0100 (IST)
Message-ID: <32df3a98-ed81-4a07-aa7e-17abcc136aa8@intel.com>
Date: Thu, 20 Jun 2024 00:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] drm/xe/guc: Add capture size check in GuC log
 buffer
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org, 
 John Harrison <john.c.harrison@intel.com>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-4-zhanjun.dong@intel.com>
 <8c58b7df-6d4d-45ce-9b55-0d352e132148@intel.com>
 <39bf8731-fc40-4edc-a014-89841d5d5375@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <39bf8731-fc40-4edc-a014-89841d5d5375@intel.com>
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



On 19.06.2024 21:44, Dong, Zhanjun wrote:
> Please see my comments inline below.
> 
> Zhanjun
> 
> On 2024-06-14 8:13 a.m., Michal Wajdeczko wrote:
>>
>>
>> On 07.06.2024 02:07, Zhanjun Dong wrote:
>>> The capture-nodes is included in GuC log buffer, add the size check
>>> for capture region in the whole GuC log buffer.
>>> Add capture output size check before allocating the shared buffer.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_printk.h     |   3 +
>>>   drivers/gpu/drm/xe/xe_guc_capture.c   |  77 +++++++++++
>>>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  48 +++++++
>>>   drivers/gpu/drm/xe/xe_guc_log.c       | 179 ++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_guc_log.h       |  17 ++-
>>>   drivers/gpu/drm/xe/xe_guc_log_types.h |  24 ++++
>>>   6 files changed, 347 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h
>>> b/drivers/gpu/drm/xe/xe_gt_printk.h
>>> index c2b004d3f48e..107360edfcd6 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>>> @@ -22,6 +22,9 @@
>>>   #define xe_gt_notice(_gt, _fmt, ...) \
>>>       xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>>>   +#define xe_gt_notice_ratelimited(_gt, _fmt, ...) \
>>> +    xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
>>
>> you are mixing here 'notice' with 'err'
> Thanks for point out
> 
>>
>>> +
>>>   #define xe_gt_info(_gt, _fmt, ...) \
>>>       xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
>>>   diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
>>> b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> index 951408846c97..0c90def290de 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> @@ -21,6 +21,7 @@
>>>   #include "xe_gt_mcr.h"
>>>   #include "xe_gt_printk.h"
>>>   #include "xe_guc.h"
>>> +#include "xe_guc_ads.h"
>>>   #include "xe_guc_capture.h"
>>>   #include "xe_guc_capture_fwif.h"
>>>   #include "xe_guc_ct.h"
>>> @@ -491,6 +492,81 @@ xe_guc_capture_getnullheader(struct xe_guc *guc,
>>> void **outptr, size_t *size)
>>>       return 0;
>>>   }
>>>   +static int
>>> +guc_capture_output_size_est(struct xe_guc *guc)
>>> +{
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    struct xe_hw_engine *hwe;
>>> +    enum xe_hw_engine_id id;
>>> +
>>> +    int capture_size = 0;
>>> +    size_t tmp = 0;
>>> +
>>> +    if (!guc->capture)
>>> +        return -ENODEV;
>>> +
>>> +    /*
>>> +     * If every single engine-instance suffered a failure in quick
>>> succession but
>>> +     * were all unrelated, then a burst of multiple error-capture
>>> events would dump
>>> +     * registers for every one engine instance, one at a time. In
>>> this case, GuC
>>> +     * would even dump the global-registers repeatedly.
>>> +     *
>>> +     * For each engine instance, there would be 1 x
>>> guc_state_capture_group_t output
>>> +     * followed by 3 x guc_state_capture_t lists. The latter is how
>>> the register
>>> +     * dumps are split across different register types (where the
>>> '3' are global vs class
>>> +     * vs instance).
>>> +     */
>>> +    for_each_hw_engine(hwe, gt, id) {
>>> +        capture_size += sizeof(struct
>>> guc_state_capture_group_header_t) +
>>> +                     (3 * sizeof(struct guc_state_capture_header_t));
>>> +
>>> +        if (!guc_capture_getlistsize(guc, 0,
>>> GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp, true))
>>> +            capture_size += tmp;
>>> +
>>> +        if (!guc_capture_getlistsize(guc, 0,
>>> GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>>> +                         hwe->class, &tmp, true)) {
>>> +            capture_size += tmp;
>>> +        }
>>> +        if (!guc_capture_getlistsize(guc, 0,
>>> GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>>> +                         hwe->class, &tmp, true)) {
>>> +            capture_size += tmp;
>>> +        }
>>> +    }
>>> +
>>> +    return capture_size;
>>> +}
>>> +
>>> +/*
>>> + * Add on a 3x multiplier to allow for multiple back-to-back
>>> captures occurring
>>> + * before the Xe can read the data out and process it
>>> + */
>>> +#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
>>> +
>>> +static void check_guc_capture_size(struct xe_guc *guc)
>>> +{
>>> +    int capture_size = guc_capture_output_size_est(guc);
>>> +    int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>>> +    u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>>> +
>>> +    /*
>>> +     * NOTE: capture_size is much smaller than the capture region
>>> allocation (DG2: <80K vs 1MB)
>>> +     * Additionally, its based on space needed to fit all engines
>>> getting reset at once
>>> +     * within the same G2H handler task slot. This is very unlikely.
>>> However, if GuC really
>>> +     * does run out of space for whatever reason, we will see an
>>> separate warning message
>>> +     * when processing the G2H event capture-notification, search for:
>>> +     * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
>>> +     */
>>
>> please try to wrap comments at 80 (it's already multi line)
>>
>>> +    if (capture_size < 0)
>>> +        xe_gt_warn(guc_to_gt(guc), "Failed to calculate error state
>>> capture buffer minimum size: %d!\n",
>>> +               capture_size);> +    if (capture_size > buffer_size)
>>> +        xe_gt_warn(guc_to_gt(guc), "Error state capture buffer maybe
>>> small: %d < %d\n",
>>> +               buffer_size, capture_size);
>>
>> do we really need those both messages at warn level ?
> Will be changed to dbg level
> 
>>
>>> +    else if (spare_size > buffer_size)
>>> +        xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer lacks
>>> spare size: %d < %d (min = %d)\n",
>>> +              buffer_size, spare_size, capture_size);
>>> +}
>>> +
>>>   int xe_guc_capture_init(struct xe_guc *guc)
>>>   {
>>>       guc->capture = drmm_kzalloc(guc_to_drm(guc),
>>> sizeof(*guc->capture), GFP_KERNEL);
>>> @@ -499,5 +575,6 @@ int xe_guc_capture_init(struct xe_guc *guc)
>>>         guc->capture->reglists = guc_capture_get_device_reglist(guc);
>>>   +    check_guc_capture_size(guc);
>>>       return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> index 04b03c398191..908298791c93 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> @@ -250,6 +250,54 @@ struct guc_engine_usage {
>>>       struct guc_engine_usage_record
>>> engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>   } __packed;
>>>   +/* GuC logging structures */
>>> +
>>> +enum guc_log_buffer_type {
>>> +    GUC_DEBUG_LOG_BUFFER,
>>> +    GUC_CRASH_DUMP_LOG_BUFFER,
>>> +    GUC_CAPTURE_LOG_BUFFER,
>>> +    GUC_MAX_LOG_BUFFER
>>
>> this last enumerator is not real buffer type, so better at least name it
>> in a different way (at least add __ prefix?
>>
>> or best, since it looks like ABI definitions, just move it out of the
>> enum to benefit from compiler checks that John prefers:
>>
>> enum guc_log_buffer_type {
>>     GUC_LOG_BUFFER_DEBUG        = 0,
>>     GUC_LOG_BUFFER_CRASH_DUMP    = 1,
>>     GUC_LOG_BUFFER_CAPTURE_LOG    = 2,
>> };
>> #define NUM_GUC_LOG_BUFFER_TYPES    3
>>
> Will changed to:
> /* GuC logging structures */
> enum guc_log_buffer_type {
>     GUC_DEBUG_LOG_BUFFER,
>     GUC_CRASH_DUMP_LOG_BUFFER,
>     GUC_CAPTURE_LOG_BUFFER,
> 
>     GUC_LOG_BUFFER_TYPE_MAX
> };
> The empty line speprate real type vs MAX

empty line is not enough to let the compiler see the difference between
real _type_ and _max_ definition

> I would prefer to stay within the enum, which make add new type easier,
> the MAX will be updated by compiler automatically, no need to manually
> add 1 to NUM_xxx macro.

but this is (or should be) a stable ABI so we shouldn't rely on the
compiler to automatically making any changes to any of these defs.

and as of today we have exactly 3 types defined as:

    GUC_LOG_BUFFER_DEBUG        = 0,
    GUC_LOG_BUFFER_CRASH_DUMP    = 1,
    GUC_LOG_BUFFER_CAPTURE_LOG    = 2,

so if you want to use enum to get some help from the compiler, like to
check that in your implementation you are not using bad types, then
there should be no other enumerators in this enum, as otherwise you kill
that feature

also note that your approach will not work if for some reason the new
type will be defined as something different than 3, like:

    GUC_LOG_BUFFER_FUTURE    = 345

so while will have 4 TYPES, your automatic MAX will be 346, making it
almost useless

> 
>>> +};
>>> +
>>> +/*
>>> + * struct guc_log_buffer_state - GuC log buffer state
>>
>> this is not a kernel-doc format, intentional or typo ?
>>
>>> + *
>>> + * Below state structure is used for coordination of retrieval of
>>> GuC firmware
>>> + * logs. Separate state is maintained for each log buffer type.
>>> + * read_ptr points to the location where Xe read last in log buffer and
>>> + * is read only for GuC firmware. write_ptr is incremented by GuC
>>> with number
>>> + * of bytes written for each log entry and is read only for Xe.
>>> + * When any type of log buffer becomes half full, GuC sends a flush
>>> interrupt.
>>> + * GuC firmware expects that while it is writing to 2nd half of the
>>> buffer,
>>> + * first half would get consumed by Host and then get a flush completed
>>> + * acknowledgment from Host, so that it does not end up doing any
>>> overwrite
>>> + * causing loss of logs. So when buffer gets half filled & Xe has
>>> requested
>>> + * for interrupt, GuC will set flush_to_file field, set the
>>> sampled_write_ptr
>>> + * to the value of write_ptr and raise the interrupt.
>>> + * On receiving the interrupt Xe should read the buffer, clear
>>> flush_to_file
>>> + * field and also update read_ptr with the value of
>>> sample_write_ptr, before
>>> + * sending an acknowledgment to GuC. marker & version fields are for
>>> internal
>>> + * usage of GuC and opaque to Xe. buffer_full_cnt field is
>>> incremented every
>>> + * time GuC detects the log buffer overflow.
>>> + */
>>> +struct guc_log_buffer_state {
>>> +    u32 marker[2];
>>> +    u32 read_ptr;
>>> +    u32 write_ptr;
>>> +    u32 size;
>>> +    u32 sampled_write_ptr;
>>> +    u32 wrap_offset;
>>> +    union {
>>> +        struct {
>>> +            u32 flush_to_file:1;
>>> +            u32 buffer_full_cnt:4;
>>> +            u32 reserved:27;
>>> +        };
>>> +        u32 flags;
>>> +    };
>>> +    u32 version;
>>> +} __packed;
>>
>> this looks like a pure GuC ABI definition, maybe it deserves to be
>> placed in separate xe/abi/guc_log_abi.h file ?
> ok, to be moved to _abi
> 
>>
>>> +
>>>   /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>>   enum xe_guc_recv_message {
>>>       XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>> index a37ee3419428..c97fc4d57168 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -9,9 +9,30 @@
>>>     #include "xe_bo.h"
>>>   #include "xe_gt.h"
>>> +#include "xe_gt_printk.h"
>>>   #include "xe_map.h"
>>>   #include "xe_module.h"
>>>   +#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>>> +                 __stringify(x), (long)(x))
>>
>> i915'ish is forbidden in Xe
>>
>> you should be able to use xe_[gt_]assert() instead
> will do
> 
>>
>>> +
>>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE    CRASH_BUFFER_SIZE
>>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE    DEBUG_BUFFER_SIZE
>>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    CAPTURE_BUFFER_SIZE
>>> +
>>> +struct guc_log_section {
>>> +    u32 max;
>>> +    u32 flag;
>>> +    u32 default_val;
>>> +    const char *name;
>>> +};
>>> +
>>> +static struct xe_gt *
>>> +guc_to_gt(struct xe_guc *guc)
>>
>> don't duplicate the code, this is already defined in xe_guc.h
>>
>>> +{
>>> +    return container_of(guc, struct xe_gt, uc.guc);
>>> +}
>>> +
>>>   static struct xe_gt *
>>>   log_to_gt(struct xe_guc_log *log)
>>>   {
>>> @@ -96,3 +117,161 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>>         return 0;
>>>   }
>>> +
>>> +static void _guc_log_init_sizes(struct xe_guc_log *log)
>>> +{
>>> +    struct xe_guc *guc = log_to_guc(log);
>>> +    static const struct guc_log_section
>>> sections[GUC_LOG_SECTIONS_LIMIT] = {
>>> +        {
>>> +            GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
>>> +            GUC_LOG_LOG_ALLOC_UNITS,
>>> +            GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
>>> +            "crash dump"
>>> +        },
>>> +        {
>>> +            GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
>>> +            GUC_LOG_LOG_ALLOC_UNITS,
>>> +            GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
>>> +            "debug",
>>> +        },
>>> +        {
>>> +            GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
>>> +            GUC_LOG_CAPTURE_ALLOC_UNITS,
>>> +            GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
>>> +            "capture",
>>> +        }
>>> +    };
>>> +    int i;
>>> +
>>> +    for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
>>> +        log->sizes[i].bytes = sections[i].default_val;
>>> +
>>> +    /* If debug size > 1MB then bump default crash size to keep the
>>> same units */
>>> +    if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
>>> +        GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
>>> +        log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
>>> +
>>> +    /* Prepare the GuC API structure fields: */
>>> +    for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++) {
>>> +        /* Convert to correct units */
>>> +        if ((log->sizes[i].bytes % SZ_1M) == 0) {
>>> +            log->sizes[i].units = SZ_1M;
>>> +            log->sizes[i].flag = sections[i].flag;
>>> +        } else {
>>> +            log->sizes[i].units = SZ_4K;
>>> +            log->sizes[i].flag = 0;
>>> +        }
>>> +
>>> +        if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
>>> +            xe_gt_err(guc_to_gt(guc), "Mis-aligned log %s size: 0x%X
>>> vs 0x%X!\n",
>>> +                  sections[i].name, log->sizes[i].bytes,
>>> log->sizes[i].units);
>>
>> this 'mis-alignment' issue seems to be due to our coding fault so we
>> should use xe_gt_assert() to catch that
> good idea, will do xe_gt_assert_msg to have more info
> 
>>
>>> +        log->sizes[i].count = log->sizes[i].bytes /
>>> log->sizes[i].units;
>>> +
>>> +        if (!log->sizes[i].count) {
>>> +            xe_gt_err(guc_to_gt(guc), "Zero log %s size!\n",
>>> sections[i].name);
>>> +        } else {
>>> +            /* Size is +1 unit */
>>> +            log->sizes[i].count--;
>>> +        }
>>> +
>>> +        /* Clip to field size */
>>> +        if (log->sizes[i].count > sections[i].max) {
>>> +            xe_gt_err(guc_to_gt(guc), "log %s size too large: %d vs
>>> %d!\n",
>>> +                  sections[i].name, log->sizes[i].count + 1,
>>> sections[i].max + 1);
>>> +            log->sizes[i].count = sections[i].max;
>>> +        }
>>> +    }
>>> +
>>> +    if (log->sizes[GUC_LOG_SECTIONS_CRASH].units !=
>>> log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
>>> +        xe_gt_err(guc_to_gt(guc), "Unit mismatch for crash and debug
>>> sections: %d vs %d!\n",
>>> +              log->sizes[GUC_LOG_SECTIONS_CRASH].units,
>>> +              log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>>> +        log->sizes[GUC_LOG_SECTIONS_CRASH].units =
>>> log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
>>> +        log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
>>> +    }
>>> +
>>> +    log->sizes_initialised = true;
>>> +}
>>> +
>>> +static void guc_log_init_sizes(struct xe_guc_log *log)
>>> +{
>>> +    if (log->sizes_initialised)
>>> +        return;
>>> +
>>> +    _guc_log_init_sizes(log);
>>> +}
>>> +
>>> +static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>>> +{
>>> +    guc_log_init_sizes(log);
>>> +
>>> +    return log->sizes[GUC_LOG_SECTIONS_CRASH].bytes;
>>> +}
>>> +
>>> +static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>>> +{
>>> +    guc_log_init_sizes(log);
>>> +
>>> +    return log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes;
>>> +}
>>> +
>>
>> add kernel-doc for public functions
>>
>>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>>> +{
>>> +    guc_log_init_sizes(log);
>>> +
>>> +    return log->sizes[GUC_LOG_SECTIONS_CAPTURE].bytes;
>>> +}
>>> +
>>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum
>>> guc_log_buffer_type type,
>>> +                   unsigned int full_cnt)
>>> +{
>>> +    unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
>>> +    bool overflow = false;
>>> +
>>> +    if (full_cnt != prev_full_cnt) {
>>> +        overflow = true;
>>> +
>>> +        log->stats[type].overflow = full_cnt;
>>> +        log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
>>> +
>>> +        if (full_cnt < prev_full_cnt) {
>>> +            /* buffer_full_cnt is a 4 bit counter */
>>> +            log->stats[type].sampled_overflow += 16;
>>> +        }
>>> +        xe_gt_notice_ratelimited(log_to_gt(log), "log buffer
>>> overflow\n");
>>> +    }
>>> +
>>> +    return overflow;
>>> +}
>>> +
>>> +unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
>>> +                    enum guc_log_buffer_type type)
>>> +{
>>> +    switch (type) {
>>> +    case GUC_DEBUG_LOG_BUFFER:
>>> +        return xe_guc_log_section_size_debug(log);
>>> +    case GUC_CRASH_DUMP_LOG_BUFFER:
>>> +        return xe_guc_log_section_size_crash(log);
>>> +    case GUC_CAPTURE_LOG_BUFFER:
>>> +        return xe_guc_log_section_size_capture(log);
>>> +    default:
>>> +        MISSING_CASE(type);
>>
>> there should be no need for 'default' case if you properly define your
>> enum type
> Compiler could check static error, while 'default' here can cover
> run-time errors. I would prefer to have it for public funcitons.

but this is still driver only function, called only from your code,
where you should be using only valid enumerators, so no need for any
random runtime protection (unless you already abuse this function by
using random integers as params)


>>
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
>>> +                    enum guc_log_buffer_type type)
>>> +{
>>> +    enum guc_log_buffer_type i;
>>> +    size_t offset = PAGE_SIZE;/* for the log_buffer_states */
>>> +
>>> +    for (i = GUC_DEBUG_LOG_BUFFER; i < GUC_MAX_LOG_BUFFER; ++i) {
>>> +        if (i == type)
>>> +            break;
>>> +        offset += xe_guc_get_log_buffer_size(log, i);
>>> +    }
>>> +
>>> +    return offset;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h
>>> b/drivers/gpu/drm/xe/xe_guc_log.h
>>> index 2d25ab28b4b3..de55de4052ca 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>> @@ -7,6 +7,7 @@
>>>   #define _XE_GUC_LOG_H_
>>>     #include "xe_guc_log_types.h"
>>> +#include "xe_guc_types.h"
>>>     struct drm_printer;
>>>   @@ -17,7 +18,7 @@ struct drm_printer;
>>>   #else
>>>   #define CRASH_BUFFER_SIZE    SZ_8K
>>>   #define DEBUG_BUFFER_SIZE    SZ_64K
>>> -#define CAPTURE_BUFFER_SIZE    SZ_16K
>>> +#define CAPTURE_BUFFER_SIZE    SZ_1M
>>>   #endif
>>>   /*
>>>    * While we're using plain log level in i915, GuC controls are much
>>> more...
>>> @@ -36,6 +37,11 @@ struct drm_printer;
>>>   #define GUC_VERBOSITY_TO_LOG_LEVEL(x)    ((x) + 2)
>>>   #define GUC_LOG_LEVEL_MAX
>>> GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
>>>   +static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
>>> +{
>>> +    return container_of(log, struct xe_guc, log);
>>> +}
>>> +
>>>   int xe_guc_log_init(struct xe_guc_log *log);
>>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>>>   @@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>>       return log->level;
>>>   }
>>>   +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>>> +
>>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>>> +                   enum guc_log_buffer_type type,
>>> +                   unsigned int full_cnt);
>>> +unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
>>> +                    enum guc_log_buffer_type type);
>>> +size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
>>> +                    enum guc_log_buffer_type type);
>>
>> missing space ?
>>
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h
>>> b/drivers/gpu/drm/xe/xe_guc_log_types.h
>>> index 125080d138a7..3d4bf2a73102 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>>> @@ -7,6 +7,14 @@
>>>   #define _XE_GUC_LOG_TYPES_H_
>>>     #include <linux/types.h>
>>> +#include "xe_guc_fwif.h"
>>> +
>>> +enum {
>>> +    GUC_LOG_SECTIONS_CRASH,
>>> +    GUC_LOG_SECTIONS_DEBUG,
>>> +    GUC_LOG_SECTIONS_CAPTURE,
>>> +    GUC_LOG_SECTIONS_LIMIT
>>> +};
>>
>> what's the relation with enum guc_log_buffer_type  ?
>> seems to be identical
> Right, also crash/debug is reversed to enum guc_log_buffer_type, but it
> is identical, will be removed.
> 
>>
>>>     struct xe_bo;
>>>   @@ -18,6 +26,22 @@ struct xe_guc_log {
>>>       u32 level;
>>>       /** @bo: XE BO for GuC log */
>>>       struct xe_bo *bo;
>>> +
>>> +    /* Allocation settings */
>>> +    struct {
>>> +        s32 bytes;    /* Size in bytes */
>>> +        s32 units;    /* GuC API units - 1MB or 4KB */
>>> +        s32 count;    /* Number of API units */
>>
>> why signed ?
> Oh, all s32 here could be u32
> 
>>
>>> +        u32 flag;    /* GuC API units flag */
>>> +    } sizes[GUC_LOG_SECTIONS_LIMIT];
>>> +    bool sizes_initialised;
>>> +
>>> +    /* logging related stats */
>>> +    struct {
>>> +        u32 sampled_overflow;
>>> +        u32 overflow;
>>> +        u32 flush;
>>> +    } stats[GUC_MAX_LOG_BUFFER];
>>>   };
>>>     #endif
