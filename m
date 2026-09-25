Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF7CC9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 15:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9474510E287;
	Fri, 25 Sep 2026 15:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fa1Q5fjB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1271910E287
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790351421; x=1821887421;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JfqHbKd+AizKlBo4n+H36dQb5fIC1B4QnS8M+4UuMz4=;
 b=Fa1Q5fjBQqTDweF7yAiQsxV/Z5p8pkkLXA2IGYZ/7EVfsyF3PCLunRro
 YPLBZkaos3ZejhoKs189cMt/pRtPjdE2WQcODKriTOlIixK9Z9HlIk8Aq
 1ScVhln86Y4vakT0NMoNjGmQBxeS9WO3fMDuHlz10haGe3x/16TUwsSv9
 6erWoEI6kF9s5MZ6afObtAaTUC+zacKWDb/A3K498FdvvXMMQEA+oIv+i
 PNYGzeBTkAhSp37qzyV68DS9zXnLtY6vM/zwspiLK4sOJyIzxXNI3dv0D
 MqaNsUPP6UBmhiBR8q3s7GqEM7ZilkCXwMQa9vIg4hPt4aTQgu9A7fKn2 A==;
X-CSE-ConnectionGUID: 82qy1vPnTjG1CUeXDU+0yA==
X-CSE-MsgGUID: 7SZRGnwTTVmrlaC2/FE66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93857654"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="93857654"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 08:50:20 -0700
X-CSE-ConnectionGUID: Eogw9pVrRqa+OE2JGOgvaA==
X-CSE-MsgGUID: RU7LPnVOQp6N4zohxHFJrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="270851557"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.107])
 ([10.245.245.107])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 08:50:19 -0700
Message-ID: <f2435a35-48b3-4e47-92da-b10d1fad361e@intel.com>
Date: Fri, 25 Sep 2026 16:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IFJl?=
 =?UTF-8?Q?move_no-op_ternary_in_emit=5Fflush=5Finvalidate=28=29?=
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260923171527.663537-1-shuicheng.lin@intel.com>
 <179023439774.201188.16946573147713318543@61270ab9df2a>
 <DM4PR11MB54564B760F772A5EA476603DEA802@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DM4PR11MB54564B760F772A5EA476603DEA802@DM4PR11MB5456.namprd11.prod.outlook.com>
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

On 25/09/2026 16:41, Lin, Shuicheng wrote:
> *>Patch Details*
> 
> *>Series:*
> 
> 	
> 
> drm/xe: Remove no-op ternary in emit_flush_invalidate()
> 
> *>URL:*
> 
> 	
> 
> https://patchwork.freedesktop.org/series/174833/ <https:// 
> patchwork.freedesktop.org/series/174833/>
> 
> *>State:*
> 
> 	
> 
> failure
> 
> *>Details:*
> 
> 	
> 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/index.html>
> 
> 
>          >Possible regressions
> 
>  >igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
> 
>  >shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813- 
> dd560c03f8fc40dbfadecfb761abce88b268be1d/shard-bmg-1/ 
> igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html> -> ABORT 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/shard-bmg-1/ 
> igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html> +1 other 
> test abort
> 
>  >igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
> 
>  >shard-ptl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/ 
> xe-pw-174833v1/shard-ptl-7/igt@kms_async_flips@async-flip-suspend- 
> resume@pipe-b-edp-1.html>
> 
>  >igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>  >shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813- 
> dd560c03f8fc40dbfadecfb761abce88b268be1d/shard-ptl-1/igt@kms_big_fb@4- 
> tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> -> FAIL <https:// 
> intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/shard-ptl-1/ 
> igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
> 
>  >igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>  >shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/ 
> intel-xe/xe-pw-174833v1/shard-bmg-9/igt@kms_vblank@ts-continuation-dpms- 
> suspend.html> +1 other test dmesg-warn
> 
>  >igt@kms_vblank@ts-continuation-suspend:
> 
>  >shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813- 
> dd560c03f8fc40dbfadecfb761abce88b268be1d/shard-bmg-10/igt@kms_vblank@ts- 
> continuation-suspend.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/ 
> tree/intel-xe/xe-pw-174833v1/shard-bmg-10/igt@kms_vblank@ts- 
> continuation-suspend.html> +1 other test dmesg-warn
> 
>  >igt@xe_compute@loop-duration-2s:
> 
>  >shard-ptl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/ 
> xe-pw-174833v1/shard-ptl-5/igt@xe_compute@loop-duration-2s.html>
> 
> There is no functional change in the patch. So these failures are not 
> related to the patch.
> 
> Thanks Matt Auld for the review. Pushed to drm-xe-next.

How did you push this btw? The change is in drm-xe-next, but not drm-tip 
AFAICT? Am I blind?

> 
> Best Regards
> 
> Shuicheng
> 

