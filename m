Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3A4CD3436
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 06:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA04C10E5CB;
	Fri,  8 May 2026 06:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gw61g1sA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F410E5CB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 06:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778222268; x=1809758268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cHAZoa/5sGTBnxsIK+NQT18rVEUwJEd6UJ0hhUtOdrI=;
 b=Gw61g1sAj+I91VXndHUOYDzQ1jypQxbhJCJ9EYyh0EldlHpx0RW3cjsF
 ZPpW88Qd2B3TiOZfFSEoPYSe6ZlbvlY7D57NyPXINc+G3lsxwSdtd7CSa
 r2Z7BGw8tbf/WRUJgQndjyJWyWsjgOwORgk++XJtZDOTEDBfacPjr4hh3
 2c9xid9M8Y1YwE/H/1oYvM0r8uASZ+ieh3AopLOceR7GBYaezBYafc0b4
 8UosYcvXCpieVy54xzbR4nZQtsTK5LH8qA+MezG0e731IVfG3e4+EOIag
 CW5aWNsZQs0v5oCw6HtEozxy1sh3zEM0P/NsSqCtdE/cNx/oBJ/DppRaB Q==;
X-CSE-ConnectionGUID: HQpYiBVVTgmUdd0PNgvcoA==
X-CSE-MsgGUID: Qq4MtWOQS+u5IFzOrp8H1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90287569"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="90287569"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 23:37:48 -0700
X-CSE-ConnectionGUID: W5WPtxjZTdOIV1MC+P0cFg==
X-CSE-MsgGUID: rkvM16CnQqCS9SdB16IQ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="240675452"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 23:37:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 23:37:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 23:37:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 23:37:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foT7nmkS8rw3ztV8jqpsNeJ7FNc14NrS4dciDb3ApN3Iu/H+8vkPdVH7Syl21oWBgIO5mJ984ENe494EOgjdhdR3gHQsImtDw5jl93cBwIzM9ljNb/JFVn9UcAUIH9B90gYnRs87xxM40YP6O4iPKRIRohwKGqLgIoO9B1e1YJckZThB5P7C2CuVcOL9FHZDOGnP6gpYpRiGZ3zji3EHXmuRFP2aTxxiYb6gfkv84od3c7txarCd87SVDZbGw63QmyDRwLbPMECBBfI0QPmUMW7YjY9XKdsD471EuL7hSqOss7WH8A9rBfxVB5YLDivsRTXs9wiCzy52RuwpjSY42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N92n4wl5N8wIQ1odm3atR+PYGAWtYc7tf/IpORNa+kk=;
 b=lzjnAP0PUgjCkNufx0X27hETfMfvzK+KuziDiS9NRWLGMRV1BZLjyBfATaIMqjSRZlfGhrt6kZPIljFP4t5Q8TVJdG2CQt5++3gIN0SRh2GDJjSo4fcbiG5E2sNNUWH6O4WTjExEj0eAYOnQrSJhNs5aFOKvGgzpF+SAHInSXm6FVzu8DLBT6je+1K8f6s4hT0+6MU21ogPqRgmu25NW+Enw3Mez8YuwHiG1kXlBgnYnnjSYSwgeEaqw6rOC0FaAyhmcKBRAQi3046b63CZWJFsPwMTB1yY8+Yy9KRQLIMaCJ5bS+1GywBAEZMtvdbs9A5mvarJVafuE8H4/KcoSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 06:37:43 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 06:37:42 +0000
