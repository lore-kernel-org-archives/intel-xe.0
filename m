Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81837C7619A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 10:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512D710E087;
	Mon, 27 Mar 2023 10:10:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC3510E087
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679911803; x=1711447803;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dUmd0ElY3G/phOfdAQw6IZRDZZHPTvTjqsPxR0lSQVQ=;
 b=B0wVlwcG6rm5U00oJi4+oHChyhIG6YC2UIBo29bq3tqSrgR9Twe3+7zh
 ybe9mPN0R3zVlv+brxKI6UgGd2CrkhbWZgcTB+HAd7MUYnt/1uLAFDc6x
 xiJgyQN55dLEsRXjDOZxbazJ9cMw/wmqz3UjZktkPEjXpiCa4goskbEXt
 wYS5lJR0QXGqj5RDMufTZ3KCTVHcxlf5tz2qayXh/Fb1Zd4IIzDTyDJA7
 IdU4U1VD6YD0Ylx3Uwv8T1NApqZMkuLRyHltI39VCTksfiSYv6xkGqkV5
 pjiOrJ7TWPAtEtStvZWnIJphXRX08MbIDoagYbBCtqc7zOOn5OC8F4BIO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367972639"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="367972639"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 03:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="794272563"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="794272563"
Received: from ababushk-mobl1.ger.corp.intel.com (HELO [10.252.3.24])
 ([10.252.3.24])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 03:10:01 -0700
Message-ID: <2d7fd15b-4fd1-9795-cd52-31c1bbd77d93@intel.com>
Date: Mon, 27 Mar 2023 11:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-4-matthew.auld@intel.com>
 <9563684e-90c4-6b39-1951-9fd0ed22f2f7@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <9563684e-90c4-6b39-1951-9fd0ed22f2f7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe/query: restrict system wide
 accounting
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 24/03/2023 16:52, Gwan-gyeong Mun wrote:
> looks good to me.
> 
> btw, it is similar to the constraint attribute described in this article,
> https://docs.kernel.org/gpu/rfc/i915_small_bar.html#probed-cpu-visible-size-attribute
> do you have any plan to add a small bar related doc for xe?

Yeah, that should be the same stuff. I think we can at least add 
kernel-doc for the xe query related bits, and copy-paste some of the 
stuff from i915 for the small-bar bits. Will fix.

> 
> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Thanks.

> 
> On 3/23/23 1:59 PM, Matthew Auld wrote:
>> Since this is considered an info leak (system wide accounting), rather
>> hide behind perfmon_capable().
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>> Cc: Carl Zhang <carl.zhang@intel.com>
>> Cc: Effie Yu <effie.yu@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c 
>> b/drivers/gpu/drm/xe/xe_query.c
>> index 0f70945176f6..9ff806cafcdd 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -127,7 +127,10 @@ static int query_memory_usage(struct xe_device *xe,
>>       usage->regions[0].min_page_size = PAGE_SIZE;
>>       usage->regions[0].max_page_size = PAGE_SIZE;
>>       usage->regions[0].total_size = man->size << PAGE_SHIFT;
>> -    usage->regions[0].used = ttm_resource_manager_usage(man);
>> +    if (perfmon_capable())
>> +        usage->regions[0].used = ttm_resource_manager_usage(man);
>> +    else
>> +        usage->regions[0].used = usage->regions[0].total_size;
>>       usage->num_regions = 1;
>>       for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
>> @@ -144,8 +147,16 @@ static int query_memory_usage(struct xe_device *xe,
>>                   SZ_1G;
>>               usage->regions[usage->num_regions].total_size =
>>                   man->size;
>> -            usage->regions[usage->num_regions++].used =
>> -                ttm_resource_manager_usage(man);
>> +
>> +            if (perfmon_capable()) {
>> +                usage->regions[usage->num_regions].used =
>> +                    ttm_resource_manager_usage(man);
>> +            } else {
>> +                usage->regions[usage->num_regions].used =
>> +                    man->size;
>> +            }
>> +
>> +            usage->num_regions++;
>>           }
>>       }
