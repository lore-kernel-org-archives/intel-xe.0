Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1487EC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 23:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ECA10E2DA;
	Wed, 12 Feb 2025 23:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lokArKiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3427310E2DA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 23:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739403864; x=1770939864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4tvmELdHKDX9XxWsOANyRkYUbfXZ7slMYcGThM6p5Vo=;
 b=lokArKiXeo/dmwMSU9sh2s1rskgnQ0++ynAg8Vu7B2yIw0HTfD4EqZCx
 EtdDvpgxM3iEjT+LaFH/1O8i7LPgzWpYCYAB614IF7vpJUY4/01YoanG9
 0d/+21LY4zUEwV1CeegHP+lus87Xs0FuxjpwPkaQGCk/HzWKYBTWze8or
 tqwCjrw5OR9klYo+HTUoGSY8v65SghIkGWVPdCmBe9eJM+t5c14wnPXXd
 zmk7rmRyWrmtt7xbwAKbFJcqGkaHPtlO77AlVTQoWQdQPYryoWlq7iRCV
 UYvW6WMgxlrVI6G/h4HIE+KmHGO4Zl3fVnWTZtT1Fhl+1d5ish3kdyd48 A==;
X-CSE-ConnectionGUID: NPXgYb8IQxynj97kKtbHHQ==
X-CSE-MsgGUID: 5C3z9BPGQw+GmA/kEKVRHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62553439"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="62553439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 15:44:24 -0800
X-CSE-ConnectionGUID: 26QlkmoqSoyp2SDzc/AOHQ==
X-CSE-MsgGUID: 0V/8SJqmSKK+5agFwfbVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="112939074"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 15:44:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 15:44:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 15:44:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 15:44:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJ8t0NeV4J8bx0NZNj5rCFTd6kRJRdpJz5X4M+gwkkvYn1I0wgubb77J/OZsZnW3kdfCHN93zITA32gDjY3cV4uDpTnHSCefL/Grfn19/FBMJTpas1wwUWnUCavS6ZLeq3c/FcHggvvQIIvxs/wSvmjzLk+569NWEw4CYkUrjPgBdSWZ++3OdmuLLZd8h7oNWFzlqdvbusFaXjAkpN176eA2pBOC2KFFDyaQ1HJpC8/v5uxOis6mZZw3oGGzE3mLtVgrc7jTtKCy9HhTqWJM6jJFfMf46mbueRP/mXb8HuGNmiHrMXuWPlrnRPULy8saCmkECJh7KMI+KUbVxTQjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFe4EMIOhDoMNUuLsWu32beH3ZGDP41kBxlh9XIb96E=;
 b=EdWwxvPsiUUubLn/xdUU5yZl2umi8EdY8/UkBmcwDGY8aIvxxxB4g/prrQ+JHmNAt9VkoboUwNaTWP+HHwoPSXzqSALYpeSB3hSZuy01ntrO++YfvnS1oNf+kwspx1ufKCvAicwHQgiLcL7dlwiWS9efQhuj+B4GkPUi/LW81gZdjYRRGUrs+hP9fdCskfrYQ2S8d3dTHNZwqx/BA7VPbeOCT/ceRPb5Su8ocO/uAepUEv3gJgb0mVncJ97CLeh9Bw6dI2MXl9jGoQtfsElYfnsi/FX9E7CHqMv/DwuoSdZtiRs321KRnUdFQL2M30WV8M3uQj3/p+OF4R/OsNzclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 23:44:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 23:44:21 +0000
Date: Wed, 12 Feb 2025 15:45:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <intel-xe@lists.freedesktop.org>,
 <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <ayaz.siddiqui@intel.com>,
 <tomasz.mistat@intel.com>
