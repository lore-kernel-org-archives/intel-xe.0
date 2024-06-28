Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0CFC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 23:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F96110E317;
	Fri, 28 Jun 2024 23:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y962ZI8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6410E317
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 23:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719615651; x=1751151651;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ot6Dj/6fI26i/JYrnBVEGVB1lL2fUwec15LzLwHh8x8=;
 b=Y962ZI8DaY5E3bw/UG7aTn5R8mOMVc7M3shohdWJuScxXBmc5M4HXsbL
 vSQWR7076y6FmilQ6yAFpZsmk5pNza4Bo7Kwx0YY4//zMi4IvM+DevcfV
 itLZrM+F5IjgIgE8nA5nge8piiEqqav+7jtazxfeys180GEMM2wyhno7l
 hXNJzbyojH3r2zuCfwH5zNvxkOR1Hvc6SkNHww3syNu72bWG/3lJh7M7d
 KCQjGYJ8zqa3QlJtnDxcc4U1hAPeyz3sxxVsbyR6p5wN32/nrdoEJsMjk
 qOgxSaddUcLCnvVwdzBlvadaLP4IKRjP45F0GReVDVxFfdUMg6irs1GR8 g==;
X-CSE-ConnectionGUID: Ui10ukcTSLK2LKfjPBzZRQ==
X-CSE-MsgGUID: OQaanbJwRS+fAp8AkEjb7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="12310490"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="12310490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 16:00:51 -0700
X-CSE-ConnectionGUID: fBXfsMXsTqSLK3BA6fiSAg==
X-CSE-MsgGUID: lBq2CA7dQECrxcPTUqVpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="76062874"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 16:00:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 16:00:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 16:00:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 16:00:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 16:00:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epIIJqgEjU5RDj3Jk4566frJHfq3tlz3rULZAecdcPGz2ZNF8r+Jc5/zlrUS+Mn2ootnZfMo7i3ra0Oe+hab2l9xar8HY5CMx7YpSVYkFWwT6jlx10CmDQbICyVkqpPU5WeFN+cHetJqFO6QdnmOvlzPGkZn/DEI7ZG5m1oZm2rXgUbBB1uPVVl+7PqK0mOaRCfr4yJw6IkAz0Gp0rfgw2g6Ou5zzE0pZwU4Sczy8lCzqzuOdkNTayjoX4u76UYaiUloBhR/x7hw4mgVoYz4sWFVm/XGy5an6pRzBWCn9reppoY2cqWkJ74DkqS2p0STDNyP52L1pFu9JWij+G2S2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H6VCMFFt4iinIpi12PiEXLQq1zCJtpSHSZD5xSmTmY=;
 b=JUM32Uw8SuJxIDYlwgyDDuOd5I4Fe2yPsYE7s9bCLodtJ7BNyWx7q6yztdz0A25bfAtofiVObYJcNqILtPti/j3b8Pf7lhTdiCHwxnap6pvaKqarU9iMAvq9RxnVPx2BKQ2adASOzqImUkBGS5WtTub8X4kdMZfu0yZe/PVmDpS6k1SK/tp/JD6uU4/n0TGQCI9HIuLB46ao0MlWSesYDTGfrZRSt+1HI+8uUhMFD5kFXD1wq4rBuqHAD50Nt8U531AQKOC/RtdnpRUc7h1kiWI/BOz5E08emyrRxF4JwbFSinszIIpYiNZ1uYcZi9dNMDgnV1ssduNSPb8i17XMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 23:00:47 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 23:00:47 +0000
