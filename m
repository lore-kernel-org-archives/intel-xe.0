Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A79C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 07:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F3A10E3B1;
	Wed, 19 Aug 2026 07:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzBMCHc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633A110E3B1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787124665; x=1818660665;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8nzHXP2IcocX06MrHAloeLcIhpCSMegRLEVVlA4bMY8=;
 b=NzBMCHc3V6AmAz0jGP3QqBJp6Gg6tDDHWi/u6vFMG5LsfijLDUKnucx2
 0SmIPyBfJDJPRep/VSDvjStwnKalWC+Z8M57sjl1OjhhAxrEks4l3ItrL
 ATHQnVjloWwEdb/NToMT0NVhYeXdeC2ZLbQVa5h+NMBQUfptS3QgD7/v1
 gxR8AnrdPEWv8t0IzXZ74uCMrjpKTL6PCMVuzV/DSjzFgp9fkhdta/Vf+
 GZ0L/vw3JR2bTX1zRT/qOpA2iGwTq+OwZPSqO1206SIsCMCyeVLAPF7PB
 9xaennUZ7yGY/f9vCAplDPevYVVl/bxNoq5PH0Jo0qQDOoHaqnstNwsU3 Q==;
X-CSE-ConnectionGUID: v7dDejC3TNyr1k8LwN8nnA==
X-CSE-MsgGUID: JA6Nw3NhQKSoshTxVSMLJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98295544"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98295544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:31:05 -0700
X-CSE-ConnectionGUID: 9hIojDewQqKb6K18E7dawA==
X-CSE-MsgGUID: TRPnjtRdScaBSCKx4EmzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="268972099"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:31:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 00:31:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 00:31:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 00:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDxV8rAeM+R/ALWMGIY95fP0Nyv6f7FGSP+bxHXvSpFRw9YnZjGJsng5rhU1PdqGZnG69GV6rq18mBsV8etDwd7A2vfsiDZLdmb35GzPSCcvRwdG0l7nNO+kR6XqUk0q751ZYZfi3xed7bFCuNYr7DAgc4n1GVutzE7MbQ4l5cgqCfDEEF0zqQCCzZwgThZpFY3PRB3MGyDQg9aE/Zu0Mx44mXdifGO2zx9hgY9SCGeG5aZsq1oa1N6BcBuAB2OU9WW3O/rHUwr8/3qKowQyRfLiRs/1dv0UlFqgKPMk0++EvtXe0QScqp/pfoJsTVAqrGBa6iYlkp2W7//q6/97KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjBbnuz4Jkogwvhn+SguUCGGVy4IhxLzftkTOvtWmpY=;
 b=i0PbfiRBigMZdCfI1QRl6XXafqr+A3ZAheoHm4kepZWprwocMqAbSk6NWNINqLUB8H4yo2mWuoCzpz+J1uTdHd0ZXopM4DENLh9RFVyL6xM1hEr7gVgQDizoNG0g0OvrYD7gesXGBEtWtdbl1w36+Q/yro6pfUm+O/3VRXB/6OOBuFXoXbHiDKbgg0+/wnVAUyz5DZlhmNgq2/X0Dv1JyZaWTJboewlF4RJ4zxOySr1qdgocwoCHi7kBlJg1dijZmNRh3Ge90M9GvisPkAEwH8z2bPgKD3CMOXSxwMg7yCotP20nWjzNuIaJeDyE9nKmCkIn60+teFarnc2TD//zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 07:30:57 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 07:30:57 +0000
