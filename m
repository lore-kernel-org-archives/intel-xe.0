Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06235CD3430
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 13:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B809310E233;
	Mon,  4 May 2026 13:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWgPFC7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263110E233
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777901389; x=1809437389;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=X9MkSpalxNkE0Q6lo7ZmN40IrlL8Ehf4yrk45CPUmos=;
 b=bWgPFC7eY+CZAtAi/kBjtyVaP5zJD/1KNJXx48DCBUe6IjIqHlZfLQpP
 TkZyhkc69/IyXbtvBc1YFWNoJha+kHzo5raW7dQxbpgw4jIePvY3rlx8M
 k3XL3FAb9mPKBFuzvtD0V693MBpI37Ir/WFybtIyOdDEgySUep3SssaoQ
 uqAdzgpiTpagvpBDbMUYgkTfBUL0LFQ6bPWTk2DxbzphbOcrrjdE2dVUF
 lZRHPgW496h4RalYrS2RLNPSFbsTXh4GZpAWYlW7Jiyd4jyIJ6CZl09Kv
 g4XjInRBRqg7A359ett3uYXflVxDQ6zi0cgqZJWd8Zv3shdhmW2P5pW2p w==;
X-CSE-ConnectionGUID: 40iCH1BJT4abqtoVfeK6bQ==
X-CSE-MsgGUID: lciQTlIIQUOdfwVOGu9evw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89341190"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="89341190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 06:29:33 -0700
X-CSE-ConnectionGUID: k4IXk5DtT8SLzK349AUnjg==
X-CSE-MsgGUID: le1o8/5rQ/qzT7Sr7utipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="234655987"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 06:29:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 06:29:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 06:29:32 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 06:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM79PYJtxh1+SMXvnEPNo1objXTsQyAys8HWUDabHKj5RohtaFRH08JO44EytlNNSWh8Qg9y2k17HrJQeCN3ZRj4aImULJWs0sXC3gMM2PvkwxIPi0FXVGZZIO1Bp3yyJjaHgWaS/WVK5OoCkNwbvqw4B2QkXAXwJhjOfBVZFwFmSkXEyQge5jw7X+1szrqNZADnbJC67h2CObhWEr2XOFdmWcsHyN1ZeYckl8SU5LlcUMoGMVdBZPaLyOeS9WX6Xa9ne5BCfrb8C/p9c9mOGNNx8wPLFZYMYp3G4XaJS0I3bMN1PGxFA8Vs48w1SqqJj9R/Tdsq2Ll8QGjxkm41SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KyXE1J1vY8ZitLAyT2xP3fKp3zHRARbhOtJnRD4D6A=;
 b=WrIThlJj6ibrHflNNy0yoW4rqXc4MFe2Nc8qGxzaEXAxZNdJw5P63by1MLJ9XJ+KUXe4cPOxuFamo3vcLUt16QHP9u8rASReu689uK7XjNX+bJgmpy+guPhHWN9TRImxeqr80iKx94QK/WDF+Q+cDFxXc7pUTpV/grrMYDwmRaNoSzRtt/6ygWG9IQxqSuEuB0wNtq+Gkrg2xP+WprTuXuG31Ky0y4KA2TEYyN+UViSQUGCRtoNGCad5V6mioGF2Ia4LvchStGTfux47BB5ZFvmnL69uR8NJZjXCx69McwbBU3bqkGioOgaA2qGGo6jSdFFvq5YnGhhex+C/FFqYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPFE90FA9325.namprd11.prod.outlook.com (2603:10b6:f:fc02::5c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:29:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:29:30 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <daniele.ceraolospurio@intel.com>, <shuicheng.lin@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH 1/9] drm/xe: Rename survivability_mode to
 enable_survivability_mode