Message-ID: <0c111f82-9a61-46b1-ba68-ba568a770ac1@intel.com>
Date: Fri, 28 Jun 2024 19:00:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-2-zhanjun.dong@intel.com>
 <9e266737-51ba-467d-a333-421bfbb01a4b@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <9e266737-51ba-467d-a333-421bfbb01a4b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 992e12be-bf34-4314-7a1d-08dc97c6258c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGVqYnA0ajJQeDhFNGF0bEFJRExncmZqaDc3OVB5RWdPVkdNK0xoSytRUHhF?=
 =?utf-8?B?QWQ2NktqKzZnZWxyVUV2WDlRVVk4Q3kySTZLUVpSZHA2MGxYRHo2R1ZOd1VM?=
 =?utf-8?B?MTZONXRrYzRMek1yc2dKN05TN1lKeFhybi93dkhOZWl2dlpYRUlsVkFWa0hi?=
 =?utf-8?B?NUlZd05RTEJNYzdaLzVwbEZVYTF3NmpodXFoczVLb0J0WnJOQnhyMG90MVZW?=
 =?utf-8?B?YWNncGVOSmVVUzFtNVBhUzVvR2xuVlptSUU0NGdOM1VSZ0s2N3RrU1E5OW1L?=
 =?utf-8?B?ckxIc0RMQ1BrSjVWQ1Q1OHNkOVNWVnYvbHIzU3lkcURjbTMzdlRnSmtSU0lD?=
 =?utf-8?B?blFCS3l1NVhaK2xXUjdvS1ZBZzVVUG0vMlZwRG0xRGg1VHJLSXdVdzdwM3A3?=
 =?utf-8?B?SDQyemZETVMzNDhnQmpOQ3E0Si9MUTM1aXpiWGlXVkgzSkR1anhnTEFlbFpE?=
 =?utf-8?B?UUZqZEsxKzlUeXhuMVpZQThvUVFkd2NOalQzVWF6eVI4REtSZzdyQS91L3Fy?=
 =?utf-8?B?Y2RmWTRYZmhSQW1ucDBsaTdFOElVYlByOUE0aG9VMWlWTWRLbUlzanVrTUpl?=
 =?utf-8?B?UFhiNHJIUkFnUXhqMVpsWTRkLzFBa3hYRG4vLy84RXBCSEFleCtKRGlwWGEw?=
 =?utf-8?B?bGErcG9lRHlSd1lyTDFhc2hGUG1FWWpUSEdPUDBjUENtSGxnUVlsajlPNTMw?=
 =?utf-8?B?d25UU1k4ZVV4ZTgwOXBEdGVNSm95YkdGWkdMTEZ5UVdmZ01nVDl3aVI2NmVu?=
 =?utf-8?B?eERETFFDYWZ1cys5S1o2SWRmWGVoYzE1N3RKTlZmQU5McStJSmVCRjVpWHNj?=
 =?utf-8?B?dWRSZEp4MU5YT1VBTVYzbEtYWldiTnBrNkFWMFIrMXphZGxWME5QWmtndzdD?=
 =?utf-8?B?QVlsTklrbWR3UXJLdkFyTzdlQUpBRGQzQkplc1VjVGdVWFJvMFRmT1JJbCtC?=
 =?utf-8?B?c2p5ZHp6WHVDMDZQY3N5dFowVFlFT25xb05sZjF4QUFJSjBuTzF5S0E4TDho?=
 =?utf-8?B?V1pSbzdvQUV0RFF0SFcrNTZvRDZyd3owelBoa3AvQ1JIUnJKbkI4NW1WMHph?=
 =?utf-8?B?K1hRUEt6Zzh2clhyRjhvOXcrZWxpeWcyUnAyVFcvMC9DRTlZQnoyTEdXalVM?=
 =?utf-8?B?VWEyUzJTWk9iWG81Zys5T1FBeVozU0tSZkIvUkRlbUFwckpxYUFoWlI4R25O?=
 =?utf-8?B?VCt0WHBmSHhnQVZSVkpUOTgyWmdhRE1xZnhrQ1RZeGc4Si9ZWEF2ZFg3YjBv?=
 =?utf-8?B?WktLTGVlaGxRcHhscFYrQ2lmY2hXT3g2NHBCbkdkV2lUdDZaSHYvS3RDc25k?=
 =?utf-8?B?RWkxa1YzY0MxZDYyOHVPZnJOZ2JLdTE4OGpIRDZuYXgzSmFSNTJld20yK1BB?=
 =?utf-8?B?S1cvNUNhblRkZ3JZMGhVc2w2V0hkQjE5RDN1anRmUkpvWmNBL2xKaVV0bDVK?=
 =?utf-8?B?SmdMdkEyRzJVV0p6UnBXbVhCMlJqRHVqRVhoZlQ5RVE0Z3hpcjBWZHZDVWJN?=
 =?utf-8?B?VnByMnZNSVRPK0w3U2NuVmxvTkVEVnNLZzlSTG9DMVFTbTZZNElOdldQdWRJ?=
 =?utf-8?B?UXI2M1NPSkFZZmtpK1F3SGRrUWdNSWhtdTFDSHJXRlZFU0gwYU1URzNQOEhr?=
 =?utf-8?B?alg2MDVwT3gyblFFbktrYXV4ampWdW9XL2NIUmczNFRPS0dCaXVGeTZKa2Y0?=
 =?utf-8?B?ejBQYzdML09jZmY4NXFLV3RHWDVDOEdPRjNEYjhrYVlXVDBxcTZtU3ZvVXdk?=
 =?utf-8?B?TkFIMUo0UW5CYTZxazBVRXRPMFp6WUF4N0pncW5MVzBjUVdiSGZiUS84WnZG?=
 =?utf-8?B?bldUR3QzeFp1cURYajBYQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGo4ZU53d1JCY0VENEJqQ2FMVVU5aUZ6N0JhMndZNm9qYjQ3WGo1TlNaL2pr?=
 =?utf-8?B?M1VrSWVYNVlYUXdLd3R6YkhkWHUvUGc1NXFnMDQ0dW5SbWUwNWV3RXM5NHRw?=
 =?utf-8?B?ekpnTUttVEJpczUxaUpWWGdpL2lLdEQ1MnhqcHY4SHRuK0ZpS2xTNXU1MXRU?=
 =?utf-8?B?b25QNm9GL1RZc0VrMkp2T0ZJWkhCMlFNdDNQWUNBOG91OFFyeGlqMWRmTVBQ?=
 =?utf-8?B?cXl0KysyMHlwUUI5eGdBRlYvYllFcjFwMSt4MjZOV0Z3ZHFvV05hTDVWUHZu?=
 =?utf-8?B?d21lcTJ2dTFwaC9FNDQvTTdwVCs3aGhab3BMRUVjU1N2b3d4ZGQ3cGhWRm9V?=
 =?utf-8?B?bDlaMDJnZUV3aW5yUlhQVGQwRGkxWFVsWkM5SnRvSmhQVi9yWHAwbVowWEpY?=
 =?utf-8?B?ZGRJUGUvQktad2loTW5pWk01QnV4WnVkVzI0UTYwaTJlOE9sT3hYVFVWU29T?=
 =?utf-8?B?OGJKQlNxKzFqbUxZRENzMzlJOXdFWEhzcVFmWU1CeS9ZcGxnbktwVnJvdG1V?=
 =?utf-8?B?dk5EdWdaRXk2SXhEMEo1VC9OeFdjNk8wbzV3RzRkSlBEWlY2MFR0SU95WGhS?=
 =?utf-8?B?SWdLaHI4bjlIRGl1NWNSRldSeG5RaDltMDl6VVJJWkZQVTlOQkd6dTU1amhN?=
 =?utf-8?B?SzYwNVFJeEhpNVpqR3IrNGw0OUpjbGZSbG5ENW5yT3pDM1UwM0NBZm5ibzFu?=
 =?utf-8?B?bnBmNkdiTnFsTWlOV0YxMktkVktETFY5elgwNU9NWEZGb0JMRWlCUitOR1Q2?=
 =?utf-8?B?eUZrN3BVN1ROLzdUdHFZUVQ0dmswOThGc3dGalRxRm5rWGJWM3lTOFppdDB3?=
 =?utf-8?B?Um1oRjRnME80Y294c0xwb1pzNm90UnI5MFFkZWFDUndoWEFzQ3k5b2F3Z1JU?=
 =?utf-8?B?SWFwdXBuNVRYeEM2aVlOV1k5K1ZGd2IwaXcrQmUzYXNNUTVORmJxRU0vOXNP?=
 =?utf-8?B?WTNMdXlld0VIU29oanNyRXpUSDA5bEVPYWIyMVRvVEFwVGthQlRRTGNmRGxD?=
 =?utf-8?B?N0VDTWtyZGNrWlptNW44bTlDY1NveWFLMjRVbVpKbThWeFJadG5hQzNDWUk4?=
 =?utf-8?B?UThqdzRrMEhvbEt2amREWVZSMXNzcURPcFBGTFRxL1c1UWNiWmNwZVlPeGh5?=
 =?utf-8?B?ZUNIOGxFQ2MwbFJ1NDZZQng2c1dFOW55R0t1K3R3QnpIUy9tckZwNUZVV2F3?=
 =?utf-8?B?NnVoY3dYelY0dTFjU240c09oWEZmQ0pUN25wVkxWMVp0Um1RMVlvdVloQXVi?=
 =?utf-8?B?SXlsTzBBUlJLWEtTbERzOUpHOGdFak9WaVcrajBzdHZKdUgyeVpGRVZza01p?=
 =?utf-8?B?STVOUDdVRFZtT0xjRHFZdURhK2V5UmlYQzFOeDBBeE9LU1YxRVJ3Q3JHYi9j?=
 =?utf-8?B?TFNTcXRoenE0dy9tMTdKT2lKV2JjajIwUElsSGtIQ2pVY3lPRDVkT21DZVdQ?=
 =?utf-8?B?VDkrU2c4eE0vM3JxTUE3aUdmY0QwYXgzdkNERWJMRjREYjNqYVJRS2JvYStW?=
 =?utf-8?B?Q3UwYThzZUN6ZU9yRVJwMGNxcWNDdEtoS3phTU51OVQzeGZWZHhpQ25ZeERJ?=
 =?utf-8?B?ajBzN3h5OFpQS28zQjZ4VG1yZllDMzdHdFFnSC9LVnJhZjA4TkZycDlmQis2?=
 =?utf-8?B?U0Y5ZEExM3RSNXJxSFRMSGdyZDYvYlRkM0M0TGhLRVVTL2ZURkxnM3lwOFlr?=
 =?utf-8?B?S25sM3N4Yk1RM3JENmtUbm52SGJvc3Ivc0hUQlJpMmQySkYwbEZOUnJBbjF4?=
 =?utf-8?B?RzlFRFkxbkR6TWJGaVBmR3BjcmFRaUx1ODF3UzRtRS9FWWovU0FaWEtkNGlh?=
 =?utf-8?B?b0pXa0tJM1FPcU4rRlplYXBHYmZOejhhNVMyZFR6S0FaZ2tGSXczR3Zpb1Q1?=
 =?utf-8?B?VzUxMmM5L0Fub29lTkZzcklkdlNDSE1WU3FKbWpFTytHOE9DUUwvanhzbVNM?=
 =?utf-8?B?Wm4rKzhUQWVqUUN0Q1llWEgrNjhvMXArRjZpYWZzbUIrbHBrUERsTCtaWVc2?=
 =?utf-8?B?MTVqNWlZdytiZE9yaExSdlloTHFUVlVJK1RWejZEU1o3ZmdJWjU1WUFWbjdz?=
 =?utf-8?B?ajJ1WDJUVTRQc2tHblBKd3RNVmJBRkVHaTJERWl2d1hJZTNSeDhUQnRBUnVS?=
 =?utf-8?Q?daWsZ5yVCJncGRu8LjuC/P/xD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 992e12be-bf34-4314-7a1d-08dc97c6258c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 23:00:47.0535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9hpHMUu0qokwixnCBAufVdkedKN/rMoe6yeVdWIIzW+uV9wc0cdBerb4xo+j0KAqM+kO8hhc4J1N745Jn/S7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2024-06-27 2:45 p.m., Michal Wajdeczko wrote:
