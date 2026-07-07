Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD97EC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464BF10E520;
	Tue,  7 Jul 2026 22:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrEvLKMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D8510E520
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783461829; x=1814997829;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Vk695gwFfObTGPU86x8z7LI8HZ6h99f6zcGP131aZQo=;
 b=IrEvLKMNa7KWzaYnBckbnpDGFN7CWbuvmx4/5OyVzltZbwbEKeScZSs+
 FlIiDgXRpxqzCKqPacPOGwTi7qcq/QRDkpI8gyNfLu16iTwTLLUCPDzgX
 eZSpIMYUu60/JhVPadVXMDWKX8n/ed1/TKNri6mOTXIi13XiR0TDJaHOV
 O9SjM8kReqKaLA+ySNZjte23/kCSOA5806tilFQzHzCPwHQ++BMqbmwun
 g0ulSb45Uggx13ekc9tNMMNH076XIt3awFevGuz5s5Bfqa5NpAxjUDjty
 UJ5Rh1Ovv8FsTxi4B4bWSG0yggxp53lPnxsaFm4eKzZdRz2S3vNVIxx5E g==;
X-CSE-ConnectionGUID: ML/wdg/GTb2VWIdIpJrgCA==
X-CSE-MsgGUID: QzvSXmKyQ2uNwUIwJja25Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94474086"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94474086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:03:40 -0700
X-CSE-ConnectionGUID: 01TOc3wmS4WsvB2qVz5urg==
X-CSE-MsgGUID: LTC5Ig33RzauRIU9uxNc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="284216987"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:03:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 15:03:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 15:03:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 15:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cf2nTnR7fQG4qgOzxMmKXtL8JDIklYyrb3eRjYZwCXgPFkUEssoBjyHQu0Zz3fRnaG58Rx7jkxfzWjTFAyHDuMFOk5yVenH/18e9iHcMU6FcNZt4emOCvedD51X2uLZJISZfN2fas50JGNg+WIJrToOhS0r86Ap1s4G/wN1J/ka4kBdwGlOMo9ki/GeboFpztgPQBw67v3fMFMcVCHu76O2Jr/yNM0C47xfs1Ff9uD/lhqDsKnZpnQEKZ+xMvbPIIreWjr8RoUpB1cg5uZZhYt/JyBkV6ww9uKbgxQbMu6OIij5CLePZRo/R3SRabFfqit7m/NpE1mbk808yaEuwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVA8kUzJq+m6tNqPr3ve/8SkRvoDVehrkgHcKfd8y5I=;
 b=vIgEpwHNt6np/YfFF9hgR8zyJ/FV+jJwnD201IgxVt+EKmiwaNjCeq33rXNLBswP8ZpXlsQ5eK+1CGRMA6sQrHepkXyedRisPJ5+onJSaYMWJbek2z+r1dwddaJ6bJ8vIEKytxWMYr+jHgtkemCo5InEDLglI69Mc0fXPf3BFGlhbNbZjNuQa4lcuc33vuvrBvjb3WIex1idY+zzR+AQzc/hif4So7jRZ88ZOC4iI6eJhMkmdOptsS1ExMYPM3VeCw+aL4Z4SXi47sb8IzLwXUdWuGOd4BvCUezblGCW51CyjyI7A7aKuyIm0t0cA/NsZTo5q/pIFzYoBGqrCwwedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 22:03:30 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 22:03:29 +0000
