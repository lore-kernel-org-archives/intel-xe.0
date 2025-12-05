Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964E5D37490
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 19:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACCB10EBA9;
	Fri,  5 Dec 2025 19:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPwEfOAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FB610EBA9
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 19:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764964691; x=1796500691;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e8FI9uazx23GPt2c38gxRJ7fuoBj/Yd+6OfY05u+wvc=;
 b=KPwEfOAke/bUxMhYBagqX1c+T7hzxCnS25SkmdOUIzGBIn7RsqIPqopi
 wqvGqixzK6LcpKn6EHnhfevKFWsFeejJP66NfAuwWT0fkdI6g7xG6yN0C
 /TF2yWP1Ad4jjIigE9b9bGV5t5Y+7GIMkh2Al257eb2UhJQh3g37SmWVi
 RJuQ4AFkcv9omxcjTWmw9ZGx1jaTUsOspyqPtygY11Oehng8mv8xiBwBZ
 ntXEUnl0ss/NSaJZsy7IkYc1VFMBKRFPrtm70RsB7atvfyv2DkPn/bzMF
 84YTBIix4JBhhP/ZsGOathV+IO5fwqP2rYNXNcdBL+hTSUwMPZK1g4z2e A==;
X-CSE-ConnectionGUID: mT/YgUgbRL+BSbrIAUAyvA==
X-CSE-MsgGUID: sdEdWzuwRxWr1nX051RyJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67042905"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67042905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:58:10 -0800
X-CSE-ConnectionGUID: FwA1KsSnQs2l9YeSOVqzXQ==
X-CSE-MsgGUID: 8dqX+RkhRwSoe6dhRyHugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195818989"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:58:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 11:58:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 11:58:09 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 11:58:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/pSoKlHzChG+5SiKXcscvduiHwYtiM+4W5+d26/Rg4/+fSXirHKteUZIkTlyvs4FgwlALh2FlbIG1al+ZNZ4rjuO2Al8c2ZRMHA7uV2OdgpNzc69QopVibJaPuejamT1grrwrevU63Uar5OiLdoIwSbQLFHRxTs75CzQMjZwSXssdvAvvqEbegjqsfSl2aMCuL2WY6FegD+dfuiO8EUlmEo/5P5d/p5YOcu4HiS5sYUcFuiS4o/s0J3vQK6iiRYWfxLy0WYCMmkJHVqw5ZldDLrdhiFk/bLtRK+MthKrfDhlYOClubxp3aPSgA0+2hjoCMXdMPHmQYYkiaQoFjoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkxbhwjvh/YxGiuR9MtpthgfQvRVlDEGVaZ8l8Q20ig=;
 b=ZbrINLgZQ73q69oR+cezpvCd/UrQtKd48jYLuxLzIcK9aDbnujoD8g4JVPcRjupov1jJ3pkhEqkC0VUL4zrhjw3qnMrev318tf3Xv75JC8RCcnu3Do+o+EKOZ20t0Go+866IQneGggmpdFAqmOfiCUcXvShepGI55rYV9Vdk1GxCWGKsWQ1E7gEaYpIKn4muBFB7E/5Jha3h08acCrj1pUUNf+N+zUWgmJX9tDQ2ZvtmIw3UVamFx2ebIfQd/LBXD7BymaiSqBKmdzuJXnHmb+EtfRRXYj5HiDu7Q5SRl5oIXZ4s1Ft4SyIjqfCw6gz7xbUP2MvStd+jNen8jzdnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 19:58:07 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 19:58:07 +0000
