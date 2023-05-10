Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC5CC7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 21:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BF310E08D;
	Wed, 10 May 2023 21:31:34 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E2510E08D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 21:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683754292; x=1715290292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=749UH6Vn5fl3sdRGLOivznhdHdFHFB2UOkZUZvUDcxg=;
 b=PLbyybe6wHG/Fc6wuNz7qwPVqX6SAXJ7Ilwm1HcDuuK6JV2l62AtmHP+
 7A1RD/OdyC4lfIrgzBDPqSbKrm6JKhTsONLO1EE6pUYKtogPE4+Oe4ARO
 BuKqzrxMcD80A3m/bbmFOmL0mrbSsWQbftTUtpOnSkdYpf2//tIOlMsko
 0cbbFTrmjxGDAT4/Y0U5SbhgmvD8BoCOEnqKoaXOIm1a/fb5NgxShzDCK
 Gt3Ysg+fLk/EIt5HngySi8DHVhLl8ESAo8bmWi+VJafNMSQiRl8592eG8
 Uydq6SEH6JE0KctrI9yM8ngyberBEjpDssJPl/LuiT9GyAaLkAVsNqvPd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378442921"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="378442921"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 14:31:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811310043"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="811310043"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 10 May 2023 14:31:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 14:31:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 14:31:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 14:31:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR4c07n/Oc9lCTYZ5KCSQnE+fXyKhnrLj1RJg22J8BveNwV0O0GQgX1wVe6g/Ifl1O5bhy7uuK8IpG0O/TBefptRvoncZgsovQVIOQUXOHTkiC0xwtt1rcHNKrslkf2Pe9hlAFMqm3OiDjHq2t+sPKoVYo/QUS2P1v8m16tGrW7t7zOeaz+qw/QySRi2jQ/8vQJmjXr18f4g/PZ6q1W1krTAszW7Ba1O2wGjnQwX72hTx8d6FXnqvFxcAvjTetbg2ypKdEtHhtgyb9ZPMa6SKmx2etuVH76kxedaIyK59ulDmjoZIL25ZFrK6FsIrKYTwNhitIklqCfw/O137YPHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jiIxvS3xEIzlnK29XkbqCDlgqW+sCXVKLYlXZt98Io=;
 b=IOH3P08EhmppaOJNyuMbxwr33vF+2nIsymdoGXZr5hQLBwv080BXSLHPFnGG5SdQ5OlMCfFwev7BS7kLURMrGMN0gZmE8wU+It6ssVgojXv2/78pK1CWMDIy+8byR1SAiuyMHOcguvStI1JmtjoQSnEf0zvWy1/awDYXIUNWecFuHYB1F4B9XK6Y+R5h3+TyAqjF7fKGt7y0MJvg/7/br3PffASZig+Sz6zKKAEcmS0WRWsMj08kHWXzP0Md9toPYq88exdQdUEqVRNerYRobpGVpNTm511hY3CPJzeNEfpUsT6b6FKJJYWFSK4BdzpKkcbk0h3NgyDxXsxidxPruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 21:31:28 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Wed, 10 May 2023
 21:31:28 +0000
