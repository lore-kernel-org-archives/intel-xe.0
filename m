Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550BFC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 14:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1641210E16B;
	Mon, 28 Jul 2025 14:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSfG5MpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C0910E16B
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753711859; x=1785247859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UdFzE7EAdcWP84baw86Cpg7eR08I+10mI31mEZziMdo=;
 b=NSfG5MpVvrkSdwpPTf3+u2pKO96AfZb2fE+U8f31d2iwjJLA9+eaWxTi
 8KVlHS0idweG4oTwgwxfwXecqDevlyThH2uy3BJ7jmnPONj1vezsJSkyj
 Sn0zizk82anP+ViNEJIc+TcD/kdscEEWAl/D+fj/JwF0V+4Vbj/gYq3cO
 iP/q+tojx2nFFjOnp6JUIIJKZDm2EomVtLukxHJEEy4WFmeFWwgqHCa7I
 tgcc4EZE0enYyCjmazY3B8YT46a0c7X+DZBa/kJu13UKeadRmG8/EMGkn
 y1A2W/SH1R1kueJ9kxOp1Zc15iBDUS7h/58x0IQfgrIb5mQvRybu6cWTY Q==;
X-CSE-ConnectionGUID: mLnrZwvvRaKcMGBXW9CO+A==
X-CSE-MsgGUID: D/Rd+fStSBihfyw9Zc9j9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56108931"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56108931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 07:10:59 -0700
X-CSE-ConnectionGUID: rAp1SiCMSFKInuLgAWhJiA==
X-CSE-MsgGUID: 114lUGdKTxiyOujAEUS6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162139092"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 07:10:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 07:10:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 07:10:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 07:10:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXcWPCPvn+q+0nSH/J61iS/A5mvOCGm4SKgBm88kpOaQo2nqOtwlsBGZa2GxMl7hZPt7lZMGCoZaO5uuuZbRbuWQdDa2pkKB0EYk39drjbi3Xqiyd56KZ7/Oebz0SR3wiMHynx4I71B3syaBbjVVp2lJJYCS/OWOJsRdOAv6uwZzpAJ4CgUgUbtE1sr5OrE/IVSgdZUpzPYk8ZHYY3u3rUTpxB92EDkh6+F6zl8INC9S/RWecN4LZJwLtb+9SZ9BuU5X/bu5OqmKdEn638JV/H2e/84lBG357NzVL2jiOO1pXMDgnG7SjGc8ogw+O4BVL4/gDS9JjZwJfnR6VFgAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11PkR9iRNRtr5TSNd6cMOZDiR7xdG+MdBdr+w4gLsg4=;
 b=OdK7PMLBTjbPTOLVgJiUVechAHqhlXEYhKx5MV4Hf+gpUljLabV/23hBdEdHTGcqpmEWPpIJQ0R1vP1yDYd74OShfKYhxy8XncnG17nGvZoOwqrbqzl+23ivei4+Ob+GFJ9P2fTKOi3nQHoJf8RA7690VMms2quId36+1on7QWM7I4000EIVFGQHalUrmYpMA1jCwReEqH+fzkbzUDjQwTK8w3TomLwu+FsDbglYMd3EOijVFnJHU6BLslMOtJ+Cr58HM019iCoYLiqd1p1rroBVr82s/E3SFJwn8fyDqRtWnDW5UNR+7R5uh1bM5Gg4gQpTn2lasa8bwp83oUuRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 14:10:15 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8964.026; Mon, 28 Jul 2025
 14:10:15 +0000
