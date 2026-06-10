Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6CDCD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 09:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DE610E4FF;
	Wed, 10 Jun 2026 09:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8W0cPhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217DA10E4FF
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 09:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781084839; x=1812620839;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sO/zGEbU/RM/gUrGYdCVDu9XMvGCCuoHc2n8ezDxOfg=;
 b=Q8W0cPhl10V0iiYqAxps7hTCdc/+hQxIDWny2l2Gfrmq4R3ui4bdrxFO
 vHxBuXtnxW0CAoqvxiq82WYepBjcAt0LGwnxxMdbJ3FlpE/GjYtqmsiOc
 K/1YKUQJqs+gZZ7edLJV6392jLELG+abxP9XLi8Ev87FTaRe0Vu/9ZRGa
 ChSAnCX84/mK7oJJy5VRuhP/ygWFRnkmZdV/MGI3FqmDDv6NgiboyCjew
 DZ4JuUcxNcN5e0m7I4opAbhCokwOYhRr0GS5wj0edI7DWf0QTLPg9T5mz
 IoM8D24wI3WPVEh/jNm8DLLuiaOf+b52ldgduNqwhhJ+wESNj3Kqv8Pgt w==;
X-CSE-ConnectionGUID: AS2/W32MQ4GkcLzhczy47A==
X-CSE-MsgGUID: zkiybjdASj6kythPZM1KFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81779952"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81779952"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:47:19 -0700
X-CSE-ConnectionGUID: jGCn53nOQW+qh+4l0b4lVQ==
X-CSE-MsgGUID: 2agdOl+IRp2pCMI5SX2SIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250403549"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:47:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 02:47:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 02:47:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 02:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wcd2cqOAQt+ya53HVclIVyFQ4reTPeuRAlT11K4nARHafe/3tx+kQ02uK5mRN8hheXbGYC35GaOH9foiGXSLuU2WA/bYhxs3Izr3fvbvdVdC1bfXkVQc2mYIKFzijqz+D54WDp5uVSGE73XuUnaaP6VP8V7V1zkaq49/dOAcvo3TB3349p4Vi1W9W8M/MJReMLdrwrNkuRsIlGw0Kj7/Lbm97gOnPISeGxUVnDD67LQSNuqIoSA/ZPvE4WKmSm/WX/uvdQNg+9CpHM0NnecbAhUvUguJpuOON1xTznkxbD8yuaohZ5WSh6OVK5Qp4VEOn02rBHgj3W90+E3H/kWQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJQ4YSy97GRAtejXGIj6jsmO8S2hSOnL2oii2y/5eaQ=;
 b=hRfBoZbXkBAmMaq3I7WNxL77xby4o/gEbXglqAUAejYyrdeMl1Rtzml/neCIeMYuKuCsFY6oURFnVjH6/HINoh3ukgJZiOCls3kZr/ztNK+9Oi52ZCpWhqsanj4tAtnB43PE+/ioEuS2M0cPv4q6xb+Fuzjs2ZDKmYUukox6HMZQuITISLWXXCnbb3XPgecY2d+ObQHgINdSEbuhu62BoNJDNm2jfJ5Qs40E0N3JiLJlSHQOIuu/+eJsvwJTz4KuhYeJIJQMKvvfwt1Mc6YGYHbs15LYUkzYx2NRXSs7sXJXuXHfzIj4Ku05qACcw3VZB0WTRFPB4rp583LsyYwdsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Wed, 10 Jun
 2026 09:47:14 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:47:14 +0000