Date: Wed, 10 May 2023 14:31:17 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZFwNJQLiYXr8pQ6p@msatwood-mobl>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230510195424.3045127-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ec3c51-7345-409c-8559-08db519de9b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGw+D28WoY+lRAYLEAGhw4WZHttwyDWAu/L0S9XQb/ICX+aMwtE4CoTutK8sFjj0dvN2Q9LHS7j4dPnzwMfL330eyOJk4PJNnIccGYlIYswAaxhmuFDjXkT77xQ4/+xZJa1vrTq/1+BwAyicsAIH7SHmyk0/4I7oKWcvJoBoq0bXDt+vRIz5d62JScXDQ9+YJF/dYJtuQtwpvvlPK3fo/ssEvkgKZ8AhfKUGt1G+7DCk+AuhZ1z1b+iGUeDSe5qb6s1MqOtZq6bEovXaEUsABLKX0jV0HyTPQN51v1+I9vAvDoK91KvTjBd7h+/o/90iUoW1340/qSrUR3MlhoYwDN0n1AlIANDUE28W5ppttIosFjcYFc2yV1l0sjKic/LbHqq9n0NGsV00WNL7WdA4Kg9B4nxEX0VzUV7zCeRCiX1ZdwJNNVQl15meQSlnfeLtxRBmr7dhaH80Lmy8JNWF8Z4FDI3SinV4XOUb64dwZXLorFWTf1C5cr3aHoC8cuPAsf2GyVkb5UEr6UkobnDm+tZBfcRZRWbGyzoLpN7ML2rt2SFIq1AoZJ3GVngoLX5+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(82960400001)(26005)(9686003)(6512007)(38100700002)(6506007)(86362001)(6486002)(6666004)(83380400001)(186003)(33716001)(2906002)(66946007)(66556008)(41300700001)(478600001)(5660300002)(8936002)(4326008)(66476007)(316002)(8676002)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0xHcTE3cVBtblNDbVY5Tko0WkJVQ2dNQWJjMHlHWWxCQ2FrOFhnYVRjdEcx?=
 =?utf-8?B?eVROeFJXUGZGWGpsOVhiZVhpc00wb3hPZWg5bHJxbDRJK1NMWU5EQW85bHBF?=
 =?utf-8?B?RE1PTWlUNzNiVGdhZWNxeWtxSTAxbnpjWUZJM2VyV2ZqL1hSZEU0NTFwNEky?=
 =?utf-8?B?M1hhVklrQ1drVHlKNHZkMFk5a0R6S2ovT2VVdlA0anBEM3F4RHQzMXI1QWVZ?=
 =?utf-8?B?bmZUTGdPVW41bml6Q1VPZ3VLeFZlM09EazVLSHpZem1WcHJ6SjUzeTJKMkV6?=
 =?utf-8?B?NU1tSVhvbW5ERG5aOVhwWkFYUkg3MVA1bmx1WUFXMU84YnNYK1pUa2NLY2k1?=
 =?utf-8?B?aDFoTlp3d0xwUG1pcFBrQkdadThsMVJ0NlY2MDZwUnlFTFFrM0JIL3FtQUNv?=
 =?utf-8?B?QVp0OVFEeWpXZjFwOEUwNW9TM2tJWUMwT2FQL0pIaXBRSWcwLzhCYisxYU9M?=
 =?utf-8?B?R0F6Y0NuckZjUG5uRUNFZFBrcnU4OTh5VzlPM0ZGUUo4MGpudGFzM0VIcmZr?=
 =?utf-8?B?eEU3K3JzNWREY0RYQXorNWpPZmpOU3UrQ0FrT05rbmlFdWFCSWZYOGJoZ2h4?=
 =?utf-8?B?cHBtRFMwTE9FTkRiNDhjUUM4T294Zy80QzY0ZURwY05aekJYOWwyY2FXMnZF?=
 =?utf-8?B?THZKRmhFRUU2TkNkVGsyT2NLcHc4alpIelE3d0d5c0Y3Z1JZOUMvS1k4WlhY?=
 =?utf-8?B?d3JSb1YxY2dkVTdqQlJWVnpvYkdTaEkzcFZ4bENRU3lCcyt2L3NudzlHZjFL?=
 =?utf-8?B?LzlkYWhYdEQzSkswbUY4STlsSVJqVFJhaVlaZUc3NmVJQ1JkYUsyVEVvcmNT?=
 =?utf-8?B?N1JHbmg4Z1pnTTRCSkpXQ2w4eVBIS2I1eTBldW5PSDFaSXVITWVHOVFodTdY?=
 =?utf-8?B?WGRPczFUVFh0TEhjOSthODlzUVZKV2xRaWRhQ0JDTzVMUnMvaHpxWVprK2Nu?=
 =?utf-8?B?UW8rSzdoWTZGVWMzSmFrWnM4YWtzZXA4MHRrVFJJSnFVZmh1YjJGbzJ6NHIz?=
 =?utf-8?B?Z3FjVUJwSXFRdHcxazlPSHJWVWtJeU1ONEdCTFZNakNMSU0xQ0tyY3pKVzgx?=
 =?utf-8?B?NFhhWUlDeElyWFo2RVV0Z0lGRWRsOEtVc1dLRlJhL3NBWXJpakFPMUtUekNx?=
 =?utf-8?B?dk5yRWgyeTVBK1RKbTVrK04xNE9TRnVwSm5lSWJKZGNwRnZyVW5RUHIzTHpP?=
 =?utf-8?B?cUREVHNWVzh2RTd6TGlBeDh2WXlEWFA0RDUvcUdmSWM5alVTUzk2L3Q1RU1Z?=
 =?utf-8?B?S3BpMXl1R0RJR05uOVVpY1NnT2wxZDZhYllBcXZybVJ1WFdCYmRjbzhMYnlu?=
 =?utf-8?B?WFlZUG5KcWZkTXFyQllkekNFL0F4YVB5Q25KOEtlVWZoeS96UWxXN3lwMVgx?=
 =?utf-8?B?cnN4Tlpod1hOWkxRRWhDaU5rOVRkUHZKTm5TUEFHdHhZYmU5QW1CUzB6QlRj?=
 =?utf-8?B?dUZTOWJrRDF1UFJOVmNHaFNIWGs1WHRNVHhYQStJYTU1c0NkeVNLV1czMjE1?=
 =?utf-8?B?SVVORGJvSmRUUnBUK0J0SGttSEgySmx4U0l5MkoxOVRLWlRIKytyTzNBRTRi?=
 =?utf-8?B?MzlYRlZCUFpBWlhMUC9JWFJISDRWVVIvb3FWMUdNZFNBOVc5T2xXMk4zd3hw?=
 =?utf-8?B?ZE5McUMwdWxTL1ZWbkVISjdsNHByc056dmZaVHRpNjVBYXM0ZEFLcmVhdDNV?=
 =?utf-8?B?anVmVEV1eEMwUGVLeWh6eHp5WG9Ba3dOYlJkaUlzVW1vSjhEbUdUMmFaZ3A5?=
 =?utf-8?B?aTFlbGY1bU1JKzhDN2F5SWpmNGNXR3JKemNKUWZZcEp2QXpmZE1ic1Rvemdt?=
 =?utf-8?B?bTVIQktTd0FDWmdtZlcrT1JDeXhneTB4TVhKZUdpQ1FDNXpsZW8yUCtHRmxW?=
 =?utf-8?B?MXRxV0JzUURpbmpDSmxqYjJTcjM4Tlg3bnFXRWZDaEFZNE9DSmRXelZjRFIx?=
 =?utf-8?B?WENqeG1TTGEyQWpseUx6NlRMZFo2Q1hRR0k3RnVDYkhTNGtERkxMaXRnYTBz?=
 =?utf-8?B?YUNYbHJpMHU5TEJvM0g0YnlYVnkwOHZ6L1o1b0N3a2xFbUVHOXFxVEVXT0wx?=
 =?utf-8?B?K0pzZFQ2MnFxc3UrZ050VWlPUURTaU5zeEsyUmd1Rk9VMUs5eGVubVUwUUxQ?=
 =?utf-8?B?cFV3OVlGV3N2aFRSZGJML2V0QURzY2JGVWZyQWMrYVlBRHg2WGxhdlQzdW5t?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ec3c51-7345-409c-8559-08db519de9b6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 21:31:27.9582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxbTxz0hwLpvr2TZG7GqsSOArCEb5azJf+kxBk+3SdTrUmKy1fBrsHN4jXZbVk6JX5aU9HTw9m0x2CSK7VEHeFoDlxVINwoZG/EJTFLFgLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/display: Use xe_display_driver
 prefix
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

