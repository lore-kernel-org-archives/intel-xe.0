Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91674C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5812610E7FC;
	Wed,  8 Nov 2023 17:22:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7BD10E7FC
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699464133; x=1731000133;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K/6adT7RbBh0bVlcRy8hIH7ygdw5RqFpxPvXgXNDhWM=;
 b=mJUiFO4VjkVIDGRbqou1/OZfdQrt241pAwEjdk3kKe3ANQfdbgvmh3Yp
 4a1sWVi1FsVtxbbAvFCcyUlA1FOBarHDpnPDyu6TIN1ZLY4Y2ydtds7Rk
 5Bb3a94+nfawZQOWF9bUoYrGkFJ7am0Q4q33o7OHtyajLOJGTHAKxYOuf
 9yrB7sxDHevf8djHKWHRcfCUs3u+8sLyEXHerO3esswZFbIxOFqla8dZo
 CXlO0VY1CSdYp15hRwwPAnJDBO+M1z6xGJT/FMXd/R0UAdEf0E/9+WoLn
 kd4j9Av+ZIDq85O7Rrph1YvED6PwD2D8HJLZaXgwcX2tPOpDycwt0EZTN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="393726557"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="393726557"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="906851726"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="906851726"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:22:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:22:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:22:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:22:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:22:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxC5rFw1vXqF2+o73rkhpYisAhBC9KWwaVf3OLri3Djbxy5xKT+4eLIYDrL7WLq3OlBSblUJwtDLYmE1Y1UVdY3m5XzlJcnWneuCiBnP9vTXXqmk73mJ+U2c7uCC1l8qB4fNWKVZjxuFyFfvtX4UoZYYpsLkLT/6xBAtUs1pHvqkE2WW3pZxW7Xd+RalKzwiztdRztiZ4SFigTxK3dKxvKl267Q3c3OeiDvwITu8VbDLH9JBtk+R1h67s5kmmntTX9WZ37R8EqSQalH7v/28Wy+04wIjcqPqpXDboK8g037Lk9X9pcroi5qx8tErZOq8aXRPZx3Qo00acyp3QRp4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY9hrcFNR/wzHz7zaXdNLdh2XyTQuhLn4sBEqCXISLA=;
 b=TeEA40sNgvFRKEEXM3ycGJYa+DoPRnwwrijJGh8EIYF6+TKg0oFmwN60xWaRybDMkmFoJWnkUu4r5CnNUX0ISJXAY1oSmG0STo6L/X3wzoGzmlv2+zuwuNkSZ8aoHmP/FDwUQkm0HxDZS/WrBW0p9SGvO036N89eSJ/Km5n+Lilwlnj9ZJgbo0FRKWDfHbutaJYP5TAIu8BO4DebqJK8WgFc9fpLlPgCij8BYYF8rPVa+LV6f8AsiZhyIuBTmRcmIc9Nx0ClxcE5oe0X+ejC7j17uv0qT3SmsGZ/o/htky/fcR0TActvCMSesOBlncem1uI2t8goVk91+oTGuTb7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 17:22:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 17:22:00 +0000
