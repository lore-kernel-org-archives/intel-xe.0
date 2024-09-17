Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0729CAC58A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 15:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED9010E49A;
	Tue, 17 Sep 2024 15:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inB/ITCM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193610E49A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726588361; x=1758124361;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/w29CFTKhNlb6dHSFqPwsjCS6gjqbW2299i9iz1PBCY=;
 b=inB/ITCMg4aW7EoFIsh+1Csm0AWqEPA6WicR05U3VYlCfBo4w/wGXf2E
 UZ15eUw8rdU0+JbEMK5ATjemuhuQ1WmRMYBvTWPwDhK8TpQDMlwllND7M
 CyPQ+WuPFifjiAWlYXUGdmSr23x+xHeEg26ARZwCVj9p9MPcAzHYQAcUk
 57ljp926LY0Q5ghkLaciD+lI09koXXLqUz1mQ8cyw5ziBuX/lO1rsPXzI
 vb5GdfYyluu/PNE1XdwiAuHSVdYSll6G9CBChu0ZrsUATZL4380vv/C/W
 Q+mzZGR6sXqTf8vXSm/7vjK/kf9MKv1YAfxO6xfRKosqJXnvYgX26OLd2 A==;
X-CSE-ConnectionGUID: gQ1BksFiT9e3DaIqxhOk3g==
X-CSE-MsgGUID: lbn5Gl8eSWyPikb994Q6zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13558228"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13558228"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 08:52:40 -0700
X-CSE-ConnectionGUID: wzU0RKCYQyeEyn7um79u6Q==
X-CSE-MsgGUID: wE/33JCJS5mX0J7skaGdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73332412"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 08:52:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 08:52:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 08:52:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 08:52:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 08:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBK1wPGQW7aPsoyPOYIsdF0D/obmTiqTkx6ILvnqZcxe/dbypOMJ+/sT9Xxj3enQ3+gD4jdxVQv3wyFl3hNP9l73YtBE9O5i7mneTzMXVl03IvkvFfZxq4UuiCoENpJ2xPO715/qCTRlNlVPH8SmRjiG51VFms5bKH1Hj0Z+rZ1c5hy/ppgJvz4U+uizO1wmbgPHkyUs/MzMwbiDxIeCAw9eoP5dk0DUr3vMMJv6+ohnf1lw7Frzx9sQZQq5JO+qJ06rRlchPbI+4kPOq0Lo/JTuBqr4H/U+gQlM59BxTU/28WkInJC47nhiaA8XI2rdOPt76wPfyEmlvZQf4fpcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIgJ3hbdq/mXmT/KOMS4p1o+76JluyxYgAjYhzBvVRw=;
 b=tGx0ah22uESd3wFg7hPmYPwQiikvlZAmPKsoLCW73hckA8RlofOjpUAHlMC76t6OmD2O+RVgB7ZmPTpINi8xJaO2nyQI7BTMZ+AhGjrsOWzY49TvNwm2SbuZEuASdfMxdZN5doUPva2zdO3nuMHSzuEGwZJv3ykY5eeRXtHyQRIxx5UasL6hrVO1VvPLq0H342vOEQmsOs3zGYOpep57viYgvqlNjfHXxcNGw4OPqjLWXX5pK0fzMia2rwKZotlPgymcC3EEts5XmpBwfg7M0avv5uOBcOLgNyiYAGb8If1LLesae66Pm6I3HzzwDgQfpeLHIsmuKoOwd/tUIxgFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 15:52:24 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.7982.012; Tue, 17 Sep 2024
 15:52:24 +0000
