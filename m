Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD7AC3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 05:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B0D10E1C7;
	Mon,  7 Apr 2025 05:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fE3CrAXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74210E1C3
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 05:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744003943; x=1775539943;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pcCQQ8IKGmBvAi5NVp6l3uZcHRATTzi8GGXffVebYBo=;
 b=fE3CrAXyLny4FZlqZTPmpX8HdM5D1T7GKDvqv2bqI3qfN75umeWN9MQX
 o+XMuxoY70B9huQ7PKs2t6yZEi+4ATjECoirwssXhy9Q7e3vLPGjhkcLr
 /i3uCjUSZGzlhw3vk5tifVqK1yXDkeeGE3jM5Fy1oya5Q0ZuV4P13MuTt
 cRQjhdZSwwX8MxWlt1S4KafLunjXnJzPF2ZNLxxIow1HMCvh9DMZTY1uQ
 kJlLG7AumnBy/hErJ6WFsyb0IRM0Si8xi7ssitXdthKNisBCM2/F+lafo
 qo8uNM5Hdhgw7V45RU1KIeiTztGqtfY+LuR5EVUf+y0VHc/xBQjgoQlMX A==;
X-CSE-ConnectionGUID: PLs2qi6hRJ6dKmy5N9i5qg==
X-CSE-MsgGUID: ssdwAWO1QR6tUsBeBnKlew==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="48085055"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="48085055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:32:21 -0700
X-CSE-ConnectionGUID: Y6M1/jDhTDScUf0HF6QzGA==
X-CSE-MsgGUID: gSeAalj0RX++GjnJjeZd9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128709732"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:31:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 22:31:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 22:31:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 22:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ8BxYIB7mphsbP5G+V1hYR4lbJP8GZVocd07fvzpzFF/FVqL5jIYsBBCG57HfR3lvn4s2+ZvbuV8uvGkvE1KaiRhFlinm0iee2F+disU6CxKyNiShDfsEI+rbUOHLP5UJekcB+gcISTn2PSjA/sTYS68w7Gx55ytk7biBwt65siHTFR2XFaQer1J2HMckMSdy9ioQj5uFanDttMVdvHmaCsPBKaNV3RhRDRdRYDnU1quIeA6UkZehp5GeIvDq/clsHqpcnt0Sej+UlUF9o0QULlVlfd6RsJe+kfZWhzEOkFgMwHzesmhUGKfP4XR6m41cXyosg+Q4N+BrxvLvDAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+wB9Dc9Nk4S6VZLWWBT3NuhQTIiaHznZopOfqQigJg=;
 b=go9zGXBQ1uF0Rdrnl6venPU3zwQXAkYCRVPyKAvSo6n0Ey4rSXxcPt8UNgABCkL39ciJ+yovurBbmLRbRnzjX4lhcA3thlROJPHHtzUJPRqnwK9hvVlt//4Lle7Sr06dDQOFfCzwlAr2z2rIDqd98j91guxYDLvrvugetwaFHqg+uVLDUTyFbz+fiD0OuCka8DpAEwKx6xS/lLL0Ix1GMOU7tN4hAc1dWUDIIMV9kiRPdkO1qOJJMVEZ4BVqZCULj9kRK62OL/KuU+d1joUzqcZPw/llrXHq+FQgJPSAiOo3w2dvB969DAbp5nPtj6CsC/f6QaFqdqvVG2NpZHlOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 05:31:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 05:31:49 +0000