Message-ID: <2a2e606c-1e2b-44db-a4ae-6a51bf975515@intel.com>
Date: Fri, 5 Dec 2025 14:58:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] drm/xe/uc: Add stop on hardware initialization error
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <stuart.summers@intel.com>
References: <20251128213411.3184051-1-zhanjun.dong@intel.com>
 <aTJbEulTxUNFySK4@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aTJbEulTxUNFySK4@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 801102ab-46c6-4158-e7b0-08de34389bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3VaTGZTYzVNTTU3YVJoVWI0WHB3aGtiVzhMVXRHZ0RjWTNkTEVjQjl4a0JL?=
 =?utf-8?B?bGI1dlZlcEpqbmhjNVAyK0J6bmtLUzZTYXVsTEdqalYrSkpqUWllVHlVT3BE?=
 =?utf-8?B?TTZZbzhqUDlXRXdnQUppb2poWkRUWjFaVmVMQjdMdkF0anhLN2lYUUZxMCt4?=
 =?utf-8?B?eDZvSmJBYWJISEdydEk2ODFoUEgwV2oycjNqZXVkTEdaWkJ1WXdMMzAzVlFs?=
 =?utf-8?B?QjJHb2xiK0M3OEd4SHIvUUpLclJ3djRrTWNtakxxVC93NWttVTJEK0JkV0J5?=
 =?utf-8?B?WVljS1VFU3NwNzZJUVd4UE9aL0RiMERYbkFpRlEyaVZ4RlZMWkIwM0U2NVQ2?=
 =?utf-8?B?Vi9ndkRPWGNSSDBoeWF4Z0JCQkF6QUZSUEpPYjRJVlNxaWl2SkQ4d3BXTEZl?=
 =?utf-8?B?Y0xFekVtd1EwSUJaNUxkUC9EWURXMXdpSUdLeWxWcmJldnFEeFBQKzN4Qndv?=
 =?utf-8?B?cjJ2UzRvR2hzV1ExVDFhdkJBL0VMeDBydXFnVDlCUVBLTlpIbmU5Rk5RS1F0?=
 =?utf-8?B?RWdCTzFuMStZT3o1RTZSMlJ4QjZRVTJNb1R0OC9OY3NCTkNKOEtsQ3dPbm1z?=
 =?utf-8?B?L2JaKys3UzJ6Yyt5N1VUV2NkSWtLeEFMM3Q3N0RmTjlSdzllK2cwNGtHa3BL?=
 =?utf-8?B?SzFicTVXR3ljZzN1M2VqOTY5RmZzZEt3UWtpTWFnVDF4ZC9UM0dxUHdiVzBx?=
 =?utf-8?B?aWFqeXVwemFSM3NLRVBLSnArVU81VDFBeTJWWTV5dCtIVkxiQXpuREE5SHRG?=
 =?utf-8?B?eWZFbnUraHAzSytqUHZJcHVZVEVyQTVRNnk3MkxSUU9YYTJJTFFkWXpPd3RF?=
 =?utf-8?B?ZzdhekJLRGEyQldxL01PWmo3Q2s1cFRiZDdlQ2NPejcwZ2E4eStRdGRJaysy?=
 =?utf-8?B?Qm1oWW53enNMbExSREtIbW5DMjM2L2dQa25XSEZwaDlBeTlHQ1hybjZHUVZG?=
 =?utf-8?B?ZCtldWU1ckJMNVZSSEVIZTNlUllBSHVhTG5xc0N6TkJVaU5lY21yazhzMm9X?=
 =?utf-8?B?Snk5YlFQQVpYc3JYMkFJeERJdGJFa0YrcEdTQ0JaUExXbUE0aGpkd0ZKQnVL?=
 =?utf-8?B?WmJaUWE1OThrZ0ZuRUZDSEIvdXBJeGpkVXBENTF6UkhrSVlwcW9xTk5BK0tO?=
 =?utf-8?B?eHlLalFYRHhNYVkrOWdEODFDVHpmT1o5T2xBWFhCSUJHSXljRmR3S2dJckx5?=
 =?utf-8?B?RE5XdEw0TEt5WXI0bU84L2h3VVlZSnBXMUxhSEhydlhJVTFHU0hoQUZyRzhm?=
 =?utf-8?B?ektrRVdxRStac3U5RnNaNmhyU20rTHVmNVVKdUVscUwwdW1SYUlvalRBdk02?=
 =?utf-8?B?dytaV0I1c2ZWdmNOQ3MvQlNYZ0ZpSFFPVERsbmxyZE05dVpGdGtrWHNSb1Fk?=
 =?utf-8?B?RDNYRkVDNXVrdmRnU21WRWpzWnRLVU1XMGh1bERPN3ljaTBVSlZXTDRoZGdW?=
 =?utf-8?B?YWdQMFNVakdXRGdTSmVXV1IzWGJBWWJibXlpRUFDRlUzYW5Bdk9McU1mWVhp?=
 =?utf-8?B?d2tyS3dZTU9TbDJ3VVltK0xsOVdzZ252bSt3Wkk4QnZnNnV1SFFxbGVSVGxs?=
 =?utf-8?B?VGgyOCtrM2V5YUdMa1lRODFOWGFFNXZSUE1kV3RZeHg3Vk00S0M2cmpISzUv?=
 =?utf-8?B?Yi9raVpsTnRZZGdRb3JtNjJnTEpESFMwUGxrdXZQRGFrWlltWE5RSEpvRzdt?=
 =?utf-8?B?U0VxMW1lSHIwdVNSd3ZVa0tsL1lxVWlSc0NaemhPRkRrNW5sbVV6QkdpVUth?=
 =?utf-8?B?K29KRFFuWFlhMWVDUmU0R3ZRYkVlRkl2UXUzS3JKeFZOUE1aUkRYNDB3TS9P?=
 =?utf-8?B?SEliM0t1c0RqWjhzZmRyYVRhR3VqcUJheExrclkvWGY4QlVkUGM1OU45R25D?=
 =?utf-8?B?Zm1BVnBOdjVmZUVkRnhxTDhoZ1lycjB2cWtGVVM1ZDMyRXdqWVRyWFdURUw0?=
 =?utf-8?Q?g/LjwztOqa1517egGmr4Ed2zBlBIeLVp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1FObUcreG5EZGdSc2ZDTjZhc3czRDhQRGpiMi9UVFVMd3lzR3pkcVZFRFdz?=
 =?utf-8?B?eWVNZWRpUEhjT3BldVJpOFRYQ1BCdmNYVjZBcHMrQTZHYVBPTXlBd1RSRWZY?=
 =?utf-8?B?VW9vZXBKalNqdFp3cTVkR3lYczd5NzdUeGYzTnhRc0w5V1RieVNhVHBuMjJH?=
 =?utf-8?B?bkZtWGp1MXZ1anBTcnZCL0pOVjVkUjVwcEtnMU14R2t0Y2VIZDkyNGxRUEYy?=
 =?utf-8?B?Y2Y5N1c3MVgyemdGcTV5MUx4cEFTdGJhaFNoY25LL0E3NE9LOWdjTnZyMlR6?=
 =?utf-8?B?dEVCT3JNWkdUc2JTaktucTlYUENDdEU3UXJrVm82d0tORENmNytXR0p4RWVx?=
 =?utf-8?B?Z1ZoVzg3STE4UmhpRnpVY3BjUlJGbG9saFl5RWJ5S2ZBS0pwMmdGRnJYVGZp?=
 =?utf-8?B?L2pKS1hQc2gyY1ZpOWF2V3A4S1EvNWVnYm4rUnlCUCsyemUwOHNvRm43ZVhC?=
 =?utf-8?B?OGNyV2JqeGVUNGIxbUhhMDJSMnhvWmErdnpocmRlWHo5c1pvZkIwU0w5Z1Zv?=
 =?utf-8?B?a2tRczZDSXZ0b2JNNDh1QWVvN2tkY1pYUlNhanN3M2JrUjBaNHMvZEQvVU1W?=
 =?utf-8?B?V0x2Z3M0Ri81KzZ0Z2VqdTdBUjQ2elhySjFvYTNwVXVhWUk1WHkzdVJLVDV1?=
 =?utf-8?B?QitGWVkwczd4T1RGRGZhM2EyZ2t4SUxnSWZ2TjJLMFIzVGVYdXVlRWIrWkgw?=
 =?utf-8?B?VmxHbHBLaDdOaEpremMxbmxnRzRvWUxodEpNTDJvb09nN2tGK1ByNkFXMk9k?=
 =?utf-8?B?TEtsdGs1cTVwZ0MwZEZSbE1qTkFjZExTSzhFUHF5Y1FYczM5ZHRWaE50b3Uw?=
 =?utf-8?B?UDdGQVNrNll5ZHdSU2VwYittTjlwV3VoSVE1K3N6VEVnUHNUWUh0anhidUEy?=
 =?utf-8?B?NHpHSkR6MkN3TnFMWG44QU5WWmxjVWdzU2dYRUJ2NU82dGM0VmRPSk8wbnE0?=
 =?utf-8?B?WHBJQTlQb3Z3akhoOElzaituZDRkQzVTUXBTQ2xxbmhjSlYyN1d5SzNDdEE2?=
 =?utf-8?B?amhUMjlZQ0RWSWlvaTJnd0NPbVBxNStyOU1XTEhZZHNpVHI1OTVuTUFLVjJ5?=
 =?utf-8?B?Tzd1NWZrbmxOdkYwSU4yaDZOc1hBL3JzeHNMTkdWdkxmeTQ5ekVsQUdXOTA3?=
 =?utf-8?B?YStBRDdNN1oxblpVT1RnY0Rqc0krZnplRFM2SkluQTVIT2NRMllKUEpxVVJS?=
 =?utf-8?B?SjdiaFJZNW1IYXZtT0lDbVgvTjRKNWJJV1Z2bFRMakordWlkQzJobHJoME85?=
 =?utf-8?B?NWJoaGg5dmEwYlZUQ1pqemxRdkI3V29oMXQ4Uk9MQi93ZktURzM0VzYreFQv?=
 =?utf-8?B?OXpqYkpMS0ZhVXp4ZTlXejdNK252NHdVVUhpUktMLzlmQUxwUEZlN05DUDlo?=
 =?utf-8?B?c0ZSRHI4SzdmdFpxMUJRRlBrSFBhazlJUHY4ZHUzejFmUjYyUTJEbmFnbUdm?=
 =?utf-8?B?M09DeTNvVm9VZ2dKajhBQkxGMU1DdXpPQisydWMxT1VWR1RGSUFuVGdHSVhC?=
 =?utf-8?B?aThzU3BYOGg0bnI1TWJlaXUzcnlja3hhUlQrU2lsTXM3ekZnaVZ1Z00weCs3?=
 =?utf-8?B?VGkwRkYzSldTWnkvSUhVT01JamcvcTFXNWlHZWgzN2hkNUsxRXR4L21kN2dK?=
 =?utf-8?B?TFJNb212YlFBZ1M5QVVjN0wwVGJWUERnNzdNYk56d1JoKzVHWnpoc0FGakhp?=
 =?utf-8?B?bkhSZkhWdVFxKzdkdEdlUkdFSnhUQkxaU013dnBHUVV3Sjc4TnlVSU1NbmJw?=
 =?utf-8?B?TitrOERNNFFPWkxYSm1meDJxTW10eVdldUU4VVBDblZqZW9uejhWUGY2TjZM?=
 =?utf-8?B?VHY0VE9rYmFvbUV1TzFrczNoOVlOTzRyZjFIeENyeDVpTnU4T2ZSckhtYlVx?=
 =?utf-8?B?N0VUZGUvTXZSWjJFZG9Hc2UrR1dmWWhUTjEvSGh1YXdBRXl3cndXU3dKMDFG?=
 =?utf-8?B?SmNIRFp3YVRXVmxsNEMrdWNJek9IQzVBbTI0QkdzK1E1VUdUckpHQS92NHFQ?=
 =?utf-8?B?bHB6cVlHdTJDT0o3WnNtQUhpMGlLb3FiNU1OdUQzOUFnemplYk5sU0R0dHJI?=
 =?utf-8?B?WGUwUm0ycUE2eng2akt6ZnpyMjh6WlVrcGRmb3VQTXkxblQ4UFhsTXF0K3RH?=
 =?utf-8?B?U08wNVBvUER6MGtqZFBWbG9UM1FUdWdvZU10QUlkV3lGdkZmZXRiWndOdnpY?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 801102ab-46c6-4158-e7b0-08de34389bd3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 19:58:07.3132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nvbckb8kOSsf06tkAjcgn7ebaPmDlm1BdtWP/xk8cRQxrtLznXan9scCD1cTY9A/1HdnSnSJoVaOsNevlQbyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
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



