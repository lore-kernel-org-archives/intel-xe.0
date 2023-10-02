Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2BEE7490C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 19:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B161E10E243;
	Mon,  2 Oct 2023 19:40:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A9910E251
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696275634; x=1727811634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xb+kSaYJ3HXHjidW5Mzy/yFL7/xWqe9CnbX3BjXVg4s=;
 b=X5ZtrXFrCRpF3hFYZavvHTb4JtXfu8otIVeR9Ne00bVEw3ZV2PQw3Tgp
 E0ymoPUB5m0R9Zlcg2Fg3UD5TaXG2JXZluzBPzCEz4iKE32dpsWBA5vl0
 yoYLwxPvg60XxH5wyzrPrqizpdt+NpZiFbH1Vpc2NqoCz/ZIKby3goI/R
 T9Fc+JTa/z4ZLZBwa4P1OkD19Ij7N79F+Das5KrkiMpNKEnHwobOBisEF
 oLc70kxYmSOrdwnf7Ny4mHPSZRSumiVb/Uh+r904zlZDpqwcGl/Xy/OgO
 oHwVgafctmwIIN2Cocf4p3oVTxGiWpBgafBrnCGr39n2QgFs8mBBeGhaq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381602147"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="381602147"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 12:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="924378414"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="924378414"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 12:40:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 12:40:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 12:40:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 12:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxrIWG045cg87pDdEVCIecZs5inSOPcHN2I0ChnEeWXnmsqAAfCHn71LBFdI1yrF05RoSHVkkmyxyd3cHQx8Sfg6xxIeLfQA+P6dp2kU17b6GpuaG81OtpF/FOE8YataFL54o5qgVjsOVWCVxApCBdbzqG8XGS6fFUAUP4rLnr+3nzDEHmqiSnFsNqydKY5eusBarI1Avpc1vg+PRDogQ0cBapuA8IktAXAJ92gbHbYqgPC68hFxTWSj1TYJ6sztWWR4WHNm2EtA+aQbxPU8RgagL6oflCdCHXnMDmEqeQGJ9Zts0fBupM/AxJ3TBxiwWAEhgsHZFyOxPO8jywFPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=262Fv/4btkOJjIvsdS/0Egd+ZADwJTTD1VbAdhbaU2o=;
 b=QggV8rDhlY5oHSzYZhuERewA6hnKZphkBhl5AaQfmETQewttjgAc3o7nvyXPN87AEBs32jzmdGDKGFQpw0XVO1lZd+9yrdlok5t8AEexDELp5IV34xDOULuDNtYPoDZFHwCXjKz+9D+25rrNqMXuNRR1Kg1ThvhCSZVmIbuyICgHl4fe1INgnFew1eNqGriwOro5NUX3TRomUG4FrVCdjZD/VlHUQCfs1bRh72xhxIpEplgM4FER79n67o+kl2I+5bIsG/cBR/mUzLoAyg3LV2VBQ733I2RYsccLa3w+FE3xnelrZqqrfb4z5E6MZSWFScldcxqZ2VnTUvLZDvvjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 19:40:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 19:40:17 +0000
