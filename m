Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBAAC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 14:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EF410FFC9;
	Tue, 30 Apr 2024 14:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9nOm5OZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D26710FF98
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714489180; x=1746025180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2YT2b7Jmp+wzEN8/ObLRos55I6fSdwH3kAFUuSZW3nU=;
 b=n9nOm5OZs2rclQrh6lTYbjyGnJtu0jnuWFvUI4psPL0ls5fyZJb/br16
 lC2224xqxXd0fK8NSgmESbDGbvq3CTzD/pR0QLvXJlfGq29qNCI1n4LGd
 vxUlB/bOImD2oI+RMV/3KIeOXFW1mLYEtKMUTDiPNn+mcAEdKcAZw8l26
 AVTqK71z/8vgWaYvtQWsunm4xqIwLZjeqxirxIEkRRhLsni1DbCAab9Xr
 0vu3jYcH6zqAx0rKOYdKkBfXFiDuqn5K9A/N+VvR4yVscGMf31b/DbbFi
 QdL9zUSU3RgIfI4ksPaMYI08J462zoAtbzgu/wGvFXjRgvKqwk0DokvSO A==;
X-CSE-ConnectionGUID: bFpHTMAGRHCZZUlARVilAA==
X-CSE-MsgGUID: YAFyvY9cTeWBYs9lpfR76g==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="27648897"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="27648897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:59:40 -0700
X-CSE-ConnectionGUID: sSwcZDmBRDKPjN8gjY71pA==
X-CSE-MsgGUID: LQ1DU445R1aeUxu8Kh3VHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="49699440"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 07:59:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 07:59:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 07:59:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 07:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN8ghlhjF4bURBoer5GadAmRVInyzGRPazcuxoDBuY6YkPJKdluNnDk5mxjVZivb9lhWVZ7TmmImWOijaE71OO6i4RWuIKYJPoDODQOLYeu8Tp1J7hTqdZBWfS6pADdZL+cj13dvAKSde3aPrVEUR8Z3gPYK1segfMDoBWaa5PhiMH+vLRJTvvVa1doLkjhzEoSEwjf+sOYfb8kuoYa7smEnLjMXvfBi3sgk67giFNOXB4ngrINB5aSTxUSelpI7e9334yl5JsNcZ3lFCayesykIBBbq9g4KfzuZJg5o1KI75/JU5mwNjx4T8Ff5HkZwL/8ncOmx7f8kVMlWjBS8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+aKzi7rHhq+frMCrDdyoK2R8vGl/4v/WEkOBH1eTFU=;
 b=TD3ZocqWPs8oEwX/5+OTIwQt//4P2I/KervS1Sk5inMM7ZyZ1G9gD9dKSMQ0aeoL8qoXfr3wBs9VN7Jhi7hQpyPrw0c+PSFyFvDLgUsmCYiUwtLJXJnjq1VzP4W1TGujk+u4pOQQhoxEkO/Bmc0DxnjXd9Jls+HRAAStN2+HSax2CHeRLa1zdzOXlvNVTJUp2a7gYcNjRhk2p3SZnsIGa8SXTdqHZ5yLSvYeVAFbIW0Q9n2TQJc+MkxzpRrRs8nqPXtKKIalkCOY7n1R/JRCcggnAbcylzD6xroyt/yZc2326H2fYg+APxRpHa4HwqKmwlFinhr8RIa6ZyCfAfj1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6767.namprd11.prod.outlook.com (2603:10b6:a03:47e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 14:59:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 14:59:33 +0000
