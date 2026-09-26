Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1F3C9830E
	for <intel-xe@archiver.kernel.org>; Sat, 26 Sep 2026 01:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D09010E0CC;
	Sat, 26 Sep 2026 01:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctERESoo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB46710FD1E
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Sep 2026 01:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790387861; x=1821923861;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TlQ9h36Z04W1UkbDKdDnI+u/KGmw06tBOLxSmmYan6M=;
 b=ctERESooc//v9XRpUNC32sIKDP3tufqucc+KHSOyJ5EQrNsJPHMvxgjo
 UE1NwLsga7BKaRCsaon9qiKu+Iw1seTK0B8TXQM/pTro4EqsPtBf+J+zm
 uGEv3pZgstAUVBZXgDSGWK5awU/kIB+7pqYmpJ16xljnkoGgZuZ2xFIaI
 zI2JtQFn4m8wwAiEacOxl19MiaZRz6yUwbfBGAJLo8/IVKuC4/q89qXFx
 jBEuP+wBnt3uern8KXw+SqFoVAPU9MySKEFweKl7dnQ67SmLp8OAErGyD
 KgudV3l2vevpwb0QEUytunNMy6nRmfb2bFZRkp+mbOoPHkle5WzEYxoBS w==;
X-CSE-ConnectionGUID: o2MH1+kISUKE/pr19TfJ2A==
X-CSE-MsgGUID: NEAkmRPiSUioCJ2vhSm4Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="112962288"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="112962288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:57:41 -0700
X-CSE-ConnectionGUID: 2NGrhUZpTQaMrhcXtvQ7BA==
X-CSE-MsgGUID: xK3KEb4tR7+nPRtYMTs1Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="273582166"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:57:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:57:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 18:57:40 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRXkxFHhysE5WNf3sgKxJrMtgaEPFVWYZ02m10bqqwwsb0tPzHWP4gjIVsJ776f/KJqdsL3/UDU/RKB07fNP51yNv+e3FONrhsCZrwXd6xLhZRENPuFwf/f3FzhpNS31NL5GMNvH75ZncA6YsIHo9Rs8dpkcd4xdnBVAjwqUGXk9hwZH1YywEKFSRTU7WJb+rJQkSeHoWiHpFxWu1hcg6vZHTrfxXEEDgNmJIZMY3KnPvms1loo1H4oK028ADKI51eLr65iKoNY/MDzkv91i2KpWbM2NFd0NFAnMq4Moj6wl10dmiwQtQqSlL5m+BVitugUzRiNSxAzXqcuRPpMswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIbEKOx7qs8rNRrFFrutdkutWzOqmFkKJj0KHNYle5E=;
 b=gqtddEwx+OL7FmPiBb4ojZmnj6JWoKbENAO+fONVHIIBoVx6XMt8ReNVezH55LUwW378gsCMe/PAhoEncuh0rxexEtsXedEq2UsuHxVbatPO+7BMsH4e48roIKwmMt+hVrXU1o8NfQz/VjwaxDZ/9gYxSRFVqSM9e69+8CVjuYnX/prXVCbMcSv42qvt0mqYiIgqDnWUT3U94Ys63eentwT6XMcYkv1xtypSsKL2knlB4/GNvrucAx0QUqBQCG3jOD9uUh0cOC6Z/z9lncnCIrHx1B6ILvYV/mYoWYjnDegczetB2F/2mJF6ICU/tdbi6BiW/3i7zBDcdSFR8dzcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PPF5812CE227.namprd11.prod.outlook.com (2603:10b6:f:fc02::509)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sat, 26 Sep
 2026 01:57:39 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 01:57:38 +0000
Date: Fri, 25 Sep 2026 18:57:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/4] drm/xe: Bump prefetch BO LRU for already-valid
 ranges
