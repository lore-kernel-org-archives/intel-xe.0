Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C5CCFA02
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 18:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1140C10E14F;
	Sat,  1 Nov 2025 18:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+fTyKZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3016210E14F
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762021895; x=1793557895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8cqEhu7LE2Vaeo5tVdditiuvIVz+QdtQgx7i0Wc1M74=;
 b=c+fTyKZzyn1pkTtRAesAkTnxzshg0WaxLAYH6N9kpfnUBfqNDX/IIpf0
 Hhtdht6JWfcbyTgnpwzwnTg1qFuosN+/fCFZa4r2oE0qYkj+2+H7bdbu5
 p/Cxr3MTkyepzp3LJDj27ChDpdYK4zMc+7tG8f58KmNw2GEtgbS3h2J0+
 z0x5kOKua+99cXWGHKTYwpfm83kJ6DUP0NslY2aIlmkFAscusb+RUYBfq
 8w75EcQJTXGknsAR6eIRutQmMs4kH/PrPRUMpV66J//Vn+M1JTWbkVrrw
 Q3Ypilq5BMWUqT6KJnzPHz33EaFaJgRGxUOPwI9XOFrMW8OgoVRpDeIJD w==;
X-CSE-ConnectionGUID: EEokBjpMRWGkII8FK9Bg2w==
X-CSE-MsgGUID: pYGKVVeTRiuujBwuBQoiuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="63363293"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; d="scan'208";a="63363293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 11:31:34 -0700
X-CSE-ConnectionGUID: MEq3Am8ERu23/OC8m/km+g==
X-CSE-MsgGUID: h4BVKIWeRu61klpeyZi57Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; d="scan'208";a="186829366"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 11:31:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 11:31:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 11:31:33 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 11:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIFs8KS+XQ2zAJwP0xWSw+Ld4T6hLE/HMM0wJzuFEjg78d7L6Ard/1npuLS/BXIdUbEvVKdTf3UzIh98+ViLSBhWXfCtiZtO5JRBbiJi2J//g2FUd+MvGvOnSNFOako8Sv+XQuDvLSuLxex3mKFwcJ/1g3pGFttgTTFjvM8Zv+dyw3fqao3fzCoQmABSHyqBwyOBoiG7iUmDqxstVK1guSb9h43E6cjYRHZ9pWhujIZ4GdCoEvLJMOBVzLXexBnlXAJZNpnLEH+yGOpwJeoLogtYNc7D2gF+TaEAZ+qplHpGpG3b1goSwJE/SEFkhUmfNCu8y+mE9MEJ5K2mpL09vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84hJt+RCL4LE1vEIFz+GSiVWeBRb6C9+W1EVuKD4UGg=;
 b=UyOoJ+37FwmZDWRReTi/IYDUlBY5pjy9QIX3ATDuWdkhmma22kqcOPAghITmFmkX2TNHN83/eKxbOdQy1JCcBz+JcrzfW5LUzcnodPiYP6yxM7toLDmH69e6F1AEcw0IR8Jdn/Bdr5atPqWNyQzjR7z/Z6Q+3pLRT1Y1wutg1NPybj9XGls43DkIoUWZhv9bx2trRhjth5P3WTOl4MvfJkEkjuzSxnAXGlgK6J5iN0L64JJGZlfVnne/V5F5YXkcAT1BrolvF7EYZ0Q8BoyoXbDJKra7iUPepTDIpJQkxkOeMAPgDI2IOVUQLBAs770SUq8FbjhaYqZoBVC0eYAnMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 18:31:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sat, 1 Nov 2025
 18:31:30 +0000
Date: Sat, 1 Nov 2025 11:31:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/16] drm/xe/multi_queue: Add multi queue information to
 guc_info dump
