Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE72FC3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 08:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E14E10E30A;
	Mon, 16 Sep 2024 08:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlGKvfUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A73510E30A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726475567; x=1758011567;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cawxThfV/IQb/orQmuNfsIQsJ3BJ3z2tijWShK03/hc=;
 b=NlGKvfUIgMjjt5rqITmEuWW4MIIs0ttyEIQ8uZPa7Im3qSyYMufrahfW
 s6zdcNWkoLRcyshbA0GsmUMSSmT3/e/gMbA36/wteCUU1nDwWDPmn5RNx
 KalsCd7djZHRj3iw6fSPLphSZkwZCD03FpLjnltN8RgzNZYj3KIvxshrU
 fagCYIvBrk06JOr2yxRoGg/0aPomPvbW1i/JpC3XVWS81gj7SlP2VFp3i
 qb3wItT2c9oxkvSsN+00Sapuedf1A1ma2zgrF9UaC7GAhcUBJGI8uMY1b
 ElJhqXD8egSbQN1UKX8wttaDi1HC4oRex3DMzbKTInSv0mLYmsjaDdj7Z Q==;
X-CSE-ConnectionGUID: dGV2ALWqSU2OwZH7tSaKYQ==
X-CSE-MsgGUID: 8S4n90GDTUSXjckAaOkzNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25167313"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="25167313"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:32:45 -0700
X-CSE-ConnectionGUID: lMVOptgJR5STSwtwFi2yBQ==
X-CSE-MsgGUID: ge20VHTdTr+m74cBhVXgyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="68500622"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.77])
 ([10.245.244.77])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:32:42 -0700
Message-ID: <b6b402ca-243c-4d0d-af54-b20ac39b9ee9@intel.com>
Date: Mon, 16 Sep 2024 09:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vram: fix ccs offset calculation
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240913120023.310565-2-matthew.auld@intel.com>
 <DM4PR11MB54565C34141FA293E75209E7EA662@DM4PR11MB5456.namprd11.prod.outlook.com>
 <DM4PR11MB5456F540B3D043C896C4773EEA662@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DM4PR11MB5456F540B3D043C896C4773EEA662@DM4PR11MB5456.namprd11.prod.outlook.com>
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

On 15/09/2024 00:29, Lin, Shuicheng wrote:
>>> Spec says SW is expected to round up to the nearest 128K, if not
>>> already aligned for the CC unit view of CCS. We are seeing the assert
>>> sometimes pop on BMG to tell us that there is a hole between GSM and
>>> CCS, as well as popping other asserts with having a vram size with
>>> strange alignment, which is likely caused by misaligned offset here.
>>>
>>> BSpec: 68023
>>> Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for
>>> vram")
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.10+
>>> ---
>>>   drivers/gpu/drm/xe/xe_vram.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vram.c
>>> b/drivers/gpu/drm/xe/xe_vram.c index
>>> 7e765b1499b1..8e65cb4cc477 100644
>>> --- a/drivers/gpu/drm/xe/xe_vram.c
>>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>>> @@ -181,6 +181,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt
>>> *gt, u64
>>> tile_size)
>>>
>>>   		offset = offset_hi << 32; /* HW view bits 39:32 */
>>>   		offset |= offset_lo << 6; /* HW view bits 31:6 */
>>> +		offset = round_up(offset, SZ_128K); /* SW must round up to
>>> nearest
>>> +128K */
>>>   		offset *= num_enabled; /* convert to SW view */
> f> >
>>>   		/* We don't expect any holes */
>>> --
>>> 2.46.0
>>
>> The patch works in my platform.
>> Tested-by: Shuicheng Lin <shuicheng.lin@intel.com>
> The round up should be applied to the SW address. So, the right sequence should be as below:
>    		offset *= num_enabled; /* convert to SW view */
> +		offset = round_up(offset, SZ_128K); /* SW must round up to nearest +128K */
> 
> I applied the patch manually and didn't notice the sequence difference. With upper sequence, the patch could fix the misaligned offset issue.

Ok, will move this. Thanks for testing.
