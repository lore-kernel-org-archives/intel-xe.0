Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2F3E6C61E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 09:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B21910E991;
	Tue,  3 Dec 2024 09:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lo+r33pb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91DF10E991
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733216663; x=1764752663;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=oeqg+lkEDCf6aS7fjdq9KMx9X0qnAYznyVdFax001D0=;
 b=Lo+r33pbej2GAA6sa/53xvWG+Bv0YrWT8I74gnT+u+cBevkGTjroAP5I
 p0v7Aus9IxvHWslOJjTohX5EhulBmeRXBXlKIPaZtI0OxVzeepnaZSjWn
 PGMrw+bp5Sq2y7YqWA2fWrJtEmegzv5EQA1l2xl0ZU6b7kwpwbB8d8+Vd
 S9pQIRs8GZDk66wO9nRWVIc/tVkiU4zANBLAodp/x1OtEK5e/YenOCWAF
 jo16uT5YTRCQWxBHMGMb5JweISkstgWBCeU8HK3MRigPqIrS/+qzAqpC4
 PIfXXQ/Q4uxVgxc6cdBmzlvBrjYHMolApFd9tUl8bJRgQ7tVSH7JQ21j7 w==;
X-CSE-ConnectionGUID: H6lq/ohpSP+gsFbMAqxAGg==
X-CSE-MsgGUID: W/VVHhfuQCWjFXjC8azVUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33670708"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208,217";a="33670708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 01:04:22 -0800
X-CSE-ConnectionGUID: Sssd7yL0T3Wt60tKbUWcpQ==
X-CSE-MsgGUID: zm0YabQoTFGtqIAXfTgomw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208,217";a="93281626"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 01:04:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 01:04:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 01:04:21 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 01:04:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+PzhyMvBfKyN2J/m618WpUM1UA9xQ81DTz2TPY0mXgu0Nu+onv1MV3sdxUPL6DxL5GfcIli6K0r00RxBI+KlNclOw1Wb/yMFF2pNxGjYoUciwD4CidW/s2ZfXls2qRi9y7sDtDOjReA1zIO/hfN4Vba/fLqPKxKuaRyxaeKM0RkTjxSRGrRj2zuwdwro39Oyr0R5yafYI2nxGbZ8OQlfoJEQR20xTsxaHsW3opM/QciR4cjxWNkmhjeVZDMglahqmnjza7RlA2wFozohqxVfzlY4a32Hvh6ojG9KbF35KUrqnm37kwVZi02xweOwR4X/Zo3tNI20YalBZE0x8WZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cy3yr4RJFsiecuTNysZCcVU4y7HuwlnSWhRYjOELn6Q=;
 b=NYRcegLKzoJgsRNak7ZfoiEteYe337VgYlwqPHM2pvErBBrovCDAtrFJlL+dWTaKEYHkkxyICNIXnFs40syav8Nu1Zq86yEc0VqqO/EXf1RxyaFYVxiiMMp78a+1U11XdVK1yoZGQ47JLWVo2kgYrNJnVVdb+1gmlAiRvkL3PYr1T6QQuPVlNPpTLGzfK9S15Hd7AgHV8ZxsTPNNLIKoMqm7GEBxeDKr3z2uTV+n3dXllfcI/EbRz6WMDtWZEkIZ6BpGfAc6eLHfle4BI3B3388NmmsFvvveJMM2EaiXx2PTptPqYaxetEWf5DGQug5fvfhSpi+t436BdyT3y4gK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:04:18 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:04:18 +0000
Content-Type: multipart/alternative;
 boundary="------------1LXHIUINhHHdEr0oEMNSuWBM"
Message-ID: <42cd338d-2b71-4793-90c8-eafa2a4a96e8@intel.com>
Date: Tue, 3 Dec 2024 11:04:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe/irq: Separate MSI and MSI-X flows
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-3-ilia.levi@intel.com>
 <20241202185918.bdz2oz4y3u3voklg@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20241202185918.bdz2oz4y3u3voklg@intel.com>
