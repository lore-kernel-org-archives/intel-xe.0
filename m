Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0358AD0D16C
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 19:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B9810E5E4;
	Wed,  7 Jan 2026 19:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX5UfBmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9991410E5E4
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767815904; x=1799351904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oJvslnNXRZ8+vnOsTA8eGhSztEiS9CycY4cd/ddvhDA=;
 b=mX5UfBmyLgiWH6gpgkSIscpZmFehY5vKevBYG3257RCdEXGyAng3i5H5
 ojh5VZvERM2Y4UfwxZIKpx/RUlNKVDvI7q0dYzxXljZAonQINebg/HB+k
 ZWuZmQ6vISz/r9yznJ1DWZdrNImkYq/4WfzN/p4Ygmae7qHfwt1dkDv4A
 xqaQASaRYCJ3DNz0x2AEHKMLk2TCMgevDIGROEa/Cz+bhfKAJZ5WcBisD
 QjPaWrSbnRHaqwvLBW/Gsv6QXtC9TqUzkjDUO0kSWE+MKV50+IIzN6XOR
 ERDq4E8ttsonh02dk1tdp2oNJxaBSpAxjyrJFzSACJ4/hLeojsOu7ISxl w==;
X-CSE-ConnectionGUID: 5N/npUbyQFmDgHZyFvwXGQ==
X-CSE-MsgGUID: nCyBCMYeR9K9cItx6IaHrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="69128401"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="69128401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 11:58:24 -0800
X-CSE-ConnectionGUID: Q2XCgUEhR2uUu+/lGtXKnA==
X-CSE-MsgGUID: IJ9jHLDZQBW+qT8Y1YJulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207542196"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 11:58:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 11:58:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 11:58:22 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 11:57:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBJzcwgy1aCN5C86hi8Be7aE+Cj25JYLMY8AdzKpZ6rx7aQa2zj1HnrTZLcRBuT+5x2zNNQis+EKi6f23xUuyZGF3ZF6/jMoDgyNxnLEblnGH9VOMeVK0Ukkfm4N0fnoWhkXbgiloPmQPJoV4lPIFvJtXCcuZ26NNXslNk1Irk0MhJr1y+Wo5l+o9v+kc4/kKRVLP+4hJEC7mXtFIFbjEesZ14O5JTRuWGYwFphLnVrcYouDmDxkkochwmRtD7UpjZLizDQ8FSXg+mqMA9apRTfwRagxawh6xDA/n/6i5L4FzBk+govRfOF0gMnnCX0pAg1zEEMFM0ZA4H2Xv2KFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zomD0/VEVWYw4fUWFtYr/uerwQxC/7rHjNYbYk86B4U=;
 b=urXvuEarbOfOLS+fWRkZXs5tzjKdYfUwvJkep4O8SjN2JIDza0SNZzlS1sNooWPkRHsBrSk1hpN3LXyhPdlLBWp/eGGxgm6UKqGj+37NGSZ5KWnrTABoH4SffIDva906AnhYp9mqUd0LaOIIcBWB0vFoR786wLbMRYTcwNtUyO14kW9pBZVZUykALcz3LUhLb6E9vmNEdqOtQSHQ8FiHKv7FMK2BKxZbM2nNYXl3emHqxkO2Vni7Fhip7cUgO/D8ZvmiAPb+tUT9EhyFvmpI2DCEypk7Wkn4kM1nGDprBIpHeODWWQDWkSHR/4nR+L51M/V584kPqagwAU4qkI1lgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 19:57:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 7 Jan 2026
 19:57:51 +0000
