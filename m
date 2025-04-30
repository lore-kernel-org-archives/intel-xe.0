Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E229BC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 14:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78C010E2F2;
	Wed, 30 Apr 2025 14:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fprwt1Ux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FCB10E2F2
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746024529; x=1777560529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=khS3lyfGNJaIQ9NP8mHMq8SfPpnBmVl2G8bRYOak/RM=;
 b=Fprwt1UxY/EK9WmYQKElva6iJzdRlIQuoKqyd/J3vAmvDdaequRZT35W
 +t4JviEI+MrLqCbY9bNDZSHiHP9JSzyCnzzNB2Cl+pfQW96ZcfHm5JuPK
 Gn13D5//aEkiT4Qr9uwpw2Dcg9Ll+6L2HzrGzw8Yjl0DlRxt04EavjZRH
 5PpecvD3FrowAETcksYFrj10/DE48uaGE96eawv9Hd4/bZ3wHBsz/Ea1w
 Oq0AhTR5FilqDUBtsDk470vvPR54B85GNJotXIGjOAYJ8g6xKqADUIh9A
 sHl8pbNvKUfckRAyY89KNmhVwjCoL5I6TZeBBzfM5oE4d5Qin70NnhG3r g==;
X-CSE-ConnectionGUID: lq+aSLt4QraJa1y4KnjIZQ==
X-CSE-MsgGUID: uaEls/fISDWMHPB4SUsKyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47407321"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47407321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 07:48:48 -0700
X-CSE-ConnectionGUID: CO2YFbxGQneS6VYt53JTeQ==
X-CSE-MsgGUID: D4vO4EIBSs6VTdzOPoGD9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134669844"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 07:48:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 07:48:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 07:48:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 07:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajtUzKUo+DZuaq2v4QUO6dfqiJmMtJ/64O6Su+j5CPkewMvf3KeI8mWR5HksT4J3cgKamfRUjA3cUG717QHTLq+C03/nPVuWm8vW/Qql8twoJ0zGhQRP3VhyemhjwouC+ADQmxOxEYlPcb2WYLCw57CJJbN0HZcLPgf3kSyt9zpGjMFvdn66zYvk6QQfyVSRk9wg308e+GRMSTaMcP1rA1P+0wpBRX89U8ZycVW5NwPS6UjIB1N6nryvnoRGvORuorRCKUQuvhwetCd68r4P/RFBC9f357WTBEcgW0YmfFAVLqLPOHnhp6QMSpnfWAA37vEJE7qqv9Y05MjBVlbzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W64VRYr33vhAfRAW4YveJvrOa+4KcccXaR2h318IVR8=;
 b=KwRJzcAoMXz/tY9yw4xbOGDEDoSPenxxAO00ksEJhQGm0u7UU6VU1zlQAPnZC3CWdRV6688MFdXntos3ZrZ7CeiutQh7tUJOxK2Uev9H4U6aJzRgMCf9jgRucXu49/BdW4+AuB8vecZ7jfIqy20RWCPoH7FfmEGyFdAA5cv5pehTsuclVrhAAfkEEabOjynt0w6BhQ2G/6oYAwtdLXoaitdNElGrj52DO/rkJ0/tcNMF0tiHdP1TTRDLl+U/uWySm/pTmmOJ0QvWNg5jkZ4eq7W2pXlm/Z7qK2/SqbFI6rnzCPUNffCP3WG94UAWfpfZ2wi/x8OCpXwlDLwoYFwdZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5945.namprd11.prod.outlook.com (2603:10b6:806:239::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 14:48:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 14:48:44 +0000
Date: Wed, 30 Apr 2025 07:50:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 16/20] drm/xe/svm: Add xe_svm_range_validate() and
 xe_svm_range_migrate_to_smem()