X-ClientProxiedBy: TL2P290CA0022.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::6)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|IA1PR11MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: b87951f4-ed84-4a23-d448-08dd137977ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFI3WU9VMmpHQ3lOQzc4d3FndUdEZkV3ZVFxN3ZpMmtoNUhMMjkrbjNvaGkx?=
 =?utf-8?B?cTNoMG9EOG54elBkWEdDUVJaR1R5UWtmU0djMlNjMWQvdGc2YUZOczduUDhO?=
 =?utf-8?B?MldiUVAvMXpub2ROTndiNHlBZmpRNitKMEdWdTdWY2QrVGRTc2VNSkNQaHJo?=
 =?utf-8?B?ODFkaFBFMXdsZjZvWEVtNFFaUTRkOTBSQTJjUXBQblR5NHExVHo1ZDlFWVdK?=
 =?utf-8?B?TW4yL21sS2FJTW9kVVJZYXdMZ05UcjFsQ2JnOENOdnZuVVZhVUxDM0xjc25G?=
 =?utf-8?B?NklXck9va1ZsbFhjZlJyV2VhSDNhK04wOHNRcisxbGJhNmpIRkZTWStXelU3?=
 =?utf-8?B?aEJiL21WQVFaVnVPUmxnV3dnNkwxaE4wMHA2WUUyWmhObEE0RzBld25Wc1JW?=
 =?utf-8?B?RUpwTFV5cCtQdTBKKzR4TDdiQXhud2hWM1AxdHJBaDR0STNVbFVNc3FkRy83?=
 =?utf-8?B?Rk83SFBnNnlGWlBsN3FPNVplcFJBeU9JQ0FQcEpMQ3ZNZGZkVldVaEpQY0w2?=
 =?utf-8?B?ZEpSWTZTaW9uK0NoUUVDSjJQNFdRM1kybTZNbFNWQ1VBTjE2bDMwVTJHcDlk?=
 =?utf-8?B?YWNUaXZwTG5lRVgzNHV4NWgzUG9lSHlZQXpVbGxMRWc2ZWo2bGN4UGY5amQr?=
 =?utf-8?B?TW95V1g4R2tLNWF1ZDhiWWNwYlluWFhWRk4xT3lPUUdwMld6L0JxK3pYZGpk?=
 =?utf-8?B?SFl3YkUrU1hxSHYwUFo5NjZvL0pCeDBSdHZ2NFN1RjIxTm10a1N3Vi9xVEM4?=
 =?utf-8?B?UnFVRldiWGFVdXNVNExieG90R1NvcDZ3ZDRyNy81cENIN2svcEhuMDJyNENk?=
 =?utf-8?B?TUVqZ2l6c3pFV05qYzVQdHRzNTBOYVVJZks3VTdwQlhRSzVYdDg2MUtyOW04?=
 =?utf-8?B?UFRyaDRVdzFIRjRqR1hNZEUwV2oyZjk3WUdGSi9WTFptQ2dPd0NXMmlqWmpJ?=
 =?utf-8?B?UGE1czc4MVdCOHpsd0hXcG9pUG9La01oS0RjQStSb05LVE1YQ0JrYjBrdkVG?=
 =?utf-8?B?RStVQTNWYnV1NGMycmdoQW9GMTZUZlhCei9Sd2RNNFNWdm4yV2NzOCtRcHRj?=
 =?utf-8?B?SnNROE5WL2hTODJ6WUFTWENQT2dOMlhVZUZJRk5hQmtPWGQ0ZlRTZzR3U05M?=
 =?utf-8?B?V3JoSWs1bkQ2bkJiUG1DZCt0ZXE0Z2tLSWVjTWkxY2cvNGttSzc0eEU2V1di?=
 =?utf-8?B?K293VklRdC9IZFdwWSs3NnBFelZRS29uaVFkWWxhTjFLdzBkYmZLQmZxSGdt?=
 =?utf-8?B?SWIzTm9iSlcrYzRJTGg2RVlVZE5qdTV5RlYvN3FEelNWaEIwbVBtck1idlo1?=
 =?utf-8?B?aWhkb2FMdWN3WnRkQjVrZmMxL2hqemtDNUI4VWFHcnh3cTRtTUdIQUgvak9o?=
 =?utf-8?B?cWxzT2xwRzhKbUV6b3JXTzRRQkNNc2lYbEV1c2RhRmtmZ3ZlUXBPSXAyVGRN?=
 =?utf-8?B?czd6Vnc3UTE2djlFakUrbUk0Q2NvcTVrZVJQUEJST3ZSUkNQVmgwMVZybXJy?=
 =?utf-8?B?NUJ6ZFZ2Mld6VWpwUXFDZG40dk1acDVrajJtUUJPQS9pb3lPdkl0SHVFTmMv?=
 =?utf-8?B?OHNDNU9FbGJRUk5aZXRraExhK3haRXZ5NmpBZEl0WXF2MmR3bWJLcGZ1VXUv?=
 =?utf-8?B?enpnTE1YaGJPWC9KSUFGZTg5MUo4cmF5bE8wMXV2dkJ3Mk9IYjR0TElkRGJU?=
 =?utf-8?B?WGpkWkM4RXZFTEg5bTJQaDJ6cE1QaDVVTzRJRFFMMkloV2tCRU9xak9oc0JE?=
 =?utf-8?B?OWpvL0FzanJIVDRuS1VaWk56SjVKSmFyd0ZYSXBnSEphbERmQ1Z3eTRzQUxP?=
 =?utf-8?Q?F2i8QTaQxp6NbgFOV1w7/UUY/mxLMmefwWQX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZha0MvQkRjQUxtTUJLc2lDNFlzK2hVMTN0b1dEVnYzRW9YUmtqekw0RHRZ?=
 =?utf-8?B?cnhBeUcyYVdJUDcyWnczQlpIRUg2cGdoNnlkb08rZ3lzd01FSVRkZ3hPTWFJ?=
 =?utf-8?B?a1J1Sm5uUFMzN0FFUndLUjB5NC96b3p4UWFXUnphOGRwL2R1NUdtalhsNmYr?=
 =?utf-8?B?aDc4YkVLUUZjcElGanVPaHJvbDFDVXQzVnhzdXNsc2N2cmZUVjBzbEF2anIv?=
 =?utf-8?B?NnNvV3dseUhmbHpZOGhEdWVhZFIxSmU0aGo5S2s3TC93eXYrdVk0Z0lKWkRY?=
 =?utf-8?B?c3kvY1NLMkZHT3dmeG5HSElUcC9ZSUJWaXpvV1podVhOWDdQSHlMd2tEblZD?=
 =?utf-8?B?MTRUb1piQzFSbElncFE1UUthNkQ1RnhzWFY3b2tKcTMwcWE3bjMvRHJIUmwx?=
 =?utf-8?B?dUloOFEvZ0RNK0NEZ1Rpejh0a3BxdnREZkpvaVpTYW4vNlhmUUovMEU2bndD?=
 =?utf-8?B?d2g4VVVzcmNSUmdlM2k4dmp2VEZ2eDdsOHd1ZVM5UWJaTFRUTnZXUnNZTkgx?=
 =?utf-8?B?NDQyQk9PcWtFYlp1ZGlSeVRNWjZWUzErODNCWmoweVBLay9FVkk1WmhlVlNk?=
 =?utf-8?B?RUxvU3lkSXlpSjRIdHFSM2IzTVRPbzhOcmlzQXhmZ3diR0xhcVpBU0hkNmk3?=
 =?utf-8?B?WU43M2RGLy9JN21UMThGOWRvVTNvZkN4bVZXVFZnTmFYMUR3Z1ZNMUoySkpY?=
 =?utf-8?B?MTZPWE9PaTVMNktKSlR3Mk9xeDdsWi9DRXhzYU5TU0JUa3dYV1FHUkRnRTZP?=
 =?utf-8?B?c1Mra2RWYjBvUE9Za0I2UE0vWWxlSThRWXd3U1dBK1JFWkM4NXpNY0JoQlJp?=
 =?utf-8?B?TXc1TUkxVkx6VW5DaG8rajhSTkFwRThLaGdMZHl5dmUvNmlORSt6aTRWbXFD?=
 =?utf-8?B?SWZjYmNwTXlOcnIzTTlJbjNVT2hMZzY4aTV4MURNZEJpSmxHVFRMN2ZTUGlU?=
 =?utf-8?B?bDZac1NVSkZBU3Y5WjdxaUNvSUh5UlF3S0hYZkxNSW1nVU11VkV2Y1V1YUo3?=
 =?utf-8?B?MHFwUi9aYmNYcHFjVlY0S05nZEJNU0xSNWtObStOcjhKTmNnMTQyL2dRaWJH?=
 =?utf-8?B?TDIvcFNjV2xhM21JcnU2Z0tkSHlVbkViaTVhL2NGaklEb1JUTWRFVjRGTmpJ?=
 =?utf-8?B?TU9HSjdoN2E5dysyZHNNaXg2SnJHU3RRL1hGSWplcWhBNkVkTXdURUE4eW85?=
 =?utf-8?B?dmp1S3A1cC9EeFJwSDUzNkpBRGJSVkEyemNpT05abm5OVHZoMDFCODh5QWJ4?=
 =?utf-8?B?YVprUmdXL21RV20vdlVSa0xoaVZjazRZM3VNVHEzRFVvVFFqM0U3N3VoOTli?=
 =?utf-8?B?V050OXJ3TmVFOUNIMHhBdUQvQVNuUzhiVm5BWXBiS1cxei9nNzNNU1RuOU5a?=
 =?utf-8?B?Tm5kdkp4dnozWXVyemdxYitRLy9IMFpsVzNMdjdPeWIwcXZad25rTkR4TjdN?=
 =?utf-8?B?SWRxNVNWaE1ObTVJOFJWU0UrNG5UK3NMQjc3SEpsdWdOTXFBNEFJTld1M2o1?=
 =?utf-8?B?Ym9rZ09ITXhmOG9xVEZNelhxMitEK2ZKZk41Vk1QZnRYNzdEaHlaeGZMVXlP?=
 =?utf-8?B?azUzUVh5M3ZQdDdSL1cxWVRienlUbWx3b3B3b2RNYko0OGFqMFRsd2FOYjUr?=
 =?utf-8?B?ajhIUW41VXg4WWRsTm5mNzc5NXJITHllK056UXY0UTVQQmFPQ05oMHd4NVRQ?=
 =?utf-8?B?SUxlQ2xxWS9QZEptR2pvK0VUQUMrclREcTE4TERkRUxsZHZTaXVTeHVUQ3Ru?=
 =?utf-8?B?MTdwcEthYWJqZmljR0FId1Y0YldiSWMvVk9nc0FweUpWVjZwbitwRFM0ajRK?=
 =?utf-8?B?VTR5c3VKSW5xWkpUNS95dVBkTWJiU3ZDd3VRdWd6eEhqcURNMmtLV1FjUVpR?=
 =?utf-8?B?SkRrT1krWVJZSkZYNGpTcVRkU2YvUmkrUUw4L0hHeWwyN1U4bkc5T2ZtWktD?=
 =?utf-8?B?M3dVdzhNS01Sd3FaL2puSVJocVc1ekFMeU1YS3VPeDMyM0NUR1IyVmpuRTZH?=
 =?utf-8?B?aVdyM1J6by9WREFhVDc1OVY2Qlc0bkNmVktGc0Q5RWFRWVdqb2xMYkNqdmNx?=
 =?utf-8?B?SGlsTm5yMEN3amhKZ1lCU2pQcU13NEdzM042RHVkYVpSb2VuRXVBR1ZoZmE3?=
 =?utf-8?Q?g0ckjcAs0YJXmfhVOTFpzC4BM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b87951f4-ed84-4a23-d448-08dd137977ff
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:04:18.4240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAhFB2Usd5dIhjH03V9UeOIu6BdDzHOfZAnjplh4eI8jV+UcKcoGqcV0akTLCmwBb73m2IqmOpft2NC0Tr38cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

