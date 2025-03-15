Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547CEC28B28
	for <intel-xe@archiver.kernel.org>; Sat, 15 Mar 2025 12:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1915010E290;
	Sat, 15 Mar 2025 12:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFuxzBzW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ED310E290
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Mar 2025 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742043581; x=1773579581;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lKweKmt6I0P6VCcndn4i9mM5mNA8DHh8+D0xyiwpAzA=;
 b=iFuxzBzWUbEi5rFdhfLXeET6luyc+KcPcVaTJv3eI3DLOCIf5WcjMJRY
 fDl6BkkrMqITkapN4Fk2YeoEW7DKfDXFfgBv04ERxzF9Ux75JrfvvAZyM
 /X1fOB8YvV7fngV9p5N/JBJCKZdNStnKJiqsomUxn+VzZxG2DFN0PDnba
 fV/4TFBK5KZbIik7M3eA5gqKt6lZv0VH6Itpa4aVNPjEAcTzL2bJLL+LK
 E0wdvTSW4K+YEfsXGn+azhVt+4G03tW3jbe7e1TVynVhUSst7+Re36HPz
 nRiURfwTHz1gyv7LnFkU7J7F4M/DKEI7XfC2DAKngGhA8wGNKhmvsANz4 Q==;
X-CSE-ConnectionGUID: 8RX0d9P/T8aUpZzSgC2xpg==
X-CSE-MsgGUID: r9WrTSEJQ7aqtHiWWueiLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="65650328"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; d="scan'208";a="65650328"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2025 05:59:41 -0700
X-CSE-ConnectionGUID: zMF4v4mnSHeyOChssryk/w==
X-CSE-MsgGUID: U+DzTKfGSLuubR0po7bR0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; d="scan'208";a="158674943"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 15 Mar 2025 05:59:39 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EB09134315;
 Sat, 15 Mar 2025 12:59:36 +0000 (GMT)
Message-ID: <bbdffe55-a658-43be-b46a-5f1c9846daeb@intel.com>
Date: Sat, 15 Mar 2025 13:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: "Lis, Tomasz" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
 <20250306222126.3382322-4-tomasz.lis@intel.com>
 <667cbea4-3891-45e3-be19-f3a0cafa0ff1@intel.com>
 <d0597e0f-7222-4d4c-8982-380ecfc69451@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d0597e0f-7222-4d4c-8982-380ecfc69451@intel.com>
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



