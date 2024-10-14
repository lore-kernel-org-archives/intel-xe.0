Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B3ED1A443
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 10:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6E10E292;
	Mon, 14 Oct 2024 10:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYEorNZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F0A10E41D
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728903513; x=1760439513;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BdSwGVHY3KjlRMZttwBKgtycTIQSH1raHuTDB7qbIUA=;
 b=mYEorNZVY0QTnMWKBzq0cC67eX2Ys3n3PB0ki3n+EAxRYC34T6GZTe9r
 KTGFRADl2XPO9BhBDR/FkWILKE++lVVTxQKfgyzlNmKXsMkvxO2+PdVDk
 XEdCm/R+sdomapyGmZ/LPUTk1LOzpNQuSRP0x3Ja/aUmYwA3faoeIvcio
 XSkEagmRZgSRaKrUKk/iPpNSu7smiuYf7gH7pezCpxsQlT5WJHxLvOgXt
 clNsfYE5LJE/AKRQkmV5o9ILkjLBQWmdano2YQp8kaG3+mLYOgH1ZXn4L
 m4cpr54B59UaSKOm8MMBjsWP5jgI6V3XlJkTdo+Po1bvvf6wQBw7EbhLJ g==;
X-CSE-ConnectionGUID: 1kgPYIWDTemq5ECUAoVWrQ==
X-CSE-MsgGUID: 4/5PHEDwRwGi/DyLA0b8aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28129048"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28129048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 03:58:32 -0700
X-CSE-ConnectionGUID: FpjgjqhTSk+N8AJY8maQBA==
X-CSE-MsgGUID: Lxvt54QxR4yCgUcN3lQMCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77872889"
Received: from opintica-mobl1 (HELO [10.245.244.133]) ([10.245.244.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 03:58:31 -0700
Message-ID: <f2646225-171e-4101-a0b6-73a0dfd017fd@linux.intel.com>
Date: Mon, 14 Oct 2024 12:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
To: Francois Dugast <francois.dugast@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
References: <20241011115715.3486872-1-nirmoy.das@intel.com>
 <20241011115715.3486872-2-nirmoy.das@intel.com>
 <Zwzj4N466Z3uZryR@fdugast-desk>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <Zwzj4N466Z3uZryR@fdugast-desk>
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

I believe this is triggerable from userspace, so this should be a 
XE_IOCTL_DBG

Den 2024-10-14 kl. 11:27, skrev Francois Dugast:
> On Fri, Oct 11, 2024 at 01:57:15PM +0200, Nirmoy Das wrote:
>> This shouldn't happen but seen this while debugging ufence timeout
>> issue time to time so log it to isolate this particular case.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
>> ---
>>   drivers/gpu/drm/xe/xe_sync.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 6a2e4dd41d56..41758f528d7c 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
>>   			XE_WARN_ON("Copy to user failed");
>>   		kthread_unuse_mm(ufence->mm);
>>   		mmput(ufence->mm);
>> +	} else {
>> +		XE_WARN_ON("mmget_not_zero() failed");
>>   	}
>>   
>>   	wake_up_all(&ufence->xe->ufence_wq);
>> -- 
>> 2.46.0
>>

