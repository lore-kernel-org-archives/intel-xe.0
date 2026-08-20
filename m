Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0172AC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0F210F1D1;
	Thu, 20 Aug 2026 22:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnetGG+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C097410F1D1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787266707; x=1818802707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L73q0t0LsA3+bxwdOI7H6FkN1mgRyHAbnSGuVEEpnuc=;
 b=fnetGG+jIhOw50FgQxZVLvcSgb+UHAVPI80AMU3xeTcDIMe0tkY76W9Q
 4fVYfhKLtWCFDHxxo8JfmzU7tL0Uu+fZ88ZpeBV/E1MplrlDlv7B+ualJ
 M+1Lc/cJ3Ej7EhHq8hv9+k/1Ce6/GxA5pHIzH3vyQuiaeLH4MXWUrmJUn
 c8t+6NNGRSavaPGTGUA7Da99BKkGzBih9cnwh/MpULXBBIW+jJqSIMF+v
 pJXti8WRBRgeXG0ndIsJJ2pjHpwOgFDTaauRUy6BBF/hZ0mxZQA0P0KVA
 l3K4iZTFSa+ZfvyHlcvG4IbC21ooZR82ZH6MRFdDICLwhU79wvOS+g1Iz Q==;
X-CSE-ConnectionGUID: G9rqVF5jRWKEmW6Wki3k7Q==
X-CSE-MsgGUID: 0QB/XGErS/+L75E9yPUvVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87580679"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87580679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:58:27 -0700
X-CSE-ConnectionGUID: RzGpIM9QQE2L0OPFNYm5jA==
X-CSE-MsgGUID: doKVtYgVRhOPaE3PmJATrw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:58:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:58:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:58:25 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:58:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7L7tyLf+b91jhjRjrkAIw2nn9Xis1IqYDdjLA0j8JkFJVvTe6bC1RKdF8WNdS6V67YHbkFvx4V9Cun0sPWM4jkHo6SvxqaDc+CF3NEkuNZ2o2thuiIhmgElASNP9Q/xuNPhVMAAwqpOhvsnYt4Y0bZ9VDRHQoDJiX/IxbDZzbfjOYvruTgQdCOUD9732h8bq8mLXIwVcjPADYuuCJhrV/vBrLIb75XQUWNxB+EufEHmlpGAMSEDbbRvtBGaTRXiONYp+oi9jHO9fs97bLtiLAKPtlUvMCZqczUJq6mJeXuqIAFUgsJ0haPRF5H/D3KNBw8AAm/MaRAfbBB0J/homA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2kbefStenHL9wNSqa5ddqYEBJE21pVou/DpYIjxgNA=;
 b=v4nXeMrulxQNRESSlVLZbMCxJSv/uQMewweGOC69hNgBbsdWFUvDLElwdT1DgzEcjV6D2TMJt7yAcpy/3JCpviohGlSHj4Q0VNqjWG0y9k8dDbYjxcVrjcbeB/Am5SKHL+LO3EhX3joK8DCBL1E4F3AArDe0d0JaqafSO/RMvl1byAToIKFcF6B+N7wmw3PqhD5plu3x+UBAsoLfLmEIjJLIRj+W/LYVOtIad7qwXoXouZJrrlCIJGTwjaAmlMGvZgFIYaMBuT3/gWy6YmAgPaiqfbGZL7UJk7jAMGdmhwcu6H/FMETo4p5JKaEJJhrVRCu/2H2QhG/QBjqVxLXY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 22:58:22 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 22:58:22 +0000