On 14.03.2025 23:11, Lis, Tomasz wrote:
> 
> On 14.03.2025 21:46, Michal Wajdeczko wrote:
>>
>> On 06.03.2025 23:21, Tomasz Lis wrote:
>>> During post-migration recovery of a VF, it is necessary to update
>>> GGTT references included in messages which are going to be sent
>>> to GuC. GuC will start consuming messages after VF KMD will inform
>>> it about fixups being done; before that, the VF KMD is expected
>>> to update any H2G messages which are already in send buffer but
>>> were not consumed by GuC.
>>>
>>> Only a small subset of messages allowed for VFs have GGTT references
>>> in them. This patch adds the functionality to parse the CTB send
>>> ring buffer and shift addresses contained within.
>>>
>>> While fixing the CTB content, ct->lock is not taken. This means
>>> the only barrier taken remains GGTT address lock - which is ok,
>>> because only requests with GGTT addresses matter, but it also means
>>> tail changes can happen during the CTB fixups execution (which may
>>> be ignored as any new messages will not have anything to fix).
>>>
>>> The GGTT address locking will be introduced in a future series.
>>>
>>> v2: removed storing shift as that's now done in VMA nodes patch;
>>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>>> v3: Removed inline keywords, enums for offsets in CTB messages,
>>>   less error messages, if return unused then made functs void (Michal)
>>> v4: Update the cached head before starting fixups
>>>
>>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |   7 ++
>>>   drivers/gpu/drm/xe/xe_guc_ct.c           | 147 +++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_guc_ct.h           |   2 +
>>>   drivers/gpu/drm/xe/xe_guc_submit.c       |   4 +
>>>   drivers/gpu/drm/xe/xe_sriov_vf.c         |  18 +++
>>>   5 files changed, 178 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/
>>> drm/xe/abi/guc_actions_abi.h
>>> index ec516e838ee8..dde6cb5a6be9 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>> @@ -160,6 +160,13 @@ enum xe_guc_preempt_options {
>>>       XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>>>   };
>>>   +enum xe_guc_register_context_multi_lrc_param_offsets {
>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
>>> +    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
>>> +};
>>> +
>>>   enum xe_guc_report_status {
>>>       XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>>>       XE_GUC_REPORT_STATUS_ACKED = 0x1,
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/
>>> xe_guc_ct.c
>>> index 72ad576fc18e..6f19bf9565ba 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>>       bool done;
>>>   };
>>>   +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>>> +
>>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32
>>> *response_buffer)
>>>   {
>>>       g2h_fence->response_buffer = response_buffer;
>>> @@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct
>>> work_struct *w)
>>>       receive_g2h(ct);
>>>   }
>>>   +static u32 ctb_read32(struct xe_device *xe, struct iosys_map *cmds,
>> maybe to make this function more "ctb", pass ctb instead xe?
> You mean `struct xe_guc_ct *ct`?
> 
> I don't understand, why would we do this? We don't even need `ct` there.

if it doesn't need 'ct' then don't use 'ctb' prefix

> That would just add another `ct_to_xe(ct)`.

maybe not another, but just moved, as then the caller doesn't need to
have it

> 
> If we're adjusting parameters to what looks nicer rather than what is

it's not always just about the look, but it's about proper layering

> really necessary, then why `xe_map_memcpy_from` accepts `xe` and not a
> `bo`?

feel free to ask authors, this was introduced (without review) as part
of the initial Xe commit dd08ebf6c352

> 
>>
>>> +                 u32 head, u32 pos)
>>> +{
>>> +    u32 msg[1];
>>> +
>>> +    xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>>> +               1 * sizeof(u32));
>>> +    return msg[0];
>> and looks almost like our deprecated xe_map_read32 ;)
> yes, it does look similar. But I assume we don't want to reuse that?

well, it depends.

since it is already there, IMO we should use it.

OTOH, during some other review it was said that maybe the whole xe_map
layer will go away, so then no need to use it, but equally, no need to
use _any_ of other xe_map wrappers, so need for having a xe is also gone

but as there are no signs that xe_map will be removed, we should
continue to reuse existing code

unless @Lucas has some more recent news

>>
>>> +}
>>> +
>>> +static void ctb_fixup64(struct xe_device *xe, struct iosys_map *cmds,
>>> +                   u32 head, u32 pos, s64 shift)
>>> +{
>>> +    u32 msg[2];
>>> +    u64 offset;
>>> +
>>> +    xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>>> +               2 * sizeof(u32));
>>> +    offset = make_u64(msg[1], msg[0]);
>>> +    offset += shift;
>>> +    msg[0] = lower_32_bits(offset);
>>> +    msg[1] = upper_32_bits(offset);
>>> +    xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 *
>>> sizeof(u32));
>>> +}
>>> +
>>> +/*
>>> + * ct_update_addresses_in_message - Shift any GGTT addresses within
>> nit: as this is *not* a real kernel-doc, then maybe drop function name
>> and keep only description plus params?
> 
> will do, even though I don't know why we break the sibling rules which
> could be easily kept.
> 
>>
>>> + * a single message left within CTB from before post-migration
>>> recovery.
>>> + * @ct: pointer to CT struct of the target GuC
>>> + * @cmds: iomap buffer containing CT messages
>>> + * @head: start of the target message within the buffer
>>> + * @len: length of the target message
>>> + * @size: size of the commands buffer
>>> + * @shift: the address shift to be added to each GGTT reference
>>> + */
>>> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
>>> +                       struct iosys_map *cmds, u32 head,
>>> +                       u32 len, u32 size, s64 shift)
>>> +{
>>> +    struct xe_device *xe = ct_to_xe(ct);
>>> +    u32 action, i, n;
>>> +    u32 msg[1];
>>> +
>>> +    xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
>>> +               1 * sizeof(u32));
>> ctb_read32() didn't work here?
> 
> It would. For G2H and H2G messages we always use FIELD_GET on an array,
> and field name contains index in that array.

