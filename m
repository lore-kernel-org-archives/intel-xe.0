Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3ACD1AD50
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7396E10E63A;
	Wed, 16 Oct 2024 12:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4jkVVbs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1D10E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729082220; x=1760618220;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CzAMXEBzyx4UFMPVZk80yWBRZSOl/cnodP/9UUbDW+I=;
 b=a4jkVVbsZGLWkmUAImEte/Y6De2WMkhbktc1cAgFpbFpyfc+Sta6IgJe
 DJ0L0bkw+3IInz71qYJXw5Y0iTh/N4fRiIEBj53dX08gw+ij0F88wImW5
 OTG29f1nBRyOECzTNO8jLp7TasR+oblJm76JFozqdeWSuLBqrqDGyKqg+
 HoC0LPNDlvwnsk5ux0U1yvSabIbJH9X7KOkxz51vvM3XHNKX5v5WU/v+j
 a0M+54F64/Xwn4aUX1efOLSGpSH9iM/Ee0tJB9mvjVdvMYchE9RrL0vBV
 y85Aus5MLixq/3AqbakfUbRioXROzdaCkyUQfu3OpX+TxKaD3Kvl6FZl8 w==;
X-CSE-ConnectionGUID: uM5L4horQIejy2LrqKoz6A==
X-CSE-MsgGUID: K2qLhEIhTpezp1car9lC2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39156740"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="39156740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 05:36:47 -0700
X-CSE-ConnectionGUID: A8yi4AbGS3eTltvxc6beMg==
X-CSE-MsgGUID: ZJNEe+Z1SVOs7jwZMGs6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="82873149"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 05:36:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:36:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:36:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 05:36:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 05:36:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lShw3VDeoZS2GsVNOPI+C5/EF8QeKjIRW5Erk5+xZCp2Pm+67Fzqw2syfPm/wqOxC4iXyC/Oj4b2czH2eHzndh341nvTnRzoyN9IpnnFRBjNUmknu3KLJGwClKrvZTzA42h3c8eh5xqe7iNpeC5fcxZCMT0LdgMCsi1Ky129z/KXS4xBwUIOVafwbdLyEJTjY5iescgCeYHcCIJhBhVseXF7oaRMBV1yXcgGZzBuYQlGj1BP4YUd3paSdRql97F9qNOgGJ2RF4DxZy5g2lsyXxzdc3aVheyL/zmkzhsx6phj0CuBdnHjoGN4tdHxxGbsnZIART28qFz/8VIzmE8W4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QyDWrO9sljqW5cklSeByF/UTeQomvtwXSO+8S6xNlo=;
 b=n0sO6cu9GQ2hiy0KfrJj04s5hctAXIWugyHrQ6h5NILmd35tO6rhV3GVTlCcxuaHWeELZCo5Bg8XZDKidbVW/gCThRHo3qm4wdvcLfJVZOZ/uikVAqjU3OhTl8v6YPpHyw2cVdg96f8BvE+0L/GhpR1mDPfgevizyS/aMepjViDdWkdCPN+YT2OYyLWosdlhsMWetbDDgaOUiX5NrSzkNqEeVF64xUsoprMcXz5TcoYCMI109Zhmpt+6CpPU8vvk9XVlHVkERZ88MVL8mkGwdtula14pydvGSPOoDkW8g5T8gXhwD1JRev/NL6+F4bRrA4ex0Slx5IqvpI06L4uSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 12:36:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 12:36:43 +0000
