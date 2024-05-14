Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6E9C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 21:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7410E5BE;
	Tue, 14 May 2024 21:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqCLHLfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824D310E5BE
 for <Intel-Xe@lists.freedesktop.org>; Tue, 14 May 2024 21:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715720744; x=1747256744;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=TJBVWFbPNPguw/TSef7zlxtXPZ77rI3wlhiCFyhotR8=;
 b=PqCLHLfIvhRBM7MhQjx3lZfd5/ErJkpAIwCYmLVtukFdZatFgl1tGq5P
 tbOY+BVrR8x3uhY8yYOy2S2XudOnjDbd/UVLVPFyFaQQnpwfLKiv7VD9E
 DeVKm5w1ohCdeDWO+RqK/QneWvquSaXLEzRXLqLpWFwFPEH/m1pxi9Bgu
 Ekkh4ISTr3Xk412jE0V5gOoD+LV8tW4oi07A6c60GlbbZfPcXXfTRIA29
 n7S5+4m7ljSZ4YYsLPmPBIbbqzzFweeJWKt2Fn07VZIU7/0tJ3KmwzEZs
 4F9itXJnxdr0kWpPsqd7/yHKfbAu+cDhxCQQeDdQevh7Lg1p1HEZHhswP w==;
X-CSE-ConnectionGUID: uIkOgMw/Soic4VSPCEAfDQ==
X-CSE-MsgGUID: TmWIvf7nRsi91514fAIeWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11524671"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11524671"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 14:05:43 -0700
X-CSE-ConnectionGUID: nzJR9qVfRZeuba7BVq0nzg==
X-CSE-MsgGUID: DStNNgHwQ4qSjg7IFkfEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35299428"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 14 May 2024 14:05:40 -0700
Received: from [10.245.82.128] (unknown [10.245.82.128])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A636428184;
 Tue, 14 May 2024 22:05:38 +0100 (IST)
Message-ID: <9000fac5-b49d-4c1b-b09f-f8b0a2cf60c8@intel.com>
Date: Tue, 14 May 2024 23:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: John Harrison <john.c.harrison@intel.com>, Intel-Xe@Lists.FreeDesktop.Org
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
 <b978eca4-d69f-4d67-b3f2-34ccfbd1b506@intel.com>
 <9da5ca75-58bb-485d-a0fa-909a5d31f8c7@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <9da5ca75-58bb-485d-a0fa-909a5d31f8c7@intel.com>
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



On 14.05.2024 20:31, John Harrison wrote:
> On 5/14/2024 09:01, Michal Wajdeczko wrote:
>> On 09.05.2024 00:49, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> There is a debug mechanism for dumping the GuC log as an ASCII hex
>>> stream via dmesg. This is extremely useful for situations where it is
>>> not possibe to query the log from debugfs (self tests, bugs that cause
>>> the driver to fail to load, system hangs, etc.). However, dumping via
>>> dmesg is not the most reliable. The dmesg buffer is limited in size,
>>> can be rate limited and a simple hex stream is hard to parse by tools.
>>>
>>> So add extra information to the dump to make it more robust and
>>> parsable. This includes adding start and end tags to delimit the dump,
>>> using longer lines to reduce the per line overhead, adding a rolling
>>> count to check for missing lines and interleaved concurrent dumps and
>>> adding other important information such as the GuC version number and
>>> timestamp offset.
>>>
>>> v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
>>> v3: Add firmware filename and 'wanted' version number.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
>>>   drivers/gpu/drm/xe/xe_guc_log.c       | 85 ++++++++++++++++++++++-----
>>>   2 files changed, 71 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> index 11682e675e0f..45fb3707fabe 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> @@ -82,6 +82,7 @@
>>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>>> +#define GUC_PMTIMESTAMP                XE_REG(0xc3e8)
>>>     #define GUC_SEND_INTERRUPT            XE_REG(0xc4c8)
>>>   #define   GUC_SEND_TRIGGER            REG_BIT(0)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>> index a37ee3419428..7e7e2fdc9a11 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -7,11 +7,19 @@
>>>     #include <drm/drm_managed.h>
>>>   +#include "regs/xe_guc_regs.h"
>>>   #include "xe_bo.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_map.h"
>>> +#include "xe_mmio.h"
>>>   #include "xe_module.h"
>>>   +static struct xe_guc *
>>> +log_to_guc(struct xe_guc_log *log)
>>> +{
>>> +    return container_of(log, struct xe_guc, log);
>>> +}
>>> +
>>>   static struct xe_gt *
>>>   log_to_gt(struct xe_guc_log *log)
>> as you have log_to_guc() then this log_to_gt() could be updated to:
>>
>>     return guc_to_gt(log_to_guc(log));
> Is there any point? The existing version works fine so why replace a
> single indirection with a double indirection?