--------------1LXHIUINhHHdEr0oEMNSuWBM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 02/12/2024 20:59, Piotr Piórkowski wrote:
> Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:42 +0200]:
>> A new flow is added for devices that support MSI-X:
>> - MSI-X vector 0 is used for GuC-to-host interrupt
>> - MSI-X vector 1 (aka default MSI-X) is used for HW engines
>>
>> The default MSI-X will be passed to the HW engines in a subsequent
>> patch.
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>>  drivers/gpu/drm/xe/xe_device.h       |   3 +-
>>  drivers/gpu/drm/xe/xe_device_types.h |   6 +
>>  drivers/gpu/drm/xe/xe_irq.c          | 257 +++++++++++++++++++++++----
>>  drivers/gpu/drm/xe/xe_irq.h          |   3 +
>>  5 files changed, 237 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 930bb2750e2e..f1246fa8b5cc 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -325,7 +325,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  	xe->info.revid = pdev->revision;
>>  	xe->info.force_execlist = xe_modparam.force_execlist;
>>  
>> -	spin_lock_init(&xe->irq.lock);
>> +	err = xe_irq_init(xe);
>> +	if (err)
>> +		goto err;
>>  
>>  	init_waitqueue_head(&xe->ufence_wq);
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index f1fbfe916867..fc3c2af3fb7f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>>  
>>  static inline bool xe_device_has_msix(struct xe_device *xe)
>>  {
> I still think you should use the name xe_device_use_msix.
>
> We use xe_device_has_* in case, when the capability based on Platform
> version (for example xe_device_has_memirq) based on intel_device_info
> (for example xe_device_has_sriov or xe_device_has_flat_css).
>
> IMO in case you are basing it on a variable that you set yourself in init you should use
> a different name (for example with “uses” instead of “has”)
>
> My motivation is that for me xe_device_has-* is used when it is the capability of a given device
> and we base on the information that intel_device_info or infromation about the platform version
> provides us with.

As we discussed, it is akin to xe_device_has_flat_ccs - where xe->info.has_flat_ccs is set by probe_has_flat_ccs.
xe->irq.msix.nvec is set according to pci_msix_vec_count which reads MSI-X capability from the PCI.

>> -	/* TODO: change this when MSI-X support is fully integrated */
>> -	return false;
>> +	return xe->irq.msix.nvec > 0;
>>  }
>>  
>>  static inline bool xe_device_has_memirq(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 7ee114c17552..ed638067aa26 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -348,6 +348,12 @@ struct xe_device {
>>  
>>  		/** @irq.enabled: interrupts enabled on this device */
>>  		atomic_t enabled;
>> +
>> +		/** @irq.msix: irq info for platforms that support MSI-X */
>> +		struct {
>> +			/** @irq.msix.nvec: number of MSI-X interrupts */
>> +			u16 nvec;
>> +		} msix;
>>  	} irq;
>>  
>>  	/** @ttm: ttm device */
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 1c509e66694d..b8a0b9bbf24c 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -10,6 +10,7 @@
>>  #include <drm/drm_managed.h>
>>  
>>  #include "display/xe_display.h"
>> +#include "regs/xe_guc_regs.h"
> I don't see why you are adding this header

GUC_INTR_GUC2HOST is defined there. It was not needed before as it was called by gt_other_irq_handler (the type of the interrupt was read from the registers).
For MSI-X those registers are no longer set - and the only type of interrupt we expect on MSI-X vector 0 is guc-to-host.

>
> Thanks,
> Piotr
>>  #include "regs/xe_irq_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_drv.h"
>> @@ -29,6 +30,11 @@
>>  #define IIR(offset)				XE_REG(offset + 0x8)
>>  #define IER(offset)				XE_REG(offset + 0xc)
>>  
>> +static int xe_irq_msix_init(struct xe_device *xe);
>> +static void xe_irq_msix_free(struct xe_device *xe);
>> +static int xe_irq_msix_request_irqs(struct xe_device *xe);
>> +static void xe_irq_msix_synchronize_irq(struct xe_device *xe);
>> +
>>  static void assert_iir_is_zero(struct xe_mmio *mmio, struct xe_reg reg)
>>  {
>>  	u32 val = xe_mmio_read32(mmio, reg);
>> @@ -572,6 +578,11 @@ static void xe_irq_reset(struct xe_device *xe)
>>  	if (IS_SRIOV_VF(xe))
>>  		return vf_irq_reset(xe);
>>  
>> +	if (xe_device_uses_memirq(xe)) {
>> +		for_each_tile(tile, xe, id)
>> +			xe_memirq_reset(&tile->memirq);
>> +	}
>> +
>>  	for_each_tile(tile, xe, id) {
>>  		if (GRAPHICS_VERx100(xe) >= 1210)
>>  			dg1_irq_reset(tile);
>> @@ -614,6 +625,14 @@ static void xe_irq_postinstall(struct xe_device *xe)
>>  	if (IS_SRIOV_VF(xe))
>>  		return vf_irq_postinstall(xe);
>>  
>> +	if (xe_device_uses_memirq(xe)) {
>> +		struct xe_tile *tile;
>> +		unsigned int id;
>> +
>> +		for_each_tile(tile, xe, id)
>> +			xe_memirq_postinstall(&tile->memirq);
>> +	}
>> +
>>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>>  
>>  	/*
>> @@ -656,60 +675,83 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
>>  		return xelp_irq_handler;
>>  }
>>  
>> -static void irq_uninstall(void *arg)
>> +static int xe_irq_msi_request_irqs(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	irq_handler_t irq_handler;
>> +	int irq, err;
>> +
>> +	irq_handler = xe_irq_handler(xe);
>> +	if (!irq_handler) {
>> +		drm_err(&xe->drm, "No supported interrupt handler");
>> +		return -EINVAL;
>> +	}
>> +
>> +	irq = pci_irq_vector(pdev, 0);
>> +	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>> +	if (err < 0) {
>> +		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_irq_msi_free(struct xe_device *xe)
>>  {
>> -	struct xe_device *xe = arg;
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  	int irq;
>>  
>> +	irq = pci_irq_vector(pdev, 0);
>> +	free_irq(irq, xe);
>> +}
>> +
>> +static void irq_uninstall(void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +
>>  	if (!atomic_xchg(&xe->irq.enabled, 0))
>>  		return;
>>  
>>  	xe_irq_reset(xe);
>>  
>> -	irq = pci_irq_vector(pdev, 0);
>> -	free_irq(irq, xe);
>> +	if (xe_device_has_msix(xe))
>> +		xe_irq_msix_free(xe);
>> +	else
>> +		xe_irq_msi_free(xe);
>> +}
>> +
>> +int xe_irq_init(struct xe_device *xe)
>> +{
>> +	spin_lock_init(&xe->irq.lock);
>> +
>> +	return xe_irq_msix_init(xe);
>>  }
>>  
>>  int xe_irq_install(struct xe_device *xe)
>>  {
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -	unsigned int irq_flags = PCI_IRQ_MSIX;
>> -	irq_handler_t irq_handler;
>> -	int err, irq, nvec;
>> -
>> -	irq_handler = xe_irq_handler(xe);
>> -	if (!irq_handler) {
>> -		drm_err(&xe->drm, "No supported interrupt handler");
>> -		return -EINVAL;
>> -	}
>> +	unsigned int irq_flags = PCI_IRQ_MSI;
>> +	int nvec = 1;
>> +	int err;
>>  
>>  	xe_irq_reset(xe);
>>  
>> -	nvec = pci_msix_vec_count(pdev);
>> -	if (nvec <= 0) {
>> -		if (nvec == -EINVAL) {
>> -			/* MSIX capability is not supported in the device, using MSI */
>> -			irq_flags = PCI_IRQ_MSI;
>> -			nvec = 1;
>> -		} else {
>> -			drm_err(&xe->drm, "MSIX: Failed getting count\n");
>> -			return nvec;
>> -		}
>> +	if (xe_device_has_msix(xe)) {
>> +		nvec = xe->irq.msix.nvec;
>> +		irq_flags = PCI_IRQ_MSIX;
>>  	}
>>  
>>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>>  	if (err < 0) {
>> -		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
>> +		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
>>  		return err;
>>  	}
>>  
>> -	irq = pci_irq_vector(pdev, 0);
>> -	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>> -	if (err < 0) {
>> -		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
>> +	err = xe_device_has_msix(xe) ? xe_irq_msix_request_irqs(xe) :
>> +					xe_irq_msi_request_irqs(xe);
>> +	if (err)
>>  		return err;
>> -	}
>>  
>>  	atomic_set(&xe->irq.enabled, 1);
>>  
>> @@ -722,18 +764,28 @@ int xe_irq_install(struct xe_device *xe)
>>  	return 0;
>>  
>>  free_irq_handler:
>> -	free_irq(irq, xe);
>> +	if (xe_device_has_msix(xe))
>> +		xe_irq_msix_free(xe);
>> +	else
>> +		xe_irq_msi_free(xe);
>>  
>>  	return err;
>>  }
>>  
>> -void xe_irq_suspend(struct xe_device *xe)
>> +static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
>>  {
>> -	int irq = to_pci_dev(xe->drm.dev)->irq;
>> +	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
>> +}
>>  
>> +void xe_irq_suspend(struct xe_device *xe)
>> +{
>>  	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
>>  
>> -	synchronize_irq(irq); /* flush irqs */
>> +	/* flush irqs */
>> +	if (xe_device_has_msix(xe))
>> +		xe_irq_msix_synchronize_irq(xe);
>> +	else
>> +		xe_irq_msi_synchronize_irq(xe);
>>  	xe_irq_reset(xe); /* turn irqs off */
>>  }
>>  
>> @@ -754,3 +806,142 @@ void xe_irq_resume(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_irq_enable_hwe(gt);
>>  }
>> +
>> +/* MSI-X related definitions and functions below. */
>> +
>> +enum xe_irq_msix_static {
>> +	GUC2HOST_MSIX = 0,
>> +	DEFAULT_MSIX = XE_IRQ_DEFAULT_MSIX,
>> +	/* Must be last */
>> +	NUM_OF_STATIC_MSIX,
>> +};
>> +
>> +static int xe_irq_msix_init(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int nvec = pci_msix_vec_count(pdev);
>> +
>> +	if (nvec == -EINVAL)
>> +		return 0;  /* MSI */
>> +
>> +	if (nvec < 0) {
>> +		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
>> +		return nvec;
>> +	}
>> +
>> +	xe->irq.msix.nvec = nvec;
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t guc2host_irq_handler(int irq, void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +	struct xe_tile *tile;
>> +	u8 id;
>> +
>> +	if (!atomic_read(&xe->irq.enabled))
>> +		return IRQ_NONE;
>> +
>> +	for_each_tile(tile, xe, id)
>> +		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
>> +				   GUC_INTR_GUC2HOST);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>> +{
>> +	unsigned int tile_id, gt_id;
>> +	struct xe_device *xe = arg;
>> +	struct xe_memirq *memirq;
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +	struct xe_tile *tile;
>> +	struct xe_gt *gt;
>> +
>> +	if (!atomic_read(&xe->irq.enabled))
>> +		return IRQ_NONE;
>> +
>> +	for_each_tile(tile, xe, tile_id) {
>> +		memirq = &tile->memirq;
>> +		if (!memirq->bo)
>> +			continue;
>> +
>> +		for_each_gt(gt, xe, gt_id) {
>> +			if (gt->tile != tile)
>> +				continue;
>> +
>> +			for_each_hw_engine(hwe, gt, id)
>> +				xe_memirq_hwe_handler(memirq, hwe);
>> +		}
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
>> +				   const char *name, u16 msix)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int ret, irq;
>> +
>> +	irq = pci_irq_vector(pdev, msix);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int irq;
>> +
>> +	irq = pci_irq_vector(pdev, msix);
>> +	if (irq < 0) {
>> +		drm_err(&xe->drm, "MSI-X %u can't be released, there is no matching IRQ\n", msix);
>> +		return;
>> +	}
>> +
>> +	free_irq(irq, xe);
>> +}
>> +
>> +static int xe_irq_msix_request_irqs(struct xe_device *xe)
>> +{
>> +	int err;
>> +
>> +	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
>> +				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
>> +		return err;
>> +	}
>> +
>> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
>> +				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
>> +		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_irq_msix_free(struct xe_device *xe)
>> +{
>> +	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
>> +	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
>> +}
>> +
>> +static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
>> +	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>> index 067514e13675..24ff16111b96 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.h
>> +++ b/drivers/gpu/drm/xe/xe_irq.h
>> @@ -6,10 +6,13 @@
>>  #ifndef _XE_IRQ_H_
>>  #define _XE_IRQ_H_
>>  
>> +#define XE_IRQ_DEFAULT_MSIX 1
>> +
>>  struct xe_device;
>>  struct xe_tile;
>>  struct xe_gt;
>>  
>> +int xe_irq_init(struct xe_device *xe);
>>  int xe_irq_install(struct xe_device *xe);
>>  void xe_irq_suspend(struct xe_device *xe);
>>  void xe_irq_resume(struct xe_device *xe);
>> -- 
>> 2.43.2
>>

--------------1LXHIUINhHHdEr0oEMNSuWBM
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 02/12/2024 20:59, Piotr Piórkowski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241202185918.bdz2oz4y3u3voklg@intel.com">
      <pre wrap="" class="moz-quote-pre">Ilia Levi <a class="moz-txt-link-rfc2396E" href="mailto:ilia.levi@intel.com">&lt;ilia.levi@intel.com&gt;</a> wrote on czw [2024-lis-28 14:53:42 +0200]:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">A new flow is added for devices that support MSI-X:
- MSI-X vector 0 is used for GuC-to-host interrupt
- MSI-X vector 1 (aka default MSI-X) is used for HW engines

The default MSI-X will be passed to the HW engines in a subsequent
patch.

Signed-off-by: Ilia Levi <a class="moz-txt-link-rfc2396E" href="mailto:ilia.levi@intel.com">&lt;ilia.levi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device.h       |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_irq.c          | 257 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_irq.h          |   3 +
 5 files changed, 237 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 930bb2750e2e..f1246fa8b5cc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -325,7 +325,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe-&gt;info.revid = pdev-&gt;revision;
 	xe-&gt;info.force_execlist = xe_modparam.force_execlist;
 
-	spin_lock_init(&amp;xe-&gt;irq.lock);
+	err = xe_irq_init(xe);
+	if (err)
+		goto err;
 
 	init_waitqueue_head(&amp;xe-&gt;ufence_wq);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f1fbfe916867..fc3c2af3fb7f 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
 
 static inline bool xe_device_has_msix(struct xe_device *xe)
 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I still think you should use the name xe_device_use_msix.

We use xe_device_has_* in case, when the capability based on Platform
version (for example xe_device_has_memirq) based on intel_device_info
(for example xe_device_has_sriov or xe_device_has_flat_css).

IMO in case you are basing it on a variable that you set yourself in init you should use
a different name (for example with “uses” instead of “has”)

My motivation is that for me xe_device_has-* is used when it is the capability of a given device
and we base on the information that intel_device_info or infromation about the platform version
provides us with.</pre>
    </blockquote>
    <p>As we discussed, it is akin to xe_device_has_flat_ccs - where
      xe-&gt;info.has_flat_ccs is set by probe_has_flat_ccs.<br>
      xe-&gt;irq.msix.nvec is set according to pci_msix_vec_count which
      reads MSI-X capability from the PCI.<span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:20241202185918.bdz2oz4y3u3voklg@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-	/* TODO: change this when MSI-X support is fully integrated */
-	return false;
+	return xe-&gt;irq.msix.nvec &gt; 0;
 }
 
 static inline bool xe_device_has_memirq(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7ee114c17552..ed638067aa26 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -348,6 +348,12 @@ struct xe_device {
 
 		/** @irq.enabled: interrupts enabled on this device */
 		atomic_t enabled;
+
+		/** @irq.msix: irq info for platforms that support MSI-X */
+		struct {
+			/** @irq.msix.nvec: number of MSI-X interrupts */
+			u16 nvec;
+		} msix;
 	} irq;
 
 	/** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 1c509e66694d..b8a0b9bbf24c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -10,6 +10,7 @@
 #include &lt;drm/drm_managed.h&gt;
 
 #include &quot;display/xe_display.h&quot;
+#include &quot;regs/xe_guc_regs.h&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't see why you are adding this header
</pre>
    </blockquote>
    <p>GUC_INTR_GUC2HOST is defined there. It was not needed before as
      it was called by gt_other_irq_handler (the type of the interrupt
      was read from the registers).<br>
      For MSI-X those registers are no longer set - and the only type of
      interrupt we expect on MSI-X vector 0 is guc-to-host.<br>
    </p>
    <blockquote type="cite" cite="mid:20241202185918.bdz2oz4y3u3voklg@intel.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Piotr
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> #include &quot;regs/xe_irq_regs.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_drv.h&quot;
@@ -29,6 +30,11 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
+static int xe_irq_msix_init(struct xe_device *xe);
+static void xe_irq_msix_free(struct xe_device *xe);
+static int xe_irq_msix_request_irqs(struct xe_device *xe);
+static void xe_irq_msix_synchronize_irq(struct xe_device *xe);
+
 static void assert_iir_is_zero(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(mmio, reg);
@@ -572,6 +578,11 @@ static void xe_irq_reset(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_reset(xe);
 
+	if (xe_device_uses_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_reset(&amp;tile-&gt;memirq);
+	}
+
 	for_each_tile(tile, xe, id) {
 		if (GRAPHICS_VERx100(xe) &gt;= 1210)
 			dg1_irq_reset(tile);
@@ -614,6 +625,14 @@ static void xe_irq_postinstall(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_postinstall(xe);
 
+	if (xe_device_uses_memirq(xe)) {
+		struct xe_tile *tile;
+		unsigned int id;
+
+		for_each_tile(tile, xe, id)
+			xe_memirq_postinstall(&amp;tile-&gt;memirq);
+	}
+
 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
 
 	/*
@@ -656,60 +675,83 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
 		return xelp_irq_handler;
 }
 
-static void irq_uninstall(void *arg)
+static int xe_irq_msi_request_irqs(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	irq_handler_t irq_handler;
+	int irq, err;
+
+	irq_handler = xe_irq_handler(xe);
+	if (!irq_handler) {
+		drm_err(&amp;xe-&gt;drm, &quot;No supported interrupt handler&quot;);
+		return -EINVAL;
+	}
+
+	irq = pci_irq_vector(pdev, 0);
+	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
+	if (err &lt; 0) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI IRQ %d\n&quot;, err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void xe_irq_msi_free(struct xe_device *xe)
 {
-	struct xe_device *xe = arg;
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
 	int irq;
 
+	irq = pci_irq_vector(pdev, 0);
+	free_irq(irq, xe);
+}
+
+static void irq_uninstall(void *arg)
+{
+	struct xe_device *xe = arg;
+
 	if (!atomic_xchg(&amp;xe-&gt;irq.enabled, 0))
 		return;
 
 	xe_irq_reset(xe);
 
-	irq = pci_irq_vector(pdev, 0);
-	free_irq(irq, xe);
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_free(xe);
+	else
+		xe_irq_msi_free(xe);
+}
+
+int xe_irq_init(struct xe_device *xe)
+{
+	spin_lock_init(&amp;xe-&gt;irq.lock);
+
+	return xe_irq_msix_init(xe);
 }
 
 int xe_irq_install(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
-	unsigned int irq_flags = PCI_IRQ_MSIX;
-	irq_handler_t irq_handler;
-	int err, irq, nvec;
-
-	irq_handler = xe_irq_handler(xe);
-	if (!irq_handler) {
-		drm_err(&amp;xe-&gt;drm, &quot;No supported interrupt handler&quot;);
-		return -EINVAL;
-	}
+	unsigned int irq_flags = PCI_IRQ_MSI;
+	int nvec = 1;
+	int err;
 
 	xe_irq_reset(xe);
 
-	nvec = pci_msix_vec_count(pdev);
-	if (nvec &lt;= 0) {
-		if (nvec == -EINVAL) {
-			/* MSIX capability is not supported in the device, using MSI */
-			irq_flags = PCI_IRQ_MSI;
-			nvec = 1;
-		} else {
-			drm_err(&amp;xe-&gt;drm, &quot;MSIX: Failed getting count\n&quot;);
-			return nvec;
-		}
+	if (xe_device_has_msix(xe)) {
+		nvec = xe-&gt;irq.msix.nvec;
+		irq_flags = PCI_IRQ_MSIX;
 	}
 
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err &lt; 0) {
-		drm_err(&amp;xe-&gt;drm, &quot;MSI/MSIX: Failed to enable support %d\n&quot;, err);
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to allocate IRQ vectors: %d\n&quot;, err);
 		return err;
 	}
 
