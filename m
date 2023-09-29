Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80BCE743F4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 08:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8AD10E58B;
	Fri, 29 Sep 2023 08:24:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AD810E58B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695975894; x=1727511894;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uY3y6YjX8JH+MbngnyJ9s3H8W2VhinqZxCwoDSa/g6E=;
 b=Rp9mN8bv2tjrDl7BM5NEqy5EtE0Hy8NqjFLJvV6HSRIuJV0XB4qxnRbc
 e39KhIvHJ8qO1RTlc5e3wuX4vGKYg1bI/bOVgo8elm+Mh6tf/ZiXQLTn3
 3tUHAIaZ+6ucISBHBW9+TIrgwakjnFUNta1YX8NHKAnra7p209uif1a42
 4fOfzh5whBztaLikTaZ1lM7xvLAwlV0WGcSxsSU3UO7+edV6tKfW+Z2od
 sLI2ZMJR2E5kMw/xnptTMZa7Z37jJRZNGoO7eCg6tLTDpvWynD9L2Hr5S
 sLXTvf8Zk1oCo0rbeo2kzD3T0srwryQyng4vHpSGRfDQGoEoObwcU8Xre g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3824305"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="3824305"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753289976"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="753289976"
Received: from knomani-mobl.ger.corp.intel.com (HELO [10.252.28.231])
 ([10.252.28.231])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:41:26 -0700
Message-ID: <cb9b5d45-4706-6a18-4717-574404cc9b45@intel.com>
Date: Fri, 29 Sep 2023 08:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <20230928100537.392675-9-matthew.auld@intel.com>
 <hjcuf5dcdqcmm6xwce45xdf6gwxubu4qd3rguplulmrd2mkokk@qe3z2vzivnb6>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <hjcuf5dcdqcmm6xwce45xdf6gwxubu4qd3rguplulmrd2mkokk@qe3z2vzivnb6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v6 2/5] drm/xe: directly use pat_index for
 pte_encode
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 28/09/2023 14:15, Lucas De Marchi wrote:
> On Thu, Sep 28, 2023 at 11:05:40AM +0100, Matthew Auld wrote:
>> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h 
>> b/drivers/gpu/drm/xe/xe_pt_types.h
>> index bd6645295fe6..355fa8f014e9 100644
>> --- a/drivers/gpu/drm/xe/xe_pt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
>> @@ -38,14 +38,14 @@ struct xe_pt {
>>
>> struct xe_pt_ops {
>>     u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>> -                 enum xe_cache_level cache, u32 pt_level);
>> +                 u16 pat_index, u32 pt_level);
>>     u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
>> -                  enum xe_cache_level cache, u32 pt_level);
>> +                  u16 pat_index, u32 pt_level);
>>     u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
>> -                   enum xe_cache_level cache,
>> +                   u16 pat_index,
>>                    u32 pt_level, bool devmem, u64 flags);
>>     u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>> -                 const enum xe_cache_level cache);
>> +                 const u16 pat_index);
> 
> I think the const enum was a copy-past mistake on my side. Might as well
> just remove it here?
> 
> Other question is: why is pat_index a u16 instead of u8? I don't think
> we have any plans to support more than 256, do we?

It's likely overkill. I was just worried since we are already at ~32 on 
xe2 and every time you add a new bit/memory attribute you might get a 
combinatorial explosion.

I can make it u8 if you prefer.

> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
