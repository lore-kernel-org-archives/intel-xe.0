Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60ADC43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 08:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CE410E25B;
	Mon,  6 Jul 2026 08:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKTfSbZo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728010E25B
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783327032; x=1814863032;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FVdAgrlF3klYOxzcXzXRHZEJFuylYy35gG/u2uV5Nzc=;
 b=FKTfSbZo68btwhjkd1uP9gxNinPg85xYeBrRSqeRwrXDIAhYlTN/lcip
 eJoX/Y1+7NubBP1ZRadbK3JA8ECk2PmfaPa7+/FONPBk/mzbAAv2DPyOl
 pIXIKNkF4yKH1hS/Fknfb0qebvrWbIad0qDfn0ms79uUwUEvqBR95S17x
 Nx2LASdmHmS5aUgzu2I4WvpWnSyORqdNFKLX1j9t9PRaGtdtcspCL25uD
 YuaCf6tHIOJh9ttSIqceChpkBXsVey9rFJ77nGROHxT1eqg03iFUXjV3/
 MZjRnGavIk+9vJYYt49RZbKnUHmQATxjDTls0vuSStIAFSw8QtfsCorRV A==;
X-CSE-ConnectionGUID: FMYwcg2AQcq8HT1NtC0n+Q==
X-CSE-MsgGUID: +9XjropWQvSNTwOTfrhMyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87870534"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="87870534"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:37:12 -0700
X-CSE-ConnectionGUID: pZ/68kTxTvCH3s8A2dfGow==
X-CSE-MsgGUID: UcbXEsF2QUOgDhXN09ss+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="253182646"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 01:37:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:37:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 01:37:11 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 01:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXE6QwKGQ+3vC2rnU8W+JOijE1h7WyDvCyMYZniNG+zI3arxcgEclwdj44I4kHIOyUwhep+VKjvlzqNyMcO+829KBjBfvUNEgiGJ3LOmGNiWKfTliRKCoPDX26fcTs+2tr6nKApdFOdYVMYfkGrvj5kpkbu2E//vsnVP65rCOai9crHWsMSNma1QkCBE/iMqBcQPJ8gLVq2ugCujT3M4N1uuEkygx7fCYzInMl+mmGLNMRtvwX0CMcKrm24e+9exUVOT6lpOFDGxALzp1PThooNy3FOYDjGE2IuxHBcKU3I2SbpCCafMUSyDL6XxOhwFfynZnFlsljvwHcTe1iGibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CBtvTMS9RmdAVjZw+al+E74TB5WsoVhuSfYRExsgWE=;
 b=kAumQPN8k1ijd11Wgb9yXc1ZiGmtGQCd4PP8ecc/869e0Tq1Fh3+tUtoe/3EDstrpvfx0uRs3pBiI4YGMFnWmOWTzoDioz7jVAu15N3g6Ig5EriuNYWpRR+SQOWMC9iDYSVSJZj29E9Ij+2MSroGnaRoUTlrwWflxY7XvEiNssk1xmDqM5v4LPUvx47fU6YwJlXwEbyt8smNHBXkhccCSJa/VEFFlbScJgjgMzhQkEToqGNDUltMG1u81Tr4lMCnp84Dgt4h5IrtPxfWNNIF9AgN4QwFE8kw0AiIThs6bCHPjcLTdox1UxAzPxuWQQ7hZDAS498afaoRaD8rsPglsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Mon, 6 Jul
 2026 08:37:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 08:37:07 +0000
