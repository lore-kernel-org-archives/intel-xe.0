Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7A1C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 23:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B44810E107;
	Fri, 21 Apr 2023 23:29:48 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175F010E107
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 23:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682119786; x=1713655786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MWmWhjvDbBvEigh0OtzmbFjmhTM37pKAv2kvOj+PhD4=;
 b=VrWvO8W95i6vx9li1q80nijBGO4nQQsCUahCvKsMIg/tLaH/94jOuHwj
 hZEBPi0n5KUePaNymqmGHcEh0KILPLDb5/89lT9zVuxOMKFpLaM2LCQ2p
 H+QzcHVAObvdGBSkZNDuR05ogaZK9FtkWNNeWBQEC8gOA0wRA8RxE9BUW
 DZSJ3w63iLqhud6JEPRwppOeU0Eradqme5XEsfcgiG8WoaxnyLVFSAovu
 Dd6y5uWgnmuPUqLjDZv81CuJ1iyVAjihpwHIZc/xW0WcaKcIEGYXDm6NK
 rxfSeYU9a6Fx+NyyVRMeURWw1p9ZF8v66EMI29bdYZ8OBo549ulq+Bwrb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="374039460"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="374039460"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 16:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="836328942"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="836328942"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2023 16:29:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:29:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 16:29:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 16:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loOsL3z0n5XR/qcpO3Xhy/UGzxvexpmsvTpbcemsm7QRNWomASnEi05foO1SxKKeuzYBAVPWk4vElHbc/tN76b5YMyAQYVVxEzS/FQioGKZ5gknH10ZqfygWj7EnOjdbIk6f8isCq8utgSSJK7Hrgvh0Iz8QiBVsqfU8v0THr7wxFRYYW05m6AQQvcoba7s1yDep9/pcJ8k67qjNMPBaOOmtTJTuaJujIeWGBam97boTucwWXqDvlNpsfBwYoXSpNg2z/yH0+jgehJpmgwVAHpaBQxsItV05crI9oaT4YPp2ScbACskrRTxE4AEl4sThrqFRyxqIQ5fU9Y1THJtf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+e4VtoKmenK5gGa2XCiJQ7jxk2sE4k9DxkuPUzopwgk=;
 b=E0YfTuS0TsDfAnUdqpCE48UzDNuAqOzzATEZY2GddTffqP/ugpeIdoTvgzVAtDGCXmU6vv0+Gea4iDacWsLAcMWiMdOMjn61DkoybqCO+EoGfcc1CiklyX7DZ5jU7mCMOgcT2vcuer4wLLtM6KTeyEw3HpVmfifYAb6N6pjPLzcX+CGFBH6V/lvyRXFwp30F06Ym39TXc2/gPKl1qloVtYHwNGJG8rVIEOmkMAYmfvH3kKVZ8fu4DHzI2JYPhqvlVC0nLxwSqpNS7Moggp+d3ZQkTzlos+ZTbiRIpjadiyhhhSu/PUrWg3XgWWUwZu+Gm4mUp8ychqLy/PmozA/d5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 23:29:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:29:42 +0000
