Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D25C021B3
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 21:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C7B10E9E6;
	Thu, 20 Feb 2025 21:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhiT14jD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1B10E9E6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 21:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740087140; x=1771623140;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nMdzXZiYUWJl8+xAsI7c9Yl/NyscZ0enp4nY/tNU2MY=;
 b=WhiT14jDaarkWOIh8YHZVLg1H4ehXhhLp8eSWqhJT0evtHxRvcx7dF4q
 w3maKGWhlCS5k6tol2SvlQxZ7i++mAmc/D+FXETAbXBSWoL/GYBCu2WYu
 t20QTx80N4wotfeFXqEbMoHJ5SY6BT7/rtLdBi0LDi0T/KgdWfzfLwDTG
 mc5jF2SGwSe3V2V4LWO2/3R115y+6vbtSqnRpNM2qkC7d7FvVlS66gQiF
 GrAHm9RbV/5iQ5qhFGNO2B7G1PVFpKTWwF/OMa2mn5lawVg5pAXUkZkY2
 xg8/sVLQVFjowJVkTkBiX2UluVq4AKy+i8GUnx0kGY22xh3JPWZLBTWW5 g==;
X-CSE-ConnectionGUID: JJgHWNnoS3KrvLzScvflGw==
X-CSE-MsgGUID: 3k344SWcTyaZvp+wxWc+lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58300041"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="58300041"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:32:19 -0800
X-CSE-ConnectionGUID: mM8nI6qYTUmPiOemLBipSw==
X-CSE-MsgGUID: rUbQfxAxS5mB8UdG01aeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115709808"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:32:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 13:32:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 13:32:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 13:32:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjSjjlLC9QIZWQce8anlhdvc1pNjsXA7oKIri0mOWutSVxJ/tiz31RHrYP2H8f/GblHnYtRR7wGq93dET9Lm+jIlUx3kR7E3MM05ALz6zJUnPs8gagme/DZJ0RuqiKGLQob8qNZkePzN8lDSv+PDlUjJEeEK4A9YFf8h1YDou6U4NZQCnc9nZHQOra7TrxTrY+82N4Ei5I0jNLYBQP3AipMnvQJv2XcR4FMNluBilFqJZywcQp3tgJl13G5/Msg5zVJqGs63tc4u55rnBlbt9nSws4Tv/+7uNgCKKJE8UztjHyvAVDXkjMAGTYBgjgldR+cM8pmOpcbT7yWvgTzgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/GC96fYuqEJUafVFYlwPbDZw+IB+wvNaWKFzW3H6Os=;
 b=yIo7HVJU1osv/Mcjyd1jd83L+Qr0tYYy5GJH4BPf71CUo/NASTuesdSgeBubbdeYfLhtGJ61vge2JCbPjzIkQzgNDGy9SQstk8y95us0sEgz7XKduIfrndrqSxa/0LsOVLauLKSdAyS4Tg3tWc1bxjulm4E7rS8nOP4qs71pd35xNyB0dCjLhtbdO0PCYSsv6AcLj70a7PJx8uqrbrVU4LM/HGdvxWX0gRu1w1FVmNJ/eZjQa9uALPxh5LsQRwBViAfAa2EE9oFaeY2oHRbGHtBNyDy56Lm5mgfUCXGJb7nUR9BdSm/8y568TLEBtYzixGs+iuLpdgWieIz7q2TiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 21:31:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 21:31:44 +0000
