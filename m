Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C6109E530
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 01:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66B10E8AB;
	Thu, 26 Mar 2026 01:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQMss5fH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99D810E8AB
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 01:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774488843; x=1806024843;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L+paRy4DWN3PLhiWP8ri3otVexsr38OHFpecsHcn704=;
 b=PQMss5fHQr34U+1//Lo7Vwq0WChCD7p2IBnoiXV7AyiwP6r1zqr7CTHh
 aWq/7CBuHnEn1srChsp1/FvmPr2K3PlriPZo/eA53e+aZAMJy4PJfD2aQ
 xoxVoVCWdCpyNhAIaXut5CthkIqtxqzMMPgo4vkIydIpjUQGCBwzkqQUg
 XxxlwMrvk+b6+aSEOjhURi1QQDzEznzk7wF8cT3BxacD2qbzgXUZZiuPP
 Bz/QOFTm1jnSEZxokRmFt6ss901iOuEfzArQ+uo5HSjD7K/Dx4AhwW8gt
 o3XW+nX+9EyHU7K+2WTQnILsWC/0jIR2nOWXxnCl9mHFeJ0L70m0H02Rs Q==;
X-CSE-ConnectionGUID: 5BqkXmyhSD+wBAslBQyVJQ==
X-CSE-MsgGUID: eF1BkSeSRcSN2/ktnYJgAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86157471"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="86157471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:34:02 -0700
X-CSE-ConnectionGUID: mjrlV5S1TsuT7gMMujRmLw==
X-CSE-MsgGUID: 8IzvPEjtQQudTpAO5nrjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="228918616"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:34:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 18:34:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 18:34:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 18:33:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhG0Gh2f9ygXoNsFssKhsyp06V1CiJBPBkwdRygRNj2wroWag9eAkofKDuqY77anaH43JPfLLDsMrtHUr95D3869zty8PhTBpDjb73EQ+McVOjMr8VYtoByGVQnsAlxWtnkyUuIygkNPx4TIk+EYTgEYhrEmmON/m+zw+2AIG2ZSlVzLhpfjnfCFKys19qi2N42rNuxYscjE0PhW8HSnc7pQIXTmdYJB5eHqQLA/AIcdMqPIWiPGKXkAIliXDVFP9ltqAVzLvKDMGrntx1asHhOnaDdz0ZX14Q60mmJ0wqhR9x6nJX/uP+ZRsdtnDq5DdMk7A3svt8JbZ3eWu4lajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDpO9xLqP0QA58Rns7E3/pY8vxkQGdaOwRc2NSDcl1g=;
 b=HjD0TCZDv/kqGO7eTHuHasv6+Bxgryw7+9B1I7VSC9ZxCBmiAu77qsNsuP+tXOCLc22OEFlQG+zBg31XTJI6+QUKh6mV3g0YWABujkoBo1vmiMIPXPwiPHOHg7NYdufed2+QdMy5lNov9BhWbPuXyZb6IGYiIVyq11/cj977ml0FZwRSTtXmpHHuWW0wKtMSy4SPufmj62M2v8Z16SL/i7DULqol2+XDXU6jK4aA7q/XFoyJsS+uaq+HpG489ZtPnKrY747QkmzEb6v/rYRWh7YCY6OB1ORwoHLULO8ptn+Jz7RodQindJHAnUDAw/RaGcsET0XQ1+vWTrpk6mVDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:33:54 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:33:54 +0000
