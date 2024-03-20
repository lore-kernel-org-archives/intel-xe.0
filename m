Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A8FC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 19:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A810ED9D;
	Wed, 20 Mar 2024 19:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLUmzYHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BE410ED9D
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 19:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710962371; x=1742498371;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cU23MZSf3VR10n8mP5DU1rVN+CQl19Afy0n8nTyGIus=;
 b=iLUmzYHN3eTKq8ZaX2Pnz6Qlz7lp0g+e/3/0XXGRos8wosT0Xqk4Xdt4
 BfYvljxpbGe57wCSVNVyNUsQhQIiwXYKXms7vU7Y+ksAkYGPY5QbIBQ5+
 WxdMHufy10k5B7z6uHQOl6r6AM7sg8JFvQgW5rOQ3gmRjvA3w1pXUhzhd
 Ka3kCtOWFfC9W5UmJ9XsxXyZZGVCMd1SdJs2ITcs4hpyo2m7nJSfJPa9E
 SYv0+BZ1uHU0CXBMNZocaLUWztquY24t4TQUVMeKlmGgWpHXdzao7B3dK
 khqj3QcS6GhA0HZHgm6l2sp12VSy0yw7WDOssRlV+dFQKlOZ1j5Excegr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6121246"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6121246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18892160"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 12:19:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 12:19:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 12:19:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 12:19:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEyVV//5VqPZlvCXSg/b4fTSLfqIPyJHFTaj83/byMyAapgmDEs9P5J3Z17giK8I8aJpYKuqjM/FF2VG0YbSmWsaWj2TgudKQQnoPCn9CCGwmkMJ2fGA0P2hWD9DAdAeCkVtVMt51mh3IfC/UedlBZq8W07mI9JChGXNNYJUIqnH/KiZGSIWxcE1NwL1Fjajpky49bvHrVFwriXyuvusCThrkwvGfBVkgPSrcQBES9LptAS5NkWLy3X9oWRm4pbHU1FIrgqObdlq823z/dD2Eyt0qbOxvY6MM6NK9Qv65mn1NTD28Fi8v6DDcGLoltGNfsGhyHE2/t2pniuzNqKhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8xJzN3IaRbS4F0cVMXZzQ9M6jr4DYsuyAkAuQEruaQ=;
 b=i1hw/Eg3g5llG5Zgv7q/0SYTeuSE2iKiKyVevBY9uQHa1laNKI4sSZawesx0qcRO5XUx79dDzNB9qJ8EPvArx2VvOk9o3aHCCNhpj6n/LVW73AYGzKxhWbgtAprR6URE+3Cs9qQswyzKRBq25vLT+Mmc7k5zb73dAW6sQWlDPId1x81xczPrwfqDJFdY7WiVwNiuKlOzCYcZhzz1NDZ+AS2puUQHFIVuea6U+GFukRzbrhG7eUJRGYl3SR28E3xQAKYTatMy5LFevaQjAoxtfmGM20BsxRlhVXG2QtXZyOguklf1KoQBVSevAceVMJIEkJ9Qfo3VS7uFOShuPERpgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 19:19:24 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a%6]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 19:19:24 +0000
