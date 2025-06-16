Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6160C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 04:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061010E277;
	Mon, 16 Jun 2025 04:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahFGabtN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640DC10E277
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 04:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750047458; x=1781583458;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nfvJBVO52KfL4sOJP7WZd//F2OL/Go1Z161cjp1MOzE=;
 b=ahFGabtN2Hb+lOqBJMEHOdMqFkwoNn3KY9NGyWFSSnXHrTclVtA4Xm6X
 va4BqpPwElxzNMCx0+lJRY5fjFwJyer9MZEjk9x30ZaQZ8RbsprGZ0M+1
 yV/gzxnLXC57hLOqWWifukdYoRVwy4GucyY6Yyh2Gk7fStNUR1bG5cdg3
 kziy2rBb4d+Id4t9vM3Ez3eJvIR24qsBX/He+6t9im6jQRXceY6kxFoC6
 KZxPG52kJCTOoJSipEf+wjuFoJrU2gHBNyGUGUcAMVws9kGZ4hpbJnhMD
 BN2Nv2genx8X9t5uBJSomQ8vs4gWJ+HprFBhTiybT0oEQfKxd2HOvFRgx g==;
X-CSE-ConnectionGUID: r6dgyWvgRQmW5Bb93dpZug==
X-CSE-MsgGUID: 3qxTm1kDRAqG2zg4n3cP9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69755886"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="69755886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 21:17:36 -0700
X-CSE-ConnectionGUID: uF4LeWu8RJCKXUoh0dOfbw==
X-CSE-MsgGUID: u7n/Qt8VTyqgPMXe9hiWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148729325"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 21:17:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 21:17:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 21:17:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 21:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAL9bMuVAroIEgYSXiok3R51z9dbcuWpn0nWv5ObiJXw4ftsWwq7qrlpUYMEdW3bcAWRxxdK6+fhnXZSiJdCvqaAVmYlzHc/BnKHlAIJsNOLmWWATpjESEFE2wBakdX7i9eSS3B04rIApD4tqnfuzVeYlT7k3arFOkkSRj+CayrnhETmNRXAXJYOwXFTLWCoD9Kmx1mic6t7FwiG/nyF0Az/C6kQ//OaCVv84oHQZZM6tU8U+EZDpnvaQeeCynYN3EisEosNANDMxEZs3N4NNjphrrza/itWaW9XvR5816a0dMYfm2aWl2S4YaYTM+cR/lXB+O4bRKtq0O0Z343NVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pppOyxCJczSeGzShjJTrd5y0vm7sVRmZC/x1bXz9QUk=;
 b=EBLH6i9cBkTngmdKy5sWup56aGuPcVn2Tbn8xr01viDompevf5SleMItfuH/5OopQyOdQvzosMJfT2iAXR/u2+3voZxUPifSNc7LfLQE+Mk6TqaBEJOZf1gXIpwH2LVlCxjPxSxDpo9OhdP1AXXh8FLjqqH1nAGx8N9801v2wSffIqxBrS1QMLH/IKWLJ/BQQBy46FFwOsjw19vOcuuMNu+dNB6A64jz9kkbN6/aPqe0iuc5E8CfDoZsds3PuLm8raALl9g/PUCVXwHDae+WgpNI1uFEIFVZ1o1CfVQZNOv3U3x/hGsO3VwEyKj7U6mF3ffhOrh3WROOZ7cAW4InDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA2PR11MB4828.namprd11.prod.outlook.com
 (2603:10b6:806:110::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 04:17:33 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 04:17:32 +0000
Message-ID: <4a14cb98-4aa1-45ee-a552-f631f735440c@intel.com>
Date: Mon, 16 Jun 2025 09:47:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not kill VM in PT code on -ENODATA
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250613231808.752616-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250613231808.752616-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA2PR11MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5254bb-8323-417e-ca4f-08ddac8cb739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NCtwcDdBbURBeE0xWlpmUG9ZNW1kZG9hYmFyVk5zQy9mWWxySThseEpaNFBX?=
 =?utf-8?B?dFVlL3Q4amtuR0VmNkpBU3VUczhhUytKYWpyODhnaFMyS2RObmJRaXBZTjlG?=
 =?utf-8?B?d0M5UVd4SDZCN1RpcGhBUDZFeWhvOGhSS1I2eHJZN3VWc0Vad29TMisxLy84?=
 =?utf-8?B?M1c5MjF5MFpGNWZGMUwyd0lEU2JJdjZ3c0FtUlJ0QVNNWGZhWkZZdjMvVDU2?=
 =?utf-8?B?bmNpWllUL2FtUis3T2VCRGNGaUVCVVRTaXBacWNUTjlXeFJxaUdQQjdwQm8z?=
 =?utf-8?B?NkVOT2FxaU9Ma0hNam5tdmNFV280Y0hxZ3drU2NDZ3RrVllFcm5RbUlxTHpw?=
 =?utf-8?B?YXAxK3BWTEJtWGo1Qk1OUXN6NFg0VXRZWkthS1lxZnB4MkU3RzJ0c2N5OEpk?=
 =?utf-8?B?bFZzN1liVERsdlJLdnBPNlpHZU1zQ3Q1LzcxZFR3cGVQenNMWUZ6NTZpWGVU?=
 =?utf-8?B?SWp3ZS9WWVAvU0pRcmtOTVc3RFVseEJMVjhYV0d0Z2tabENCdGRhZExiL1BT?=
 =?utf-8?B?cGprWUhvd3d6elR0Z2pZN1ordkM5OGtuSlNMS2llNVk2QzgvUFlRcUJaNjhr?=
 =?utf-8?B?K3RaeU9SWjNLMmliWU9McEZuNEJnajBCcHM5UWRYa2xTQ2dNWS9NSmYveXpp?=
 =?utf-8?B?WkVOakZnT3RhL3ZIeVJkdFBublNGbm95U1Zwc0R2c2dicjhkTkVrNG8zakpL?=
 =?utf-8?B?Z3huTVVQanJIOEVwZkltSGNia25mMkNHekpVOFdOTkFsaVNFQWp3Y0MzMkI3?=
 =?utf-8?B?ZVRoeVZTZXhkRFYzWEt6UFMrdHdxUUE2QTVWbU5teDZRRE4xdy96aVNiOFJp?=
 =?utf-8?B?L0ZHS2FZUXJvbU5FWVJ4NjdSRm4zVTltUzlPNXBPTit0RU1veHU2SE11T3NB?=
 =?utf-8?B?MHcrOEQydVZJb2Z0QmRaN2JSS3ZLQWM2Q1pnWUt2OVVxY0NyU1dZMlorOFBJ?=
 =?utf-8?B?eHlZV3NEWEZiZGZnRHpLM3BsQ1cyRityVXlFMktRMWUrYlM5TmdoZkJKZGdl?=
 =?utf-8?B?YVN2V3ZGd2N2cHBzaTlDNmc2eXNiaXNHZnArN0VsajdZRTI2Z29MWTAvTEJR?=
 =?utf-8?B?NHlSbEFsSXVCcFpDVWpjUFQyZXFSYU01NTB2QittRWNyM0U1QUpMUnhNR0o1?=
 =?utf-8?B?ZHk2N3BEQU43enlrcEZ1S01tTHRxWjdsU0svalNJNmZUVWlnazNlQjdMZ2ln?=
 =?utf-8?B?aTROT1FYb2xwUEluR1E4dElKR2Q4S2tQL1RBTEFDams4bW5oU05oZkFnbUp5?=
 =?utf-8?B?SmQ3NFczdVJGa1VYRWNtTkQybnErTU1nUFFtdkVpQ2I2V2pTYUVZUE9TdDZ0?=
 =?utf-8?B?TjFRVGhLeHFCdXczUVVORFFvTDlsSk9tUmdVR2RzMFlSNHBBYThoRm5zY1Nq?=
 =?utf-8?B?MGVUbnRpT2RocG94TUc4L0JQam91QlpJSXV0RmJSdzRuemt0blBkTCt4QTFu?=
 =?utf-8?B?V0F2aXhTRU9Gb0dFVm9qVmNpcGsxQmZEL1JJYUl5K2dOTDBiWjFIVDltYU1j?=
 =?utf-8?B?WklTTmFiV2M4NEEwaDB1azkvKzh3Y0lVVFpHdzBIYUtORHZSRTBUTjZZT2dG?=
 =?utf-8?B?eVlTNmhIZEdJdjg0QzRuTFg2c2xHM0lsRmIvbnNaV01leXVISmpmNzRzbm11?=
 =?utf-8?B?bHdPbzRwQW1zQWtTd3paVUxUSm96ck0xU1hGRmRXRGVZbURBbFBPZTc1TzBO?=
 =?utf-8?B?eGlPNFd4MHhUQllmaWQ5S2ZLMytBSTB3Tk4rRU9pMk53ZkhrTmt5cWFkZkY4?=
 =?utf-8?B?V1hmS3FRZHpuRVQvaFNZK1ZqTkxBT21CQTJwODJpOHNGcDN1emM5VEdjcEp0?=
 =?utf-8?B?bzd2YmtSRGRxcGtUQktFQ3lzU0Q0UE5leWhDS3V3Sm9tdnhOOW1xS0ptb0tk?=
 =?utf-8?B?aW90YnlNZ04wdCtuWDJhaUVVMnhBWnN1SUJ4Sk5IeVBGRGthblljVVdPd2ZJ?=
 =?utf-8?Q?T+KEX7Q2EGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anJvRWl2V3JCejR5aVFCUjNjTHFwdy9PRFlKbnREVktjMmMrSjRpRm5JWngv?=
 =?utf-8?B?Ujd3WDRrSy9yaDYwQUtucDNnbGpYa29GcUMyRkdBVzdyNmZmTFh5RTcrbGJo?=
 =?utf-8?B?Y2pFZysyb0VKZ25rNENYUVl0bmN6UTBRSUxkbVo4WGw5TSsvWFBwazN5LzRC?=
 =?utf-8?B?Yk9uQ2MrMlFqRHJDbWZJaHA4cFBTU0NleW1OemNsUEZta0VRUzU5c0hkLzdp?=
 =?utf-8?B?VzVlVktuS2hUSWJjZmJhQm1jQ1RYZlY4MVduQyt3VnpmSk5jVm9lMXhxZFZh?=
 =?utf-8?B?cmZmSGZmeHVGVlBaNFM3VjRyR1VET0hMU2pHTHVGckptQjNCSFU0cmNEb2NS?=
 =?utf-8?B?cTNzZHQzeWhSN3BycFRXWVlHUS9DYStWZTJtVDFxM29LNExYU1hnOThaa2o3?=
 =?utf-8?B?VnN6THQ2Tjg3UUFvUE40c0c5bXhkTTcwa2luUWpEQjZuREh1R0VmdlBGRDcr?=
 =?utf-8?B?RlRIMkhDTHpMVVA3QW5FemhzYUd6T1QrV1hDVjBJOXRwVUFGVzZpU3cyTlZU?=
 =?utf-8?B?R1k3Q0ZhalZpa2VXVUZHOUJtUTEvMm85S2k4Sm56alBoN2J0U3lBRFpLVTMr?=
 =?utf-8?B?ckxIMUF3NWloRzFqQk5oZnk3QW45RXArM2FQZGlGZFFuVlN3VThjc3VCWjg5?=
 =?utf-8?B?dGpzenJtQncyMjN3TVZnTTQ3bTlnWTl4NlNwNXlTRW5QQlR5SFBmT0NjQ0kw?=
 =?utf-8?B?VXRJY1o0Tk9DMklwRkFaNnIwbGZKLzNEUjdZVXQ4MmNEUU1CVEdoRVk5bVk1?=
 =?utf-8?B?Q3dDMFd5SXhOd3FWL1pvTHZ2ZEdOMmRSUlJIRWd0dUY2VE44eHArTXZ3N1JC?=
 =?utf-8?B?SkRSMzQ5WU5sNVpCbFZyT2pOLzdOb2pLVlVWQ1F0dzFRVVMxdWNvZjBCV0JK?=
 =?utf-8?B?UnBheGxwTTBTMHFlSVp6VDR6U1F0dFlMVXdPeWVMTm1rUVNqc2JFY0EvRitF?=
 =?utf-8?B?YUg2aG1tVVpwY0V4bmIyR1g5MUpMWlphZmtYOWVCaFpJSWZKUVhiSi9ZMDlW?=
 =?utf-8?B?OTBqWFpxcitmSVRMUk1zRkV0VjJKQXEzTjhjelVtV1RvNGw2bVhPUXpZVGlD?=
 =?utf-8?B?eCtMVVEyVXhCNS9DUzgwZVJYMFBVL3lGcGFQRVZDNFEwbE83VHZDTXA0M0ZV?=
 =?utf-8?B?QVVTbDdrNzlxWlE2K0t2OXdTTVdyRXI0aGRCaGhrd1lxL1c0WXpLY1FFQmly?=
 =?utf-8?B?Y1dLeWR2Y3pyRkhycy9hUitCTWp3cHRReUtmNGkySEQvbkIvMlhLNC9mMEN4?=
 =?utf-8?B?cm42TENXZFE2VDduYTVza2xEVHIxTVNHc3h1cWFIekFNdG1NOGYyU1lxWjdi?=
 =?utf-8?B?Tmh5c1lLSWgrdWluNUNQR3V1QU9qUEp0RmRzTzBGSFhYWGlnTmZoRjJnd0Nz?=
 =?utf-8?B?U3l6eTcrN0ZWNU9MQXgrNFBFYU9LWGxYN1paN2ZQaVROaEIwWUc4R0MxL2J0?=
 =?utf-8?B?bjl0ZzNKSGRPdlU5R2x0andtTzZaa0UzazdDdzlmL3dLS0Job1czbzdhYldK?=
 =?utf-8?B?TWRQZkxGRWpZTXBpK0JxTkcxeGpia2xYQ1plMERpMjEzNDRyYVVLRG53UTVP?=
 =?utf-8?B?a0YrRG92N1NzbkNvTWJXbG1pRXhYM3VqVmE4eW5rc2FrQlA5YTdCQzVHUWZj?=
 =?utf-8?B?ZkRtU3FRQnpidExBVEpnNWRQZzFoSmNhWFNITWtjbE5aK25MWlFVekxVOTFT?=
 =?utf-8?B?L0R1NlNvK3psU0YyVzllZzJPWkdtQTV4SGR2SVhVOG80QzdZbWNaR25GWjll?=
 =?utf-8?B?Yk04b2RHR2tvSzRsRTZoMHhkVkpYbnNZLzZIdWRMMzFpL1Y1emxxRGdRUFBH?=
 =?utf-8?B?QXFpajkzRHl1ZktVUytMWFhjWjhHZFdqVmR4YkJDTUFTSjBNTnBzSlNUTnhN?=
 =?utf-8?B?dURpR1F2N2JyYzc2eGZQSm9xZFFJb1YxSzN5elBDY1pGOUZ4UFlZUnh6aWUv?=
 =?utf-8?B?KzRiS1hQYVc2RFhFdnVJeW55aHRpMkV0aFpMUjNsd1cvL2FBVTZYUFJQOE5G?=
 =?utf-8?B?M0JyRXhObzQ5cTVvMWx1eUdHaFBYbWY5cGUzUFJSRklZMFdqc1dqQk9wMFBx?=
 =?utf-8?B?RHZwOGhVTFhnaFFqaEg5WHE5RnNhREl3QTYwMjh2cFlLRjVYVWdRWHdpVldt?=
 =?utf-8?B?bFl3RkYxRGVYMkxabFB3aFQzYWpQdnRZUDZaME0zRFZ4eVF1U0lCTmZBQmFx?=
 =?utf-8?Q?G9rKor54TK0H9EC6ZMNr0Q0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5254bb-8323-417e-ca4f-08ddac8cb739
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:17:32.9329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHbg/44VEGpNMfRXSQkcBg1uE3Kc5vrX3TNTB6b3AonV1w3G27kV1wiGCTwqP8DGgfmE7eexNCtB6mPLxJOoX5U7CI26Ai7T6twgc6mI0ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
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



On 14-06-2025 04:48, Matthew Brost wrote:
> No need kill on -ENODATA as is this non-fatal error can occur when MMU
> notifiers race with prefetches.
> 
> Fixes: 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM ranges")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f39d5cc9f411..971e55fd0061 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2524,7 +2524,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	kfree(mfence);
>   	kfree(ifence);
>   kill_vm_tile1:
> -	if (err != -EAGAIN && tile->id)
> +	if (err != -EAGAIN && err != -ENODATA && tile->id)

Thats true xe_pt_svm_pre_commit can indeed return -ENODATA in prefetch. 
Thanks for the fix.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>> 
	xe_vm_kill(vops->vm, false);
>   
>   	return ERR_PTR(err);

