Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9DDCD98F8
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 18:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802F910E106;
	Fri, 19 Jun 2026 18:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sy0PHodt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4482510E106
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781892181; x=1813428181;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LGzBHnTl1jdTB8v0O7Tp0uwGo7COELo8PXIDQwAIvNQ=;
 b=Sy0PHodtlRMTfwlXoUbgKe2y8+7cwzsH3WAUS5y4+Lp3/YSeeYzC204N
 VGiNUkFtjg6wrcKVbyjQRU3562kspuHB3gHQ7HHxPAhDLSw6IqvO414aN
 Wb9fNjqfWGbBZeKTfeBccy3SsgC2YgB9uYUrB4BK8064XiLMaM+IWc5W+
 aibl7LB6eDwlv00ixN4vuzXa3gQyiQzDH9WqL1VmE41Wux3KEpQ06gPq6
 OtEImTsO4FqvNKI2Nh2UmSUAYd4qR+c/+2wNw2ByJ79CwEPOQEFoXkakp
 EABLyJ5NYIKslxwbj1Lz/H+T4eTLwyiYs/YiCZVvTB1kVF3NPRGbw7ObL A==;
X-CSE-ConnectionGUID: 11qkBk1kQeaJDl92+IR4EQ==
X-CSE-MsgGUID: 8h3ZP39lSfmMRBzYtJLIqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="108282818"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="108282818"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:03:01 -0700
X-CSE-ConnectionGUID: ie+e1m9KRt6VOLPw6hPaAg==
X-CSE-MsgGUID: Ec0WAkGpQuK34w2sJZ+R6g==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:03:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:03:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 11:03:00 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iu1sbPnDlCaoYHUHRpYJNqwMwMZ+seM+pjEvaTxBhU+VewvHDdTLe5guEPLY6RTTvIE6kUbb8ZAKuhBfEXFNwnw+iAJjMb9XF2zJw8CLwHbIWhsJIPBGClGHdd/FGLGn/LpDedrGONIPe6QQpYPC0LSl7RpqrdJkIEX2Cky0vU3dBBDKT/4mGn1a4+Y7bPoV4ys/hBJLytTmBjEQ+M0V1xv6HYtZKPnPeZT+5YWvvjEK18fvkA7Cdgx/oie4QGuexwZR5XXzO9Wmzd6QuuszgGrmCUqUTLe5SAEqB3an+ReWza0kg02K2jgLvyRjANvxci5O92FasRZ2AzQh1/1M+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uagy+RGbkyZTfGQ6huQ5faLrXDs3+ajZkDE3JemJrp4=;
 b=yZV7U9hsMpGsBkImOdnNAGnwvuGYFNs5IkDJDJKWVzaBOidb2Gn4mk6JZUEwx4z6KRE1h3ulGTd00JG7kOKrhfAx1taIMpBT7eq79L50EnCBhWORZ4s+2o9NuwgnicAmmuF7GO+SHV8Ks3jkTG7Cs7/ImZ+vTYJtbttDtZJuMwichDUarDjnOopAHchc/H9Y4kb6nDGv/J4K/sQzYtzzi6dERzZd0J/K5ZaSICFFcSbdD/hA3cJC+mgiO+jrwMYb3rxpDJSGIADgtC5mQauMc8JA5lZLJZ/ihxaZomLqoX0FtpFTRYgYy9R6BxyxSi8Iqtj0CWlTkJw42LdY8AgUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 18:02:57 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 18:02:57 +0000
Message-ID: <24dad1b5-0e66-493d-9f2b-babc7bb99bf2@intel.com>
Date: Fri, 19 Jun 2026 23:32:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/xe/tests: Set non-GMDID graphics step in
 xe_pci_fake_device_init()