Message-ID: <901e86b8-4f97-41fd-87fe-f1a53a1283f9@intel.com>
Date: Tue, 7 Jul 2026 15:03:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/xe/guc: Define GuC firmware for NVL-S
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260707192547.50535-8-julia.filipchuk@intel.com>
 <20260707192547.50535-12-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260707192547.50535-12-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|MN6PR11MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: cd13f150-f3a5-4362-dd0d-08dedc739420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IokoR2uv7M9TzCQ71WC7bneIQMkwWVEwYAyr3RNgxJd/jWCgCw9Z+ZcmAJqGY/GaG5DREaxMM0Ux+UObz96ipOv45jZqE2hyaVmCFhKaSMDlcQxuP/4O7VFndn6UcchHLgkesaDvN/exE95ZxbM0/xUnBMuVCmxDodKn0kz3SvbO0auar2D8QPfq0PhxVwbw0v1cMBeC6I5Mq3Gl+/VAR9/jUb1lgg71SrS7K+s/Zwd6EP0qvmkH32Bh1oh5Y3uJhJyhG328lGXziNWKcCN51owqnrrmJZgjUAxmJP5sZOX62cfw81s+niYb0umutksz7kOxRfZi+0lsPLZCxjIp78NUjNBe8GJrULIJYhIGYSdzp7dYR234pC9NzGXSaVU5JLqQbDF/ZgIfSzEPaNQkJtqA7P9UXOJkMRBYX4eyhRdx8fKLcxLIbt3c2vw9P9G1QTzuiExWc2HGXwqXWGA5LVTXbl9kHDUQuz3Al6whCJfJA6oNZdABhU9mnl4n7CuKiyFz/maxD4H6lNWFK20EeRM/pewJygORb4x+3hM+qoLYx6esMvIlWqHR0GHAA6ltWVNkwDMsOtyJ3O6ylv09f5Gmb6+agV59MVeQf1kBCKBkmyfXP6xm+g9aw2wc55Bu7ZSoCGrC2kfHRFdRF1UC41ySt/41NeGDH/2+//0Kb1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEIyaERYRUFBc0FZcjNTYTdPT0g0WC9oVTlxSS9lc1dvOVQyMEM3aXVxOERJ?=
 =?utf-8?B?VFQrQnlJcCtuZ1NaMU1jbjhhQjZYaDRwZEd3ZXN2K1hucXdBNGFkQ2RaWGNM?=
 =?utf-8?B?ZGNkbVhsdFljSnhYV0liUmp6YllrbkkzNVRXUlRyYVpsVG1sRnh5ZWQ2Ynlt?=
 =?utf-8?B?SkpHVUtVV21hK2FDaFZrbDJJNjJtcmRuL3FuOUUwQjhIQkVwanhGZFQzU3Jo?=
 =?utf-8?B?S1lxc2U5YVhJYncySUkyWGxOWW11UVZGMmJkcEV5cmRKNjdzeWZ3ZFFqTW1p?=
 =?utf-8?B?SGtBeUdnNUVlUGRac2FTS2dLWmtmMDJwQ0pDemJ4ZC9sUDlpcnMvbll3dEhK?=
 =?utf-8?B?emlZVVhCUFFiNDNzSDJuNTNaUUxmRUVJMDJ5czlHNHowRFZHN2t5cTM1UDJj?=
 =?utf-8?B?QWtnQmVVUFpabmJ4dndHSFZGUVdLbnYwY25HSks0WnkxMm43NktZREFWWXIr?=
 =?utf-8?B?eW1pVmRSenRIMzRGd3c0RnZaZi9vdXc0WWozUndneVBLV2NPeFlTZDFBeldP?=
 =?utf-8?B?SUF1QmxSaHpXaUNnSnF5V0xvSzZZdVJkVzJjN2dGMnliek0weWVkWmljMEpV?=
 =?utf-8?B?ZGFGSkdqNCtkWkkxRitaOXVoV2laVmZxMjY5RzYzU29NeEVSajJ5S05oQ1BX?=
 =?utf-8?B?c1B3YXBoVkNzMHpyeUpDVC9XNURlekQ5elFKRE9TNjBzS2ttakJMOTY2c2FK?=
 =?utf-8?B?dWNXQ3RQUEtyYkFCMkMxTzNOalIxcnBVN2pHekRpblpMdWkvdnkzQzdTVTVw?=
 =?utf-8?B?dFhzaDU5NmtTbUs4dXVNK09laDJLYkY0dlk4aElhWG0yRHNlbDAwc0h4ek9Y?=
 =?utf-8?B?cmpNVG4reDVRTFFuNCtEamNJR2k0dlVPY2VHbnAva3hzTFRnK0Q3SDE0T1VO?=
 =?utf-8?B?MXRpUzR5ZVRkMVI3NkxWbGE1UklIV2F0TE56NllXZ0F5NGdVbDQ2Z0t1ZUQ2?=
 =?utf-8?B?a295TktsNml4TFRzTXJoUElBcVRtUGRVSzFWUnRKSTg1d3E4MzRPMEF0clN6?=
 =?utf-8?B?NmlXc1hMVGFkYU5LUzgzU1ZpdFkvNGI4U0J4UE9Jc205cEZYM21PZXpCSnpT?=
 =?utf-8?B?UzZ5b0MvRDFHdGNEUExmcFNyTUdzb3pBNHFvc0hrT1JIMDFRMGZpQyszTktS?=
 =?utf-8?B?Ty9XTW8yYStvVU1CWUk0N0VKc0RzaVluanlDRlZhWjdnY3NCRmN4MlR4R3pL?=
 =?utf-8?B?VzdqcHU1MXZZdHk2b2VRNkFjeTJpUmJsM3dWMTBianBVeGxZcXRoTkplbSta?=
 =?utf-8?B?cEk5ZUpNRW9yYVFHd2VjR0N1QVhVcHROS2tOZjlNNTNMRFFmTXQ1TzVSQ2FE?=
 =?utf-8?B?Y3NGM2lmcEZ6ZTFIQVF4Q0lHZWFEelpxVEFhRFdpQ09hS09EdFBuTXQxL0Rw?=
 =?utf-8?B?cXV5bStXbHpNUjI0blQyTGZzZnFkMEgwMzZDc0RML245Y1NDVHlJaDB2ZEtY?=
 =?utf-8?B?WFFBQlBRbDAwSjhXR0N2anFpcFRiSDUzbXRqdzF1dGtpV0hZTVhvVE9vZ0U4?=
 =?utf-8?B?Uys2UGdNWlFoM2ZVWUdIQU5GSStaRnRvdERvZDZZZ05zZzdOekl0SnZGb2Vw?=
 =?utf-8?B?UnJCdnpLQ2hha1djbENrSmF0dzJ3TWI1aHc2SzI2L05DWjNMODlBUW82Rnow?=
 =?utf-8?B?dXpiUEpoQkRRM3BwdWt0UnpUdkFxb295WjV5WWZ4QjJwOCttQXhLWFdHUTJu?=
 =?utf-8?B?QWJzSjR6eVRsaVhONTdVc1JCcys3SUttbndNSFN5c0c4N2NFSjRVUUZDWjdZ?=
 =?utf-8?B?RmRGNlFmdVhrVzc3ellGa3ZsOVBlQXVqZ28yNnV1VFVqbVhSR3h4N0oza3ps?=
 =?utf-8?B?Tkg2eUl1ZVAxWEVMVUVVQXdqNUtQYVdiYTAyUlQ1aDZtVUQ2cG45YlZDam1k?=
 =?utf-8?B?ajYxZVIyL3hPR1Fjc3RlS0ZvbmJYSXBBTm8yRFBiTUxwQm1FUjJFeWJ0MXU1?=
 =?utf-8?B?VVVUdTNhS2Y2VWVJcGl4ZUJnNVFZREJzSHN2bCtHZE9oZlBRbkZTZVVCZ2lP?=
 =?utf-8?B?WTZ0UlI2b0lEN2UwS1R1bGpoS1BsKzB6WnJPL05hdUV4U1FaU1VkRjFpMGZY?=
 =?utf-8?B?RGlYQkU0NGV2Zkt3NUxzRHFSMSt5T3hvcG9TQjhBWkZhU08vSSsrTWRxTGJ6?=
 =?utf-8?B?NnZwZmhFK3krZjY1U2R1VDhkSG1rYjQwTFg5RnMxZ3pnZnlrcVRIVDZsVWgx?=
 =?utf-8?B?dmJ0QkcyNnZENk5zTVBLd0tiTkRRQU5kYUtZamQyTDV6cm56cU9LWDA4QnZM?=
 =?utf-8?B?RlV0b1JUb2pCbzNiT09NNHhYSktFWk5uQXB2SXVibGU2L2I5NWtRRUhsandZ?=
 =?utf-8?B?UER1bUdsWUV1UXVrVExQeVkzdjdDcVBBS1lkUi9Bc29rdkVTZEVsa2ZTang2?=
 =?utf-8?Q?ABM0dO/uOLyMVpY8=3D?=
