Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A11CCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 17:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E9D10E2E5;
	Wed, 29 Apr 2026 17:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHsN/19d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0F410E2E5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777485349; x=1809021349;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M+TnUeIp1sKdNg8yvMLuy2Q42PsCono4g8KeNcUL3PM=;
 b=iHsN/19duzGLwT6EA19mx6e/XRgvVNkGDwQbbNho+s4S2RyFGXHEnp4A
 SuJd103i6yYIBHq2v+/tfA14jXy+362aF1rGYWvCPt/0ttTggV0alRUHx
 2ze32hJtkne1u2bAIcY/sMf/oMq6Zbq693KoIY2gjueVu9VgFXLvquNWr
 QIq8IaRW5VJYq/K2HwhDG8iy49Z7oXUYWNmp6gdWrqEHjxMkLqgMQeO1U
 Et+EEIH/lnT1qx0yQAMxypoWtNJe+PUt/j2bfIUjGiMbc4KLOHzRUpr0B
 eOl93T8E3SvP1ifzm2Q/ajtt27YAJcPeTyLe0WluLAZngBfh6GlvY8EI9 g==;
X-CSE-ConnectionGUID: KdG73jR7QQGhfDRGhoAo1w==
X-CSE-MsgGUID: zlEZP51QR0uiFCPWVzFXfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65952929"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="65952929"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:55:48 -0700
X-CSE-ConnectionGUID: 1HT5296HT82Xsrttu8BQiw==
X-CSE-MsgGUID: SBWL2cK8RbSmmntMZGmZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233313248"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:55:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 10:55:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 10:55:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 10:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9vY+M955Gk0Ocn1kqrsuaJlEynHUwXZoRDDLUZLu+a4k5SvcEalTFMY/WVm9ZaRw0antVp9h4UaI9fak1EzAwkMkbHMR8O1twqzslDejdtT6WdvgMLuhIsBg0OlLgT808wETZcgdB0ZSqmDyYVMr52i1IA1qgBWllg4/L8NrCil9O2GZgO+rTvDvI1x7/Y8ekO6+wX80QMbEYKzlxf4grqraP3CZyjOeq5iyg1Hyv+7gAzqcoB4bKKMVZu26xQ9ci/G7YqSsoAkATzG4qRYlzXucsnTG8rLcy9urxz5LJana3N7CXe4swkef+nS39DKYnUa7SwTn7kHTwhmoIDYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQcxAUA5p8AyBPZgX587gknX4BaSnJdUj/hjc1APDz0=;
 b=WtWObyplyqjwqEY9MdxGAQ/9JEcAo8pxdUEWgl2u5SNMJ5CGMP9tFoqiFy7qh4TgmJsV830jBVU1Fy1P/0MgFjBgGyaW7PGKqPLP8lb7/lFhOhwArbj/ZFv51h3dwIvUmDhUJF1J9A74WS6/fcvvavI8RDwUTr+/CL15O+pJePekqq/V578P4mLkINuPjrqTWaRoVmxXHSSi+OE4cy3hcU+2kaRL9kSZKh1GNPZR+feSd/i3uews6EdtjgoPnuUxrKD4It3cW6x+XYRAjQ09Fxun6bIOveXawcvkj+K8V1D6wuAxpweGkq37YpCa0TA2QTlg2wiTPd52b+sxdmebSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) by
 DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Wed, 29 Apr 2026 17:55:44 +0000