Message-ID: <8ca8c6eb-b10b-467f-9310-273da20bd49a@intel.com>
Date: Wed, 16 Oct 2024 18:06:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 20/26] drm/xe/gt_tlb_invalidation_ggtt: Update handling
 of xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-21-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-21-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: c5224b16-8f53-4054-7aef-08dceddf30a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDF3V0RjM1NZZXBmVVNGOVlWRWxTditBWTF5emlxb0xVa0pnRWZWem1YY05i?=
 =?utf-8?B?NGVzOEE2V3o4OG1iZnFjZlZZVDZtaW9tc3ozSEFCZ3JUbmRONmdHN3VyNzJ0?=
 =?utf-8?B?NnRhUWtjbndWZ2RTeDFta1g2NXlLYmZTVTh4OW9lYisrSkhFelZ1aXcycUMw?=
 =?utf-8?B?L2hTZ216ckd3aXcxWnVBWHNUdUl5bUJhczFjR1IwY29UTkdSajlZVmxtaGdk?=
 =?utf-8?B?WlVsMTFtWUN6T3BnSkxhUkIvSU9DQytZV2FJc0hBMzd4aVducWdJRWozS1l4?=
 =?utf-8?B?dE1oZWd2VkV5b0ovc1YxUFZadXlkWHdwOGYzZ2hsTUFYdXV1S2lDalVRRHZ1?=
 =?utf-8?B?UFZGekkyMmkwVnF1MjhDYVFMWVNDUUZFeld0YmtQYU9jTEhTQWMzWS93WkFL?=
 =?utf-8?B?K3lodDduSHBTU1FGRU5GUitFbWo4Z0R2b1JFNkoyN3E5bEdYdDBkU2t6MHdV?=
 =?utf-8?B?SEhPbUJ2THhTV1VmVzVKcGxpd0hjaEpvNCttZisvRWdzZGVZTVpnYUF1TVRD?=
 =?utf-8?B?cXhZb1dKMzVWa2Vrbks4SG91WkJNWVlOcGxBdmllOFZQOWY1UFFiZGJ5ZE5l?=
 =?utf-8?B?SksvdXc4dzVpd2ljeFk3SUJ2U29OSS9PY1lSQU1GMkJVSVZWYTNFd2NlRUdD?=
 =?utf-8?B?OUQzdjFuVkRHNmttQmdjb1N0cDhaV0tDMTV3WFo1NGZMbVYyMVloVzhIOHdT?=
 =?utf-8?B?aXpjakZLTEp0UElmM25oSlYvc29ha0h2L3pTbHNJakZvT2ZaT3VjNFpDT2Z2?=
 =?utf-8?B?SFJ1VDhTNjdZd05vMFg2bFpqZHNTeHpDRnBnaDJvUlAvYVlSb3JiTXA2bXJX?=
 =?utf-8?B?UzNpRklnVVVUMEN5NzM0Qy9tMkdOaHVhK29GVUJNTUtnakg5OTYvZXZRZVVM?=
 =?utf-8?B?RzVPTVN1TE1MTVVkY0FxZ3B5QU96STNHZ2pOMlI3Qkwva2FITG1uRms4akJP?=
 =?utf-8?B?OGMyOTBSNzlvcmlYcnpTbzR3cW5WcWFrclZybGY5Sk54TGZjNG5kKzdER3B0?=
 =?utf-8?B?aElFOVlkK1ZCZEZ3OWxYSktJWmErNXBsNm9xUEVmcUEvaW5paGpCSkZ4NVBO?=
 =?utf-8?B?SDZpdXR1dWRTL1Z1R29SNzVacnF5emNNcUxzQ2U5K1pjNndkQUVvekR4UnM4?=
 =?utf-8?B?cE80b0I5QmdjeElscXJFSUFoMTZzSWd1OE53Q3pBUFF5cjRXdVZKeGpRZ3FW?=
 =?utf-8?B?N2VpczBvTjg5WE1SQUZtcXFTSFhXYm9lMkNJV0ovblhoK3dCOERaR0FaZkpX?=
 =?utf-8?B?bXFBSHdyblpNYlEzL3RWRC9pelJhajhNQVc4M1JScFZrRzZ2MVBKSVNoNGZt?=
 =?utf-8?B?QkZWbG1CVldvKy9WSEtWTTFJdVI4L0tkVE5IekQ0ZEVZa21xTjJ4TU9yTHVN?=
 =?utf-8?B?SVhUelcxUUxBT1BWNU94MlFZbFUwY0FENjJNaUJFU2hjeFoyWUZiek5PUFVp?=
 =?utf-8?B?dkFJd3k5UlpLWVBhdFJudHdsYnBpT2NaUEJqSEZVQlJUSS9laFd5WERGNjNy?=
 =?utf-8?B?c3VwMUl3TVJIN2drVXd3eCtEYklic2EzVURqTlVBTWNpS2NDbkpQdWE1MmFQ?=
 =?utf-8?B?MklmTVgxOXZmY01jemFOdXRuWVY5VkVCVjJFc1hWbXM5UEtzRFZ3V3pKRWZj?=
 =?utf-8?B?MFI2c0crbU01RkxockNBQzhVTmdXYnN5b05lSlVKUEVmM2cxQWsxWThlZ2k0?=
 =?utf-8?B?L3k1Umw2eWdtVHpJa0ZjV0xIUnNHTXpmOVlCNURZdC9PZlZSbGZFelNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXcrdTFUK21Fc05MajFNOHhyS016UXVOekJ1YU41NnZEUmROZSsvUGM3NnJH?=
 =?utf-8?B?Nm5Hd0prd3J0Q2lkT1pWYmtLSzNLMllJVzRzRC9Ha1ZJb1F0VmNwNkVza1dq?=
 =?utf-8?B?TGhwemo5NkNuWWU3a05ZUDNWcWFIaUF0SVpQSHdUcGJOV3A4MlZQeTFPRG02?=
 =?utf-8?B?cXJibWhFcGYvK3J1WXE5TXB6MlpET1FpMmdveWZCVk1wbHNSMGoyZ2M0am5r?=
 =?utf-8?B?SUVmMlB3aWFVWCtNY3JDNjdhVnB2aUZEbHg1enlPS3c0Q2VPc3M1UngxbGVy?=
 =?utf-8?B?NVg0QW5nSkkyUlBsVyszZ2dPQzlOVmRxM0tHdVk5OFFGcFlwV1k5MHMzLyt1?=
 =?utf-8?B?Zm83UnUvS24rUk91YXEyVzViQUVwYnVPem1BRUlIbFJrdEJ4UVRsaEtSTUQ0?=
 =?utf-8?B?dmxnRC9ac09FWGp6Z1c1eDhDNjdWS0MzdEI5cWcza0FpcFF5aVVJbVRVeUVE?=
 =?utf-8?B?VFFRbTNRSFpyQjJjSGxaVUtTamhTY2NXdEJ4KzZwUWJYMXl2UmFLOFRFY1BY?=
 =?utf-8?B?eGUzQS8xNDlOWnZ3aEphb2RmbTBjN0M5WVIxNGROWTBiRmt0QXNrL1NLSUIx?=
 =?utf-8?B?QXdqb1d2M2xEQUsyL2ZOM0wyKytRa3k1d3pYMC9kWGR2VmhkZXR5bFJLZ2FN?=
 =?utf-8?B?bDJHMHRBYlFDOGZ1TU10czZyTkFPOWJCaFFXcGFTZ1B3NldEc3FYclJTOHBr?=
 =?utf-8?B?bU8rSm5PcGloSUlUY0NYdzFXNldNOERIeXdhMHZ4aGkyQWx1b1BtMnVtREZm?=
 =?utf-8?B?WFhUeGxiOFBsVVNlMkgraWVsNnp0YXREbDRSQzMxYzdQM2dTcTBtbVpqYUp0?=
 =?utf-8?B?dktXREl1TlAwTitvSzJVek9rVDZXeVB4cXpGdjB1SEo2VnVNcWx5Ukd4OHZy?=
 =?utf-8?B?bHV5QUNHV29aRmFvcTNwSXkwbkRsQU92bWYvOFpyd0ZENzNIazdYRThmSDMx?=
 =?utf-8?B?UXc1RHEydXptWHRUb3NyclRKYnQwUDRVSGxPT09XOFh6dmlQUndFMXlxUzFp?=
 =?utf-8?B?L0JSOVg2QXZmTjhPdGNKQVNDdU4zandIM0J4NVpQbEU2K3Vscm9yR0pRWE5n?=
 =?utf-8?B?RE1oYXVhQWhUcFJGbWl6V2REWHF5OHhmUFVwYXJYcTFmLzNQNFZUYjVMd0Vl?=
 =?utf-8?B?RXlUQ1RIWmZVd2VBZnlWcFQ3d2VZY3RIdzJpMS9XeHhsU2VmWUJFWnlncERw?=
 =?utf-8?B?QU9SYWhpSkcvR2xoTDJtLzBuU0IzSkpBUkdNQkVTUzJkYnVkSWhhalNyclpT?=
 =?utf-8?B?UHRscXljY0dBY1llS28vaU5FbjlNMnRIcjExYjJjQkprWWlOLzBPN01ITVEw?=
 =?utf-8?B?TkJ3NEdkYUNwT2dmOFpCRGJLd2VrcE9EVEVNYjQrazM5d3NFaVlGeWpxRllV?=
 =?utf-8?B?RVVrLy90am90V1hzc1lYN0wvcVdpMTVoTjV2aGF3MkZ3dmR1Z3FZS2lqK1cr?=
 =?utf-8?B?YWFRNW9NZTZsRUdEa1RZMHhQdTdvbUxRSk9nWjhpVG50U0NzRnZuVkJBaVhW?=
 =?utf-8?B?eGliN2Q0M0p2RGlJSFJGK1dPVjRJb0JDLzcwT29lZEY1SCttUThrSFRJV0pl?=
 =?utf-8?B?VEtBM0p6MEMzdzgzWHZKQW84Zy9PbW1qZm1lU2RTeC9RK29OaTZhWnVCYkE2?=
 =?utf-8?B?c1F4d29WN2dFOGRnNmcvZEtGc3FkQWQwQWFGWTB5RWIybHk1Ulh4RU5sMlM5?=
 =?utf-8?B?TXdBZTRmNlk2K1IrenVsd2dOZ0VRRGw3U0I5RzNBcDBNMmRZOW15RGZscVFw?=
 =?utf-8?B?blFheWh5Nkt6TERsaDA4OE5taXU5RFBGT3YxbWpaeDNtVkl2OVRxeWdRY2NP?=
 =?utf-8?B?d3RKdnF2TE5UZUR0NHprSEtnc2U1SkUyRXljYi9KcDVjbm02dEY1K0k2aEtl?=
 =?utf-8?B?dThJRmZORmthT3U3QVRyWStzQTUxRURzQ0NBSW1QYW03NEFocUN2V051RzVJ?=
 =?utf-8?B?d2ZHVTd5R1JLeFp3K2JPSkJlajdnMDllUENUb245T2FReUYzb0ZiWUtuN3U4?=
 =?utf-8?B?NDJFeFk3ME5kRmxyanVnSjM3RzRza3haOVBzOU5zb21raVc1Y1VQMzE4STZR?=
 =?utf-8?B?ZFhZNEhicEkrdlpXT3pwOVpkU2pwU2JUK2wrVVZtc0RBWlBvYXo0U2xwOW9H?=
 =?utf-8?B?aDBBTlNsZG1HREVjNms2aU9ZbGd0Y2JDRXNwdThrQ0JYaUNNY1hDYmhKdHlT?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5224b16-8f53-4054-7aef-08dceddf30a9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 12:36:43.2998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uA6RtGOBHqvEASifhFF2ruhkJ7nOkw2Q5d9wbBR/svYP077AgeGtE9x6BfFaQyKuEg54nQxyLwI5wMS8iKInA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> 
> v5
> - return unsigned int from xe_force_wake_get()
> - remove redundant warns
> 
> v7
> - Fix commit message
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a530a933eedc..773de1f08db9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -268,6 +268,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>   int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
>   
>   	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>   	    gt->uc.guc.submission_state.enabled) {
> @@ -286,7 +287,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   		if (IS_SRIOV_VF(xe))
>   			return 0;
>   
> -		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>   			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
>   					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> @@ -296,7 +297,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
>   					GUC_TLB_INV_CR_INVALIDATE);
>   		}
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	}
>   
>   	return 0;

