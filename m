Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DB9C27C53
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 02:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0995E10E0F1;
	Sat,  8 Jun 2024 02:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c40+XJLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F09310E0F1
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 02:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717812847; x=1749348847;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CZ4h355iAUm5uYw6+kyBoCWeZJz1qFQOsqEuMzEZf68=;
 b=c40+XJLMlIxFZFtWwCaznNq/Hbz5J/5UjSNvRxcxyLYhMTk8MHg9sC10
 HiXwrLzBWq0RD1W761fk9toRqlSlGIq/qQ0cmJxK+ch635cXfC5hhIDJP
 V4MerSv3m/9QnGwgbDRiElZLw0Ot9hFMr1LZJt6LR9pTT+5+91wp81hqn
 7IeRtvsVXYJnHKxJ6oX444xlFZ4qub5h3ZV3J2UfxBPk05t5zHVM+W12W
 Gj66+09O5r+pydVyudJJEUOx5a46pAZG2tWu9UcEqWJH7Sr0XDcBZhZkR
 4maxCqXfCseXerGAM03gRujc8fQaTZp+7hOuGDY6PRfzlwP6LfsX86um6 Q==;
X-CSE-ConnectionGUID: eXxlaw9mSl+iK0mALpvhOA==
X-CSE-MsgGUID: Vhq88jekT/uHfJhG2+iJeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32093884"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="32093884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 19:14:01 -0700
X-CSE-ConnectionGUID: h9O3d3HeRFuu8NnjEjLlJg==
X-CSE-MsgGUID: D9qbSSVaRIyNu2YLHOF+4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="43632001"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 19:14:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 19:14:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 19:14:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 19:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+xGoq+uc3kFtCKJYu1pQGGjdiTMamJc7wjLR0NKn7S0PqzfQ0H2eGwzZilpI0/tW64EN3mhCd1Do53D3IW0mZT5ViWTXT7dI05iMob3shb2DQ1kAp18q9euDYVqnj/U7IHu7hBvMRVxUAU8KgCyunq0xefa5/65hUHnbM7JBpqB8D+92bRvRhQe3Aj95pL0Axc8OHynt/qBWeWzaFYeEc6mLOkh08+LqjqlwgpfwDNjTDfQlrtJN/kb7JDTE5NxUlxm37ozHOzKSr7gv2rSxmuUABNpqXIZXE2Vje8bfUYYZrJxmpZYgJWmBwvbY32gqky3Te9T1klUVqHgHocD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRY1+/HFkAAhhIWrMRxTNHTOCvb8odtIgciVrg+2zwc=;
 b=js4GRz2v3kl+8u/NMGudWd5CKgLllx7Dc/jq5TW9yS1AJ+Sc99/pONR1kpyx97XsvyouGXMIDseRjMdBJmH4ak1USCrDYv2DBJ7RFBL/qlOz+tW+CPRMzVYGb6vK7LsYRPXbtplYzL4bpDPZIqGWuS/irM/xqDjSV+xlh9NypO/4DMCfM3a4MmdGce1hwjjDouF4nTXF409wLZseg1qQkjuR7TM+nFRIG7wZ6KmCpspf6/aPWvPhpHR+dIC7T+W4fTefcYFhLxXE4mfxonJDrQl6rvc8KcIyLy1YPdn7uH6I4dj9zfjGacgOpRWC7Q67ULZEsSY38xcxCsPKVAMgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sat, 8 Jun
 2024 02:13:57 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.033; Sat, 8 Jun 2024
 02:13:57 +0000
