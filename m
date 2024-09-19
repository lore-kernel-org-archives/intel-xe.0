Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B53CE8D49
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 04:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D4A10E25F;
	Thu, 19 Sep 2024 04:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpOpijb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD98610E25F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726721685; x=1758257685;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0TZmrGp+gP29KUDmdgoHYmICB3M4/vt/WhEU0dO+1H0=;
 b=cpOpijb0S7+eQeDJ69JMia4UdxnjldBE8W4OyBaD8NwmXXNG8gDXpdTP
 8DTspkiSh+F+FpFw9L+ghTNDaf3ttvwAEc4Q3U7FD/LI9oeG2TU5jS8hd
 n/OdFaj9q2Lu8NKLq8acz2d/c7IByBCiWBfyPfye08BkADM8YeeOLgcFA
 WV7Hm+jQ070Gdm96pYZhAz0w6pAw9DNuQ5jIjQCDzH/Xtzzs+6xJleGHX
 AdAzvANcLkQX39l2uLiJ2WvbbTgw/qe2Ouj7l5lS2iDJ33Eb205AHJaJi
 q34X5YbS7gG0GwR57NLVNCsub5454cE8ZFKdR7DB/cKDjzgkRBXUA1zUB w==;
X-CSE-ConnectionGUID: efd4Ez/YTamvfMgU1Tq2Cw==
X-CSE-MsgGUID: l7LqotYFQn2syrWLUbiK/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36792775"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="36792775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 21:54:41 -0700
X-CSE-ConnectionGUID: eh2rJ1aCRF+q11STNMBfrQ==
X-CSE-MsgGUID: /Bt6GDKjRJmqR60/UPH0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69415404"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 21:54:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 21:54:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 21:54:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 21:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9bbC++K9z23JSgLHnlB3lTXrtJ6OAIGelHZUixzMIpNg5vaUc14sqNsEikBHhLIHbAvZBqNjbZIMuos8BJ4HS/8Z1VbMHMtf1ueOhg2BhfZUlW6kgXUDHb6pK3gLWuHfMMAb02ppRrikgUQwQ5jCEAtdsRNXGNfxXJNZq19nxBXfK/6eyVLtrJ6U4pHzWLOLKsEizJkU4rqlUIwVtdm8qimsZhHGUl7uyWsXf4h2fa1dVyjQWA3h/6XbqztcEQtOZgEL14XF1rCsXVZyrkp/lt8WDieA8DgVeC9OqeEs4sWAfnM5C0ZPnseyLR/ThJgzQEW1KVq+UoGX97NTXpSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P2X79oexyyIN2tj0hjhgqQ3cghMLMuTUl24XVt7ZI0=;
 b=LvZiC5XHZk31wBqk3UfiIk0rTzCaCAdvoLZ4A/4mauHzzYj2l7cIsZ2ULexwVjFLx3T4LUOZn2QnAVIl0ZAY5BGzK0T5Wr1BFOpGxTPu9XzZ3JQNz43UFPf2ygrfVklGgqwFHbqVNhhMeK19Pw+rVzog3F2leDWoylnYHbUGumHmt6cZJgUeJI4LIfnn8AyFYiu4kp4xKuwlBZavkeoxWF0IYRVzWUSLaSZIGgVfk6Q6VjmNfH044JDooxq9lMPpcdiwWcZ0yzPLj3QH9kfMkynS9O4sxWpBTaQJJehfyq6EnpEqUzCTnSuuW6CH2EZ9p5Gm1l5uzoYaewOTvh8TBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 04:54:34 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 04:54:33 +0000
