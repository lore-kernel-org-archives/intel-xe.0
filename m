Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D55C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 10:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA9910E34C;
	Mon, 28 Jul 2025 10:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDPaCCbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC93910E34C
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697918; x=1785233918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J9Y+UUQrp8sfPbjhyhvcsuVwrJrr3sJdKbVyLjfxH38=;
 b=DDPaCCbHnkTDduwQfCdpT/wuFLdiyEoHAHwdX3E720aXjQlrjuj0wOhV
 n2IZU9ih9ttkQmlqTyaxplGwsTbN4byUwCpVde20dzYgOAiHEkdO37I4p
 q80f3GcsxhDiFqzV2q+YJXyHY9stkRCpfsJhy5ddmb26FqgXSwJCVA2aR
 KUTSw2SEAtlEpDOrrjpbDCNdFt1Y4cAimg0HI5iMrIk0hh+kkx9RyBbyG
 HiHp1nvUpb5AXcNC8s35hpp4XE6eOxmlPyAHcEBYjzYUJrFzUngtjeV/v
 pPCc4XJlTmVkd+jKshHqbE+c91RsXOstWag7KbmeR8nTwQS6P/a/+oLXZ g==;
X-CSE-ConnectionGUID: 0rhlCXYUS2yzxAB9GLaWEw==
X-CSE-MsgGUID: XMg7qcctSR60pSLz5ifUvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55909585"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55909585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:18:37 -0700
X-CSE-ConnectionGUID: HKF30qKDTmW8pjwHSmO9eQ==
X-CSE-MsgGUID: ZJgqCKKyQ8eK62BVWHeWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166855489"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:18:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:18:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 03:18:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 03:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmL5Uv/pOKfibVaXdvUBlROKTCpjwlB7kjxuckk4cCbP8hvGsCRpurPnFJQw9EGZcxrFO0f/FZt2BYYJzd+iIfGz0Bg9BsmT6zpbzyOAnTBFl99bQMm8HlYVGjkzsYew9710vpMqnQH6xdi8ZseUpC8fHAZ77K0ddlOLLcftJv2w7n7NKsNAIjlLVWfs7j7Noctz7CrJ+Rh/TNGQThXDxvo5LET/DbI4LLnx1j/XBg/Ollp9Ph5u4CNFGjgI3kzMzpiJ7pgi4nqXCX8AP00pOuY4fD4DhqmepmxTOxNrb3vs7o6jHz3O2ndDKeCqJ5U2RC0CoUAiy10P5qEfNGiLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiJtIYomB131ZSsXEpyWHfSADR9Mr9ehPSSpuB396ZQ=;
 b=KKVi4bHz/Mlj21dzw7zBtHb72ZjZZ0uiXkOvwOnMgEKx3WXp1ui58VVgvM4bWTe9OGJDhYwyGB+yfmjy/6Obfy2mwvFyAbniQlEwnTGPTvMRP9+LtNrxcuYhUdInOK8g8v8O8N3xBXSm2K4Nl72azGOIFCXzOb9a20VoEEm30ZHiuC3FWZooch78Sx6HsvhskKu1OG14XEu1MoCuESuZkh7H0720Fo3S1zZ93HfigfiKtfE22kxSHD7e3KVQOdVUCM4BrppPYZ7k9N5IP2/UFAYHPi5gW6EVeWxjNZREFTHsl9uEIQjpvdFYhWdWf7gJw/WWm0nCZOrhwQcidJ1u8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:18:33 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 10:18:33 +0000
