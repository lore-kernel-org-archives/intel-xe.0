Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAB5C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 16:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A452410F4AC;
	Tue, 12 Mar 2024 16:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jG54yqpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4B10F4AC
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710259498; x=1741795498;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zRbBiDo8OKdoRkzZwR1dOxRqtLItJB4EmO648T+DBcg=;
 b=jG54yqpQ0ddRaxtf1uLVIyScGwwpTyYJQy7FuXm1R9nYxH7j+Jltkc6K
 wbvI1SxkBYgoBsryhAT+8igmE6rre7zp6gfkqco2TD4h05qBIbN/DCArd
 vNvW3/edJ1U+cfjU/x5iQPR0ah2MYw5kdx0wYWWrCsd15e7yiYrQTUf6T
 lCrkVbIwE/vHqvnANVF+GX2ArOQLpAmQsoMmknHshugZPYHzZkVZOedJ6
 2ilRCtVRqnOh85+GM5Tw/7A4KESRkHQDXF51TogoMH/xbNtFVInXjaKQt
 4f1r2ziKzDIaBDiT8MijoZ8+oEdB4soqPAhtc9uI1Y829EVgQm8kxN9Jb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8741596"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8741596"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12185519"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 09:04:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 09:04:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 09:04:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 09:04:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 09:04:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIVU1Z0y25e+VDp0rb4Of7GTi91dWTL7uD8GX+7ft6yllkHOhNAcRL8p73TrKuKnSQyHEvZe+/mjgwrBW9Atc9dbKA+rZsyZklQZQu+nCvDVa3ZX2f/SxTq0B+Vow/OBzjzoAjm0gMNM4KODkk/gPnm9yX6wTuJY4CHPVca9FjhqTuVBcDfGwoco8Uv/RQhBzkOc7d58BLfrXifLHhjScwml/jc+POyRkvORbNhDwbaNxh1IEvri2jWvUtzls2qcXqtwO1SnFcrMXU0EmIJmGZi5TOda23jcrEigfAz4mG9f1ke24/V3APuazu/aYw96igL5adH+DAJi4xdHisGZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jPEezVO24nxdCbPLkDHaIAXu12hxzYbm7y1ovyozwE=;
 b=YUognX1nXFDS5BUg00jzcCYjVPv+NJYhw9gLx7feY49w5YYxk+sIEsLLSvTaImz/nkcm+BhzK8HgWIY6nUdet8zOtM2hAommuXxavmTcK/j/ySUBn4GDIZN/a30Z/xr0RtqbismQCvJ0w36mHUzDcEvAwu3+ilpDMtdngfr77ez+7a/2OpXoop+AEaBrJ1ghrwpIrhhFWa7YQTkg1SkeePW3PMmWnqlRUF5gsPTCNOF0uXY/AwjwMYuU36SMifBw5ioBCubP2zebkEJeR5cOw4bgXZ3fTNSsjktgsIHrI5vWHC3tZqy4L20NWTu453NUuJvlpKJcI8Q+CGKwJmRdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 16:04:10 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7386.013; Tue, 12 Mar 2024
 16:04:10 +0000
