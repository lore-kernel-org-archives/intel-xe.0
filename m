Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD9C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F1310ECA0;
	Wed, 26 Aug 2026 10:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjGJt8U8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BF710ECA0
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787740168; x=1819276168;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=/8lHdh7mnOYXBE4n8Qc5d3lAjAWA9nS2LykSp/LNSQY=;
 b=fjGJt8U8+m5RcWkqYz/psE+Zl0PEe3j9UmrwJuWA5fx6UHgXwwtBmKaD
 Kjw1fMsIy4QWX488OaUSLuqvuhQq1TfMtWURjekjbx8c91EO35p5Sxa/g
 3e3DFK2oZjwUtgotrqm2rLy9QUjW9ztbnxAhksnuhswD4fIF6ESPtkF9i
 /tmeg0BZxsypyA8iwtFYkIwZlPVSyMpoEvY49Ff+3q3nz/Y/8qMkRchtp
 2mJRJb+KH+blIChqTe/XDiDrfdrLV28/7DZpe+om2eBqnKESordk2NpO1
 I7o4w+mOiwi4FqnTn6I3j2/qQkd+NcyS/UFIivEL8qAho7fTp/UfQ1dYp g==;
X-CSE-ConnectionGUID: zPSSLZ/IRjajfDIbAawE4g==
X-CSE-MsgGUID: EMvm1uAxQSmq52Hhl7XPew==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98812661"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208,217";a="98812661"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:29:28 -0700
X-CSE-ConnectionGUID: Te/7MCSGSRa/z5FmmVTX6Q==
X-CSE-MsgGUID: qVEFG+TaS9iNBXhQBZUCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
 d="scan'208,217";a="261410845"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:29:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 03:29:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 03:29:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 03:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv6IP+E5oVboW2F6k4xUiITksp5DXnSSEu6khWI5EFahx3eJQWy3/LpZaWpVXJuxr3Bh/j2LT/4RtEZsrxDoNs53J2JdqE0W+Klp8ym3z3yFpCEEEtRziOOF8kup7wNOr5Fq8wY+QjUPq8VKsmBMFqMgbul0gTJIdZDVsY66k0DYSlrtEO9/4otMAPETx3KYTV6wZB5dd8c4DG5cPq/TruBYSXc8IM22Qky8nVKndwzGp6/5V5+09ilw/GGK0fBrj6QWpxBCw0m15Iwx727q0afrEHjW/IpXCKLjhR5MDclsYx9c4HsPhVzy0ZUThVXBE0IC3ViMpvg4kAFhA3kBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAbb9H3qjtlYgeSS8zgRn7IQ4/WCD8g+LUt/8+56Z3Q=;
 b=Ttq5xqN3de7m9PPAMfl+K118aQym/2aF7MoulCmkyOSGA9s4K6pWRySQ92PUZ38iH8MtWElhnstcD/fukdOnwePxtEh3lyXwKjpvjm2sK8+203MmX448lX5bzvUHTUe/3NXBveAoABG/ZkKN29bu5MPDIAGCXqHIvRr4RWaFjpuG56Ci+m0BBId0vDBu7n9YG9kdAdNJg5K8qS4LlnF1p74I83OJNeKTTOlQL8jxZjvzeEGuJrc9U2OjXFYZKxokLgnyFXxLicSL+kAj3OUTZgrkMyVa58ehIWsOSuks89cVEI41htfj2m/mO/tmd9FGUumm/2E2Ko3XihZeuQykzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPFCF54B2894.namprd11.prod.outlook.com (2603:10b6:518:1::d4e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 10:29:22 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 10:29:21 +0000
Content-Type: multipart/alternative;
 boundary="------------kIJyIMWCZTMLFTVh0MrLOu8y"
Message-ID: <f5ee9db3-824d-4d94-84d2-8dce7b45a689@intel.com>
Date: Wed, 26 Aug 2026 15:59:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPFCF54B2894:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fcbbbd-9642-4535-a576-08df035ce47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LX3LGmbi6vlrjqGhRYIUNUmrQB4Qsr2jmtgVqAx1hcHpMmKVZKHNbvloCJBj2Rr6ul3TeIThupDuW60aPp36Atb+3/91kIvilA1WO0Thz12QbhkOWSYtSE+tysw5Y0H7gCL951MK20KWL+aE5Ub+htjEBb9YNmzQM97c21IvzPBb5D2CE1/Y5qmK016E9zaSixjJuPbulO+duPYVv51Msz1wdPPwfgyIAAIgb89oY5k+9R2DUCnhXt5/lmfhfYozPk59V5f5Nm9lyQIGoDWYwJCeVkVEeS83EMkgWFVOYOuvBO8vDxuK0aegnWus9yYV6w5kNcjk0wog4ILbv2oU1ycZkYlMtldaiIPYbhap8Zx0rNajxoJAC3lOgVMELkxjI2llT7QYOQiRgiXHO+tDbaXdrcCDMI1V+y+4K8lcQQxj4UbnpbnANCvN2iutIO0gePkJZtchBSSTApaNB8eJ6b7iO6V5VpXcvPcqDyKD8MPH2vcGXyWp/X6Kg1TiKp94bLxZdMk01+W5pg8Ji5qwtq6kleDjNCIc4n7EA2UaHy1Cd3ycswQnXrC3aTTxNUf8bHhkPMyIE9rEoE/tj7tVE8Z0EvJNi4wFih4plRbvE9uqIW3x70D/XTOmLSLuqP2De3wVCZrMzU9TYw0+iwdNdpjsi1xvEtaZWjIX0IWoEg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVU4NFdTVGRrMVFKeG8vcDJkYXZrQWVrWFI3UnhMQ3FUMjZIOWZ3RHNqQTdl?=
 =?utf-8?B?dVlzaFpOUTFEVVpHUXQwaGQ0OC9ldi9zZ2lHVkNnVTdYRmNlOVdKc05BWjdi?=
 =?utf-8?B?VXJsdGdhWUdLWTFlQ01oRXV1MHJCc2pLVDNNU09Ma0QrdGRpcTBHZ1d6dEZC?=
 =?utf-8?B?SmFJT2FRMzY5emNQR0drZzdIc0svZVFqeWFGZDZxOWU0dEJpaGlwWEY0OHVQ?=
 =?utf-8?B?WWFxeC96bnhYOWF4REpzWEdHWFRQQ3dKc0I2dmIzUXdhMGNpNG1vTVlOdHNp?=
 =?utf-8?B?cUh1c3cvR2dsK256T0REc3poQUlJTU91N2cramQ3TnB1b243bHY0RnRDWDJU?=
 =?utf-8?B?bkQ3YWVPYVVrWkovd0lWNGQ5eUplT2V0T1lyWHRQbjN3RzZ3QzFFMXBsWTJE?=
 =?utf-8?B?UzJOZ1RmQVJORzBpZFdWQkREVnkzZUdPVVY1UjFkMi90VVdZOWlBTlBTeFha?=
 =?utf-8?B?eGxDWVJXam1zQmZBSGd3Y3Rvelkrd0pyZ3BESkZsbVU0TCt2STdvQzJCZ2VO?=
 =?utf-8?B?N01qZGF3bHlIaWs5bG82OGJ0U3I1Wm96U1JCTjV3ZStQODhDR2tEZFhhb0F0?=
 =?utf-8?B?UE9UTzdHTHVkU3hTcy8zNmg0QXFEVk9JTXltc09uWnh1SU9HejN2T2JiSm9Q?=
 =?utf-8?B?T1lZUW9DVmpEL1AwMXk1dlNlU2tvRUhJR3dwYi9KNVlOeXloSmxhNzVlYUEw?=
 =?utf-8?B?VHhDTlROZy9xRUFVa0RyOVA2QzJSbktEL2RRc2haS2pKMnUwb3A3anNDL1Z5?=
 =?utf-8?B?OTBMSkMycnlvNmpZd0Z0ZUNPSUhaRmcrb0Q5cXBKWGlDdnREbFpCUjgrQVJq?=
 =?utf-8?B?L3pMaGN6RFl2WW1iVWk4cUhtMnVybSsyTm04b09yc3lnVEt6NXRkUzVDZnFR?=
 =?utf-8?B?c0NpMzdsbkR3dGhkOCtPR2R0ellJYkxzOWNac0ZJbnMrVWpEWmtMNjZ4YlFR?=
 =?utf-8?B?YWd0ZWg4OGhCWU45cUdrRVdhQWlBZGg4eGgza1pzT28rMHhNMEhTejRJMkFy?=
 =?utf-8?B?WXJNOG1HYmhZUlN3UnkyZ2kvekFMN2I1QVhkdUVNR3JkT2NIRkxTVGJGbzJp?=
 =?utf-8?B?cjBiYUtlZS9EUU9OL3lSVk5ITFh6SmFkYnQ2SnJYaFZaeU1mVVg2OFNZQWlJ?=
 =?utf-8?B?WHJ3VDZBM014akRPU05YRWRyQUcyWWJEWjZQRU5rUDNKUzJjYmtLKzRyR1Bi?=
 =?utf-8?B?dStYcHU1R3Npa2t6bk1zSEVySUplb3ZUK1BpYzE1dEduMjJDdmp4R2RSN0tE?=
 =?utf-8?B?enMxYjJTU3MwaHRYVXQ0OHNPdTN2Z2VveVVPRGZjTTVhbWJabTQrZWp6Wkth?=
 =?utf-8?B?Q1I2SzNlbXcyMlFxTTUwZEhCdXR6Ky9hN3ZzMm05TDhXNnk5dUpUa1lXa01W?=
 =?utf-8?B?WlZ2MDIwc1JJSGhEM2dFa0pOWVc3RnZqVFZEdHQ1NUpFT01iN1FIemlBelBW?=
 =?utf-8?B?dUZ5bWRJN2pkWndWZ050ZFd5NjIyZ08vUGJ1Nk9sSkw0OEUvYVFidWFoaW8y?=
 =?utf-8?B?OGRlaFNtYlh0MFZ4M2R0QlhJUlVwZVJwVDFMVzh1azVFYWRCSHZQek54MEpw?=
 =?utf-8?B?Zlplck5POXQzZ08rUExsM0hNTk1KNVQ0ZTk5bUVMSWpnVTRVTnBVaWxnVXpS?=
 =?utf-8?B?a2dEM0I1SVNPOGh3L05QSUFueHg4ak9rZk1VSlJoSzJmTW5CdTRTUmpnRjRl?=
 =?utf-8?B?VFpOSnFna3FZNDJNWHZ6QkxlWjF2cVUzSU5xTDhTSDE0MGhpaFJkSTJNL0hr?=
 =?utf-8?B?UVMwc2ovRDNxUUVLaC8rNVlOK2FZa25pNWo3UWlhTlZSa1Zpek1wODh5OHdj?=
 =?utf-8?B?dnB1bnAzeEd2bXNjVlVaTFRibGJPUFRCZFVBaFhOems3L1k4NWdiSzd2ZE12?=
 =?utf-8?B?T1FBNEFhc0w5WXlEWUNieXJycTdoZGFjQmh6K2dIc1luVUFramJuMm94TEhx?=
 =?utf-8?B?Wm1Icm9TaGdsM0hLR2dHT2RaUmF2K3JPelRwMkwreVdKR3FWV1h4d1RLQXBD?=
 =?utf-8?B?dHlBdy9oR0JtQWpOUjE1YXNxSlQzNS9jSktoeDBnVDlPMWIvSTRIS1loRk1I?=
 =?utf-8?B?bUwrSVREdEdmU003VGcySG1RcS9DSXYyTS9FQW5UMHlyWWRvVDhMZlJWWnpr?=
 =?utf-8?B?MnF5eWdKa3VjUDJ1MGtPMVZrWXlnWUt2c1ozdDNwMmpIbzZmKzNndlRldmln?=
 =?utf-8?B?VGhwZFlPT1dma0FzUkpPbmFXa21PZW4zL3ZWVXp6OVJDaGxhajJRa280cXEx?=
 =?utf-8?B?UXJTMzBUWGwwVmdvdHBCODVMYW50b1loajA2c1J5L1V4ODdTSlE5dVdHeXh2?=
 =?utf-8?B?cDFWNXFTYVdXUGdWNFNBc1ZvTVdaeVBHdGkvb2hEMFpUcTRmUFpaam05L1NI?=
 =?utf-8?Q?+NPL/PB5rDODmQ1M=3D?=
X-Exchange-RoutingPolicyChecked: p9N3GoCfsjezBx7uHkClw8SjKo9HOvISUi22xAtEoElxWrCZ5HlMrLRwRE34b6Tv45f93x0/+4yls1HA18Qf5UXrYpNB2ZSsIrGS3eD7roUqkGqHneG1zxMRWrHoGD4HUDSogEsoZyWcsyHWFJk9R3OBGeDUqlrRCvHNCw8ViGfL52auBmJa96mHwrOPJplVUra8GSjPgNe4lXmU7xrpujfKJaJS0DWOn8KjFkWTQ5KSIBSnszKM6Hpbn6WKR5QB770oTcP7kjwA5oAycAXsweFVL+ErGVhPXhPydJImiA7pRwVdBV5kQeI5k3iP+KXBpjhZU1QklRbeNsIQFH+sag==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fcbbbd-9642-4535-a576-08df035ce47a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:29:21.8165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcU3r88fbkg5H1f60k6zcOyf7PiEqjNEjKUcWLQu8FoUgv0DA0CBlosuNWpc1h4msMkV+B5R7IPMRoq9kvwR2wZM+BINdFa+DtqH2QPbTkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCF54B2894
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

--------------kIJyIMWCZTMLFTVh0MrLOu8y
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
> Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
> tag for LMTT and MERT invalidation failures, preserving the SR-IOV
> prefix in the log message.
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 0c726eda9390..a9feeacbae55 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -14,6 +14,7 @@
>   #include "xe_bo.h"
>   #include "xe_tlb_inval.h"
>   #include "xe_lmtt.h"
> +#include "xe_log.h"
>   #include "xe_map.h"
>   #include "xe_mert.h"
>   #include "xe_mmio.h"
> @@ -302,14 +303,16 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>   
>   	err = lmtt_invalidate_hw(lmtt);
>   	if (err)
> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
> -				  ERR_PTR(err));
> +		xe_log_err(tile, LMTT, -EIO,  "%s invalidation failed (%pe)",
Use err as errno.
> +			   xe_sriov_printk_prefix(xe),
> +			   ERR_PTR(err));
nit: drop ERR_PTR(err.
>   
>   	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>   		err = xe_mert_invalidate_lmtt(xe);
>   		if (err)
> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
> -					  ERR_PTR(err));
> +			xe_log_err(tile, LMTT, -EIO,  "%s MERT invalidation failed (%pe)",
> +				   xe_sriov_printk_prefix(xe),
> +				   ERR_PTR(err));
ditto
>   	}
>   }
>   
--------------kIJyIMWCZTMLFTVh0MrLOu8y
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-08-2026 12:44 am, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
tag for LMTT and MERT invalidation failures, preserving the SR-IOV
prefix in the log message.

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0c726eda9390..a9feeacbae55 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -14,6 +14,7 @@
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_tlb_inval.h&quot;
 #include &quot;xe_lmtt.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mert.h&quot;
 #include &quot;xe_mmio.h&quot;
