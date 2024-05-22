Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C00C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 16:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF2E10E138;
	Wed, 22 May 2024 16:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIKgc0v8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C45410E138
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716395344; x=1747931344;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=maceNyn7iZIkygJA0hk0BPnm7ZnnwtzMTiJypW2XeRo=;
 b=TIKgc0v82CS8LCWV2gIviSwgbjUQqsbAZHHVaOwzo+kPmMneSGE4I7P1
 daejPhxQW7qbuaR50fAwcYFSVz1SZMUMtYg1cT0Ucdjm9DwLGRaOvh2fa
 OjUeOwGmknZRDcgI/tgnfL9I74I7kNg/tbcLQ8ajDtWf/pkuZCqByJd4r
 ekVi0gZ5IMxHdL8GpNcsAm/kVC4mUhMWUXya5uoca1LtaxhciyJsrHH3U
 CcECYEkWNQoAfXlDzGWu2RXUwHGrbYGSHQC1GRn8lUozvewTRJe7Rljmm
 0R8uZTbRU5l5srfYxYSjYTusnpD10TwQaDbJrd+jS8DOVCKDie2HzTYu9 Q==;
X-CSE-ConnectionGUID: 588FBK00R7S34kN7Is7v6w==
X-CSE-MsgGUID: a3ED7HemS2GrKp9dpf9h3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30192315"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30192315"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:29:04 -0700
X-CSE-ConnectionGUID: ifvXWaT4QSucOH7StUkz/g==
X-CSE-MsgGUID: DdoHsyzJQyiFyaa6ukS2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33209233"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:29:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:29:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:29:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:29:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKQZD2BF5sh1OGq3G8H4wqrYGstAmSClttgfavUSOLYsiTjbbaMdCTSRtMsOJUoWwC1JyUtM2L7vvJypod7WFIoiyqeym+sAYBmBgy44SyplrpOkHB9cAtNDtm5vHtuAMX7E86fYmnRztwBRVDQ/yKJKERXtoqaAhz78rN/M/rjh0yacK4LGRI4NJDvFC0CuiFrfzZA54Z2OUYVhyZUE+5TK6oa3ZcuadWKFAxYU2zeCUbQr0GLOEgE6gR0YT2TwcFkqHrriWHHovN4X5uHsDpOX4AZm+xOdJi8O1lIijDkoGEfazB404GK33xb+f0YyJPTRXlvSl0AjCAKjIk3mnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb2HuUr2RSXsgcgFBeE+e3o0/N6WTTS3di7iJNJ8BUI=;
 b=gcKx8n0rnWbIVXYvm+meR9wk/dZu6bxC0b6BHs6hGDbI8ALovypvvZQ/qVtG/4pYuRck3Vf886oy93YEJEHEc7169AFgvVxw5iteSeacgCMWwUknZhjqHkNIVEADFynkWEEu4p2qWRx482KTTKtUTRqP49lY2W10RX97/BWVyMzXd58YUf98ecHq8uvV69ZHgjILgPzIO3ECQ281j7L5foG2Z4oz1KycOaBwbIPUS0cVXiFOhi1B8GulAjl/rx1lz7B7vtew7wm8V19f8D4H/XyJXK5FNhUG4u0Lss+a51ON4USE6Kd5rB3B+sUSuVVWMUspxEyXsayAZ2MeI5AF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Wed, 22 May
 2024 16:29:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:29:00 +0000