Date: Mon, 28 Jul 2025 12:18:26 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/6] drm/pagemap: Allocate folios when possible
Message-ID: <aIdOcjGzp4pDlxQ2@fdugast-desk>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-5-francois.dugast@intel.com>
 <aIP6lPnrsjUOTZe3@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIP6lPnrsjUOTZe3@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a621e3-5007-403e-94fd-08ddcdc01b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ERw3mmz0YPr52H7cjmmaAQnUTBYt5YRAmW0NU3HRNAJvWrvxLi7tJ5DfFcMD?=
 =?us-ascii?Q?bYzlIQ/WqoUGj7ELVGQIFOsNyi5PdmzhpYPXdaQxFpDwG9okeDWZXKIE/XTq?=
 =?us-ascii?Q?RGgZZpo5PKkgsZmUCqH92ZwNHdd5flgrZCJPqEuK8zR1m/PAXVUB+RYzXLyO?=
 =?us-ascii?Q?XuQ4G3JufDjuZqfXwjSvqMNvATP2Iuu/I5QhsVSwUQKn5WQ0TxKUWE2tBV7d?=
 =?us-ascii?Q?KwWe0WL0QaFlAfZ20hRkiDagEU2rZYG0Z+whOzCbWcmi6ZIKoQybxBFQfB54?=
 =?us-ascii?Q?GM+ou2Q/mG3DG/A1GawPO+sPU8SjsULm8+CodsP1WfgqopnOTZWXO8Csz83/?=
 =?us-ascii?Q?XjtRkurzKp0uukttaKh6wLNhKie0ar+RsKSpuOJOdAWkwHwmxtqlHi0zitd7?=
 =?us-ascii?Q?La31XPBEAnx/RsuzT+GCzdS/b6v34XRNAqOoM4nhbvlsWC2VHmGuVAEYLrMg?=
 =?us-ascii?Q?Vf5rpOrYYr6uRTHZh2iuIWYhRN+dId21OJ5snyHaHisAouNZGJz8VDE4Q+cq?=
 =?us-ascii?Q?X9j+1mvjWFiwWAFWyrWRqPROPVYGA6b2jUd0uYNFQpW2snVnkQrkFvKZIsBI?=
 =?us-ascii?Q?gf7arAReGGNTK/hzBRAHnRzu0/92rOZ02W7hQ2BKQKMww4F6ZH4sbVGSmJW0?=
 =?us-ascii?Q?BRB17ewK+opoXZypNXIXLgtCeJvkWLhihLWBYlikn8X3eLwOHA7+YAvK6e3+?=
 =?us-ascii?Q?bEdjms2b/yDdgtkfGroX8PDQSU+74j0qk9WkTZbApRRaR/xaFqh6vlGclmIH?=
 =?us-ascii?Q?R7O9PjphXGjsPky6viOob78PfvEE34osC+77oE4DTCB7iSMwaCVz9a+59bHN?=
 =?us-ascii?Q?BX+8s+2fJW8L2/KqZOhbQWkhYGPDfIFMfNXHmnX+67h6DOkxz49YC8/79u9R?=
 =?us-ascii?Q?K39QusXwhYOldbF3auF3A3EuGIzNyVQimTjJZZt6Nd1njZ4PPJWC9EH7HjV1?=
 =?us-ascii?Q?bbr4OSXAecrdyFqsYTvTV52Yf6WKuBBEcVmYRFYIJQY46KiM2WSG+H8m6LTo?=
 =?us-ascii?Q?TVg7F6PxqakQCKJPkFj1m619+0IPr4bckdqozQaCfE5sfYgJzLjmoU/Kg1AG?=
 =?us-ascii?Q?ewJKMDQa/bQF1KG4FmjZ4rTNnp02IKMKInF0iU6HAagfxT2lSBiKO03u4sqt?=
 =?us-ascii?Q?iqTzkgYd9CzgUlkdBAluC0tA/7CbzVf+nxv4f1LzG0DXV7lVZW829FyRoovR?=
 =?us-ascii?Q?nPgfiR1zlzALv/Kdt10wSNAoH02WDY2c3P2+jyU0thsxyOb7mznvWTwbC751?=
 =?us-ascii?Q?WyxBpwI70f59iVZBZUnygYXMTJK/53VHE9Y9Wp+xNx2WhHd/TcwjDRcYYAxD?=
 =?us-ascii?Q?2AxR0Y+VGZqkVzV7thzUJfwJXXcRe5ol/z/E2Vj4Epmqdc/UKRDfC2WqQ4ZO?=
 =?us-ascii?Q?yrIoGq48DKV5kKfAwgVZ87SeOssB8Dw0KeseUmF5RivTE00t6USxSrKKU8l6?=
 =?us-ascii?Q?DW33bHbUP/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BGpdtnI/dbxl9UEvMbxs+uQT/MQ15YLmGE7Nrpt0Ws3gjnVtM5x+qrWZwg7w?=
 =?us-ascii?Q?motSc06XKKQaNaGOyY6BWuNC1HLD6TGRrm6DB/Gq+dYco9g7IFFWfJIfeMPl?=
 =?us-ascii?Q?kn/yA3o1E7V/lmPP1LDK+jehFcBk3VdxepACpbA/tSUTFeAR6LlXOk3F5Iri?=
 =?us-ascii?Q?Lpx/2tXQ2dgvdnHyG5i+j/PCAKgFxjGku6NtFHEhi1Ou9buP64wa5miUXHGU?=
 =?us-ascii?Q?uLMneI2AFFi6q/0wqNDTQVOvEiboJVS4Amh81E2BYg1+NLw7MmKUYKNlWHRJ?=
 =?us-ascii?Q?2kgyIo9TUXHpN0mvDe0YbBWM+45i47iMpr/XqmE65JNg5vjkSszJ9ypQEl2q?=
 =?us-ascii?Q?/A+qs2Whd18FS4SMgLLo8uIiMEuKLAid8HAF579HUXB0ohr0KCEqJP+Sk9Pr?=
 =?us-ascii?Q?1SqXAGMktHKtySP1WXUdb8SXVkW+uS33KhAefUqsNd1WaJINuyQ1bp8knEAH?=
 =?us-ascii?Q?KJHfv3+8P7CjdWzo59eJJxFQOcDAynIsxc77/Vq34N/gJ1JrpTav/aT/mnyn?=
 =?us-ascii?Q?3v+7THwVOEdmINsTGl4i9sK0ib41FKrC/Y+BB6vjZU/1EpVh3npu8m/2ov8J?=
 =?us-ascii?Q?M99yMAnNdKbC/Zto6x/XmL2iUeBdIqiqJhfiq+sDg8NezHy8Uscak808YTWP?=
 =?us-ascii?Q?vUUz87iJwi/+ms4Zh4QrtsvQ8ac+wvbY7kumlSWdAqtKYJ87L39R8NZziCds?=
 =?us-ascii?Q?5H00LFeSFd77+WoSPvSQx0jpriJZMeD1QY45ExStgnPFJq0udlkX69litIuo?=
 =?us-ascii?Q?Oz9nxxk0MXhiPE3oZJL17LFaazSsoont9lN9emBUKzxtlzWNY65gtMlRtfZJ?=
 =?us-ascii?Q?2ty+SXZ/QkCshmCPVuexsGkbqN2aw3zILTlpZJLrxbkhVjZsCMnYylmXElD4?=
 =?us-ascii?Q?8IyQYR6t39wKa+sj/CKC8RxCoqJeqths2lM3Cdwq3luYdwKbDvtBeZFMLIjj?=
 =?us-ascii?Q?gEv5jYpCMBAENZrCSXGZ4VWCiFkug7zqlTKppZl2FsHvTz3bvH0Btt/KO03Z?=
 =?us-ascii?Q?Uhl4HtC2Libo/TJ5mOlUfZT6DoqefDlcj/FVii6N9DLE6odpxtN6dW4IHDu/?=
 =?us-ascii?Q?jiwIYvcMTfSADPyukIfb1UM2NP+6LYYHG+BqtsrT7YS5ipv/AUWY95Mm4WtG?=
 =?us-ascii?Q?/jDKqew/GYOW7b8tNMe67rkK3+zUJdJp1aqe8OPkgZQX7p9j/3F20bGNUSu7?=
 =?us-ascii?Q?UwoNEHcnj4qvzwFXgqrWD/BwOezsEXRyBpVALDjALYJ2uDWrLbilRKQy2d6H?=
 =?us-ascii?Q?GmV6gcU5NAvbmrHArULT5E8muMkjeNxS3pzXscVlYwb7cnSveLVTS/KMlYVX?=
 =?us-ascii?Q?N8zuEKI+pNZyQBUOooCAO9zGoCfa1AHIpgJzLiYLsu1QvDANFZFzCRoYstYG?=
 =?us-ascii?Q?jbPFjmuk4zMAtVVeOBpZVwPnfbVdKI50cyEyQRA9AtRZLKo/YIZkev6N/DHp?=
 =?us-ascii?Q?VcIh8tAvGXqPJnTl4s6kTZ6I/31Bvq+7pPr+VyS0Ne+bNSORhQ6w/ogrlSjl?=
 =?us-ascii?Q?VUjbkD4STt93zzZiqU6rGdF9X9Cu+9hHa1bw4/51YdA8zw3aQB8nO21UBPdI?=
 =?us-ascii?Q?aLety5Rn1tDUjAUXKRGwbEYKF08zUP+hSySvEtsPO5FqEWg31pBcZBRTpDAG?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a621e3-5007-403e-94fd-08ddcdc01b4f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:18:33.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLQIZfLIJlLkbuJmBa58axuD7fB7RTzP40+1uFB/ZTjh0qtF4z8BLgKpBPHzmIrpWPg4vRi9ZJxDnQl1j5NkUHloDkUyOWNsG/ZYkcs3+/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
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