Date: Wed, 25 Mar 2026 18:33:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v7 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
Message-ID: <acSM//v55wHqdto2@gsse-cloud1>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-9-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323093106.2986900-9-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|MN0PR11MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 88896bef-deea-4cde-8fd8-08de8ad7bdb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Ua/qGKOEW0TulO3dCByJfxc82XVae+UJQuFnwea6U4/cggFOCLJ4XbVvmrGAsqL6BF47UMvDY8n/tXCgcWhVgJXL9NRDTUTyvKp4Cnv3bQIV4yNTBR5Wl5GPgZfcv3/ZfA0euzGF7sepHxw7AEwh71VzBGypKpg1VQkhmnr45vJR4NhYhkb6m6Z/JqYHakMtlx4RBU9O0uz8I+O3w/SzCIT3syjMEtCn+EUFQ/T5148PF4udDvDj8NNzNDLDSY05ghLx7yfnLBLYOiOnYMwl5u2Fsw+YHJ8GY7dCsNmrH//BbhgLHGkUAN+mymk5iiaVnmFG88coDO8gfje1PK22GUdY6wJ78k2hqWr4RDb6Lf79BFnTyHR6yVhKisr1x/T1SwzAHQVRz34UbRObXfk07KcRVX7rS2lTwUoOO3Q+0+uytQYv8Un6sn/Ekox4kgIYSTcQzaKCP1bgVAha7B7NmhvP381wBCOJ++tobNN6CN/PlYhxH6pOQSq78P4A8HsTmA4+VBj6XkTbSpgckta84+sdQiK1KBM8C8lBEe24HrwPRmc7dyiL3+x7O+rK92StpPsziTL8YLskcYGoG0VEYuSNJ20qL27rnLSem1qDjBOQfOQWTU4k9K+PY0zZHkU0A8eQ0+ZAwE6a97JC06TsBKtwlIQvTuzpxj0BZy3lP53BD4YgonBbCHhNKVhDTYHsls0jzXhiE6F4SFYybVdK2H9GM/o5jBdWdPOPBhI/VJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmdUZEsreEk3VmhrREJ5UkV3NzNjU3prUlJGekRuRk44QjNnRDhjTjhjL0p3?=
 =?utf-8?B?TG1JdGJuckJ1MGVPQ1I3cEZVVDFmM01iMi85UTFPV3V4cjd0UHE2Y1NTdnRz?=
 =?utf-8?B?RG5JNnhSNG0vREJ1SkhMQVJVNEZFL2FqR2xLdFhnWE40TWs0U21DdjNKb1hh?=
 =?utf-8?B?TDg5cEJEVENLN2lKbGliZ1NDNG5rQk5idHVUYXlzY3lRSDk1Nnp5NFBPN0d0?=
 =?utf-8?B?bkdGV2JnQURhQUp1RzVJNUlkUjdrajVrQ0cycEpXdWRhU3JEazhyVlFwcm5z?=
 =?utf-8?B?RTFyOThtell3dTV2N1NIOXoxQ04zM04zSWtNQ2hTZXdHS2duK1pxTkE0bmho?=
 =?utf-8?B?aVhTQUxtUkdlalRzMXBnQXk5amxjMXZ5bGJmQzJEVVc2Q3U1UE9lcTFONVlM?=
 =?utf-8?B?dEY5dk41ZkJqVGxERGMyak9FK3JOK3crR3BaOWRsK3pKWmpRdHdNYzBjOEo2?=
 =?utf-8?B?RGlETTZhN3dJM2RFaVpueVNPaHRvRzJSWDY2NkgrYnVlQndWbHZvRjJPKzRr?=
 =?utf-8?B?QW9RRklUeGtJMVl6VGI1eWtySklvdXBOWjFsTzFsajBHalh3cWlPSVNWUmxw?=
 =?utf-8?B?YUFRZHF4WDFZek5qYWQ0czQyM1l2dll0MTNnbE1tNVpiSnFnbkF1bEFuWG5w?=
 =?utf-8?B?MXhSZXJQUHVPRFhDUWs4OVJLb1JBYzZUelRNZnZFSG1hK2dQcElOVTBRY00r?=
 =?utf-8?B?TnVLK0o1dS8yRGtVd3hUbkZYUGdJK011SVhRbno2UUFrM2djOTZxTGZhOTBK?=
 =?utf-8?B?aVBxb0EwZGtGYThDUGd3TVIyWG1sVDBKN3p4T0M1NDh5eENWTUhWZTd5MUtZ?=
 =?utf-8?B?YlBZWVVubXpxYWJRS0hUK29YNm1lMW5IU2dad0lES2hkVEpnVzJWdmloZEtq?=
 =?utf-8?B?ZE83TWJzbnByY1hiOXlYNk8rYmlUMFluMi8yUVhiV0s5VXhXMGhFcEM1QnBC?=
 =?utf-8?B?bjE3TTVzK1pIUVJxNkt3T20rZWhreFZRZ2JXaWkvVDRrTEk4REd1OWVkcHFx?=
 =?utf-8?B?M0VyQ2ZtdWxXcnBZMFJKc3lhcHIyZzNUQUdKNTAzMlk3d1RyQmNCY0pLcFQz?=
 =?utf-8?B?UUpFZjVsTFNya0JPcmMxcERqVnVFcnpkaFpBRy96VW1ZV1lqMUhPQ3NsN3Ra?=
 =?utf-8?B?dzhhcjlQU0ZjTGNEUkFkTExnajdXQ3BoeGV0M00wdG9pQVJhdHZpbVI3WFB3?=
 =?utf-8?B?S3NOSGFBc2hFRFhnZlFuMEhNQW05UmsyQnhPNXhlNFRNbTJDMDFCMUhhZ0dm?=
 =?utf-8?B?blVjWDFLYUd5OTNPR1oyUW9DU0xlSHZ2RDFrMWxQdEpjSnlDa1dOVTRFN05q?=
 =?utf-8?B?ek1vK2tkc2ovc2hhR2ltQkQ5YXUveUhNSmcrUUlJT0lCWHk5QlBJRVRwOWRz?=
 =?utf-8?B?Z29WMnY4MTNQMDhWNWZZK2JUcG03clpEeXd5TkNHNExqSldtYjZRVG1pOEVw?=
 =?utf-8?B?Q1VoYkhhNGZ6MXkyWFJKa3k0QUxTUGxpYVk4MTRVQWswTVgzQlBNWm5JcmlU?=
 =?utf-8?B?bmVoeWh2S1U1NGlBeGg0K2UwbU1NaHBwRTE3YmtPNHI3b1phRDluMVNCem9x?=
 =?utf-8?B?QmZDY0JldlRvWElaNnVCQnAyU05PYThpa0E5L2w3eU8xTlE3VG5YbXVySm85?=
 =?utf-8?B?R0kwRUQ3Ynp3TGhMZ01OS2lWRVBBTm9ZcU03WDFnVzRIMkhBY1dGV00vL1Ji?=
 =?utf-8?B?UFhqbzNMQmpmL3hqejh3VlJiWUdnRU5rTTU0a1I0a0dtS1JRTDA3MmN5Zkll?=
 =?utf-8?B?U3hncTh6L0Z5OS81a3dTOTVFODhRM2lsL1pmOHFkQVRyajBBOW5UZ3U0U2xT?=
 =?utf-8?B?K3UyNVlDVklxd2tVaG8xc3BmN3M5Tm1KL0NxUVdtM2w2K2lveU9BUE44Z2tN?=
 =?utf-8?B?YWdSQnhISVFEVTA3c1pxelFVVFgwQlZNelIxM3VPN2tnWGxNMVJEaTdCeFg2?=
 =?utf-8?B?UTZBSE1QeEZ5V3MzakVkbWlsWUxrWUJVbkxSOHdxdEhvdVRvRlhBZUV2dTUx?=
 =?utf-8?B?VVpaUHhBYlE0MENDYWtDZUpzY28xa0pudlErMENVUUd0ZC9PbTc0LzZ1UWxm?=
 =?utf-8?B?ZDhMZ2tPamk0VnVubVRpUndYeGhVQlBWT1JUNWhoL3lzMjFmU1UxR2VIWjB3?=
 =?utf-8?B?RUwyZGNweTgvVXlEdFRBRnlyV3dOV0QvR1VKOTJNQjgyanB5akhOYjZseU1q?=
 =?utf-8?B?UHVBYTc5UGsxbzFmZTBIK3RGZU85bVhOUUMwdlhJQ1hvK0pnRUJsdTlwZktO?=
 =?utf-8?B?YjZuQWVQMUQ0WGVoSkVQNVBxUFQxbWphYTA0ODgzUDRFWjlsTjh5WWJFU21w?=
 =?utf-8?B?VXVFZFRSVVdhdktGTFg4a3J4b1lDTXRyUFI4WmNEK2lvczRJWnI5aFZ1WFll?=
 =?utf-8?Q?IN2TMgO/npwkXf3c=3D?=
