Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87A7C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 05:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB2810E00C;
	Mon,  7 Apr 2025 05:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSHa+LU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5F10E00C
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 05:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744004273; x=1775540273;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uaR81ATwPyjNT6gbn8k2Fr7EyNCLZXuoy3etFZZFZc4=;
 b=XSHa+LU9JQ/IkffwNkWsAmn5Cpsn1Fm3b4Z4BA30XtvErQ0xH1XbYAZL
 b2xF/pQtQfzHZeBLtClDfDbM9a18Dp9Q6GJypFMLLB4Licq5y70v6fKIF
 QBzCeLfuTmwIotESF2OOXoFEQ/4GsO1GrPy6IPv6NW+fcn2L0gebN7GOm
 YDTppsydVG7qfIP6rGZYz8g9fn10bowVxbVwKmy56Hhy9T+dtKM/a0seV
 e6TucydWBNHyjsaPOlBFH/HRQUWsPyVryayLL7W70HsjJQJglkMHJ5AhD
 Gpo9jL7D8ZXCEU97RVyC9/lxXgaW56GcOr8e3ATBN61qfLlFRtry03zwa Q==;
X-CSE-ConnectionGUID: Z++fitfESHq6e9Mkc8GaRA==
X-CSE-MsgGUID: ufoJeqU0SLS/P7mSaH7shQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="55557933"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="55557933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:37:52 -0700
X-CSE-ConnectionGUID: IXHxOW67R3G3kxA5j4j2QQ==
X-CSE-MsgGUID: gX4XDLilRVa6UNAAOGL9cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="158823195"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 22:37:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 22:37:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 22:37:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 22:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZBjfFACOMXoAVyhtYZNNv77oOyE3XDdxQZZPLYytl2uThS2urtzYyRUC+0JgYGUfGiE7VoE2LhvuXrPA3nYiy3aa63lKN110OfxoPbvqI3dOarTfuqn6D3amqbMry5OY4lMrvKMpDRitMu3MTa4J5s+y8Dg1d2/bPAHWoNJz/sUxvnkhgPBnoN/IGCIE0c1B6voRVkiyIQekOdlwscsW+VE0ZYY+5YVVcfwqQ5mv1Maqj98ZVUsgHvTZzg54rMyvG5714ahxdIReIjpR9YLQE4bN+z1Ku3R1JUxfD3a55xSI6dw9ba5EjBziA9G/TXWOmKf/lWOAcyZppbnWfx25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG1FxeHhtdSChppGrr3gOhqsU+xsjfXG0Yhb8HVLEZ4=;
 b=x5WAjFTpEhUXYzrrDLqCZ5calpSXo/apuuNtCpOB9Ia9x9seOxOOSKAkpl3lXCpvV3u25prlt6+kAIdr+X/yTifSNXzcYHQanA0W4shb6jvI8yOQ4r+bPG4rYyYDakSg1RkDkjAV5FftAellQYjlaRxe2+/oUhZemBf3d5y2GAAJsjDT40adV4mDuV73ce1whA+L/APO3XQDltvvuooMGrkApgsq6jhWDV3mZv7zOoC5Gi4gEzqDW4qRjzLN1wNvCKO8TOTpxR5Mye3B24YE9G1t+jSbnhpNqjg8VLNeHYXOF3VY+CDrcjOrXUT9lao+WjlP+qaaPw56wE7JHCq5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 05:37:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 05:37:47 +0000
