Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99866C71137
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 16:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9C610E6D8;
	Wed, 11 Jun 2025 16:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaX5jcnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E099810E6D8
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749660327; x=1781196327;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Iyqp8KhVqIR9pgZQre5ec7mupecx5l/cpaoU4MozIo8=;
 b=OaX5jcnvcjzxoX92/MUDEjv4c82iw+uSDcQAZkvqsyvDQRE6DCp57/VH
 3S1TqCmby0+Z9wZugAFliqguqbUiU8Lu8GdHxJ6hj0cwddz57ll/gEzS+
 EAVI4ux7i8ahabxMKMYRb73Rujn6ve18uJiKuEfuNL66Ma8AvTdzr7aGd
 GjxaJnQ/u2gDwaIeGmBwG0IrhEgPU6ZHZg5R0yxf46KrKwU4XFm7711Ny
 XdIqGARncnJGECfwCxQEWGu0KYieW0S5YUkjrG3rPFKOa6ZqhBouquo5v
 RRprj4qkliThMevehIjCGOq/vAE438cko2yfdVf5IpemuAe0CDVfIfXBy Q==;
X-CSE-ConnectionGUID: 9gArYySuSau4SWtHjzIpqQ==
X-CSE-MsgGUID: AAomTluVSNu1QwSNTHBumQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51727633"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="51727633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 09:45:27 -0700
X-CSE-ConnectionGUID: luDlaCm9QJKaMlksnchzMQ==
X-CSE-MsgGUID: OoDuh2OtTQSnAlTEM+KWXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147246525"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 09:45:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 09:45:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 09:45:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 09:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBFJokYPhBk/e711GQvhjvETAh7zeWOjc5oKGOUTH/M+tdyrJjFtq1IMfIbVdFUDFQREn5ZIY8KZls1KwhJfZOtPBegSDbc58jEnyWRh41tLQmbNKio3ldrMm2v1JzSqpKytp2bjxxoEESnmw57diBu3720C1F16VDGDWDv2cxNBL8cOgQLP2i3p7Jlr1HOTO3KUcrrBQ3NyogFpOa7cmckUpZLnqBB/OX2udzSGuHzMrqRAz1n36Wes1A4wXpx3H0agSOOaQNVaG+9i+iY+MZvb6mgL4Cs6E95ehghfdJ1PSjXrAI06hmYh2z+Oa6sY/C3LIsU/6quGIoF/oYZMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUeqHaHWsOVbOre3G9934AVKn302IoYCOGp26beNJW4=;
 b=cmsOCarMoqBmCO36iTAKrDREi4w1Yv4aVSXjlX0CFyfTtPu0sYuVFv51M705bumLnwXiA+k/z34y2QvgDSmH/v8pplAiokoPLKG7h+Y8NX+fCpRYnK5VdzYc/v2i7xybn0uKlQ9MOn5H7K3qfHBWIsaRQq9jiXvyr3yw1A63z7gQelxohtimtY86HseDXQC5kWkR9goGAZu5hDwe15cTb7xJIdYDvgeA38YSg4TYjwyK9TVgBSb3G5U5u3YEdaIkDdOpRwgMUtAALb6HmcLzAyDqY/9NtWYXS1JGdd1KdXO7yuA/y0mh2Vr9eeO37kSeONkU9iVi7ygmpV7GTkeKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 16:45:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 16:45:08 +0000
