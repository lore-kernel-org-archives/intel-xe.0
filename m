Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D390C369DC
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 04:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CCD10E099;
	Wed,  7 May 2025 04:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQOO6tOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEAA10E099
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 04:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746593439; x=1778129439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JcjhhieTT3k/ccB37nQEtQscJZndkGxNOXrsuTEG7Q0=;
 b=RQOO6tOzaUR1oHLIM9ruCJL372fPl27SVNnnd5CTtudbtHdR5k8SbjLE
 1vuaRbaRlCsjqJqFcE8J7mMEB5mMBlJLLQYcmJio7XhHRGy0tKkrTWQzq
 SKusg9JAlJEEcgh1AcqGxMtZpSvhbtnh8WiaZtbwvKsCTQTN+OqyoN91e
 DucP0tqQS3hYYdfLW0rkKFDHhEcpTgMekHn1FF9dmxvn8g2jegYyFZs2s
 lavoYybj2UV6HNgvzjcMzRAgKpJsEHBMeLet0xXRT0sLQdsiU1XRWqLw5
 2CxRBUtEQFyXEG2NtlgEl1hwfj2laI9cdZ50IhOedGg4FJdTKoujxMrCY A==;
X-CSE-ConnectionGUID: OLPPKNG5STWfj9NiDy2WrQ==
X-CSE-MsgGUID: jHdX5x2PRRCl+xjG+a6X2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52115635"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="52115635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 21:50:38 -0700
X-CSE-ConnectionGUID: pXlgziUiQGa/K6+RKcqWsg==
X-CSE-MsgGUID: sxPBE0VvQzWvvioXUjS2Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="136234198"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 21:50:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 21:50:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 21:50:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 21:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RENmAD48y9enu12+YDTE2/y+K997HEK4JyNpTZqmDBjBkK4w5P6LhoLKpd3Hckh+bOxyXml9Luk5cPfeiNqUFJrIqXFg6wUYwPIFLTrKskCJipNiqulgJmyYYYW+Ew8+ezlneXwyCZApgc3QO+1p5u2Zz0zEEaplhyaXG1/9OTW6PGnsJmkXO+QB0KZbGh7y94JcC9K5az/E6WrNJP/+BUMHuDFq+2/NWZRnPiyjCEtPdounfeozG4PjERwzry8bIggCso2dmzv+LVlY0gqsgEG0pJ0oi956EmQT5iroPMCrd1/ZEUUylgbCwblJ+FEIeenSVgbrt8ggMxHuc+fJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SuHhJCs8AWGtF8Q3IpVAvmDa47E1FthVUhWsc1XifQ=;
 b=Ru+whwtl0ylAQ17/wNmfR8rALdSp01fp0PZ+b6gBZOHJd65lKFZBT5CuHSGE6wbVgNnWQzRDT0rIzaABwomw/avAlX5pDSvNYDsEHScHmRPorNFaMk5u2jmbye+HeyRTzvAiZdEAVudhBIcPCwTPZh5vh/k2+CI2gjT9okeT8bQx+q4AazAhKnIqODashSczNqemMZ0Kd4iOdnoVRjDxEwLxYHm/V81P2aPT3p8WzHAaL/GfLOLPc1ppgHRdVZdEy+MxqCr2vnbne2v2rVjUqJ98Fx67Cte2xbnVRm8ehSwhK/9hYpyRQVVTiu2GxEhLL2KfKAJ674zrGG6Rpa6sWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 04:50:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8699.033; Wed, 7 May 2025
 04:50:29 +0000