In-Reply-To: <20260504044348.209625-2-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-2-stuart.summers@intel.com>
Date: Mon, 4 May 2026 10:29:26 -0300
Message-ID: <87bjeve215.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPFE90FA9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d36e71a-dd74-4a70-1623-08dea9e12bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: jy1WtvXfKXVsvQ17bwSfTP2oat0vC/xvL/O/glzhS0S8jOP8aBAerHxeAnfieoBIU9FUYisY232n8muiCxAyQf4J/rJjBLUK0+ObkFk6ima+8ko/OegO3OHewsnIw2ya5oe6cwGtHXaxaaNRJX6FoKJegesSjcfzBMDmUuE443b/qXPo6+C3VsPp8zBwgvsVwSAfMtQvs63dUOMS8W7VibIn8OP7RDWZgCxzKtl0HO0ELaPnIeWlzW3B5IapNVWFoHniPK+Qzzb5wv5VbLkA9qFPoeOdDtD2nPLEjECtwFelcbSXK+Rk00wjh7ey/3T4rap6KXLSpz5jrqCAnNNSLsboKzTjVUN3rpuR7E2/wv44xcuI65Na9iJE3E7r7uL+q8j5lSD6fJE+gTrz/NpTWtFEpFjrlz1j/34mCuolgm5MXXEtoax5SdWQ8ytMsTzRHOUsXlwxXBNLJGhu6/4QDA/BG+aLFTHjgs/zIMOENo/KO4UYspWeBq/FavNfD8HVRx0Iu1qL+76dnfCf6KhskCi5rMEh7SemFA13fZ+twvwYSCJ7FDPlbyL2TSPzwIZJGH3VdbBPJ4PihFM9LezdkxzOYlFROJqa9Ka7J2SbltV0Cx8W5ZMC4YKB2o4ypA+7HiB9FF3JROkKKogVgelLcJE2oq9fPVvbJOGStLSjDB98hmrFavv/s67mP0klgZdk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUZtNG5iWFk1TytUYXI2VUg1TUxjRTVrVlpiVGdjaXE4K3FtOGh5eVYxMkNp?=
 =?utf-8?B?QitNUGpueXBuMWdBcEtUam95c1dra0d0NHNCbEs1TlZOangrakZjenV6U1R6?=
 =?utf-8?B?NDZLZGxPSXBaaDBSdVBmNWl2cUxWYVViYmFsbXQzL1JzK3NUMFoxY1p6amxx?=
 =?utf-8?B?SnZxL3lRS3A2UnVDQWsrRkpUNFRWZnZUQUl1UTlSUFhnSTZscVZSdElONm5x?=
 =?utf-8?B?OE5EVTRyNm0rdlhOM1dDcU1YQ1RWVlNZS1pvQ09HNUJxUmZCcmNQK1grb2RH?=
 =?utf-8?B?c2x1S0tEeUcvRURNQkhKSGV4c2pNaDNENENKeEx2UFpPcmJYRlEyNGtHUzlw?=
 =?utf-8?B?UHRVVVM1STEwNTBldi9LZmNQaENwZDgrSkl2TU04TklBUlpBK1BGdFJ4SXNN?=
 =?utf-8?B?NkNwOGMzQlpOV2Q1bm9ycGdLMkVNZ3JKcVk2NjgybGN1elE4WWg2TlJiQWlB?=
 =?utf-8?B?NG1NRWtwOTFZRjZmSlZTUFpGUEc2OTBncDZwSlFDcVRxT1BUcXhpdUROYWdQ?=
 =?utf-8?B?RWxsbUJMOFNUSjZIcGtyNnJkSitDbTN5UWMvMGErREh2TUNqVzg1aXRIOGdQ?=
 =?utf-8?B?MWJaUUtIdjQvc3FFSUcyOVo2TEJCcHYzVEdvMXp0WFhLRFYxTWpCcWFBczky?=
 =?utf-8?B?Y1BHZFkvRk1TWXhvR3RrZzJIajdXNmFDY0Q5eUR3ZXhSb01vcnIvYm0yT3lj?=
 =?utf-8?B?TlJ0TUg5eVNQcjJIUHp5bGZFbEk2Sk91YjRsTjZWTDZzNG1UQWNZcTZ2N3Fh?=
 =?utf-8?B?YVV3N2FRdE40QmQ2WUpVNVZJc2o5a0dDVHJYTUh4ZllxYW5SeUU3S1ptUUhV?=
 =?utf-8?B?YVlWY295VzhnUVY2NllHSS9VZSszQjFuZWpsaGlnUytYUVo5OGZXaFQrNFUx?=
 =?utf-8?B?Snl5M3d4dGsvby9EeGVTSFhLUWlqVlVTSjBuWG9SR2JxTngvRXdWZ3FUbGZY?=
 =?utf-8?B?VjhpTXJKTDBTbzdUT1RlelE4SFB0M2xNSHJCT0c0dTlzRldNalVEUzZmZGU0?=
 =?utf-8?B?V2FyY05LTkM2V3dmZ1RjWUswTjJKcVFxMHNKRUVGSDF0WUlsSk91WGlpSmpM?=
 =?utf-8?B?d0ltYzVoSDZrUHBEVER4dEFDc2wvdWZ4anVyWWZOSnBMR3g5N3N4VkR2SXl6?=
 =?utf-8?B?Tnc2bTBJbUxWMU95RjhrRm96bzB1aTgrTFNKNXNOVmhRdHV5VmVWWVBYd2wv?=
 =?utf-8?B?bDlaK01BK0pMbmlJN3F3cUVwM1UrQkJlS3V4eVUyZTJwYTQ0enB6TW96ZjEw?=
 =?utf-8?B?ZjFhNnhhdTY3YzFCcGp6QTJrKzQ0WmY1UnQrVlVwZFBOTGs3MDZCS05qankr?=
 =?utf-8?B?UVFlNEthUVh6UjYyTGhJZ1lWbDRzbWszVUhWVVhqTG50Vk82eDBURVJ1MVZ6?=
 =?utf-8?B?dmpaRjVPdXZaK3dyVXl1N1FyQ3VCK20wVXkxMHpiOGZXWFRwSU9nM3k1Sk1l?=
 =?utf-8?B?My81OFlQNEU2MFlqUjJFOGRGZEt1UUk0ZzFhbGRIVzQ0K25BSlVFaCtsUlV3?=
 =?utf-8?B?U1VuYTRSS2JKNE9oUFc4ZmxTYlJZUE1NL1dwUHd2K2FhdnlHMTR0NmRGZEZw?=
 =?utf-8?B?TWNta2pLbC9XZVhDaittOThPaDZQTGd2VHBRYm95azZMZXduMXZoOGdJNzlD?=
 =?utf-8?B?NllMV1EzT1R4V3o3WkxUeXlRNHZWV1kvUXc0MUxMbmZsTG9JUUlmajVzNGlS?=
 =?utf-8?B?UWM5bERMSk5nUnZ1OFNMT1ZyRktZQjVvcGlCQjZhUmJpS0VsK3c5NUM5ZzN4?=
 =?utf-8?B?QzJXdzlIYWVUcHNweUNwNmgvN2FGMHlLM3FGM0RnNTZGQlhLc1lHNktaL0hj?=
 =?utf-8?B?K0dqZHgwTlRHU3liZlNxZDU0RlcyYVlPZW9ueWl4US9VTzd1Z2VTWit0WkFT?=
 =?utf-8?B?UDBCMHlyTk1iVEpIMTVYOTZSUCt6NHFyS0IzUXdHTm1JcmpuOThJKzhWZzMw?=
 =?utf-8?B?cTNraUlmMHpEK09vLzFHZHVnSExqZzE3R2RrU2ZDaEhIQWtUYVFSSVB6U3Vs?=
 =?utf-8?B?YUxyMVNaZzZ1enlJdWw0TXQ0bWZWUlhQUlhjdlVxY0c3T015aFJzR3poaDNw?=
 =?utf-8?B?dXN4cmN4VUxGc0JJRzdkb3NUZlFaTU8rdEltbm1ieHUzU3VUZkpwdVFTZkI3?=
 =?utf-8?B?T2tIQThGc0RYTXFjTEt6bzB6bXpFcXBkdnlVYnRxWld0QVpja0picldjenFx?=
 =?utf-8?B?clF1cnRHa0NnUjh1QmllSjMzejNpWDVrTE9LZUxjQURGbTRQY3lVSm9ySEha?=
 =?utf-8?B?Wkt0c2ROeElHK2pPckZCQ0ttcFZydVB6cHl6YUl0dmEySWlkaE1SS0srZTRl?=
 =?utf-8?B?OGZ2a0ExUWtRQm5ZWlJSdTFGNUp6bHZ1bmJLdGdrRUJwV1QyTjBldz09?=
