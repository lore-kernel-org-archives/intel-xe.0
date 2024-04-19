Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A49C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 07:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC44710F802;
	Fri, 19 Apr 2024 07:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0uzEdM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A159510F802
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 07:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713511016; x=1745047016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BeURWVpkvBx4VjTB6ss9OlCZUxSOfD2oDPK9mFtU2VA=;
 b=F0uzEdM5xGKSUoGDeDz9u/lWysqq24kvZ+1kZM0ggAPJoGGyPAm0KEXP
 jdGTto3GvvUVrNVQ2clbgPtpu0CSjqDVCBH6a4S72X5FXZdnBnQwYAPAA
 uxuZ5v1T3vu6N1568pwYIQRU0+PqhVSQ8X7VRqnR66JhiYvArgu06jWr2
 0b7b9v0sbNeM+ruw+1GQA1BEnKv+CbKiGp599TXK1oNvlua3z+bCPj2e+
 PyMAwdh6QRQkS2KYEogcwc6SnowRGooo3AloYj4DdyqEpvWOmjobX69cs
 S7KmKp3G4hda/mZEMSKc+tkpZIVrxj338QoULgozZ8t32f/8Av5Pkgf0g A==;
X-CSE-ConnectionGUID: vHa/O84qSk+niorTYTWk+Q==
X-CSE-MsgGUID: cMWB5nupSEm+/7g+5+mhMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20490476"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20490476"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:16:55 -0700
X-CSE-ConnectionGUID: tDbiCKtVRAWrhdPlzav2ig==
X-CSE-MsgGUID: dq4V55DOTNmW6LEaK5QdcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23283304"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 00:16:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 00:16:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 00:16:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 00:16:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 00:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYf8rquwDB/tF5feK/8l0OnmKe3ZyIsMF0fTp0b0ZEd9/h9+Cq+gmMVKSJLRm1R6f+MmVdDnWGNrdjcodBXwsDafMeMUW6sjkE1+6P2GJBL1N6uMW5LcR2hBb2dlEzZ1s6vPNqIcyTkiFULndbGlo7zKaCPC6rpRE1wLHhP6TQKls7omUNFUYHDRVDjP/TgKmXgXmjg+1TwEthdhetPKthFw9Y8I2oDtiDu233GkjgQzexFZgEQNY5dVYdHSUcu3U/qBXsKxhSyHgpHTbGP4WKBZhpvRm22LLShyIgSYb1TAoi0Soms4GausQtxwlj+OBjMJFSfgR0L/UZxhxj1tXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn6qupvIDCv2y/Pnx/JnVQWWCGK1vWEWYgBOgHPzMY4=;
 b=RnXek8foceJAuvvq/5Rut42hJ0r4jwwWpNKJ6XT1QIlpP92nZlT499+MApehlyQ+Tg8+qE4aWm75OKLKfJ3m4edVs+Ac9ksfsc10BCSHaU8plH1TPlahKn20yOcgQp642HBpIGKpUekmHo1YIgVomOiKZMB+W26pgzfszZvw2Fww8LyILCsQOmrGhGsGHo6rUGuG/VqZ27r5K0LHTb+4aXVwyA6UjyTAjLVbjofE9iUfPAIKEYb2mYpC3aN7R70O6WI9dDRazVx+0c3mLAvy8I+6IZ0DtxfHiuzO2MZfKRbYIunouyIUeWrXJJLeWwD5+/tYv+j3ylXKP5m/Wyr/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11; Fri, 19 Apr
 2024 07:16:51 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::8542:9a6e:8019:7360]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::8542:9a6e:8019:7360%6]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 07:16:51 +0000
