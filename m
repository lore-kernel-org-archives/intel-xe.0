Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0299DF8FA9A
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 16:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B753110ED19;
	Tue, 21 Apr 2026 16:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noHo1oXw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E2910ED01
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 16:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776788008; x=1808324008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BnPAx7iQ0JlZ4eIK/PSQZt1WtUU0QhdmbDKrYaG6lWM=;
 b=noHo1oXwdY5kMOFacUaGFMnXLDJeHOi4UGwmLakdV/dxHjJntrbvzl6U
 gyAtY1Ixql9DyTSb7HmOl8gLFgIr4fRVYwlem42s48ftVNL2eqcLAE7+v
 j+MNwTrihU3EDYEYFZGl6/khMdyL4Bop+UwYuhIhIg8oLzDjZKXvR2Qvh
 JXrwBNInrn2ssJ1mvl/8iUTYAcdWxhQJtwG1Gt4M4ZTJmtb5YoPsQ2gVJ
 BOsGzq1gFZ7qIQdpig+xJ/pLoXKINsNJHFbJdYT/pE5hevOxxF9K9abg5
 73vnjmGjwx47bWdBhCiKH+ZcG0YGld8igEjoJcfbpk9iX/NHtAzOSTf70 w==;
X-CSE-ConnectionGUID: jyU53nP6TkWbrzOUFarpMA==
X-CSE-MsgGUID: JFf5IVLzQkuj4daPy2PZRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95286184"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95286184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 09:10:36 -0700
X-CSE-ConnectionGUID: +g53rXFDT7aLAnPcLvTnmw==
X-CSE-MsgGUID: bg59HpH3R+WDU83m07gA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229397549"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 09:10:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 09:10:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 09:10:36 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 09:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3i+Fp1hMbDxZbmHGOfawG1726p5wgx79G9rLk5wcJvC3FBUTOcdWUDNSUYfrWDuQf0gmiBLMjjxlRSi7Hvm5j0rEM6ghcaDwueGtsok9S9e4BOjY3V+B3rrC6WUehXedjmQXfUi8b9HllJAUqXGlX0oF2JGVR+s5MdKsappTCmspt04nP2c/l314d7am1hqaVzunQSR8kBZ41CWvN/YXOmSMqyWjNnM5hOpw/F1rrzkYVTiYFTjcJUKrdBX67JsGTUQSkgJcsAg5Fqdn31PkncP/9UosTN4FTDN4CxJZZRXQe7ZTPnSUfp27gb7nR11FlZ1L9674OI7rtAufMG2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcNktCh3w29Hslg8GEoO+T1XPaAwXbwPWXJ/AgOQnT8=;
 b=mwh7bWPxQ3KDH1EJImXqIlrHYY40Rd9WjK9NyKTcmut3ZOYNSdpKJqaQXmebNjYUmc+CcT/xEw1UIacgKWe3t2IvsO0Z9kprHerWjgOG+hFVXPSpEWfCx7yhrK2hAtrBmmAD7vUBI8WIwwS61LYzSRz8YH/vaspZcVHpxIjE0+Z2+vurRY2CiCJ2kKDLctoaEs+SgBzFq5TsH+fXR9Kr64Ku+dOBYckW7agKT1qgzmjIA8AN510IJkYUb7mfksH4DS/utO8XnTDpq3I4uCXI1LAZqG3PPj1xgUVMdhW7me84s5WvGWACcK3l/St1neiBvUH4BCnJ0WA6K018Lv0NPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.16; Tue, 21 Apr 2026 16:10:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 16:10:34 +0000
Message-ID: <9465afa9-e007-4908-9108-bf4dda8e4de1@intel.com>
Date: Tue, 21 Apr 2026 21:40:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/sysctrl: Add helper to query application status
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <anshuman.gupta@intel.com>, <michael.j.ruhl@intel.com>,
 <mohamed.mansoor.v@intel.com>
