Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DFACA6015
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 06:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9930E10FE93;
	Fri,  9 Oct 2026 06:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzWAUd2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E01C10FE93
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791526361; x=1823062361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTDKDrqweqfo+Mtd1lGKz/SlYledd/iZRPcyAc5jwZ8=;
 b=NzWAUd2hhpLbL1hH5cSTkih9PX841num3x5ikTsdA7j3EY5hcEPXzmSX
 tgzTWPVwt3W/+cHWQEoDr/qDXm5WFCODDvMjnS5QVFHgiLei0pylQCiaU
 inQ7ppGw1MEtLKKinMc5YUEwTVmDItbwH0wYOTe/sI7RmR+z34ofTRc4f
 150Ipy2S79/kLklaJE4UmaKXhoG5TDO2ZjnWxgtv4Ds7nBxSZpfsH+O/0
 dikR4qKXmqRvZnArPl/b1091vvOLJm01FXk4Gbpno8/EDoP1k0j7rtNHz
 prJdeA7tHmOP5gpRAtM7fBV31ye5G2sTn9alvhXk1EM0HskA9gIbuq7mh g==;
X-CSE-ConnectionGUID: 9w0LDfdpQ6+VVoBxcMOwvw==
X-CSE-MsgGUID: m4J/bn3DQniBPVT8QacZ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="320649"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="320649"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:12:41 -0700
X-CSE-ConnectionGUID: suuHLykkTi2/lvLVjATzuw==
X-CSE-MsgGUID: aaTblDqwQCKy9rNgyQ4NOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="557221"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:12:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:12:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:12:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QG9pmykH+5CinyJrHatiaP8FSALsP4oLl1q7998JzCoDfB3YUkKMjUpvuAkVEqwdphQNx9WC65cd8eqDMJHwoJfxHolqLOksd+n1qW5tbF2EagpRAvTZuKyrUd8iquYFXQJWsn5Ef5335A/JDiOi7xdev1HFUFK12RS9znpnxxDufKFgImHgu3Ml35LYdQKj88UUBKErKgoMh1KukYKkxOvkA/lO61imtFDKhwSg+Set+lVERrXSlbaPwArQreDEe+ii/ukTo/sVasZp0wXlWUQngCuexZWGo8mNgw2wpjmKq0oshigZZfPbdo7tSoBpXLMWMfDobho1lHbpH3hDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td3JwjDrnhq1N7wP7wnO4zjVT/PMxMuppLUP9AKl/AQ=;
 b=bg4ZbTsX6iEQl/TyVhHZicK6NttI2+cmsCpf+P1/B9uPEeyf9LO64ZL8wwVQLAimyblpHPj4+QguHh/wpPgEAFecfvsH1RJWfRpt2+8tO+wxdaXmy4XGArKqzX0mwjXwIHfB0qvj57Vz2mgXErV5DMCwznO8Oxbx2aWc1nMKi+XT9lchRXKastZthWahe+Q8+W1jTaYoE4ZCfBFT33YuCBac8lcC4uxzcaWc6PPlWbogAMt2IapY9arOx/odHPURg60gwqzUiVmahb3pblq/mBf05oF0o4YT3HlnKvHeJYsUc/cFlBavEI6X1dzHjPAZUXPsEXngCnDT4fZw2GIMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LVUPR11MB9811.namprd11.prod.outlook.com (2603:10b6:408:39c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:12:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 06:12:32 +0000
Message-ID: <52b5b9d3-56f5-4722-84a9-7089810c88a0@intel.com>
Date: Fri, 9 Oct 2026 11:42:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] drm/xe/xe_ras: Report soc internal errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-24-badal.nilawar@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260906172604.2215987-24-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LVUPR11MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 246940a1-9037-462e-1ca6-08df25cc4dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: hQKoFOrA6TG1fgbbwNeDIFvoGkK3o++a7r27QuACkvQKB5MgaKb0+YKzvI8cOeyEsischjg6SolHOCrcopirPd3qaIHAAVhyZnPMgeoxyvnw7Te5VJi7NxBKJESESG/X3BpYOHbZjL61mVCvnOLDUpWm+RNwTq/HvvFZoeHxXnWfuAvmtN5NeJdyGDKoROuQ8kH1SKiAvQGw4E5KeNpRqKEy3QE6GoffSOUjmymfpysJhCt+gyaoyyNVRtAynpZ/F6J8jRf9VpIbG50OlII/3OWEB9kfSE3z3y00wSG/rm6fBJB3cN3GkWYv2phC9N9clzJpFf7wNkzI3ySntZbYwgsYwN1ESRKGh9Mrlpio5p6/NYDYYbRncRsruT4x5xsXFtbKjlduRA5bqJbecn2+tLG9OfBvySal73ql0hQqbXfSph/BCNOz0D3A2G6hM7UGEgoVnnvMScDqV+c+rLsYj55M77eEUD30YrvBe+aYVl7UsxBdzbp5jlYnfRgv4oHuosIjB3c66AAxmJ0iHDrENA2hGUFa8X/2iOE0xvM40CIXLEj/lOAqy4ar863Ovng8zZrQDzL3NTlIpmKkOjLdFJuCsK/tfmDBQOd/qxUYS2S8hvMaP9EcyuQOX7kLL09losVWbADaSQjyElIGXkkccWJWuC8M10FlG1X6XUOFGi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWV0NHlzY2Q0Z0krZDE3d0ZPU0tHTnlXODVlL2FiUjlDYmc2QnZMdGZHcXNK?=
 =?utf-8?B?T094WnhRNjlPNksxOC80QlV4SjN6Vm9qdnVLaFZQODFQQ3R5TEZKT2YwcFh0?=
 =?utf-8?B?bHJibmNQb2xmbHZISWcxRkdRS3d4V1psOCsvaE1lUm9QSmNSTkVKb0tIcTk4?=
 =?utf-8?B?bkNITjFJa2tZK1VxMVhlakRMY2d1c0JmWHB1ZDd0OFFBRmxETnIrTUt1Y0Qz?=
 =?utf-8?B?MnJYUjBoZFlqalViTW9LY1pMVmNXeVpobjNibUFld0lSYnN3SlZBZmtLY2ZP?=
 =?utf-8?B?RTF2VUtZNEorWHVUcEpjNmVJZTQyOEdoMGhmamErYUFiektOQVpmc2lJRGhT?=
 =?utf-8?B?RlFqM0EvK1dUZFVQRWZ5NFFReFpZUW5jT3Zwa2EwSUtiYTlkSVFCYU9jUjhB?=
 =?utf-8?B?MmhOd2tSZThPQVF4cW9aSVNaNGdURStKNTE3UmZhRERwdERpUElleG4yRHhs?=
 =?utf-8?B?RHM4RDgxY2pjbXRTR0JpTVpFOVBGTGVrVE5ndnZFQkplR2VuSWlvZ1JyWUVw?=
 =?utf-8?B?M3FGdDlNZnNBWTJtaHlIVUFWU2htZThNK2JveGVRdHgyaHBOTjBwTVRxUi9B?=
 =?utf-8?B?cmdVWEdFMi9yaTdoRU1RL3U5ZTZ0c01qcWU4QTk5amdGZC9zQ3ZqbzlxMG1K?=
 =?utf-8?B?MmZXZHorWDhXbEc4dkRlak4xNzBaVTRCZFRuS0JuZzR0K2Mzci8yUDhyMkJi?=
 =?utf-8?B?ZW1Qb2M5MDRBZVRYMjF0dGdOcEt0azlxQVR0TVcwckVPaXh6V1c1U0lLbTVs?=
 =?utf-8?B?NjFYNVVXK1VrR3lQa1FaYVlUQUQ5S1RQZG0vYXlYTjlxeDVkZUFZeXJlSDZs?=
 =?utf-8?B?V0ZJWUJLTENpQWN4Y0ozcEdaVExVRTZrNG9vVHNiUG9saDBXN0I3NUg3QW0r?=
 =?utf-8?B?UGtoMkwzeFNhVWxTNE9uSjUxcDY4cjJnRzIyVEVRa2dtYkNIdklWSWVNY1VJ?=
 =?utf-8?B?Q3AxbzF2bzFYMkxBZzhDeUtyWGFUNllsbFVqcE81eGovalBjR3lCODZOMGpT?=
 =?utf-8?B?Q0h0V0NGbFBBbDRLYnhhcEl2cVN1a0srdVNSQnVLOHhFTldad3JOeTB6SHNL?=
 =?utf-8?B?YzhpWHFjUDdnMlpobW83S1M2WGd0WCtyYVhGQktHb2wwS0Uvcng2OHFGVWE3?=
 =?utf-8?B?QjVRMVljejRzT0Iyek5DeUQwUDBURXIvSHR5ZUMvV0lwU2lkWnk1ZlJBczh2?=
 =?utf-8?B?ZTZnZ3lIM0NMNjhOaDd1ZE9DODFZcGxwak5aL3dPQzYzR3d6Y3NnRmR3UVVJ?=
 =?utf-8?B?Mi9BUHNjUUNqdEhJTXA0akZtUGpCZDVZSkR1aml0VEdOU2FSSHJvc0pXSzYz?=
 =?utf-8?B?d3NoSERmK0R6QzFIaTF3T0g0Q0tobUx1amF1MGpnanV1WXhOY25NOUJua0U3?=
 =?utf-8?B?a2dzNUxBY05hWDN0ZW0vSWk4ZEN3WHZjS0w1RDBmQlpIbUx1RWYwcFJJTFdI?=
 =?utf-8?B?cG03cXBOTXpOWTg2NmY1eEJKa3NHdExCYmhzTG5jTE5EdjFjTVU2cm42ZmJi?=
 =?utf-8?B?OVJIeTRnQ2dHNmc4UXRpeUYyckZxZjZrUWNNcXZyTTJDc0twZEY3c3NYa0dJ?=
 =?utf-8?B?ZGxaSndIMU5HL0xVL0FJYjc0RDNodjlaMndTNE92QS9FeG5ZWFFkdWl1Y09V?=
 =?utf-8?B?QmMvaGRsNFlKQldqaUNJeUY2RytnbWQ5MlBrS1B5M2w0VVlaSHNoRjJ2aGd0?=
 =?utf-8?B?QmJHb0tKS212a21ZQzJFQ1hNcXRKWFdVQVFxemdwa3JVMDYzMlhtcTlrVU5q?=
 =?utf-8?B?TFptYWdkK25zYVZMOFpESnk1TXd0bjUxZEdaWld6OFNxREk0R29Eb0l4VHI1?=
 =?utf-8?B?R0VZUlpTd21tRTlGanhrdU5Bclg1ZGhvbXdLZWlyNGdJWmV2MVAwTWNxYVdI?=
 =?utf-8?B?ZkhDOHZsblRYbnNtQXcvR0ZYUzF4UkplN1lncy9Ha1lLWWRUTFZXTzhLNG43?=
 =?utf-8?B?UE1lT3UvVDRoSmI3MkRwSmFMT2gzQ3JyV1BuU3M2cmdOTCtMWXd1YWo4dGd3?=
 =?utf-8?B?SVpyTjczQzhmYTZDR1JUbXFZR0FmSFdIaEV2QWk4cjJUMEllTGdxT3BCUWlP?=
 =?utf-8?B?UVl3MWFOSTZ4eEJ6dE45ME9pN2pXRTFYaDdpTGRhMVFESGpwYzRIRFZoQTVq?=
 =?utf-8?B?WE9Lb0FBRFQ5T2JWbUJvUktTNG91YlpiSG5OLzhJUUQvcmY0NC9rVlBVWStv?=
 =?utf-8?B?d1pSbm9RVlIyVFJFajBpaU5oTkpZbWpJODhqVndkMk9Cd1NXbVN3U3hINWM5?=
 =?utf-8?B?RG8rYUVRb3lhZFJiZFNTbUt2MStKYkRYQ05OdjBEOWlKUzQ3eTJCY1dLa2dJ?=
 =?utf-8?B?S29QMDJDRTJ2STNnajBsd2E4eXJ0aXFZWFJYREgyb0p1SWpxZHQvdz09?=
