Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A1BC77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0837E10E32D;
	Tue,  6 Jun 2023 11:36:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD48310E32D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686051369; x=1717587369;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sdQ/LLuIgBZySsm0T7M0LbtloL6YizJ6CL+Bwhxvtqg=;
 b=nkMLpKPktXk3ZayEZ/5D2uIUK0ViA2k5L3xXz7IqOGR+0hfVwIgMsd4i
 Ty/u5glc+TC7hjWYk/z0vTgbDNS+8FZaxYDSy59+ymgPvrDUg2kStsw1n
 8LtOVx4T6nc+1KDT7rewTP6brkJyjBX5yvrzK3sSiT8aa/RQt94oPPJmb
 PDJa8mUfH1IS3b2QEAvp6yUEuSYBpUT/MBM3mvB6yFCeYooeHZNGgj0UE
 Z+6d/xhKOi2Tkpbd1iQGWDtcyfHjfjVrwh6v5UnQj297aEssbafBLLO3X
 9tgJknDfU5iZqAfgSw+0yQ0q08AJU0qzEf4KcapQlQm81crf7ZiW38+2h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443021775"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443021775"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712176724"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="712176724"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2023 04:35:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 04:35:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 04:35:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 04:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpENSpV9g+TiD9y4JEz0NY6qqU09NF91wjGPMzMsRNQAknTAiKCK7ZvZc/2I8zbHhkr3uA80OE7UGBJONSbck1hOoLzsmAmt/iXuypJhXYo365BLUChdj3g9LOcooFMAcOLVEe4SHPO+bUhkj8Qz2/bfR5iA13juMtndUljAuheeVgdnVSa1kYMPCZ4fAZDbyTYzCyhZv+m4QkYl6Xz5Gd0FY6k7khDaqzlxqvCLg85akiUwgIv7Qzwe0Elb7N8UAtpfwA6JPV67IVTx2TXQ0nyxCKxswVZ/Wi7Z0B4e47Z2MpJ7NhHPD+FuTi4IHN9Kf4qnwGOK4dmJ1+Sr2pRMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4qktnfPa7vkG4zjcpi2n+3ZiUCRyg1vXho07oADPlM=;
 b=H21/Ba6xf3UXb4xUt+QxI9utx1kN1cR0pFnJ1PRPB7bi6zUisGlTWlYHrAO355jdKizPVWBEL0zevldUyeVzMBcQWA/7UQ6cQdt+6reHBcbA+b/h2KihQ2CgWQboIAzTzi4sDR5JzJyRgWNP7qrJqwsFKvl8FCIOhohuVeyXJNPbLn3hyLtIsXhPd8vzGuF+KFCmaRv6Ww0TDq27JcVwZFaRVUo2YFu5vatYTyOaqXKVwP4WrQ8vNE9HfgQ79D6PlhCYJDcqjhT1z/VV7erP4YoHvCH326OCjIVgVhjZ5pbBMXVJRG0STdGBtJLEXnBp6fyNam+GFV2SKVd84EaSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Tue, 6 Jun
 2023 11:35:41 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 11:35:41 +0000