References: <20260421153832.3785987-2-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260421153832.3785987-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d8d4ee-e711-4923-82a6-08de9fc08471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 8OZ7yLl2kG45cDqJogW0z7vIl2Y5t9ul+2Fex946KBzVS/B88FsbxuQBUq+VRN25CYfb6oyjeKPpfu+wEahYUA5lb8w2vhWAsO9Z8GJxHPirfnUr8qi/1LUY05G99oN/cTcOKa2KqpM2O2ko2Ycg6ZBBHrqCF7E7cDHh20Aoh/dyunhoho8pWJbCcLPy2wJK9jYnkSjJhkNzlbcS+sobh5uIK8Qq+BFPrrANWgTGoACXRyaIAtWG20BINaus8sSyg0PKQ6DBKVKolUnGPJODgNfNlsSP5Hf0P2KP6PYKQHCucVfQcmcGFyaEMo8Ocg1VtzL/KMT29uajqPH70KLcZuRSQWyQsnsrSaKwC+DWsGXXWkr+ihnngsD1ZI6DDcenfq9bP1m0KJ6OrRoru0GgP5xTE3ZBFvRro76M27kaM6MX4syiTWFINHWXLdeTuwJ0eLKffnX045oIHw6VGcbK1Rq4/38jOClWljtuij3RGv8w5GRMw+gd8Z6z+S7Rk24Lla7ymIqQtNRAnZ02te0n2q7qNAG/2rQMPURsGx5LiaLzU5bSfVIh3Fw2IteQCe5MMT5Z4DVn78ErEY/pVCR9MSLKIi1ipqeFiZ/MdhXa3B1lpSomBlwEmS9dFkrythbHJ3ny3E0o4O2WIXqdG3aM/mSj+Mwh/WpbD6N9Hws3MLlJWGbY54odUI26NRH+siBKelSImKVSr4w5VBMsTPKP2mqQpc2/HPsGNHMXo8+TgjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjI3d3p2NlRMemdLQ2g1ZE1sMzdjMWhuRklMUUo1bHdxWTZVWVBBbGVOYlBv?=
 =?utf-8?B?VytOMi9tYXAvZUJKV1RRL2VoNDJjTXA1S1V3SkFsa2I5Rmk4YU9IeHI0TEhU?=
 =?utf-8?B?cUtxeG81dVU1azYyVnpySjd1cGtwTG9Sc2pveHp6c210dlBIZllkYWRZbkkv?=
 =?utf-8?B?U1U3WkFvQ2RoSlZEOHdDaWRUUm9KTHRGdU0zWlExV3AxT3dWT1N3dDRJcC8r?=
 =?utf-8?B?cmFXSTdNOFh0Nkd0VHBIQ09kK0wyKzZ5OWFRQTg5bzE5ZVl3RldOajNJa3My?=
 =?utf-8?B?eTRyeEpISEQ2ZTY0SExQblRtR2J3QVJXdWs3N1Q0dVF3bGd2UVVEdHo0RHJa?=
 =?utf-8?B?d1ZxQUJXQVljeWt3RU9WSmkzN0VJaWRreEtWRk53UXErZlBsZERtMHYzREkx?=
 =?utf-8?B?YVg2WTVodTFCOFhtYzlrTWhHVFlVeGZyUElwYVZWcWdMd0xna0RTMjVsSlky?=
 =?utf-8?B?d1RxNnNSYlBjd3lDbE9qdWdGcDFZbEh5SGx1Sk9ZeGJLeGxGSmFlT3RtMHJM?=
 =?utf-8?B?emg0VXdYdVVWUVU0U0VhajJwR3hXMmVlMEZSc2lTYVlDSmZ1d2wvNGJRc25X?=
 =?utf-8?B?aFZKaVdPZ1NnWEN1UUNOcTlsdExtL3F1L2JFZFlpc0NkcDA1OGVaNGszNThq?=
 =?utf-8?B?SWowbE5xMDVBV204d3Baclp1RFc2Y3RuV3pTTS9tNWY5M1pqRUdBZm5kYmVR?=
 =?utf-8?B?MzVXenBxQ21zYlVZV3JZNVhzdHdqU01PNjAxTHdPQ1ArK29YM1d4blhEb0NI?=
 =?utf-8?B?NnRKU2JwQ01CaFNMRjRhK1dXYk50RTVFZFJTUWNHWjRIY09yd3ZBNGMvRzUw?=
 =?utf-8?B?bnVLYVVKRVlreWVUMXo5eGxhbHhsZ0drZldIT3k1a3dudko4RkNnaTdKSEx5?=
 =?utf-8?B?S01PYmtBcDBEcmhlaTlZM3MwUzZyUDVyRmNpRFBnc29QblgwMEx6Syt0Lzlv?=
 =?utf-8?B?cmFjZDEwTGpFeCtKck9wc05OTXdjdEYvT1B6N3F6anRvZEhHQ005NEdDdklB?=
 =?utf-8?B?V3pUeDR2QzUreXZCY09pRGsyV2w3WmVlaUZWRGc3aTgvczE0c3RjeUlndk51?=
 =?utf-8?B?MG0yZmlEbmY3Yk1BVkJKMnV1ekZwM1pjMVVkTVI0SUlwUGQzWUFiME5rb2U0?=
 =?utf-8?B?aVJ1Z2Jmam5yd3J6RzZLRUNqa2djcE5INStnNDZ0RXBWNkZmWnBzeEJCUUVm?=
 =?utf-8?B?Q05jR2RodHBXOU5XNUwyc1U1bzg5WDZpSkd2RHRWRHlTeUNRZDZjWHNESDFr?=
 =?utf-8?B?MW1EN2NyWDB6NVRtanFJcDNkTXZpbUpKbTgxdHo1MExQb0JLZnZ0NUtrMGlQ?=
 =?utf-8?B?OFFuWkhYZGVUelpHd01JWnljejh3TTFtNzlXb3N1K0ZHTGZvUEVrQ09wZzJR?=
 =?utf-8?B?K0JmYXRvNlVka3BRQ044Q0JWUFZXOGlkb1NxdmdMNzlSRDhRaEVJcWw3WHdU?=
 =?utf-8?B?ZjJxd0hWcitROFlZU01WbHVRbzRVSFliVXFTWlg3NHRVUGhtSm94S2kwaDJC?=
 =?utf-8?B?b25TNXNubjBGcGV1YlVPa1R1akRjVmpqL1Z5bEJxNXA3STZGYk1md2VEZnBM?=
 =?utf-8?B?MktScC9Ud0hka3EzSHQ1aGs1N0dwUUhJMlYvMUdzbzFic2ZrVUQ4aytPWkJL?=
 =?utf-8?B?UzhuTEZVeVZiOElobHpTenZ1NE9CNGo1eWVqUWlaSTBlR0lzUDRDWG9OcEZE?=
 =?utf-8?B?VUVqbk9tSmljWnV1dEg4MTRLcGVtZlJNWkx3ZG9XMGo2VUNKdjIyK3ZJQWd1?=
 =?utf-8?B?dEk4dldqK0ZIZngrdWtLVDM3MGxNM3NGN08vQUU2c1ZWOXhKbHZCWFFYd21K?=
 =?utf-8?B?dGFSSkdSdGJYU1E1REI5L1pDVnZqbU9sZG5KOTQ1VWlrb2NucmFwK3MwSFB0?=
 =?utf-8?B?Z1FwMWZ5VlBTT1c2MXkzTEJ5K2xPN0k4WVFUZHAyTlpQbWtHeXY4OXk3M3RF?=
 =?utf-8?B?U0ZrL2V4SUczSUFRUFc1Q1E5UHlPd2orK2JMdmhQZ0Q5TGczLzBwTisya29h?=
 =?utf-8?B?Y3UzUGJTbVcyWW1EVGlNRUxqNGpuZlBwRkE1VlZraWlXSUVJYURmdzJCNTJG?=
 =?utf-8?B?MitoSVFsQ0N2SENOR1pXVzB4WGdSeGdYamVDR3dLOUMzdDBBa0hKVXNSMmRp?=
 =?utf-8?B?QWZVQ2RJVnA3SEZJZmlUVERkWDlQcmZ2QzNLWnYzVVluOGlIUGc4bllLMGts?=
 =?utf-8?B?WkFZT3BaeEQ4YmhjQlNJcTY1RmcxS1B3Q3FGS0tiVnZzQnAvWnBhVWFuMzNI?=
 =?utf-8?B?Ly9MZHNNWGtyVzkrUXNWMHkzR0Jpcjk0ZHhkVGNucDR5elphMnF0bTl5VjAy?=
 =?utf-8?B?a1VBWUEvdzhBR1dZc1BBckNkYzVSaWhiam1MeXkwNHJMVVZGTTNCUT09?=