X-Exchange-RoutingPolicyChecked: eIGFC9Tw6LD1LNvPslw8UkNUIKwWun2mftg9FypmPjl+VO68H2VpbZu56z1YuU3UgjWZJ94gOt5mlswWmt6XDIYzZ5zsSmz8tLGD7HX/jWSyBBx6KalyHCkAeY5EEu/iTllk9XvmgNJz/bpUet9KjSfGzFUxNHagvS0SAPwW7arvIn7F0/3bJ9rAoZ6+VgIV5N25rgLPi3kZ5C02Q8Y0OTp36WYt04qPcH31dbLrFKePpBDfFtkBP4h9rUOqu5XsjGentC8LsE0DTBSdsMmu8SDy2iWQisAF8B2u+d3UI4b8bmFS+KYSeP5iTxiSLIN1hhG5FyddQkb660CJ5IWyFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d36e71a-dd74-4a70-1623-08dea9e12bc6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:29:30.2460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMvADOJqinvIFZ3VtAbzzWBh0CMIXrsa2sZBNRqNU4Tujlg8Ki3kRVLQiFpfD9wtwgWqyoT8XrBMBzA9e0z2xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE90FA9325
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

Stuart Summers <stuart.summers@intel.com> writes:

> Rename the survivability_mode field in struct xe_config_device to
> enable_survivability_mode to be consistent with the enable_psmi naming
> convention used for similar boolean config flags.
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-opus-4.7
> ---
>  drivers/gpu/drm/xe/xe_configfs.c           | 39 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_configfs.h           |  4 +--
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  2 +-
>  3 files changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 32102600a148..69abc69ec0f3 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -58,7 +58,7 @@
>   *	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 ...
>   *	:
>   *	=E2=94=94=E2=94=80=E2=94=80 0000:03:00.0
> - *	    =E2=94=9C=E2=94=80=E2=94=80 survivability_mode
> + *	    =E2=94=9C=E2=94=80=E2=94=80 enable_survivability_mode
>   *	    =E2=94=9C=E2=94=80=E2=94=80 gt_types_allowed
>   *	    =E2=94=9C=E2=94=80=E2=94=80 engines_allowed
>   *	    =E2=94=94=E2=94=80=E2=94=80 enable_psmi
> @@ -79,7 +79,7 @@
>   * Enable survivability mode on supported cards. This setting only takes
>   * effect when probing the device. Example to enable it::
>   *
> - *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mo=
de

