Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA3DC5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1DF10F339;
	Thu, 13 Aug 2026 13:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1PcYuqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9127110F339
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786628576; x=1818164576;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cDRyJ76wN5lU67FyrtMoG0Fgla6yZ1nVJJlrx3Wrlo0=;
 b=B1PcYuqjQMaA1ObmjHf5M8fu9IzJ8xGRSxqb/z7AXCxv4X2uZBegYELF
 1lYMkpiWvKIauPZhTmUqe4wDYNaWEsztIU8flCzgYfLhz7CiTAvpyqg/O
 8qA6I1Jx8hcCZkllNJ5jWoD++S0V+0W21a9DujBRdqecF32L403gmxjRl
 of0O/mgnOp+A9sTkNcdC3Fh/+TfG812bHEilj9eCIJUk7Tv3w1CoJkECd
 8j4OxxkmLPDJ0aqr2CpCXVQYYTsgCM1RShzhp9+1b4P+2++T9mFkCBy2Y
 TgBSJ8XmNXefusdcl2UqjER2h5Ioyah5sy+M+GEm5oHPtLtyBCWZVcbLN Q==;
X-CSE-ConnectionGUID: Jr+1C4dEQvCDvUY44T3hSw==
X-CSE-MsgGUID: FrFZtNqhRauTGz2kbzPV5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87275694"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87275694"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:42:55 -0700
X-CSE-ConnectionGUID: AIgzWrnsQeGbvyTByc4aTQ==
X-CSE-MsgGUID: p786GAb4T9ya3KzadyGP4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="257722241"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:42:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:42:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 06:42:54 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnNmbyF+9gIzcmhCn8tD3ppwy1x056r/Kg0R8xo7YGMcnLdiLjphVwdhWBSASEZYpHOaYakmcTZ5k2fmrvZxdg6usTTGi+m7qsRt6MvrJCHh4t3oIvRFvGrad0ay626c/llA0ymYKjpAAxWlPdHS3cJ6r1CDAPB3uryF1bcB5LbA5jZa6AggTWwLUV2s4n6RttwpRpdQ++vKaqySdIQ2oEdGRc22a+QUR8ek7y9xZMbcVwu99JdkLrqFFESqAH++7WR5YLWIJ7T3ZpU7FzXTifwWfndRNzL0pYUWCHol6Lct+K2kGK52DCzR30FndyLYQjTh2QE978aHL1i4tUGGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQF1w0fQF8cFAVChvQJA0s11n5yalqfkeZROakKWUnQ=;
 b=dJw6G6NpeWOVJBh94UKtyMX70qk3pELW0VEwHgWx/GyjKEZ7RVf2+CB+2s5Z3T/DFqleFN4n/RvPM4eo0957otXgqd3Ha5AyYsNF9lgzdHNqRmNOh3oqLUpXlhiaelb2WN0YU8AIaQLmCMPzpTNx/t57spSA3e87M3m5uMt1IHTi+16qnRbfA+ws18BOkRK2D10H1sswt2nwf0UvlKIpXOU1X4e2RuSbTnhW41q5KyTEGsHdO5eGfE3ttAxGpix8kkvZQj64sJX8Gmg0Fy7JHRutu9jyOwL5uu0GarC5+gcqzJDf57r0gkCRCfvcsUFCpiaK6rXdpo77VO96zcFEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS4PPF6CF7B12C6.namprd11.prod.outlook.com (2603:10b6:f:fc02::2c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 13 Aug
 2026 13:42:51 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 13:42:51 +0000
Message-ID: <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com>
Date: Thu, 13 Aug 2026 19:12:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260812191450.11690-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::12) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS4PPF6CF7B12C6:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b0fe17-eca9-4b6c-10ad-08def940c4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|5023799004|3023799007|6133799003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: d+dAV0ZYNCrEUkKjZUYOiFjX//PLMqJJtiO4e1xU1Xj19/UzfEgthEKsQpHtHPcPWknakPnR2eE7nQoP5V4XIyhp8pF+ft389Bk5ngtkT9JckUWNkCD0U8C9AdQB/Bd9W9k3yytxmTEQFgSDOHxxe8Zb/7BQcDigB/DX6nleVaXSHyGE4AySvQ0b0ZRyXvtiR9BcnOE2x7yf5qbmGhlToWHCWmyHAug3M+F4aoP1bbh+VVbsFEi1zIXFjwypuuLNPLh9kKzbJ0xcpyOcpYT5dVYOt+gBGkharEK4e/LQUSA7ap1m/3VKTvtTaDZ7LrNsRYlTaaEWnwXSVxV0C5XnYNbmVjNqexUNF7X5hGOm6E2CDfLYckc3/XGPTHxdR5cXAm4W/XVQuXuqjloIBBGEt5hig4bcnoGr+MsiTBYINVkm3jiisATLT7Eb7QZSZpPeXqN2zDSkFuZV02r+7INYdbaW+0stYFSb76cKReYdSyDN39MArelrsYyDcExx6ws7CzLYLnYNOV/MMVp8V2ZLQw1tD4GWCT6EmsnwXESkL3jnQcj9Z8xJ/o39JURuTbNlQaw9S2mmQlmLJP8S8tZXqVNP/0rwvdb3MjhTdtlZPnZNYIov26ErF/HZGxF1bTKE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(5023799004)(3023799007)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUU2UVpEZC9rOU15YXFwSURXODFzSjZqTm81cFJsaEJjZEhKZEFWQk9VbDZQ?=
 =?utf-8?B?T3Z0bjRUNksrZGUxS0MzZVRWNlNMNktzM00rVEx1Nmx3am55YUZPaUVSY1JS?=
 =?utf-8?B?TWNhRmxocXE2OFRwTEFWOXJXb0pJWXBaZmtMSkdiWTFzQWF3dEp5M042NnVX?=
 =?utf-8?B?cUZyellQa3pkUzhkNFNGVW9oQWdsODQ1R0RkQ2hxdGpnUENPcUdsQ3NoWXhx?=
 =?utf-8?B?N2VHTGFZY0xZVDJKK0t3M0UzSDBDSHZOQzVIbmtDbEp4Mm5WYnExeHRZcFFI?=
 =?utf-8?B?bGZMWGFob2pHTzRhUXlhSmJ1M1BJdkFxdllhZHBUTGtkQklUcFhsR1BqTVFU?=
 =?utf-8?B?emdBNEIxMVB5VG9IK2lUZk01QXovUGRVd2ZEMDQvZjl5cWZlbnd4OWlzWTls?=
 =?utf-8?B?dGJ0bTFZamhhOUdSQjFWRXpSNVB2eUpKS3h6ZlFWd2QxVTVEd3RJOW5tVnNS?=
 =?utf-8?B?aStEeERNWGx1QU9mQkVQRkhZLzdvY2NuSUh5YWZoeWJ0NzJweDJwKzdQS2J6?=
 =?utf-8?B?Q0lMZlNwRnVWYlhwa0FkQ2NWS28rckpIUGFJYzMxTWFrenRWcmZwdVpGK3c4?=
 =?utf-8?B?Vnl1L1NURExKOUtWV1NIOGtITnN3RmVGaTQ3TGVXaXY2T2JUdjhzaStsaERL?=
 =?utf-8?B?YmNmOGQwKzlHMmQvMG1kUjF1S1VUZHRKR1o3c01qNVJTQm5UU0hpSFlaTDNQ?=
 =?utf-8?B?THhhazRza2UwMWh6bmdrY3B1dXFMUWJTbURvYnU3b0xvdU51MERwbDJHZzN5?=
 =?utf-8?B?T0o0dFBFUmFOWXRqRXJGTHd2NXNkakV5d05aTDR4M3FUUlBQTFRucVlpYVQz?=
 =?utf-8?B?WitEcVBhSkZrenFwMnhIeGsvWlVRci9lYU8xT1F4TS9DNUxOM1BSbGdFbFBI?=
 =?utf-8?B?Q0ZXM1d3a1FTL0lWRXJWTWZSdjY3cHc3VEtsek9EYlA2cFFqdTdmRmNKQlFF?=
 =?utf-8?B?eVd2YWFXay91RVM4QVp2MlRNWXRqUGNad2FyRkNGOE1MZjhWNlRBRHdYNXNS?=
 =?utf-8?B?ZVZDMEI2dU9xUFNJUXoyREI1dnhoMTFENnBSS2RFZWp6U3pNWG9HSjdYVjFU?=
 =?utf-8?B?UXEvbUt5cUl2RHNBYThXVVRRbFV1YU9WRzFFQjlHRkdEOUJxaDVxTXJOZ2Jy?=
 =?utf-8?B?cmpyNCtRVGFKd0hPdEZ3Y0p5ckhDa00vUGpoeVk3eUJ5UFNPa1JZTjN6SjFT?=
 =?utf-8?B?NUdLa3VVdUs5L2ZIdjd0Qy9YTEZ1Q2J0SzhCMUprRUljSkliUU5Tc0FGSFBU?=
 =?utf-8?B?WHFXWFJqK2lRUnhWMEEyVHpaM1dVUWRKc3RKcTcrclp1RENROGs3ZTZxNm1X?=
 =?utf-8?B?OFNWeXVvYmFQOW9LNlZ6bndlNFB1alVqbHVqQUlWNzNqUkhOb0REdFVzZGFI?=
 =?utf-8?B?TDUvNDVyanB3ckd6NmtwVXpGeklueloyR3dTUkpjNmU3RlUvelN5ZWw0aGdL?=
 =?utf-8?B?Q1FQS1hud0JlZElVSnpXNENHYzAvZGRBY29BY1V2TFFNSU1KelRnd01vcG51?=
 =?utf-8?B?R1E5Rit4OUVxVXpIV3BhWS94MzRkWGxqMWsxcHM2cGJTL0grSWw4Tm5SRXRS?=
 =?utf-8?B?akgxMzN1cGZxWFJvVVNHWkVBV21ORkRHU00vUmsxYUpuVFZESDR6VmhEajFp?=
 =?utf-8?B?eWM5Vnc3dzY4a25BTUtiaFNiL0JsVjZoR0RpN1l6VXgrNmZVK2MvYm8vSysz?=
 =?utf-8?B?TGdOQVBnSFpkTlN3UUJQcUsrMjROaDE4TjhodVBrV0RrTlAxc1dXQlpPNGpk?=
 =?utf-8?B?d3Uybm9KVDRIMWk0dWVhaTAzRWtOa0tDRjMxdFdwbDJUM0pnUEd1QXpFckhJ?=
 =?utf-8?B?MXp1YmdIUTUrTGRuQjIwZkZWYjczbmF5WVlPeWpMQkgxMCtJK2k1ZlpOZ3ZG?=
 =?utf-8?B?eGtla25EVk0wdE5uMjZHMWE3UXZpVzYyRE9GU1RtN05WVll2KzJzR1duL2Ry?=
 =?utf-8?B?aXZ6V1BiUEFzYWM4RkgyRXl1MzdabTkyeDlUUmd0QkJzdStsV0FSZnlJZzZz?=
 =?utf-8?B?WVBjNkZ3Vy81akVXTlVlc1Z5NmxOTmtpL2lLSndFUklOWldMNUJKWjh2UU1J?=
 =?utf-8?B?cm1SY3l2UXg1SFk4UzRxZ1lsNk82SE5nYUMxdS9sdldIblRqOFFkUG15RXBP?=
 =?utf-8?B?bU8zTXB6Q3lLYmhGNE1IeUd5MjFkK2xWWWxzUXBETnJ2LzJYR0lzVXBwK2Fq?=
 =?utf-8?B?emFWQk1VdWhoQWw1MGx6TjdZcFlZTk1RZ3lqMC9WeUtzb0xmQ1NnR0FHWWJS?=
 =?utf-8?B?WWJWNUp5SUYvTzRhVHdlaFFPcXMrWVdtS3MySmVxL3d0bVNvYmw5S0NNbFBP?=
 =?utf-8?B?anYxRnVpWjVRaUU4K05MZ0N4OG5XeXNwaFJzS1ROdjg1Q1crbGhMUm5IWHF1?=
 =?utf-8?Q?tWTf1r8V9/LmGbH0=3D?=