On Wed, May 10, 2023 at 12:54:24PM -0700, Lucas De Marchi wrote:
> Use a separate xe_display_driver prefix for functions dealing with the
> DRM driver struct or the early probe. This splits
> xe_display_set_driver_hooks() in 2: one to allow the driver to defer the
> probe if the display needs that and the other to set the additional
> hooks in the driver struct.  Although the hooks are set by every device
> binding to the module, they only depend on the module param
> enable_display, so that is safe.
> 
> Since unset_driver_hooks() is not really tweaking the driver, but rather
> the driver_features saved in the device, rename it to
> unset_display_features() to clarify that.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c  |  4 +--
>  drivers/gpu/drm/xe/xe_display.c | 44 ++++++++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_display.h |  8 +++---
>  drivers/gpu/drm/xe/xe_pci.c     |  4 +++
>  4 files changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1daacc533083..cb37e8556b37 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -171,9 +171,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	struct xe_device *xe;
>  	int err;
>  
> -	err = xe_display_set_driver_hooks(pdev, &driver);
> -	if (err)
> -		return ERR_PTR(err);
> +	xe_display_driver_set_hooks(&driver);
>  
>  	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 43c5af1ff80e..d1782e0737ed 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -34,37 +34,47 @@
>  
>  /* Xe device functions */
>  
> +/**
> + * xe_display_driver_probe_defer - Detect if we need to wait for other drivers
> + *				   early on
> + * @pdev: PCI device
> + *
> + * Returns: 0 if probe can continue, -EPROBE_DEFER otherwise
> + */
> +int xe_display_driver_probe_defer(struct pci_dev *pdev)
> +{
> +	if (!enable_display)
> +		return 0;
> +
> +	return intel_display_driver_probe_defer(pdev);
> +}
> +
>  static void xe_display_last_close(struct drm_device *dev)
>  {
> -	intel_fbdev_restore_mode(to_xe_device(dev));
> +	struct xe_device *xe = to_xe_device(dev);
> +
> +	if (xe->info.enable_display)
> +		intel_fbdev_restore_mode(to_xe_device(dev));
>  }
>  
>  /**
> - * xe_display_set_driver_hooks - set driver flags and hooks for display
> - * @pdev: PCI device
> + * xe_display_driver_set_hooks - Add driver flags and hooks for display
>   * @driver: DRM device driver
>   *
>   * Set features and function hooks in @driver that are needed for driving the
> - * display IP, when that is enabled.
> - *
> - * Returns: 0 on success
> + * display IP. This sets the driver's capability of driving display, regardless
> + * if the device has it enabled
>   */
> -int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
> +void xe_display_driver_set_hooks(struct drm_driver *driver)
>  {
>  	if (!enable_display)
> -		return 0;
> -
> -	/* Detect if we need to wait for other drivers early on */
> -	if (intel_display_driver_probe_defer(pdev))
> -		return -EPROBE_DEFER;
> +		return;
>  
>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>  	driver->lastclose = xe_display_last_close;
> -
> -	return 0;
>  }
>  
> -static void unset_driver_hooks(struct xe_device *xe)
> +static void unset_display_features(struct xe_device *xe)
>  {
>  	xe->drm.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
>  }
> @@ -488,7 +498,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  void xe_display_info_init(struct xe_device *xe)
>  {
>  	if (!xe->info.enable_display) {
> -		unset_driver_hooks(xe);
> +		unset_display_features(xe);
>  		return;
>  	}
>  
> @@ -539,7 +549,7 @@ void xe_display_info_init(struct xe_device *xe)
>  	default:
>  		drm_warn(&xe->drm, "Unknown display IP\n");
>  		xe->info.enable_display = false;
> -		unset_driver_hooks(xe);
> +		unset_display_features(xe);
>  		return;
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
> index 84c556111c91..9e29de012df7 100644
> --- a/drivers/gpu/drm/xe/xe_display.h
> +++ b/drivers/gpu/drm/xe/xe_display.h
> @@ -12,7 +12,8 @@ struct drm_driver;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  
> -int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver);
> +int xe_display_driver_probe_defer(struct pci_dev *pdev);
> +void xe_display_driver_set_hooks(struct drm_driver *driver);
>  
>  int xe_display_create(struct xe_device *xe);
>  
> @@ -47,8 +48,9 @@ void xe_display_pm_resume(struct xe_device *xe);
>  
>  #else
>  
> -static inline int
> -xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
> +static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
> +
> +static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
>  
>  static inline int
>  xe_display_create(struct xe_device *xe) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3fa3e8706d98..8b3d4d5006e8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -618,6 +618,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return -ENODEV;
>  	}
>  
> +	err = xe_display_driver_probe_defer(pdev);
> +	if (err)
> +		return err;
> +
>  	xe = xe_device_create(pdev, ent);
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);
> -- 
> 2.40.1
> 