Message-ID: <caf6c008-6aa7-a37e-1728-fc131a282875@intel.com>
Date: Tue, 6 Jun 2023 17:05:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230606111255.2072426-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::6) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA3PR11MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3a16dd-0645-4d7e-7c5e-08db66822845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ENvu1EzJcCVkCOLdAeMQQ7hnG/ER6vktzk6zkFKSeWux0KmquG+fH0gixyo3YmLt8CQ7kahm7L/2T18K+yEOM9lcPmpxQg11aquGlf9+2CPnKxm07NxiqADZfykhoDMaYXGX3E2HEYy10NLY91U/9zDIA32JYLxPmpYtsPEHK6P9PJoUYG7q5wZYEpByCD6/CoOx03eX9UWshrfkIzx91U5AB9Cel6DFZY7LkgBjDk7BuEeI47mYRGBlL+SIsIDvUd8EPML0LczJF6ZbCf2bdHvrPI4HaYoUOkaLSNPOGQN9kffzHjL6DNH4khTL6PG2F2mJZM9SSxYzjUhzG/13sQdpRH4K5q8ScFFMnLx/Y9u2Enke44K/HEyZ39jgfyz3Q3xQBmn7sEUqLkD9EbmsEd4SAwt9X7sKFOLJHn3cYydbEhLKC3WLcUjjkgrlhiDWz7UszR4bIvIoNKx7t13nxP/nivGBBULKJSBBwpxFIw0Ahh+U7Zfj2cqDrK6jbyRJi7lxenN3mDqf4z4/GUsndCyDoapPcxdARzBNPLHayQrJUo7yEqiQFU0E6TziJGTopoEWXylFVW4Ad3Cvh44Qzj+rcm8q8FD9X36B4xY1N92Q5plfKLGmit9w2tINSiC+F1y5wC/0EaU+U2GvvmXZqy4Z4AplsAl7Ovp7BL/Kfgqn2xNs0VsIqfGabN97cF4E7RpWnq5dgUA1Ry5o53sBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(31696002)(186003)(478600001)(6666004)(53546011)(6512007)(6506007)(26005)(31686004)(2616005)(86362001)(316002)(66946007)(66476007)(66556008)(5660300002)(36756003)(82960400001)(6486002)(2906002)(38100700002)(41300700001)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3RTUUgxYjdxOWRoN3JhU2JHakRjaXZZZHdOVnRYQmUraHErSmNURGFWR1ky?=
 =?utf-8?B?YUJUdHA1SmUweE5YZnQ2VTA2VENZMWVxYmphUWNxTitDWWR4TFlTMnNZRHhx?=
 =?utf-8?B?UE1pZEYrSmJYZTNHUm5ZSzJZbG1EVzhSUzlleFkvaWFwVXNRMDFCT1VoUjIr?=
 =?utf-8?B?clRhZUlPaXdzUzk5RUF5cXNFT3RiN1FxOFFHaDJJUUtsUXdTZjllSkh4aXZE?=
 =?utf-8?B?aGZ6bmVSblFaRldSSHZjVVNvRjZMMGFab3ViZHkrOVpDMy9HWDQ4SmsyV3VY?=
 =?utf-8?B?L1NGMnRDamtpS3kzYWt3K09ibUNYRmgrVnBXZFNkMTVPQjJTckF1NmptU0p5?=
 =?utf-8?B?a05JSUl3bi8vNVk5d2FCa2NvSGUybWlCSFpJWXljRURyWUtJekZ2dDJjNnQ0?=
 =?utf-8?B?VFQyL0hVT0pEdllIQklES016ZnN6cVp5WXNVWmNXQ0oxaTJHLzFFUFVHbFJU?=
 =?utf-8?B?M3VaOXIxcEQ1R3dKc2hWVWFRYU5HTElmMG1adDV0MlFkU0JzRUdwZUtaV0JL?=
 =?utf-8?B?OGJreDAzTTdCbittZ2dmQUhIME05dHZaY1Blc2JUaUFkRTdCeThsMVlxd09C?=
 =?utf-8?B?L0RWYUxYeTIwMzhkY0ZZYVNGTC9qaDA0bVpvemhOV3hsb2xOaXNrSmRzT3dm?=
 =?utf-8?B?SW9pRnJUZTRPd203NmN3aUQ1MnN6TGFjZjJUOHFaVXF1TUVreWNGT3pRb21I?=
 =?utf-8?B?eG1YeWNpTTRCTlVrMWpDczJvSTRrK2JkVFBybW9VaWI0Vm1Fanc1R0F2eFNk?=
 =?utf-8?B?RUp1eHo2aVBrT3JCR3RIamVTdXl5UUZ2T3QvcGtJbVJodlEwQjQvNWkwbTNk?=
 =?utf-8?B?aEs4SWU0ZGV6VHJiQXozQmY2a1lYV2JXamNWalJ6NCtlZjNzbFRTU2V2UXEx?=
 =?utf-8?B?R2RPSk1odWYvVmd1SmRGY3pZeEZSbjRreis0dnNoWHVJS0E4S3JlVDRGalRF?=
 =?utf-8?B?THR4bnMrYkMwTFFCSEZnNHhVSEQ1b01TQWxTYnE0NlRZdFEvVG0vSVE5bC93?=
 =?utf-8?B?UXVVVTN5OVVkNE03amJNYU9TeXU0aGFsUEtWVUFnbElaTGFCejhQR0lhalVQ?=
 =?utf-8?B?eHE4QWtUbnNxcG8rOGp4QWlpOHAwemJ4V1lKNWtVMG5JZU1mZjFJYTdPRXVv?=
 =?utf-8?B?L09xeEd0NDg0YWkrMEhjQm51Yk9PaEdTSW5NdlBEQjBpR0Y1TzQ5RkE1QTht?=
 =?utf-8?B?SDRLTHFpclJab3hnekVHd0dUVWVJMXhiZWNINzZ3WnlPek4yT1ZFSW5JdDZ3?=
 =?utf-8?B?RFpleFhaZUF0bExaMmtmeVcvSnB3NFlZSFJpaUxXVHNIRFBkNzVmeFRoT3Bm?=
 =?utf-8?B?WStFVXdFY0Qxd3F2ckJYclVZN1RBMFpUVjRjWnJFK2p5WHUzUUxKVlZCNzE4?=
 =?utf-8?B?eDdCQlQ2LzlDbjBzUzdTVXljNldVek1wditycWZRRDhvY1lIRVlKaStkTU1R?=
 =?utf-8?B?U04xM2pUajg4Sk15dUpxVDE3bS9aZkxPdytzdEFwaVB3VGxnb3hEQ0tmNTJU?=
 =?utf-8?B?dnFjNmhYdUdwR1hqOG5LUjFESzlwMWhVK3dRUkg5K3ZtSFBSY09XWHdxWTVl?=
 =?utf-8?B?YmN0VzJzU1hVRmgzVHJ4SUo3b0xtU3RlSTZScUNCdHVTZzRFc0x0KzZ6Qjkv?=
 =?utf-8?B?WDRwSVdaNC9jcUVJNTgzMlNUazZoTWRwM3l6U04vUFZRQlB4S3VWUjc1SGFW?=
 =?utf-8?B?eVVZeWZJMHg0Nng1UlMyS3ZoVXkrZUZRRmRnbk5TRFNpM3pSZkZsWVFDQWpy?=
 =?utf-8?B?Szlwa0FUMXNoSW1WMkpTMFNmLzlISXN5T29KOStnR25QMVVDNzd5Y09FVk1L?=
 =?utf-8?B?OXQwaGJQZDdWdE5KVTRvaUFzd1h4Mis1ZXVCZkdkeU01WFhSVXRHd3BvMGJK?=
 =?utf-8?B?UUJNdDZGR0FuVkxMUWJjQTZ5Sjd2WWVYM0p2SUwwNElBZHloNlErRnhjTnJQ?=
 =?utf-8?B?MmZhUHd4UXVIZnlQZEk3K3c4Yk9LcXd2NCtQd3g4WW4yamtTOEFtL0lZSjI5?=
 =?utf-8?B?cCtiWXMxMGJlckY3Wm1BQ0E5bnh4dVErKzhQV1ZjdE1SUWZyY1dlQ1c3Sysr?=
 =?utf-8?B?WlZlYjFGZ25wUVhHREd1YVJjRnIwSVBBSWl1dkVFTktmcVJYMEgwaG9HZjJn?=
 =?utf-8?B?dXFWRVVWc2w3TzgvSUUwL01CVTNTa25hWWEzWkIxSW91L09rbEQ5Y3ZzNVRt?=
 =?utf-8?Q?4cJbycIHkZpUr9ao0D692Dg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3a16dd-0645-4d7e-7c5e-08db66822845
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 11:35:41.6080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG565NMqUzpabjTZ/HcXpRBU5yTN2LeGy/xndBgk4HpRWDzNYhU1InaIBz9s9BQ7/VMhw8GCLYu2/bsJeedgfwkbcTHADlqlHF3+GEP86lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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