On Fri, Jul 25, 2025 at 02:43:48PM -0700, Matthew Brost wrote:
> On Fri, Jul 25, 2025 at 05:39:28PM +0200, Francois Dugast wrote:
> > If the order is greater than zero, allocate a folio when populating the
> > RAM PFNs instead of allocating individual pages one after the other. For
> > example if 2MB folios are used instead of 4KB pages, this reduces the
> > number of calls to the allocation API by 512.
> > 
> > v2:
> > - Use page order instead of extr argument (Matthew Brost)
> > - Allocate with folio_alloc() (Matthew Brost)
> > - Loop for mpages and free_pages based on order (Matthew Brost)
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++---------
> >  1 file changed, 28 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index b6f5d3a8e445..38753ce2bca7 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -458,54 +458,72 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> >  {
> >  	unsigned long i;
> >  
> > -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > +	for (i = 0; i < npages;) {
> >  		struct page *page, *src_page;
> > +		unsigned int order;
> > +		struct folio *folio;
> >  
> >  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > -			continue;
> > +			goto next;
> >  
> >  		src_page = migrate_pfn_to_page(src_mpfn[i]);
> >  		if (!src_page)
> > -			continue;
> > +			goto next;
> >  
> >  		if (fault_page) {
> >  			if (src_page->zone_device_data !=
> >  			    fault_page->zone_device_data)
> > -				continue;
> > +				goto next;
> >  		}
> >  
> > +		order = folio_order(page_folio(src_page));
> > +
> > +		/* TODO: Support fallback to single pages if THP allocation fails */
> >  		if (vas)
> > -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > +			folio = vma_alloc_folio(GFP_HIGHUSER, order, vas, addr);
> >  		else
> > -			page = alloc_page(GFP_HIGHUSER);
> > +			folio = folio_alloc(GFP_HIGHUSER, order);
> 
> I haven't checked but I assume if order == 0, then alloc_page_vma ==
> vma_alloc_folio? So goes for alloc_page / folio_alloc. If so, then this
> looks good.

Yes according to include/linux/gfp.h:
- alloc_page_vma()->alloc_page_vma_noprof()->vma_alloc_folio_noprof(order=0)
- vma_alloc_folio()->vma_alloc_folio_noprof(order)

> 
> >  
> > -		if (!page)
> > +		if (!folio)
> >  			goto free_pages;
> >  
> > +		page = folio_page(folio, 0);
> >  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > +
> > +next:
> > +		addr += page_size(page);
> > +		i += NR_PAGES(order);
> >  	}
> >  
> > -	for (i = 0; i < npages; ++i) {
> > +	for (i = 0; i < npages;) {
> >  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> > +		unsigned int order;
> 
> unsigned int order = 0;
> 
> >  
> >  		if (!page)
> >  			continue;
> 
> s/continue/goto next;
> 
> 
> >  
> >  		WARN_ON_ONCE(!trylock_page(page));
> > -		++*mpages;
> > +
> > +		order = folio_order(page_folio(page));
> 
> next:
> 
> > +		*mpages += NR_PAGES(order);
> > +		i += NR_PAGES(order);
> >  	}
> >  
> >  	return 0;
> >  
> >  free_pages:
> > -	for (i = 0; i < npages; ++i) {
> > +	for (i = 0; i < npages;) {
> 
> Same logic changes to this loop as the one above.

Will fix.

Francois

> 
> Matt
> 
> >  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> > +		unsigned int order;
> >  
> >  		if (!page)
> >  			continue;
> >  
> >  		put_page(page);
> >  		mpfn[i] = 0;
> > +
> > +		order = folio_order(page_folio(page));
> > +		i += NR_PAGES(order);
> >  	}
> >  	return -ENOMEM;
> >  }
> > -- 
> > 2.43.0
> > 
