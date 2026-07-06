Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE5C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 08:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C9110E822;
	Mon,  6 Jul 2026 08:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McCh1YUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED05210E822
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783327332; x=1814863332;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LEBBkE8PYh6vd8OqKy4zSfbtGUPMaDj4iE39CmijV9c=;
 b=McCh1YUkP9YIVRS9mfUhyNS1qx4sav9TjAnqliMVxPkPnJ3H+bymfOWI
 gouAP1prJUu+3kS6QhpWJYicBVSmu7nPyWoXPid6CWgRa/9hfrI5YQ9OZ
 COMxk/uhAITsWkYTMhsaiS1/QMZni2chb++fkBmPhwf4rQDYIsHcM9ma0
 xLBcXdNVxEB4w+A3ddr6s5Vq+NRTUCU2uIZdli7ZXJik2PKqQwn21SZmZ
 212G6kb3sR2MVQU60o2S7DyrdGJexpNfkroMFyqHwFYJDS2HyUfgNES2V
 DG+D+NzE2CQgDFP3zhGNK0mdMtIEuOWApqpW3xJE0H+7GqmvWATDGdU8A w==;
X-CSE-ConnectionGUID: Pyay/yQdSuOxVqW7AoN9oQ==
X-CSE-MsgGUID: KKMZhbWwR6KEz8pXG5aGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95464278"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95464278"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:42:11 -0700
X-CSE-ConnectionGUID: vyg9DaDYR8SXaCWQHkR8mA==
X-CSE-MsgGUID: YRF0gXrNSiisN5nKLGAwog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="254300109"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:42:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:42:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 01:42:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkVct7yXwy8utaeTI+jysdOsxpYqhqvbHFQ3l1pmrq8ssVBJMZMJR8BzMAdSN7abZM3IG4+UvImWGdbEhj6i3IPRgggVIAn9DBr0Eqta0Wd3JyKiiQvNiirnzUj5sKxnA4pxTC+hbMmsnqQfcUPW/HWuQjn+GyIRxlcv679JlyNaic3NXbRTOgd2x+TWaF6BIhDpm6RYmA5y9Z4BQCsC51FesjPtnnnFQ+ZCI+TUgbd/QCoXUPMJJTo9Y4pDUTsQQZ3d1QMsEHOztVMFtcZ+NQMdxwSKoS25ocGRoUPQxZllRwpuZCNsSqe1ZdgdZXqXxJEt2g6O3HtTH2W0Puyl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPfazwD/1W4obzn0C3R+m7SfwdvTMikqfLCY3hTpOa8=;
 b=U7XYnXYaILLzNz6dFVONHvQrgczhr6WIKw2UkZBTuYSp4beaDdO0iSTVI6ioCilQ3pcKC9/W80A0IGJ6gGPK94tk978tKprdlE5fbKOAE7zvTwPUHhZQh/ygxRa2n88ZS5+SWwcLSICPrhUmAay45qPFmeeT5sh0/eGIWkqwUytFnAjx2w/p4IpWzFu0/48bivAEfGOz3mdc5hUHodmJwfRqw6lV6+D4nDQxmlBnfjrUSg9fMc+lb54fZAa6oLn8sA4++AFRa2Y7qwOOmSGsoNdLVA51bw0nK9JmIDz/wVPP9fopgvlHZYPcOksoSYMTRwk3T3u4kWAc7Krssz2AZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 08:42:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 08:42:07 +0000
