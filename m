Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF889C54E5D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7602B10E13E;
	Fri, 15 Mar 2024 01:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQqInwk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3877B10E0E9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710467149; x=1742003149;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dXSwpPQ/Ixb5dmV3yn30v2nnZ7TPqVAZLBW8lTbkLFQ=;
 b=TQqInwk6nOcb0xxwhKdR0QsPvglu5F6Gs6b8X43tjYViMYW5Nx5funAm
 FnTxTiK8a+T1BLOMXaUIv26XS2n2DEeZ4eqkMhnCNxwynK6B58tndlDnV
 WB/+f9YknbMBHfDZcVfDfKBt7lXI8OvH4La5+A+GQeg0T7/Dhddk7pYHv
 BVUeRnaa+GMuokO3Bk/ARBmjwl/KER3tJRJQpn9kyoufm4a+/4Ax0SVGP
 qpuFuvnfU++891WYiQ2nasMrQRHNpygs7gt96h6TN/SaBbYAxqTWlCqbZ
 8aV3CCp7vjjMF4aHzmhk2nVgCULwx1H6PIu9RCWPgV9Idklq70VgNnnGm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22780030"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="22780030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17170785"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 18:45:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:45:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 18:45:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 18:45:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzwQj7QvjldqL2SP9hktUoynIf9yFDS6luO6JcjJUkzuYIbub3DZXQJ9yROO6nMCl9FdgXchVH1ymu1G7lDodE7rwFuKF1RT0mK/UrulHWa7Q5m9gt5DACBFzmVQTb4hpAA1922fiEPYQCgJ9p+MnN6yYCjPzqcyLGJk7M8hVKWNT1EhTRAuXro5DUnidY1YhgbAqZG7z69wz//3hK6YdO7AxcOOPB+WTSxc15S0+HV5I+u3bwz0vQzEUXL1oB7RM1o3zjig7nsg7+aLsVSKC8z+iBS6lvuv7AqFZ5Hp4yVMKG8Y43fY678+h0h8xRLQZmjWRDcbj2ijUeZCq7BYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKJkoHBRvCZ89ScjoH8DDfJ7rAejmy8UVyDBwHgYT8Q=;
 b=VmCE0IzHdWbEy3s7xT0jzpwyAX4TB4Vramzt63+hp7vDUaOrMakN8z0H317M/lXO7vUPBb5+W7+4DWrO3ErFTxlqdv8dNDDu77IbvD5WjAlxDyJR6R7XHbkv15MhQC1QTI/anfkafTLw66zGLBpiIlFb5s/z4/nxhRLZwdE+UD0G1IxBMnn/qfsdY/KK+v/Y3MLDOOgfAf1FMZvVzWYJKnpWqIGxBlJiQA8sP/V+Lj8gVcSD0IipPk52e+zapDagWc7dIpc4Wh72uk+KJJkSzsvD/jsSTYUp3BfphDWtDqVUlZ9v7i8/8LN0XaqWoOLrxTEDMv0zNmV7oIjmon9GtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SJ0PR11MB7701.namprd11.prod.outlook.com (2603:10b6:a03:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Fri, 15 Mar
 2024 01:45:39 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a%5]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 01:45:39 +0000
