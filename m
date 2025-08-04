Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8447CC87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 15:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBF310E229;
	Mon,  4 Aug 2025 15:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaHHJIYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3447110E229
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754319624; x=1785855624;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U5gFNsDwmALdK5T1zP3FIU61DiHYzO/k4YN4iKRAIzg=;
 b=UaHHJIYAy66bT7v/N14JZLUmapnm/6WhyfVmvIH5UO1a5KsJJhH7aJqz
 TySJF2f8Kftu9zmNG9YKCWdNH5CiyE0M4bvmRfO6UB2+cRQK4S6Lmrmjm
 KBQWN2SON4liR9HAsMmg2ah9YXRxkMGVAbc56L8E76gWSjoOYo75hIlFC
 oYpjpkgg0zX9A0ZEVN3NJVIfQ2CgyVAzxQEUZxVFvmuGrDSRNebqD8Cwl
 Vwb+cZn2FMbvpZo4jkkvrTxrVbdFL3v+Gtg2HL9fKmEC/3DjMEhng7+qa
 BryfuzbRcDKWNBRQ+sEQ84nX2n0cCqp2IczMDa5KICXJtVpeGSZyxbhWC Q==;
X-CSE-ConnectionGUID: lro3QN0FTJChc+4Kn51pgg==
X-CSE-MsgGUID: 7Cn1JTtkRdiL8t8+CjnYEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56477523"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56477523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 08:00:23 -0700
X-CSE-ConnectionGUID: Tf+6u+MgQxihFLzGMSe5Hw==
X-CSE-MsgGUID: GpFMNHKIS2qg1bhkxlhr7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163735716"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 08:00:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 08:00:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 08:00:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 4 Aug 2025 08:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeiolQ7DXsfIiQyp3ZZZZEeSNSvMhmMBE3gvZHvsk+/BTQ28JoxJVElMFJ3Xgs6i+yJeRqRaML8sgXnTsXj1B0xDcHhwle+v3A6zjBsJdlXKoBPA66j/rHl5QZ3JmqtNmV0OfAS+zBpgoWYpqQ/+/boMb0D7pBWSxpyqNTOZa7v1iSv4CDXIy6x/LwvU6xu/9CqzaXuDhNW+2LMMdGyBhcN/+b50CXCigvAP29I6tzPtwsoAqwdkGo92gugxD5O3043SoNgMo3n85KiVAKB9SkkU8//yK5h9ZGNbmphr6TjRRUE7faQLmgfQU61PRP+1YmFN8UgJ9nc8dKXmTkOGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJb5LusuQEDhBXqjutEAhLBUK3tU+R9hlYASLIDQuPE=;
 b=MGTuVJuqVPrpqMFQg2PY2NVkRRHrmt9ZyTL29U3V0fBpznMoiB2oWeIixfXHbW3/2jsozn+J8nqLqn0n/0f6zea45simU1RmXb6X1Aqnmy7n9JtWq7lxVoXyvCTmw8khQZRsasLpLqJT2y2dLSHZKBI99ryogX7atlknz5Qp1oOIi5KyiG7Udp7B05XXWkHj9+QVcTVlKYbWQaNPxIw/hICFl338E2lqzRLSWswhbMm9M7QLt/dV19bunOR2dBG+JGYatP09jscv5yVL8yEq1i8hAkTRw+G8MBuYdTnFyUMpgI9zCbw+vufcmMngkwGijq35Q2zwWel8tFM9IPU9Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH3PPF5AF05F6D9.namprd11.prod.outlook.com (2603:10b6:518:1::d24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 15:00:19 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 15:00:19 +0000
Message-ID: <9f22cc70-116f-4ba5-a2f5-08dfce89e5c3@intel.com>
Date: Mon, 4 Aug 2025 20:30:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Anshuman
 Gupta" <anshuman.gupta@intel.com>
References: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
 <aJDI21VmY6Unf9Vw@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aJDI21VmY6Unf9Vw@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH3PPF5AF05F6D9:EE_
X-MS-Office365-Filtering-Correlation-Id: b053e4dd-f401-4c15-9f16-08ddd367a0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGszdFBhYzRxZFZ3NzFyUFVnZGpvSStQMUhVVXZDRlduVEJ4dXhrZGpGbTdB?=
 =?utf-8?B?QzlpU2l0Y2RNenQ0ZEl0SFJNd09qcWpJWmo0OEhJWWJ1M1ZWWGNDMjQ1V3ha?=
 =?utf-8?B?QUVqSXZHWC9OUXdjRjhFN1p6MitnbjU4SmVVaVhmbXl5bWh0OWFCRVg1L2hp?=
 =?utf-8?B?aEFxcmJpWElNRFlLYlV2SCt2U2x4VHphUklzb2ZOTGpVN1pzdnF1c3ozdkpY?=
 =?utf-8?B?ZnQraXk2OGNhRFhGUjdJVFVxeUxnTlhjL2p0L1BmQ09hYmhtaEJKbXlSWnNF?=
 =?utf-8?B?VnNiakFtZWVXenJVYTEyTUxtRHk5K1FQUWtLb1hTVncyWjN3eUd5MzNNeHZh?=
 =?utf-8?B?Wk1Zd2kvNEtXUW9ycGNOMWJEbHRkaVQwL3NFVmQ0VXNNZHZFci9IaE1QV1Za?=
 =?utf-8?B?NU1WclhMQTN4dFI0dkJ5R0E4cnBuVHpEQndrdjU2U0wvQmsxUUtCbjlOZ3lF?=
 =?utf-8?B?SXZFcmtWNlh4dkI3WERRbGRQZ25vaHZJazFKU2RGME02RXZzdDQrRGRNWW5v?=
 =?utf-8?B?alZIVHRoMnFkRXJ6N0JIRnJRaUdiOENiRFlOU1Z0ckJBcmR2T1pwaU41Kys2?=
 =?utf-8?B?cy9ub1FZUmE2emhxUk14ZkxGTGlWRDNTRmRtM2hGYlI5b3ZLWUVoQ1hDS2N4?=
 =?utf-8?B?TG5RTWpQWnZ0elNtM1pUNklSYWtJbU1FVTU5ZmxyWjZoNXB4SjBYdzFscGdC?=
 =?utf-8?B?TmxWMGkyMmIvcGN0WUZDY0hvaThGMnkwQmV6aGxKRXM5M3prNHoyeWkwSDFn?=
 =?utf-8?B?TjFUT1hrTnIxazE2TW5ZT2JiNWpnZUVrVGhmUXBsUFRMUVpLeGIrWTJYcE9s?=
 =?utf-8?B?TElrb0FXMVB5QWx3YzlxVHMxNkRhY1p1MGsxV0VRY2dVNTczemdobTkyN1VS?=
 =?utf-8?B?Sk9mSVFmek95WWpLVjBMdUJFbmM2cDBEV3ZpN0RmVG1OWGhrS1duY05Dd3E1?=
 =?utf-8?B?QlpIelRNV29qWk43Y3paWmw0U0dYSjkxTXZaQXg4L2xpK2dhWEdCL1VEd0JF?=
 =?utf-8?B?TXpEM2RxVko1bW1qZDRNdFBEbm5rbzU1M3krZWRwdEg0QVdvU2lPVnZCRG9W?=
 =?utf-8?B?b3RYM1c1V1orNzcwME12cFVCd0F0VTlxUVBiTDhVZVFoUjQ3MG0vcnV5TENx?=
 =?utf-8?B?YnlGZjl4T1NRN3dBMTlzSmF3MW5lNmdjS1JmSEtIRHdGelFtZFlXeWQ2K0I3?=
 =?utf-8?B?ZmZLaTFTcTh0aFBBcnhwOXJxRmN0VkVOM3dia3FoRjVmYkNGV0thZSsydFNh?=
 =?utf-8?B?dW8vK0Y2MGxaQXkzMFhZWVU5cUdJd1hhRFhoOFJlQUMzWkRSM29aM3JuVUVI?=
 =?utf-8?B?WWZDdTBmaU9PUmFobHRFOW5IaEhHWFI5U2w5WmN6OG5hcW4xb3ZDTGEySTR0?=
 =?utf-8?B?Wm9aU01OK0NqMG05dlVWWmxSMFBxUnM0Mm1SMkJvR0ZrZkVxNURqbGwvd0Ny?=
 =?utf-8?B?NVhQNElXSE92YVJNcHYxbDlGam0vKzEvWldsWXBieHFGTE45ME1pcVBmV0JC?=
 =?utf-8?B?NytKaDRDMkhTQ3BrT1lvOU1EYVBQVUM4MjFQQ0hpa1RNMHpmbytKQXVBbFJV?=
 =?utf-8?B?QXc4VE40aW9BM3QrajJKWEN3a00xampyckl2bVRBYXBpK3NBTWxvV0tlWCtB?=
 =?utf-8?B?a3dvcHZTbkJ0Mm44bTVzNHQvRU4xamFvNGpieTlVemk0dEZweDg5ZElRWEtV?=
 =?utf-8?B?YjZQODlhRlluTGlrNXlnU1RFMVFGak5vK1MvKzllbXJ5RzllaXRpLzZwZzVv?=
 =?utf-8?B?Z3NaOXhPOFc0emU3ei9heCtmdTNVQklveVBTbXFRZHBYS1Z2Ry9MNGpWSUM5?=
 =?utf-8?B?Z2U4eWpGa2Z2eG9reHZGSkxDR0Y4Z1dudFNVanhpeDV1eURVMFBGY3FxcnNZ?=
 =?utf-8?B?bTgrMFQ1RGhadHZ2NW9jTWtsMXRzRWg1REpzUm9SM0lwMWhub1draGlkZ25L?=
 =?utf-8?Q?CJ/h56zpt2w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFIrUG42cmt1UVVvTy9ycFV3NTBYMUs5Z0Jad0JpKys5dG5WUlBZNnp0WDRs?=
 =?utf-8?B?OC83emJ4MEx4TENwamt2ZWF0RVVpUnZHT1BaNzFnMTNjN0xVSER3cFFEdnVE?=
 =?utf-8?B?N2hxS0d1OGtsa2ZiM05Md3U4WUsxZlRqUkVORkRoSVRpeEhneVl0cmpvMkh6?=
 =?utf-8?B?MXhGamdSNEN3TUFiSy9BeTcxN1crdTBhaXJqSzU2NERaOXdud1pZYmVabkp6?=
 =?utf-8?B?dVk2MGlKdElBY3NUZlF4U3orQ21lSGp3QlZmdUZlQUtGUmJwRkZ6dmkxY3Z6?=
 =?utf-8?B?QnEzdE0xRUR3SXFMTGxydE1hM09UOTZoSXY3STk1eFMxaDhmc3ZDL0IwclM4?=
 =?utf-8?B?c1JkWGkwRU5leGdCWEJHOTltSjFhRkp4VUlUYlVPbURxTEp6V09zSlZTSk1j?=
 =?utf-8?B?eFU2SFhQUzU3OGF5czI3UEVFcnVrWnJWYVZnT2dDeHRhaEVjQk0rdTF4ODhU?=
 =?utf-8?B?akZtL1hHTTJiamFFQlJsR0xlNHlUZ3lSb1J0SVlrbkN1ZDYxOTBQMSs3dUQ4?=
 =?utf-8?B?YnRmdkhpN0tOaUdlcGFNYWxIdTZSREdiK250VnFablFXSEFlUjNEY3dndnZu?=
 =?utf-8?B?UXF4dEZ1MEpDcmlCcDRsTEV6cXJjcG5RMmNJMi9QanhKWlBGcUxacGluRTRF?=
 =?utf-8?B?aGpVOUZ4WThDSy9ud0NHWDlZUllnazQyRXFXeTNJUU9RdVNDNUE0U3djSUE4?=
 =?utf-8?B?R2JUd0xNSE9YUnZHRDZCM25JWEZMdTBCQ3BTR3dqQVpLek13NWRnNWU1dkFD?=
 =?utf-8?B?TURkNFZ6QXJEaGEzYmlrdUNNN0FGem5IQTYzL2lLTnZqVmtyY1ZzdHNEZ0Zz?=
 =?utf-8?B?V0ppQ0kxbGlseHVwTmJqVkhkYldWVWNMYXBTMlArc3FDMG5QQ01NUzB6RFQr?=
 =?utf-8?B?Q3h4ZTFodHBSeDVmM3J6UW4xQU1GZllTSHlxTFB3QVVCVGp3ZW5VeVNJWXE3?=
 =?utf-8?B?Y3F5KzlxN3FEUVJIbUZha0pRWGs5MXdmRU1Rc01ScVAzOFExRWhvV1ZhRHlT?=
 =?utf-8?B?N3NhNnFmS0o4dUFjVVM5eFJFcjQ3eTNyS1FVN3QyWjd0YWNoQlJ1cW9mL1U5?=
 =?utf-8?B?VG9oeXdPU2cvNzMwVFZ5MlZxT3hMZTFlUGNIekdwcVRJN0UrM1AxOHg2ejd4?=
 =?utf-8?B?UStueGgzMDFjbW9MMElabjFBMlBsRy9obkxncm9DVmZYRjhML0x4SlpwUEN5?=
 =?utf-8?B?KzBIWjVWUTBxYTJIaVhVNHlMYjNUMlNJWVhuaWZkOVhOc0d3SXlUdDNwcG4y?=
 =?utf-8?B?ME1tcXlEWksrMHRRVzNreEx1dUZWMmpXb1hQMkVoeGVWNTJkQmhzN0kxR2Q5?=
 =?utf-8?B?MVBDWCtpVG9IQ0xmWElGeHlQc3o3TWpONXZERnFJc2VpSXo3NWsyT3MzVnp2?=
 =?utf-8?B?T0l3aFREYWFKQzljcFJqcnJHZ1NaMVBrZXZlOEpMT0lhajEybllPTVlEdlpo?=
 =?utf-8?B?VFBiK1ZsdzRNWWlkZVVKY2NaekFROXdEU0Z4ZnNjZitmandXeDJWRVI1VEVM?=
 =?utf-8?B?aGltTC9ETmkzd2pjeWQzak5zNVJYZ2xhdDY5RmdkajZqLzczckNqZWdsMFRC?=
 =?utf-8?B?NzZKYlhxTlY0SkVkS1B2MVpMbnc5MFFWNi8vR1VjOWROWm9ES3ZIbWhZb0dq?=
 =?utf-8?B?b2lVdS96Wkx0ZWJJMXNxWWgxL2JDbVZJMUIwZFZ3TTdVT3l5bkZMVnRkSm1r?=
 =?utf-8?B?RXJNYjNOMEJqOFZacUNRZnZCWGtneUtnVWJMdzF1Qlh0QUZVUDhZOG9jY0tG?=
 =?utf-8?B?RVFEMXVQM3MvbDhCUlFrcHJZcVRWMkFRemNQc0IrbExRSXNWV0doak1BK0F4?=
 =?utf-8?B?dUc3MXFIYkhTUngxUS9PSVFHN3p3VDRHYTBrL2h6MUNuWGRUaVdOdDdDKzZ4?=
 =?utf-8?B?cGNrWVZTblNwUVpvQkkybEtaZDVsQVAyQ1h0NWJCMmxaTGxJVU1VN2kwalh6?=
 =?utf-8?B?eXdmOVpqaGcyODhNdy9RSXpxdk9zWWJlWHc2a2RsZEl0UzNmVmd1ZXhXeVVZ?=
 =?utf-8?B?a2tnNWJiaHk5Q3NIUEczaFo0UU5SZ2ZQWlFWRDludzRXWVZBM3gvNE9iVWdC?=
 =?utf-8?B?cGNBT3FFSWZPbWd6bTZIWGZ6SWQ5b1BsVWo1a3Y1aUlMY0JqUHJYcDc0OG1s?=
 =?utf-8?B?ai9RZW4ySmhWU0RTWHpqQlV6alVtcGtsUjBnLzVJOUZtT3J4OGFINDJ4Szho?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b053e4dd-f401-4c15-9f16-08ddd367a0da
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 15:00:19.4146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPcc5xFyR6U+sZA1AcWQYY6FaTsvdRvbNIsvIScFv6l2vW5CUFAZrnrtZ8VcL3vS56r31UiOaNQooObYTs3sWzCa7n51gwy8lYtMsJSWoio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5AF05F6D9
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



On 04-08-2025 20:21, Rodrigo Vivi wrote:
> On Fri, Aug 01, 2025 at 10:00:17PM +0530, Satyanarayana K V P wrote:
>> Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
>> their native Power Management (PM) capabilities. The specification (as per
>> section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
>> that Virtual Functions (VFs) without Power Management capability inherit
>> their associated Physical Function's (PF) power state.
>>
>> As per PCIe spec "If a VF does not implement the PCI Power Management
>> Capability, then the VF behaves as if it had been programmed into the
>> equivalent power state of its associated PF"
>>
>> Since Intel GPU VFs lack PM capability implementations, VFs power behavior
> 
> If this is a true statement your patch below is wrong.
> It should simply be if (IS_VF) return;
> 
The current GPU VFs are lacking PM capability. But in future, if VFs 
(new generation GPUs) support PM capability, then VF should be able to 
manage PM on its own. As per spec, if VF does not implement PCI PM 
capability, it should follow PF power states. If implemented, VF should 
manage PM directly.

So, checking for both pm_cap and IS_VF.

>> must mirror their PF's state. During VF creation, the PF remains active
>> from the PCI subsystem perspective. To maintain consistency, explicitly
>> disable RPM for VFs missing PM capability to ensure they follow their PF's
>> power management status rather than entering low-power states
>> independently.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> ---
>> V2 -> V3:
>> - Fixed review comments (Michal Wajdeczko).
>>
>> V1 -> V2:
>> - Disable RPM only for VF devices when PM cap is not implemented.
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 8aae66660931..019de04fa7bb 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -246,8 +246,18 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
>>   
>>   static void xe_pm_runtime_init(struct xe_device *xe)
>>   {
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = xe->drm.dev;
>>   
>> +	/*
>> +	 * Disable RPM for VFs if PM cap is not supported.
>> +	 * As per PCIe specification, "If a VF does not implement the PCI Power
>> +	 * Management Capability, then the VF behaves as if it had been programmed
>> +	 * into the equivalent power state of its associated PF"
>> +	 */
>> +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
>> +		return;
>> +
>>   	/*
>>   	 * Disable the system suspend direct complete optimization.
>>   	 * We need to ensure that the regular device suspend/resume functions
>> @@ -366,8 +376,12 @@ int xe_pm_init(struct xe_device *xe)
>>   
>>   static void xe_pm_runtime_fini(struct xe_device *xe)
>>   {
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = xe->drm.dev;
>>   
>> +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
>> +		return;
>> +
>>   	pm_runtime_get_sync(dev);
>>   	pm_runtime_forbid(dev);
>>   }
>> -- 
>> 2.43.0
>>

