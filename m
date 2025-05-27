Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCEBC5B543
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 22:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517B410E0C7;
	Tue, 27 May 2025 22:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8dIDOjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152FD89C49
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748385116; x=1779921116;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BzO4ISPhGnzskvbMMNj5+2iRoMcNgYzampqb4Ujoftw=;
 b=n8dIDOjNTJtSzwmhE6HpScH0oZVpICIk0N7hTlrkb2UYFCYp4Ml5qTgp
 OYylYXqWHb4eu7LbwCRQiSe+dmhuXxDyi+FqJ8MNM95kl1Rs9Qu9ADEJs
 8CmTxRkGFkykm6HlZ9SvKrZuGsj8ZX0vlLFoewuSScAAJwun0z0ZFeBXz
 ICDSxRkEiOy5l9b6k81D8BbiFgE4mvt6nIEovbL3Z0gtW1ie/Wq/AyqeB
 S8um96QT7+8Tnj3PUYPDc3uFVrc0RNG2QVG082CwZ0yvj1KF3BkPc+mxC
 vcCPBMKtMYXxG5uxjb+CuTYuFTkqwdLUwi74wev7+lrhlWsK0/rs03CZN g==;
X-CSE-ConnectionGUID: ORAz70cLRqukisHCJHQ/ew==
X-CSE-MsgGUID: gjX99p56Q5aQyhjKntZgcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38018480"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="38018480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 15:31:52 -0700
X-CSE-ConnectionGUID: FkeOGeh1QVmYCUGmSensfg==
X-CSE-MsgGUID: DL70khtpRFeUkXuqX91wlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="180220702"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 15:31:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 15:31:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 15:31:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 15:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCSkR07YQmpCWI63q8qJY2sPT8cmgd6fRtaLPgFfDaC8z1NP9yGEktaQ/a6Tw9Ckonrt61vgTA4WLjSUhStxaAsa2eKl46cKoHXMDbxKtvD3mWisdHkzPuWCZM0aymQnAhxHu0VU9t0GhBY8sHe1AkU5FNdi+UDGKo0VmiV3WT0oOY+jKiXwQTANQWG9iX61AW82/3l5YyrF/DXokfwqp+2ftEzW15S3YGvpyHvgEEJzFqwNkNLSGo5CutzRQ+WWLrG5C55BAffvsiupeqkuCYtJN4TQhnofR8h84OkT1XlkMMJKOvj5FlS3Se/RSWG2obxh85AN9XGGUSHA9Ho9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZWVt6DdqQqd4iZNUE2ZDXsMSVPHOLo2tg/xHs4Mkxw=;
 b=TxQwQr7cKCH81vglML9oiTp0E5zepaXZRsLQoOaEMRSXEFZZq+e92p79gq+IgoGQonCnOsvNM3AnBoFQc3tzIvy8lhQG8WrniZaXElY0XHyGu8JOa+W7WHgUmIhACRGZZA8qmcjbSBBQ96vG2jZ1/r5q/JAcTPm+wIH/daceFz9SGL1nSFqXrskhZa+9zMMI6InIDvwUatfai9Q0x1ysWYlLj1rOSbfDB0SL9KjgYNHQ3ptNzO/ITWiyj0NDfLHT4UIsKACQJjWL6AB5zixo3fTzIxfqr97anYyeLdzkgZ/oqZ+WpJdR8sazh6oZvPVrybnu88BgTnSoGY/h2IBI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 22:31:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 22:31:20 +0000
Date: Tue, 27 May 2025 15:32:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Souza,
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/bo: optimise CCS case for WB pages
Message-ID: <aDY9k0xVx20aJWAE@lstrano-desk.jf.intel.com>
References: <20250516153810.223530-2-matthew.auld@intel.com>
 <20250516191203.GN5080@mdroper-desk1.amr.corp.intel.com>
 <4c095ae6-f449-469a-9472-87002695572d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c095ae6-f449-469a-9472-87002695572d@intel.com>
