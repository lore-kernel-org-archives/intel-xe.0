Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333F5E7490C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 19:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F067E10E22C;
	Mon,  2 Oct 2023 19:13:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8E010E22F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 19:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696273979; x=1727809979;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S7Q6JNaUs2w1VpyDktxVtQtuUl2f0qZro+1WCiS7DxE=;
 b=XjW7YtCKpdtUIghEPC/aQ/t7aTc82OCSRUEQFnF/qGXsuMY0votG18Cb
 DoLKwfeXjgFlWUpKOkjLjnuO+AGXAj8mNOoENQDUDDiir+nAsHt448Xwm
 ZOw3Y9URQ5sYligvTFp3COZH1xqdGAEK7HzGcpKRZOHuS481ynm6yxX8h
 LJo9g+vvlrrnQABWfPNHfYviB8yfUiM29ewCLOR6x43TzzPqclXac+0ji
 bqUVDSmzMkUYE5PxXPZzmcxxUby9UjbjwK0dVm60CtUrkqCYZa5uMAU8v
 uiGSSlyxhWu84WyPJd1F2NxaCT++GvvI3DhYvE8YzQmS7eVnNyTlwKJFB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367761611"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="367761611"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 11:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="874443050"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="874443050"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 11:45:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 11:45:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 11:45:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 11:45:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 11:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aacuZyYy14UtDCYPxoc9afBYopEU4GW/cyBPRjQfnTgEiMz8Yo9R+HYDUCYpo5Tu4/nSus1gRSOBz3Hc691el6/h9CvptRtBqPcpsmKbS/GrCjoqjcNFatkANwAMaedrQnhuP9OynQFMdKmPPGGnxJ/B9OGp69MsgkvEcfU3QjiSRfU7bnmpJTy6xbabLQbyIMAoONQmHUIyBsvk3ifbA0/VSonzhHBqPVYbDDQHSMmLLbJg/QrtfPU59IcWtQiLpVWyS7pKbTWWbTd6BiKu8KR5/hM7vTjOOUr6lWdEYFQLqGAoQy/xDjSr7wgtdOv3KnWV8wQFdQO96dc8eRO/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScEe04nZ85wWEVK1jsejTwV2tK9q2nNoxhJzI6UmA6Q=;
 b=NYF6sjJCwvJikKoagV0fUy0043u/1v0QzmeapotaGJrSvh3nNiQXqRzcoDigOu6E2A79v/+m6IY7LhSjkdcarwrvlgb0Q39kDcVS0v6oFRS6ohcjDu8rHySHDDYIw6WicBBXpJknDKQdWZwErBv5jZ5qVLQDbTCHqlGmjHqWFRKUziu0n7WsrRufhiodN8p31ui3E/QVYogMU8tBfRav7JqigQyYglXjxhrNmwwfFX0wD4X5HWD6aklCIJ67lxK3Ez8XSZh1aKHRtuK3wOqXs9adpeJ/zBiWn53y0uLG8XlDLq8x/GB3LWTElY2BvQhZPOqq8yoyktQUmDMfY1deRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 18:45:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 18:45:52 +0000
