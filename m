Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028FEC61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 14:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC8B10E1EA;
	Tue, 25 Aug 2026 14:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3Mj5hzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8DC10E1EA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787669450; x=1819205450;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ezSk93f5rtKKn3NaEoEcyJwxBI/vsHgbj23NM9c0dGc=;
 b=h3Mj5hzI2in1+13h3FWZijJ0Y6XaNAqTeGsLTEuh88QDuMI6yuKLAOVd
 wjDF5zAcfpl7AxHCQlj6V08XZkaHPZMO15WW2gekPL/B01aqWWmKbHHeB
 N581gT+QbJAMJWzcxUm8YSRwdEyhChY3uiPR053AfYdoExhYw+lde5OOw
 Ln5u8cv91ndCeARgJKRC/EsXq9vfaG9DNCPKBpk9eVV3TTOrBmx5M0iJj
 O34ugEgtWau1OopQ+DlwCnsUqjJwz8NSP6KHSb+c0z5HwrbPlUu+XM97R
 b2e3+1G6NNrCvLa3N/Iqy6uIS2gEKvMiEpsWzCBUvFUVBOt3xciCFGzeS A==;
X-CSE-ConnectionGUID: hkUB6Z8tQ9W2ZwfvhYNM9g==
X-CSE-MsgGUID: a/9uwbqHS1GFwZJFFNeE5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113673728"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="113673728"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:50:49 -0700
X-CSE-ConnectionGUID: kp5JnAQmQpeHK5+AchacYQ==
X-CSE-MsgGUID: 7v0skKf+Sji1pslA18el9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="270778115"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:50:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 07:50:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 07:50:49 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 07:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF66lUAoSkqNxc3ymu5pSdl+GVvDVF+4/6Ad35pHhsUBXE7wz4B94frUZ6dKUCU19H+dmTviiIrrD0R5IVnvAp3Mx/ho4TNyMr36T840ggdAgO2ekj/mXCg3ves5jutr8+ZlrFmhpcfk0XY8Cl0BcJhxX/s/VWq82Hdu1GmTBTAgyFgTR8QaSRGHDDrI/BUDHqnbQ+mPgPOVC2+juAQuzMWQSd2WVD5JEzaZXip6O2uY1OM8N0/dUK/J16iKVKk8mMT8aLB8rKHmFPlDbAT1qbap8nXj91sxf24Go0c8H8Y0lxPS9hmJgDuU2mth0pezFh2/l+k0otsSm62+qYKJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4/QaZomhiN0+MpXwgkwOrr+CQdhGHd6kWOShjvVtm0=;
 b=RD4NZTRegaL656quPvtlmPNsoaK5ExU1REcBqIW3hiynxt3sU9E8vapIjDDGgkaFnx73kKXvW7J9zJK7Rkl/yyKWF7tzzll6j/YkgFGgvJRdqR2xIgCrtlgdKogQ6VkG8qzY7yB7G6aylaIFeSqgIbSHeg6/7vDcGrbY+0fQ+seFydhFk4wSiYIprz5ys53TZHmBsplcEWTvqVrX8eQcYnAlrwnuse0ekRbw1ZIgKvqghlpsZdtv2fbGcBXDqMzHvpqNLFyYmPTQmu1R05EPIxnIt4dsFG9Zb+HImv+owE8ZMYwDojY/4AamRXQUkrqIEqND9Lq4wJQ4I3nil4cdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 14:50:45 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 14:50:45 +0000
