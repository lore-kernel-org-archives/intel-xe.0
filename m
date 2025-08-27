Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD543CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47410E17B;
	Wed, 27 Aug 2025 20:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfmgdczc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA5910E17B
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756327518; x=1787863518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZH7DGgD7LnbK+P9S8/sP9P+goyVZsgXoTricyuh2Q3M=;
 b=cfmgdczcaUeHIjXMruuaCfD1oqE9eUYuZ/Wqb0Ow6IC5vra/6MvACNPq
 1Gc6tomEeO2F6WdDgIBwRWJv8GGkA+/uOw7B2a8KOpEc9KP128HBvZMvm
 xM/uwgynxvLC3WTlOCHv7xt2i1r8yTMS/nFYoCIC3x7uW1gIa3lNETTNa
 XARhvP6KywFrVeNT5e0wn+PyQS2fzj+r1jw2NzO9gg73HWjGtarWZqehy
 uZyn7CzsgORc0bCGtk3GWZmCIYCvyHHAtLXAT2iGcQ53M7zQKrKypEHl3
 z7HTjKyIJ8EK9049THGioAZ2UohG6eLNWYNlzxPWkDVD6X3SNXhbor4PW w==;
X-CSE-ConnectionGUID: 8i5wEvx7SI6wc8EP9WZA0A==
X-CSE-MsgGUID: KKEOyAi3QQ++VXSSzlHf9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58656453"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58656453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:45:18 -0700
X-CSE-ConnectionGUID: FfC0r8HsRmy2sWTBJ9JBGA==
X-CSE-MsgGUID: MYVIe/z5RUOlx6pJwVkn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175199630"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:45:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:45:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 13:45:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYFsMkYAzMKWL49umtGVn+spL9pvz2DEzw0rYSjocPwZT5KnXhSe0QNxc3nxdD+9fOw+nRU/ZGx+rLdqcYSEmQqyObiJ6II77SclF1aMiglivhmeambIalTyKKucXITPqbGzitvDeQu/tfR0xs3BoGJ+OBylZAGJp+M1GWzY0k0HSEbq/PtAKWGPZGNMsoXo+B7xQhm+8sGFbMpNlvr2eukyvalnozslGN8WbZqMQ0el4D7Eu42u2JnJK3fFnj41TPMZFx2FwEWDP8ysOBvlvd8fK0rgv48yYyvm3EkcLC5Yc2pTaz4rWf7wRlCl+uNg1OmNJ8VYLh9UM+caSQ8vOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSJqWVsu/vi3SGboIdSrAOOiXuDRNQ13XGguDDYTgUA=;
 b=Z3Jjm8k5D12j4lI2YiMODLShS6YN5vS62VnRXuvP9mZD3ddJeLkwEd3Sl8yef0C8rM/wcwbF8wPwlTlyXWX9Acwx+vX5jDX80j2IgoC6F89VpXEG8hH9PAIkAUHxFHJ32774A+OreHmIa+30JHJEOHpDNuBFfGmc4rXCmeucY5b8nqD9C5ovZLjbQdmyULNKhnU/ZQFXcayfRF2ls2xuC4SW0FL9G40dkxGuyMNNQS0cN3FwJo1WmslQW6shPx7qMehe7E6+ay5wFpWFJdP5YlhW+NMH6bYKkIciJfh58iTsVB1YqKsJYvLZYKTj86Vnq/0gx6YPrQsmIlTPz4yeWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 20:45:09 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 20:45:09 +0000