Message-ID: <13c03470-ed7f-4e64-ad77-1c45a40d7966@intel.com>
Date: Fri, 19 Apr 2024 10:17:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Enable device atomics with a VM bind flag
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Brian
 Welty" <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>, Jose Souza
 <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost
 <matthew.brost@intel.com>, Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng
 <oak.zeng@intel.com>, Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e67c3c9-2505-4a87-c773-08dc6040af3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: pwCFLRdljdUVeCymOruFgd3Wa7lCXqonLBzMVbzb/3u1yroO4xU8Ayqo7Ue1HSR8uqsteElnzG6/OA8Ezhib9Lv12BUFinmQjdPo0FmyfQiHW/GzdgZNvdxrpwP1PMtvDMZv2WUA7fE9LVoOI5RIrCXrr80O8awMDt/VlJGFcCKfBFOrs18bMKOH3Kaqr2zbGv3NVEZbe7mL9Kw8E2BWJZilRNuUzP6opT2aXMAVaLo7u+3leal68flsfEj7sX1UITTr2D46IhEQt5KKCtWHkNBltJbQtctG1M7MH2bSirNRQxogfV3tdOWXQUyTRb5OQo6oLXWAqXGYHHWtYfggqANfGmObdv8iyyYQ06Qf7YuCWEC5rTRq4BAONYxK+NNev9jALja7vX7HWEOfTGnl6EvkzrWNZ+vJ+TLlnAuiWivOIYTCFJTEbA5dUK0kppxTEtZJtDfKOcZhLezdDhI7IovgoEIphh11nZ/51f58IB3GzyuPnqYQRZPIU4ThmdAE4xVLxI/CjTWtK7KsY4VHh1+Tfq6LL5r3B0mP3RBPR2n+MiytBUlH9KrJd9Wq6oyqtIZfKGSGqVWvpOA82y1XHlZsnk/kHl1azB0+ra1zoRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lkQmpHMW1neUU2U3BGWjNqNTMzaS9taXlBNjFTWktINnp4VVdjK1Vkdzc1?=
 =?utf-8?B?NFFHVGlnY0k5WkNNa0FoZzNjOFZ1TmRSTXdYV2RmS0oyRysrSW1xQ21idDlZ?=
 =?utf-8?B?OGtobGhnQ0cwOERldkRxZVEyRHNiRFQ4aDNFKytnWVY3azFIL1N3SjNHNUw4?=
 =?utf-8?B?VC9wYm9pN1BEbUlmRFJOc1BzVVdLa09BQWcvZnNWWStLRDdTSG5QeG9mWDhV?=
 =?utf-8?B?V0F2REx4QlFRU0tQcno0eVgrY0VCUjdmemxsNXNnRGVsN3hIbTJCRFB1MmZG?=
 =?utf-8?B?VWQ4TmN5cGpyQTFiZ1BRamh1dER6ZXhNaUhRaStWUStaUlNHWjRCbE43dEg4?=
 =?utf-8?B?d3RYdCtJZm1keGFxK2drTnVvSXN5YnJYTFoxTXNuT1Avd0Jkay9ZNVVHdVdD?=
 =?utf-8?B?T0VXdWZEdHJra2kzTTlDajdhd1Y4Wmo3ZG42a2wvOGNMeFlETmVTK0hTQ3ox?=
 =?utf-8?B?enR3U3F0OFlDcVN4NXA1L3dkRWNyQ3ZxdkdOazNWZVRWeDU5ZlRmSzBpaFNw?=
 =?utf-8?B?UmNYTzZ5VEluVTZCcHh3MzNRTkQ4SHB3QngzdmI2Y0RqclVMM1JqZG5qcElL?=
 =?utf-8?B?TGVQM0lmT1lVem9qMWFqMENJaHhZS2NnQ0VMMlZvaXZuY05DVHFoTGZ3eHlh?=
 =?utf-8?B?ODF3RlIrUjJ6NE9kYnlGMXJ3MnFiWXJkNm94dS9QN2NSNnJPQ09uTXRHWGFm?=
 =?utf-8?B?RDNuK2pkeFpLT0JYSjhUcFZNNjcwR1ZPTTdLN3VRYkZtd0phK0xRUitKSTNr?=
 =?utf-8?B?SjlJQUhINkhMcDdhOWFtTm5odS8xdzJjenozanJyc1BYQWh0UzBYYlJhZkNJ?=
 =?utf-8?B?aDRTUWpkZzUrK1lwVEx1dElNdWVmclRKWDJxSTdyWmtzMDlIY2lrRkt2b1Q4?=
 =?utf-8?B?eFEweStPWVBvajkrWjZjdHByYkpNVmZHei9yMjFtL2kwUlcvdFEvUjV2OFJ0?=
 =?utf-8?B?clpyanhIR1BjREFrOG84T3hkMWRqcG9Kci9SdUQ4ZWtPbUZCR0FJbFpneVZl?=
 =?utf-8?B?b3ZBbUFXaG92TG51RUNmMlAwZXVZUzNmY25NcklnZURXSnBXRmN4VjhmUUVq?=
 =?utf-8?B?cndGMFBnS0VEamd3cGV3V3Q0VGF0SG9DZU5BRndBNEFXNG5USlN4aTdnaVM2?=
 =?utf-8?B?alZnRlNhRDh1dlFuK3VncE1PRjA1VTcyOUIrcVBMeFJIdFFYekoxc2EwK2Vr?=
 =?utf-8?B?YTRNRWsxM0JnTVJwOERncTE1ZjJGZkYranFDOVBTdUVaVXZKNjk1Z1ZCcFYr?=
 =?utf-8?B?SU4vT09BRUFsT1VLelhOWDhRQmVtdEtmc0tRWDZyMTJvVjE2bDVGN253OEg1?=
 =?utf-8?B?dkhUd3NNN3RKRWtQUzF5cE9Sc1Znc2lzaGphTmoveEorbzFvdTNlYi9Tekxq?=
 =?utf-8?B?UEhhZzg0WlhuSHoxWGxMd09MeWVBcVBKMFZvZlZ2akNoUkVrYnhWSDAxcTl3?=
 =?utf-8?B?OHJIQWtEbEUyTC9BOVloaU9SekJhR2U5ZWRlZGxuWDJGMVZlMi9DdE1IQzA1?=
 =?utf-8?B?TU5KdjB5T2FaTVZ5NEcrSEVKNHc1UUFNZCtzNGdBenNuZjNtSUE0ck9wY1A1?=
 =?utf-8?B?cjZ2djYyb0NLY3FuRW9EUUhoUStqQkhQbnM3NitBUDQ2TFdHWkJKbXpXV21M?=
 =?utf-8?B?dC9YSFg4Y3B2VU9yUEpHMmRoaStNSEY3MzhHYjE3STVYekRwemNOZFRId0pG?=
 =?utf-8?B?bVFFTDBZMjF3T0JmZXljNlhsUERaaWNxZUZSVmptVk9kdm9GSUdpMkFVVHdI?=
 =?utf-8?B?R3BTZmxSWXNJaWczdWQ1SGp3ZmtlNUFtTWdZQm96MkRuemNoOWgycmxCOCsx?=
 =?utf-8?B?YUZvNmd5Q2hjVFRxSW1qTllrSktUekZXKzh3OUNEaFdYVGRJdEdnb29hdkhj?=
 =?utf-8?B?UTl1NDlwYjRDbzN2S3FZdktxdFlXNEVORUhPOFIyOUdiU1FiQ0FBYjU3NklZ?=
 =?utf-8?B?eENaajl3dWlkQUZaUXpXQTk2UERsRy9hbjVuQWZEdEdXTlQ1WFh5RGhzNzlw?=
 =?utf-8?B?b0pkSmJGMmRxZFNqQWgva0Z6UDJoQi80OTJBcTI2WmxpOVFoTzhDUVlOdHdR?=
 =?utf-8?B?Y293VnM4WGhoRDZ4NlY5WThZano0MnF5OC93M3plTVlXOU1JM0U1b0pJSGhl?=
 =?utf-8?B?Ti94OHNvSnZWWXM4c21HVHBSaFFXZ0R6cnZpT2M5YXF3RnR0VmNMM1BTVkVX?=
 =?utf-8?Q?j9XH15IfNHyyx8msThbzkIE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e67c3c9-2505-4a87-c773-08dc6040af3d
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 07:16:51.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpRT0ZcT2zGadn4f+NMmeFFS6lRniLYpjMbBNykMYZ86jOuIRslwFr0WVPaD2SeVkjN1quiqpSdq60yEgyi+c9o7O6ot5+wLdBrtQpYv+/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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