Message-ID: <4ac5d412-de6f-4e04-9000-f9b61e1bc5d3@intel.com>
Date: Fri, 8 May 2026 12:07:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/xe/uapi: Add additional error components to xe
 drm_ras
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-9-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260504065614.3832331-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 6024d788-4e7c-4d21-0412-08deaccc4e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: OLD5DXnLrte7XyGp/1whtkZOOlrLlh78Fp7yYO9J87C4/AeLEr7IzdmFXsPmItOz8uWmDD0yQI+wsnPq6dD7bsfrX3Yve3IrGobtEZ6ESWHgqXc6i6GlnUUNW32KdinJSaBtiDp+D06MWMAYqhvhQiNysx+F3LpqfnoLghXu6EHxirsIrL11YvBvWLt7V0BBssuJW9oQ4o/EQlRck45dy1APsjg86bx0IcicptU2+nlXGCDfQqQhJWXMgfwG1a7Rq0qgB1dV3zgMaPYEO7FmF5CE73k6FwqoUtljeInfxoyAWLX79CvJec2kw3Nn/YouFduytp1eroCrfsFgNz9PIjYy8Gw2C1L0NhEPYBHWueplPY0kUlrK5RfunO2m2RHn9kpJoItimlhLrNc1CvlBvBO/lRwrccBtvG6BUD2OleFZKlJ5U52OAUo42kU/hIlAzcPZ26KC3BdZxfhQi8krQpYTBvjqh6sIaDCWGZYn1XXSKwoW8MGuUwBZfTmml0k4dBMCCfejbQRcQ2CkTFiu3dbZU12bP88zOkvh657xWJ2O/9zmv7Y/L6/8m7Jixx3KJxepNzKPNWg0aS0afj9HA7+VrNd1ZdoKc5/OapH+qLbflizA/QTqt05YrXtMH8olk9z3RxlMJyAmvjeTkUikL9ISiLA4cCNRNyNH138SFXgnh8BqGZCvmBgoS7txg7ww
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk9OV1A3YnpSSlh1cXFhNXY5Y0JZN3p3TERoYUJvSGkrcDU0RmQzNWRkNTJQ?=
 =?utf-8?B?MXVlbjBMb3lob0JqaHY2clV5L3FOd1dwaks5M3ZQekVCdjBTWlhFUklGS0FD?=
 =?utf-8?B?aitZWEd3THJLY09RUEhaRHZFSlZndjViQVpVZU1rY29yYnVLZmNEZHhhVTlC?=
 =?utf-8?B?K0w5Q1pBOTJURVNDTTRSSGQ1ZDhTL1VWby9zRmZkZzBIaFNJS1R0SlFvMEdy?=
 =?utf-8?B?dUFyODAyYWl0a0lsMG50WWg5a3owWkRNS01KeWpDWFVGT204c0ZSSGpDY21x?=
 =?utf-8?B?MUpHUWZGM0k3OVcvTXgwZEl1b1dSNXMwajhtTFFNaW5RR0tJOFJKNUhGMUJV?=
 =?utf-8?B?d0I1Y2NhUWlHZ1BKVWNsS2d5NDZlVVJHVmRHYnlrY3M2QkhhWGxJL2NCSVVP?=
 =?utf-8?B?ajhaTlBxclUyTXRZeDE2WTR2UnFPWDVEcVRvWEdXcjgvL3N3TjVqQnRBSnU2?=
 =?utf-8?B?aTFkSmhrbTN6LzRQS3JwMW81T3R3cmhzc3NYMHlCbEZGendxcDIyUGMxRm1m?=
 =?utf-8?B?R09jTHJqNXN4dXZmUlcwSkRabVZrWkN2UE5yUC8vQVM2aVlOMWh3ZTN2MTFY?=
 =?utf-8?B?YmM4eEtGL3Rwa2diMmFqV05HeHQ2WWt0TzBTcGtCR0l3OTFwTW5oemJEWVUv?=
 =?utf-8?B?Z0RDVm5ONi9YS2dYSDJraG5LcDhkQW9JbHNhMnRiNnZOZThTQlNuTFpSSXZr?=
 =?utf-8?B?ZjVEdmY2Y0lTbVJwa2pPK3p0dUVrWTFSOWNTMCtEWklWMFVQUURnSHd5Vmti?=
 =?utf-8?B?bUhxc2RCcFV6NUYyWlNhajJCb0JjMjcrcW9ZZEt3OW5iMEo0bGtYTmYza0M2?=
 =?utf-8?B?cU1OL0xnN2krMXVXTE9VdjNXOXV0TThvS1NPRW9uTEFrcFg4Mms4QmkydXo5?=
 =?utf-8?B?ODRobW82RzZFbXhaNHRtWlB6RDlxWDRuVDF1V1ZOZTYxYVBPRzd2VmRnTHhN?=
 =?utf-8?B?RHliWVBHeGlvWXExVkc1Q0Q3NTVtcTF3Vk9zV3FBTDVuMVgzL3FpQnlwMmJx?=
 =?utf-8?B?L1lFdGRoNEdrU3ZOMnRSL2N5MmJNRVEvM2xsRmVmYVp4V042YnJ0SW9hTlZu?=
 =?utf-8?B?ZWdJZGk3VjdtMkVtRE9xMFdaUllhMUNXb204MkFaTVgyWVlMZTBmM1ErczBy?=
 =?utf-8?B?ZlA5ak9mWkJNUGlmRUxGNmNUYVZSanBQTGJOVFlUZVB3aDJGd3FKQ0U0d01a?=
 =?utf-8?B?ZUhDR0RlWHNSUER3L0NVYmFJRlZCWHNlZkhFLzdhcjlGeDBIKzNZRmQ4N242?=
 =?utf-8?B?NkowRkIyRVhVa1NWdExPUmtYSHNFeG5YVEp3a0xVcVZ5Z2owSXZuSEtIbkJy?=
 =?utf-8?B?YzF6UlJMYjByMGF6c081TEx5eUJFZnJ6bW1NVkZSZk1jNndCMEVqWEhCa1pt?=
 =?utf-8?B?Y1VhRzVCeTNnRTcrQ3AzNXIzTkdaaHBNVHhFZXhkUFVPZmVjZTNWaDJYSWVn?=
 =?utf-8?B?SzdnZTNWbFNnR1RQd24rVktHbmZEaDU1MTZ3ejUxYWphczZFMy83YUhxbXRl?=
 =?utf-8?B?R0U1STliemw1MUpVak9Lam1GZTFJNFN3bU14V3ZpZ3c4RTV0ZEFFaVkxaFEw?=
 =?utf-8?B?Y1JVbmFhMlhJc3ptQWQzMDM2QU1CUjJydlY0aHRRT1NJbEQ2WDlaTmU4WDFi?=
 =?utf-8?B?WmtYVkRKM0VCU0ZnZ3NRK0FvcFY2dzlzeDNHWTJHemY0U3hlaFpNNlRROTd6?=
 =?utf-8?B?YzVZSWY5YWZTRFhEREpHOWIzMlEzTlJ0M250N29kREVKRzRoSVBGVWQvSmQ2?=
 =?utf-8?B?RXhPSkFFY1lXbnhycE10UTJKTTBQeE1Kd2Q2djIzVm1jQVBGWVBmVTUwWGpy?=
 =?utf-8?B?QWZUV05PTEhwSEl5SGZHamoralBmSStVZjA1U203QzJkSlhQdldiTW9ITkJM?=
 =?utf-8?B?SjZUZlFTUS9kMWtHaVFEUWNMQjYvU3E5OWx5dzRhTmk2VG9VNmpPSjRJSUJN?=
 =?utf-8?B?ZXdoVnpWb2lkemxZM2JBOUdMbEdNbjF6NTMrd3hlc3A0VkYxeXcrb3haSmFp?=
 =?utf-8?B?ekRiMkJrUTF6eU9GcmRuTFFKWlZuZjdzTXRMRFErWWVSU3QrVVdkWld3THZo?=
 =?utf-8?B?SkdyR3VRUzdkRDFFVDhaN2hyVHZvSDhSKzIzbnUrVXF3RGpTNWdIWEdxL3N2?=
 =?utf-8?B?SGR1b1dua0FIKzNhS2VZR204bmQvZVZpYTN4MWxKZjN4STdrQjdOeFVWR2VI?=
 =?utf-8?B?L2F4RUR5SmZKQzNiRStFdmwwbW1TbEpqL1RQamRSNjVMYVAxYm9BNjAxcWFY?=
 =?utf-8?B?eXpaZjA0ZGFhbEdsblJPVnBJWVovQ01vaTlBYTNlMGJuL1l2eEYyK2Q1cnNY?=
 =?utf-8?B?TzFkcUhWSnRTb3B0eFQ0MXBPOHhtbTV6UHkxODFsRXlMbk5CaTRuak5VS2VF?=
 =?utf-8?Q?h+05RK097Hx7SmKI=3D?=
