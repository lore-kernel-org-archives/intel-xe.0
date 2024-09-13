Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68F1FA374A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 12:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B2210E19B;
	Fri, 13 Sep 2024 12:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYsjgFGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2276810E19B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726231242; x=1757767242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B3aQdvSJL5B7nHEuu2+nF/4cQ04xA9awR9QJAs+PRpM=;
 b=QYsjgFGKOgfmI2xOd9DI2w/0XB6/sMwUHe2hzIzdOTEChUlzblBP7XXE
 ABQqnsywBIbEwAmV3onMbC9iWmrPSiyrZClZ3E6UECmY0+JU+muqHjWKw
 L78awwi6wNDVw7QjqA2dvp1lolw4+EIMXvW+iUz+1Me671aU/uCTH5I1i
 zPgvMq6+NM0n/gI/zcGF02dZePuRj+QlUnokiPqFXatjvCEpbE5hUJ1F1
 CKELjW/wrpeSfJPQIOlp8NSQT/9geOkQZl6c+t3qInejSiIri/vKSt+ug
 i/g0lkdnJw+f/ECcc1QPmaq5BikQtnhAzWcisLsI03HhXeWXqH91WkFOY w==;
X-CSE-ConnectionGUID: hRcKlRhPTVSEbfna+PFPHA==
X-CSE-MsgGUID: bQ1yj5XWS7yOrvUzoMW9+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28908938"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="28908938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 05:40:39 -0700
X-CSE-ConnectionGUID: V/9kW3zpRzOy0bQcM9Awgw==
X-CSE-MsgGUID: GEuB+SGcTJ+h6Jp0yh/r5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="67901611"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.158])
 ([10.245.245.158])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 05:40:37 -0700
Message-ID: <8499dae2-e570-43f5-bd7c-388bb18b0b50@intel.com>
Date: Fri, 13 Sep 2024 13:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vram: fix ccs offset calculation
To: Andi Shyti <andi.shyti@kernel.org>
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org
References: <20240913120023.310565-2-matthew.auld@intel.com>
 <bcgfdjrp5jvkckdgsqpr26bnvkduvxnw7eliudh47uli6jerxl@frgpwy66hsdq>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <bcgfdjrp5jvkckdgsqpr26bnvkduvxnw7eliudh47uli6jerxl@frgpwy66hsdq>
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

Hi,

On 13/09/2024 13:35, Andi Shyti wrote:
> Hi Matt,
> 
> On Fri, Sep 13, 2024 at 01:00:24PM GMT, Matthew Auld wrote:
>> Spec says SW is expected to round up to the nearest 128K, if not already
>> aligned for the CC unit view of CCS. We are seeing the assert sometimes
>> pop on BMG to tell us that there is a hole between GSM and CCS, as well
>> as popping other asserts with having a vram size with strange alignment,
>> which is likely caused by misaligned offset here.
>>
>> BSpec: 68023
>> Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for vram")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.10+
>> ---
> 
> and... what is the difference between v1 and v2? :-)

I sent wrong version. Just a tiny tweak to commit message to reference 
"CC unit view of CCS" which I didn't feel was worth a changelog.

> 
> Andi
> 
>>   drivers/gpu/drm/xe/xe_vram.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 7e765b1499b1..8e65cb4cc477 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -181,6 +181,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>>   
>>   		offset = offset_hi << 32; /* HW view bits 39:32 */
>>   		offset |= offset_lo << 6; /* HW view bits 31:6 */
>> +		offset = round_up(offset, SZ_128K); /* SW must round up to nearest 128K */
>>   		offset *= num_enabled; /* convert to SW view */
>>   
>>   		/* We don't expect any holes */
>> -- 
>> 2.46.0
>>
