Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDCEC79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 04:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74E110E10F;
	Fri,  4 Sep 2026 04:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRMFGCIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC82410E10F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 04:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788494575; x=1820030575;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LbP8yvNIZ3jS9KloQoLsufZVAxRFNGP4Ld4LVOALEx8=;
 b=KRMFGCIZhzzQnI76SjTZmLWQ/H1ZUt+Mpt+xgixqXqryZxLdOITJ408f
 5b9Pm7K/Tc8NsCvNdlzBZl9ErzygfUt/psuRPuQBoRcTJzIRm0hnQ/H1h
 alNnMHBV1fvMaoL0qxaxCymD/EbaPnVPlMZpPUFA8EzoMhUjm6Pu75S5E
 QDrr8qPfQR5oEZ82kxFv54OipWl0GHFz/a/ovOMexUnbDUG+ucCE4EVTX
 FRpyx/kjK7PYvbBQYbEOgL0sbydEyh24WO0/8dmxPnx72lNq+jfm+zq2B
 iiIbdi6UjWIzSS716RTagcPF0i7C0h6V7BalavTZQRJZu5MyvC6PNjgMn A==;
X-CSE-ConnectionGUID: SoLfpPbQQ3KqQqWmQNhLpQ==
X-CSE-MsgGUID: +D3E6k+oQ7SEwE7nzE7HgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106512402"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106512402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 21:02:54 -0700
X-CSE-ConnectionGUID: OMjPbs63TFKGsLxlFZQLCg==
X-CSE-MsgGUID: ZRPK+L9VTFqfPXYVHXDQNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="273711978"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 21:02:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:02:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 21:02:53 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:02:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6Kt8egG7Shivzp4v62ZadDMV/Ors/XRNQNy/VGu5RK+vxLTplPKadZhtn0lVpBEFc8wGHi7CYrr/Aimt3VQ060eZoFEhAdZ/bY1K0uC+LlK07yG8cp9v5/4eVLdltYaIkl5Hr+WJBm0CSlgJvRgkViurjslQGQFaXmrPt2mlfBRhEp6MNpj5aQQNBLL2ZRmIQptUKUbmt+Me1vthiO6NsEEFG42t5YNN23lqF1xSxB2gR+v6Wpsp8Z5ghpsmga9XudEsx141brsqjhHDQWBJtuhf/m+JrW+Qw/jQE5i6xpsXmLhcLgbRyLPNrqMdiyViTbC5iztNrD5dJ0MBOd+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kchYDeMgo3prBvJFsY8eQBYG2xcSlISxt7hedTuVvGM=;
 b=VGPyhW+AgAmOOb0SPpSeLxTqgu9tyBbzjx5taVi9Qq5eGl4SV3CuRd9LxHKxtzFMpbI0ib1JpWkVktB2gzKUOZGiaghfwTqWBihzYSeKC0ZQoyGSiR30hHP2fZ6g0Mq7i/h6/q9uLsiVpLspcty1AZSdfZZYVaBjETfmAyeTI/LMt0rPfMKAEZTRUR5hL9+bDBvBJnQ4rgpZcXjnwPAuaA8U4hvirlc14WuhlmC3LLdRUW8XUztfIMOhjZzMJqgkVLfTbbKaXPz5J4G+K6PE8AG5d656N4Mw7YPdTKEnF77EE5Ni7dLqx+kdZ9+bwACgsKYPhJiSbkAy7/ir2bqqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:02:50 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 04:02:50 +0000