Date: Mon, 2 Oct 2023 14:40:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <gagknlptaiosaop35746ldahg4nqygzgsyx2d2pr3w3nvtju47@ckdpnlbqxaqj>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-4-lucas.demarchi@intel.com>
 <20230929202540.GL233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929202540.GL233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f865390-08ff-4b26-c308-08dbc37f67ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwByHQmV+cGA6pnIZtPZ13XFCrHwRgpIL+qSFkrOahPj9glZ87T8ozzPDwUfzaBdVDcLKLJXlsTd2Ix9zWs41GtMwXFfLfHJ5wYcI6qb0RIdEaa/2FE3SYOrYtjRvV8wOtRHLLCXUumPiO9XvHUidZo8RqOv1SvHCmQKoea+ocOs0pNLjNkNsVKSuJwK3/2CD9t2rHua3saVRDzBoZkyrHAbtqw/KpPHJ9vuyhReoDoyshchZen3e4+Qqt5vLKo7WvAoeowx6wCrnJCDkuNOh6CQUVcgAxXLaQnd+HglO4ocWvyivRW6I10DJ227wdr5Rp8/K0WDZ4i20WwB8B3f54iC2geA3hRiO9RaBwHu5lX0O6Mzklr2AwsXcfjodvH8UD0jgaPU/cL06qI6Wz2TBbsou6/yMyj2ixMO9sKbIM+6btfRQRyfbgmlK92yXw6G+pIXmpsNMBJuaGn/HBVFMDX2OPENBvLQJuVm13WLVxhG0fqSAzpMhtIQjjYDogAyh5K4UZceMnUa+9fZ/NAqHbFAKr1Ghi+klaX2nOZX7s46CCt3/Fp0aMiUU4jKkHJbou2gHavfzAeaZrxdYAfmhu6rjJW39qMh0o55Ijtkm0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6666004)(478600001)(6486002)(6506007)(38100700002)(86362001)(82960400001)(33716001)(2906002)(41300700001)(83380400001)(6512007)(9686003)(26005)(66476007)(5660300002)(4326008)(316002)(66946007)(8936002)(6636002)(66556008)(8676002)(6862004)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WEci5Q1qKngeeUx92Ss/pA1ZWo2xqs3wFcqsb7Jb94KNr3WqIDEPw9aMRVD4?=
 =?us-ascii?Q?PxLJy4fX142ANEiNQ/PGVAJVrFw6SFqe6IyUIMuz9DyeN4NI0+w5jT/pBoZk?=
 =?us-ascii?Q?ZxosakmEYJwjuIHI+TAQispUrcC3Sh0MTRImcTKbY71g55cNGXrzZGxYkI0e?=
 =?us-ascii?Q?jhFnpMAyUSIVEfM6BVpg00AngMo4sgYEtuJY47R/1C2ChlCe5mgiMOhvXP9U?=
 =?us-ascii?Q?wyfv0zJHQDTwR6n0xKDtn4Tc9TuJYnCO2+WypwsBPHOQXrpdZGqml6qaRZV3?=
 =?us-ascii?Q?7inwiJLenUyxANNsSKxLiOxZgVGDd+2yJfFovlLlLkSNF5XIJyZi2K02KDOQ?=
 =?us-ascii?Q?7TAkfodb4RW4Xx38N33Bv3Wn6rywVLQQZsUXIMR9mBzm5QXMqWKfOX1+u6C6?=
 =?us-ascii?Q?T87Jz2wMEAqh8ajfAXtJbEVOvLEdDui+3CUnJ3YU86F0U0fzl/g6jXJkgSNo?=
 =?us-ascii?Q?URfwjlCIcmnwu6NUk1mmj3KYqPufPXzLCCNlExKV4ltc+B/RqaWT/lQujWAY?=
 =?us-ascii?Q?gC40Q+YuvR+C5VFU0nNolXLfhAFgiV9DeZdm17v3z2gb6Xyb9qM4eobsT+X8?=
 =?us-ascii?Q?hecSMsKiC7PLmah0NGz/MIainTPiK58ubUwQG2GKJeZg9yZ7o2YYEgUOCA/J?=
 =?us-ascii?Q?0szDcnEMqaXf3daOyhZNEcfzj91Ngjnuc8AQCWmMgPs8R7j32XyB1U+fPrlv?=
 =?us-ascii?Q?Yx4sI5qNQY6GLQ5RMUqetMe76r0qxiADQFXJUV/T7gbCXOU4a3H3Atl8dX4d?=
 =?us-ascii?Q?CzcWWBLLI6Zb/MxLJjzT9X8uLfO4nwW4ZQwOQQGosGhVQAOJxFfjqBFLaYMF?=
 =?us-ascii?Q?mBrGsjydw/BFW392Ow+EuTDXsJjAMoMmgSrmTIqhgsa0cEQStrjpstnLFTXw?=
 =?us-ascii?Q?3eve5IX/pNw6XXn+zca0CVE+WygxbJPoivEeW2Y/KwMyWllOdKwmR//VPHl1?=
 =?us-ascii?Q?IStcNbjF6cFTCLf+Xt7ekRgk/EZv1Ubingw7sWD93Kbe+ImVsP6PLmuy7v0B?=
 =?us-ascii?Q?XsEW22NItv/Kvju2jtx78ACznPk3GLfKShviHB8pBraUNftXphb9NFuD5sLs?=
 =?us-ascii?Q?Y0C5GOR7y8g+oRCo993g0La8GKXELl57aTI9AYtjHr25No0/Z2XuG0c7R/wA?=
 =?us-ascii?Q?G3eSkCeS33Rp5lwtYUWj5LqYVAvsfqA79QEOnVV0hESxe9HQWQHjWCqr+c1z?=
 =?us-ascii?Q?ykZ022sdjUJkpSqFnrN17ZOuo1+AQf/Cji+tk9oQpP0hlcToKu4Y3xJTNz80?=
 =?us-ascii?Q?QAgAuiiMXsxqmnZ4VqZ9va9KZgrI7eWVGloLkGjbWBKGpp8RTKEes/a1noL6?=
 =?us-ascii?Q?e7iq0RVtYDAsWhJrrvMBu5hgeOwja4qUU7hTrFdL4WFh2SKWDIK9otKe73bh?=
 =?us-ascii?Q?dgIC4DtPZBmGV8Cz/5YQ/dSnRqx+Nyt4K1ehmQtYkuo2oALPCLPNdgnfQ8mE?=
 =?us-ascii?Q?601fliEwAsQwp0mVN3sJN8n5EuC0HZkFjgLC9Zvze6MduIYBZNMuT5IIPtC6?=
 =?us-ascii?Q?NxAuHILxB+qdq97HfZ+IM97pEvYnOmSJgqBIwNiQS5H/OhdD9njlnWNeHo9R?=
 =?us-ascii?Q?O2C+MTOc5H2xouElsgnKcNT8uAE6Yg1iRZWzzLy9ocSYovciIJts+8dXfxw8?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f865390-08ff-4b26-c308-08dbc37f67ac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 19:40:17.2365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5T8pesOyTD6LCOgjySOxku0MeMErSMp5uTxQmqb+08SVtBjlIwKupQcQfFSKBMzX/zN2TXZcAYMuDfGrdPzrkir/jqtVK/HwS0s7ren3BF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe/xe2: Follow XeHPC for TLB
 invalidation
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

On Fri, Sep 29, 2023 at 01:25:40PM -0700, Matt Roper wrote:
>On Thu, Sep 28, 2023 at 10:02:49PM -0700, Lucas De Marchi wrote:
>> Register GUC_TLB_INV_CR is gone in xe2. When GuC submission is not yet
>> enabled, make sure to follow the same path as XeHPC.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Matches the invalidation descriptor structure from bspec 59311.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>Although I am uncertain that the general invalidation code here is
>entirely correct, even for PVC.  Since completion only gets delivered to
>the GuC (which isn't up and running yet at the point we're using this),

I think the point here is not about it being up and running yet, but
rather having submission working. These are 2 different things.

Lucas De Marchi

>we should probably be checking that the 'valid' bit has returned to 0
>from the previous request before trying to submit another invalidation
>request.  But assuming that's needed, it would be a change for a
>different patch.
>
>
>Matt
>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 99b54794917e..d7b3d008ce57 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -263,7 +263,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>>  	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
>>  		struct xe_device *xe = gt_to_xe(gt);
>>
>> -		if (xe->info.platform == XE_PVC) {
>> +		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
