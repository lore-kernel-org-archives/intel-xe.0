Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C520ECD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 23:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BB210EAAD;
	Wed, 27 May 2026 23:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkBzevx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A453B10EAAD
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 23:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779924488; x=1811460488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hnposEVmIXh1sYyCLSaXGK9eKKwWp1rqEdAKSOmBtIU=;
 b=gkBzevx4I4+mpfaWkHWaOMwRFWWuXYKcnNdbvzzOWyYZzyAcV2OpGu73
 FN6tlZk+p7/QbMB2DE6d1iSccgUslPKCBVSqkb8oSKqsJ3tur4HSXhDgl
 wl5z89FzuKLrntyPoIIAPCB1Kt2Jq3NAAH0ZeVHNqOq/eYaQlT/Akpb53
 U0xBds+K6QBpkxBgXUfNVVmDgpg0jz/ijCUU35SpGzL+DFtP3Z2vPCrmQ
 6Z+Qyo6KRWDwApVOePPaGjGwe5a0u7HNkTCmYNz7A+/jUUxrLwl8mMMc4
 X3CQdTMZqbWSY2ak4DpfVaqEvyZ3NghtJyRw3ik0f1WjTLmKSQQJOA+yP g==;
X-CSE-ConnectionGUID: fLMyaGYmSpeedR3mhwUhyw==
X-CSE-MsgGUID: Fv79QrI6QcW98Tmg4yUIKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="68299253"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="68299253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 16:28:08 -0700
X-CSE-ConnectionGUID: lCIqcuO3QwC7JaXxsH42kg==
X-CSE-MsgGUID: PHp7wmWdTnSY8y06pbsFKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="242466761"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 16:28:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 16:28:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 16:28:07 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 16:28:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXtcrMJ1zALQEFRcnashpF2bMeosvL5436/LDQnedW1ufKB7LPzgyUG8YumdpjpA7Xo0z1ip+fktTsglErqGJ7Ak/KAFf43CPPS7HuVYRxwXhxp3mKCens5Q2rCuQgM++W2mKSmS41aBD/Fko+aHIpiLXFQNyL5/SKp8Fo971m6pBWyw/E/5jPaAZASA1DwvyGt63RLzYx/6Md6FRM/9xD1z9C32oiykQyB2N6L15xTfKBWwgOaosiiTwsH1epD8J71X5JYUTtoJvELobLD7uh7RC2dMcqsvUXv2TnCOPQQzUA4kDWXUWT4wZuu022Y6rrqqFyAVRSoCvs/HzGiR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rv6+rPMc8Mxtl3CxLpwZSas4siERtpbKK0sGDcLI3ZI=;
 b=RWy11WNPaLuAXdGzfkvLa61QZd4dzWHU3RSSBCuNankxCqJJb+YJXNjZeo+HkC27jNO20MMJfF4Tc9aebJdOoySnxsj1kRdV2PT0pM5RjG2bchvgP/QZhgWgmLraGe1gFrmFlFN0oQSMtq8zngscMpTLDVQFD67YgP2oATwAjCMWvkSbE2j5zGcOEejVNnw/yVYkLrwM9mPAN7Dll0ktt8/L6Lh4ODY4R0BkXJOhhzytK2VcBH8+/gsIf0QRQGXwMUfqykHCJTSwPPWVUdaXIGpBhzO7S2o6uwSm96KthdYvdY5rtuPnBGpzoqO1VUCKDxvYNE+OzeylcJYkH1JgIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6013.namprd11.prod.outlook.com (2603:10b6:8:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 23:27:57 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 23:27:57 +0000
Message-ID: <434530c7-352b-4802-a3f8-50dc9d6486b1@intel.com>
Date: Wed, 27 May 2026 16:27:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] drm/xe/migrate: Introduce xe_migrate_reinit()
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-7-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260516093131.27442-7-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 248b0b6b-fb5b-4368-e4cf-08debc47955f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|4143699003|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: X0+bYaBpfjr6V09Y+1RzA+MWqYcCifH4aJthtm38Ym4QTG+3/NKAV7n2Rx6pzrWK5X4MMcFqugxD/GH+SPqzmvuYPVA0vy3eh+A4DXTMKzmCQlCOXTUsFzEH/maR/SlOKGgSP/TMUvDvg5IJabnszuamx4NulRvw5uUJZooxer0jh7r1crc/6oabctVJP1mXUAPI3kHtc5rbUyfDhiItZXeNCOfKVO0U2it1WRDrbIKawmaRHjgiHEUXfCDMFtuRBF1X94odEmIkdLmpmbrVpvjWFjpD6LMQxlXa3Ej1w8tvWW+vTfoZZu3rm56pn40SmkTx+5SSjYwdTvWdkPXNhTT6oZrDymEv/vxyCZLMfkPxO7F4zGk9kJhJ+h0dHsDmXW5MU0vZreowT+G4kT1gP78zqDQhRpZoCJm9PJGF25V4n3HbLHwzOISOS30vYShJk4biX3Upl1CBR6HETsRRvvfCc7HgMiqb1jJaT/LMhEwmbX/clqjrS3XpQ3lz4TKK09FadJUg5MY9a0y0IXtpT7Nrx3zhdm5QzqIgLbO2nKReYJOTST9kNocQRuFIo4JAoPrc3zrYemhde1FOKcrad91szOoEQZlQ83tpnuMMq96thHFrZ0cguSBIoYyWSDCZBrfChQKqAKE0ZQTPjDV5t+pwQa332s/2Y+iKycKZP0APtoGYmEUwMBtWJaPc3SCI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVF3SFhDSXhYQnY0QjZFdmlrQ3kxdGJFVEp2ZitVNXJ4ZjdFVUdQUWtZM0Nr?=
 =?utf-8?B?YS9FaU5maTVHTlBDUHo3NDVoaVpLT2VXR045b0pVNC9McEp1bnBNUlBxWkJO?=
 =?utf-8?B?UE1MV3AxV1BYZWJuaC84Q0JtQjA2eGlFRkMzWDY2MDFkMFhscjVQVVVaL0xy?=
 =?utf-8?B?UnBJUTVCOEg1bmJCZWs1QXF6a2ZWMVIzUG9sRS9uSVU0REtVTXFtMEo5aVRj?=
 =?utf-8?B?MTRrQVJLbUFKWVlZVVVveXpKL212SUhtMmNmQnFFbzlTcEdNZTh2YUI3QXFM?=
 =?utf-8?B?aVlYV0Zib0E2Z1NTQ0FVaFQ5cy9ldEV5WmI1R2MwM3JJOFk3SHAzbDFpWnlT?=
 =?utf-8?B?Mko1Q2ZVbUdCazNoZ3grM0ZjZVlsaWJ6eVVYaExzZ3Rmb2tZVjlxWmM4KzR1?=
 =?utf-8?B?bC9UYmhIOTVQcms3U0xUYkszU2ZjSEduNTRTK01TTXhHaDFRYXQ2NWgwczdx?=
 =?utf-8?B?d254UUJIRC9SMlpKcjVoNjJGcHpqUjY5UWJIZm5NSnc4SER6bGQ3ZC9RN0Fz?=
 =?utf-8?B?YmtnRTk0WGtHb3BKeEs0aGkrcFlueUg1YTB0c1JvcXMySDkrL01kMEFxUEdr?=
 =?utf-8?B?RUpTT2VlV2UybEc5RVlNVlgyYmduL3dEZjVSV0h1YWJReUw0cXlaZGpFRitP?=
 =?utf-8?B?WVRVU3RaYStUN3pjbEVSKzc3VGRFVkdDS0M3MUhsYVdibm0rZXlTTTl1d0Fl?=
 =?utf-8?B?TkNpNE94ek5KWko0aldMMXE4UlRSTUFKRnVmcDlxbGhyOWZ1SDgrVmh5d3gr?=
 =?utf-8?B?RmJwZVd6YzJFVGN3WkVQRjU4bHJMQnhyemxncDhmV3FtU2ExNTJWZW1majg3?=
 =?utf-8?B?c0NlZHZLOHJwQlZ3eDU5VmZNRER5bllzd1FwYSt0NFZ3aG12dGpRMjJrdVZQ?=
 =?utf-8?B?dTBtTXpyUGhxdkptSk9CZktHaFh3cGdhbW5VaE5zV3pCeUxpU2dhKzdSbyt1?=
 =?utf-8?B?dGNOQ3ZWdWIwT0hneTZXeE1XWGRSY3BMTCtXN1FOeHBrN0FrTDJQejhtRVJr?=
 =?utf-8?B?TkFvbzVVcU1KUmJMdzRaclJmYWhmN2Q1eDBDL2NYVXBvdlhtVFdDeW9DeWlQ?=
 =?utf-8?B?bGhTYUppdTZ2SVFvSVplZ25FRGtaZDFpMFQvSHRaNEZYdFdKa2hHT0lrZmFy?=
 =?utf-8?B?RDFRMXZmR0w3dWZOOUJ4RHIwTEZWMm9VNHhBWlM4ZUxYaEw2cmJkUVEyQzl2?=
 =?utf-8?B?MkdScnZIYUQ2eGh0L1VGeVJGMlhXMnFCOWpZb3lZR3V2MlVCdC81ZkZvRFFo?=
 =?utf-8?B?UHF1MDFRclJuVk5IQXJsNmJ4RTB4K3JFcW5kQklnczZqSkdmaEpJaDBuRTJN?=
 =?utf-8?B?b1FLVU9pSkVzbHdXdjVhRTVlUDN6NVpEU1VuVWdPay8wOFF4VTl6NWtoVkZF?=
 =?utf-8?B?NXVrTUgwNWlQU3ZXRkZLTCtMVDF0bkhsSlN1NzJrWjBJZTdiZ3VXMDlQT3JZ?=
 =?utf-8?B?YlM5VmMyeFJWZnZuRWxHMExweEJOdnIwcHhmRHBEQ095L1JPMzZFT1h3c3Rj?=
 =?utf-8?B?NmhQeTUyWkhHT3pPN1ZsQkNKdExDTDFhbC9IbXllK2tJc3ppQXZuVjFEY3F3?=
 =?utf-8?B?RUE2NmtPZGR0UzUvbzJvOE54SGQxTzN5VmszdVh4NmgzWjI4UEpMaGRKcXpQ?=
 =?utf-8?B?R0owSDY5V29wN1Fnd2tHMVJHMy9wUERPbktSOWZKbktxMlE2c2pGUk82NGh5?=
 =?utf-8?B?YUpqRjJubm1SWnluS0NMNkV6cGNTbEZiNmkxRDhlajdlNWNjMWJlSEtMbVMx?=
 =?utf-8?B?TGdWbU5KVlphTmpNc01jeDZ2VFYvRkY5UHIxemlJWXlRV3ZlT2NnSitxVGdH?=
 =?utf-8?B?TWVlZmI4Y2M2L2VwRmtWUTYyME1OSTlnNWFDLy8zdHVLMzZDRW8zSG03WGZi?=
 =?utf-8?B?NjkyYVJJZlRvSk9zM0l0U0dHSHppUHRXWDRCWklSSUxrMmNScXVEc3J1aENy?=
 =?utf-8?B?L1NCSnNBRktCdkgxMk0xdTdqdURKeHFwRnVLd0hkMzNBQ1JvSXdtRzkzdEEw?=
 =?utf-8?B?eFlzMXhGUmMyUmdwcW9ZZGxpU2hSeS9uMXc2bWN1bzZsZ25NY2dCVlU3K3pE?=
 =?utf-8?B?TkwwYVloNS8zYmI1d3RIdUIwVHppNVVlb3RYRzh6YWNZSEoyZk9FYnRSb1RU?=
 =?utf-8?B?SWNXZzBzSkwrRXk2N3AwWkJ6UGFHeHBpcytoditHUk4xSTBKNkFjcUVzMlpm?=
 =?utf-8?B?MGJVNXNDY0JFRVM1WXV6Tk8yQUNmUmtEeURrWUoxeHhNOWIrRW1jTjNGSFEy?=
 =?utf-8?B?TEVRdFBUVEthK2tDSEM2RU1IT1ExS1RRV1M3QVRCTVB0YkxpazhuRUZTWDBj?=
 =?utf-8?B?NngxNk1mZHExSzhKT2dqR1NYd2JKVjR1WVZXVldVVEpwTUZSK1RuZXEyeEpx?=
 =?utf-8?Q?xExgjNiXfDwPWPUs=3D?=