Message-ID: <e13f5f25-3edd-4194-8385-6def780258d1@intel.com>
Date: Wed, 27 Aug 2025 22:45:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe: Track LR jobs in DRM scheduler pending list
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-4-matthew.brost@intel.com>
 <862c6172-3308-4a69-baa2-fe984a082269@intel.com>
 <aK9YpUTSSZenQnxO@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aK9YpUTSSZenQnxO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MW5PR11MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: bc860758-6c83-4a71-562c-08dde5aa9c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y29URUFOdkFNOEplRTcwVTdWODNYRjFkQzBaWGtHZFB3VmFnTVQya2ZaWFdo?=
 =?utf-8?B?VFpMRDNicnZ2bGpudWVCUGlmeVZwZUxCQmwzbXVWdHpQMER2dkRTdmtnYVBR?=
 =?utf-8?B?RGJ1RnY2YnhXVVRaZHN3eWI2dk1qdHAwWGptb0diWHMrY0djMkNaUGhuajhB?=
 =?utf-8?B?ZFhEc0Y5ZGVneGttNURyY0kwaExJaEZYdWs3dEo3MkRwbzIrRjk4TGk2M0VP?=
 =?utf-8?B?MHhmcE4wTzlsZFJuaENSQVZDQlFmUTVNTGxkYUxJd1hFZSt4VE1PU1hobHIv?=
 =?utf-8?B?ekFqQmhBeis5Y25meitBd0VzZVk5R21mSjBwK2VoR1lCY244a0ZnWEtobURk?=
 =?utf-8?B?d2Vuak9nVXExVnU4OVdGY2dxQTBaSjkxbWZxVk9tZDlCM1F0RFVRV3RBOERT?=
 =?utf-8?B?VlFEMWVPbHZhNTh1SXU3VEQ4K29ScStuSXBGSFBPanU3cFEzRzdrT2FNTEtW?=
 =?utf-8?B?ZGtoU01UZy84QXMvZE9yQm51ZXZkbTR2ei8xUzNoUUlyektpYVUvbE5pVUw0?=
 =?utf-8?B?MUFHL2xxUk5nTGpvN1c2a2dFRDF4TkV1NkJkUEoxeVI1N29UQUJ5VGtVa3c4?=
 =?utf-8?B?RUg1WWIwR0p0NzVVRDlvKzd3WVNLcGNWVHNseXpuZUhZTzR1d0lINjdTRXN3?=
 =?utf-8?B?Nitoc1N0VENlVUVrYTRiM0hsYVZZWTdvbCtjaTFiNU44M2c3L3E0ZzZFd0RI?=
 =?utf-8?B?RE5sMU9Kd1ZWWFRkUEtHQ0x4cnFYSWhUUGR4eG92RUpUN2NMdkxqdzIzcURy?=
 =?utf-8?B?VE0vNlNPWUR6YjRzdTdvTVBwRVBvZTlWZGR5dGxHT0tMNUk4T2E0cVdWTkVm?=
 =?utf-8?B?ZUl2QmkycmFaekVXOVU4SVBhUUw3cUFlZ1ovbHUwN1NSRVVMNVpLNHd0T2E4?=
 =?utf-8?B?TXQwRVFlb1plMlFRcXZDTGdhS0RkOFd1dkk5VEFSS28wVzRsakVBdHFOWWdy?=
 =?utf-8?B?RVRSSU5tZXpHZkZORzYzSDd1VG0ySXlmMnJVUTdsdk1XMGlQSEUyREVwRFpY?=
 =?utf-8?B?Z2Zzc1ZjQWg2QjVUM00rWnZPdis0U3NjUXppc0gxNzNtcnBHM0Nma0NPYTh5?=
 =?utf-8?B?WnljSW9DMFo4OUZwUlFkWEtTcjcvZXdJem1lekNDV2xtU0R2M0h0TVhnNWw4?=
 =?utf-8?B?YXVCTU1LcUFKemt2akI2Vm9LNGd4MjFUOW9vQnp6RjNjUzd3aEZlQ3daTVFo?=
 =?utf-8?B?TCtzUXEydmhnUVBzYWgyZTZLYi9hZE1oU1IvQ0M0VVVtWUFzNmpjSlZpQzAx?=
 =?utf-8?B?ejRGellzb0VLSmRIYVpUd0Q1RGtHekFwNUsrR0VORndUeVRDZFVxVGI0Unly?=
 =?utf-8?B?bEpab05YUEp1cWhkRFZ0cmtOWWxCSytwQTRMNHJiM3ZqS3QzZ1hkSlliUUhJ?=
 =?utf-8?B?T2hVQnQzVnpQYnZSeHhBQVhPVndhTnNVNVFNaUFVQ0pYNWJlb21QM0RlRnBk?=
 =?utf-8?B?R0g2VitEdTFFNTQ0MWVXNUVBZDI5OUY3Zm84aEY4azdYWGVVUzFQV09NMEFT?=
 =?utf-8?B?aWs5bml0WHpBNm9GU2QwTkFlazlJSFU0L3ZtUlNMZi9ZMEZJVzd1UHlJMXpD?=
 =?utf-8?B?NkRHUUNLazhQNXJYbTU5Rm91YmpHeXY1MUFJMlEyYy94OFQyMDkxUkFhTkRY?=
 =?utf-8?B?dFJITkZvUDhJd0FTVDJhWDlnbFE0Ti9PaWlJaWtFc21MR0NyZ2QwWElGWW8x?=
 =?utf-8?B?NlJ4b0VhNXZOOWN2Nk43WTh2dFlMaG1pUTliWG16QnVDajVoNUl3NFM0OVlB?=
 =?utf-8?B?M2xwczZsTHY3dngwcWwycGxpRm5GZjUxOU53Q0ZVb2F3eUoxcExBUVlMUEFs?=
 =?utf-8?B?N3BYdzJjNkcyZXRLcEdnMEZ5TFZTcllVMHhQU094eDlRbE9nSlcyM3BqODZL?=
 =?utf-8?B?bmxFVlBRMDBTRTdQWkpsK3BrY0o2SC9iTTlGa08rMHhCTmF5UlFjSllsWStu?=
 =?utf-8?Q?Cl4kBF0Gv3Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG10NWFkY2FpU0hWWFlwMyt1bG05SlpzUlYxWktJYUIyWUVQdStBZU0xbC93?=
 =?utf-8?B?L2tRcERFTk8zRmo2M3ZjQjFiSHF1ZWo2NDRlSHZPdDNLZk9vT0pIWldwUEY5?=
 =?utf-8?B?UnNORlMzY2ZCOUE0QTR6SnJSR2pROUpWN0RjWlY4RCtYTWM2b2dTUjFZVlds?=
 =?utf-8?B?Y29CU0tKMjM2UnF0eXNaUUVLLzVDNjcrbjN4Vll0b0MvVE5aVm5GRkdqUFpm?=
 =?utf-8?B?UzhYdHBCOXh1M3AwNDJNajlxU1hNSC9pUFNLWnEzSFBxMEpMUys0elB4eGps?=
 =?utf-8?B?MEJsc1VVampzUHNTOXhsMkJGT2o1Y3EyOEpJSzdlUmY4VXlQSEdQRDZ0eXl3?=
 =?utf-8?B?LzZWWXBnS3llVkt6aG5ucmJPVHNwa1FVY0lqMXhWcWxOcmhrSUFwd3RRVUJV?=
 =?utf-8?B?cFdMb1Q3Z1hVOVlETzFHYUhBYmU3SXhXUGtXbm4rRDc5U1ZxNFlnNlNTaCsz?=
 =?utf-8?B?dllxdkhJS2I3M25DYk5MUmFReFlibEowQnZFNXZtTE1zekxLNWF5b2JHTmNV?=
 =?utf-8?B?N2JhSWpaaFlxN3Q4dkxlS25HdUl6QTN3aUR1TWl5YUJHY1QvMTZlZUYvc0p3?=
 =?utf-8?B?UjR3dmd2dU9OL3ZNdG9KdGEvbWRmbmI0VXFpNU5ldzRReGFJNm9lc01aZG4y?=
 =?utf-8?B?MGFCTDJoNVZ6UnZRK2k2R3BqY0d5QlFUL0pNWE1zMkZQeGdjUkpsRlQzcWd6?=
 =?utf-8?B?VTJMMU95Y01JSGRYUDlZSmRIWUpUZDgrMTJOTGlHRU1GTE01dW00OWl1UHE1?=
 =?utf-8?B?aks1cW4rd2k4NGF5dVlNUVZBU0hQc1ljZVBXUkdwTzZ0MXJ1QVd4SVVGSG9l?=
 =?utf-8?B?TWozR1hiNlgwM2pzWFI4aXdOZGdEWStRYVRkL0hqQUNPT3VGeEEvNy9tVDhx?=
 =?utf-8?B?Q2xGeUh1cDBTZGJxeHQ3WERvR1ZGM1ZjOGtUNWl3SDZFc0dVN0N5LzZnZ2Fn?=
 =?utf-8?B?c08wYVk2Z3RiYmg3R0ltYmZEUG1ka2ZBUnNmZC9SSXYwU1J4YXJZY0t4ZDFu?=
 =?utf-8?B?MmxnSndYNGdvZ3B1b0JpUGtGb3M1T1Jvc2REb0NlN0xJNlFqclhqQUMvS2R2?=
 =?utf-8?B?a0dhdThnRjh2ZWNHbEZ6N1M4RGYrRVorMUxUVEk1M01IUG1VeUs3QXV3KzlG?=
 =?utf-8?B?VlpWeWNRRWx0TDYxYng5NkM3S3lkTzNnaEptZ2dGcUNsamFHQkNRbWJ2MVRz?=
 =?utf-8?B?bFUvalhKa0p1Yy9UYjFiRlBjdmVlNGttdjgvZG5pRWtlUE9haWI0dzJyRFFW?=
 =?utf-8?B?bEJFZjBpNjZCdmdjUXJia1FVRjlVQWZMWGVJU29NSVhDb0tlTkRWN2NLcXEx?=
 =?utf-8?B?d0dYMzR4eFpQakxDb0hWdElNY25tMGJ0c2drNm82Y3Q4eWVVQVBtK2kzd3Ex?=
 =?utf-8?B?eVNjdXkzZGRVTCtJNVB3Snh6ekMzRGk3Mi9XNXoxRXpSSzlNbE1hYnIwQmx3?=
 =?utf-8?B?UmtoY0tUNDI4dGFVNmhsUzJTMmkyNG4zRUhQWm9JcUhlMEs1bWRSVGI2WnAr?=
 =?utf-8?B?Y1ZucWd3Si9LeHZhRU10UmluNzJiS0ZJRHdiMFhIQ1Y5MVRMMFpINFhmbmw1?=
 =?utf-8?B?b0huM3NBVkI5UE13dnBwQWFuaEJpQ1h1N0RDemRtSytoUjgxUTU1VjVOTVRl?=
 =?utf-8?B?SUVSMjUxZk4xMitiaTNvMGxkKzhDQkxZQStzaHJWM1k5QmRxYitoVis5YkVC?=
 =?utf-8?B?WGdRU3A1SG9VcjNBQWdySlpxS2Z0VTQ4MnNUbTFUM0d6bElhWEw3K2c2bHdQ?=
 =?utf-8?B?R3Q5c0FJQWl2WUFKRkhvSGVjWmZyTkhGZkNWRE5Od1VWZk9QSDJKWTZNU2R1?=
 =?utf-8?B?ejMwd3NScnB1bjRWOHdEdnpDUWJjcHM0Uy9ESXI4Qjd6b1lKNG5hMzI3VmF2?=
 =?utf-8?B?NE1PYXhqdDREWjM2QTFwYVJON3dROUZjUmdsOERpSnlmbVdvZGUvejgwTFVN?=
 =?utf-8?B?N1lUMURaTll3ZTZuL0VDQ0xOdFZmeU1jNzk0Q1JOVlh1am12RlNpUks0djZU?=
 =?utf-8?B?OCtLalFKMmJpelRoSGhXTHdEbmgzbG11NzM0RG9oT0NyWHBoeVVFdTRqbnFt?=
 =?utf-8?B?VnJ4QmMrc1hXaGxNVmQ5cXIyaWd4c0M2VmtYekhWeUZBS2dEZTc2SEtSZlFX?=
 =?utf-8?Q?zvWN4b6PnPRKiwEXvryAIheud?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc860758-6c83-4a71-562c-08dde5aa9c87
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:45:09.2172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irfuEBQzs9Xgt1h11T11aJhc5k5FbqrZVodhBXXjw/Q18xEplVmr32Ami9hSmSoBqg/Fhme1Afe/kbijogUkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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


