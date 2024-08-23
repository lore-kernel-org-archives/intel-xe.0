Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7787C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 06:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B7410E6B6;
	Fri, 23 Aug 2024 06:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoVsmoV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF0A10E6B6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 06:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724394550; x=1755930550;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+DdcnfDqEeL0TvfNQhDfeSmeFiyYcPWjJdhu6RC0PGA=;
 b=RoVsmoV9Q0QVlzjh1xv5jc09a/XKGRWXg53GEE8g9VOmEv4nvlGqgFEL
 g8jTj2KBlhM3TsvKCzFTo3oyVX7klEPaVjv0cQO3JTU8HHVDdf7zlBX7v
 nfvSnGmQ4NW0whly/G699xegGDXUySGL8CLCtjPOU7jJcHk8f0NYhAdIL
 BorPkVdk4VFiGf2/qZYts9MNMZC4W/3zpzFPzgI/JeM14+z7UYYlTVgOX
 pXBOz+AGo2LhwuPm/TZ43qbkhxMJXnI25UZIeuWaaGtkOAwu/e9tLy1v4
 DTEruFMSFKhJF1qPcc6lB2BNcAiOjEUM4YrdkbTvOxls2MYBAvUarBhxO w==;
X-CSE-ConnectionGUID: j22uGjdXSTGLcM0N3nhlVg==
X-CSE-MsgGUID: U8P7wbOmRreaM8ra+BHyIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22443973"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="22443973"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 23:29:09 -0700
X-CSE-ConnectionGUID: 6i6zQOqBROyCgf6UBON0aQ==
X-CSE-MsgGUID: H6XKH3BmS96meMrIQVBZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="92485125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 23:29:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 23:29:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 23:29:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 23:29:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 23:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+UIh9bEM3gDMm1/QIP/Aznz3LngLrsfMMPIihf0sCTAtwvt+/7BiJrLQ7Mhey/rI+g5Z+BdHOQXfRfFqIxiWrYoJnIu1BN6dg3uwgfzi2LV+5rsaPxm7PgGvI/nNfrclfjMMhY0wcuM3eKLCXFwlxV05mpM6JPE7lk5aJVXzCRGtT02yQEtqVHCHrWYUDnBsL+1TgtsVWkCeROPWR8r1WPr+tMcKT5KIVgiSJR6LEhceNMkEzlL5TecaFL5nfEA62q0JkAklLMDtWNc/W0NpX/jXrbIqJH7oopBxj2U8XVaoYjiktsD2ynF5lT/aHu1dEWomoe/1ctQHF8nxQBrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIZ5/EfNLGGM8fG9KvOB/o2g3zs7j5c1xj5VqxcIHc4=;
 b=VH21VyIbuVEjHVTpxP3wQA3hKXWFkftleO+wWh1qiei/D7EQYaY3UJBk2MHPg3TU86jIYm4rzC9TnREDBJuwoIAQjY3Q16+iIdRwxkW5P8dPZSz9EKBeLpDRh163+ZphD3odzHrFdyYqdX7CRIX7x+KfxaKrxxWMPZXPd7FF4UCa4UfQePE+kPAvrEkCCH7N3iHi+VS19KZXlkcKmK3T3Tvo7dgEi4AEOpS58ewVfB8Y6bfIPRwb9Aj1m0l21SsfeWgbxVqkWPo5YxF8UbM/5fcMZXQS5X0uel61BD0mJociGTJjXmA95cHBnl5X3Az9kbpdf4p3W2Pk0VfmwhD8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 06:29:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 23 Aug 2024
 06:29:04 +0000