On 06-06-2023 16:42, Tejas Upadhyay wrote:
> Add sysfs entry to read per tile physical memory
> including stolen memory.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
>  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47 ++++++++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index db61da4d6212..7b5443aebd00 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -107,6 +107,11 @@ struct xe_tile {
>  
>  	/** @mem: memory management info for tile */
>  	struct {
> +		/**
> +		 * @actual_physical_mem: Track actual LMEM size
> +		 * including stolen mem for tile
> +		 */
> +		resource_size_t actual_physical_mem;
>  		/**
>  		 * @vram: VRAM info for tile.
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 475b14fe4356..86a7c65c301f 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		if (err)
>  			return err;
>  
> +		tile->mem.actual_physical_mem = tile_size;
>  		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
>  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 821bd49de277..d48c599e8cc1 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> +typedef ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf);
> +
> +struct xe_ext_attr {
> +	struct device_attribute attr;
> +	show xe_show;
> +};
> +
> +	static ssize_t
> +xe_sysfs_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	ssize_t value;
> +	struct xe_ext_attr *ea = container_of(attr, struct xe_ext_attr, attr);
> +
> +	value = ea->xe_show(dev, attr, buf);
> +
> +	return value;
> +}
> +
> +	static ssize_t
> +addr_range_show(struct device *kdev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> +}
> +
> +#define XE_DEVICE_ATTR_RO(_name, _show) \
> +	struct xe_ext_attr dev_attr_##_name = \
> +{ __ATTR(_name, 0444, xe_sysfs_show, NULL), _show}

why do you need to do this way, can't we simply use DEVICE_ATTR_RO

Thanks,
Aravind.
> +
> +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> +
> +static const struct attribute *addr_range_attrs[] = {
> +	&dev_attr_addr_range.attr.attr,
> +	NULL
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
> @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>  
>  	tile->sysfs = &kg->base;
>  
> +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> +		drm_err(&tile_to_xe(tile)->drm,
> +			"Setting up sysfs to read total physical memory per tile failed\n");
> +		goto err_object;
> +	}
> +
>  	err = drmm_add_action_or_reset(&tile_to_xe(tile)->drm, tile_sysfs_fini, tile);
>  	if (err)
>  		return err;
>  
> +	if (0) {
> +err_object:
> +		kobject_put(&kg->base);
> +	}
>  	return 0;
>  }