Message-ID: <ce310833-cac5-41d5-b2cd-346d78e70afb@intel.com>
Date: Mon, 7 Apr 2025 11:01:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250403165328.2438690-1-oak.zeng@intel.com>
 <20250403165328.2438690-4-oak.zeng@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250403165328.2438690-4-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 1245b733-8b7a-45ae-5e54-08dd75957e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHl0cHJmeVhVWktUMGh3bUVkWFNRVUpRK2RrUHdMMU9MY05hcG8xVG4raG4w?=
 =?utf-8?B?WkNzczdLL0pKdTNzUCtUdWJQQzk5NkhRKzd4T3ordVJ1b2dGZFRNZVMxZGcx?=
 =?utf-8?B?aE9iTEVBMGRIL2w3SjJRMFhoTHpOelJIS3IrNjFNUkd6WDdhMFNzY280bDJU?=
 =?utf-8?B?OGR4am91VDNDMHg4dEgya3BjbUtRTDFvNCtnMWNnUDh5MEE3SjY2ME50MFlP?=
 =?utf-8?B?ZHp6K0MyTG9ZZ2djc2Rjd0lpK016VEc2QWtvYlZGeTVjdzhKdnpXaDU2Z1lH?=
 =?utf-8?B?MDYzaWNUUGtrN3VjUk0wM3Y2MTNwc0lGdnFJQzB0K0I3d1Nac01Wb21jTExw?=
 =?utf-8?B?SmZMOGl4T2JWczQ5RFhzc1dsSDBVR29hOXZhN3hFeml2aUZsMHF0Z1RDTFJQ?=
 =?utf-8?B?M3RJQmhUZHhvZ3JGNjBSc1RLOEtOcUpYQmVTNkc3NGx1bEs3ZmtOR1dPWmI3?=
 =?utf-8?B?NlFRU3E0R1Z2Q0tGNjViSVp4WkViandpVmJyL2tXOGJHWUJkSmFyMlJxU1R1?=
 =?utf-8?B?OWFtY3NUVjFCc2dZTjdMTGJyaER0OXhHenh2aGVXMmRtVmFQYzV1YzM1SUx1?=
 =?utf-8?B?MjdVeldxcEQ0NFV6eDl5ODVYRFFTUi82N0N0dEIrODY5VnkyQklPMTFWdDNi?=
 =?utf-8?B?U1R5bjlZNW9VQ3NoTGg5S0JWZzhzTTZTbGNhWXlmTXdJV3VHU0dlRVV1TG5S?=
 =?utf-8?B?N1RMUEoxVTczT3dJMC9GekhDNXZYSzhmRFoxb2t1RUJRTlRRcjFFRUVFVEJt?=
 =?utf-8?B?bFhobFhwekQrUGQvZHJqN2ExZjdjZTdWbGxic1ZuM01UN0E4WG91UUVPeFJa?=
 =?utf-8?B?VDdPdVpLQUhEb0JxRUZPNXlHTFVBY21sT05tRmpaSWN2THBaNW1oZVJkN2Y4?=
 =?utf-8?B?UmxyYXVGQ2RsYkV1V2kxTWF5dERkY2dxWDdJOU1NNXg4bGdUSDZBcXMxSlFm?=
 =?utf-8?B?UTgraTUrekgvdEJLTlIzODRxcmUzYm9PcUVQQ242eVlQQnpTRlVKQ1RseG1E?=
 =?utf-8?B?aVgvMzJlRkVOOUJtTklpS28vS1V2VUk2ZVM0dWFrYWwwNFFoY2FuVmlsUXdi?=
 =?utf-8?B?VndIZ055S0dSYTRQczBUUUZiQk5CblF3YnJYQVQ5Qm9pNDd5TUVYVkxxNHNF?=
 =?utf-8?B?RWlNNkNLZ0V4dzJXVmdnczhVc0FJeXI3QTQ2TExGZ05OUXFqbHBBTHFVQUVM?=
 =?utf-8?B?UE9xMXpyZ3lOdGYyL1Vhc0dBb1NDSXNkTVZiRVFOUTJLS0l5c25oS0JYM3No?=
 =?utf-8?B?dThueVhqU0tmUDMydk5QWHFJMDhINnNWUm1KaDF6ZVdKcTQxSWh3RzJoV3M2?=
 =?utf-8?B?amorVko0NUZmTjRhcllJRXpYaGc2ZWRJUnVMYndTVVNHMVZ6ZFltZGN6aDMr?=
 =?utf-8?B?b1llVGJaOEZTaiswVElRSEE2T01ud3E4MTZrdURETlY5M3huSm9EbXVPayth?=
 =?utf-8?B?S1M5M2NmNmFNQW5FeVIySmc3WVFhRHd6blhWOVoyV3E2Qm9mOUhyVnFPUzJK?=
 =?utf-8?B?WVUzUE1oU2xwSVFsVzE0UUdYWGIyZjJ1bnk3alBKWGNwRnppSXl3aFBVeUY0?=
 =?utf-8?B?K2l0MTVZZnlVU1pLLzNBOHM2Nm9kUGZYSFExcDNPa3RhYkVZaHRDaXpPQ3hX?=
 =?utf-8?B?clBDYzNwSmkydEpLWC9NdWd5R3A5Mkx0aHBRUUNiK0F4dTdhMks2QVZQWEJi?=
 =?utf-8?B?Y0VSTmY0YXI1WDVQaTdtKzJIVTZMNjVHY2FMdWs5SDhOVmJEWllRQVZlalpJ?=
 =?utf-8?B?SDgrRytaNnFBN2NscE13UWZaWFUrL0hITm0wKzdPcnZ3ejM5MmkrM0N3THRR?=
 =?utf-8?B?N2I0Q0xlUTltbVNYdTVxT2dLWm9jNllzNWxwWWtVbDlmaGF4RWZka1E2ZDBX?=
 =?utf-8?Q?B4JoiOdCF/p+k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3N4OFBEUjAvUVdxdEkxNGVCWGxLVjhiRnpsTCtUejFLMlFmMEExbmpML2ZC?=
 =?utf-8?B?WVFIaEE1dGEvbGd1c3JMSzZoKzBJR0ZrYlFRN3UyVWpqcFQwY2VOQVFMNTNw?=
 =?utf-8?B?VFhFTm04d0hEOC81TzlKeW5PMmdKYWQ5TUxvTjVCR0RPNnJad3ZJNVNXbWpo?=
 =?utf-8?B?eVJKU1c5N3FJOU5Cc3VFRjYyU0N4bEJHclVnZGZyL0xWQ3V1K1JxMFg0bG1m?=
 =?utf-8?B?ekZIYk5EUDEzdGdJbnRMdk13OGdMS0dyZEdWZitlY29UZFBQaFV0OG5USXZ3?=
 =?utf-8?B?cGc4QStyVkFVNmtqbTd4b2ZNSzhzeEI0eTVRc1N3SVhxRFp4a3drSWxUWnV6?=
 =?utf-8?B?TkNDdHVaM2dsN1NwdTJYMmE0QnpDUEhNSVc3dVlMYjF3RCt3UzNwQkJtcWNX?=
 =?utf-8?B?czJ4czZkNWFtUkE1WXpxMnhHdjdmdEs2VHljSmJNNlU4KzBhbFVCMXNZNzZQ?=
 =?utf-8?B?MGUrZmZhNUIwdFdIQS90N3pJYk9nSmp4d2pJVE5ySnJWakt6dVhicGVjYi9z?=
 =?utf-8?B?b2dBVm9JNFlwLytDb0Zrd3VYeTg4SkpVdE9qOWFmZWdmSy85YlcrUExQYXg4?=
 =?utf-8?B?dW1YQzZhT0pwUmlPbDhMVktpcHE5VTEyQ2xpcU5nd05rbHp2Qll5Nk42d2c1?=
 =?utf-8?B?M2VpU1owaDBwS1ErYVR5SmE0eGFvVVpCMk1YWU1Kbi9hcGZkcE8yTUwrSmFK?=
 =?utf-8?B?Q0tlWWJXZlUzQlZ2Z3RVVFlPcTlaQk0rK1JzU09oOVNpRmwvcW5OcnVSNm5O?=
 =?utf-8?B?YTkvSkNLaHplRnNtRnNlMHBwbDZvS2xTTnB2L0xZeTJRK202V0ZIeVhzMk41?=
 =?utf-8?B?aFVXdDhVQlpkeld4ZE5KTHBxSUE1SXU2Q3YzcitvNFRtcWl2UUN4bWQ1NUZK?=
 =?utf-8?B?Zm1JSlk1bkM5S1VZUUZPa1Y1UzhyU1JxakRMZkNDdGpTZFIwSW8zMWFNamM3?=
 =?utf-8?B?RVk4cytHSFJDMVFsdVFLZk1INkE4U3hJWTZ3dEp6Y1c4TkJZeXI4bittalkz?=
 =?utf-8?B?MHhzZVlNWVVsNmlEUlpkTGRzeWRIUElVN2dSWlJ5QlpzRzZURlZKM29ydFRM?=
 =?utf-8?B?cWl5WkdqZDZuUTdYNFo1RHRLTzRSMk4zcDFTaTJEUHoySjg2V3creWVmQTRn?=
 =?utf-8?B?RlFLT29WWVk1SXQwaWJ5TEJYdlhyR0Y3VGNieXdKRG1WZnREb1N2MDEyWkxa?=
 =?utf-8?B?eWtSUk1PSE9SWEU5aEx2azZQSXhEUWMwQzVzOU50dDhDOWVmN2RGMUNRZjBl?=
 =?utf-8?B?SDNDUWFraWo4MXk0SitVblBjUHJHM2NSM3NRSEJ0Z0g5eEpZTko0c3FLczlB?=
 =?utf-8?B?ZnM4ME9LM0ZjQVE2WFYvVXJ1ZmVSaEYzVGpZY3hyZndySkFZaWNaWXFJOFRD?=
 =?utf-8?B?RStmK2JVdytLSDQrR3RwUDZzeDlJNW9BNDZDSkJzWTlEWFRhMVpSaiswRHB5?=
 =?utf-8?B?NWV5eUxUY3d6UDAvRGZGRWJSVnhhL2RCd1ZVa1FIRngwbXNMSTRaR0o1SFJy?=
 =?utf-8?B?NHlrVHB5emlqV3VJZGlrYytsbm5DQ0J6L2NyNHJYdEtndmVvenpZVktzWWFF?=
 =?utf-8?B?TjVyeC80WEoxeGc0NEV6cWhsbTR5cGlFQ3lpVm5seEZ5Nk5EajArU3B2N1NB?=
 =?utf-8?B?dUF0ZEkvY1IzbG1sTkpaYVdBTXMvVGZEL3ZTUW9UZlJ0OEdvT3pJNkVjdTQr?=
 =?utf-8?B?bk91dERUZUE5SVlGanBJa2hyendtZjhOb21nR2l1STlIZ1BpamQ3TUh3elJZ?=
 =?utf-8?B?N2dBdkxPWHJsU3hmNlVjREQyakJMTGpveTFESFQrZ2NhSXVOV0Y3S1lpWmNu?=
 =?utf-8?B?MEZidllNVlQxMnZVUlhPSFo5WklJQUhnNmhIZVNtSVJRS3gyRllEYkF1Z2pl?=
 =?utf-8?B?d0FMRXc3K0QvclNDQ2gvYXY5SUthalN2RmZZanExZ3RDZDJtTklUQ21ldlNQ?=
 =?utf-8?B?RXE5alVUYTVyYWRFRXRBZmZUT2g2MVpaNGxCc3BUUVk1YkhXbHVVTWNuTm9y?=
 =?utf-8?B?S01qaTVjbDlKM2JjcEhGTGpvR0RtNnp4V0FJdmN2VS8yeUk4aThrSFk0Q21R?=
 =?utf-8?B?V0NtVUpxaW5JRFRNVFBrMStwTURaV2U5aGdYRzRGMk5GbVozc1pQdVMrTExC?=
 =?utf-8?B?UmZLV25RZnZyRUhqUVd1WVA1dUJsbUxOajBXSWR6WTE1SFRJWnlXVCtqVStr?=
 =?utf-8?Q?UR2Bx9cSlgHSHGZ3/3/rrDw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1245b733-8b7a-45ae-5e54-08dd75957e7c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 05:31:49.1987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnWjw/4ZbCug+DU1ZzPF4HtGtKjum45x4jdhweRnwq+2dS8lbvlMwPu++Fv2MmfZdtF+bxWrLRPUihk4zG6LHW16hhwsExBL12o2uFvk9t4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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