To: <intel-xe@lists.freedesktop.org>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-6-21e83e188e60@intel.com>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-6-21e83e188e60@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0204.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::16) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: af00ae9a-f66e-400c-3f6a-08dece2cfe18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: KCvwuDm2/DB+8l29i0rSCRsu2mGQ2pPbmuTlX/x4917gOW3+0sG5nOLrIhy7/dQ8Kssi7O8iJ4/i6SbGHyS/lU70gVYjLO6ueDleiVCDH0NF//9mjcBquOXgO7A1hPF4Au5jhyQRwOrThn9w9lpmiLPfa060SY6PKmbhH0ex6bJSmaFEAPw3mLEgzndC3EZ1GJ3hXYXGwbuY4qymuQ8qjsjkpVtLePs/Lwag2FAf76mz2kNsTPpY4pfYahzTng3edMSPiMAOMbAB9nihunUDliEk5J/dtlDa1zUA8SgjuCSz9sMlFixZpXvYE9EBzA/xOr8DS+oAYBn8+xYUfNyxWYQrrvOsZ+LcwP9OduPCkCx8GQ+awTuYD9eXEKVSc0buS3QzzfOCvXXKKgvm4X84XrHhT9cGpQFP5oJsSNAbYyH5Ybgr+r9DY2j4xwq4J2LsKtF5+JY063Md2YMu5b0x2Fi2KIzDe5KkugL/KIrvNJvF/CHVGBoZtzUaSczb+BQ6s3Ysj0Tf/wleUP4dXQvM6VdfsZNGQ2JgSSEOvP0kwVgwDBjHLm2pFRPaTw2aWJVJI+/GxrYSypErH2czV0Mc1+6z62RZ7gWmJVb8/9Z3s8cmUWiGhfAiz/IsNn9ke64zXrPvC1q5wMVsN2BgNwPw0N/JoH8Bi5pQa4fNKsPlZhI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnQvaXBCOVdQa2J0WGVadVhiYzNqSTNiTFoxZjdQRmI3VzNmcDRxZFcvNFVM?=
 =?utf-8?B?Qk51bG9pRlhEbld4RkhoSHpqZ1JHVkFXY3pKVnJTbDNPY1k1TGo2bTNPL3Ev?=
 =?utf-8?B?bDMvekRSdWtwNFRWYlBwSmQySm4zbnJkVkI3ZW5wcTg1RHlkdTdUb3FwMmsv?=
 =?utf-8?B?Z2tzclZiOUtZcFpZb3VObEk0bEw2SzBXYXM2YmtPS09HQjdkWnFSRytrb0Mr?=
 =?utf-8?B?UzRUYUxDOG9QK0ErY1RUdS9nalZacnByUEI3dWVId2NJdTZXMzIwdElvRjVW?=
 =?utf-8?B?VFVra005MlFCRjlqWCtKZDdqUFFBL29SbVV6b0hkQjFndmY1R3NWZWRNWXRV?=
 =?utf-8?B?M05INk9YWWcxRTk4ZE4ycmYwZzFJZFBpQVlsSzhPQzMrWTRPOVZ0MWZQSmJk?=
 =?utf-8?B?ZG1raVU2cFpOWkJ4UkNmNUp4V3k2MGRsUlRZZVlYa3V1RmpOWkQ0anJ5eWV5?=
 =?utf-8?B?c0NxKzdxam9JdzR4VFlBVkh5Yjc4MndEbnByS0RhNE83OVNIODRXSHhIRXpk?=
 =?utf-8?B?WmhNWEltdWlrRWxwcU4rVXF1b3FCSlQzRG5YRkl1UlJnU25BWDhodGZIcU9P?=
 =?utf-8?B?aW5CR0o3TlpkbCt4RDlndi9aK2VyNVRkQWNsSnk0amFja2VMbk5WNjBJMG85?=
 =?utf-8?B?OGtWa3NHbC9VRWRucElncnA5WlJ3VS9tV0xJQ0NGaE03UmxKK2diNHRJUzBp?=
 =?utf-8?B?T3prd0lob0tQRm1rZjVGTHRBSjRTN1BveHhzcUJ0eWJLdWpiVDdoQXB2bUN4?=
 =?utf-8?B?Nk9oQ1dqQTNPUVFmVWVmY2ZMVmFNYUdkWFVoYm8wTHR1TDc2T3JVeDBCbTk1?=
 =?utf-8?B?RnFaWG44WnMzOGk0UkErclovNXFBRFYrdGVhV2hCL0x1U25MU1lOM3cwZ3Nh?=
 =?utf-8?B?ZFZHOHBIZW1hNUJTV3ZtNjRXZ3JNZ2xYcFNZS1Q4UnZ6Sm5aajg2aXl3QWxC?=
 =?utf-8?B?NVUvZklIdGxoaXgrS0h6RXJoK0pmelpTclZhdjFtbWJZMFZHWlF1bDVURUhp?=
 =?utf-8?B?Qi9hVWdBNS9xR3FPNXBNMUlZUjI2MDBNUzVndWdUaVZiRUc2MU52YmcvNDhO?=
 =?utf-8?B?Tldyc1k2L3F4d3AvK3FIV3dxMlhudGFUcFJselJnSVYycG1wNDlKL3MxcnJF?=
 =?utf-8?B?anE2ZE9Sc2gwUW1TVFIrdDVlT0c4ZFFQYzVoUG44OGdla09vcDJoMXpCZk5K?=
 =?utf-8?B?V0FMMmFwak4wYUpveXZGWVhTb1J2OEcyZGoydm5WQUczYTVoT1FqTDBGbzRL?=
 =?utf-8?B?MjUxclhNbXFBNGFEcFF0c2xEMExGVTNSNE95YzRJV3kxYkRXT0RwVVJNMXI3?=
 =?utf-8?B?OWhKMkFQNHVYTFVVWEJqV0pTUUpqY0FxcTZmNDErWU40UHRBNUV1SmlkUFNM?=
 =?utf-8?B?dkVmNGJnanJhOVhMcmk5Wks0QjV1SzZUdWU5MmFEa1JSdGMxVmJMMndDVWhn?=
 =?utf-8?B?OENHaXE2ZGN1eTRNZmY2OW11ZnhRcXBTTWJOdmNvUTZHbVE5cWJzQWtzdmh2?=
 =?utf-8?B?MDVtNGFuK0dKMU4rVFMzM2Nqd2ZqUjhKN0lveVlCSlFtbU9qeHU3ZnFXa1pr?=
 =?utf-8?B?UkxTLzh2TFFLMUMwME9NVHFuZFdibERUVnYzWC81NkY5WVFLVlJVdWcxc3Rj?=
 =?utf-8?B?MzFRWGpXQ1FyRFJseDRwQ0FVTHBoTXhRaW1EaUtVMjhiYTBEaXRoQ3hEMVp0?=
 =?utf-8?B?TzNzZWR2UXk5MXJYdDhxODlIWDRGd2pucmJaYStLdzV1L09BNCs2bElYeHNO?=
 =?utf-8?B?RjFGM2dtSVllbFAvOTdPbHExaGp6N3EydWZvaFBpUm55VXZkM0I5WEIvaWww?=
 =?utf-8?B?OHR5b21LclY1b0kxUHYvUWxGenhwWWRpU2dIRFRJa2RlSDc0V1hYQ2I3VnV5?=
 =?utf-8?B?OHVhS21MTTBJb1F0OFFZRy9KeitxUVBzTU5LSXplaFJCb2F5WG44eGFCMzQ1?=
 =?utf-8?B?T2svbFhjUHVDZVZEb3dSdG4rZ25ranViQWp1VEs4U2JTQzlXRmd6ZHM0UVVk?=
 =?utf-8?B?aWNmM1d0U2gvQUJjSXFRRXQyRVUyUCtRaE93OCt3NjlsMWRmbWYrTUJJWXhR?=
 =?utf-8?B?cmNST2hWMnh2WjdCVlREOTBjTXUvSkFBS2JmOG03V2lmK0laeVU0SUpkaGlq?=
 =?utf-8?B?U2hHY0lhYmpsVU9XVTdBM0dyNFJTcExZcldCcUMvWTFCOGxBN0JBUVlhUGpt?=
 =?utf-8?B?T3U2K0tSMFBKejFjM1QrRU5rdkVQYktadXBVY2NDMCt2SFRsSmIxOFVxUXVL?=
 =?utf-8?B?WmtwNjRCM2dnMGlkamNFa0szcFpmQUJNUUJzaUhVUnFlWERkb0kzVjhHUi9F?=
 =?utf-8?B?VWt0TTN6blRzSHlnRU5pTlZMdlQ5QXJrN0F0enRjTHdVUWo4SzFQYnBwUEJW?=
 =?utf-8?Q?lyVut2Rb2wB2lDb8=3D?=
