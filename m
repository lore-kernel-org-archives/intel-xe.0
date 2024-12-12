Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3375DE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 23:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343310E63C;
	Thu, 12 Dec 2024 23:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOPaOLfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32F10E63C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 23:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734047785; x=1765583785;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Ti19p4ySoJ1ntMKmeRxh4lWOMwRaEmOczzjSlQfh0Cg=;
 b=iOPaOLfz8q0aS7PAA3Ei3knUxaAxyZbmxCx/uMRVBjmYw3SnqTTthHkL
 VBYtnDYes+oY/TJkMg2PBXPOfV6VC3NuV+Eu9yWwSGShdMWE1/aiVKPN8
 9Xx6FmSxMdjcjlutGiwXCtGjltk/WOo1bbRbzyx6vkXYAdPGCENp3wkTD
 BrfCm5tasBBuJHhuBj0I2heMo4Cw1vVkMgDgAyMkYrR/PcdAahm/rTYe2
 11rZSXOtxKavUNjbgUVKO2L+SxOUuclo8qIZBQIx5W1TnH3KjQRHWMM9G
 5ASjYuVzdsHjF6KLtH+d5PWLadYI8Kwf0juD82z0Hy9f/WPEzeqWm3tbx g==;
X-CSE-ConnectionGUID: IbKuUAuxREiRozQAXYNkhA==
X-CSE-MsgGUID: KaESHnJLQVK9B+8U2JYvVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34633831"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34633831"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 15:56:25 -0800
X-CSE-ConnectionGUID: +PfC/b3ASZGTUKyqfnoEcQ==
X-CSE-MsgGUID: i8fVWlRwQGqW2YGgYM4YFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127379901"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 15:56:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 15:56:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 15:56:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 15:56:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6jy7iWmNwyLt2I4FgUD3SA5Zwfm6TSIeTJW5mE6JaoCgYjjQsCPIkCnzPHt8yGTuIQ3W8j10HBO6ZqFfvFBs/5Xhrw9QXEsSpW6v6a7zR61wedSYlt0ZHDZpzF6Te5IbE/nJV5XuVrvUTXC5PSfD8aDIsRqDrV1HRojjL2J9eovofTGmQykWECjjoC180AoTJC/KJZXKnVjsHpL/PxbBVOfNe4inHp4skde3DJ3AxTrYBHAEglLwc3GGGufhsDy1BBg2/Wa+rloX5T2EAmVDOR169LZXjaeNdQOrR1frL8wAZZgKitOGlcGUW29CXPr+pfvpF+srnb8TIELhzNPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPehFYoeR49T7P9Dfg+WKbm1W5YkMNKrFPLT64SXWEY=;
 b=ug7Tbp7hyzsIF8Gfd4lvLhVtFMZXev5Jtn3WGnqzyPSqQmNc5pgEPrbXyJPbYkh5L++oEmdTsSCrAqWyBXiy5n2sS8TI+7fZTWyJ68DaYoeqa7X3Kn7xgVu0zebInIq8OBLj+A3JPbSxuJ+d12LNNE08cdPeodO424DYExoUbHPH2m22Q1WSGg9OnKNMVUBSWwMP6q263LIJTTgsq5kqugy6AIRHaKTgWFCWpN9AXlqnWxfL1RJ/5yVtU+xsiiv7ygav51eeHZD3J8GLw5aMYkHfh64fnWn/vj4r7zcAu56lvbXYvdfIA7CkfsNrmZorelVWPn8kAyX9LpHumsdAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 23:56:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 23:56:02 +0000
