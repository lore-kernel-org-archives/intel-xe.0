Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A0C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 08:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539710E642;
	Wed, 27 Mar 2024 08:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2quJgTB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE62D10E642
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711529654; x=1743065654;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l4l6QzynkF07LFcRXPYMo8shskpK1EpRnsQU4N5USMM=;
 b=a2quJgTBZaGGF8scpDk5LxOhYy2jqonntv62BYuFp7y11vTob/GsiwvW
 RjhGgU3PVc5Q+of95YyfYamsz/RjTCmx7MEOu0i71VOjMBCyfKMVsuqtx
 2fTbd3qseMDYtyQbQ5oQUdvXuHhUhUDqQNExDMeGJgn2OfDZnLGb5Joxm
 RgZZo/VU3T3m9fcwkF3xyVs3ou7gvELUOmWwsYECPojUevACu4q1nNaOR
 H2asCw9JIT8ZPnmH41jboHXMxdNS/1xiWQS8kJRkYxubUfJjLXF9XM2zV
 Umf7dzTXz17ACC2GJmDYxANegsKAaXE2efqNNkX3XP+qyh4Ew+tBIGrBx Q==;
X-CSE-ConnectionGUID: BCFrH2YAQ22AKzzb2kSKyQ==
X-CSE-MsgGUID: QT25/cqwRoSSllK/IdTd9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="29094202"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="29094202"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 01:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="20943579"
Received: from unknown (HELO [10.245.245.112]) ([10.245.245.112])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 01:54:13 -0700
Message-ID: <54ffa436-eb11-4376-81f5-8d449c3d66b5@intel.com>
Date: Wed, 27 Mar 2024 08:54:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/xe2: Send flat_ccs value in struct
 drm_xe_query_config
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
 <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
 <f2e72896-8524-44a5-bb75-ff277c50eaa6@intel.com>
 <20240327045410.kjf3sspjfpwe7blh@zkempczy-mobl2>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240327045410.kjf3sspjfpwe7blh@zkempczy-mobl2>
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

On 27/03/2024 04:54, Zbigniew Kempczyński wrote:
> On Tue, Mar 26, 2024 at 08:25:56AM +0000, Matthew Auld wrote:
>> On 26/03/2024 10:10, Akshata Jahagirdar wrote:
>>> Currently, we don't have any check in IGT testcases if platform supports
>>> compression or not. Send this flat_ccs value as part of the struct
>>> drm_xe_query_config so that we can read this value in the igt testcases
>>> and proceed accordingly.
>>
>> AFAIK it's not valid to add uAPI just for an IGT. uAPI normally needs a real
>> open source user (like Mesa etc) with UMD acks. However if this is going to
>> be used by Mesa etc, how do they tell the difference between "this device
>> doesn't have flat-CCS" and "this KMD version doesn't support
>> FLAG_HAS_FLAT_CCS"?
>>
>> If userspace doesn't need this, then other option could be debugfs. Or if
>> this just a single test perhaps we can just dynamically check if the CCS
>> state is zero for compressed buffer at the start of the test?
> 
> Just for making sure - is ctrl-surf-copy behavior defined if there's no
> flat ccs?

Yeah, claim is that HW will never compress anything, writes to CCS are 
dropped and reads from CCS return zero. KMD should also skip any CCS 
related stuff.

> 
> --
> Zbigniew
>>
>>> Fixes: VLK-56136
>>>
>>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_query.c | 3 +++
>>>    include/uapi/drm/xe_drm.h     | 1 +
>>>    2 files changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>> index e80321b34918..8a3a3117491c 100644
>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>> @@ -332,6 +332,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>>    	config->num_params = num_params;
>>>    	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>>>    		xe->info.devid | (xe->info.revid << 16);
>>> +	if (xe->info.has_flat_ccs)
>>> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>>> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS;
>>>    	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>>>    		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>>
>> This tramples the previous value AFAICT, like when we have VRAM + CCS on
>> DG2. I think we need |= here.
>>
>>>    			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index f44a19ae9333..08783234bae1 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -405,6 +405,7 @@ struct drm_xe_query_config {
>>>    #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>>    #define DRM_XE_QUERY_CONFIG_FLAGS			1
>>>    	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
>>>    #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>>    #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>>    #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