Message-ID: <5082034f-13f5-419e-98d0-a558a6f8d111@intel.com>
Date: Fri, 4 Sep 2026 09:32:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/xe/hwmon: Add kernel-doc for fan control
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-8-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::11) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA1PR11MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 524f7deb-29b9-41aa-d150-08df0a3962e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: coU4OV18Zq5fNzTkITAVqO5gEVSZPLkZKlUHainKxUCNLlyATiMzcHSGjS0emmCmvLPKha7VEvSE2nzg7ONRIDhP4z4UND9UG3QibVkCTJXRSfclze+NcyR7v4hpsgaR7DWq3O3SDkpAS32HEN1Bzg6b32Mkmpzfj8iQuuwfpuBeexcaPS/Po2UuiT/KGQFD756TLQMBg0huhBOAe6mR/PVGeVQYG2Bk/NjZhp9e61cUQnSnHgfqNBaKhC4HqcEqrvE4pQ5XqTqL0BD/vSUGHGb6UfjfVcQJXqqum9lE2PTE0GSnVeJmNbwPbZbk67+zn+ueRgSqYcqtw2j0jlube1kscHR1zOsQ1KeWgE1Iy4Wi6sJP4yWGwuyb3gxX/3dNb7TyMioPEH5HdNvb/wGxnpJha5I632hyc7LV7L1V3pZtvcz8u5XJO+VoQwrDwmSxcomumLaEuDqueHJmrc+kBsrz1ZAZUjXDlACfUKUXN/LMwdbaZwJAz+NMFrxcixLEJzfQpnUAnuZ7YXBWo6E3SRKMR53SgXv/jpEBAocRt7Im6k64QVFYyPQIJlijMLqyGEGK8qqxlyU/CrI8IcVUr/SBIOLYnWGazSwu7jlk8rSFUJwO7fFiXo+j/+IaZfFnO1Rk/2rhMhQ4lrwwKldmOu7ng4FrMhTf333qlhT6f9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVRiMkZNVTlLZEN2R3MvK2lSRSt3blZNc1V4Y1FWYS91MEJYK2FvcDNqZ2Rs?=
 =?utf-8?B?ZWp5SEUraXFxM0FReHFqek1qRFRORFpzVW14S0x0UTg4eVJpVFczWHJhazdt?=
 =?utf-8?B?bFdJcUV6WEg1VUNQSWRSTDkzVDdpZFZhTjlkOVdIRXR4OW9XRXZpNEkrQnZ0?=
 =?utf-8?B?SWY0Q0VwZG9vb0plR0owbnRSMGFUQmJTeGZycTRXQTJGdmdnWEd1SmVLNTNS?=
 =?utf-8?B?Umk1dTN4ODVHZVNldnBicklOcmIwNEx3RHErZ3RmZWNTY1BicjNoaE02SUh6?=
 =?utf-8?B?ZjJJdDAxQW9BZ2ZveTlaYzlUbHA0SUxlZDY3TDE0NFpYOWo2MkNUeDYwbE8v?=
 =?utf-8?B?MVRVUVh6Z1NFSzBYWlVmMHJvcjRpVUZSNmtEaDR0SllsRTREYUs0TmpiR1lX?=
 =?utf-8?B?bEVuUGpFMGY4TWtDaHZxZjBXVmN4SnlLcGNhTC9idGo2amVrTnBwVlBBeXNy?=
 =?utf-8?B?T2JTL2tBYktqd0NUQm9NMXR1TFZiaWpaUGxEVWRYSGptL2NOMGFDMCtRbGVx?=
 =?utf-8?B?MGwzQjRIRWVYbTdnWnloVkpuWmswclBEWHpuUTdWOWFLY1FxWjVXOW5ZeEV2?=
 =?utf-8?B?OFNHMGtKeFB1Vm9JMUdFcEgwUTNEanVWVm0vS1Y3d3pIZ0lJeENmSjZsZzI3?=
 =?utf-8?B?U2VCMXpoRUtnNlY5NHlldlpLSnRvT0s0WXhHNXE1UEpCRFZpMUxnWlJLMWQv?=
 =?utf-8?B?V2Fubmo0QVNsK25xbnI4bkVreVJ4TXo2WGpRY2gxWHd2c2hKS1lBejlvMHpR?=
 =?utf-8?B?WGVSNWE0TWN3VXMwbzZrZS9SK3lTQUt3STVIOUMrbWdHUHdCQ0RNeHcxc1RD?=
 =?utf-8?B?ZXVoRUZJejlqRlBwV3k0Skl2ZlBtNHBJUVhPb1hEV2FhUUFwT2ZFQSswK0RH?=
 =?utf-8?B?b05vQWFrS1h3SjE3eVdna2RPRzhuWlRJbmptSFZSbk9LUSs0VkxMSk13UDhI?=
 =?utf-8?B?U1IwZi8rU3RweUZIYVpIRmxTNXkzWmJnZEpIM0hGUUtjZit5VXFhTWNmR3Ay?=
 =?utf-8?B?d0NZSWlxTXNFTEtRS3l1UE5VUk8wSUpPandZUnZlekVxN2ljTG1qenFLVHhn?=
 =?utf-8?B?d20zYk40NkZ3R2FObnUvYXlsUEYwcWw4NHNoM3NTYytFR2Vad0U2bjVqS3VS?=
 =?utf-8?B?UjBNR1pzTDVWVm1IZDVoY1B4ZTRscTFTVWNRYW1RVnJjOW5nZ0pJaU8rVmdL?=
 =?utf-8?B?UHdKVmc4ckR0QzF4NFNWQnZOUkNNQzdqci9WTFdBakdhNkFiZjNDM2xXSDlW?=
 =?utf-8?B?RXVUOWxUdHN4TTRBR0lTTmRJMERFNU0xek0rTVc2UHBpS0xHdnpiRGtTWFFj?=
 =?utf-8?B?dytWUTlXMnRHVGh3dHdkWUI4OVFRcWIzVWZkNFV1WG9LMkF4aWxDaTFaWW9F?=
 =?utf-8?B?U1BaT3ZHQzhHTTlpT0dwaEVobTFtL0hWbE43R2lZL3diN2N3ZHd1dVUzNlkw?=
 =?utf-8?B?RDgzbGNNZ3hsMVNicDdBa2JzNWdUaEhicVVRWjFDUHNzdEhURGlFRzZOOXRT?=
 =?utf-8?B?WGprM3FZcU45WXpUbzdMQzhHZis0Q3c5T2ZIMU1IeFR1UWN5eUxoc1NSalg2?=
 =?utf-8?B?YjhYazA0Z0k1cHR3RzhySU5panBadjBHOUdmMlJoZnJReHh0SmZwcVgzZ0t3?=
 =?utf-8?B?VXF4SXdNek1ieE5KVjNGOE9CNmdKU2x5eXhxWVM0TFZ5TTZrZnRycE1nSWJt?=
 =?utf-8?B?czI5ZEE3MHVER2NQR1FMYmNMbm9Hd09iREpWTlp3VGc0SmFlME55YjhEZkdD?=
 =?utf-8?B?TzgzM0xCTHFYdm02eXhqbWc3VUdLeWM0dXduZmhDSGROckwrb01NVjcvYlpQ?=
 =?utf-8?B?SVR3aWNMeHFuaVhLTnhrR1NHRWZFNXpBYmFhQm45WUxMYVVYZjRWS29DZ3lE?=
 =?utf-8?B?ZjlycHF6TkI3OXRldTJJWFI2WnJ5NG1Vc056VFI4MU1uMmtuOExMUnY2anNu?=
 =?utf-8?B?MkxySlpPVGduWUc4WEV6cjhMYmdMcUkyTHJWTnJBTnJNRWNEU09IdE04UjVE?=
 =?utf-8?B?YmJuU2h5YUpRaFE2d0xNenIyRnRqRmMwWXFnOVZIM04zY3VTUnNCSjErNW5m?=
 =?utf-8?B?WEFpaGJCT2k0aHBtTCtlVEdvV0VQN1o4OE9PK2FRRG4wdzBldXltbjM5UnFU?=
 =?utf-8?B?eUVmYU5sUGpVSE55cWZvR2FnRFgvdHZPeVpIZ25rL2w1NTBhMGdTcHlqVU9P?=
 =?utf-8?B?SS81UjVWbGpTR1FudHF2RXRsTC93dmRXcVRHeWVEZ2RWOVBHTGRUb2VqYis5?=
 =?utf-8?B?WUphZHk5bnVSaUtiQnNqK0FYTGJXSUhSVXpLcnBQT040YW8rcnFleEJSb3RF?=
 =?utf-8?B?V0ZtZnFNSWk2alZtUlZTR0lJQVFrZW41VGVNZFRNMmtpdnBKZHJsdz09?=
