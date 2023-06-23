Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE412EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 12:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C610E0A8;
	Fri, 23 Jun 2023 12:31:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7377510E0A8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687523471; x=1719059471;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=184TRbrF1hDVI3Zrl2APETCjKkJ9zNdL/RXKHnQXtjQ=;
 b=ORDohz29csb0gBnmapoc6/4v5lFJsAJC7z7sRZjpkT0Gdf/tVl6BD1RQ
 yfB/d5g9a9t9PdoQt5r9/clJ1o102Q9TvjR2LZAPEu8CvPjZ471oPNfDX
 8ZuNm78Y0plZq0dc4VBsnqgyDzTmKF+znvqWaArd3eObJR3Y+949kdjJm
 gto8uSZkiTKjqeailekx4JS++ROV4mVB82doP2Na6tEcdUVlZeR9w7IGo
 jYGwh17q3EacNtKAVMuACkCFWb77lompsNnzwMNLFCLI//8Loen89R2ab
 8eNphERTKdFxCQDrPXRBabz5Q3a5JzmE04q9wfSfxmZZgaH/b9wYlxQno A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="358245184"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="358245184"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 05:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045634241"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="1045634241"
Received: from aelizaro-mobl2.ger.corp.intel.com (HELO [10.252.24.92])
 ([10.252.24.92])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 05:31:09 -0700
Message-ID: <03686f68-8478-cb70-c3e3-5978a11f2e36@intel.com>
Date: Fri, 23 Jun 2023 13:31:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Francois Dugast <francois.dugast@intel.com>
References: <20230623112920.147748-3-matthew.auld@intel.com>
 <ZJWOOhXiUFaWRS65@fdugast-desk.home>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZJWOOhXiUFaWRS65@fdugast-desk.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uapi: silence kernel-doc errors
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 23/06/2023 13:21, Francois Dugast wrote:
> On Fri, Jun 23, 2023 at 12:29:21PM +0100, Matthew Auld wrote:
>> ./include/uapi/drm/xe_drm.h:263: warning: Function parameter or member
>> 'gts' not described in 'drm_xe_query_gts'
>>
>> ./include/uapi/drm/xe_drm.h:854: WARNING: Inline emphasis start-string
>> without end-string.
>>
>> With the idea to include the uapi file in the pre-merge CI hooks when
>> building the kernel-doc, so first make sure it's clean.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 432bd87ca401..5da6a04bb478 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -228,7 +228,7 @@ struct drm_xe_query_config {
>>   	__u64 info[];
>>   };
>>   
>> -/**
>> +/*
> 
> There are multiple occurrences of this in this file, which seems ok to
> me. Is this one particular somehow? If it needs to be fixed why not the
> others?
> 
> The commit message refers to a missing description line 263, that is
> attribute gts of struct drm_xe_query_gts. Is that not the real issue?

Yes, that sounds better. Will fix.

> 
>      	} gts[];
> 
> Francois
> 
>>    * struct drm_xe_query_gts - describe GTs
>>    *
>>    * If a query is made with a struct drm_xe_device_query where .query
>> @@ -242,7 +242,7 @@ struct drm_xe_query_gts {
>>   	/** @pad: MBZ */
>>   	__u32 pad;
>>   
>> -	/*
>> +	/* TODO: convert to proper kernel-doc.
>>   	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
>>   	 * bandwidth between this GT and remote region?
>>   	 */
>> @@ -852,8 +852,9 @@ struct drm_xe_mmio {
>>    * struct drm_xe_wait_user_fence - wait user fence
>>    *
>>    * Wait on user fence, XE will wakeup on every HW engine interrupt in the
>> - * instances list and check if user fence is complete:
>> - * (*addr & MASK) OP (VALUE & MASK)
>> + * instances list and check if user fence is complete::
>> + *
>> + *	(*addr & MASK) OP (VALUE & MASK)
>>    *
>>    * Returns to user on user fence completion or timeout.
>>    */
>> -- 
>> 2.41.0
>>
