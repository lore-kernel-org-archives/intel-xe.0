Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630C0C982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 04:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F06210E06A;
	Wed, 23 Sep 2026 04:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiWqn++3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A540D10E06A
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 04:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790138562; x=1821674562;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TyDGLlulDRqTTSMQXQ3JKrdvcdgUeLlws61fzW7Y8HU=;
 b=IiWqn++3QoToli2NrGfZHqZcnC20conk5Ci9xGXwc7bYSsFJawoaR3Uv
 Xd8jzu3DIQAY/DFP0uG1KpJAsh3FmCmNb91ieA87RvRw4+S6Fmj0D+7lS
 ipp1VdsXlfi3KcsQ+CFVMcngiutEypnsDFJCH6JasYmrcgzH+9d10yHyV
 yvati/L1XisSKPK0zlLzyDL4K0JLf0VqGZmXmy+BeBQWyJL/3Ge1SuM2e
 7aWZhKl5kZXmp9BfoZNvCzm+qd5Z9U41BPi84akEa5Ckq7xHKLjf0LrF9
 tYVmOS128MQY1+nIowKth7/rZXFdnDh1w1kOFFz0dL7uphNxu75EDqt/0 Q==;
X-CSE-ConnectionGUID: s2GWT1DZSHul162+vpFIQA==
X-CSE-MsgGUID: MsSP45iGTKOni9Bqxjdz5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90912471"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="90912471"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 21:42:42 -0700
X-CSE-ConnectionGUID: lbQsOVNoQzyKtL5WEZr30Q==
X-CSE-MsgGUID: 7Ey0BS6dQIy9nxsX4UiHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="278189107"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 21:42:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 21:42:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 21:42:42 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 21:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e++FPFW5aGR6bH0n/jZ/DhihwRLdoyt1pkaZBVgDbzqYlk8qP5SeaAos5oSekaXqJzuUAX8/teK5fJ2XxA/YwBPm7c4myHkrkev852PhIvcdaHBrTlio6y7ksPn6xy7nLb3vtE3OSvwG0jtAdIhz05Ldn5KqHXt2bLU09D1b+Vit14FkywWoY5/IQkHrHoVOpig3xx3KTex+h83mb6mzKd8qccyECRDNC+iz+171/h0f/bo54Z/ZxUOu96zMc9grQ6hc7EZUNyTAoX2gNpAaiV6h4HWQ8V3fkwhbfUE1SmpJCcCcHCDgR7dnpZoBxFB0pLQVCOUT41nHp4DA4KfTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3VB6RqAGYHUJNrlOAK1gAqDEVmBdXCkKyhCrhS6nV4=;
 b=fTlC036yR/7+KOXlOAhVCLxVYnxX2/amz/HqcaMUIZ6L36WBgWr2832Y2DzQeDqkCHblVWw1SXbhZbXLr51MP5DWgJSlWauzvZRgCtWMaea9AGUkr9pgF8jUBpNVcXLJQqLKQUY5X9swx63w+2BSEQJVCh+S7G2o/yQn8U0Yr9vh7wwNZn4jWBNvk4glcjnjlYVy6ApGSBEhNKRxqpZ3CzDNt20dp6I7TyOsI2Hcckkw7wz2dq/ZYk6ePTxjq0EY7Dwae6ucIXaSfBXAnaQ5sdieJB+C8AKMWkskIauLL2yMHQnUEf0FIFfb29pW+05QtBuu5b9RqfC4A+d2GhQ3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.15; Wed, 23 Sep
 2026 04:42:37 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 04:42:37 +0000