On 2025-12-04 11:09 p.m., Matthew Brost wrote:
> On Fri, Nov 28, 2025 at 04:34:11PM -0500, Zhanjun Dong wrote:
>> On hardware init fail, the hardware might no longer response, add uc stop
>> to clean up. At driver unload, all exec_queue items need to be freeed,
>> change xe_guc_submit_pause_abort to free all contexts.
>>
>> This will fix memory leak issue like:
>> [  189.997904] [drm:drm_mm_takedown] *ERROR* node [00f0f000 + 00007000]: inserted at
>>                  drm_mm_insert_node_in_range+0x2c0/0x510
>>                  __xe_ggtt_insert_bo_at+0x167/0x540 [xe]
>>                  xe_ggtt_insert_bo+0x1a/0x30 [xe]
>>                  __xe_bo_create_locked+0x1f3/0x930 [xe]
>>                  xe_bo_create_pin_map_at_aligned+0x59/0x1f0 [xe]
>>                  xe_bo_create_pin_map_at_novm+0xae/0x140 [xe]
>>                  xe_bo_create_pin_map_novm+0x23/0x40 [xe]
>>                  xe_lrc_create+0x1e4/0x17c0 [xe]
>>                  xe_exec_queue_create+0x38a/0x6a0 [xe]
>>                  xe_gt_record_default_lrcs+0x117/0x8b0 [xe]
>>                  xe_uc_load_hw+0xa2/0x290 [xe]
>>                  xe_gt_init+0x357/0xab0 [xe]
>>                  xe_device_probe+0x403/0xa30 [xe]
>>                  xe_pci_probe+0x39a/0x610 [xe]
>>                  local_pci_probe+0x47/0xb0
>>                  pci_device_probe+0xf3/0x260
>>                  really_probe+0xf1/0x3b0
>>                  __driver_probe_device+0x8c/0x180
>>                  device_driver_attach+0x57/0xd0
>>                  bind_store+0x77/0xd0
>>                  drv_attr_store+0x24/0x50
>>                  sysfs_kf_write+0x4d/0x80
>>                  kernfs_fop_write_iter+0x188/0x240
>>                  vfs_write+0x280/0x540
>>                  ksys_write+0x6f/0xf0
>>                  __x64_sys_write+0x19/0x30
>>                  x64_sys_call+0x2171/0x25a0
>>                  do_syscall_64+0x93/0xb80
>>                  entry_SYSCALL_64_after_hwframe+0x7
>> and:
>> [  189.973775] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: GUC ID manager unclean (1/65535)
>> [  189.981731] xe 0000:00:02.0: [drm] Tile0: GT1: 	total 65535
>> [  189.981733] xe 0000:00:02.0: [drm] Tile0: GT1: 	used 1
>> [  189.981734] xe 0000:00:02.0: [drm] Tile0: GT1: 	range 2..2 (1)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> v9: Rebase and keep xe_guc_submit_pause_abort name unchanged
>> v8: Fix __mutex_lock warning
>> v7: Clear all queue items by guc_submit_fini/xe_guc_submit_pause_abort (Matthew)
>> v6: As huc not involved in vf_uc_load_hw, roll back to guc sanitize
>> v5: Move stop flag set in guc_fini_hw
>>      Change to uc_sanitize in uc init path
>> v4: Add memory leak fix
>>      Switch to xe_uc_stop
>> v3: Switch to xe_guc_stop
>> v2: Switch to xe_guc_ct_stop
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c        | 6 ++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
>>   drivers/gpu/drm/xe/xe_uc.c         | 8 +++++++-
>>   3 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 88376bc2a483..64e5959bfb60 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -662,6 +662,12 @@ static void guc_fini_hw(void *arg)
>>   	struct xe_guc *guc = arg;
>>   	struct xe_gt *gt = guc_to_gt(guc);
>>   
>> +	if (guc->submission_state.initialized) {
> 
> We probably should have a submit layer helper to read this variable.
Will do in next rev.
> 
>> +		xe_guc_reset_prepare(guc);
>> +		xe_guc_stop(guc);
>> +		xe_guc_submit_pause_abort(guc);
>> +	}
>> +
>>   	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
>>   		xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 3ca2558c8c96..a64aa4edc360 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2417,8 +2417,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>>   			continue;
>>   
>>   		xe_sched_submission_start(sched);
>> -		if (exec_queue_killed_or_banned_or_wedged(q))
>> -			xe_guc_exec_queue_trigger_cleanup(q);
>> +		guc_exec_queue_kill(q);
>>   	}
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 157520ea1783..5967b8d9f3cf 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -173,6 +173,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>   	return 0;
>>   
>>   err_out:
>> +	/* Stop guc submission */
>> +	atomic_fetch_or(1, &uc->guc.submission_state.stopped);
> 
> Can we call xe_uc_reset_prepare here?
> 
>> +	xe_uc_stop(uc);
>>   	xe_guc_sanitize(&uc->guc);
> 
> I know this is existing code but probably xe_uc_sanitize here.
> 
>>   	return err;
>>   }
>> @@ -231,7 +234,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   	return 0;
>>   
>>   err_out:
>> -	xe_guc_sanitize(&uc->guc);
>> +	/* Stop guc submission */
>> +	atomic_fetch_or(1, &uc->guc.submission_state.stopped);
> 
> Can we call xe_uc_reset_preparee here?
Yes, will do that in next rev.

Regards,
Zhanjun Dong
> 
> Matt
> 
>> +	xe_uc_stop(uc);
>> +	xe_uc_sanitize(uc);
>>   	return ret;
>>   }
>>   
>> -- 
>> 2.34.1
>>

