Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27DBC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 16:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDBD10E09E;
	Tue,  2 Jul 2024 16:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aj1QG5yb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F5B10E09E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719939249; x=1751475249;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PN4luAVwpo5/ZjcwvytHNvBwMVrLMENhXbpiXVkbPCg=;
 b=Aj1QG5yby9vfl2h9J/woaE/+QexjM9vBH//NYGr8V3poj/IdwH8sw+Vy
 Bl2fwgjgjodPlLiYloxBln+nMQEMWBKYrQ1Zi7/i1otTXVmiVwMqctwwa
 SnXAJI4p+2E8t2rdfSOFm1b5ByOb/IMpX2In3EikNBcZa0Tc4RpWoh6FP
 /C59zCtrYsI19jdfGP8TgRmqCYkbcjT7QZv0XdVZ2ZjwHG27RXaM/kEuT
 YytriTHXou5yEvKuy5eoPqwl4dxd27o1trCG0NhMKRQwTgZDa8v7wrURy
 dN5vhZtCWGr0ji+sZYZfr1X7eYnoG92AntXTa+MbQKcIzjgCe8jNtoJrt Q==;
X-CSE-ConnectionGUID: qfeuKMSCQVmlux5AfaQiTw==
X-CSE-MsgGUID: MgtNuCutT62Zk/D/F5Oimw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27727722"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="27727722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:54:08 -0700
X-CSE-ConnectionGUID: IHjBsb4rQZio0I5LrBQpXg==
X-CSE-MsgGUID: 96UwvjwpTwe41j9P+7k7mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="45827091"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2024 09:54:07 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6943C125BC;
 Tue,  2 Jul 2024 17:54:06 +0100 (IST)
Message-ID: <e5e80301-f68d-4301-9dd6-cf49fe441884@intel.com>
Date: Tue, 2 Jul 2024 18:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Prevent use of uninitialized mutex
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240701231529.2582452-1-vinay.belgaumkar@intel.com>
 <ZoQm1JW_22Z1ZNET@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZoQm1JW_22Z1ZNET@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 02.07.2024 18:12, Rodrigo Vivi wrote:
> On Mon, Jul 01, 2024 at 04:15:28PM -0700, Vinay Belgaumkar wrote:
>> When skip_guc_pc is set and/or this is for a VF.
>>
>> Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index d88f5e960fbd..f7b468930697 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -26,6 +26,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_pcode.h"
>>  #include "xe_pm.h"
>> +#include "xe_sriov.h"
>>  #include "xe_wa.h"
>>  
>>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>> @@ -825,6 +826,9 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>>  {
>>  	int ret = 0;
>>  
>> +	if (IS_SRIOV_VF(pc_to_xe(pc)) 
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> are all the other accesses protected?
> likely because the freq sysfs is not available in VF mode?

in the VF mode we explicitly set info.skip_guc_pc = true and this flag
is also used by xe_gt_freq_init() which setup sysfs

[1]
https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/65336c3fa2cf7f272067be9193303d1ab7c42190

> 
> || pc_to_xe(pc)->info.skip_guc_pc)
>> +		return 0;
>> +
> 
> I don't like this skip_guc_pc... we might revisit later
> to find a cleaner way...

+1

also IMO it is little confusing that xe_guc_pc is still doing some stuff
if the skip_guc_pc flag is set

maybe we should have xe_power component that will relay stuff to
xe_guc_pc only if GuC PC is enabled and xe_guc_pc itself will be just
implementing the GuC protocol details ?

> 
> anyway, let's move with this patch. the rest is follow up.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>>  	mutex_lock(&pc->freq_lock);
>>  	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
>>  	if (!ret)
>> -- 
>> 2.38.1
>>
