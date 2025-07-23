Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B37C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 14:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B439B10E046;
	Wed, 23 Jul 2025 14:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gootx27P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB11810E046
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753281529; x=1784817529;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OJdvYhLKXcf3+oKJFuwbCHwDfCpiie/50b01lBKwNxE=;
 b=gootx27PaM5t2PuAfdK44xWA/KIEIdMYyEg4aM8I3m59g92ySD14bQzP
 ILjZZOPy1tftvI6eGvyk2Rx9T51tvLyWWaKIaxhVE8+dFHd5l2F/D5+GV
 pcEfF0wNd+uMJgbdYg0sJGo5dp9KyfjwtOtINMhSJB8Oq4nExi+rf6jYe
 YT4Po6X7v7YwiCjvSFl5cES7y8bDNMgcSh7suHDAOIgyiekSlDo6GxfZr
 ddm+jl01j8mbbPgrudrBeEoy8i+sRXSwBkPd+gopxwTcT2iHUATvSadYm
 Cdk/R0bb+9ey/oxo6y7Ght3MWABvkliiG3yNd3M24dXuxHYSMhj9lU/Ex Q==;
X-CSE-ConnectionGUID: RWzeKel8S+WNQlMumkVOOg==
X-CSE-MsgGUID: v69qRDYLT6qknm24enP9qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55714104"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55714104"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:38:49 -0700
X-CSE-ConnectionGUID: vA6l8/2mQoKBdzV5o3BPWQ==
X-CSE-MsgGUID: e59GoioySiOuKAm0HBYKYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159180483"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:38:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 07:38:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 07:38:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 07:38:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpVFtWgQu4NITyXeggF1+OpgU0kDapxvnU1FcFQVOoIekErmxGDIW/OyDKyO+ZGWfh6IuhpVH6AUzAnjSvyKmXRb8BNpDSgrkFZpxzfH4dbRZ/4u+Cw3xBbieAYiOP7glGHpvaaq64+UfRJcoSbjv/yiNfx1RtZcemiHxNeR/fTts8sI2ZJGeDBdI+ggyc53hbaL0FNl0LKXQbRHehyhVwABl1QFlR8jkDEDwSUvQcqvlcZCPsTX1R64N2SaqO74l7Yc+aOy2+bntq4GgT2g25MyhswI7sSKHNgAN8XdxHedYDlKyO0ciStL1FPuCaKlbV6qMNs+EueK3tE5q9UmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZrUfV7SiowAOvfI28oVZu4/FFs24IdlE7zeaehEsBo=;
 b=kNZV9mslBJ1T7QDeY/NgOZvXuLJzSSZsVksdHU8OuxQWYmvwbr5diM+WEMZkpDuy/Onl5uopqJSybfMViciI17kmgi229TkTK2FxF5rA7k4P7bNIy5l3QkQFZoutWu/Ik95J9LeV76VRPBg+9LEkXaOPC2G7bOCCgaRmLKbwW4CHTOu0eKuYL51u7G8F76vuuh/9yyjfYH3zNXiYD5hVqn2SmXynPkiavZQwwjOofiZhLBkFOeGqFFHw2f2JiheG1V7v+HeEXGLngSFcA15k2/OGaqx/701/6YmGTedvz4uMSQz/pSYAiNm81MuR0gmBml+zsL3wtDraQmWGdGF6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 23 Jul
 2025 14:38:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 14:38:31 +0000
Message-ID: <29753a51-721f-4d47-a8a4-b29bf15db5c7@intel.com>
Date: Wed, 23 Jul 2025 16:38:28 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_SR-IOV_prom?=
 =?UTF-8?Q?otions?=