Date: Wed, 22 May 2024 12:28:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Store platform name in xe_device.info
Message-ID: <Zk4dSS7rPJZgif1v@intel.com>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
 <20240521142257.756-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521142257.756-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a93fe1-b8fd-4a22-56c1-08dc7a7c4937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+arr1j1QErTLccni9m+xeUia9PWkPQkgefOiLwKYlx1+VvdBe64/8nnPs0Wv?=
 =?us-ascii?Q?s+2TrC7WZ2j9kxKtJzrzjXO136dvoilxAnQKAYEGmLfX/CVgwEz8vVH0EBmX?=
 =?us-ascii?Q?J4VkEFUVkOaacQiBmxTvNxOd/sBV7jylYPNcqGtf0OyNaUxmz7vImCmRWVyE?=
 =?us-ascii?Q?xB0ozYcjknrrQmEidu2kCPXhaQqbRvjVQeb7iGXHc5jGv0FyFzpsRwxP9Edl?=
 =?us-ascii?Q?RFu9Zm+rYXfunwBR47iw6dh+geFhcYYYjVQCeMUrT56rrNwo8dc3AFPNwb45?=
 =?us-ascii?Q?4q7rDABc56w8PImUEmjT9OKmj/12lZAhN4XmKh1zz0Urt50eD2m2d/zeJmt3?=
 =?us-ascii?Q?pFcsXdAdN/ifDVYRPnNYy7wnsdzTWOGwPgKhyRKExKkoD30GB+xPO3M8stNm?=
 =?us-ascii?Q?vIPr7ddmHypuIRqmocobzCGgJ5Gnm2hXtFqNI1kiNHt+QpdhV73GSNgBqqiD?=
 =?us-ascii?Q?ed1NE1nSzsBjKvirsPzB6qwdEpRIIfDAXyqoaqkoGoLkiPw+bCvXXvgqS4/2?=
 =?us-ascii?Q?9tBLJiFoekJT1zjZcqL73PvBuH5xA09z4c/5xBp6TqmFJOT5C+21svdZiBxV?=
 =?us-ascii?Q?4moUEHjMoYMkNxniGs9Gh3XHwZl2SFnwVoXLmAC9If/LT624ZRu+fxzjBGvx?=
 =?us-ascii?Q?IsBmM6hq/2sVfa3RX1Dk7bey9/jCQaaCfgZvEiLCaxBYKnFaLZuWKSIV3iX/?=
 =?us-ascii?Q?7xBQBjW0rGmle2sqqm384mKzRxHYog+FSeKe8Ks02KAnnLX1q5o9PaKSzfmS?=
 =?us-ascii?Q?pLWBuW31cXO4nA0MxXfvMFSJ7zdrpvAwVxPmhmPjbtbXsmzAY/2NcAExEVK8?=
 =?us-ascii?Q?0Km6IB3cQ+/Jq2M6eIMAsbHYIuObF38I4KswvK2WWRsRQfhGAhdW3wkfsXiL?=
 =?us-ascii?Q?ZdtmdptrW08lNCWQH/+rsuuWQoSxoU8wJZInUnEz4lPF+0RzXbqxb4gyBTvK?=
 =?us-ascii?Q?QO4GyrTCHYsaRN/Op+535fAUFtF+iJLwDobodhg02qdnyv8fS6hzMHZP1Q8j?=
 =?us-ascii?Q?AY4xstmUvwvwC5TdSVPCR2xCH52n/TJlXOPgQ6nOnaMLBguSuXQv1dTuQnxz?=
 =?us-ascii?Q?aVo23/5LrVUq6OYF/XFDNzf4p4sJ8w+T6zHFghlsR3W2eza/5o2X9Qn8+qeb?=
 =?us-ascii?Q?mKuab90VLd0dCfTgVFcurPcb8j+PDBgtPT1eEcAP73mDAcqyLw/n0w+i3X2k?=
 =?us-ascii?Q?l7zMLl+i1QlmRT/rLZz0t2FkIeE7BNTsRmnhHHxESgJHEKqGKoCk86AIjbmo?=
 =?us-ascii?Q?7hWJlKRj9/qdMZsqbP0S87eEZjwCSCr6wmtaFLiN2Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OPoQU/4vYSgacKy0H/8JK1wpkBdURm7nklL2UkJEbiOdGnAzLj6AS0coCobk?=
 =?us-ascii?Q?iWKqUH5MqkeWkDnjMXY6xLFoZJ0VUHG52d+9djA40nWEritcgyOK3YdG2m9o?=
 =?us-ascii?Q?tTBnFuZ0uW6PmFyg7BEOdl4kEtI44R/qqkFjO/nHYWLWyUF7B993Iw7BcLpq?=
 =?us-ascii?Q?nlvyxheEscw9KBd7IY6aQ29axtBG+ITk+0bMwS92BJ9ZI2pbmZguHuFAJbon?=
 =?us-ascii?Q?rnq+z45iO6colqy9Yz40wZr/C83ZUEblB1LFcA2Czm0okJtFUJH6GpbJxMix?=
 =?us-ascii?Q?4qVbfhP+afbOeMkl8rtcLp+tjUin2egzH7D9kesMGwfJMhgConukvWaJLGty?=
 =?us-ascii?Q?RpIMg/F2LVJaUtS/GCbf0E8pZdVQb8i2MfnWwj+6I/+Ryf9nU+unrEBKUs1n?=
 =?us-ascii?Q?gvBzw4dvrYGA7ly5CUhB2v9/ASK0FsjX2oPw71NmmQhZeWkhGAGsWQ42EBDV?=
 =?us-ascii?Q?QeHTLstdpJlVHrTp0qUsLH5LAXXgOt04X2G6edeGs+FMDP12HJosWICf0KG/?=
 =?us-ascii?Q?SRqkZiO05YVY05Dz/RY6sFN4nUyoqYLqZNzAjfTK6MMJhNonGtOaTBizMeDF?=
 =?us-ascii?Q?C2B5LEMA7dbM0nCp/P7ZVn9elrfbBy1dgEmlOcrNAoKjdi0yElnd56bEnhMu?=
 =?us-ascii?Q?YXXliGyhAxSwYXwV3kUIN4QSiyXsgXpDhQb9wLjasFDD+Z8vPg6ZhmIASi29?=
 =?us-ascii?Q?wvmQyh3DF14PQBFS+7z+GFZHfjIsGh69V/9SXU1qfIP1Ai5AVGWXsBZOq3of?=
 =?us-ascii?Q?floKi3f2ktlWRcfGyPmXioc3hmj0sR4GfDy6XQ44NyH0uVdiKjK3Rc4cTbay?=
 =?us-ascii?Q?9dR4ir0c9FgTAGIrBDd/Q6hI0pYrB96w91OgfSpqhjUmtYqH3tQ1l8UQDZ6c?=
 =?us-ascii?Q?eI/OQECH2yBRVLmtgln+6Dul2NHAD8r/UjUm0VHVQJonwf3/BvcOINpAVQs2?=
 =?us-ascii?Q?yRgT4tV7tQNmlT5Dhzp8QnAIyEQHu4QWL6tjMvAikBZSR2WkA9o9mwJClN0w?=
 =?us-ascii?Q?QNSHbMPvPQ8l8xpnaviRgn5zMC73/ZnR7+a4BCVodGNz0TqgD6HynDcpfX7T?=
 =?us-ascii?Q?bNLPvdbx0oCtpudVE8dMWsXdtGfVNYNT9uVv0TU7WLOAVRFAlS1ZWmB47eqB?=
 =?us-ascii?Q?Y0bGHyWTkfKML2gcbC2Sp+KoDp3WpAqc10VWqaNnLdfu0SlrTItvWfacSREq?=
 =?us-ascii?Q?zO1GDOiJuYij2brhUmTlpKuEIFRKxl+600pu5HpvKSk0Le3F3iLP5fIoZ942?=
 =?us-ascii?Q?ecuy/kF+9QwIRXyPufqlFuW9LfulxvCtn5cQlIxgs6sVGCphhcDG38wmT7Ms?=
 =?us-ascii?Q?u1Uk8BqCG15W2db7CBXxtAPsi7foW5KLKde9xPctVN5HPDLkATaeeXcdDnaV?=
 =?us-ascii?Q?oM0fNYmKpbhsdonrbWdJpiqSWjqQoQHjH3Q30U/ZKV8CN4tNIKvVAOnUmVta?=
 =?us-ascii?Q?oXAN30P+iP4vISOTIWo9Yi/6I7+LphZtbrKhgeA5gTYzP6yhMbpsAvTLACgM?=
 =?us-ascii?Q?Wg5bmZcJz9eGBHLRwt4xls9wfV6d9GoEzeTjgbD7NpohISXb5CHhd/ghivgc?=
 =?us-ascii?Q?N17JJ44xYVf5/Mq93B4+MSOJAPjQ5t0Y+nZO6njP/YkHnUS2R/G17WdCDF6E?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a93fe1-b8fd-4a22-56c1-08dc7a7c4937
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:29:00.5371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2X4jtQYk5cR3pYA9hwIgrewFJVsiQ3P2Dn6dvW13ew1skr9S7ZZi7MVVFeyGO1rkvllo1RjrAaB1Uh5e14IEww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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

On Tue, May 21, 2024 at 04:22:55PM +0200, Michal Wajdeczko wrote:
> We already maintain the platform name as part of the device
> descriptor, but in xe_device.info we only store platform enum,
> which is not the best for use in any user-facing messages.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5c5e36de452a..99edaebfcbfd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -218,6 +218,8 @@ struct xe_device {
>  
>  	/** @info: device info */
>  	struct intel_device_info {
> +		/** @info.platform_name: platform name */
> +		const char *platform_name;
>  		/** @info.graphics_name: graphics IP name */
>  		const char *graphics_name;
>  		/** @info.media_name: media IP name */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 682eafd84901..b30fe4849038 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -561,6 +561,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  {
>  	int err;
>  
> +	xe->info.platform_name = desc->platform_name;
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> -- 
> 2.43.0
> 