Date: Fri, 21 Apr 2023 16:29:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230421232938.GO2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d4b0e6-0f6b-48af-44dd-08db42c04860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HkTNvaDWKGsKrLbhsSlBd/0hNlNW7nO35cmlduRYE8gR42ey8r9bHABCZo9kiFeXrzvEO5zlXb3fPjm8V+onJ1x910oQgyLOfmo8o2GX9Uy5+vjJ+y+2ChmAh2kixJpIeAUZ8eLHO0hN4aFxyRAiNdnmVv8fUoiOLFm81irDM74YJZoJh0CBr+/DogY73nRoZ9jYCDWb8hY7d4T9cNX0mutGtvhiULC+8hdI7gmmuap30FX0PGPvbrL1fHRrezPV9MNaIJ+lWkZbTZDw8V/bbiIoukWSRhOR49OfVOpq5TYUF59PplIf76OyEUQdFITU8tKEpshHIf3IaBEBfIF0hN0PcIhyL2LBJDOb/AHiYSBVLTX7fLEziYNgcpLyHyv1lrppc2uzsn2qOnZ7KT/sU8tqK+fiiqbqo1OgCnyfXYf4HeechWUELbGyEc9attmpm8PhdFJ4uyUWJI5lKBOJiKSHQ2N6FvMRl1ouT90SdhooCfKFB8MpQUPcxcNMegiI7135aNy3ZIE1IaIIhbqJR0EvkC8RARjiBq3SgisRJCpQ2XdTB/zO3nADW08h1OTL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(316002)(33656002)(1076003)(4326008)(6636002)(54906003)(66946007)(66476007)(66556008)(6486002)(478600001)(6666004)(5660300002)(41300700001)(6862004)(8676002)(8936002)(86362001)(2906002)(38100700002)(6512007)(82960400001)(6506007)(26005)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WLBTF5xpqr1YtR2Y0h97bFIGUPHD6vzEDfOjP8sCdNt72sY5xQd71WIGYZ8I?=
 =?us-ascii?Q?GtmnYm5XxM+HFYwldK73STdGBX7H/YJCuRab8lP6Nfpip2a+syw09oDqRG8O?=
 =?us-ascii?Q?csx5BvnNYwWkLOFO8LVCNd5RlStIw3x9DKbPl1uQXsEawt4plSuCmvWmeo84?=
 =?us-ascii?Q?R4Q1h00M4TDTgmEzwIO5Fo28vKJhhxRJ9UiHm5buqq1oGMcCsfBZmSz16L4w?=
 =?us-ascii?Q?HkyRRp7+CmsdKDPo6mvVncPIxIykpmSstVzvoR2I7mQLTc0PsNys6HLOsadl?=
 =?us-ascii?Q?OrXixXLq5iRwnYEto4CZclXfyogUXHnfYv4dJl1dbGv42z+BonWoOKVNzEJN?=
 =?us-ascii?Q?Ptxc37durwHmbEfueoQp2Hd9CzEHFZUbiar0mSZF0+ahywqpYVuDSjMFP+GY?=
 =?us-ascii?Q?Crll6ShH0IwvrVhlg9A5kFhiUgkEG2T+AJSBEwcrKminHuUhcMbjJQtO4mHo?=
 =?us-ascii?Q?NNcW2k/YhRov0gBE/4nYja2wuh3bcxDci5U/Kw5WcEmqllLmAh5ZW2dsK3ZK?=
 =?us-ascii?Q?h5XBYQ3pB6HTMJFJ96JWO4mOoqV7yEM5Q6UBdK42EHnNIOjQezS682mxExNV?=
 =?us-ascii?Q?80/hJunk4B/f1AND2hbKC5etcPE6LCag/+Ou0BwBcufeuWQAWFf9ulSpA5A5?=
 =?us-ascii?Q?Y4A/4Wq0m5VBpW5bd/euut25TFNhAGiOg0CelTwvFbTdFskPkrZdkIjszNs0?=
 =?us-ascii?Q?jPuOjDC2ZQR6qwGlMkxiVigCOn1Zv/1TKp/597bxwnQ0kR8h75O3+Vz2OEFA?=
 =?us-ascii?Q?xnux/Bn6MrrWYCqvW/Lc2dnUCOOKXRazC9tXEFESNuGsgBxFfE177rQdYOOt?=
 =?us-ascii?Q?4TIGQE57i54dptxZyQzXZXyg28AAQhwukTuJWZyY04hft2HQviDe+qn8fng8?=
 =?us-ascii?Q?Xj4CJtyT2qE9wmvd2RWWZ+ZAoNaaVxz7Z2lYJvUmmtg8Q0xilylMbCzFojcR?=
 =?us-ascii?Q?D5YMWe86x+ONGBn9MXN3BIZJQXAMCROdEFs5FOvngBHpR2r6/1JdB/cEZ1lU?=
 =?us-ascii?Q?VmHGmmdGmYte5Oi+9HJxcN/Q4vtGmgCTTAyo85CdwqbCpOP98DXxNXjMaUZ9?=
 =?us-ascii?Q?tpdWUU0m6vOMat6nvNpqmZ2SfWAZxNAYf1r8bObBFOKPSw/8bRXhXhi/io/A?=
 =?us-ascii?Q?T3HOaOZw4qs8YBAh1nrG7oP76R4TPu+t4kgPjXfXPFMkV0ewTeLigSXGyzX9?=
 =?us-ascii?Q?fDoHTR630ytZZfQkqL7K6xbe/a84e4XI+nYzidEcqcXDMCjkk9pqvYq7HErT?=
 =?us-ascii?Q?0wetdDEpQZ5aunLtNjtHRQvXcdj/Q8DHloZOHi62bpYy0XWk0k3Cf8S29qME?=
 =?us-ascii?Q?nMeMoTIkYlQ1UsvQiyWwYTpsa83ra4QCLewLRn5eLsauq/YfDGAcBi6vore8?=
 =?us-ascii?Q?dNbCkXLrsGl6g2gCfUy4IBL0tjxiIb9HBXkO0YLXy/2xQSBzTC71uXfJnSZZ?=
 =?us-ascii?Q?0dccwgDj3z1droTT4bjyVZCHgdUR5TVMQNP6PVMilSRmPlTZpwgqlQkMDJ0q?=
 =?us-ascii?Q?Dcw7D0ISOWAMDviRfpYVwV9rNmKmJ2Lk0P8c214D0EHfExyu64D6s8zu3pnM?=
 =?us-ascii?Q?EQKIzuoq2hpsSQtF0A4OnSzku74QnBZv3wGAD10OLSTZRvsEt1gOCS0HHEl+?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d4b0e6-0f6b-48af-44dd-08db42c04860
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:29:42.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Huoa+cDe2Jwt8nXRdJ4EnrFpXekx9w14AwM2BW54AVmycwcyqHohPfj0z3C7PHJgSR78Z7Xu7+KnPMo+6REFX8iOzINN6I2k4GF8eFf7REk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/17] drm/xe: Rename RC0/RC6 macros
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:45PM -0700, Lucas De Marchi wrote:
> Follow up commits will mass-remove the gen prefix/suffix. For GEN6_RC0
> and GEN6_RC6 that would make the variable too short and easy to
> conflict. So, add "GT_" prefix that is also part of the register name.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f174758d8307..778d34afae93 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -345,8 +345,8 @@
>  
>  #define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
>  #define   RCN_MASK				REG_GENMASK(2, 0)
> -#define   GEN6_RC0				0
> -#define   GEN6_RC6				3
> +#define   GT_RC0				0
> +#define   GT_RC6				3
>  
>  #define GEN6_GT_GFX_RC6_LOCKED			_MMIO(0x138104)
>  #define GEN6_GT_GFX_RC6				_MMIO(0x138108)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5a8d827ba770..2f98544736ae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -592,9 +592,9 @@ static ssize_t rc_status_show(struct device *dev,
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  
>  	switch (REG_FIELD_GET(RCN_MASK, reg)) {
> -	case GEN6_RC6:
> +	case GT_RC6:
>  		return sysfs_emit(buff, "rc6\n");
> -	case GEN6_RC0:
> +	case GT_RC0:
>  		return sysfs_emit(buff, "rc0\n");
>  	default:
>  		return -ENOENT;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