Message-ID: <aQZSAMUYdjbKvAbm@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-9-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-9-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR07CA0105.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 02898118-ccb8-4432-5589-08de1974e06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?goadBlZUiJqfLyseT3JUNvWZW26d8q9sTrGv6bcA4qjRK/h4v0FaW54J4Md5?=
 =?us-ascii?Q?9e9xUdheHwFadVRWd70o9VZyj9Q8Ef5CqP8Q1BuuN5Ol4IoUB2/ydBnwL6Cy?=
 =?us-ascii?Q?PvSwFRvAnwqAgQvUX3UH5JPHFAVqa5//zwHXdMDko5c0+74ZAwE2naWzJLI1?=
 =?us-ascii?Q?/PGCadc8xxahvrmxDIvD3+X2SHTIszMdBgFmkFNue6V3lHCvgY9Gf1ZEcX7v?=
 =?us-ascii?Q?f1kD/6akxmYurc8qQ1JeeX4OZHrbZxSmbeqHMSymfImqlNNSV9HNT4RMOREt?=
 =?us-ascii?Q?F/apGhJpll8ZIPVdTNX0BjEoOzJa8opC7v/t/FnCFmf7UOJklxSAESHoqFH2?=
 =?us-ascii?Q?+RxoofhXu2FpxRyHZGC63WFRlnkIGI/POqbL33YVuQN08U+QUpD3F8//YnL+?=
 =?us-ascii?Q?wOG2imoW89BsFgCjxv7zHdINpjbbMpL8A2ZUT9c5JXmAkkSWv3MTcIN8Wktg?=
 =?us-ascii?Q?U9Ykc47CM1RzucW9xIeSaE37PbKli95ZsJ5WAqlG/jn1SuiO2QOXmRKR4iNa?=
 =?us-ascii?Q?LaOUuF67NuRn9QyxSZiwxTBDt7x3PeQKcHhEn5YRQqq1q1tbYKvBpeCOM4Qh?=
 =?us-ascii?Q?WlERtyEmmqvW5vk1FV1A+TEOfAob/WemSsDD8tzACs7r16Y0j0R+B+riLMTy?=
 =?us-ascii?Q?m0X2anDeU8rhuS3OWbbaPp5eWqjDfzM/1Ea2e6lzjKGpo7ISzQJLsqkT2tx8?=
 =?us-ascii?Q?YQJkRqehaavY/Sl+QcrNcQa3DF8GF13AjvhBNzlDr/uAltArqb4vVZwUTJF5?=
 =?us-ascii?Q?LkTHNG1QfaPeOHMTClQ8+VsKAPVg+UsYnszPKK0bLyN3IgDOu4HUu86nl4YS?=
 =?us-ascii?Q?8aVfAz0UrMtDsd5iisJmDNEgs5qn81HdZby/y0bcjW6FLpk8yy9W0D9jgdK2?=
 =?us-ascii?Q?w6ewvm3cGPZUot85dt4jbwXep6oh1C/XmWHniGDC1M/jPfQT39oEsmb1+hY1?=
 =?us-ascii?Q?a/BRTIttQoIz8rvOfhAeWf1VrNjUValEpvwkds7xn6gzlxkVytbMfRrtKI8L?=
 =?us-ascii?Q?IHcNZ91AtrFjQiX/QkkudGHVl8/FFCGrrjKYgvUCd58xopVIRBGEfBIIBk8C?=
 =?us-ascii?Q?0orqQdgN5420F7+K6KpxOcgEYO6FxfBRZPAxXAHmCzk0Qd9Kv2tjkRhNmOGh?=
 =?us-ascii?Q?VSwnFy1bYlbvudFS/2Ma03Oe//17J60wYDm99YPeX08qyHGA5EG0gcLXtY5A?=
 =?us-ascii?Q?3OiHJ7g5X5pQ7+O5ByZ5gRply+zpJ8+VqISu+EEI25566oMNZlRTc5VaYRrU?=
 =?us-ascii?Q?/RfpF/+WcLfzGXY1OYE1d2GrFFkzJ9MLGz1Il/zeRB+c0Adz4FzDiLtPw1XP?=
 =?us-ascii?Q?zwOyISzlVtYdvqHQleMM0cvm24uFbnTSsyZyyr3bj47EaS0IjmkHVtyLVL8e?=
 =?us-ascii?Q?0Yd91XXz4FPE7ZfoMfHyjxxENKAsfSYVyG1OUS5zDKZcSzxyP2KQEGJm+9vx?=
 =?us-ascii?Q?e9cFF9A0U1rzrmwE3cl03rsUK4KM1Nr5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u+n8Ck8tkVfFHXDtEgxnaKNHXTwGx8gHivybk1z2ntxvG4VN1l1M5rzEwoQf?=
 =?us-ascii?Q?xnbBW4xyW/jsiAIRViD4Vie2gc3mBUVlaTBE5I+yrDHbOe340BwiCI6V/fk4?=
 =?us-ascii?Q?p1W62pWBKv7ijsP/MkPi9RhSG7PBF9arEwnJYyiz/ED+Uy6HaCRmsGntFhKN?=
 =?us-ascii?Q?3NS4AdBEZuLv8Z/VARZgpV1wk1oWnZI9m5NkP5ZP57ERYNPQyymLx78lwkGY?=
 =?us-ascii?Q?pSvbvFNyROtsrMSXqCIFXFMaiTawz02W5LcF6N1EE0owoOe9giB/igzJksH3?=
 =?us-ascii?Q?K3XJLGoWqaRXnxq9PdIIcOamoPU9klLJp6AihPsKU6fvEQiLKpgRIKG+GUz1?=
 =?us-ascii?Q?FNO+KnLOw6EZRua6HzPQq9hDVq/ADmDFQwNPCoJVL6N+4+tVDT2dOS6SY44N?=
 =?us-ascii?Q?0fle5tVdECiLReEZbw+Rn3qz+u2JXRidrfDKOOV0Nt5Z0UFGUuxQ/F0wPHdu?=
 =?us-ascii?Q?In0SM8d+dDonK2l4iB+V7/8K9FSJ12fTDXJO7pKRJH4z8uEb21IMWNqjoCEs?=
 =?us-ascii?Q?UyEiAfnEpO9tNC7YXzjZi2f0vE0aeSWVdcN6AkZeOr+15K9OlcFaNbq1EPaU?=
 =?us-ascii?Q?apvC0HUxixAP26q2kQKwYM7m67tWV4cKn2U/LVRl+rKxyMZQY/iOfdhPe68Y?=
 =?us-ascii?Q?Jmtn/kuoSNjiGY0xAU3CQDtZe+3dT59S1qIEZT1IXEV0amlJRsAYXZYcZ6o0?=
 =?us-ascii?Q?kLNkkO8MpFr1HZFJloBXTkIzNeszK17vVuTUg98b4kkJteziWAMH12Fa7C4x?=
 =?us-ascii?Q?CcddEtPkNjuqfDSJ0HNiuCk3Nj+B1beBqD/G7usajrWLKEH5J8rttig6JRZ5?=
 =?us-ascii?Q?xhf9sirzs6z27ULbvAGK/qqFORNywHs9I4XbplMTyyqjb+EohbhQvmMdMzQA?=
 =?us-ascii?Q?OHC5qO36M1zztwKY11GWTZCoxZ0eQqfsPC3qATiBtP+jY1VomwpJB3QuYPWz?=
 =?us-ascii?Q?KmaEMzKcSzEE4R5cRNsDTfMmK+kGaz9G+1H4Jth+UIZ2lnJjdKyWPpXrfGTP?=
 =?us-ascii?Q?doM0vclQax8YnOoQ0Loe3DhF0v5GWvZeiYhiaMqSf866n53lWymClrZpsBJj?=
 =?us-ascii?Q?sodYi3rzWr0ZpqxCERdN1xXIxq/nZ5wjwPN1IvxymlI9P0d1EujQml4zCqDf?=
 =?us-ascii?Q?tjPjOhfM5zXWsk7+6KQfXcGamzxWxG7IaHJAhB31Hn7ScBwTtnr3JSIE49i1?=
 =?us-ascii?Q?aE2Z3x+PRxJzHDOOXz7SAQ0i+rw/QQsPCFL13KI0jG5RrnCkysErINb2/a3t?=
 =?us-ascii?Q?d1lXfwDKnySZ7NdeaBuz7ZwW56E7MKOtNlwLLE0Veu44fyUGd6xGeqt1W5wx?=
 =?us-ascii?Q?pmVwI+GLtlQ41ZounPa6qzWQ/RHw1RShUTLiOMrVERgLgpcHD1rJS9nfKBhv?=
 =?us-ascii?Q?lTaV2jHEjdBX9IHV0JARGUG39QacVHdJ6rHv/7zU70/qA+j5wueCGvpEvD/P?=
 =?us-ascii?Q?RwtJiSRhZz2xARa1a7JPL2KaXINMfPQ5NQrCxZoY2xnLn8UYtmFdu6P3Elg/?=
 =?us-ascii?Q?XBc/Plap9Y7Q6Ek9qEKFiqwU/FIe0XANHPEJLbsxoi7ND3AdlfJ1Ldl5APrj?=
 =?us-ascii?Q?GrK4AMRJcVJc3FeRB9PLeMzFuTOzzSrL7TVDlxF5NL2FTth97rlvIp53X/qp?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02898118-ccb8-4432-5589-08de1974e06a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 18:31:30.7054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E26MCxV9M9x8fx1YqWO3z+DpE9aevDqyKf8vX3Nd+C+LrnacUVL+C9hdQJR2oX7Tt5EerYCVcXjit0KcqdJfxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
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

