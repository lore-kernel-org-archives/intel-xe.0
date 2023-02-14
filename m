Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781A8C05027
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 17:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EC610E0E8;
	Tue, 14 Feb 2023 17:51:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C701E10E0E8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676397092; x=1707933092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vkiu0lVxmPQTp7nzdrdxAo8JpW6b9AEr1Z/P8gGjNso=;
 b=LrjHkZ9pXxPAKMcKwXt474HIosYpqD4gUupAefrJbMFXaAaiyNPVkCqn
 RSN9jMuNaTVxV568LGC5+I1ptVhNEEIxd2UhY/bIv3VTc8Q0aSIKMw5iT
 gScwLS5Q218ZO7/gJ2/SZVqOOGapv4ApI1MgjftFLqby14tVk7ujhYU74
 IA3W1pXQyAFax6rPhrlukOQXoAidfi5E2FiGIt894Y9Gp2QNcePmQYZ4c
 gCOGlO3Uh+cMYE6YLDI2j5CgKCbiilg5UvYEw7+3ZiaQ/y3+ZH4Hozwe8
 8Z04M96OFeCohIJo9zZ1B6WPQE+OoNOHs6k5NHcmH9cPF+S8Lugrlru/o Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="310853430"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="310853430"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 09:51:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="737952115"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="737952115"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO [10.252.18.173])
 ([10.252.18.173])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 09:51:31 -0800
Message-ID: <27d10a69-dc1c-8323-3c4e-01a98b26ee7a@intel.com>
Date: Tue, 14 Feb 2023 17:51:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
 <20230214112136.162380-2-matthew.auld@intel.com>
 <20230214161121.6t4qmvcx6fclzcmn@ldmartin-desk2.lan>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230214161121.6t4qmvcx6fclzcmn@ldmartin-desk2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 02/15] drm/xe/stolen: don't map stolen on
 small-bar
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

On 14/02/2023 16:11, Lucas De Marchi wrote:
> On Tue, Feb 14, 2023 at 11:21:23AM +0000, Matthew Auld wrote:
>> The driver should still be functional with small-bar, just that the vram
>> size is clamped to the BAR size (until we add proper support for tiered
>> vram). For stolen we shouldn't iomap anything if the BAR size doesn't
>> also also contain the stolen portion. Stolen should still be functional,
> 
> maybe a sentence that for the known platforms stolen is on top of
> of the device memory, so if BAR2 doesn't cover all the memory, it's not
> accessible?

Ok.

> 
> 
>> just that allocating CPU visible io memory will always return an error.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/209
>> Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index b4e9c88644e4..e5a992ce432a 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -150,7 +150,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>     drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu 
>> bytes\n",
>>             stolen_size);
>>
>> -    if (!xe_ttm_stolen_inaccessible(xe))
>> +    if (mgr->io_base && !xe_ttm_stolen_inaccessible(xe))
> 
> 
> what I wrote above made me think:  shouldn't the check for mgr->io_base
> be in the xe_ttm_stolen_inaccessible()? or should we differentiate
> between CPU vs GPU accessible?

Yeah, I think making it clear that this talking about CPU makes sense. 
Also GPU access should always be possible. I tried to move the io_base 
check into xe_ttm_stolen_inaccessible() in the next version.

> 
> Lucas De Marchi
> 
>>         mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, 
>> stolen_size);
>> }
>>
>> -- 
>> 2.39.1
>>