Message-ID: <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com>
Date: Tue, 25 Aug 2026 20:20:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260825141109.3797483-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c979a5-d888-46c5-f1e6-08df02b83dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K5q0FpKEA/tbcaH5bjP28nKYWaClXEvVkj255G0Phgza+TiJugB5YQMr2wK5HxxMObw4xt3GiNDst9fFyUxdk8PKxIZfeC80Hq1oZlNkUZ1uQUgBBVKzknrTsCwvqlZDMtbdEVnF3KppEn7oHJGH7s22OSqEYQua99G9C6Yr77qHQFivA/JzHj4eeALUS7oQvfa/mRZ7cjl6hcgSgfgUTSkgAO+db+dBlE04lnYSHIi4UndZ7jv21uC8qkaCjg8Yd6xi3ltvLcuWsA3QDnpSu52/MkQVtpTvas82D8Dx6uBMxfw6M7gL07qChNiuxd8oLHeZECOO/eMRWC80jmmBN0ewouRwucfSSwFuNis2SNnwocZ1go7dRVr+dSF/8D9+8eCYfMH4Wqnu97A6zQL3ecTKum5WMcfbWKye559FgjjS/V7D4Jwu1Z3xkE2XU52pHiivyqANFWpHYHcL/dOJeSusPXVzQ+79XDt9qEKQ51PwIuKdeXp9RIFTm19P3/6v5KZOJZ/NwrOU0yv5sHvz64uAVtuLuTDEaIIr9ibBWOlII8hdZ+LNSf9Q9htuwSi5s8gaIqfgRofhp/LE3iba3vIGsTeMszFpTPoKM+WdbKNkw77I4SRS0Rc2EoE9ojOXewAOffiajwvv8HvLYkk//zAJSUYMBv2wFqglJD9dwVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3FuN2dhckNCczB6NGloVXBvM09aR1pxckZTVW45dFRDUURuMVdheW1JQUtB?=
 =?utf-8?B?TE9DaWtvWkVMY0U3RDBvRDR2dk9uOXU4UWpmL25mbzQrWGo4REVCZm9QWEUy?=
 =?utf-8?B?K1RDdEovL1h6eElqaXpmRWd1c2FNQzlkQ2RQYjFPaWcwRk9SSzlvZ3YzU0x5?=
 =?utf-8?B?aHB0c2pFaDVTaFVyd3ovdWd1UHVtSjVGbi9IUUxleExnNTNXbEdKRThRNDYv?=
 =?utf-8?B?T1BhOUQxRStXaS9nWk1rL2owR1p6ZFIrcmsvMFBHUDVyV0w1VCtIcC9KZ2hZ?=
 =?utf-8?B?Y3Z1REk5eThzcWJiQWlnUU5rNG5LejRBMzJvL0tMaHhBR2VmY1FIWjV5K1h4?=
 =?utf-8?B?OUdpbE0vWEtnQnRBbUtaWi92OVAxdk1hSjBUMk1nY3hNMTdiUUprOUl3TXFm?=
 =?utf-8?B?RGJXYm9HV3NVM1pZVUFuaHBQRklsVk5MNXI2TnVJK0xqVExHRSs1WWhTRnhJ?=
 =?utf-8?B?aUE1MFdxWkZ0TkpzNTBKS2VuRkw0N3lvZzEwQlI3dXlRc05iVWMzajVmNkIv?=
 =?utf-8?B?ZWZMZEVDckNodHpKemszR2UwYWhTa3p1UVNSVWJWMU9VZnZsbHlwT1l5OHRr?=
 =?utf-8?B?dVlpbVBseko2WCtmQTlVcFVYNE1sbXo2RTg1VmIzTlZSWktkOUl4RXpUencr?=
 =?utf-8?B?ZkFlZGxJMkFzZXpkZDRXR0RYR09NQkZFUm1Fa09wZ2NCTnNvNklQL1lMbHFj?=
 =?utf-8?B?WC8vQW1hcGJaSnBLOWRoNWNNWWlVbld4bUJnQ2lRSHo3UFdWaGduVjlQOUlj?=
 =?utf-8?B?Y2xPRmZFalJRVHk5S1lqeEtMcHYwZnVuM0s5WmQwaVNjLzU3andGWnBEbUhW?=
 =?utf-8?B?ZnVTdGZpNTZIbGFXYU1CZGxLTVFzUG9JcitRUW5CUWdtbWErK3JaOEs1Q2o2?=
 =?utf-8?B?L25oTUt6dkJ1cTlaR29jbGFDTG1tRjlFdW9ZRFNreC9SYkxKbnhkUnNDV0hr?=
 =?utf-8?B?c0RtWnB5V2krZEZsN1B0YStnb3NxaENyN0I0R1hGTzArQ0hCcjBvQzdzdHp5?=
 =?utf-8?B?UjBVSWYzSGxaSjk3bWNSRXM3NVdLUGRIdXk0ZXNxVVVvbUVCaTBHRXlaN3h1?=
 =?utf-8?B?WlZoQWl5bXZwa0RRem5hc2E3dE9hY1JaWkxDMnYwek1WQmtoZnl6cDcyUWcx?=
 =?utf-8?B?OWIrRmJNVDNEYk1SNm96Smo3TUx3N3AvQW9oZ0VSVGxVejdMMkorbVJuaFU4?=
 =?utf-8?B?cXF6b2NVYUZNSTRUMncwTy80aXk5b2kvOGd1U0VINGJDUXluSDF3NUVMTEta?=
 =?utf-8?B?aG9PTHBCZXdob2RkNHFYOE8wLzY0cC9pRUkxaHMyVXZOS3A5dUNNYmIzQThN?=
 =?utf-8?B?STVpSWs3RGpvajh3L3Yyb2pSWlM5d3QwMnJ3Z3d4TGowazI2Ukh3dkhKTm8r?=
 =?utf-8?B?R1cvcm02ZTNjaVd2RTFuSnFEVjJMdTV6V2Q1MDFTK1JpOW1zQmovZWlxS2VN?=
 =?utf-8?B?RnpvWlRnT0xkeDFEZWJBWThWaGNmUlI1VlEyRmc2Ym13NXphWlROUURjSjNG?=
 =?utf-8?B?Q1Brd2hDU3A4VFF3WHR0MjlMa3NzNjZ0ZGd2ZkEwaWJjS0puUktnVmRBVThQ?=
 =?utf-8?B?enhCaFkraS8zL284RUh6c1J1YkdOOXJnbGlsdlNmdG8wZDhMcDZsQlJRcThF?=
 =?utf-8?B?TVRJU1JkRlFhRE5HTVpZdy9jZEdJMkxidjdzWk1CWlplcHV0YXBKK3ZSU3A5?=
 =?utf-8?B?UFpHdmxSNlZMY3Q5YThxWE9YaW04bU1uODZBYUJ0RWYrUEllRjFXUUYvL2ZL?=
 =?utf-8?B?NUFyS2plNUo3WWh6RG9BQ1dUcHBDZDEzWWxKcjVrWUFqd1pVUWgzZEZaSjla?=
 =?utf-8?B?c05VTWxzWmh4ek1ZTEtPYjNFczg1eGh4ekl4RWgvem1kOXVrV2FxWEJ3K2Vm?=
 =?utf-8?B?cXR2RDIrbFJSaG9kbUZFN2lqdk9heDdTSGRFNStpZTd1aDdONHJtak5BUTNU?=
 =?utf-8?B?ZW11Z2VtS1djWVNvMUNFUk1rN2hBS3d1U1VsM01rL09zaUIrSHNCakFvd2NP?=
 =?utf-8?B?bE5IS1U4d253ZzNHWFZYVU5pVlVJOWp6V1kvMFREZnNCVm1hMXlqV09vS01i?=
 =?utf-8?B?RkRHWG93bHRqdXBEQzc0am4yb09GQVErc2QxL1QxSzVmeTl2My9zVFVjTmhh?=
 =?utf-8?B?NlhjTkpxdXN1NFFyeEExSHdnRzdjdVFYcjNLdVg1WE1DU0FkeEgySUpKY3Bn?=
 =?utf-8?B?OW1GdUtwL2FWdE1MZmd1Yi96TUlSa0s3bG9SNmtJUFJacXlhVmhYaC93K0c1?=
 =?utf-8?B?MnFtbTRWc1llTlE3d1kvQUdnKzdXNHg3b3RaekdnRUJsV2ZnWUZicU9VVWFT?=
 =?utf-8?B?UzdxcWc0Sm1WYlp3TVkwZ0s4S0kvVkMxRnI5YXJIdm5hNVNMY2ZWZz09?=
