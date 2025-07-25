Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F3C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 21:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B77C10EA20;
	Fri, 25 Jul 2025 21:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuI9XK1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBDA10EA20
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753479745; x=1785015745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WAQijUNx30PXf3m4C3Bg/keqc+WMPHyQEopt22WAuwA=;
 b=NuI9XK1QeYz5F0I5hwQJ+rBnfIl1S1vLgUzZiuZDa8/s85j2w586jfHF
 K8biZhP2FYDyDMuKWauAH6gv3Mqt2PG/0qkpx9ZVKx9WKW+6Hrh3G0/Rt
 4nvry17a3XuIW9F0nLIu3FgAC6zPvPu9IwOHHneMoG1DF+PrlJxLJt91Z
 L1/n4F46rsAbSlh1YFpp6+zjnEhpIq9FBfMqXfYo4H2hobI0cN+RfFW+v
 t9IIOgYbU5b94GEr3dmJrH9LpgXo9f8B0fOgbhQx+2iqw/ddkMfAGzaq6
 zRPj+vmWH05LOSqFk+2vELjm3b3T8w0qEYjUdqq1q9fPJQsM/8O5YJFef A==;
X-CSE-ConnectionGUID: UTSjpqNUTBWHKmJEbnHKEA==
X-CSE-MsgGUID: EoDKDueaTuu0qZePg13oXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55786780"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55786780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:42:22 -0700
X-CSE-ConnectionGUID: BqyVUxZ5R/+JItmCA5ymvA==
X-CSE-MsgGUID: TAuxud3iRh2t8jQPtCVNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160344689"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:42:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:42:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 14:42:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4c2KvHl5EcPe3KYM8RlVwibCbACP8MDMne9LNcEd7lOSMtBmIpGAqT2IYPzU5S7vWkxM6UAjWYLr6TL7jhgp0qWyRcuDk1Tu4chnf33qSDJ7fq4EgVnTGkSgu9ZnoG1GH4QieeAz26GazQ/6XBpa+tx2S5NJlJqL7qGLMxMGkCso8KkKGA76TiXhwPD3avY1fCRu/tUIapDvaWjdrD+JxxXEt37AQxXoSRPOUgDT2rnXFP/SUlZGcWEIHRR+QooQ3gLCAsFLHa7jqxbTDNpXF87U0Hx54t2cDYHkwsUkTVpJHXrsq+ZtRSY4mj1jMmJSkuByIk/Hmr3xgIv85iDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOLwIJRPqK9mCW3fCGx2H8iiWrft83qEgF4ceZJfJAM=;
 b=fYChC0h8d6NlIDNTWbecTfFXNj3Rc9HZzd8boW0bR5oMR5EKwqT3omh3uj+Lsh1tRE8wbXZnwiSPhgD9CSoYFfCaXGpyAQkhGZrgWUrYG9o8TZFeZ7Ny3pVOgFTqOSCFhqboka8xcxHPuQJDaZePcY9VsNOwJUhAARzA5+g6pLccKptjqp2dYtpAFiD1zis+Vf/rWurEfhKGgbxcfJwTys2Dp84t0LtYEKFMy5gy+rNSN2lV61iClsZSgi67lEw1dbAmVahgTcfpEvdEIMorESB8gTKBLAbYkGw6awfxu8tiB18QqSHmTC40sTL+SuXlf6Ys7l4ZC81NHYXMNhomLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 21:41:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 21:41:59 +0000