Message-ID: <fadc736a-e4c4-4093-95a8-a1dfbbe6e0e1@intel.com>
Date: Wed, 19 Aug 2026 13:00:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/sysctrl: Add better sysctrl error reporting
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260818131003.495053-2-mallesh.koujalagi@intel.com>
 <7647539b-6ae4-437b-9f33-1690ce1910db@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <7647539b-6ae4-437b-9f33-1690ce1910db@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 240f3923-d9b1-42f0-9b72-08defdc3cf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|11063799006|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T991RtQBzYYG1we8xQPCmRRO4XL+soYlU+Fb8CBxrZczWT25qPDDl3w3qzUnzFkTHrNjk6YA0kYtAHUk0XiPZojmZv484EqQ4cNru5pCraZjcWRR+7ozn9qLOt7krtOoF4i9l0wsJnoRdXJykJmDmk8eFBnxBp38PI6ySd27dluNKTTfw7b6I21a/LB5ebyvLUvmtHfzaroBqDaZikHzT39iQnYXSe36TKGN8z61XiOuPJJamNYQk9evF3PPBccptsydhaSAbbNmiYjh3jbsTcYkn4AKwvWChCCq8Q8tC99e9gGlqaJc1XTWvVnlv8pyIf3ZDamN546Lymk17WVfAZgSx6X4Nsz9kJBF0BEea9eo90SiC/iv368scbuQ/kssulddVrX2kO5mKO0vqEoA7b6dhJntW5MmGTfTdw5+lG8gDZuHgfIkz6sUgTAm45OOqul4BZkI3X9llKm7gfGZznZNMPskTqYNi4i99APNcSn10OYJR+33whYHsQ8Wy5VNQoQymBe4FYTL2YxWgclpGmDmzTvKzDsGz8hlvPH1X/efiRdYWM6YgcLlIqoTBmiF+9Wt5Jr/AYVdgTVInNSstGqndVmpWCMrboyoub2hLOM2nGsdFv6lB7//rALkSiTFjXeMspEa9timYeTkGTbEcLVFpygeNH6XZd3o6SPZGh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czJNek1Ja0lkYm5Pam5qWnZMdlBDS29ja0JVaStvM28xOG95WitkUUo4NVlj?=
 =?utf-8?B?SkF5K29pUUQ4eU1pMDRleUtxQnBPWWpac2R1elRpck5oUWxPdkZrUWVaZnFv?=
 =?utf-8?B?S0NER2ExMTZhRWdNRWgyZUNuc3FuVjJpMnFIK00yNllXRDNzYnVOSkxOUjV3?=
 =?utf-8?B?YzRFbWNkVE1yN3Z1Z0JCdENaMjBxd25GcjhXb1JLblhMb21EaHdna0tmMWF1?=
 =?utf-8?B?MUpOd1lseEhueGhrQnI1YmJIUFcxNzZoa1FWdGV4L0NpcU9jWmw2L0Rqa1lo?=
 =?utf-8?B?Z2ZMR0ZxZjR6NXlLcXoybWthcE9CS0Nnalo5Y0pkajhYdGNhQjA1WmZqMzFH?=
 =?utf-8?B?dWhyMGYwNjV4Zi9SM0xIM1BlUHc1djcxbHVyNzVQMkZBV1A1SEN5ZGxaK2ZI?=
 =?utf-8?B?THpZY3BCbVIvTzJLZ3owcFlqSGZrQXp3L0xGZnZDcEt5eXRGdFZWb0h0aTFB?=
 =?utf-8?B?SEY3VDlUbTBrdFlyYUZZcm1HUjdKb21Ia3Z6VDhXLzdDOTNsTGowalBhSStE?=
 =?utf-8?B?VDd6c0h1Mk42Z2M5eTI1T3JkVHI5SzRqTjFnSXltd1o2Tk82QzB0eGliOWRN?=
 =?utf-8?B?YlBaQ2xzR0FWbmNFdS96WmZRVnhOekJOQWtHNjNTSGRNaHV0OVBYWHVyZEMy?=
 =?utf-8?B?OHdXWmFRWk5YajFFL3Jianovb2EwOVpIZVg2TS9HaGRVbUsyM0lmRWZibXJD?=
 =?utf-8?B?c0tuQm9VeWlla1l2U0FBcHorRGxzaEVqVG50dThBZWl3NWwvL3dQTE9LZ084?=
 =?utf-8?B?U0tmRENXTm5tVlp3RlUrSmpuMTlmSTJyNHQxejYwT0MyZXg5alkwYXpYNWdM?=
 =?utf-8?B?TlRram9weWcyQ2lvcXVkVFVlTnBqei9QNERpQStGdG1NTDVDNVZRMUlhMHVn?=
 =?utf-8?B?MmdpRWo3TVFJN0xsaWhtUHlDWjVGMUsrNjl0ZDBHUWRJR3dGeVlHT1FQOWlB?=
 =?utf-8?B?ZUhsMW1IWm9vSWV6OEZNbjdYUmw5eHFOdUJjdUdvT2trWlExbnBkcHFIRXZ0?=
 =?utf-8?B?SHFSMmc2NGRFUVJNQ1o1ZVdSTko4U3AyZ2k5WWdSQVA2TlB2eGlvQVgxTEUy?=
 =?utf-8?B?bHV1MkFrQ20xR1JTMTVLeUlzRXVnK3NicGxCYUhpUHBLVWZtUER0L3ZjUkhk?=
 =?utf-8?B?aWNtbzRRUkRybGpHZjFkSlk1aDhGcFVTcndnL3RGVWdsSVpKalNHcjZIUTcw?=
 =?utf-8?B?NTRobjVqRS9BVDdDZWhFdVBMNWlVbzBoME4vU280YTFFV0JvV2h2aUIraHhh?=
 =?utf-8?B?QU9UOTAzNGNHaUV4K3UrZGREWVBSNUFDL0FpallqQWNiRVBlaGprNFd2MGs2?=
 =?utf-8?B?MzJYQVlsVWZSZklnRVQrZEtYcFJDWEpNMnFUbUlpbi90TVdMMm9MY2pQRUZZ?=
 =?utf-8?B?UjBTVHNkR3lOSTRvVWh4TFRnNWhNamtXeU00aHFMUVRNdUpwdFgydmdma241?=
 =?utf-8?B?b3ZDRjd0N2FDWDBTeEc4SDRWaHhEbVNkbGdRL3AxZ3V0Q3k3NU5yQVdJZHQ3?=
 =?utf-8?B?Z2tha0xudk51cTkyczUyVmJXbkh0WHFOS1BUWXd2a05aZUh2YlN5WTg2WFpz?=
 =?utf-8?B?NHJwbDM1dStPS1lDV0pQSmRtZTJwbnFuTXlzdzNDWlMyTG1EaEhlVDl5WHdM?=
 =?utf-8?B?eWdlNi8waGRRMU9ib3FPdy9laVhEL0xDbmlsRGpDWTNnaHBaTzlnYVFOVDQz?=
 =?utf-8?B?cWlMdC94K01yRWp5di9IMVE4RlRVcHZqbWE0QWVIZmZYeHFIM2pzNWhYVDJa?=
 =?utf-8?B?d0s3WFl3K2crWlltMWNZU054UU9WVEx0QXpTSVcxSGt1S0oveGNTckNrN0Yx?=
 =?utf-8?B?VUo4SWtOZUdqSEF2UXZlUWZ5SlpJYWlNZmJGM1F0OVU0QW91UkdBbjMwTXps?=
 =?utf-8?B?TUZTdlY2UUJSZWJIWmdIRGZRQ0oydyt1UXJPWXFtRkMrZkNwYko3NWdTZEc0?=
 =?utf-8?B?OUN0RVFHcWNrenlOcFEwaEhPT0FOS0VTQkU5Tm9ySTlPKzRNenFRVWlXRTAz?=
 =?utf-8?B?WlNCbjRUcVkwalQ3akxtVWl3ZWVGajUwelRkUUpkZDhZbmswSHdlYmFReWlT?=
 =?utf-8?B?eHRsZGprVkxjejBIck05RXdpc2NNYWNpUnBnS01VT2ZyeGhyR2ZZMVJ2N2E2?=
 =?utf-8?B?S3V6UXA3SDJjVWNQTnpVVDNKRVczRWl4ektmU1UzcHJwaGhDcSticWFyUHE3?=
 =?utf-8?B?Sm1QODMvYTVyWk5iWnlyOW0rK0tBeGtxcUYwblBKblJqNDlEY0F0TEdxVUdu?=
 =?utf-8?B?ZlN6NjlTMno4N1BEamlySHFScGUzTjB6alNsS2xpY3JNQlNOQ000Um5TZytp?=
 =?utf-8?B?RWhJVlpiQzc2c3RQcnhtTEJmMUJwc1hkNzhxZVJFRUJoUUwyVVMzTUZzcS8z?=
 =?utf-8?Q?3AE8OxOftXGgVe+k=3D?=