Message-ID: <a14e0277-1158-4266-a710-8c64340cd5d3@intel.com>
Date: Fri, 7 Jun 2024 19:13:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe: Sample ctx timestamp to determine if jobs
 have timed out
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
 <20240608002103.2371696-7-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240608002103.2371696-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a24fd60-3d2c-4c2d-97b2-08dc8760a732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alU5SkJVTVdWMUtjNmlyb3cvbWJ3Z3dyTW8zVDRZNW1OeFV6WjhIcGl3eFZV?=
 =?utf-8?B?SFVMM2lkK0l0QnRyWWQ4MnZJUTNJVmVseERiVkdhZE1TSy9qUWMySEtJZTB3?=
 =?utf-8?B?NUJDaFJHU3d0MllpMG1QUGJwa2hkMGNyWEIvWXBPZDZ6RUhjQlhnVUlzUkgx?=
 =?utf-8?B?UnZUdWRDVjYyZ1BuUFZFTnBiVkhOWkdta1hkMWV0N21qcjRGWFpBNXVsdFF1?=
 =?utf-8?B?WkJCTUh1VmpmU0pwZ0YycmtDTEdrNFRQVktDS29lZkR5bFZOZUVScWxCWE1s?=
 =?utf-8?B?UUpRUm12L0I5QWNYYm02ZXlYcUpUS0xRM2gvNUFIdWFSeDRJMkRWRXBHZXg1?=
 =?utf-8?B?dXRtcU0xVXJDaDdzZU5MTUxVZmNZbUVnVmRlTnp2K0Y4WENuT25zRnd4bW5i?=
 =?utf-8?B?UmVadmFMMDhwY1RUNTcrTkJNNjdpRk5SclViV2NnWkFXT1QwVmhYVm00TXE2?=
 =?utf-8?B?QkdWRGw4SFNSbmdWZjk3WlNWY0NSY3FUNXNDZm1Xc01nbm0ydkx1WXE4bXZs?=
 =?utf-8?B?SitqWmRINXUzWUZuSTdzdWVuSmQrMTcxWmFWVWozRUtJTDFabDNtRnBPYUdk?=
 =?utf-8?B?RGJ5VXFWbmg1cGw5Q01nR1VHKzh4QWZYSkkzRnhUSml3S2xSajlqVzRka1Zo?=
 =?utf-8?B?M2lkdDFqQWNxNTdsNzYzNTBJQjlQUjA1ZVVib3dxODZFbHVScFdrZWRBV0xu?=
 =?utf-8?B?Q1ZMR3Nab0ZMYXB6aUZhSjBCNUx6YVlVT3Y2YlI2cTdYMmZNdjJkUmszTk92?=
 =?utf-8?B?clRGcjEzSHYvTGQ3bjA1V2VKWEM1Q3ROclBQK3B0b3BweGZxQUwrQllCMVBs?=
 =?utf-8?B?eTZqbm0zYVdkZ3NCUER4d3BXak9DV2xZeTI5YUk1WFIvbjA1NnRKQ0g3YjNV?=
 =?utf-8?B?ekpJV011ZDlNWjMxZk0xb21EQXVSa3llREFDcnk2WUZFSU5XS0dCVk9weDdE?=
 =?utf-8?B?TzlIUWtVdHhmMW9XTTFId2FpTjgzK29TK0xyemExZjM1enpUZWVrSERBTUdp?=
 =?utf-8?B?djNMdGpkL2o4ek9PeklrMDEzd28wdVEvbmJsWXZVYS9nRVkxbjNyU0VISnVN?=
 =?utf-8?B?dllZMzg2NmE3bEZ4aTFKVk1Kd0xWcmNTWkh4RC8rUUFxbG4yZzVnV1pQcGFh?=
 =?utf-8?B?Rk8zMkJWbXVMUTVnQWI0dUhpYTBwdGpVbXVMRFBoUVpIbFhQWW56R3J1THRz?=
 =?utf-8?B?RUMyZXJlNUIrUzNRYnBTbEVzNW90REQwRUozVEhzZURGOUdkUmJJa0cwN0ZE?=
 =?utf-8?B?RzlxOTd3SnJVeU4xUGVZMHAxQkU2bUFGWDJ1ek9ZdVRLbmFVbWRVejRoOGxJ?=
 =?utf-8?B?ais2VHdIbXVXYlYyazBiVENDbDdzNVRQUzg3bDhMcXBWT3lYMCtsTkJ3dU1H?=
 =?utf-8?B?a3ZPOWpBNXN1UkxhUVJwK2J1MmtZK2FWUjZqakxwbndDTFV1UW4rRXNnMTlR?=
 =?utf-8?B?YlZYdWU3MEdKdTI2a3o4VUxJb1JWTSswYjUxdmprQ0UvRnhHZHJ4L3hSOExa?=
 =?utf-8?B?L3ptc0NmMGZSNkJSamh1NFRsaG4zdG5ZeStEZFlsTHpya2tpbnozTWJQWG5o?=
 =?utf-8?B?R0w3NEFVR01Idmo1alR2UHRyWUhuaFA3NTdEY0dTRWttRVVES1R2SUd4bERw?=
 =?utf-8?B?M1QwYmlxcXJkTk5qTjZ5anN6bU1CdWwrSHhQR2FWbjB1TGRlQ1pjN0Z0TWpk?=
 =?utf-8?B?WUZXcnlIZkh4Yi80MkpWd0hla1JtZ1ZVbE5GS0owNkY2UDVYS0xjeXVlWlRP?=
 =?utf-8?Q?+mb9eUcLTtBCgceylg2lsmr7H1K3lIQNofgx5c9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXd0alAyK0NCY29LLzUzanlGUHd5dWJvb2VjaDF2c0NvNWROYkZOeGNqdVpy?=
 =?utf-8?B?cXpEQzBrVHd5b0c3QmpKRDBiVEE3K1ZFVmxXNHhQdlJLeXNTS1B1RXhwclJl?=
 =?utf-8?B?SGJqTXBjRzRNd0JQVDZROGpuMW9lcGZuNUhtd0NSd1MvdFBOaExPRFdSZ3hS?=
 =?utf-8?B?SVB6SDcrVHNXNXNFeFF3bHlLeFY5aytxUUZhNTFwZy9hV0FBdGlReXBGQXR2?=
 =?utf-8?B?MTNIekR2dlZmZjhiQmJEMm1JWkdlNW5oSERFTUUvenFsRGFvWHd0bVJjU3F3?=
 =?utf-8?B?ZzRyWGp1WCthR3pXdmpRSFJlUHNyd3N1Zkpib2IramtHRlkyYUtXZzRKZGpP?=
 =?utf-8?B?L0h4Y2lHaXlnM3VxdnpiNExwc2dYSEhhTU1jSWlmMHlDMkV4bmpNVFdzT2kz?=
 =?utf-8?B?em5admNna2ZCYUtkQUF0RDN6WlFyKy93UWVpeG5qdkZFcjZnaWpFOU1jMEM1?=
 =?utf-8?B?T3Y3RXRGdkE2RlBaV0JmNFR5R0VXbDJpMm0xNDdxbE9xaEp4TmhrcTZwQjB0?=
 =?utf-8?B?OWpyd0xkOU9VZVRZSFRxQ1V5K3hreUhVc1A2Wjc1cWN6NHNMWjh6Ly9uMjZo?=
 =?utf-8?B?UW1jRXVILzBuL2pFSGFmbnRhU2p2cml3cXZWU3VxaTBYSHZNL0orOEsrS3dk?=
 =?utf-8?B?Mnl1WVBRcWZTQkNzbkVqRFBaT1Nab3BzOURCY0JUUGxETG9ERnVieWlFZnhw?=
 =?utf-8?B?MXAzOFdDcmtZU2RlZm45bHRESXdRaUdZaUZLcExSQUc3a0wxTTZUcWVyWWE3?=
 =?utf-8?B?RVFxWWZuV0xjalZ5bFlSekRMYXV4RVNjcFR4ZlhYTDI0S0Y1L2dtRlppL01Z?=
 =?utf-8?B?dk5vbWhCRU4vY2p6RkRyZElCZkt4YXZTNnN5eGJRTFpHMjFGWEMzUVlVeVdH?=
 =?utf-8?B?VVk4WEQ3Mk4rbjhDN1VzVFlUTVg5cVVSdkJ0ekVsbzV6TSs4V1NnUUxKTkI3?=
 =?utf-8?B?a0cvT2ZJbm9PcEQ1ZGdNaGUvSXJuR21VSTUweTI4ODJnVThTQWFLd082TjFG?=
 =?utf-8?B?aG5BelZKWUJoM2MvdmZ4U3lpSXFLRUtNVXB3WTlWaEZmUDJVWjgzYkJab0Iw?=
 =?utf-8?B?clRiM1ZKZk1WYjdQOHRPeWRsajBrQytWOTlMbWwrbWlxaklVQlQrU1M4MGpm?=
 =?utf-8?B?Rys0QXFwS3UvVFc5ZXl2TUxyaUF2V1lzSzk0eFR1OHV4RTdndnRGM3BndFFO?=
 =?utf-8?B?Z0dPc09helBXaFlhWWxXcnNJVFE0RjBDVjhFZXZTUnUrcmx0bEpGWGp1TGhF?=
 =?utf-8?B?NTRHbldKL3ZQSVpVZGVSZnlWMXlNU3JNenVPSk8rWCtSWkJCdXg1TEJ6MGVO?=
 =?utf-8?B?cmhqTlFILzczSTlUeEtKYWFTcDBUSXJmcUVGdGgwM2Yvdk9DSzQ0Nk5vZWpM?=
 =?utf-8?B?dzVJUFRkRm52L3ZGekZaOXlWci8rUmptdktZd2ZNd1grNklPaUZVLyt1ejNV?=
 =?utf-8?B?ZEhXTkFDcmxRQlMvRllSMHFjcmY3ZjUzbGhGQitTM1Q1SjltYUNqS1hKbGVk?=
 =?utf-8?B?czFmSldpY1dGWk1rT2RUNGlDdU5aN25wbWpDbGoxN2x0aXlEbzBRdUFWL09O?=
 =?utf-8?B?dUk5TmpNdzNJUk9HZVBzTWdqOFcyTTJSbVlXTmJIV2dqWVRBTTU5T2NIUFdF?=
 =?utf-8?B?QXlETFpCMFV3SVlrM09NNlBuSVZ3ZFhxMWp0RHNUajFBaHhWR3cwTVFFWS9U?=
 =?utf-8?B?cEhtaHZWbk9seUc5d2FkWU50UzdBcENoQjRVSWFPM0t1dm5Bcm5OTmoxdWpr?=
 =?utf-8?B?TVBaYzkxR2ZmeUY1MFI1Z0taYVFHbEdQNUNmUVNIeEx3OUl2Ty9zL2NDdHA2?=
 =?utf-8?B?eTN3bTNuK3NwSVFvUzNQVFhubkdNcG9SZU92YTg1aWpVQVJobkdSR1R2WmlC?=
 =?utf-8?B?RVBVb3daK1hUOW5VS1hmSXIwdzhjaCtpdXpxbGM2S2Y3MWZnWUVnS3lIdXpW?=
 =?utf-8?B?cVo0aTduMCttdE4xblZhRjN2TktUY0FiQlM5cGk3TzFqY2ptL0djY0ExU21J?=
 =?utf-8?B?OCtiWFB0dHJUbGJwajk4UEE2WEx0TWtEUit3SWJpQ3liZWRXU3RGNEdjbnJP?=
 =?utf-8?B?QkdsYUNyNnVxcDlQTW9ic2diNXo1NTFvS1NyM2FSUGhIWWo3ZW5BdWZiMXNn?=
 =?utf-8?B?R3k4OFl6RzhrYnZ0dHE2N04ybGFCd3ZuVkkzYWo5WFJyR3pJRmF0dExGa1dR?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a24fd60-3d2c-4c2d-97b2-08dc8760a732
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2024 02:13:57.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSsb6rLNkl1cqeT0xVLfMuW3mDMC3z+e6VblMVyoCoXhLunABN1q2noPdXU1MewgZdqia2w24c3kZafGO5ccIXnxG9X53LEoS8TcCsrTOI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
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