Date: Mon, 28 Jul 2025 16:10:10 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm/xe/svm: Migrate folios when possible
Message-ID: <aIeEwt6Kg4lPQCTz@fdugast-desk>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-7-francois.dugast@intel.com>
 <aIQPyTnoaPEIA6zI@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIQPyTnoaPEIA6zI@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0059.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee4e0ac-a190-4a22-1e1c-08ddcde07947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GllVU1vYBbnhHEzR7Y1UeZKoqvE661wT5OnSgImMvCsIumbOgqXuYnHwArGS?=
 =?us-ascii?Q?4gsK8EFIUaP3KbsPEHQaU+MKRf0SkG0sUwnia+21cyI3qFmkxEz2IUFSSeR3?=
 =?us-ascii?Q?LYzZlQlGAPk+6j70HLAK81e/T9ZTIsRfh132m1aeDal5Tp+jIs0B2w7HS6Ur?=
 =?us-ascii?Q?1mPQyQyjle8D8n/nzbj+hpKE9HgAzK05XOQAJLdSbCme+5lBZ78WRiCZok93?=
 =?us-ascii?Q?otYNUEO51poH9HarA6doCZopdEOBz48UrTKXDYqhaNqDD9ZKicYcoBZEFC/2?=
 =?us-ascii?Q?+VKvqNrI/c9h1rv8iX6bwADycxmn5ZNZtswRnA3KxbQ6l23OkdGXWMbA99ag?=
 =?us-ascii?Q?SI9MvirI7CUC2MFHXxwuzB/HwRPl1ZWWUSLXs2gKyy7/LYXFOhRyR448g2Q3?=
 =?us-ascii?Q?C4qDyMnSpjJYpqmz+sBWKkuKwSYLw6pxh1GhyumQbigINtmk4tcm+WYGIqg7?=
 =?us-ascii?Q?AokeKGCKdlfAxl6n0HWlA1takVZR7XY3hhrwe77dJNkuyvpuu15W1A7u+WXf?=
 =?us-ascii?Q?WmMkOLys8+DOkXcDHR8PrmbGb/FqfUTgSZaI9GMovurXsPLe/erUWfLUsZcv?=
 =?us-ascii?Q?NWsVLnDZOSAE533EU4AM5IAdK46/A9iszSzBLDhaH+28shOQy803QBEX/TrU?=
 =?us-ascii?Q?SpMbynzXR7NeNxPKmiZZVoi+qXh8T2X/v7RbTI6RVNZYaGFW52uCUAenZzak?=
 =?us-ascii?Q?LNUHB3GGnKlKUoL+8Y1+JFRb7vk2ohNF3ZVLaYDg2wqZ5ahapU7GS2KjK5Nk?=
 =?us-ascii?Q?7QRAJ0g0fhNLrFr8P8ASkHqtNccrrIWzUuERu+MS6yjx3fkHPkiOHdr+tjzL?=
 =?us-ascii?Q?SpOy7urfR9LPeU9aaysh0ig9cTuzo+CalMeWMQsLj3Q1tBhh/Smhbn611jFD?=
 =?us-ascii?Q?IxmXW+bc5lY21z2wgFKYaW1a3Nh0fevz8P2EqyQ0ww7MVjJC97/ShFvE+6B8?=
 =?us-ascii?Q?JZ7Qt55heOcKH48BV8kHekahZ6fnQAXD/I8PZt9/NdumzfQyLTjWnmhYTssR?=
 =?us-ascii?Q?xvookaKo2mXODt9AdUkBfzBQDEXWVjQbcnmTztqbhQzWBAgdHMGJzRAwK3Dw?=
 =?us-ascii?Q?P1w2XNqYlBdocYLLbM33Hx5rJADXa9ezkmk0fnVevACcskpUGv0cL6GlZFkl?=
 =?us-ascii?Q?FxDb+/QjjT1unEfoInZU6scDeQjO/lYjnhCRtS8PnGkoLvLFEqI73e5+3XeL?=
 =?us-ascii?Q?uIkVjbOHDtVUr4LwaaNlWdE82jWlMP7DN2gmKtl4JjrBgvuWojUOfJjmNjY5?=
 =?us-ascii?Q?Ltj/xNARWfL1uvWCuCV3dGBume+NWn/08AEE9QYZ/HlkZF+jyn4PWwmKaytn?=
 =?us-ascii?Q?YAazNjYpAocXFzqgg5Bi6xIhDKgqocXbVMRSREYlxYcxrQYMk9Av7dBdT+2G?=
 =?us-ascii?Q?17mGK4jHx3LUhzyenrLwGlyLiFqe4CuPTten8FuTXWJM454gECmfo2CQl++T?=
 =?us-ascii?Q?c1XDeSCm/1M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9HRQzSvJWc03V3umf/RxEfs90ZgnWWesEJb8TblMPlR3Zn6lY9pCwrQGbN/1?=
 =?us-ascii?Q?0qjSblzG8Esc/RzX2rqqXYYNSkdMzuxP0IrH9TDnLLkptmTFjYR2nPtYHj8U?=
 =?us-ascii?Q?Qr7Uqy7eZRz26MUtiH5M+2JmUoYJmeMNhm4W8CcUJHnLcUFkMWBM3TEOsJQw?=
 =?us-ascii?Q?atc4BLUzW0BzF7t+qs0xs7YF4ULjpMcA2rU/eE6hunX1vCx9jhGioo/Z6LKn?=
 =?us-ascii?Q?ZfEFw535OKDCf4yhPAjRWsZs37n+LAAsVkvBTdc+63DHFqPWjg+WuXisr4sz?=
 =?us-ascii?Q?mnW+BY2YmNbGZghS8i9dGqfRYUDYyEOLMbNW3Fo4sYAnroUt2jwJsF7gx3zV?=
 =?us-ascii?Q?GwHPkPnxqRs52dYttHNfJzXNFKZg4KhxyF/DMDl5q5fSf9xNAhRXy47IevJM?=
 =?us-ascii?Q?IsW8NmviuTlvuQ6p+/EzTvGKEJ16QuqErJt5cPhgHP010bYb57jmLO5eltOb?=
 =?us-ascii?Q?7jM/RyUw3Kk/dbOXqqPnFSTTva4qyDpe53ONfYfn5HkXG0du5MORBcssOTCy?=
 =?us-ascii?Q?vh4ZMopXnPbFWx8BYqmz6zfV9MRKmmNOkobDxo2pFA05Zk/PYdO95v+E+wwX?=
 =?us-ascii?Q?UpqLEnNR8kLNx3cRPQ0X1nktyvazt30l6ZnBZ7t/ZF87ibrzSL+iuPgltvWL?=
 =?us-ascii?Q?mxxhFy5L4hkKz+UIBH8oskGIZreYBAKNxcH2Hye5oauJx3fqHxbfjDXMf0zW?=
 =?us-ascii?Q?zk11C8HS4KR8eCj3M2vt2zyv4rJVSo2XFTQI0UtGl0q26wC7SzJ9CyBUlvma?=
 =?us-ascii?Q?bING/formLT67/fUINBs5A1OgNSxcjQjsbTbuYvcnHOdKGnAe032RMsdwghR?=
 =?us-ascii?Q?Oj4ElbfGsXPAXGuKeIGefGQnupjljAe1CNHtihGrx0GTlKpU18SM5LRHQESy?=
 =?us-ascii?Q?6WF5Onp6l8YcNIHoHbvwJo2vRb3fjctZKIARTschLvrA1XsseaiFIo7GT80k?=
 =?us-ascii?Q?Ga1u7gwaOFnGrQhmQthMraf+sTFDhvKe3dcIG4eU/jielt4c1DxgD2IFzZMO?=
 =?us-ascii?Q?IyEJekMpdwciYbl3RECOxkvv3Jz7lusfHKS+E9oSWAlT4GXOs7I4Kauml+48?=
 =?us-ascii?Q?DCQoV6Sl4JvuVXUfweXlEbmckgr1T6hNsbRiV5Uy3sdDiJmIU7rAksaFNYls?=
 =?us-ascii?Q?M2OsLdSGGvqO0v5u0fekRL0znnJHLadpbyaCTPz1xfM4ANjHJ2pvgnhNyXSk?=
 =?us-ascii?Q?vhKaYgHXxToHD+kUSYtbz8gXSEMRaoKiYGklVlu3W9wp8/VK5RpNMTrZl6kq?=
 =?us-ascii?Q?aWeAT4ndBODYC385vE/ZJeAzMSN55K7HtZt/qGVo832Txo6uK/JVXKrBwmsZ?=
 =?us-ascii?Q?BAvJLRo24YeaRxjkKSZhMDbhtPH4LWfOwd67zevIeg8Dmyb6+Wvj+KsMKPbR?=
 =?us-ascii?Q?sbiibEKvuvT1j5ugoamKNE3x2PuBViL+2vSAK9Fu35t2Msw0ZoS5peWZ7XW0?=
 =?us-ascii?Q?tXgaws47JRSwpM2X+CcxDiVLqeoP+AYvMWo4yFAuzPbdNZiY89rmNXxiZD7w?=
 =?us-ascii?Q?HUy9EKFYRrCs7F4eTB7su/nFlbo+0cmMdleVGGrjCjuA5JGiMQTeZUsTzxFa?=
 =?us-ascii?Q?RZUxR1LGtHpHKWQjWszK3d2Ec1nuW4jCR3DIXOKDoiz0z5fYvBKNeq1jv91w?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee4e0ac-a190-4a22-1e1c-08ddcde07947
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 14:10:15.0343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR3yIVNEFIUINNDY9bSurDIPPoEH/77hFco7cx/HnPBXB1gbf2ijWB/p2WBTcByZxleG5vmIbVJnU2QtPYXHf80jqH9gtz6VgvxHplxwGmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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