Message-ID: <4cb5b0a6-8841-4553-9696-a14916af1580@intel.com>
Date: Wed, 23 Sep 2026 10:12:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] drm/xe/log: Add VRAM, PAT, and HWMON
 DRIVER_HARDWARE components
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-2-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260908104550.1283933-2-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0346.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 391f86df-02db-4689-95cf-08df192d1776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: Oa9NkMpGdRTe4juKijPPAXDZA5Rs3mwhcYUSwGJmsOosOcKrkfcpCaS3cst8i/w89Lwae/LWnXSGm+SSosAOm6JMvQtwl7JB/3vO+5pVEZdnYVSjXMhMDCi7tCVnhdZivFI+zedXw15THzr2KnC5F+i7SgpGu1Xrx2JYcJyfGz8FnlXMeqbFXHWkdo1nhrG2cjajrxkNoT9Ysq+sizUvy46kqWwSYDKDyGRrCaHXWGSusLgCvarmyr4l4PPxH4PC5RaL0F73iB5DsoHRq/vnVGknP8uXegN8KlCmjUgNVlLRa9utV75b3RPmx7JFM0BxgsNvyDagZg+qsapQ7l6BHnwX4viCVckGG1SdWur4pnTS8NMxPpOPSkjqvhv/QCbCZsHEY2iWQMQ+7xl3/eAsfhSRudZ9cl+luxudegP8cqjg/4goREVAGncu/ergUGdgfyQwQcWKzaE+a6HviYz+0yy4sw4NqdA7H7DhCpr/e4nXMLyozCjoO5XK7FHeYgVlWhpGcgFuje9wbdiXOaN++qnga4gLy+MOHHnCr1jux7E18lwHAwvYbTAhssvFsH9qfHfIgE3m5XC3xwvC1oaHQVwGbnBSvzI3FS/krSTbjDBRNbpdjvJ0sc06qQDmQcjoVALx0oMrrVYOg9tV2fCT/7EMh85DQCXX7Q2ZBGA9frQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVRxVSs1dTlNYjhuQlRmNldnRVU0akUxT3I1V085L1FyaFUweU9UZDg4bmpw?=
 =?utf-8?B?Q2IwdmhsbmZKY0lLYnpYN1FmSmRhRHZZeEJZblh0WXE5bnZOOHpYNE9xalpv?=
 =?utf-8?B?bmdsVzJkblBYZmxXMFRMZVJhQUE4dEEwV00wOW8yOUtQNkIrdlR5cDRadktH?=
 =?utf-8?B?M0xiTDVOSDRuS0hXUEZNSkZ2R0dmaHpPZHlVVVo4UVJOQys0VTIzMXNLRytT?=
 =?utf-8?B?cFQ3eC9PZXQzQ1ZRQjVvdFBpbHdkS2EwVnRNcngzQWE4ZVZhM3RsbVk2QzF0?=
 =?utf-8?B?VG1sTnJmcmFtVWltWHgzN1hBYUlwSDh2T0dNM3J4cFNLbE9MOWw2b2ZTb1Z1?=
 =?utf-8?B?YVBsYkNRTE9DM0dlRnYxcitVK2NiQXFyRFFTU3dpWDRNSVI5emlUdTRQN01H?=
 =?utf-8?B?amVxdmFab3UvMWhvVTZXV3VlSXVHcXNyREtrTGI5SzJPTUlVWEdDcWdFd0dQ?=
 =?utf-8?B?dXNYZWRobGRmUmdEYTNTUkFiRy9kWlJBUnJkMzE3Z3dvWWI5N1Bxcnh0eWpq?=
 =?utf-8?B?bWh5MDZkZjZEQzArV3VtYnNWWi8xdUVBSW1vd214NEtaSEZTY1BuR1RSazIz?=
 =?utf-8?B?VjBETW54RXdZWkpUN3BUcXdRQ0swODRUejUxRFErS0VMcGh5L0dRMEFkamhM?=
 =?utf-8?B?eW05ZG9YeUZOMHZsUTZPOHNIUFhoSnVWSjExU2Yzdm5oQUdaRVBRdGx0MGR1?=
 =?utf-8?B?Vmc2MVFoQnZlUXRNeVVwSnk5RUVOWWZDSW5nQlV5alJPSUw3ZUp2aS9WVGRB?=
 =?utf-8?B?TVlnbnNXQlRNeTRJd3NmNEdwQVYvcDR2Y1V3eW9paGRTd0NPUHZXVnhRMVpS?=
 =?utf-8?B?Y1VlWURmQWJ5THNDeTlFYkVSMU5xWTkyRXluVFRKRDJLb01vZGdGSm9aWVE1?=
 =?utf-8?B?c2E0T0pSWmFUMm45VVZYMmh4Tlp5SUUvblR4WWtrREpROVM4SzdBaUM0QlNP?=
 =?utf-8?B?cjhUMkFJOTJCaVFuTkEzVWUwa2l4MTk0WW1nTVdWY2JFQzdpbi9CaGJjMFlO?=
 =?utf-8?B?NEs3M25NUE02NjhaV3RsRXNZeklydE9oWW5Pazc3R3AySEpBNG9BSHBKRUVn?=
 =?utf-8?B?dC9PTWNqSnBRSUFTUmlzemkxL1krb3l6UWdkS21GeVJua0h4QUdaMDl2ZUZC?=
 =?utf-8?B?Z2NhQVhrVkdUMmJ6S0ZiYlJaWWFpVEJ0MGh6UXc0czFwdTV1OE5USzMvNHhn?=
 =?utf-8?B?QXdyUy9DOVlJWmV1cFpSZWxBdnJtYUh2N1JyZEZwd0YrL1ZHbzBtTVp5RnFM?=
 =?utf-8?B?ekkrNk9NWnR4dGlNekFER0ZHZUd2N0JnZlArMW1zaDBqK1Yzd2RUbXNhSzVy?=
 =?utf-8?B?ZEk1V0FOR0I5cXNUaUVGbVBoSDR4THhiblFDc3lmdi9pQlIwVTRqVm5iY2hF?=
 =?utf-8?B?VDJ0MTM4QXpESEE0d0JqMHBxd3ovejNDOGdLak1OVEpCejQ4eGw1RTlndjRr?=
 =?utf-8?B?M0NJSWIyNHVmSnVjYzduK3F4MVNzYnhBaVN1NzlEQnFyU29sMkVGZjBic3N4?=
 =?utf-8?B?aHRwOC8yNU5qZTBrU0w3MkgzVU92Z3JZUUtFcDFRRmFqZ0lyV0s4eTV4bkNO?=
 =?utf-8?B?UVI1NFF5T2NGMzNCZllETXl3WVN5dkM4MkE5OXJPK0ptWnNpSm9JRElhaG9y?=
 =?utf-8?B?aWM5VVVQc2ZreC94SUpkMTdEMTJVVzVZWmJzM20rQkprN2hUZDVxTmFnUUEw?=
 =?utf-8?B?MXl2cDMrRi9wK1FGQU5ZWG9OeEZYNjZQM1JZTEZmRHpOWmJPYXdDWEhWWEJp?=
 =?utf-8?B?d2p1dzhPc1h6MmgvYjJadEpxck9kYkR6N0NkVkUxd0UveisraXlyTndJSFZn?=
 =?utf-8?B?WG04Z2xJcHJzTCsvZHhCamxxVkVRNG5MK1FUd3dhYkcydEZoUnFUcUNSMVdT?=
 =?utf-8?B?V1E3cHUvZS81RC9yRmZNT2tvd1ovVCtRN2pSVllKQ3JoQXdsUTBjNlZhQWxu?=
 =?utf-8?B?Y1lMVUZxVmFOUUlMZ3J2Q0lSZDBESFBMdGNaVDB6aXBiL0gzZzE4S0RRK1pH?=
 =?utf-8?B?WktXdUFvYnJDZGIyN1ZNbCtNc2Y1V1FNRXVwNzV6SzlGQ1BoWWxJVXB1SnZt?=
 =?utf-8?B?YVVHdHRHSGFKOU11RGhSQ0xKb0ltM0ZUcmpzL1MvS3lxa1lFbU50dHdxeDZY?=
 =?utf-8?B?RHRVaW43NDlXdXFXRjE5UzRTWVB4b2hjMVlaTFNxVVYvTEswZC9zZ2I1NHhO?=
 =?utf-8?B?NTRHbUVaNGJZNENhOWhYRDkvd3ZvTVFiU0dPSGxJZ29LdXB6WDV1VVExYWd1?=
 =?utf-8?B?ODAxWmRGaEdQMUpTN1lKTkg2eG14SDhUUmZUMVpJcVM2d2hBRllPYitxTGpv?=
 =?utf-8?B?WkVrSDZ0cHZkcWU5ODNRRWNRVVdKWUtlVi9NcldYditBTzludjA0MmhFVmhr?=
 =?utf-8?Q?idoJxxHbA6ysouL0=3D?=