Date: Wed, 11 Jun 2025 09:46:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aEmy8yBp0Ghssyuq@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <0c909f7376ab30f8260d83a74b3a908a4e6eb764.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c909f7376ab30f8260d83a74b3a908a4e6eb764.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:303:8e::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: c31154bb-ea86-4d0a-6381-08dda9075326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RRnJpmtTrPe4+PGF7oWeh3V/bBChAOfroOL2DZSKtRx9yvxA9zNMYyU1WG?=
 =?iso-8859-1?Q?s5HVwlXiQ2RcIUjedGyTqnKPK4mZBFogtH+x5S4gjI62TaZjn9KxX+WvFd?=
 =?iso-8859-1?Q?DbnvJIb+o8B1/FSYqT5aGZnhXBGeZtSDhCgZBCnrtMw55+WNawX5NijdMj?=
 =?iso-8859-1?Q?3+GXXDFDFdYelG7FrcXZLADHZ01O/GF/kYrHE9czUowLlsCLqDUc4kyBDH?=
 =?iso-8859-1?Q?s0b7Z/JIwjy1lkUP8rE0rPMCFpRhX+We7uFfxzHDiJfvmrcVNFDmicUrnJ?=
 =?iso-8859-1?Q?+FKGtQLf739RmLzUnmXrrwqQ6WdN4ip9k1nK2tPrIfmEVNOYkeSnoYcrjN?=
 =?iso-8859-1?Q?oRLwQ8VLst3OMYVJrcPxMour0YdjLiea7ZEViipfgTYDqlxNoXahTIC3h3?=
 =?iso-8859-1?Q?PC0fNhezl/hNhZu3Q6vkT9gB+UuQLeB2+9ClB7iH8rpOppZ7Jysjs0Duxb?=
 =?iso-8859-1?Q?j53MVXEwM5s6EJodyvEG0S5NCPW0qgN8vQeMOQUXTPMEwek8FP1oOiFsuP?=
 =?iso-8859-1?Q?6OrMa+vwjq/ekKFmgdX+L8aAlgiWnZ9350zC4Rk1WMl8HFogvz6YssvwaH?=
 =?iso-8859-1?Q?HBx2+LwtXIDbIwsh8ByYk5vJ2DnnmrGAy3GvJjdtx0hSD8ZDmtdcJo0/B/?=
 =?iso-8859-1?Q?QU00+ZqczzEtxFF694qUhBtAjpALuemSLuiUs5deJF5Ieg69fmKikJCb82?=
 =?iso-8859-1?Q?Dgoqg0D9hZ063HKCkwlTUYpllQN4EQo372iNMUfLPZUjvJXwW8cSXOYAHP?=
 =?iso-8859-1?Q?kwc6+83E2DzmzFY2VEjGlCULTdaV8TMgIKGMZkPxTMUnuuQPjWIfLvZKRa?=
 =?iso-8859-1?Q?oguEpxpaIOHKLLLGUOqy3FT51PnqZwEf74YhRR6GYTPTyi754rFvZFTUoH?=
 =?iso-8859-1?Q?AlN7gy4xTNesyY8VinAciz1YrE7JseFidorodsxgPc6OcQu7z+NCNQsYY7?=
 =?iso-8859-1?Q?yG1Zs1UbW/JbUzNHorBNvfRWg3LeI3WZ8YurnM7fBLaafNT9xZ96e4AG8N?=
 =?iso-8859-1?Q?1+lItOZo/GTKbSXyvm6orz7+hjolLO8saEcfBVXVC96HXZRPbK4HDIWi/P?=
 =?iso-8859-1?Q?9GZAO51B9TVbtxtE4nK5suhJFmO3PYMyrtyrOh2Hoi1LRGYQlFbFdyLFTI?=
 =?iso-8859-1?Q?OzU+VfAvAjbpKlM6BSLNmM7uK+8gDc/1I8YFXo4ZmmzEYjvIJekx1R4SkN?=
 =?iso-8859-1?Q?QP848bZaRLMvwEmpEVAogFwgvB4aHtHCYsEVk4U9OoBB/zGa3Ytg1OVVVY?=
 =?iso-8859-1?Q?wKqoRrJAHcT5XVBBjIFVq84FqHSIcugmrhlPYPuAC+mkuUz0cO1qDfvIxf?=
 =?iso-8859-1?Q?cw5/sDKpAOujsdIbuK3JKAn08IwFffdEBCBl7XQvQmYNqPOKX40cpa8tro?=
 =?iso-8859-1?Q?gE4qxSkONpE+MhfR6jxI/gaFyyz0GS/cTeRsUz/kKOxhod88zrEyyc+82T?=
 =?iso-8859-1?Q?l+8FZVWnIiyV+Qvt2KTyLGLUlz6vVO/GJ6S/P1ghuAPX16Q7SrYSYd3UsU?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cjoHNtxSHxds/fKF+fzPxQbJ41MNI2V5KH9JaVrUENWImRnAP6HtNSJRtz?=
 =?iso-8859-1?Q?u9+3acZ5nXfY2GGoOB8eectO/QZiAIUt9j1hDd9/CobBPdTVeFAPzyNwzz?=
 =?iso-8859-1?Q?0BrAk7PY5w64IjncIlq6WCNFozIUjS3gZqvO+pmfMUtPCCgeM6LTd0JMT8?=
 =?iso-8859-1?Q?08Ke5BS44cgDCQmpcwaBXw4OuSk1G103HJXuczkqmBgdrpFS0Ct7xZN6o2?=
 =?iso-8859-1?Q?bjmNLxCus3ktC53hLvNNaCuRqc58C9yaUiG2BVOEF9Jh66eqANBwPlnR/M?=
 =?iso-8859-1?Q?HAP5HCVPDNJSra+xfANg4qE3NSgW94gLIGJX+9lQfJEt5LIlz40pU6NY5L?=
 =?iso-8859-1?Q?Nu0JjzM0qoUE2PRgoVcgzeEI8ADgN7L7Iz5Kdsz/ql4lJVQk4sSM80I6v5?=
 =?iso-8859-1?Q?ktXVDhc6H9NVNxOLrG0ksKImGVYN0m8dUJpFu9apZpli0E+y0Om+Gbuifw?=
 =?iso-8859-1?Q?we2Bzqzp6CaHgQl7DEjhS45xxWkCtPwouzcqkGl8GklWfV5e5aFftDnzoj?=
 =?iso-8859-1?Q?QrYlZ6xJDXmiSxB8gtgGyLoogoyX5IyAoeQ/aIVus2zLGFMT/1k2UaJLMN?=
 =?iso-8859-1?Q?Lz+rb3RiANJIZTMmws9459oKhXtdDxGhqlIu/7ILPsccQXK5+kaJ+Qm3Kb?=
 =?iso-8859-1?Q?KH4mroP/heRV/vnAvAaxtyese/gyWt7EbBujuGb4Oxt8Fjy3M4Q/wjA+2j?=
 =?iso-8859-1?Q?pA2DQJAEkI5AY9iKvcqJGr22QqEoi43oojLjCkt/jnnjQ0FBjHsnCkyJHx?=
 =?iso-8859-1?Q?+RYWRMb2fA5hb7QqwhiyCjiTJkzwhV5AWLkFyi1WY8DsWh69Q8sIi57usW?=
 =?iso-8859-1?Q?jVTO4/FaLUx2vNFfwYCwEd34U/7IqnTv/VArv/4W6Z3/MNsHWluG3YdMiY?=
 =?iso-8859-1?Q?Ex5Uqj7I336nVtQuHlTbX1A2TL+dMGr5ifrDgVgaVDPK0c4J89A2K9SfJ4?=
 =?iso-8859-1?Q?QuKnqMTTDNzjAEF3rWROmQ4MlEK5h1+qIRYWy59uSs+HKBdjCAeHN04Tjw?=
 =?iso-8859-1?Q?Ir8oZ8z03Ueddjh0jWPzZ7GRDAmzXh6yuJ4s64+jx13D+8GB0Uicq2RvsR?=
 =?iso-8859-1?Q?kgYSofx1DkfDuC+sbothoik7aViJeNvNX9snUjeYYhluoHafa/3M4IufLl?=
 =?iso-8859-1?Q?WZD4dovI1Kp01O8kqZPqAWCiG0CX9Sp+m75TWdAjw7XMplhJ29U0vhbzpQ?=
 =?iso-8859-1?Q?Pb0WmP/s6Tuzds1dqTgQGMoHcX8/V48wt2ghkcIsvTSrJu6Buu3p6KHXTM?=
 =?iso-8859-1?Q?e+YAOMIi5Zalmydhj1LPDIvjP8UuICZOaBehs388u69N6ZFzeJl2rtCCNx?=
 =?iso-8859-1?Q?3Y8HsRN0wDCIk56mJEFeV6J8X23iehAk7XfN8z982bWU9Hsk9m1hTzKSVO?=
 =?iso-8859-1?Q?2nToffuYer/E+5MAJ0uueNU2T5iJT90+uweOKWwEmUTsxd5AUDEx4z2IiA?=
 =?iso-8859-1?Q?NDeRfVmxfnONjjTwR9iKisMaTpNtHyfQxA9t7XdjlLZFsZeHoxQM/bVUI6?=
 =?iso-8859-1?Q?ivQfZm2NWJwlVkh9pbrgYqnS4HRcp65WvdFyXs8ktJ6cj2dyLYrj1RtWxO?=
 =?iso-8859-1?Q?kBKQ2uNhbebxJ9d45qZ2q9OR1IiI3/vrx81Koe1jMCqTIaQseVfXAIWhoj?=
 =?iso-8859-1?Q?UJ+wGoHDOlt5XqFqkJTinHr4maW+PoBpGXGrgKZWTNOVbIDKrjR85ENA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c31154bb-ea86-4d0a-6381-08dda9075326
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 16:45:08.2720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBeh5YLKepaYb9qQNhdckwwft6YAV+Kbn4J6m+i64KzHdBbqx1ez9vGydRa4ZjLNqTkZNPKM+y1gkKUd3jF/cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