Message-ID: <aBI4nl6mNcXxMsQ6@lstrano-desk.jf.intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250430121912.337601-17-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR06CA0058.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c6670c-0fd0-4179-f38d-08dd87f61a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JdzkbcM+IjDu/pUGYtmViZ/3eFAD/MkI6eZLcEI8LH6WnKd5fx6eO7JjpBLp?=
 =?us-ascii?Q?24JO11ylyl1Ez4zHqX+hkHPoHTzuobhMEVL9lRGJeJqTy1nVS2IRL/XyZqR5?=
 =?us-ascii?Q?FV0AseKEGYuiv+7WwwtN0t2Dft5zQiXzq0kpz1JcLxPBFj49+K2x7gpDPZfh?=
 =?us-ascii?Q?7r0nS/Cu96Pw7d/hLGOInXGvkOSC5T7B4E15d+6q0YOVwqPPFngg7Og5sCLg?=
 =?us-ascii?Q?xrmbrI0JBfN1lafMlNanHXwEhZD9+hchcdu4q81xpxhAd5GDuoSVw5p/99Hq?=
 =?us-ascii?Q?FRdugq0Ke8DkaaqfGk6f5AEk+6oEPfIHo+Y2wOAMvB8VyZ1rPypTTEqitpnb?=
 =?us-ascii?Q?D1xApQyFPQynUc90tXLFt4NQvophfGZpUh72dzrZHCGZf48E4vT6HI1ZdxyZ?=
 =?us-ascii?Q?gZLXqlI1e/878bDUd9Qw3qdQ05IH8vGhYem0DiJ9jw6qNB8oWlPahOUFnRUl?=
 =?us-ascii?Q?fzwtfesmZu2swUghFCsGvMmRtvdE5bsUxUmUzcndXJ7VR/qGaV1OqROqNzsX?=
 =?us-ascii?Q?rzFocvYj2XNu0w5qT7d6MJp5kF8hVZZqGa3ZRIZp2SfL7pbtR/VLu2VOL8d0?=
 =?us-ascii?Q?3IdLIIxP9vrEh71pfIe5+xtuFoDf03Eu9aAUmrtTcrZKBvlBpcdWhyPlk9RN?=
 =?us-ascii?Q?x2Ls7cvKDhCDofH+c4f2aA3a73J2DgKjIgfQcf7huakKU17mY0WyfwF8uweF?=
 =?us-ascii?Q?ZeAsOxdZL1OVQU5EUKGiYjOcca6SbjJ74ruzH8sfXYqYJc7MBHeH8SBhnjlY?=
 =?us-ascii?Q?wzqDFKdjevND0ZxYLL/KKwX+sdFC2DYnIvORJ2wThVgPku/TO+bZ71QANG53?=
 =?us-ascii?Q?trNFMSd+InnbInEyhRRLHzYpD5jp5OPiqja91xyxuKL8tFmjGf6ZAMRnxtaA?=
 =?us-ascii?Q?PbvBM4bP6RWGsvyXGPdy+yuwLLTh8H2bOLeshOwjxXhxTjJN0l0OuhkWLNo4?=
 =?us-ascii?Q?ZD3XIGDvEDLZqg5LEZsTFgdC60o7udi/LKcTU6y9daY4K8s1D5IoqDDQ2ole?=
 =?us-ascii?Q?/FC4zdD/0RcJ/8YAk0GojxYjRwNV0YeJD/EXiMEi10/ZsZ8j6q1F0BtPnxeZ?=
 =?us-ascii?Q?NQRq2AQhTe7vksjJnaHTj0TX/QF4IQ8a/TqqVbFr883t7BV0YVa73wVoJoPD?=
 =?us-ascii?Q?hwNhYjNi+l9MQ+3KImUtQh1ebZbnviAy0p2xYwADGkjcTC2CNV4GJQEPGE7w?=
 =?us-ascii?Q?z/t81RpscO/GjZ4j5NnlfEyZsOlgE5xuICBkDgerWVRNC89MuumzOsuV/FfR?=
 =?us-ascii?Q?jaHTzrjAX9K+CUCig3b4UmorsZdh25K0YYRTzi/lJdFlW2O70ADfKnaZhChA?=
 =?us-ascii?Q?7vsZcVMGUEbcqsxPLFycxDA5wKTQLOjwhsjnb2NwDMoMa8RsaRjpy23mMYqs?=
 =?us-ascii?Q?58odOoafNmzAfcSmrsmf/1wfPnRpQCs5oHMOhT0L6im/Rrv5WJJLh0scqs2E?=
 =?us-ascii?Q?+akyohQdOiE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?834m/lo46msrsKgMuiQHDO0DsReb8nXihI2HeR7Yv0ay46tcn55hWWmWZqLf?=
 =?us-ascii?Q?F2zyitcYewvwHa+1wHQZvDKlck2muKTdLuC7FdnmmTNGDEP9YR/ReIcy4Kbr?=
 =?us-ascii?Q?TKG4ghQpvY+fttYheCjd+f1Gfy8jAzHTFvPN1ZBoBomM96wvfIha1nQo6xIk?=
 =?us-ascii?Q?h7choSmOjxoq5ns8QmCqIr5Q1Jpast4QW4FIUrTawuPGFGokH+ZMdhhXj//x?=
 =?us-ascii?Q?DNK+FKYiSij4OZHfT3UeEauJAPImy+XZCaAiCrr2G9rJd821ZgqwO+Bh8QGp?=
 =?us-ascii?Q?aYMV5FeT7XesSje1MWtiPv0KPYYtBm2EDRp9qSGZkSWy3i8INcFIMeMdF223?=
 =?us-ascii?Q?L+0/4+PNJzq1WGNb/ht73qkkz4odbOQsd9EUTx3TJap5uAlvqN4vDkLak5ku?=
 =?us-ascii?Q?Znuq34bokiWunsZuZ4pNZv7ym2j5mwFLYWN6R1xw2/arEHv+c/V53YjqcAUv?=
 =?us-ascii?Q?IwMjQ+PLlfoFxKlcCUHc/zOyQaEij5SXnmAiChYaOXXW7P/4kbzEyC1518Uv?=
 =?us-ascii?Q?qu1qLYXhSAqbvQStKtD8fH+mLDOCt+n5SUn4OcZ+Ej9dh4IbkDrkkOy9Y0OM?=
 =?us-ascii?Q?tXZTkpszGMuLTug8rr3iLlNli38M1wcaGTlu48d46BFxJIidlmZu9gC3fwhG?=
 =?us-ascii?Q?WzHdreDrav8oPDmrlNreRw9AYUHVAZI3jmN0M+JI5GOtS4oL2QEpx+mRixPh?=
 =?us-ascii?Q?zHjqC7QV6P5baYOMDgL30nWTrl2KRo74Cj3kbJwjc4JK+uhOH/mZAC2UagHF?=
 =?us-ascii?Q?i2GXgeSisMjx/F5cGyvEMCMFhnq+oLlFAtNKDOHp43lICf6Z8iqkCLL1L7UG?=
 =?us-ascii?Q?xpXjnvvmgQEBNzuIBYjHqFfw3B9r3i0CarNFtmf+KAMNoRPXt5nINkMrd1e6?=
 =?us-ascii?Q?jlZnYIQjC30Y0nY1/JDdVtbQpHakMD1TURyPbOdwzlOFjgpgf/VCIO+Q9Zhv?=
 =?us-ascii?Q?xhkXoH6vkTfanCeHsH6wy2IfkQKHuIWnahS92CoT4b7fbcmVhYFuVHIoPxyE?=
 =?us-ascii?Q?my+gyXc1oa4UdOy2e47LyhIQNaflvU7geWhklHeA/MnMlzN5BlD4FUzWYnTj?=
 =?us-ascii?Q?4+Oj+btzdvR9YNHxXG8kW8p0XZMHJdlUEvSZmZHf6iD4fms1OiIUirKA7UoB?=
 =?us-ascii?Q?bo5cSg2/jIcb4a3wec55B+9waIEzxmxQUJmAee/aXWFTYqhrXxDqhEP+I2V4?=
 =?us-ascii?Q?FnZDccuQTmZSMCs+L7CKXKum0AZlvSz7onY90mqb8Q2Xm45FxTygfetVst6O?=
 =?us-ascii?Q?/hU8F0IL/WV5Kjep5U0R+UG3/YoWuqMm39QAcB9ggXmWcDpKD7KcmtVxxKWw?=
 =?us-ascii?Q?dY+1agzwAFIQLF0WvTWc3J9TX4ZCeV76f2Jb9Hw3t9M06+TDv/0djHugQoWE?=
 =?us-ascii?Q?umZ98ZMNgo2l7k6ewWI5bA+aqJ5hhF8V3XER/78TIe6QVQhFqulicr8sTxPs?=
 =?us-ascii?Q?AAirpXVejSB6POzW7I1s3NMuCn9XWjKf8gutQUYTtMLUo46D1r7DfV/XiTHW?=
 =?us-ascii?Q?CMJSL4lEVz33MHN/Hfhmqgza1j1av6Wkxaim6s1WQw4Kuhck+SZlvPKkXGJL?=
 =?us-ascii?Q?yeaIjhneMbCc+juUe5nIt4eNqL03UlLtLnt0bcN74RCSU77Rey2LNw8FwNdV?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c6670c-0fd0-4179-f38d-08dd87f61a56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:48:44.0838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ub49BJy3AbsqQYVPP/DWPuY1SSH+InXiHA29/7h9Mwbs+/MXKjpzEvgqnMxk2v6szeAfQL0wfDiWkQBNfBrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5945
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