On Fri, Jul 25, 2025 at 04:14:17PM -0700, Matthew Brost wrote:
> On Fri, Jul 25, 2025 at 05:39:30PM +0200, Francois Dugast wrote:
> > The DMA mapping can now correspond to a folio (order > 0), so move the
> > iterator by the number of pages in the folio in order to migrate all
> > pages at once. This will improve efficiency compared to migrating pages
> > one by one.
> > 
> > For this to work, the BOs must be contiguous in memory.
> > 
> 
> I'd mention since SVM BOs are a max of 2M and it is very unlikely
> forcing to continuous has any negative affects (e.g., extra eviction),
> it greatly simplifies the code, and 2M contiguous memory will enable 2M
> device pages which is huge perf win.

Sure, will add.

> 
> We might need a small adjustment to populate_devmem_pfn to communicate
> contigous memory was found to drm_pagemap too as our driver can easily
> allocate contiguous memory, but we shouldn't assume other drivers can
> do so. This can be done in follow up which adds the 2M device page
> support.

Do I understand correctly: change populate_devmem_pfn() to provide the
information to the caller in drm_pagemap whether the allocated memory
is contiguous or not, so that it can let the driver know when calling
copy_to_devmem(). This way a fallback can be used in the driver when
the memory is not contiguous (not implemented below because this seems
not necessary in Xe).

