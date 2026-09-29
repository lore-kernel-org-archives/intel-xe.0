Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2BBCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 19:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82CA10F072;
	Tue, 29 Sep 2026 19:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iw9ZEGnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DC110F071
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 19:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790709546; x=1822245546;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QdwGcpWAf3MC0UtsahyAEO6ANdGQKE1NxvZw82KdYFg=;
 b=iw9ZEGnYFYrWNIX5J96KWrWXcTuKY0vhJ8hB/2jZDQq5LHg48SnPIZPy
 1eS4Ph0RfTFDQTOZvVRoXeXfBmPlzoDIxbyrHbRIzf17e4RX8i+Niy0jf
 gV7zBzRpTdZF02w5llUZd5Yxf2bItPcIqwhLm8QqAPV+92UpWBOnMRVk1
 2x08Mtz0031pITd894NRzXLlufmZhUVtjyRhuxBAE+UwKBH6I40ho3BPp
 dAeObmQTLwFBJY9eVyuQpsm2Mp3+diOw3340BCTWa9P6lZl5Mcrcgq2PU
 XQCmwEOI96lD++iqmBVDHXUibCgU6ydmagQuImTCXdQDgHZH2/hJb87z0 A==;
X-CSE-ConnectionGUID: QEyRn06IRK+4tQnwqtJ5XQ==
X-CSE-MsgGUID: /a3CgoQITt+rWRG1N6YAow==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90658115"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90658115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:19:05 -0700
X-CSE-ConnectionGUID: x7gZFApjQL67ujpK6rzP2Q==
X-CSE-MsgGUID: yiU6irg8SBWh/o8LijWdDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275009036"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:19:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:19:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:19:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGPejR2uGuYrTuP3bbveDl2cm64hdEGvDaaK/8ZO5xbrCQnkkpeTFdDXxm5MjGyx2Z1jwRAWe/t0xEudUhf2R2Qz+6+jMjGWh7PQahbHRsau1UnrTGOoL94lGLj+w+eE8In2+XPwSnqzUTvtHW3G+EjM7rSYOXHhyeTr5CfhLZrABZxJ6KY3R/VZOxs6p1NoloyASdey0l+TV4aKj9SdrzX6dA252WQKXb9kl+W0XNjQUgJ/qsUt2IRxK+UjfNY+XQH8EONYfY5WFi68oJz4bX0zOrr2qpsqoLVEUGO5UfNgLO9IPsR047zsXrE6cUIDSmpR7WQbVKntSlwiKVqzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7mQeOShs5W448LLu/vvIqqtbPZHCeIcnpnXT6c5F0I=;
 b=o7yTUdtkfnOVx7ZFM+X8RbjNWVujw+i/UiGiSyYw6BGJGxodD9lfp2pBTVGQzG8yP1DQSHLbLeXJwWld8qi4yO5zcXpOj3Vky+P1u6aDmIJ5yYAFoLDlmkg8qmKD4vVM7reTu1DnE2ne9tnOLn1IAt33iPxjFZd4IfRzM9dGl5kKwA7xq/YaI42KKpm9RS8CwAN2cIDvbOyrYfiZVbiPkt2q7qUZGRdu3mk0a3dnNKpiqvP4lKQ1FWUEQP0cw7lSam4iS7naMR7QpPwmiwqRf9YyMenpGZUc7157x5o+0ShB/kiVS0EuXJ8ajR604jIoD8ozZW4RgsSI2XsKL/UrWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 19:18:56 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:18:56 +0000