X-Exchange-RoutingPolicyChecked: Ax7W4uVICin1+JJZf7PkD1pPliw06ZJaEv/eiPV33GQn3+4tjwj+yNLRTyR6KgoMJYlQG5BlcDsVPvIORSFCwQrsn3AP1f5TdWpZDisbgRVjCULMWq0TSoeasUFh7Z0q1oFnmscH/9oSzcdSZS0LsCjq2X2RMEGDEGkWyjprCPv5a0wp6qV6KPqm1RoBKYxMpYIorUQy5uocpKF8eisZx13JoJpZCpmkXEeAckP4OQs0yo8c/n6/X3lLe6IcqWoeJXq1ptRTJOer/SW8o2K7/EaYT6CzmCHwJgLDNEWZCeE8qyN05XHOwXiBPo1YY5xVsHHaOrBCl/RDkz6zlCM+tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b0fe17-eca9-4b6c-10ad-08def940c4fc
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:42:51.2333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5g88RtJkPpgVVgkJtOs6rrjOxSd5g0+0ZKUIy1l9QfQazz1Ie7O/qs+bKrDfnAnkjvl8dTeRqNjOtXKydODGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6CF7B12C6
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

Hi Michal,

Couple of comments, on rate-limiting and XE_SIGID_WEDGED, from v3 
https://patchwork.freedesktop.org/patch/743308/?series=171022&rev=3#comment_1373861 