compiler can inline that, but from our POV we will have single place
that must know exact placement of the .log member in our xe tree

> 
> 
>>
>>>   {
>>> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>>>           CAPTURE_BUFFER_SIZE;
>>>   }
>>>   +#define BYTES_PER_WORD        sizeof(u32)
>>> +#define WORDS_PER_DUMP        8
>>> +#define DUMPS_PER_LINE        4
>>> +#define LINES_PER_READ        4
>>> +#define WORDS_PER_READ        (WORDS_PER_DUMP * DUMPS_PER_LINE *
>>> LINES_PER_READ)
>>> +
>> as you are heavily updating this function, maybe it's good time to add
>> kernel-doc for it ?
> Good idea. Will do.
> 
>>
>>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>>   {
>>> +    static int g_count;
>>
>>> +    struct xe_gt *gt = log_to_gt(log);
>>> +    struct xe_guc *guc = log_to_guc(log);
>>> +    struct xe_uc_fw_version *ver_f =
>>> &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
>>> +    struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>>>       struct xe_device *xe = log_to_xe(log);
>>>       size_t size;
>>> -    int i, j;
>>> +    char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>>> +    int l_count = g_count++;
>>> +    int line = 0;
>>> +    int i, j, k;
>>> +    u64 ktime;
>>> +    u32 stamp;
>>>         xe_assert(xe, log->bo);
>>>         size = log->bo->size;
>>>   -#define DW_PER_READ        128
>>> -    xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>>> -    for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>>> -        u32 read[DW_PER_READ];
>>> -
>>> -        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>>> -                   DW_PER_READ * sizeof(u32));
>>> -#define DW_PER_PRINT        4
>>> -        for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>>> -            u32 *print = read + j * DW_PER_PRINT;
>>> -
>>> -            drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>>> -                   *(print + 0), *(print + 1),
>>> -                   *(print + 2), *(print + 3));
>>> +    drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>>> +           l_count, line++, __builtin_return_address(0));
>> this function is also used in debugfs outputs and prefixing all lines
>> with "[Capture/n.m]" is pointless there (and will also make collecting
>> GuC log over debugfs even more inefficient)
>>
>> and as you likely don't want to have separate print functions (one for
>> reliable dmesg, other for debugfs) then maybe consider use of cascaded
>> drm_printer as proposed in [1] - it will also make your code tidier
>>
>> [1] https://patchwork.freedesktop.org/series/133613/
> As already discussed, the intention was to keep this as simple as
> possible and not over engineer a stop gap measure. Yes, the debugfs
> version gets some extra overhead (but mitigated by using longer lines).

but OTOH exposing useless data over debugfs could be perceived as signs
of bad design and/or laziness, no?

> But size of the debugfs file is really not an issue, and it does provide
> extra robustness. 

hmm, are you suggesting that reading over debugfs is not robust and
requires extra protection? and it is xe driver specific issue?

> The prefix is also trivially easy to remove the prefix
> if desired with "cut -d ' ' -f 2' < in > out".

equally we can trivially avoid adding this prefix