Message-ID: <fca1e232-89c4-4f39-b754-ad067941d5dc@intel.com>
Date: Thu, 14 Mar 2024 18:45:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@intel.com>, <matthew.brost@intel.com>,
 <airlied@gmail.com>, <himal.prasad.ghimiray@intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240314033553.1379444-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SJ0PR11MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: d977bc56-f3e2-413d-1033-08dc44919e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: veGcO1PV5/TQy9UoBg/5zH+oR0Z6hME9ce8W7pvJgxAFwyBXxaYUUpLJxcaKkrB9+x5G5xlg+sCBF/wQ2uujt9LPCiSjXAVtO9IHD6odjAothtdLMsOu/FuQCLqeapL/k5UpRDw+mg687erDyZzq3R/J2EfuYKsyutp4VLTxWIsRJ8EuWxYRw55sAOqPLux8UhSzoZ8+x+A5YZlf0+rVc6TXbH6Mj3RwVd9ijsHp43x15Uv+6C4LcwEPw66Gm/YXl6N4Cixa7FYCoQdVAv01DhY5dLI5fykznf26t7bHt0tCGz7nd1l12wD2MAAJGHzZhvlTxMhENDor8tVRBaX4TqdCHhd9dihpA/64efFgAXy9GXhj5dKJwDknVXrFU8eGazAMBjgsO+Je1F93SfccGprE6DT/xSK9yyfyVerKunqFKYfuySb3StildZllqMkDEmg5NVuJqa5c/A/eNa+LTgNSjmhGTfwnX7f9XbI1njOl3pQINWFMGwkP87Htf8Lu8bB7DsAFedXW7yRRnqv6ydxx/Xfcm2MVVGr0wDnQ3lXbQlPPDN2OJzmqoNAYL567E6Ax8vjFwoTcK+/wip5EiLXncZZdaVPV23vy8z5OFMCWPQ4a3yDZhDZw2XL+pQSyEaRVxs7SKceV8mjXAG9dcq5e6mzK4QgzkyIaQttwZ0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlpFM2JQVFZtN3NYcnQ5cXY0NmlJRDNZSzErRFRMMXRHU2hCa0J3UGlZVGJl?=
 =?utf-8?B?UHFrUUs1MFhuWTlYclNhbUxSakJ0R1N1ZSsxMXcwd05Wcnliek8rdzVsNU9t?=
 =?utf-8?B?N2Vub0xIL2F0Y2ptVG1TTENpL1NvcGxLbW1ZOEMyUGJqUlkwUGZOcUsvMEdh?=
 =?utf-8?B?ZU5EWWF4dk1laERpSkZ4R0hJUmxON0d6RitmRm9CbG14QWZtbzR2RlZZSGZO?=
 =?utf-8?B?bHN6NkdPRjBEaldjZlV5Q3V6YzFPa053U055T2g1TlBteG9tVlJ6WTVjVWFs?=
 =?utf-8?B?dWFXZkYwL09zUWtNSlY5YzBDRXVUN1FOcFpXTE5od05GUUhZT25kR3RFcUJD?=
 =?utf-8?B?T3dadXJFdzVXS0poS2FlSDhSaTUvS3UycUh5TU1tNE9LUTJlMTMxK2ZXd1pB?=
 =?utf-8?B?NjR3VXFpaGM3WmFkT3lSRXFpRi91MXdFNENrV21tNkgwL1JLR3o2RHNLSklG?=
 =?utf-8?B?Uy9Fc2JtNnlvWVUvdkQySzdlZENwaEFWK21DbnNNb0JyWkNkR1BiQkhzT3Fy?=
 =?utf-8?B?TUxic3Z2bkhtSGJvMS9IdkloeWg3cno2UDVXckNyTTE1YW1IaFkrSmFMM1Vk?=
 =?utf-8?B?SkpRZm83SjU3NmF1RVhuMHFtaTFNTkUzazBXQ2lRbWNwWWg1eUFoeTBZWk5V?=
 =?utf-8?B?NVoxRUxaZDV0YTA5V0psUHZwclV2RFIzUDdsYzVWQXBtZ2JqSHYybEFSVTBO?=
 =?utf-8?B?QjJPTWNPbWRsQXBCdDQ1bmJjS2MrSWFFNndud01nc2ZIRE9LZ2RvOEV3SVdt?=
 =?utf-8?B?MGJVRkdhdDFPaUFQZVZWSCtKNy95Sk9QaER6UEJYM3dtSTdzbldNVnoyS3Ji?=
 =?utf-8?B?d2lWeU9vdGpnRzVEOC82QWhBSVVLZjRuRGZSZ0VxRjRhZXNDM0UvK3ZrSDBp?=
 =?utf-8?B?emRuRnpWUUpuNWlLZEhIb2VpR0hpNFM0V3NIMUU1Y2tXT3BBSVlud3l6Vmwr?=
 =?utf-8?B?Yk56cUNUazM5QmJNWWRQbXc2TUN1Tm8wN285QmQwdjE3Y2pXMXl5Y251RHFl?=
 =?utf-8?B?WEFKTG9jQUZLQThEQjVyNlJFbkYwT0ZtOGIvN1BNM0RGT3dtTVpjSVE2ZUoz?=
 =?utf-8?B?RWd4V1NXS1h2L0o3WUd2VCtoeUJGUkJocXlHN3Zrc2tDWUpCbTgrOU1hcVBI?=
 =?utf-8?B?dlN0M3lKcTYyZHYzcXNlZXRtaTdwbDdGUkZYRDFmZjlIZTlzWVJuZGszdXlV?=
 =?utf-8?B?SUhoQ3R5ZTFrbkxyLzBpbXlMNVpJelRvaHBPci9uYlBuZGhENkoxbitwdDJR?=
 =?utf-8?B?WHFodnZFVDNobnpSY1Jvb1l2cUNrMDFFcnBob3UxWHcvaWk0ekxQd1dOdlVI?=
 =?utf-8?B?c2V1T0w0bkR2czdQcHFYREo2RmpQYytxa2dCS2habXpiWjFZbGtIeG5IY3dN?=
 =?utf-8?B?WnJQRUU5Y2VSWnpXbjlPTkZYZHpNQlVEQSs4dGpwelM4alJZUit0YmpzRU1l?=
 =?utf-8?B?MjFtNHo0N3RSY3B1MDJ2QzYzbTdlZUFuSWtpUGcyYytzd3NydG9walBRWG1o?=
 =?utf-8?B?SktUZ0gwRUJrU2JLWVRSSzZQOWZ6OEZaZVZCYUpKUE1KOGVYQnFYZDJXanJB?=
 =?utf-8?B?VUVaZmVzRml1K1RPbmhOejFzVU13cVJUcGxTR1pMMk45NHdidEhNa1FRVStr?=
 =?utf-8?B?OFh6NGl0VlNoVjZ4UVhnOE1uek9sWVdqZzZlekxpcXE5S1hObUNjeHZ5MDRx?=
 =?utf-8?B?WEY3R1J1dDRLeU9ZRVJTaFhGYlprS05DSHgxZUgzQ0VSSUVsang4M0gvSUtq?=
 =?utf-8?B?czZ3d0ZUSFFpcnV6RFJjRTlDaFNNVUV5MVhyMUNSTzBHYldzdHdPMjQ0Rytx?=
 =?utf-8?B?QkV0UysyclAwYVhYaDJjMm9lbUdXb1E3QzhwNmg3MlhLeTdQRENscHVrVlhz?=
 =?utf-8?B?UVVGWGlPclIzT1Ywd0src1hqbXVpckZBYjU0UE94ZCtsTW9tQ01IeStIbHA3?=
 =?utf-8?B?VWFaUERmQ2dqaTVadng3elM2MW1xMFVKcG5GTURmRHc1SzlLNi96R2VLMkls?=
 =?utf-8?B?V1U3SDF6NmRndWFVMjNrclg4NkdqSldQdWFiQWpHRGhiaTJ4d1ZVM2srblZL?=
 =?utf-8?B?UXYzZEQzRWJuN2NJWVIyZmsxaHVUSHV0L01PckhSZHJWOUZnV2IzNGFxcUE3?=
 =?utf-8?Q?d/C0Nbur4G2C1p9IFVVteZF3l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d977bc56-f3e2-413d-1033-08dc44919e19
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 01:45:39.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SQXIr3Lqj1pZmzqjpUDfocxwg4gjmEs0GgIQZDzB+c8KVA3pVX6s6KY7iCjE6YArakpoBTOO4yOXXXL+q8cuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
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