Just uploaded a Mesa MR for this series : 
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28823

-Lionel

On 15/04/2024 17:52, Nirmoy Das wrote:
> Currently device atomics in SMEM only buffer is not supported and
> given that simultaneous usage of device atomics and CPU atomics on
> the same SMEM buffer is not guaranteed to function without migration,
> and UMD expects no migration for SMEM-only buffer objects, so this
> provide a way to set device atomics when UMD is certain to use the
> buffer only for device atomics.
>
> v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
>      Remove redundant coh_mode param from xe_vm_bind_ioctl_validate_bo().
>      Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
>      Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with
>      config flag DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
>      Mention that PTE_AE will not be applied to userptr(Matt R)
>
> v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
>      Use XE_IOCTL_DBG for checks(Matt B).
>      Move platform checks with help of adding flags in
>      intel_device_info(Matt B).
>      Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B).
>      Create query uAPI for this newly added VM bind flag(Jose, Lionel).
>
> Test-with: 20240415143528.4107-1-nirmoy.das@intel.com
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>
> Nirmoy Das (7):
>    drm/xe: Introduce has_atomic_enable_pte_bit device info
>    drm/xe: Consolidate setting PTE_AE into one place
>    drm/xe: Add function to check if BO has single placement
>    drm/xe: Move vm bind bo validation to a helper function
>    drm/xe: Introduce has_device_atomics_on_smem device info
>    drm/xe/uapi: Introduce VMA bind flag for device atomics
>    drm/xe/uapi: Add a query flag for has_device_atomics_on_smem
>
>   drivers/gpu/drm/xe/xe_bo.c           |  14 ++++
>   drivers/gpu/drm/xe/xe_bo.h           |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>   drivers/gpu/drm/xe/xe_pci.c          |   5 ++
>   drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
>   drivers/gpu/drm/xe/xe_pt.c           |   4 +-
>   drivers/gpu/drm/xe/xe_query.c        |   3 +
>   drivers/gpu/drm/xe/xe_vm.c           | 106 +++++++++++++++++----------
>   drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
>   include/uapi/drm/xe_drm.h            |  22 ++++--
>   10 files changed, 116 insertions(+), 46 deletions(-)
>

