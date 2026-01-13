Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE01D29DFF
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 09:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B410E119;
	Tue, 13 Jan 2026 09:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlF0Xu7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA30A10E119
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768298352; x=1799834352;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jkri/pWEM6Ucj5JusG7UashDm8q0tM/hcqHJw8Vgu/U=;
 b=GlF0Xu7tYyHnaC4p2Hqgnxv65TJajlByjlEwTUx9fgKs36AZRmjaEK4F
 BVfBa9qeXkrD6FhjPWpDBbJpZAKy5zsQVP4Ei95tsZIrUE+SdRDic5YgA
 hjF4sOs5FyXNrqZcfZ/bJUvfjTIGtwQNlQqSTmfU9Mh2sx7GOO1kJvPXS
 OKmoh7dCraP8zqW/KMTyjVPRWx0s1thznazVsWXnWHchIK5R70o5sq/2I
 hml1bgamwV0XDh34Kfbe2yIT+Y3txEvah3GKneUTdQEY2Bo5bQEyHNYG4
 j0G22PEfsRzPnb5JhMADl5sv8Dqft6Iz+idF7XDdGx0NeCJMzO/NAZ5eM A==;
X-CSE-ConnectionGUID: LuQK5DwFTiaChhdO0ZlZGg==
X-CSE-MsgGUID: pXGW7XDBSdue0rOSefi8Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86995657"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208,217";a="86995657"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:59:01 -0800
X-CSE-ConnectionGUID: YzOPu42vSoGJhvBU5r2Pbg==
X-CSE-MsgGUID: YGfm7PbCSjqE5oOdxTafvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
 d="scan'208,217";a="203499148"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:59:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:59:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 01:59:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:59:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW+qlNtogGwFujEu0Ik5bvN9irA11lc4ziBTTYRpXfETLuz3D2WjHtaZtjq1D0ypxi5d9BlSuuMRydEvu2xzZBh4okj7a4sRsVyQbQLstA/XfVZnVDfvGpeK59KJTreWlcyfq/LcH0AAAZI1BMW+JAMU6nCPZr5gN6MFg62zGUvLE2iBBfvmWcftOI0Y+Vn+iBy5BEYX18n/w4IrvmhegmbBHQMQ5FsWv7iNPGJCS3dEFweAmKhg52ZdyZ1wtouozHxHI0SkOdsUPpxFbNtCLMRMNxGN/NdFYUGFkmLuIZN4vAKicd82r/1nOWDTg19url5hZj85eqm2Eq+z6EbLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8t3d+2e/TkIADBjpoyfYc6rIhQQo3DAQNZ9M8egvDA=;
 b=PlewTX7adHYmzl4utZYdaBoEros62nhRFmSdpuD404igj5kCcYPFADTdDt5XBDT+79Q27AKz932gSJcy3flZ2PyQsHd6ahffIp3jB5GD02KA1DSUhRD+PeEjDCGQioAA0n+ghcc8fN2zNO7ZI6BrM5BYsEG4f4ncA8kl/yMifhklEZQh8Df269jJNfY0Md7+mdFKzLOEeSMsTmi3lxiaOg9C5SBrBjBPmqCdyEOGk4rzJlbp0TM8rGCk9vITOctl4/Il4HCZ4ahUAJI1e/U4qsDrW6OOk/em14RkH/gbh2Y8zVu120vWtXw+RLuYBIyCBkUHmCJocnrnfbM15xIDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 13 Jan
 2026 09:58:58 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:58:58 +0000
Content-Type: multipart/alternative;
 boundary="------------vD0ilMNA0T2JSUoYXsCzPmi7"
