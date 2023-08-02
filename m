Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FB2C001DF
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 13:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5557310E171;
	Wed,  2 Aug 2023 13:16:25 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564F210E171
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690982183; x=1722518183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6wNy5FRfNJPA2HWZvCh1XUIIV/OH0NPE50KemFx8orM=;
 b=ItDfoegsK5dQXpDyMH86w3HOojaT9ANqHrpDdWfBZHMA5bO3gMgb7aki
 YAH7t8wRIUyuxgBrZv5NVZ+Y1jPNTeNuOk/eG/Q53sUr7MnRw9mcXH8G+
 /svDy3gMM/Lvi0jS8FOCN9XN2zrzfPGp+4gJjqW+RpC3SoP05Ct23033C
 YMg6TE70yQa28AKVAnf3hYQ68kzGvjCbLkNWR5YHDHAM5pYVa9doTEpuI
 0qb/XN5XXDBQ6NSkOXMuS6yk91l7B6jUYO8TSE5m/zRkAKzH400Dv5Uba
 mafOBu7UL9qQlDGRg7UbJKTWMvqBVGbc0JSTiUorxbhlEed9dw4dAAE5y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369569059"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="369569059"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 06:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="764219406"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="764219406"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 02 Aug 2023 06:16:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 06:16:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 06:16:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 06:16:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVlbHuV0ykgTvhrX1mLNPmmLBeyDqQ3PjeAuN9xPVI704igQXQhCj7nR0RYxOH5hWMqEV4+BeOCXzWZ7NLTpxH3qIlx3/XdgYYqBMgVKU2fwhpkGoYYEwZXBbA1rXO8nAp+3aPHNxjf1GlDedRFdX82mMQj7hLRtJlDO/JKsWPUj80ra7kAxY9HdKhQaD5FhTYXPbmTSVMpbmN3hd6XQm9VFpVfUZFLDHXC9+IsO4kb/TKoS/IQmHl9NpBSMfMSMMHYiVt2HvxMaMEiVIQjixEVSu+j8WxoRea8F4HSpPmPbgU/W+BEIHUnQFHr/QL3m2l4xnxYOfX69EqARuOjr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lWUQvq8VdVulI6QtzRFnsxv+RLnPf8JT89faqV3XjQ=;
 b=mEG+HvrJ3Tad+8yUSnWSeiVJPvmnHGj9cZIBFVpK7nLyOuC30KSB/5ibfZ/UNF2XO7DlufqscSQo3sqiTIGntfq8PJZS0/EEc+0RbK4kOoq4gK7wedXuvoOUmTUghPF+qN2Rio4NxZ/Ydkoa+50Yd0V+bWOGGEW9sOwbz7iSczvK9rf2GtxuY1sJtM8EofeSbcllEpWHjjChEMxFRKFmObq60/Baa5qaIkGQXEQ66mby+a3j7OESR5VfkfJzXWLhBwlNE6VyT77Wy2Ce8j7vGAWJC+l1TzwNHfn8JXet5LnjEU3ADhh0qr4vIC+u2P+fyw7E4uWCqCVdHKg6hLvyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 13:16:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Wed, 2 Aug 2023
 13:16:18 +0000
