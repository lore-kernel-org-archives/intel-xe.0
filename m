Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAA2CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 19:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4AF10E638;
	Thu, 28 Mar 2024 19:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJGoHakT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D31010E673
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 19:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711654181; x=1743190181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bw1pGSeWLLupJcOYGazHl7Gyu9Sj0/8Vt7KmL5CuuM4=;
 b=nJGoHakT4MdCwrhpW1hnSe4InPt6ZCEmaXq5/sKt3X0GtQJXQltdifCc
 60Selbe/nVEh4Arv8t+iyYT1RrMhxomWvFmqGmB7MVQ76Gi41NLhwg44t
 xEyc0oAEktUN+lgqwKSUi8DQs4NC807yR6BdBkB/eTB1r3nTW4u1ql12U
 2zlDvsjAfvHT1Ibce6C8DJpSE6jx2h0oAefbu7fTHMZFL/Qx2Jyji/CiL
 vWN0lwfx6cbG5azRlT3K7IKXDBoDikvGnjLMEa877JW46gYvsmn9wWgln
 fJxWTew9MxNISiALIeP53QIqnDkBkAB5vQYtgOR7oTzyODBbTGiVRo3UH w==;
X-CSE-ConnectionGUID: /Mty19CBTny27nZp/Pplkg==
X-CSE-MsgGUID: yrXY43xjR4+AHQ6DY5E8Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10645368"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="10645368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 12:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="39908169"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 12:29:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:29:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 12:29:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 12:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1PHSx7NNEW8vkXfJABN1+9TkHa4oQn2W3wz0pAxgjZaiZDtXL+WteTfPryW/ft0WZyPJtUu8Tk+oZX9UiSacGgwo45/v1VpNXU0eOtuxKg0cR62VS68/8LlF1OpM/TyN1vnxAIkTsuWHraGhMA9CtNl2KyZHhesjWtP6EtHXi71rllxiygksC/iUCj7ppqh8rrZyt1DV6/4l+I3t5wI8yCJS7glaaCFA9rNdIX9uHDkpe0aY2AKGiy4RfSpf/UfwutPe9jhHOl9ALoQjrlcmDRUH85WJYsWFgOapcA1V9+mKYJvKmIDWjD2lpYp8oFBivYu9D7fZohxoleqm0VldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=383xlSKIvK6dJUwHw+AJku2n2R5DZsqC/Bm+CW6D/YQ=;
 b=f/N+nHtyHJxtD42Lletqq+Sa245ICurkBELOERbA+wKe4p0gBb3AC4RaiZ6k+f4aQrIZPfiAC8zP0ld6VP9J6USnRZIpW4ceY2cStWj25WzlS/YrJhgcXp8ygT7JgZn6OO1vh32Lq0F2cyDqdRf5HiWf11dkBFgsm7NNkqI+NbC24v5tsG+Qh1Oxesvg80rqctn5Jg0TtG3go1wbBT7TALD+fTkU7+cRX9WIy766fHdNCiI90nsyVGhvtrUTaG57/NP80WVI/D+IXzC76TYtXXq6aCdIllTSOBIjpEd8ph9NwQxslDE83nLtv4BOYM7DFQRpqhElk8lxliWsNwveVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6761.namprd11.prod.outlook.com (2603:10b6:303:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 19:29:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 19:29:30 +0000
Date: Thu, 28 Mar 2024 19:30:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <htejun@gmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 0/3] Rework work queue usage
Message-ID: <ZgXFYWuukcLjMtmf@DUT025-TGLU.fm.intel.com>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
 <rfc2tu5zx5qd4sbgpd7rcqproacelziemigx5wrs7xyjmr2fb4@w6wsqxkcpvnr>
 <ZgXBcpRv_FTIoq91@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZgXBcpRv_FTIoq91@slm.duckdns.org>
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6761:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /GMiYoo5UOYv/GZmvh274YplcTWiC9wu3hN+k393ur7HQJeq0vAXJ4muboOIbIAkunT8XxPGQxIDpUV/+lhBy/Iy0Y4JNBKvHoVLriMeba29QFqHKw5JeIAmynaJzA9LYNU3dLYAtWmVI7scVlOysTM3DSEzu6oa0+kaQKWhuB497jCVxIgEyw0lmlnllGDPiwYjQUupskN2VpnCRiVKkovixNrRRVPy4phFN30C0Wc36wRHJcg/qMnITCYzmX8mK1z1QoFQmvoMDML19bej9dI9LZ7hcN5XfeX4gAYmRbQAkommXQgfb55uj1rZw9AmhL2aE3bZngGztmJmKpJtwNJyV93pJWFDzYsnVL+pR62SofZ027HosbuxnvptU6F0lmpnkhybxl6wfPhCjrZIO7jXHW1EU2kiYfK8JqCyeoIrAzTER5NoP3+wq8jfBNhkNRoMJPq8JCqvSbeZijquOxZ7ILZ6LhvdXn3llLXA/UfkcydFFed9b/jcBPoah0NC3E5soVAxNZ5/on6AxZbIZDb17zesy4/67MySDQSlEsQ3T9bG+eV4G32vg0JvW2TDRSUNi66zsdJDYIrZf8IE74kwZpwMhWSrG3Pgb99agCoji/R35HrSsVJjH9hEpB9QsnEI8VYmLyD08wgQP9nYUS8uHOR3LOAyasstJsn9tqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhcsGmfgsMQvGTaZcyvPn+poxpq/Oh7/2ZeV6JaMPsqaHX55/VVPZ0MfC8OJ?=
 =?us-ascii?Q?ba+wtBE+b4ovZJc6dIARZyWfRrKs+5BEJwVQO2sZlDIwtS9mUS5Y2e2+iyyc?=
 =?us-ascii?Q?6GWAXBepulwQW/PQaXUgx2OkG8O3cg9befv/g3PfpGfbEWdn0rO83xR6P7Vl?=
 =?us-ascii?Q?34YvPbMYdTvMbpAMeHmYO7J6cR5pp5voBFI2KadpDExwrfO0g3pAC+dh4ZF3?=
 =?us-ascii?Q?xWAyw/wIC4+c+NqOE/QSwkRJBhqJjje+PxjYT2gEGhRKMKze36dv2H+ORCI0?=
 =?us-ascii?Q?1bK3yOgDhuHLzMPThZ+zUk/PsT6ybQhLJ7vqsveFn3LNVny6tY4D3H62Xujb?=
 =?us-ascii?Q?iaUAeLfKgyKBceg9BbuVAnhC1Pgto1iLqbHS7tpWdctUlsBSH5KHy+ZSqRVJ?=
 =?us-ascii?Q?2j9Pwxk1ttNvxPGsk7ElNhFc+W53S9D3w1vtxolBUZMLusnee6xOZiVsK45a?=
 =?us-ascii?Q?rS3j0ooJ1SIh8YOG1pyvigYBonNxUi2oKQUvRbyepAvnSS0cbj6TZOTlu8/A?=
 =?us-ascii?Q?H4Ow9CWMAIPgwh6jM5wW8PyhVln/T7G8CgnTLexSfOm7kPh9zziKy8QoQjWq?=
 =?us-ascii?Q?8WbZbpobzi0Fu8Zk/13wYA1HWn9e+PcZycpv2o4lIs9kFH9xKFuFvakpf2Tv?=
 =?us-ascii?Q?pb8gkXeKLJ7lZRruL+AB/q6CGgd+5q1TefBAWlE4Ft261C9gMArGIB5LMbJz?=
 =?us-ascii?Q?VtVlucQ4YQo+wz/OXjpvoF/RcY6LfG7ypqRSPckdphHY9Ckqh07pStxGc2xX?=
 =?us-ascii?Q?Grqbga3aZZiZ7ydeagTnNdfmjVWk9S+5ROj3LTuODk/l1ciD9gFPIghxDO2D?=
 =?us-ascii?Q?iWI3I+MvPC/hYkpdnAybVA+6cC64Y6yRZe5HfMwbDAFdHYCw5dBsVB/6uLiU?=
 =?us-ascii?Q?iOr2g8QjD4TYRsdo/QcgxEBY46Q+LhucRZ/yzJqtkQ6QMVVSDiKOcEzoHixS?=
 =?us-ascii?Q?3RhUjKsvO2XXYc9OKWJll9eZHOHypuhILyN2G8cckvcTwRXUwJk7lzYmrLn3?=
 =?us-ascii?Q?FO/M3uzUZOONjk9XZXHePo2LmPMNupMhwiDLJOFDF/oxXV3gYa8FRxnjl6Yj?=
 =?us-ascii?Q?FiI/3NAEtgexH48yXsbq4cU/3NNNcStnEQJRc6v6oPjP5zEkz1Pw20uuVbNC?=
 =?us-ascii?Q?xQfSKdduRmkxPmO16XJd6gEgtkcvYLvv47aykl7+PSrh4gxWX+LrzExEZfam?=
 =?us-ascii?Q?gEpI7X0pO32B8/20yt8YOtkZOFOytaQqU4tJZUS7ddePhUMKf9n3jhrZ0LER?=
 =?us-ascii?Q?QM2UOZk7K2o6wOMCsrPMPz/Jy6VGquLG55cCr0VIUYD+NAQeMExKODh+kX8t?=
 =?us-ascii?Q?lK83UoHSv8VrDWUDJSsc3SfrJmG4UbRo2lxGd+FyaoygQjdHL/e3TtEgW8Zk?=
 =?us-ascii?Q?frCAiDjjvcGC9cmwGuzMP7b3zX9cQ8zUqUNNRs3WwAlEdrXgNGKYjlf3SQfO?=
 =?us-ascii?Q?Ou9oUj//5PTUsVqCtOWFvOZeSoTgrLrJXvP5g1JdOTWZAUnHe4ht5ECZ1YAr?=
 =?us-ascii?Q?ytTTgLC0i5p3ZRDRT+DsIlPjtXaVEQIKfq30rJihlRbaAutNoqNqEH/bHusW?=
 =?us-ascii?Q?tPcCHu+qRvJBMHEnKNqrvAuMEEgbx7T7+nEprSWYuusR4uxErUM9U/hFkna+?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 762b82dd-c333-4b81-9e74-08dc4f5d63b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:29:30.4373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwyYFG0WRsMUojJZ0axUnCi1rllP0pSKuidPJaIKlGFiNe3e/Jq6f50jWwuj0TfKQ1x+Q58vnCQFhx3/6eYBqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6761
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

