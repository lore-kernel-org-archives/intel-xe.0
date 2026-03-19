Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B3C1090227
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 14:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FEF10E136;
	Thu, 19 Mar 2026 14:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGrgKdFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5310E136
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773928820; x=1805464820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9NZLIzgU/3Ktxu/Wka/UCuGf85bZlFvQCS/6ERWc6CQ=;
 b=RGrgKdFFbC0BnMNqPtb3695p0WxYuB0bwmuDWKdbddIanV4h9EKtfe9B
 eeH9h3px/Nja2axqDBbthm3UU3MZQqnxbW8kC7/hTDLdX6yi/eylfbpvg
 32YEDSkbkrBLGh5nt02fuzWPHSc1nc1OZcYcNvxQ67NfFGACpRw0EF9qM
 MM7hd3GEF3870SY0Th/vBYo0L4CSMrVEoWxzIZihsxnS73nuEFnrmT8O4
 zWAF304cPEiJphfzVTh4DPO0TuVTDzNcWgDOJ82VY54mRRJf8RhqFQz5i
 d0edyzJsGt+ljCECOB3gVqKLkzx5dEIWDBXvJPt1TDjk+eY8CgpVD4EFZ g==;
X-CSE-ConnectionGUID: T5cKB3PrT1aEQuybyF88cg==
X-CSE-MsgGUID: bIymfnn3SRe0qD/u9AG25A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86360162"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86360162"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 07:00:19 -0700
X-CSE-ConnectionGUID: pkhYcc23TfOCDfI+rBBIuA==
X-CSE-MsgGUID: 5jqBBsiNQvWlJgxy1XSYTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="253436669"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 07:00:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 07:00:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 07:00:18 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 07:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6iInYe0mGjRrQgqb5i4oZYUyOtyTgpaukpjPow234UpRNnXcvJkQ3GobB3JrqV/+RoTuertS6GIKMn9CvaiwZuIu6nSHyhza+vythIAq2APmch12t9pHsFPN96+x4hrMbfIySs2BMuk1q29wwK8UfXsC8ApbaMYqB3Lt9VZ8kG0ra/EdHWSGHNalp6lR7wxlA/lRC7zjhSEQ1AozzxtXeeh9prRo17hfjm5aem/al4uUYzEE0ccMqeiEk/LNDOaBgVdeIU9crJQP8Gt/IopP45y0gLcfflr9c6HZtKzgGjOcTiD6XpqIg1dHrY+FCplTzb7loDeo61TC0s/CwwRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzX6WbSA4kr8hrT+lXpSZ9a7Ycb0hrgATmReicAWkao=;
 b=i1/xkwHE00CBd+1I8TkqU+tp/05U/0Ftgg9G9sAxzy9sqbCqGAx9FQIpkHWLphuQPl8jqZP615Gi5WrA5ih5pF6r3R8uE4AmsLeMZc7RWEwvsKKZQPIV9S0yTrU9QetXfuOYTviViLcEgSnhVItTJ8Q1wPG3NpmaJVCnsF9MEdR+7fj9UrmScSTG8Ex4thCJ9pUvQgoJU40b55acEmT9kKD0V8SzesrBfSgXSga5GtkBQSOTx7RavRvFkXQ8t81ynasjTqj9DcrX/VQOKV6ePnY1zD7R9KiwEndaTVmIPw2t0E1IDQ/PHf7XIE7b20qSzX4TraRLSBhj/UclFZ+61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Thu, 19 Mar 2026 14:00:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 14:00:16 +0000