@@ -302,14 +303,16 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 
 	err = lmtt_invalidate_hw(lmtt);
 	if (err)
-		xe_tile_sriov_err(tile, &quot;LMTT invalidation failed (%pe)&quot;,
-				  ERR_PTR(err));
+		xe_log_err(tile, LMTT, -EIO,  &quot;%s invalidation failed (%pe)&quot;,</pre>
    </blockquote>
    Use err as errno.
    <blockquote type="cite" cite="mid:20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			   xe_sriov_printk_prefix(xe),
+			   ERR_PTR(err));</pre>
    </blockquote>
    nit: drop&nbsp;<span style="white-space: pre-wrap">ERR_PTR(err.</span>
    <blockquote type="cite" cite="mid:20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	if (xe_device_has_mert(xe) &amp;&amp; xe_tile_is_root(tile)) {
 		err = xe_mert_invalidate_lmtt(xe);
 		if (err)
-			xe_tile_sriov_err(tile, &quot;MERT LMTT invalidation failed (%pe)&quot;,
-					  ERR_PTR(err));
+			xe_log_err(tile, LMTT, -EIO,  &quot;%s MERT invalidation failed (%pe)&quot;,
+				   xe_sriov_printk_prefix(xe),
+				   ERR_PTR(err));</pre>
    </blockquote>
    ditto
    <blockquote type="cite" cite="mid:20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------kIJyIMWCZTMLFTVh0MrLOu8y--