Message-ID: <3684bbf3-e4c4-48f6-8f31-fcbd3f29e848@intel.com>
Date: Mon, 6 Jul 2026 14:06:57 +0530
User-Agent: Mozilla Thunderbird
From: "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [RFC PATCH v4 3/5] drm/xe: use xe_ras_log_wedged macro in
 xe_device_declare_wedged
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-10-mallesh.koujalagi@intel.com>
Content-Language: en-US
In-Reply-To: <20260630115503.407158-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9bcd5d-6bf5-4d73-214e-08dedb39c32d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|11063799006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: 0yhDoO0U7YVP+qn88kGl3MhYCVwKOMXWbqEzWPhXn1iNMWnCxnka9W+hZlgUHgfttoXsSkbxaAlrw1zdfeTmEHzO9PsEhPKJq+eG8L8+V5AlGPXoY0S4oulxoD2xEVqhVHXRhYY9pvtCxNxmu8e5uHuIZNrAbEN/c4qOjWCEom6i7WCldgup977eU7VFo8LDMX/mUiATaHhUU+dn6NWA+7kWk6kHE3qNDBbJq19oUO8Cs4QiLHr97kEuqgmvywNFsO1TNeEhCBYjdg1+XSdox7j0d1uhpYYgPSsYVwiPdJU7ny5RN45RrselzRjxVPIaA5fbOSN3+Q5pNjat7lhWuEbHnP8OX2cDoODkeCy3SnZj/2RPI7NDRHjk25EJjN9rIlq4/3Wx6L7ro/TezYPqRfYYJnUy8zhSYYSEOQuSK+gAmC7dGgi6RLfKabdSJYpiYnOSQGV1T8kxCddBdIXeHwyC4qe+XKWcUaI1zpQkZTTxIdZk094X3sJqO71w/tc746uk2aElROey11Sktemt/uSMv13As/aV0BXecMFA0fpL1kipfvZynp8HrNc6sL04vBU32XzXs/FT1QVr6mKhznpARFdI4nfJNbSMaGHBjao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ampnMk5Ka2lkaGJsRFNkdjBWcGZRaytneXoyVnFQdmdiQXVLajRyYWxmUzdL?=
 =?utf-8?B?VTdjM1dMQ2tQbmJvOW93aElJNVFmZmNPeUlqQmR3dzhXUDBsRVErYkszSHNF?=
 =?utf-8?B?V1JBZ21SY0pGYlhIbWZFKytZeENUemo4dVJOTTdUalR4amVtZllnNmo3djNq?=
 =?utf-8?B?dE1sL2s2aXJ2ZTNVcnVVczEzTEdkNXhwcWRnZzZ5NDRYY20zZUx0elhmdmU1?=
 =?utf-8?B?SUVGQi9FQUtaM0twbHptaU1Sa1ZMWEUyVGx4TXZnYjF4TkZIaUk2OU5mY1lv?=
 =?utf-8?B?NUJ4TDN4Q1Q0cTBhMEJPMzdHcTZibXVTSTg1amlRdHZyM2NYVUhUMTlzSUtK?=
 =?utf-8?B?c0Y5cXB5Rkx2M3l2TTNMNWlVTzljeitCVHlvNGtzWWRnZFV3VGE3ZldvQ3RF?=
 =?utf-8?B?dkpXSk93RkxNYUF4M1c4Vk51ckNOUjZOZXRoalp3WFdZQVdvOVg1dkVSbEZm?=
 =?utf-8?B?Z2ZUSzlpZndaOUtpRWZRbHU0b3Z3ME0wb3hacktNRFBNOGRNNVBJOStKc2NU?=
 =?utf-8?B?VWxUTDM3Q0JUTW9vRlpnc0ttalJuK0p5NkJmWmhOMzJYeXlGSFpPTkg0VFJn?=
 =?utf-8?B?NDhJcDVOUXJjSUN2TlM0RXgvQ0FjQ2xEMFk4d3pxcUFtTEdNLzNiS0x3cGxr?=
 =?utf-8?B?UjFmOXd0TC9Na1p1Y3d0Mmt6OERqWG9aMmdiMWFwZ2ZKU1ZVQnJ1dG9YRG1L?=
 =?utf-8?B?ZVhhRldwTlBSWGJBWDBjN2M3Vi9BOW9wY0pzcUh4ZXJuL3RnMEdsK1ZqaEgz?=
 =?utf-8?B?anJZNTE4WmVUWjhuQmk0cWtrMkN5MDZ6UEM1QjBwV0h2d0hTUm9vQ1JyRXN4?=
 =?utf-8?B?SCtVdkdQZ0hLUUJtZy9URytwSnU5WVpsUUZTcHJzSklTWUNJd2NOL2U3cnBp?=
 =?utf-8?B?bkYyUEFvQmtjQkh1dDQxQ0hkeXRmeEs3ek0zaHlqcHlia3ZUTW5HTDV4ZE8r?=
 =?utf-8?B?SE52bG5STHpDMTA4UGRZTGZLdzlaSHJycXRZdEtRZ01rdUZjRmdZc1N1VkNR?=
 =?utf-8?B?MkRnVW1ISVhtYXVORHM4UVhCRms2UjNIWWRjcDh1NEtWNkJYUThyd0ppM0Nj?=
 =?utf-8?B?ZE53MHArVVl3eHZkT3JWcHNBdUcwL3l0TWgvOVJPZnZNMXREeTFzdmJOTW9T?=
 =?utf-8?B?WFB5Kzc0Z2MzUFd3VURIVmVxTXE5bUJlRUNGM1pCODVveHBmamxub1hZMTRR?=
 =?utf-8?B?a3c4WFA1YythTGxORkZ3NHVJeVVOcnIwcEE3WU9Va3pMSG9UVE05VzJFR0wx?=
 =?utf-8?B?QURjQU1WV3JBSHVmamtGSmRMSmlmcmtXaEJGMzcxaVRpVmxIbVZTajNIVlJ1?=
 =?utf-8?B?NGxWWDZCRGxIQVhLbzhJbkFweGhmQjlZZGdSZm55UXI2WU5sZ2hGemJsODlr?=
 =?utf-8?B?WitrZkxGcHFiZ3VEK0k2UUk1S2s0d1VRYnFaa2N5QXVEVkhWcjZaa0c4T01l?=
 =?utf-8?B?Z2lYL3lNbXRUK3h1U0tJN0FQa001OWlyUjJnMFFCUjNHVTNaUVMzaWVtRmVJ?=
 =?utf-8?B?RnJoQ1RUajFRa3JmVmROc1I1d3dtaHhZNmJpVk9VUHpWTE0zb2hINkdBMFdT?=
 =?utf-8?B?N0dyZ1FxS2tSWWViVE5tYmxOL096RnZDd0FKVXZyR3pJaDV3bXc4b0VlS3pk?=
 =?utf-8?B?S3YvSzRIa0huelJLRkVvSitBWGZTVmVqZkhoeFFCUEVVRzYrTFQ3TnNqWnNE?=
 =?utf-8?B?MENsY0M5ZlMwa0Y0SU16SUdtbThEYkFsRDV2d3ZwNEM5d2I4UDRKaWVBNXhm?=
 =?utf-8?B?M1RoODdNbmJMbTREeWpuNmN2c3k3ZTVCbWV1MlZ2cFVLbHZaSGNMa2pKRTVr?=
 =?utf-8?B?eSt5b1BkaTVyL05PVDJuQU9PNklacjNxc3pjWU5EajF5a3BaWTBUUkhLdWlP?=
 =?utf-8?B?NWh5UStXUUhxNVJNTGhWL3dERHA2K0tjYjFtS1c3UCtJUnBRbUZrNWhCbUZD?=
 =?utf-8?B?NDJFR3E4bk5RYWhvcWx5UkEwQnVvczJEWkJYRm1TZ1hCbkdwUEIzNGtRcjJZ?=
 =?utf-8?B?aENET01hdGptc282K294UFRlTzltelFxWWZPOHRXK2VpdHUzK09qZjRnYU93?=
 =?utf-8?B?T3VrL0daUXdPbGFTVm5XTVplVUdldWVCMUYveEp3ZWR0Y2ZRREtpY2RlTVpr?=
 =?utf-8?B?KzRJeFpHSGJ3d2ZHTTI0UTUzS0xDaVZyWEp5TTI0b1h4VXNjYk1YUmlydy9a?=
 =?utf-8?B?U3lNQkh4Q0ErMjcrOHA0dTlBNjc0SDB0RkZmKzRoejRZR0xsZTBaZ0ZQbVB5?=
 =?utf-8?B?cWJmUWViVmQ2K0ZOUFVHVzZvZ291UGphZ3lpNmhVeENaVzhueUxNUVVQOUdI?=
 =?utf-8?B?NVBnRHZFYmpjQ1BkdFFVdVQzNGltbGNTSTE2dStWYW1qeWlkTlh3Zz09?=