X-Exchange-RoutingPolicyChecked: rA9a2V0fpE25tBFGsEoYl36LeoW2K8U0ETHZEMnQOmIiVgYTfM3646b0zZkKqB8z3SlCZVZHaKdihcG+meg3K+/7lqAktCMCateqY7Q/kdIh/CjlvKT4V4k76yUushDKbK9il5bwNW8hWAkcozlOmE47IKJ88ELIEyoLG4doUuK7rZPKAD4h0MKGO9DPYjOc59yiGhPJ8F8lM2w1aj1xD3003YiMa6jA18HYXMw+waNaOOJoy4RKhD9QQgK8oI5OZmH0eG8HToTsySeCOEtrS7vL6jkitNnKz3oqpDDKNr8Y+ZARKf7g6J/nSRoZ/s3CPxo11EfwqmFmG3EuRQvpsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88896bef-deea-4cde-8fd8-08de8ad7bdb5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:33:54.0749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVv6fYFbNH38b/4h2XAwusp/C1vFGPeegmv95RBCQfCq4/KxLIhvPtDlBsGUGOkQUGIRq3I946QKypi6/wsvzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
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

On Mon, Mar 23, 2026 at 03:00:57PM +0530, Arvind Yadav wrote:
> Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
> DONTNEED BOs can have their contents discarded at any time, making
> CPU access undefined behavior. PURGED BOs have no backing store and
> are permanently invalid.
> 
> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
> -EINVAL for purged BOs (permanent, no backing store).
> 
> The mmap offset ioctl now checks the BO's purgeable state before
> allowing userspace to establish a new CPU mapping. This prevents
> the race where userspace gets a valid offset but the BO is purged
> before actual faulting begins.
> 
> Existing mmaps (established before DONTNEED) may still work until
> pages are purged, at which point CPU faults fail with SIGBUS.
> 
> v6:
> - Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
>   with the rest of the series (Thomas, Matt)
> 
> v7:
>   - Move purgeable check from xe_gem_mmap_offset_ioctl() into a new
>     xe_gem_object_mmap() callback that wraps drm_gem_ttm_mmap(). (Thomas)
>   - Use an interruptible lock. (Thomas)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index da18b43650e3..83a1d1ca6cc6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2165,10 +2165,32 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>  	.access = xe_bo_vm_access,
>  };
>  
> +static int xe_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +	int err = 0;
> +
> +	/*
> +	 * Reject mmap of purgeable BOs. DONTNEED BOs can be purged
> +	 * at any time, making CPU access undefined behavior. Purged BOs have
> +	 * no backing store and are permanently invalid.
> +	 */
> +	xe_bo_lock(bo, true);

You need to check the return of xe_bo_lock if the 2nd argument is true
as it can fail. On failure, kick the error code to the caller.

> +	if (xe_bo_madv_is_dontneed(bo))
> +		err = -EBUSY;
> +	else if (xe_bo_is_purged(bo))
> +		err = -EINVAL;
> +	xe_bo_unlock(bo);
> +	if (err)
> +		return err;
> +
> +	return drm_gem_ttm_mmap(obj, vma);
> +}
> +
>  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>  	.free = xe_gem_object_free,
>  	.close = xe_gem_object_close,
> -	.mmap = drm_gem_ttm_mmap,
> +	.mmap = xe_gem_object_mmap,
>  	.export = xe_gem_prime_export,
>  	.vm_ops = &xe_gem_vm_ops,
>  };
> @@ -3427,8 +3449,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  
>  	/* The mmap offset was set up at BO allocation time. */
>  	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
> +	drm_gem_object_put(gem_obj);
>  
> -	xe_bo_put(gem_to_xe_bo(gem_obj));

Look unrelated.

Matt

>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