Message-ID: <arcmkTBpBaB0v1bV@gsse-cloud1.jf.intel.com>
References: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
 <20260922043759.3057442-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922043759.3057442-10-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0147.namprd04.prod.outlook.com
 (2603:10b6:303:84::32) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PPF5812CE227:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe18ba4-3fa9-45e5-0be2-08df1b718b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +MWgJ6f3NDUMN59CULUXmtxSElRjn2ZNSYEmSSM+s8VcKnF4FhzYK6fmSc+EifXuAAS3JleUWJdtEea8pqNyiTVzm7GqEzeD/QkJPwCcCFadwXJPoiCU56SOZjL44wFnLZDNY9jG1vQ80+5dn1u1o2NVjXJdHRgSYBY/Qo6vHyZ+XrbxLxHZG9YLPqp1Yn5lRN2OULJQs7x3tXc5hQppk6taLFOETjXu4b3Y8hguHFioTqEYNxIJzCS7nFnJJu5k2EBhseLVqTqYYpz1KKqZ5ALmZr7c3rc444wIcq+9A35DA0DgLWmj1AqCeVRR+xl9/ACBV7jrlfh//y3ZxgX4q5Rw0PruLmvI5oms74SLVxicR2rfA2fbbr1BpAMrf222GeASW3HnUbZV9Y21jqW078Z12ZpOnOKdaAu9TzOlP1t1GvUHWtO8hFh6wN3ry0mF2GY1hhhbmNLO4VHDAgkhjLf4NJxhY2EFVcum0tsd0xURTDXZzPZ9N6w5ikMTjbXTry8HnA4Ma740m1S9TtQvKediKdxnK/WAwSPjqJbnZlYRwKZ9TPobMm6Iy6YpfHQzhZ+POjmDpWk7Dt84w5d+pqa5jJacDWLmzy0dR6xJrTDG3JphkHAHgnsiSXJnw2WsAUduyReSUYqbWHn2BP2Y1ntJgSR3IwL14CuSQvrI1ww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWzkEU8r0nh8XZ3Or7iSD4ycN2uA6y++vvKAr5LyxPrnEJRwgyHyBxfwEVKR?=
 =?us-ascii?Q?Chy5GtbovCLU4+xMgdmS5DIamzvD0hGOP8cZBXylsLu1+awA7oyya4qOqOsV?=
 =?us-ascii?Q?llJRtsLXkaFFWFLqADrc0PVSsu9XkeNJ4IdeO6URkkuQzSGEmg9TBuWhfMYm?=
 =?us-ascii?Q?Fx45THIZjwOw4TCWh2j569lW7Og4UaElFN6e94VovH1Ko1u7BhMwiuk2VSSj?=
 =?us-ascii?Q?+WrVin880utFOIW/hvZ9CFz20eXX57J4fg5rjzT4l7poam8t9Urav9aFWNDf?=
 =?us-ascii?Q?JsOW0hdNLyKdPpkXtyVeWNvsD5I1/Zap5jdZVHgCQ1B+M2sdVediXCWptdex?=
 =?us-ascii?Q?dMCHC1oKP2GqfQUbl1lvXPbFh3rIUjmm91oA0j5lHaZtNPjOW+n00XHkSCGE?=
 =?us-ascii?Q?4C+KdtYNUr21Cd3fM7VkTrFQnONvzE6XGJaCqX5qcyH+utBWqNUsAI0pmVm+?=
 =?us-ascii?Q?dlqimm7isyyEkKopLrBRVxAkaVzT44E8NU8S4Zr4uPIJbc/j2G05C36hF39H?=
 =?us-ascii?Q?KXg8QbtWaPVtZ6j8UTfKNkIPRGo/N1qhTGLK0a9CcMxRaUSQjjH8o/W4A13q?=
 =?us-ascii?Q?0BuwqxHYvwod+Ty+cYL6MI5HQsTb5fWkm6oC7SQJVD9YqR0XYNmh5rPpHoZb?=
 =?us-ascii?Q?9giKTgj0yYIAGFbkbK3emAhhggYTzLo/ivqRu/jlEdXdksR6UzpAuKeMaWCh?=
 =?us-ascii?Q?dqRhrsr+kW3zXerHOjiG5ITJB3QxScGcS5EviDmbWtZu58DmGCcJqCtZVRcs?=
 =?us-ascii?Q?oufjrezgtNp63JCHMGbPYWKodG9Rght+1H9cyam36Hh6uixLB7uZ+qLRgHMx?=
 =?us-ascii?Q?8dinw5b3w01V631fWpxWoqSCb9C5hPaJGkCTQxG8YQbgv13UcJFByQVeIcMd?=
 =?us-ascii?Q?APrxkIJt5Y19prswDZLY4TUMIHroAAMNaJCj/k1DfxsOy7BduYNpyO35zV1f?=
 =?us-ascii?Q?7Kp3kHfpQzSTto6Wvf5nW6S0xtMqFSEl2/lOskFEBL3q8zulNYvXwha21Lha?=
 =?us-ascii?Q?CC6mMLSgHV560KQiqy02DTAUwAX7k43PvDbYk3oc7sn8nblZwbc+0MBs2hvB?=
 =?us-ascii?Q?pavguU7N/ZbMx+W8fEflXzbtRFP62vcyI7pBHpPKD541ousvyfUX1VWMBy1k?=
 =?us-ascii?Q?0zypwC+KIcQ20rFS4YoERo5d2C/bdAUH6x1biOHtINarTjKzM9CWQRvPrCHJ?=
 =?us-ascii?Q?CsM+tp7+cp7g1VGt++RD9XdX0x8dbfKo9tA0sqbhgMLoCMN+NLeBNTdTosM0?=
 =?us-ascii?Q?yUn/jWE//6ERbxGjxdcsBn53RrD3HQObue7H4YGrumzRsBvLNJcn+0UVOWyI?=
 =?us-ascii?Q?6w+xYpRhJHJUf2ufONNCSlRQVyuTlMIQ9ZwdsimvR6ZCymGOGIBZk14vmqH8?=
 =?us-ascii?Q?o00XI0OjV7pvzp2XxcaVW+wsLOkHjPzY5bzljduVbSKquRfb8xWchH+YqwPz?=
 =?us-ascii?Q?Bw1TYDjmBDsNm3pF57jSpok2Co72Cuyo0vxQwVUMCWPtVXcxXd4l08y/lwbE?=
 =?us-ascii?Q?dxeOylekVMIlscf8ekwEkxM7sPDhOoCVjZkO+DT8TVejGIy7ZnVpIiBpxpsC?=
 =?us-ascii?Q?Qn7B9v49f4AVyjCwor6e+6i3xIGb24E8PVMHZfYxjVeItWaH1YieWhECEsGX?=
 =?us-ascii?Q?qqerqD3MFAPAPCvDlcN8g6JSb5/Fuot60y8bkoY+r0h+1pqRrYdYsperBFr8?=
 =?us-ascii?Q?/N+Mzarjmn6G4wTT5FdLWA8pr9wKi9l2ue63Civ2R3XxDxt7w33aemJi5WSU?=
 =?us-ascii?Q?2X023VPuRP3alxFSzKiUFFWpUcYI5Cs=3D?=