> 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c  | 2 ++
> >  drivers/gpu/drm/xe/xe_svm.c | 5 +++++
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index ffca1cea5585..59994a978a8c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -200,6 +200,8 @@ static bool force_contiguous(u32 bo_flags)
> >  	else if (bo_flags & XE_BO_FLAG_PINNED &&
> >  		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
> >  		return true; /* needs vmap */
> > +	else if (bo_flags & XE_BO_FLAG_CPU_ADDR_MIRROR)
> > +		return true;
> >  
> >  	/*
> >  	 * For eviction / restore on suspend / resume objects pinned in VRAM
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 1d097e76aabc..2759db5f7407 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -382,6 +382,11 @@ static int xe_svm_copy(struct page **pages,
> >  				pos = i;
> >  			}
> >  
> > +			if (pagemap_addr[i].order) {
> > +				i += NR_PAGES(pagemap_addr[i].order);
> 
> I think this needs to be NR_PAGES(pagemap_addr[i].order) - 1, right?

Yes correct because i is already incremented by 1 at this point.

> 
> > +				last = (i + 1) == npages;
> 
> Then set the chunk here too?
> 
> > +			}
> > +
> >  			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
> 
> I think the match can be dropped actually and just assume it is true if
> we are allocating continuous memory now.

True, let me try this.

Francois

> 
> Matt
> 
> >  		}
> >  
> > -- 
> > 2.43.0
> > 