X-Exchange-RoutingPolicyChecked: fglHQrbXpb0n74ELObbX6Afywl74g9Lke9f6OgVjhxkOj/89HYWzJrt4gqeQKz1qxmBzyTc+DiwEk/MG/VaiJF1azup6gncnleMLMNwfcNznVfHyuJL/3XgM+cPzfztYJcXqBT4hTgep2YXJ4ixfyEuWiuPJWDMXArxt3GEKI3bZCPkJJuauqF0XS2D+VO/lXER05QX2x47vnXSjdBp1qwj2RDXCi0L0CbSWYTYNWqPQ2nSxojDnvjcGpWAEYPO2y06hp09Yl3AFaW8OQ6pwxsY0WMXEIcLsBZbcUBvI3ZZSJU68Un0DWoQaRQR3Z/4VtuWVtsaj1FUTFZMKPfno+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 240f3923-d9b1-42f0-9b72-08defdc3cf1f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:30:56.9994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRsf+jM3/wCNJ31Hk9PV9DUnHUqSFdkfmBSTZenTqPR50+CU9VJaJ4m72dEcsHOqeZWVdUmLdfhNF0GYsTVAREsnwS6ITAk2w2g4xk8HO/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
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


On 18-08-2026 07:36 pm, Michal Wajdeczko wrote:
>
> On 8/18/2026 3:10 PM, Mallesh Koujalagi wrote:
>> Switch sysctrl error messages to xe_log_err() with SYSCTRL tags so
> s/Switch sysctr error/Switch the System Controller (sysctrl) error
>
>> tools can reliably detect and categorize common sysctrl failures.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - Use -EOVERFLOW.
>> - Drop sysctrl in xe_log_err. (Michal)
>> - Drop redundant %pe.
>> - Print response->count.
>>
>> v3:
>> - Rebase.
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_event.c   | 12 ++++++----
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 29 ++++++++++++++++---------
>>   2 files changed, 27 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> index da395148ee9d..4341ea99cdc3 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include "xe_device.h"
>>   #include "xe_irq.h"
>> +#include "xe_log.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_sysctrl.h"
>> @@ -25,13 +26,15 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>>   
>>   		ret = xe_sysctrl_send_command(sc, command, &len);
>>   		if (ret) {
>> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
>> +			xe_log_err(xe, SYSCTRL, ret,
>> +				   "failed to get pending event\n");
> nit1: no need to break line
Not required, will remove it
>
> nit2: we should be consistent (at least per file) whether
> the error message should start with lowercase or uppercase
Sure, I'll make uppercase to start of each message.
>
>>   			return;
>>   		}
>>   
>>   		if (len != sizeof(*response)) {
>> -			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
>> -			       len, sizeof(*response));
>> +			xe_log_err(xe, SYSCTRL, -EMSGSIZE,
>> +				   "unexpected event response length %zu (expected %zu)\n",
>> +				   len, sizeof(*response));
>>   			return;
>>   		}
>>   
>> @@ -41,7 +44,8 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>>   			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
> we do have xe_log_err_info() now - maybe we can use it here?

