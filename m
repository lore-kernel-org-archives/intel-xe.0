Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0919CDB474
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 11:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4610E1BC;
	Mon, 16 Oct 2023 11:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B67F10E1BC
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697454193; x=1728990193;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4EcrWBP43ndOv+Epd6QjrbLdRzd0+EHDT890OD7Eseg=;
 b=X4c0sJpUwZrC+yuVm+xuu+t1eNXnWfxD6akWu5NDponfhUX7wvr9tdRZ
 6glx+Gmvr2J6vSkeaV9dKckAGaCWj9dfikY3KNC6c4mN6jNCpVzeAabV3
 Bn1LodxxPZ4St/+T7BthHESLIIFzqzTWOznEV6YQwTo+ODi/TBaY5dpMd
 z8s3asu1rg8Hub60jULLhgch5Gt5crLXBGhW2p26Va6b0SIfN60VEqbZY
 g2Qa9sg8jrhKN+1fGrqyOBG1HYp3h1MVy5V3elmFeHkiyGRaILKCIc+jm
 y+dCABObhQCKn2m1LezLi64sgxaFFc2aFyPTj1VhqS79DBwUx0jFxmwT+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382722208"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="382722208"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 04:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929303190"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="929303190"
Received: from hlykke-mobl.ger.corp.intel.com (HELO [10.249.254.194])
 ([10.249.254.194])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 04:03:11 -0700
Message-ID: <51dcf3d7-fe44-cebd-7922-b29e3d864cbc@linux.intel.com>
Date: Mon, 16 Oct 2023 13:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231013102226.2961-1-thomas.hellstrom@linux.intel.com>
 <ZSmlgS88PD4QI+k8@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZSmlgS88PD4QI+k8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/uAPi: Clarify the meaning of
 min_page_size and MIN_ALIGNMENT
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On 10/13/23 22:16, Rodrigo Vivi wrote:
> On Fri, Oct 13, 2023 at 12:22:26PM +0200, Thomas Hellström wrote:
>> In particular, don't *enforce* alignment of buffer object sizes to
>> MIN_ALIGNMENT, as enforcing that for imported dma-bufs would not
>> really make sense.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index d48d8e3c898c..5895c95879d1 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -167,11 +167,10 @@ struct drm_xe_query_mem_region {
>>   	 *
>>   	 * When the kernel allocates memory for this region, the
>>   	 * underlying pages will be at least @min_page_size in size.
>> -	 *
>> -	 * Important note: When userspace allocates a GTT address which
>> -	 * can point to memory allocated from this region, it must also
>> -	 * respect this minimum alignment. This is enforced by the
>> -	 * kernel.
> This old statement seems bold on the kernel is enforcing it. If we are
> but intend to not enforce anymore we should also change the code in
> the same patch, no?!
> Also by the commit message I had the impression that this was removing
> the enforcement, and not just the documentation about it.

This RFC was more intended to trigger a discussion on how to handle 
this. I'll actually bring back the above somewhat reworded and also 
rework the commit message a bit to reflect that this is an RFC for an 
uAPI change under discussion.

>
>> +	 * Buffer objects with an allowable placement in this region may
>> +	 * be created with a smaller size, but for increased performance,
>> +	 * user-space drivers should align sizes of such buffer objects
>> +	 * to this value whenever possible.
>>   	 */
>>   	__u32 min_page_size;
>>   	/**
>> @@ -252,6 +251,14 @@ struct drm_xe_query_config {
>>   #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>   #define XE_QUERY_CONFIG_FLAGS			1
>>   	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
>> +/*
>> + * XE_QUERY_CONFIG_MIN_ALIGNMENT - GPU VM bind address - and size alignment.
>> + * GPU virtual address mappings of buffer objects must have their VM addr and
>> + * range aligned to this value, with the exception of buffer objects with
>> + * allowable placement in system memory only. If this alignment results in
>> + * a mapping beyond the end of the buffer object, accesses beyond the
>> + * end of the buffer object have undefined reslut.
> s/reslut/result.
>
> Should we make this into a kernel doc?

It looks like all other defines of constants in this file doesn't use 
kerneldoc. If we want to do that, It looks like we need to break this 
out to a top-level DOC: section, similar to what's done for  
XE_RESET_FAILED_UEVENT.

/Thomas