On 6/7/2024 17:21, Matthew Brost wrote:
> In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> scheduling enable needs to be toggled to properly sample the timestamp.
> If a job has not been running for longer than the timeout period,
> re-enable scheduling and restart the TDR.
>
> v2:
>   - Use GT clock to msec helper (Umesh, off list)
>   - s/ctx_timestamp_job/ctx_job_timestamp
> v3:
>   - Fix state machine for TDR, mainly decouple sched disable and deregister (testing)
>   - Rebase (CI)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 218 +++++++++++++++++++++++------
>   1 file changed, 175 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4464ba337d12..716dd489d596 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -23,6 +23,7 @@
>   #include "xe_force_wake.h"
>   #include "xe_gpu_scheduler.h"
>   #include "xe_gt.h"
> +#include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> @@ -62,6 +63,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>   #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>   
>   static bool exec_queue_registered(struct xe_exec_queue *q)
>   {
> @@ -188,6 +190,21 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>   }
>   
> +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> +}
> +
> +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
>   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>   {
>   	return (atomic_read(&q->guc->state) &
> @@ -920,6 +937,87 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	xe_sched_submission_start(sched);
>   }
>   
> +#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
> +
> +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> +{
> +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> +	u32 timeout_ms = q->sched_props.job_timeout_ms;
Is there any range bound on this? The hardware counter is only 32bits 
which gives a wrap at ~223s at the usual 19.2MHz.

> +	u32 diff, running_time_ms;
> +
> +	if (ctx_timestamp < ctx_job_timestamp)
> +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +	else
> +		diff = ctx_timestamp - ctx_job_timestamp;
> +
> +	/*
> +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> +	 */
> +	running_time_ms =
> +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> +
> +	drm_info(&guc_to_xe(exec_queue_to_guc(q))->drm,
> +		 "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%u, timeout_ms=%u, diff=0x%08x",
> +		 xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		 q->guc->id, running_time_ms, timeout_ms, diff);
> +
> +	return running_time_ms >= timeout_ms;
> +}
> +
> +static void enable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
This is duplicating existing code? It would be good to replace the 
existing context enable code with a call to this as a common helper.

It would also be a good idea to add checks that there is not already a 
pending enable or disable in flight. A problem we have on i915 is that 
there is some really convoluted code around the context enable/disable 
that can lead to multiple operations being in flight concurrently and 
all sorts of things getting confused as a result. Indeed. it looks like 
the Xe done handler (xe_guc_sched_done_handler / handle_sched_done) is 
not checking the enable/disable data word and will break if both an 
enable and a disable are in flight back to back with the disable first.


> +	set_exec_queue_pending_enable(q);
> +	set_exec_queue_enabled(q);
> +	trace_xe_exec_queue_scheduling_enable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_enable(q) ||
> +				 guc_read_stopped(guc), HZ * 5);
> +	if (!ret || guc_read_stopped(guc)) {
> +		drm_warn(&xe->drm, "Schedule enable failed to respond");
> +		set_exec_queue_banned(q);
> +		xe_gt_reset_async(q->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +	}
> +}
> +
> +static void disable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
Same comment about duplication and concurrency issues. Especially as 
this one does not appear to wait for the disable to complete so could 
lead to a back-to-back d/e.