X-Exchange-RoutingPolicyChecked: XZxlJaRr7fEtnFO3ot9XwlmoummglQmv754Cu1TNFjR4z3bRIR7Tc3/Dsm9ezfnrY5/61SuP74855j7xP27kN7wCmA/w5ZZDzd7+iicx7w3miZe7Y9Z8g7rt2guQ6x7B+T0tR/xMOiyP5QJczv+u33qc3moXGKVNgjJj21ddnFJmIDUBWY2dDBPPh9JGTV/u8W6gFf2pd9Ut8xeh/1ui1xi7LofGGnhDD3jI198IodTyRLuFl3y+++2wwWWuTkzzmQkng38N/vPr+P+mDLwGEbJWEjBbizsL+7my7AHhDYz7g8I0XG/Mk+4C1ylo2UJo1HUxuLiuklblMPsXxdf9uQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: af00ae9a-f66e-400c-3f6a-08dece2cfe18
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 18:02:57.2933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wx5dOJLzKKN2DVcSspSWh7/ogwWKuvWD2lgVlgWgRjvZHnOsJTu3dI0ZmhinJfC6wGdJWPGz7IRPJDWO8G6eGNlxNxlmfedFKfkNm9Ic4I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
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



On 10-Jun-26 1:47 AM, Gustavo Sousa wrote:
> Currently the logic to set the graphics step for non-GMDID-based
> platforms in kunit testing is defined in xe_wa_test_init().  That
> logic should rather belong to the helper xe_pci_fake_device_init(), so
> move it there.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_pci.c     | 3 +++
>   drivers/gpu/drm/xe/tests/xe_wa_test.c | 3 ---
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 1baf3cd0d381..a665d5dbc472 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -388,6 +388,9 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>   	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>   	xe_info_init(xe, desc, &probed_info);
>   
> +	if (data && !data->graphics_verx100)
> +		xe->info.step = data->step;
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index ff0e2502b39f..21601e9df353 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -43,9 +43,6 @@ static int xe_wa_test_init(struct kunit *test)
>   		xe_gt_mmio_init(gt);
>   	}
>   
> -	if (!param->graphics_verx100)
> -		xe->info.step = param->step;
> -
>   	/* TODO: init hw engines for engine/LRC WAs */
>   	xe->drm.dev = dev;
>   	test->priv = xe;
> 

