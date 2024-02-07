Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AD6C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 01:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A09111301F;
	Wed,  7 Feb 2024 01:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGr1fTng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030011301F
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 01:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707268740; x=1738804740;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/jmCBvy5nMbfyEY1rH7YEYR6ApSTA1osa4twK72oJbQ=;
 b=iGr1fTngGlL6RvM7b9sEGPxG29pR8yiy3X0nyMAXYLfO9HK2hWXJbDKr
 9QCCSc/yfJluQhm2hT0x+5GVfPX1ZwPawBJdqOt/f0S0GIfi9w8xdD3ce
 DEKXBZ7LY/iKe9rPjemt/Z4zLk+cQQOTQ6uQZdxo0Tj5f/pTeIFEdqX1k
 TGLy33myR5qlu9wsO8Q7jJMprkbKbw5FfkC+w2CM5FAN0lMVJo+pZnHRp
 RHj3pxhZxH6t+ADlwt7cMobhgk7scyx0/F7s0BgWyMSA3Qmpu/+Vsedsd
 7jtR3IzdwKS4BJEDVlge+xUL73S9RnY/0ol4yTiAqH8UmGiZLjwlizY0g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11467664"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11467664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 17:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1464464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 17:18:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 17:18:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 17:18:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 17:18:57 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 17:18:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHti3AguB1LKHQHgnY4o60tbnS4vvWP5YLrw+Tp7sChnStrq6ieLjKgxBRggOqsrcc1cyIrBPrq7BEsKYE58ahdVioIcR8kYgEjC/hw8mDppC/UQGeP6zApOhsgfnuC9ILZGi44XGGOLCCOK9Gms+KRdtiyVXy1MiOIlJbX+hOHMNaSP/RJGl/ptO7zkxfIiKdYVVyIhCQxsjECc8nDi2k2oVAfD3EQV3TSUOEIVockuG+d9pXOXqUMyCBlUwctvIompN/wZQrnLyxyqJiyv2fleVoUV+C37bfIoPvumjjqKKppjZD0Kh12mQfsjWZapDDEyL2P95tWLHNe046hN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFya4eZC9LKv7eOCbDzoCAgBYcDP/GY3sTRcwOxwpDg=;
 b=KiPqlstI15kXni74Mh7zP2ZBGZ+TPwi0mL3dY4NSKJB6febKz3w2I3ntl65OrUvOOfD8Immxhe4pk+GfKaND258zyplt6S65B0QJ3Xyb2l2fktZlpbRaw8CCXncZXefr7RXB+bf0kYphMioI4eEeeKbEqa6DlVrsdvAZojhwdqWHHC889PprnmtA50ROiQ1L5sRpax1m0YCiQYD4wmPKcN6+h9MOFLW9PxNdYeWwA3mzn/s50WFKjaOFu71D0q39IZ7yU4vNW0tNbH80vahjuHtWOz3K4RJiFCQK5s53ANqeYNptSPeDmvy6z4J4i22n+GnDsKQJbV8OqCkZUiDBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 01:18:54 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 01:18:54 +0000
