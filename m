Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A807C79FA3
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 16:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D537410E422;
	Mon,  5 Jan 2026 16:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJldm2xG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814D710E17D
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767630254; x=1799166254;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N/BCgbq/VdqFk3Dn+ql9nGHPOO58UUcdupEMJw/L1kM=;
 b=lJldm2xGSJNVzXYvjDg5sBvHyCdYAaDnMCzAz7Jlug9UOJ5cUIwMWuVf
 /u4mgz87LOCIRzNEGzQLBIL1j8LobqJYDCdZ6Y/AZhQDY1YAvJKUHSFAn
 GUA/0gAtB9hXI8+p2afp+qI6fzvNkDr5gzZIFSgaeR7Odn3o/nNz5BhVx
 ZQcQgw6/n0rss5335PqlqaYxxg8qWdRaeO8H05L22vNXFPDzOJjmx1Cq/
 B5NEjU0++s2fdGNxuBiDMcZkE9scVPPy1is0j7Yld3C5G1Dg5uYWyDMei
 ysGA/YTCNIY7u1fPRR5TeFIu36bAKgMV63l/JNmUFO+6JRGBg1Fqdz+7T g==;
X-CSE-ConnectionGUID: qhXX+MZ5S9yrFTNngpixXg==
X-CSE-MsgGUID: ahmmK9d2QVOTMNSOV2SToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68975587"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="68975587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:24:14 -0800
X-CSE-ConnectionGUID: dqqo35hGSAGSiM3eV21JjQ==
X-CSE-MsgGUID: 950jodD4RCWNDIOulexIvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="206563839"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:24:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:24:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 08:24:13 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:24:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cH0bg6xj0NyhREmhFQ0ncOPh3e90VtNiv89zUWINpoweEFM9fhUfJn4gsXst4eCBbZpj/uMlcP3RFSgWYlvg4bezTf6wpqkdW4SDdWCz9qtzl9suu+Hg99c+h2O34bNPqmh5BfVCTKWyvRSTj/WpzgtSle1fsHzoCVNXty33gn691GGNfezEoZngO/WIBkUnk6eAwlHzeG8/dPzaDSN3zHgwvJr0E8dR8rdH1rKDPaM6XFinZTuTCU+2WAHeD6Co6uWueTFSSZJeIhvwgGslfuVa9khudlyBlGSAUnBcEZuI4YAxkcuki42x0XSqQH8NED+K0dcbKgWJsiRQ1qIeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHpZTG+LdX+/jsC6lPznX6KnV2HwjHOcjX8B4+w0joQ=;
 b=l/WL3lIrBfLvzLAqjwUk00bq1q4KIL8x6hz9JCyAG/xoO/COizFqQn2z/LAJnncNzuAr81GG11p5LTb1Isk+dGkHihgBF09xMF6D8GPFpD6S/pD6c24IGErSGTHzaWp2bNeSO6ljQocgsIZedm3hco7qUZrje7Cx4aZXuYwTGIFNN5fwHPbzfZ+WRdhsHG+SfIQLTcqlJggz5g87ldM/87E/aVNljQ1QteDYxuf6pvVyOW5FMcK74jkd1u02yQ7JcDCUIOXRdO3zx19+Au3Zffjrjl8PiZcFdlsjo7bMrQ+KAqYRqY0+1L+F+RMBWSt+b72VXW4HOHgbcdD6TNM9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:24:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 5 Jan 2026
 16:24:06 +0000
Date: Mon, 5 Jan 2026 08:24:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix page reclaim entry handling for large
 pages