Message-ID: <d944482a-10a0-4a0b-87da-866a60a8b067@intel.com>
Date: Mon, 6 Jul 2026 14:11:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 4/5] drm/xe: Use RAS logging to report
 survivability mode
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-11-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260630115503.407158-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0155.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0d3446-fe60-4984-1490-08dedb3a7663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tq66KnEtK9f49oqFag1hTd5age8GcvXloRPzq5I2qmu+KJuvP949eNX+lfOtnSfrx+LTGECyrV9PhFPBlWjC+cI/vHZ9kSi70HGs52wrSlcQfEA35KmvOaykjnTEPfstfXSk/b1MS4lBxL2+i07cmJJYq3SMf2zIWk8X6Ge0BYtGF+gvvICFJGBVBMHK8qvTFMTnU9YS3qEFm/Nv5/Ci0rmzT12uPXQG5x4dtSVyKCs8JgcBttSkm989jhxKxCnMqg1cgnrheGNqykwGw+6daxL4WKsO3U13TXFh36I1r5VYHrEmWRlLWIwuVD6zluEBy5EE16t4fCrUWAS3lBYqG+dazvk1VCxS61Y1yjxrmuUk05keRHGwScfGP6YEvAcq3P7OpDVWc+r+uUOpgFkEtxtI0IwBxGumaju6tNIAp0lXcSmYP4tM9y07UQtkDiqVQGoOzDkfZRAizIHq8P6jTq68Sw2aqVFXi0H1JWPXyHv+Ae5N0ujtPQ53chEJtSlZNu2uuZm6ALYWOMIX6g97ugsPPku95tgUxlEsXDo5yvnSh4WdwLkpKD6GwAVQzhl4GrCRWzCf5jdaNwocQxYt3CSQU/+ESVZbxp3lkaB1x173qmlEvfeAXCH3rV3ZZEF1SOrba/JHMnBcDvJ3ixATXdIiY13CiUiqMiz8J4NAY/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qktrak9ZSHFyTXNQNHErODRJc1lqcmM5WkJqd2xxa3c4Y3lTUzRNM0YxRHhR?=
 =?utf-8?B?V1lCd0l5cFY4SGU3YlZuQk1Wb1h4NXo4dG1CdjV5eFR6QUUvRUNFM0tiL2Fj?=
 =?utf-8?B?WFFZQ0VidFpVVDJuS2VMVnpSOU5FeEVSeVRuM2tGYVR5SkNWSjl5U3dHdEw0?=
 =?utf-8?B?UXcyTExnRE4rWTR3RDJzZmoveVZNRldiUTN3S2tsaDlyTUc5bTRMRndLamJR?=
 =?utf-8?B?YWdrcFFWQUlQNnhwLyt0VUlTd0tSY1lMMVAvaUphcFJoNThtN1pkeko3eTRY?=
 =?utf-8?B?ZWIxRXMwdXdlNk5Wc21oTk5ZWVlIa3RrYXFlVmlFaGd3dXFsY2FFZGFjNkdw?=
 =?utf-8?B?dEhpNkhvUEN2ODZDRDFNanpabUkvd0hKWHFuY1kyZ0VGNHZFdTZtUVJYbkxX?=
 =?utf-8?B?aHJhTGFlOG5sYWRHNHo4ZVpyVS8rZExZV0pWSUhvMmxSdHJPS2hScExBMmh5?=
 =?utf-8?B?bmphbm51TmxMVWNJSGdHU0FQRjU2NWM1MmRRUFAyVjd5OXJoVTBWalR1elFn?=
 =?utf-8?B?OHU1RHFVazIwL1pYVzU4K25sc2dDb2lmS3NKclVDOElEZGFnZGxhU0xjalE0?=
 =?utf-8?B?a0daRXJmbWwzOUppWGh1K09YMUZLZ29KWVd5UlVDaDloRFZaYzNMaVRnck1P?=
 =?utf-8?B?V05vWEZnVi9JRVBsNDZtdUg1QVowTERxMjcwdG5DdERRKzdsZzR3UytYM2Ja?=
 =?utf-8?B?N3JHSWwvYWVQbm5rSGNFY1R2VnFmc0IyeGZxckN5dk5yRDNyV2xwbnFnWC9k?=
 =?utf-8?B?RlAzNGNTOStTQS9aNE1WeXZBNFpLTUZ6QVQ0M1ltQVJNb1RwYVNxRjdwU1Qw?=
 =?utf-8?B?MzdvN1p1TzZERUhrbnU3Yys5L0R3ZUxvME4xQUtWZy96TDlqK2lxUzVuc0c1?=
 =?utf-8?B?Ny9GbER6RzdLV2NuZmN1djYrbXdNbDFqTnpFRm9IVkpTVnhlQmNOZENZMVpU?=
 =?utf-8?B?cHVJTzFoK2FSOXBwZ3FtRVhNMlZTSG1ubGdDdlVnMEZMdzFFc3dHNHlueWVD?=
 =?utf-8?B?MWY2RDZwR0pLVVIxNVdua0dkNmRiRlA2ZTE4ZVVYdDJnNHJzSTc0OHppeFRQ?=
 =?utf-8?B?QVJoUFkyNElLRXh4TytpZ0svUk9sM1FHTVMxSzdpREl4ak1sVWEydWxCWkta?=
 =?utf-8?B?RjkzVFFkdEJoeC9pSktNRlJQdEZqd1ZqKzB2QXBpaWF6VStackg5dyswaHls?=
 =?utf-8?B?VGlJTVBwS0pUNW1hTEcydHNUSVlHNkdNcy9lOHRBelMrVDJnRzBMTTVod2d5?=
 =?utf-8?B?WHNFTUZtUDZCU2J0RVZ1Zk9PQWhWQ0FKZ3QraU1ZanpEcnBBMmo3eGNLWkRx?=
 =?utf-8?B?SkxJeFM1c3FkV2RVR204d0w2VUJiNzNGelk4Vk5EMGV5NCtJcldMQXpQK1VE?=
 =?utf-8?B?ZlJoOXpSQnhvM1dsMC9TOThtVmcyWUZSWm9oVzQyaUJwYTMrajU1SjhQb3U2?=
 =?utf-8?B?RmREUnVOYzc1aktvNk9kRUNDcElEeXJGdGhNa3lJbkhaZktwbm1vcHlJZjRm?=
 =?utf-8?B?dzIzNjhJR2xZOURMY3NlcGtVMGpXL0tSYW40QkZPSG9rVEpGVGsvVTF5a3px?=
 =?utf-8?B?b043b1ZnTTBORVdJWElJbUx2dERpQktBOTE1c2JKd09jVG1PeEhJK0tFQjYy?=
 =?utf-8?B?UlYwUlFPa0RhZVFGbXBUSk54Y1J4SVFGak1ETnA3eU9XcVFZNW1TalNQdmFY?=
 =?utf-8?B?TUlqZGFnaWN5NldIK1dBa1JmMXk5dGRxK1I0bFZOcG1tTkxUL2xHb3dXNGZn?=
 =?utf-8?B?Y3ArVkFOYmQycmFjclRKNmRiRUhXUXJ4QW9wU1M1Tmh1RFcrOWhkY2VCSjR3?=
 =?utf-8?B?SmlYYUVGNkNKK24rYS82WEhwTUF4QWFacndTRG5mOVJUTjQwVFdGV3QrVGM0?=
 =?utf-8?B?b1JCMkIvYmtQZVJwUjJpbmZNODR5U3JOQUZCVHZhUXZUOFlGU3E2eDRtL202?=
 =?utf-8?B?UDJRL3h2S3VLZjYrakI5bHE3VzFDM3QvcnA1Rm95NUZGb1d6UUNkT3hFeTRm?=
 =?utf-8?B?dHZIY1JSakp6RHliZ2dYaUpobmptMXpCaEtBWXd3OVNiTldoYzhWa3ZLbzdz?=
 =?utf-8?B?SkNmZHdIdEcwdmpxeFpTejFNK2V0TVp6N1BQTjQ0YysxbWh0UkVTSzE0R2pz?=
 =?utf-8?B?WGEzaFUvR0FBeElRYllRM0ZTVFJlSHpIb0lhVFA2MTl3TUlJSjBwRkJ6VC9O?=
 =?utf-8?B?Q0xOUitmaGF5K0I5Y0pKTGpWb3N5cE9MZE9pWExGb00rWXVETXZEaElHa2hK?=
 =?utf-8?B?eE91TWRFMU9vSm5nTXNHckkxdFE2cE84eGZ3UGJzb2o3OUh0MSs1clFYZFRq?=
 =?utf-8?B?OEs5N3RBQ2F5dWFrbjJPbWx4Mjl2TlVCN0pnOE9SVG81TXVqZ0hwQT09?=
