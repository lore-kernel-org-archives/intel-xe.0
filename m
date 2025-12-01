Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E9D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9BC10E155;
	Mon,  1 Dec 2025 17:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnLWx429";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ED710E155
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764610167; x=1796146167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b3LcvhzHCWQD6mzeM1rwTQ1FCGdmk8XoRMzM8zVf76M=;
 b=QnLWx429Q+TgXn4KJwWTC4o5bGbcEfnITi2WPGnWLUmCyTQTrPns5QIM
 NVBxXpyqVzbBdAtdD+bkO02JnezSdMS23Cs1/ZTFz28I/ftgxYqlVZyaL
 CKWcZm+LjXC29c6VY1Iy2N8QsoSH6Ik1myrPOebGJiYj8OYvjENNIapjl
 7AwF76Aq1NtIWfnwkrzmqokPkyXa982sAsifHsTUFP3ZTnjRjNrfXASdy
 ZEwrmTqn+6NWuhn1HZq9qsYHe7jdX84QlqKKNk/1A0a5xVqPIk23rSN0z
 RxhKR2XJmOrMlbYN7QhI+jrZdY3fBh3vAQbTV5oR3WYGcy3NPDVkONgtt g==;
X-CSE-ConnectionGUID: xSP9ePvOQKGbeWhGhj4eAw==
X-CSE-MsgGUID: n8hIyhXwRJet+Rr6Lh47jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70172395"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70172395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:29:26 -0800
X-CSE-ConnectionGUID: sYVAlwdRQFuWoNhdKDaICQ==
X-CSE-MsgGUID: GkYz1GwTTdOD9XKU3oIjAA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:29:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:29:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:29:24 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:29:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0tCgX9l6Pm6NX8QQLSsIJUkehEo6AcCE6o/jDHEFB/8AKO7iQv1Nz+WRJnGOc3gmASS8GkPyRg3R97xu09LfcuuYpRB7TnUWk8sDcR9MfD/hZrurGK1VWdIhOwygBBmUCIO9keVI9Mq2DvjZCCPI94HuO1gLQkq+CrXQWfHLMbH4Ynj50PdYxi7f6vrGMmWQKQZnGopZCLtomrflGtQ4/Podqj9EkOhMOOhChCQSdPiBKNAZ+ftYN0KFIsSo005J5ymQqaPTlM1QCiHnDJ7TG+wm+hQfZBzbEjXw3SgDrdc77ch4nAnZqnlbZtup03PUf0ElL9NLzIeEZOCMK+eYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2tlnbwdeMHXpqfl49V6qxGtOUFmrmxS4T59Ru8+HeY=;
 b=flh7htjmgT+fCScDG4RraMefC6JFNsU3cVDL7AF6MmqBeylO4vrj1aVk7NP2Xl3SX1hMFz0Gmz2UhCIgaq033L24BorxlscuwkuuIhjzvNIBZePY8UzuACaKL9BR9OF1MWe0xpmuWJMMbJO9GXfnHlzILSakdaB27/efCUyAJGeRuj7OjXK/GEj25kN8OBlil1p+Jtq3vOGJSHYbnussluivNVGvo0p5IeRmS3kCi9RtB0NqeXCV84RX4wBkzVMe2XrphaCpQdZDwLit4jyV9xxDpaj3AJLSCjxT4pfAqPYnePgkoU0TUH2xgVclGJqMxlgfMPy0m4FYnq8JQP6hKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7186.namprd11.prod.outlook.com (2603:10b6:208:442::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:29:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:29:21 +0000
Date: Mon, 1 Dec 2025 09:29:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 4/4] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aS3QbhHy5ePqSftm@lstrano-desk.jf.intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
 <20251030122357.128825-5-raag.jadav@intel.com>
 <aQo8Hsb068v0jQNf@lstrano-desk.jf.intel.com>
 <aQsStsHeai4X05JI@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQsStsHeai4X05JI@black.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:303:b7::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: d134a955-9757-4cc7-b5a2-08de30ff29c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9TuehGL7G9jEg0fn8cEMfGprizPAVS60u4Rq+Awcn3L2V/O0FRfWlO0Ojrhm?=
 =?us-ascii?Q?H9DquaQLaVAuVUXVtSh7IrzfIVNBOHs5km/yriVfe7xngfiAbxxURFkinxuC?=
 =?us-ascii?Q?L7TbSsBPVsKIIkA/K6Z+f6RfF0NxZaKrb+yftgVDLA1BoGcoAQ3rE2rEyXFY?=
 =?us-ascii?Q?uyMMD6IKoPIypbCahd7hyEOIZQijxh6kskDxka3ITxfZiNrOgd6kmVS5ly7Z?=
 =?us-ascii?Q?8BaA+vW18AP5RM0nwoyJmm0UnVw/GJL0RhSo5vFEsjYnEjP0feBhj/VTNMuH?=
 =?us-ascii?Q?+wu1Jq/pSV25HYGfIpBI8myDptQ79W2V2qooeHxYR/gvXuWEtkT+BnRgGHkM?=
 =?us-ascii?Q?ngD3uy7XrIwomCOuRtMhN9th2E7zYCHHrrFrFsO7o95RhYEM5hGtFXu8YVZC?=
 =?us-ascii?Q?+ULpbE3HQbQOnF3WgwVEPGHeDqDYvQBa3F3FCMN157DPYfsWvKChWwNpkt96?=
 =?us-ascii?Q?PxKCk6QLVP60UX72fqCS2BYGFqTP4BFj3q88OVzKceBMdBNTPRMgtCzrKHDJ?=
 =?us-ascii?Q?tNaqjL6L3LYuBpeTb1KpGYTkpDUfEHQ6ICqr3wmwH7fsh8ON6SXmSGvD54eG?=
 =?us-ascii?Q?3juREj/2VMyjMdE72bP/JQ7e5iHTpsKAaiC2UfehTopz4dlWQ8r19Jk1hJEM?=
 =?us-ascii?Q?p71WpsgeuLebMNpSE57n+ARoKhoPWM/dl/Ozba19GEuy3E8P/D9cCHPWGvlA?=
 =?us-ascii?Q?BUU5oiI5nmu7jO0dehh7/RAilZfvutDpWeuX5W+hfZzMzv3R+2sXAt0Z/+mU?=
 =?us-ascii?Q?P9IG19u4eFZxaD3+zZKlDlbMVVwtrgd10c1tJjX2+YXI3Ey1upy/XPBu7x7z?=
 =?us-ascii?Q?c+EDW4YYXrv+xISfUNAvJlGgCnD5IsS5pgkzoG/J+mhE10G6u7F8oHLpBrbx?=
 =?us-ascii?Q?8GyzXkn65aWVTXjxHm/47vTaR7kY/X8z+56L+Ru3+UmEEskNrUFLHTt5o0cM?=
 =?us-ascii?Q?YMfdzCa1iJh38KZ8mgBkn5QBMMDq60nNGEaUJbVD9297wqnvic+5KJUWLpbm?=
 =?us-ascii?Q?3nWLrJYM+0MhziET/9E2iPr9bb6jLO44qrKI3Bm7u7FWhMXIznBXSBK/+9UZ?=
 =?us-ascii?Q?Bv5A/EPmlgUHdFnEH+YlZuhzEx9AvaU+fDe1QyBGtdTisweMmJy++CDu03W0?=
 =?us-ascii?Q?4OLqk80TRFWRhxs1NlQlzljV078s0h9xmSg/WSRbZM4T98fNrn1PZ5ZaaRRN?=
 =?us-ascii?Q?+kvMARvps2jIgxioawusyeyGnEi4UkGaizC2+F0I0jNntWuYEW6x1R/tjmNO?=
 =?us-ascii?Q?pTvKjn8Q+gMyUHafxVozuCTVhKq2zrgL4H4qvsmpM5LZf0Qk8/QHjFo0zEL6?=
 =?us-ascii?Q?2cG8/l6RvUaZjfBI3V/t9HiZOlD+tZhHhzyg/8FnDX8GCwMucupCIQrMwySk?=
 =?us-ascii?Q?O9aNsZR5RJnSSwvu4yrVMwHua5A46NCEyAc3PO8ukGD8iZd13YV2UsCvnnsq?=
 =?us-ascii?Q?0J+Y9anHerEDmMEBGpWwGCjX3qP/lo90?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G34lozDPmHc13KDnwrjZdG/U82I8wwARYShzlbgdW/WqbyPy6fsAe5xg9Mr6?=
 =?us-ascii?Q?dcxomiaRxwFxW+rqdKxBI6Hl2SyfeaXr0X6dpWt08OcvZKeNVO3XVLrnMYiN?=
 =?us-ascii?Q?DaXhXAbzGUJKYm+4KM8AslXKgx4/bbctkZBfFKfp1dUkOCjZVEZojYvlRlZ3?=
 =?us-ascii?Q?9WkSeQzhYNfu2z3VZogNzeyeMYrmk98Pft2fQH1X1J6VBE0qmA9asnhbqg/R?=
 =?us-ascii?Q?rrRtbd4LZcNBVB2tUi2PNFa72NsFEguDUpn4zfCf3aFoyVle1V9vpC0md1C1?=
 =?us-ascii?Q?KgEyzGXEf0siJ0yElWky0u/aeXGmAbd5SSi2VtyC7tCNJYTUF31EYfP4Xfkb?=
 =?us-ascii?Q?XhBod+LCP5egGTERn7yjm6sbrVcuKXIy2MyfvVEBK7hCe95wPpw1c2He0HRo?=
 =?us-ascii?Q?dR/DjIE8ZXr+PIJBxUGooWG8fWeGKjHYtfok2RCdLy2ojBjeHtXZtGZytlV5?=
 =?us-ascii?Q?6OVI8kQg3+qxT6jMHpCS5giKrkNjBBU+kzj/5dmyujc/ZVrk+LHTZ48CZ9f8?=
 =?us-ascii?Q?vgtDdOzO6KueRxYN1tYvcr3S9e4Wy6rG+UdKGS8OknLIk1pYRvRqrQce1AbW?=
 =?us-ascii?Q?kKLGKVK64Kzca6SUh2YLfwrbg8LzLgHbn4bD5HM111HOWWHhIzdbmQtEWAyu?=
 =?us-ascii?Q?ALUJ2TjefGWdWxp1HFpQy4NGAl1+vJ03LRG/9MW4ND4GvAD2wLydqULySJqX?=
 =?us-ascii?Q?hanNTXXJyq4zepcpdpd2vfkWUM1/bLld6+K7DVH/kQL1J9h8x3kQKfC9uO3s?=
 =?us-ascii?Q?KxW2ZFuv/Ra+GzWOc9fUPyqOaiCdWCQOFk6O/mMBOinn+mSxyCHldzdGIUIg?=
 =?us-ascii?Q?UmhVbLwTtbwiET0SxDybX5lSzpBj7614Tw30yuRdxmQfU0CmxQMDj/IeeNFD?=
 =?us-ascii?Q?IlXq5mPl51FcTFoB4AODXsNy8CZASNgUlVpbGQfDcY/MToz690QqptprRIZ+?=
 =?us-ascii?Q?BWTU8823oqRXpD1meh5ZgFaLx4m6hgxx9x7M9hVh+J8NLkT0hlsyRbHLpHyd?=
 =?us-ascii?Q?lD1dYsHr+aAbgBhS7eomZobFUEKzSw/NxkOSnE61r7FEft8LpDGNsdssrx8T?=
 =?us-ascii?Q?yrRwVJmdgNdxK1fY5E7OnyDwhrJGjAvBXAvxuPq2xjNDB2wD/X69xuLtXiFO?=
 =?us-ascii?Q?clutYyb0dJtCrHh+r4U47yKkU/ifz5LweYSNzonU8CwW2hWJB2sEVht01Axd?=
 =?us-ascii?Q?/dztjN+nYXvgBvh6/JQEOqcur5+lvsCaAVUcPAji7mvYSJ2AENQd6cmkGhBC?=
 =?us-ascii?Q?jOHU3wR3yDXHPMBBRZjpfg6vDi06auvUVFXep4eDCQP/kDvtHoSrd4KVTPm7?=
 =?us-ascii?Q?eALswgLtYNE10Bq+Q68bSmr62d0JfeMzFsDCM3Q7VG6DKX5Jz6XQ5a1s1GNK?=
 =?us-ascii?Q?2HUzjZwIAvuSFLEarXBdLV3RTX8TS6Oy3AYZ4upRKBADhLTaERxBlizMkOnh?=
 =?us-ascii?Q?69x7xCL1tqEGxNFIYFsglk6YGja0itVcE75yZqzyE2LAi7aHd7pUYK1LVeMT?=
 =?us-ascii?Q?W3GE9rFhPUW6jrlzDM/1vrc/hQ6SZfTCnGhKs/t1YbQwtD+wdqionxP0TRSj?=
 =?us-ascii?Q?6dsulNeol3XYMNsjlUH92JjMQqhXDdbObV7jLNeNovF8XLLSEtoo8RLeSdFe?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d134a955-9757-4cc7-b5a2-08de30ff29c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:29:21.0657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN6Q7RhGDnXGxlA+k2UP52zeJr1W2PihIxY2ezDxgafII8NLs4sEUoD5E0VVyZWjInrqiw2xAgP3FtJlrsISuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7186
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