Message-ID: <65d5dc1e-3fc8-4acb-b9ff-6ceae8750263@intel.com>
Date: Wed, 10 Jun 2026 15:17:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260609144412.244678-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0318.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::11) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: d5570b4f-db31-4a15-25cb-08dec6d54035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: U5h6SPECwDKQkp4XqEQEhB7Ue4ulVnaoeSepkHrbwStcYZaOJCXb6+22C3DK8/MAut9aooKio/t9BdAGqZSM5DzCGmtzMKEfrz2sNfqnuG1iss3cf11Kt+VD34gitWO6XvpPlmWutqzM1ZNRFfFD+2ljOJPc0c1h0sZR48KdVlEceZANOcRj2SdKJ6i7aeIfb8nesIzdpSn3kwv0DoMf5Xac07/87kWyUr/+jFogmbRmD9TPBZUhG/zJX/K9jiLVziBCF47YipOCA09eJsDdKof66ji61OAKcO3EiowEduEhA+b9MaeyYa0Tqxkb9LP0C+BnZYz1jmgICTu5VXk0BKlxyGEfOh4ZwS/a0jUxh53UEsUhX1mHGm/Y3bvPlehLyc76+8fcvQ/WENC3ENH8JWHAwEkCQj89C811VVSXbve/NWKP24pWtRDNZs4wh0g0YcKFGIBS9MyHrXkhP3F4Vf9gQGzV+Si0SJ9rpLhVQYn8CbM/QQXjIZDBpRULpPLgB+41gW2wH9j3jhNeNDdBH+S0QSNQioPgIVPsdTT84rO3lXw9K6XkFa4Mcu/Op66+vNJWwXBhuF08UKe0qsHtEjaReMSNfifHM5IjziAt3JNeYIkf9DLzNBs6X4vQJruFyLdytw5MKWcuIZvcMK5tCP6TRu3foNAr2Kna5VVcHoCTO5BFFZYqCa/5t2bxzyJJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTRSRGc5NlRmU2Y0WUp6akFITW9mdVJURXhnWjVOdklldEpMRmZhQmZsVjhX?=
 =?utf-8?B?N05kdUp0K09qWFNQdEhpQTEyNU9LNjhDY1FRTnlNbks4SCtJK1RSSnRqMUFx?=
 =?utf-8?B?aDI4clhXaDZIL1ZFcDZrRzdPdW1lb0ZpWjdTYlpQc1BZdmdzQkZrYWxJRjlo?=
 =?utf-8?B?TUh2OEZ6eExGeFlZOTkwZnlpSzNCcEtpNHhwSDVLcTZFSFN0bUpiM3BURUtU?=
 =?utf-8?B?R0F5NmRqWmZvNm9zSS9iQmc0QS9weWFLa1lpa3U1QnpDMzFBcVNQdFZlSGg2?=
 =?utf-8?B?MnpsSkI2aXkvTkRkc3FZN2Z4bmNpSmFmR2ZFa2lOZTNQN2YxSngzWk5vNnIz?=
 =?utf-8?B?TURVY24zYXdCMHA0eldDTk9OaG82aFBLU3ZaRXd0NGZiNTAzUHFvNzgzR3FH?=
 =?utf-8?B?MUlOZXVjNnNUS1lmM21YUnZvR1dEY2tMS0U2MUpOUHFHQTJxUXFkY1o1OS85?=
 =?utf-8?B?aFJ6N3pBbTB3R0J2aHVuV1U2YWI4VmNRZkZodXNUd3F1dnR4VmNzd1IwQlky?=
 =?utf-8?B?aW9FZFZXV1R1ZW9ublNySmx5alFSTXZtTWJhUmc3WUUyRGhPOTNlZXRMUm9o?=
 =?utf-8?B?SDduN3FDSk5teGI5TzloTHd1QVBlaDZDUm1Vdzc4NjZlOGZUbktQT0lMc2Q1?=
 =?utf-8?B?VGowaXUrMVc0TXliK2VKUEZCV1FMRkJwcnJBTEJIdDVSS3J0SzljSk5LWTBl?=
 =?utf-8?B?NjNxVTZadTEwUW0vY3dPbGY4Q0RVYnFPUlN0S3FIL1hKZ2ZWWlFxM1A3YUQr?=
 =?utf-8?B?eHJ1MnZNNHNCSk1NOVFGSzJZRkY2SnkwMU5BWUc2U1cvSVB1VEhmdDdrSU1V?=
 =?utf-8?B?bnFZem9YQ285d25zY2tPb0FYMU82bkpsd2ZRUXJOdStiS3pTSDVyVlJrRzRL?=
 =?utf-8?B?QktXWnFqcjJXRnZkYm9lYVB4cHJEUnA1RmxKSkoveUZBdk14VHFEeHp0R1A1?=
 =?utf-8?B?bTh0b0Eva1pySGMwT2hXSEorNW5idy91cjNYL1Z4U2lFRXpFWEJLb0R6QmJC?=
 =?utf-8?B?bGRTbUJaNmxLWEVVbHJjYW05L2hSWlpQb09RN2Z0K1VBblRmR2pQT0hQYkI0?=
 =?utf-8?B?Sy9xTWVoVGJNMlk2WFJ3N2huVGtrVG9WNjhLLzdqK1JnZXBOdmpZeGliTUZ3?=
 =?utf-8?B?T0ZpK3ZrNHh3dEp5ZGwvVDd0Tms0WjZXaGdvc2s4N0FOblhSUGdiUGJNRDQy?=
 =?utf-8?B?V2lmOU1WclVDK2FvRDNEaXBjdDFSWVRLQ0E5T2k0aENsZk9NTmRIVWJxd2lX?=
 =?utf-8?B?aUdCRm1xZHBnekVyTW9Bbi9JdTVFcTM5SzVwRTZQMWVFNnFUR0NEK3VZTEJw?=
 =?utf-8?B?TjYrZUl5VURhN0thK0orUDhtakRlSVN5OVpzbVloa2NOTlM5Q1FlRGcwVzg0?=
 =?utf-8?B?M2pEYm1NY3EzRjNWTkc3Nk9xM21FTFpXN3dSNTRsZi9seUFCUC85dFQ3STVX?=
 =?utf-8?B?djc3dUQxQ3NOdHNZaVFZcXBSem5qcGpySlZySnNEZ1hqT3hRVlhmNnZ5MzJJ?=
 =?utf-8?B?Y1NUQk1LTHBPeFF0RDBxcktjWXgvT2lJMTJSeTlBdUVzSUJaS1lqSC9GOVJD?=
 =?utf-8?B?MXp4RTQ0T0srRmpvQW92cUlxM0pLejNDSDQ4MElBbU80VFFIV0JDRkxJd1pT?=
 =?utf-8?B?eTVzQzBaQ3VXa0puNzRFaVpNUkdYUU5aMUpkWS82N0pFazBCM25Ta3F5eFlx?=
 =?utf-8?B?WVpWaVBmYks1Q0lmUDIvUHJaZzdaZGVYMUF3aTQ0UXluNHdEMGFZY2VNdWNV?=
 =?utf-8?B?dWJVbWJZOFh6T0w0MVJwMS9lZXFmMWl6OWh0T05hRFY0dzc2dWpxVERrYnJa?=
 =?utf-8?B?S3BPdVZSOEJhRTVsVDJSWElWZWVvSkg5Zy84NkMrcGlqaGxSbkg0MitnbnFK?=
 =?utf-8?B?aWVGU2YzU2gvQ0xQOTAvYUlSK3p1M2M4QjdUOWFQdDZZU2FZUVdzLzZmL0NY?=
 =?utf-8?B?dGcyek5lVDU0OUxzMnFRd3dvMzNYTXpuTVppMHQxTzFpcnV2VmlPVnJUeGpr?=
 =?utf-8?B?eHRXTU5OeUFkMlVKNzk3Y2tFeHRhOURyMmlaOG1DVlJCZFo3b0FuMWlZbUpF?=
 =?utf-8?B?elE5M2RmNTBWOVZsT0lrL21xb0JpTU9malB5TVJTZXlPVXRvNEx5YUlwYUlh?=
 =?utf-8?B?OVI1aktqUUR2RGVnOVZwNnlreTZROTlxelg1YURDSlRHWm9CUHRvTklrWUJm?=
 =?utf-8?B?WFhyTUJPbUlOMFJRVHdZTjZLZGlpQUtINjhFT0g4Y0FScUNudWphbTJPdGkv?=
 =?utf-8?B?dVJ4WUpidW5nUEM0eWN0TkpId2pzeWZDdG5iQjJvWDNjWDhNWllMMnZNZktR?=
 =?utf-8?B?RXdpTkRzbW5QM1Nhd0F3ei9LdmRHcWdyWHpDUEVRWFVReDMrN1M0QnlaWjhZ?=
 =?utf-8?Q?lR7jTN7XBLLNOe5E=3D?=