Subject: Re: [PATCH] drm/xe: Add per-engine pagefault and reset counts
Message-ID: <Z60ykk1+B0pAyc3u@lstrano-desk.jf.intel.com>
References: <20250210193657.96030-1-jonathan.cavitt@intel.com>
 <Z6u2uH9hkHyJ5kP4@intel.com>
 <ywxrqrblg4fmyhpxluq46fdgyd6c3pol5ic5u5emehybvypmho@fs5jajwfogtp>
 <Z6w38scZQPsLIfCs@lstrano-desk.jf.intel.com>
 <ipfag5tp7crirxabplso6jal2bmf6nh4jkspqiysxhtl2sf77j@idmsxgup6rra>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ipfag5tp7crirxabplso6jal2bmf6nh4jkspqiysxhtl2sf77j@idmsxgup6rra>
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: f97e9b6e-e91f-4c83-4692-08dd4bbf2c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WFdmMuN/LU17nBYuNJ2B6+kc9g7GDwGKGgXholc8cdLab2d89iaelDN7Mz93?=
 =?us-ascii?Q?1aqq6feYlHBWA2vzRPSIcTX6T5fH5bbuuTc1b8zg/zbvsAsQSBOBUKg0aSon?=
 =?us-ascii?Q?/RakzyrePngBkmQzkTJO1E1NFv6N8mm1Mm90Ik9RXrpoLY9WTvgHJKg0Yqun?=
 =?us-ascii?Q?2Q5AlSMTXd2elt/0OKcCS3T33/h4iwGNTveKozFpLIQ6pzF0puraDx93BBEs?=
 =?us-ascii?Q?OTXcVmomOuRNmfXiAk6C0vXROslDH4s8qc7jDUdoA+h8jML15lbxMmc76q7H?=
 =?us-ascii?Q?bH8WR4i009COSIgoLDmoSbJU2/ukHG46P05JkkdK+q2OqM8I+r2ppG0AG44k?=
 =?us-ascii?Q?7yZuBfBvYb0IdZrl9SJPITXCa4GLF8A7EzKgSGdaf6ZRvtdligYnsEXpyqz6?=
 =?us-ascii?Q?esSY3uRNnIElAvpG/0G8OMbQ/0/nfdd+OuvWTMH3x41zKTAzgFsMTFvaO/mk?=
 =?us-ascii?Q?Hv/jdCL7MBZlKDHj5VHJMajew6kQpVZ4FvEljA8LAoILPvFv/Sw7pQclqM/Y?=
 =?us-ascii?Q?FmmK2XYPOakcucmEaW3I7OS7LDzHGLV9JhGIKw1ET5wKsT9amVEs6OebXrTm?=
 =?us-ascii?Q?PqNKeQNytxvW9j5UeAal1aej06R2gransP2dcwEzn1qgjzwd/NhS7iHfFJ5e?=
 =?us-ascii?Q?F5RmKXP8lw4dTtFWos/oatfTqHw/sI1BjoedJPTSy1A9EDtBiGN8CSGmlYEr?=
 =?us-ascii?Q?4AAwOkKTPuleU/k4abhJNTt0Tbo1upMjLSjuGLKL7kC8+MR7X37ZAAGFAQLF?=
 =?us-ascii?Q?6SSA+YVVJ9hqzy8M4uMmy8+UImXImDZxCKs+azPceeRItVo05O0bxGxQ1MOw?=
 =?us-ascii?Q?9j9vLmSuIwc+cDSd0xLMyWObiCbYOaN8u8p+D1OH3fOjG82tlpdSSSTZ6nef?=
 =?us-ascii?Q?dYBQLLGe11w2mR0eRELccWvsIUAcJpkPgcjU3YcnYeMQUt42DJi9THgspYEX?=
 =?us-ascii?Q?1bkucniZKSMfjdKVreDlULGRgG33QKzc/Zl8yM3EPFB+u6MeAlKi6sz7AqWm?=
 =?us-ascii?Q?hm0Eg2gwzi97bkBphVC02NpeE/wOQG/HRMSGXM6LSAWbZyd51MXXGUqUNyuQ?=
 =?us-ascii?Q?h06uHNaiNFHtCR1yn/B3QSdFhW6n4N0wci5ux4J/lRTB2YaATXVLrOux+ESb?=
 =?us-ascii?Q?/Owj+Cbk5UqXGLxA+ExzH9RLWHyyaN9JT+RDbTu3HpcT3+FcKR6/7pYVD4I9?=
 =?us-ascii?Q?e3vIYcEHYdB13NIbn3lqd5UpHQJ9oNfsV1dyQW69xleUz+Y+a45P5A4uRoLS?=
 =?us-ascii?Q?zWBkHjsyNay4oYg9/9LkYpaq4LRVf1Ue1BWe1i2kjS9CGWUB33s0UpxzpdTU?=
 =?us-ascii?Q?g0cdGLLSc3u31PPVf5Vc0IriTotUmbTwTE17CABBIlKLcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8lUiUsF/yiMCERC7MWBtRn+TVgX4vTWr4q2fBmCGsBw7tz9rnlHwtKQks3gj?=
 =?us-ascii?Q?MIQ73rxn2lxrd8qhbo3K6chUrUM3ncnN/Xxdp3RMTS3/PxG1pFqGI4ZYnPKM?=
 =?us-ascii?Q?yFxe9A92ERzdnaBHtKdxAvo7vlnl2medmJaJtX5Q0HvWZit198X1v3g6Tvr0?=
 =?us-ascii?Q?PvDQw50EcwRo8FJYvZoL0D3GHieqMUP0DsnK8fkysGZqLQ0Hxk0q06K+fdNa?=
 =?us-ascii?Q?BgWRqNGKzzTnkg0yPhKHbIBSnf5qraKU3QmrF3/7+6V1Ab7Nb1net2cSUwuY?=
 =?us-ascii?Q?ENrZw43/qSNDUqyQr9z5g6RFtNPc3lWX07TkSmfA/zrq/u1iOq4WJjGM12fy?=
 =?us-ascii?Q?eKpcI03b69WtFzHm85wpqUvJ/pBrf+cvhuMORYP1R2PEbHQ/itgkZ9cJU7SB?=
 =?us-ascii?Q?1TuAcRTYYvG6UzBLdoqrfVhDB2ocFzrFO35lNo9yB+K2LfFWgmHM2PratfX3?=
 =?us-ascii?Q?wz0KkhQQwOLF4dgC6muCWPXsFK8HN8h/kHAoUsj2LSoooq7+Yy5ii/f3Ckns?=
 =?us-ascii?Q?ti6vXt1iCDFxlt9N6y0IDhE2Idr31t2PB41c1s1ceqfPdtpE11HRLeFS/G+K?=
 =?us-ascii?Q?ShnZazaGOEO+TnVp7GcU6/G3oZJtWWMmCq17RueYm0qfqZoQlrO2d6Ur7Pfl?=
 =?us-ascii?Q?x0s8DXoeIMb5VLN6rZRZTe1BSaPJ/0Vrxu+FK9JimGl8Rp1GWj5/6ZalW9ou?=
 =?us-ascii?Q?sFEm0DXmQm0qikjWEFrlkuiK3ah+vh0N7VqoH6hD8SwcPjzVPTz3xEZO7Ial?=
 =?us-ascii?Q?oikvYWlmgWCiDc4AijpTsxmH4jsED7hX4FlC+ltzpC05MJVMgRaOZfHyST+Y?=
 =?us-ascii?Q?IgSCgkaCi8o5k/txMwDz/HOqXO8JIn3Yxddax5wjAZGFPsnLQnuEsd28XWgl?=
 =?us-ascii?Q?Bm08UBIprCZ3B132LYpSbxWD1WFx+AFs/Jl4KbLLs/js9rbAIz/dohmBG5vn?=
 =?us-ascii?Q?tFJNudC7Hsq+k04u/KAcM6mAGJL5zfyN9gHohtOR2ytij9AfVrJiVNJSk93q?=
 =?us-ascii?Q?vVCc3j0DMblGbncgImVr40ZACQPuJb7o8FbXUHTuSC3fYFbj99L4uFxXBW17?=
 =?us-ascii?Q?Rex1AuJVUbzsoGWEfB4qqV/fV1iRvKy1KYVRZwjGOaWwxpbK0iQLnWrHl0ny?=
 =?us-ascii?Q?YFwitodL6FUvIH6atfYhHzX2wcXztpnZNijJ+tfc8LJkYU9J89ealKZRrnHH?=
 =?us-ascii?Q?0YNQUrxmcQ87rrJygfpNqizka441TgOLXvcF4NEhJLsS1gQo3cGB9GdlOk8C?=
 =?us-ascii?Q?gVVYWdczcHX18SNSNHohgI7TlQApkFS4xKB9mHXZ6nJkUU1sh38rBFXqGDcV?=
 =?us-ascii?Q?A1w3uC35VtGpqanRlK2ahlo0rbceT0jOfJMWmJ8xE6qpObp63ZtcY334wIWz?=
 =?us-ascii?Q?MxQgyF0dbjI9c47o/uwL9uLqJ0WeE3VTSITBIM+oybutExW8fiCaiv+bv4KC?=
 =?us-ascii?Q?yoZPn82R62i2oJeUfATpLULIpUX5DjdaxdJOvrammDL0HT8kq7Xkc3eN33h8?=
 =?us-ascii?Q?X0LC3cKs1bmjTsA21hSu2+vamYLtOjiDPokOw07kRTd98e1UWiHZFvBbpl4p?=
 =?us-ascii?Q?L3AwpCisjB/arYPhuJLZvuxWxheyp+JMheFnKKq+8qkhFHiigt1QyeFhjNbx?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f97e9b6e-e91f-4c83-4692-08dd4bbf2c6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 23:44:21.6006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06aNBu7xkPWVDOl1z8Nbnl8BJGVOluADOdupox8WyTtluoMC867SzIKUI1WL5kPSIELYKwLn53O0k9YEzXPP4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
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