Message-ID: <cc1d7661-22db-447b-b90f-689e939b5727@intel.com>
Date: Wed, 7 May 2025 10:20:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_device_probe()
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250506054835.3395220-1-raag.jadav@intel.com>
 <20250506054835.3395220-2-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250506054835.3395220-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fa1929-1f1b-4a9b-fe2b-08dd8d22b0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnovVmJFcG9LV3FKU2s5SDhzRlFuaFIzUVlnQk5FMDBQYXhld1YzVERMSEVl?=
 =?utf-8?B?Si82T0c5VFMwQnh6ODlmMjc4MnZFRXBXVXQ4S3pIRHc1WnJFNkdEWHJVVVdy?=
 =?utf-8?B?d1o1eis1MU9CWkU4WjBDZ0FuYlhiOForR0tIdzZiNUNJMjM1QUVZTWJ0UjJr?=
 =?utf-8?B?Sm10dVdsalFxT1FWVFN1TmMvek1xbUpvRC9MZ1c5cEIydXpaMWxtUUVTODNH?=
 =?utf-8?B?aDBIQWdEQ0NPVHhyOVRxdnVUU3duOEJqemd2ZUlsZ2IrbnArNlNhVHJ2VWsv?=
 =?utf-8?B?ekZWRUw3dWRFSjlKelFQU3ZOU2QzQ0pFZ1IzY0U4NjFwVzcwN3lJN0J2WkJY?=
 =?utf-8?B?bFRVUlo4U1BqU0hyZU1vaStGdVNnTnAxTG5CM1JkbWQ5VkdJeEhTNmp2NDF3?=
 =?utf-8?B?NWlydVJmTnh4Y082dE5aTkwxaFd5TDlWcUhuaFl5TlQrNmpYY0xaSFR0R3B4?=
 =?utf-8?B?SU13UHl6cVUza0M2UElEeWRJeXZIcjQzeUNtTERWTlFXV0NhQ3dsaWtNTGJD?=
 =?utf-8?B?Q095U2UvV0dqOGJncHJMZ1dpM0FhdlJPcUJKK2hiVWd1eGNVa0VNK2hNY0JK?=
 =?utf-8?B?bzF1MUxDOTRuNzBJRWNEaTJjUERzQ0tGczVCOUJBZXhKMUJTckZ6SXpwK2hY?=
 =?utf-8?B?T0tYdmtBUHBkbGMrRGxrSWxhT3JYN2R4eW5SNk5hak1Hb2l5Rmh4aDRjNElx?=
 =?utf-8?B?WFN5ajdmWXhmaTArME9TanYzdWdSOUFGNXZ1VnQ4L1U4NGg3ZXNlWVJrbm1p?=
 =?utf-8?B?MWdQMWxuL2lFK29NK0EwMWQzOW1ZZU9KSXptVm1JdVdyQmUveVN5Z0p0WTFa?=
 =?utf-8?B?V05XZ2liVEtKc0laN0RkRjBrbkxqMTMyeVozYythMlI4bGNwWnhteHU0QlYz?=
 =?utf-8?B?SzdnWE9vZXM5WEZjcE9XYmM4NTlOMnFsR0Y4UlBBVEVNZndGTFZSejVBVU90?=
 =?utf-8?B?bWNLYlNZSURkSVA5MXRnSmlKdkhQcDF0ajBoaHVhTU1jTWdHOFFLRmppOVYx?=
 =?utf-8?B?UUN0bCtaa0Vkd3RhcTlmTWlyOTQ5a0YzN0J2bmRlRjI2Z3QvcGxMcERtU0Nu?=
 =?utf-8?B?N01YSzhxT1Z5S0FVZ1FDbXdDOUpZWFZGa0poMGIrS2VpSVh6SUtUblMwZ01w?=
 =?utf-8?B?akRaWms4YTQ3d2V1SHVxa2p6QVRBaVBUK09TaTJZSTUrdmZhdmVVVHJ1L2ZX?=
 =?utf-8?B?aE0rYm1LY2xpY3BTTGIxRmI1UVhDUmhycGwyanRhVGR2TC9YMmhXZmFnRzQ3?=
 =?utf-8?B?eGV0MGdYbWQxWG14dm5KSmcyUnYvelRoUnZSQ2JrMVUxZTRUc2pqRFhJWVpY?=
 =?utf-8?B?UHVCUDJDT1V2MjB1QUc1QzFiUlV4di9qN0pJbEJldXRCNGV0TVNrTll5elo2?=
 =?utf-8?B?Z2hrY2J4Q3FNcXo5Sm42SGRNaTVCVmRPUlJ0ZWtWZ3orVXdrWU9hQlhuSVc0?=
 =?utf-8?B?anQrQktRY1h5d2VnTVZuaDJCcFgySEF5TWRNVlFLWUZuQ0Nsbk4zcGpkUVdT?=
 =?utf-8?B?TmRhYitGUng5cDZ5VGxkT1lBWk5obk1zekF0a2JEcDY3RjBTS1RPaW9wSXBZ?=
 =?utf-8?B?dDNTL0ZkeEVRVExmUit0YjQraUFhWTkzUlduTjVidEJUVTM2eGFMSXM1ZUNV?=
 =?utf-8?B?Vzk2Ynk0bldzSEorM3RpTW83Z1VXNkhaVWU0MUI3bXBRMWNGRDAyVVJmZEVV?=
 =?utf-8?B?RDR4eHRrS1V0aVBvTXNvN1h2aUtNcW5kQ1FLaENOb2IwbTlGcVdBeUo3SmUw?=
 =?utf-8?B?MjYwV3pMUEpaK0N0V1N5TS8rYmRtVWRSM3pYYUJnSExTc1ZhTDB2bWNqYjhy?=
 =?utf-8?B?Q1hLeU5FZjJjU2ZZQWM5eHI1U054L3Vxejl0ZnV5S0ZFWTY4MVl0aDl2Nmdu?=
 =?utf-8?B?cDRXVUtnR0VCa3NKZDAyUXI2MzdLaGdtUWVwakZmOXg3VXR5V0pvaHF0TGll?=
 =?utf-8?Q?21XElEinl18=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGpXRmpnWjQ2RmVoL0htQ3M0VmsvVmIyVTl4anhsNGZWR0d6ZmtoZUxMTEMy?=
 =?utf-8?B?RzZnbm5KbDhxK3k2dlkxZzVXaGxiQWJRanFKRFNVNFVOZWZEdUVEYjhVS09K?=
 =?utf-8?B?eExPdlFzRXZGT25pcTBGYUU3VTkwUFd2akduT0lGdEZqV3Vsd2FMdktVcHc2?=
 =?utf-8?B?R2w0SG5YMkpXVWw5UUR3Z0dOR3lTUGFSRHJLdVR6bVhoRzJvUVRhYllnTC9z?=
 =?utf-8?B?VjhJVVlFeGNvM1FvajRwZGd2aTdWamFxN0hXZWZFTWQxa0pKanRJNXFWTHFS?=
 =?utf-8?B?dEp2SHZ6K3FvSFRxdjhnSjRQY0xoNnBsWHdBSDU3SmZKeG9laGtXWDBscllr?=
 =?utf-8?B?MlRBUWk0aUZ2Y3JaTFU0aWF0VG1obmN3Z3VDd0YzdkdOTitXRHhNT3paSHhy?=
 =?utf-8?B?OGpIREZaOUQrNEtLR2lqY1hpV1M0ZXZTcFBhdTEyTUcwMWNrdXlWTVhtNzl3?=
 =?utf-8?B?QW93R3BRek5ndEtQeFo3aXJPSFFZY0pBN1pTRzVHUml3SW9WRFBXSDFQMXd5?=
 =?utf-8?B?QXhzVTduSms3TlIrR3hHekt1YzVGU0JldUpsSmRNNFV4NmNHbVQwS1JnelhO?=
 =?utf-8?B?OTU2VE4rWUxBRzQyS1c0ejAwaER3MEU2OVJqbzIyMmNEcmptOXdrV2NTcUFP?=
 =?utf-8?B?eEZLOUVMUlZJTkZQWklHUjkxOFRpYXZUZVRWRXZidnpFekZvTXBwSExlTFd0?=
 =?utf-8?B?bE5JWHpVV1J4WmxTa3hEUGltWGM3T1RLeVZXU3J0bGtoY3Z3clFHMjBaNkdo?=
 =?utf-8?B?SWFYeTM0dEpueC9IazVpRVA2MktJamZiVDVDVzRQMm91ajFXck1mSXNKT2gz?=
 =?utf-8?B?ejVUUlBXWTU0WDBlZWxRbml1dk1lcXFIMzlUd25hZ1J1OUpMUzF4MHJyMWdE?=
 =?utf-8?B?Umh3UnY2R3h1Q0pDQi9mTzc4TCtrNGFvOU5lRE9KaUw2WHcxZHZHdXRkdEor?=
 =?utf-8?B?U0pkeXpSdmdHa3Nnc2FNMmVaUjhWR3RsMHMzS2FDQmZNbXZDZzU5UmNHQ0Va?=
 =?utf-8?B?NmRrQVNzZHhGekg5S2VkTEhPZzlBaDA4OGRMZkJCNldOWjRLTXRaNDhuT0RX?=
 =?utf-8?B?a2g2RVQxRkFTc213cC9sTGFlZ0FxTlo5MCtzSDV2V1k5b3U1cGlrQVFRcmlp?=
 =?utf-8?B?Q2EvK3JjU0pzVWt5K0VhNEhEdW5aQWJqNHJ6cmRsLytPNG9iMXpLT09yUUJG?=
 =?utf-8?B?WnZBaGZFb1Z2M01xcElVaFZjOEFUWEd3OUdyVGt1SUFJMWRnamUxTGdHWmVM?=
 =?utf-8?B?Mlk5dm92d1Y2Y3kvaS9vTWJQRWlnc3J2Zk5vekhJYU1EK3psQk9uTzFXT3c0?=
 =?utf-8?B?aEhYOTFsSUdXRW8wbjhKd3kyNkZHUW1KbHhtZ0Q2WXRaVzlxdmVJNGo5RlBP?=
 =?utf-8?B?UHNWTUVraDR3Q2ZVT0cvYkhJdTJOUlRvd0t0T1VqbE9DRGJGbWVNMnA2a3Z4?=
 =?utf-8?B?RGd1ekhSKzZxY1lEajVGaXhiWVJIcEl2V2lGMk5Fak85b25CU3ZQaDE4bmta?=
 =?utf-8?B?d3V2emt4SzlHMFllN0ZZZFZIOUd6cjFRaEZ4b0o1VWZJZlB3ZytFWmxEWUpu?=
 =?utf-8?B?VGFKR0ZLMVRVenBLOHpsejBBS1hkang3dVBPNU1WaTBzVzNtNUxOWFV0cS80?=
 =?utf-8?B?QTMyWFRxOVcwUURjSmVCWncweDBaZjUyQW9aN0syY0tjN1BMZ3ZIV2dZVGhi?=
 =?utf-8?B?YTJKdDBkcGt1U2QvdkFiYTg5aGhmOFNrbFZhNUFqWmlLZ0N3REhzY3Y2ZE8v?=
 =?utf-8?B?UHpIUi9VNGNQZTBZTmhRd004WWV2UkRzdG9wRUkwZXdhelIyYXRpNHNqZkJH?=
 =?utf-8?B?VFRHR2tDaEo3QlFhc1FtQ1RFdlN6NkV0ajRPSlp4Q0xXS0FRRkh3Mi8vUXRt?=
 =?utf-8?B?YVBOMU04K2xEWnRTZ0ludVRyallWT2wrS3U1RmFqSGErZlJnUzVTcTdQem95?=
 =?utf-8?B?cGFsSkFaSGpnRUY0dW5IendVbFdmZGM4RlBtclNMTE50M1cvSVFsMWsvK0ta?=
 =?utf-8?B?eWhKMEhZUzJOUHV3cFlnSzVkKzBSQ0tqeW5qczdLaGNSanBWOXFGMXJWY3Az?=
 =?utf-8?B?Z3NhaFdhZ0pWT0IwdnZBck4zZ2dSSVNCT0t2UU4vVUlKUDVhbm1WZWNZSGpM?=
 =?utf-8?Q?6zcTCk3htpeL4Gdr+SQtn8ZuG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fa1929-1f1b-4a9b-fe2b-08dd8d22b0f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 04:50:29.7925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+pkLjRlkH4oay4HUpEyk7hTf348N8PINI/M3nRhVht3Add/4oHWahx8q3SwsUYGl3jf7EfUqUhOPYaFxRzclQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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