X-Exchange-RoutingPolicyChecked: JbnnfDeRxZAdIZc+yNVkRgmSZkqr4hBqZyDiKazHL3uySeJz3FfrlJqh6XAqAp4MpOm2DV837oanhZWPfuiEZx6axSU/8aJLLC7djHK2TWzxCImOis3AQdj99Dt34dZEdaG8Sn3B8W5no8WfC7D4fdHvwFF7wvgx7d8tKZ5J2rKlXAR/KLwpDhIMXUiDaV9xwMdQuw1wz2NiXb6OevCss5tBwQcHCDDk/20XmSPSZ72g65O+geer/VIZCcof5hrz6z1Xifp1nE2KXp+VJ6Pg4/FSQxq5mmF2ENg1g/zp19Zm/lZbLNYIe/U8izR1fNE0QfZIGHHetUOmxDYfi6C2Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9bcd5d-6bf5-4d73-214e-08dedb39c32d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:37:07.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42Zy5jjipj5McOORWHyEXZqARk4UAVmP+hEOt56pl65Bj/ocY8kv3HJ8AmGeJ1Arnd5vpXrJ1I1EhHnZ0m5YDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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


On 30-06-2026 17:25, Mallesh Koujalagi wrote:
> Replace the open-coded drm_err() call with xe_ras_log_wedged()
> macro so that wedge events are reported through the unified
> RAS/SIG logging path with a consistent format, CPER severity,
> and errno.
>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
> v2:
> - Rebase.
>
> v3:
> - Update message in xe_ras_log_wedged().
>
> v4:
> - Replace XE_RAS_WEDGED to xe_ras_log_wedged. (Dnyaneshwar)
> ---
>   drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6e49309a99f..7538ac7c7dfb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_ras.h"
> +#include "xe_ras_log.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -1428,12 +1429,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>   		xe->needs_flr_on_fini = true;
>   		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer tohttps://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report athttps://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> +		xe_ras_log_wedged(xe, -EIO,

Error code is changed for wedged.
Please take a look at this patch [PATCH v2 1/2] drm/xe/guc: distinguish 
wedged from recoverable cancellation - Sk Anirban 
<https://lore.kernel.org/intel-xe/20260624194618.2793571-5-sk.anirban@intel.com/>

Thanks
Riana

> +				  "CRITICAL: Xe has declared device %s as wedged.\n"
> +				  "IOCTLs and executions are blocked.\n"
> +				  "For recovery procedure, refer tohttps://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> +				  "Please file a _new_ bug report athttps://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +				  dev_name(xe->drm.dev));
>   	}
>   
>   	for_each_gt(gt, xe, id)