> +
> +	clear_exec_queue_enabled(q);
> +	set_exec_queue_pending_disable(q);
> +	trace_xe_exec_queue_scheduling_disable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +}
> +
> +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> +		q->guc->id,
> +	};
> +
> +	set_exec_queue_destroyed(q);
> +	trace_xe_exec_queue_deregister(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +}
> +
>   static enum drm_gpu_sched_stat
>   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -928,9 +1026,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> +	struct xe_guc *guc = exec_queue_to_guc(q);
>   	int err = -ETIME;
>   	int i = 0;
> -	bool wedged;
> +	bool wedged, skip_timeout_check = exec_queue_reset(q) ||
> +		exec_queue_killed_or_banned_or_wedged(q);
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> @@ -942,50 +1042,31 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		return DRM_GPU_SCHED_STAT_NOMINAL;
>   	}
>   
> -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		   q->guc->id, q->flags);
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -
> -	if (!exec_queue_killed(q))
> -		xe_devcoredump(job);
> -
> -	trace_xe_sched_job_timedout(job);
> +	/* Job hasn't started, can't be timed out */
> +	if (!skip_timeout_check && !xe_sched_job_started(job))
> +		goto rearm;
>   
> +	/*
> +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> +	 * modify scheduling state to read timestamp. We could read the
> +	 * timestamp from a register to accumulate current running time but this
> +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> +	 * genuine timeouts.
> +	 */
>   	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
I'm confused. Doesn't wedge mean that the hardware is toast so all jobs 
are dead? I.e. when we wedge we should be cancelling everything that is 
in flight rather than letting it time out?

