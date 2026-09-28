Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EFAC9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2530E10E8C7;
	Mon, 28 Sep 2026 09:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6gcZMRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0B110E85B
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790586209; x=1822122209;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q3P9NJxLPxyB0SM+Hyfj5KPlmoCz3lG1G+Ithv5PwfY=;
 b=j6gcZMRbRA9tYJhY/stTgVVMcADHaUyhua6PcDBxbIVNmhF7aSkeghlm
 bRsQTG8sO6M2jfa0X3aZVPig67nNZl7YKKC4ZwQqGM45uIkbOzDu7lcQl
 yAhl191yRI94XmWiF4N3udw8fLpjlifvYVxE41/InolTmJ/hleHEd3W2j
 TbfwB3wDuvL/vGxuKlgIChVAkjRRnPCgEsL9KHrVJRBBRVakF9yQ1MbVb
 GeQPasJ6480fjm7vIcqkxDoPiwZ5qFhyKneh13wWd2So/4aKJN06XpC7K
 gqRqOvS5smEAgBeNWnL0rBy4SlKSCX0vykyaPxofxgLOJ2zprJ1pjtNmp g==;
X-CSE-ConnectionGUID: pRE5XSk7TimtCOM+NwnBAg==
X-CSE-MsgGUID: u8jsMxC8TYqq+TFnQPxYQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90332838"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90332838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:03:28 -0700
X-CSE-ConnectionGUID: c5pxWK3DQECqdp7BfOusGQ==
X-CSE-MsgGUID: uc6+KnpYTt6wQkSHFghusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274510494"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:02:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:02:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 02:02:47 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzT/JaLsJBvz4x9uPePpW8qZJDU9YXNf5OJdxRG3ej0stXaPPc9vZVQx83UVNq++Nhx4CRDALOMlrDY+Tliz61dAXDo5uoG5LGnQLfL6M7PKA+TJPdXQ73tiv7WzeIifWl9qpjiwzwNdfE2SyFTNHZfFYv+m4jlJVlvzsxvmx54oIOyBuhtD6AXlu2qLMwaJRBYgvuY6EcoVuVOIlP9GC1VNt0Xgcc7L9BU5PNZFt7IYmt8PSWybgpn2WPidQyAlrDbVubqZc6L6b7ou0TDovER8uEsWmKeBLym/1QTjLLBTOGkPEmAOaXfRmSutwjC1S91e1hn1td0RZdSxWnrMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee4MXE1OhfI7RsitJkrigoLLaQvrVzVChyTrlfKXgSc=;
 b=RPE0WKz9Hcerd3rz9scbCso1pMNHx14zBrrviulElao9zIVXESA/RsbLjMBR055pT1mwzuXN/jsQsoYB9WRNpaHja3x+/nLb41vzkCF1tku19vjGYPkO4MgPMO1VYxLB5+nEAmGNSUBRSQZu9DWEAPfHgcxlhg5eZzVxh9sSGBsUsJQQnLFYt5vT92IHCMk4gHAmuNr0Ea2s1jYL2hICuyT1Htm9PC9MZXJwPfsglnUWMcEpkDejU3ecU1AxXJCDglB2RCk/eGxEdgclwM+7lNgxCe5Wm9XyAEtP8PFMQLZgEejnAdB+c6ZEHbqG5CByhd8dRXbamoIXslZ+yOGLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN6PR11MB8145.namprd11.prod.outlook.com
 (2603:10b6:208:474::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:00:45 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:00:45 +0000
Message-ID: <a1741726-0042-4133-ad2e-fa6633f7e002@intel.com>
Date: Mon, 28 Sep 2026 14:30:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-14-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260928061830.417395-14-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0210.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN6PR11MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cf5f3a-c7f6-4dbd-4209-08df1d3efb0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: omM01cJCcqQP/CtxQJguzTvJ8Aa37rxljpyraCGTdEUvWMLuqro3UF8fAOqW7d1OtyHN5X0BGZm/XebFxDXuDWkQClENuZci+t5CpiWANa0YvQIF6VsOMKmXLZmUUaWo4hAozAYsvGkDtppyBbim0dL4QXJzItnuM3CG4+CjZd/FXLQgOOrTZhynUESb5qgPEqOEqQbzayhH9zSc7YewHb4Ldpy6YFQUr5of85GS+66WjOP6H1oX8v+zSjmfH70wfBAp9WNtUmSr/f7tz+NwZDVHDc+ij7qyqvV3WNvPAC2W80oCZitorzikbAhIXNkzlmegaOLn1kQgrKTJAwu9SwaXuU1qyuZZ3pxXvl9WcAbl7ojzs1pnGH+7BVom9ewPn/ECRRn5F6D1/oRpWgl4GY6aC5hykiV78F2I0JyZksDC5dEoLhAkirf3B4ZmUlEBPhZJeLP+cjvC9dkgl0K2r6J+sh1gO9iK2DjePyCWBpl6GniPR1NS0v4sEZ0fYJJdFEwT4D8RyphOQyGpBcUcIUYJOzygJc89x3I2adUtkJYauc1IwFf2+FXXNuBm6ngjMt9sBF8jeoEO+jzYYCrTdZVZFYSZ8HDhA4m8L7whFVmOUJHL2frkqksSLSSQMdgYm9aBgQ0BGUzhM64g8WMiazi4oVYdY6uSvEvo9iSfw0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0VPK3FZT3dmeWtEdWJGaHlXNjZrZUhmb3pDcGh1bGhYN0F5MTk4S1F6ZVpp?=
 =?utf-8?B?dmExemgvMlF6QzNodXk4dkxkaWR4enh5aUNUTjhpSGoyM1JPaXV5R1VHSmFB?=
 =?utf-8?B?MGxmdE1Qd29PSlNBMWxoaFNlNmFkOFFkWmZNTE1iNDhSdCtuQVY2UytWMkVa?=
 =?utf-8?B?aEc4cCs0N3ZiSC9RWlJNcVpsY01YWi9kemloTjZMYkg1ZWdhSFZQMm5Pam1G?=
 =?utf-8?B?ZjBaa05ITHlrVWZJRmpKVU9oTFJqNUNQUDhrZ3BEZXBzTVQ5MmhmYWk0Szla?=
 =?utf-8?B?N21zY2VzRSt0REpsUVhaQ0p5aTM0L3hHbkxCaHFYbXNTbkVRVFRhYW5jMWNW?=
 =?utf-8?B?anRkQkEzamFEbWhhQW5TVjJ1MWVmMXJ0UW42U2M1NG5PR3h2eVlFenRKckZS?=
 =?utf-8?B?OTVNQ1FpQjdhWEN1U0x1OXhYa1JUV3FHWXpkVFFmNFBOeEhWY1I4WEVQejFX?=
 =?utf-8?B?OGFoMUtjaDZ4SVpCVUt2dXVscGdCQ0c4TXdRejZmbWJZNUNYaC9ONWlIc2Vy?=
 =?utf-8?B?bENQbVZOWTFNbXJiUTRoOTZQeUdsOUlucmJRMGR3bFZGSUkvUHdDZjZYMHFQ?=
 =?utf-8?B?VVlBQWlZWTlWMWFGb04wekhGbHFIMGFraldNTnBPV0RVQ3hEdHNDWVMwUHYz?=
 =?utf-8?B?c0NkVnpHdE5taGJneXc4dlBpbWVnY1RaMDhxc2g3QzlMMndEOEZabE9GMXJW?=
 =?utf-8?B?TmJuNmI4MnNCMFlHQ1I5djdvZVFyc3ROTjF1eWRUcnF4UjIwZUVuOFh6cnVF?=
 =?utf-8?B?MkNFMHpwTE9UR2hBclptWnpWeGx1MjhHV0h6bDZ3RXozNFI2OVNQQ3FZSm9Z?=
 =?utf-8?B?bzJGTUovWmpIb09PSS9HakJWTHlXL2Rsam91ZDBZU3YxNFhqRllvYmxPYkFQ?=
 =?utf-8?B?YUtJZTNlcWNDbjZZalpGWTdXcFRjTWxhQkhBanJoT0Z2K1puS1lka0R3K2J3?=
 =?utf-8?B?OUFiK08vVkp5WXpGbEFrS1VISDBidjc2eklNaWpGWTRVaDlMcCtXZGRHQzdT?=
 =?utf-8?B?ajd6V3dTSXZDaTBYZDVwenhXSlAzd0JocnV5akJ1TitjRmMyZUlwamp3b2J0?=
 =?utf-8?B?eFlMV3BpM0NnUUU4UjZwb0hkT1psc2g1UTNvb1BmWFBYSW0yd2trSno0S2pP?=
 =?utf-8?B?TElNNExJdnBBSEEwS2hpTmNVbDhsRTdlaEQvSUY2T0JXQ0UwdWNjaG9WTXBQ?=
 =?utf-8?B?OXJoSzBvTFJlTVFLQ1pXNG03Z25namVva1A3bXZuK3FZSkduWWN4S1pMbEpm?=
 =?utf-8?B?amxsRldNUzUxRHN5WjhwdTg5NWJla1E3N2MxcXh3dlVIc2JydllWaVB1UHJG?=
 =?utf-8?B?WlJhZ1hCQ1Q2b2Fhc2ZWb3VGTi9IaHBzTVl1Ny9Ob3dpT0FrM2tyTlNxRlR0?=
 =?utf-8?B?cG01dUJONWhiOTdwREJkaklpU09rc2l4a1dyQW5iUGRlZHJUYXJ2K0FMSDVt?=
 =?utf-8?B?ZmtRajNkK0kwOE93ZG5Qankzd3pwVTFQNkx2VkorRzlod3c3dnZDOG53UnNk?=
 =?utf-8?B?cUx6K09FRnRKZTZTQ3lONHN6MkZSejZ4YzFlbG1lUEN5TE5GZDVXS1ZFWkw1?=
 =?utf-8?B?clpwSVRaQW5wVkErREloMGVRd2RhdXR6cW5aRzRDeTdHMytJVXgzVlQ5RGY0?=
 =?utf-8?B?bDEySDVSMUZQR3VYWTloQk41YzBlaDhZNWNqSUU3REpjRWNLMFhhWjdYTVlz?=
 =?utf-8?B?azh4ajkxd3NEeUlNZnVhdGFkMi9xSDBRRTBhWlRKdDRPL0lBRFFuOVVSNHpC?=
 =?utf-8?B?MjVUL2JySEdJdmRNNmZBdnRmV2R3bkVuMTAwQ0NxY2VXYk5xVXliaVFSYkF2?=
 =?utf-8?B?bm9sRUYxaDJDUUkyOHVoR2FoazllRkFkVU5tQys1NWNwZklwVG04VHNaR1Qz?=
 =?utf-8?B?Q2szTXpaTlNSRWwwWlJ0ZjVCVDdqc1ZsaWEzYVd6akRlTldOVGZjU0pUS2hp?=
 =?utf-8?B?dkloOEttc0gvampKZTA4MzlOeUI1YW5KL0ljalB6d0Z6eTNMNm1xTENEUG5B?=
 =?utf-8?B?TnliK3oxTC95OVVoaHgzeENBbU5yQWNCSTI1bDc5UXh3enFWeDhUWE5HV1ZJ?=
 =?utf-8?B?Z2NrSGVCTm1temRUaE1XaHNNcllHcE5ldEVGaituWjVzK3pnRUVyMEhVd3R4?=
 =?utf-8?B?Wlh3dlJKbEl3NEJhMWI3QnU2eXJOd0pueDZQemh0T29hV01nQnp0ZUdhL3NM?=
 =?utf-8?B?V2FTVit3ZWJ3WVNobGZZcVlZelo4VVZZS1BKQnNOZ2svNWFjUTZzMi9SYnpm?=
 =?utf-8?B?L1ovL0RXMUxXWXgrQWJQV2h2T1VVcSt1cjl1SXlKVTNpcFF6SXRGcTBPSnBX?=
 =?utf-8?B?aEh0SUh4L2hCQkI1cDBVQmpSZlQvTlY4bk5ydTBzaDRoMThFMlV0MUpLR3pM?=
 =?utf-8?Q?4g4sdG/GW1JiqFtk=3D?=
X-Exchange-RoutingPolicyChecked: AICRrOWKZEKB1OJKkFF/QHU45oU77dxV7dfHqdYmUmVV+qB6WGv+PQIhyvameT4ovg7HaJ0u126ymI+libU6UlSQDoaNyUnfbsisaztkspg3YwMvjCECpHicEKCWCAReQIFZr+NoPKTXrsacPYgQz9Dql+wb8eQ+LhxAFsd+Eu7GS2Gmt6uEuJ67h6U3PE48q4USyQ/PzJVYP+CV4OaODJS7rKhVHnJ4YArEIZ8qxskRTTqLumUUtTXzGsj3stALmV8FF3kE0bp3Lowi1lLa6ZOVg8c+isvE9K4dzXqF7dAx0i2fOeCCfweIYaTaA37gOlnpGjFNsNbsP5NC/El7rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cf5f3a-c7f6-4dbd-4209-08df1d3efb0a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:00:45.0875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPe3dHxi4bKWWlRkA/ec63zOezxGEKygTeKz+zDreolRb0x01LendvGLvsuWBR+P+O2m0G1mYFEgd4+8WWSiexwCB62IwXGW3gG5px+bREM=
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



On 28-09-2026 11:48, Riana Tauro wrote:
> A memory scrubber can report multiple errors at the same address. Track
> pages already successfully offlined by the firmware so that subsequent
> reports for the same address are removed from the firmware queue instead
> of issuing redundant page offline requests.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: use xe page shift (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_device.c    |  4 ++-
>   drivers/gpu/drm/xe/xe_ras.c       | 44 ++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_ras.h       |  2 +-
>   drivers/gpu/drm/xe/xe_ras_types.h |  3 +++
>   4 files changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 205cb4e7f9e8..1ec7c74cbd58 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -957,7 +957,9 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> -	xe_ras_init(xe);
> +	err = xe_ras_init(xe);
> +	if (err)
> +		return err;
>   
>   	/*
>   	 * Now that GT is initialized (TTM in particular),
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index cfc7f07e9ced..7dee1c804eeb 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -20,6 +20,9 @@
>   #include "xe_sysctrl_mailbox_types.h"
>   #include "xe_ttm_vram_mgr.h"
>   
> +/* Any non-null entry marks the page as offlined by firmware */
> +#define XE_RAS_PAGE_OFFLINED		xa_mk_value(1)
> +
>   #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
>   /*
>    * Uncorrectable error type for core compute errors.
> @@ -210,6 +213,7 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>   	struct xe_sysctrl_mailbox_command command = {0};
>   	struct xe_ras_page_offline_request request = {0};
>   	struct xe_ras_page_offline_response response = {0};
> +	struct xe_ras_state *state = &xe->ras.state;
>   	size_t rlen;
>   	int ret;
>   
> @@ -249,11 +253,16 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>   		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>   			   response.status);
>   
> +	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
> +		xa_store(&state->offlined_pages, page_address >> XE_PTE_SHIFT,
> +			 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
> +
>   	return ret;
>   }
>   
>   static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
>   {
> +	struct xe_ras_state *state = &xe->ras.state;
>   	enum xe_ras_page_action action;
>   	u64 addr;
>   	int ret = 0;
> @@ -297,7 +306,11 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send
>   			   page_address);
>   		return ret;
>   	case -EEXIST:
> -		action = XE_RAS_PAGE_ACTION_OFFLINE;
> +		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
> +			action = XE_RAS_PAGE_ACTION_REMOVE;
> +		else
> +			action = XE_RAS_PAGE_ACTION_OFFLINE;
> +
>   		xe_log_err(xe, DEVICE_MEMORY, ret,
>   			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
>   			   page_address);
> @@ -341,6 +354,8 @@ static void get_offline_pages(struct xe_device *xe, u32 cmd, void *req, size_t r
>   {
>   	struct xe_sysctrl_mailbox_command command = {0};
>   	struct xe_ras_offline_list_request *list_req;
> +	struct xe_ras_state *state = &xe->ras.state;
> +	unsigned long index;
>   	u32 total_pages = 0, count = 0;
>   	ssize_t rlen;
>   	int ret, i;
> @@ -370,8 +385,15 @@ static void get_offline_pages(struct xe_device *xe, u32 cmd, void *req, size_t r
>   			return;
>   		}
>   
> -		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++) {
>   			handle_page_offline(xe, common->page_addresses[i], offline);
> +			/* The pages are already offlined by firmware */
> +			if (!offline) {
> +				index = common->page_addresses[i] >> XE_PTE_SHIFT;
> +				xa_store(&state->offlined_pages, index,
> +					 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
> +			}
> +		}
>   
>   		count += common->pages_returned;
>   		if (!common->pages_returned)
> @@ -1098,6 +1120,13 @@ static const struct attribute_group gpu_health_group = {
>   	.attrs = gpu_health_attrs,
>   };
>   
> +static void ras_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	xa_destroy(&xe->ras.state.offlined_pages);
> +}
> +
>   /**
>    * xe_ras_get_disable_page_offline - Get the page offline user policy
>    * @xe: xe device instance
> @@ -1125,15 +1154,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>    * @xe: xe device instance
>    *
>    * Initialize Xe RAS
> + *
> + * Return: 0 on success, negative error code otherwise
>    */
> -void xe_ras_init(struct xe_device *xe)
> +int xe_ras_init(struct xe_device *xe)
>   {
> +	struct xe_ras_state *state = &xe->ras.state;
>   	int ret;
>   
>   	xe_drm_ras_init(xe);
>   
>   	if (!xe->info.has_sysctrl)
> -		return;
> +		return 0;
>   
>   	/*
>   	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
> @@ -1145,10 +1177,14 @@ void xe_ras_init(struct xe_device *xe)
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
>   
> +	xa_init(&state->offlined_pages);
> +
>   	get_queued_pages(xe);
>   	get_offlined_list(xe);
>   
>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>   	if (ret)
>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> +
> +	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 561c656e2ad3..e41a52869085 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -19,7 +19,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
>   int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
>   int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *threshold);
>   int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
> -void xe_ras_init(struct xe_device *xe);
> +int xe_ras_init(struct xe_device *xe);
>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>   bool xe_ras_get_disable_page_offline(struct xe_device *xe);
>   u32 xe_ras_get_max_pages(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index e09b50a6f77b..50d70e2e2fd3 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -7,6 +7,7 @@
>   #define _XE_RAS_TYPES_H_
>   
>   #include <linux/types.h>
> +#include <linux/xarray.h>
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   #define XE_RAS_NUM_ERROR_ARR			3
> @@ -417,5 +418,7 @@ struct xe_ras_state {
>   	bool disable_page_offline;
>   	/** @max_pages: Total number of pages that can be stored by firmware */
>   	u32 max_pages;
> +	/** @offlined_pages: XArray of pages offlined by firmware */
> +	struct xarray offlined_pages;

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   };
>   #endif