Message-ID: <e70b1e60-27a7-441b-8ba5-9f9cb1e80659@intel.com>
Date: Fri, 21 Aug 2026 00:58:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] drm/xe/sysctrl: Report 'System Controller event'
 error using SIGID
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-16-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260820101632.527214-16-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f16dfd5-1eb3-4748-5367-08deff0e88ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: QRX3GqI/73DWNlPBSOLUz34p2RKjIYS3IAPqpFOCKCdYEJ6SRg++o9V2BU7UE8sctHUP9fWnVitaMMteDNMlqMOdNX7augs5oD4DUWITCTvcjTJoi02ZUSS5rMnJp15KAf7FCEensZNo6jriJjMGAPaw1YecaXfY9wOKWwcY4PGgaex/RAWSYZvlscati8pbVaHZlRHmTKOcwj80375mOiyt9BXu+ThdSTZuWKGB5PcKqhiesIIxscVH60ZZWngUkgmUBxOtwtT1/agzAcgk4yg2g0L6KpcrNuQ8dEXk5tBTWXtsF9WQvFLT3SC340iBXufhjkzrw5+t/dVp2NE4UVkVojUv7mHAjwrc55wSLF7JFJMW8CzcNtEqGgvgZywuWU+WDYHD6ecjj89msLCUSz48mxHwRHsefAFuUlNtbWvEbxkDmhobQYiA4KsERHzflkUsIgpPHy8In5WPJYftLWkouCtzDNxCaLATqFEGN/xjpbOaQE6MfjU8gMobuXLoB92Z4xW4fWz5hw9y8mIQaVsrT8qfJQJEAOvGHBevjmlWmvAyLeQ6hzn8nM9TLdrYkur+JOd2/CpZyq5D6YTEONAXB9AF4P4vsvRgE8NstURbT+Fbb51B8MuJovn1+Pyphp3g1wBdEu3Bo4P0n5ozrsbe2vV2M0Lh1LysB80jeAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW9BSEZEbm04TDUwdUlveUYvanIwVGNlSXBtbVlMd2FteTIxVmZwN2h4OGtX?=
 =?utf-8?B?dUYzK3V3NzB0VitSQTI2eEZ3bVdJUFFYL3dKaTZqb1hmUHBRLy9nODRKdGU2?=
 =?utf-8?B?N2FvRVhjVEw4cGNXRWFLM2dBWCtKYVMyd3NsNTVjR3QyUTd2OFFYV2lrU3hU?=
 =?utf-8?B?endsU3c3bE1CM3VVZFowREJVS1pUN29vZWZ1VUxoQTZhYnp1a001RFlsQ3JD?=
 =?utf-8?B?cHRVNmUwRWp5dHlnRFdPeVFUY3AxRFpORU5PMmIwU2x6RlliUk0yTTE1djZ4?=
 =?utf-8?B?OFZ6NHJGNnZuM0UyK1ZwaTA4SmVEdmZTSEI2WTIvRHZ4dHJwa1d2bGhZa3ZI?=
 =?utf-8?B?OU12dnlKbStJQ1k4VkpZWlhGTmo2MGJ2ZEVWMzFjejNqb2RPcG1KOENPTVcx?=
 =?utf-8?B?MDk1ZDVmYUVKaDZhUFBSSlRwaXlkYS9vbWNFc1A3Y1pMeHNudEE4SWp5QmRN?=
 =?utf-8?B?bnhXRndJZEhhUElvN0grZXBCT2NOZUk5NlJNcktWRDZIWWlYZk9wTE55NVpV?=
 =?utf-8?B?Y3gybXllYVNyQXN4b3JnbUE5ZTF4cnRlOVNMakg2cy8xaUFoTkprMlNmTTE0?=
 =?utf-8?B?S0d4RkM4emdQd3lMejdQNUFwWmZXbEg5TVhkWlAzUzliRDlwNUswOU1udnZs?=
 =?utf-8?B?MWdSUzgwVHZXTy9PVDBUY1lKeXV1aCtMcmtUay94QTlOUjZkRUtHUTd6V1k2?=
 =?utf-8?B?c2M4MTg3ZWdYcGJuc0FFTytoeWF1T0VvaUg3aVdNRlRxaVk3RXhIMlhrRC8r?=
 =?utf-8?B?VnkxTDAxQjJKSHF4VmE4K3M0TkZFMzhFVnArZTNjaUcvaGR6bUl2ZEo5VWVQ?=
 =?utf-8?B?Tkc3NmJoVHJQQVBjdEZoU0hSQzQ2MjBIRlVZSmNlMmRuSFlZRWFaTTlMSTcz?=
 =?utf-8?B?V0JvWEMrSXd6V05XblRUQ1l5ZWg1WEZIb29nMUh0aUpkMW1jUUIxV0FvczlB?=
 =?utf-8?B?cXJwdGQ2dEZUMTREa05KNFZmRFJIK1o5NFgwZm01ZFB5NVpCQldYN1B3YzZr?=
 =?utf-8?B?aWx5cVJDWWN1bGs4V2g5bVI0aVVQSGZGYkh4bkVxaHhPU0FmU3I0a29iQVor?=
 =?utf-8?B?WXhkRXgvNVpOUVdRUWhic3c3eFVDU0gyNFB6ZXlQUTM1WjB4SnMvQkhZS2ZO?=
 =?utf-8?B?YXg1bXJCVE1xMUczMm82bUJGcGd5eEV5dFBOc2s4MWUrK2YwTWNXOW0yVVhZ?=
 =?utf-8?B?R2FDQzVnM3ZZRmJUdzJIdkszZDR4S1pidFdIZGVHNERyRDczTWVWcjM0eDZx?=
 =?utf-8?B?MitLNm5tZkJrS0NMeTJwdXhYS3JybW1tQWtHTHZqcExaOVd1L0ZLRnMzRzI5?=
 =?utf-8?B?MDJuN3lVRDF5QldOUWNwWG9YKzZ4VC94MUZnRjlZRWFjc3JqVXdqencycFFY?=
 =?utf-8?B?WGJrUXAwN2Y3ZEl3RXRkNURkMjdSN1d0QXRPMm5oTkN4Y1ZWUSsrMDNkZ0Mz?=
 =?utf-8?B?d0VTVTRkdjBtSFlOUW5UamRJQW5iLzlFOGloVXRrY3dabXJBMTY1bGJkMXND?=
 =?utf-8?B?T3R4a0NmR1crd0ZuM0xwTC9UMmQrc1hNdVJGNEhtcXhJRkozUDhtV0tDanEx?=
 =?utf-8?B?T0tEREtDZEFML1BER3A4d054N1NBODlLNmxvRFd1b1pFaHhQTmhJMXJnTDFC?=
 =?utf-8?B?ZnJhQWo0bkVvQnVsQnQxM0l0QlJvZklMYzNCbU4vbWNiSWlNYVpPTk9mU1Ro?=
 =?utf-8?B?Rm1Xd1gwSHNpRjFNdnhHUHVBanNpRXppMkFnT0VyT0pOREkzenpReG1qd2NQ?=
 =?utf-8?B?aXZ2dW5rNWdjeGhXSzUwL1VuRW5pc1dMdmE5dlg1Ui93SHJHWHdlbUplUjNk?=
 =?utf-8?B?d0ZhaS9obCtRNGRkdkV4SHlVa0kxYTJZeVZWTVZueHlzOFBGTWVxOU5EaElu?=
 =?utf-8?B?YzBsQ1J2UXVsTFI0c0JBZUlEUWd6K3VVSjgwNEM0YXV4bUwwUFVQQ2ZCajVV?=
 =?utf-8?B?WFpzcVlFTGp4eElYYlRJUWNvazFLOWhmcFJTRUY2Q0ZHRUJ4T0Zua0Q5bmxG?=
 =?utf-8?B?RFdST2dHYXBrbFRKM25jZE9JZFhqck90QmlwUCt3czNiWEFrS3YwWm9YUGdq?=
 =?utf-8?B?OEwzVHFvUUJWc3pXWDhqN3ZNaFJOUm5CTDRLZTZBU3ppNGxnSGtJbTVNYW9C?=
 =?utf-8?B?R0pGVU5sTlpXVVUybjJLc3QvMU1YQ1g1Q2QxekFOMWRjM2NoMVZEV0VlcG8r?=
 =?utf-8?B?RGs3cmd1L29ENW1nUVp6ZzV2YmU0aWR6RWI1dDVzV2JqTi9aUzM1TERKTlRm?=
 =?utf-8?B?cHR3M0FOS1M0KzN5RzE1SWVUWnBTeDJxRmdjVmFLc3NTeW9EY0pYSjY2MWJ3?=
 =?utf-8?B?VUJ3Nm1jcEg1SVYzMHQ1OElYbStjbHJ1a2Z4MEZHZjI5SEpueGN5bTIzS1lr?=
 =?utf-8?Q?oz2+zJ/mX/7vy40Q=3D?=