X-Exchange-RoutingPolicyChecked: mYPzYm29yZEqrkM0H3+SsKQWSrdaujhWTDTLxbXLWhXF4kDUOafiGjlpL5/eMRc0QaBzaaLrauTYuBltk56Ww5lZTvmc4pkuPO2RK3iTvgpmMOgGVINnOw8spANZqHkgFg+tJlPowvoEXjQHTCAMRwa7Jalpu5/byaO35p37HPIIiTwBoPMdIHl1zIDKOFtpUhU+FbFg54WeU4qloFH1vnGcBP0mihaSia6phQtKtorzSkWD7cSnYGYBG4FnayUWujCmtxI12Vho59MWBjkRvkj9dXplHr83W75pMd/hSD5FLY1S0pTJt8orqXtWhlWYGy5SYTUdOxQGqt8C4DfUQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d8d4ee-e711-4923-82a6-08de9fc08471
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 16:10:34.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjwCWMGzK+sUC/OAZsCPM+9MzYz7nZ/iD+I6qoFwn3gdO/MIIx2EhZLpZIED4k4xV5fWA1EAWEiXlbgLu4BEYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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


On 4/21/2026 9:08 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Introduce xe_sysctrl_check_app_status() to query whether a sysctrl
> application is loaded and booted, returning error codes for not loaded
> or not booted states.
>
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v2: (Badal)
> - Return SysCtrl firmware application states instead of errno for application lifecycle conditions
> ---
>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 44 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.c         | 65 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h         |  1 +
>   3 files changed, 110 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> index 4cbde267ac44..8ed9ba791f3f 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> @@ -62,4 +62,48 @@ struct xe_sysctrl_app_msg_hdr {
>   #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>   #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>   
> +/** System Controller Core command group */
> +#define XE_SYSCTRL_GROUP_CORE		0xFF
> +
> +/*
> + * XE_SYSCTRL_CMD_GET_APP_STATUS - Query application status
> + *
> + * Check if a System Controller application is loaded and its status.
> + *
> + * Group: XE_SYSCTRL_GROUP_CORE (0xFF)
> + * Command: 0x04
> + */
> +#define XE_SYSCTRL_CMD_GET_APP_STATUS	0x04
> +
> +/**
> + * struct xe_sysctrl_get_app_status_req - Get application status request
> + * @app_name: Application name (16 bytes, null-terminated)
> + */
> +struct xe_sysctrl_get_app_status_req {
> +	char app_name[16];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_get_app_status_resp - Get application status response
> + * @handle: Identifier used to control the app
> + * @flags: Application status flags (see XE_SYSCTRL_APP_* definitions)
> + */
> +struct xe_sysctrl_get_app_status_resp {
> +	u16 handle;
> +	u16 flags;
> +} __packed;
> +
> +/**
> + * DOC: System Controller Application Status Flags
> + *
> + * Flags returned in xe_sysctrl_get_app_status_resp indicating the
> + * current state of a System Controller application.
> + */
> +
> +enum xe_sysctrl_fw_status {
> +	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED = 0, /* Firmware application not loaded */
> +	XE_SYSCTRL_FIRMWARE_APP_LOADED,		/* Firmware application loaded, but not booted */
> +	XE_SYSCTRL_FIRMWARE_APP_BOOTED,		/* Firmware application booted */
> +};
> +
Any reason for adding the enums and structs in abi.h and not 
mailbox_types.h?
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 2bcef304eb9a..8d51f8cdaaa4 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -14,8 +14,11 @@
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   #include "xe_sysctrl_types.h"
>   
> +#define XE_SYSCTRL_APP_BOOTED	BIT(2)
> +
>   /**
>    * DOC: System Controller (sysctrl)
>    *
> @@ -99,3 +102,65 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>   
>   	xe_sysctrl_mailbox_init(sc);
>   }
> +
> +/**
> + * xe_sysctrl_check_app_status - Check if System Controller app is loaded
> + * @xe: xe device instance
> + * @app_name: Name of the application to check (max 15 chars + null terminator)
> + *
> + * Query System Controller firmware to verify if the specified application
> + * is loaded and booted. This is typically required before sending commands
> + * to application-specific command groups.
> + *
> + * Common application names:
> + * - "ocode"- oCode
> + * - "diag" - Dianostics
typo. Use enum instead of strings
> + *
> + * Return: XE_SYSCTRL_FIRMWARE_APP_BOOTED if app is loaded and booted, error code otherwise:
> + *		-EOPNOTSUPP if System Controller is not available
> + *		-EINVAL if app_name is invalid
> + *		-EIO if communication with firmware failed
> + *		XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED if application is not loaded
> + *		XE_SYSCTRL_FIRMWARE_APP_LOADED if application is loaded but not booted yet
Please don't mix. Either use the enum as return or error codes
> + */
> +int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name)

Who is the caller for this. Please add the caller along with the function.

Thanks
Riana

> +{
> +	struct xe_sysctrl_get_app_status_req req = {};
> +	struct xe_sysctrl_get_app_status_resp resp = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t out_len = 0;
> +	u16 flags;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return -EOPNOTSUPP;
> +
> +	if (!app_name || strlen(app_name) == 0 || strlen(app_name) >= sizeof(req.app_name))
> +		return -EINVAL;
> +
> +	strscpy(req.app_name, app_name, sizeof(req.app_name));
> +
> +	cmd.header.data =
> +		cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
> +			    FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS) |
> +			    FIELD_PREP(APP_HDR_VERSION_MASK, 0));
> +
> +	cmd.data_in = &req;
> +	cmd.data_in_len = sizeof(req);
> +	cmd.data_out = &resp;
> +	cmd.data_out_len = sizeof(resp);
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> +	if (ret)
> +		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
> +
> +	if (out_len != sizeof(resp))
> +		return -EIO;
> +
> +	flags = le16_to_cpu(resp.flags);
> +
> +	if (!(flags & XE_SYSCTRL_APP_BOOTED))
> +		return XE_SYSCTRL_FIRMWARE_APP_LOADED;
> +
> +	return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f3b0f3716b2f..db2743d54cea 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
> +int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name);
>   
>   #endif