Date: Tue, 30 Apr 2024 10:59:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <michal.winiarski@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 0/5] drm/xe: Fix early probe order
Message-ID: <ZjEHOMw7QTPS_wEf@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425182410.2705061-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: d213bcc3-c172-4116-64aa-08dc69262549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i2S8MqbYFNT8hQfL3LPEw1zc09GRvpGzRnhxPuvV3tYHP9JFDck9GZqMM66g?=
 =?us-ascii?Q?WWcBrBqgtLoTdifZ3CB570uPSk/SIMcUTk3Yi8ELxOGfPKk0Ffv79tpIYArH?=
 =?us-ascii?Q?iGnUgytKZ+iKAZKpQm8h6z9FO854Zs7OdbUn2s35fkk+xe+X/6V4LLEqoSUj?=
 =?us-ascii?Q?MOb898KoeIOt6fmRvQMTIDa3nBd6Cs6Gnu+WIppwTiw9A/t4NvSFMJIU3uoK?=
 =?us-ascii?Q?fDePPIABmPDRKdYAoSJ1v0G4+OKnpZT+MJMxHS34NNE6l+THkAhhq9cjOH0l?=
 =?us-ascii?Q?EpRCOgpLu52LJUYUUYGvreXWO7j/61h0IKM4KL8vb9FNX3kAqQrT0HAeiQdN?=
 =?us-ascii?Q?DW5fO/W8a/EiGAMz08/46ARLEh+CaaU4G+lMaukGVRelCZ6WZ2+W1nzjADOy?=
 =?us-ascii?Q?FMnYckqLlmcu4ZDuDZ7U0NmQZr0IcL3H5XDfe0bxO0jozI5PHlkjunA9D6re?=
 =?us-ascii?Q?hbRb1b02VcUwxX6WyS4RGdcmSW8D3nzm56jsK0+BUoGyCFeUuWY/yKDnM31j?=
 =?us-ascii?Q?0o8yo40wwLUf29rfhVPwJFtHXlLORFHptKXD2sdgTQLzzxTy8OOu4eqsna6v?=
 =?us-ascii?Q?6rATMayKgwTXwaAE/VyWco8CoU+LyOngfLqiKM9YhLzK5MSPf2n6NXKylmE9?=
 =?us-ascii?Q?dRf2H4illUTtRxKyv9/l//rBDP5IB07iY8ugMJMKEtD3WGGHCU8JhYRlSSWM?=
 =?us-ascii?Q?bC2hHVnhCpEnlFQmR0AqKe0OS6lk84L/s1j+ejtPNVJunq1RikSBGnJOQ6To?=
 =?us-ascii?Q?B2v4Twvo2sYnnRXUel517oucCvGPSsmwakUbdQmm5RBerm+cyQ63F+vB/37y?=
 =?us-ascii?Q?ydS+wdyDuzRbDXdPLVOm0ElWAwN1FuJTgbUw7buGynEyfbeYC9QbqODZY9q3?=
 =?us-ascii?Q?zcxD4xvBHbjeALu6takRR9QoAewy63R9Cnq7fOGnpyu1VpAdmorHVApu+eWh?=
 =?us-ascii?Q?eLnk6lC/yGbcfskB5K8MShn1OIncsSj6f26xwyy5zz2Yalw47d6Fp32jEX6m?=
 =?us-ascii?Q?7EVSrJwXenbVVH6Ih8Cf4RIgaumaXzDOnYdPw1JQ3yWjYRgYw6RasrVBQFM+?=
 =?us-ascii?Q?+koDpRA3BayfPPBpsEMgbPycCZGixI6TjFE2CbnEkoTUa6+iTAoHeYERnKPw?=
 =?us-ascii?Q?XIlRZP1BQPL3OKoWjfPH/Ojwag8/m/CNQUfyFkzZYDjjeqIgEm9V7sV01xkx?=
 =?us-ascii?Q?hIjVsbrxDME79rqAzIhodxtVHAvCAHskHHY+YbHpWJrWUnHeYPiD69HMomJC?=
 =?us-ascii?Q?A0S3ZuDNFyqZtQqKqJ8DCFWYZEcFjgfJKBcpIo2Dsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9RWsJVJPhjy1BVACthsYP/Ae5rPjekcy/+uHRxRFRFRPobY48Q590aVqLG+F?=
 =?us-ascii?Q?h02bfmLZrxT9Qo/51lYuP5/jHwJg3uzfH6VPuWNFROEsUTvSCkbFg6XBuOXv?=
 =?us-ascii?Q?xtyEBu++aSBMjOQHnOl3DpJULSfNeTeks6gDaKMB6Nozucgmw9I2WxkehOre?=
 =?us-ascii?Q?pNxVLHbtFC23DOIiosgKyUw0utuF4cKHRoOvnpqkaF4bM2PZAKk4OqaOs8Al?=
 =?us-ascii?Q?jbwj17xu2sQ/tGhVqBJLKET1oiOPZNKHDTiPfBSnLOpuZpc0gSa8FcNSFB8h?=
 =?us-ascii?Q?V8qqgVBr7mFb2Ub6+R+OrrUBRWJweDgwIhdZOR0NHPgctnK344iL1kacIFVg?=
 =?us-ascii?Q?eUWxT4oBlpwUB6lDeLGm4RhsZ7p68vV8l0g0ZtG7zjZaFv1m5X0TjpdQNUn/?=
 =?us-ascii?Q?mgjUI4/D5FDJnpJqvp/JMGj4qQ8WT+j+q0+cpQme/Ft08Mrt0OrV29RcewG8?=
 =?us-ascii?Q?02KPmGgJ970P1kXUYgNglCACJJBluTdFRRWoi9lXFqjOm7B+R0A7Idksk77g?=
 =?us-ascii?Q?z1z4WTmUhzRkovdgiz5on6AGKse1YWOu6fd6N0OvxtpFVL/i0XaVC28PxbFp?=
 =?us-ascii?Q?ODYTQxupXkpdG56/T3vG9ZUfOg7lt5TY26a+cBewAZfB1ERJbJTTP3ABj0ON?=
 =?us-ascii?Q?hqm04tGTMQcUI0T3GPnHo4IgPznp9Qvc6XgbTSGmhgVJScHcD+QSz69UTKk1?=
 =?us-ascii?Q?zCH72K7DTuW84cvZOr+CVQBtzrD7x/13y7/MYla5lOl0eya/ho9rK7f/UIng?=
 =?us-ascii?Q?40tQD6NosiIOFIlf6B1dsHu23ax9gplf/BdwAlWyjwG46HlLcacvStH7q/Yv?=
 =?us-ascii?Q?FK96ShYdgBHRY0jphJSnNXAxj/Q/OnF6sj1p71UgGEiaIkIUPqDqdL2+Dkt1?=
 =?us-ascii?Q?R4KEMyCPiJVbUzMqQpactVqZgI7vUS5gcRx5kG8+Wg9+aCL8Sj32qMwMh5Df?=
 =?us-ascii?Q?vJuYstgQBmQABa9n93XvI1eZFAzOHGBLzwhbxZunpwCUkK0LaNMDDa7tNr7C?=
 =?us-ascii?Q?ALyDXV78FOvcnLakWwdNXdvVi8rTWPWWo9txj/sm6B6b+Na/0bTtmxHWE3w4?=
 =?us-ascii?Q?8sIO3PEYO7rwvvTG0kNjPYUxFX8lXuCfA8ewtutZizKW2FdONi9CKOLOvEvB?=
 =?us-ascii?Q?Ir/QyobOiasL7aE3kpSOMTDdPcpqGklQQDQICdAr3Ov8muH9PVfAHo1bcbBa?=
 =?us-ascii?Q?ZFDg98EAqbJiqWijQZ1uFiAApKvZBLMC4wReAvnYnVkle5Vq/RSdSkIi0ibL?=
 =?us-ascii?Q?8eyI8teryc36F10BNw5aHKcH0vgCY1RIJ6pu4VOX3rtp/cSqLxyotbqz+VW7?=
 =?us-ascii?Q?Uf0eslaG1pdBwrMt1J/peJSnutEmeMRl8emB/qKb2FCjHoxQJGACb2zU1dAI?=
 =?us-ascii?Q?BrVIqCSXnqLSYYG0CwsAGwBDxLaUmjxwHGp5eHpk3F6ntgfvTzMNsL84xQ0h?=
 =?us-ascii?Q?EPXJQGwjqCEooOvnEGmJNQIzNnUdWz9TOF/Cy8YQiZfOIfbTL1pit36vdYkm?=
 =?us-ascii?Q?7Cfpm4t1QCugOC9F+n3ST2HvmqDO+igiCNc1Zn2RYTxJpVbabXo6rM1/O+an?=
 =?us-ascii?Q?AsBJXlGPHGykScvq+AdvOUYGNHBTx6xwISbpVqh/aFtstD88EqpgfqK7YEvO?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d213bcc3-c172-4116-64aa-08dc69262549
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 14:59:33.7603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsMnFA40sop6cSSZ4WKZAuo1Cq8KAPBJdD9lkoelZqPWkdnnHDmKXQLJCmm15zDVxly1el13BzKv9xh6j3sqgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
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