Date: Wed, 8 Nov 2023 10:21:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUthF15E2boNIJUh@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-9-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-9-michal.winiarski@intel.com>
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e306af-fb56-4f90-830b-08dbe07f3789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ED1KLmfDt4OqYtMPq9YFz8LgaXq//0y6eqiro22AvaoA1eZh/i+8SbAK0jTW/8rOigHnWtWRDi3oAWVYd1ibzmDjccMW7Sro70Mqzvw1BXZjG8symSVgw/IyKGfFdtVYuRSBD7HaarkDfOe51InX9hk+/kT+Q7XOjYtwZAD+3wWRX99eZ0PY0ajGWymSD4ClyCneUDAPcVzzvx5UmFLSTOQSOZfXC+Btr8P1t2AZ7hqumHIYx/06hOoOkbWPgOEQJI91GzQjm9ftlVUGZ1ovUdxdFQeHemjRkmyVkixOqWV9Qq73fIWH6Edbheh3VFkEzVxvdDH9s1CWWph9o8vHn8HaO6nZkU271+cF3oS4vhSav5Rw/FpxBaEU4Bipyefgl26HBwSNKsgv46ulFTEyRCEnz06Jib8p8kA6q4Ku870kKMwREq5QQ7XZV1WVrggAx0EAZB9VIZW5DKMOt3SjuTP8jOQhhdO8rwulmf69DEVrGyUjbIU2/PMuiFrKeDvAE4RGSNwJFdeZunhynv1RGQI/dPNXNDWykc+jaLB7Bas9tdhFDrzOaQPKmi0DxSXI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66899024)(6486002)(478600001)(86362001)(82960400001)(83380400001)(38100700002)(6506007)(316002)(6512007)(66476007)(66556008)(6636002)(26005)(66946007)(6666004)(2906002)(44832011)(41300700001)(5660300002)(8936002)(6862004)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFFyeDkwWVlDSXdqUTBtQzZmTkRkSXFQQ1RhM1VyOUJDZVJiOGkxRW1ES2tJ?=
 =?utf-8?B?bDZ1UVpFWWNFMHpHbzhsK1hhZnlEODRLZllqUzA1cU5ySEdrRzlrUUgxandI?=
 =?utf-8?B?UzYybWpxbG1SSm1MZTM1NFNGd016UjN3c1hBMldOcnVxem84dWRHVlBOaUZh?=
 =?utf-8?B?b3h6V0dUdkRtNzMxRkV5OEYyLy8wdTVFQkxUYTN2U25JaXRwQkd4UFBTLzht?=
 =?utf-8?B?TnRrcGZkbHpkUlRVdDdSa1IrZ0lLbm5YMWxBUFREektrYW50V3d2ZTVNQWsy?=
 =?utf-8?B?b2xhaFdKVGJnR1JSeGtzYitQZW85UUJLbVhJNDA0cjczWjFkejFzWmJVeGEy?=
 =?utf-8?B?U1BDVXN0a3pDKyt6YVlUUm1ZQW8rbjN3dHBCYjBGaTZhOXR2UkdQVzRpbE1w?=
 =?utf-8?B?V25JMnJWYXdpVVJqWTlLSlN6Y0VVVlFIb0ZYVWxQRlNXTXIvVDNmREV5VTJW?=
 =?utf-8?B?b242a3hkbjNiSWhvVFkyY3N0VlNxUDA3Rm01Szl6UktMdExBbVd2aTBrTFZu?=
 =?utf-8?B?alQvc01LYzNJTStST21mSlkzcGJoN0hPMS9HQzR1STMxeFgyRFA0VE56NFBy?=
 =?utf-8?B?eWdwL1pnY0h2d3BDNm1RczY3WDN4NEZiUGlha1NzenNUN29mbzZ2MnFaODFl?=
 =?utf-8?B?b1RCOThUMTZsS3IyMmlxYysxaHpOKytDdytRMXBPbkczSkU0YVpiOVlOREJj?=
 =?utf-8?B?T1NId21pajJjZVRSUkovMkxtRUVDd1dqR3ZFZGMvVCs3TUhvZzJYdllDTjVT?=
 =?utf-8?B?dHdVWTA5MjQrNHBpdXJHSWxvYzFtL2NBQXM0azQvRXRUT0FNTUFKOFdCNEpm?=
 =?utf-8?B?WEpRUTZvOERxWFR0cXpkdk9rSzhEYW1KTlBtbTFEYkRWZGs4Z2tucW9nSEZR?=
 =?utf-8?B?VHdyZmJIYTZUU3duamtwMDJTSnE4NW9MUjVEZnpnSUJxOEJ5aWYvcFd2Mkpj?=
 =?utf-8?B?R1QveTZtSXNFR2RPd2dtZERMalZtK2sxWThZMVJyTGFSemdwcktQeDNzM094?=
 =?utf-8?B?K2JhYnNKeWhQeEczOWl5WDBrZHpxUmduVXhtcjJqak5NMFVqUGd2UWhMV0JV?=
 =?utf-8?B?QXQwWGo1ckdRY1kvN0pCWDAzNlZaUGRUR252UkxEc2FaaTdEL0t5bWVoKzlx?=
 =?utf-8?B?QVQyVVp0RzZzY0laako3RHZoMGtDVHI0VG1SZmZvTnZGdTVkV2VEUXRtQmtq?=
 =?utf-8?B?RDF5QnlZMTJxekUxcytGNThyemJOR21xMGpjQ1VlbVNKa0FuazBBQnhwL1NF?=
 =?utf-8?B?ZVZ0YXlNUERnTmNveCtzY3VGZWVTUFZKT09MbWJjNmtYR3I4UlVrZmV3UFB1?=
 =?utf-8?B?NVkzTm5ua2FycUNheGJYM25NZ1dVQ0dpaEFTZ1VMNVBYTms1UEJpOTNLZ1pI?=
 =?utf-8?B?TzZzZGZPTDk4VU9kWGtwbmJwMVR3cmdmQWJOcWZkY2RkMEFzS3lDQ0N2NGNK?=
 =?utf-8?B?M1Q3UkdTS1h5NjJ3Tk5KQS80d2ZsWTI4SHJhN2RoQlU1N1dQcnVyRDZWWFVI?=
 =?utf-8?B?ZFNnZ3hodGRDQTkwcjNrcWxpdVhhYXNSei9UNS8vNG0xOG1UM2JiTE9pSUto?=
 =?utf-8?B?ZFFjYWhRY3REWWVYUWFsckcySU9GenlLUjBsQk1lRnNKV05ZOWN2dCt1M1dn?=
 =?utf-8?B?QnNQMzA0TE42ZFFNYU1KK0JpYmJjN1djdWZHd25JcXdxYldqTzhvMXRHVFhm?=
 =?utf-8?B?OG11YXpqSFgyRXJwdWxmU0JVdmVYS0J5TFpBdythSmxCUnQ3SFY4MURKbE5s?=
 =?utf-8?B?MkkrSEVoUzBMeDVCZlNWM3J6UDJlaTlBWkZydU9iNmRFdWUzdFBSQzkrb1pz?=
 =?utf-8?B?bzBpM3VsQ21UV0VHWWxvL3V2ZW5RZkdRWjdkbW1rS3Y4RmRxSzJJSzNqRVpN?=
 =?utf-8?B?bUhUSVNWSEhrTDdjZFIxeWp5MWl6cGtjNTRZdERoUzYyTGMzQ3p2bTBFbkMv?=
 =?utf-8?B?YUR5Z1pwMHEvNGhuWVR1eWw4VVFqOTdLWWNCWHNrc055UVpuMTRZblg2UEE0?=
 =?utf-8?B?dDhhV0d4dERjRnFSS2NUekdndXY3dEhrTFlUV2Z2K2o3NnFJcXJYaUE1d1py?=
 =?utf-8?B?a1RUVTNuQTdFWDBHdnNWYklBT2lZMG81R0JaYXYzZDJSYm1QTHNlN3c1M0lU?=
 =?utf-8?B?UUU1bHRYa0gwT3RCVzBUUTN3RjgzeGh4K3RZTTgyYkMyUUlJQ1NvYXBFV0lm?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e306af-fb56-4f90-830b-08dbe07f3789
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:22:00.3656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44LcQV0cqzY/hbeL/mN+io9TxBZVVu506kQ450Tfqnj83NytneJ6uB3D3owvD68cy7SUJ2ED+SJwFAFu/qobHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/12] drm/xe: Split xe_info_init
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