Message-ID: <3aa996d4-1ae2-4bdf-9a07-0c6c345e9328@intel.com>
Date: Thu, 19 Mar 2026 19:30:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-5-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260312090657.4026013-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: b91588fc-ad7e-4735-2d26-08de85bfd89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: K/euZmQ2jEdyvwrhnKJdNLJJj3+ioJ4RlRzZQjPmvvtDr81iYvsPn5GYyxlyExiFqIQJrDptWBkBhSvHWzdqWyOl+/LetEIVQG0GJkfDTfFaGP44ciRob0B02PjyJN8ARxT8QgJ8kELWnN82omSNX0TDhl0rZkuBtK3jROUoA04d0MipnLFlPk/ArYlcz2hY0/FSz1OkTn8Xjwrh+4oX5DUfUkQXZSpC8geljN0CuIztd3PdGAcUlczHkS1+l3mZv439DdRbVrois5g3egdGWXGRl9hQhQwa0EDhtiSo708/VozmIYEiM7MTxN0Wx7eEMfl2F4okdQwWO94K1GdUemHNoLaXjQ1iql7SjmVpexLIVygBu43io7CplsCLzY8toDbJXqi2zjJGKGGnSpkunPz9vFMWx5f3xYnuncXaaqUpjA90o3hlrPHZe/YWwNiAS/Y6KnLUHk6/nI5H9rtaW/HjtexwJuldrfjAf5KDSq8xJ2DGpGV+6beIpTaIV1pN9tWBzH7nOm3MlH+8n2xZpWlnPeRWX8+/3becqGY46kBFHUusNzYICaRTy+2I1ZCVJh6ygE/EIdzMWhy/yxZ8uMR/KcgibF4z+ICkSxDbz/GnzQEeifn+EeSk33csOELNYNU81DFPb6yxh3iSrRqX3mH0YP6PMn7gdfwnXhV0RSWXXazN+3LoVjKGBMY/gYzdMPQOwQmHlP5d5jFcuEj2CyZ4rbQSDTCkHSB5VFL/SpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkNKaEpPd3dvRXNObkNjTEhvTUVFQXhZcTRYb21SbjQ3czVPeGpTSytJYXdx?=
 =?utf-8?B?MlVtZHcxZFBwMVVRR0JqMkZEQVN2bWhEYWNOdWdVcnAyc1ZVMjFvNnNDQVdu?=
 =?utf-8?B?ZzVtTFl6eTZRVlduRmF5TGNZQmZYTnArVmc1b1dyMHZHY0JXRG03S2FOZ2lh?=
 =?utf-8?B?YjlianQrSlpFa3cyc1k1SC93bFU1QndIelkvRzNkV2R6eHdldXNPQnZmL1JQ?=
 =?utf-8?B?MGxVOEoxOTRwSk1mby9HOFp3ZVZwdXEyVEluaUNMYWRyNmRZTzl5SXV3S1hh?=
 =?utf-8?B?QStxVVJoeGZOa3lwYTFJOWxJOFNjV1l0VzcyZmxpZ0hrdENRcEdiVlJmNlh6?=
 =?utf-8?B?QzJXSThLU3I2R3E0ZnA1dnZVQWY2Qmg5M1U2YVBRTnFCdW81eUVsUklVVGxI?=
 =?utf-8?B?NTQ3cnBIZUQ2TGtqR1BxaThiblN0R1psZVV2a3gxandWbUVnaTRJUE1qUEZT?=
 =?utf-8?B?MGdZM0NpY3RDSFhNdHdVVkRBR1VMak9mTnpOQnFSK0o3WjBWaFlwQ3ZQeEEv?=
 =?utf-8?B?eCtkRHJRa21TNlpaLzZJVWxsdXM4UjlmaDIxbU84akZBRU01aWdhSlZwaGp4?=
 =?utf-8?B?TUNuMEs1WjNRTmhyQjlTd0R0NnpuYUREb1lialNOT3Iya1lYR1NBS0oycTQ5?=
 =?utf-8?B?MDVkdmxDZEo0c0JNKzRxS3RrcW1hUXdaQ2Fkd3RkTjVVSzU0WWtjOUZrSE9X?=
 =?utf-8?B?a3dQRk5lUFpONWtYb0krN01DM2pMSzZBcXNkWk1aamJUb09OQ1QyKzM5YTdH?=
 =?utf-8?B?RzJydFZXdU1DUXdaL0NWdVdvL1pJTjRDS1JHSW1QV2hqQytJRFdtMEthWmxx?=
 =?utf-8?B?cXJjNXM2alJtaXpCNjAwSHlNcHlUcnVSTFZiQUU3dlJQa09jWFg4NlZ3LzBL?=
 =?utf-8?B?TU5sbjZkTzMxdG5QSnpwelRBTjhveWVoN0RWY0p5eWVSVTM2UDhocXlPY3hi?=
 =?utf-8?B?dlZmbitrU3crQndVRkNrdFYzMFJWYmUyaGJmWm1uT3hrSkVIQ2Q0Zkh4Q29S?=
 =?utf-8?B?M1dJOE9LOXpHcHpNODlmUWtUMmllTFBsQ1NQUitCNStOQ3lSSDdjYVk0b1V2?=
 =?utf-8?B?K3VWMC82TkZkNThJR1BOQys1ajYrSUw5Z25qQkYyMGlRVy9OQVNhV1NoZDQ5?=
 =?utf-8?B?Vkk2K2FlV1J6aTQ4YnBCSEdiUkxxYzFwZzZxMEkybWN2Mm5mbXRDOUpRL01o?=
 =?utf-8?B?dXVEOXdLa3o2NTdVT2l1SUViZFhkWDVOdlFIeVFFYzVvMSs0aTJISHFFRUcx?=
 =?utf-8?B?Y1dPSkVXa0w0VzFBN3F5ZVdzYWVKeGFmMWYrWDQ4ZnhjWFNBMG5sVEhLRUla?=
 =?utf-8?B?Rm10SUkxNmRNODNoZElYTVF2SmNSeCtnQ05yZkdqUWlxU0ZuR3VPdWJKUWth?=
 =?utf-8?B?UWl2bkVZRHFzWUl1a2ZvOXFKdnpKeHBuRDRXWHlXaVZyMzllWGtCZXlUYjBs?=
 =?utf-8?B?ZnFILzB5bGU5NjJRdWtjSkpUYjdEVEJjY3FtSkdNSXpHaTlqNm5oWGJjREpP?=
 =?utf-8?B?T2EzcWY2em40WWpadHlkc1dhbGo4czZsTnFaVHpYeFNGSjd0UFV1V2ZZT2w4?=
 =?utf-8?B?U3F0ZFN6MEVkV0RpQXhkTk5DeVRNSWVKMDR2Q3ZkL2F5VlNrZjUvTmVtZ0ow?=
 =?utf-8?B?azE0RC9udlo5bU1lUjNRb2hkKy9DSVNDeXk1djV3d1dwRHp4dzVXVGM0b1Vl?=
 =?utf-8?B?K3ZzTklqaC92Zk1yR01RQ0VSRHZqYTY4T3JYb3BYRjNROW1iVFU4WTArKytS?=
 =?utf-8?B?ekFYTTkwcnpjLzNCZ1pZZkFvZkQ4NjFBSUhNT1phMC9OQU9ROEhEZ05QQ3JO?=
 =?utf-8?B?YVp6SXkrb1dSbjZ2NWhOMll3M09GYi9FbXJLWEVOMGFvVUJzWmNFN3lIdWVx?=
 =?utf-8?B?Ym9RYUR5OFV3T0tHTFhuVFlNekl0TGtrYzVtUWR4aEVOSXBHRFhWSDVIdFo2?=
 =?utf-8?B?b1pGSU4wQlJwQzRxMmh1dEttUUJFTGFLcDcvUHRyMTdnKzdBZStEckhSVGt0?=
 =?utf-8?B?b3dUR0tQNzR0YUdhV1dtc21DU0locHl4WjQ3Wm9NVUdLeldwaWtabzhSZDdL?=
 =?utf-8?B?UXJtRHlPMWt1RUQzb3YzbU5reEYwTnVpSzczUCtUWVF2ZGxmN2J0WUFiRXpo?=
 =?utf-8?B?TFVuUTJrZjU2NDhKL2oybGIyRUtpbVMvRXRodXJiYVpCVkNMOHdwL0RNT3pY?=
 =?utf-8?B?QjNsNHJnSmpjVGwxZmxMSjg0UWY5T0dVNU80TnJqd1N3Q1pmQXB4d0NuTWlo?=
 =?utf-8?B?bTNZdVZxckF3Z1lTQ0xWTkUzVnc2VjlMZEhMNWhEOVl2VWZ4OW5BcnUzZWtH?=
 =?utf-8?B?dUx5ZUlHd2N5cU4wdUN1OS9BT3RUWXBmbUNDMU1UOTlIODFTbmxyQT09?=