Message-ID: <e0e82ba8-e277-47c0-8003-d07628e5552a@intel.com>
Date: Tue, 13 Jan 2026 15:28:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/xe/hwmon: Expose individual VRAM channel
 temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260112203521.1014388-1-karthik.poosa@intel.com>
 <20260112203521.1014388-5-karthik.poosa@intel.com>
 <aWYAewvdkrS_WSZx@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWYAewvdkrS_WSZx@black.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0247.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::14) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e34e78-c4c0-4158-1539-08de528a5e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3h0cncvVTI5d3JjNncyTEdTVXpOTGRDbTBkeWpHMENWeENLdVRLei9ReTli?=
 =?utf-8?B?Z1U2VTRhckMvdWJUTzM5VndJOU5HNkI4QU5BQmtKdTRNbVRVY1FaQkNoUTRO?=
 =?utf-8?B?WWo3eXBoeDhvbTcyWnYxSVlqbFllc2tLZTNHeGNTeFhpcytEdnEwNXBFOCtN?=
 =?utf-8?B?N2dGWWNwTXJsaTFWUGtYOUtTeGtHZWZtNklnTHVQNU81ZVhZQ3M2NnZxMStR?=
 =?utf-8?B?aU5PSlZSWFMzYjFmOEpTVnhudkxndmlDNGVPLzRJZkU3dWJNUjcwSnZvRUY3?=
 =?utf-8?B?SW5lbFB3blNhamNmVjRxRTRJSWRBZ1VWdHAyZHF5QlBzSmhBZ3NGNllqdjZH?=
 =?utf-8?B?RWNqakVuVUlldml3OEMyOUdpVVNhWTY5alVmMzhqVEVRcWMwSExhMCtHZzhy?=
 =?utf-8?B?cHhLMENYMkpXTEltUDliVHdvQTAwUjdEa0UrOHFjY3dqNU4wcytIa2hVODlC?=
 =?utf-8?B?ZnIzcEtuMGlRVW4xVXQ4UzljN0FuSW5jMWhYTUZ4R3duL1BYWGQxTmdrZ3R4?=
 =?utf-8?B?WTZXbU0zcGVKaDhRYmI1ZDFLMGZjNjJlTnFwUWxBNVRvQzFDK0dPYkNOL2l6?=
 =?utf-8?B?RCs5Zjk2ZHVNaVZpTnFDaWVhVHJZRE55M1VhenNqcXFCNHB6eVQ4N0M1cFc0?=
 =?utf-8?B?Qnk5eFhwaVZtbi9hT0F4cXNma1BjcnRrdTdaTXhHVjNhL3dldFpsc2t1djBX?=
 =?utf-8?B?d3pPajZ4aGptQkJxTFdOQTdTaVRab3hCZ1VOTyt0QUtCaFVYTDlYTDVMQThG?=
 =?utf-8?B?TEdmcHk0aDNUVDJDaE5uTzJFcGdMY0J5blo3VW1YWW9NSVpTR1Y2eVJTek44?=
 =?utf-8?B?N0pUODZvbGhiZmNoZ2NvaUQxZTlKcUFXMW05WE1JQUkrOWEwMVBjTmdZaXd0?=
 =?utf-8?B?a0xjQm5pNkM1ZWtJUVRkZFQxMnFtZ0xSbUkrQkRETVpQdTRZMEdpSDgyODQ0?=
 =?utf-8?B?M2h0ZFA0c2wwV0tkVEpoTnVYeGlDV3hlUVh2Z0FhbEduUjRWczNRMGh1WURE?=
 =?utf-8?B?MXBicmE0eC9tb3dadXg2cnVHNk5yTUhEOHdsc1NCdGZZNXg3K1ZtbDJseXpO?=
 =?utf-8?B?NmZVNmlDaXRNL1JPVDE3OWpWNDlxU3NHQlIvQnM1L1dUVEpoMnl4enczUTFI?=
 =?utf-8?B?T2cwZmlZMlBCMGs5aTFKWHFrNzBwU1U0VUxlUERsT0pDOFdRUGRkQkR1empl?=
 =?utf-8?B?OTJCaFV5S0tuT0NHcUVsalJrM2YwUXFvdzhLMHZtckhDSUtHODhLeDZwcUtX?=
 =?utf-8?B?L3poeTExNnpzVDRYVEJVL2RoWlh3OVFhb3orc1JvSldNK3VkTXhkUVpRd2Nl?=
 =?utf-8?B?YmxEcGhZRmxvTmNjLytvdG56clcwdWRyTEtRY3E3dVhnOEdpSVA4TStweG0x?=
 =?utf-8?B?RjdLVkFCNlVjU2VzaHcxd0Yzbk5hM2lHODRzWmpsSDUwUFJIK0pNRzBGb1Yx?=
 =?utf-8?B?WnZEU2VHOXVxUUE0UVE4eUkwbE01TmtLUmxJNlREOTFuNHJwbXFGaGQwVnJ2?=
 =?utf-8?B?aGVRZ2EvQVFycHJ6bUxMKzlEWDVpT3J2bGdqajFwa0d4UW95NU5NQ3paSHBY?=
 =?utf-8?B?cEVtR0dkSjFEbEhMcVM5MmorZGs5VHVqbHJyYkJWOG0vdDVKSEVIRWl2N05u?=
 =?utf-8?B?OFhjaE5LcGx0SHR2akQ2bTZLYmFnakxON0p3S0JFZ2YzMUh6VXJnc3E4Mk4r?=
 =?utf-8?B?djVSemVwUmpjZWtONy9TMytiQ3p1aUdkRUhRbjdsMFBFZVkybkFjQjQ2OUds?=
 =?utf-8?B?UjFoQTBRRE9rZ3NUZFdkVXhoOTBhOEt0eEpjQm8wS09kMFhxdWdSR2RQWEY2?=
 =?utf-8?B?YzdNbzNiQ2M4YTN6K3Vkb1RYZXJYeUV1VFpVMmQ3dmVJQk5tOUxieTRId2NY?=
 =?utf-8?B?YTl1WGJseEVYRWRkUnBDTVB4c1JEdkdQRllDOGVQUml1WkJhOHVpcVNVU1Mz?=
 =?utf-8?Q?zKiX9PwOVG9QEOElfAP6n2bcl5mSJbUi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlgzQWowTERxU0UvTUhpRUFqc3BuQ3hDekxPQ2hESHY5ektyT1hVRis5cDNV?=
 =?utf-8?B?TFdYWDFDMUxaOGJhR0oyaFJFaTVXamM0WmV3dzVqSi9ONXBmbDJkWEF2TjJJ?=
 =?utf-8?B?TWhNayt0b2s2ZkdJdDI4ZGFKbDFUZUVwMUxtcmpRWTREbHEweUNMMXpYRHUy?=
 =?utf-8?B?QUd5azVjUTFCSDZJY0xxNHZmY29HQVhSTFUrakcrcEhQNU5ld0ZtQVltVTN1?=
 =?utf-8?B?d1o5ZUFCZFJOV0tZOEdWcEo0d1dtL2tOUjZDOEllL3hMOHpEZU05MVdia3FB?=
 =?utf-8?B?NC9sRGdmTGo5QlYzN0FKam1OM2FOcUNZUXpTMTJpaFY4MlU0WDg2bXh1NWhE?=
 =?utf-8?B?eTE0ckJpdmNadUg2bHpsVi9jZ0tEUTRxN0RWNG4xWkJOamUvWVRIWTVKSFhj?=
 =?utf-8?B?WExWN2p6cHRmZm9PTllJZEh6bVE5cjY4R2I4TnQvbXhDRVExZ0hYSDlDUUVm?=
 =?utf-8?B?V0JsdWF3MGs5c1FpWXViZHFKTnlRVlVZY2VJeVRqZysxbER5cnoyc1Jkbk1I?=
 =?utf-8?B?ME9zY2ZDZTdGZjFRL3FjZEtyZlF2SmhHWk9SWE9iNTRWaHV3NGZCektaWkwx?=
 =?utf-8?B?NWJKeGhoSkJCdXZ2TWpmZ3krR3N6NXNnUkt5WTd5a3hIbTVqNGNuNXRMWUNB?=
 =?utf-8?B?YmJwS0h4ejcvV3RVYmdhODR0UTZBNDM1NkpSOFpENWh3aVdHdE1HVktDZXJ2?=
 =?utf-8?B?RnBjY2JHblVtK04yVC8vK3RmU2dVQkhRS21OTDdCSmtkMWZHdHc0aU0xeVRT?=
 =?utf-8?B?OHUxdHJiNG44NDJhcVRpYXVSaW53bTQrNUdBSjdtZm1XNVpiZnJqMG9STmRw?=
 =?utf-8?B?ZTRlL1ZqYnBVam1GTXRzWjVGMmwyK25XSGhGNGYzN2daU1BnVXVqdXNpTXFR?=
 =?utf-8?B?WWV2SGFnSm96UUVnbXRUNEljTVcrY3RZYllsd2pEZU82YlQrVHlWUk1tZTJW?=
 =?utf-8?B?Ky9LeTBRMk81eEpaYVF3Z2p3cXJ3T2pRbHJCM0RidENSd1N3V0RLR1FLMlpC?=
 =?utf-8?B?eE8wSXdqdWpTSHJTeitYOE1aVHZIVGJjS0ZrV2h5SUVwZjR2d0ZmclJpNnI0?=
 =?utf-8?B?Nk8rbUwzNzEyQmZXYU8yK0ZsRHdDRWdZWlBSQm1CYmVTREp3TCt3cDRQbk43?=
 =?utf-8?B?ZFgvRnEzamxHNDM5OEdyTDJhVUR1QkRSeWFreUg0UEk5MHF2YkhIdzRRRWZm?=
 =?utf-8?B?VUlsbll1K1RQMnJDV3ZIQVJ2L1FyL1JNTVFxVXRUTXd3UjlhM3FvUkZJQzJ6?=
 =?utf-8?B?ZGl3bXJLTDI0WityZkRScy9JZlV6V3FNM01xZnNQcUYyT01rQ2FLMmVsUDlL?=
 =?utf-8?B?R204eFkydjlsQiswZGpwWTM3NHZJR0l0UXJqQlg2ODFyVmphL0hxakswUFkw?=
 =?utf-8?B?SmZOUkFuL1Y4b3hqaXJrM0RqbWdOTHN5djNSaUxOdVNFYzJuMFRzZlNmcGlo?=
 =?utf-8?B?SlZSb0tpM2lSL1RkaklJWGNxRkJ2RHJOK3J4bFdFNklVV1BvcXl2NWdWTCti?=
 =?utf-8?B?NVROc3o5eU5xYXhEcHJuWC9zcmN6YWhIUnVrV3V2em9XaExKSkp1WXNNVDRC?=
 =?utf-8?B?RDJtWUdINXUvYkhkcXE5azY3Q1RQYUNVRHo4VFRyRm9ZcHlYT2V2czVSRTMx?=
 =?utf-8?B?NlVOZGxwODB3bWhCVm94cEN1aWdGdG5mREJKUjdBOEx0cVFiSWlGU2NvMGNB?=
 =?utf-8?B?eXdXRDMybUNDSkNPLzhrME1wODBaRXlQNkpuRjhUV281TW1NQVV3ZC81Q0h6?=
 =?utf-8?B?NVpHeUJwMXluQy9rdm1tWDFOc0xWbkxEVjh6TFhYeDloSy9CWld3WU9lZFNU?=
 =?utf-8?B?UlJGQTczVDJqTDdPSGQ3TzRuYlV0TUM0bGFYVDhQS0tZTkVmdUx0d05LM2Zk?=
 =?utf-8?B?QW53RFE3OHZYMllCOCsxWlRkN3d6OUNsbHpEVmZxUVZodnUrTUpyRjZvU3BB?=
 =?utf-8?B?RWFDa1BGRS96KzZ5YmdEQkNGSFBmQ042UkNrcUxRL2VDeHdnOFg3SzZIMFh2?=
 =?utf-8?B?V25EL0dzSjZHdUVRcGRwelQ0ZDVOYmJ1QUpEZk9OYWlVZGlMOHdBc3dDWVQ1?=
 =?utf-8?B?RHdOblplbDVqd0xXbXpraVBvMkxSOTZzSE1xamJGend4WXdZUHBBaUlvV1c1?=
 =?utf-8?B?VWhONVhwLzRTVHFXOXhEb3MxVm5GcmNieWRMRkJldU5TVlNsS3NMYW9sUWRa?=
 =?utf-8?B?UFQ1b3JJeVk0VEZ2K1RncktZcUxpWlc4VXJUdUhQOTRNNHl1Wkg4ODRWZUd0?=
 =?utf-8?B?ZGYwbFUzQkdVMGpoY0ZCT05Yd2JiamowNitJTGxWa005ZUlidGJnQk4wSWxN?=
 =?utf-8?B?U0RKRDZmOUdzKzBRQU5DLzV3SWpaeDFSRWpOR3YxMHBUcU9jbnlYZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e34e78-c4c0-4158-1539-08de528a5e86
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:58:58.1526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iuRQ6x1tSQydEG8q+c3KnjfZYt3+zSLALZJ9/pJwsshYkJgrs3V1RK9gnGnklbp/Q1i3mw471os9C7I7Gg0Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
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