Message-ID: <7897c1a4-721e-4a55-8195-079fa7ad24f2@intel.com>
Date: Thu, 19 Sep 2024 10:24:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/xe/pciid: Add new PCI id for ARL
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f32a13-f57d-46ff-5849-08dcd867277b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U24yMzJncVJWSDJpTWNMNUd4dklxenNPUUI4c0dVbVBVVXQrTy9VcjZJWkhM?=
 =?utf-8?B?U3F1YXhQWlQ2R2VzMTNNRHBxSCtCWGc0SGEyOVpiSlVkbzdnZ0ZkdzlwaXhS?=
 =?utf-8?B?RWZ0ejc1ZHhSZjZpMzZZekJEMnl6d01nOUFaWFY3MVVCSXU1ODYwUlMrdWs2?=
 =?utf-8?B?dWpqNjZXK1JkU0cxbFJIY3p3c0s2bnF0MjNDMnV6NGd2R1pYOEdhbkRzaWpQ?=
 =?utf-8?B?YTFITnVOUit3citPQUlCQnR2b1hIR2dUODRXdkxpN3NZTU5NK1NFUkI4dkhP?=
 =?utf-8?B?MzlxUHNIOGJGWDkwR1hwL29YM3pjOWxXL2QxQjQ2YmR3MVJQcXBuVGl4dUlp?=
 =?utf-8?B?UElzN1dFYzkwa05EOTlOQzV5VnZVVUMyRmxxTkJvTkdNOURWK29MSmN3alZN?=
 =?utf-8?B?eVdUWTJucHQzYm1TWlFsODJEL0FrQjM3bTM0aFRXM0RRN3FJeFFQcEFIV21S?=
 =?utf-8?B?aHplVEF6U1NhcjZ0dytiUzNmbGpsaEZKdmNNbXVtWmg2alFKTGlDNXdNZ0pr?=
 =?utf-8?B?dDhVSTIwbkM0bVhSQzVtVkZzaDNHL0JXMmFSV2FRaGhkaFh3cGcvUE5iNnNZ?=
 =?utf-8?B?SVZvWm5DbXgwQmpwSHBTaFc4eWZKd0hHaDVwK25aS2w1MmNjNkJQZlBaYkJh?=
 =?utf-8?B?OGI0cFl1OTZYK2cyTUdZT01MazU3cHl2dVl3ci81OWdtSXdoSlEzZ3Z3dTdY?=
 =?utf-8?B?NU44UGltenlKNkhjTVB6T2grallUdWtpaHpLUCtDYVFBenp6VkVWdEVZYmQ4?=
 =?utf-8?B?dkE2SUh6M1VhZXJSRUZldW95Y3NUaHB5YmcxTE5DRkFwd1lEOEhMWFdtMk9B?=
 =?utf-8?B?a3YzMDlLd2RjaFZ5V3dYR0M5RWcwOEFYeTJRL3FiNGNubHRnclRveVpvWXBo?=
 =?utf-8?B?VlJMTVNHUUtGU1cwSmtHMmRQbHJNVFYzOTZoWlZva1VCNTZnOUZUVzNzd3h2?=
 =?utf-8?B?WXBrU3F4S3pFeXh6bEJKMHk1ajVRU2E1OWoyZ0lmSEJHK2praGhaTU82Mmlr?=
 =?utf-8?B?Q2hrWlFpSExuRzNwR1BBYkZMWWNEZCtFZXViRkVqeVlyV0xsWmJuY3crdk40?=
 =?utf-8?B?WVFaNllBMjZRcHFjSmo5alVtWTB5Mm5td0ZYR2JXeHYzSTlRYk1zQUFzMmty?=
 =?utf-8?B?K1RuMmFQYnhYSTEra1FDS1E5ejFYbEl2ZnpLUThoZkxlQ1RMMmd4blJyTUgw?=
 =?utf-8?B?S3M4V1A3eTkweTY3MnV1UTZXdFhXbWVydERMYnJOZjRsVUNXeVN2NGVrcWxr?=
 =?utf-8?B?alNFbFg4TTJ4OW55Qm1EWk9MQmVyWEFPbWdsbGRlM1ZpbDRlUkJhRmZtdnhB?=
 =?utf-8?B?aURzZWp3elNTaTQ4UEMwa01NUURtVjVqUlA4UENhbm1IMHdTZ3lZMWRnTWNP?=
 =?utf-8?B?dWlkTjZIR3pPRWxBaWgrNDB1YzNHanM3SFJHUkYvOFk3YXVzU3ArVW9vSWVE?=
 =?utf-8?B?Yk5DWGZTL09jSXRURXdDV1lRTzZyMXpUcVRsNVhHT3pFK1puVkhhclI3dEtn?=
 =?utf-8?B?L2RtcXlGSzJsVG5JWE41bzk2ZHNtQytncll0SFpWU3VNUEtFazdxbUJyb3dN?=
 =?utf-8?B?ZlpJdERoWThHZE1WOEMzWUpvbEZrN1dXd0hxdWhkeXd4dExvWEl0R0dBc2hP?=
 =?utf-8?B?YTdPM3I1MzR4V2RkYk5XQTJtdTJCVVRRMFNsbWk1cHd1L25PdTMycmlNdytV?=
 =?utf-8?B?bHFyak14djNoTzJUYSt4Q2VPanpBaHVaUlFQcWpkdWt5ZFplK20vUWpVT0Z2?=
 =?utf-8?B?WUF3bktobmFVN2ExY0xzOUd3UWdReHJsVEdTYlhySTlzWERTQW4yWGNITEpZ?=
 =?utf-8?B?RzBIVTZJdURPWUVHdkZDQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2ZWaER1RFpQTkdoSjJzK3pzcGQ4WEE1bFlrRTl4N2JmM1BLbVZvVTY3Q05G?=
 =?utf-8?B?eithU2xuMi9DTzhHRmJNeTZGNlZCVm5xcndSMVR5ZzNjQ3kzTytiSjhlQXhK?=
 =?utf-8?B?OTVabkZMM3dLZjVNcU9uZmE5Zy96VmNxSWtNSXZ0aFdRQTcrNm1VblRkY0Mz?=
 =?utf-8?B?NXNzTVpSRHhDMDNBK1lUUHQzbk1VZ21QQUhteVRQd1FpWlY4bE8yVlBsT2dz?=
 =?utf-8?B?NmU2TXBkbk1SNCtoZ2NPKy91WGJDMEdUZlRIVzIwTlVhZ0NaUDMwYUVhR3NC?=
 =?utf-8?B?T1BZb2NXZEY5Tzd4SmZ4RFZ6K2FWeEErSEhwWWdHcVpackJQRUFyN0piVDRy?=
 =?utf-8?B?OG0vWmNwMjh6SzlaN2RwTlk1dVkyUUhZRWdKcG02OFNLcUJ5TGMxTXZUSVlK?=
 =?utf-8?B?YnNpRDB4SjZGOGUvNzZBMHpJRzV2VE55UFY4SGZGNWpLanVyMmc5c0lMaElv?=
 =?utf-8?B?bFhHeEgwSWVGaS80MmdSaGJ2Mit1M2xlZkpqbVhTMHl2OEpYSHZablhzNTFY?=
 =?utf-8?B?dGVzaVpEL0tiM0U0TFNHZW9BL3RFckY1QkQ3Njh6eDJCbDBWTkhFNGRMa2ZD?=
 =?utf-8?B?dnpvNnRhNFN3dUZBZzlIdDRyRnlUa245ZTBjcEs2aFBTM05pVnpuZjczbU9y?=
 =?utf-8?B?MzVDaXJFUkFWSkkrYTF1TlZDZjUySG83bE14WDh5Q0xaMFBvelUvODNKYzZC?=
 =?utf-8?B?WkIzN1RFTVQ0aGtTdy9kaUJOMmVRbkIzenZuM1BmWEFCdHMrbDRPZ2IyTHJv?=
 =?utf-8?B?SjA5ajRhNTRYM0JtT051bVBmdTJIVFhNRkQrZWdaaTVMajRYcXZacDgwTmxW?=
 =?utf-8?B?OVUyVVkra1ZWM2JwSGZxcGNvUDhDS2dpYkEwTHhHdXFqMjlmSmtROG52NXBw?=
 =?utf-8?B?OG95anNpWjZLbmw0dE5wRjl2REJkSU44U25Uc1Q1Y1BUTGZ4dXlwUEdYZ2w5?=
 =?utf-8?B?cHNqcE41NHNoZjVCakg1S0VPQWs4akRzSWk2bmN4Nkk3TE9zbXU1TkN2NFNI?=
 =?utf-8?B?ejJrYUJrWW1wM2NTOTh6S2cxM0ErVWtObUUxTGZQb3FPRVJ2eER2amszSlJy?=
 =?utf-8?B?Tm5NemdaMlRybklZaEttL1EzU0RIaUFCbW5Xd0VoaFNreXpDcXRlOG1RekV0?=
 =?utf-8?B?SEJJVnQ3bzh0TEVrT3poU1N1T0hiMHIxaHAzcWdTbVVuNGVOY3hzWTd1b3RR?=
 =?utf-8?B?VWpLTU42SS9jOGFOYmVRWllEQlFveUxaSlluWWVKbHJudnR5RHpTcVJLS0dE?=
 =?utf-8?B?VmJrbGVRSDlSbDQ4UVk0TWRRSGdhUmcwN1kvTEtxYitvcjJMaHVjbVpqZ3FQ?=
 =?utf-8?B?RzBzRTIvM2x5WmZTcTVyNS8zdVFMYkF3S0lrdHY3T3FOam5tREhzSW5rYWlk?=
 =?utf-8?B?azlXUTAxaGYrczhLSDY2VHVndStBVTFwUnpEdjE2dzEzNGozRnV3cWQ2enY2?=
 =?utf-8?B?aDVBU3g1UndtSXJmZFBlbUQyazNjWU12R2svSW5RZ2RSWGEySHJlZWQ2TkhQ?=
 =?utf-8?B?QXQ5blQ2aXJ4T0pxaHJ0V1RCdkJjc0hQYS9qa0txK1pKUm51RVFxTFBJL1lm?=
 =?utf-8?B?RGZza0dyUUxjaU4vQTJtUUwvRDczZFB3dStneGhQQzFQWWFYRVNjbDFidUhF?=
 =?utf-8?B?MU9BOU9MWk5GT2NaRkdranF3dW5vQ0lSNWt1ZjAzYXpHYVdKdHFFSGNvYm9M?=
 =?utf-8?B?N29tVWhpazJXbU54VjdoMFRCWmpJekhxUnRUOGp1WVFpdDhqV0p0MmRaYmQx?=
 =?utf-8?B?UXl2ZlpVQVVMTTgvdHhzK0dTU0pFQm8wdnFrUW54SWVNTUZUaFhaRFZsUUdZ?=
 =?utf-8?B?QmxNQk5lczdLZExLZnMyOW1Idktjai9JRkFUT0NLRUNJM3pVRjJJczhSNTFX?=
 =?utf-8?B?ZDF4NzJMTUdZcmtXc1QzaUtxNjZCaWRJQTFFZlUwTHFPTERXTk1jS2tnQlBE?=
 =?utf-8?B?M2ZGcXYrT3RHZFJMQWpOY2ZDOUNGVGZ2RjNkTmFqVGhpQmJ6M1RRTzNaSlFq?=
 =?utf-8?B?R3FaZ2ZScE9mdE5tdTg5bXA0TXlqKzNtL0Y2WXdmRkp1SjZHKzJnWDA3eGN0?=
 =?utf-8?B?VmZ0WHBkNXpaVXZpb0hlVmRobGY4Ulh3U0Y3OGMrRGdoYlBHbUl6cVdTMk9Q?=
 =?utf-8?B?bENKVGNiUktRZUVpL0toQlZQbitLYnE2MEtha0xucmNIUk9mZVVCaU1nUGdh?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f32a13-f57d-46ff-5849-08dcd867277b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 04:54:33.8946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUwcWdRTB2++Yf3iZxVFcR/k5vMU0FvzCvWJHJ0b0BPkAXjpiD+FWyv2Vq+6fbMetlwsg5ylojgmkZYuo1h4E2W09uZ1NklKFUaOrqpHnE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
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


On 12-09-2024 17:29, Dnyaneshwar Bhadane wrote:
> Add new PCI id for ARL platform.
>
> v2: Fix typo in PCI id (SaiTeja)
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Looks good,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   include/drm/intel/xe_pciids.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 79001afa7d27d..b733555258b13 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -181,7 +181,8 @@
>   	MACRO__(0x7D41, ## __VA_ARGS__),	\
>   	MACRO__(0x7D51, ## __VA_ARGS__),        \
>   	MACRO__(0x7D67, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD1, ## __VA_ARGS__)
> +	MACRO__(0x7DD1, ## __VA_ARGS__),	\
> +	MACRO__(0xB640, ## __VA_ARGS__)
>   
>   /* MTL */
>   #define XE_MTL_IDS(MACRO__, ...)		\
