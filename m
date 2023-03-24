Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20998C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC6A10E1A3;
	Fri, 24 Mar 2023 21:34:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71010E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679693670; x=1711229670;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hxDepZ8356M8n3GvrATTeQdMoRno6FPQs17EXaH4p3Y=;
 b=jAvghOWPt5WE+6Fy7CgjzHvUMwXOhZhgQCTeo4XBpQL1aVIIuygo35xr
 Vfy6y69IbfhLIK+PnxcUY+kL28jzAO/kYLsJA1dmm0+uAR56P1wMzduFr
 Kmzjt2ifuTW7Y98WJte2U4DaugGTToLbJIvVkYI1Ab1mhdk/LmPBqd+9a
 4nzfFLx8th03TAXAFy+oTZDzsUamrP7xa19WtOjbpxQc95pXMUQSEDCDB
 l2NqkzQ2P8PcXRHYZyjMUTeJl7agf4bQxmbaH+pwbueo3kGxUSL9iNp4r
 fkYNCNBPf5F0bcJcsyYy82BpL9A7zJVE+qUTyHkUF7lqO1M7NxOJuTS51 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319543183"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="319543183"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928802485"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="928802485"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.175])
 ([10.252.38.175])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:34:27 -0700
Message-ID: <5e44e643-ae8d-cd40-5b67-e86758e7d120@linux.intel.com>
Date: Fri, 24 Mar 2023 22:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
 <20230324210415.2434992-7-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230324210415.2434992-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe/mtl: Handle PAT_INDEX offset jump
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


On 3/24/2023 10:04 PM, Matt Roper wrote:
> Starting with MTL, the number of entries in the PAT table increased to
> 16.  The register offset jumped between index 7 and index 8, so a slight
> adjustment is needed to ensure the PAT_INDEX macros select the proper
> offset for the upper half of the table.
>
> Note that although there are 16 registers in the hardware, the driver is
> currently only asked to program the first 5, and we leave the rest at
> their hardware default values.  That means we don't actually touch the
> upper half of the PAT table in the driver today and this patch won't
> have any functional effect [yet].
>
> Bspec: 44235
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pat.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 645eb20aea8e..a713afdd0510 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -8,7 +8,9 @@
>   #include "xe_gt_mcr.h"
>   #include "xe_mmio.h"
>   
> -#define _PAT_INDEX(index)			(0x4800 + (index) * 4)
> +#define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
> +								   0x4800, 0x4804, \
> +								   0x4848, 0x484c)
>   
>   #define MTL_L4_POLICY_MASK			REG_GENMASK(3, 2)
>   #define MTL_PAT_3_UC				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 3)