I think we have not documented our configfs structure in the kernel ABI
documentation.  Are we supposed to do that?  Is that not yet done
because we do not consider our configfs stable enough to be classified
as proper ABI?

In this example, we would be potentially changing what some would call
ABI, hence my questions above.

--
Gustavo Sousa

>   *
>   * This attribute can only be set before binding to the device.
>   *
> @@ -260,7 +260,7 @@ struct xe_config_group_device {
>  		u64 engines_allowed;
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> -		bool survivability_mode;
> +		bool enable_survivability_mode;
>  		bool enable_psmi;
>  		struct {
>  			unsigned int max_vfs;
> @@ -279,7 +279,7 @@ struct xe_config_group_device {
>  static const struct xe_config_device device_defaults =3D {
>  	.gt_types_allowed =3D U64_MAX,
>  	.engines_allowed =3D U64_MAX,
> -	.survivability_mode =3D false,
> +	.enable_survivability_mode =3D false,
>  	.enable_psmi =3D false,
>  	.sriov =3D {
>  		.max_vfs =3D XE_DEFAULT_MAX_VFS,
> @@ -357,20 +357,21 @@ static bool is_bound(struct xe_config_group_device =
*dev)
>  	return ret;
>  }
> =20
> -static ssize_t survivability_mode_show(struct config_item *item, char *p=
age)
> +static ssize_t enable_survivability_mode_show(struct config_item *item, =
char *page)
>  {
>  	struct xe_config_device *dev =3D to_xe_config_device(item);
> =20
> -	return sprintf(page, "%d\n", dev->survivability_mode);
> +	return sprintf(page, "%d\n", dev->enable_survivability_mode);
>  }
> =20
> -static ssize_t survivability_mode_store(struct config_item *item, const =
char *page, size_t len)
> +static ssize_t enable_survivability_mode_store(struct config_item *item,=
 const char *page,
> +					       size_t len)
>  {
>  	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> -	bool survivability_mode;
> +	bool enable_survivability_mode;
>  	int ret;
> =20
> -	ret =3D kstrtobool(page, &survivability_mode);
> +	ret =3D kstrtobool(page, &enable_survivability_mode);
>  	if (ret)
>  		return ret;
> =20
> @@ -378,7 +379,7 @@ static ssize_t survivability_mode_store(struct config=
_item *item, const char *pa
>  	if (is_bound(dev))
>  		return -EBUSY;
> =20
> -	dev->config.survivability_mode =3D survivability_mode;
> +	dev->config.enable_survivability_mode =3D enable_survivability_mode;
> =20
>  	return len;
>  }
> @@ -815,7 +816,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
> -CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, enable_survivability_mode);
> =20
>  static struct configfs_attribute *xe_config_device_attrs[] =3D {
>  	&attr_ctx_restore_mid_bb,
> @@ -823,7 +824,7 @@ static struct configfs_attribute *xe_config_device_at=
trs[] =3D {
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
> -	&attr_survivability_mode,
> +	&attr_enable_survivability_mode,
>  	NULL,
>  };
> =20
> @@ -847,7 +848,7 @@ static bool xe_config_device_is_visible(struct config=
_item *item,
>  {
>  	struct xe_config_group_device *dev =3D to_xe_config_group_device(item);
> =20
> -	if (attr =3D=3D &attr_survivability_mode) {
> +	if (attr =3D=3D &attr_enable_survivability_mode) {
>  		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
>  			return false;
>  	}
> @@ -1098,7 +1099,7 @@ static void dump_custom_dev_config(struct pci_dev *=
pdev,
>  	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
> -	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%d", enable_survivability_mode);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
> =20
>  #undef PRI_CUSTOM_ATTR
> @@ -1128,20 +1129,20 @@ void xe_configfs_check_device(struct pci_dev *pde=
v)
>  }
> =20
>  /**
> - * xe_configfs_get_survivability_mode - get configfs survivability mode =
attribute
> + * xe_configfs_get_enable_survivability_mode - get configfs survivabilit=
y mode attribute
>   * @pdev: pci device
>   *
> - * Return: survivability_mode attribute in configfs
> + * Return: enable_survivability_mode attribute in configfs
>   */
> -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> +bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev)
>  {
>  	struct xe_config_group_device *dev =3D find_xe_config_group_device(pdev=
);
>  	bool mode;
> =20
>  	if (!dev)
> -		return device_defaults.survivability_mode;
> +		return device_defaults.enable_survivability_mode;
> =20
> -	mode =3D dev->config.survivability_mode;
> +	mode =3D dev->config.enable_survivability_mode;
>  	config_group_put(&dev->group);
> =20
>  	return mode;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_con=
figfs.h
> index 07d62bf0c152..517de4946d35 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -18,7 +18,7 @@ struct pci_dev;
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
> -bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev);
>  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> @@ -37,7 +37,7 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> -static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pd=
ev) { return false; }
> +static inline bool xe_configfs_get_enable_survivability_mode(struct pci_=
dev *pdev) { return false; }
>  static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) =
{ return true; }
>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { =
return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) =
{ return U64_MAX; }
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index db64cac39c94..7c85bdb267af 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -377,7 +377,7 @@ bool xe_survivability_mode_is_requested(struct xe_dev=
ice *xe)
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAG=
E)
>  		return false;
> =20
> -	survivability_mode =3D xe_configfs_get_survivability_mode(pdev);
> +	survivability_mode =3D xe_configfs_get_enable_survivability_mode(pdev);
>  	/* Enable survivability mode if set via configfs */
>  	if (survivability_mode)
>  		return true;
> --=20
> 2.43.0