X-Exchange-RoutingPolicyChecked: A5gW4penKnKx+y3XfnqptM0My16ifdi6kOj2H5z/kteHCXRI6kNzVTzvKUI5wKhHoDNxH/U0aForGhfBDsZDzcLMImAoVOc4FpRC2y3qKAFs4P/zTyuSb3j8RKhvU7FgNgxiuqApLhIrcEWajyLOx9oiJHuXqzx93GpCh1bqCU6NFNzNBlvDNJzj2SGL3kd3d1MPUwagHHDb0SZkwSk4jRGX/fvQiADT1WMx5IEgfoFrGE+h9pgZXH0dGw6zPznROcSsv0b3d3/r1ojlPli5wXnCG80Suz+tqLyDlID39xWlzaLPVJIbIhwudzFsvO6iYrlRbUOC9tusG7tKvxpJxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5570b4f-db31-4a15-25cb-08dec6d54035
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:47:14.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kigi0UF8cYT/Ej1uR77NsVsFUp2LAAeShdnkyHDSNqkNnDTsoTAz375AWmCHQmqPzFqXGP7bI65MrKmFf2xWO1knk3DenN5vglcs2YUJz0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
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


On 09-06-2026 20:14, Rodrigo Vivi wrote:
> Jobs that GuC never scheduled were silently errored out instead of
> triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> should wedge the device rather than silently fail, and userspace VM bind
> queues should stay permanently banned rather than being reset and retried.
>
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter; without
> it the waiter sleeps the full 5s timeout. For not started works the ban is
> cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> after the GT reset — a banned queue would block resubmission and cause an
> infinite TDR loop.
>
> v2: (Himal) Do it for any queue type, not just kernel/migration
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 41 ++++++++++++++++++++----------
>   1 file changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4b247a3019d2..5c40eee41103 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>   static bool exec_queue_suspended(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			   q->guc->id);
>   
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;
>   	}
>   
>   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1460,6 +1466,12 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>   			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>   }
>   
> +/* Unstarted jobs (GuC scheduling failure) and kernel queues recover via GT reset */
> +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job)
> +{
> +	return !xe_sched_job_started(job) || (q->flags & EXEC_QUEUE_FLAG_KERNEL);
> +}
> +
1. With IGT reproducer:
Works correctly, no infinite GT reset loop. Kernel queue recovery 
behaves as expected.

2. also tried this threads-hang-userptr-rebind-err [since failing in CI]
IGT hangs and the GT reset("trying reset") is stuck in an infinite loop 
for non-kernel (userspace, GUC ID != 0) queues.

also any userspace job[threads-hang*] that GuC never scheduled 
(unstarted) hits timeout_needs_gt_reset(),
returns true enters the GT reset + rearm --> Just ban the queue and 
error out with -ETIME for Userspace jobs?

OR GT reset for only for kernel job failure? -->Please ignore if am 
missing something

-Sanjay

>   static enum drm_gpu_sched_stat
>   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -1608,19 +1620,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			       q->guc->id, q->flags);
>   
> -	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> -	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_gt_reset_async(q->gt);
> -			goto rearm;
> +	if (!wedged) {
> +		if (timeout_needs_gt_reset(q, job)) {
> +			/* Retry after a GT reset; wedge a kernel queue once karma is exhausted */
> +			if (!xe_sched_invalidate_job(job, 2)) {
> +				clear_exec_queue_banned(q);
> +				xe_gt_reset_async(q->gt);
> +				goto rearm;
> +			}
> +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +				xe_device_declare_wedged(gt_to_xe(q->gt));
> +			}
> +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>   		}
>   	}
>   