> 
> 
> On 24.06.2024 23:54, Zhanjun Dong wrote:
>> Add referenced registers defines and list of registers.
>> Update GuC ADS size allocation to include space for
>> the lists of error state capture register descriptors.
>>
>> Then, populate GuC ADS with the lists of registers we want
>> GuC to report back to host on engine reset events. This list
>> should include global, engine-class and engine-instance
>> registers for every engine-class type on the current hardware.
>>
>> Ensure we allocate a persistent store for the register lists
>> that are populated into ADS so that we don't need to allocate
>> memory during GT resets when GuC is reloaded and ADS population
>> happens again.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile               |   1 +
>>   drivers/gpu/drm/xe/abi/guc_capture_abi.h  |  78 ++++
>>   drivers/gpu/drm/xe/xe_guc.c               |   5 +
>>   drivers/gpu/drm/xe/xe_guc.h               |   5 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c           | 157 +++++++-
>>   drivers/gpu/drm/xe/xe_guc_ads_types.h     |   2 +
>>   drivers/gpu/drm/xe/xe_guc_capture.c       | 428 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_capture.h       |  44 +++
>>   drivers/gpu/drm/xe/xe_guc_capture_types.h |  80 ++++
>>   drivers/gpu/drm/xe/xe_guc_fwif.h          |  22 ++
>>   drivers/gpu/drm/xe/xe_guc_types.h         |   2 +
>>   11 files changed, 812 insertions(+), 12 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 7039008be234..e79babce44b5 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -71,6 +71,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>>   	xe_guc_ads.o \
>> +	xe_guc_capture.o \
>>   	xe_guc_ct.o \
>>   	xe_guc_db_mgr.o \
>>   	xe_guc_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/abi/guc_capture_abi.h b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
>> new file mode 100644
>> index 000000000000..355fde5e2f95
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
>> @@ -0,0 +1,78 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_CAPTURE_ABI_H
>> +#define _ABI_GUC_CAPTURE_ABI_H
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_guc_fwif.h"
> 
> we don't want to include driver specific headers (like xe_guc_fwif.h) in
> ABI headers, as want ABI headers be pure and driver agnostic
Emm, the struct guc_mmio_reg is defined in xe_guc_fwif.h, which actully 
looks like is another _abi.h.
Sounds like a cleanup is needed, all header files with _fwif.h looks 
like _abi.h. The cleanup seems out of scope of this patch.
I will keep it this way until cleanup later.