X-Exchange-RoutingPolicyChecked: wG+0c3nm5SScK3oJhXtY/X5MRUu+b/YJ3pOZ3/RpN0G/3Ft2mEQeOVr/03T7bgC3yWxjG63lWm+2XhERiuknYvtDJXd7lmdTWncxPsN4JfIgeIkHnequH/uscnqK9pcgQXvInepL3bAft1EUe/cqjYuIjrAcudLP+gl4Wrifp3p4FuCt54Tj2Z1Gy2Q2Z1DMvP6WSxlCqujXOsqAmeq/Q6PxtSdVHlIcxh+Lr0EooepfMIVgU+5k8y22elGVJBFIsJa9KUxtXs6vPZdJS5Co8WvdVhGeOqxSw5V9P08rPegk/oa1ETJrzw4nVFY2ON8m6mf3BXFgQxvSe/wya2l3EQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b91588fc-ad7e-4735-2d26-08de85bfd89e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:00:15.7455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9eWCBAaxhF9J03o5wI2/Uu2Hfx3t8XLAZenl7Ee4VDdEPKvtaSj4MPJQChnx+qftitKa2SiI78pByk9LeTUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
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

Hi Raag

On 3/12/2026 2:36 PM, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 89 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 179 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 373adb20afb2..9811cf732260 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..37a996a6abf8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> +	XE_RAS_SEV_CORRECTABLE,
> +	XE_RAS_SEV_UNCORRECTABLE,
> +	XE_RAS_SEV_INFORMATIONAL,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> +	XE_RAS_COMP_DEVICE_MEMORY,
> +	XE_RAS_COMP_CORE_COMPUTE,
> +	XE_RAS_COMP_RESERVED,
> +	XE_RAS_COMP_PCIE,
> +	XE_RAS_COMP_FABRIC,
> +	XE_RAS_COMP_SOC_INTERNAL,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *const xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *const xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> +{
> +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> +
> +	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
> +
> +	return comp < XE_RAS_COMP_MAX ? xe_ras_components[comp] : "Unknown";
> +}
> +
> +void xe_ras_event_log(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
> +{
> +	struct xe_ras_event_threshold_crossed *pending = (void *)&response->data;
> +	struct xe_ras_error *errors = pending->counters;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 cid, sev, comp, inst, cause;
> +	u8 tile;
> +
> +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
> +	xe_warn(xe, "[RAS]: threshold crossed, %u new errors\n", pending->ncounters);
> +
> +	for (cid = 0; cid < pending->ncounters && cid < XE_RAS_NUM_COUNTERS; cid++) {
> +		sev = errors[cid].common.severity;
> +		comp = errors[cid].common.component;
> +
> +		tile = errors[cid].product.unit.tile;
> +		inst = errors[cid].product.unit.instance;
> +		cause = errors[cid].product.cause.cause;
> +
> +		xe_warn(xe, "[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n",
> +			tile, inst, comp_to_str(xe, sev), sev_to_str(xe, comp), cause);

We can have minimal logging here with only severity and component and 
add additional logging

in following patches.

> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..22f035fa498d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_sysctrl;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_event_log(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..2982c4696b6d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			16
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error - Combines common and product-specific parts
> + */
> +struct xe_ras_error {

error_class ?

Thanks
Riana

> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_event_threshold_crossed - Event data for threshold crossed event
> + */
> +struct xe_ras_event_threshold_crossed {
> +	/** @ncounters: Number of error counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 47afca586bd1..1833ecadd9a1 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -6,6 +6,7 @@
>   #include "xe_device.h"
>   #include "xe_irq.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
>   		}
>   
>   		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> -			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> +			xe_ras_event_log(sc, &response);
>   		} else {
>   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
>   			return;