Message-ID: <4d8399f6-5155-4340-98f3-fe9d4f6019e9@intel.com>
Date: Tue, 12 Mar 2024 09:04:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Check for possible err in forcewake GT
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240312142424.3152951-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240312142424.3152951-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 273f3f77-b169-419b-dac2-08dc42ae0d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYpsrJSEEIhdRFvntaqOfpq3mvWeH17ybFU283kYYvWKR56mPmxcZhenpYh409a11/5Q0xRYxZd7v3eSH05aqPBXclS9mvONkICqO1SZVMcTeoLS3M78lztUY/K/eEgun1lk0zGVw7/Nc/I9efkrkNPGWPZoUl4+nrFLgQziGalujADmKj1DPOFKUmwx1VEQAvAXSgbePVgg6XHswtlnH4zEwUAt4s4OXeY9X5fvXeGa7fh1cdJ/CsHvbAPGMMWQD29W4ceXuOu1dkrmjh5wJ/7/bhvJ9FnYir7cMl/rwB1CFWsBrawHRayJyTD0/fW44VeB/IU3+tqXP3/D4fpPwLwFsS3w9YgpQYoKdeX+IKQIZ3RnwRXRxgsqlS0jWFyx8bjOO5oMpyy4ZxYiP6rAP2gghNhdiP+lzdkyYH/bIkPnBUAjOHMrCubLWmgJLJQYkhjttON6m68v0hViKSntnPx22rUy4UaeNpr1TPVGCn3kSX1Twz9oVpvh+k1n107i84Sf8H3Fy9kdKa7ci7ifD09K6wf4YbYhDSeiXxmJdnITlsnNTrXyfFgY9l7LZaPt94r6y8kbFTxFYZqQbEv0OaroFNBuSsnnJwG/+lF+iQc2ZyrnIFYjjEx9Sg2AWcGXKQMqMsB1gUBts4b8QbrA6fGziik3F4V/VFYNypqUb/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hYQlNIZDBsUzFlaVZxa3pmTk1lYllDV2VoeXdOeXN5Zlk3U1V4OXRFb0xk?=
 =?utf-8?B?U3ZwZUY3Qy9BaUJBTGhMdHFkYnhVaHJNaHF6OGFGZkd6Q2tDQ0I4UWYxTnVm?=
 =?utf-8?B?T0l4YTg0NlhaV0JhaEQxSGdlQUxPWDZic3lxSGo0ZlhHUmlZTk9YWkpXVWFU?=
 =?utf-8?B?cGJqMHl0aFhpZy9hdGNUUHdmZGk0MFNVcEU3cFQvSWJ4NjBRMWZvemlBQUtC?=
 =?utf-8?B?Y3M1em94R1U0T0JWTitlcTlUK25GRWxlOFdpS0RmemNWQU1uaTVZOWU1L2pB?=
 =?utf-8?B?ay9XcVRMWjRKbVdld2JsN1E2a0xYTFBwaStRclI1OVJWcjVVZ3RFWTFOU00x?=
 =?utf-8?B?bm5nZVhqMnl0Ui9CYUlFTkg4VjhBQXFacm9jb0xFTit1WTJMZG8zeGpLa012?=
 =?utf-8?B?VUpDTE1kcHo1UnF6NzBnVmVnNC9ZV2hPcmJpQXVvd2Z4TEZlWDVKVjV3aXdZ?=
 =?utf-8?B?dFVYSUsvSDY4aHUrRjJ2aW1GbUpXQmdhT3hqdCsvYU5vVkcwbW5YSXhOR3FW?=
 =?utf-8?B?QU9yK203MnVzdm5RVkE5VHluSVI0UTBNY0hyN2l2RmpJMnZ2ZVdKczBHYWFh?=
 =?utf-8?B?ZDMyeFJDcUlOV3pqTXdrTEg2TTUva1VFcXZuZGNuMzlVUUFLK0dpa01ILzhy?=
 =?utf-8?B?dGdBRzArS1RmWUN2UDAraE4vVDVNWE5DRi8rV2NITWIzbFJ5M1FDNWFSbW8w?=
 =?utf-8?B?eTdpb0h4TEJCVUxYVkZtQ1ovZ3IvRTFKWldkRHZXYnNSckVzeUNUdUgrck1p?=
 =?utf-8?B?alp2bVRnUERHb0dZeEFDd291OG16WnNtNXZGOW5oeGVsNDhLT0VpR0lBU05i?=
 =?utf-8?B?SkxvYjV6bU1vQUdTN0Q0OHVuQXNJbXBnV3dGU2F2Y2RsR2NqZFBoQmJOSVNW?=
 =?utf-8?B?NjNnd1VZWHp4MU1iOXMrdmVqUHQ0azZXMFA3WFduQ09yeVIwbnovaklmcmFM?=
 =?utf-8?B?UFBvaXBNVThXQkwxNFFldDBXWmErTncrQVNMSmxUT1Z3bVgvTU53VndPWjJ4?=
 =?utf-8?B?YTRBeEpPS2JBMEVCWkU1eXJIQ1U1YjhnenBtZUlPMXVrb0tPWWJ1RzNHQUZK?=
 =?utf-8?B?ZWVoVVZWRWVuTk5zeWxBaXpZNWxVdlM3ZTdJeFRRQ1MwSkh4bk1jRlpqdGRE?=
 =?utf-8?B?TTRKSjdSbmc0Zll0WlR4dm9BazY1a2ZQSGUyWGRLdzVEVnFyY2VaSmFvVEFF?=
 =?utf-8?B?V1J2RkpzcXhaRkk5d21hckJoU1k2S01RVXhSOVNiNE16UW9PM2s0VW42MmJo?=
 =?utf-8?B?QXNScFgrWWVnZ0x3ckk1VTUraEpOVk5tSHFIK25xYlZSNExoMUx1ZmhwRXQr?=
 =?utf-8?B?M1dzSVpwUFNnSm1lMmc5Tmk1c3NKSElhM2xFSUZJR040eXBLVC82Ni8yeFNW?=
 =?utf-8?B?Z1lnaWEyMVp4TG1oZVVOTlFsOW9aamhDdTQrMmlKQUkxNWhyVE0wL2FsaDBL?=
 =?utf-8?B?L3hTbStEbkhER01yY3ZHT2xYZzFKQ3pYM3lnbHRpZWJqV253TlE2eEhxRHNU?=
 =?utf-8?B?SElGaitrdW1YdEp6Y0l1QWhXa3N2QlEwNjFoQkFDUkpLS0tJWnhUOGpmbSti?=
 =?utf-8?B?S1lpK1pGb3l4Q0RGbm1HUEJmT1ErcXd2VFZuT0NmYlVmSU5UZlY4TkQ0YU41?=
 =?utf-8?B?UytKbGJnMzhQQ3NUc0RNcVYvMnpRSEovcWFhSkMyOUN0VCtISVZTaVh1R0o1?=
 =?utf-8?B?VmZJaCtSL1FOUGtwaHRENW1tbHliR0JST2UyOE8xSitDWTZZaVpWdnA3K3RD?=
 =?utf-8?B?YVd1MjBVbitlVGdQdEgxVjBQcENHSXVwVHZzTDJTNFNmUnZtSGdkL3NkTmk0?=
 =?utf-8?B?ZVlDWitINGFOMlIwTFdZemp6YkdSMHFFd1phRGdBeVVRbi9aWFAzaUVDR3Ri?=
 =?utf-8?B?RFNreUhLZUVqUDZxVG1qUU90b1J5Y3FCcXh6MUFJVExJZjVpSm81QzdOQ3dO?=
 =?utf-8?B?YmNBZFZpeDJscCs3c0ZnRzU1V1JtWlBVMmxORFNweVp2eEJpcWh5SXlYRVFX?=
 =?utf-8?B?SFJveWoyMzBKNmxOMkdhS3d6akYrQ0FBTjIwT2l3UjVVSWhLUFVsVGN3WFNP?=
 =?utf-8?B?UC9HZGdrQmdEMDFXSklnR3ZSL05yUnNYRVpDOTlLNW5oZWVWa2N1YzFHellZ?=
 =?utf-8?B?V3VhSEVlTWZGR2pPc0JZeFNjZE4zRm00RVFTWkUwYS9rN2piQmZJcjJoV3Fm?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 273f3f77-b169-419b-dac2-08dc42ae0d7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 16:04:09.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrLL4X01IHgN73p88A7WaaLdmlb7JLcBFv0uaELk10nxmkLMfJXmLGI0B7h7gyiBPHUzjey5vrimzv7CBOmNvMpkVht135NFX7hkhv3I5FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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



On 3/12/2024 7:24 AM, Tejas Upadhyay wrote:
> GT Forcewake can fail, check for success before
> moving forward
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index d9aa815a5bc2..a5ee1b39f4a7 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -287,7 +287,11 @@ static void gsc_work(struct work_struct *work)
>   	spin_unlock_irq(&gsc->lock);
>   
>   	xe_pm_runtime_get(xe);
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (ret) {
> +		xe_pm_runtime_put(xe);
> +		return;

It's not safe to just abort here, it'll leave the SW in an unknown 
state. I have a patch semi-ready (will complete it and send it later 
today) to print an error an keep going. If the GT happens to actually be 
awake then the next steps will work, if it's not then they'll fail and 
we'll move the SW state to the expected values.

Daniele


> +	}
>   
>   	if (actions & GSC_ACTION_FW_LOAD) {
>   		ret = gsc_upload_and_init(gsc);