Hi Oak,

On 3/13/2024 8:35 PM, Oak Zeng wrote:
> Memory remap GPU vram using devm_memremap_pages, so each GPU vram
> page is backed by a struct page.
> 
> Those struct pages are created to allow hmm migrate buffer b/t
> GPU vram and CPU system memory using existing Linux migration
> mechanism (i.e., migrating b/t CPU system memory and hard disk).
> 
> This is prepare work to enable svm (shared virtual memory) through
> Linux kernel hmm framework. The memory remap's page map type is set
> to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
> vram page get a struct page and can be mapped in CPU page table,
> but such pages are treated as GPU's private resource, so CPU can't
> access them. If CPU access such page, a page fault is triggered
> and page will be migrate to system memory.
> 
> For GPU device which supports coherent memory protocol b/t CPU and
> GPU (such as CXL and CAPI protocol), we can remap device memory as
> MEMORY_DEVICE_COHERENT. This is TBD.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  3 +-
>   drivers/gpu/drm/xe/xe_device_types.h |  9 +++
>   drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
>   drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
>   drivers/gpu/drm/xe/xe_svm_devmem.c   | 91 ++++++++++++++++++++++++++++
>   5 files changed, 124 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>   create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c531210695db..840467080e59 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -142,7 +142,8 @@ xe-y += xe_bb.o \
>   	xe_vram_freq.o \
>   	xe_wait_user_fence.o \
>   	xe_wa.o \
> -	xe_wopcm.o
> +	xe_wopcm.o \
> +	xe_svm_devmem.o