X-Exchange-RoutingPolicyChecked: HmL8q0GIIVNnG/wPvmv5j8LYS+ilmSn9qjztroTVhmVKlaLpcdAryNEWqlyXoAFqx7/dxaiWqHKfAeVt3JZkyfIHgjuZgCYT1PyApmG6e48+NDTW7G7XkERI8/QKcYAE5ANrXS963IVdX2zrSOgUI5oS8VlzFvzLypezXU4fM2apGFCHShl6fTE++P+Z41WB9Ee9JvswXliFbeSZMUDY2bDj2dLLilUTVpAIKjdb+d9LbR+5LbRAjWbRuXhDEtddHnCYbotKKkTLGGMJRHiUOs5yym3zu2B1mLND6wLqxiK/kuCLnpsj2F9BauOYKIv6p4ANgiz8xIe7zvxEHhbPTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe18ba4-3fa9-45e5-0be2-08df1b718b0e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:57:38.9451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpssyKY8vsFrvanQel1M9nRTY57RuAAU2vwWmsVUujTU3ANX52MDUNbz0p7UecqvLK01M2WuFIAICKpy4cCyeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF5812CE227
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

On Tue, Sep 22, 2026 at 10:08:04AM +0530, Himal Prasad Ghimiray wrote:
> A valid prefetch range skips migration and binding, so nothing refreshes
> its backing BOs on the LRU. Add xe_svm_range_prefetch_lru_bump(), which
> re-faults with no_dma_map and bumps each backing BO, and call it on the
> valid path.
> 
> v2
> - Make function failsafe (Matt/Sashiko AI comment)
> - Add stub for function
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_vm.c  |  5 +++++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 018836ecbb06..10f81086f183 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1655,6 +1655,40 @@ void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
>  #endif
>  }
>  
> +/**
> + * xe_svm_range_prefetch_lru_bump() - Bump the TTM LRU for an already-valid range
> + * @vm: Pointer to the struct xe_vm
> + * @vma: Pointer to the VMA covering the range
> + * @range: Pointer to the xe SVM range structure
> + * @dpagemap: Target pagemap of the prefetch, or %NULL for system memory
> + *
> + * A valid range skips migration and binding, so nothing else refreshes its
> + * backing BOs on the LRU. Re-fault the CPU pages without touching the DMA
> + * mappings (@no_dma_map) and move each backing BO to the LRU tail.
> + *
> + * Prefetching is a best-effort optimization, so any failure is ignored; a
> + * later fault will refault the range.
> + */
> +void xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
> +				    struct xe_svm_range *range,
> +				    struct drm_pagemap *dpagemap)
> +{
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +		.device_private_page_owner =
> +			xe_svm_private_page_owner(vm, !dpagemap),
> +		.no_dma_map = 1,
> +		.devmem_fn = xe_svm_devmem_lru_bump,
> +	};
> +
> +	guard(mutex)(&range->lock);
> +
> +	if (xe_svm_range_is_removed(range))
> +		return;
> +
> +	xe_svm_range_get_pages(vm, range, &ctx);
> +}
> +
>  /**
>   * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 585ad64b672b..ffc1cc808102 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -130,6 +130,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  
>  void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
>  
> +void xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
> +				    struct xe_svm_range *range,
> +				    struct drm_pagemap *dpagemap);
> +
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>  					const struct drm_pagemap *dpagemap);
>  
> @@ -363,6 +367,13 @@ void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  }
>  
> +static inline
> +void xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
> +				    struct xe_svm_range *range,
> +				    struct drm_pagemap *dpagemap)
> +{
> +}
> +
>  static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>  {
>  	return NULL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0fdc740f1a41..3d5c5f3788bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2584,6 +2584,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  						  dpagemap, &valid_pages)) {
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>  				xe_assert(vm->xe, valid_pages);
> +
> +				if (dpagemap)
> +					xe_svm_range_prefetch_lru_bump(vm, vma, svm_range,
> +								       dpagemap);
> +
>  				need_put = true;
>  				goto check_next_range;
>  			}
> -- 
> 2.43.0
> 