On Thu, Mar 28, 2024 at 09:13:54AM -1000, htejun@gmail.com wrote:
> Hello,
> 
> On Thu, Mar 28, 2024 at 02:02:47PM -0500, Lucas De Marchi wrote:
> > On Thu, Mar 28, 2024 at 11:21:44AM -0700, Matthew Brost wrote:
> > > Avoid sleeping or grabbing locks in work queues shared with the system.
> > > Recent changes to work queues [1] have exposed deadlocks [2] in Xe.
> 
> Can you elaborate it a bit? I'm having a bit of hard time imagining how the
> latest workqueue changes would have exposed deadlocks.
> 

Sure. Let me explain what is happening in CI failure.

The test creates 100s of exec queues that all can be preempted in
parallel. In the current code this results in each exec queue kicking a
worker which is scheduled on the system_unbound_wq, these workers wait
and sleep (using a waitqueue) on signaling from another worker. The
other worker, which is also scheduled system_unbound_wq, is processing a
queue which interacts with the GPU. I'm thinking the worker which
interacts with hardware gets straved by the waiter resulting in a
deadlock.

This patch changes the waiters to uses a device private ordered work
queue so at most we have 1 waiter a time. Regardless of the new work
queue behavior this a better design.

It is beyond my knowledge if the old behavior, albiet poorly designed,
should still work with the work queue changes in 6.9.

> > I think we need some of this information in the commit message in patch
> > 1. Because patch 1 simply says it's moving to a device private wq to
> > avoid hogging the system one, but the issue is much more serious.
> > 
> > Also, is the "Fixes:"  really correct? It seems more like a regression
> > from the wq changes and there could be other drivers showing similar
> > issues now. But it could alos be my lack of understanding of the real
> > issue.
> 
> I don't have enough context to tell whether this is a workqueue problem but
> if so we should definitely fix workqueue.
> 

It is beyond my knowledge if the old behavior, albeit poorly designed,
should still work with the work queue changes in 6.9.

Matt

> Thanks.
> 
> -- 
> tejun