X-Exchange-RoutingPolicyChecked: gIkDW7sc7YtH1HQ211Hst3sCgK+BCGPjialAHYrPjbhbhS48oMEWa3xOPAm1OqhkAVcL5eMiqp59ACMbF+F+gPLhZ2zdhCgYNFP/QP6G3ySyO5BXtEm1aIWANCafwtZHxy50eGiSNNhBRyxG+mxGoxME3r3EZSdJ1Le15renSiAIjuruQPGDlcrYjAppnnhIqw+QztqRtOSEJLzbQojE+gKV1PKoKCaaOhioV0wg3zZy0YLuC0NSVdyCHhbw8eH3jY4O43RvYsD08fHRImiYEk+AlIH8+CbjzHgPp/6GwTeP9PoCQKdwK6cOv6ZzAF82jsAjXe+RIfPJVOqRkez3kQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 248b0b6b-fb5b-4368-e4cf-08debc47955f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 23:27:56.9879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 440jr2qiv+sFfQVEc3n83hysQTVaqlpEpSMY+QA5yz24ruGsU/VAskR9WkoTgq3HFuwHv11qazVsJH6Y9o1wyoQWQRXKlNL9Ms9t7Gd11TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
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



On 5/16/2026 2:31 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing migrate context
> after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
> and pt_bo already exist in migrate structure but since their contents live
> on VRAM, they are lost on PCIe FLR and need re-initialization.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: Re-initialize migrate context (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/xe_gt.c      | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_migrate.h |  1 +
>   3 files changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index acc28389b0d8..a60e04c4d885 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -928,6 +928,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
>    */
>   int xe_gt_reinit(struct xe_gt *gt)
>   {
> +	int err;
> +
> +	if (xe_gt_is_main_type(gt)) {
> +		struct xe_tile *tile = gt_to_tile(gt);
> +
> +		err = xe_migrate_reinit(tile->migrate);
> +		if (err)
> +			return err;
> +	}
> +
>   	return xe_uc_reinit(&gt->uc);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9428dd5e7760..9e1754028e1f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -454,6 +454,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>   	return err;
>   }
>   
> +/**
> + * xe_migrate_reinit() - Re-initialize a migrate context
> + * @m: The migration context
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_migrate_reinit(struct xe_migrate *m)
> +{
> +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
> +	return xe_exec_queue_reinit(m->q);

I'm not sold on calling xe_exec_queue_reinit from here. Wouldn't it be 
easier to just destroy and re-create the migration queue, instead of 
adding support for a new re-init flow that's only used during FLR?
IMO the re-init would be more valuable if we went with a gt-level 
function where we loop through all queues and re-init all the 
kernel-owned ones. That way if we add another queue that needs to be 
re-initialized it will automatically be picked up by the loop, instead 
of having to hook up a new callback in the FLR flow.

Daniele

> +}
> +
>   /**
>    * xe_migrate_init() - Initialize a migrate context
>    * @m: The migration context
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 965c45889c72..49d8c717b957 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
>   
>   struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
>   int xe_migrate_init(struct xe_migrate *m);
> +int xe_migrate_reinit(struct xe_migrate *m);
>   
>   struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>   				     unsigned long npages,