hmm, why we need to replace xe_warn to xe_log_err_info, since it's part 
of dmesg, user can easily get it.

IMO, adding to many xe_log_* helper will defeat the purpose.

>
>>   
>>   		if (!--count) {
>> -			xe_err(xe, "sysctrl: event flooding\n");
>> +			xe_log_err(xe, SYSCTRL, -EOVERFLOW,
>> +				   "event flooding: %u\n", response->count);
> nit: from the dmesg line it will be hard to guess what this %u really mean
I'll add "Event flooding, response count as: %u\n"
>
>>   			return;
>>   		}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index e13eebaac1d0..a96ef2864526 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -11,6 +11,7 @@
>>   
>>   #include "regs/xe_sysctrl_regs.h"
>>   #include "xe_device.h"
>> +#include "xe_log.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>> @@ -115,7 +116,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>>   	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>>   
>>   	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
>> -		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>> +		xe_log_err(xe, SYSCTRL, -EINVAL,
>> +			   "Input data too large: %zu bytes\n", data_in_len);
> didn't we agree to change that to xe_assert() ?
>
> (this could be done as a preparation patch)
Sure, will provide as a preparation patch.
>
>>   		return -EINVAL;
>>   	}
>>   
>> @@ -149,7 +151,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>   	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>   
>>   	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> nit: shouldn't sysctrl_wait_bit_clear() and friends return -errno instead of bool?
> then we wouldn't need to figure out the errno code at the callers side
>
> (this could be done as a preparation patch)
Ok
>
>> -		xe_err(xe, "sysctrl: Mailbox busy\n");
>> +		xe_log_err(xe, SYSCTRL, -EBUSY, "Mailbox busy\n");
>>   		return -EBUSY;
>>   	}
>>   
>> @@ -160,7 +162,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>   		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>>   
>>   		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> hmm, actually sysctrl_write_frame() always return 0
> either change that function to void
> or use the returned error code
>
> (also as separate patch)
Sure
>> -			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>> +			xe_log_err(xe, SYSCTRL, -EIO,
>> +				   "Failed to write frame %u\n", frame);
>>   			sc->phase_bit = 0;
>>   			return -EIO;
>>   		}
>> @@ -174,7 +177,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>   		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>   
>>   		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>> +			xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>> +				   "Frame %u acknowledgment timeout\n", frame);
>>   			sc->phase_bit = 0;
>>   			return -ETIMEDOUT;
>>   		}
>> @@ -194,7 +198,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>>   	int ret;
>>   
>>   	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>> -		xe_err(xe, "sysctrl: Response frame timeout\n");
>> +		xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>> +			   "Response frame timeout\n");
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -249,13 +254,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>>   	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>>   	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>>   	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>> -		xe_err(xe, "sysctrl: Response header mismatch\n");
>> +		xe_log_err(xe, SYSCTRL, -EPROTO,
>> +			   "Response header mismatch\n");
> maybe we should print the unexpected data from the header?
Based on data size, or else unnecessary putting pressure on dmesg.
>>   		return -EPROTO;
>>   	}
>>   
>>   	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>> -		       XE_SYSCTRL_HDR_RESULT(hdr));
>> +		xe_log_err(xe, SYSCTRL, -EIO,
>> +			   "Firmware error: 0x%02lx\n",
>> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>>   		return -EIO;
>>   	}
>>   
>> @@ -381,7 +388,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>   				      cmd->data_in, cmd->data_in_len,
>>   				      &mbox_cmd, &cmd_size);
>>   	if (ret) {
>> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
>> +		xe_log_err(xe, SYSCTRL, ret,
>> +			   "Failed to prepare command\n");
> nit: do we need to split the line here?
seems, not required.
> and maybe it is good to know which command actually failed?
>
Sure, will add that cmd.
>>   		return ret;
>>   	}
>>   
>> @@ -391,7 +399,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>   				   cmd->data_out, cmd->data_out_len, rdata_len,
>>   				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>> -		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>> +		xe_log_err(xe, SYSCTRL, ret,
>> +			   "Mailbox command failed\n");
> ditto
ditto :)
>
>>   	kfree(mbox_cmd);
>>   
