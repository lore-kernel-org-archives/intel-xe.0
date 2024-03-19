Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB0BC54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 18:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AE310E8C8;
	Tue, 19 Mar 2024 18:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipz2AI9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1E10E8C8
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710871227; x=1742407227;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iQPEVRpfR7oryFIuBTyHKTd6Y7OYq7xP2JIV0PdIQms=;
 b=ipz2AI9Mxjt6+Iigj9B3sSDtDdICUgi1y0ffx6miWwLLatP8MNmDhqdA
 Oo4xYFrPMNoodWb86HyFyXqYXY/YbEnBdfyB2KJiRfjSvtAOy+gyChGLZ
 noTOFZdDSq8y6gy4YNCX0HILI8Y32ilH3HQaeWMvGqHjvKYS2gSmwCxIo
 T4RUlPfxDb+Ctga2XFTHCT8pULjEi+H58umgpolO9sQjeEOTANcYkUiI0
 GT9Gg/Zry37Z3bwSgNY6GLVVpPSGnSAUC2lYgO3g0m1j+B2HnafsnCG00
 O5Xdjv5qxeHkYqklA2P5k4tjJuy9ToTCbH4/XKr1YV3PvUGz4ZtUFmLq7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="23265433"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="23265433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 11:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="37018376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 11:00:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 11:00:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 11:00:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 11:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCzCuGIWE+R/729UZqIY3nLt40TdH/KmPeapzA9GChTMVfIiOdWXHEbikjro0kQcbdWLaaEdKV3QgSTrHcFpRg3dWL1r44x9wtU2rCVO+RwP2IpIMzLEu04bcBUo1Xq0nTuJjag2BTPGDzD+2bYoPQkvpgGXuEZF2bKnq6+984FsO4EPlZUuuypuD+PYdBSuQ9zPz7/pQYKo/wLLfIOA0DwTtHKp1Px/qYKF2oLNWYqLKbN+rll8RLSyU9heEYgooxralz3YAEr3q0XxyAiPVRlprgYPWX9/K/ioLfUYxbBLai8qjMFU6Tg30RWm2bRjpe7CXyc2u0p+42pX1mpWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4TVubmOrlqUM0XYMQN61Wbi11UbnY0tVv5i7JPZ0PA=;
 b=oV1uz1/66JHnuACAKRWb7ZkHLOGx6IEBYsiK1fLNmLCEXwxGit43vPjeWKcLJuBac/wqsjg5Ah/5Qwst3MGhYkBI48eN3rX0ZbHjafHUhMZG83XqGdFKcUSeO+wTQ5xyoM/HVnzjVa3fXwepevB47xROZCScn4gb76NMexBrqOAScMG9zrjtitzGfMkfCS8Sw6spvLex6pgyROSReIJt5+bWgC4wmX4JTdKYZv4iKbD7t2Hu3Ezy+ZtvWm3gokkPWgUhAV10DXifjdQ5t6bnvIwVgfEVRJBpol5wM5bxpY9v/68VR9g3k6sRnf/DxKDTK5rShNFW6TxpaVS99eABfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7670.namprd11.prod.outlook.com (2603:10b6:a03:4c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 18:00:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 18:00:15 +0000
Message-ID: <46c323f5-6a43-4535-992f-3ff340efc5d1@intel.com>
Date: Tue, 19 Mar 2024 23:30:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 2/3] drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
To: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
 <20240319170756.14020-2-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240319170756.14020-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: faa8b41e-7c40-47b6-028f-08dc483e6e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISc3UdY/au+9am8UmpHmnO0+SN9ag3vsGKqWWhvcI65kzwU8IQwgyha9eWd07ixbJDTGJHgfp+eUkzTbjlffDfHiQKEDMsJHUtUw95HI4XYONq5JJleLWFygSJD8KipIFFA+9ikaC9hoQFyWma4Zf6p8swUfNvj9hhfwsxCJuc+OY5qrWOdAgyxkg6CzFWJzOq//iFpcZTpv5uIyvBBBN5lJiS042Gzbb8jBAjV8CDCAkOjy3F6Tgqv+vKe8uIEkJSWYpUIWS7lmnaJHqjx1q30T/fSfRij3vEU0ub2m+q0lvj7VOuOa6FhDrgilgtX4xnxY2NCD+Te1QPVIsYqkzcHXeY7IJVuw1RVO1ikqhb6qHARXSaSvX1ywbk/xxAFEe/ka6xo9edoGp4rpybWDehwos8Re4Ny+RIRA548eGwoU5QGLAsTjOg8ZTdTWmEBQfkNFSDq4bg0amu99vDtgUjdwWwC2Uq1CGEEYU7GxKIZmEruICZCNNVLGvY7vLuKTAHdYpfzA+2MNi531tK0U1vNjfTyNOtEMljEDhD8FW+DPLWupklsx6g0QJNBSvztQLRSwuROd6bSSpG4zkuT8XhxA4pBMsvwifxw/Jk6Jndfhvk3jzXaUfViBrfYBs2g8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnhlWHBGemE4UG5KT25yN2lieEx4TzgrYjhJWnRtb0VnbUlvbG53QUhtVjhw?=
 =?utf-8?B?enB6ZkF4RVkreGZkKzFzOWovM212aFNnK21kYlJ0eVF3eUoyMEM3L09xa1Vj?=
 =?utf-8?B?ZVRKRkZ2NzJoclcrSE5yNDMwc2tpK2pvMVk2Zjl1SXJwVjJ1SjFNeElza1la?=
 =?utf-8?B?aktpejhOWHV5RnBQaE9XaXhlM3hLU3VqVkgzYlVrZzJNYkt0elN0NnBsNmVY?=
 =?utf-8?B?ZkZHSHV6Q3hPSmowWnZiTTM0QnZ1am9OYmR6WE1VMmtKUEJZaWdBbzh1eUVE?=
 =?utf-8?B?UDNyUGdNb1BWeXBiNnBKZStidWJIdWhId3owUFhuY0dBcTlidjgwMUlKVmJa?=
 =?utf-8?B?NjdNd3NXL2dkNEgxSWsyL3dOZUJzbWFweUpWNHFaQnE4K05YQnpMcWNuWDJr?=
 =?utf-8?B?elNGd1VuZTl3VjB0UUN2Wnh4S0l4cE1xL2Z5MzZ3bkJzcjJvdEcvTDN2dUlt?=
 =?utf-8?B?VFFrNmxyZkpJMkJqbGhLVGRFa0Y0VjdNbzJ2a1dTbXJXT0o3MDBkRktRUHpn?=
 =?utf-8?B?aW5ISktXYndBWW5COTBZWFdsUWk4R1dnSERmWFFpRkF1cWE5Vld5MDUvaUxS?=
 =?utf-8?B?U3k0bUoweEhEMlM4ZHVORWtVVDJNYWk0TjF0Qk9oL2xIeE44T0ZhazlnUGJm?=
 =?utf-8?B?VDdPeW56bEhTcEhmVkhhK3I1cGNXYVJPZ1NiOVR1UDJFZ3hxU2lnS2dZbG45?=
 =?utf-8?B?eUR0Zy9GTGREKzFCalNSOXNyL0NVZEszTTl3VnlZRzhlaGpYdXRURm80NXJS?=
 =?utf-8?B?VFdVVUxpcHNSSGx5Q1JzZW1jbXFENGRNSUpubzB2YjJacy8zNmprQ0NtSkZD?=
 =?utf-8?B?OU1DMVkrMnpyTHBKR3BMTTZsUDJoM3o2UEZ2SFl4K1ZuR25rZVQxWDdBM1pa?=
 =?utf-8?B?YXFUQUFKNTJPeXF1OHhlb2U2ZUpDQ2FaVitic0NsQmVSRTJHbzIrTnd3eGl4?=
 =?utf-8?B?Vmo3M1E5LzZWWHhIRFRlWjZDa1Bzd09yVHRGeENhSXJ2TFZlTTFpTzVvSUIv?=
 =?utf-8?B?dWFKTjZ3OU05dUt2OXRUbVZjYnVySDEwQ0RXNWFma1RBN0h4NElveHlSd3Jm?=
 =?utf-8?B?ci82d2VMM3FRenNONnZWUit4L1A5VnduSDVVNTM3WVBUOTBJWlJDb2ZmSERn?=
 =?utf-8?B?enZDemE2dUpFOWlEKzg5cjRjRk5peFIyNk1WdkVvckpPZWtxRGV4KzkwWFRB?=
 =?utf-8?B?YmVuRmFSQng2eHFGblhtNzRRRVZqUGd6QnptR3ZobjZPTTA5ek1kQ2VxOWgv?=
 =?utf-8?B?MjUrWnBoY1JqRWRHUjBBczFYMFFOczJvYnVoZkoyQXpMWnF2QVpoZzFtRFZp?=
 =?utf-8?B?V3JHbkV1eXdHZ0VwTkpqbHVvLzJNZThha1VVcnRiU05yamdLUXpFMnk2dzBY?=
 =?utf-8?B?V3VDVXVSdkd5bExpemZhenBqTklRM3RzNmthN3k0YUQyNHN5NWp4MU1uR1dC?=
 =?utf-8?B?eUk2eDZJNVlHbzl5bW9pNDBrcWFjZW9taFIwK05UT0VUTUFuTVBtdzBGTW95?=
 =?utf-8?B?eXdKcHp1aFJld09ZeFc4NWwyTWZwTXExOEkrMDM5NDBjVlRXQmFYSzc1bisr?=
 =?utf-8?B?RDlaSEw1UXFkNkNhaGIxbmNCNG42WWhoV1kxekxXb25xYUpRMXNlVWhmWXZR?=
 =?utf-8?B?SStmWExxeERlQkg0cE9iRTRKQlluZjg4ZVh5WmtNOUJaSVlBaXBiMTJMak8z?=
 =?utf-8?B?cFNqREVvSFBFKy9qVW5CU0Z5Q0VZaXNtWjVBU0VGeVYvdTFwU3BDMUNVczRi?=
 =?utf-8?B?bDNkaWt0Q3BXZXBDTFM4QmtXb0xyenpObWcvY2haelI2V3pnTlU4S3F0aXZh?=
 =?utf-8?B?d0RJSVd6aElEMjhSVnMrdU5tcmVnZVVjd21LeGFkT2xYT3lXbjNSbFJjeUtL?=
 =?utf-8?B?UlNHNVNQUGZEMTdJekIvM2dUM3hOejM0UEpjVGs5RkUzRFpOK2JJekVqb2J2?=
 =?utf-8?B?cjFScE9QV2xyVjc1VmZUOTNobmxCSS9DVjl1NkZXVFpGMEdjWWxHRkhNVlNn?=
 =?utf-8?B?ZUVmQWVSTDh6VUdlTUxuekt2YVZBcmxwcGsxaDM0WUZXYUg4UkplQjE0NDdK?=
 =?utf-8?B?T3BXRWVIOW9wcFZmNlZYVGk1Y3hXREFLQnRHekIyUlRkQldtcWNPaXlybUlq?=
 =?utf-8?B?NUxkZXhySkdPVmtUeEI4cm9pMjNoaEdwV1g2a2RNT0s2OE8xWUJycHBpOHZO?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faa8b41e-7c40-47b6-028f-08dc483e6e16
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 18:00:15.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeQ6gqrTuJ0gq1pSgGJGo3A3t8OkT3n2ekL/T4sEcv0qV6AqPLUeE4cU8xUCnYh6yzZFB3qmKlIUo+mGOwYY6H5YHU8uClDRD3vmH3Q8q+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7670
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