X-Exchange-RoutingPolicyChecked: pIsJ6c1k4ss299tYt51JolkmY8PU0TgX7bQWuf+hhd6YKtZstAVIKEfrFLRTeHqx9GuuUwZIrESuiwFHdvcP/na/LuBI4C8XRwx6tLI7Rp87UfrjPV4ookzsA6cUE5kjBm1odAx/4Qmfnr3ZXEONZKkUHApdNxMBMbFGRmV6u32yqhw95GBW/wT0E4+JFs0uoGeGTfZbWcphfAk48IVOJjs67Toli++MR7E+VctAC2rK31lS8NHtPCyqkVlpBvagilUWMQ2JZa18xFRKKGE4L3Z5k09mSG3hUFIooKc5STB1DDyA1Vl/23EQdfA3CtL6FJRM96wv6pHGg8hU0IxMBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c979a5-d888-46c5-f1e6-08df02b83dde
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:50:44.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UftHi4KzNDOf2TfJtOXQcSD9VcKqdQR97OwI7Fv7WVhg/w7PeAZfNfs51+nCjakKlkTUAA/pRwaEOK9xGdJXOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
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


On 25-08-2026 19:41, Riana Tauro wrote:
> SAF MHB errors are collected and classifed under Fabric error component
> by System controller. For SAF_MHB errors, if the cause is data
> payload parity error then log and return.
>
> For all other errors and causes, request a Secondary Bus Reset (SBR)
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
>   2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..586dc28a638a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_error_product *product = &arr->counter.product;
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
> +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
> +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> +					"SAF MHB error detected\n");
> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +	}
> +
> +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> +			  "Other errors detected\n");

I think this also should go under recoverable.

Thanks,
Badal

> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_DEVICE_MEMORY:
>   				action = handle_device_memory_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_FABRIC:
> +				action = handle_fabric_errors(xe, arr);
> +				break;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 99b2466e2062..73517fd0d415 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,10 @@
>   #define XE_RAS_NUM_ERROR_ARR			3
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +/* Bits 16-31 represent individual SAF MHB unit */
> +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
> +/* Fabric Data payload parity errors */
> +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
>   /* Device memory error categories */
>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>   #define XE_RAS_MEMORY_POISON			BIT(2)