-	irq = pci_irq_vector(pdev, 0);
-	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
-	if (err &lt; 0) {
-		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI/MSIX IRQ %d\n&quot;, err);
+	err = xe_device_has_msix(xe) ? xe_irq_msix_request_irqs(xe) :
+					xe_irq_msi_request_irqs(xe);
+	if (err)
 		return err;
-	}
 
 	atomic_set(&amp;xe-&gt;irq.enabled, 1);
 
@@ -722,18 +764,28 @@ int xe_irq_install(struct xe_device *xe)
 	return 0;
 
 free_irq_handler:
-	free_irq(irq, xe);
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_free(xe);
+	else
+		xe_irq_msi_free(xe);
 
 	return err;
 }
 
-void xe_irq_suspend(struct xe_device *xe)
+static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
 {
-	int irq = to_pci_dev(xe-&gt;drm.dev)-&gt;irq;
+	synchronize_irq(to_pci_dev(xe-&gt;drm.dev)-&gt;irq);
+}
 
+void xe_irq_suspend(struct xe_device *xe)
+{
 	atomic_set(&amp;xe-&gt;irq.enabled, 0); /* no new irqs */
 
-	synchronize_irq(irq); /* flush irqs */
+	/* flush irqs */
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_synchronize_irq(xe);
+	else
+		xe_irq_msi_synchronize_irq(xe);
 	xe_irq_reset(xe); /* turn irqs off */
 }
 