X-Exchange-RoutingPolicyChecked: aF3jsOnk300cofoI8JRGopaHcrglPA4W2whmY8bdkeXwRP1jWaTjCKt5a3Q2jYvSMmUZYvpvAER8tVIKpei1T5ME0hti7Tjx52U3VUN/TVfthMQz2k2u9mPzEfQ0GJanncTv8wJD5vn3W5uDSZi8aWRwvbeFEHKXm9A3DA/RyzSM315z95HY9uQAwIBYEe1S5RMckY0l4tgdfoR+u2+M+VfPPTP8P6qHWEO3FIjZZhqn2D6MSbG0JaTP4G2TCCNmbBtbJdxk7whWtLw9fSPl/cn+ECZSg1eDA/Qv7Eg8v52oJmGSidfBMvWK2GZ+O+acH5Tm/9VPMJJuoqKmtbS3SA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f16dfd5-1eb3-4748-5367-08deff0e88ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:58:22.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyucdxxtXiyB3bXdylTsXtfxs71UlX+GZbfVNc44gfB7dg2jxoDKi9KFK2Hbik/K6x20wUkIKEPW4GjFLP01Ux02ti59ji7O69qje+yRVr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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



On 8/20/2026 12:16 PM, Mallesh Koujalagi wrote:
> Report 'System Controller event' error using xe_log() helpers.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_event.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index da395148ee9d..29d6fedd95d9 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_device.h"
> +#include "xe_log.h"

wrong order?

>  #include "xe_irq.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
> @@ -25,23 +26,26 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  
>  		ret = xe_sysctrl_send_command(sc, command, &len);
>  		if (ret) {
> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			xe_log_err(xe, SYSCTRL, ret, "Failed to get pending event\n");
>  			return;
>  		}
>  
>  		if (len != sizeof(*response)) {
> -			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
> -			       len, sizeof(*response));
> +			xe_log_err(xe, SYSCTRL, -EMSGSIZE,
> +				   "Unexpected event response length %zu (expected %zu)\n",
> +				   len, sizeof(*response));
>  			return;
>  		}
>  
>  		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
>  			xe_ras_counter_threshold_crossed(xe, response);
>  		else
> -			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
> +			xe_log_err_info(xe, SYSCTRL, -EPROTO,
> +					"Unexpected event %#x\n", response->event);
>  
>  		if (!--count) {
> -			xe_err(xe, "sysctrl: event flooding\n");
> +			xe_log_err(xe, SYSCTRL, -EOVERFLOW,

maybe

	#define	ENOTEMPTY	39	/* Directory not empty */
or
	#define	EXFULL		54	/* Exchange full */

> +				   "Event flooding: response count=%u\n", response->count);

and something like:

	"Ignored #u events due to flooding\n

>  			return;
>  		}
>  