To: <intel-xe@lists.freedesktop.org>
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
 <175323392980.181993.7561513403662460889@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175323392980.181993.7561513403662460889@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0250.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4fa116-a1df-4d93-6194-08ddc9f698ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SC9qU09zdG9OVDlMRmNQWi90Z1RMV0lYV2xRd2xmNkk1aWJrRzBhSmZLVzNK?=
 =?utf-8?B?VmhTSkhqSWxJUEU1Y3F2T2pSQ2NiOHRRdHQyYUp6bElvcCtKOFo5RU4vblNp?=
 =?utf-8?B?YlUrZkFEelJEZXBib0ZPUkVuNUxkNjE5N0VqVmRwb2JpUCtqL0c4ODlIa0ZO?=
 =?utf-8?B?Y3JBcHpEU2J6THpZcVFYUlJvK0lVVTh3VzB5aGlHMnNRQVFJL0lHajdWOVg3?=
 =?utf-8?B?dnhPRWIrS04xd3o3eW1xL0gyTlVGc3U3anhuSU4xdXBMMGlhU1BvRURxVDhl?=
 =?utf-8?B?QVovbnF3MkxVM2dsblBLLzgvSWhURUdSMWt2N0Vwdlk2bGd5OXJHcTdpdFR5?=
 =?utf-8?B?WWorMWloQjgrZGZTdHNhTEJtM1ZVZDFVcHJGT1g3Qi9ucHF5bVJiajR3SVc1?=
 =?utf-8?B?QVJkZjl3S2toMU5CQU5aS0VzTDNzR1E1NCsyR2RLaDY1V0JSS1FtL3VUZjhN?=
 =?utf-8?B?SFhnZHgvbW12M1dOWUd4cGs1eHdwM3FEL29HL3EyVVBVRHc0MnJWREZzRmY2?=
 =?utf-8?B?S2FEUWpZaDJZOGk4WXdYOWRkSDQrYXQ5RzdCRUdDa3VZZHBYeG4zMHQzakF0?=
 =?utf-8?B?a2djemk3Zk90L3dNcXJ1WkZJVlRWb05mSjVWZjBHT0I0VFNlanc0dEwrVDBY?=
 =?utf-8?B?dElvNlVsejhlZ055L2kxQ29ZOHdSZU11Q1NqVVkrbEkveDFnd0g4K0kvOVh2?=
 =?utf-8?B?cGcvZUo0bnVQWFdpYlNYTzlvc21BLzJWL3Z3TTlQOHRKS3AzaFJNMWxsRmlX?=
 =?utf-8?B?MldxbnFZUyswUitQMkJ3cllOSmlvN1VjVksxWlVsMWlvOGpwZUJMK0MvNjZ1?=
 =?utf-8?B?YXQ3cmlLWVVwUi9CaWw2UGJlNkQ2Y25DSC9kRXdiMElpVk1sSE9weTlTOXUx?=
 =?utf-8?B?SzI0MFdsZnR5WUlDOXV1THdsVlJScGorRTZBRzRlcFJCdktDU1JjSDUrU3d3?=
 =?utf-8?B?UXpUUnlldDhwM0dKS0FrdVducHUrSE5kcUZDNzdzRFg2SjlrdlByT0lNajZP?=
 =?utf-8?B?SkxqcFdLLzFQdzNVbEFNbDhyWHVTL0hGVE9HSFBxTXhWRmVLUVFPbDlDWFB0?=
 =?utf-8?B?N2tvL3NWQmNEOVhVMG5JcW5qQTJOempyWlNtdEduYVMzUGgra0hRWG9wYVNl?=
 =?utf-8?B?cjJQOGdiajJLU2M3dkltdlgvRjRzSXViRzhNOGtJaWx3SzhNcmthTkdpUWtq?=
 =?utf-8?B?aEVheEJ0dHRBTFk5VGN2c2NpRExhUHhRam16eFJRSExnV2I5OUlXeU1OQThU?=
 =?utf-8?B?djJKZlhjN1JuWGhpTzRZOEFMNjBjV3FjV2c0V0R3TzQyUTB2dFlVVkJzY0d0?=
 =?utf-8?B?MlZrNXVBWkxiVkpjdDVwMmUyNW91NXFmSU82QmlBS2huSnV5UXQvWE90cjF6?=
 =?utf-8?B?NVJ2Qi83MVUyV2pwUDBBQjhKMElDNjM5RVZKZEpZMzlDRWR2WkdWbjJ5VmJk?=
 =?utf-8?B?VmJsbCtQanlDV2l2dkEyUFFBbVFpQUtZSlhrRGw2MlJITklScWZ3SEtuRVQv?=
 =?utf-8?B?cXh2YzZPZTk1R3hJbkZodFNYaFRnNXZpL2c4Q3BuWXRaT05KbWtVMEc1U2pu?=
 =?utf-8?B?RG1KbzVjaWVWT1B6dG4wZUV4YzBsSUpMU3JvazRDcE9wZnBaYy9JU3hLMnhF?=
 =?utf-8?B?aEhXSlFSeVlPcnRrOElXUWJYTmV6eDZkYmlwZVlQb2hJaHRScEVOZzYwbDE1?=
 =?utf-8?B?S0VGNmV5dytxUURGL2ZvVWJVWThEeFhBelZ3QWhrMTd5MXM2ckxNbC9oeHE4?=
 =?utf-8?B?NVBaSGV6bGNWeU9DaGlkQ0lkRmtTc242Y045Vis0SmdOM01sNVg2aGo3Y2Ju?=
 =?utf-8?B?dk1VaGVXRkxVcDMwWCtVUTMwbGw1aGYrQ0hkTEk4dit5RmFyL25WT3hkbDhV?=
 =?utf-8?Q?qkmgjTM8DHFOI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVF4UjV5TUtIbUQ1dGN0c2NpYm1kSHpoSkdFLzdCNVpZNWZwcDRsWDFNRG1Q?=
 =?utf-8?B?VEZKS1RUcmpXZndVdnlvaHJMNk80VTNrM2V1STZDWUpneEFtVlJNeFZ0UW1i?=
 =?utf-8?B?Wmo5bGIvUGxYM3BRSjUxckJxSXROSzJuL0QwNCtVTEdPa1lIajNYZHVmMVFB?=
 =?utf-8?B?MDlSQm9jeFY1bHdvTE1rWGlmN1Y4YzRzTmcyL01CYTR5Vi8rNnlpNXhNMmgv?=
 =?utf-8?B?QzFXWXB0dURVUWhoNlBISTNWNXZQL0syV3EwWXVCRmhXc2MxVHdxaTV2eFRV?=
 =?utf-8?B?RU9yYTVodUdnNXY0cE10NHZJZDBwWFJnckdUeUxkd3NHWlBSRXZlVVhlcEQ2?=
 =?utf-8?B?RElBd3NhWXltVmN0NnROVHp1bnVneVczVThVLzVnd3pBRHpDZEtiZ2RQbVo0?=
 =?utf-8?B?WHIvTE5NcitFRkoyVGR2eVdVQklUTUNkSnZqYXlueTJwcWdhbzZRMFJyTTYy?=
 =?utf-8?B?Uk03bGEzYU5TUWU5TEU1K0xjMWgzblV4Tmk2czM4NHp3SWhMMTZSOEdpMHRu?=
 =?utf-8?B?cmZqQVZKRGxtUGVFejJYK1JnNGFwVVVWT0lIM2wzeDBqNS93MVVndUFQWFJ2?=
 =?utf-8?B?VDVWeWhNZzNDVTFtellneksyNU5oN3M3SGRjU3phOFZHb1VacGxONnlMQjdV?=
 =?utf-8?B?bXU5a3MwRkxxUmJxR2VpcjNabEluK2JJVVdlL1RELzlGY0czZ2JaY0JTdUVW?=
 =?utf-8?B?bTlIaHZEYUVicXg2Sjcvb3dEWmQ5TDNnRnNlRGtuSElOc2hLemkwQ0J6bnpK?=
 =?utf-8?B?U2w0ZFpGM2VrSkZoMmYrbFE3aVhzVU5VZHQ4VHlkUFRPdUFCLythWTgyd2Ni?=
 =?utf-8?B?NXhONVN0K1F1TlkyTjFuM2JiMWJaMGhQbnJNc2ZEeWdYT3c2aEpLV1dMN3A4?=
 =?utf-8?B?WjFtUTlqZUZBTVo3UVlpUjVxVkNJT1Z4dTBxZUpaZFdtYXdkTU15L1RpYk53?=
 =?utf-8?B?Ty96ZnU5SWtJeGFvMTVPMncybERKbXlGcnQ5WWE0aUpuRysrTmVzWDdJSXpl?=
 =?utf-8?B?THZHMHRVcFQ2UVJYM0xhUU1pYWhXZnE5emhEY3JQSWh0ZUhlVzlncCtqb3l2?=
 =?utf-8?B?WFBBaTd3bnB2N1BJdUtqUzBkb2xCdDRhd3hnTjFKV2d1c1pwV0hhbURobVpq?=
 =?utf-8?B?eXh1MzNIcmI5RDRFZllKdHd4Z0NkbndYNU9SSTgzMUhtSDNJYlh5UnpzeXJI?=
 =?utf-8?B?eThxODZ1VDVnUGEwWmN0S1MwOXNMclpaWHE4RWZWS0ttUXVGQWFHUUtRU2Nz?=
 =?utf-8?B?bC9NYmVyMzA4c29PaEdyMTNBVjFqT1hSL1gyRnh4RVduYVNLU3FmdmRNT2Jx?=
 =?utf-8?B?b05Mc3YycktDcTNRYmJFeWREODJQeFZrQ0czQkJ0MlVzam9UVFE2M0VCR3Rp?=
 =?utf-8?B?SjZWdzRpd1pWYzNtWS9TWGNtM2NrUmRjcExITTd1N3RpUDBvSjBlQ1RZZVBK?=
 =?utf-8?B?dmNYUklHcDV4enRIR29CbnJsZ1NxRjZ2ZEdtbVRSVDdIOVJXZEpCWFlwcTQx?=
 =?utf-8?B?TnVIcXJEN2tETmJSajN1OWtnRzUwQUhxelBSM2xFRUFxR21Nbjhzd0Ewd3Aw?=
 =?utf-8?B?OEUxNldCVjdlL04vRmtzOE1tQkkrb1dFc2JkZzZLZnM0aWhCanFic3dWdzFT?=
 =?utf-8?B?U2FFR3dYNXNrQ3p6aXYyTG9waTdZRWpRVC96cUlQUWhhZ05ERmdTektLTDZJ?=
 =?utf-8?B?MW40T2VWcGVadG1BVCtsc05hWGRDbFdiYkhDeFJsUjFpVHViZitKR1N4RjJq?=
 =?utf-8?B?cUt4WXBjMHNXTEtWS2d6WUNvNFZhWUhnSGFGMWFJc0tCdUU3cnBoS2dMNURR?=
 =?utf-8?B?L0UvTmQreTY3OFc3NHJOc2drdUJhZUNibm1NMTlXdXl2ajd4Qi9xaVUxYWJR?=
 =?utf-8?B?QjFTQTlNaEhWVnB4UlljOXdGVkt0RDZmaFVQOUpvanpSK2krdG11N1J2S0JN?=
 =?utf-8?B?enBzQUtsWnQwcitqSHYvUVc0Slc5UEgxOFJpL0pyNnB2UGlCMGEzN2pzVUVp?=
 =?utf-8?B?V3grL2RnK2N6THpobHdBdUVLQzNRK2N4REd2SUZDUE1pSUNLZnB0cWJuM0Jm?=
 =?utf-8?B?LzBBVk55Y3NiUS9CSm4rQXdrNUVFdWQzUjVBb08vWWNEK0huU0g1ZG5BWFdG?=
 =?utf-8?B?OGliNnJmdXJqNDBjdFY4L2ZwNFFrQ2haUUU1dnJnUHQ2RjRjL0RMbDFCQVpX?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4fa116-a1df-4d93-6194-08ddc9f698ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 14:38:31.8358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rl2lj0hBkFxNU7p9VnZHZRV2LS+Ong0bwyUwfQZtRV8CdhFkMpS8BgRhMIKZIihA+B+VNJM9TPa13xnq8hiIN6Vw8/WZNF+uEh95SnDAT3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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