Date: Fri, 23 Aug 2024 06:27:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
Message-ID: <Zsgr6ZAbM2cYH0zg@DUT025-TGLU.fm.intel.com>
References: <20240822124244.10554-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822124244.10554-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f7004a-37e1-4eb1-9299-08dcc33ce286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tbL8mExcL3nvvMJpGI3olAYiaPTJWGB3JpeNd75tFHEqWGZ4cAhh1YnTX9?=
 =?iso-8859-1?Q?idWyob78Aqr+HZe0Bgld34WFVBSt6w0tJYBhSOqLUVPTR9M3nbAXO3TYJK?=
 =?iso-8859-1?Q?IHjo9JFqUZawaUVi4LC+vuHcSAdPQCUtx471cvVqOhfl3ijw0q+BS/TcLT?=
 =?iso-8859-1?Q?By2ly3iGDQr5ALXUQglyf1ASPBDQAaMsPiRItjQqsHchOKtfiDMtUnorc2?=
 =?iso-8859-1?Q?4acn0eL3Esk4syRwcXhsb3it5TgAQSisR/v+dd5newtlV2Byc1Hr1ci0Q7?=
 =?iso-8859-1?Q?JupSRNrjzYbksagRe/pEEDOCIj/DrKwt7BBT58TfyULOSxc/Ek7Xty68a4?=
 =?iso-8859-1?Q?xa9NUo9n+XS0REzPcZHOBYQqt37jwxH7G6jZhf4+/jD5Zj560OlgqycplI?=
 =?iso-8859-1?Q?NcxstGWHOP6qOVtZHLkt4BM/Aw1tgg8WJiJrWVh8yew2NBtpAGzAzV6mxu?=
 =?iso-8859-1?Q?+P5u8Rf+7qKhw3qyKkEhDXCh3GhSCc3vEooOAVYolBiU8K7lANvjY7Rnhm?=
 =?iso-8859-1?Q?C0mfQCYjihArRl8jI6C4c7xDM0IL10TbEHCIA9eHmc/XSF9qld2Vwkt0xI?=
 =?iso-8859-1?Q?t4T5tLZ5qQ4R0kJAuMkGXvDIC43i/5nR+7weQvLGa2uyBxeGrWMzfHhWvE?=
 =?iso-8859-1?Q?WU3TvnsTeHawelEKKiC5d0sLyLXr38UQd6iIUh92WodZ/3T9/SoaBP9iJE?=
 =?iso-8859-1?Q?3LxnmPVnQXJe2L9gTyvD5lwljKedCUUnWvWsSmN/UaHihrm//wH0XtzoeI?=
 =?iso-8859-1?Q?NVWo2Sl+umFIec3M4ExPfGHfTr+l296QidaK4hQloiKoc4yaTdjjUFFK3G?=
 =?iso-8859-1?Q?C5uI5VZRyCLBn8QaHIr6r4jJNoX1pU6H7Gt3nFf4L83usrShNoIgHrjmgl?=
 =?iso-8859-1?Q?yTTwBi2mdl+H1pUQU13/2Hyk6OsHTbhYonEm7jvTZ3yRphVzXzC+5aukpP?=
 =?iso-8859-1?Q?hM8fn+I/mZpA9BmgSe36H8zKFVZUtM/0oBRDSNHVEFgprFD2e+VkI4e3mp?=
 =?iso-8859-1?Q?n1sOvAsX8asLbMWSbIl3TKmgn66SJPx0sngRZZa/kWugj2GMISuDOu6fPN?=
 =?iso-8859-1?Q?196Ta5zLjkoIW/vikhFrRuQIVvCGw6aRcFEQN72LEGRXQJvQ2DBLfG7+kE?=
 =?iso-8859-1?Q?wIfBdsioAleBXytRjqCVc7SPTjUkGDcZt1alfK/tkd7KRYOYwEn1okCb3V?=
 =?iso-8859-1?Q?gqzy9A1JjzPK1HWzwpH0ip7nlcYraKin/Y75Zv69zDs+vnNTiXgaS0X+eE?=
 =?iso-8859-1?Q?s9gEfCTwemE2et11NaSr8dGT2bYsJD869h7SjUTT16txaqYehltPY0a7Pi?=
 =?iso-8859-1?Q?a9pgR5UaMiuWqAbycoDsveG8CHcmPqCGsLeZesPtsJ7k/ODJxGgBUjbJIy?=
 =?iso-8859-1?Q?4W9qd7sAYB0CV+/XaOmD7B/2h84kBI6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HjN9Ts2PE+qO03Rg5lpodi6+3NNEatCDdQVDzcQHNQJDhY0Td8wTCG1l8w?=
 =?iso-8859-1?Q?3ir8iS0LgdGVF/z/WTwiwDUYcUAH3vj2Sv3IhuzYWueXlFgpmjF94ziDUI?=
 =?iso-8859-1?Q?WwSt0O+Zkpki0M/PprERdAzLIl8T93O9TSx2+nmX5fB0hqqKrWXk2C53zu?=
 =?iso-8859-1?Q?/LrljJOaUZBkk3U/UkCpSZu2M74c4H9WGA+gxg7x422fna/m5y8OSyXaaa?=
 =?iso-8859-1?Q?FoxYE9qgWOh4oPdpf37Ml5ZDcUIXPj8bK3a4OjaPS0nZ+ienagRLCkWbRg?=
 =?iso-8859-1?Q?Htta7KQ0w0+ajuZyegA8J+2E0VhVNo4cNVfpISwk5126/jsq42AACVb2Cm?=
 =?iso-8859-1?Q?7np5Ui7plrhLopwUmU0EC7FtYlvjfB9i6kPRwB4LWKZdTlEb+WCelQPgRW?=
 =?iso-8859-1?Q?N08KUMBGj8vTF7roYKL7jcD+IoU3P/alVMkstQbeRVa/B1qtHXZA3v6o39?=
 =?iso-8859-1?Q?qXCFPYgPTMdGF56cuyBLvng0ccuZaf3YM9yQlxMw8qIF99rClj5nsqx1vT?=
 =?iso-8859-1?Q?F3dOTbVxbw/vbgMQmnu/kRNyMSRcZtxVlqtj6u4UMUcvKpTAg5o1dMU2nQ?=
 =?iso-8859-1?Q?uc+YEbnB6ioGYyxI/P+lnqEhuGmcframhlXZ785/H0pcS10HAatnE0vYMD?=
 =?iso-8859-1?Q?+LfPFOlFtduTB12Hl5TeeBWm7+lVkNgcSazpoyUZgaSFf46929YNiyMu8e?=
 =?iso-8859-1?Q?ECH7K51CgVUmWQwpuGGVM9pIPoW5gSNg0zAB/v+P/rUc4Hgnfu8IJr37gn?=
 =?iso-8859-1?Q?zcEAErtX+Fw/uv4Mc+9UJJ/dEtMKnn3jdicf9aO/PhZQZRcrknBwzcs/xB?=
 =?iso-8859-1?Q?xBcYdxR68xogy6GlcmlL10xNe/lK6NnxCUa5rdGxJXXEjyreLmcLCGpTUt?=
 =?iso-8859-1?Q?1iYMcdji2ch3Lt3izKyt78yBevMgZKv4jJWvuVaf47TxdNJJk5+QTCrwwp?=
 =?iso-8859-1?Q?o2gpik9rv9guzucbdtimv/SLXi5AzKGmylefmkKtDePOsddgU4Im8/F/w4?=
 =?iso-8859-1?Q?7rwx265E9jS1W4n6UMl2Sql24SwbRb6xVu2Egg5s/jvqMT3s/gXRo0JcNH?=
 =?iso-8859-1?Q?VpguHHkWf6LOWpI94lR56LL6s1d3iLlMLl9VNUnza4HNwsuT0s7HEv+DDn?=
 =?iso-8859-1?Q?hWcZyd9Px50ZBOxyMlP5otIOhq1Ac/Ty9tnGIs/Fb0Ni+3jmMdSzzNuB4o?=
 =?iso-8859-1?Q?oE/frASxIn6/JZwEkiRvu3Thd2mL8n/gFYe4rIHpvuTUaMgTwrUFU+osTU?=
 =?iso-8859-1?Q?1eAI8ALlpZm2vXyORgnH1kw0RCLF062m5k6dWKPgUzL3XsmOFSfz5uPGru?=
 =?iso-8859-1?Q?8i3K8RZU1qQZPUEwAPgMbnCME2diNnh2AvF77OT3vL6bx+sssn8O2hKgOX?=
 =?iso-8859-1?Q?EybHi9VUT/G8aUZigs8Ud6gZ5ohq0eQqce/ZKQb9PmGMyXFMItYaHvepqF?=
 =?iso-8859-1?Q?Fek4KIciG3kiivpktjYfdpwuAhWktL102VjcShPNE/4vrAIB75AnwnLKwS?=
 =?iso-8859-1?Q?fL7kHSFtbO/WBHJ7TqiHKtR5poOkWPkXLj0cZWH5u5Pw34ju1uKWfydvhk?=
 =?iso-8859-1?Q?/uJDRStkd435zq/0BJFoFiazdQ7I1qg8KVOvF4qq8w3VPkdG71Fjcm5G24?=
 =?iso-8859-1?Q?opa3/l/D4vEbX3P7/KJd4pb0k2HSzIQOnvZo31XHIKSRt6WcCxlveo1A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f7004a-37e1-4eb1-9299-08dcc33ce286
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 06:29:04.6800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNkfACkFzMNzwNt6TZqqSF9pn7VxWGhmgPBY7e9XzUK8SHdLRhZYeP5wXUMb0yDCNSa0zMR+Ea2+VhdFjhbBVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
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