Message-ID: <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
Date: Tue, 6 Feb 2024 17:18:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Matthew Brost <matthew.brost@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0374.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9995b8-c129-462b-9b9f-08dc277abfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhvUfEyHMAyagR0tpR0eCtkNNeFUn8RI+ijfGqVZNOCtOh8IdKgV+zoOGfRwc8In5ZFN8EAOTWifXAchlB0e+0Zw6SrH+0Az617JyCnSa6IP/m9qOtQDY8AytzG101XFUPVJUWO/5/Wz3Zt3phTS32/OJJyW7Ely5qYSrn1uKI8uw9DNY2qRdHYPWSS8YVbiuDR9UEz+fmDAMxwmi+TC36seuyFla5mVw+sgTJKcRkg8yJDbe96XZ4dOTSri/szhNBTXAbOxWzoEnWp/O4YGMFcsrQ08sw1Lqp5rLLjWlK8PX/kiiJJJOKQSmviKWhO1kUi+DkxCRmZh8+B/ndI0eu+4Yv+iWwDcbrwr0VQXf7TPqCdeszD5vEeFUsSuHYO76GR0TbTi7RWPkBRjcCoQm0Jo3JETHxNqbqCCaNYCiZFzJMAw0mAMpvGkuNfxTV2zHyd72Id8Sa/V2CTn3Z7uXxlO21h7zKG/sCS13zoqSRdLRIMNP3MxA3NuTMYKm6q+6veWyHbDm1jR7sjc0i25G+ntnkPQx0PY9KtuN25WXtfkVd71zASYEbS3lMJfWg2nlmVQl+A8KT8ftlaAr+9c22Gq5WhN4uCjjs4+QztNp55PkQt3tXRzDRH2oN9CHpztUKXaPWjY5sRU4d1+crNsMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(376002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(54906003)(66556008)(66946007)(316002)(66899024)(66476007)(2906002)(5660300002)(8676002)(36756003)(8936002)(4326008)(83380400001)(31686004)(82960400001)(38100700002)(6506007)(6512007)(6666004)(53546011)(478600001)(6486002)(2616005)(107886003)(26005)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um00S1hGVWZsbjIvZ291K1Ixd3Y5bmw4UGN3OWE4M3ZPeVNSNStjb2hnOUcr?=
 =?utf-8?B?cVdxNUhyd1o0NXh2WE80WW92bm1UQXFqTGUvRGszeS9aS0ZFMjhsQnVFR1lh?=
 =?utf-8?B?blpxdUF1S2FJdTkraG1pTmVEMXYwNTE2bUkvSEgyNzhqbDdBc0F0UWpER0Yr?=
 =?utf-8?B?L01tVFhHa2wzMmhCZ1VFZjVhTDg5UzBSaUgxU3NyVTlpSzM5VGZJU281cGNI?=
 =?utf-8?B?Y05oK09oUFFBWTBLOGI4am05V3diMUNuMDBXZURtV2tGV3ZOcHlOMC90aTRN?=
 =?utf-8?B?cXN5OFRFYXB2c1JrSWpwYzF5UWt3SXU2VDN2STMvd0lDd1Q2a2hQNVUxd2xL?=
 =?utf-8?B?NnlKL1dwaU80R3RIRVRYM0xYUS9tcitxbWo5aHIvcFlGRjZZdlc4NnRUcWl0?=
 =?utf-8?B?c1V5WXdydkNlRXFEV3B5VmhvS1FROEZ5NmtwOVRteFp6S3BubTdRc3U2QlJL?=
 =?utf-8?B?UlVJem91eFkvM2wrUnFqeU1La21ZUCswblJDeVZkeCs5Y21ZdERIVjlVcE1R?=
 =?utf-8?B?eklJYW9DOURzcnYrZ1RhblBGT0xoMnBHbmZEOWhpMjBVWUg0SFJERXJONFNx?=
 =?utf-8?B?d1EzdXZkbmx0TnBYY1pRbERnTzN1L2kvRCtJRGNWazQzbnlQMExLcWZzaWhI?=
 =?utf-8?B?ZHFYOW9XMmdKUWU0WFFRMm5uSitERldFV2xPRjNLYjdMUGQwSFRIejB4RjJv?=
 =?utf-8?B?NFFxZlpoZFU5VnJ5cU5wYlhRbkZMZVJOVGpJT0JYbW1FajJZNU1vblI4V2hi?=
 =?utf-8?B?SW1QZE4yWmdGeitxQTFNUmNCTXIybEpQMm9DeDNKUU9oV29lbjNkZVp4dGlO?=
 =?utf-8?B?UDkwcmdHNWFtZU01L0lTTTFacFpvTkJyTkdVTHEvbVlubnJnTzJNWXNBWFBR?=
 =?utf-8?B?S0MvRm5vZmh2ais4cUp4bE5qSUZQL3ZaU2FCMVhEMVQ1cTVyR2ZFL0FuNktO?=
 =?utf-8?B?VDBndUZFMHhjKy9ULzhxQi9CVHZ0WjhqcFBpcnd4Znh2bTdaK0lEbkZ3SXNj?=
 =?utf-8?B?S1JFSzBYUmpidzJXNUdsYVc0Q1ZMN0NJZG1lWjZ3eWFGOTc2akpKSWpHa2tF?=
 =?utf-8?B?Ulc0c2htVWswUU1XVlZQWlJKbmRPMjJocGdYcWY4YmFhUzdHWmc0dXE5Z2ho?=
 =?utf-8?B?aEpyS0JWQTJUZ0QwbG51TWdnM1JQQWlKOVFUNGw2Nk54OVhidFJVQVFtWVly?=
 =?utf-8?B?dzdWUllrZDFIN3gyNGYzSEFuRlNOakFPc1VsVHRidTRvRTIwdnp3RDl2cEo4?=
 =?utf-8?B?bDFtdTZmN093WW9xd1hLckFVNXFCdHJrNjFsckRrTXJCbTZSY2dsNDdyRXFL?=
 =?utf-8?B?VU55eUU2UE1QN0ptc1NhaGlUOCtnbFFYNXhCR2g5bDNBMmRZb3BKYVo2VmJP?=
 =?utf-8?B?NWtzN0ZzVjJZVFNkdDgyS3JMNGE1MXM3cHR6S0N1MDhTM2dRbzBDekkyUkZW?=
 =?utf-8?B?UWswSlBrUWN5RUhZY0RTYVgxWG1jTlNYTkRoUTVuU3VYb1FJeVliQ1NieUg4?=
 =?utf-8?B?M0RWd3VtTVNmK0J2WkdPRm94MFNjSHlvQjRZK2FVMkNzNUZ2UlBEUDl6Unlr?=
 =?utf-8?B?dHMwb0NPZFY2S0hJQ2xUNnZIaWtXMGNXem1oenUwWTlOZElveWZLT2RNVWN1?=
 =?utf-8?B?UkkxNE55RXRpVDJJRUdvclA4UGRqTkNlUFpzYkdsNXBkcGh6N2M1MXdvMmls?=
 =?utf-8?B?N3JYMTc1bW5CdU1TQ2kxZEhkQzc0SmRxRHNXZllMcnZyWUVmZTREUlB0QmRK?=
 =?utf-8?B?OGU4T1RGZHMydGg3ejFoWkJYVnVSejBEcFJ0R25oL3N2c0Q2OG5EaHY4bEwy?=
 =?utf-8?B?dnZqa0JleHUxUFNkYnpRU0tvNVFBOHlzVHllL0ZISEJ2TEJFNVNPb0RMWGdn?=
 =?utf-8?B?SW5IbERFNkVxUjkwWVc0empjR3lhSGFvb1kvZ0dNN2Y3UmRRanI5MExRY0lW?=
 =?utf-8?B?L1FZTTVZZU1ndnQ3OUhOcnVzZFkxMnNMaVExYVY3WlRCeitLeno1U3luZmJP?=
 =?utf-8?B?dlhGcUJ1SUpHc1VDSGQxNjhUMlBvNzlicldXSE9JSjB6V092N25BTWpsT1hs?=
 =?utf-8?B?K0J6MTh0eGFLbE1ZVG4ydThVZDNXRXJ6emVPV1BzZit1WS9TYStJWGpLeElY?=
 =?utf-8?B?ZVBabWZ3Yk5YdjdXRklaTk5ISHNKQ3BmaEp1VlhmdTNrSHQ2Q1pVVDNkZlZa?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9995b8-c129-462b-9b9f-08dc277abfe6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 01:18:54.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrgib0kkZwsQJVyApKo9rsPtBqbNe1M28CFQhfoavpDaBUTXQGJMPkf6aw3vce53iHDHjh5TiBehTub4hnr20be6YXUUSEWNvy0QgL1dT3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
X-OriginatorOrg: intel.com
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

On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
> Supporting older GuC versions comes with baggage, both on the coding
> side (due to interfaces only being available from a certain version
> onwards) and on the testing side (due to having to make sure the driver
> works as expected with older GuCs).
> Since all of our Xe platform are still under force probe, we haven't
> committed to support any specific GuC version and we therefore don't
> need to support the older once, which means that we can force a bottom
> limit to what GuC we accept. This allows us to remove any conditional
> statements based on older GuC versions and also to approach newer
> additions knowing that we'll never attempt to load something older
> than our minimum requirement.
>
> RFC: this patch sets the minimum to the current GuC version (70.19),
> but that can be moved one way or the other. The main aim here is
Ideally, this would be bumped every time we update Xe to a newer 
firmware version right up to the point when force probe is lifted. At 
that point it becomes fixed and we have to add the version check support 
back in for future w/a's and features.

Get's my vote :).

John.

> agreeing to stop supporting very old GuC releases on the newer driver.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>   drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
>   2 files changed, 16 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 868208a39829..5e6b27aac495 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>   	return flags;
>   }
>   
> -#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> -
>   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_uc_fw *uc_fw = &guc->fw;
> -	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> -
>   	u32 flags = 0;
>   
>   	if (XE_WA(gt, 22012773006))
> @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   	if (XE_WA(gt, 1509372804))
>   		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>   
> -	if (XE_WA(gt, 14018913170)) {
> -		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
> -			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> -		else
> -			drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version expected >= 70.7.0, found %u.%u.%u\n",
> -				version->major, version->minor, version->patch);
> -	}
> +	if (XE_WA(gt, 14018913170))
> +		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>   
>   	return flags;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 4714f2c8d2ba..e5bf59616f3d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>   	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>   }
>   
> -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   {
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>   	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>   	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>   
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
> -	xe_gt_assert(gt, release->major >= 70);
> -
> -	if (release->major > 70 || release->minor >= 6) {
> -		/* v70.6.0 adds CSS header support */
> -		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -						 css->submission_version);
> -		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -						 css->submission_version);
> -		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -						 css->submission_version);
> -	} else if (release->minor >= 3) {
> -		/* v70.3.0 introduced v1.1.0 */
> -		compatibility->major = 1;
> -		compatibility->minor = 1;
> -		compatibility->patch = 0;
> -	} else {
> -		/* v70.0.0 introduced v1.0.0 */
> -		compatibility->major = 1;
> -		compatibility->minor = 0;
> -		compatibility->patch = 0;
> +
> +	/* We don't support GuC releases older than 70.19 */
> +	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
> +		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
> +			  release->major, release->minor);
> +		return -EINVAL;
>   	}
>   
> +	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
> +	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
> +	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
> +
>   	uc_fw->private_data_size = css->private_data_size;
> +
> +	return 0;
>   }
>   
>   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
> @@ -424,7 +416,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
>   
>   	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
> -		guc_read_css_info(uc_fw, css);
> +		return guc_read_css_info(uc_fw, css);
>   
>   	return 0;
>   }

