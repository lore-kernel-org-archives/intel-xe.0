Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573EAC2BBCA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 11:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEDF10EC2A;
	Fri, 28 Jun 2024 11:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqqM0lXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC4310EC2A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719574079; x=1751110079;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JO0iaOQB9YdGdmTmIRlGn8AQaPxoHz1gfZ1TnOa6kRA=;
 b=cqqM0lXR7Y2Vy5r9eXGg/04V/i7YB/CKPSWk6Qi8PkuT89/SMXrLch3i
 yPoGeeJoLAIx8jihQKEBCb2rrDyCne6OUL7KGsE0VaGzO0ijRe3J0a6KK
 A+kgG4KcSj9YcZAbXirqYtzvxX7a+QRf680PIam51DeTz+JNKX/cocJqO
 ruJHhnv+NnlmCnse1oQWIpcUDqu76qljDaUdbBsgNDXIhVhfi0QIeSWMe
 I+pZ9smCkG0RK/4rhb2ZlA8fNl0aruepQZoKue37LtMjUzT3M06AOJG3o
 O6q6X1Qexv42Wpv4djkPVs9f13F/bZEr452ciSLPJavhc14eXYxGju7Rt w==;
X-CSE-ConnectionGUID: HiZftahSS5ONIZ++ykUW9g==
X-CSE-MsgGUID: DSh8B6IOTIeLK5t4Uc7Lig==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27341345"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="27341345"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 04:27:58 -0700
X-CSE-ConnectionGUID: uzBz9qx6SiKVcHlgq4uERw==
X-CSE-MsgGUID: tEDavc7uSNSPq/SO7RPBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="44598055"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 04:27:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 04:27:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 04:27:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 04:27:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 04:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoltqacILV7NylSHRU//jZpfSxWZKS1UXGf1dOD+MB+S9GWY5TKLouBqUp/LSyiSXA/t42IDpMZ3Jjmeg/zgSQTlnErrKwzMFxnOG0tb1nbiwd54yDsBQD3QwF/2TKZ6fNO+KRw8nl/ETO0XoqHwirbkN24BmNGiDnR4QC79eIM02cq1Fyv+vnvB5BtJrHlIFmOONsMO7aJSbWWgMQsAMQ0vj1m01HquyTOkwUrI6usbPut1a8/2sSrof5GE6EpB/FMZ9rc0YYGSu3dPiC/6GjlOqD/UzVbEBLpxplI0dwHNrJLeiyH92KY/SgvGTleLdwWJrKLAhXUuTKc1MtvNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzo0kMgr5QfgmhFlzqemoRUtvyUrB1C3DwcDNiX1RxU=;
 b=c4ZI+NJ87PB3wDAcI6mZG8bHOaLAvdllOcfs064u8jQZwcR3XYxrOfvxVvRi+IFjICO3o3KxKrRnZz9uaMQhu2hmabJ118fOXqkaSw1AOJVwuMpnk3+aENUXL7ouEm068wGkmNv5gJS9C0UyfNdAu6bv+soJgg2EmcT6xtcn9VscRpg2VRE/nYT1edTpCY30fCfR/dpAREasUUNA2kKktTqUxkQ1dPSqC/UpoBib7OqABXloG4HnXAI58yaWvi/Ua+Ue6nqZvroKtKDIO0TMtRIWgG7KLtpRH6V36o5I0JdXn7f+zFKCGqkV21bOKUTqKLzQU7wVNVLNKZ6346E4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 11:27:53 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 11:27:53 +0000
