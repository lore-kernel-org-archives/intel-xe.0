Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B39C71141
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 18:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BFF10E6E4;
	Wed, 11 Jun 2025 18:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHdTYOLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3914E10E6E4
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749667557; x=1781203557;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PSdKjL8qnf1aR561WvhY2xaHezSiSwIjHIjXmsLumCc=;
 b=KHdTYOLPIEGLW3zSbUe2Q3sMTZpBnrhRXOZLQ51Abn6VbzMmxknD92lU
 8vim/GhYZdL5A40b8OliJDGHy95i3BZwq1FH4/UA6IQD/8BZm9Gu/ZKJr
 e2nEBi5bU487CI2TozO8coBWTZ5E9cBbp0z037/0fQO7WITiwglprHzJ2
 i5ha9BYWR4HGkir8BItWimIzLBoaApfKQ0CmNHdN7zWvIT7pjXX8esmsq
 xG/BDY31hVfZPwsYYfaNCAwa5jbin8ZlFZkS1RyqJ0CHveDsNa5ytrCd1
 f5ITfsECe58e6CagtHXh+RyKL8GU05Iy33vAsR0wBZ+7jNAO+7qPQsfxG Q==;
X-CSE-ConnectionGUID: Lwu49TBySFePlchaQNmQzg==
X-CSE-MsgGUID: p0IOm8B5R7aTKpDLGkghwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55626829"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="55626829"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:45:57 -0700
X-CSE-ConnectionGUID: Osn+bZYXQdersnyin84WQw==
X-CSE-MsgGUID: qtp8Qt2KQEWMuYA/hjQirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="152427673"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2025 11:45:55 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id ED11B3492E;
 Wed, 11 Jun 2025 19:45:53 +0100 (IST)
Message-ID: <32b0f2c2-cb7a-4a06-b20a-e1082cbfca31@intel.com>
Date: Wed, 11 Jun 2025 20:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Set wedged on Xe micro hardware
 initialization error
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250604234532.1167699-1-zhanjun.dong@intel.com>
 <0d72b0ec0f7dd251f42bcbbeae17ab7b5766c3d8.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <0d72b0ec0f7dd251f42bcbbeae17ab7b5766c3d8.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 11.06.2025 19:24, Summers, Stuart wrote:
> On Wed, 2025-06-04 at 19:45 -0400, Zhanjun Dong wrote:
>> Declare wedged on Xe micro controller hardware initialization
>> failed.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>>
>> ---
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> Change list:
>> v2: Remove unnecessary jump to err-out
>>     Drop disable ct, swtich to set wedge

typo swtich

>> ---
>>  drivers/gpu/drm/xe/xe_uc.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 3a8751a8b92d..bd1d4e8fab7e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_gt_printk.h"
>>  #include "xe_gt_sriov_vf.h"
>>  #include "xe_guc.h"
>> +#include "xe_guc_ct.h"

do we need this?

>>  #include "xe_guc_pc.h"
>>  #include "xe_guc_engine_activity.h"
>>  #include "xe_huc.h"
>> @@ -157,19 +158,22 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>  
>>         err = xe_guc_enable_communication(&uc->guc);
>>         if (err)
>> -               return err;
>> +               goto err_out;
>>  
>>         err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>>         if (err)
>> -               return err;
>> +               goto err_out;
>>  
>>         uc->guc.submission_state.enabled = true;
>>  
>>         err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>         if (err)
>> -               return err;
>> +               goto err_out;
>>  
>>         return 0;
>> +err_out:
>> +       xe_device_declare_wedged(uc_to_xe(uc));
> 
> On the VF side should we be reducing the scope for this? Is there a way
> to mark the VF as wedged?

"wedged" is more a driver software state, so VF should be able to
declare it too, even if this is just from this VF driver POV

> 
> Thanks,
> Stuart
> 
>> +       return err;
>>  }
>>  
>>  /*
>> @@ -197,19 +201,19 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>  
>>         ret = xe_guc_enable_communication(&uc->guc);
>>         if (ret)
>> -               return ret;
>> +               goto err_out;
>>  
>>         ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>         if (ret)
>> -               return ret;
>> +               goto err_out;
>>  
>>         ret = xe_guc_post_load_init(&uc->guc);
>>         if (ret)
>> -               return ret;
>> +               goto err_out;
>>  
>>         ret = xe_guc_pc_start(&uc->guc.pc);
>>         if (ret)
>> -               return ret;
>> +               goto err_out;
>>  
>>         xe_guc_engine_activity_enable_stats(&uc->guc);
>>  
>> @@ -221,6 +225,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>         xe_gsc_load_start(&uc->gsc);
>>  
>>         return 0;

nit: new line here

>> +err_out:
>> +       xe_device_declare_wedged(uc_to_xe(uc));
>> +       return ret;
>>  }
>>  
>>  int xe_uc_fini_hw(struct xe_uc *uc)
> 