On 8/27/2025 9:12 PM, Matthew Brost wrote:
> On Wed, Aug 27, 2025 at 04:46:58PM +0200, Lis, Tomasz wrote:
>> On 8/18/2025 7:22 PM, Matthew Brost wrote:
>>> VF resume
>> VF migration
>>
> Yes.
>
>>>    requires jobs to remain pending so they can be replayed after
>>> the VF comes back. Previously, LR job fences were intentionally signaled
>>> immediately after submission to avoid the risk of exporting them, as
>>> these fences do not naturally signal in a timely manner and could break
>>> dma-fence contracts. A side effect of this approach was that LR jobs
>>> were never added to the DRM scheduler’s pending list, preventing them
>>> from being tracked for later resubmission.
>>>
>>> We now avoid signaling LR job fences and ensure they are never exported;
>>> Xe already guards against exporting these internal fences. With that
>>> guarantee in place, we can safely track LR jobs in the scheduler’s
>>> pending list so they are eligible for resubmission during VF resume
>> VF restore / VF post-migration recovery
> Yes.
>
>>>    (and
>>> similar recovery paths).
>>>
>>> An added benefit is that LR queues now gain the DRM scheduler’s built-in
>>> flow control over ring usage rather than rejecting new jobs in the exec
>>> IOCTL if the ring is full.
>>>
>>> v2:
>>>    - Ensure DRM scheduler TDR doesn't run for LR jobs
>>>    - Stack variable for killed_or_banned_or_wedged
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_exec.c       | 12 ++-------
>>>    drivers/gpu/drm/xe/xe_exec_queue.c | 19 -------------
>>>    drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 43 ++++++++++++++++++++----------
>>>    4 files changed, 31 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>>> index 44364c042ad7..b29b6edd59e0 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>> @@ -117,7 +117,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>    	u32 i, num_syncs, num_ufence = 0;
>>>    	struct xe_sched_job *job;
>>>    	struct xe_vm *vm;
>>> -	bool write_locked, skip_retry = false;
>>> +	bool write_locked;
>>>    	ktime_t end = 0;
>>>    	int err = 0;
>>>    	struct xe_hw_engine_group *group;
>>> @@ -256,12 +256,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>    		goto err_exec;
>>>    	}
>>> -	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
>>> -		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
>>> -		skip_retry = true;
>>> -		goto err_exec;
>>> -	}
>>> -
>>>    	if (xe_exec_queue_uses_pxp(q)) {
>>>    		err = xe_vm_validate_protected(q->vm);
>>>    		if (err)
>>> @@ -318,8 +312,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>    		xe_sched_job_init_user_fence(job, &syncs[i]);
>>>    	}
>>> -	if (xe_exec_queue_is_lr(q))
>>> -		q->ring_ops->emit_job(job);
>>>    	if (!xe_vm_in_lr_mode(vm))
>>>    		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
>>>    	xe_sched_job_push(job);
>>> @@ -344,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>    	drm_exec_fini(exec);
>>>    err_unlock_list:
>>>    	up_read(&vm->lock);
>>> -	if (err == -EAGAIN && !skip_retry)
>>> +	if (err == -EAGAIN)
>>>    		goto retry;
>>>    err_hw_exec_mode:
>>>    	if (mode == EXEC_MODE_DMA_FENCE)
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 2d10a53f701d..6f901139e06e 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -816,25 +816,6 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
>>>    		!(q->flags & EXEC_QUEUE_FLAG_VM);
>>>    }
>>> -static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
>>> -{
>>> -	return q->lrc[0]->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc[0]) - 1;
>>> -}
>>> -
>>> -/**
>>> - * xe_exec_queue_ring_full() - Whether an exec_queue's ring is full
>>> - * @q: The exec_queue
>>> - *
>>> - * Return: True if the exec_queue's ring is full, false otherwise.
>>> - */
>>> -bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
>>> -{
>>> -	struct xe_lrc *lrc = q->lrc[0];
>>> -	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
>>> -
>>> -	return xe_exec_queue_num_job_inflight(q) >= max_job;
>>> -}
>>> -
>>>    /**
>>>     * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
>>>     * @q: The exec_queue
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> index 15ec852e7f7e..6ae11a1c7404 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> @@ -64,8 +64,6 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>>>    bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>> -bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
>>> -
>>>    bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>>>    void xe_exec_queue_kill(struct xe_exec_queue *q);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 9e4118126ef9..69ed3c159d10 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -837,30 +837,31 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>>    	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>>>    	struct xe_exec_queue *q = job->q;
>>>    	struct xe_guc *guc = exec_queue_to_guc(q);
>>> -	struct dma_fence *fence = NULL;
>>> -	bool lr = xe_exec_queue_is_lr(q);
>>> +	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
>>> +		exec_queue_killed_or_banned_or_wedged(q);
>>>    	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>>>    		     exec_queue_banned(q) || exec_queue_suspended(q));
>>>    	trace_xe_sched_job_run(job);
>>> -	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>>> +	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>>>    		if (!exec_queue_registered(q))
>>>    			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>>> -		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>>> -			q->ring_ops->emit_job(job);
>>> +		q->ring_ops->emit_job(job);
>>>    		submit_exec_queue(q);
>>>    	}
>>> -	if (lr) {
>>> -		xe_sched_job_set_error(job, -EOPNOTSUPP);
>>> -		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
>>> -	} else {
>>> -		fence = job->fence;
>>> -	}
>>> +	/*
>>> +	 * We don't care about job-fence ordering in LR VMs because these fences
>>> +	 * are never exported; they are used solely to keep jobs on the pending
>>> +	 * list. Once a queue enters an error state, there's no need to track
>>> +	 * them.
>>> +	 */
>>> +	if (killed_or_banned_or_wedged && lr)
>>> +		xe_sched_job_set_error(job, -ECANCELED);
>>> -	return fence;
>>> +	return job->fence;
>>>    }
>>>    /**
>>> @@ -926,7 +927,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>>    		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
>>>    		xe_sched_submission_start(sched);
>>>    		xe_gt_reset_async(q->gt);
>>> -		xe_sched_tdr_queue_imm(sched);
>>> +		if (!xe_exec_queue_is_lr(q))
>>> +			xe_sched_tdr_queue_imm(sched);
>>>    		return;
>>>    	}
>>> @@ -1018,6 +1020,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>>    	struct xe_exec_queue *q = ge->q;
>>>    	struct xe_guc *guc = exec_queue_to_guc(q);
>>>    	struct xe_gpu_scheduler *sched = &ge->sched;
>>> +	struct xe_sched_job *job;
>>>    	bool wedged = false;
>>>    	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>>> @@ -1068,7 +1071,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>>    	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>>>    		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>>> +	xe_hw_fence_irq_stop(q->fence_irq);
>>> +
>>>    	xe_sched_submission_start(sched);
>>> +
>>> +	spin_lock(&sched->base.job_list_lock);
>>> +	list_for_each_entry(job, &sched->base.pending_list, drm.list)
>>> +		xe_sched_job_set_error(job, -ECANCELED);
>>> +	spin_unlock(&sched->base.job_list_lock);
>>> +
>>> +	xe_hw_fence_irq_start(q->fence_irq);
>>>    }
>>>    #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
>>> @@ -1139,7 +1151,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
>>>    		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>>>    		set_exec_queue_banned(q);
>>>    		xe_gt_reset_async(q->gt);
>>> -		xe_sched_tdr_queue_imm(&q->guc->sched);
>>> +		if (!xe_exec_queue_is_lr(q))
>>> +			xe_sched_tdr_queue_imm(&q->guc->sched);
>>>    	}
>>>    }
>>> @@ -1197,6 +1210,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    	int i = 0;
>>>    	bool wedged = false, skip_timeout_check;
>> Maybe a comment here would make sense? ie:
>>
>> /* Timeouting a LR job could signal its dma_fence after contracted max wait
>> time */
>>
> That's not exactly right. LR jobs have there own cleanup worker. I'd
> like to drop that in a follow up patch but that is a bit of a larger
> rework so left it out of this patch.

Fair enough, as transitional thing it doesn't need a comment.

-Tomasz

>
> Matt
>
>> The code itself, LGTM.
>>
>> -Tomasz
>>
>>> +	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
>>> +
>>>    	/*
>>>    	 * TDR has fired before free job worker. Common if exec queue
>>>    	 * immediately closed after last fence signaled. Add back to pending
