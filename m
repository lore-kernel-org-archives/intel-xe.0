Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CC5EB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AAD10E180;
	Wed,  5 Jul 2023 16:38:23 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1907710E180
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688575102; x=1720111102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DKxPps9jTgcEOGCbXViEsAVnPqIliYT7a450euQyi7o=;
 b=XcX32AfGAJUHu5KChLEoQQLtiDxhrgzqSMoey3t60GFsCHQSXpoweIum
 Gsux1wpOHxikvU3gHET2kSsUj9CCZoYuYLaR7V+08VBOktqJo1b4ooEkH
 bj14rkcHXgBEEpW4DU9gmQfm08k2XRQhziaLWl7CDc3GHw4SC61kAGubA
 xY7XXvbrkw2LV33TGznTUCSYmRkowdQNxTKzZYq8QG1iQqlSfMF5gjIZH
 0iLFsGN1hcBNuhReJnM56zbBEgYLCfiRz37cUMdhnaBcx4EkZuG+n/J5Q
 IaaArBBkF+dGgbUqSdb/UupMlb6ljufHWFVhvAgo2+DDWKjAYs6NI9FxO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429427382"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="429427382"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="713250572"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="713250572"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.33.133])
 ([10.249.33.133])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:37:49 -0700
Message-ID: <29fe7224-92e8-0f62-6801-b2588dbb1001@linux.intel.com>
Date: Wed, 5 Jul 2023 18:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230705084403.3922130-1-tejas.upadhyay@intel.com>
 <87y1jucv1g.wl-ashutosh.dixit@intel.com>
 <eb6aed9e-ef31-98d6-7bec-d2ac8042792c@linux.intel.com>
 <87wmzecqd6.wl-ashutosh.dixit@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <87wmzecqd6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V2] drm/xe: make GT sysfs init return void
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
Cc: Andi Shyti <andi.shyti@intel.com>, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Ashutosh,

On 7/5/2023 5:47 PM, Dixit, Ashutosh wrote:
> On Wed, 05 Jul 2023 08:39:20 -0700, Nirmoy Das wrote:
>> Hi Ashutosh,
>>
>> On 7/5/2023 4:06 PM, Dixit, Ashutosh wrote:
>>> On Wed, 05 Jul 2023 01:44:03 -0700, Tejas Upadhyay wrote:
>>>> Currently return from xe_gt_sysfs_init() is ignored
>>>> and also a failure in xe_gt_sysfs_init() isn't fatal
>>>> so make it return void.
>>> But why is the failure not fatal? I really don't understand the concept of
>>> these non-fatal failures. Do we really want to say the device is up if
>>> sysfs initialization has failed for some reason and people are unable to
>>> see card freq's e.g.? This was done in i915 but do we really want to repeat
>>> this for xe? IMO the simplest thing to do would be to fail the probe unless
>>> ALL required/intended functionality is clearly up.
>>
>> I agree with the concern but the situation is different with a graphics
>> driver.
>>
>> If we return error on probe, (if I am not wrong) a user will have no way to
>> interact
>>
>> with the system other than ssh. We should ignore non-fatal error and let
>> the driver load
>>
>> so a user can have something to work with(may be report a bug :) )
> Hmm, good point. Agreed :)
>
> This way though only display is critical and everything else non-critical?

Yes, that would be wrong, I am not saying that. We do return error 
during the probe at multiple locations,

I believe we can prioritize system usability by considering this 
specific error as non-critical. Although those sysfs files are important,

the device should still usable without them.


Thanks,

Nirmoy

> My point was knowing (or controlling) GPU freq's is a pretty important part
> of doing work on the GPU.
>
> In any case, since we are printing an error in dmesg if sysfs init fails,
> maybe converting to void is ok. So this is:
>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>>
>> Regards,
>>
>> Nirmoy
>>
>>> Instead of ignoring the return, fail the probe?
>>>
>>> Thanks.
>>> --
>>> Ashutosh