X-Exchange-RoutingPolicyChecked: lr1XFAV6CyXVUdat8551FWZBkYcR6Mr73aNqkhgQI1EuK0JymTmku57oatvVEWTakpQHa5r4UioDCJgt3zyxRWwd3Jme/WLM9dlNuekXVJdLr1r1GQdwg/070NxQaD8jJGeIQIKnLu5UelCPyFeeXGBLVk9XraUphT9XRxlR6Ne7A57QVOO2g36RuevNU+XstU9eunU2J4TgP/qU9RDci9aDxglwjWu1EJyfpmVsbed5PfA/bSk5ozAK37zbEdwUYBFfo5ny6LDSW4gbguK9Fp/5dodt+KLJjylgX/pAvoqwOj+Sc9g5YhGGWQDSjvq/pJuZ9X9ZcFE9PWTzgMthww==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd13f150-f3a5-4362-dd0d-08dedc739420
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 22:03:29.9166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z349aIvkFaIDOiQRBRshCgBGnNZTpRvHgMtXAHiPphVtfhxMvyCnhet/597aZDBYxl6eQImGSf/I+MTYX1Xb3KqMcbLTx5qaMCPMDKwHlqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
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



On 7/7/2026 12:24 PM, Julia Filipchuk wrote:
> GuC firmware 70.71.0 (UAPI 1.37.2) is the first official GuC firmware
> for Novalake S. Recommend this version for NVL-S platform.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 498c89452779..65f0136859d7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,6 +115,7 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> +	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\