Date: Fri, 25 Jul 2025 14:43:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/6] drm/pagemap: Allocate folios when possible
Message-ID: <aIP6lPnrsjUOTZe3@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725154011.2807655-5-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b5370a-8694-497c-04ab-08ddcbc415c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PKAumRKabxx+PaVgWPYr3NI7iiCpXNZ0UMPr7TSoqmEe5b+qCGIfEmgNN8r5?=
 =?us-ascii?Q?H0kL2JedBHW+SME10TUc67X8HtkUaYP11sfc5EJHF5tNs3Q+O54JaS4KOYP4?=
 =?us-ascii?Q?v1nqoFURq5uxBEt2dW6KYEvOg4R9BKPPxNYXogWtoDDPyO4RCXiXlzCjZ7qW?=
 =?us-ascii?Q?LJL43/76gpkQ4Z9wf0Y37QlAP8Iml0crLXpYRLRyOSjHFnWix09/Hz5Fw/zQ?=
 =?us-ascii?Q?wWTbvUvm6alG3kALq2MvYPwQfkr9WTYwHztDTAT1dtcD8ykeuiWgvQBzAyci?=
 =?us-ascii?Q?CzqzbZiCdzQ9O+hy/YBuJHitE6/xDvdFtzO8rlPFL/pWn2DgYZMuJUxcVehx?=
 =?us-ascii?Q?OLRya891MGn/ndkXW/L3d/YokMyK2EbrKK9PByCWlYOmqqHIrMhnxkyXcblR?=
 =?us-ascii?Q?OT0M+/ENyBSybc3KgW/t86BRweMQIDB9xpIptAAvWnrmiCnoIPOUXy1c17q3?=
 =?us-ascii?Q?vF9U48SXKDDfmwZAEydzN1xQ4wWdT+S9ej23DP4h54ZQ0IlUpUzKKBk6KwKl?=
 =?us-ascii?Q?mGIv9jnMjrvVPWjIQTu2DQoSlZ6JIC0Aw4cFUPdOVvuKJnp9ZDeIhksWPXxS?=
 =?us-ascii?Q?F531501q14OtGpiGnMLZqMj3hNjcgM6d+PFMGghEiItMYmnQG0HCGN4XNInd?=
 =?us-ascii?Q?/nRF9c3PmOcCao3bRg0owvPsfxl3+dOj6QaJUhXe/dXE1GNCBePmQi82ahT7?=
 =?us-ascii?Q?1MD0cn1VBjeqeIoHhZCfUOZAgOJX5lQKcNQlavW4oP3R/e4/7Gz2hFt4K3xS?=
 =?us-ascii?Q?+rXtqaDfgCFXSdAIv3ZlvDi5QjKasxqu+n50rbzcf7mJjjZnsA6V9UBAeFd+?=
 =?us-ascii?Q?MlALD28mc3tCkji1Hdn6RM6IdUVItv+rDoevHhlk4YeoT9hfSbtbng2uqQ8e?=
 =?us-ascii?Q?KCZp8VyhwyI+iXdUjlRvE+DtRcxn/VSHDr/88B0sG0D/riZoXIfKPpOPcVF8?=
 =?us-ascii?Q?r7sa7SDt1cPBFyuYMdO/Oji7Ix8WjjeKrMDrPrhsFCQN44CBRPQXCbQ88jMN?=
 =?us-ascii?Q?AMWTn2H9zQ2i1AhBWrwaKtFtfQYmLUh6enH3owi3sS5xEdyhQHB+HvH/wRm9?=
 =?us-ascii?Q?zjLW9dz23gtIb9dGJtCGr1sQYDx1xbs7MUPZYX0jJqXmYL7MMEXnKDTtlPbS?=
 =?us-ascii?Q?ap6MfQio4uv68Lah9hM5X+rA4iEbCpw86bFWJ1IH3qu1X7M7R3b6q2ZnJpNP?=
 =?us-ascii?Q?FvgjhjMmJqjpk5rEU5SzcF0GT4jqefgB6/AozWQmePK5PFcNGjTU+4P4z19i?=
 =?us-ascii?Q?kjdg5T7CRMvnIqi6gBrW2VgZINdr28VM+K2PnQ5J8Cr/jmYz0WYsy/Ot8rCX?=
 =?us-ascii?Q?tOPhJXiVAcAReJU9he8pP1MaTMcta+dh4YVZgN+LiGtj7Vzpd4pHRjQPGHuj?=
 =?us-ascii?Q?MlZT8qBVgjXUrbN4lE01hBNDu7dkIONjmdMQyICKuKtZ4Lr6gQPgDRgzw9xd?=
 =?us-ascii?Q?9+gcN0F5tUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sMOQMa7JTLRNh8ua7Tw2NOnea+STkR1XnpwvwsQSrZuTwL4Bffc+bwNxmvpw?=
 =?us-ascii?Q?kKjoqvv60WplSCxMiJTeAvrG9p7RMpm6ReRRqY5TaCBF2tyVUso/2+dOTMjD?=
 =?us-ascii?Q?h4Snyz8vge1kwZGASZOVWbFKOWQrRDeKgAWEbgngO9hFd7c4vxsTzxgaQtSk?=
 =?us-ascii?Q?tPEv3a4DW4imkzqxEqMhf29HpQ7WTyVQlOER3Gn7StsQkIUcrv0hvDIf5ZYB?=
 =?us-ascii?Q?S/ZqMi4/+MHrNQATYMJ/doPQJE7GnXQxWvgCBVSAArp+tmf+T3XbG8vW5FNV?=
 =?us-ascii?Q?uSQtNt8U+bx0IrjNOd/2yq4xFlHC+ctS/H3pqLigzW3ag4LNKKEsCJn1mM0z?=
 =?us-ascii?Q?rNOBpaXZWmUQpD+WZUa0WsCfIrbZ6MtmYfuIHmJjWKnQoT8SL41MaYzLcfbB?=
 =?us-ascii?Q?ptypGljVuH3GTVsZcHJ9nKqX0UiRaYIPK1vUbZjqXXDiA+XFDdZtf3U3dDRz?=
 =?us-ascii?Q?1WGFWoIXNoIFQvnlO5Eexi+HnvFGGmNZXtMARbQIMWhbwgRWKBPeNHa2hfOo?=
 =?us-ascii?Q?+CB6OQOxReuMIkh0IA3og6MKHzQObs+V/kWz5QXDL+gJDbqbsWQ53fqpPQMC?=
 =?us-ascii?Q?jG0aIRIkJKjDh1ymbrB43RaKUwMIc70y8KD+nmlfohnfDuNJNT6iUFkXHNyZ?=
 =?us-ascii?Q?uXIUgVFLvpN0/4UsnR8uwk8d/rWKgmaMj48f79hij6GIdkw6g9HVjAcA4PAZ?=
 =?us-ascii?Q?wXtloC/BkpGdlO3ZvCLxl+anIYqhRZThONCwTMhR/Zi272b5N8DmeLZR2pba?=
 =?us-ascii?Q?K7LxTrGWV1qDbeyJsy9VSyYUSUlSl6luYXKgsUkZbq691qrNg04Q08n0RVnz?=
 =?us-ascii?Q?os+ra0ALi2Ba0vgGJ+4lynUSmgHuw40xSN1UIDAGDRo7TA094eNGX8Ya1CHy?=
 =?us-ascii?Q?b8emKbcB/BTSGR10lb9n+KqJmCJgBkB29UH3h+3S55XQ0ZnUC+0xVuWwaqBS?=
 =?us-ascii?Q?meZXNF26seS+fdLBhKXQTDlDQ7wchSoth9AtdWh/bHtO12Uh9RljKxk/LdF5?=
 =?us-ascii?Q?3j/39cKBzvVQmHVdeq5hZRsj1mT5Ou3KxtX/dfRWHidomjipZBrleMBAcJaO?=
 =?us-ascii?Q?qIppGZSjttZOUMPDd69uq4V3tOkoIMLwmij313HF5J9iVBycVQ1pfHAWlYH+?=
 =?us-ascii?Q?QJzeqLvikIUcmEmMfZe3mgTZg6U/yPLyYRN+nArJuSm9y43uo/SgNmlQsNlC?=
 =?us-ascii?Q?uliQ99PHLXhpANt9avXtJyJehrJvmvGFifg1h9ZkhIuZ2ZvvOkxIfk4VNnW8?=
 =?us-ascii?Q?EcAt0nnIRVwombeQ5pAfZLXbzPL4I9gSvrESBDvkmOWYn6xXErIbL26JJ0Y6?=
 =?us-ascii?Q?AEld5XFSg88bbc5EfRzgbCfx73zLVlSDQWt/tmiYeLIrLQkOy9FaVWDT48iI?=
 =?us-ascii?Q?K2osvR8jt4vkPQGJiyU/9oiY2NFBG/uNKI+6weNfxym1aSv30g8ovwo7YIcL?=
 =?us-ascii?Q?Qgf7fp/VePIeRoUGyKEbOBcA9F7wbDZnGWwJ34MS6a4HydqsQj3v0SGJ0me9?=
 =?us-ascii?Q?7tUM7I96xB1N8Zw7cYK4qOZajpfuu45YX+uxXAhnj0USNiTX1lz6pg+UJrPz?=
 =?us-ascii?Q?krIA6/fZ63lnQ1mu9p0+bcQJsPMAXir+AQdzCQTt+W8uQC/LFWEltt3Vc8Ii?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b5370a-8694-497c-04ab-08ddcbc415c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 21:41:59.7368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4B2kULoDQB0min0RWYYaPEHW51YDZ1+5ARudPFwhaxn0wxrreHcTtKNQ5xvgE4BJ8igGIn0xsjK+KZcC2jQY6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7779
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

