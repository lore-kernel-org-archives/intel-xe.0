Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D975C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 04:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD27410E099;
	Thu,  9 May 2024 04:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbR1WjSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031710E099
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 04:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715229438; x=1746765438;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5TQFV37NACid6Ei0zdHbtaQ9khSIfMhPEfjQx2ovejU=;
 b=RbR1WjSefErItsUhwPv/e8V2+85Q/tgZ9yItbcXqUOaDfDGLOwgvzS2m
 THKsiSVnlWH5l+EfUAx1n2Hnl33emY224AKLYiiJ6ngdgoBZDYVXL51BP
 34Jr0w8s6aVxETxE3iS4tHOgJUr4fPeCegMJKhFHrAeOlrRUTSIqV1nmt
 EBknITryEBPpZmwlMkqa1fRYDZfXRJlQ1WB7gSe1q26fgDkdYtL949Cll
 yj2LOc5/VNysj2vOMfrcPVgw3OVyxrjQdiQTvftvvavLf3ApcMfsHUZ1r
 ZCjV7byzFYhLJLK1PFlqXESuqBKjKURvGkpWfw/q1O3txmJWtSgVow47W A==;
X-CSE-ConnectionGUID: 7nRtKUltSba1iQmWL9Oufg==
X-CSE-MsgGUID: zcEex8rtTkyiyvBu20X+Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33636243"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33636243"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:37:17 -0700
X-CSE-ConnectionGUID: LYyeNFmVQviqbZh3VjWKjg==
X-CSE-MsgGUID: LhE2LklyRAuYOrBDbnVx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33588502"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 21:37:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 21:37:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 21:37:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 21:37:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 21:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG5nnh49x/uH5bqNFjxFlTNN1pULcJeqNE76ZeIDeBiSqx52dbJqGxJGzuEtLBejJzv94dizkO4OxUDCYp7yGEYWDd4OmLNlKp8TBPbYWd0zN7Weo1AemJp421Nm6VQsFO62DZSvVge1em5IgY3NmBKlzk7gf/CGUOF1vNeVgQKa5U5P5ggYI9HQ6zvCDLWJz+eVWzan+rys7JNi5oOXnK7Z2JCrD1Zx6NO1+gR+NWcb/Woo2OBFiCUMYRoKRkbC8YeAlAO390ZRu4eifKozgRuAMni3EOTlX1Ba3RoH6wkzR1pkNU8rNiMTablQRzbdATymghO7Wl/+JMRjEU7TWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkwDlyGDuxmZevGoUpg4v+gNbq5zp/kmhwfHry3OUTI=;
 b=VSvqoSvTOMZfxVGZJb8L+EjH/W6AL1WJOITn5gzGbnfQE88Vdz7njEg6OS7yHpXFxu+ehbaRyhiSGqQjTDwQ7QeZYVfaG95+0vHc4Hjeq/89HUP/g53vLaCl4x+xGXGW4LfUlsVE1NmZNvFkR+oq8dHzQT3T7LYUqVdw+7WhqFTCKbN0kM37C3/dZ8CaFlqYQpl1ACeTmjS6VryU4rcn071RyQm8A1OzCH9EeQTTCS3sDjS7QRiv8uuu9JMCAjkmxzUrmZcbCSmcrjbKVdz9gwEw3OZoVJdp0cBlqXnuHdZd5ZJtVBm3LORq32i6sgj8FN5FUNNMPdYJBgjwKJmfLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN6PR11MB8145.namprd11.prod.outlook.com (2603:10b6:208:474::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 04:37:14 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 04:37:13 +0000
Message-ID: <e495c482-e70c-4ca1-bf55-0a02bc5f806d@intel.com>
Date: Thu, 9 May 2024 10:07:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Move xe_gpu_commands.h file to instructions/
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240508174856.1908-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240508174856.1908-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN6PR11MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: d308c0a4-73e9-437a-fba2-08dc6fe1b2c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmkxbmEvNXZqdHdJTEI5YThnM01GRGdEVGdYTUNFb1JjTytybXc1OUVpWjJV?=
 =?utf-8?B?S05SSUZBcUloRkplelVXZVVLdE9vbzlGenNnUEx4R1ZFNTE4N3RJYm80UnpO?=
 =?utf-8?B?RjNQSW5nS0lYaC9SZllHNXQrWk1MRjhMdHZFMnB5cWorRFFVNElmTm5mSHRr?=
 =?utf-8?B?SENlOUtQeEppemlFTTJ1VGlMai9HTlk4dkVnMGwyclRqN3IrZmcvdlR2TFRs?=
 =?utf-8?B?dG5RM2xOeWZ1cUZtakhadVgweEhoOVlhNG9uWW5aTHdFdnpPeVN0U2RQdWw4?=
 =?utf-8?B?dmtQanh2TEhDZnR0V2V2dE5wUzlTTndCRURkN2dJaU5JODBHeUtrZmFpVFBi?=
 =?utf-8?B?R3ljdVhQYnNrZ1VLM3haeGpRanVTRGxVcDRrTmprdE5RV1RQczNvU2dkQ29I?=
 =?utf-8?B?cjRtK29vQkpHKzNxVEtxVldXYmdaaURwNlVmcW9hYlhlZXliVnpxajBTcm9H?=
 =?utf-8?B?S3VCRE51VkZ1ZHZRTnp0VFJYOVpWSmt4TFdQMkE4Ry92QXYwNVFRejVLbm1Y?=
 =?utf-8?B?ajQ5MVQzY0J4d0dYSmdGTXEyOW9VSzhucGpDY01XbWdFZGNUWWp0dlRHMzFY?=
 =?utf-8?B?aTZrTUsxN2doWEVKSTRZRkhSNkhveWVyN2xuNmViMDJoMitRY3F5U25vVUpC?=
 =?utf-8?B?V2ZxUmZaU2E3M0dUQ0JrOFRBb212WFpvSEtscjNncUcrZy9ZS2U0eEpZajBY?=
 =?utf-8?B?Q1VFQzNvVnMxcTliRmZ0YTdJM1pIclFaL0JIRGIwR1pWQ3V2WS82UkVyN01P?=
 =?utf-8?B?YnVyT2gwbTdpNk9pYzdTc2ZxOEVpUjNHU1QyNkZUekZROXpTSzFKUHdCelpL?=
 =?utf-8?B?SGc0SFE0bVF3bUJZamNMMkNaeVVrbmdkZUFuMGNMRE5KeVRqbFc4YnBxeTl6?=
 =?utf-8?B?Rks4dnZXbzFxbDZRUFVLUm1vUXV4TUNrSWV6ZitDZ05RQUxNeG96bXNLYk1E?=
 =?utf-8?B?d1lLdGJTNHRPcjFVYmxlcGxYZDRkOThUR3lDSUcxQit4OEN2UXBwVlZQT0Fm?=
 =?utf-8?B?ZVU2dWhQQ2JpUnQzc1RYaU1NeFVmdFZodGFKUmVKRnhhWDdJaDVjMzNEc3dt?=
 =?utf-8?B?cWcxZ1cxQUYwNFJ4MkxkTHZseDV5bFg2SXFNNWZ1Q1NHamQrNjR5dkpMMEVI?=
 =?utf-8?B?SThGc3Z4NFh3bStxUThNRnlSQXlLOG1jaFNUMUNoK2FEekx2WU9WKzNYT0Nl?=
 =?utf-8?B?aFZzZjV1K28waXJKUjZUbW5oS01XYllMOFNDcHNVVlpKYUVVMkNDeEVWVFNy?=
 =?utf-8?B?UzF2SVZWT04yR3dKOFpEK3psVzRSYUp4SEZ0YWFPeTNpeGR5YnNFTXY2RnhI?=
 =?utf-8?B?T0xLOFhhdTk3UDdET24wMGM5SWlTcTJzTXhtVDM0aDZzN0w0T0ZKNXRZbGl0?=
 =?utf-8?B?WWZ2aU1vcENzN0gvczVISXMwdTNNV0hKTW0yWE5tSEF2dzE1MmJ0N2dPWjZx?=
 =?utf-8?B?SHB6WWlHY2pPMlY5bDM0WG5nZTdLQTZyeHVpcnpzOTNKK1Jna05rdTEvNGlw?=
 =?utf-8?B?VVNZcUVrVm0wTDh1ZXRLQ2VPSEdJa21RckRJaFIyWG9TNHdrZmluSlpQMXlk?=
 =?utf-8?B?MzkwU0w3TUs4c0dPcy9HYitPaTBnemcyb1JTWDhaOFNUemQ3dlVNY01uL2Zo?=
 =?utf-8?B?NENGMHcrWXVzd3ZYNk1RV3hpdjdwV2JQaGlYMGQyL3Q2NFl2ZkFJaVhRUytS?=
 =?utf-8?B?MWVhTWx6L0pDcVpjUzVxTi9ZZy96YjBaSDdGWTJwMDVRVGhucXIxS3JBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGovTFRQbytONk16MCtxbGJTUnYzODFzTjJ2VFZZcTZ6QXZPQTdHdGdHRkRl?=
 =?utf-8?B?bXdHSlYvYmxaVUhHTE9YZkozZjZteWl5SnEweEhDak1NYlcxQnlLWlRGekdX?=
 =?utf-8?B?WWFCMEljbFE0bTBmKzdlM0tsb1JIY20ybHJ0NFlhbFNIeTIyL01LSzZVaXMy?=
 =?utf-8?B?Vm96S1gwR3dkbUovNXJHQ1h6eWVQVmo1RTVoMHdzWEpSZ3dDM1BwdE8yWUFG?=
 =?utf-8?B?azlNcHBIc2NXcjl4Vk5rR3hkNEJqL0x1RkMvQnRrWEl1RUhNVGl1THI4THc2?=
 =?utf-8?B?TXoydmhEWjVHdjNvVzJtRFpCZnh3KzhWNGpoblRGbWwrMGZsNFJIOWljVXgy?=
 =?utf-8?B?UG5vTk9LRnZreElFWjg1SXlHWGExd2tuNktmNExiQXVZeWZ1ODJYUytrdUhY?=
 =?utf-8?B?dFRZY2k5R2lzb3dUcEZnVTNBUU9MM3lGRmZOOXJUWEVPVWtEMGtvSkVqYWpk?=
 =?utf-8?B?REVnbjhRekxsSjNYaGh2TE1GV0p0b0VCbXhxR1FxTGlVZFNiaDlYdyt3SVhP?=
 =?utf-8?B?cEFScFZmUy9rV2N1NUFJb3ZFbzZGOVFBTXBwQWxsOUpibFIrSldJalIrbmhW?=
 =?utf-8?B?ZFFEZ1IyYUwxNXQ5U2pPeTgzRDJmRSthV1VtS084SCtweU5PUmhFOXlVRVBF?=
 =?utf-8?B?ZnEyWTVIOG1TSTA1OFdnT1c1NmlucVR4Mmtwb2NqelBVWlA3VmN3Z0tlQ1dh?=
 =?utf-8?B?ZHJ0Mm9sMU1nekEvdU5BY2hzYlFYd2l1dWdhcVo2VWRMUUFoM1N0VldjVU03?=
 =?utf-8?B?V2k1dlZkdGpXSmFJTmdDTmhFNklWUXo4Z05oc1dhNWt0STl5Yk5xTzZnNlJi?=
 =?utf-8?B?RER3eGFvdHJUMDJRdExqUGNMckd2OXpibldkdVN2eFpqNDBReE5SY1hrVlMw?=
 =?utf-8?B?dkM0emZHN1hNYkUvQkZDS3VVZzUyMjI5QVJidUV6WXF6Q2RwN05wT3RLaTVp?=
 =?utf-8?B?cTdsNHZQUmNobkpTeEV2NWdJRHp6b25pbmlVY2treUx1bW1DRkRTL3J6VXJu?=
 =?utf-8?B?bXB5TG1mVG9GNjFjdlBhTjlEcU5ETlptK0hzZGhHanYreFN4SkVZbHBqYUZW?=
 =?utf-8?B?bzJLamVYSEJGRno1bjJoRTZnU0RGRkx4NmYzZDhhUWpVT3VNV0RueFFnWFJq?=
 =?utf-8?B?WlRQNVJWc1pXaUIvOFZNSzdtNFptUlZva1RPTGwxTXg2clB3U1c3NzN6TWda?=
 =?utf-8?B?SmduUjdwdm1uMG5ablZJd3ZoaHhNR1pDQ2MzcTdMcTUrM0lmbUhCOFViTEFh?=
 =?utf-8?B?bExYSkZzUEk3SDF4WkVDVW05TUxNYlIwM2Qyc0FZZ0x3VlhJOVBIbDdaSUt6?=
 =?utf-8?B?Z210VjhMRGRvUXpCNG1jTjdGWlNDQUNuNmM4cDVtNXpzcmpJVGk1dmxDbDF5?=
 =?utf-8?B?MEQyc254dGFGY3RVcWhEQTJHUzZOcEk1UzdxbU9nanpUOUc4SkN4TThUdVZk?=
 =?utf-8?B?WndISVB1OHIwVmFHNW1lTHVXYityeWxNTW10NTN0dTBkejgwZ01ScmlFN0dt?=
 =?utf-8?B?R3MwWm1VSmNVUTVXcDhSUGxoM2IyVDdEZ3FGbkJ6RjdKWkxNMUpWYjJEYTlz?=
 =?utf-8?B?WUE3cnY3c3NNb1pmd3VIWW50cWllYWFJM0dqSzBrM1NXZXhCdTh0Vy9PWWRw?=
 =?utf-8?B?Ym5QNUxBZnI4anIvRFJGS0c1N0xldFh4WUp5aWpOOTROYTlhUE1DTEFRRnRI?=
 =?utf-8?B?UHgxd25GNEMxa2x6M242MGJxN1pEaVF2VUNKWWdmUVJCSWhLZGRodDFTMFJH?=
 =?utf-8?B?Z2hUaHg0RUdaRFY3encvbS9oWU12WW1JU1VlK3E4Z2dvTm1HNE1lcmc0c25p?=
 =?utf-8?B?UmtVTHdaeVQwaUdFWlJNemtKcndkdkRpY0JBUzl6ZDZuZ2ErVTh2VytSUEdS?=
 =?utf-8?B?L2dxRVJxeFZXT05HNHB4WHJlblU1RDNpRm5jbnQ2ZXlRRkp5alBGaFB5OUNh?=
 =?utf-8?B?N1plaHRFcTlqck9ZUTdjb2lxcm9UWVZ3Z0szYmVmTlNuZ0dpQXZFU3EreFFs?=
 =?utf-8?B?dUw2WlJVQW1RRkh5WkVmUXRMZERYQzhpSEtVNlNpdmJmbTFCWkNEYVR1cGts?=
 =?utf-8?B?YlgzT0k2eWNDRjFDWks4Q0U2aENtV3IzNVFpbjV3NjFpU0NRUVJEZjd5OXY1?=
 =?utf-8?B?S1pwWEdNdGNRSFh6cmRRckt5SjVMdTRrL0hZeWQxUURlTFhNdmJJVW9LMTJa?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d308c0a4-73e9-437a-fba2-08dc6fe1b2c6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 04:37:13.9201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72bBpfqi21odGYaCGwoX+sjZJi/NmWjy7biOSiBEwaqBGFmMGUro47AamejnGvwCMeirF4YbUHZ+k5ey9ewINYjoMllvvDaExOzJPAg4DYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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


On 08-05-2024 23:18, Michal Wajdeczko wrote:
> All other files with commands definitions are in instructions/
> folder. Move xe_gpu_commands.h also there.


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Thanks.


>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/{regs => instructions}/xe_gpu_commands.h | 0
>   drivers/gpu/drm/xe/xe_bb.c                                  | 1 -
>   drivers/gpu/drm/xe/xe_device.c                              | 2 +-
>   drivers/gpu/drm/xe/xe_execlist.c                            | 1 -
>   drivers/gpu/drm/xe/xe_lrc.c                                 | 1 -
>   drivers/gpu/drm/xe/xe_migrate.c                             | 2 +-
>   drivers/gpu/drm/xe/xe_ring_ops.c                            | 2 +-
>   7 files changed, 3 insertions(+), 6 deletions(-)
>   rename drivers/gpu/drm/xe/{regs => instructions}/xe_gpu_commands.h (100%)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> similarity index 100%
> rename from drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> rename to drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 37e056fde95d..a13e0b3a169e 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -6,7 +6,6 @@
>   #include "xe_bb.h"
>   
>   #include "instructions/xe_mi_commands.h"
> -#include "regs/xe_gpu_commands.h"
>   #include "xe_assert.h"
>   #include "xe_device.h"
>   #include "xe_exec_queue_types.h"
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b63d98872a41..f89c781986a5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -17,7 +17,7 @@
>   #include <drm/xe_drm.h>
>   
>   #include "display/xe_display.h"
> -#include "regs/xe_gpu_commands.h"
> +#include "instructions/xe_gpu_commands.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_regs.h"
>   #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index dece2785933c..e9dee1e14fef 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -9,7 +9,6 @@
>   
>   #include "instructions/xe_mi_commands.h"
>   #include "regs/xe_engine_regs.h"
> -#include "regs/xe_gpu_commands.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_lrc_layout.h"
>   #include "xe_assert.h"
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2066d34ddf0b..a0cdd6977ebe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -11,7 +11,6 @@
>   #include "instructions/xe_gfxpipe_commands.h"
>   #include "instructions/xe_gfx_state_commands.h"
>   #include "regs/xe_engine_regs.h"
> -#include "regs/xe_gpu_commands.h"
>   #include "regs/xe_lrc_layout.h"
>   #include "xe_bb.h"
>   #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9f6e9b7f11c8..36db5ed1a572 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -14,8 +14,8 @@
>   
>   #include <generated/xe_wa_oob.h>
>   
> +#include "instructions/xe_gpu_commands.h"
>   #include "instructions/xe_mi_commands.h"
> -#include "regs/xe_gpu_commands.h"
>   #include "regs/xe_gtt_defs.h"
>   #include "tests/xe_test.h"
>   #include "xe_assert.h"
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index d42b3f33bd7a..a3ca718456f6 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -7,9 +7,9 @@
>   
>   #include <generated/xe_wa_oob.h>
>   
> +#include "instructions/xe_gpu_commands.h"
>   #include "instructions/xe_mi_commands.h"
>   #include "regs/xe_engine_regs.h"
> -#include "regs/xe_gpu_commands.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_lrc_layout.h"
>   #include "xe_exec_queue_types.h"