Date: Thu, 12 Dec 2024 15:56:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH v2 5/8] drm/xe: Add single engine busyness support
Message-ID: <Z1t4EB0GwI3qINhe@orsosgc001>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:303:8f::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: f13f33f4-6f13-48d2-6c3f-08dd1b088877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0hWbVpwR1hMYytQRndxUkJwMmhYTjJNdTV6WitvTWg3RWJCYmpjRTBkQ0My?=
 =?utf-8?B?MExRNnBNWFozVXlpbElYdG40TXBCZytEcXI4eXVBVTNDbmx1bTZyMGViTk5V?=
 =?utf-8?B?ZE5SSGhlWTV5eWYybk4vK0czd3ZCK3dabFluSGZqTS9YTjgzaHppRVpjQStO?=
 =?utf-8?B?VlVDSDNibmxEdldUNTdlYk9KaHljZFgvN0FoOHlVWExQSlkyL1RzdFgwazlm?=
 =?utf-8?B?YU5JTXRmQ1ZzNnY1bVoyemt4L25DUmQyM3pmMVNoYVNCK0VsaG5WdHFRSCtY?=
 =?utf-8?B?akJqalQvR2owck9DaHA3RWZaaHJyQ25QWEtSdis4NW8rcklaYjBaLzBJZmRL?=
 =?utf-8?B?SGpuK2xCV0RyRzdQc2ovRnlDNkIySzBJY083UDBUajR0UExSM2YrQ1A2UE01?=
 =?utf-8?B?UGR3ZjZqM1VuWkRSWnF4KzZod0F3M2lvRlgza0RQQ0U2RGdXYTFFTmV1aEVm?=
 =?utf-8?B?dWljSHlrVStoWkoyNlg2NHp1YzNsOFBDTm9IQTVBWUhaVDdqbnRRcmFYaWVD?=
 =?utf-8?B?c0h0V2gzNy83Nk9lUzlLMEUvVGZzZXAweG1aMUtYQnlFTnZPdXRHWEZZeTJD?=
 =?utf-8?B?U3VuS1ZMdm9yME5VZU9rWTV5TWppS2lBazQwV00yUHJEM2EwcDBZb1ZKRTJX?=
 =?utf-8?B?aUlpMElEN3UwemlmWWorMzJDSnc1M215bHJEMnB0dklGWDZSYVdYQ2xJZmZk?=
 =?utf-8?B?N0VaRjRjNmc0MkxtbEZ3eGNTcDUvY3B5Yk5EWFpPYkxFbFlsVEdJdWZXcGNi?=
 =?utf-8?B?MUhKZ1BnWW5PN1BJWVZQL1RnaVF4VzlDeXdVcGhOcUtvMnFRS3N6NElSY21N?=
 =?utf-8?B?ZW90dG1WbGE2Q0FmU3FGeWRLdERQYzd0SDB6c0l4WllqZ1lKS1RRRUI2SzNj?=
 =?utf-8?B?TzQ4QTcwMlIveS9lOW9WM2cyMStVK1FsblZDcG1EMXJCNVgwUXdLWHdzQzV3?=
 =?utf-8?B?VWUraVY3dDZ1cjRWQnk4M0JsRmU0a0l4RmxIRXVYMXF0OVBzK09rbUtZbEpw?=
 =?utf-8?B?c05PWFB3RFI3cjdzMkdvb1FmTi9NMkF1dDVNMHJLM1FZWm1JUnhpRkpIMVNo?=
 =?utf-8?B?RGVNZ3EzSUc1N1ZIbS9GNHk2UUt6S2FITmpMRjNIUWZBOEl4dDUxUlJXQ21L?=
 =?utf-8?B?Q1daWVNyaS9sZVFDVkcrUmVlRjZpZGRCdjhJa0tEaGVlZzN4dGdiL1JZL1Nq?=
 =?utf-8?B?MjFTdnVJSXRCSlVBSk96ajRxRVNabk9ZQnVqTVMrNmxpQ2l0MmFaclhadlNB?=
 =?utf-8?B?MjRYblJtNlhnamg0b0kyczI4NWZLV0tSbzZsQU5WSmFJQnVIVXpZcmJvci9N?=
 =?utf-8?B?cGNkSGY5cSsyc1BLcVpGeXJ0a09IVmV5VE5sRE1rYlRydHp2cjFSeFc2WVNn?=
 =?utf-8?B?ODJsNDNYMnhrYUhERmlhYmJMWFJKRkJEZ2xyL3dJWGpUbkVKL3NMNGQwT3ZL?=
 =?utf-8?B?ekQ1c3V4T2VaWU1CZ1M3ODcxcTJ1TTROaWtGUnZUOFVmUVZDTFp2ZmYwYk90?=
 =?utf-8?B?bmpzUnhPWW05OGZGT3cxTWYvVGo5ejYxR3dJQXlQQmQzN3BVT280RjNvbjFW?=
 =?utf-8?B?enNNa2sybXhkNnRpTCtGQ29EZVNZVVl3a2l3OGN1NWZnM0RWT2VBYWtOOGYy?=
 =?utf-8?B?TklIeThvOCtuMHNsTEI1NDNmaDlFbW9IUkZzQWphb08wTlhSMmJLaTY5NVFH?=
 =?utf-8?B?UWVJK3ZDM2c2d0NiMkxlUklzOW9FelV1MDJKOGt5SkhlQmZLdnBtamp3L2Z4?=
 =?utf-8?B?ajhiQ2tpMTFzelh1anRuZllNallhSmcyelEycXhXcUVkSGFwRVpLZWU4RG02?=
 =?utf-8?Q?FGtDTYfWCD845JL8c372m6a2YWa5kQyDPtXYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTgrclNyNzFCS3ZIRjJVM3FCWk4yM2NsS0Y4UGoxUG5SeXY2aTcva0hwY2Zk?=
 =?utf-8?B?bVdKQU54aEdkeFVja2YxUW9iek1tVDZNNUJvUmFPT2t0ODR1KzBPZGtWY3R6?=
 =?utf-8?B?bk54elNLM294UW5JVXJQUEthbXlVZnRnVjBhaFNTa1U1S3BDZFVibnRveE9B?=
 =?utf-8?B?bTlBWk9KdmR1ckpwSnJEbHg1SEFRMUVmUlpjKzJyckJ1OUpteTA4T1lIa1hW?=
 =?utf-8?B?akw3YVp4eHV5RHY0STZPVU5wYkZuK0ExU0FsazlnN3E2bStyb2VvZTcvTTZE?=
 =?utf-8?B?RitHaUxmaktzbFA5UTB1NS80WFd4aUdwTHJiSGM4NGdiMWE2V3BJZHZISFZ5?=
 =?utf-8?B?OHVmTWZGcDBqbUhDRVYxYkRROFhyVG04bkZKVnE0WXFoM29SaUp6L1doVy9H?=
 =?utf-8?B?MEUvVnBrQkdOWlY2QW91ZmE3LzZjOGpJaEF4SVJZK1NTUmptZ2xZVUNKQWFW?=
 =?utf-8?B?VXA4LzdaWVl1ZTRsbW5mYUVkMkZWOStFc3dqOWdSV1RtWndycmVtRkRpL1VP?=
 =?utf-8?B?Z3A5NVFodUNIbVlsejdGWkxrbTlSemt2RDdSM3dBVVdRVGdNd3F6d3k1cVN3?=
 =?utf-8?B?bXF4NHFCL21GZkdoTTJ2SkxWWUtXcytDbEFqcDJPMEJUbkViNERxUzBqbUpt?=
 =?utf-8?B?VjJzQVEvMU9UaFN5SUVCZzZnNmthaHFzczhGamZjblo4anpOSitlbU1KTXFZ?=
 =?utf-8?B?NWRscXAvK1FFYzNsU3NLYUIySTV6dDRvVUhxbE1Wd2ZZT1d6Zy91RzdXYnQr?=
 =?utf-8?B?SUJ2RlFYbjVtNytQYkY3VlJtTE1yS090ZzJvQ3Nsd1ZveEdyT3BjWjFmenFo?=
 =?utf-8?B?cFMzTFE0ajlBcjlUeWNoWEF1Z3orTEJWUmMyamc3ZGJremxLQk9CcGhkZ0Vr?=
 =?utf-8?B?RzNnMlMzd1BWRjlUUEpXNFVNcXZ2eVZ3Y3R5QmlHb2JHNFBLamRuYjJBem4w?=
 =?utf-8?B?ZTI2MFB2TEYwRTFiVCtsRHRKUEw0bzM0ODRQL3RzM2F1M0haYzlwVjA3RGRW?=
 =?utf-8?B?eVQ1ZktCMmN6WlZVdHFhYkFuZEV6YUNlRFBkRnRLTDIycmdRNzJwWXp0YWVh?=
 =?utf-8?B?RE5OQWh0MHZNZ3lXeGQ5YmJ3NjV6dURLSm5KZUhPZDdkTXpXR0ZuT0pHbUZW?=
 =?utf-8?B?dWo4N3I0VlF1bHpLdDdaMS9MNU5XN3hqRXM4d2o0WWtUeFFGSkdyZmRrSUxQ?=
 =?utf-8?B?cGlKTVQzcnhJeUJNTFFoQVpHMWlXbnM4SXREcFZSdjNZSElXbGl1bWM3bzdR?=
 =?utf-8?B?UlJWaVI5NVdKK25QL0h5d09QcmZsMnBEcXZaTFNNeHV0MG12Y1E0czFJRTQ2?=
 =?utf-8?B?ZkljQTNqMi9VNGw2aElsYlJDVE05bTRKNU8xeThHQnE4YmZzR05zMFNBRHhX?=
 =?utf-8?B?OUdKb2lXeURwQWkrb1NrR0gxM0hTc0ZIdDJsRTdjUEpGNkppU082bXBzbFdl?=
 =?utf-8?B?SDlINFNTV1pNNEphQ3p0WDlRYkhrRmFLZ1MyK3pvMXlRS0Vla1g5Lzg0MVFh?=
 =?utf-8?B?NE9LWHkyNm9VU0FWeXRHTWZpdjBJSk1ITXJTc0MyYU91VjY3R2lJc0YzSkdZ?=
 =?utf-8?B?ZXBDcE9ZNGdqdzdwbTExdk9wMHExSGRQYm5IVnpTWU5ta0htb2h3WTRwWHhY?=
 =?utf-8?B?RUJ5aWNkb0lXU2x0Vm9CZTZsYVlCclA3YlZnMXVnVkdwQ25idnZHOTFqRUZG?=
 =?utf-8?B?M1AyUkk4a1RnSGVCMHArUDBtTUlhWWxXT2VUYXpTSkNDYndMdUVDVEF2UUVV?=
 =?utf-8?B?dzhnYkxQU3gyaUxWMnphMkNvSWdhZzMrQ09DWkFqZkw2cTR0VEZqa1Vpdm1M?=
 =?utf-8?B?RnYvTVJIMzhlSGNYTVA4eXU5S3prYk9nUXlrdWtDRlM1cUdBeTlZT3paTFRP?=
 =?utf-8?B?VnhpaWc5UVFKRkZqNFJudWV6MllNWFM1TkxTQ0xyYUkra0trZGhxUkE5OHgz?=
 =?utf-8?B?UEVpaVJYUkRCMWxKWUdZWWhhVnArdG9TcTlHTllSZkhNY2NpUFI5c2lBWGNt?=
 =?utf-8?B?aUV1SzdIcmNTaC9hY1MrbjR1ZUtEUGFjL0Foa25CWVErY1pkdE1oYXdoTGVJ?=
 =?utf-8?B?TXkzbDdqNHV1VlVwN3lEZ3RwSldYbElKODVLRkZCZEY4cy9FbXpqbnZxRG8r?=
 =?utf-8?B?MG9LZ0RBMlNZSXFDUENaZ3VOU09tWTNRNDNXeTBNT1JoRjlmMmRZWmU4S1NM?=
 =?utf-8?Q?JFhl+1ib5O83XDfm4je/Z7w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f33f4-6f13-48d2-6c3f-08dd1b088877
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 23:56:02.1461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etK0q4dhtDhLjuZPx574LZ5DUVF3tjgrucTgNLhylRPnDmEeYBBmF9Ox1qPRvwDA+daIzWk/6SIuXSnKcdpl/e+IxEdFo4xh8QKVzyNk7l4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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