On 7/23/2025 3:25 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	SR-IOV promotions
> *URL:*	https://patchwork.freedesktop.org/series/151961/ <https://patchwork.freedesktop.org/series/151961/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3_FULL -> xe-pw-151961v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-151961v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-151961v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-151961v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html> +1 other test fail

unrelated, looks like sporadic

<7> [301.708094] xe 0000:00:02.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT0: Engine memory CAT error: class=vcs, logical_mask: 0x1, guc_id=6
<6> [301.708849] xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=6
<7> [301.708957] xe 0000:00:02.0: [drm:xe_devcoredump [xe]] Multiple hangs are occurring, but only the first snapshot was taken

>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html>
> 

unrelated, looks like sporadic, previously tracked as Xe Bug# 3084

<4> [265.225514] pci 0000:03:00.0: [drm] Assertion `ret` failed!
platform: BATTLEMAGE subplatform: 1
graphics: Xe2_HPG 20.01 step A0
media: Xe2_HPM 13.01 step A1
tile: 0 VRAM 12.0 GiB
GT: 0 type 1
<4> [265.225582] WARNING: CPU: 0 PID: 8409 at drivers/gpu/drm/xe/xe_guc_submit.c:242 guc_submit_fini+0x2b6/0x2d0 [xe]

...

<3> [265.227376] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
<6> [265.228262] pci 0000:03:00.0: [drm] GT0: 	total 65535
<6> [265.228272] pci 0000:03:00.0: [drm] GT0: 	used 1
<6> [265.228278] pci 0000:03:00.0: [drm] GT0: 	range 5..5 (1)