Date: Thu, 20 Feb 2025 13:31:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Convert pre-GMDID IPs to struct xe_ip
Message-ID: <20250220213142.GY4460@mdroper-desk1.amr.corp.intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
 <20250220172532.66613-5-gustavo.sousa@intel.com>
 <20250220211050.GX4460@mdroper-desk1.amr.corp.intel.com>
 <174008662922.100150.5235954042052397357@intel.com>
 <174008671442.100150.15924162322909542604@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174008671442.100150.15924162322909542604@intel.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 5868ebf3-c19c-4f7e-ac06-08dd51f5f8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a9clcrV9ItVw4BIFh+NHS+dGRhWP/9gTyyrNuItmNNzaOAhTZXB7DLxkOLJI?=
 =?us-ascii?Q?j2ZZfSmUsbtlmDqs+nPcGz1rCzZ3lwivFtxUewVktz/TulwdG0RElNzjzs67?=
 =?us-ascii?Q?yEiHy4pKUi7sk5hrTxT0ZSGrNOYCe/xfOB3VW4Ub544O0UKqkJTf2PoDSVIw?=
 =?us-ascii?Q?kJz13kwwggyaXdARRc0YpR+9mmFEu/ViuIqLOHwFeR2Br6z/9xZscGJDR9tH?=
 =?us-ascii?Q?0vhvLNPSp0cc1aXtIWazmbdjoIQKdl1k3WfsUy7ofN0NN/MsAzC8osDzvLhO?=
 =?us-ascii?Q?vbwGMVE7c6qT9dXsjoXDOiO+uZMJhDz9KFhZFV6wO9VcVeWhRBKmw7ZCHtLv?=
 =?us-ascii?Q?aqqr0dQEjNwwDCMAiSvUez5x7sZEuA+PT92TmZwdInmy+nV17ShNq0NlSiKj?=
 =?us-ascii?Q?Kj3aTM5xOOj8ZwBmuaFqomlq9ddg3IAvb42dvTT8InZvdcFdOn8wQ8mPgp6C?=
 =?us-ascii?Q?G5MJpB2TsXsen821WUlhVMcmRo61H/ZtsCh5s5nak2eZ7F+xMGeHzWzeoJSq?=
 =?us-ascii?Q?OwRueWTgfeOMvotx6JVjbKJQ5ti6VReM5g75aN8FS+FYtCOmz1CyzgovGmVT?=
 =?us-ascii?Q?YtZngP2wux1xNVh8m8KDs1q8iswVdrzQE0dpWaJ2QXT/FayR/5xibgYH1q9m?=
 =?us-ascii?Q?w2WLhnz3XD6DAUufhROWl/cFPeIb9yZmNqzMcO4xiK25DyvIyLILp4a3ktoB?=
 =?us-ascii?Q?umBQxB4YEk/feoH4EOX89iXgZ82rIEcbhHPrRtOKT4ME1AljwtEikVampsos?=
 =?us-ascii?Q?gCp4WJHdVXUcAcjGK5BI4GSqCaJB/jhkExSNPoBFstA+ugKOklFG0b83eRog?=
 =?us-ascii?Q?ygfGPZqohu+OtixXfh4FMBmrq87Hng0WvCJJcLShMMcb4Oki13RHnZ4PRUkq?=
 =?us-ascii?Q?JV1WSyxSPyZOTLsKu6gSOaErr8n0RXNuOsfgZS0jAv3pzXW5RUYZ/yLmsV+M?=
 =?us-ascii?Q?CuW9VScdkOJoO6PieT+eYPz2SVYPeoHj29CX9rMFLFcNQO0Ytzt8QSztasPs?=
 =?us-ascii?Q?pJ75YwnfMAgk/j+2uYI/UUV86zWxiVtBBmKJzO9Qu5ic465xzs5oAe4TP7p3?=
 =?us-ascii?Q?mXN1NaYLSiufj9QqzoSsBhdrH7x1a7YjmPqxNvrBCazfDx+2/xALbuSAG1GH?=
 =?us-ascii?Q?5m0X1Ef3oarWdPr86MTdmtmGOpjzRoGH78TpFyi34PprJYr2Q4zbgz5/XKxa?=
 =?us-ascii?Q?Bdqwc9mMGzPa/9G0Ce2wmtQqr1Eox2X3PZX13AurR4PLn+Jrp7LzmxKvWvqb?=
 =?us-ascii?Q?Kk1Gdm6QVTGYQ5/u4kzb7X6a7jWbdMbJ42rmieVYG5ORjMFnxlEzeZQRc8G8?=
 =?us-ascii?Q?vUwJItWsuQlfqbNkcnnTKl4xKuuHP1R9/nPfAJDdUOPX85HXoAPu+73qKm0d?=
 =?us-ascii?Q?U9kjHGHm88mtQSTTcRMgpDff87tU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HinKF9LTGf0d0H2t4kHdBYr95UPMbUigUN6vqSR4t9uKWfTh2ScmwIAwH/Ml?=
 =?us-ascii?Q?FloZMlTsUKgc/cW03QWCHr4a49T4vP7wBmUpcue+gpt+R4gCrqZEviFfPZNJ?=
 =?us-ascii?Q?jtZUmxhyK8d9yNfl9pTQPKVaPLGjUp5IeXrRceYLIYTvZ1fJCprQ13py0ePg?=
 =?us-ascii?Q?1G1Xsy99irFOyQy4qPvWRhdUVrrhefsNfvH0Qh+0t8U1j+DOsRTahQDFo8BP?=
 =?us-ascii?Q?SOmRQU6D92BfxiisSKJ2y6ZKA92uBk1Cd01ZvOuOs/sNH9BvtOMd+H7/5GeY?=
 =?us-ascii?Q?EcqhNb95ykfHS88g4s4HgrnsKgq9HiH76XoKUSApdL1zRRnuqTeXKUFu2Yrd?=
 =?us-ascii?Q?+TU+W+OpLafJsI8zOiegO39jb22JkYz01mmFw+j5tU5DKhP/yF/axaNszc69?=
 =?us-ascii?Q?E6P0Mp3SreiFdyXbYRIrDuf71j0UIkJgmCLWmRbpJia8YhDE20WLciZDlBK/?=
 =?us-ascii?Q?p4KFBfN7TMguIhqLxhKUOuhSFh+gJQMcj3phlHUdUKrF8NcoisDFyd2rzpAb?=
 =?us-ascii?Q?BuzxhYqQfveqew4zk/8d+4xns7E0t3G+BaZN4rlRw/Sm9p+ZidPo97eZ8gAg?=
 =?us-ascii?Q?J6EMSMmEtoWIsL8KCarfAb7/oDHph2oTW2WUgxZuwYHoKpliF2JMO4ztaZmh?=
 =?us-ascii?Q?CkJ2NICSnpKNCR2FbXGBWLbGLVASvqtuTs8qSpDFoUMeNVo9gkkqMFYGqQnD?=
 =?us-ascii?Q?dL9IeXjeHa5MP2vdGJxxOXLCZXgbrE7OVK5eHeuFhcAS14EeT6ao1R7KwUdw?=
 =?us-ascii?Q?Yr9sXRrP7z+8jx89tJTo1uhBeywIiJ7qXyNE3AO2ikjvQd39UiO9m1lmu7KT?=
 =?us-ascii?Q?cgnm0zO5/J37EX9JtHOAj7nGE+s54TOqu1mdCitCPGAegF5UoTLnO6SMb4JK?=
 =?us-ascii?Q?OmjUFX4PIE/4afJ3JQxsRzRip3dwZXgYO5P5bPAW9Dm+WMhrfzsPdhgA0c6j?=
 =?us-ascii?Q?XOkdYG6UcK9SitDVe4Tsdx+vwjTEr3iFj48IA3wJYDSto5NG9JKcoUiwIvlD?=
 =?us-ascii?Q?hMQBxqaYdEDqHKg4iOXSehCEFDXIRQDzvIqXiVeNoZ0yQ312C1BM4e6Io4fO?=
 =?us-ascii?Q?Y9GCXYxm2GZQrNzn3aAG9D/QW8bzsLqNtDMTtPUUUcync/d2CNocMdnjmznJ?=
 =?us-ascii?Q?p0X7n0EL93ZSD/7ecSGrz/zqsC4JxbnxQ2aSpWjCJLdY2XTuKEoFBrFUWYml?=
 =?us-ascii?Q?HqW7BrGgDwZ8NGbVxJTgBKBg8AyTR+Lq+Fx+/VjKLRpc7NKnP/2BtGk2TkKc?=
 =?us-ascii?Q?nZuvYQY6S8gYr4tbvpO9bZQ2xtmY7PqY33YJlJbYFfnG+DOyH5DqD7gpmQZB?=
 =?us-ascii?Q?m8R1w97WlwD3ZsJWLWBpRO6ZA67RSRnnkjqe0ogo/Wfxn8+BtZpcTlxEXJgd?=
 =?us-ascii?Q?4myl66bf0/q28h2Z0r9StJSAEaem3t7w8ehahxOZGjvr/w7jdE90CBZu/Ib+?=
 =?us-ascii?Q?LgRRNChqFFowkbX1Q/iQ5lRG+fKtkdPaIadIC+sLiY/B5Zb5EUMJHoOWxln5?=
 =?us-ascii?Q?99893xZiL5TB0PeZ4BGUvkDJrFBkuv8hpfZ3wcGEZ7WuawroBw576PH2a37u?=
 =?us-ascii?Q?0OXS6BQJdpb8IpYRiZwwyXG1Yc/yesVllcaEb/7uF9vZc2eyt0RfoRu7OxBh?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5868ebf3-c19c-4f7e-ac06-08dd51f5f8e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 21:31:44.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+FFKK2yzK695kR2icVW1955dIjEO6hHfjCbNyJxIzdeFE0J7NeisUAU6iKm+osEfJRvrh8QKOzzb4L8b3hBdr8auF36soQehi16JlDo3Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
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

