Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E72C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 20:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF57010E143;
	Tue, 21 May 2024 20:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5mF7IS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85EB10E143
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716322466; x=1747858466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M1uMx3+lKt7UIOPL1+x2hRfnQkR9/Ox8rnDx6D2JiRw=;
 b=L5mF7IS+UywhUjffib4xg5voG2Ga6OO88bKDa8qQBmZRICN1tndI4tit
 AwpCny82plRKkmzUIMTTmSsxvFUdCcFLUyju5hm4BYb5QedG7xm1PMPEa
 68ijlsu4UDQbopqh9uLGZc29K2tvtmsgnoUTrn1S5p+CfpQzBoNHjM6nv
 oesUPOYzmqWbMrBeCJTrOQNNIYap1JL3x8oT5pWdPFT2LqacGZP/PP20a
 XS2j9Q6LkW6wKp06lfIwRjixV4/Jz8QtWMc8nFkk+0E5bZk9O8pXMosIV
 gvSzXsFSOU40/nPuJv0xzy0ei1TNWmhh3/Wa4/5Br9ywnbGLWZnkMYElI Q==;
X-CSE-ConnectionGUID: KL9aYB4XRByNcYHh45e7Pg==
X-CSE-MsgGUID: ibby3Qr7T/Gn51Dch50ftg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15493808"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="15493808"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:14:25 -0700
X-CSE-ConnectionGUID: gJ+uV5ssRx+1ytbyrzg0iQ==
X-CSE-MsgGUID: +Cxcb+8uQRWGiE5yY1c9Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33158067"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.252.151])
 ([10.94.252.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:14:24 -0700
Message-ID: <8fc60870-f02f-4065-8772-642e32aca14a@linux.intel.com>
Date: Tue, 21 May 2024 22:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add warn when level can not be zero.
To: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240521103623.11645-1-nirmoy.das@intel.com>
 <Zkyq4Tzh73D9yeXD@DUT025-TGLU.fm.intel.com>
 <552219db-7505-4dff-851c-71ed534f884e@intel.com>
 <Zky+kn5n2a1f31pT@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zky+kn5n2a1f31pT@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 5/21/2024 5:32 PM, Matthew Brost wrote:
> On Tue, May 21, 2024 at 03:52:45PM +0100, Matthew Auld wrote:
>> On 21/05/2024 15:08, Matthew Brost wrote:
>>> On Tue, May 21, 2024 at 12:36:23PM +0200, Nirmoy Das wrote:
>>>> At xe_pt_zap_ptes_entry() and xe_pt_stage_unbind_entry, the level cannot
>>>> be 0. Therefore, add an independent check for the level. Since the level
>>>> cannot be zero at this point, there is no need to check for `is_compact`,
>>>> so remove that instead.
>>>>
>>> This doesn't look right. Both xe_pt_zap_ptes_entry &
>>> xe_pt_stage_unbind_entry can be at level 0 is 4K page entries are used,
>>> right? CI looks good though so confused by that. I think maybe 2
>>> independent VMAs would have to mapped within a 2M range for these paths
>>> to decend to level 0. Maybe we don't have tests in place that do this.
>> Not too sure, but in both cases this is followed by doing a level-1 which is
>> then used as the index into some array AFAICT. So if level can indeed by
>> zero here then that would be a serious bug. Improving the assert here to
>> catch that looked reasonable to me.
>>
> Ah, yes. The comment below explains this. The this function is called on
> the parent while operating on the child. So to write 4k page entries the
> level would be 1.
>
> This LGTM.
Thanks. Merged to drm-xe-next.
>
> Matt
>
>>> Regardless please don't merge this until my concerns are addresesed.
>>>
>>> Matt
>>>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index 11dd0988ffda..cd60c009b679 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -763,7 +763,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>>>>    	pgoff_t end_offset;
>>>>    	XE_WARN_ON(!*child);
>>>> -	XE_WARN_ON(!level && xe_child->is_compact);
>>>> +	XE_WARN_ON(!level);
>>>>    	/*
>>>>    	 * Note that we're called from an entry callback, and we're dealing
>>>> @@ -1445,7 +1445,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>>>>    	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
>>>>    	XE_WARN_ON(!*child);
>>>> -	XE_WARN_ON(!level && xe_child->is_compact);
>>>> +	XE_WARN_ON(!level);
>>>>    	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
>>>> -- 
>>>> 2.42.0
>>>>