On 5/6/2025 11:18 AM, Raag Jadav wrote:
> Since xe_device_sysfs_init() exposes device specific attributes, a better
> place for it is xe_device_probe().

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |  5 +++++
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
>   drivers/gpu/drm/xe/xe_pm.c           |  8 +-------
>   3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6c9d3009aa03..79b7b0ecfbae 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -26,6 +26,7 @@
>   #include "xe_bo_evict.h"
>   #include "xe_debugfs.h"
>   #include "xe_devcoredump.h"
> +#include "xe_device_sysfs.h"
>   #include "xe_dma_buf.h"
>   #include "xe_drm_client.h"
>   #include "xe_drv.h"
> @@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> +	err = xe_device_sysfs_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>   	xe_debugfs_register(xe);
>   
>   	err = xe_hwmon_register(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 7efbd4c52791..d4c73acea1cf 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
> -	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (xe->d3cold.capable)
> +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>   }
>   
>   int xe_device_sysfs_init(struct xe_device *xe)
> @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   	struct device *dev = xe->drm.dev;
>   	int ret;
>   
> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> -	if (ret)
> -		return ret;
> +	if (xe->d3cold.capable) {
> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 38514cef817e..693866def183 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -16,7 +16,6 @@
>   #include "xe_bo.h"
>   #include "xe_bo_evict.h"
>   #include "xe_device.h"
> -#include "xe_device_sysfs.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_guc.h"
> @@ -273,6 +272,7 @@ int xe_pm_init_early(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>   	return 0;
>   }
>   ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
> @@ -344,13 +344,7 @@ int xe_pm_init(struct xe_device *xe)
>   	if (!xe_device_uc_enabled(xe))
>   		return 0;
>   
> -	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> -
>   	if (xe->d3cold.capable) {
> -		err = xe_device_sysfs_init(xe);
> -		if (err)
> -			goto err_unregister;
> -
>   		vram_threshold = vram_threshold_value(xe);
>   		err = xe_pm_set_vram_threshold(xe, vram_threshold);
>   		if (err)
Lo