Date: Wed, 7 Jan 2026 11:57:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Add explicit abort page reclaim list
Message-ID: <aV66vSgUxa/lx5jQ@lstrano-desk.jf.intel.com>
References: <20260107010447.4125005-6-brian3.nguyen@intel.com>
 <20260107010447.4125005-8-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107010447.4125005-8-brian3.nguyen@intel.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: b1380662-2fbe-45ea-451c-08de4e2709dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0pn4XqSIzUI75WkastMoIEQPybvzhNT2PMz6oMzxm6zXZcVHQXif4uQtW/G9?=
 =?us-ascii?Q?ubWPB8M9uJ/xxTIVMTVlO1HtUOhf/sRUDt3IqdKcuqtY80S+Xs0uSj1D2dvn?=
 =?us-ascii?Q?lzkkbOlcMwoNtU09ATpg5qQd4Aa6lunqBRPHQA+yzlmT4t/YbF2vr5w8cFuk?=
 =?us-ascii?Q?B+DU0DSMZS9R99a4QzHGCH2+UyoAXoKk31ukqgX6iypeB373maOYxDSltCFI?=
 =?us-ascii?Q?/yte9Vs42vMNL2ggE2A7qThvQDQ0O4gTmEH/IRnn8ZQMbJRfhLoDth+Jt9HY?=
 =?us-ascii?Q?Xvze673FkLRGMIfT50s/BQX62CzCqNIM0/76EWt6PWHSWEFqMh6WSYe2/X3n?=
 =?us-ascii?Q?bwqWryfE0TgURCGQgy2dnebzOAkGTvsZHwETAcJrsxeaw5C1ob27Hn35f4bo?=
 =?us-ascii?Q?+3t9tzpcatoe4tEQ+eL4A+cl8Nz4WzGV/GbgwgQkFpuRhFbRwt+dFMFxGlOJ?=
 =?us-ascii?Q?liJAMNLiZSA7TR6R7D8jUxHHB/JK9DE+ilfkBpjShdNC45nthre90H887Dcf?=
 =?us-ascii?Q?RxqaG5ZTHfr0ch3Yve2o1JRQfBNf6jGoKc0lvyk1rukCdmXirBYIACHEs9VH?=
 =?us-ascii?Q?HxSEyYDevX9DlOVoRqUElZaHtchym1I5R/79z9jBL9euVcB3ZoF+DH0TUU1Y?=
 =?us-ascii?Q?9rlWAPN3ZoLumo8Q+K3prOY39ZTePIOkxemeWZIW5F7Z4TKLG6xjUvaoBxJ5?=
 =?us-ascii?Q?m7KfEHimAB5qSbN4Sv3mmvF/lTOLRBq/WgG5CElOUeUYF2kI+3FdpBFIYZHq?=
 =?us-ascii?Q?p3MdvXAWQpeHEd+d4gGnSYSYlMiCM8N+kY5W2mpB4qia7TmPrLCAaAweVNKa?=
 =?us-ascii?Q?JrvH6HHoLFzuj8h9XoOxnqCg7z/JeLRvO649xIdPgsxlRw+ApSxOea3YyrO9?=
 =?us-ascii?Q?YEz2hVJ3cewFsZ6UiLm+FHWuoaXFVqSQ2xRpFxuncpQPG2xRb+n13IECJUGp?=
 =?us-ascii?Q?F9L/dvdzm+iDiCOCFElOklYubP18X7Y3o7CYt5+IIwqoRKita9ugoqTp40P4?=
 =?us-ascii?Q?wPJaROl66u3VoiwoZJON9A/M4OQniQJqxC6fvnMG+Nfc36HIjUzYIgiFAq7w?=
 =?us-ascii?Q?h9WhILgyfQ0FjJUp0NnpgOnWXcqH8CJE+V958u+K4dyroB4Vi+IbKuTLOM+M?=
 =?us-ascii?Q?PM7o/2vT6MPLYHvU3MPLGUtMHR4HWcUyMQl+Nc7+LsaXazmBvX4JPZdmzthp?=
 =?us-ascii?Q?jq27BdhSYsnc4LEKvpZxhq1OnbmmjQbhrqqEy2N209YwpXbOpRTJKLVL+UCJ?=
 =?us-ascii?Q?y7jZEmcI0lU7dhxDvOEVW+trBaXrB5vuna3JtjlO3SGTRREGZ6+NhWvmIEj4?=
 =?us-ascii?Q?wauutyQ6t5BQTCZlpp4752qqUhEFLb2APdU8p91KHHDoTOjVGVzz6UhvA/pw?=
 =?us-ascii?Q?HZD8k4ekVlsjJX99QVu931Mu2xfsIvttIjYNXionuDnO7goW7V81ORznDUlH?=
 =?us-ascii?Q?1bEIzVXLinPCILximrd5QBRKp+OJpaeJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvuPq9UptitC8e6amI32+Xt50H3RhEZPg2L+XZPoYJfHvMd94iwqonVtw/SR?=
 =?us-ascii?Q?1vIJTqbBvm5dVBAjRoO7YItT5RsSWriaE0NELQTYdjkkGjoz4+FCUfli4rNJ?=
 =?us-ascii?Q?Bp2kIeGRjuYqCNj26LdSExthT7g9W9wpbTPqVWE3jAl8vbVs/zSBA/1JA/DA?=
 =?us-ascii?Q?AJTYe6Z7EX48uqknbcWQ/DKXGCIfHdvryMeyM13+EUenlJ7KOD48GqT73DmW?=
 =?us-ascii?Q?nymFvVkg9BPE2h5we2Ta42fJ8F09bNrb2Ghz5YoDprMpQnhBoiKGgSWLSewg?=
 =?us-ascii?Q?JDT07CoirSwHyEJaLwJc4rHWbsWJjjalkEM63GZykzqh/X109lObQ/4n07tf?=
 =?us-ascii?Q?I9xSJvv8FYDQvchibYs4n5WwF0AOslZDSg+mZgbW9MzbF6hH+XimBTXgC6dL?=
 =?us-ascii?Q?xPsDU4WpCojKuONW3xT5geeXDBUjXJfTsm5g6Aluq6R3gIg2bcgvrgRDV8pX?=
 =?us-ascii?Q?Hq8+Uwdqc/0bHJ9k2BKAwqNA1Eqe+CchiQL5dQ2hNR0OAVZBtM0UdCPn/9Bk?=
 =?us-ascii?Q?wQ9WcuuRzvU2opd2NLP2qDykn51eVOnOvHEh03L4z4tLXg1QTJezepJgV/1b?=
 =?us-ascii?Q?+xx56JksoZBEJtHWqwT2622JAONvXcscAt6cD7pYjEtlhJI/7AEW1FbmiLj9?=
 =?us-ascii?Q?ZlK+gDI1j/cV5EedZvDZy9r8B7dpMwa3+5gnkTtSsVc1ivI+2s2EE+hOCQPS?=
 =?us-ascii?Q?KwO+d3QGkXqEzvULfNayWE5oCYsLFwZA4jcN4UJ9gqsu0li9FRzOoLfhijVu?=
 =?us-ascii?Q?FqaK0Hye0L5lBtR1gPICJgSpbAaksNOAq932pEaylF9vF+jhxNS86nxFnpXG?=
 =?us-ascii?Q?Mz+moKkdpWAH4BWDV9+mXPJGh6hVp2/eBs0picPpF2huf3vS4ce48Y84MX/C?=
 =?us-ascii?Q?r1Vc9ezqJlvxn5YImoCqlUcRnV9gcoQs0dkUDHcjDLTTGNy1SnVcXm6iIQJq?=
 =?us-ascii?Q?CF7iXNJxNu5LsaBuHqvR7HjrpjxWJXuoieqMvZpw48mRU3p9G+RuZqD9IOWl?=
 =?us-ascii?Q?8Q4MyeRpRvc4oHuceCYrBEAWTHPga4Iwx+v/0wxTIo+G3V+tShAgEZhGsvRB?=
 =?us-ascii?Q?d/9R25D3u6l9MK1EttSwU7zToelHkNCxEMOtVcSwts6sfmeupInC6JnxqvO+?=
 =?us-ascii?Q?YfjprU85rwvG97m+Qe7KnhP68rwlTc9n0hwwf7SwF1elchge8YVFTmIGg67p?=
 =?us-ascii?Q?rjgnZT0BirkmoO7YEPkYMl+Hh8cs4JFJ4v2OqY1SKsImUu+hEv2szJUzcZfL?=
 =?us-ascii?Q?VT340ZShtpqgFKyt2MQUlbuGe+l9VqxTNwVtefVOit+bi0Kin2rXeRDz7xA7?=
 =?us-ascii?Q?JGe/Vdq5fYF3IsoT6JCznl81hK1i7z+E6NBAwu2Z/2KC4YVPuh3AceZ/FNtw?=
 =?us-ascii?Q?5U85btNvXv2/ZXHNT5Yqs8FCqWr+i8CNzaBFSqmoY7J0DuTDIfE/CYP8WRVG?=
 =?us-ascii?Q?l3sVXYoL6+SA/3Pa0mhX3Ai7dzH2YDzfa+HFSJVbVOBercahCOMyDvs5nPSG?=
 =?us-ascii?Q?3SG7HPOUQlXBXG437lrcHCjHy/wv7NviH0VmsUvHg9shfAKtALR5Qf71NLri?=
 =?us-ascii?Q?gcrC6MIPxJipWDgZYSoeZiXGGLosk2ZvWgljsMvMC4GSR6M+OdB4kCEIK+K+?=
 =?us-ascii?Q?CsvU138PndD2+p9la3fIqg3Xy1ZAnbQaCuFkmPxwrv5Rgf3PuYWCk4dEHA3W?=
 =?us-ascii?Q?+acPeSE1c4tpkV1RcfSLu1PNZyPXsDQxPLTPipVgNt9W5INKxR0EOrhzio6O?=
 =?us-ascii?Q?y3H9RhunjkEjfR6t2/8QH9SyrS7ALQU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1380662-2fbe-45ea-451c-08de4e2709dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 19:57:51.0801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wqCmVy7QwB++NB6P4L4/LNxk/6OgvxCXlvG+SKiZsVxPWbRUM06lSCnnwJir0hYIXXKwml6P4Uu+gOIVTsv/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
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

