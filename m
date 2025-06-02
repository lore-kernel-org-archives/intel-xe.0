Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6437CC54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 17:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9314089294;
	Mon,  2 Jun 2025 17:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYSEaMYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7F89294
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748884725; x=1780420725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xXA9gLJSVOfXIlTD3zr7Cd41sm2Md2Kmep+NnaITMq0=;
 b=HYSEaMYR4ra/IxS8UFZiworrwU4Q35soRNwwK4b/yAZnxy/A+/4hdslv
 SKL7TlcWF3UIRc9FH+eivqjGocPwRvw1kUZkwcIoPaG07Lxkpi9zv6xFX
 vDdxXo5GMGbSfwiPFpGZhy82QpMNN5DIlfcXSKNb5MzLIPt21fjQM0zNS
 MzvjjRtgGs1pU/18f65JpV8465OTPMedPArBcE3sqC8fSOBPEJUL8luVz
 EkvmXyR5JsJviVjZBIOMt5aFF2mu59W1+3YrYxPpYDrSeTyouO5A74OjX
 M4VUTZ9QsSAPmAKyWGe1X1qQboo/U3cvpnoCQqQEqTyPdfoPfzEirFsTg w==;
X-CSE-ConnectionGUID: Lsy/1qiZRDWbCVJXnuGgRQ==
X-CSE-MsgGUID: ZHoiQSqVTgqGZqjjZV/y5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54696403"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="54696403"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:18:40 -0700
X-CSE-ConnectionGUID: xBVArWRzTFyZf/KVpiLk1Q==
X-CSE-MsgGUID: WFpsWbUyQkGnmvijqwjkQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144475735"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 02 Jun 2025 10:18:39 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 94C6C34329;
 Mon,  2 Jun 2025 18:18:38 +0100 (IST)
Message-ID: <78247eed-19b6-4552-ba18-ffa158c812f5@intel.com>
Date: Mon, 2 Jun 2025 19:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use GT-oriented printer to dump topology on init
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20250530210524.505-1-michal.wajdeczko@intel.com>
 <CH0PR11MB54443585B57FC0012042009FE561A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54443585B57FC0012042009FE561A@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 30.05.2025 23:46, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Friday, May 30, 2025 2:05 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe: Use GT-oriented printer to dump topology on init
>>
>> During the probe we dump the discovered GT topology, but instead
>> of a generic printer we can use our own GT-oriented printer which
>> contains information about the source GT.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 516c81e3b8dd..acec6559e2f2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -12,6 +12,7 @@
>>  #include "regs/xe_gt_regs.h"
>>  #include "xe_assert.h"
>>  #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>>  #include "xe_mmio.h"
>>  #include "xe_wa.h"
>>  
>> @@ -243,8 +244,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>>  
>> -	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>> -
>> +	p = xe_gt_dbg_printer(gt);
> 
> LGTM, though the lack of a .prefix field might be a bit of a dealbreaker for some.

there is already function name included by drm_dbg()

	[drm:xe_gt_topology_init [xe]]

so this extra "GT topology" prefix was already redundant

> Maybe we can update xe_gt_dbg_printer to include an optional prefix string?
> It shouldn't be too difficult to update the function to have such a field, since
> xe_gt_dbg_printer is currently only used in one other place in the code, as far
> as I can tell.
> Though, if that's not necessary, you can have my
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

thanks!

> -Jonathan Cavitt
> 
>>  	xe_gt_topology_dump(gt, &p);
>>  }
>>  
>> -- 
>> 2.47.1
>>
>>