On Wed, Feb 12, 2025 at 02:48:28PM -0600, Lucas De Marchi wrote:
> On Tue, Feb 11, 2025 at 09:56:02PM -0800, Matthew Brost wrote:
> > On Tue, Feb 11, 2025 at 11:37:12PM -0600, Lucas De Marchi wrote:
> > > On Tue, Feb 11, 2025 at 03:44:40PM -0500, Rodrigo Vivi wrote:
> > > > On Mon, Feb 10, 2025 at 07:36:57PM +0000, Jonathan Cavitt wrote:
> > > > > Add counters to all engines that count the number of pagefaults and
> > > > > engine resets that have been triggered on them.  Report these values
> > > > > during an engine reset.
> > > >
> > > > My fear is that later someone start using this as some form of metric.
> > > >
> > > > Could we keep this behind a debug config?
> > > >
> > > > >
> > > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > CC: Tomasz Mistat <tomasz.mistat@intel.com>
> > > > > CC: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > > > > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gt_pagefault.c    | 6 ++++++
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++++--
> > > > >  drivers/gpu/drm/xe/xe_hw_engine.c       | 3 +++
> > > > >  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
> > > > >  4 files changed, 20 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > > index 46701ca11ce0..04e973b20019 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > > @@ -130,6 +130,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
> > > > >  {
> > > > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > > > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > > > +	struct xe_hw_engine *hwe = NULL;
> > > > >  	struct drm_exec exec;
> > > > >  	struct dma_fence *fence;
> > > > >  	ktime_t end = 0;
> > > > > @@ -140,6 +141,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
> > > > >  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
> > > > >
> > > > >  	trace_xe_vma_pagefault(vma);
> > > > > +
> > > > > +	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
> > > > > +	if (hwe)
> > > > > +		atomic_inc(&hwe->pagefault_count);
> > > > > +
> > > > >  	atomic = access_is_atomic(pf->access_type);
> > > > >
> > > > >  	/* Check if VMA is valid */
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index 913c74d6e2ae..6f5d74340319 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -1972,6 +1972,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > >  {
> > > > >  	struct xe_gt *gt = guc_to_gt(guc);
> > > > >  	struct xe_exec_queue *q;
> > > > > +	struct xe_hw_engine *hwe;
> > > > >  	u32 guc_id;
> > > > >
> > > > >  	if (unlikely(len < 1))
> > > > > @@ -1983,8 +1984,12 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > >  	if (unlikely(!q))
> > > > >  		return -EPROTO;
> > > > >
> > > > > -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > > > > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > > > +	hwe = q->hwe;
> > > > > +	atomic_inc(&hwe->reset_count);
> > > > > +
> > > > > +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, pagefault_count=%u, reset_count=%u",
> > > 
> > > I don't think the message was accurate here about being an engine reset
> > > and this is probably making it worse. +Matthew Brost
> > > 
> > 
> > A bit confused by why we need this information in dmesg, but also not
> > opposed to more information.
> 
> what I meant by message not being accurate is that this is a handler
> for:
> 
> 	process_g2h_msg()
> 		XE_GUC_ACTION_CONTEXT_RESET_NOTIFICATION -> xe_guc_exec_queue_reset_handler
> 
> Do we get that notification on each exec queue? wouldn't that show

We get a notification for the exec queue which has hung.

> multiple "engine reset" for a single reset?

No.

>

Also noticed the code as written is not accurate for virtual or parallel
queues. q->hwe is not guaranteed to be the engine where the queue is
running when it hung in these cases. So that itself is also a problem. I
don't have an immediate idea of how to resolve this.

I wanted to remove q->hwe at one point to avoid this confusion but
haven't gotten around to it.

Matt

> Lucas De Marchi
> 
> > 
> > > In any case, instead of polluting this, what about printing the counter
> > > under the "stats" file in debugfs?
> > 
> > Agree. I already suggested this [1] but accidentally replied to the
> > wrong list / post.
> > 
> > The current stats interface for a GT but IMO is light weight enough we
> > can more or less copy / paste for other scopes (e.g. device, tile,
> > engines) hooking into debugfs. The idea for this 'stats' interface was
> > for IGTs or quick profiling of workloads in a generic way. This seems to
> > fit with this use case.
> > 
> > [1] https://patchwork.freedesktop.org/patch/636270/?series=144622&rev=1#comment_1162350
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > 
> > > > > +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> > > > > +		   atomic_read(&hwe->pagefault_count), atomic_read(&hwe->reset_count));
> > > > >
> > > > >  	trace_xe_exec_queue_reset(q);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > index fc447751fe78..0be6c38fe2a4 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > @@ -516,6 +516,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> > > > >  	hwe->fence_irq = &gt->fence_irq[info->class];
> > > > >  	hwe->engine_id = id;
> > > > >
> > > > > +	atomic_set(&hwe->pagefault_count, 0);
> > > > > +	atomic_set(&hwe->reset_count, 0);
> > > > > +
> > > > >  	hwe->eclass = &gt->eclass[hwe->class];
> > > > >  	if (!hwe->eclass->sched_props.job_timeout_ms) {
> > > > >  		hwe->eclass->sched_props.job_timeout_ms = 5 * 1000;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > > index e4191a7a2c31..635dc3da6523 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > > @@ -150,6 +150,10 @@ struct xe_hw_engine {
> > > > >  	struct xe_oa_unit *oa_unit;
> > > > >  	/** @hw_engine_group: the group of hw engines this one belongs to */
> > > > >  	struct xe_hw_engine_group *hw_engine_group;
> > > > > +	/** @pagefault_count: number of pagefaults associated with this engine */
> > > > > +	atomic_t pagefault_count;
> > > > > +	/** @reset_count: number of engine resets associated with this engine */
> > > > > +	atomic_t reset_count;
> > > > >  };
> > > > >
> > > > >  enum xe_hw_engine_snapshot_source_id {
> > > > > --
> > > > > 2.43.0
> > > > >