On Wed, Jan 07, 2026 at 09:04:50AM +0800, Brian Nguyen wrote:
> PRLs could be invalidated to indicate its getting dropped from current
> scope but are still valid. So standardize calls and add abort to clearly
> define when an invalidation is a real abort and PRL should fallback.
> 
> v3:
>  - Update abort function to macro. (Matthew B)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_page_reclaim.h | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pt.c           | 21 +++++++++------------
>  2 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index a4f58e0ce9b4..12f861f357d8 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -19,6 +19,7 @@
>  struct xe_tlb_inval;
>  struct xe_tlb_inval_fence;
>  struct xe_tile;
> +struct xe_gt;
>  struct xe_vma;
>  
>  struct xe_guc_page_reclaim_entry {
> @@ -75,6 +76,24 @@ struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inva
>  						   struct xe_page_reclaim_list *prl,
>  						   struct xe_tlb_inval_fence *fence);
>  void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
> +
> +/**
> + * xe_page_reclaim_list_abort() - Invalidate a PRL and log an abort reason
> + * @gt: GT owning the page reclaim request
> + * @prl: Page reclaim list to invalidate
> + * @fmt: format string for the log message with args
> + *
> + * Abort page reclaim process by invalidating PRL and doing any relevant logging.
> + */
> +#define xe_page_reclaim_list_abort(gt, prl, fmt, ...)					\
> +	do {										\
> +		struct xe_gt *__gt = (gt);						\
> +		struct xe_page_reclaim_list *__prl = (prl);				\
> +											\
> +		xe_page_reclaim_list_invalidate(__prl);					\
> +		vm_dbg(&gt_to_xe(__gt)->drm, "PRL aborted: " fmt, ##__VA_ARGS__);	\
> +	} while (0)
> +
>  void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
>  int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6cd78bb2b652..2752a5a48a97 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1618,10 +1618,9 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  	} else if (is_2m_pte(xe_child)) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
>  	} else {
> -		xe_page_reclaim_list_invalidate(prl);
> -		vm_dbg(&tile_to_xe(tile)->drm,
> -		       "PRL invalidate: unsupported PTE level=%u pte=%#llx\n",
> -		       xe_child->level, pte);
> +		xe_page_reclaim_list_abort(tile->primary_gt, prl,
> +					   "unsupported PTE level=%u pte=%#llx",
> +					   xe_child->level, pte);
>  		return -EINVAL;
>  	}
>  
> @@ -1670,10 +1669,9 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  					break;
>  			} else {
>  				/* overflow, mark as invalid */
> -				xe_page_reclaim_list_invalidate(xe_walk->prl);
> -				vm_dbg(&xe->drm,
> -				       "PRL invalidate: overflow while adding pte=%#llx",
> -				       pte);
> +				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> +							   "overflow while adding pte=%#llx",
> +							   pte);
>  				break;
>  			}
>  		}
> @@ -1682,10 +1680,9 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
>  	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
>  	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> -		xe_page_reclaim_list_invalidate(xe_walk->prl);
> -		vm_dbg(&xe->drm,
> -		       "PRL invalidate: kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> -		       level, addr, next, xe_child->num_live);
> +		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> +					   "kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> +					   level, addr, next, xe_child->num_live);
>  	}
>  
>  	return 0;
> -- 
> 2.52.0
> 