Minor, but maintainers want above alphabetically sorted.

>   
>   # graphics hardware monitoring (HWMON) support
>   xe-$(CONFIG_HWMON) += xe_hwmon.o
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9785eef2e5a4..f27c3bee8ce7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -99,6 +99,15 @@ struct xe_mem_region {
>   	resource_size_t actual_physical_size;
>   	/** @mapping: pointer to VRAM mappable space */
>   	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +    struct dev_pagemap pagemap;
> +    /**
> +     * @hpa_base: base host physical address
> +     *
> +     * This is generated when remap device memory as ZONE_DEVICE
> +     */
> +    resource_size_t hpa_base;
> +
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index e3db3a178760..0d795394bc4c 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -22,6 +22,7 @@
>   #include "xe_module.h"
>   #include "xe_sriov.h"
>   #include "xe_tile.h"
> +#include "xe_svm.h"
>   
>   #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>   #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		}
>   
>   		io_size -= min_t(u64, tile_size, io_size);
> +		xe_svm_devm_add(tile, &tile->mem.vram);

I think slightly more appropriate call site for this might be 
xe_tile_init_noalloc(), as that function states it is preparing tile
for VRAM allocations.
Also, I mention because we might like the flexiblity in future to call 
this once for xe_device.mem.vram, instead of calling for each tile,
and easier to handle that in xe_tile.c instead of xe_mmio.c.

Related comment below.


>   	}
>   
>   	xe->mem.vram.actual_physical_size = total_size;
> @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>   static void mmio_fini(struct drm_device *drm, void *arg)
>   {
>   	struct xe_device *xe = arg;
> +    struct xe_tile *tile;
> +    u8 id;
>   
>   	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>   	if (xe->mem.vram.mapping)
>   		iounmap(xe->mem.vram.mapping);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_svm_devm_remove(xe, &tile->mem.vram);
> +
>   }
>   
>   static int xe_verify_lmem_ready(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> new file mode 100644
> index 000000000000..09f9afb0e7d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_SVM_H
> +#define __XE_SVM_H
> +
> +#include "xe_device_types.h"
> +
> +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
> +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mem);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
> new file mode 100644
> index 000000000000..63b7a1961cc6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/mm_types.h>
> +#include <linux/sched/mm.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_trace.h"
> +#include "xe_svm.h"
> +
> +
> +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	return 0;
> +}
> +
> +static void xe_devm_page_free(struct page *page)
> +{
> +}
> +
> +static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> +	.page_free = xe_devm_page_free,
> +	.migrate_to_ram = xe_devm_migrate_to_ram,
> +};
> +
> +/**
> + * xe_svm_devm_add: Remap and provide memmap backing for device memory

Do we really need 'svm' in function name?

> + * @tile: tile that the memory region blongs to

We might like flexibility in future to call this once for 
xe_device.mem.vram, instead of calling for each tile.
So can we remove the tile argument, and just pass the xe_device pointer
and tile->id ?


> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res = devm_request_free_mem_region(dev, &iomem_resource,
> +					   mr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start = res->start;
> +	mr->pagemap.range.end = res->end;
> +	mr->pagemap.nr_range = 1;
> +	mr->pagemap.ops = &xe_devm_pagemap_ops;
> +	mr->pagemap.owner = tile->xe->drm.dev;
> +	addr = devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start, resource_size(res));
> +		ret = PTR_ERR(addr);
> +		drm_err(&tile->xe->drm, "Failed to remap tile %d memory, errno %d\n",
> +				tile->id, ret);
> +		return ret;
> +	}
> +	mr->hpa_base = res->start;
> +
> +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> +			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> +	return 0;
> +}
> +
> +/**
> + * xe_svm_devm_remove: Unmap device memory and free resources
> + * @xe: xe device
> + * @mr: memory region to remove
> + */
> +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mr)
> +{
> +	/*FIXME: below cause a kernel hange during moduel remove*/
> +#if 0
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +
> +	if (mr->hpa_base) {
> +		devm_memunmap_pages(dev, &mr->pagemap);
> +		devm_release_mem_region(dev, mr->pagemap.range.start,
> +			mr->pagemap.range.end - mr->pagemap.range.start +1);
> +	}
> +#endif
> +}
> +