Message-ID: <8847b63e-bf98-4b63-8cb6-daa4b1f7490d@intel.com>
Date: Tue, 29 Sep 2026 12:18:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/nvl-s: Enable PXP for NVL-S
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20260923183600.1186943-4-alan.previn.teres.alexis@intel.com>
 <20260923183600.1186943-6-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260923183600.1186943-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:303:8f::8) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 1351e5dd-b0f2-49fb-eda0-08df1e5e81af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Mwn5j8cbpfHOitRUkqCxYg874JyUNP6UItdSNs31M0XHGzelrdunmO1emIBBaWXk73cqfFHbPZz//qm3YC394ZG6bGSdj4ju9UjvY+mfWSoxv781JF7CmYxoS/c5MFW2UcQmD2p4RTRzBtXLsvVTbKjakMgo4jtqAYa7pC9Jku39sh8C10tSUXci1evVNRVc+v+IU4nD4aeUJXK9DoCx3pKzswF3oAHayNMQXrO2BPEp/Qg1asYODL05kw6AIV0OOOR7z/83KRDNDOquYWwaF3tOUAATRhqVZdhV/Tv0wx216NXbhBY/LHbtv14CzAPRovYJr5kC4sIY9hE+7tZWXyv3VEz+iXVAmttoJ7MkrZy/9dU4n+SyUUPfsgZKoJSzsKm2LvnWa6qgJUO3VGRdZQ9KkSYImAkCoeY51ctit+kxaFDRseV4VCsPzO9pg8i+cOB5Dl3AIyM5cwoX1g54OpTXKRyX8p+bi6hsNx+V3d4mGODw0B4MHTR1+uGEp4Tdx9rChpBvChR82/I7zKx9v7bOpLFwVRcEbzOozrTW1m/bOZacHoJeMA2hcVG/jbaiT6PaFOkdokiJCrcxghHi+YbuSK8kGrwkYFP8Z5YdbJteCRpZIYkgm3mYfEM1ZkbZlYS3D8MNcEN9QrS1Uu6vmp2/mwUAmm6XNMcW4sXOpUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXkwdzdPcTRwUHNtVUJLWUt4b29LYXJwSHZhNFF5ejA3OHpaTURMV1p6V1Nk?=
 =?utf-8?B?YVg0VDB0RDRUUDNGd2NDTktmdUNDRnl3aTZtSVdLV1F1NmNvbE5rT1U5K2s5?=
 =?utf-8?B?QkJON0xlTkI1OGpMbkR6WWowSFQ3di9rREJyNHptQ0h2WWRObmVoelVTdVVS?=
 =?utf-8?B?eDNpRjc2NlFEZXIvUE9aczNYVmJLRW40czJkSmUyeVV3bEdhQzROOWZ4SVh5?=
 =?utf-8?B?dU9xU3ZKWTd1UTU1ekl3YVU1ZHdod1U1Q3d4L0lKRVJNZW9MQ2JiSk4vcWhU?=
 =?utf-8?B?VWh3UnNLZDhhL1M0TkxiZ0t3QkptcGh3QU1FSXpxS043TzE0WXhJdlJ0bm1O?=
 =?utf-8?B?aWwxY1ZuWVBQaGh4MjIzOENYV05QL1pSY2QzNzlUOC9semNIa095K3AzcFBl?=
 =?utf-8?B?MDgwLzc1Y2F6OENEY0t1ZisvOEdrempDTDB3alFPOFd0eE8wVURZRUpRcWNO?=
 =?utf-8?B?NkhIKzNsNytRNndnb1hIVUhhYkM2cUJMUE5UczVXRzlDNlhydk5NTFV6TWxL?=
 =?utf-8?B?Tjk1RHdHK1dvZ3E3b0dLWUJsZmF6dDU3bE83VjdwTy9UamhSZnd4WTJ1K3Ev?=
 =?utf-8?B?ai9iMzE3ODZJWnNPQ0tweis4a0RZTVJ2ZkNNWDNLNlNReHNlTm81YzBXSXVm?=
 =?utf-8?B?WHM1eVFpNXN0Unc0clQzczJPL1k5UVhadHJxbzVaa3ZiVjNvZW5PTUlOVW91?=
 =?utf-8?B?NE0rWGJOOGEvTS9URS9oMXl3NERpdFc2cmI5aFRnR0U4dXlWcm5SRHJoODlq?=
 =?utf-8?B?VThXVHVLZ0dYcmxPUEFoMjc3aytiaHl0elZtVm9UQUM0OWU0U0x0YVpLVGhE?=
 =?utf-8?B?QVdQYnhYVFJ5alJhS1g3V0JGNEtyMmFLNkVhL3VubG9GTnhNMmNmKzQ1K2or?=
 =?utf-8?B?S3QvOUlYeHE0bjd0UFZ4cFpCVTVoSk13VzJIWGpndUxBYVNhbU84eVNrTWdO?=
 =?utf-8?B?TnpUMk9PWU5SQXlDWnVaMUhKMVIwV2ZYT2k0TkJPUG1kTEtnQWdmbXFVZnha?=
 =?utf-8?B?NFFMZXZ1NWpaUURmYmRDQU5SQ0JhSC9HbTJpRzkvTDU5ZndINWlUOU1GREZC?=
 =?utf-8?B?eVpOczFMZHA4dVNYUEhiSDE2ZmpDZCtzNmxPQmh1T3hFVmdKelJHL0hJNkZ4?=
 =?utf-8?B?VEtVbkxBTGhHYXlSNkk5LytTa1ZPc2EyWCtqMGo4OFJFZjJsSUJubmVhNHBN?=
 =?utf-8?B?ekZlM3Jzam4rTXpCNTVtV2R2d09JZkZoQlVaSHV5VFBZclpqaVBoN2JrWG9m?=
 =?utf-8?B?dDNaUWo2SU5ZMnVtM0VXWTEvbThOWko1ckZXNWVJOUVla2h5Q0xMNjhFN2l6?=
 =?utf-8?B?alVPVWJRb3I4c0RKSGlvbnA1cjdPdmZWSnd4MStnWjBKTXF1Z3hUR0xJNDNY?=
 =?utf-8?B?anVXMnBER1NwK2o0bXA0WHdKUGhNRncxM3ZUaE1CMU5QWi9yQ1NyTm0yNFY0?=
 =?utf-8?B?UlliWGNucWx5eExCNDkyOUhQL2t1L3Y3M0lwVlkrV29KUGkwZDdScHlJQXV4?=
 =?utf-8?B?aXpEVGpIbm1GSlNLRUNjSWpHc2hOeVMxRG56dWJKNDdReURFUDFURDQ2K21s?=
 =?utf-8?B?NERQR0M2RXVyQUNrY1NxVHNndjRtejFZYkI5UzlxUnRWL2loRGVCZHpzLy9U?=
 =?utf-8?B?dFViT1FkVU5xMGxuL0dITGNGZkY5UlFPK0RmZm5KR290dmk1M245bkR2WFQv?=
 =?utf-8?B?TlJNdGRNOXBDVHJRM1lLTENLOFJ4U0VwSGFacW5WbkY1aDZhLzVoQ2RIOWJF?=
 =?utf-8?B?WG9HWUM4Zi9ZWFdTbjAwd1JyVFlnYUFZOU1PWlJLOXovbThlQno5SURrR2dB?=
 =?utf-8?B?Y3VYNFUvQlpjUUZFNUgyZ3NuUzI4SExGTHc1eGFMMVVyWGhZK3krekV2L1pN?=
 =?utf-8?B?dUw0aUt2d3o3YUUwUEZWVGtLdlpCRWpTQURORmtsc3d5V2gwTzF1UmVzWUxo?=
 =?utf-8?B?SlM3Z0JuQkpKeWRldzNOQnlKR2NOeVFEVEVHcHNXSEkxOVdlTnpvWUhIbTVY?=
 =?utf-8?B?VUhiektZT1N1T2d2NnZiS2pmdi9BM0Y0YUpDMWQva1BmMWk3czZRVFY0eTI3?=
 =?utf-8?B?VTV1dE04RVF2NTVvU0cxUEhFTXBPcFprVlhtTmdBM0xWS2poOFd2ZnJLOVR0?=
 =?utf-8?B?S2dYNlJTbFgrL1dGVmRWV3VCUlFuVkdsQlVadkhETjdSclgzb1NGUy9ZN1BM?=
 =?utf-8?B?ZFlJb0RSb1k4Qm81OU1TWTQzdFcrRkNHdkVTaVlLV3ZPT1FnTzZWaXNtTFpY?=
 =?utf-8?B?M2VDSzFib3FRNjR4bk0razBoeXo5YUVVQ2JqNXJJbzNma2pLa0lnc1dqemNK?=
 =?utf-8?B?NmlmVzJ0YVVmcG9PZm9CbktvZldoMHFTUXFmWVdZUHgxQ3B1YS8vRVJDWEts?=
 =?utf-8?Q?tvcT6LDM91cZ5cVQ=3D?=