On Wed, Jun 11, 2025 at 10:26:44AM -0600, Summers, Stuart wrote:
> On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > Clearing on free should hide latency of BO clears on new user BO
> > allocations.
> 
> Do you have any test results showing the latency improvement here on
> high volume submission tests? Also how does this impact at very large

No performance data yet available. Something we definitely should look
into and would be curious about the results. FWIW, AMDGPU implements
clear on free in a very similar way to this series. 

> buffer size submissions and mix of large and small buffer submissions
> with eviction between different processes?
> 

Eviction somewhat orthogonal to this. If an eviction occurs and it is a
new allocation a clear would still have be issued ahead handing the
memory over to the new BO, if eviction occurs and paged in BO has
backing store (it was previously evicted) we'd just copy the contents
into the allocated memory.

Matt

> > 
> > Implemented via calling xe_migrate_clear in release notify and
> > updating
> > iterator in xe_migrate_clear to skip cleared buddy blocks. Only user
> > BOs
> > cleared in release notify as kernel BOs could still be in use (e.g.,
> > PT
> > BOs need to wait for dma-resv to be idle).
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> >  6 files changed, 94 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4e39188a021a..74470f4d418d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1434,6 +1434,51 @@ static bool
> > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> >         return locked;
> >  }
> >  
> > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> > *ttm_bo)
> > +{
> > +       struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > +       struct dma_fence *fence;
> > +       int err, idx;
> > +
> > +       xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > +
> > +       if (ttm_bo->type != ttm_bo_type_device)
> > +               return;
> > +
> > +       if (xe_device_wedged(xe))
> > +               return;
> > +
> > +       if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo->resource-
> > >mem_type))
> > +               return;
> > +
> > +       if (!drm_dev_enter(&xe->drm, &idx))
> > +               return;
> > +
> > +       if (!xe_pm_runtime_get_if_active(xe))
> > +               goto unbind;
> > +
> > +       err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > +       if (err)
> > +               goto put_pm;
> > +
> > +       fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo-
> > >resource->mem_type),
> > +                                ttm_to_xe_bo(ttm_bo), ttm_bo-
> > >resource,
> > +                                XE_MIGRATE_CLEAR_FLAG_FULL |
> > +                                XE_MIGRATE_CLEAR_NON_DIRTY);
> > +       if (XE_WARN_ON(IS_ERR(fence)))
> > +               goto put_pm;
> > +
> > +       xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > +       dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > +                          DMA_RESV_USAGE_KERNEL);
> > +       dma_fence_put(fence);
> > +
> > +put_pm:
> > +       xe_pm_runtime_put(xe);
> > +unbind:
> > +       drm_dev_exit(idx);
> > +}
> > +
> >  static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> > *ttm_bo)
> >  {
> >         struct dma_resv_iter cursor;
> > @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct
> > ttm_buffer_object *ttm_bo)
> >         }
> >         dma_fence_put(replacement);
> >  
> > +       xe_ttm_bo_release_clear(ttm_bo);
> > +
> >         dma_resv_unlock(ttm_bo->base.resv);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 8f8e9fdfb2a8..39d7200cb366 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >         struct xe_gt *gt = m->tile->primary_gt;
> >         struct xe_device *xe = gt_to_xe(gt);
> >         bool clear_only_system_ccs = false;
> > -       struct dma_fence *fence = NULL;
> > +       struct dma_fence *fence = dma_fence_get_stub();
> >         u64 size = bo->size;
> >         struct xe_res_cursor src_it;
> >         struct ttm_resource *src = dst;
> > @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >         if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> >                 clear_only_system_ccs = true;
> >  
> > -       if (!clear_vram)
> > +       if (!clear_vram) {
> >                 xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> > -       else
> > +       } else {
> >                 xe_res_first(src, 0, bo->size, &src_it);
> > +               if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > +                       size -= xe_res_next_dirty(&src_it);
> > +       }
> >  
> >         while (size) {
> >                 u64 clear_L0_ofs;
> > @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >                         emit_pte(m, bb, clear_L0_pt, clear_vram,
> > clear_only_system_ccs,
> >                                  &src_it, clear_L0, dst);
> >  
> > +               if (clear_vram && !(clear_flags &
> > XE_MIGRATE_CLEAR_NON_DIRTY))
> > +                       size -= xe_res_next_dirty(&src_it);
> > +
> >                 bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> >                 update_idx = bb->len;
> >  
> > @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >                 }
> >  
> >                 xe_sched_job_add_migrate_flush(job, flush_flags);
> > -               if (!fence) {
> > +               if (fence == dma_fence_get_stub()) {
> >                         /*
> >                          * There can't be anything userspace related
> > at this
> >                          * point, so we just need to respect any
> > potential move
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index fb9839c1bae0..58a7b747ef11 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct xe_migrate
> > *m, struct xe_bo *bo,
> >  
> >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA          BIT(0)
> >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA         BIT(1)
> > +#define XE_MIGRATE_CLEAR_NON_DIRTY             BIT(2)
> >  #define
> > XE_MIGRATE_CLEAR_FLAG_FULL     (XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> >                                         XE_MIGRATE_CLEAR_FLAG_CCS_DAT
> > A)
> >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index d1a403cfb628..630082e809ba 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > xe_res_cursor *cur, u64 size)
> >         }
> >  }
> >  
> > +/**
> > + * xe_res_next_dirty - advance the cursor to next dirty buddy block
> > + *
> > + * @cur: the cursor to advance
> > + *
> > + * Move the cursor until dirty buddy block is found.
> > + *
> > + * Return: Number of bytes cursor has been advanced
> > + */
> > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > +{
> > +       struct drm_buddy_block *block = cur->node;
> > +       u64 bytes = 0;
> > +
> > +       XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > +                  cur->mem_type != XE_PL_VRAM1);
> 
> What if we have more than just these two? Maybe check against the mask
> instead.
> 
> > +
> > +       while (cur->remaining && drm_buddy_block_is_clear(block)) {
> > +               bytes += cur->size;
> > +               xe_res_next(cur, cur->size);
> > +               block = cur->node;
> > +       }
> > +
> > +       return bytes;
> > +}
> > +
> >  /**
> >   * xe_res_dma - return dma address of cursor at current position
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 9e375a40aee9..120046941c1e 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > ttm_resource_manager *man,
> >         if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> >                 vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> >  
> > +       if (tbo->type == ttm_bo_type_device)
> > +               vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > +
> >         if (WARN_ON(!vres->base.size)) {
> >                 err = -EINVAL;
> >                 goto error_fini;
> > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > ttm_resource_manager *man,
> >         struct drm_buddy *mm = &mgr->mm;
> >  
> >         mutex_lock(&mgr->lock);
> > -       drm_buddy_free_list(mm, &vres->blocks, 0);
> > +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> >         mgr->visible_avail += vres->used_visible_size;
> >         mutex_unlock(&mgr->lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > index cc76050e376d..dfc0e6890b3c 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct ttm_resource
> > *res)
> >         return container_of(res, struct xe_ttm_vram_mgr_resource,
> > base);
> >  }
> >  
> > +static inline void
> > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > +{
> > +       to_xe_ttm_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> 
> I see the amd driver is doing the same thing here. Maybe we can pull
> this in based on the flags given at the resource initialization so we
> can potentially tweak this for different scenarios (when to free) and
> converge what we're doing here and what amd is doing into the common
> code.
> 
> Thanks,
> Stuart
> 
> > +}
> > +
> >  static inline struct xe_ttm_vram_mgr *
> >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> >  {
> 