Message-ID: <3f715e14-7f09-4737-935b-c758cffb5699@intel.com>
Date: Fri, 28 Jun 2024 13:27:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Remove unused xe var in pf_get_threshold
To: <imre.deak@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20240628085457.21929-1-nirmoy.das@intel.com>
 <Zn6b8oyAJ7GtTdka@ideak-desk.fi.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <Zn6b8oyAJ7GtTdka@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::15) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 901153ca-884e-4e1a-1659-08dc976559ca
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1Y0cllBZC9qc29lb3lWQmM0Z29uL2VQQUxod09VMWxyNU5Xa2NNNHVjT1dZ?=
 =?utf-8?B?QVN2dXUxdVVKM1U5YVBGVGJCN0hFTEJldWtqUzJXQWpIOGNCQ25pcS9uNmJr?=
 =?utf-8?B?d1BPQkd3WXNncE5VVExCZEJ1U2ZsdXFPM2F6RGNYZ1VzODAvc1h1V1I3ajN3?=
 =?utf-8?B?OHk5cHpEVE9ndzJmbW9zc3ZQSk1Jc1BqRnZjaDNmK2NmRDFkZUo1ZjI3bDQ5?=
 =?utf-8?B?VGUrNFVzcHBrcVA4aHYxd1VYc2k4TWFwcXNmZVNCUDhsaXlCR3pqemZNcEVr?=
 =?utf-8?B?c0VlQ05Yb2o0bU9RckNNakJjQ29GMitQbFgzZkg3cVRiaTB4aEdkZEpIcFhy?=
 =?utf-8?B?SGdQMFFaVHlwUUNtREllNWJSckk4bHlBRmVPaG9NU3RNUXJTOXEvOTlmUjA0?=
 =?utf-8?B?RHU4U3Q4eFVQTmNycVh1SHlaNVZKeVUxaFBMdjczVW9hVFdjdzBMNWlpcnpT?=
 =?utf-8?B?K0dmZVF6M3J1c3MxUEZJVGFRcFFRZ2RmWkhnVjZjZ092VUdYaWRrN0x1Mlgr?=
 =?utf-8?B?MkpxbGd3c2ltaXJvN1VkRk5hUHpvVHRnNitBZ2xlWUxXVENoYmozTUdFU1hC?=
 =?utf-8?B?aUxVaDErOVNjbWJ5MWlNYzNzRWFpMGFjbDVnbnp5S0I2dHBXOVNKVGFCOW9h?=
 =?utf-8?B?S0kwMXYzZFlVYkl5T212cW13NW9FQytDTWY1VDh5MDRMV0RyaWdJOHN4d2dD?=
 =?utf-8?B?RUEyYVNtZTYxM28rRTl2dEd6bDBMbEQrV21qTzNoUnU1VXo3UHFta0l0cy9B?=
 =?utf-8?B?ZnpxazFia1NVeUZ4YnhnaTNmVUVreTYvZVRVRzJUYkVXVG5KWWRxRGxjTVZD?=
 =?utf-8?B?eVNOeWF4MWxxQUVoWmtjZlBXTWt6NWowM3Qyb0lIOWxybitBcUNwZklYaVEy?=
 =?utf-8?B?Q2N4ckxubFZTYnVWNFJHV0FST1VjNCtkMGhWTFpjSy9Va09jWU5JYnByV0F5?=
 =?utf-8?B?MWtocWM4dFUrdGIvdWVVQzBOdGplNVp4ZVB2aVZQMGQ5Z0FPV3RxeVJUcFcx?=
 =?utf-8?B?YzY0YTVEQVpPMlRTUGhKZU1kQnBFcU1qaVZBNTBrM1hzbjczVHJUYlhvS2t0?=
 =?utf-8?B?ZFRLdENROWFQUWdFTFFOTW9idHl4Vklrc1l3TGtmSjFSTzRCdXRLMG56eGEy?=
 =?utf-8?B?VXNlVForeUtwdjdvTC83MHlKQmFIa1hRYVVMSlUxZjMrTmVHb2VTSVJOdHlo?=
 =?utf-8?B?ODNtVVF1QmxvcXVEVmozU0pTRXk4d0J0WHZWZmkwdXF2c1kwdHhKVFk1b0ZJ?=
 =?utf-8?B?Y1I5ckRFSDFyNzVGdWxBSmUrTnZQUVdydTF1RXV0NDZvQ29HQ1lNNzkxUEtO?=
 =?utf-8?B?NzV2MHFiOXNwdjAvM083dXpMVGhHeTFodENueTUvUitpa3ZUWHQwZ0Z3cGhP?=
 =?utf-8?B?MDhNaUdlMWtld3VnVFc1WFpWYXI0VTNzSlBmNHZxa3Jha281WU9Td2xOUEdx?=
 =?utf-8?B?amdTdEN2SldPdTRRekUyc0dYQVgwSGVwdlI3SGMvMVpkN2wvRTVWWU1qQngz?=
 =?utf-8?B?VkZWcmR0N2Jld2poWFpwS3NCL0lWNmN4WGo0NVpWdTkyc0V3bmdMRndUY2k5?=
 =?utf-8?B?R0ZpVmkxUVNaK1pwWlp6TmZpSjRjMExaSDhHUU12Z1pnWGQ0RWZIMko5ODFG?=
 =?utf-8?B?WlYzclVUTVlhY3BBdHpoVko5K1hJeHI5UUF4eHYrYnBZbGdEd09Yc21KN3lP?=
 =?utf-8?B?cGM5SXVyRzgyemltdC9EQVE1N0hUd3p4R3pRMlAxWFN3YmdiMkU0S1FPUHRl?=
 =?utf-8?Q?8N50AXS76vyBxu33hk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmQzZGhZQVlWME5aVVhJSWVWRGdQbURXcWhhWTFtZUJlUmhDNlJrUkg2K1hC?=
 =?utf-8?B?Wk53Y2huNFYrc1d1ZFh1d3QvWGppVzRpcFV4L2kxaWZSYXZsRmtSY1VOYXcv?=
 =?utf-8?B?WlRpdW5XSlR3VE81QU1SRWlyRlRHbmZ6MGUxdVNRYnpFMjZRTDhpVlVjZDNU?=
 =?utf-8?B?Tzg5T1NzSldxbkhLemk0RjdjL0lxbWt1K3pSRW1aNFlqVm1QT0JIbzhaSm1C?=
 =?utf-8?B?L0NhaVp1bDZpbXVxdGU0SDB2Q3U0eGpTUmsycnczWlhCY0lPUEpQVE1WRUpH?=
 =?utf-8?B?OEVxZHRFaHMwRElyblBkWXRkd1piblo0cml4S0lYNG1KWE41bm9aRk9oR1py?=
 =?utf-8?B?S2JRa2FsMFdGYVExKy8vYS9BRkZ0aTY3eVp6NFN0NjF5MUZKRWFQdTBhNDJY?=
 =?utf-8?B?R3RaU2t4WHpPeGU3RTZPd01vRG93QkIvWkRDRG52NnJHYmcyUU9Nd0pzZzBU?=
 =?utf-8?B?MDlDV1hxTFhKT05pRzloZHU1M29GUTJpRG9Bb2ZpTU55aysvaHJNZDVNUmZY?=
 =?utf-8?B?SXBiZ1Zlc09kZjVmc2lKM2JQYk01SzNGOVlvbnd0aTdXc2xoRkRTamNYZE5z?=
 =?utf-8?B?N2U1dEdmcjIveVJHQVNWY2FBZWJzcWpsN2dwTFZnbEFleHc0SkNjNHdjaU1z?=
 =?utf-8?B?b0FXT3hEMUk3WFd3UnZ0UTlhdXlOMlNsQmtzeTk4QlBVaXZnenMyTGl6SjI3?=
 =?utf-8?B?WUl6RVJWWmppc05sY3BzNlVJUlFvRThzZ3hOVWM4eG1PcVBuNEVJMUVJdDhw?=
 =?utf-8?B?WU5saDNPMVd4RWtCQkRvcWdtSDlsc1N1SlliMU1JcEV0bUNabXBPWVE3bUVE?=
 =?utf-8?B?TnNwUHFHeUR1UGhhT2tMdHR0T2MvK0V4SnBZUDFRejlTSm9aNFJRVW5WM0Vt?=
 =?utf-8?B?a2FzTVI5R2xRUHlMYi9uTEJCR1hGTEllbkwxSTBLSE9MN2VwU21XRWVXSEt2?=
 =?utf-8?B?WlE4cUNRZ2VoQ0t5UTcwd2FYODlLemY2QUJ2Zm8vNmMxQ0dFbzhOVmp0MUh1?=
 =?utf-8?B?cXdPZnh6akgzZkNpZ25JeEFYSmVjTXFZMXNhemZ4TmhJdDVUNnNFbE9PU1E1?=
 =?utf-8?B?ZnQyN2RueG5TTHNpVzhrWHQ3RXFOcFVaT0hnK0oxbmVjeTVsSFowd2gyZmYr?=
 =?utf-8?B?U2ZEZ1VSY0lML0dkdlR1QkRPZ0hWS29TSTVOemVFL0d6aGxmUjZGS3YwYmhK?=
 =?utf-8?B?bmFiaU9mTlVZL2NweVhiMmljUEdVd1VCOXZYNU1aSUFuWmFuSFF2UXJzRG1L?=
 =?utf-8?B?MVByU3YyNStjelphb3pLOU4xbVN2emdKZk1SN1BvZTFVRVdaMVUySFVTc2hT?=
 =?utf-8?B?V1dHNTh5bVAyMGNlRGc5UW80YVl1V3AveTB3T20rbHc0a0JsVWErYWdzcEM4?=
 =?utf-8?B?UE9NcDFBNHJMMHRSTzRFVEM3Z3JJQUUyTWVkRWFmeHdtQitFZ0pHVmFnNXRa?=
 =?utf-8?B?cDhic3dqcU5MT2x0elZreVcyRTJPaW90LzZFYWNSMWdEVzdTQVFmK3cyQzZj?=
 =?utf-8?B?cWhXWDJGS3hmdUxydmg3MVZ2T0szUFFjcXNJeDZqREtHTERpdlRjOG9EUUor?=
 =?utf-8?B?MGx4NWxmbFVwem1jMWtQcktpMmZDUkk3T3d5UFYwa1YyV0RyVWlSRjFnS0pS?=
 =?utf-8?B?NWRDQjJKWTMxNUpXVHp1RUs4ZmFvaU5iWER6WlIyY3YxVEZ3Wm9ucWxwaHF6?=
 =?utf-8?B?UVhJR1NzZXUvK3ljZnJMSkRJS21pbDNUWTB4enhieWJZMlVPREFkWThleFQw?=
 =?utf-8?B?eFV6cGJPWWpZR3dsSlArYmdHSWJzbGtMTjNna2tUQ3dHV2tXV0twdGpNL0Vn?=
 =?utf-8?B?N3BHOVNUbG1ySzUyTTBWdW0yTnZ0NkV3SXJQMUU4NC9XS1ZRTDNkNDFTSTkv?=
 =?utf-8?B?SDU5aU5zUlllZWJEbTFJRDcyL1JodllmVDd4c05NMUw5VStacnhOU2YwYlJq?=
 =?utf-8?B?cndhcGdOUUhTa0hYQkwzY3NrV29zMG9YNWlEb2JjU1k2M0ZEdTZxMUltNDNR?=
 =?utf-8?B?LzdYd0d4MU5Za2xRajVjOXVDa2RSenJacGVpUGVtRGhNcTJ0TldZN01Lei94?=
 =?utf-8?B?L0kwRmRkcDlhREhiYzlSeit6QVhHM2RDZzFvcVZ2eW90MTlQV0IxdDZ2WWFW?=
 =?utf-8?Q?Ymsxxxz25O7NCMnPyf7Lq+u0x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 901153ca-884e-4e1a-1659-08dc976559ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 11:27:53.6387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyqeNsL+Yno1KCsA60KkpXbiUB6agIntloKJa1ojfhk9ZDdJq3Az3C5uyBsqFBb38+dw3uQbu233IBeY2uiaGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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


On 6/28/2024 1:18 PM, Imre Deak wrote:
> On Fri, Jun 28, 2024 at 10:54:57AM +0200, Nirmoy Das wrote:
>> Remove unused xe var which probably came for resolving a merge
>> conflict, commit 2817ef9704e7 ("Merge remote-tracking branch
>> 'drm/drm-next' into drm-tip")
>>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index a5c9dfa1077c..694671497f6e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1785,7 +1785,6 @@ static int pf_get_threshold(struct xe_gt *gt, unsigned int vfid,
>>   			    enum xe_guc_klv_threshold_index index)
>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>> -	struct xe_device *xe = gt_to_xe(gt);
> I noticed the same issue after pushing a patch to drm-tip, afaiu the
> correct way to apply these kinds of fixups is
>
> $ cat patch | dim cat-to-fixup
> $ dim rebuild-tip
>
> as described in
> https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html
>
> I did this now for the above fixup.

Thanks Imre!


>
>>   
>>   	return config->thresholds[index];
>>   }
>> -- 
>> 2.42.0
>>
