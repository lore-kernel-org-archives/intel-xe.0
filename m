Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFCBF43848
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E1110E165;
	Wed, 15 Apr 2026 16:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MN82oD3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E56410E165
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776271623; x=1807807623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SEgcMH50Kqec4jlzKwFyL3NJLCWf8I61wZCKZX4XLJE=;
 b=MN82oD3DG45sZPx77O2O+iEHNxPTHOQAVao4iy7BLRYDMWBHTJrtY+d8
 IKAG+hZyfPCPLVUAuiZjAXR5+SrknintLoKEoqS5K/yaUvYHSWKEHpVlj
 I8Fl7Zp7fKIRYmuXiqGIis6G3oh23m2CnP4cmko0oOkmuAK6tq3Ki28Bz
 bEUdnsnzLnGGSq9QvEU1mUc4hw53XL2CFW4FwzhvYg/DIo4KC8kPa67kg
 C+qt0GBIl6GFTRPWvvg9+QJ/uOKzBJtt+q9gQCcXMJ++/zqm2Ih/rnSf4
 wt4qasnQHYMwQ5zbUAXbTxjUisLI62tY963UdWBpBzixyZZ6EpdDSoci0 g==;
X-CSE-ConnectionGUID: bWnDHrlFSZKcxHASjnxUkg==
X-CSE-MsgGUID: Y6kEJ4+gQ9imfBQ5qb9yTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94658866"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="94658866"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:47:03 -0700
X-CSE-ConnectionGUID: VXcD9aE5TR+8HhP9uJkK8w==
X-CSE-MsgGUID: TR1GM7BsS4Wr45kaTgrGcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253894512"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:47:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:47:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:47:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+DUvdDwbieQY8bIaO8r/+FTNzLN+M3tFTGqiqKimceP405WcfKLuTARxFX6xjRrZdattc+Qfq5BSqUJGQgiLcn8IJqthlCMASNKy/w1LNcoJQITHdUIhSX3wyOxd4OZSdHLMk8dn961eEWoKpELpJPBg30x/IpXZfrWCKCpc7mUvMJlrgBcWHFmCHWkhI2o1mCj5Aj4k4Q2B0lpMnnPsgtnxRZLyXE+zYh+fs4QMDgbfJ2YeE/fauiMMBV9Fiq+mKTP5CHlpYDTMKt2xzXJvlcCPN/VE7xsU1q/reU0/94k7e2jMDsTWZjTrsLLOLEW0BANLvhZFdAU/8VV5VqzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc+T58cb6AfN2iPZ80EcBd3UW9hcR6y1JpDEiKCNvlE=;
 b=cv34CTC6MRTy+T0a6nyPMznC8fbnUA+nYO8DnTiTXBG0dR5ZYkhfM/0M3ST3+HEQSCPruhwh4oV453DL5lx0mLC/v5Hmv5ol+mF4UfdRXojR/jgpDTr29h5v6Lei7i+DsmODSDbdbgq4evCOt/06y2PJxeyl+DZPPigPnmXYmLF1s9NnpP3NVLZbkrbEYVNKUpoe0ALqt9rjGBMeWTJD31Tn8S4nJeQ9nm7SD4ox5thD1sATLw6Sp9hpoFVQCTMXRZxIdHU21PeODDTgWkaUj3cHs1+7UMLrauwltQzDFges2BR5yTU6GRJkHnYOO6jxVm3ia8UmRrKif3IrMUl5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV1PR11MB8791.namprd11.prod.outlook.com (2603:10b6:408:2b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 16:45:58 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:45:58 +0000
Message-ID: <5a192a68-5ff2-4d1b-8910-3cb1315c8717@intel.com>
Date: Wed, 15 Apr 2026 09:45:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-10-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260406140722.154445-10-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV1PR11MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: b78d4d5f-3290-430b-c8fe-08de9b0e785e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11006099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: l/wKHvyYItl4WfL5G972cygOsKRyaZLH01bkrA+10RrnX3HGGuMcjtGMfyDoYA2oOAD1fSJhhpF52OwdKPstPG/S9B3viir7+8P4zT3kF/+jUEn3jkyn6E1ZhIALSnI6L1QzNbP5+3sTWYWoXIW0T+kqxDUY0cb7x7/xGuaXXShu/QdzwheRVqHp0dosor8IgrXqwE3MH8rlTG2dLxVUDu0+Q+MyAJqRcooMUODkoislOlEVgoDoQvmLnJjPP/YvavYQ5Xl9Fd1kFAYf6eiUAz3WdXlLjChDH8c4RiHpSeNUJqVoQpr5xH5ZMlpkx/8grbZKlx6qOPFJFgcmZNj8YfGZZhvIoUFKCmLInnbA71DAzPI4/baHz3jq0D47KxY0uxPmaVJZbrVRDK8+Gzu9673EzJiubKW5f1xBcgZ2WyAGRrm7YSJEA/9xiAZiJBC58VTOSrRXPRyTCcqSooa/HlfmFXj371NOc5FpHkir5yPlrfK+gSY9VqzvRV51ik19H0o8G8Vu6NTkk6HyAV6XNhWPAZDiAjGGuWp8Y4IZwDt8/iPXqU4i8LQUicSKYP2x7StdfQzIDtw7r0Eg97ercESWMMnXZxomvscN9ZBBA1L9WRqGlOeEDB21O19pEVRYrF31uEhfbhZqO6oEFcMTSlbA2spqb4jHnqe7mwz5FoNVMcKz3yGe6X+Jl9H3CGvY4PqXnsghMC+U4iFnqpIFBYLIA6jVSSLeKP/Sgc7ajsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11006099003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUNzeHZzbnBZL2tKcG1Bb0IxOVJOMzljME8yb2xPMEJvOS9aTlhDNndxV3J1?=
 =?utf-8?B?VHUzdGRWSDJtRjdxYTBzcGxIM2dKUkR2T05LSExYcFF4NXR6c2RicGhhUnZD?=
 =?utf-8?B?TEhoSWo1dEh2Uk44ZmZGVjFWR3pqMGpOeEI4MlY3VkE5WVdmQUhZanNPVldz?=
 =?utf-8?B?eXhWNVVJa1ZSaGdvSXdDamg1SkRCU0o5Z1BGSmdCODZtSi84NCtpamdhMWwr?=
 =?utf-8?B?MVFtYkJuWUVTZEM1M2tsYldRYUtVRlJ3aXhjSnZEYzZLaXU1cVUzWUdzdC93?=
 =?utf-8?B?dEI5Y05KTUlCTzhLS1FSb1E0R3FZZkQraSs4ajc1UUFidTU0b0hxRUR0Y2E3?=
 =?utf-8?B?aEVrVEZBLy9rQUtja0xIZDcwbjVDOHNldmY5emRRRWFlSExRSEs0T04zMG1G?=
 =?utf-8?B?ZVFoQXgzSUl4UzhlaHdlNncwUFdYaGhzTFQ2SjEvQ2dWVUhwVHRHOUdncGJu?=
 =?utf-8?B?K2phTExKUG9IQkd6WTEzaXk2Ri9BaU1hUm1qS0xkUm8vUFhEc3BPNGlteUI0?=
 =?utf-8?B?T3FwRWIxemJVaCtmYXEvS2Z2d3FVMjAxSkRzNHUrQ3JEUDJ6UFg3T2Jvd2d5?=
 =?utf-8?B?Ukdub2p0Rm9DbldENWFpTDVnZWNtTmlIM0NHV09TZU5GcUFUVlgraVdCdkRT?=
 =?utf-8?B?UWZwQXpORWhqZklJeThyZi9vK0FQUHZXcWx6LzhuRjVIRC9mdXFVaEdEa1BZ?=
 =?utf-8?B?dG5RcHdnZy9vajI0MTltWkVTaTk2ZHVhcHlyTzI3enJJWjV5bnczSmtmY1hE?=
 =?utf-8?B?b1pnWi9DSkJ1c3hubVJHV2NoRys4blhSQXB4Q0dIMEk4OGhRRktTL1pUM21J?=
 =?utf-8?B?SkR3SUsxaW1WS3lVTGZkL0VDU0R0NzRCZ3IwMUlhVHloajI4bU53c2YyTENC?=
 =?utf-8?B?NzhSYjFqMVNwSTRFaDIzaGJoVkp5TnFacG5aRkdHNjhuNVBYNjRlSTIxSnN3?=
 =?utf-8?B?WGRsRkRlMjI2UWxYYUJ4ZHdpbXRJRWdCblhsaEVEeHk1VGxxamZuVWgrc0lX?=
 =?utf-8?B?TGVuL0h6c0V6dCt0S0hTV2ZsVVZ5RUgva3ZFcGpMVVJtRTE4MEFtZ2FzYTU3?=
 =?utf-8?B?L3Y2ck90dEV5QiswQ3FlMzBjM0Z4VG9yUGhqWU53dU40VHNmaWtSVHBzUkgr?=
 =?utf-8?B?MGZhREVKdmxTdmZaamtqUlF1d05XdVdSREVmYjJvT1d0bEpXSHJjN3ZOTFFr?=
 =?utf-8?B?VWswYjhaSlVxbU50SVBPMC9TVkprblpScElmQ2c1RUlFYTR6S0YwZWhGNHlN?=
 =?utf-8?B?ODc3S0hrSVd0Z0FUZlJMb0cyS0YxQjhERHZ6NGZhVVhmSGhDbzR3TE5GQ1cz?=
 =?utf-8?B?ZHYxVU9Qd2RQZCtJbTVhcU50UGI1MjFCZ3NxdkZxRmRHU0haK1lpN2lPOEJJ?=
 =?utf-8?B?cmxQdk95WGoxNFFQc3NuVnM2R3VweHVJci9qWEdEaWgzME1FUWxkY1E5QjRF?=
 =?utf-8?B?OFdXUXBPTkhCUjA0anFYbHdIdmw5MTUwY08zcjRVczhaL2VUcEJPa2pSVnF3?=
 =?utf-8?B?NU5zOEdBV0xtWFVFVXJnTlNGU2pzOVJNazUvTXh4S3FQdTQrZWhrdkFKbjJW?=
 =?utf-8?B?TWNQTU81M3pXMXUzcVhDR1NYZFVyN2ZhRUdjTkJVWTAzYkVWckthMUlFdzRK?=
 =?utf-8?B?ZGNSdVRQSGMwenJDaEt1UEE0OEQwMy83M1REM3FxL016dDlFdDJFandaM2ZG?=
 =?utf-8?B?OUdHNVpHendDRjRYVS9mMHJQb1RMOE9GY0FQQ0tWZDJObGZQRndvM0lQbG1J?=
 =?utf-8?B?SWdndzFXdjlNZUswdEJlWDdGbXlMMnpBQUNHWWlQSkFZU2tIMVBlZmYxbGta?=
 =?utf-8?B?Z2JUZ1lxMS9rQ2Y4OEtMWDF0T1RBWkdDWkhCOFdDL3gwRWEwelZPelR3MGJK?=
 =?utf-8?B?bkJnVXp2NWkyUEJPcHJVY3J2VzZEOTQ3dFBLV1h2Q0lBckZWdENvU01RR0c2?=
 =?utf-8?B?eURaWXpIMkVsRENYM2JValc4MHVJQmlrdXdXRmFOWE1zZGw4akhrL1BoNDYw?=
 =?utf-8?B?ZUlCRDhVdE0rYS9MdHJSek9xaHhObENGVVdQbkkreTh0ZW8xbExZS3Uvamtm?=
 =?utf-8?B?VHhQY3JTK2R0aFI1U3lTY0JWemZlTFhRU2QwRDZFcys5bEg5TzhldDFNSTRl?=
 =?utf-8?B?bThQTGFvRW1JZkszOVZuVytKclpyMDJTeko2NjlmTDZmQVB3TFNGU2lidWFo?=
 =?utf-8?B?V3kzQ05peXNJWm5iRGNsYUVyKzdTM0d2TmFqUDlST0MxMmJ3RDZVMlJScW9y?=
 =?utf-8?B?Q3JGNzB4Kzh0SXExclpSSWlrUWRZOWFMbjdDbld5cUVKZXAwM0xJWVZMUzlK?=
 =?utf-8?B?L2ZCV1VXekVqdmY2UGRlOFZ4WGhXV3BmWXU0UWlzTWJxQmpQSUpxaWY0Mm1G?=
 =?utf-8?Q?4+YMFFXOo1uib7Tw=3D?=
X-Exchange-RoutingPolicyChecked: FGshHCrXFU32GyY7nz/2CTJM5hWNlgLk767Q37+9HcOPSoFydQ28Yv4O+3VpxwbFbjXkMbSSpw2zphBCh2o9zlhQbXMFxhcjjJcUmIDlJX6q6ctFU3+gfmq4bx1yWZMIjBtTOoeXdttwaW8/iq1NxVj3nP9jvrmRWUrXo8QGiWCq93/GGQbgt1zQaT8lpHSOZ81VkgeEAXWCJu6Ymr63ifrGHt71HaW90XRH6o9ZjP0W78VvQZ384GzvKyY8ytq1yOlz47YhYrC7nzbtIWdr7Ud3U5wx++YunIPzyQ2PHQyjcRy42DlSH8ZhJmFd3+W2wt5aHS/t9+py+hPj7nOZ0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b78d4d5f-3290-430b-c8fe-08de9b0e785e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:45:58.5644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4oJsa/jlcJ+ijlrChQmmLzifxtWE2XL4HJJ4tjF3eH0YVwnNOS2GEHufq/ADs13+Hp5GQMGVp/GgoO/NAkb754Vb7AMobJP/LXILMpCZlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8791
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



On 4/6/2026 7:07 AM, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) handling which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Spell out Function Level Reset (Jani)
> v5: Prevent PM ref leak for wedged device (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>   drivers/gpu/drm/xe/xe_pci.c          |   1 +
>   drivers/gpu/drm/xe/xe_pci.h          |   2 +
>   drivers/gpu/drm/xe/xe_pci_err.c      | 160 +++++++++++++++++++++++++++
>   5 files changed, 167 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f9abaf687d46..06b5d53e1629 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_err.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 150c76b2acaf..b743b3986205 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -482,6 +482,9 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>   	/** @wedged: Struct to control Wedged States and mode */
>   	struct {
>   		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 26eb58e11056..f3515c91e534 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1332,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> +	.err_handler = &xe_pci_err_handlers,
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b..85e85e8508c3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -8,6 +8,8 @@
>   
>   struct pci_dev;
>   
> +extern const struct pci_error_handlers xe_pci_err_handlers;
> +
>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
>   struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> new file mode 100644
> index 000000000000..339e8688d37f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_bo_evict.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_i2c.h"
> +#include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
> +#include "xe_pci.h"
> +#include "xe_pcode.h"
> +#include "xe_printk.h"
> +#include "xe_pxp.h"
> +#include "xe_wa.h"
> +
> +/* TODO: Extend support as a follow-up */
> +#define XE_FLR_SKIP		(!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || \
> +				 xe->info.probe_display)

A comment here would be useful to explain why we're limited to those cases.
Also, I think it'd be better to define the macro as:

XE_FLR_SKIP(xe_, pdev_)

As that is more in line with the rest of the code.

> +
> +static int xe_flr_prepare(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int err;
> +	u8 id;
> +
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		return err;
> +
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +
> +	xe_irq_disable(xe);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_flr_prepare(gt);
> +
> +	// TODO: Drop all user bos

Nit: comment style

> +	xe_bo_pci_dev_remove_pinned(xe);
> +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> +
> +	return 0;
> +}
> +
> +static int xe_flr_done(struct xe_device *xe)

IMO this should be renamed to xe_reinit_post_flr or something like that.

> +{
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +	int err;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_wa_apply_tile_workarounds(tile);
> +
> +	err = xe_pcode_ready(xe, true);
> +	if (err)
> +		return err;
> +
> +	xe_device_assert_lmem_ready(xe);
> +
> +	err = xe_bo_restore_map(xe);
> +	if (err)
> +		return err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_flr_done(gt);
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_i2c_pm_resume(xe, true);
> +
> +	xe_irq_resume(xe);
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_resume(gt);
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_pxp_pm_resume(xe->pxp);
> +
> +	xe_late_bind_fw_load(&xe->late_bind);

A very large chunk of this code is identical to xe_pm_resume(). Can we 
move it to a common function (e.g., xe_device_resume or something)? You 
can use the flr_prepared flag (or just pass in a parameter) to know if 
it's a resume from FLR or from suspend to handle the differences.

Daniele

> +
> +	return 0;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (XE_FLR_SKIP) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		return;
> +	}
> +
> +	if (xe_device_wedged(xe)) {
> +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
> +		return;
> +	}
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	atomic_set(&xe->wedged.flag, 1);
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow but without migration.
> +	 */
> +	if (xe_flr_prepare(xe)) {
> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (XE_FLR_SKIP)
> +		return;
> +
> +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
> +		return;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to xe_pm_resume() flow, except we'll also need to recreate
> +	 * all VRAM contents.
> +	 */
> +	if (xe_flr_done(xe)) {
> +		xe_err(xe, "Re-initialization failed\n");
> +		return;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	atomic_set(&xe->wedged.flag, 0);
> +
> +	xe_info(xe, "Re-initialization success\n");
> +}
> +
> +/*
> + * PCIe Function Level Reset (FLR) support only.
> + * TODO: Add PCIe error handlers using similar flow.
> + */
> +const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};