@@ -754,3 +806,142 @@ void xe_irq_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_irq_enable_hwe(gt);
 }
+
+/* MSI-X related definitions and functions below. */
+
+enum xe_irq_msix_static {
+	GUC2HOST_MSIX = 0,
+	DEFAULT_MSIX = XE_IRQ_DEFAULT_MSIX,
+	/* Must be last */
+	NUM_OF_STATIC_MSIX,
+};
+
+static int xe_irq_msix_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	int nvec = pci_msix_vec_count(pdev);
+
+	if (nvec == -EINVAL)
+		return 0;  /* MSI */
+
+	if (nvec &lt; 0) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed getting MSI-X vectors count: %d\n&quot;, nvec);
+		return nvec;
+	}
+
+	xe-&gt;irq.msix.nvec = nvec;
+	return 0;
+}
+
+static irqreturn_t guc2host_irq_handler(int irq, void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	if (!atomic_read(&amp;xe-&gt;irq.enabled))
+		return IRQ_NONE;
+
+	for_each_tile(tile, xe, id)
+		xe_guc_irq_handler(&amp;tile-&gt;primary_gt-&gt;uc.guc,
+				   GUC_INTR_GUC2HOST);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
+{
+	unsigned int tile_id, gt_id;
+	struct xe_device *xe = arg;
+	struct xe_memirq *memirq;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_tile *tile;
+	struct xe_gt *gt;
+
+	if (!atomic_read(&amp;xe-&gt;irq.enabled))
+		return IRQ_NONE;
+
+	for_each_tile(tile, xe, tile_id) {
+		memirq = &amp;tile-&gt;memirq;
+		if (!memirq-&gt;bo)
+			continue;
+
+		for_each_gt(gt, xe, gt_id) {
+			if (gt-&gt;tile != tile)
+				continue;
+
+			for_each_hw_engine(hwe, gt, id)
+				xe_memirq_hwe_handler(memirq, hwe);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
+				   const char *name, u16 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	int ret, irq;
+
+	irq = pci_irq_vector(pdev, msix);
+	if (irq &lt; 0)
+		return irq;
+
+	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
+	if (ret &lt; 0)
+		return ret;
+
+	return 0;
+}
+
+static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	int irq;
+
+	irq = pci_irq_vector(pdev, msix);
+	if (irq &lt; 0) {
+		drm_err(&amp;xe-&gt;drm, &quot;MSI-X %u can't be released, there is no matching IRQ\n&quot;, msix);
+		return;
+	}
+
+	free_irq(irq, xe);
+}
+
+static int xe_irq_msix_request_irqs(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
+				      DRIVER_NAME &quot;-guc2host&quot;, GUC2HOST_MSIX);
+	if (err) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI-X IRQ %d: %d\n&quot;, GUC2HOST_MSIX, err);
+		return err;
+	}
+
+	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
+				      DRIVER_NAME &quot;-default-msix&quot;, DEFAULT_MSIX);
+	if (err) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI-X IRQ %d: %d\n&quot;, DEFAULT_MSIX, err);
+		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+		return err;
+	}
+
+	return 0;
+}
+
+static void xe_irq_msix_free(struct xe_device *xe)
+{
+	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
+}
+
+static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+
+	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
+	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
+}
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 067514e13675..24ff16111b96 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -6,10 +6,13 @@
 #ifndef _XE_IRQ_H_
 #define _XE_IRQ_H_
 
+#define XE_IRQ_DEFAULT_MSIX 1
+
 struct xe_device;
 struct xe_tile;
 struct xe_gt;
 
+int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
-- 
2.43.2

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1LXHIUINhHHdEr0oEMNSuWBM--