X-ClientProxiedBy: MW4PR04CA0326.namprd04.prod.outlook.com
 (2603:10b6:303:82::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: d35b1dcd-b459-4521-0306-08dd9d6e3459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CLtmV7XkxjVllMGA1EuJ4gNXook3XHt7MgvBbdM/6pycV4ZSa4WTekoyRq?=
 =?iso-8859-1?Q?zIdZ1eu0mXrMz7aLCZCcOHMDG+Vhsgjetp81O38UN1bjIRXZ/t7FANM30O?=
 =?iso-8859-1?Q?Nmjx/qJXi1tEJc0UWcNo8d8Va25Mu28fP5Q4bsMLjEF+kx4giNTf0dSnAu?=
 =?iso-8859-1?Q?y8CvxojcV8McMnyVTE+ioXgoG1dpx9eAjyndALozCMf6uC8wzGx/eQC8Gc?=
 =?iso-8859-1?Q?wBlUKfLJj3/9c7nbcpbRko6uQUBxFaHJHXeAvqo0XI6kGwujzFurdyb1vd?=
 =?iso-8859-1?Q?4VmkT6eJ+GTiljYASlxG1YSFL2dNKW/8t+Tgqo/7hT9s+UHtBThfCH9ne3?=
 =?iso-8859-1?Q?DvgHP6PsaB7H2f0wE56KIuAEt991yJcDuOfhek0SfUphwxOHeucBFDLJ8T?=
 =?iso-8859-1?Q?34ipY/grhOBp7LXXVUc7BW8M25s67vdFdHXtwUt+2+iXsgu3eKAc2F3x2n?=
 =?iso-8859-1?Q?hLOrGd2VXaDaM6pSf7FCCrq+0BvQ5y7GY0FbNO42AZBnY2j54qZMIs1uXX?=
 =?iso-8859-1?Q?CmLPgUMYPnrDAAt0rD3DFXFJbnHt9Y1ZzfxI1/kDDIS4crQT7DoxPXWLUL?=
 =?iso-8859-1?Q?3i/RU/TkLRcji0lfil74e9I2qAlm1TXPRke11nBGIkmnR7KTNx5mxlmHgZ?=
 =?iso-8859-1?Q?YOzYJ8KGzzbL7+vE79J9bZ6NwaG7bXWJ29dY3Rq4UznSympZQraMUzGwp1?=
 =?iso-8859-1?Q?PCtB/01xpLwHVlgpw8VdIticD6sV/85bsUBS1KgGHLpsy9TL9OCo7WwBvs?=
 =?iso-8859-1?Q?lQGhlOyeR74yam024nTXw6VNfTkNMW+t0f5ukNlzeVi6wyDZ9emQ4Yq8E6?=
 =?iso-8859-1?Q?OdesQQC8aUR3eIwBThHCoCayMS0RYDT3DZ4gvjHlIb+nddvW+vzJIpXox2?=
 =?iso-8859-1?Q?omBp7x6pTNdMyqaoEgErlqvZxcscPTAAwLb3ZiKEAT3hOiupb9o4zcGNlb?=
 =?iso-8859-1?Q?tm6df+X0N7TlrbWSiiD7OzK5ymhRVMUQEb2DGPQVgqibbF6UF1qJm8matF?=
 =?iso-8859-1?Q?RbTATGvrhJhyPugoscqWi6f8LYqJNqmcmOeD6shPM4OSWbOVykf8QFjpDT?=
 =?iso-8859-1?Q?2oTcj5yP9zPNsEqaRm0fo/Q1lq7VFzkiu4sblR391tS5YMV3VC8vuoVo5V?=
 =?iso-8859-1?Q?ynzVaiPA3O4D5q4rgc4xllEuUFsHiRP28fInzNRN9vI6KhPRBBORkw0HPS?=
 =?iso-8859-1?Q?fCyqdaZiiKfjjRcvBbRg3Yf7nM6G63Gd8VVex65RgXsaTI0gWg5820THnp?=
 =?iso-8859-1?Q?NsBWRci91LTLRwJsBzLIamPAM5Kn2xNCMKQF40Le02ajaB7TMyUY59s+xw?=
 =?iso-8859-1?Q?NiAtHFzZpyNSOR82XFU3dp9lpt55f5Zhqs9Wo4ZLViVulrpCqiRwXKKMxC?=
 =?iso-8859-1?Q?7DDLNrhKS37BepFyVL8GwjHesrAiQ4n++GXKQhbmHYsEQsn1X3SFXOjQi3?=
 =?iso-8859-1?Q?sgNJdgHWcYui54bqLAtWF+OAAcrfhl99//DQPfMyWgcL+jRj1wbgacAmNu?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ik627mMk4AAl7Q+1vHZkW4Ab8uPBBdjUixaXNtCuKevToOSIVUueFAHG2I?=
 =?iso-8859-1?Q?6Zso7T0l9s2LekMyPkDSmRcJ7A8Bs2AG/XToUsx2+YAaL7Gar/DS//DFvK?=
 =?iso-8859-1?Q?yR8MaGBzuoUzWQOBrJcGOjvdF8hdDLMb2XUQ509YT6/wsDVrjeYR6PVvqb?=
 =?iso-8859-1?Q?ny46RzXchFha8RX5XRY5TUOfZzIEZ2Z6JVIWUIz/pWw21Ol9cbFSbETA6i?=
 =?iso-8859-1?Q?Fv0Fro+IcJ1TjnerDUkjiQtUWiea7+1rb1kobdbEMHijPgCDnnr6pMBlbo?=
 =?iso-8859-1?Q?aGah7oY1+BGss01VacZ7BLbNBxXJzh4DbZQkWDktR0LJPSVmOsV1Du8IQm?=
 =?iso-8859-1?Q?Gpz7u1J6lM7yimLkNliCN8WGlz/AHb+FoDEoyO/Mc5g343whNFQ6RdUl7G?=
 =?iso-8859-1?Q?de0sxCAILL9x6UOD1+PV6A0XUh7GMpgBYyUXukkv+dtv5XkUjvorMAeYnj?=
 =?iso-8859-1?Q?U9V+bsaxROEloaJ0KGpEe5hmScM7/me+eeUuUdpv5xIncfx41zhdHxlCIW?=
 =?iso-8859-1?Q?Mua/srq3N0YW32aUMQ0uxZvtM7OmQTg3hKH76cvwHIqRmhEP2Q2xttAPey?=
 =?iso-8859-1?Q?EgTRi+syMyPxmG6N6ptG488ORlxTpKzJfyk9MhI5Zl0ipjqUSHqGhs5u3l?=
 =?iso-8859-1?Q?k1viZo0fzcxNFerQFLNx4poFeDmQnA/BHbA9U5aGpFMXlZ02l+jp11ei9S?=
 =?iso-8859-1?Q?jU/XgyJ/kz5GUc05qaMi5IZ6jDAIayx/s1INOuJ30jofIWlR123SXsHHNC?=
 =?iso-8859-1?Q?DbFQ6Wfdn2KqFcVAZY/hoK5GQUNXFMqg1WMcTwgK8WJSXck34fcnJ82L2K?=
 =?iso-8859-1?Q?EZBtFzSItnyrDnUrGHkuMW++lfo5Cf1t2ELBTY6qwA/k42ZKuKpp7KBy/Z?=
 =?iso-8859-1?Q?tYUqfxj+pKtflVcC5ivevyuDOLtd46bpu4aoI8f2by7twBkU067gdRuLRt?=
 =?iso-8859-1?Q?9SwxYHxKKqGXLBElVGXCbBwVo8yeUuqmIwkAFKUqWsQgnuKROlA4BGq6oR?=
 =?iso-8859-1?Q?necjraBP/AFL6HMsiFpxx7RFQinfOysLXQxnYYfE9kYhEZXJ2/AY1wqnL+?=
 =?iso-8859-1?Q?1xl2VsOd9mjWcdUSkZW0ctWZdxL8BQcYztdTFBUTWOaVBW0x8n4Y2p6MOi?=
 =?iso-8859-1?Q?2N61VuvAUU0svuegfiqj6aPFcpa98f91HaiRreTp7sUukD49dNE4e3IjJ9?=
 =?iso-8859-1?Q?J+ik20Z4HDSz006oeYvhpbak+/WSlGD8Ovf8X6zcTxWRCDTML1OnSaJ8c2?=
 =?iso-8859-1?Q?jLXcCKbCsO+skZ875qeZ9cmilGtKChFEQU3iKpiUR3Le+gPYm2NABwvqxn?=
 =?iso-8859-1?Q?JkaWCdf9jEq90oSN0H0Q+ed4ux5mzTg8BJuQQbH1jDk9VxGpd6uJ9dcLm9?=
 =?iso-8859-1?Q?XwXCMly/vWICA5LIC8ztsUqpcgCkOjDpgzVZusfpKdd/b/H2ggHOK+XG6S?=
 =?iso-8859-1?Q?CjN9JTSjokBB8yEWjY4XXAh7ysii+SguhgbSzy3rOH0giAqVYyttjcGvmw?=
 =?iso-8859-1?Q?a2GQDbC+kr8clZjv6y0XM/9G1/uISivyYl6g5sc09x8O6YBz9lhnVmp8p5?=
 =?iso-8859-1?Q?NGisITTOF+P07IYuOGtOvpo+wPqspmcmz2M3uVpN/6h9OLVg3kJKiz2QxO?=
 =?iso-8859-1?Q?0z7O9HzZRsIZKC/u8hjfIgwdzNV8fQwlQxZfMmk4HiEZvHJJSg60Hlww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d35b1dcd-b459-4521-0306-08dd9d6e3459
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 22:31:20.9035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMuIFW0/VJ+eGh5IQMBWaRRbC6mSwYgfC9Z3HqDP3M+nv5v/kLN1e+KmyJ5I5PX92pbr0cIfif19EgDZTIRbNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
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

On Mon, May 19, 2025 at 10:58:42AM +0100, Matthew Auld wrote:
> On 16/05/2025 20:12, Matt Roper wrote:
> > On Fri, May 16, 2025 at 04:38:11PM +0100, Matthew Auld wrote:
> > > Dealing with CCS state is significant on LNL+, where we end up clearing
> > > the compression state on every page alloc using the blitter for user
> > > buffers, including also saving and restoring it when moving between
> > > domains, plus we need to alloc extra pages to hold the raw CCS state for
> > > the save step.
> > > 
> > > However all compression PAT modes, on platforms like LNL, also require
> > > coh_none, meaning that only WC memory can use compression in the first
> > 
> > On PTL/Xe3 there's a new PAT entry 16 that has CCS compression + 1-way
> > coherency (according to bspec page 71582).  It looks like we don't have
> > that in the driver yet today, but we probably need to add it since
> > userspace is expected to be able to use it.
> 
> Right, for that we are also missing userptr handling, if we can't just
> reject it (it will also currently throw a build error IIRC), and also need
> to figure out what to do with external imported dma-buf, I assume we just
> reject at bind time? Using compression with external dma-buf I assume is not
> going to work.
> 
> Jose had the idea of maybe adding a bo_create ioctl flag to opt of using
> compression, which we could use a hint for when to apply this optimisation
> more generally. Also would benefit SRIOV VF case where we can skip needing
> to deal with potential CCS state on PTL.
> 

This seems worth while to do.

Matt

> > 
> > 
> > Matt
> > 
> > > place. With this we can be sneaky and completely ignore CCS for WB
> > > buffers, which is likely the common case anyway. This would then skip
> > > all blitter moves/clears between sys <-> tt and then also means we can
> > > drop the extra CCS pages.
> > > 
> > > This should be safe since there is no way to interact with the
> > > compression state (potentially uncleared) without using a PAT enabled
> > > index (which is rejected at bind), including if trying to be malicious
> > > and copy the raw CCS state from userpace, which should give back all
> > > zeroes if the src surface (indirect) is lacking compressed PAT index.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c  | 8 ++++++++
> > >   drivers/gpu/drm/xe/xe_pat.c | 3 ++-
> > >   2 files changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index d99d91fe8aa9..3fafdcb8d95b 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -2982,6 +2982,14 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
> > >   	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
> > >   		return false;
> > > +	/*
> > > +	 * Compression implies coh_none, therefore we know for sure that WB
> > > +	 * memory can't currently use compression, which is likely one of the
> > > +	 * common cases.
> > > +	 */
> > > +	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
> > > +		return false;
> > > +
> > >   	return true;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > > index 30fdbdb9341e..38a6a49c1b2a 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -103,7 +103,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
> > >    *
> > >    * Note: There is an implicit assumption in the driver that compression and
> > >    * coh_1way+ are mutually exclusive. If this is ever not true then userptr
> > > - * and imported dma-buf from external device will have uncleared ccs state.
> > > + * and imported dma-buf from external device will have uncleared ccs state. See
> > > + * also xe_bo_needs_ccs_pages().
> > >    */
> > >   #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
> > >   	{ \
> > > -- 
> > > 2.49.0
> > > 
> > 
> 