Date: Wed, 2 Aug 2023 09:16:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZMpXHQpgWyY1KX5b@intel.com>
References: <20230802070449.2426563-1-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230802070449.2426563-1-anshuman.gupta@intel.com>
X-ClientProxiedBy: BYAPR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0106e90c-6359-4a74-5fd4-08db935aa809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44n8xd+mcfzfGK1wDnjo3hwyAqaPmmiNOKwLfUI2gxNASOPqpwdGTsHsonFYiRWFqkFbHFJMu/Xal0Vi8SaFzDFkPsirdA8Q5DqjSfxdmwmw3FcckenwXErw5sgtTZt1uy45Zd0QGNtEVbriTHGfKBtq78ay9S+dhh2SaYZCCAv8zzgzE6Zy9Sjy5+OXgAtI6NslYUIO2j41feypLgnmmBiUMOaFSMVM7fLibacJvQUDu86ifJFiLTLLsN746LPP9XdVTrj/Yi0BbdkSv/qTvkmfDV/35sW5NJauDXy6/vwrdTBtSW6PZDMMEt/HBC9O7qiZWt0+eZ+MTb1h8HrpZYFtPFWJL1OCKy6t+Natg3Ta+NLhj0LL3Na3rqJegbWRHjVoDPL5Kk3c+Kh4jQbZ5rwTiwEj4o/uLRNCQzFyab6xhJsJw5d7AKCUWAIAmnMU/fcnZaAg5aO6Gat+KFjiic5Yh6ZeSUAdkbAxQPvpFDwAOxyqwb7qYXZBoXyOTMzz1uJfjAuul8TA8bfq0krefPLGepdhJiJ2AFpgv/nEPg1uhQEFLQFQTn+97czX/r3XMVKJi0N7YUABRHOpsZtOqyES3R4m5bhfcYfoIujNxY7OckLkJbijP1lm+1BXoEgcFsSkXTXYMF9+iSYoBq1iCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(107886003)(36756003)(86362001)(478600001)(6512007)(6666004)(6486002)(8676002)(6862004)(8936002)(41300700001)(316002)(5660300002)(6636002)(44832011)(66556008)(4326008)(66476007)(83380400001)(37006003)(2906002)(38100700002)(66946007)(26005)(82960400001)(2616005)(186003)(6506007)(42413004)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YKjvOAjg59VJvlwzXENjPYq8LZ5BsUVdqT2hRE8sJEujbnNw46QUTsT+DZjA?=
 =?us-ascii?Q?+hr/4gzIjtoJoBuJXuPLsJFePCAbnfujHvby4FWzK8SsxQ07ajoRsFXusHYP?=
 =?us-ascii?Q?SkF1LzL5xp+JDOAz3cL0prwttekBmTRGaroCqmeVpJ6DLBON+ZTNQJR240gz?=
 =?us-ascii?Q?Iy3eKlLCwSO60emM/0COG42664WHexcck0eFmUDvFI6a89RtrIcOYIeLv9/3?=
 =?us-ascii?Q?XZS4l2r/tUoZ2kzqVFn9cDEt2NVXGD1m+/EQsAF11s4W4dfeTP2+EeZ3GyVk?=
 =?us-ascii?Q?K5teOYQpZYcz0fHbXuLElwF/uvb9S7AkG8mTOz+R966XnyD3xHJ+Vfqv5tBE?=
 =?us-ascii?Q?cFN8zv+YQWy93vy15djxeK8z7Y+wDsLDRt2N2hWwGRsIce4uGeNfYGMhfOnA?=
 =?us-ascii?Q?Ug+DOD0PzCAQrTF+ewPB1ygFSEB8V2FFLvTs5haNaJgOP7x4Q06vlyweqPum?=
 =?us-ascii?Q?MzBIepcMbgy3M4F/vSid/HmdLV9AHHJJuGrEn30xclel92YPkmgeyVGREJ+D?=
 =?us-ascii?Q?lrXgBdwF6uQCRHmy3ggDdWif+o2pQAAG1DfKrqHh8G0IZi77fAIpLfq8r/cs?=
 =?us-ascii?Q?BKkgTO2BnRsvqbRpdL9kaTr3oynmFsnt3nl4jLUUiF5XIfQI/1WzaCBPOPc6?=
 =?us-ascii?Q?yvXa0V++6KNQ6eU42xS339KsDP9wUeGHvPr+RIewkYd7lXdYKk4xH3GWch5p?=
 =?us-ascii?Q?i1AGuq3lhZmH1Yp4gb/uwmvrtbaw7+o1H32oxMkYAgiVGeNlxwyhIJ7mmjJ4?=
 =?us-ascii?Q?9wwW4ExYlJWGW+0gj0tLaNfmEUuThWXgxXVO0l7Lj0yzG6K2tbYeYSRTtv28?=
 =?us-ascii?Q?CpL3e8UxzoqR0uoogaEMGj4TYz1/G6sSskJ72KZYUWWBBy7Tjcr/E26L+Wyy?=
 =?us-ascii?Q?Sb65SxI5415R4mFXn2eLVnjeXwOJ4ZnnTITHYNDui84tfNRI4UC1oR5i2KFh?=
 =?us-ascii?Q?M7d4Fk+jufCAsm6tP5DipR0axgR8lKZHVpoteL8p1/l4mRRw2w7EzqJLs3gq?=
 =?us-ascii?Q?D9gp5vYYFldty027Apuw7cg15giMpHGEijNPrNhg7VcLGw3zenU1ER6JAM73?=
 =?us-ascii?Q?GanhwP3fKg6lXfQjgHTC6kgd0jcY1lF9bwvaia5KBAIV7o9qIzLLK/9IKeGY?=
 =?us-ascii?Q?8MaXhvzasCtXaCjLHtYKhN5tBwqfToSIbxbxjy+w/uA+Q7Eiw/tDpx/AO9HI?=
 =?us-ascii?Q?gVxAHZiSDzl43kmYlqf4boGROyS7P0Dey5TYMM/xdkolBNEi0w9Rkn6IcA98?=
 =?us-ascii?Q?bNMyzfJopIYgv3CoU+ntrhrYcSX9A95oAC4MSQKLpLp4+6Vyfj0w2l4xoOBk?=
 =?us-ascii?Q?hAbzZExoUTUajCuT3bIuqL/6haOhelVbgJrXsnMRmm1/QVs7gAtVHZ7SUl3p?=
 =?us-ascii?Q?rbrBIfYjV0+NKEN9vvhw+dXEyK9pbFy3x3fhtyCygxfr9g6oW8KVK+j+R5+1?=
 =?us-ascii?Q?GNQlwBkhLqHKYRfxXgbyh00knSJDYQPQyHquhRYsd+JMAdVtymWGuaQ3FR0Q?=
 =?us-ascii?Q?HBew04Il6w3ibLUCUGpOufS4CAbku9pODA29EeuhVrdvSufo3z67m5cTSkgR?=
 =?us-ascii?Q?OePyCVWTrFHENJ3zz8Kn+HfGmocf5DkPCpahHTrQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0106e90c-6359-4a74-5fd4-08db935aa809
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 13:16:18.1453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VK1S9xWA81Sy2AV5/u8tzzEW9fnQsMwe9I/HsJYyL+eUJws13TuG2JFD0lB31LEBQDcmjUhPUim8pgCVM6aj8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: Add vram_d3cold_threshold for
 d3cold capable device
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

On Wed, Aug 02, 2023 at 12:34:49PM +0530, Anshuman Gupta wrote:
> Do not register vram_d3cold_threshold device sysfs universally
> for each gfx device, only register sysfs and set the threshold
> value for d3cold capable devices.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 8bb8e154e5f8..0f06d8304e17 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -165,8 +165,11 @@ void xe_pm_init(struct xe_device *xe)
>  	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>  
>  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
> -	xe_device_sysfs_init(xe);
> -	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
> +
> +	if (xe->d3cold.capable) {
> +		xe_device_sysfs_init(xe);
> +		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
> +	}
>  
>  	xe_pm_runtime_init(xe);
>  }
> -- 
> 2.38.0
> 