Message-ID: <71cc5553-9232-4c4e-970a-8e0dd17fc828@intel.com>
Date: Tue, 17 Sep 2024 11:52:21 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Add?=
 =?UTF-8?Q?_GuC_based_register_capture_for_error_capture_=28rev21=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20240912230913.381482-1-zhanjun.dong@intel.com>
 <172625393816.997912.4939749842744161403@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172625393816.997912.4939749842744161403@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4759:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de1840e-cde3-4970-ead6-08dcd730b916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1dZVUdrQXBJUWlhcGZOeGFTeUxWRWluR0cwSC9wUDQwaFQrdTVBYTc2bC9q?=
 =?utf-8?B?MUV5My9RdjI1TGFnM1dIN3VsalFIT1Y1dm94NnNYdi9HczNDb3FDdVlhRGg4?=
 =?utf-8?B?WnlyMFFhU0VpNXdUZnRBR3RHUytDa2ExSGYzYnIxcVZpTHJOamtRbWFMK3JO?=
 =?utf-8?B?eHpieTU2dkN1YWdIamlxUVB1Y2xZSHVLaDFBVitEUU9LWnpiSStvL3FBNkJs?=
 =?utf-8?B?MHdjd1JtNXpsMmRpOXVEUHFKMEJUdkJiUTNBSWgxbnFtVmxDL25IOFhWMnND?=
 =?utf-8?B?ck96MGtmMCtsRWpuN0ZTdkFIaFhnbkplYmE2SVNNcGVWb0IyRHVuQ1lPQXBu?=
 =?utf-8?B?dXV3dDFsaDhvYitja2ozYWY0SFBvMnFQb1hLWk42U1FjTDYvK3Q4aFdrb24y?=
 =?utf-8?B?ZEt3Qm5oQnBkSTE5NVJXa0cxZWxZMnM3eUVQUkJDMlgxbHBZZFRGRzRrKzRa?=
 =?utf-8?B?V21FVlB0NDJLODJwZFpENE85SlJNUkZRVkY1OFVKSEhOdDQ5Wm0zWFkzRHdO?=
 =?utf-8?B?NmYzUnBua1FaSTJlTHRCMlFBT1RRRFFySlcxZjJEWTZBVG4yUVFaNWxNYmUy?=
 =?utf-8?B?a0pKcHRmQW9QTjduOGpFV2Q2L3J6RXJhMEtyUDNHcjhQci9GcUdzcGJyOFBI?=
 =?utf-8?B?QVQxUzJ1Z05aaDNqU05pTUxYbDQ3Q3h5ZzJjNXRXMEpEM1dCdFllUWNHVWRz?=
 =?utf-8?B?cTF5ZmVwbXZmU095WEp0Skx1R2hGdFQ2K2tieVRHQ05xUzJ0N3BPbFUzR090?=
 =?utf-8?B?bFlLYi82bzRtTjFyU0lTQ212bjRLVGtVMWl3REwwZXZrUE9VZC9KYUc2WDNi?=
 =?utf-8?B?TU0vWVpNYzdIZEhLRFZWRjFRbU02QitLWC9xRmFHVWgrSWFENkFBUVlSTzg4?=
 =?utf-8?B?NHJZS3JoYysvR0FoSGlGK3R1V1hSNjVka09UYnU0bUkyM1BxaEpMRDYwOERP?=
 =?utf-8?B?Rm94ckRhWjZOMHNQMGpLaDNBN2IrQ0RrWlNzZFMwNlRJaEVFZFZGd28xTkp0?=
 =?utf-8?B?dnJtbGVialFxbXZCVlFIclJPV0ZIK0U1QjI5OFRJK0pSbk1zWWtVM1NVYktR?=
 =?utf-8?B?VHZLWkpRM3Rvb1JOWmZmanlZT0hGbk5mSXZQV2Z0dmd0T1RsTGtsYUZNR0NE?=
 =?utf-8?B?YTBqSmVQbGJqYmRSZzlkUHh6UmdkTUROTFpWZHVJeDF6bzN6UjJCN1VzRlpv?=
 =?utf-8?B?UTY5c2xMQTMyK3BaWFQwdmgva2NCYXZaWVNVQ3NrdS85M0RPUVVmNnZoUzNz?=
 =?utf-8?B?bUFNOTZLRHhEbitleWtWUzZPMTJPdThyOU5xaVQ0dHFpZkdlcDhQcDZGbzA4?=
 =?utf-8?B?aVJkWjVrbzQwM2NpeGJCUERMb01OUFQzSGczOXVFd2FxbzRLL0Mwem9sWnYv?=
 =?utf-8?B?M0swVDZNemVsdUhnRWZqSlBkaU85dENlM2Yyd1grRldmYmFnbGxmOEFGVmZs?=
 =?utf-8?B?WTJqSU9OVW0rMjNJcHAxMm1DSGF2SnZqWnBjb1lXK2wySmgxRGkwako2QnMv?=
 =?utf-8?B?UklueXNMWUNzSHlrdS9JS3k0ckdnS2dwMGRUVEdaTS95NDRCaXhnWk1Bam9O?=
 =?utf-8?B?VFllM3V2cWw1TVZDcHpUcnlzaG9mWFBXNEtoc3RLRzk2NWRMSUxiK3dHaXJP?=
 =?utf-8?B?SVFnZk0yMFdra0NvVGF5QlpCZG0vYms5QXdJM293RHIwTk9Yd2tBdUJsOWpS?=
 =?utf-8?B?a29tRTUvSk01V1RxTlRWd3RqSCtIQ0RNbGJQckF1NzBMUzEwT3RER2xMWTlz?=
 =?utf-8?Q?MZfY5Nz0qDHWCLzEYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTgvUkVpZUtkcStHSmJTeTlwZVFmd1VQS1draGc4R0k4bGNISU9qaHFML3NQ?=
 =?utf-8?B?czlxbzExV0tEV24wT3ZpOVduWk10V2UvYUIxNE9ud3Yxd0Q3Q3JYeHBWL2xO?=
 =?utf-8?B?Z0ZWc0dEK1R5V2xramc1b0lwRzA0Y1RQYU5BbWFTbXVWVVhmeVpSR2JtdkFm?=
 =?utf-8?B?cHhISmVpays0Q1lJaEp5c0FaS1RJV1FCNnY3SXRoTHlqMGpKNmNLd2ZXOWNC?=
 =?utf-8?B?ZG1MR25QVXIxS3NRTVBQaVZMeU9walFxbGV4SlNqbHBSdWc2cVA3ZjBzRW9U?=
 =?utf-8?B?aTZzMmJQUkVqWE5QMWRrenNCZ1M3cXMvWHVxd0Q3THpidUl4UFYrWHd3cUdY?=
 =?utf-8?B?Zm16eU8wa1BVU0ttaGMyd1plRVFYeVJ2VGsxSGpKUVA4VnZCMk0vanZHL0Uy?=
 =?utf-8?B?cmNrdUg1OERCbkIzRkdtVVRjQm9UTXJaaUZ2TEw1Vk8yd1ZTZzRCaDlKM0Jl?=
 =?utf-8?B?dTlOZXd5Z1RNYlU3WDFyVHZOSzFvdDQ3d29wUk8yZGY5L0ltRU5rRnVsOFpN?=
 =?utf-8?B?WnYxTFVOVnA2dVY1dFdxMk5UaGRXN254L1R2KzhxREY4bTRvV3ZvTTBOM1lO?=
 =?utf-8?B?ZTZGeVQ0dnA5Sjg4dTc2S0UweXBYTjQ4VElsblpQdG51eUlUaUJ2NzhoeUpQ?=
 =?utf-8?B?Tk5MSWpxazI3TnoxUElsc1pJTkF1UnBzaFpLODJRVjFQRkFtYWVmYjhiZmpD?=
 =?utf-8?B?MFlHVWUyVWxwUkU3Rks0TXd0alJSM1NPYWZvamFhemU3aDA3S05wWVZqaUty?=
 =?utf-8?B?YzVsQmJlT3FJRHRwVnUwMWsxSm41Q0RFOFcwK0N6aGQ3TTJkNjg2NXdobWdU?=
 =?utf-8?B?NG82UUFOK3AvL1Z0eEJONUlyQlZ4SVR6STZTQjJwTWozRmlRN1JtREd6WE5W?=
 =?utf-8?B?Y1N2UnNQL0wzR2JUWTlORjliQ0tTTG5aYjR4VFVnRnlJNkh1SEIrelFTL0dB?=
 =?utf-8?B?RTJ6ZldMMkVzS1VvNlg1Q1pxZ2RiYllDb2Y5ems2UEtBSGJqV3hEOUMxQkNy?=
 =?utf-8?B?N0hsNFNydUJ1SGh2Y09Zc21XZHhMbXdBVGIrRjViLzBkeGZPcWljYXY4NjFL?=
 =?utf-8?B?UTNZZEh3Z2NOaGJOZUxaZkgreHd5REpnd0dGZ1ZsWUFEYzQycFF3UlQxczMw?=
 =?utf-8?B?T2hiZGg5cEdJUE5WUHdWWUYvZUdpenIzR3JvYktQS2JzWUo5QkVyY3VyemFJ?=
 =?utf-8?B?SlVYcm9FOWxNc0VjRU5pMUxTSFVhVjQ0eGwxbjFwMUNHQnorTEtaS3BmcmRa?=
 =?utf-8?B?MHZBVDhRTU10Mm9MS0QwU3ZlNHZDa051ekdYRWlZTkhKZmxDREdzZ0xYVHRq?=
 =?utf-8?B?R1I5aXd0eXJmdTZuZmFZbjkwb2x1RE9jZHhvSWpyL2JrUzB4S0oxa1lwMDFN?=
 =?utf-8?B?ZmcxSlUzdVFMN1laV2dhNVVpNHZJYm1SQWo3N25JQnBMcjFwSDB1MXp6dzBP?=
 =?utf-8?B?NUFVUDc1eVVXMTRDNEZrN3JUWUhlaTZLVjZrYzN5TFk4QzdzOGcydDBGRy9B?=
 =?utf-8?B?ZGZBeEZqTXFaRGFGMzlYS2pwK0V5d24wZlpzR2JrZjNxb2dvLzVXRnMzTVJ5?=
 =?utf-8?B?YXRGNWRlWTNTT2xMazNISzZocjVIYkx3ZVBXKzRwNEJScDBMQ09vQVJjT1Nq?=
 =?utf-8?B?RmNSTXdtMUd5RUxBdjFxTFErZW9PMzloUnRKQ1hybUZlQ2hzM1Q3YjBTS1lu?=
 =?utf-8?B?VkdPbm93YnpSZTBNS3dNL0NRQ1p3WWszbk83NWZqaUJibWxmNGhuTHRtVlJl?=
 =?utf-8?B?NDVKZGRUNXdhSmFtdnNwakhBWWNlaWVoZ1J1L3p6Q25Ra1BUbDhyMjc4OVJt?=
 =?utf-8?B?NExMb0kwWndpVDB2MWY4RUFVZElpTHl1QjlqV3RudElQcjJFV2Q3Y2lpaDJ3?=
 =?utf-8?B?MTB6bkxHQXVEcDVhb2NVaUgxZzAvNElIcnNhbWtMMGIxSEpZSndKc0pRT21F?=
 =?utf-8?B?SE9JTHR2Q0ljenE2Z1l4b1B0OGcyVVZLZ0t1WVpDWVUwVTRRaEMrTXJwanJG?=
 =?utf-8?B?Y0c1ci9kbnRjcE5COGkwM3BzS21SS2dDRFRmTkN1VFZzaS96SnVQa1NFRUhB?=
 =?utf-8?B?LzdZRzdjUjhLYXc1dzFFKzZxcjdYU3F3Nnpqd1E3aHRYcGp1ZGZGQWZScEpt?=
 =?utf-8?B?OThUeXZ6alRZVzN2U1RTTDZ5cVRWdWsxUDNFUm1Gam0zRzRXT2JZL25YN2p3?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de1840e-cde3-4970-ead6-08dcd730b916
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 15:52:24.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMavAPTgGJSXhi2Hr6y3fnKygQ5PeV3P5DEVZy8TdyLNjStZf6gx/cpPBbzCqDzSM1uIkOegOit6Ps8/Nrnl+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
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

The reason caused test failed is not related to this series.
It is a pre-existing condition of missing NULL pointer check.
I will post another patch for the fix.

Regards,
Zhanjun Dong

On 2024-09-13 2:58 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Add GuC based register capture for error capture 
> (rev21)
> *URL:*	https://patchwork.freedesktop.org/series/128077/ 
> <https://patchwork.freedesktop.org/series/128077/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328_BAT ->
>   xe-pw-128077v21_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-128077v21_BAT absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-128077v21_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-128077v21_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>       o bat-lnl-2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +1 other test abort
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-128077v21_BAT that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Possible fixes
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>       o bat-lnl-1: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> +1 other test pass
> 
> 
>     Build changes
> 
>   * IGT: IGT_8016 -> IGT_8017
>   * Linux: xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328 ->
>     xe-pw-128077v21
> 
> IGT_8016: 786f0469afc0665a02dd82bf17544868188fbdeb @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8017: 8017
> xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328: 
> df3eecb1fa97d6d35569c2fa39f0da78b9f13328
> xe-pw-128077v21: 128077v21
> 
