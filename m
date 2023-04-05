Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE059C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 13:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F2610E963;
	Wed,  5 Apr 2023 13:32:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC510E962
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680701543; x=1712237543;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=TpFM5bTEFqP7ITgJK0K4sskBsX/ZG8aWYd33eunm/Do=;
 b=OGNUU6IXAz8iLPXpcLHFBZtwkklj/I8fIB5+nwDHdmDb/I7TmHY71Dnx
 s9wYDHmF5RpLf3OnOdmqR+f7hoZDpTTqv1F6mEfUyDznoVhyO7wRfTs4f
 5P/wbmKk4OZHBoIYBS3ZrIg5okAci0LNv/gZwZ5XSyVbnDvbfXFtRKnv+
 WQto4lzGsPXysZ1ouUN80eKmNy/9gP8TKxvoij80MXcCpIPXJQFkCyMj5
 XFBiJ/UgMCkUVpP9KtwuKCpJRl3d1216SurDf9Prdv5nGCOUI+HnREzTh
 g/NBTHsFjT3UuTPlkd/lMY4kVwh/go2xC9pxYJLkhnGTpS1w2V0t7/Cvo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="341175505"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="341175505"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 06:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751253595"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="751253595"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 06:32:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 06:32:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 06:32:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 06:32:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 06:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzE4rR8jtCdFTzkdeM68EHr45KMBZc/KJYeQutOTGrl3gjxGqyOn9MtMrap8FKhslE9fvce70QXWfnH7lQSLr3tJ+JQxQvahDlsN6Hjt0JDB687STpO1d4H3wEkx3m2GmR3xRrD29rcFGyAD5l0wsfmyRR/706Wz31ZKc111Cyz3fqJL1XSjZ6hQwBmZQqvgWOtkC2U41AF0mHX9byeVYQGZo/wAQI68sXS+cJv4Y4F8EbR1KEoK9DfjTlNqq+2LrtUYsSTiL6XwgPgI+YmRv8W09k8lQLACW5V+ttNfYvVDDYVEtRgRAFcYMj1k0X3tHC8lZQjC+zTuN9ZcnTSNZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMKGhDEYAKjHMIWjIGBMEgQxO3VccJKRQ08pjMDUdd4=;
 b=btWotSQSGGVjZJ9LcNnNQ04Xi3G8H6MBY/6x06l21VCcE5stSHWuzMxpf/75Aut8+9nwQlVV5b7U6/ZANLU+FrnEOf5jqod+R+6LAe2EuXgeN/zhj9+x4Rb5SsQVZYe4Gj63U5WlKdwANadzFLIwWN4qZ5tK3he7HFIa9P1d5I8dpiZzhMQjX7vf7+bRdzjz+wBNAlZ3Ka6mlapoI03q0gJVa3M684/HNEUTc/CeQ9okX5SyBN1UGy+4QxlQgZ5hr7SSZfjy8FQXDMQir4IS55/iPpfMl/W3mHzXghlQk40jlzRrnwKNkZN7JjBnUDZBlJ6Nz05aaWMxrluKJpa+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Wed, 5 Apr
 2023 13:32:19 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 13:32:18 +0000