X-Exchange-RoutingPolicyChecked: vG1qM6CPIMG/JgiKhPGIwUs7lS3bPAEzZZ4877APaHoB7/ozvQSWUvwp1SGVxQUXaYpi5fnxr4fZ6+LJXTEvom0UHc/0yt5vJ/VhiyuhSzchLhZAHY+i0EsvKnwchru4sx5JVZ0pnP9OKBf5a5wcjKydswqb+fXSltg9O/mhTqsK+wgCEYhF3QMEhbuzb8NzyM9elqvZaFU63zYsxJ0wSloANJkstLg8oPijWQkxjGiSTX6Wn52nLTC06UWw9cVvRZq5pXiCGlt4DMUfgFlgTshiMQt2pO1xnnTgfL4slc5EpIVg9XO3I3mbsyM66uMnUxbYhjN42JbkD393IwKnkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 391f86df-02db-4689-95cf-08df192d1776
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 04:42:36.9446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15yrTEFZYIN/9gflcJgZ5v7abE6Zrx23fWkVGTYq6fGNn/3R5aUlOz0Lk6FXYch27uVN52Ar5nmCY3qFQsmQEe8xcp/FRf297+VVxkUC6as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
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


On 08-09-2026 04:15 pm, Dnyaneshwar Bhadane wrote:
> Register new DRIVER_HARDWARE log components for hardware I/O subsystems
> that currently lack structured error reporting:
>
>    - VRAM (ID 6): Virtual RAM access and BAR visibility errors
>    - PAT (ID 7): Page Attribute Table programming errors
>    - HWMON (ID 8): Hardware monitor registration and sensor errors
>
> All three use IO_BUS as their default SIGID since they interact with
> hardware through MMIO or PCode register paths.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> ---
>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> index d6105520173e..4a60aa48fab1 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -150,6 +150,9 @@ enum xe_log_location_bits {
>   	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
>   	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
>   	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
> +	define(DRIVER_HARDWARE, 6, VRAM, IO_BUS, "Virtual RAM")			\
> +	define(DRIVER_HARDWARE, 7, PAT, IO_BUS, "Page Attribute Table")		\
> +	define(DRIVER_HARDWARE, 8, HWMON, IO_BUS, "Hardware Monitoring")	\
>   	/* */									\
>   	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
>   	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