...

<3> [265.233717] [drm:drm_mm_takedown] *ERROR* node [0070d000 + 00007000]: inserted at
 drm_mm_insert_node_in_range+0x2b4/0x520
 __xe_ggtt_insert_bo_at+0x159/0x4b0 [xe]
 xe_ggtt_insert_bo+0x17/0x30 [xe]
 __xe_bo_create_locked+0x2a5/0x620 [xe]
 xe_bo_create_pin_map_at_aligned+0x49/0x1e0 [xe]
 xe_bo_create_pin_map+0x1c/0x30 [xe]
 xe_lrc_create+0x178/0x1990 [xe]
 xe_exec_queue_create+0x339/0x520 [xe]
 xe_exec_queue_create_ioctl+0xb2f/0xc90 [xe]

> 
>         Warnings
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@xe_pm@s2idle-d3cold-basic-exec.html>

unrelated, looks that we lost MMIO

<3> [321.997510] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC mmio request 0x5507: no reply 0xffff
<3> [321.998641] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC suspend failed: -ETIMEDOUT
<3> [321.998721] xe 0000:00:02.0: [drm] *ERROR* GT0: suspend failed (-ETIMEDOUT)
<3> [321.999159] xe 0000:00:02.0: can't suspend (xe_pci_runtime_suspend [xe] returned -110)