hmm, not sure if I follow here... what was wrong with:

	msg = ctb_read32(...)
or
	msg = xe_map_read32(...)

you could still use FIELD_GET from the 'msg' var

> 
> So, I consider this way of writing it more standard within Xe, and
> therefore easier to understand. Though no strong opinion - let me know
> if you want this changed.

but then you are little inconsistent, you defined new helper but then
decided to access data without it

> 
>>
>>> +    action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>>> +    switch (action) {
>>> +    case XE_GUC_ACTION_REGISTER_CONTEXT:
>>> +    case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>>> +        /* field wq_desc */
>> as we have enums that describe field offsets, we don't need to add those
>> small now redundant comments
> will remove.
>>
>>> +        ctb_fixup64(xe, cmds, head,
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
>>> +        /* field wq_base */
>>> +        ctb_fixup64(xe, cmds, head,
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
>>> +        if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
>>> +            /* field number_children */
>>> +            n = ctb_read32(xe, cmds, head,
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>>> +            /* field hwlrca and child lrcas */
>>> +            for (i = 0; i < n; i++)
>>> +                ctb_fixup64(xe, cmds, head,
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA + 2 * i, shift);
>> did you run checkpatch.pl ? line is quite long
> it does complain. Will fix.
>>
>>> +        } else {
>>> +            /* field hwlrca */
>>> +            ctb_fixup64(xe, cmds, head, 10, shift);
>>> +        }
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +}
>>> +
>> nit: no short description here ;)
> why would it need one? sub-function (ct_update_addresses_in_message) has
> documentation, caller also has documentation.

well, it was just inconsistency, in other places you seems to add
documentation even if there is no

>>
>>> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
>>> +                     struct guc_ctb *h2g,
>>> +                     s64 shift, u32 *mhead, s32 avail)
>>> +{
>>> +    struct xe_device *xe = ct_to_xe(ct);
>>> +    u32 head = *mhead;
>>> +    u32 size = h2g->info.size;
>>> +    u32 msg[1];
>>> +    u32 len;
>>> +
>>> +    /* Read header */
>>> +    xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
>>> +               sizeof(u32));
>> ctb_read32() didn't work here?
> Like before, for consistency. Will change on request.
>>
>>> +    len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) +
>>> GUC_CTB_MSG_MIN_LEN;
>>> +
>>> +    if (unlikely(len > (u32)avail)) {
>>> +        struct xe_gt *gt = ct_to_gt(ct);

btw, no need to have local var here, since you can do ct_to_gt()
directly in the xe_gt_err() below (it's the only use case)

>>> +
>>> +        xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d,
>>> fixups skipped\n",
>>> +              avail, len);
>>> +        return 0;
>> in caller we do mark ctb as broken, why are we silent here?
> 
> Incorrect head/tail of a CTB is an issue of completely different caliber
> than a message with invalid length.

not sure if those errors are that different.
see CTB descriptor status codes:

	GUC_CTB_STATUS_OVERFLOW
	GUC_CTB_STATUS_UNDERFLOW

which are used exactly to classify those kind of errors

if we are able to read msg header from the CTB but there is no payload
data on CTB then it's a CTB protocol bug

> 
> The invalid message is actually more likely to be a racing condition
> rather than CTB damage.

racing with what?

> 
>>> +    }
>>> +
>>> +    head = (head + 1) % size;
>>> +    ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1,
>>> size, shift);
>>> +    *mhead = (head + len - 1) % size;
>>> +
>>> +    return avail - len;
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB
>>> messages by updating
>>> + * GGTT offsets in their payloads.
>>> + * @ct: pointer to CT struct of the target GuC
>>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>>> + */
>>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64
>>> ggtt_shift)
>>> +{
>>> +    struct xe_guc *guc = ct_to_guc(ct);
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    struct guc_ctb *h2g = &ct->ctbs.h2g;
>>> +    u32 head, tail, size;
>>> +    s32 avail;
>>> +
>>> +    if (unlikely(h2g->info.broken))
>>> +        return;
>>> +
>>> +    h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>>> +    head = h2g->info.head;
>>> +    tail = READ_ONCE(h2g->info.tail);
>>> +    size = h2g->info.size;
>>> +
>>> +    xe_gt_assert(gt, head <= size);
>> we shouldn't trust GuC, assert is not enough
>> goto corrupted; if this happens
> ok.
>>
>>> +
>>> +    if (unlikely(tail >= size))
>>> +        goto corrupted;
>>> +
>>> +    avail = tail - head;
>>> +
>>> +    /* beware of buffer wrap case */
>>> +    if (unlikely(avail < 0))
>>> +        avail += size;
>>> +    xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail,
>>> size);
>>> +    xe_gt_assert(gt, avail >= 0);
>>> +
>>> +    while (avail > 0)
>>> +        avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift,
>>> &head, avail);
>> maybe pass &avail like you did with head?
> do we have a precedence for this approach being preferred?