X-Exchange-RoutingPolicyChecked: gaHg15UYV2rvc0x+i0QaTnEJ8jyBytij9xb8syYFP97JmybL4l6uENlWQPjZWDZrrrlcyWb70MpAQ0d3dpGor+at9YcXniNS9JNjzVUtiWYJLQ0zfqEl9rHHBrULtsEVRiEIfEeMWFbf2SgQ91CWC4XxPZG+figPgcIOwUaPzQMuUiVI1WPoZieOf81DdoO97RgrIhYUWIOGFTWy6wQL03fVNeg04HmpmaU84Ka8ZvZNkB0D4rO4KLe4Y3rgHmEZfzcP894kUUK5IotxmBlFQ0yaPX+qA7Mxh53PiJz9MxfRoLSaIUP95RAquzk38/0dKz9n6JphPzGTZordDQ438w==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0d3446-fe60-4984-1490-08dedb3a7663
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:42:07.7463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHvAErfnx1az5GyY5rsuz9do6uYVwWVTCNBQwMKVYv2H0lC0dy+Za2hQNhgvjTqfIWnw5/ny0eojaGCbMwTpjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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


On 30-06-2026 17:25, Mallesh Koujalagi wrote:
> Replace dev_err() calls with xe_ras_log_survivability() so
> survivability events are reported through the structured RAS logging
> path with a consistent format.

How about sysfs creation failure? Is that not required?

> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 427afd144f3a..a58d46f67677 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -17,6 +17,7 @@
>   #include "xe_mmio.h"
>   #include "xe_nvm.h"
>   #include "xe_pcode_api.h"
> +#include "xe_ras_log.h"
>   #include "xe_vsec.h"
>   
>   /**
> @@ -307,7 +308,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>   
>   static int enable_boot_survivability_mode(struct pci_dev *pdev)
>   {
> -	struct device *dev = &pdev->dev;
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	struct xe_survivability *survivability = &xe->survivability;
>   	int ret = 0;
> @@ -333,12 +333,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>   	if (ret)
>   		goto err;
>   
> -	dev_err(dev, "In Survivability Mode\n");
> +	xe_ras_log_survivability(xe, 0, "Boot Survivability Mode enabled\n");
>   
>   	return 0;
>   
>   err:
> -	dev_err(dev, "Failed to enable Survivability Mode\n");
> +	xe_ras_log_survivability(xe, ret, "Failed to enable Boot Survivability Mode\n");
>   	survivability->mode = false;
>   	return ret;
>   }
> @@ -413,11 +413,12 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
>   
>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> +	xe_ras_log_survivability(xe, -EIO,
> +				 "Runtime Survivability Mode enabled, firmware flash required.\n"
> +				 "Please refer to the userspace documentation for more details!\n");

Why do we need error code here and not in boot survivability?
Also what is the purpose of this error code?

Thanks
Riana


>   
>   	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>   	xe_device_declare_wedged(xe);
> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>   }
>   
>   /**