On Thu, Feb 20, 2025 at 06:25:14PM -0300, Gustavo Sousa wrote:
> Quoting Gustavo Sousa (2025-02-20 18:23:49-03:00)
> >Quoting Matt Roper (2025-02-20 18:10:50-03:00)
> >>On Thu, Feb 20, 2025 at 02:25:11PM -0300, Gustavo Sousa wrote:
> >>> We have now a struct xe_ip to fully describe an IP, but we are only
> >>> using that for GMDID-based IPs.
> >>> 
> >>> For pre-GMDID IPs, we still describe release info (version and name) via
> >>> feature descriptors (struct xe_{graphics,media}_desc). Let's convert
> >>> those to use struct xe_ip.
> >>> 
> >>> With this, we have a uniform way of describing IPs in the xe driver
> >>> instead of having different approaches based on whether the IPs use
> >>> GMDIDs or not.
> >>> 
> >>> A nice side-effect of this change is that now we have an easy way to
> >>> lookup, in the source code, mappings between versions, names and
> >>> features for all supported IPs.
> >>> 
> >>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_pci.c       | 60 ++++++++++++++++---------------
> >>>  drivers/gpu/drm/xe/xe_pci_types.h |  8 -----
> >>>  2 files changed, 32 insertions(+), 36 deletions(-)
> >>> 
> >>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >>> index 8b8111e954c1..c88c2da1e731 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pci.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >>> @@ -82,10 +82,6 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> >>>  #define NOP(x)        x
> >>>  
> >>>  static const struct xe_graphics_desc graphics_xelp = {
> >>> -        .name = "Xe_LP",
> >>> -        .ver = 12,
> >>> -        .rel = 0,
> >>> -
> >>>          .hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
> >>>  
> >>>          .va_bits = 48,
> >>> @@ -93,10 +89,6 @@ static const struct xe_graphics_desc graphics_xelp = {
> >>>  };
> >>>  
> >>>  static const struct xe_graphics_desc graphics_xelpp = {
> >>> -        .name = "Xe_LP+",
> >>> -        .ver = 12,
> >>> -        .rel = 10,
> >>> -
> >>>          .hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
> >>>  
> >>>          .va_bits = 48,
> >>> @@ -109,10 +101,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
> >>>          .vm_max_level = 3
> >>>  
> >>>  static const struct xe_graphics_desc graphics_xehpg = {
> >>> -        .name = "Xe_HPG",
> >>> -        .ver = 12,
> >>> -        .rel = 55,
> >>> -
> >>>          .hw_engine_mask =
> >>>                  BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
> >>>                  BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
> >>> @@ -125,10 +113,6 @@ static const struct xe_graphics_desc graphics_xehpg = {
> >>>  };
> >>>  
> >>>  static const struct xe_graphics_desc graphics_xehpc = {
> >>> -        .name = "Xe_HPC",
> >>> -        .ver = 12,
> >>> -        .rel = 60,
> >>> -
> >>>          .hw_engine_mask =
> >>>                  BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
> >>>                  BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
> >>> @@ -175,20 +159,12 @@ static const struct xe_graphics_desc graphics_xe2 = {
> >>>  };
> >>>  
> >>>  static const struct xe_media_desc media_xem = {
> >>> -        .name = "Xe_M",
> >>> -        .ver = 12,
> >>> -        .rel = 0,
> >>> -
> >>>          .hw_engine_mask =
> >>>                  GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> >>>                  GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> >>>  };
> >>>  
> >>>  static const struct xe_media_desc media_xehpm = {
> >>> -        .name = "Xe_HPM",
> >>> -        .ver = 12,
> >>> -        .rel = 55,
> >>> -
> >>>          .hw_engine_mask =
> >>>                  GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> >>>                  GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> >>> @@ -369,6 +345,13 @@ static const struct xe_device_desc ptl_desc = {
> >>>  #undef PLATFORM
> >>>  __diag_pop();
> >>>  
> >>> +static const struct xe_ip pre_gmdid_ips[] = {
> >>> +        { 1200, "Xe_LP", &graphics_xelp },
> >>> +        { 1210, "Xe_LP+", &graphics_xelpp },
> >>> +        { 1255, "Xe_HPG", &graphics_xehpg },
> >>> +        { 1260, "Xe_HPC", &graphics_xehpc },
> >>> +};
> >>> +
> >>>  /* GMDID-based Graphics IPs */
> >>>  static const struct xe_ip graphics_ips[] = {
> >>>          { 1270, "Xe_LPG", &graphics_xelpg },
> >>> @@ -380,6 +363,11 @@ static const struct xe_ip graphics_ips[] = {
> >>>          { 3001, "Xe3_LPG", &graphics_xe2 },
> >>>  };
> >>>  
> >>> +static const struct xe_ip pre_gmdid_media_ips[] = {
> >>> +        { 1200, "Xe_M", &media_xem },
> >>> +        { 1255, "Xe_HPM", &media_xehpm },
> >>> +};
> >>> +
> >>>  /* GMDID-based Media IPs */
> >>>  static const struct xe_ip media_ips[] = {
> >>>          { 1300, "Xe_LPM+", &media_xelpmp },
> >>> @@ -558,12 +546,28 @@ static void handle_pre_gmdid(struct xe_device *xe,
> >>>                               const struct xe_graphics_desc *graphics,
> >>>                               const struct xe_media_desc *media)
> >>>  {
> >>> -        xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
> >>> -        xe->info.graphics_name = graphics->name;
> >>> +        for (int i = 0; i < ARRAY_SIZE(pre_gmdid_ips); i++) {
> >>> +                if (pre_gmdid_ips[i].desc == graphics) {
> >>
> >>Unfortunately it doesn't appear that we can consolidate now-identical
> >>structures (e.g., graphics_xelp and graphics_xelpp) since doing so would
> >>always match the first entry in the table an incorrect assign a version
> >>of 12.00 instead of 12.10.  I guess that's not really any worse than the
> >>current situation of having near-identical structures that only vary in
> >>version though.
> >>
> >>We might want to add a ktest to ensure that we never try to point
> >>multiple versions at the same structure for pre-GMD_ID IPs.
> >
> >Hm... I wonder if we could make graphics and media members of struct
> >xe_device_desc be pointers to struct xe_ip instead of
> >xe_{graphics,media}_desc. That would allow descriptor reuse and rule out
> >issues related to matching the same descriptor for different pre-GMDID
> >platforms.
> 
> Also, with that, the for-loop wouldn't even be necessary.

Yeah, that sounds fine to me.  It's basically the situation we have
today ("one pointer to something that has all the name/version/feature
info").


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >What do you think?
> >
> >--
> >Gustavo Sousa
> >
> >>
> >>Anyway,
> >>
> >>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> >>
> >>
> >>> +                        xe->info.graphics_verx100 = pre_gmdid_ips[i].verx100;
> >>> +                        xe->info.graphics_name = pre_gmdid_ips[i].name;
> >>> +
> >>> +                        break;
> >>> +                }
> >>> +        }
> >>> +
> >>> +        xe_assert(xe, xe->info.graphics_verx100);
> >>>  
> >>>          if (media) {
> >>> -                xe->info.media_verx100 = media->ver * 100 + media->rel;
> >>> -                xe->info.media_name = media->name;
> >>> +                for (int i = 0; i < ARRAY_SIZE(pre_gmdid_media_ips); i++) {
> >>> +                        if (pre_gmdid_media_ips[i].desc == media) {
> >>> +                                xe->info.media_verx100 = pre_gmdid_media_ips[i].verx100;
> >>> +                                xe->info.media_name = pre_gmdid_media_ips[i].name;
> >>> +
> >>> +                                break;
> >>> +                        }
> >>> +                }
> >>> +
> >>> +                xe_assert(xe, xe->info.media_verx100);
> >>>          } else {
> >>>                  xe->info.media_name = "none";
> >>>          }
> >>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> >>> index f46426ef8ed8..e9b9bbc138d3 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> >>> @@ -9,10 +9,6 @@
> >>>  #include <linux/types.h>
> >>>  
> >>>  struct xe_graphics_desc {
> >>> -        const char *name;
> >>> -        u8 ver;
> >>> -        u8 rel;
> >>> -
> >>>          u8 va_bits;
> >>>          u8 vm_max_level;
> >>>          u8 vram_flags;
> >>> @@ -28,10 +24,6 @@ struct xe_graphics_desc {
> >>>  };
> >>>  
> >>>  struct xe_media_desc {
> >>> -        const char *name;
> >>> -        u8 ver;
> >>> -        u8 rel;
> >>> -
> >>>          u64 hw_engine_mask;        /* hardware engines provided by media IP */
> >>>  
> >>>          u8 has_indirect_ring_state:1;
> >>> -- 
> >>> 2.48.1
> >>> 
> >>
> >>-- 
> >>Matt Roper
> >>Graphics Software Engineer
> >>Linux GPU Platform Enablement
> >>Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
