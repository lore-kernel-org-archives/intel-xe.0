Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D819DC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 10:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C3C10E056;
	Wed, 10 May 2023 10:10:15 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3F610E056
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683713413; x=1715249413;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CqBI7jxd/p0BhzJnbhbgJAq58nrMm1z8+kInhajDEHg=;
 b=i9/+slbtKYAg0A7gfHESUQ0ZFxjcmWPmTNUFAjIQ0gixW66g5iw+gwN/
 MD4z54EBbwwIxQZj5a67G9jd1dlQtxBUqNV2HFB91TwHJv+09EOwp7U8d
 yJfz0wO1J081jA5WspffshABOv6Mk1Be2GZo9jyR8OhmYIQ5ehORgMehH
 0nqgtqc5ds/DvUNW/iP5CGuzkUrjvHgziGrWUthMtHNIZ53TnjGcF80L2
 FfyCxmdWUQi17MSBGKDFfSvmjLZQODL9JrfI427pnUP3TCQUwT2rugNyb
 0MBaI5JZeBIk1kbEim+KPePjdvfTg40d6gZSUqSZDF6cKTNi22Aj6rULx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="352367645"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="352367645"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 03:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="732101060"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="732101060"
Received: from respir1x-mobl1.ger.corp.intel.com (HELO [10.252.14.125])
 ([10.252.14.125])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 03:10:10 -0700
Message-ID: <678e1e78-2aaf-2809-8c29-fa9bc2e9f191@intel.com>
Date: Wed, 10 May 2023 11:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
To: Christopher Snowhill <kode54@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230505144910.317943-1-matthew.auld@intel.com>
 <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
 <CA+aRtuZC4E5+29nUC7=PSy+Q4obn6HMNCZDTPi4hE9Y=WC5R3w@mail.gmail.com>
 <CA+aRtuZ+DUg2Aaxb3AZbu3RFwgT8BbuF5-OWf8HxmU8eU=k8ZQ@mail.gmail.com>
 <CA+aRtuaWC=YR5z=0yA9XkheU3S-8mz4Ru8CsAYEQ-kWnJa16qg@mail.gmail.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CA+aRtuaWC=YR5z=0yA9XkheU3S-8mz4Ru8CsAYEQ-kWnJa16qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix tlb_invalidation_seqno_past()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 08/05/2023 04:42, Christopher Snowhill wrote:
> Why is XE_FENCE_INITIAL_SEQNO defined to (-127) when seqno variable
> types are mostly unsigned everywhere, except for logic that is
> checking for wraps?

It's just so we can more likely trigger a u32 seqno wrap, which maybe 
uncovers issues under normal CI runs. (u32)(-127) means we should wrap 
in 127 seqnos or so.

> 
> On Sun, May 7, 2023 at 8:26 PM Christopher Snowhill <kode54@gmail.com> wrote:
>>
>> False alarm. Looks like there's a different seqno overflow somewhere in here:
>>
>> [  854.230925] xe 0000:28:00.0: [drm] Engine reset: guc_id=59
>> [  854.236564] xe 0000:28:00.0: [drm] Timedout job: seqno=4294967169,
>> guc_id=59, flags=0x8
>> [  859.885349] xe 0000:28:00.0: [drm] Ioctl argument check failed at
>> drivers/gpu/drm/xe/xe_exec.c:178: engine->flags & ENGINE_FLAG_BANNED
>> [  859.885366] xe 0000:28:00.0: [drm] Ioctl argument check failed at
>> drivers/gpu/drm/xe/xe_exec.c:178: engine->flags & ENGINE_FLAG_BANNED
>>
>> Also, curses to gmail for not defaulting to plain text mode.
>>
>>
>> On Sun, May 7, 2023 at 8:19 PM Christopher Snowhill <kode54@gmail.com> wrote:
>>>
>>> Wow, this patch made intel-compute-runtime suddenly start working properly instead of causing a "GPU hang" that wasn't really a hang but instead a seqno overflow.
>>>
>>> On Sun, May 7, 2023 at 5:53 PM Matthew Brost <matthew.brost@intel.com> wrote:
>>>>
>>>> On Fri, May 05, 2023 at 03:49:10PM +0100, Matthew Auld wrote:
>>>>> Checking seqno_recv >= seqno looks like it will incorrectly report true
>>>>> when the seqno has wrapped (not unlikely given
>>>>> TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() might
>>>>> then return before the flush has been completed by the GuC.
>>>>>
>>>>> Fix this by treating a large negative delta as an indication that the
>>>>> seqno has wrapped around. Similar to how we treat a large positive delta
>>>>> as an indication that the seqno_recv must have wrapped around, but in
>>>>> that case the seqno has likely also signalled.
>>>>>
>>>>> It looks like we could also potentially make the seqno use the full
>>>>> 32bits as supported by the GuC.
>>>>
>>>> Yea we def could use more of the space but in the end we have the seqno
>>>> wrap issue. I think I set this to a low value to prove the wrapping
>>>> protection worked (it didn't) by triigering wraps more often than the
>>>> wrapping 32 bits.
>>>>
>>>> With, this patch LGTM.
>>>>
>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---
>>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> index 604f189dbd70..67822b3dd353 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> @@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>>>>>
>>>>>   static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>>>>>   {
>>>>> -     if (gt->tlb_invalidation.seqno_recv >= seqno)
>>>>> -             return true;
>>>>> +     if (seqno - gt->tlb_invalidation.seqno_recv <
>>>>> +         -(TLB_INVALIDATION_SEQNO_MAX / 2))
>>>>> +             return false;
>>>>>
>>>>>        if (seqno - gt->tlb_invalidation.seqno_recv >
>>>>>            (TLB_INVALIDATION_SEQNO_MAX / 2))
>>>>>                return true;
>>>>>
>>>>> -     return false;
>>>>> +     return gt->tlb_invalidation.seqno_recv >= seqno;
>>>>>   }
>>>>>
>>>>>   /**
>>>>> --
>>>>> 2.40.0
>>>>>