Message-ID: <c1c6d8aa-31e0-4bd0-aaaa-cadbe58b14d0@intel.com>
Date: Mon, 7 Apr 2025 11:07:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Allow scratch page under fault mode for certain
 platform
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250403165328.2438690-1-oak.zeng@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250403165328.2438690-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: a45d43bf-cfb8-403e-6a38-08dd7596541f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTlaSGpudkFjME96RnQ3b3I4cHNKcHREa1ZZd2c0WVNEVkFmaGMxS2pGYlFk?=
 =?utf-8?B?SDBXempvR1pML3NXOEt2aDczeUkvNFZFYjRzYjA3YyswZnZrUmJBd3Ntek5m?=
 =?utf-8?B?MzA5L3RLQktucmVKbmJ4cG9CaEpDeTNkSWJjd3gvaE1KZ3h0OUVNN3h5MGxh?=
 =?utf-8?B?V0NyUVN3bUNPUHc0bklRbFpPditQc3h2NWEzbjlhV00ySnlVTitDV0lLNGZ1?=
 =?utf-8?B?MXhpcy84ZmU4TzJHUk9mbmNSbFd0MmEwcU9haDd3QkMySXdsbWYyY0dOVDNw?=
 =?utf-8?B?aUx2MXd2VllhUXdGUE9oZTdiUXByMTgvemdsUHRVZTJBU3djZFdBemxYSURi?=
 =?utf-8?B?Q1R4MXBGNXVBZmM0SHpZNmlPckxVY01pbmx3QzloQXpzQ1pTekI1VTJoc0Ns?=
 =?utf-8?B?TDM1Vm9kVndkRUNhaEdQbFd6ZFZMaHdZNlpsRHl0WDNnV1lDeXljSXV2Qy9S?=
 =?utf-8?B?WjAxdW5LOTFqVkNXZ1Z3K2lXYXN4UDJ3MHhURFBiNUpPdUg1NjRDOUhBY3Jl?=
 =?utf-8?B?QXl4RkhkdVcwaXhVMTA3d2tHQmpKNVlUSUxPRVNwUmJYdGVmZXI5UDJsUWxD?=
 =?utf-8?B?bk41ZDJtYW01aGZZQnpXd2lmVmE1bDRlSzhUZ21xcUtTdU5jem9mUFhMYjNp?=
 =?utf-8?B?aHFPdStIOVNRaXlqcTFoL2tBbFF1cm05RjE1eDlJczNYQm5LZklIZFZiZkVY?=
 =?utf-8?B?ZW42NjZyaHZtWHVHRGk5WnVJOUxydVRUa2QxK29FNkhvT29EQmJmS0JuU3dm?=
 =?utf-8?B?OWdtK2hKaGh3WHdDYjJoUTVJS3RSMjhGMENId0craDg4TmV5M0NEY3FBZGVh?=
 =?utf-8?B?bnFDcUFyQlJFbnRjOG92RkYvdFJOMDIwTWZEU2h6WW1hVEZZMFZGelNBajc3?=
 =?utf-8?B?Mk10dE9IbTJJVCtoTUNvcVc1MXdUUFU3VkYyV001N1R0MG1oTjVjd0hGNkJs?=
 =?utf-8?B?QmlmcXhXR1ZLaXhTUVZtajRPYmo4Y1ZxWXJ4Sk1sdnVkSlV1MDQ3OVluS3Y0?=
 =?utf-8?B?dzdJM2h5Nlo2SzlIZXMwVEptcU1laS9UQjEwa3dlbjBVaEdvMVhpRHc5NExS?=
 =?utf-8?B?S2pGOFJNNGtMTW51K09nSmthVGg2VmlNZk5naUJ6TU1lNVJhTHNyMUNxYjlq?=
 =?utf-8?B?QzN5QjloYkQxRGpHTzIxUGhnTjMxWXpUQ0htU05zUmRnWDhjM296b083TElH?=
 =?utf-8?B?MVZJTWhWZGo2R05DTlJ2ank2Q0xSc1ZydWFHQzJYWkwvOTVmbmpXdWdobVVu?=
 =?utf-8?B?bkoxWUVLbWR2WEsraU5RSElGMTViR0FQNW9KdmM0T0RIamlIZ2ZTeDlwb2kw?=
 =?utf-8?B?TnR6Vm9LN0xsSHN4czhKc1o5OHhyamVqQXlXTkp0QkZ0dXdsd3dYSXVmVXpn?=
 =?utf-8?B?TUtac28zUnZzd0NKT0ROTE9VcFdEcENQc0twVm83My8wN2RTZElvc2NZeWg1?=
 =?utf-8?B?TFR3N21YR2dXV3Bxc1lJeWtzSHZYbm42dHVVSFVTWmJYY201dDRENTVqNVVs?=
 =?utf-8?B?d2dBMWpobGIzRVBKL0VQSEdqNjdQRHN6c2NML25UaUlrbWE1SXFtRzZKaVFa?=
 =?utf-8?B?NnJ6OWdCM0J1YmIrZmxNRjBvWVMrVk8xYWJUNy8remJtTkRrLzlGazNYcUJY?=
 =?utf-8?B?SFJ1c1VuakpqekdTZUJqc3AzUVdrRVNSNFVnK0tZNnpZem9scGF6cXlFdkUr?=
 =?utf-8?B?M0pVci9yL09VWTlwaFlwSGZ4MUN2eEVXRTlQY0s0ejVvWEVPL3J5R1ZBSWxt?=
 =?utf-8?B?ZFZubHkwR1NuNGdrd21LMGxTVWpBcWNNV0pRTDRXR3kwREsvUTJkelVjd1Ju?=
 =?utf-8?B?Q2pXM1hRRFpNQm1RK1l2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tnhkbkhya1NSKzBOdU1RdFN2MFJUeTgxVkw1T0tzVHF1TU56cEhpZXIyUUFk?=
 =?utf-8?B?OTVpcWF0a0VuWUF5T3RabDZ1NXZLQkRaZ3pRY1UzcXQwMjk0OEJMb0pkY2lS?=
 =?utf-8?B?VTZyQ0xMRDB1VHhzSzZCS1JCcFE4M2RXWllXbmRwVVUzN0Z6UVFHODBhajBT?=
 =?utf-8?B?eVVlMjR1Y1daQmRwelNqby9HaFVOOExDb1YrbEtySEtxeEFua3ZpUVNoMVlT?=
 =?utf-8?B?VmlBZGpMNldoK2hqN00wcGY2V0NZMlg1cldwMU1Rc3RnbVE3YTBmU0lFK3U1?=
 =?utf-8?B?OHpxWGp0RTlDTWpWclVnNjUxMitiNDRSOWQ5dERkUVFNTkptWjZJM0pQNnIx?=
 =?utf-8?B?N2VHenY5MXliSSt1NzduRFcybFVQTFhvcEYvR0FKdXcvZVFibzhVYWhyWDNW?=
 =?utf-8?B?d2FodzhsZVgwN3FSY2s5TmJjWGhOVnZBQm5SOUl3cThqMUU5YXFaZVFNdnVt?=
 =?utf-8?B?bkdUTFhVa0V1SEJMajRYNDlHOUtrbkV3dVVOQ01mRU5XMDNmeC93ajN2Njc0?=
 =?utf-8?B?K01ZNHQ0SGloNDExdTV5QitxNktvNlpodmdHRDViYlV5V0VkV0MyMjZvWWRY?=
 =?utf-8?B?YjZReVo5MVJiR0wwVzBsOGZ4eXJLVkgyb1lLdlhOcmpSM2NHZDhVZFJITUtw?=
 =?utf-8?B?dDEwNnN4c3paaENwZ0t0Q2ZsVXFqdDVEakoydGh4K01aMXFGVUxCQnVCSXpK?=
 =?utf-8?B?SVh3dStkMjBIZUJNWHIzbFQ3SWMxM2pPVXNvWGRCdEtDejFrbDFGcU1WS3Yy?=
 =?utf-8?B?QmlJSUVNMm9KK1ZxWnVXRGhNNmYrZ2tyL1RCWG5McE1xRkc0SmZLMkxHbjly?=
 =?utf-8?B?d1VnL0ZCbERISlljUUtMeEVlVmlyMHJMWDJVVGhtcTZZNDQ0QXo4bzJCeVRa?=
 =?utf-8?B?b3Q3bkhkeXMwVjhobzdselFVUzFCU3pUdFUvYlhwNHEwWTNybERaSmVpNGZm?=
 =?utf-8?B?THU0aU1tMHJXRUtuR0M1TFV0VWRrcVM3WWZkdDJqSzg2Y0lucWZwZnZxRmhD?=
 =?utf-8?B?b2tMM1J2L2ZhVHJuckErdlhsSm9kSVN6b3BRWjJOLzlyL05lUCtoUlpKWXdK?=
 =?utf-8?B?dmg0MGJKbFhyd3NEWS9NOGdrM3Jna1ZPTExrdTVXTm9ZR2ZqakJyeHBVeURB?=
 =?utf-8?B?WW5jb2lCOXMxckFuTlRMS2RvbDhTNWhkOUpuZi93alo3eTNyWmdaNWJXSmMx?=
 =?utf-8?B?d0lyc1huenBRMnRJQUxPanZUeTNUQzNOalo0dXFtTXlxTEg2MDZpNXRuTG1L?=
 =?utf-8?B?dDA2Uk1lOTg1V1EwOWRDUHZYclFDS2hSL2J2NFpERGRjOGhNZGM4bjNZS3BX?=
 =?utf-8?B?eXFETDh4SFdLSmk0aVZNVnVONDMxRUVYb0FLZmRWSHd2ZkNoeFhrd3k2Qy85?=
 =?utf-8?B?aGJndW5VU05hcXJQbWlZbzZFZnZ4S0xKTm9zWWgxZW50Y3V5cy9uMjMrdGRj?=
 =?utf-8?B?NzEyZmsrK1c2cW1xZHN1bTJSN3RJa0UxZ1EwNW9TalJPUldZYVVkdVVlVFNu?=
 =?utf-8?B?NCtNQ1VBSWhUSHZ1c1AyRjkyWFRIalM1TXcrcUJNdDBUd25qaytKR0paOXdX?=
 =?utf-8?B?WlE2VWNPRHgyOWt0cnJEZG9MQXVUVGVXNmNFNWM4THlKaUg4UnFkK01oNVZj?=
 =?utf-8?B?dng5a0QrMFVMZTREamw2MCtHYlM4NUZuajNhMkptTUROcTV0cEUvVVoycFRD?=
 =?utf-8?B?bTQzTkJva1YxMDhrZnpWeU40MXN3azAxZGJBVkg2dUloV0FWZFRNTGJUSFRu?=
 =?utf-8?B?SXVBdUlWWDJVRlFEc1RjTWdlelBBcHBJSFphbndNSEpyc09zYS9ZZjllWWpW?=
 =?utf-8?B?SlJoeWlpeWQvc1FDZlJWSllEZTVKTkFnQ0tsc1RaV2g4L2NNZ29QY0hxYjFJ?=
 =?utf-8?B?SEhmZE5qT0ZzUkJFQ2FLN3dJdWovWTF1Qk9ianZpSGNJMmF4NGwwZ0hGVkxq?=
 =?utf-8?B?VUNuUUIzaGVTVll0STRIU2d4OCtXdWRIZThjMEk3NWsrRG5rcEh4a3hZQzB4?=
 =?utf-8?B?ZUU4eXBTNHNWSzZ4d1RsbDFuMlJCbVhIeDllNjRVNy9pa1lMQnp3Yk92c0F0?=
 =?utf-8?B?Q3RBdzM4MWM0eGFid05BeGJIYUtjNnVPRnJ2alZMUGx6WGp2dmhPRG5Zd1Zo?=
 =?utf-8?B?YjJNeGI2NER4UXFxc2crZVB6WW1oQVhKV1Y5c3lQYlFxVGlYRE9qcWpWVDUr?=
 =?utf-8?Q?OEQD3TvhfZUH6ferOJhtXM8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a45d43bf-cfb8-403e-6a38-08dd7596541f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 05:37:47.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gateGiJz1rvGuPJnuQxX8Vh6IgMV0jafKVxmVcqVYy03J9WXdy2B/94nF4T41cG3EeANh3edU6DY5x85u51WHyNuy1bNwlSkZmUttbq+MPI=
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
> igt test: https://patchwork.freedesktop.org/series/144907/, Test result on
> BMG:

pushed to drm-xe-next.

Thanks for the patches and Reviews.>
> root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> Using IGT_SRANDOM=1738684805 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: scratch-fault
> Subtest scratch-fault: SUCCESS (0.080s)
> 
> Oak Zeng (3):
>    drm/xe: Introduced needs_scratch bit in device descriptor
>    drm/xe: Clear scratch page on vm_bind
>    drm/xe: Allow scratch page under fault mode for certain platform
> 
>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++
>   drivers/gpu/drm/xe/xe_pt.c           | 99 ++++++++++++++++++----------
>   drivers/gpu/drm/xe/xe_vm.c           | 31 +++++++--
>   drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
>   include/uapi/drm/xe_drm.h            |  6 +-
>   6 files changed, 102 insertions(+), 43 deletions(-)
> 

