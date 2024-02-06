Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9907CC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C54210EAF8;
	Tue,  6 Feb 2024 10:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEwXzAOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DEB10EAF8
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 10:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707216972; x=1738752972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YvVro8rkmgMRF8Z9O4cQyc7Fs9LcItISy8am+AL1fRA=;
 b=nEwXzAOVF9rD71bRB44qsf7FF+Wt3fK+QxJzq4sSzMGs+pkJzKx13QiN
 ME4DPbAju+WhHW59eXlRzLvQ0jFwKTF+hDKXgakmhyXvFiaukpKPFWprQ
 Wivh2ZSKBlmdN0ooIsKCRErRmbANr83dp1D8dfygsnCy/LtrDHqD7iBZZ
 wNVj1iBiW3zqPuyMyXYeSELcGXj+S1QtH/FBasuTUlFc9RuZmIOKPjEYT
 jjZOr6Jaro4ikFHJKPGMtOzZDbyYvxA41I48zmu+DpWQyKTW6pe/F4PGt
 P+M64dAx/bQxLxJtO8epTuwCaVfDlp5/lM8Od9Y4z+60COOeOHU4vFV8z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="616428"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="616428"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5600781"
Received: from bjforde-mobl.ger.corp.intel.com (HELO [10.252.20.90])
 ([10.252.20.90])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:55:56 -0800
Message-ID: <8a1b0553-7855-4179-a6ce-1b0a27e29fb6@intel.com>
Date: Tue, 6 Feb 2024 10:55:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: don't ignore error when in_kthread
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240202171435.427630-2-matthew.auld@intel.com>
 <ZcEr9axBgGiIoFee@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZcEr9axBgGiIoFee@DUT025-TGLU.fm.intel.com>
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

On 05/02/2024 18:41, Matthew Brost wrote:
> On Fri, Feb 02, 2024 at 05:14:36PM +0000, Matthew Auld wrote:
>> If GUP fails and we are in_kthread, we can have pinned = 0 and ret = 0.
>> If that happens we call sg_alloc_append_table_from_pages() with n_pages
>> = 0, which is not well behaved and can trigger:
>>
>> kernel BUG at include/linux/scatterlist.h:115!
>>
>> depending on if the pages array happens to be zeroed or not. Even if we
>> don't hit that it crashes later when trying to dma_map the returned
>> table.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Someone from Habana point this out a while back and forgot to follow up
> on fixing this. Thanks for fixing this and looks correct.
> 
> Should we include a Fixes tag here? I am thinking so.
> 
> With a fixes tag:
> Reviewed: Matthew Brost <matthew.brost@intel.com>

Pushed with: Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver 
for Intel GPUs")

Thanks for the review.

> 
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 9c1c68a2fff7..63aeb3aead04 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -114,11 +114,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>>   					  num_pages - pinned,
>>   					  read_only ? 0 : FOLL_WRITE,
>>   					  &pages[pinned]);
>> -		if (ret < 0) {
>> -			if (in_kthread)
>> -				ret = 0;
>> +		if (ret < 0)
>>   			break;
>> -		}
>>   
>>   		pinned += ret;
>>   		ret = 0;
>> -- 
>> 2.43.0
>>