On 19-03-2024 22:37, Maarten Lankhorst wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> Add XE_BO_GGTT_INVALIDATE_BIT flag which indicates the GGTT should be
> invalidated when a BO is added / removed from the GGTT. This is
> typically set when a BO is used by the GuC as the GuC has GGTT TLBs.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> [mlankhorst: Small fix to only inherit GGTT_INVALIDATE from src bo]
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20240306052002.311196-4-matthew.brost@intel.com
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c |  2 +-
>   drivers/gpu/drm/xe/xe_bo.c             |  8 +++++---
>   drivers/gpu/drm/xe/xe_bo.h             |  1 +
>   drivers/gpu/drm/xe/xe_ggtt.c           | 12 ++++++++----
>   drivers/gpu/drm/xe/xe_ggtt.h           |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_ads.c        |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_ct.c         |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c   |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_log.c        |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_pc.c         |  3 ++-
>   drivers/gpu/drm/xe/xe_hw_engine.c      |  3 ++-
>   drivers/gpu/drm/xe/xe_lrc.c            |  3 ++-
>   drivers/gpu/drm/xe/xe_memirq.c         |  1 +
>   drivers/gpu/drm/xe/xe_sa.c             |  3 ++-
>   drivers/gpu/drm/xe/xe_uc_fw.c          |  3 ++-
>   15 files changed, 36 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 311ffad6e2c0..2a50a7eaaa31 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>   		xe_bo_unpin_map_no_vm(vma->dpt);
>   	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
>   		 vma->bo->ggtt_node.start != vma->node.start)
> -		xe_ggtt_remove_node(ggtt, &vma->node);
> +		xe_ggtt_remove_node(ggtt, &vma->node, false);
>   
>   	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
>   	ttm_bo_unpin(&vma->bo->ttm);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8383c56c9960..8ee04535da2a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1580,13 +1580,15 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
>   int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
>   {
>   	struct xe_bo *bo;
> +	u32 dst_flags = XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT;
> +
> +	dst_flags |= (*src)->flags & XE_BO_GGTT_INVALIDATE_BIT;
>   
>   	xe_assert(xe, IS_DGFX(xe));
>   	xe_assert(xe, !(*src)->vmap.is_iomem);
>   
> -	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
> -					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -					    XE_BO_CREATE_GGTT_BIT);
> +	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr,
> +					    (*src)->size, dst_flags);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 87ae8ee7c316..d7afcf49fd9e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -46,6 +46,7 @@
>   #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
>   #define XE_BO_NEEDS_UC			BIT(14)
>   #define XE_BO_NEEDS_64K			BIT(15)
> +#define XE_BO_GGTT_INVALIDATE_BIT	BIT(16)