> 
> you can include this ABI header in xe_guc_fwif.h though
> 
> but here just include <linux/types.h>
> 
>> +
>> +/*
>> + * struct guc_debug_capture_list_header / struct guc_debug_capture_list
> 
> either make it as generic intro:
> 
> /**
>    * DOC: GuC Capture ...
> 
> or make it per struct kernel-doc
To be updated
> 
>> + *
>> + * As part of ADS registration, these header structures (followed by
>> + * an array of 'struct guc_mmio_reg' entries) are used to register with
>> + * GuC microkernel the list of registers we want it to dump out prior
>> + * to a engine reset.
>> + */
>> +struct guc_debug_capture_list_header {
>> +	u32 info;
>> +#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
>> +} __packed;
>> +
>> +struct guc_debug_capture_list {
>> +	struct guc_debug_capture_list_header header;
>> +	struct guc_mmio_reg regs[];
>> +} __packed;
>> +
>> +/*
>> + * struct guc_state_capture_header_t / struct guc_state_capture_t /
>> + * guc_state_capture_group_header_t / guc_state_capture_group_t
>> + *
>> + * Prior to resetting engines that have hung or faulted, GuC microkernel
>> + * reports the engine error-state (register values that was read) by
>> + * logging them into the shared GuC log buffer using these hierarchy
>> + * of structures.
>> + */
>> +struct guc_state_capture_header_t {
>> +	u32 owner;
>> +#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)
> 
> CAP is likely from CAPTURE
> so then CAPTURE is redundant
> 
> maybe
> 	GUC_CAPTURE_STATE_OWNER_VFID
> 
>> +	u32 info;
>> +#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
>> +#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
>> +#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)
> 
> maybe
> 	GUC_CAPTURE_STATE_INFO_TYPE
> 	GUC_CAPTURE_STATE_INFO_ENGINE_CLASS
> 	GUC_CAPTURE_STATE_INFO_ENGINE_INST
For CAP_HDR_CAPTURE_TYPE, CAP_HDR_ENGINE_CLASS, ...
The CAP_HDR is prefix, the CAPTURE_TYPE and ENGINE_CLASS is copied from 
GuC interface spec.
The structure also called guc_state_capture_header_t in spec.

Above would be changed to:
GUC_STATE_CAPTURE_HEADER_CAPTURE_TYPE
GUC_STATE_CAPTURE_HEADER_ENGIN_CLASS
...
Make it 1:1 follows spec


> 
>> +	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
>> +	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
>> +	u32 num_mmios;
>> +#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)
> 
> seems either redundant or num_mmios name is wrong

To be changed to num_mmio_entries, to follow GuC interface spec.
> 
>> +} __packed;
>> +
>> +struct guc_state_capture_t {
>> +	struct guc_state_capture_header_t header;
>> +	struct guc_mmio_reg mmio_entries[];
>> +} __packed;
>> +
>> +enum guc_capture_group_types {
>> +	GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
>> +	GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
>> +	GUC_STATE_CAPTURE_GROUP_TYPE_MAX,
> 
> MAX is likely not part of the ABI itself, only FULL=0 and PARTIAL=1
MAX to be removed, the guc_capture_group_types will be changed to 
guc_state_capture_group_type to follows interface spec.
> 
> also it's good to match enumerators names with the enum name:
> 
> 	GUC_CAPTURE_GROUP_TYPE_FULL = 0,
> 	GUC_CAPTURE_GROUP_TYPE_PARTIAL = 1,
> 
>> +};
>> +
>> +struct guc_state_capture_group_header_t {
>> +	u32 owner;
>> +#define CAP_GRP_HDR_CAPTURE_VFID GENMASK(7, 0)
> 
> 	GUC_CAPTURE_STATE_GROUP_OWNER_VFID
> 
>> +	u32 info;
>> +#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
>> +#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
> 
> 	GUC_CAPTURE_STATE_GROUP_INFO_NUM
> 	GUC_CAPTURE_STATE_GROUP_INFO_TYPE
To be changed to:
GUC_STATE_CAPTURE_GROUP_HEADER_NUM_CAPTURES
GUC_STATE_CAPTURE_GROUP_HEADER_CAPTURE_GROUP_TYPE
to follows spec.
> 
>> +} __packed;
>> +
>> +/* this is the top level structure where an error-capture dump starts */
>> +struct guc_state_capture_group_t {
>> +	struct guc_state_capture_group_header_t grp_header;
>> +	struct guc_state_capture_t capture_entries[];
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 7ecb509c87d7..7081e451878f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_throttle.h"
>>   #include "xe_guc_ads.h"
>> +#include "xe_guc_capture.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_db_mgr.h"
>>   #include "xe_guc_hwconfig.h"
>> @@ -338,6 +339,10 @@ int xe_guc_init(struct xe_guc *guc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = xe_guc_capture_init(guc);
>> +	if (ret)
>> +		goto out;
>> +
>>   	ret = xe_guc_ads_init(&guc->ads);
>>   	if (ret)
>>   		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index af59c9545753..ddfa855458ab 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -69,4 +69,9 @@ static inline struct xe_device *guc_to_xe(struct xe_guc *guc)
>>   	return gt_to_xe(guc_to_gt(guc));
>>   }
>>   
>> +static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
>> +{
>> +	return &guc_to_xe(guc)->drm;
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 1c60b685dbc6..9b2e02ba9fc2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -18,6 +18,8 @@
>>   #include "xe_gt_ccs_mode.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_capture_types.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>> @@ -127,6 +129,8 @@ struct __guc_ads_blob {
>>   #define info_map_read(xe_, map_, field_) \
>>   	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
>>   
>> +static int guc_capture_prep_lists(struct xe_guc_ads *ads);
>> +
>>   static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>>   {
>>   	struct xe_device *xe = ads_to_xe(ads);
>> @@ -148,8 +152,7 @@ static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>>   
>>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>   {
>> -	/* FIXME: Allocate a proper capture list */
>> -	return PAGE_ALIGN(PAGE_SIZE);
>> +	return PAGE_ALIGN(ads->capture_size);
>>   }
>>   
>>   static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
>> @@ -398,6 +401,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>   	struct xe_bo *bo;
>>   
>>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +	/*
>> +	 * At time of ads init, hwconfig was not loaded, engine info like
>> +	 * engine mask is not ready.
>> +	 * Capture size is using the worst size calculation.
>> +	 */
>> +	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
>>   	ads->regset_size = calculate_regset_size(gt);
>>   	ads->ads_waklv_size = calculate_waklv_size(ads);
>>   
>> @@ -418,8 +427,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>    * @ads: Additional data structures object
>>    *
>>    * Recalcuate golden_lrc_size & regset_size as the number hardware engines may
> 
> typo
To be updated
> 
>> - * have changed after the hwconfig was loaded. Also verify the new sizes fit in
>> - * the already allocated ADS buffer object.
>> + * have changed after the hwconfig was loaded. Also verify the new sizes fit
>> + * in the already allocated ADS buffer object.
>>    *
>>    * Return: 0 on success, negative error code on error.
>>    */
>> @@ -431,6 +440,8 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>>   	xe_gt_assert(gt, ads->bo);
>>   
>>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +	/* Calculate Capture size with worst size */
>> +	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
>>   	ads->regset_size = calculate_regset_size(gt);
>>   
>>   	xe_gt_assert(gt, ads->golden_lrc_size +
>> @@ -530,20 +541,142 @@ static void guc_mapping_table_init(struct xe_gt *gt,
>>   	}
>>   }
>>   
>> -static void guc_capture_list_init(struct xe_guc_ads *ads)
>> +static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
>> +				       u32 capture_class)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 mask;
>> +
>> +	switch (capture_class) {
>> +	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
>> +		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_VIDEO:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_BLITTER:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
>> +		break;
>> +	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
>> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
>> +		break;
>> +	default:
>> +		mask = 0;
>> +	}
>> +
>> +	return mask;
>> +}
>> +
>> +static inline bool get_capture_list(struct xe_guc_ads *ads, struct xe_guc *guc, struct xe_gt *gt,
>> +				    int owner, int type, int class, u32 *total_size, size_t *size,
>> +				    void **pptr)
>> +{
>> +	*size = 0;
>> +
>> +	if (!xe_guc_capture_getlistsize(guc, owner, type, class, size)) {
>> +		if (*total_size + *size > ads->capture_size)
>> +			xe_gt_dbg(gt, "Capture size overflow :%zu vs %d\n",
>> +				  *total_size + *size, ads->capture_size);
>> +		else if (!xe_guc_capture_getlist(guc, owner, type, class, pptr))
>> +			return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>>   {
>> +	struct xe_guc *guc = ads_to_guc(ads);
>> +	struct xe_gt *gt = ads_to_gt(ads);
>> +	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
>> +	struct iosys_map info_map;
>> +	size_t size = 0;
>> +	void *ptr;
>>   	int i, j;
>> -	u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
>>   
>> -	/* FIXME: Populate a proper capture list */
>> +	capture_offset = guc_ads_capture_offset(ads);
>> +	ads_ggtt = xe_bo_ggtt_addr(ads->bo);
>> +	info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>> +					 offsetof(struct __guc_ads_blob, system_info));
>> +
>> +	/* first, set aside the first page for a capture_list with zero descriptors */
>> +	total_size = PAGE_SIZE;
>> +	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
>> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
>> +
>> +	null_ggtt = ads_ggtt + capture_offset;
>> +	capture_offset += PAGE_SIZE;
>> +
>> +	/*
>> +	 * Populate capture list : at this point adps is already allocated and
>> +	 * mapped to worst case size
>> +	 */
>>   	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>> -		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
>> -			ads_blob_write(ads, ads.capture_instance[i][j], addr);
>> -			ads_blob_write(ads, ads.capture_class[i][j], addr);
>> +		bool write_empty_list;
>> +
>> +		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
>> +			u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
>> +			/* null list if we dont have said engine or list */
>> +			if (!engine_mask) {
>> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
>> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
>> +				continue;
>> +			}
>> +
>> +			/* engine exists: start with engine-class registers */
>> +			write_empty_list = get_capture_list(ads, guc, gt, i,
>> +							    GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +							    j, &total_size, &size, &ptr);
>> +			if (!write_empty_list) {
>> +				ads_blob_write(ads, ads.capture_class[i][j],
>> +					       ads_ggtt + capture_offset);
>> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
>> +						 ptr, size);
>> +				total_size += size;
>> +				capture_offset += size;
>> +			} else {
>> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
>> +			}
>> +
>> +			/* engine exists: next, engine-instance registers   */
>> +			write_empty_list = get_capture_list(ads, guc, gt, i,
>> +							    GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +							    j, &total_size, &size, &ptr);
>> +			if (!write_empty_list) {
>> +				ads_blob_write(ads, ads.capture_instance[i][j],
>> +					       ads_ggtt + capture_offset);
>> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
>> +						 ptr, size);
>> +				total_size += size;
>> +				capture_offset += size;
>> +			} else {
>> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
>> +			}
>>   		}
>>   
>> -		ads_blob_write(ads, ads.capture_global[i], addr);
>> +		/* global registers is last in our PF/VF loops */
>> +		write_empty_list = get_capture_list(ads, guc, gt, i,
>> +						    GUC_CAPTURE_LIST_TYPE_GLOBAL,
>> +						    0, &total_size, &size, &ptr);
>> +		if (!write_empty_list) {
>> +			ads_blob_write(ads, ads.capture_global[i], ads_ggtt + capture_offset);
>> +			xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr,
>> +					 size);
>> +			total_size += size;
>> +			capture_offset += size;
>> +		} else {
>> +			ads_blob_write(ads, ads.capture_global[i], null_ggtt);
>> +		}
>>   	}
>> +
>> +	if (ads->capture_size != PAGE_ALIGN(total_size))
>> +		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
>> +			  ads->capture_size, PAGE_ALIGN(total_size));
>> +	return PAGE_ALIGN(total_size);
>>   }
>>   
>>   static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
>> @@ -732,7 +865,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>   	guc_mmio_reg_state_init(ads);
>>   	guc_prep_golden_lrc_null(ads);
>>   	guc_mapping_table_init(gt, &info_map);
>> -	guc_capture_list_init(ads);
>> +	guc_capture_prep_lists(ads);
>>   	guc_doorbell_init(ads);
>>   	guc_waklv_init(ads);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> index 2de5decfe0fd..70c132458ac3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> @@ -22,6 +22,8 @@ struct xe_guc_ads {
>>   	u32 regset_size;
>>   	/** @ads_waklv_size: total waklv size supported by platform */
>>   	u32 ads_waklv_size;
>> +	/** @capture_size: size of register set passed to GuC for capture */
>> +	u32 capture_size;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> new file mode 100644
>> index 000000000000..172edcfd7c00
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -0,0 +1,428 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021-2024 Intel Corporation
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "abi/guc_capture_abi.h"
>> +#include "regs/xe_engine_regs.h"
>> +#include "regs/xe_gt_regs.h"
>> +#include "regs/xe_guc_regs.h"
>> +#include "regs/xe_regs.h"
>> +
>> +#include "xe_bo.h"
>> +#include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_mcr.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_capture_types.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_log.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_hw_engine_types.h"
>> +#include "xe_macros.h"
>> +#include "xe_map.h"
>> +
>> +/*
>> + * Define all device tables of GuC error capture register lists
>> + * NOTE: For engine-registers, GuC only needs the register offsets
>> + *       from the engine-mmio-base
>> + */
>> +#define COMMON_XELP_BASE_GLOBAL \
>> +	{ FORCEWAKE_GT,		    0,      0}
>> +
>> +#define COMMON_BASE_ENGINE_INSTANCE \
>> +	{ RING_ESR(0),              0,      0}, \
>> +	{ RING_EMR(0),              0,      0}, \
>> +	{ RING_EIR(0),              0,      0}, \
>> +	{ RING_EXECLIST_STATUS_HI(0), 0,    0}, \
>> +	{ RING_EXECLIST_STATUS_LO(0), 0,    0}, \
>> +	{ RING_DMA_FADD(0),         0,      0}, \
>> +	{ RING_DMA_FADD_UDW(0),     0,      0}, \
>> +	{ RING_IPEHR(0),            0,      0}, \
>> +	{ RING_BBADDR(0),           0,      0}, \
>> +	{ RING_BBADDR_UDW(0),       0,      0}, \
>> +	{ RING_ACTHD(0),            0,      0}, \
>> +	{ RING_ACTHD_UDW(0),        0,      0}, \
>> +	{ RING_START(0),            0,      0}, \
>> +	{ RING_HEAD(0),             0,      0}, \
>> +	{ RING_TAIL(0),             0,      0}, \
>> +	{ RING_CTL(0),              0,      0}, \
>> +	{ RING_MI_MODE(0),          0,      0}, \
>> +	{ RING_HWS_PGA(0),          0,      0}, \
>> +	{ RING_MODE(0),             0,      0}
>> +
>> +/* XE_LP Global */
>> +static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>> +	COMMON_XELP_BASE_GLOBAL,
>> +};
>> +
>> +/* Render / Compute Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_rc_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Media Decode/Encode Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_vd_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Video Enhancement Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Blitter Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* XE_LP - GSC Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/*
>> + * Empty list to prevent warnings about unknown class/instance types
>> + * as not all class/instanace types have entries on all platforms.
> 
> typo
?? This comment is for the empty regs list.
> 
>> + */
>> +static const struct __guc_mmio_reg_descr empty_regs_list[] = {
>> +};
>> +
>> +#define TO_GCAP_DEF_OWNER(x) (GUC_CAPTURE_LIST_INDEX_##x)
>> +#define TO_GCAP_DEF_TYPE(x) (GUC_CAPTURE_LIST_TYPE_##x)
>> +#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
>> +	{ \
>> +		regslist, \
>> +		ARRAY_SIZE(regslist), \
>> +		TO_GCAP_DEF_OWNER(regsowner), \
>> +		TO_GCAP_DEF_TYPE(regstype), \
>> +		class, \
>> +	}
>> +
>> +/* List of lists */
>> +static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
>> +	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>> +	MAKE_REGLIST(xe_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
>> +	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
>> +	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> +	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> +	{}
>> +};
>> +
>> +static const char * const capture_list_type_names[] = {
>> +	"Global",
>> +	"Class",
>> +	"Instance",
>> +};
>> +
>> +static const char * const capture_engine_class_names[] = {
>> +	"Render/Compute",
>> +	"Video",
>> +	"VideoEnhance",
>> +	"Blitter",
>> +	"GSC-Other",
>> +};
>> +
>> +static const struct __guc_mmio_reg_descr_group *
>> +guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
>> +			 u32 owner, u32 type, u32 id)
>> +{
>> +	int i;
>> +
>> +	if (!reglists)
>> +		return NULL;
>> +
>> +	for (i = 0; reglists[i].list; ++i) {
>> +		if (reglists[i].owner == owner && reglists[i].type == type &&
>> +		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
>> +			return &reglists[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static const struct __guc_mmio_reg_descr_group *
>> +guc_capture_get_device_reglist(struct xe_guc *guc)
>> +{
>> +	return xe_lp_lists;
>> +}
>> +
>> +static int
>> +guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
>> +		      struct guc_mmio_reg *ptr, u16 num_entries)
>> +{
>> +	u32 i = 0;
>> +	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
>> +	const struct __guc_mmio_reg_descr_group *match;
>> +
>> +	if (!reglists)
>> +		return -ENODEV;
>> +
>> +	match = guc_capture_get_one_list(reglists, owner, type, classid);
>> +	if (!match)
>> +		return -ENODATA;
>> +
>> +	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
>> +		ptr[i].offset = match->list[i].reg.addr;
>> +		ptr[i].value = 0xDEADF00D;
>> +		ptr[i].flags = match->list[i].flags;
>> +		ptr[i].mask = match->list[i].mask;
>> +	}
>> +
>> +	if (i < num_entries)
>> +		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
>> +			  num_entries);
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
>> +{
>> +	const struct __guc_mmio_reg_descr_group *match;
>> +
>> +	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
>> +	if (!match)
>> +		return 0;
>> +
>> +	return match->num_regs;
>> +}
>> +
>> +static int
>> +guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
>> +			size_t *size, bool is_purpose_est)
>> +{
>> +	struct xe_guc_state_capture *gc = guc->capture;
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct __guc_capture_ads_cache *cache;
>> +	int num_regs;
>> +
>> +	xe_gt_assert(gt, type < GUC_CAPTURE_LIST_TYPE_MAX);
>> +	xe_gt_assert(gt, classid < GUC_CAPTURE_LIST_CLASS_MAX);
>> +
>> +	cache = &gc->ads_cache[owner][type][classid];
>> +	if (!gc->reglists) {
>> +		xe_gt_warn(gt, "No capture reglist for this device\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (cache->is_valid) {
>> +		*size = cache->size;
>> +		return cache->status;
>> +	}
>> +
>> +	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
>> +	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
>> +		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
>> +			xe_gt_warn(gt, "Missing capture reglist: global!\n");
>> +		else
>> +			xe_gt_warn(gt, "Missing capture reglist: %s(%u):%s(%u)!\n",
>> +				   capture_list_type_names[type], type,
>> +				   capture_engine_class_names[classid], classid);
>> +		return -ENODEV;
>> +	}
>> +
>> +	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
>> +	/* intentional empty lists can exist depending on hw config */
>> +	if (!num_regs)
>> +		return -ENODATA;
>> +
>> +	if (size)
>> +		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
>> +				   (num_regs * sizeof(struct guc_mmio_reg)));
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_guc_capture_getlistsize - Get list size for owner/type/class combination
>> + * @guc:	The GuC object
>> + * @owner:	PF/VF owner
>> + * @type:	Guc capture register type
>> + * @classid:	Guc capture engine class id
>> + * @size:	Point to the size
>> + *
>> + * This function will get the list for the owner/type/class combination, and
>> + * return the page aligned list size.
> 
> missing "Return:" section
To be added
> 
>> + */
>> +int
>> +xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size)
>> +{
>> +	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
>> +}
>> +
>> +/**
>> + * xe_guc_capture_getlist - Get register capture list for owner/type/class
>> + * combination
>> + *
>> + * @guc:	The GuC object
>> + * @owner:	PF/VF owner
>> + * @type:	Guc capture register type
>> + * @classid:	Guc capture engine class id
>> + * @outptr:	Point to cached register capture list
>> + *
>> + * This function will get the register capture list for the owner/type/class
>> + * combination.
> 
> missing "Return:" section
To be added
> 
>> + */
>> +int
>> +xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
>> +{
>> +	struct xe_guc_state_capture *gc = guc->capture;
>> +	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
>> +	struct guc_debug_capture_list *listnode;
>> +	int ret, num_regs;
>> +	u8 *caplist, *tmp;
>> +	size_t size = 0;
>> +
>> +	if (!gc->reglists)
>> +		return -ENODEV;
>> +
>> +	if (cache->is_valid) {
>> +		*outptr = cache->ptr;
>> +		return cache->status;
>> +	}
>> +
>> +	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
>> +	if (ret) {
>> +		cache->is_valid = true;
>> +		cache->ptr = NULL;
>> +		cache->size = 0;
>> +		cache->status = ret;
>> +		return ret;
>> +	}
>> +
>> +	caplist = drmm_kzalloc(guc_to_drm(guc), size, GFP_KERNEL);
>> +	if (!caplist)
>> +		return -ENOMEM;
>> +
>> +	/* populate capture list header */
>> +	tmp = caplist;
>> +	num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
>> +	listnode = (struct guc_debug_capture_list *)tmp;
>> +	listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
>> +
>> +	/* populate list of register descriptor */
>> +	tmp += sizeof(struct guc_debug_capture_list);
>> +	guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
>> +
>> +	/* cache this list */
>> +	cache->is_valid = true;
>> +	cache->ptr = caplist;
>> +	cache->size = size;
>> +	cache->status = 0;
>> +
>> +	*outptr = caplist;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
> 
> this should be /**
To be added
> 
>> + * xe_guc_capture_getnullheader - Get a null list for register capture
>> + *
>> + * @guc:	The GuC object
>> + * @outptr:	Point to cached register capture list
>> + * @size:	Point to the size
>> + *
>> + * This function will alloc for a null list for register capture.
> 
> missing "Return:" section
To be added
> 
>> + */
>> +int
>> +xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
>> +{
>> +	struct xe_guc_state_capture *gc = guc->capture;
>> +	int tmp = sizeof(u32) * 4;
>> +	void *null_header;
>> +
>> +	if (gc->ads_null_cache) {
>> +		*outptr = gc->ads_null_cache;
>> +		*size = tmp;
>> +		return 0;
>> +	}
>> +
>> +	null_header = drmm_kzalloc(guc_to_drm(guc), tmp, GFP_KERNEL);
>> +	if (!null_header)
>> +		return -ENOMEM;
>> +
>> +	gc->ads_null_cache = null_header;
>> +	*outptr = null_header;
>> +	*size = tmp;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
> 
> this should be /**
To be added
> 
>> + * xe_guc_capture_ads_input_worst_size - Calculate the worst size for GuC register capture
>> + * @guc: point to xe_guc structure
>> + *
>> + * Calculate the worst size for GuC register capture by including all possible engines classes.
>> + *
>> + * Returns: Calculated size
>> + */
>> +size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>> +{
>> +	size_t total_size, class_size, instance_size, global_size;
>> +	int i, j;
>> +
>> +	/*
>> +	 * This function calculates the worst case register lists size by
>> +	 * including all possible engines classes. It is called during the
>> +	 * first of a two-phase GuC (and ADS-population) initialization
>> +	 * sequence, that is, during the pre-hwconfig phase before we have
>> +	 * the exact engine fusing info.
>> +	 */
>> +	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
>> +	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>> +		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
>> +			if (xe_guc_capture_getlistsize(guc, i,
>> +						       GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +						       j, &class_size) < 0)
>> +				class_size = 0;
>> +			if (xe_guc_capture_getlistsize(guc, i,
>> +						       GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +						       j, &instance_size) < 0)
>> +				instance_size = 0;
>> +			total_size += class_size + instance_size;
>> +		}
>> +		if (xe_guc_capture_getlistsize(guc, i,
>> +					       GUC_CAPTURE_LIST_TYPE_GLOBAL,
>> +					       0, &global_size) < 0)
>> +			global_size = 0;
>> +		total_size += global_size;
>> +	}
>> +
>> +	return PAGE_ALIGN(total_size);
>> +}
>> +
>> +/*
> 
> /**
To be added
> 
>> + * xe_guc_capture_init - Init for GuC register capture
>> + * @guc: The GuC object
>> + *
>> + * Init for GuC register capture, alloc memory for capture data structure.
>> + *
>> + * Returns: 0 if success.
>> +	    -ENOMEM if out of memory
>> + */
>> +int xe_guc_capture_init(struct xe_guc *guc)
>> +{
>> +	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
>> +	if (!guc->capture)
>> +		return -ENOMEM;
>> +
>> +	guc->capture->reglists = guc_capture_get_device_reglist(guc);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
>> new file mode 100644
>> index 000000000000..232f60fc9a20
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021-2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_CAPTURE_H
>> +#define _XE_GUC_CAPTURE_H
>> +
>> +#include <linux/types.h>
>> +#include "regs/xe_reg_defs.h"
>> +
>> +struct xe_guc;
>> +
>> +/*
>> + * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
>> + *
>> + * xe_guc_capture module uses these structures to maintain static
>> + * tables (per unique platform) that consists of lists of registers
>> + * (offsets, names, flags,...) that are used at the ADS regisration
>> + * time as well as during runtime processing and reporting of error-
>> + * capture states generated by GuC just prior to engine reset events.
>> + */
>> +struct __guc_mmio_reg_descr {
>> +	struct xe_reg reg;
>> +	u32 flags;
>> +	u32 mask;
>> +	const char *regname;
>> +};
>> +
>> +struct __guc_mmio_reg_descr_group {
>> +	const struct __guc_mmio_reg_descr *list;
>> +	u32 num_regs;
>> +	u32 owner; /* see enum guc_capture_owner */
>> +	u32 type; /* see enum guc_capture_type */
>> +	u32 engine; /* as per MAX_ENGINE_CLASS */
>> +};
> 
> shouldn't above structs be defined in xe_guc_capture_types.h ?
Right, to be moved.
> 
>> +
>> +int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
>> +int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
>> +int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
>> +size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>> +int xe_guc_capture_init(struct xe_guc *guc);
>> +
>> +#endif /* _XE_GUC_CAPTURE_H */
> 
> Xe maintainers don't like such markups on include guards #ifdef
To be updated
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> new file mode 100644
>> index 000000000000..b2e78ab53e2e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> @@ -0,0 +1,80 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _xe_guc_capture_types_H
>> +#define _xe_guc_capture_types_H
> 
> should be upper case
To be updated
> 
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_guc_fwif.h"
> 
> do you need this header or maybe just abi/guc_capture_abi.h ?
> 
>> +
>> +/*
> 
> /** or  intentional ?
> 
>> + * struct __guc_capture_ads_cache
>> + *
>> + * A structure to cache register lists that were populated and registered
>> + * with GuC at startup during ADS registration. This allows much quicker
>> + * GuC resets without re-parsing all the tables for the given gt.
>> + */
>> +struct __guc_capture_ads_cache {
>> +	bool is_valid;
>> +	void *ptr;
>> +	size_t size;
>> +	int status;
> 
> we should describe all members
To be updated
> 
>> +};
>> +
>> +/**
>> + * struct xe_guc_state_capture
>> + *
>> + * Internal context of the xe_guc_capture module.
>> + */
>> +struct xe_guc_state_capture {
>> +	/**
>> +	 * @reglists: static table of register lists used for error-capture state.
>> +	 */
>> +	const struct __guc_mmio_reg_descr_group *reglists;
>> +
>> +	/**
>> +	 * @ads_cache: cached register lists that is ADS format ready
>> +	 */
>> +	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
>> +						[GUC_CAPTURE_LIST_TYPE_MAX]
>> +						[GUC_MAX_ENGINE_CLASSES];
>> +
>> +	/**
>> +	 * @ads_null_cache: ADS null cache.
>> +	 */
>> +	void *ads_null_cache;
>> +
>> +	/**
>> +	 * @cachelist: Pool of pre-allocated nodes for error capture output
>> +	 *
>> +	 * We need this pool of pre-allocated nodes because we cannot
>> +	 * dynamically allocate new nodes when receiving the G2H notification
>> +	 * because the event handlers for all G2H event-processing is called
>> +	 * by the ct processing worker queue and when that queue is being
>> +	 * processed, there is no absoluate guarantee that we are not in the
>> +	 * midst of a GT reset operation (which doesn't allow allocations).
>> +	 */
>> +	struct list_head cachelist;
>> +#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
>> +#define PREALLOC_NODES_DEFAULT_NUMREGS 64
>> +
>> +	/**
>> +	 * @max_mmio_per_node: Max MMIO per node.
>> +	 */
>> +	int max_mmio_per_node;
>> +
>> +	/**
>> +	 * @outlist: Pool of pre-allocated nodes for error capture output
>> +	 *
>> +	 * A linked list of parsed GuC error-capture output data before
>> +	 * reporting with formatting via xe_devcoredump. Each node in this linked list shall
>> +	 * contain a single engine-capture including global, engine-class and
>> +	 * engine-instance register dumps as per guc_capture_parsed_output_node
>> +	 */
>> +	struct list_head outlist;
>> +};
>> +
>> +#endif /* _xe_guc_capture_types_H */
> 
> drop /* */
To be updated
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 19ee71aeaf17..04b03c398191 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/bits.h>
>>   
>>   #include "abi/guc_klvs_abi.h"
>> +#include "xe_hw_engine_types.h"
>>   
>>   #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
>>   #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>> @@ -164,8 +165,11 @@ struct guc_mmio_reg {
>>   	u32 flags;
>>   	u32 mask;
>>   #define GUC_REGSET_MASKED		BIT(0)
>> +#define GUC_REGSET_STEERING_NEEDED	BIT(1)
>>   #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
>>   #define GUC_REGSET_RESTORE_ONLY		BIT(3)
>> +#define GUC_REGSET_STEERING_GROUP       GENMASK(16, 12)
>> +#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
>>   } __packed;
>>   
>>   /* GuC register sets */
>> @@ -194,6 +198,24 @@ enum {
>>   	GUC_CAPTURE_LIST_INDEX_MAX = 2,
>>   };
>>   
>> +/*Register-types of GuC capture register lists */
>> +enum guc_capture_type {
>> +	GUC_CAPTURE_LIST_TYPE_GLOBAL = 0,
>> +	GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +	GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +	GUC_CAPTURE_LIST_TYPE_MAX,
> 
> MAX is likely not part of the ABI
> 
> and maybe guc_capture_type should be defined in abi/guc_capture_abi.h ?
Right, to be moved and changed to
GUC_STATE_CAPTURE_TYPE_xxx to follows spec
> 
>> +};
>> +
>> +/* Class indecies for capture_class and capture_instance arrays */
>> +enum {
>> +	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
>> +	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
>> +	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
>> +	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
>> +	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
>> +	GUC_CAPTURE_LIST_CLASS_MAX  = 5
> 
> MAX is likely not part of the ABI
MAX was defined in spec, make it part of the ABI
> 
> and move to abi/guc_capture_abi.h ?
To be moved
> 
>> +};
>> +
>>   /* GuC Additional Data Struct */
>>   struct guc_ads {
>>   	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index 546ac6350a31..6d7d0976b7af 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -58,6 +58,8 @@ struct xe_guc {
>>   	struct xe_guc_ads ads;
>>   	/** @ct: GuC ct */
>>   	struct xe_guc_ct ct;
>> +	/** @capture: the error-state-capture module's data and objects */
>> +	struct xe_guc_state_capture *capture;
>>   	/** @pc: GuC Power Conservation */
>>   	struct xe_guc_pc pc;
>>   	/** @dbm: GuC Doorbell Manager */