On 03-04-2025 22:23, Oak Zeng wrote:
> Normally scratch page is not allowed when a vm is operate under page
> fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> is fault mode relies on recoverable page to work, while scratch page
> can mute recoverable page fault.
> 
> On xe2 and xe3, out of bound prefetch can cause page fault and further
> system hang because xekmd can't resolve such page fault. SYCL and OCL
> language runtime requires out of bound prefetch to be silently dropped
> without causing any functional problem, thus the existing behavior
> doesn't meet language runtime requirement.
> 
> At the same time, HW prefetching can cause page fault interrupt. Due to
> page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> the page fault), HW prefetching can be slowed by many orders of magnitude.
> 
> Fix those problems by allowing scratch page under fault mode for xe2 and
> xe3. With scratch page in place, HW prefetching could always hit scratch
> page instead of causing interrupt.
> 
> A side effect is, scratch page could hide application program error.
> Application out of bound accesses are hided by scratch page mapping,
> instead of get reported to user.
> 
> v2: Refine commit message (Thomas)
> 
> v3: Move the scratch page flag check to after scratch page wa (Thomas)
> 
> v4: drop NEEDS_SCRATCH macro (matt)
>      Add a comment to DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>   include/uapi/drm/xe_drm.h  | 6 +++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index aa70076e9218..9aa1c5cf1fa1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2049,7 +2049,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   		return -EINVAL;
>   
>   	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> +			 !xe->info.needs_scratch))
>   		return -EINVAL;
>   
>   	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 616916985e3f..9c08738c3b91 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -917,7 +917,11 @@ struct drm_xe_gem_mmap_offset {
>    * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
>    *
>    * The @flags can be:
> - *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> + *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
> + *    space of the VM to scratch page. A vm_bind would overwrite the scratch
> + *    page mapping. This flag is mutually exclusive with the
> + *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
> + *    xe3 platform.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>    *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
>    *    exec submissions to its exec_queues that don't have an upper time
>    *    limit on the job execution time. But exec submissions to these