Message-ID: <aVvlpFfDLZC9yleV@lstrano-desk.jf.intel.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
 <20251224233638.1535283-5-brian3.nguyen@intel.com>
 <SA1PR11MB8839BBCE618C31517EFA4A47AAB8A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aVvk39vLp+j9qRR1@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aVvk39vLp+j9qRR1@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e154355-097b-4abf-7664-08de4c76d8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5zVgAaG0QyPiOltrMN3BbIhmeFGX5vcq1MAIIKqAf296sl8jLmXN8TA3LllE?=
 =?us-ascii?Q?Q53sIAGPbJ92SzQZBdm8tDETQ81uGNtSjdsyq3G6y9GpxwVJ8t7EIy5GtQRU?=
 =?us-ascii?Q?wPYgMIJF4hGwgThQSl17K4GjyDOkF6qnN4FwbBOmY++qqrR8q3tEo5bEKVY0?=
 =?us-ascii?Q?sewgCsrIMgN2YQ9QiU4RA/GaORzg9/wd86WztNwGsi3f857PsO2HxNBYvkDu?=
 =?us-ascii?Q?SnOhid11Ju5+1GeOW8TltwxWnfiNXKHxy5QBfrAkWAR1kvcG50DYapf4Nqg4?=
 =?us-ascii?Q?iVF75GF0Ko5nYFZIk3wNUIao2xfEDmmq07IHhm+KbkG2YE8Uka5Gs97cAJPe?=
 =?us-ascii?Q?RjRPEl4SYTDp6+nqAHC5wI9/FJeSc5/lVANkJL6MmkimkrkTfLB6BzHmzj/R?=
 =?us-ascii?Q?xrt4PKWS0RzucCsL0U1ROu62tN0cf8VH5XiOQyexhkXxQ6s0k3mvRmCtb09Q?=
 =?us-ascii?Q?q1DHvk4C1DnwCO8or1zN3+4NRI3FJ0sW/zFEyrmwT6m28OhWPiQG4CfglV/K?=
 =?us-ascii?Q?HP+5d7qR2lgEb3FE3umi/rKKBEpNFGRq8ODiw6CJedfWErGX7Jvyfuj7azmX?=
 =?us-ascii?Q?YeMLM1+EK8eHcLZqEWTBhD0rC6j3Z9fYu8RwsJhmiY7dnA/FiDdVcYABd9/R?=
 =?us-ascii?Q?PR5pBdGAn2CdOOncOuRbPfVu70yZth5E33v+H15quPWOGBUPpBeiqF3RzLeb?=
 =?us-ascii?Q?jQzZW3Fo3iHu+VSCdPpphQYXl/oFnqCtgH9nYtplD4BPNXablcp71B/Siar+?=
 =?us-ascii?Q?O/Q8kL0khzBFH+R75Dpro8wa2K98qZX12jg0gA0UupZz8O5SLJWZpgaO7A0T?=
 =?us-ascii?Q?aOsrLn6ohru/8Mxh28fJ5OJRzYnRdE/4Tkk60hPy3TPWTR+x/gQ1jhmMfxCp?=
 =?us-ascii?Q?TA0RUMaMHXjdo5An/YDi2fddqCocYkKzGYIbRKvyaxkLFbMW1+eNt4cf38oj?=
 =?us-ascii?Q?KIORfE4M5X4RUB1Q+xg91LpbGJLp5nGBEYMViIOnkoztiMjgEt5DkX03/h7s?=
 =?us-ascii?Q?hFDT4j4SNAhSLZQ7dtGW2zvngpcgMnCHiP9GFtUrowjOl0x6OHjHZS2TUC2A?=
 =?us-ascii?Q?XuD9xh882FaJeRPzpoEm4EHF8Ps4gq/M3u32nWUG0+ehIaCE37Z8eLHpAYmh?=
 =?us-ascii?Q?tD27Oz05CFXv8zHkcrXw32IEGftetq9o4SGMbAeFgySZg3A8ghhZpAY5qyk7?=
 =?us-ascii?Q?8cWvdfjRoG94yHTqfnQFOWyR8ZY8lIsrNSKADSY3wMjJgzcIzXjogMFJyGXR?=
 =?us-ascii?Q?YpmXclR/fH98iuKJQCeSEvQQeEAEhyMcIug62YBbCiR09taHEDlPSDf7z16Q?=
 =?us-ascii?Q?6+lL9p3Tlliapo4um4YgcNTkj6VCGLTU0RvVLZX0oa9b8oxv9abkfDeaApPe?=
 =?us-ascii?Q?tSTgyHbLM8kXxELxiXJJ+rrZBR+oGDYVkHKYcYNxSIkQ/t67wuEPo/9VjeaF?=
 =?us-ascii?Q?sZfJ3viholYd5hMhdx1n6R6k2kaokKXC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K7y/fYSn8FIo9zN1dsBcndO4dJg+Z0ZPtXmoLM04IGHkCv1YXrqXLbbUghJu?=
 =?us-ascii?Q?/kBr0yh8lg8xODe59qbINq3qj8+tdRn9u5+ZRg2W7eoQkTXFcirGUg6OGBY6?=
 =?us-ascii?Q?h2TB+SrrW1qMUUexXpKndMJLCRznx6+Rt5GHcX8Zh8N2FDLH5dn5f6nu5jos?=
 =?us-ascii?Q?AR6os24hANJDjXYnjkirLE6HxPYoHorY1iAUEUSsBtagHD6XAijVgaxKnjJ2?=
 =?us-ascii?Q?CWX/oUM35xmxBL/YOq4rd5A1RvNWQkyFx9YDAxIGaRXW/ZFCFIt257p/6i5z?=
 =?us-ascii?Q?CrOAEsOcyPg0mHlC1ORfL7aq7M0WaBmA1M556SwqBOEIslkyY47JZM1eDdnh?=
 =?us-ascii?Q?fRuTPivQ1jtW1LWppCrBoe+3Xyy8kTSopVkbLXT1veNsv1HjVDhaEYk7UDBU?=
 =?us-ascii?Q?KzujDwyVDa/JcIq5DMYv5KuqVGA8Ing1NWglVFEqh8t33RR3OvsgwT0j8Ddm?=
 =?us-ascii?Q?OxBSCBzGkyTFjVuyc/kkmwHNL+QlyYFVdnlNAmA7vM+AZHiDcSpaNUEQOG/W?=
 =?us-ascii?Q?MRSoFICQOcfCdsvFspk6CXxIyKq9fcysCmwSV0+YC9W/FKe+SPOxJTczq8W0?=
 =?us-ascii?Q?DZ1OZWQftB5Bv/85R4wcnAYT9M9wIuG7M3uiNooNZ3EJYJNtcwbGq5vXoJBc?=
 =?us-ascii?Q?aV91UhYNQkV5R7QuR9w74gRlL/fzWynQiJcW5Fx4rolhoTDyveGRBHmKttgI?=
 =?us-ascii?Q?oKbW0GTNt+/oaFKAxxsS/QP7WiXWemSD1boQ+62shCjPp873yjFsvLubAXV/?=
 =?us-ascii?Q?XTnR+Mw3weISCqmXmVf0No2nCI3HE0wu9rASVVjeJkFLk1H2ZQJoRzFFx66K?=
 =?us-ascii?Q?bCVy48ooRzSDtKUUa5Tkmq3OUafbpN4hqLK/Eau1tHk/JR35HwT2Qbpany4K?=
 =?us-ascii?Q?rsrcNJ1MgRqf76TeHzi8J87sLgInTDqVGHy9RwEa1G2bYo9XIl97Nbg6XOhK?=
 =?us-ascii?Q?XQraafvt7ikwbSiNoOruOvV7/zkNZ/He/E0QoGPXHuUns2Khqp7hVLtdW+wb?=
 =?us-ascii?Q?S4NBzbt1WXjvzbOh92cgg2XO0+sgL0uL9bhB8b/WkNqUYB115gcb8SWia/zp?=
 =?us-ascii?Q?6EXOOX769xowRyhUoW8J+i6j4gMw450Eafofh76wJkAYfepK03sQQqcC2oe+?=
 =?us-ascii?Q?AqRw06swGa/LmqxnkUzxiOsN7/uKsdKC8LxhgUILCBqFihNX/QNtUrCzErR5?=
 =?us-ascii?Q?quq5NMR6nCcHwzBM7SsmA/Wi3YQoDsYd7dByZE/3/mgoFjQxq2VvgKkofcWF?=
 =?us-ascii?Q?gwIbHmCyu/BsYZI/su8P+ddm8C39uV8ft6nqHISXLqGgvKZSDBkwon0H5twP?=
 =?us-ascii?Q?sJa22k30jVsbU8KIGEpBxBH9uJrHLG4q30nExHIOA6LKcdpPdaXDC9yC5UaR?=
 =?us-ascii?Q?PjGo2R58pM60wENOP5dxeGmLKZhXE85Q5Bqe8n7+l6Q6Z+Dboh3a8dNmXyso?=
 =?us-ascii?Q?el3CjtTVbBVFYqZbWlwIYKPHHWeHXjUjpGKZlpRf33Q/ex9CDno6hre8lmc/?=
 =?us-ascii?Q?lTLFAZumVyRZVTmuG0InnHRSLz/u6BO+Judl4mEqfiUFB78VAAs6kMo7IBp9?=
 =?us-ascii?Q?ZCdT3VuR0pgykJmI+1Gx3ZJQ/PaRVPbLTO5g4676vjTSrRhjUkySh+DZ1DaD?=
 =?us-ascii?Q?KK9VNkxzV7cqnlWe56KREFIf3+8U2N9GGNwD2SoYRJf9juow44M8HFr088fD?=
 =?us-ascii?Q?eM1IeFo6bV89S41pIfgCescshITQb4jWVtPI2jcSY2gPT+I01m0HEel4gzxA?=
 =?us-ascii?Q?q+pqhUBg2tq++Yn3HPW4TT1UoybGxLY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e154355-097b-4abf-7664-08de4c76d8e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:24:06.3866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDlCOW89qLaBO8qU1ClwKGhBVHO2DJg4wV0gDHXfpmBgVP++WByHG0SEm3h1L94L4oAW0iIk7aPpOOB5IGg9ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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

