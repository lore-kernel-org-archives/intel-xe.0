Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF39EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 17:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3BF10E0B4;
	Mon, 19 Jun 2023 17:14:11 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F41010E0B4
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687194849; x=1718730849;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mKM92UW51DYhFkyIojH9fifeeHmlIxNAeXH2x6ELQME=;
 b=ZmGYHMG51CBfRLu71DYxb/2tUJ4FrvAl+9by5ozIsHtioiUs5LseyP2n
 +Bgp0F/RjgjTP6CzxdCJF/VlS1ifw8ppRyTPRO9uR8IXgfOQ29tmrhxc+
 yVdnFgoKX/96nYkrCQO9ys1uOLusCSRpllcMbVix6vnaJZT6vqC6TtOhh
 ZH7PoXlWnOxcRtCC/M5b44wnAMDZpL6sCwvDEAb7jB/9KaaXM/J2CECkd
 CRw+KTtWKSnQYrAcnJD3MKyN16EdclsJii0WtwLSETnIWEBTuP3l+0gor
 3phhKeoydySIQlxq77SvaoahwDxV1NwMYdrZAg5/9W9vXL9xQ9eentREB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423340944"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; d="scan'208";a="423340944"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 10:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="743525930"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; d="scan'208";a="743525930"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO [10.249.254.162])
 ([10.249.254.162])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 10:14:06 -0700
Message-ID: <3dd6e667-4ea4-f1b4-d24e-41e1b9f7af92@linux.intel.com>
Date: Mon, 19 Jun 2023 19:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
 <20230619152222.11733-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHM2E2jb9s1T+38zsQBHnvULFSGRFhZ_hThOaUfxC2905w@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHM2E2jb9s1T+38zsQBHnvULFSGRFhZ_hThOaUfxC2905w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe/bo: Don't limit the TT manager
 to half of system memory
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

Hi,

On 6/19/23 18:46, Matthew Auld wrote:
> On Mon, 19 Jun 2023 at 16:22, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> TTM enforces this limit a page-allocation time, swapping out TT memory
>> if needed.
> It seems that limit can be exceeded by just creating one crazy big
> object, or having a few as part of the same exec() call. If unable to
> lock an object it seems to just skip it (-EBUSY), and if there are no
> objects left to iterate over it just carries on with the allocation.
> The hard limit in sys_mgr seemed to prevent that. Do we know if this
> new behaviour is now expected?

Hm. You're right. Once there was a quite elaborate accounting mechanism 
in TTM, and IIRC bypassing it in that way wasn't possible. Now it looks 
more like an opportunistic swapout.

Sigh, Yes I guess then we have to leave this where it is and adjust the 
IGT accordingly. I figure I need to resurrect that TTM shrinker series.

/Thomas


>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> index 3e1fa0c832ca..961bbc29dcdf 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> @@ -106,8 +106,6 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>>
>>          si_meminfo(&si);
>>          gtt_size = (u64)si.totalram * si.mem_unit;
>> -       /* TTM limits allocation of all TTM devices by 50% of system memory */
>> -       gtt_size /= 2;
>>
>>          man->use_tt = true;
>>          man->func = &xe_ttm_sys_mgr_func;
>> --
>> 2.40.1
>>