X-Exchange-RoutingPolicyChecked: opuVcK4n316punS+GlJxyS5v8OytQMKX2MWkxzG6k+hiTtmxuPa2510N4SuT8kii+1uRSsyOseIgNICqwy09XOVFt7GIW1T4D/uZEeyVtUSKfyjn3+9b/b76j/aCxN4ozK8EGar9KVz3xMkykViHAMtvCkOT8YfERwKgdAaT10QN1XJp3T86Py4WujSvZ1TRR8STDXbNt8fjsJ8jP9t0s5hZhO/ISG7rQPWcMfYNpNtdsTiBHNGK/q25KjgzpQUdwkkmCC3/5bvon0v+w3TGN3V49HvCtBVO/UpLNlKAdBAzy8DpD2Yy/+SZIh1YA/bh7t0eoDQUKx2KOElD0aRNhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 246940a1-9037-462e-1ca6-08df25cc4dc5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:12:32.2411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyBhRtOYbtyficX2wZMPVZACSurD5cqAIfss9cHLcYFM1YQIK9dUb+/DRoPWJa6lPXLxwXnjr003kQ7jG5Fr5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9811
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


On 06-09-2026 22:56, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: Fix indentation
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 78ea5e33e244..e93a989fc8f6 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -344,7 +344,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   {
>   	struct xe_ras_soc_error *info = (void *)arr->details;
>   	struct xe_ras_soc_error_source *source = &info->source;
> -	struct xe_ras_error_class *counter = &arr->counter;
>   

We should still have a print for other errors too.

Thanks
Riana

>   	if (source->csc) {
>   		struct xe_ras_csc_error *csc_error = (void *)info->details;
> @@ -358,9 +357,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		 * is required.
>   		 */
>   		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "CSC error detected: 0x%x\n", csc_error->hec_fw_error);
>   			xe_survivability_mode_runtime_enable(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
> @@ -368,9 +366,9 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
>   
>   		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> -			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       ieh_error->global_error_status);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "PUNIT error detected: 0x%x\n",
> +					   ieh_error->global_error_status);
>   			punit_error_handler(xe);
>   			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>   		}