--------------vD0ilMNA0T2JSUoYXsCzPmi7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-01-2026 13:51, Raag Jadav wrote:
> On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
>> Expose individual VRAM temperature attributes.
>> Update Xe hwmon documentation for this entry.
> ...
>
>> @@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> +			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> I think this should be
>
> 	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>
> or did I miss something?
I’ve ran IGT hwmon test and lm-sensors and didn't see any discrepancies 
there, all available channels are seen.

>
>> +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>   		} else if (xe->info.platform == XE_DG2) {
>>   			if (channel == CHANNEL_PKG)
>>   				return PCU_CR_PACKAGE_TEMPERATURE;
> ...
>
>> @@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			       enum hwmon_sensor_types type,
>>   			       u32 attr, int channel, const char **str)
>>   {
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +
>>   	switch (type) {
>>   	case hwmon_temp:
>>   		if (channel == CHANNEL_PKG)
>> @@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "mctrl";
>>   		else if (channel == CHANNEL_PCIE)
>>   			*str = "pcie";
>> +		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> Ditto.
>
> Raag
>
>> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> -- 
>> 2.25.1
>>
--------------vD0ilMNA0T2JSUoYXsCzPmi7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-01-2026 13:51, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aWYAewvdkrS_WSZx@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Expose individual VRAM temperature attributes.
Update Xe hwmon documentation for this entry.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
 				return BMG_VRAM_TEMPERATURE;
+			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think this should be

	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))

or did I miss something?</pre>
    </blockquote>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I’ve
      ran IGT hwmon test and lm-sensors and didn't see any discrepancies
      there, all available channels are seen.</div>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <blockquote type="cite" cite="mid:aWYAewvdkrS_WSZx@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
 		} else if (xe-&gt;info.platform == XE_DG2) {
 			if (channel == CHANNEL_PKG)
 				return PCU_CR_PACKAGE_TEMPERATURE;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
 {
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+
 	switch (type) {
 	case hwmon_temp:
 		if (channel == CHANNEL_PKG)
@@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
 			*str = &quot;mctrl&quot;;
 		else if (channel == CHANNEL_PCIE)
 			*str = &quot;pcie&quot;;
+		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

Raag

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			*str = hwmon-&gt;temp.vram_label[channel - CHANNEL_VRAM_N];
 		return 0;
 	case hwmon_power:
 	case hwmon_energy:
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------vD0ilMNA0T2JSUoYXsCzPmi7--