X-Exchange-RoutingPolicyChecked: YN9WAk9UKq84UZH3XPnU9v12FeUBZKJPFyIr1IE5M5RxN+eUKQlbWsrvVlGWxI48cnZkGhsVAEvfa9NZuPQLyGbKX6exV868OrmAbCCYsSBSO9itVFVuRNPb4e7qVndPioVExWTp1rR3TMdg9YwN/eL5iXxRsNUsxW4IPFvEfCPxldKbK8gRwuHJKOvetN4XmKk2l558lC3lnc0bZfcBf3GWNvrl9z7vmO4rpnGA1OGYdDfUSysennLIaxEO9HXvMkHwoss/hRDnsNMPgt+WaxIneWBo/PuWAxUp7WiWGP/j8kSYIbfvBMmuwbbBWK28u+Q+tqMk07z5qO90eiG+PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6024d788-4e7c-4d21-0412-08deaccc4e6b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 06:37:42.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJ8G9RHf7aZS8o19h7+UkOZolw+S37gTvjklu7M47yfoG7tmjTc9qU6n6GIS/782nqVCmNrALFbtYON0KMWjHhPjzcDFWsZlqNWppF2giWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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


On 04-05-2026 12:26 pm, Riana Tauro wrote:
> Add additional Error components supported by XE drm_ras (Reliability,
> Availability and Serviceability).
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 48e9f1fdb78d..50c80af4ad4e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2589,6 +2589,12 @@ enum drm_xe_ras_error_component {
>   	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
>   	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
>   	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
> +	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
> +	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
> +	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_PCIE,
> +	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_FABRIC,
>   	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
>   	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
>   };
> @@ -2606,7 +2612,10 @@ enum drm_xe_ras_error_component {
>    */
>   #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
>   	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
> -	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
> +	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
> +	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
>   }

Please add static assert check to keep names in sync.

With that addressed:

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Thanks,

-/Mallesh

>   
>   #if defined(__cplusplus)