Message-ID: <54d798da-128c-4f79-8fdd-ac04021b5fec@intel.com>
Date: Wed, 20 Mar 2024 12:19:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/xe: Introduce helper to populate userptr
Content-Language: en-US
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@intel.com>, <matthew.brost@intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20240320034425.1785007-1-oak.zeng@intel.com>
 <20240320034425.1785007-7-oak.zeng@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240320034425.1785007-7-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: d79fdfbc-670e-46eb-a367-08dc4912a767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXnxb/lDdowxzXfV15YARjNPButmSKJlL8bBUuS50saaIrKZLiTXaTlqpqsUYaJgaHtLLH3x3cY16xJm0E+71YbH0QpE3v+o53P4SHzltaKdZ3qNJajBT7kfMLRhV+a1lHp8eXUt/enmPDhHLb8MTLDJPxQ/xbTuKHz9s9WXhavf7DPZ+sZRWIjWkzDJU/HaHDeuWciaz3cFzPZ/lEg3mn9YMjK7lyev2f2qvqjzJSOhzpHK6ZgiLBEwf+gEUiMlcNOs0x35gIdyhYNuQ94bX/rRqAzMgrnmPjAPzPumswMLeaYMXg+DLP9K5izhb/04uMkDqT1OkHaOWFgUvVCMOaHuksAzYu3mCCMwZy7DpCz7Yl/kP07ClosEiv22LzLCHZ06Aq9yUW2CwjVT7pw0+p93L6owMdEZEpUh5u5VvV1H53YYtTQejQH1W6pcrMzbR0+CH2Ka3zRAAAaSG78dyDKO71BQia7V0wlM2ZkPgYNEmRruYBhygAf4fHGMkUyTY6pw/rtz0qIFMzcoLjOE0Qrw3A3DkUlEKj3i/P+choAaadURDPaewB/YaD8HxgeuLXugO0CTsbfyNJm2jGDDWXyFWjYkKpW04kQ+fJDodsQqZN7Y+dfaG6ilvUl/+7Y3u6n0NMip0xz/eFm1uPhfuNBlyr/+VvYrFT95zk66LhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1I4RXY1NGRDdWhpS3pZVGtBL3plMm1ZcExBUDUzbUtYUlYrL082dGt1alRM?=
 =?utf-8?B?ai8yZDl4MEl6ZGZHOThLOWoxMzZJUW9qaGN5SlNWQU5lTjdOM3g3a0ZKM0xi?=
 =?utf-8?B?NGlXUG9zZlBhK2RRVEdINHF5c1dicDdEM2pyTEZLMHZrZThqV0JxYUtoYjg0?=
 =?utf-8?B?MDlBUXJtWlJIRmZ5S2RaQ2w0OE5DLzllNGc3ek5nZFhGRUdyc2NveThxZFo3?=
 =?utf-8?B?YnRMa2h3OVQzeGxsdnBTQjY4QytTY1QzejBUZVI2dytkQmJuMGtKdSs1VlEr?=
 =?utf-8?B?d1Y2Zm1NWm8rRnZ1VVZEa1crbXZ0UmsxT0x5WWlaOXlwQ00xTlJRMlI4M3p3?=
 =?utf-8?B?Ly8xNEh4aU5xTnF3b2h0TjNWdUVCcnBDeVdIR2dCS25qTzE4NFdiMkt5K1E5?=
 =?utf-8?B?cDFLdFVVMnA5T3pnalYzcERpeWVqTGxXNXNvbTJHWldvYm8wRStMbFVXM0pp?=
 =?utf-8?B?dTZ0aklhaHdBTkl6aFBrNlViSmZLVDFYYndOMjcrRWJHWkZHZFk5aGFmMlR2?=
 =?utf-8?B?K2lLRmw2NStHaTg2Y2tJem9WMytQQUdsamgrS2MyZUhzWm5CRDMyVDJZcVpw?=
 =?utf-8?B?Tm52aXRJQVlXL0RtZkdSVGpTMWZLZ1hUTHppV3BWdExDZWZWZlpwZnZCYlRy?=
 =?utf-8?B?WlhzUG9wakJ4YzdZWWtUZU8rTEhERzQyY21qZ200b2NLcmd3M3haUTVzTnhz?=
 =?utf-8?B?ZFVTQnAwSi9rU3lvK0QvdURjMmMyRmtRYmppdUk3NlhORisxVEl1dHdpZ3NM?=
 =?utf-8?B?UDhzVjE4T2swdjh1TEI4NkJRUmdvU3RkbHdDSmoyeWFrSnpGbk1EV2V6R0tj?=
 =?utf-8?B?Y1dZZmM3dDRyU2VaSzRBY05YcmFzK1RhaElsYmN6QnlJbUhkNTI5MGx3dk1E?=
 =?utf-8?B?am5JaFFSTTMwbERYNTQwNzV3cklNNWxYbG13MjZYNittcGl1QkdQeXRtV1h6?=
 =?utf-8?B?clFpcnY1c2k3SWhmdTE1NXRvR1oxZXFzTXF5V0ZhampRdXFUTEhLcU4rQ09n?=
 =?utf-8?B?cWFscmY1MmdFaTZMQjMwMTJtU05PK3F0aCtTZFRBK3d5UC9oc1Q1ZS9oSmcx?=
 =?utf-8?B?OTFzVzk2LzlUVWF2YWx1SnhqOEpVU3B3SEtsNXRHMHJ3VUprakN6d1hqczBM?=
 =?utf-8?B?SzVYNGtDYmFLM3ZJcmZCTmJBMC9uNkcvbUR6MGNYM25iTGIrOUNLY1lNeWxF?=
 =?utf-8?B?aXJHM1BRRlA3L3A4aERCZDA4Yjh0dm16Q3FvamNucllWd0FYMjBIOG1MbmFW?=
 =?utf-8?B?amNWdTBKVEhQNGlneFNMU2FjNUlaMzU5Tm5oVXplQUpsQjA2ZWRYenpoNXZW?=
 =?utf-8?B?Z1F3VSt4ckZWbGtPS3JnUUdzWEorMUIrbG4wSTZ4ejduN3hNc09JY0NhZEcz?=
 =?utf-8?B?TUtVN1ZRaUFUQXlvc1NqUVNvelY3RDBxSStDK2xYRjZPR1BWWk9SZFlXbjc0?=
 =?utf-8?B?dTVGVlUycWRSZHlYNmV2blVtOVBKKzJMdUFNUzg0dVlmRUpNK1RkWVIwVDFS?=
 =?utf-8?B?S3haT0puckRuVmpsU2t1cDE0ZC9kU3pReHRuMWw4c21OYTVleHBReDQ4Mm4x?=
 =?utf-8?B?c0wxSHNJTUpOSDlmRGpzM2pQMmZqekdhaFRJTUhxaVRuUnhoeTRTWmdJS3VH?=
 =?utf-8?B?QUVSZmViQ1pSU1RTbzBlbjlFdHp4THF2bnUxT3NzUGZDSmpRblNpV3Q3UGMz?=
 =?utf-8?B?Wkp1d2hpRUNSK1hMWTlvZjJld3paWEpxcVpubHhkWFk3Q1hrVzVETE4yTVA0?=
 =?utf-8?B?MWlQcFcvYlVnSzV6UTZwZDFQbHNrVitNSTQxS3FFcFJsNnV0bFlYUVpHcDBq?=
 =?utf-8?B?N2xnVzdDWVpsK2I3eEtiZTVzL09mR0VhbjRoRXRyMU5IVEFucUNXK29CUTl4?=
 =?utf-8?B?QlF5MTdOTzZQSmlEam5OaEpZSGQxVlJhNW55cUpLRldLRXBUd2pzRFV6blJu?=
 =?utf-8?B?ZTFGYnRlVllCbFQxSytyUnhDaE9yeTRaTnVRQS85UThCaitieFRMOFZzVkM5?=
 =?utf-8?B?WFpjMk52bnVjdGtad1BBcExxUjNML3ZSUTdjWFc0NzFyUkdDdWNJdEZ6QW8y?=
 =?utf-8?B?NFpQbFB6ajI3WkQzTlBFbGJIbWMrM1RRSkFjUjdabU9DS3RaL3p5UXlOK2hC?=
 =?utf-8?Q?BOc+DYwNSWkGDhmyYLrKlmBrr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d79fdfbc-670e-46eb-a367-08dc4912a767
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 19:19:24.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JtE6zRScZW13BCTemuqv0y4k4+fSRFr8tvHEe6m1bc4/Ga0uBdNup7HZykvoxmaKp2CH1qNuOtJtLvSH9v8aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
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