> 
>>
>>> +
>>> +    drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted
>>> %u.%u.%u)\n",
>>> +           l_count, line++,
>>> +           ver_f->major, ver_f->minor, ver_f->patch,
>>> +           ver_w->major, ver_w->minor, ver_w->patch);
>> hmm, what's the relation between "wanted version" and actual "guc log
>> buffer format" ? IMO it doesn't really matter what driver wanted to
>> load, this supposed to be "GuC-log-print" so then only actually running
>> version matters as it implies schema version needed for proper decoding.
> It is not necessary but it is potentially useful information that can be
> added pretty much for free, so why not?

because this function (undocumented) is still named as xe_guc_log_print
and is located in xe_guc_log.c which strongly suggests that it is about
GuC log, not anything else from the GuC

if you need combo print function, place it in guc.c and name properly

> 
>>
>>> +    drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count,
>>> line++, guc->fw.path);
>> again, why do we want include firmware filename here? it's not relevant
>> to the log buffer content/format (as we already have 'found version')
> Actually, it is important. The filename gives the GuC platform. And that
> is required to know what quirks need to be applied when decoding the
> log. E.g. context switch logs on a TGL platform are truncated because
> the hardware has fewer bits for the context id. The decoder needs to
> know that to correctly track context switching.

then you should explicitly capture the platform name, as firmware file
name could be provided by the user as modparam xe.guc_firmware_path and
named anything like foo.bin

> 
>>
>> maybe more interesting thing would be status of the GuC firmware?
>> whether it is still running and writing logs or it is already dead
> Not sure how you would get that information? Unless the GuC is actually
> in reset for the duration of the dump, there is no way to know whether
> it is alive, actively logging, idle, or what.

we could start with capturing GUC_STATUS(0xc000)

but we can also assume that captured log snapshot is always incomplete
due to a living nature of the GuC firmware (so there is expected
mismatch between what we can find in header vs actual last log entry)

> 
>>
>>> +
>>> +    ktime = ktime_get_boottime_ns();
>>> +    drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX
>>> [%llu]\n",
>>> +           l_count, line++, ktime, ktime);
>>> +
>>> +    stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
>>> +    drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>>> +           l_count, line++, stamp, stamp);
>>> +
>>> +    drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>>> +           l_count, line++, gt->info.reference_clock);
>>> +
>>> +    xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
>>> +    for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>>> +        u32 read[WORDS_PER_READ];
>>> +
>>> +        xe_map_memcpy_from(xe, read, &log->bo->vmap, i *
>>> BYTES_PER_WORD,
>>> +                   WORDS_PER_READ * BYTES_PER_WORD);
>>> +
>>> +        for (j = 0; j < WORDS_PER_READ; ) {
>>> +            u32 done = 0;
>>> +
>>> +            for (k = 0; k < DUMPS_PER_LINE; k++) {
>>> +                line_buff[done++] = ' ';
>>> +                done += hex_dump_to_buffer(read + j,
>>> +                               sizeof(*read) * (WORDS_PER_READ - j),
>>> +                               WORDS_PER_DUMP * BYTES_PER_WORD,
>>> +                               BYTES_PER_WORD,
>>> +                               line_buff + done,
>>> +                               sizeof(line_buff) - done,
>>> +                               false);
>>> +                j += WORDS_PER_DUMP;
>>> +            }
>> as there could be many holes (zeros) in full GuC log, did you consider
>> to skip such lines and update custom parser to understand that?
> As per other response, in a real world live system, there won't be big
> chunks of zeros. And if you are specifically debugging a start of day
> issue then you can just use a smaller log size.
> 
> Rather than attempting to implement some kind of simple RLE, a real and
> significant benefit would be to re-use the compression mechanism we had
> in i915. That is a lot more effort, though. So that could be done as a
> follow up, but it is not worth holding up the current set of trivial
> fixes for some long term goal.
> 
>>
>>> +
>>> +            drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++,
>>> line_buff);
>>>           }
>>>       }
>>> +
>>> +    drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>>>   }
>> per BKM shouldn't we #undef not used any more local macros ?
> One could. It didn't seem necessary given that this is the end of the file.
> 
> John.
> 
>>
>>>     int xe_guc_log_init(struct xe_guc_log *log)
> 