On Mon, Jan 05, 2026 at 08:20:47AM -0800, Matthew Brost wrote:
> On Fri, Jan 02, 2026 at 11:21:08PM -0700, Nguyen, Brian3 wrote:
> > On Wednesday, December 24, 2025 3:37 PM, Brian Nguyen wrote:
> > > For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB pages and are all considered leaf nodes, so existing check was falsely
> > > adding multiple 64KB pages to PRL.
> > > 
> > > For larger entries such as 2MB PDE, the check for pte->base.children is insufficient since this array is always  defined for page directory,
> > > level 1 and above, so perform a check on the entry itself pointing to the correct page.
> > > 
> > > For unmaps, if the range is properly covered by the page full directory, page walker may finish without walking to the leaf nodes.
> > > 
> > > For example, a 1G range can be fully covered by 512 2MB pages if alignment allows. In this case, the page walker will walk until it
> > > reaches this corresponding directory which can correlate to the 1GB range. Page walker will simply complete its walk and the individual
> > > 2MB PDE leaves won't get accessed.
> > > 
> > > In this case, PRL invalidation is also required, so add a check to see if pt entry cover the entire range since the walker will complete the
> > > walk.
> > > 
> > > One small case is some seemingly racy condition where multiple invalidation on the same PTE will caused the value read to be zeroed
> > > out. In that case, we could just skip the entry since it only occurs if a previous page walks invalidates it.
> > > 
> > > Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c | 44 ++++++++++++++++++++++++++------------
> > >  1 file changed, 30 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c index 6cd78bb2b652..a79734079ef3 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
> > >  	return false;
> > >  }
> > > 
> > > -/* Huge 2MB leaf lives directly in a level-1 table and has no children */ -static bool is_2m_pte(struct xe_pt *pte) -{
> > > -	return pte->level == 1 && !pte->base.children;
> > > -}
> > > -
> > >  /* page_size = 2^(reclamation_size + XE_PTE_SHIFT) */
> > >  #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> > >  ({									\
> > > @@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_tile *tile,
> > >  				  u64 pte, struct xe_pt *xe_child)
> > >  {
> > >  	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> > > -	u64 phys_page = (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> > > +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> > > +	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
> > >  	int num_entries = prl->num_entries;
> > >  	u32 reclamation_size;
> > > 
> > > @@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe_tile *tile,
> > >  	 */
> > >  	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
> > >  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
> > > +		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
> > >  	} else if (xe_child->level == 0) {
> > >  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
> > > -	} else if (is_2m_pte(xe_child)) {
> > > +		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
> > > +	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
> > >  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
> > > +		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
> > >  	} else {
> > >  		xe_page_reclaim_list_invalidate(prl);
> > >  		vm_dbg(&tile_to_xe(tile)->drm,
> > > @@ -1648,20 +1646,33 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> > >  	struct xe_pt_stage_unbind_walk *xe_walk =
> > >  		container_of(walk, typeof(*xe_walk), base);
> > >  	struct xe_device *xe = tile_to_xe(xe_walk->tile);
> > > +	pgoff_t first = xe_pt_offset(addr, xe_child->level, walk);
> > > 
> > >  	XE_WARN_ON(!*child);
> > >  	XE_WARN_ON(!level);
> > >  	/* Check for leaf node */
> > >  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> > > -	    !xe_child->base.children) {
> > > +	    (!xe_child->base.children || !xe_child->base.children[first])) {
> > >  		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > > -		pgoff_t first = xe_pt_offset(addr, 0, walk);
> > > -		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> > > +		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
> > > 
> > >  		for (pgoff_t i = 0; i < count; i++) {
> > >  			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> > >  			int ret;
> > > 
> > > +			/* Skip already cleared PTE from past unbinds */
> > > +			if (!pte)
> > > +				continue;
> > 
> > Jumped to a conclusion a bit quick on this.
> > On a second review of this specific case, this pte read of 0x0 is not a cleared PTE but an unwritten value to pte.
> > It looks like there is a race condition here when xe_migrate_update_pgtables() does the gpu job instead of the cpu write,
> > So, the pte value read here is an unwritten pte value still awaiting the write from bind time issued job.
> > 
> 
> Yes, I think there are 2 possible race conditions:
> 
>  - Another thread is issues a TLB invalidation, I believe this would be
>    possible if unbinding a userptr and MMU notifier races.
>  - The original bind has dependecies which are unmet so the GPU job for
>    the bind has yet to be executed and an unbind is pipelined behind
>    that job.
> 
> IMO both are really academic cases (i.e., very unlikely to occur in real
> workloads, IGTs likely can hit these cases though). So maybe if a empty
> PTE is found, we abort the PRL walk and fall back to a full cache
> invalidation?
> 
> > I'm working on a better handling here that will most likely have to wait on the fence of the gpu job to be signalled
> > rather than just skipping the value (?)
> 
> See above, I think since this likely race, we don't over engineer this
> and just fall back to a full cache invalidation.
> 

Typo - s/race/rare

Matt

> Matt
> 
> > 
> > Brian
> > 
> > > +
> > > +			/* Ensure it is a defined page */
> > > +			xe_tile_assert(xe_walk->tile,
> > > +				       xe_child->level == 0 ||
> > > +				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > > +
> > > +			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
> > > +			if (pte & XE_PTE_PS64)
> > > +				i += 15; /* Skip other 15 consecutive 4K pages in the 64K page */
> > > +
> > >  			/* Account for NULL terminated entry on end (-1) */
> > >  			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
> > >  				ret = generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > > @@ -1679,9 +1690,14 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> > >  		}
> > >  	}
> > > 
> > > -	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
> > > -	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
> > > -	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> > > +	/*
> > > +	 * If aborting page walk early or page walk finishes,
> > > +	 * invalidate PRL since PTE may be dropped from this abort
> > > +	 */
> > > +	if ((xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) ||
> > > +	     xe_pt_covers(addr, next, xe_child->level, &xe_walk->base)) &&
> > > +	    xe_walk->prl && level > 1 && (xe_child->base.children &&
> > > +	    xe_child->base.children[first]) && xe_child->num_live != 0) {
> > >  		xe_page_reclaim_list_invalidate(xe_walk->prl);
> > >  		vm_dbg(&xe->drm,
> > >  		       "PRL invalidate: kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> > > --
> > > 2.52.0
> > 