There is another patch from lucas where he is dropping usage of _BIT 
suffix for existing BO flags name.

Better to align to same convention.

https://patchwork.freedesktop.org/patch/582863/?series=131120&rev=2

BR

Himal

>   /* this one is trigger internally only */
>   #define XE_BO_INTERNAL_TEST		BIT(30)
>   #define XE_BO_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index cc60ea08fc84..42e92011dd69 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -390,7 +390,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   		xe_ggtt_set_pte(ggtt, start + offset, pte);
>   	}
>   
> -	xe_ggtt_invalidate(ggtt);
> +	if (bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
> +		xe_ggtt_invalidate(ggtt);
>   }
>   
>   static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> @@ -435,7 +436,8 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>   }
>   
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			 bool invalidate)
>   {
>   	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
>   	mutex_lock(&ggtt->lock);
> @@ -444,7 +446,8 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>   	drm_mm_remove_node(node);
>   	node->size = 0;
>   
> -	xe_ggtt_invalidate(ggtt);
> +	if (invalidate)
> +		xe_ggtt_invalidate(ggtt);
>   
>   	mutex_unlock(&ggtt->lock);
>   	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> @@ -458,7 +461,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   	/* This BO is not currently in the GGTT */
>   	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
>   
> -	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
> +	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
> +			    bo->flags & XE_BO_GGTT_INVALIDATE_BIT);
>   }
>   
>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index dc9631d20720..8306ef74abc6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -23,7 +23,8 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
>   				       struct drm_mm_node *node,
>   				       u32 size, u32 align, u32 mm_flags);
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node);
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			 bool invalidate);
>   void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>   int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>   int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 6ad4c1a90a78..5deb95a5be89 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -274,7 +274,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
>   					  XE_BO_CREATE_SYSTEM_BIT |
> -					  XE_BO_CREATE_GGTT_BIT);
> +					  XE_BO_CREATE_GGTT_BIT |
> +					  XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 355edd4d758a..507d50a28d0f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -156,7 +156,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
>   					  XE_BO_CREATE_SYSTEM_BIT |
> -					  XE_BO_CREATE_GGTT_BIT);
> +					  XE_BO_CREATE_GGTT_BIT |
> +					  XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index ea49f3885c10..18aefb4aaadd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -79,7 +79,8 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
>   					  XE_BO_CREATE_SYSTEM_BIT |
> -					  XE_BO_CREATE_GGTT_BIT);
> +					  XE_BO_CREATE_GGTT_BIT |
> +					  XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   	guc->hwconfig.bo = bo;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 45135c3520e5..e7f02c39c2e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -85,7 +85,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>   					  XE_BO_CREATE_SYSTEM_BIT |
> -					  XE_BO_CREATE_GGTT_BIT);
> +					  XE_BO_CREATE_GGTT_BIT |
> +					  XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f4b031b8d9de..c0db425eb74a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -955,7 +955,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>   					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -					  XE_BO_CREATE_GGTT_BIT);
> +					  XE_BO_CREATE_GGTT_BIT |
> +					  XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 2c5615130a38..0b151e610802 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -519,7 +519,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   
>   	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
>   						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -						 XE_BO_CREATE_GGTT_BIT);
> +						 XE_BO_CREATE_GGTT_BIT |
> +						 XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(hwe->hwsp)) {
>   		err = PTR_ERR(hwe->hwsp);
>   		goto err_name;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3c4d31703207..ad33e4cbbb61 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -746,7 +746,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   				      ring_size + xe_lrc_size(xe, hwe->class),
>   				      ttm_bo_type_kernel,
>   				      XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				      XE_BO_CREATE_GGTT_BIT);
> +				      XE_BO_CREATE_GGTT_BIT |
> +				      XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(lrc->bo))
>   		return PTR_ERR(lrc->bo);
>   
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 76e95535d7f6..8d2f6faa572f 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -129,6 +129,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>   				  ttm_bo_type_kernel,
>   				  XE_BO_CREATE_SYSTEM_BIT |
>   				  XE_BO_CREATE_GGTT_BIT |
> +				  XE_BO_GGTT_INVALIDATE_BIT |
>   				  XE_BO_NEEDS_UC |
>   				  XE_BO_NEEDS_CPU_ACCESS);
>   	if (IS_ERR(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 2c4632259edd..e3f952822a1d 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -49,7 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>   
>   	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
>   				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -				  XE_BO_CREATE_GGTT_BIT);
> +				  XE_BO_CREATE_GGTT_BIT |
> +				  XE_BO_GGTT_INVALIDATE_BIT);
>   	if (IS_ERR(bo)) {
>   		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
>   			PTR_ERR(bo));
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a9d25b3fa67c..31fd9bde5c87 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -771,7 +771,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   		return 0;
>   
>   	err = uc_fw_copy(uc_fw, fw->data, fw->size,
> -			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
> +			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT |
> +			 XE_BO_GGTT_INVALIDATE_BIT);
>   
>   	uc_fw_release(fw);
>   