>   
>   	/* Kill the run_job entry point */
>   	xe_sched_submission_stop(sched);
>   
> -	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> -	 */
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> -			xe_gt_reset_async(q->gt);
> -			goto out;
> -		}
> -	}
> -
>   	/* Engine state now stable, disable scheduling if needed */
>   	if (!wedged && exec_queue_registered(q)) {
> -		struct xe_guc *guc = exec_queue_to_guc(q);
>   		int ret;
>   
>   		if (exec_queue_reset(q))
>   			err = -EIO;
> -		set_exec_queue_banned(q);
> -		if (!exec_queue_destroyed(q)) {
> -			xe_exec_queue_get(q);
> -			disable_scheduling_deregister(guc, q);
> -		}
> +		set_exec_queue_check_timeout(q);
It would be nice to document what this flag is being used for. As in, 
why is it necessary to know that a timeout check is in progress?

> +		if (!exec_queue_destroyed(q))
> +			disable_scheduling(q);
Maybe have  a comment that the first step is to disable in order to 
flush out the current run time. And if the already flushed run time is 
excessive then the context will be disabled anyway due to the timeout.

>   
>   		/*
>   		 * Must wait for scheduling to be disabled before signalling
> @@ -1001,14 +1082,49 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   					 guc_read_stopped(guc), HZ * 5);
>   		if (!ret || guc_read_stopped(guc)) {
>   			drm_warn(&xe->drm, "Schedule disable failed to respond");
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> +			clear_exec_queue_check_timeout(q);
> +			set_exec_queue_banned(q);
>   			xe_gt_reset_async(q->gt);
>   			xe_sched_tdr_queue_imm(sched);
> -			goto out;
> +			goto rearm;
> +		}
> +	}
> +
> +	if (!skip_timeout_check && !check_timeout(q, job) &&
> +	    !exec_queue_reset(q)) {
> +		clear_exec_queue_check_timeout(q);
> +		goto sched_enable;
> +	}
> +
> +	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		   q->guc->id, q->flags);
Maybe include the context run count here?

> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> +		   "Kernel-submitted job timed out\n");
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> +		   "VM job timed out on non-killed execqueue\n");
> +
> +	trace_xe_sched_job_timedout(job);
> +
> +	/*
> +	 * Kernel jobs should never fail, nor should VM jobs if they do
> +	 * somethings has gone wrong and the GT needs a reset
> +	 */
> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> +		if (!xe_sched_invalidate_job(job, 2)) {
> +			xe_gt_reset_async(q->gt);
> +			goto rearm;
>   		}
>   	}
>   
> +	if (!exec_queue_killed(q))
> +		xe_devcoredump(job);
Is it not worth capturing the core dump for kernel / VM jobs?

