Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02324C27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 21:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7CF112D1B;
	Thu, 30 May 2024 21:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BI5VeutF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00FF112635
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 21:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717104190; x=1748640190;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lf7wCD06upZyvKDzYa7Fr0F6S91uB0fm5qzbZc5MFD0=;
 b=BI5VeutFctzEMyXs/42FX56XjmYlpN6s6IMPQ/Vy++kJuvr76Ed+ZkMZ
 XTaIl6ilZSE7AUex8MJK+xoZNrMYydxZqHJdPZmrpvVJbxjdPL+5kt/FP
 tMKQKX2psfnzs73LdHW5MlrDIIGQnhPaiUtMNyxZTOMq1uN29qkJpoOx3
 3FeXLim53IiJcmwCv1gNf8FX5D0FWCZvEhGCPGKVqWuz/9KGnl9w8ITYX
 J3XhjaD06DgKk9jM+46l9UhnZmY0PbedVoZZwvSmQt8HHOrR9SAia1nvh
 XYsQB57jbVME9xQPQZdZTL4txAHWkHLdbqafT1gDPRZ4hXokRc+1Pt3ZB w==;
X-CSE-ConnectionGUID: 3MHWmQZ8TKiuXlDMlj4kTQ==
X-CSE-MsgGUID: hgV5Faj/THiLJ7YiZrQCWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13499633"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13499633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:23:00 -0700
X-CSE-ConnectionGUID: cGiAVtKnQ/S94WHJxHlcaw==
X-CSE-MsgGUID: 8pRAfMw3QsunLQcAIb8VDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40398933"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.252.131])
 ([10.94.252.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:22:59 -0700
Message-ID: <01e1d78a-6227-46ba-a1de-b56348039579@linux.intel.com>
Date: Thu, 30 May 2024 23:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/client: Check return value of xe_force_wake_get
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240528101132.14788-1-nirmoy.das@intel.com>
 <ZlYSzzsY5xepVreW@intel.com> <b19e9d9a-50ba-497b-b133-78cae5caf261@intel.com>
 <fuhisr2cplvzrtm2cjjyiodzp25mysclp5v2unv4drct2bh3ul@szs5jha3l3fs>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <fuhisr2cplvzrtm2cjjyiodzp25mysclp5v2unv4drct2bh3ul@szs5jha3l3fs>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Lucas,

On 5/29/2024 6:24 PM, Lucas De Marchi wrote:
> On Wed, May 29, 2024 at 10:50:34AM GMT, Nirmoy Das wrote:
>> Hi Rodrigo,
>>
>> On 5/28/2024 7:22 PM, Rodrigo Vivi wrote:
>>> On Tue, May 28, 2024 at 12:11:32PM +0200, Nirmoy Das wrote:
>>>> xe_force_wake_get() can return error so check it's return value
>>>> before reading gpu_timestamp value.
>>>>
>>>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_drm_client.c | 6 ++++--
>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c 
>>>> b/drivers/gpu/drm/xe/xe_drm_client.c
>>>> index 4a19b771e3a0..0c13395ffd34 100644
>>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>> @@ -245,7 +245,7 @@ static void show_run_ticks(struct drm_printer 
>>>> *p, struct drm_file *file)
>>>>      struct xe_gt *gt;
>>>>      struct xe_hw_engine *hwe;
>>>>      struct xe_exec_queue *q;
>>>> -    u64 gpu_timestamp;
>>>> +    u64 gpu_timestamp = 0;
>>>>      xe_pm_runtime_get(xe);
>>>> @@ -264,7 +264,9 @@ static void show_run_ticks(struct drm_printer 
>>>> *p, struct drm_file *file)
>>>>          if (!hwe)
>>>>              continue;
>>>> -        xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +        if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>>>> +            break;
>>> worth adding a debug/err msg?
>>
>> xe_force_wake_get() will throw a drm_notice on error. May be we 
>> should add a __builtin_return_address() in xe_force_wake_get() to 
>> know the caller as
>>
>> the current pattern seems to be to just return early on error ?
>
> humn... but just continuing here and returning something with a gpu
> timestamp == 0 doesn't seem something good. I think we should set hwe to
> NULL, so the function doesn't continue and just doesn't print anything
> rather than printing wrong data.


Yes, make sense to me. I will resend with setting hwe to NULL

Thanks,

Nirmoy

>
> Lucas De Marchi
>
>>
>>>
>>> but up to you:
>>>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>>
>>>> +
>>>>          gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>>          xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>          break;
>>>> -- 
>>>> 2.42.0
>>>>