On Wed, Nov 05, 2025 at 10:02:46AM +0100, Raag Jadav wrote:
> On Tue, Nov 04, 2025 at 09:47:10AM -0800, Matthew Brost wrote:
> > On Thu, Oct 30, 2025 at 05:53:57PM +0530, Raag Jadav wrote:
> > > If power state is retained between suspend/resume cycle, we don't need
> > > to perform full GT re-initialization. Introduce runtime helpers for GT
> > > which greatly reduce suspend/resume delay.
> > > 
> > > v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
> > >     Use runtime naming for guc helpers (Daniele)
> > > v3: Drop redundant logging, add kernel doc (Michal)
> > >     Use runtime naming for ct helpers (Michal)
> > > v4: Fix tags (Rodrigo)
> > > v5: Include host_l2_vram workaround (Daniele)
> > >     Reuse xe_guc_submit_enable/disable() helpers (Daniele)
> > > 
> > > Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_gt.h     |  2 ++
> > >  drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
> > >  drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
> > >  drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
> > >  9 files changed, 162 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 89808b33d0a8..0c300f8dd588 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -1008,6 +1008,66 @@ int xe_gt_resume(struct xe_gt *gt)
> > >  	return err;
> > >  }
> > >  
> > > +/**
> > > + * xe_gt_runtime_suspend() - GT runtime suspend
> > > + * @gt: the GT object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_gt_runtime_suspend(struct xe_gt *gt)
> > > +{
> > > +	unsigned int fw_ref;
> > > +	int err = -ETIMEDOUT;
> > > +
> > > +	xe_gt_dbg(gt, "runtime suspending\n");
> > > +
> > > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> > > +		goto err_force_wake;
> > > +
> > > +	xe_uc_runtime_suspend(&gt->uc);
> > > +	xe_gt_disable_host_l2_vram(gt);
> > > +
> > > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > +	xe_gt_dbg(gt, "runtime suspended\n");
> > > +
> > > +	return 0;
> > > +
> > > +err_force_wake:
> > > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * xe_gt_runtime_resume() - GT runtime resume
> > > + * @gt: the GT object
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_gt_runtime_resume(struct xe_gt *gt)
> > > +{
> > > +	unsigned int fw_ref;
> > > +	int err = -ETIMEDOUT;
> > > +
> > > +	xe_gt_dbg(gt, "runtime resuming\n");
> > > +
> > > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> > > +		goto err_force_wake;
> > > +
> > > +	xe_gt_enable_host_l2_vram(gt);
> > > +	xe_uc_runtime_resume(&gt->uc);
> > > +
> > > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > +	xe_gt_dbg(gt, "runtime resumed\n");
> > > +
> > > +	return 0;
> > > +
> > > +err_force_wake:
> > > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > +	return err;
> > > +}
> > > +
> > >  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> > >  				     enum xe_engine_class class,
> > >  				     u16 instance, bool logical)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 9d710049da45..94969ddd9d88 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -58,6 +58,8 @@ int xe_gt_suspend(struct xe_gt *gt);
> > >  void xe_gt_shutdown(struct xe_gt *gt);
> > >  int xe_gt_resume(struct xe_gt *gt);
> > >  void xe_gt_reset_async(struct xe_gt *gt);
> > > +int xe_gt_runtime_resume(struct xe_gt *gt);
> > > +int xe_gt_runtime_suspend(struct xe_gt *gt);
> > >  void xe_gt_sanitize(struct xe_gt *gt);
> > >  int xe_gt_sanitize_freq(struct xe_gt *gt);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index ecc3e091b89e..ee35f1d8c21b 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -1607,6 +1607,40 @@ int xe_guc_start(struct xe_guc *guc)
> > >  	return xe_guc_submit_start(guc);
> > >  }
> > >  
> > > +/**
> > > + * xe_guc_runtime_suspend() - GuC runtime suspend
> > > + * @guc: The GuC object
> > > + *
> > > + * Stop further runs of submission tasks on given GuC and runtime suspend
> > > + * GuC CT.
> > > + */
> > > +void xe_guc_runtime_suspend(struct xe_guc *guc)
> > > +{
> > > +	xe_guc_submit_pause(guc);
> > > +	xe_guc_submit_disable(guc);
> > > +	xe_guc_ct_runtime_suspend(&guc->ct);
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_runtime_resume() - GuC runtime resume
> > > + * @guc: The GuC object
> > > + *
> > > + * Runtime resume GuC CT and allow further runs of submission tasks on
> > > + * given GuC.
> > > + */
> > > +void xe_guc_runtime_resume(struct xe_guc *guc)
> > > +{
> > > +	/*
> > > +	 * Runtime PM flows are not applicable for VFs, so it's safe to
> > > +	 * directly enable IRQ.
> > > +	 */
> > > +	guc_enable_irq(guc);
> > > +
> > > +	xe_guc_ct_runtime_resume(&guc->ct);
> > > +	xe_guc_submit_enable(guc);
> > > +	xe_guc_submit_unpause(guc);
> > > +}
> > > +
> > >  void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> > >  {
> > >  	struct xe_gt *gt = guc_to_gt(guc);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > index e2d4c5f44ae3..fdb08658d05a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
> > >  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > >  int xe_guc_enable_communication(struct xe_guc *guc);
> > >  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> > > +void xe_guc_runtime_suspend(struct xe_guc *guc);
> > > +void xe_guc_runtime_resume(struct xe_guc *guc);
> > >  int xe_guc_suspend(struct xe_guc *guc);
> > >  void xe_guc_notify(struct xe_guc *guc);
> > >  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index e68953ef3a00..a7b8d16d4041 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
> > >  	stop_g2h_handler(ct);
> > >  }
> > >  
> > > +/**
> > > + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> > > + * @ct: the &xe_guc_ct
> > > + *
> > > + * Set GuC CT to disabled state.
> > > + */
> > > +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> > > +{
> > > +	/*
> > > +	 * Since we're already in runtime suspend path, we shouldn't have pending
> > > +	 * messages. But if there happen to be any, we'd probably want them to be
> > > +	 * thrown as errors for further investigation.
> > > +	 */
> > 
> > What would also be helpful here is an assert the G2H credits are in a
> > fully idle state too. We can do this in follow up if this has already
> > merged.
> 
> Sorry, by credits do you mean to check g2h_outstanding?
> IIUC guc_ct_change_state() already does it for us, or did I miss something?
> 

I was suggesting we assert 'ct->ctbs.g2h.info.space' is equal the
initial value we set it to in guc_ct_ctb_g2h_init.

Matt 

> Raag
> 
> > > +	xe_guc_ct_disable(ct);
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> > > + * @ct: the &xe_guc_ct
> > > + *
> > > + * Restart GuC CT and set it to enabled state.
> > > + */
> > > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> > > +{
> > > +	xe_guc_ct_restart(ct);
> > > +}
> > > +
> > >  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> > >  {
> > >  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index ca1ce2b3c354..5599939f8fe1 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> > >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > >  int xe_guc_ct_restart(struct xe_guc_ct *ct);
> > >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> > > +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> > >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> > >  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
> > >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 7b089e6fb63f..56e1351776c0 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > >  	}
> > >  
> > >  	for_each_gt(gt, xe, id) {
> > > -		err = xe_gt_suspend(gt);
> > > +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
> > >  		if (err)
> > >  			goto out_resume;
> > >  	}
> > > @@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >  
> > >  	xe_rpm_lockmap_acquire(xe);
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > -		xe_gt_idle_disable_c6(gt);
> > > -
> > >  	if (xe->d3cold.allowed) {
> > > +		for_each_gt(gt, xe, id)
> > > +			xe_gt_idle_disable_c6(gt);
> > > +
> > >  		err = xe_pcode_ready(xe, true);
> > >  		if (err)
> > >  			goto out;
> > > @@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >  	xe_irq_resume(xe);
> > >  
> > >  	for_each_gt(gt, xe, id)
> > > -		xe_gt_resume(gt);
> > > +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > >  
> > >  	xe_display_pm_runtime_resume(xe);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index 465bda355443..6a58b33248f5 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
> > >  	return xe_guc_suspend(&uc->guc);
> > >  }
> > >  
> > > +/**
> > > + * xe_uc_runtime_suspend() - UC runtime suspend
> > > + * @uc: the UC object
> > > + *
> > > + * Runtime suspend all UCs.
> > > + */
> > > +void xe_uc_runtime_suspend(struct xe_uc *uc)
> > > +{
> > > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > > +		return;
> > > +
> > > +	xe_guc_runtime_suspend(&uc->guc);
> > > +}
> > > +
> > > +/**
> > > + * xe_uc_runtime_resume() - UC runtime resume
> > > + * @uc: the UC object
> > > + *
> > > + * Runtime resume all UCs.
> > > + */
> > > +void xe_uc_runtime_resume(struct xe_uc *uc)
> > > +{
> > > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > > +		return;
> > > +
> > > +	xe_guc_runtime_resume(&uc->guc);
> > > +}
> > > +
> > >  /**
> > >   * xe_uc_declare_wedged() - Declare UC wedged
> > >   * @uc: the UC object
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > > index 21c9306098cf..5398da1a8097 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.h
> > > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > > @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> > >  int xe_uc_load_hw(struct xe_uc *uc);
> > >  void xe_uc_gucrc_disable(struct xe_uc *uc);
> > >  int xe_uc_reset_prepare(struct xe_uc *uc);
> > > +void xe_uc_runtime_resume(struct xe_uc *uc);
> > > +void xe_uc_runtime_suspend(struct xe_uc *uc);
> > >  void xe_uc_stop_prepare(struct xe_uc *uc);
> > >  void xe_uc_stop(struct xe_uc *uc);
> > >  int xe_uc_start(struct xe_uc *uc);
> > > -- 
> > > 2.34.1
> > > 