On Wed, Apr 30, 2025 at 05:49:08PM +0530, Himal Prasad Ghimiray wrote:
> The xe_svm_range_validate() function checks if a range is
> valid and located in the desired memory region.
> 
> xe_svm_range_migrate_to_smem() checks if range have pages in devmem and
> migrate them to smem.
> 
> v2
> - Fix function stub in xe_svm.h
> - Fix doc
> 
> v3 (Matthew Brost)
> - Remove extra new line
> - s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram
> 
> v4 (Matthew Brost)
> - s/xe_svm_range_in_vram/range->base.flags.has_devmem_pages
> - Move eviction logic to separate function
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 41 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h | 19 +++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index cb4a849c018b..fff3a279e232 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -643,6 +643,47 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>  		(!devmem_only || xe_svm_range_in_vram(range));
>  }
>  
> +/** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
> + * @vm: xe_vm pointer
> + * @range: Pointer to the SVM range structure
> + *
> + * The xe_svm_range_migrate_to_smem() checks range has pages in VRAM
> + * and migrates them to SMEM
> + */
> +void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> +{
> +	if (xe_svm_range_in_vram(range))
> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +}
> +
> +/**
> + * xe_svm_range_validate() - Check if the SVM range is valid
> + * @vm: xe_vm pointer
> + * @range: Pointer to the SVM range structure
> + * @tile_mask: Mask representing the tiles to be checked
> + * @devmem_preferred : if true range needs to be in devmem
> + *
> + * The xe_svm_range_validate() function checks if a range is
> + * valid and located in the desired memory region.
> + *
> + * Return: true if the range is valid, false otherwise
> + */
> +bool xe_svm_range_validate(struct xe_vm *vm,
> +			   struct xe_svm_range *range,
> +			   u8 tile_mask, bool devmem_preferred)
> +{
> +	bool ret;
> +
> +	xe_svm_notifier_lock(vm);
> +
> +	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
> +	       (devmem_preferred == range->base.flags.has_devmem_pages);
> +
> +	xe_svm_notifier_unlock(vm);
> +
> +	return ret;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 9be7bb25725c..3f8c82f9c363 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -83,6 +83,12 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>  					bool preferred_region_is_vram);
>  
> +void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
> +
> +bool xe_svm_range_validate(struct xe_vm *vm,
> +			   struct xe_svm_range *range,
> +			   u8 tile_mask, bool devmem_preferred);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -276,6 +282,19 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return false;
>  }
>  
> +static inline
> +void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> +{
> +}
> +
> +static inline
> +bool xe_svm_range_validate(struct xe_vm *vm,
> +			   struct xe_svm_range *range,
> +			   u8 tile_mask, bool devmem_preferred)
> +{
> +	return false;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