are not answered/addressed.

On 13-08-2026 00:44, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault site and serves as the primary handle for
> triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>      prepare to decorate dmesg with comp/loc (Michal)
> v3: update SIGID DOC section (Riana/Aravind)
>      warn about unknown severity (Mallesh)
> ---
>   Documentation/gpu/xe/index.rst        |   1 +
>   Documentation/gpu/xe/xe_sigid.rst     |  14 +++
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.h           |  20 ++++
>   6 files changed, 333 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>      xe-drm-usage-stats.rst
>      xe_configfs
>      xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 44ed055439d4..92134709d998 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_late_bind_fw.o \
> +	xe_log.o \
>   	xe_lrc.o \
>   	xe_mem_pool.o \
>   	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..93967183ae51
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. It is a small, stable integer
> + * that names one of *recognised fault site* -- nothing more. It is the
> + * primary handle used for triage and maps directly to specific report site.
> + *
> + * Numbering
> + * ---------
> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the fault sites were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused. A retired fault site
> + * SIGID value is deprecated in place, never re-purposed.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + *
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is not
> + * -------------------
> + *
> + * SIGID deliberately does not encode the detailed reason or the outcome. Those
> + * are carried alongside it::
> + *
> + *   SIGID    -> which recognised fault site is being reported
> + *   severity -> how serious this instance is
> + *   errno    -> the failing operation's error, if available, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same SIGID can be reported at
> + * different severities depending on the instance and the recovery taken.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault sites only --
> + * important, operator-relevant faults and events. The driver's only job is to
> + * emit the right SIGID next to the usual human-readable text.
> +
> + * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, nor
> + * for one-off diagnostics; using them for ordinary logging would dilute the
> + * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- only
> + * those that correspond to a published fault sites.
> + *
> + * SIGID log output (dmesg vs. the machine record)
> + * -----------------------------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``).
> + *
> + * The full dmesg line is not an ABI: the surrounding text may change freely,
> + * and lines may be dropped. The durable record for tooling is the CPER record
> + * carrying the same SIGID (generation is a planned follow-up).
> + *
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised SIGID *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has
> + * one answer. A single underlying failure therefore legitimately produces a
> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> + * follow a fault from origin to final effect; it is not a duplicate.
> + *
> + * If a site does not match any defined SIGID, keep using the ordinary
> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> + * or over-broad classification is harder to retire than a missing one. When a
> + * new report site is genuinely worth triaging, add it to the list below.
> + *
> + * Usage of the existing SIGID reports must reevaluated according to this section
> + * after making significant changes to the site that emits this SIGID.
> + *
> + * Scope: software vs hardware emitted signatures
> + * ----------------------------------------------
> + *
> + * Some SIGID represents fault sites that the *driver itself* detects and
> + * reports from the software POV: probe abort, wedged, survivability, driver-
> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> + * These are the only values the driver assigns on its own.
> + *
> + * Signatures that *originate* in firmware or hardware are a different thing:
> + * they are produced and identified by the firmware or the hardware itself
> + * (e.g. via their own records or error counters), and the driver merely logs
> + * them as they are given to us. They are deliberately enumerated separately.
> + *
> + * The two driver-detected firmware report sites below (%XE_SIGID_RUNTIME_FW,
> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> + * observed a firmware problem, not a signature reported by the firmware.
> + */
> +
> +/*
> + * Top level Intel Error Signature Identifiers.
> + */
> +#define INTEL_SIGID_INVALID			0
> +#define INTEL_SIGID_BATCH			100
> +#define INTEL_SIGID_RANGE_START(n)		((n) * INTEL_SIGID_BATCH)
> +#define INTEL_SIGID_RANGE_END(n)		(INTEL_SIGID_RANGE_START((n) + 1) - 1)
> +
> +/* SIGIDs 1xx are reserved for Xe GPU software and 2xx for Xe GPU hardware */
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	INTEL_SIGID_RANGE_START(1)
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		INTEL_SIGID_RANGE_END(1)
> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	INTEL_SIGID_RANGE_START(2)
> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		INTEL_SIGID_RANGE_END(2)
> +
> +/**
> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> + * @XE_SIGID_SW: Software component failure.
> + * @XE_SIGID_PROBE: Device probe/bind was aborted.
> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable.
> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode.
> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC.
> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl.
> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
> + *
> + * Each SIGID represents the report sites the driver detects and reports.
> + * Values are numbered sequentially, are only ever appended, and are never
> + * renumbered or reused.
> + *
> + * Firmware- and hardware-originated signatures are not listed yet here.
> + */
> +enum xe_sigid {
> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> new file mode 100644
> index 000000000000..ae4f6e33f5b8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */
> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";
> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	case CPER_SEV_INFORMATIONAL:
> +		return "";
> +	default:
> +		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unknown severity %d\n", cper_sev);
> +		return "";
> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer
> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +

 From kunit example I got this output for hardware errors.
drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR* 
SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: testing HARDWARE 
signature
drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR* 
SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1: 
testing HARDWARE signature

SIGIDs 202 and 204 correspond to the XE_RAS_COMP_DEVICE_MEMORY and 
XE_RAS_COMP_FABRIC components returned by firmware via xe_ras_error_class.
If we want the component name to be included in the error message, what 
should be passed to the logging helper? The current KUnit test uses 
XE_LOG_COMPONENT_NONE, so no component information is being emitted.

Thanks,
Badal

> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
> +
> +#endif