John.

> +
> +	set_exec_queue_banned(q);
> +	xe_exec_queue_get(q);
> +	__deregister_exec_queue(guc, q);
> +
>   	/* Stop fence signaling */
>   	xe_hw_fence_irq_stop(q->fence_irq);
>   
> @@ -1030,7 +1146,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	/* Start fence signaling */
>   	xe_hw_fence_irq_start(q->fence_irq);
>   
> -out:
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> +
> +sched_enable:
> +	enable_scheduling(q);
> +rearm:
> +	/*
> +	 * XXX: Ideally want to adjust timeout based on current exection time
> +	 * but there is not currently an easy way to do in DRM scheduler. With
> +	 * some thought, do this in a follow up.
> +	 */
> +	xe_sched_add_pending_job(sched, job);
> +	xe_sched_submission_start(sched);
> +
>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }
>   
> @@ -1434,7 +1562,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   
>   	/* Clean up lost G2H + reset engine state */
>   	if (exec_queue_registered(q)) {
> -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> +		if (((exec_queue_banned(q) || exec_queue_check_timeout(q))
> +		    && exec_queue_destroyed(q)) ||
>   		    xe_exec_queue_is_lr(q))
>   			xe_exec_queue_put(q);
>   		else if (exec_queue_destroyed(q))
> @@ -1606,11 +1735,13 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   		if (q->guc->suspend_pending) {
>   			suspend_fence_signal(q);
>   		} else {
> -			if (exec_queue_banned(q)) {
> +			if (exec_queue_banned(q) ||
> +			    exec_queue_check_timeout(q)) {
>   				smp_wmb();
>   				wake_up_all(&guc->ct.wq);
>   			}
> -			deregister_exec_queue(guc, q);
> +			if (!exec_queue_check_timeout(q))
> +				deregister_exec_queue(guc, q);
>   		}
>   	}
>   }
> @@ -1648,7 +1779,8 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   
>   	clear_exec_queue_registered(q);
>   
> -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> +	if (exec_queue_banned(q) || exec_queue_check_timeout(q) ||
> +	    xe_exec_queue_is_lr(q))
>   		xe_exec_queue_put(q);
>   	else
>   		__guc_exec_queue_fini(guc, q);
> @@ -1711,7 +1843,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	 * guc_exec_queue_timedout_job.
>   	 */
>   	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>   		xe_guc_exec_queue_trigger_cleanup(q);
>   
>   	return 0;
> @@ -1741,7 +1873,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   
>   	/* Treat the same as engine reset */
>   	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>   		xe_guc_exec_queue_trigger_cleanup(q);
>   
>   	return 0;