X-Exchange-RoutingPolicyChecked: VcmAAvVHk14WAQK5VSL0WJyUmnZsTeu7wf39rtQH8TIiH4JzzDD9dSpe4ak8heXOR45r2ncvtUfAMTgIcLLJFz2gen5k9vR5UnQG/FSAHn2PBWo8bBAqe9xitc3zFsq8nBNL0GoafYJg42qC+u+MndjP9oUZZh8qgNQmaMioW4Qi5TfbWipDsCupN7PbD6PSp7gbQHZdT49W2tMYl+iU1JmO6vosXBd5Ig6GReGRNON/8+L0tFoQGPeNPhScsnk3WUG84P5ZFMH64slS9mJ0YRVx25W+E4WgvX/ZoXnKeBHQ+1ZnghR7Xicm0HSYIlOc9+nj/XBeWn/arvaEZsuUBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1351e5dd-b0f2-49fb-eda0-08df1e5e81af
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:18:56.3324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHQgGUpptqRTSY0P7rzCiV5ew+GgihiqgAirqaScJld4Pw3pg/eDEUEThh90rtnsdUPgEdQG4FwRtWJEwu0pYEcYUNBTaSMpaTYDEtXndSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 9/23/2026 11:36 AM, Alan Previn wrote:
> Now that the GSC FW is defined, we can enable PXP for NVL-S. The feature
> will only be turned on if the binary is found on disk.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d64e873d9e71..94fa9c960235 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -460,6 +460,7 @@ static const struct xe_device_desc nvls_desc = {
>  	.has_flat_ccs = 1,
>  	.has_pre_prod_wa = 1,
>  	.has_sriov = true,
> +	.has_pxp = true,
>  	.max_gt_per_tile = 2,
>  	MULTI_LRC_MASK,
>  	.va_bits = 48,