On 3/19/2024 8:44 PM, Oak Zeng wrote:
> Introduce a helper function xe_userptr_populate_range to populate
> a a userptr range. This functions calls hmm_range_fault to read
> CPU page tables and populate all pfns/pages of this virtual address
> range.
> 
> If the populated page is system memory page, dma-mapping is performed
> to get a dma-address which can be used later for GPU to access pages.
> 
> If the populated page is device private page, we calculate the dpa (
> device physical address) of the page. This will be handled in future
> patches.
> 
> The dma-address or dpa is then saved in userptr's sg table. This is
> prepare work to replace the get_user_pages_fast code in userptr code
> path.
> 
> v1: Address review comments:
>      separate a npage_in_range function (Matt)
>      reparameterize function xe_userptr_populate_range function (Matt)
>      move mmu_interval_read_begin() call into while loop (Thomas)
>      s/mark_range_accessed/xe_mark_range_accessed (Thomas)
>      use set_page_dirty_lock (vs set_page_dirty) (Thomas)
>      move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> v2: Remove device private page support. Only support system
>      pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)

Are the prior patches 3, 4, 5 of this series no longer used?

I searched but looks like they were used in older version of this series 
when you had the device private page support.   Unused now?

For the small helpers which are only few lines of code, in my opinion, 
it's nicer to squash it into patch where first used.   Makes it easier
to scrutinize it based on first introduction/usage.


> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile |   1 +
>   drivers/gpu/drm/xe/xe_hmm.c | 225 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hmm.h |  10 ++
>   3 files changed, 236 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e2ec6d1375c0..52300de1e86f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>   	xe_guc_pc.o \
>   	xe_guc_submit.o \
>   	xe_heci_gsc.o \
> +	xe_hmm.o \
>   	xe_hw_engine.o \
>   	xe_hw_engine_class_sysfs.o \
>   	xe_hw_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> new file mode 100644
> index 000000000000..e5719cab0c3d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/mmu_notifier.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/memremap.h>
> +#include <linux/swap.h>
> +#include <linux/hmm.h>
> +#include <linux/mm.h>
> +#include "xe_hmm.h"
> +#include "xe_svm.h"
> +#include "xe_vm.h"
> +#include "xe_bo.h"
> +
> +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> +{
> +	return (PAGE_ALIGN(end) - PAGE_ALIGN_DOWN(start)) >> PAGE_SHIFT;
> +}
> +
> +/**
> + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> + * have such information for memory eviction or write back to
> + * hard disk
> + *
> + * @range: the range to mark
> + * @write: if write to this range, we mark pages in this range
> + * as dirty
> + */
> +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
> +{
> +	struct page *page;
> +	u64 i, npages;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	for (i = 0; i < npages; i++) {
> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (write)
> +			set_page_dirty_lock(page);
> +
> +		mark_page_accessed(page);
> +	}
> +}
> +
> +/**
> + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
> + * and will be used to program GPU page table later.
> + *
> + * @xe: the xe device who will access the dma-address in sg table
> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> + * has the pfn numbers of pages that back up this hmm address range.
> + * @st: pointer to the sg table.
> + * @write: whether we write to this range. This decides dma map direction
> + * for system pages. If write we map it bi-diretional; otherwise
> + * DMA_TO_DEVICE
> + *
> + * All the contiguous pfns will be collapsed into one entry in
> + * the scatter gather table. This is for the purpose of efficiently
> + * programming GPU page table.
> + *
> + * The dma_address in the sg table will later be used by GPU to
> + * access memory. So if the memory is system memory, we need to
> + * do a dma-mapping so it can be accessed by GPU/DMA.
> + *
> + * FIXME: This function currently only support pages in system
> + * memory. If the memory is GPU local memory (of the GPU who
> + * is going to access memory), we need gpu dpa (device physical
> + * address), and there is no need of dma-mapping. This is TBD.
> + *
> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> + * memory. Add this when you support p2p
> + *
> + * This function allocates the storage of the sg table. It is
> + * caller's responsibility to free it calling sg_free_table.
> + *
> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> + */
> +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> +			     struct sg_table *st, bool write)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct page **pages;
> +	u64 i, npages;
> +	int ret;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npages; i++) {
> +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		xe_assert(xe, !is_device_private_page(pages[i]));
> +	}
> +
> +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0,
> +			npages << PAGE_SHIFT, xe_sg_segment_size(dev), GFP_KERNEL);
> +	if (ret)
> +		goto free_pages;
> +
> +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> +			DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> +
> +free_pages:
> +	kvfree(pages);
> +	return ret;
> +}
> +
> +/**
> + * xe_userptr_populate_range() - Populate physical pages of a virtual
> + * address range
> + *
> + * @uvma: userptr vma which has information of the range to populate.
> + *
> + * This function populate the physical pages of a virtual
> + * address range. The populated physical pages is saved in
> + * userptr's sg table. It is similar to get_user_pages but call
> + * hmm_range_fault.
> + *
> + * This function also read mmu notifier sequence # (
> + * mmu_interval_read_begin), for the purpose of later
> + * comparison (through mmu_interval_read_retry).
> + *
> + * This must be called with mmap read or write lock held.
> + *
> + * This function allocates the storage of the userptr sg table.
> + * It is caller's responsibility to free it calling sg_free_table.
> + *
> + * returns: 0 for succuss; negative error no on failure
> + */
> +int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
> +{
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> +	struct xe_userptr *userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	u64 start = xe_vma_userptr(vma);
> +	u64 end = start + xe_vma_size(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct hmm_range hmm_range;
> +	bool write = !xe_vma_read_only(vma);
> +	bool in_kthread = !current->mm;
> +	unsigned long notifier_seq;
> +	u64 npages;
> +	int ret;
> +
> +	userptr = &uvma->userptr;
> +	mmap_assert_locked(userptr->notifier.mm);
> +
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +		return 0;
> +
> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> +	if (notifier_seq == userptr->notifier_seq)
> +		return 0;
> +
> +	npages = xe_npages_in_range(start, end);
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (unlikely(!pfns))
> +		return -ENOMEM;
> +
> +	if (write)
> +		flags |= HMM_PFN_REQ_WRITE;
> +
> +	if (in_kthread) {
> +		if (!mmget_not_zero(userptr->notifier.mm)) {
> +			ret = -EFAULT;
> +			goto free_pfns;
> +		}
> +		kthread_use_mm(userptr->notifier.mm);
> +	}
> +
> +	memset64((u64 *)pfns, (u64)flags, npages);
> +	hmm_range.hmm_pfns = pfns;
> +	hmm_range.notifier = &userptr->notifier;
> +	hmm_range.start = start;
> +	hmm_range.end = end;
> +	hmm_range.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
> +	/**
> +	 * FIXME:
> +	 * Set the dev_private_owner can prevent hmm_range_fault to fault
> +	 * in the device private pages owned by caller. See function
> +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to the
> +	 * device owner of the best migration destination. e.g., device0/vm0
> +	 * has a page fault, but we have determined the best placement of
> +	 * the fault address should be on device1, we should set below to
> +	 * device1 instead of device0.
> +	 */
> +	hmm_range.dev_private_owner = vm->xe;
> +
> +	while (true) {
> +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> +		ret = hmm_range_fault(&hmm_range);
> +		if (time_after(jiffies, timeout))
> +			break;
> +
> +		if (ret == -EBUSY)
> +			continue;
> +		break;
> +	}
> +
> +	if (in_kthread) {
> +		kthread_unuse_mm(userptr->notifier.mm);
> +		mmput(userptr->notifier.mm);
> +	}
> +
> +	if (ret)
> +		goto free_pfns;
> +
> +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> +	if (ret)
> +		goto free_pfns;
> +
> +	xe_mark_range_accessed(&hmm_range, write);
> +	userptr->sg = &userptr->sgt;
> +	userptr->notifier_seq = hmm_range.notifier_seq;
> +
> +free_pfns:
> +	kvfree(pfns);
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> new file mode 100644
> index 000000000000..fa5ddc11f10b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +struct xe_userptr_vma;
> +
> +int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