I'm not sure what you are looking for..

my point is that it looks inconsistent that one in/out param is passed
by pointer, the other by value and then it's new value is returned

if you pass both by ptr then you can use return value to indicate some
error condition (which seems to be already there but silenced by
returning 'no-avail')

>>
>>> +
>>> +    return;
>>> +
>>> +corrupted:
>>> +    xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u\n",
>> shouldn't we mention that "fixups can't be done" ?
> Makes sense, the messages will be still received by GuC after all. Will
> change.
>>
>>> +         head, tail, size);
>>> +    h2g->info.broken = true;
>> returning an error code wouldn't really hurt ...
> 
> Since when do we return error codes which are not going to be used?
> Didn't you asked for a change to `void` in previous round of the review?

if code can fail and caller might make some decision based on the
success/failure then IMO we should return error code

if the code can't fail, then it should be void

but right now I just can't judge which scenarios that you implemented
could fail just because of our coding mistakes, where asserts() would be
sufficient to cover them, vs real scenarios that we should treat as
serious recovery failures

> 
>> +    for_each_gt(gt, xe, id) {
>> +        struct xe_gt_sriov_vf_selfconfig *config = &gt-
>> >sriov.vf.self_config;
>> +
>> +        xe_guc_ct_update_addresses(&gt->uc.guc.ct, config->ggtt_shift);
> 
>> this function returns int, shouldn't we check for errors?
>> if not then maybe make it void
> 
>>
>>> +}
>>> +
>>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct
>>> xe_guc_ct *ct, bool atomic,
>>>                               bool want_ctb)
>>>   {
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/
>>> xe_guc_ct.h
>>> index 82c4ae458dda..5649bda82823 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct
>>> xe_guc_ct_snapshot *snapshot, struct drm_pr
>>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p,
>>> bool want_ctb);
>>>   +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64
>>> ggtt_shift);
>>> +
>>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>>   {
>>>       return ct->state == XE_GUC_CT_STATE_ENABLED;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/
>>> xe_guc_submit.c
>>> index b95934055f72..4442fb00d0aa 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct
>>> xe_guc *guc,
>>>       action[len++] = info->context_idx;
>>>       action[len++] = info->engine_class;
>>>       action[len++] = info->engine_submit_mask;
>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
>>>       action[len++] = info->wq_desc_lo;
>>>       action[len++] = info->wq_desc_hi;
>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
>>>       action[len++] = info->wq_base_lo;
>>>       action[len++] = info->wq_base_hi;
>>>       action[len++] = info->wq_size;
>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>>>       action[len++] = q->width;
>>> +    xe_gt_assert(guc_to_gt(guc), len ==
>>> XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
>>>       action[len++] = info->hwlrca_lo;
>>>       action[len++] = info->hwlrca_hi;
>> nit: maybe this chunk, together with introduction of above enums, should
>> be a separate patch?
> Ok, can do that. It was introduced on your request, after all.

but I didn't say it has to be all done in single patch

if some changes are logically independent they deserve a separate patch

this is also to help getting reviews sooner as patches will be smaller

[1]
https://docs.kernel.org/process/submitting-patches.html#separate-your-changes

>>
>>>   diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/
>>> xe_sriov_vf.c
>>> index 4ee8fc70a744..cd759579b9b4 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> @@ -10,6 +10,7 @@
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_sriov_printk.h"
>>>   #include "xe_gt_sriov_vf.h"
>>> +#include "xe_guc_ct.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_sriov.h"
>>>   #include "xe_sriov_printk.h"
>>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct
>>> xe_device *xe)
>>>       return ret;
>>>   }
>>>   +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>>> +{
>>> +    struct xe_gt *gt;
>>> +    unsigned int id;
>>> +
>>> +    xe_assert(xe, IS_SRIOV_VF(xe));
>>> +
>>> +    for_each_gt(gt, xe, id) {
>>> +        struct xe_gt_sriov_vf_selfconfig *config = &gt-
>>> >sriov.vf.self_config;
>> instead of open coding just add a helper to query the ggtt_shift
>>
>>     s64 xe_gt_sriov_vf_ggtt_shift(gt) { }
> This is already a small function so I can't say I see the point. But
> sure, can do that.

the point is that in the 'xe' level function you are directly accessing
a VF internal field stored deep under 'gt.sriov.vf.self_config' structure

>>
>>> +
>>> +        xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, config-
>>> >ggtt_shift);
>>> +    }
>>> +}
>>> +
>>>   /*
>>>    * vf_post_migration_imminent - Check if post-restore recovery is
>>> coming.
>>>    * @xe: the &xe_device struct instance
>>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct
>>> xe_device *xe)
>>>         err = vf_post_migration_fixup_ggtt_nodes(xe);
>>>       /* FIXME: add the recovery steps */
>>> +    if (err != ENODATA)
>>> +        vf_post_migration_fixup_ctb(xe);
>>> +
>> do we need to have for_each_gt inside every step?
>> maybe the loop should be here?
>>
>> for_each_tile() {
>>     shift = vf_reset_ggtt_shift(tile->primary_gt)
>>     if (shift) {
>>         vf_fixup_nodes(tile)
>>         vf_fixup_ctb(tile->primary_gt)
>>         if (tile->media_gt)
>>             vf_fixup_ctb(tile->media_gt)
>>     }
>> }
> 
> What is the benefit? Doesn't the current code look cleaner?

IMO current code access self_config.ggtt_shift from too many places

> 
> Isn't it better when all drm_mm nodes are fixed at the point we start
> applying fixups to other places?

hmm, ok, so do we expect that there could be cross-tile references to
the other tile GGTT? if yes, do we have at least asserts that can
confirm that we are not doing fixups on the tile with un-shifted ggtt nodes?

> 
> I don't think it's a good idea.
> 
> -Tomasz
> 
>>
>>
>>>       vf_post_migration_notify_resfix_done(xe);
>>>       xe_pm_runtime_put(xe);
>>>       drm_notice(&xe->drm, "migration recovery ended\n");