On Wed, Dec 11, 2024 at 04:44:17PM -0800, Umesh Nerlige Ramappa wrote:
On Thu, Nov 21, 2024 at 12:09:01PM +0530, Riana Tauro wrote:
>GuC provides support to read engine active counters to calculate the
>engine utilization. KMD exposes two counters via the PMU interface to
>calculate engine busyness
>
>Engine Active Ticks(<engine>-busy-ticks-gt<n>) - number of active ticks
>						 for engine
>Total Ticks (<engine>-total-ticks-gt<n>) - total ticks GT has been active
>
>Busyness percentage can be calculated as below
>busyness % = (engine active ticks/total ticks) * 100.
>
>v2: fix cosmetic review comments
>   add forcewake for gpm_ts (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
>drivers/gpu/drm/xe/Makefile                   |   1 +
>drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>drivers/gpu/drm/xe/xe_engine_activity.c       | 323 ++++++++++++++++++
>drivers/gpu/drm/xe/xe_engine_activity.h       |  18 +
>drivers/gpu/drm/xe/xe_engine_activity_types.h |  85 +++++
>drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>8 files changed, 453 insertions(+)
>create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
>create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
>create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index c231ecaf86b8..32473c609824 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>	xe_device_sysfs.o \
>	xe_dma_buf.o \
>	xe_drm_client.o \
>+	xe_engine_activity.o \
>	xe_exec.o \
>	xe_execlist.o \
>	xe_exec_queue.o \
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index b54fe40fc5a9..3a7834f7e421 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -138,6 +138,7 @@ enum xe_guc_action {
>	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>+	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 0c9e4b2fafab..7a7283262673 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -355,6 +355,8 @@
>#define   RENDER_AWAKE_STATUS			REG_BIT(1)
>#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>
>+#define MISC_STATUS_0				XE_REG(0xa500)
>+
>#define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>#define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>#define FORCEWAKE_GSC				XE_REG(0xa618)
>diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
>new file mode 100644
>index 000000000000..464cb09933b5
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
>@@ -0,0 +1,323 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+#include "xe_engine_activity.h"
>+
>+#include "abi/guc_actions_abi.h"
>+#include "regs/xe_gt_regs.h"
>+
>+#include "xe_bo.h"
>+#include "xe_force_wake.h"
>+#include "xe_gt_printk.h"
>+#include "xe_guc.h"
>+#include "xe_guc_ct.h"
>+#include "xe_hw_engine.h"
>+#include "xe_map.h"
>+#include "xe_mmio.h"
>+
>+#define TOTAL_QUANTA 0x8000
>+
>+static struct xe_guc *engine_busy_to_guc(struct xe_engine_activity *engine_busy)
>+{
>+	return container_of(engine_busy, struct xe_guc, engine_busy);
>+}
>+
>+static struct iosys_map *activity_to_map(struct activity_buffer *buffer)
>+{
>+	return &buffer->activity->vmap;
>+}
>+
>+static struct iosys_map *metadata_to_map(struct activity_buffer *buffer)
>+{
>+	return &buffer->metadata->vmap;
>+}
>+
>+static int allocate_activity_group(struct xe_engine_activity *engine_busy)
>+{
>+	u32 num_activity_group = 1;
>+
>+	engine_busy->ag =  kmalloc_array(num_activity_group,
>+					 sizeof(struct activity_group),
>+					 GFP_KERNEL);
>+
>+	if (!engine_busy->ag)
>+		return -ENOMEM;
>+
>+	memset(engine_busy->ag, 0, num_activity_group * sizeof(struct activity_group));
>+	engine_busy->num_activity_group = num_activity_group;
>+
>+	return 0;
>+}
>+
>+static int allocate_activity_buffers(struct xe_engine_activity *engine_busy)
>+{
>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>+	u32 size = sizeof(struct guc_engine_activity_data);
>+	struct xe_guc *guc = engine_busy_to_guc(engine_busy);
>+	struct activity_buffer *ab = &engine_busy->device_buffer;
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_bo *bo, *metadata_bo;
>+
>+	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>+						   XE_BO_FLAG_SYSTEM |
>+						   XE_BO_FLAG_GGTT |
>+						   XE_BO_FLAG_GGTT_INVALIDATE);
>+	if (IS_ERR(metadata_bo))
>+		return PTR_ERR(metadata_bo);
>+
>+	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>+					  XE_BO_FLAG_GGTT |
>+					  XE_BO_FLAG_GGTT_INVALIDATE);
>+
>+	if (IS_ERR(bo))
>+		return PTR_ERR(bo);
>+
>+	ab->metadata = metadata_bo;
>+	ab->activity = bo;
>+	return 0;
>+}
>+
>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>+{
>+	struct xe_guc *guc = &hwe->gt->uc.guc;
>+	struct activity_group *ag = &guc->engine_busy.ag[0];
>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>+
>+	return &ag->engine[guc_class][hwe->logical_instance];
>+}
>+
>+static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>+{
>+	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>+}
>+
>+#define read_engine_activity_record(xe_, map_, field_) \
>+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>+
>+#define read_metadata_record(xe_, buffers_, field_) \
>+	xe_map_rd_field(xe_, metadata_to_map(buffers_), \
>+			0, struct guc_engine_activity_metadata, field_)
>+
>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+{
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct guc_engine_activity *cached_activity = &ea->activity;
>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
>+	struct activity_buffer *device_buffer = &engine_busy->device_buffer;
>+	struct xe_device *xe =  guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+
>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>+	size_t offset = offsetof(struct guc_engine_activity_data,
>+				 engine_activity[guc_class][hwe->logical_instance]);
>+	struct iosys_map engine_activity_map = IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>+								     offset);
>+	u32 last_update_tick, global_change_num;
>+	u64 active_ticks, gpm_ts;
>+	unsigned int fw_ref;
>+	u16 change_num;
>+
>+	global_change_num = read_metadata_record(xe, device_buffer, global_change_num);
>+
>+	/* GuC has not initialized activity data yet, return 0 */
>+	if (!global_change_num)
>+		goto update;
>+
>+	if (global_change_num == cached_metadata->global_change_num)
>+		goto update;
>+	else
>+		cached_metadata->global_change_num = global_change_num;
>+
>+	change_num = read_engine_activity_record(xe, &engine_activity_map, change_num);
>+
>+	if (!change_num || change_num == cached_activity->change_num)
>+		goto update;
>+
>+	/* read engine activity values */
>+	last_update_tick = read_engine_activity_record(xe, &engine_activity_map, last_update_tick);
>+	active_ticks = read_engine_activity_record(xe, &engine_activity_map, active_ticks);
>+
>+	/* activity calculations */
>+	ea->running = !!last_update_tick;
>+	ea->total += active_ticks - cached_activity->active_ticks;
>+	ea->active = 0;
>+
>+	/* cache the counter */
>+	cached_activity->change_num = change_num;
>+	cached_activity->last_update_tick = last_update_tick;
>+	cached_activity->active_ticks = active_ticks;
>+
>+update:
>+	if (ea->running) {
>+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+		if (fw_ref) {
>+			gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>+				 engine_busy->gpm_timestamp_shift;
>+			ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>+			xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+		}
>+	}
>+
>+	return ea->total + ea->active;
>+}
>+
>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>+{
>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>+	struct guc_engine_activity *cached_activity = &ea->activity;
>+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
>+	struct activity_buffer *device_buffer = &engine_busy->device_buffer;
>+	struct xe_device *xe =  guc_to_xe(guc);
>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>+	size_t offset = offsetof(struct guc_engine_activity_data,
>+				 engine_activity[guc_class][hwe->logical_instance]);
>+	struct iosys_map engine_activity_map = IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
>+								     offset);
>+
>+	ktime_t now, cpu_delta;
>+	u64 numerator;
>+	u16 quanta_ratio;
>+
>+	if (!cached_metadata->guc_tsc_frequency_hz)
>+		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe,
>+									     device_buffer,
>+									     guc_tsc_frequency_hz);
>+
>+	quanta_ratio = read_engine_activity_record(xe, &engine_activity_map, quanta_ratio);
>+	cached_activity->quanta_ratio = quanta_ratio;
>+
>+	/* Total ticks calculations */
>+	now = ktime_get();
>+	cpu_delta = now - ea->last_cpu_ts;
>+	ea->last_cpu_ts = now;
>+	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>+	ea->quanta_ns += numerator / TOTAL_QUANTA;
>+	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>+	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>+
>+	return ea->quanta;
>+}
>+
>+static int enable_engine_activity_stats(struct xe_guc *guc)
>+{
>+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
>+	struct activity_buffer *buffer = &engine_busy->device_buffer;
>+	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata);
>+	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity);
>+	int len = 0;
>+	u32 action[5];
>+
>+	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>+	action[len++] = metadata_ggtt_addr;
>+	action[len++] = 0;
>+	action[len++] = ggtt_addr;
>+	action[len++] = 0;
>+
>+	/* Blocking here to ensure the buffers are ready before reading them */
>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>+}
>+
>+static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>+{
>+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
>+	struct activity_group *ag = engine_busy->ag;
>+	int i, j;
>+
>+	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>+		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>+			ag->engine[i][j].last_cpu_ts = ktime_get();
>+}
>+
>+static u32 gpm_timestamp_shift(struct xe_gt *gt)
>+{
>+	u32 reg;
>+
>+	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>+
>+	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>+}
>+
>+/**
>+ * xe_engine_activity_get_active_ticks - Get engine active ticks
>+ * @hwe: The hw_engine object
>+ *
>+ * Return: accumulated ticks @hwe was busy since engine stats were enabled.
>+ */
>+u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
>+{
>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>+
>+	return get_engine_active_ticks(guc, hwe);
>+}
>+
>+/**
>+ * xe_engine_activity_get_total_ticks - Get engine total ticks
>+ * @hwe: The hw_engine object
>+ *
>+ * Return: accumulated quanta of ticks allocated for the engine
>+ */
>+u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
>+{
>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>+
>+	return get_engine_total_ticks(guc, hwe);
>+}
>+
>+/**
>+ * xe_engine_activity_enable_stats - Enable engine activity stats
>+ * @guc: The GuC object
>+ *
>+ * Enable engine activity stats and set initial timestamps
>+ */
>+void xe_engine_activity_enable_stats(struct xe_guc *guc)
>+{
>+	int ret;
>+
>+	ret = enable_engine_activity_stats(guc);
>+	if (ret)
>+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>+	else
>+		engine_activity_set_cpu_ts(guc);
>+}
>+
>+static void engine_activity_fini(void *arg)
>+{
>+	struct xe_engine_activity *engine_busy = arg;
>+
>+	kfree(engine_busy->ag);
>+}
>+
>+/**
>+ * xe_engine_activity_init - Initialize the engine activity data
>+ * @guc: The GuC object
>+ *
>+ * Return: 0 on success, negative error code otherwise.
>+ */
>+int xe_engine_activity_init(struct xe_guc *guc)
>+{
>+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	int ret;
>+
>+	ret = allocate_activity_group(engine_busy);
>+	if (ret) {
>+		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>+		return ret;
>+	}
>+
>+	ret = allocate_activity_buffers(engine_busy);
>+	if (ret) {
>+		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>+		kfree(engine_busy->ag);
>+		return ret;
>+	}
>+
>+	engine_busy->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>+
>+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini, engine_busy);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_engine_activity.h b/drivers/gpu/drm/xe/xe_engine_activity.h
>new file mode 100644
>index 000000000000..d44ac3366bd0
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_engine_activity.h
>@@ -0,0 +1,18 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef _XE_ENGINE_ACTIVITY_H_
>+#define _XE_ENGINE_ACTIVITY_H_
>+
>+#include <linux/types.h>
>+
>+struct xe_hw_engine;
>+struct xe_guc;
>+
>+int xe_engine_activity_init(struct xe_guc *guc);
>+void xe_engine_activity_enable_stats(struct xe_guc *guc);
>+u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe);
>+u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe);
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_engine_activity_types.h b/drivers/gpu/drm/xe/xe_engine_activity_types.h
>new file mode 100644
>index 000000000000..cad83aed3d0b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_engine_activity_types.h
>@@ -0,0 +1,85 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef _XE_ENGINE_ACTIVITY_TYPES_H_
>+#define _XE_ENGINE_ACTIVITY_TYPES_H_
>+
>+#include <linux/types.h>
>+
>+#include "xe_guc_fwif.h"
>+/**
>+ * struct engine_activity - Engine specific activity data
>+ *
>+ * Contains engine specific activity data and snapshot of the
>+ * structures from GuC
>+ */
>+struct engine_activity {
>+	/** @active: current activity */
>+	u64 active;
>+
>+	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>+	u64 last_cpu_ts;
>+
>+	/** @quanta: total quanta used on HW */
>+	u64 quanta;
>+
>+	/** @quanta_ns: total quanta_ns used on HW */
>+	u64 quanta_ns;
>+
>+	/**
>+	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>+	 * per the quanta_ratio. This remainder is used in subsequent
>+	 * quanta calculations.
>+	 */
>+	u64 quanta_remainder_ns;
>+
>+	/** @total: total engine activity */
>+	u64 total;
>+
>+	/** @running: true if engine is running some work */
>+	bool running;
>+
>+	/** @metadata: snapshot of engine activity metadata */
>+	struct guc_engine_activity_metadata metadata;
>+
>+	/** @activity: snapshot of engine activity counter */
>+	struct guc_engine_activity activity;
>+};
>+
>+/**
>+ * struct activity_group - Busyness data for all engines
>+ */
>+struct activity_group {
>+	/** @engine: engine specific activity data */
>+	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>+};
>+
>+/**
>+ * struct activity_buffer - Activity buffers
>+ *
>+ * This contains the buffers allocated for metadata and activity data
>+ */
>+struct activity_buffer {
>+	/* @activity: object allocated to hold activity data */
>+	struct xe_bo *activity;

nit: When comments are added, IMO, spaces between the members make it 
more readable.

>+	/* @metadata: object allocated to hold activity metadata */

Please use /**. I see a mix in this header. I think the /** is for 
kernel doc.

>+	struct xe_bo *metadata;
>+};
>+
>+/**
>+ * struct xe_engine_activity - Data used by engine activity implementation
>+ */
>+struct xe_engine_activity {
>+	/* @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>+	u32 gpm_timestamp_shift;
>+	/** num_activity_group: number of activity groups */
>+	int num_activity_group;
>+	/** @ag: holds the device level busyness data */
>+	struct activity_group *ag;
>+	/* @device_buffer: activity buffer object for global activity */
>+	struct activity_buffer device_buffer;
>+};
>+#endif
>+
>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>index 057153f89b30..8b336c15ef5b 100644
>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>@@ -208,6 +208,25 @@ struct guc_engine_usage {
>	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>} __packed;
>
>+/* Engine usage stats - v3 */
>+struct guc_engine_activity {
>+	u16 change_num;
>+	u16 quanta_ratio;
>+	u32 last_update_tick;
>+	u64 active_ticks;
>+} __packed;
>+
>+struct guc_engine_activity_data {
>+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>+} __packed;
>+
>+struct guc_engine_activity_metadata {
>+	u32 guc_tsc_frequency_hz;
>+	u32 lag_latency_usec;
>+	u32 global_change_num;
>+	u32 reserved;
>+} __packed;
>+
>/* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>enum xe_guc_recv_message {
>	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>index fa75f57bf5da..3a89bfb18307 100644
>--- a/drivers/gpu/drm/xe/xe_guc_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_types.h
>@@ -10,6 +10,7 @@
>#include <linux/xarray.h>
>
>#include "regs/xe_reg_defs.h"
>+#include "xe_engine_activity_types.h"
>#include "xe_guc_ads_types.h"
>#include "xe_guc_ct_types.h"
>#include "xe_guc_fwif.h"
>@@ -90,6 +91,9 @@ struct xe_guc {
>	/** @relay: GuC Relay Communication used in SR-IOV */
>	struct xe_guc_relay relay;
>
>+	/** @engine_busy: Device specific engine busyness */
>+	struct xe_engine_activity engine_busy;

nit: Maybe we can do away with using busy/busyness in the Xe 
implementation.  Use 'activity' everywhere. Thoughts?

Rest looks good. With kernel doc format fixed, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>+
>	/**
>	 * @notify_reg: Register which is written to notify GuC of H2G messages
>	 */
>-- 
>2.40.0
>