On Thu, Apr 25, 2024 at 11:24:05AM -0700, Lucas De Marchi wrote:
> ( It looks like our initialization functions are in a less than optimal
>   order, with additional functions being added in random places. We
>   probably need to rename some to follow a pattern so this doesn't happen
>   again )
> 
> What this series does is to fix the mostly blatant mistakes in the gt
> initialization part: since the addition of hwconfig, the WA processing
> is not done as early as it should. Future workarounds will require
> XE_WA() matching much earlier. Move initialization around and drop dead
> code to cover that.


Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

It is likely a good idea to wait for feedback from SRIOV side, since
they had tuned the init sequence with that in mind.

---


Cc: Riana Tauro <riana.tauro@intel.com>

who is also working to ensure sanity on our init sequences.

> 
> Lucas De Marchi (5):
>   drm/xe: Drop __engine_mask
>   drm/xe: Drop useless forcewake get/put
>   drm/xe: Move xe_gt_init_early() where it belongs
>   drm/xe: Move xe_force_wake_init_gt() inside gt initialization
>   drm/xe: Move sw-only pcode initialization
> 
>  drivers/gpu/drm/xe/xe_device.c   | 16 +++++-----------
>  drivers/gpu/drm/xe/xe_gt.c       | 15 ++++-----------
>  drivers/gpu/drm/xe/xe_gt_types.h |  6 ------
>  drivers/gpu/drm/xe/xe_migrate.c  |  3 +--
>  drivers/gpu/drm/xe/xe_pci.c      |  6 +++---
>  5 files changed, 13 insertions(+), 33 deletions(-)
> 
> -- 
> 2.43.0
> 
