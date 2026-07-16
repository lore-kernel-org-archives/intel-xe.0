Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E484AC4450E
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 11:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAB110E771;
	Thu, 16 Jul 2026 11:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUL+kaAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB2E10E771
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784201921; x=1815737921;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=20M9wzV/RCpa3yefSojlwALRl6V05Pk/PlK6u9lr0Vk=;
 b=dUL+kaAyy/SjwWtcQCa+4iywwEkClO9posOM/7HAkH+hO29u0URejMcU
 EBhsXujHr7frCzY9fVZGFI/pczbFCV8IPqOmcsdsw58IsPu+ypwFnP9Hn
 QqcGqrpkN7P2I1K5tK9b0Kaw+uGOfKTQeUNJu3Ws3TBC+a2qI/iAn8Y+L
 iiJX1m2r6q9JsgScVJvFNeNsdMZZwZw2FnnnICHoB0bHl09txi9Op7/pw
 v0GgVHt2sYkTEUHj9e52UcR6umAZ/jUPA/SRsdf9lYCuCKI5Qyz5jFkzQ
 UzaccuJ8sYWnWRTqXSbqYvkUEyNzKmV4Bwx6zVVuaBgzeoVZrEU0tesDl A==;
X-CSE-ConnectionGUID: SEODcR1LS8KfKLH5F3CBLA==
X-CSE-MsgGUID: JtXb6tbOSV2kpaXwqlhs4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110404608"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="110404608"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 04:38:40 -0700
X-CSE-ConnectionGUID: O+fSMuFnQKCG6Baj1uC2Yg==
X-CSE-MsgGUID: yiokaBrNTFmnlvyEfTqbLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="252497392"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 04:38:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 04:38:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 04:38:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 04:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JldDDx7NNSsyru4v2vUJeSfNYOPT/xaL+gPnEeNXPWC7Zi4LHdI1yIwaOoKFxXhTel8ka4dtUFNAG/NKPYDDQDSQX2RkhcvtRbR9d3kv8mxJg83ZTAquD/wll9AatV7B+y4tt99kDBt4+q1U/Dld/ErWRZHEp8TRi/PSx58z9gUcYVVDcSgudSpq08Zt9PJ+5VQVisJXfEmBRn7ClqI0rfMUY1C8H3Uk4bJWXNR438wkizfmbft4SY4x90WX+zhdrukptaX71XDlss6yINDCHC0TBVW2qvBQJJP+4GdqJUOV0ZnNeaMnpuyEs0ZXZze2GM/wjnZT4lKP7zO6CtQnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esk3E3DYLpIBcM9pdAwLX7aVzBQqss87c/mJ0Yt11TU=;
 b=v83pF8bVuiUUwj/mrY4gB+KxGYBjboQRif1zClBp7x/satO/RS5NWAkvCTs0KjwL3hqqQ+7WKudW/42HjnPDIAlhz/FyvQ52lVgTZFetXTwGQ7mpLE7m95khetYgLT7HlJStySABpB2nXIZNuPbcg00HoiFbJ3QjpV0UWMCfOESqkunlp6PlitRM5IwWIrwROeD8rE+dzF3p2m4ys21AL/S6A+s6KqvqjFQhNNysiw1bR7eIuDj7etPBAbjODI+UIesCRmi3aoKP9MrkT1rcxzh4DXDFxehLUhMXyXlBpfu3oz/l3pX6bL0U6CG3d7QMomb4BED9Qn8zizCbKw+BAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH0PR11MB8191.namprd11.prod.outlook.com
 (2603:10b6:610:181::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 11:38:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0181.017; Thu, 16 Jul 2026
 11:38:37 +0000
Message-ID: <ed14b6f0-38e2-4318-acd8-732ba11313e9@intel.com>
Date: Thu, 16 Jul 2026 17:08:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum
 page-size sizing
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
 <20260714105538.170849-12-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
In-Reply-To: <20260714105538.170849-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH0PR11MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef07e1c-ef0f-48cb-4a58-08dee32ec693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|6133799003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: LDOWPpeqrTaz1U+FR59Ybbr0JPTF+R/OdjjbolgoyJXgK0MqGhfWWEwz10Yw2xk2kN0P5knCad8hHRGCe4kebMwehsneGyRjtrzm8iogxzdVGEm8MTh05sUMgmWz9tq2azWt3EMScaINmYZxXRLtXk+SwcNYHjWOd3OPmw7qiOQQf5779TQ2rOhCNwwpULX+vdIHNmmK8vT5wBHiNnWij0+aS9UTbUuK2EdN+kcol3YgRtLb/z+jS8jNiDnqZvU7kZeu6BXVykzoQfZ9K/GbjR3C1Df1rocVs/1doedLwBCaAwFv29aVO03d5KoI3HW6fMjcZqpx2wLIsxErXQasSkk7fCdA7opyTyv/BiIuoAam+xoa1UwWfZ+cc9bDsAXv4JMjmuLsF35OGnMY7chrzsXgg0iWtkrxqcwkaP5WoA56CZJiejd1Ml174rOB6fyBDwjL9HUUNqpzyrWYusulAdzdVPV8imkKfr1JgnSKiPq4IzISOrsCjHYcak613x0kIZZ6+uycFTzv90Ro/fmjsAEnqt7//9J7mcYJAEg6xEN+GxobW3dPG8cG3EMrgp6zrvmjfievn8cc8F6en+Vvxuyd4UPQOSWeQnAhdyLyjVCx7sbBRBBy4eGHWGxIvum+3Sf0UYkUV5cHC20qhi81yan7qRQsaYTWVv41Uf5geLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5tcnhjRnZuMlZ2OS9OUFhTcWFmbVJxWFB2cUIwU1pjMmd4UzFmRmtpb05G?=
 =?utf-8?B?djcxUVJRdmpFRUhQQUNOL1lZK29vd3hVaVpIbzczQThWZVNSNGptT1p5QWpC?=
 =?utf-8?B?N0ozSDhGaFhCaW5NMHFscGJrV1p2amNmYjY3MTZVaEQwbjhBaU9DQjVuR2k3?=
 =?utf-8?B?bFBXeS9TVUdhNXltNnJObldBWGVWQTNwREF1Q0hRM1lHZXhnY3RmZmRaVUM2?=
 =?utf-8?B?L2kra0x3QTFUc1NwbUV4WTJpNkNHbVp4ZGR1amtjSjdkSG5qaC9uRTJSU1Qv?=
 =?utf-8?B?S2lxOVdPTldLVkhZNU16VlRVUVI2alV2ZHl4VlBMNDNXYS8yVWFTZjhuQzRO?=
 =?utf-8?B?OXdpb1pHWE5mTUwyNVNwMTdST0FLb0xLckhodzJEUGFPVW83N2dvRm9jUVdr?=
 =?utf-8?B?R01zbWt6NmtmN1ZMUWhMNWVDak5nZ1IrQUgxWXZKWFJxc2VnUGhrdTRaL2Ez?=
 =?utf-8?B?OGRIUXpLWWZUU1I1MEN6VVlVMWx0Z3Zpenk1ZVFhaW9QVGdIQUVlYUQyUlNN?=
 =?utf-8?B?dmEyVDZWUEZjUUZDdGh3bjFvOTJhbWFLT1pKZmVMcloxejBJWXVXL3dxTWRw?=
 =?utf-8?B?QnA4QVRKUGV5Yjkvalc3bGI0aWROSFF4T2VuZEJEbDFoMlRzWDZUTEZEbEpH?=
 =?utf-8?B?eUhWd1RqS0RwYlpYMCtCOCsxcE9YekxZVHgwMFVaeDQ0T0s2a2ozbmEvWGw1?=
 =?utf-8?B?djVFYlYzWElVTXlWWmlLbm5PcUFhZG5KSy95cVRRd2RNUnlSOTJLeCs4UUFl?=
 =?utf-8?B?b29jSFkyWWhpQzg4Q21uSHQ3RmFYYTBDSjEwMWliOVVJS0ZkaDNWUUhpL1hD?=
 =?utf-8?B?U2dFWHhOUjlFRkV3TGxoa2tuOVJFNThPSXlpVmNOSUJYdmtpb2w5N3k0a3ow?=
 =?utf-8?B?eStLQXgyK3VDK2N6RU9GalhJdm9TaFFkbUJpWUd4d1czYjZZU0didk1EdFdP?=
 =?utf-8?B?OERnbEpIY1E1bHcvanM3NmZ2bTR4YkpSRlB4RE5hY2psRytNNG5vdkxCQ0dB?=
 =?utf-8?B?L2JYRzZNRWRUYlJxeC9JbUZYMEhvcDVIeFd1ZkJnY0JvWGp5NisxSGRZV0Ja?=
 =?utf-8?B?eXRUdnpldWFoSDB4TmMydE5DanJVZzErSS9FR2dBNm9SUXEyQzZJbFFXTUgw?=
 =?utf-8?B?Mk5vT01pNWVVVkcwSTJLbzhvRjVTVUIwUnJKZE1SbDlHOTFIN2UvaXNYSFJs?=
 =?utf-8?B?b2I5MTBwV3hocjVHR2Nsa3V0REdIVktQUTVuaXA0VFhLK09WbjR6SVd0eGt1?=
 =?utf-8?B?VzZxR0lGa3MyWDROR3ovRGhtMmFLZTVUNnl2bitRcjVSOXR4OTRlWXNJcXdY?=
 =?utf-8?B?SytVbnJtY2tyQzc3eGRPRXJzcG1wdFVHOUZXK2p1TFQ3MlgvcDR3c3BQOUls?=
 =?utf-8?B?dGtxS3g4dHhpK3dzb2FjaXU4ejZkNVJnM2tKOWR0VGpHRXUxWWVWbkMzK1pF?=
 =?utf-8?B?bG1wVyt6Rm5TVkl4S0dxd1VpRlJURmh2YUdvcngvdnlwazVvU3JnVlBtSWh6?=
 =?utf-8?B?SWRqaTN1eVFaTmxJYkloMFdNUmNxaWtTNEtWbHczaXV4bFNoZmZ1b3I4b05j?=
 =?utf-8?B?TkFkSytHV0U0ZmpuK1ZicTAzMVdJenRyWjNyMWljK0lObkJPSTFPYVgvQ2hB?=
 =?utf-8?B?NG9QbFdVYWdoWEFGZGdpUzJqemNIQU02TnlCSy9UcFVXdktBMzdpV09rbnJU?=
 =?utf-8?B?VkNDR25EWkxmbTFSTm9ydjRTWngxL1RzODVKWVc4UVBBajk3aXpHbEU2MEFi?=
 =?utf-8?B?M3lTTDdacGQ2YU1ObXFSekE0Y0VWZnFPalVUZGNHOHR3dzFpdzV2M0NuSEM1?=
 =?utf-8?B?UVlOWnNHOTh4dlNVQ1JUbHErRFdVS09IZGdDR0FJMUM3S3FBa2NpLzZNM1c5?=
 =?utf-8?B?T2pmTmV2amg0T1hSeFdiWTFaY1ZITFkrQTZqTmg5UXlFU3psSGV1N0x2MHo3?=
 =?utf-8?B?VCtDK213WnU3T2NNZGFPS0pYUll6aXNkSTluU09zanFSNnc5UlZUZ1dVMVhl?=
 =?utf-8?B?eG1EcDVXMUdhNG1ZVEVlVW5nS3RPR3Fra0cwMkR2OWhQRXpqSmZmdVVIR1JQ?=
 =?utf-8?B?cFdtWUt3Rnc5aTdmdVhSdUw5T1haOFlIVjFiYUVzTDFhNTdrcHJseXI2Ly96?=
 =?utf-8?B?UGwzdURuNXZvdTd2L2Q5K3ZGRzdKaCszSEkwVWZYNStsN1YrbEl6Rm5hdVlz?=
 =?utf-8?B?dkorNFVPcC9GUkhUMnFSTzJONkJYZTlMSCtmeDJ3QTZVSzZyM2dCMHB0bWRs?=
 =?utf-8?B?cVBWQlhCc0VSWWd3Z0EzcFRmNERBbThDUnVNbVNGQ0ZManE1N3RUSndFWlpv?=
 =?utf-8?B?UmZoM1BzWGh5U2dOK0JpYktUalVvMHUwb2htWVZNRWhiVm9wVkR1c0VGeUhj?=
 =?utf-8?Q?x3Om+3vxhCWwrJeI=3D?=
X-Exchange-RoutingPolicyChecked: hpoLhQ+m5xjYxnQ9OOrUa3AZIrDqolRV6o0ZGZKcECblRO50RetE394o9WFd1GM2UG4X7nVuzrHvaHRbK3jY7Yo4YuaU7rgd8z90XWVnRrCmeC84F+iM0ER3Kv3LNovjCD8WUVTxKuibMIglUDZPTUWWK1VjXJ2yZp4+MfK5kjFSemo8QnFwL/kJQYeo8WxhblkYNmfQQZ5h7Gs1GrhLTIRxYNXA+6YnovUQRn0kPWV37UKMfpldLTyu88ocokm8S6flk7GOrsNI1nEqnaTuj1UrLnyzlkiSesv30IZ8h4mnHJOjmQjixEQ6b24cW+tJKpdZM/PmeS3/zHPMwQnevQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef07e1c-ef0f-48cb-4a58-08dee32ec693
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 11:38:37.6237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uS7MLuK79xM0ouYZX9yR6JNRhWkJrGzSgUHWdnFr4mXM1PfeGQr9zrhvrINI+J7HuVb1tVmp4TPqGWDqNf5kQFeFleznDwS5BrGRCGoTVIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8191
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



On 14-07-2026 16:25, Himal Prasad Ghimiray wrote:
> From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> 
> Add XE_BO_FLAG_NEEDS_1G to mark BOs that require 1G minimum page-size
> sizing.
> 
> Update xe_bo_init_locked() to honor the new flag in the existing
> VRAM/stolen-memory minimum page-size sizing path. When
> XE_BO_FLAG_NEEDS_1G is set, the BO size is rounded up to 1G. Otherwise,
> the existing 2M and 64K sizing behavior is preserved.
> 
> If multiple minimum page-size flags are set, the largest requirement
> takes precedence: 1G over 2M over 64K.
> 
> v3
> - commit message reworded
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++--
>   drivers/gpu/drm/xe/xe_bo.h |  1 +
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4c80bac67622..9dbf59fad421 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2323,8 +2323,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>   	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
>   	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
>   	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
> -	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
> -		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
> +	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
> +		       XE_BO_FLAG_NEEDS_1G)))) {
> +		size_t align;
> +
> +		if (flags & XE_BO_FLAG_NEEDS_1G)
> +			align = SZ_1G;
> +		else if (flags & XE_BO_FLAG_NEEDS_2M)
> +			align = SZ_2M;
> +		else
> +			align = SZ_64K;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   		aligned_size = ALIGN(size, align);
>   		if (type != ttm_bo_type_device)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6340317f7d2e..d5d023cac367 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -52,6 +52,7 @@
>   #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
>   #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
>   #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
> +#define XE_BO_FLAG_NEEDS_1G		BIT(27)
>   
>   /* this one is trigger internally only */
>   #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)