On Thu, Aug 22, 2024 at 02:42:44PM +0200, Nirmoy Das wrote:
> Implement GPU clear-on-free for pooled system pages in Xe.
> 
> Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
> ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU clear
> fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
> 
> Clear-on-free is only relevant for pooled pages as driver needs to give
> back those pages. So do clear-on-free only for such BOs and keep doing
> clear-on-alloc for ttm_cached type BOs
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I haven't been following the TTM changes but so don't feel comfortable
giving an RB but the job / dma-fence handling looks correct to me. So
does the placement of the clear job. One nit below.
 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 101 +++++++++++++++++++++++++++++++++----
>  1 file changed, 91 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6ed0e1955215..e7bc74f8ae82 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -283,6 +283,8 @@ struct xe_ttm_tt {
>  	struct device *dev;
>  	struct sg_table sgt;
>  	struct sg_table *sg;
> +	bool sys_clear_on_free;
> +	bool sys_clear_on_alloc;

Nit:

bool sys_clear_on_free :1;
bool sys_clear_on_alloc :1;

Matt

>  };
>  
>  static int xe_tt_map_sg(struct ttm_tt *tt)
> @@ -401,8 +403,23 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  	 * flag. Zeroed pages are only required for ttm_bo_type_device so
>  	 * unwanted data is not leaked to userspace.
>  	 */
> -	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
> -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
> +	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys) {
> +		/*
> +		 * Non-pooled BOs are always clear on alloc when possible.
> +		 * clear-on-free is not needed as there is no pool to give pages back.
> +		 */
> +		if (caching == ttm_cached) {
> +			tt->sys_clear_on_alloc = true;
> +			tt->sys_clear_on_free = false;
> +		} else {
> +		/*
> +		 * For pooled BO, clear-on-alloc is done by the CPU for now and
> +		 * GPU will do clear on free when releasing the BO.
> +		 */
> +			tt->sys_clear_on_alloc = false;
> +			tt->sys_clear_on_free = true;
> +		}
> +	}
>  
>  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>  	if (err) {
> @@ -416,8 +433,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  			      struct ttm_operation_ctx *ctx)
>  {
> +	struct xe_ttm_tt *xe_tt;
>  	int err;
>  
> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>  	/*
>  	 * dma-bufs are not populated with pages, and the dma-
>  	 * addresses are set up when moved to XE_PL_TT.
> @@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  		return 0;
>  
>  	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> +	if (xe_tt->sys_clear_on_alloc)
>  		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>  
>  	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> @@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  
>  static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>  {
> +	struct xe_ttm_tt *xe_tt;
> +
> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +
>  	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>  		return;
>  
>  	xe_tt_unmap_sg(tt);
>  
> +	/* Hint TTM pool that pages are already cleared */
> +	if (xe_tt->sys_clear_on_free)
> +		tt->page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
> +
>  	return ttm_pool_free(&ttm_dev->pool, tt);
>  }
>  
> @@ -664,6 +691,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	struct ttm_resource *old_mem = ttm_bo->resource;
>  	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>  	struct ttm_tt *ttm = ttm_bo->ttm;
> +	struct xe_ttm_tt *xe_tt;
>  	struct xe_migrate *migrate = NULL;
>  	struct dma_fence *fence;
>  	bool move_lacks_source;
> @@ -674,12 +702,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool clear_system_pages;
>  	int ret = 0;
>  
> +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
>  	/*
>  	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
>  	 * moving to system as the bo doesn't have dma_mapping.
>  	 */
>  	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
> +		xe_tt->sys_clear_on_alloc = false;
>  
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
> @@ -703,10 +732,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>  						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>  
> -	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
> +	clear_system_pages = ttm && xe_tt->sys_clear_on_alloc;
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
> -		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
> -		clear_system_pages;
> +		(!ttm && ttm_bo->type == ttm_bo_type_device) || clear_system_pages;
>  
>  	if (new_mem->mem_type == XE_PL_TT) {
>  		ret = xe_tt_map_sg(ttm);
> @@ -1028,10 +1056,47 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>  	return locked;
>  }
>  
> +static struct dma_fence *xe_ttm_bo_clear_on_free(struct ttm_buffer_object *ttm_bo)
> +{
> +	struct xe_bo *bo  = ttm_to_xe_bo(ttm_bo);
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_migrate *migrate;
> +	struct xe_ttm_tt *xe_tt;
> +	struct dma_fence *clear_fence;
> +
> +	/* return early if nothing to clear */
> +	if (!ttm_bo->ttm)
> +		return NULL;
> +
> +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
> +	/* return early if nothing to clear */
> +	if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
> +		return NULL;
> +
> +	if (XE_WARN_ON(!xe_tt->sg))
> +		return NULL;
> +
> +	if (bo->tile)
> +		migrate = bo->tile->migrate;
> +	else
> +		migrate = xe->tiles[0].migrate;
> +
> +	xe_assert(xe, migrate);
> +
> +	clear_fence = xe_migrate_clear(migrate, bo, bo->ttm.resource,
> +				       XE_MIGRATE_CLEAR_FLAG_FULL);
> +	if (IS_ERR(clear_fence))
> +		return NULL;
> +
> +	xe_tt->sys_clear_on_free = false;
> +
> +	return clear_fence;
> +}
> +
>  static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct dma_resv_iter cursor;
> -	struct dma_fence *fence;
> +	struct dma_fence *clear_fence, *fence;
>  	struct dma_fence *replacement = NULL;
>  	struct xe_bo *bo;
>  
> @@ -1041,15 +1106,31 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  	bo = ttm_to_xe_bo(ttm_bo);
>  	xe_assert(xe_bo_device(bo), !(bo->created && kref_read(&ttm_bo->base.refcount)));
>  
> +	clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
> +
>  	/*
>  	 * Corner case where TTM fails to allocate memory and this BOs resv
>  	 * still points the VMs resv
>  	 */
> -	if (ttm_bo->base.resv != &ttm_bo->base._resv)
> +	if (ttm_bo->base.resv != &ttm_bo->base._resv) {
> +		if (clear_fence)
> +			dma_fence_wait(clear_fence, false);
>  		return;
> +	}
>  
> -	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
> +	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
> +		if (clear_fence)
> +			dma_fence_wait(clear_fence, false);
>  		return;
> +	}
> +
> +	if (clear_fence) {
> +		if (dma_resv_reserve_fences(ttm_bo->base.resv, 1))
> +			dma_fence_wait(clear_fence, false);
> +		else
> +			dma_resv_add_fence(ttm_bo->base.resv, clear_fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +	}
>  
>  	/*
>  	 * Scrub the preempt fences if any. The unbind fence is already
> -- 
> 2.42.0
> 