On Fri, Oct 31, 2025 at 11:29:28AM -0700, Niranjana Vishwanathapura wrote:
> Dump multi queue specific information in the guc exec queue
> dump.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit_types.h | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 426b64ef8d99..b84a0be2eefe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3032,6 +3032,11 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
>  	if (snapshot->parallel_execution)
>  		guc_exec_queue_wq_snapshot_capture(q, snapshot);
>  
> +	snapshot->is_multi_queue = xe_exec_queue_is_multi_queue(q);
> +	if (snapshot->is_multi_queue) {
> +		snapshot->multi_queue.primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
> +		snapshot->multi_queue.pos = q->multi_queue.pos;
> +	}
>  	spin_lock(&sched->base.job_list_lock);
>  	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
>  	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
> @@ -3114,6 +3119,11 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>  	if (snapshot->parallel_execution)
>  		guc_exec_queue_wq_snapshot_print(snapshot, p);
>  
> +	if (snapshot->is_multi_queue) {
> +		drm_printf(p, "\tMulti queue primary GuC ID: %d\n", snapshot->multi_queue.primary);
> +		drm_printf(p, "\tMulti queue position: %d\n", snapshot->multi_queue.pos);
> +	}
> +
>  	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
>  	     i++)
>  		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> index dc7456c34583..20dddf50d802 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> @@ -135,6 +135,19 @@ struct xe_guc_submit_exec_queue_snapshot {
>  		u32 wq[WQ_SIZE / sizeof(u32)];
>  	} parallel;
>  
> +	/** @is_multi_queue: The exec queue is part of a multi queue group */
> +	bool is_multi_queue;

I'd stick this in the sub-structure.

Otherwise LGTM.

With this nit fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	/** @multi_queue: snapshot of the multi queue information */
> +	struct {
> +		/**
> +		 * @multi_queue.primary: GuC id of the primary exec queue
> +		 * of the multi queue group.
> +		 */
> +		u32 primary;
> +		/** @multi_queue.pos: Position of the exec queue within the multi queue group */
> +		u8 pos;
> +	} multi_queue;
> +
>  	/** @pending_list_size: Size of the pending list snapshot array */
>  	int pending_list_size;
>  	/** @pending_list: snapshot of the pending list info */
> -- 
> 2.43.0
> 