Date: Mon, 2 Oct 2023 13:45:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ngeqrb2ilnq4tvia6nxw7nq3sloheww5olov742qzau7s536hg@lngbih4sujpe>
References: <20230929044959.3149265-1-lucas.demarchi@intel.com>
 <20230929224354.GM2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929224354.GM2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ee700f-4f2d-4957-bda4-08dbc377cd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+/CWwUAGLT5EvoR4HIYpeEkd/+NMkNVyXb/AXGVTmEfM7OMMlRvjuH97jUOs3iML2Hfgx1QCS8cSVzhSCCXGIl/bEC/QZyYQ5oBFJv3yrrlwke4EdwhppdYw98XlexJoCUTZhl1BppTMlTu0nvVA7Ln+W6F7P5XhmKTcMCUnbBIDU8e+Hf5ENZvq6ZyMnCzNH45wWJA7rAFZpQf52NjkHavN8QtdFx9V7BM9gyKi709yV3RrLEfkQxO0ByJPGIa60nv/8JknElpbW0ltsAVnOc5bC8cRfzfOrADNX5NHlQZf4AKJbEAC2EUePAJxBKvvPlqLPxR8mua94g50wpaiOpOce1LPys6Rt1IbS0lc1aP1r/4IbjtotKjLxTo4pgq0b9b46sIKpnVTt8I+pBuSwz9OGLHTXj8rIIhjCdAJVYcDIKwF7PIWY67asZrA3sC5d+UhjZ9ehTUFaHAqOId+BTE033tuUHvksSP2N6zH+vZtH19J/Ll9F9EsqwiyLLkCGHXUDh7/kzIlnayAuiAjO3ZffsrszzqHa76xZMPdFoUQViZdL2gPWXWvGkZUdPX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(6486002)(6666004)(478600001)(38100700002)(86362001)(82960400001)(33716001)(2906002)(41300700001)(83380400001)(66946007)(9686003)(26005)(6512007)(8676002)(5660300002)(316002)(4326008)(6636002)(66556008)(6862004)(8936002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YFWfKkueakrX68Er9cAFCsQVRAkidlXeo0Sk1RIzC5T3CuaO5XXilVvuR1Kf?=
 =?us-ascii?Q?DSnHdWD1xLa2w3ZG6NCrkgk0yG0T1xdvGJhEyet+DToBOJaEKWTRg5lXdk9H?=
 =?us-ascii?Q?TP+LjHMGUnQRWwSRfL9IpKvLQV7CSyFWfSc0AsmFTVWavG1mbCTx41B3Riyh?=
 =?us-ascii?Q?krU6E261E1VHWiyPAtRAKJDp6EgrvKagyEbqE7LGHxCrpXSE5ZAhj/l3tRmi?=
 =?us-ascii?Q?TmFGMC2/TqXNNW0bzdpN3Ye+xAo7r2/aYIBkpGAbLb8OwN0P2d2G5D+jsUwp?=
 =?us-ascii?Q?N4YOW3JR2r19cc26eLSKJQzdPls72qMkX9dHeJRofbKfjd+yl8cYX2Pbh2t9?=
 =?us-ascii?Q?V6a2yR9FZwR18Z764PIE7XL9tfIeShv1R7jjszx5axGw6XK2ktBdkqVeSJqd?=
 =?us-ascii?Q?Nphs8qdiZeYfiMUv6bhBVGu0Nf7zZvui5BgGkCZ6kwJhVEvyQKriPDfesGRW?=
 =?us-ascii?Q?rZS4VHiT0w8G3kmqykvEujDiuO8TT1ckbxlOBWTzAfaUsZKR5Duf34zSTmhF?=
 =?us-ascii?Q?davSW2u3a4f0EynKFlVijag68qx2cD36ioQlVd/dUWq0dRWC4AbmbA6wazEA?=
 =?us-ascii?Q?QT6Oh6fAOsfiELqnhw6u9EvxEV+aZMI08oCKqwrNEiugPxOS0Ntcby3T+IQu?=
 =?us-ascii?Q?YndOe2Qabmk3WlF7H5a0qtV6+YaEHs4lb1+e/ie/9jlyX2vPoicshUEr6dgI?=
 =?us-ascii?Q?BHDTeYLg6FxVosdALEqNGq9gPH9RyR+cnNswVdv1TSLGT1gViIMXLLn28qVm?=
 =?us-ascii?Q?mzPKVUtYgl4RlQJAC/QalNwld0IdM7IoE6z4EiaaXTpZBSrcDpM/0Ij9f8ZA?=
 =?us-ascii?Q?Zb80q/aqcgGLhLX2GybopDkdizUytMY3Hxc6FXaOE3maGnY1xCslna9w56ym?=
 =?us-ascii?Q?dsNNENgCdNdGU3tcLPYDB/8SeFwy/gBOK+tpGUxsWxG+qFPP26DbXi8CBAxe?=
 =?us-ascii?Q?wV+4rrftuu/fHVjqndbdJyMLvdEvyPV13yTc1FJrzoZAmCrfR3cz9gdG+Q4r?=
 =?us-ascii?Q?xyP1ExsABFrHAI1x2UBHBwu0Bf9nOer+dSNS/qreAvElj68MkWQBbhrlkRCf?=
 =?us-ascii?Q?dA1VU3+Do6XR/sETTN808WJWHtC+TykfVbPWd419UaImulHtSBZBfLJvj3EC?=
 =?us-ascii?Q?QDMXyZDdGAUqTEwJvocaxUbu5V6RXYLsmLZsZGcp2wLBekny5MBTF8uTSDhd?=
 =?us-ascii?Q?Re3t2XyDC/v+qBEIoI6bXone2SBuVI/j6uhViN5hQN+BOH1WtuDklUa8PZYg?=
 =?us-ascii?Q?YSl1834t0oEs2UXf7NqekianOkn0fXHHZC1tDCzjIHaQfNVFNYwSKap8UDQ4?=
 =?us-ascii?Q?Jq3He0rREeEr0AxG2CV8JLECpV6NffuXC/3r2oWnjXt7z5FIcXy6iE458EXS?=
 =?us-ascii?Q?o+fj46bZUtaPnwL+V26UjvqOtEQoayO0Z1OS+bqx9RhfGei5zStjTDjNqE7Z?=
 =?us-ascii?Q?hn+F6ucph3gdxDwLtdC+kfsMgjrou5RGbqg61JXSNH6vUFqgEZoe1E+Rcgju?=
 =?us-ascii?Q?jUN+XcxhRxLH9aUJ4fsX/WrVPJfqLAXsARa0a4y8D8fu/UV0anerD+Dgf60m?=
 =?us-ascii?Q?sp6A+9Gpx+J1RLF2c1J8r7Cqk+JFOGXcZk/i/m+L0EPoaGrg0ribi1CNiBWH?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ee700f-4f2d-4957-bda4-08dbc377cd9d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 18:45:52.3499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TRZTgFjnuDfmlKb2LhvH05apPHDxQASsJ+W9CB7WNAu4XTUYE8fjQA55MAQsV9TS3ySzLU59YPZ9cGLPiDz5bESJNbgWvsVLH80rs/ypkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Extend reserved stolen sizes
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

On Fri, Sep 29, 2023 at 03:43:54PM -0700, Matt Roper wrote:
>On Thu, Sep 28, 2023 at 09:49:59PM -0700, Lucas De Marchi wrote:
>> For xe2, besides the previous sizes, the reserved portion of stolen can
>> also have 16MB and 32MB.
>>
>> Bspec: 53148
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>While looking at this I'm trying to remember why we don't need to also
>use the media WOPCM field (13:11) from this register?  Is the media
>allocation already included in the value we're reading here?

it should be included already as the media wopcm field isn't accounted
for when calculating the stolen size - bspec 67090.

Maybe more clear is bspec 71410 showing the base and
Gfx Device WOPCM Size including everything.

Applied, thanks.

Lucas De Marchi


>
>
>Matt
>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_regs.h      |  2 +-
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 32 ++++++++++++++++++++++----
>>  2 files changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index 8a93ab169e04..dbb0ea1a585e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -69,7 +69,7 @@
>>  #define GSMBASE					XE_REG(0x108100)
>>
>>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>> -#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
>> +#define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
>>
>>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 6ba6b1b7f34b..79fbd74a3944 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -86,6 +86,29 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>>  	return ALIGN_DOWN(stolen_size, SZ_1M);
>>  }
>>
>> +static u32 get_wopcm_size(struct xe_device *xe)
>> +{
>> +	u32 wopcm_size;
>> +	u64 val;
>> +
>> +	val = xe_mmio_read64_2x32(xe_root_mmio_gt(xe), STOLEN_RESERVED);
>> +	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
>> +
>> +	switch (val) {
>> +	case 0x5 ... 0x6:
>> +		val--;
>> +		fallthrough;
>> +	case 0x0 ... 0x3:
>> +		wopcm_size = (1U << val) * SZ_1M;
>> +		break;
>> +	default:
>> +		WARN(1, "Missing case wopcm_size=%llx\n", val);
>> +		wopcm_size = 0;
>> +	}
>> +
>> +	return wopcm_size;
>> +}
>> +
>>  static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>>  {
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -125,10 +148,11 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>>  	}
>>
>>  	/* Carve out the top of DSM as it contains the reserved WOPCM region */
>> -	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
>> -				     xe_mmio_read64_2x32(xe_root_mmio_gt(xe),
>> -							 STOLEN_RESERVED));
>> -	stolen_size -= (1U << wopcm_size) * SZ_1M;
>> +	wopcm_size = get_wopcm_size(xe);
>> +	if (drm_WARN_ON(&xe->drm, !wopcm_size))
>> +		return 0;
>> +
>> +	stolen_size -= wopcm_size;
>>
>>  	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
>>  		return 0;
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