On Fri, Jul 25, 2025 at 05:39:28PM +0200, Francois Dugast wrote:
> If the order is greater than zero, allocate a folio when populating the
> RAM PFNs instead of allocating individual pages one after the other. For
> example if 2MB folios are used instead of 4KB pages, this reduces the
> number of calls to the allocation API by 512.
> 
> v2:
> - Use page order instead of extr argument (Matthew Brost)
> - Allocate with folio_alloc() (Matthew Brost)
> - Loop for mpages and free_pages based on order (Matthew Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index b6f5d3a8e445..38753ce2bca7 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -458,54 +458,72 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +	for (i = 0; i < npages;) {
>  		struct page *page, *src_page;
> +		unsigned int order;
> +		struct folio *folio;
>  
>  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> +			goto next;
>  
>  		src_page = migrate_pfn_to_page(src_mpfn[i]);
>  		if (!src_page)
> -			continue;
> +			goto next;
>  
>  		if (fault_page) {
>  			if (src_page->zone_device_data !=
>  			    fault_page->zone_device_data)
> -				continue;
> +				goto next;
>  		}
>  
> +		order = folio_order(page_folio(src_page));
> +
> +		/* TODO: Support fallback to single pages if THP allocation fails */
>  		if (vas)
> -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +			folio = vma_alloc_folio(GFP_HIGHUSER, order, vas, addr);
>  		else
> -			page = alloc_page(GFP_HIGHUSER);
> +			folio = folio_alloc(GFP_HIGHUSER, order);

I haven't checked but I assume if order == 0, then alloc_page_vma ==
vma_alloc_folio? So goes for alloc_page / folio_alloc. If so, then this
looks good.

>  
> -		if (!page)
> +		if (!folio)
>  			goto free_pages;
>  
> +		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +
> +next:
> +		addr += page_size(page);
> +		i += NR_PAGES(order);
>  	}
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order;

unsigned int order = 0;

>  
>  		if (!page)
>  			continue;

s/continue/goto next;


>  
>  		WARN_ON_ONCE(!trylock_page(page));
> -		++*mpages;
> +
> +		order = folio_order(page_folio(page));

next:

> +		*mpages += NR_PAGES(order);
> +		i += NR_PAGES(order);
>  	}
>  
>  	return 0;
>  
>  free_pages:
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {

Same logic changes to this loop as the one above.

Matt

>  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order;
>  
>  		if (!page)
>  			continue;
>  
>  		put_page(page);
>  		mpfn[i] = 0;
> +
> +		order = folio_order(page_folio(page));
> +		i += NR_PAGES(order);
>  	}
>  	return -ENOMEM;
>  }
> -- 
> 2.43.0
> 