Received: from DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::9e76:813f:9cf4:5c6d]) by DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::9e76:813f:9cf4:5c6d%6]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:55:44 +0000
Message-ID: <0262d258-7009-43a4-a42d-19dcbe8c8368@intel.com>
Date: Wed, 29 Apr 2026 10:55:42 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Test_GuC_v70=2E65=2E0_for_BMG=2C_LNL=2C_PTL_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260424203007.2370832-2-julia.filipchuk@intel.com>
 <177745592732.24138.4516161900844865883@5ab824fced77>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <177745592732.24138.4516161900844865883@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To DS0PR11MB7831.namprd11.prod.outlook.com
 (2603:10b6:8:de::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7831:EE_|DS0PR11MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7d7f9b-b001-468f-290d-08dea618891c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Ysza/S+TAeb2ybwDv/atLtT4b7yG/CWh3zuedoS6vFYMpFFbwVkw84FrK8R4PK1xduYUOgxIFozQ9jWDPEOPz/5qOK62EQxHbMqgKVMhoptmfZQziX41PUBeIkr1SJ6yuI0oM52loxOi+n3101LIgOFLmWNrAGNy+P1khh9NfepKiQu4rw1lEAJ11Q4eaVbmsmbcn3IUuPhcucBgSvF3JN0gcCtSflrk3ZQUG9SKBdKwfue5tiwvMA61bIYKVFQJUDC32Xp5UnTJcHvhdYTYDdylkgXAREbqKWt2CIdWc4aIIyjodayX3HNxCNqWnaM0IXikRDkjfL36f4uYJvNLlPpLGcR+ODwfvSl4kwH7hGlf2J/EUOcdmVll48ZZIT8nLTB8IGe4W1reWTBAJh8wW3quaaE9RW2oOjZQq6VkM+6hcBtUrRm9b9HXTpc50eTKAt8cCH3kCUUYLDoIkiURWdNfdpEXltuE3ARrzm59GYzyPMnvydsVhLgTlsNQdQTFelrfUCpsA3AZadnkGvRe+j1m6fipbotvYm8QzU1mgRSZTmTGbZZPBz5QT/mI1gx6/LeXJcHNrG9G47IakP8BM4d8iLXHHjp+pcY+Bj83uV98bV6Dk+pAhfx3gyfxq6Yk3weJi8rmW7d/j9P0hQmAl0sEw2FeROwXISQPW5r/cBIkmCCr0HLRthd2KClc5SuI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7831.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0Q3d0tFOXpJTWpQbGI5U3R3emx4MjlKSzl6V2czQVNOckJFbjlzdlhVcVZt?=
 =?utf-8?B?bytDMGxaUFhjRXpYOXYzeldmb3lWTEdvMmxnTnFXZnZxdk1wM2JCUUNNeUF1?=
 =?utf-8?B?eW0xOThSNkpla1FLTk1Ec2xpYjI5ZTR2UWZrTDhVNnpWLzlEeXdaNWt3U2Fy?=
 =?utf-8?B?Nmkvd3VIeCttNzVaR0p5bFRUQ2YyN0xacnlUOEhEcHA4WU1mYWZnVkZvSzZw?=
 =?utf-8?B?bERzTzF5WFQ4SVJXSCtBbTdpc0JXVHRTaVo2QW1BaUVXSWJVSUI1VHhkM3hB?=
 =?utf-8?B?RGNibGJaZmNJbzVGOXd0Myt1bzZCSEhvYXlPc3BQcTh5bEZyY3BPL0pQMWNH?=
 =?utf-8?B?eGF5dWNMOHNZcnpGSDBzaDhtdng0eWE3Vk9BVDl6QU5iUFVFaE1EdEh5ampi?=
 =?utf-8?B?NzZmVEtBQ3AzVTlJVlplSWZKc1N1b05OZXpOdkFlK0Y3Nm94TkJxaDg3R0wr?=
 =?utf-8?B?cjBTeEl4eDhhSGVueG5wRG0yQXhLV0RNVzlRQWQxYkl5NC9obHU3ZTlocWJl?=
 =?utf-8?B?OFlWK0I5QkFuZVJQVFBjdmlVK2FtTEE1cUxpKzhtTDZtQU5kcXRLblhSbGgz?=
 =?utf-8?B?RVhJWWIxZ2FyUXZ4ZXVKNVN4YUV5YzRFYzZMV3hOaXRITk1pdlpobDg2QXN3?=
 =?utf-8?B?VS9WU1l4dTFObXRhQjVNbGxJV1Z2c2orbWFueWdsQUFlSjlZbjBOL3QwRUdJ?=
 =?utf-8?B?T09kclRBWHpHaExmT3hsSmVtQ0g4UCtZMGs3cEtPQU5FQ2IvVWtyWEFHcGo4?=
 =?utf-8?B?WTdrclE2YnRQMEdkaVNjeHlnb29YUDBXcnRJZjdYMlZ3RGN1RjlHdTRUMUdt?=
 =?utf-8?B?UEhLZTVzWDJ1UnNPOFNheHBWTUNiSmNMd0dsOU1paVMzWDNEU3hxQXp5enR2?=
 =?utf-8?B?aThwMDZoME1SSHhMTVM4bUhCeUd1SlNFdWh6bExBYlUyN2hRZWZuNnlNVUN4?=
 =?utf-8?B?eVNUUXNERm9vaUFOcGVKRTV1V0F6MkdSUzRJM21SenVlcmczcllzSlpwMHVS?=
 =?utf-8?B?MXFMNnh3ZWx0TDBWbkFGcTRHbFBkTTRNdUk2UEZ5a0plTDQyTkR5dkFIMUQ4?=
 =?utf-8?B?dmRBV25kaG5OdXV1OHVxR0JPY3B0V0p6Y3BHS2tYMWErUUZ2cERoR29rMEVr?=
 =?utf-8?B?MXEyUmJJd25KdzNGUWJESnlnRkFVVnBSMU1tVlEzTnd6R0U4cTh0dUpwOHJI?=
 =?utf-8?B?cUJtZ2krMG1WM0V5bW04dnBuVk55c2hmODFLTnFnciswUXFGczhBaG95c1Na?=
 =?utf-8?B?cEtWR2xaRDdpbWFobUFwdE5sOHNVa1ZHM2NpL21wSm90SEhvSW5FOThvTGUv?=
 =?utf-8?B?MG1QV3UzcWxGMkpVSmdpNGZwSm9ORWhvTGp5eDdkZW16MHZEcWt2Rm5kWS8x?=
 =?utf-8?B?dkpJQzRITkh3ckdndnlXRjhSUktaV0lhVk1yRDQ2N1g5TW9ENDMwa2ROeXlx?=
 =?utf-8?B?M0VQbDM1aFFUUTg3NWtBUzlyT0ppcWkxSHBmVHV1aTVXMklGeExOVDRaUXN4?=
 =?utf-8?B?Z0tzbDR2RVUydWEwQUlEYkRSWk9MdmlEQVdxaVBtSUNMSTYrUi9LeGxCR2ZB?=
 =?utf-8?B?dEloR09vMjQwcExiekQ1RjdsbzE2SmlacXBzRzgybDRTSjdqK0tYWXBvcnVS?=
 =?utf-8?B?RGNRdHM3dXU5ci9WcDI3aXdzcXF5akZJTUNRRnhIUVI0RlV2RUVxd2ZCNW9a?=
 =?utf-8?B?Y0lTQURMeUNLK3cweWhVUWszWWJZd0EzZXp6OWRNTnlhV0tIMDluQWZrc0pS?=
 =?utf-8?B?Z0EvZFBtMkZ0Q0dnUEQ1MlY1ZmUyRHIrV2tmS252QUdqNTUzQUIvaWh0NG93?=
 =?utf-8?B?cnhNWDgySDlwbXhwWHkyREdLTEFNY2FNZEdrd2hWTDM1ZllNbWhvYUJ3V01n?=
 =?utf-8?B?V0FLeTQyeVQ2cWJQRDdqbi9NZVdYMHNMWmxLMzVoSGIySFppZlVLY2d1R0ZG?=
 =?utf-8?B?cXp3MU5NRDNONGxQOFVvVWRmd3JvcStRM0lZemtXRmk2OXhwdktGWlEyNnlp?=
 =?utf-8?B?RURKQ0NRcUNiS0lOMEtHSnBTaXBrdUpKM2F2Yk45bk03VHhTL3BnNk4rL3J2?=
 =?utf-8?B?WWtTbnM3ekJWMWdQSlB6OThSODhBSVBHMWpxR3d0QjJUNjVUTnRsR2o3ZmVv?=
 =?utf-8?B?WWc3bjBacGNsU3cwMzBoQ2lpMkNtK2dpZ01GUWFXeUdSSkl6Vm1IWHR1QlIy?=
 =?utf-8?B?czJWdjNTeG0yWitCY0ZQOVVQYmxlR3pBQlFhYVI0d2lrdldwendzeFB4cFNE?=
 =?utf-8?B?OUlIOHo1eTZQRlNFWkp4UWJrclRVWjZpZUNsVlZnd3dSSmVIdUNuNWlWazdG?=
 =?utf-8?B?c3hmZVM3M3BFZmFiVjlDMXBFQWlpb2xlWUg3djJtZEFSaE1CdmlybisxVkEz?=
 =?utf-8?Q?Rbt8RbBuzuticy94=3D?=
X-Exchange-RoutingPolicyChecked: jzLQBqN2xlWvT6XNwezkXpAL/U2JUGBDEvx6tDpdv2TBYHumzv7eE3e5rUXJk9MpEFPGyNjOS28JXtJLyaHhrKmS8EeeuxL5O79x7X0sGlhIoaM928DTcBAoC1W32ga5sOj9eYfFnq21Vkwce24H2/q2QOXxOHZOCiNe36xaIs2zuZzOSkPlZv9mtH1hVHZRpVNsnQvvNWED/rcrMF34bpdmlDHmYGmKc2tv+r0owp3f65kdx8VYTKSgaN/Oaf0lQdyC8C1o0cu/k3zHu34QSC3AJdesoqZL7TBP6zl2XWc58eBSl8MLPPpbp2V/Fqb2D0cdbJUM1qmhf1iCewlHKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7d7f9b-b001-468f-290d-08dea618891c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7831.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:55:44.4625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6Vcgxx0jFIs2qQhNxpuHYkKVnhkR2OILCPiWAi34tF6lAENDh4aQOhebExMYGvOb4Gtq9Ezk31AcuEOT/uYN892dkb4eOQ6F4Zx1RUmU8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8740
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

On 4/29/2026 2:45 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Test GuC v70.65.0 for BMG, LNL, PTL (rev3)
> URL   : https://patchwork.freedesktop.org/series/165457/
> State : failure
> 


> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +4 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v3/shard-bmg-1/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

NOTRUN -> SKIP transition not issue as these tests are not run on BMG hardware.

`Test requirement: intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)`


> 
>   * igt@xe_exec_reset@multi-queue-gt-reset:
>     - shard-lnl:          NOTRUN -> [SKIP][2] +13 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v3/shard-lnl-3/igt@xe_exec_reset@multi-queue-gt-reset.html

Same as above except on LNL.

`Test requirement: intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)`

> 
>   * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4946-e066eb26712bca7174e694a358351c50a38661d6/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165457v3/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

These failures unrelated to patch.


