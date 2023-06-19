Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F20EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 12:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F17810E1E8;
	Mon, 19 Jun 2023 12:00:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9053010E1F2
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687176012; x=1718712012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iVPE/6QB1VF7fYKVDCZn8Hsf3VVF5yrg2sW4VjGkoCY=;
 b=Dr/D2NZ2lyeip78wCKjP3pGo4jPXg3vc7oOIXln/v7C2dxRmq8fGr8Ff
 GbhrgwB0O20rtyV0+/LrrDjVmibkm637bV4psw7EX5IQj/SmntaWNGS0H
 rVfSHrFnb4vtdJ96m/8X8U4rxpvWIIUuJJ1R5IB1FWj+pGcaGlYlPpWvM
 Lbld52yQbqWUA8bL1xDEx5df3MJ61TDLcATsRL02VNf9vnTpDXSYJHIMZ
 p55hEHCzxnUdRYxVl4fo80nlte3TKstjK8p4mUaUSgghn37nZCnLBuVjp
 QzW6tcI4k6WfCowegUtqSmTzMa+cbWDtIGDl2iot/myGK3atQKbj7rfe/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349334586"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349334586"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 05:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="837851726"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="837851726"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO [10.249.254.162])
 ([10.249.254.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 05:00:10 -0700
Message-ID: <b9ff37eb-744c-9e96-bf14-e26c29ff1192@linux.intel.com>
Date: Mon, 19 Jun 2023 14:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-6-thomas.hellstrom@linux.intel.com>
 <ZIzKfNQjRmy5r30C@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZIzKfNQjRmy5r30C@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/bo: Evict VRAM to TT rather than
 to system
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


On 6/16/23 22:47, Matthew Brost wrote:
> On Fri, Jun 16, 2023 at 11:55:03AM +0200, Thomas Hellström wrote:
>> The main difference is that we don't bounce and sync on eviction, allowing
>> for pipelined eviction. Moving forward we also need to be careful with
>> dma mappings which can be released in SYSTEM but may remain in TT.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 77d5c5710688..fd41114f2dfb 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -40,6 +40,20 @@ static struct ttm_placement sys_placement = {
>>   	.busy_placement = &sys_placement_flags,
>>   };
>>   
>> +static const struct ttm_place tt_placement_flags = {
>> +	.fpfn = 0,
>> +	.lpfn = 0,
>> +	.mem_type = XE_PL_TT,
>> +	.flags = 0,
>> +};
>> +
>> +static struct ttm_placement tt_placement = {
>> +	.num_placement = 1,
>> +	.placement = &tt_placement_flags,
>> +	.num_busy_placement = 1,
>> +	.busy_placement = &sys_placement_flags,
>> +};
>> +
>>   bool mem_type_is_vram(u32 mem_type)
>>   {
>>   	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
>> @@ -225,6 +239,8 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>>   	case XE_PL_VRAM0:
>>   	case XE_PL_VRAM1:
>>   	case XE_PL_STOLEN:
>> +		*placement = tt_placement;
>> +		break;
>>   	case XE_PL_TT:
>>   	default:
>>   		/* for now kick out to system */
> NIT, you can probably delete this comment now.
>
> Anyways:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Thanks for reviewing.
>
>> -- 
>> 2.40.1
>>