On Wed, Nov 08, 2023 at 01:33:40AM +0100, Michał Winiarski wrote:
> Parts of xe_info_init are only dealing with processing driver_data.
> Extract it into xe_info_init_early to be able to use it earlier duing
> probe.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index f6f7ac390164c..2aa74eab08232 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -531,6 +531,24 @@ static void handle_gmdid(struct xe_device *xe,
>  	}
>  }
>  
> +static void xe_info_init_early(struct xe_device *xe,
> +			       const struct xe_device_desc *desc,
> +			       const struct xe_subplatform_desc *subplatform_desc)
> +{
> +	xe->info.platform = desc->platform;
> +	xe->info.subplatform = subplatform_desc ?
> +		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> +
> +	xe->info.is_dgfx = desc->is_dgfx;
> +	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> +	xe->info.has_llc = desc->has_llc;
> +	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> +	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
> +
> +	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> +				  enable_display &&
> +				  desc->has_display;
> +}
>  
>  static int xe_info_init(struct xe_device *xe,
>  			const struct xe_device_desc *desc,
> @@ -543,10 +561,6 @@ static int xe_info_init(struct xe_device *xe,
>  	struct xe_gt *gt;
>  	u8 id;
>  
> -	xe->info.platform = desc->platform;
> -	xe->info.subplatform = subplatform_desc ?
> -		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> -
>  	/*
>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>  	 * descriptor to use from hardware registers. desc->graphics will only
> @@ -572,13 +586,8 @@ static int xe_info_init(struct xe_device *xe,
>  	if (!graphics_desc)
>  		return -ENODEV;
>  
> -	xe->info.is_dgfx = desc->is_dgfx;
> -	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.graphics_name = graphics_desc->name;
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
> -	xe->info.has_llc = desc->has_llc;
> -	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> -	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
>  
>  	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> @@ -590,9 +599,6 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  
> -	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> -				  enable_display &&
> -				  desc->has_display;
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
>  	 * version 13 or higher has an additional dedicated media GT.  And
> @@ -711,6 +717,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_set_master(pdev);
>  	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
>  
> +	xe_info_init_early(xe, desc, subplatform_desc);
> +
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
>  		return err;
> -- 
> 2.42.0
> 