Date: Wed, 5 Apr 2023 19:02:08 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZC14WOfAY61r9PbI@bvivekan-mobl>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|PH7PR11MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 22766afc-8629-4db2-6da9-08db35da2d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FUIzwFpLWMlnxYstKfIoXOShsu4GykojZd4ZpiZt5BM/4nPDsTV6sWQuUoTMUSuJ6tOeGK7+dcCYXy5/zOaiFwb2btnSRMUh/Zjp28IdQ34Ro1xtk8muJAbxK4isJl4fnSOvcAU3mn+P2PIHk2JZQm/8Kx7vwVP4f8W4OSv4BQQlfvzjV+9N+DOYwkPHt2gotQkPxoAG8Ji5UbazngPL+ItFWdRzIe2bba8ssXuun0u13PLhbY/5BcWTxZqIPp0kIp91yQhBGaRq9CAKxtcF5RZNDMIobdcLB8sjR2gCT8bmdNTEm0zi8G90MveKFnIAkqAcmgfrXhbN0V1s7E+B5ymcOw0DiN1BSlZlKrk9SVc2T9+TjVZOCGZJcS4stMtXr8wXZ7gSiRIGMgvkAwRLW83aXoMZ4Jh771xhGN8xVCqmCU32nv77lg+bjS1ldqip/v3Sem8CqcuMapAc4dDSfxR5ir1Eizqzq0z/C+IXscWz01qusCZRWDOFcVrxF3ArycjKYYt2BtYMKNqQydO+B8H8vBQz/Z9We3FR45byvoPGmfyGinPFt+3ijcLVdBch
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(26005)(66946007)(8676002)(6486002)(66556008)(316002)(66476007)(6666004)(186003)(83380400001)(6506007)(38100700002)(9686003)(53546011)(8936002)(41300700001)(478600001)(33716001)(5660300002)(86362001)(6512007)(2906002)(82960400001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3VtUkRKVFp5WXB6bVorbjNnUlJCS3NBcUEzK2tmbnEvMG9WSTVpS0RVK1FV?=
 =?utf-8?B?UndKRjYwMzFCQVZSSTJOU1RSckMreGt1aEhoNXhsL0V2M29SUlhtUStldEUr?=
 =?utf-8?B?TDhOOHJYZXlPZFNkblVEVzhDQXJOSkZxeDJNZENEdkpsUTR4RmxKOVdFaEpB?=
 =?utf-8?B?dkNqemN5MlQxRThJVjFyWHZ2UllMeEZtVWg0MjBOQlpyZWNnZlNmV3FpdFZV?=
 =?utf-8?B?K21KREQ1SFFpWEFBMWFMRGFFamdsNm0rdVFYNEo4a3JLakVSNWNLc0RObk9t?=
 =?utf-8?B?Z21BMGlMSGoyQUdkNjRBSWlUVXBDeTdnK09KNE9Id3ljY0E2b050UzdXR0dS?=
 =?utf-8?B?TFNsYUc2SVEvWHlibHFxaFJmV3Z4WlozWDhJa0wxNDhCdUlud3FSdGdORUFl?=
 =?utf-8?B?VEZBcUcwcFhEQWREUHpxREpzakV1ZEpEcEEzUXhYNlliTFJaQ2lPZkJycFN1?=
 =?utf-8?B?N1hCY0RkMEdTT1lBUWRUd1l6Qnl6TCtrTzYrUzdrOE45aG9yYmJzcUpLSVk5?=
 =?utf-8?B?ZnhPWFEvMld5SUFSeDNQZ3JlbEtpRThjU0ZhWXFaWDArSzM0QnV2TU0xaWtk?=
 =?utf-8?B?UUIwNityZDY4MHZpS3NzMEh5OWRxeWxBT0g5SE5Tc0lMRFdPVzYrdy9VRzBW?=
 =?utf-8?B?RFZtV1RSbm9pUGhNZ0F5RVdpT1JxazB2am0rTGpzYlhmT0NIa25Rb3pyUUlO?=
 =?utf-8?B?MSsxOGN2SERoejhSNzN6YXlvTVlMTmc2MHBvMjROZFhHYzVCbDVyN1lrL1hW?=
 =?utf-8?B?TC9tZWVLT096dExhM21nUVRoeTBEdlkwdGM0RjRBN2NxbURpRGtJOWVyTVJj?=
 =?utf-8?B?Q0FYTzBhT000d0JRMWc2ejlVNHBhL0V4SkdsVlZVUVdWSmlUblVlcGI0ZUtV?=
 =?utf-8?B?bWlBT25Vb0Y5UTZNcGVVV3dCVTMvdHZYTFVnaVlyaFoyb1p5YlVxRlphc1hX?=
 =?utf-8?B?Rmt4ZFJ6Z3BRQndPV2lLeHdWTlkyaTV5ZTRReGU5QnR3OHdFQ3owSUw2a1JI?=
 =?utf-8?B?SlUwYzQyRVEyMW9USnVWeG82Qjk3MFRDQWJKM28xeWRSMmk2RUY2ZE9uSHJW?=
 =?utf-8?B?Qlp6Uy85R0tWWkN3YUtZR0tPdDdWUXRWOFVnUXEyampLS3RaNFhVQXQ2MzR3?=
 =?utf-8?B?U2Z0QkRkWUQwK2o2NG5icEdWeFJlMkNpVUtmQTZvQ0RGaWYwa044cExPRFdp?=
 =?utf-8?B?WnlqWTNKQTV0bkVzSC9qTFRaK24zN0lCQWd1b25JQWxubGl5Z3diU2lsRUg2?=
 =?utf-8?B?WFNkK1RId0hLckRyUWFDVnVQa3VkMzBiUTF2Q1czOGpjRlkwdXpmSGFxSGMy?=
 =?utf-8?B?a3R0ZzZIV3BmanR5dTRHRHdURk41NGx2QlZRQVhSY3I4RzdKV1NodFlwUG9o?=
 =?utf-8?B?YzRqK0cwSVZYVFRkMGYxWUVqVXZ0dkNQUWh0KzR4L2VyWHFTVXMvVFBmbjVT?=
 =?utf-8?B?cHN5VXViYmtCbUtiZHJFTnp1bzg4SzFMTVZSMmhKYzM3MldPNmNzenBvZTQ2?=
 =?utf-8?B?QjBrVjVhYVk0M3JUWHRldHEycE80ZzQ3TnVGRCtCSTd6T0pnOUwzbDNzempt?=
 =?utf-8?B?RG1mVTZ4Z1U4dkxXZ00yZS9vdGI0dG5MWCtPeXhaQkNyTCtaZHlBbXVVMEh2?=
 =?utf-8?B?eCtnUENhRzN6NmQxbEhUbHN0RzRUNlFvWjl6MWF5R242eDllMTdnSllNdzZw?=
 =?utf-8?B?T2YzNS9ucUtRWkZ1K000SFJMV2s2aHBKUk9nT2puNVJsbE93by95T0RMNmF6?=
 =?utf-8?B?cGkrSHRNSUFQSXlEMnZNdXRROUZTVWY5RUl0aHlhVGE5TlZtVEZHMGcwSE1o?=
 =?utf-8?B?bDgxRVdTak82anZ2S1dONGdGVkNXaUdwSXBkNlpqNklHSFhiRURwQzZSeHdu?=
 =?utf-8?B?b1hPckpnVnMwSTU5Y2ZOS0I0em1zWG9TdnJwMU4rUnpUZ0NrYUlCcFc1SUlP?=
 =?utf-8?B?TW1NZVFwT09mVy9LZXh0SlgrL1JHMGdUNzUwT29VV05zLytmNXk0MGQ2UC9Z?=
 =?utf-8?B?RjUrOXNxMVk4enMyRFRxZVRpTVhBYy9qamxVdW9PR1dqUUQxYzRJYjhkdXRV?=
 =?utf-8?B?SnFtRmZtbFZIampKb3VYOURpYzRCaDFMNit6ekZXa1VLVkljeEhpdnBxb1ls?=
 =?utf-8?B?WkltVS92THFEQ0Z3Y05IenBHUnFDVHVURjFDYWljN1VrTW9BTlpnWFBWWkhQ?=
 =?utf-8?Q?d2V9FykR8EuysUY3JptjZpY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22766afc-8629-4db2-6da9-08db35da2d81
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 13:32:18.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jm94e2aWaHAjpt/BEAj85zfalaUnnNCNvUz7ELHOw0AmCtjtUXEDfJBud37vAbT8XMsV6hns/mXSXXSsyoB992cM0XuOS0i7SZU9IL/LdQCbsJ1cTBhvAWbkpxGFY8jr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Select graphics/media
 descriptors from GMD_ID
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

On 03.04.2023 13:17, Matt Roper wrote:
> Hook up dummy graphics_desc and media_desc structures on platforms that
> use GMD_ID.  When such a platform is probed, the IP version will be read
> from the hardware's GMD_ID registers and that version number will be
> used to select a graphics/media descriptor with the appropriate settings
> for the detected IP.
> 
> If a GMD_ID platform reports a graphics version the driver does not
> recognize and support, device probe will be aborted.  If an unrecognized
> media version is reported the device probe will leave media
> uninitialized and continue.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
>  drivers/gpu/drm/xe/xe_pci.c          | 161 +++++++++++++++++++++------
>  2 files changed, 136 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f45251df5715..2d265dbb7651 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -22,6 +22,12 @@
>  #define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
>  #define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
>  #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> +
> +#define GMD_ID					_MMIO(0xd8c)
> +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> +
>  #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
>  
>  #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d634e781858a..62685b14257b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -15,6 +15,7 @@
>  #include <drm/xe_pciids.h>
>  
>  #include "regs/xe_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> @@ -99,6 +100,14 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  
>  #define NOP(x)	x
>  
> +static const struct xe_graphics_desc graphics_gmdid = {
> +	/*
> +	 * Unset graphics version implies GMD_ID support; driver will read
> +	 * the IP version from hardware and then select a more appropriate
> +	 * graphics descriptor.
> +	 */
> +};
> +
>  static const struct xe_graphics_desc graphics_xelp = {
>  	.ver = 12,
>  	.rel = 0,
> @@ -164,9 +173,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  };
>  
>  static const struct xe_graphics_desc graphics_xelpg = {
> -	.ver = 12,
> -	.rel = 70,
> -
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>  		BIT(XE_HW_ENGINE_CCS0),
> @@ -175,6 +181,14 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_flat_ccs = 0,
>  };
>  
> +static const struct xe_media_desc media_gmdid = {
> +	/*
> +	 * Unset graphics version implies GMD_ID support; driver will read
> +	 * the IP version from hardware and then select a more appropriate
> +	 * media descriptor.
> +	 */
> +};
> +
>  static const struct xe_media_desc media_xelp = {
>  	.ver = 12,
>  	.rel = 0,
> @@ -194,9 +208,6 @@ static const struct xe_media_desc media_xehpm = {
>  };
>  
>  static const struct xe_media_desc media_xelpmp = {
> -	.ver = 13,
> -	.rel = 0,
> -
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>  		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
> @@ -298,12 +309,8 @@ static const struct xe_gt_desc xelpmp_gts[] = {
>  };
>  
>  static const struct xe_device_desc mtl_desc = {
> -	/*
> -	 * FIXME:  Real graphics/media IP will be mapped from hardware
> -	 * GMD_ID register.  Hardcoded assignments here will go away soon.
> -	 */
> -	.graphics = &graphics_xelpg,
> -	.media = &media_xelpmp,
> +	.graphics = &graphics_gmdid,
> +	.media = &media_gmdid,

What's the need to assign a dummy structure instead or assigning a NULL?

Regards,
Bala

>  	.require_force_probe = true,
>  	PLATFORM(XE_METEORLAKE),
>  	.extra_gts = xelpmp_gts,
> @@ -414,9 +421,91 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	pci_set_drvdata(pdev, NULL);
>  }
>  
> +static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
> +	u32 ver;
> +
> +	if (!map) {
> +		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
> +			gmdid_offset);
> +		return 0;
> +	}
> +
> +	ver = ioread32(map);
> +	pci_iounmap(pdev, map);
> +
> +	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
> +		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
> +}
> +
> +static void handle_gmdid(struct xe_device *xe,
> +			 const struct xe_device_desc *desc,
> +			 const struct xe_graphics_desc **graphics,
> +			 const struct xe_media_desc **media)
> +{
> +	u32 ver;
> +
> +	if (desc->graphics->ver) {
> +		/*
> +		 * Pre-GMD_ID platform; device descriptor already points to
> +		 * the appropriate graphics descriptor.
> +		 */
> +		*graphics = desc->graphics;
> +		xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
> +	} else {
> +		/*
> +		 * GMD_ID platform; read IP version from hardware and select
> +		 * graphics descriptor based on the result.
> +		 */
> +		ver = peek_gmdid(xe, GMD_ID.reg);
> +		switch (ver) {
> +		case 1270:
> +		case 1271:
> +			*graphics = &graphics_xelpg;
> +			xe->info.graphics_verx100 = ver;
> +			break;
> +		default:
> +			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> +				ver / 100, ver % 100);
> +		}
> +	}
> +
> +	if (!desc->media)
> +		/* No media support at all */
> +		return;
> +
> +	if (desc->media && desc->media->ver) {
> +		/*
> +		 * Pre-GMD_ID platform; device descriptor already points to
> +		 * the appropriate media descriptor.
> +		 */
> +		*media = desc->media;
> +		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
> +	} else {
> +		/*
> +		 * GMD_ID platform; read IP version from hardware and select
> +		 * media descriptor based on the result.
> +		 */
> +		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
> +		switch (ver) {
> +		case 1300:
> +			*media = &media_xelpmp;
> +			xe->info.media_verx100 = ver;
> +			break;
> +		default:
> +			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> +				ver / 100, ver % 100);
> +		}
> +	}
> +}
> +
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	const struct xe_device_desc *desc = (void *)ent->driver_data;
> +	const struct xe_graphics_desc *graphics_desc = NULL;
> +	const struct xe_media_desc *media_desc = NULL;
>  	const struct xe_subplatform_desc *spd;
>  	struct xe_device *xe;
>  	struct xe_gt *gt;
> @@ -445,22 +534,32 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);
>  
> -	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
> -				    desc->graphics->rel;
> -	if (desc->media)
> -		xe->info.media_verx100 = desc->media->ver * 100 +
> -					 desc->media->rel;
> +	/*
> +	 * If this platform supports GMD_ID, we'll detect the proper IP
> +	 * descriptor to use from hardware registers.
> +	 */
> +	handle_gmdid(xe, desc, &graphics_desc, &media_desc);
> +
> +	/*
> +	 * If we couldn't detect the graphics IP, that's considered a fatal
> +	 * error and we should abort driver load.  Failing to detect media
> +	 * IP is non-fatal; we'll just proceed without enabling media support.
> +	 */
> +	if (!graphics_desc)
> +		return -ENODEV;
> +
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.platform = desc->platform;
> -	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
> -	xe->info.vram_flags = desc->graphics->vram_flags;
> -	xe->info.vm_max_level = desc->graphics->vm_max_level;
> -	xe->info.supports_usm = desc->graphics->supports_usm;
> -	xe->info.has_asid = desc->graphics->has_asid;
> -	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
>  	xe->info.has_4tile = desc->has_4tile;
> -	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
> -	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
> +
> +	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> +	xe->info.vram_flags = graphics_desc->vram_flags;
> +	xe->info.vm_max_level = graphics_desc->vm_max_level;
> +	xe->info.supports_usm = graphics_desc->supports_usm;
> +	xe->info.has_asid = graphics_desc->has_asid;
> +	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
> +	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> +	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>  
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
> @@ -471,7 +570,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
>  	 * treats it as the number of GTs rather than just the number of tiles.
>  	 */
> -	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
> +	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>  	if (MEDIA_VER(xe) >= 13)
>  		xe->info.tile_count++;
>  
> @@ -488,9 +587,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  			gt->info.type = XE_GT_TYPE_MAIN;
>  			gt->info.vram_id = id;
>  
> -			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
> -			if (MEDIA_VER(xe) < 13 && desc->media)
> -				gt->info.__engine_mask |= desc->media->hw_engine_mask;
> +			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
> +			if (MEDIA_VER(xe) < 13 && media_desc)
> +				gt->info.__engine_mask |= media_desc->hw_engine_mask;
>  
>  			gt->mmio.adj_limit = 0;
>  			gt->mmio.adj_offset = 0;
> @@ -498,8 +597,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  			gt->info.type = desc->extra_gts[id - 1].type;
>  			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
>  			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
> -				desc->media->hw_engine_mask :
> -				desc->graphics->hw_engine_mask;
> +				media_desc->hw_engine_mask :
> +				graphics_desc->hw_engine_mask;
>  			gt->mmio.adj_limit =
>  				desc->extra_gts[id - 1].mmio_adj_limit;
>  			gt->mmio.adj_offset =
> -- 
> 2.39.2
> 