X-Exchange-RoutingPolicyChecked: pdJ75fekHe7al1jxGMr6GbyVdUxbJxRHwqIjiRJOT7wYCmdTQnLDa+UK6Bs9UvTLoqqYT2gnUzH9lo3d44epWejrl48iCG0+0bpXbnRVqlB/zK2aPIXtrLqc2jg0o5OzSJbrllQ1t22luoHvKp+h0Ro5xjgM2HDX0qpa2UcDdY664VRQj/henKFsMzly97NV99rcQ961Z9sPsKlOHY+vtOaxBM8ZMa/8f0ts1l40gL+1VP0cbJ3JQsW20jkqmxh8aC9jYQCpz/hU9AjBCa4n6w8F9yEoIK6q3TH+n4goGpG6r0N+PCHcQ5TIqMKPiAt9M8LX1KydeNW5JsWrV9RQAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 524f7deb-29b9-41aa-d150-08df0a3962e7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:02:50.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBkBwMeBHpE2d+NPo/M3aDLIkbB3DeyP5EUAVrco3F5ZhFdciKUidmCgc4zt0YjiIHYOqqML/NTonA/wYDjFrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
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

HI Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Add kernel-doc for xe hwmon fan control and describe the fan control
> model built around firmware stock tables and driver-managed user tables.
>
> Document the exposed sysfs files for fan speed, maximum speed, pwm
> control, pwm mode selection, and per-point fan curve temperature/PWM
> programming.
>
> This makes the hwmon fan control userspace interface easier to discover
> and understand.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 43 +++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index a3ed139ad446..770f07fb6511 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -123,6 +123,49 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +/**
> + * DOC: Xe fan control
> + *
> + * Xe fan control is exposed through the hwmon pwm and fan interfaces when the
> + * platform advertises PCODE-backed fan management support.
> + *
> + * The implementation tracks two fan tables per fan:
> + *
> + * - A stock table read from firmware through PCODE.
> + * - A user table cached in the driver and programmed back through PCODE.
> + *
> + * The pwmN_enable sysfs mode selects how those tables are used:
> + *
> + * - ``XE_FAN_PWM_AUTO_STOCK_TABLE`` restores automatic control using the stock
> + *   firmware table.
> + * - ``XE_FAN_PWM_MANUAL_USER_TABLE`` enables the user table for manual control.
> + * - ``XE_FAN_PWM_FULL_SPEED`` reuses the user table path but programs every
> + *   point to 100 percent duty cycle as a full-speed override.
> + *
> + * The fan-control sysfs files are:
> + *
> + * - ``fanN_input`` reports the measured fan speed in RPM.
> + * - ``fanN_max`` reports the maximum supported fan speed in RPM.
> + * - ``pwmN`` reads or sets the manual PWM duty cycle in the hwmon 0..255
> + *   range. Manual writes are accepted only while ``pwmN_enable`` is set to
> + *   ``XE_FAN_PWM_MANUAL_USER_TABLE``.
Could you please double check this claim ? Seems like in 
XE_FAN_PWM_FULL_SPEED mode of pwmN_enable also accepts the manual write.
> + * - ``pwmN_enable`` selects stock automatic mode, manual user-table mode, or
> + *   full-speed override.
> + * - ``pwmN_auto_pointM_temp`` exposes the temperature threshold for user-table
> + *   point ``M`` in millidegrees Celsius.
> + * - ``pwmN_auto_pointM_pwm`` exposes the PWM value for user-table point ``M``
> + *   in the hwmon 0..255 range.

Is it always user-table point ? What happens when mode is set to 
XE_FAN_PWM_AUTO_STOCK_TABLE ?

Thanks,
Soham

> + *
> + * Writes to pwmN_auto_pointM_temp and pwmN_auto_pointM_pwm update the cached
> + * user table entries. The driver commits the full user table once the last
> + * point has both temperature and PWM values, which keeps intermediate sysfs
> + * writes from pushing partially updated curves to firmware.
> + *
> + * Writes to pwmN provide a constant manual duty cycle by rewriting every point
> + * in the active user table to the same PWM value, clamped against the minimum
> + * duty cycle reported by firmware for that fan.
> + */
> +
>   enum xe_fan_pwm_enable_mode {
>   	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
>   	XE_FAN_PWM_FULL_SPEED = 0,
