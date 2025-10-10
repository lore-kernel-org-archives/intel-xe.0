Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F10CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 15:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E702310EC4F;
	Fri, 10 Oct 2025 15:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFyhYAUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B51810EC4F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760110502; x=1791646502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SdPRP5r34V9fXRURUkSqDhO/8DoZvvCc7SugVx5gtHs=;
 b=QFyhYAUR3JNnqJDmHD9jlV5UUEsOg+4L8h1C1Bm7IfaGnvFCuxRgTKTd
 CLQ0IbLdTJTGiUiIg0k1pf9pPM2T/xPHjthGP3t6EGzV3INW9phVR4BDj
 nEETz6TPnLoDNPL7U3kmXZO0MBP7/3cyrwoaeZmAbdQRjCBhJHe50/Yd7
 2sWg8+i1M9I3I9eXuZF/RImNGh94cAtb4zIJ5U2mPHPg+riDn4nbgq/BF
 Uytf8zKNpasBm4+SRqyGxBO6pHBIgbyFNxoVFpv/23GRNN3GKGLdIW+Rf
 UCz3ALSFjjLTEEy7YnkeA10cttbG/nchP/J3AFkYpzlHvibTd6ONkIgIX Q==;
X-CSE-ConnectionGUID: Y5kWY2MRQ5mFwZ0TnoYppw==
X-CSE-MsgGUID: LhBXCBaXRhKw6O7o9y+72Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66160191"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66160191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:35:01 -0700
X-CSE-ConnectionGUID: WhgoqVVKQfqgfMdXmHbz+Q==
X-CSE-MsgGUID: NfXcobJPR26UehPkb+jYww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="185032914"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:35:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 08:35:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 08:35:00 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 08:35:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+kAN/yJLcbZy0fxfqVVf1jsk0+cEwVQWTQmj36pewLQXFuAB9yicheUeIybk+16R36PMdtFVj6y1fUUTuiMLlpilPYh4jCpD0RU8yR+SfA7ZNmM/DSl/F0YXAJK1gfnY7DtbUsYiowECCM0Rpa5CQ1oRdujKQd/0UgUbQvEoRDGPhKB7+pUVt7nz+qCrAs3q6RsCN98qT7LZtcljk6m409f/tPZOnAdFp9+bSd2K8zTsqFpcfonvEoCZadWgOmSJb6XzqPSkGeBUJS9FW47sjsCVpA4HKSot+bcMNBY1fxbLKKvAfJ3mRbHpzf60DbjmnEmzdPxZ9ZBDWcefN6d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=retOdJaH3hvGAbIUaRJlybeca/ZtUD0UkpLAWvGDuPU=;
 b=TVdRm9vgh/gGRuRKvrkfh9AzlIJ+dK43yKW5DCcH+OD/qeEjfpu76ClnALIqUSTa7HT4Srp9AvF9RgVjo+MMcJngFxrqpb3e1gNJ8Uyhwd9LTTVWrdccumfZCQP7DMeOVCvovfD+jyVtUOS8uS4nXRcae715HONF5Zxz9gbm0cNCpLd19JP08GQNHqu5o/Rsw0AUTaC6TimLbftElzzVUf1pzrlt/fMY45u+cP8bDgNTm8Ee3+fJJ6gb+zKAF96aI2Wo11XLA+3pcRIDwFyN50yG8qVqQKYIx6nP9DS83HWNNcnA+Bi+VFpTQEFgLL0NXLH9EvmL/+MT/9KUy1LdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB9474.namprd11.prod.outlook.com (2603:10b6:8:265::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 15:34:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 15:34:58 +0000
Date: Fri, 10 Oct 2025 08:34:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/6] drm/xe: Rewrite GGTT VF initialisation
Message-ID: <aOknn/V9RVs0cbDv@lstrano-desk.jf.intel.com>
References: <20251010120655.1046007-8-dev@lankhorst.se>
 <20251010120655.1046007-12-dev@lankhorst.se>
 <3f96dc8f-c1bd-427a-b24a-64e7f5877fb2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3f96dc8f-c1bd-427a-b24a-64e7f5877fb2@intel.com>
X-ClientProxiedBy: MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d176af-7b4d-4b78-8dc7-08de081291c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hir/oChiBwjzWbCqKKIQF/PVadzWOt85dSGYdC3A3lLnlIEqm/k8VuSrwnf9?=
 =?us-ascii?Q?OH0EgGMOKNwmbJnOfh02B0i85uH2hHc7QtVe3anitEWstp4X4J6vBSfdiRdu?=
 =?us-ascii?Q?Inm7m+4AtCiqBPYzSdpUuikscdk4pgoWN5sMsUls+VUbTbmvcyt501mBtzQO?=
 =?us-ascii?Q?587kP+/r2HQEZOupoot78L8mVJJfnmXZxAuOG1S2U0ROAvBq6XkvMCQ+Q6dt?=
 =?us-ascii?Q?FOw46Dh7NCJ0RCQoIehvAf9qtHePMicovelMwZQkZAP1VXW3PENcEzxF9Wmd?=
 =?us-ascii?Q?tqbi7R8RUSbY/eBKcQ0J1bl/zW8A0Z2zg2TiaxluHe7hIixSmkW4RTiknqSt?=
 =?us-ascii?Q?rdJTLwqXl00pTcS4nseLkC6nA8xxlLiSU/fwTBVknt0rZXjk2zWWrfbzB0B1?=
 =?us-ascii?Q?btHm82LceoqWOs6Gvm7pfQBYBExDZeu9eL1mXHgOYmxRiVm/+hKoybFgjGEl?=
 =?us-ascii?Q?Pev4oDOcktDICTa6A6xkTUag9CptYV4HDPZwQgmjbRoYPOBGWZycwYPgmVMr?=
 =?us-ascii?Q?UMwcPM65ifRYJUc0lY9ZioBJ5I/74z3htmnRxayapy6/HPyaYCb8OvTCAIcS?=
 =?us-ascii?Q?LHWP/p5E9mJHZqVgcsyTpXycc+TagOPH3STYBXtCq7MTk1dwE3obWrMWabjT?=
 =?us-ascii?Q?o8pMS4vXnMW6DzjwGfh6Z1WRIpaSW7be1NBweyoETQYWyslHMXFJDEGFrW3f?=
 =?us-ascii?Q?gieGezMQlBPrTwIk4zcwnv1fcoBY3AIAiGpAbqWODY9V6wahoHdPyb78iJhO?=
 =?us-ascii?Q?YzFy4u3FZP7x38By8CppuCGBTstPQKhMPdUlZ7fiB+YcZokoqYfw9IKLWuaz?=
 =?us-ascii?Q?VRH3TDAq98eX8ovB0cua5mStrxJ1V5y4raYClzjBH+6b5SjvwDmVLnO3+u7y?=
 =?us-ascii?Q?NvtAw6UJt529gVAAwhRYB3Etc2jB+q1uE8T2er5ft1hb1Ge0vkatkhGkxw7p?=
 =?us-ascii?Q?lx7xOAIZyHMMRpU+fU7AuhWOyncthfmYnxU7bKKvBCsX2MHf9QlonsboovI8?=
 =?us-ascii?Q?j0MGHR5Zd1ESf0aAeK7xflkfZcVFzUqCoB1AJv1oPG0FnJ5PEhVDFgEN0Qoj?=
 =?us-ascii?Q?61xGCI4f7piv05TRBwobeKCTuBqnbdYdsnaODAosITaWCNI5JLTsJq/icKVT?=
 =?us-ascii?Q?nMI8r03xCFtefapVKf3r2WsU2v7oKVqgvdsTpVSgX0YJOlBlKeyappIYh7uP?=
 =?us-ascii?Q?GO/AdMNwD+hBmwszAHuE3OxsQcR17t5jqrmvwaLqu1v665X2zwFv9JTP71FS?=
 =?us-ascii?Q?lERxYlVmVBOg+NGnMaofqkN5fAee1L8cKR3HKq4cdUBmyTNOguphc9EhN88G?=
 =?us-ascii?Q?qEe9hKfxkSfylFSjJQQP6BCLJjf6CvlZV/PPKaynqiR5lwla1DQl+I9h6O1U?=
 =?us-ascii?Q?tl0oTSWFMiN7bFYN+lzd1ap6nsmr9fbrA1SoznxUePve3Wt+iC5PXVu+pBkb?=
 =?us-ascii?Q?1uINOyF/KQ1kvm7bOTy6HQjP5+XkeKXj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fhw4EyU22tAIdqo+nvgZEd59m5zMsrKdgu1yGZtTwnX993XvBBToBqtRsbNa?=
 =?us-ascii?Q?aWOcVzyyd+Vs2IkcVOFzr5M9IqdLDd4h5Qy2W1KtCmP+UOuMeeuXaA+F8glM?=
 =?us-ascii?Q?UGvs7mQw8Qv+EGp/JVCrejyPdvmvMJYxf3EYbAfPmYohPcnZEwOT7E8uug4n?=
 =?us-ascii?Q?WcEder8THYtRVql2EFb7VCh00BFeAsVnjYO+pAFph9vByghyxjZiUi5mj6Sk?=
 =?us-ascii?Q?KpPMokWCxTIz+stFBQDXhtRiA3C/BpJIElc2RoVTt8kg9W6RUfLc/EpBUGX2?=
 =?us-ascii?Q?EQDxnS6A5r4SRAwLQQuo2b7s+h6TFBmYeBXionyiD7xW/tQI7L47HZWIZBud?=
 =?us-ascii?Q?9qwrhWkd+gKnPSPnVJSBseHuLSqlWIDzDf0dmKx03RXodtSDPVTFfI3S377V?=
 =?us-ascii?Q?mwZ3lzLhwNX+IFJfv2hsGszE6dqMl3rSPUkf0p9jdRbMweggH4bLMgh4VngV?=
 =?us-ascii?Q?duEHHKQdPUN+kAiTORiUlq/wqSblP2uwgzbhJrKFW92KpomaWP6N9YttqmNY?=
 =?us-ascii?Q?TVm1nupulUfDwyNBD1a/JmbUXy9np4ldTv3m/mK3KXRGZYEVrhagUNLL3MZj?=
 =?us-ascii?Q?GtKoE8v/vLOXayXMQdXVnOaMUwAAPDSOnUXSUu04bBjn5ROg2zNlZWiLoaGv?=
 =?us-ascii?Q?UIaGoMASlcqZinGGJAc1cNklKZ8AOickniwfMkhpKQk4rObzvV8bMJQysZLP?=
 =?us-ascii?Q?DpHa9OZw6cGmURntyK0kHmsxSaLHSdAyjGsPYZPW1ZW50+MhCu7UQyzVHcaU?=
 =?us-ascii?Q?RlCz7q+vIrdcc/LwC18JQ1wse10ymM8QR1ahKNLVvmOLNHWov/rfTSZwMi7E?=
 =?us-ascii?Q?ZyNCQs/q65LUXzbKpCvSIuLtSIoXRglW1/vWYUOphCIO0QLduD5bkhTvEAPM?=
 =?us-ascii?Q?RHgWeWETLL0iLrsVJZdWyqGSnOWjvjFfeujzGfmnXtdtB5jiPb1G3U2EJFqr?=
 =?us-ascii?Q?+yabxqHyr2a087VabI+jYvr5q7Bfnzb5WEdCtvTzGq87jd5VAshrNtDPcX8h?=
 =?us-ascii?Q?TuM1wOebAkhxb9gyUSfg8mBuQfR4rssXvY7tx2yBfV4C59QBy7lh0H+NAYtm?=
 =?us-ascii?Q?KkTiQV1byrWRMpyKm/+PHMH68SiGaiX41n31Dt3KjYMsB9UZNGlJ05rH84UH?=
 =?us-ascii?Q?KcU098YMjX/LtP+gc3vJdHhfan9OA2tRbfHn5Of5EyCKZjitzKONnMckIfnq?=
 =?us-ascii?Q?vanUGiXKXBsGNbnSI02MYr7m3Y/SVjxi04mX721tPmWtxbtVseOp8NtpHc5p?=
 =?us-ascii?Q?Ox/1VhATxNiD/xk0/zePhaZk73d6Yv4mE3tFD05ma8qKe6+Qpr0othJ3d9js?=
 =?us-ascii?Q?Tx2UauYQ6hNS4C8C3Fk7uYIvt/J+6ezvwsV2JNVOZYmmP19c01jAuKJ2qwoL?=
 =?us-ascii?Q?eYf6mUVsq1FKc7ImAsYtfABYAZ2xn51y9Ws+MbQW5LJCzJlN1t2mmGC29wp9?=
 =?us-ascii?Q?WMw1l5rft2hs8cXMQ6MIdbbNiII6bUv3aOfSEFAZJoJ28WF16JAt06Yfr+B5?=
 =?us-ascii?Q?c/bV4WcRw3oQsP9yNDvMQ6ULkAUUXQOPVn777I9uBO+wmXOtOMKZ4agEs0SU?=
 =?us-ascii?Q?lzPZ1//Zs+9qZaBfquUlax054572tuRreMOpkPxWLU+l3XiPuRbRlKZ7CxWS?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d176af-7b4d-4b78-8dc7-08de081291c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:34:58.5933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01+XyDyUlcin88Db5aDcXbV2sVcD0Vvksd7UT2/kuXVzoPFbOlkWYDwGIPl5s+fgjtft7UjCr1PzPuwCAHTjuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9474
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

On Fri, Oct 10, 2025 at 05:00:01PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/10/2025 2:07 PM, Maarten Lankhorst wrote:
> > The previous code was using a complicated system with 2 balloons to
> > set GGTT size and adjust GGTT offset. While it works, it's overly
> > complicated.
> 
> for the record:
> 
> our previous attempts to make GGTT allocations 0-based where simply NAK'ed
> so there was no other option that going with the ballooning
> 

I pulled this code yesterday and everything seemed to work.

> > 
> > A better approach is to set the offset and size when initialising GGTT,
> > this removes the need for adding balloons. The resize function only
> > needs to re-initialise GGTT at the new offset.
> > 
> > We use the newly created drm_mm_shift to shift the nodes.
> 
> by keeping start at xe_ggtt level that could be even not needed 
> 
> > 
> > This removes the need to manipulate the internals of xe_ggtt outside
> > of xe_ggtt, and cleans up a lot of now unneeded code.
> > 
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > This patch has been rebased by Matthew Brost,
> > with some final fixups by Maarten to remove
> > the use of ggtt->mutex, and all references to the balloons.
> > 
> >  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   2 +-
> >  drivers/gpu/drm/xe/xe_device_types.h        |   2 -
> >  drivers/gpu/drm/xe/xe_ggtt.c                | 143 +++-----------
> >  drivers/gpu/drm/xe/xe_ggtt.h                |   5 +-
> >  drivers/gpu/drm/xe/xe_ggtt_types.h          |   4 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   5 +-
> >  drivers/gpu/drm/xe/xe_tile.c                |  18 ++
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 197 ++------------------
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   4 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |   4 +
> >  10 files changed, 69 insertions(+), 315 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > index d266882adc0e0..acddbedcf17cb 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > @@ -67,7 +67,7 @@ static int guc_buf_test_init(struct kunit *test)
> >  
> >  	KUNIT_ASSERT_EQ(test, 0,
> >  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> > -					   DUT_GGTT_START + DUT_GGTT_SIZE));
> > +					   DUT_GGTT_SIZE));
> >  
> >  	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
> >  				   replacement_xe_managed_bo_create_pin_map);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 02c04ad7296e4..a05164cc669f9 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -192,8 +192,6 @@ struct xe_tile {
> >  			struct xe_lmtt lmtt;
> >  		} pf;
> >  		struct {
> > -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> > -			struct xe_ggtt_node *ggtt_balloon[2];
> >  			/** @sriov.vf.self_config: VF configuration data */
> >  			struct xe_tile_sriov_vf_selfconfig self_config;
> >  		} vf;
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 1fcb128e661b6..cd4b62303e0ec 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -274,7 +274,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >  	unsigned int gsm_size;
> >  	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
> > -	int err;
> >  
> >  	if (!IS_SRIOV_VF(xe)) {
> >  		if (GRAPHICS_VERx100(xe) >= 1250)
> > @@ -288,9 +287,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  		ggtt_start = wopcm;
> >  		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
> >  	} else {
> > -		/* GGTT is expected to be 4GiB */
> > -		ggtt_start = wopcm;
> > -		ggtt_size = SZ_4G - ggtt_start;
> > +		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> > +		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> > +
> > +		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
> > +		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
> > +			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> > +				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);
> > +			return -ERANGE;
> > +		}
> >  	}
> >  
> >  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> > @@ -311,17 +316,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
> >  	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> >  
> > -	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> > -	if (err)
> > -		return err;
> > -
> > -	if (IS_SRIOV_VF(xe)) {
> > -		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
> > -		if (err)
> > -			return err;
> > -	}
> > -
> > -	return 0;
> > +	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> >  }
> >  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
> >  
> > @@ -473,83 +468,8 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> >  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> >  }
> >  
> > -static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> > -			      const struct drm_mm_node *node, const char *description)
> > -{
> > -	char buf[10];
> > -
> > -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > -		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> > -		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
> > -			    node->start, node->start + node->size, buf, description);
> > -	}
> > -}
> > -
> >  /**
> > - * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
> > - * @node: the &xe_ggtt_node to hold reserved GGTT node
> > - * @start: the starting GGTT address of the reserved region
> > - * @end: then end GGTT address of the reserved region
> > - *
> > - * To be used in cases where ggtt->lock is already taken.
> > - * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
> > - *
> > - * Return: 0 on success or a negative error code on failure.
> > - */
> > -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
> > -{
> > -	struct xe_ggtt *ggtt = node->ggtt;
> > -	int err;
> > -
> > -	xe_tile_assert(ggtt->tile, start < end);
> > -	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
> > -	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> > -	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> > -	lockdep_assert_held(&ggtt->lock);
> > -
> > -	node->base.color = 0;
> > -	node->base.start = start;
> > -	node->base.size = end - start;
> > -
> > -	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> > -
> > -	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> > -			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> > -		return err;
> > -
> > -	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> > -	return 0;
> > -}
> > -
> > -/**
> > - * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
> > - * @node: the &xe_ggtt_node with reserved GGTT region
> > - *
> > - * To be used in cases where ggtt->lock is already taken.
> > - * See xe_ggtt_node_insert_balloon_locked() for details.
> > - */
> > -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
> > -{
> > -	if (!xe_ggtt_node_allocated(node))
> > -		return;
> > -
> > -	lockdep_assert_held(&node->ggtt->lock);
> > -
> > -	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
> > -
> > -	drm_mm_remove_node(&node->base);
> > -}
> > -
> > -static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> > -{
> > -	struct xe_tile *tile = ggtt->tile;
> > -
> > -	xe_tile_assert(tile, start >= ggtt->start);
> > -	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
> > -}
> > -
> > -/**
> > - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> > + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
> >   * @ggtt: the &xe_ggtt struct instance
> >   * @shift: change to the location of area provisioned for current VF
> >   *
> > @@ -563,29 +483,22 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> >   * the list of nodes was either already damaged, or that the shift brings the address range
> >   * outside of valid bounds. Both cases justify an assert rather than error code.
> >   */
> > -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> > +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
> >  {
> > -	struct xe_tile *tile __maybe_unused = ggtt->tile;
> > -	struct drm_mm_node *node, *tmpn;
> > -	LIST_HEAD(temp_list_head);
> > +	s64 new_start;
> >  
> > -	lockdep_assert_held(&ggtt->lock);
> > +	if (!ggtt->size) {
> > +		xe_tile_err(ggtt->tile, "Asked to resize before xe_ggtt_init_early()?\n");
> 
> that's should be xe_assert()
> 
> or our VF init flow is broken
> 
> > +		return;
> > +	}
> >  
> > -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> > -		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> > -			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> > +	guard(mutex)(&ggtt->lock);
> >  
> > -	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> > -		drm_mm_remove_node(node);
> > -		list_add(&node->node_list, &temp_list_head);
> > -	}
> > +	new_start = ggtt->start + shift;
> > +	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> > +	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
> >  
> > -	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> > -		list_del(&node->node_list);
> > -		node->start += shift;
> > -		drm_mm_reserve_node(&ggtt->mm, node);
> > -		xe_tile_assert(tile, drm_mm_node_allocated(node));
> > -	}
> > +	drm_mm_shift(&ggtt->mm, shift);
> >  }
> >  
> >  /**
> > @@ -637,11 +550,9 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
> >   * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
> >   *
> >   * This function will allocate the struct %xe_ggtt_node and return its pointer.
> > - * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> > - * or xe_ggtt_node_remove_balloon_locked().
> > + * This struct will then be freed after the node removal upon xe_ggtt_node_remove().
> >   * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> > - * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> > - * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
> > + * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
> >   *
> >   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
> >   **/
> > @@ -662,9 +573,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> >   * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
> >   * @node: the &xe_ggtt_node to be freed
> >   *
> > - * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> > - * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
> > - * this function needs to be called to free the %xe_ggtt_node struct
> > + * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> > + * not going to be reused, then this function needs to be called to free the
> > + * %xe_ggtt_node struct
> >   **/
> >  void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index 6482bddb2ef36..eccef2d2b3cee 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -19,10 +19,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
> >  
> >  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
> >  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> > -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> > -				       u64 start, u64 size);
> > -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> > -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> > +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
> >  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
> >  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > index a27919302d6b2..b659ffc612269 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > @@ -57,8 +57,8 @@ struct xe_ggtt {
> >   * struct xe_ggtt_node - A node in GGTT.
> >   *
> >   * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
> > - * insertion, reservation, or 'ballooning'.
> > - * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
> > + * insertion or reservation.
> > + * It will, then, be finalized by either xe_ggtt_node_remove().
> >   */
> >  struct xe_ggtt_node {
> >  	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 46518e629ba36..dd3cd7f140cd1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -442,7 +442,6 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
> >  static int vf_get_ggtt_info(struct xe_gt *gt)
> >  {
> >  	struct xe_tile *tile = gt_to_tile(gt);
> > -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	u64 start, size, ggtt_size;
> >  	s64 shift;
> > @@ -450,7 +449,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	guard(mutex)(&ggtt->lock);
> > +	guard(mutex)(&tile->sriov.vf.self_config.ggtt_move_mutex);
> 
> maybe instead we should just get a ggtt info *only* from the primary GT ?
> 
> and use GT-level lock only ?
> 

See below that doesn't work, and IMO out of scope.

Maybe a helper in xe_tile_sriov_vf.h that returns mutex * though as I
got feedback to not reach into other layer structures.

> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> >  	if (unlikely(err))
> > @@ -480,7 +479,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  	if (shift && shift != start) {
> >  		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
> >  				 shift, start);
> > -		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
> > +		xe_ggtt_shift_nodes(tile->mem.ggtt, shift);
> >  	}
> >  
> >  	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 6edb5062c1da5..be3900681b6d8 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -17,6 +17,7 @@
> >  #include "xe_sa.h"
> >  #include "xe_svm.h"
> >  #include "xe_tile.h"
> > +#include "xe_tile_sriov_vf.h"
> >  #include "xe_tile_sysfs.h"
> >  #include "xe_ttm_vram_mgr.h"
> >  #include "xe_wa.h"
> > @@ -157,6 +158,12 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> >  	if (err)
> >  		return err;
> >  
> > +	if (IS_SRIOV_VF(xe)) {
> > +		err = xe_tile_sriov_vf_init(tile);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	tile->primary_gt = xe_gt_alloc(tile);
> >  	if (IS_ERR(tile->primary_gt))
> >  		return PTR_ERR(tile->primary_gt);
> > @@ -201,6 +208,17 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> >  	return xe_tile_sysfs_init(tile);
> >  }
> >  
> > +/**
> > + * xe_tile_init - Initialize the remainder of the tile.
> > + * @tile: The tile to initialize.
> > + *
> > + * This function is used for all tile initialization calls that may allocate memory.
> > + *
> > + * Note that since this is tile initialization, it should not perform any
> > + * GT-specific operations, and thus does not need to hold GT forcewake.
> > + *
> > + * Returns: 0 on success, negative error code on error.
> > + */
> 
> nice, but since you are not touching xe_tile_init() in this patch, its kernel-doc should be added in separate patch
> 
> >  int xe_tile_init(struct xe_tile *tile)
> >  {
> >  	int err;
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > index c9bac2cfdd044..d1fa46e268350 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > @@ -14,173 +14,12 @@
> >  #include "xe_tile_sriov_vf.h"
> >  #include "xe_wopcm.h"
> >  
> > -static int vf_init_ggtt_balloons(struct xe_tile *tile)
> > -{
> > -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> > -
> > -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > -
> > -	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> > -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> > -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> > -
> > -	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> > -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> > -		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> > -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -/**
> > - * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> > - * @tile: the &xe_tile struct instance
> > - *
> > - * Return: 0 on success or a negative error code on failure.
> > - */
> > -static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> > -{
> > -	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> > -	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
> > -	struct xe_device *xe = tile_to_xe(tile);
> > -	u64 wopcm = xe_wopcm_size(xe);
> > -	u64 start, end;
> > -	int err;
> > -
> > -	xe_tile_assert(tile, IS_SRIOV_VF(xe));
> > -	xe_tile_assert(tile, ggtt_size);
> > -	lockdep_assert_held(&tile->mem.ggtt->lock);
> > -
> > -	/*
> > -	 * VF can only use part of the GGTT as allocated by the PF:
> > -	 *
> > -	 *      WOPCM                                  GUC_GGTT_TOP
> > -	 *      |<------------ Total GGTT size ------------------>|
> > -	 *
> > -	 *           VF GGTT base -->|<- size ->|
> > -	 *
> > -	 *      +--------------------+----------+-----------------+
> > -	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> > -	 *      +--------------------+----------+-----------------+
> > -	 *
> > -	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> > -	 */
> > -
> > -	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
> > -	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
> > -		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> > -			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
> > -		return -ERANGE;
> > -	}
> > -
> > -	start = wopcm;
> > -	end = ggtt_base;
> > -	if (end != start) {
> > -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> > -							 start, end);
> > -		if (err)
> > -			return err;
> > -	}
> > -
> > -	start = ggtt_base + ggtt_size;
> > -	end = GUC_GGTT_TOP;
> > -	if (end != start) {
> > -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> > -							 start, end);
> > -		if (err) {
> > -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> > -			return err;
> > -		}
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -static int vf_balloon_ggtt(struct xe_tile *tile)
> > -{
> > -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> > -	int err;
> > -
> > -	mutex_lock(&ggtt->lock);
> > -	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> > -	mutex_unlock(&ggtt->lock);
> > -
> > -	return err;
> > -}
> > -
> > -/**
> > - * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> > - * @tile: the &xe_tile struct instance
> > - */
> > -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
> > -{
> > -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > -
> > -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> > -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> > -}
> > -
> > -static void vf_deballoon_ggtt(struct xe_tile *tile)
> > -{
> > -	mutex_lock(&tile->mem.ggtt->lock);
> > -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> > -	mutex_unlock(&tile->mem.ggtt->lock);
> > -}
> > -
> > -static void vf_fini_ggtt_balloons(struct xe_tile *tile)
> > -{
> > -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > -
> > -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> > -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> > -}
> > -
> > -static void cleanup_ggtt(struct drm_device *drm, void *arg)
> > -{
> > -	struct xe_tile *tile = arg;
> > -
> > -	vf_deballoon_ggtt(tile);
> > -	vf_fini_ggtt_balloons(tile);
> > -}
> > -
> > -/**
> > - * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> > - * @tile: the &xe_tile
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: 0 on success or a negative error code on failure.
> > - */
> > -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> > -{
> > -	struct xe_device *xe = tile_to_xe(tile);
> > -	int err;
> > -
> > -	err = vf_init_ggtt_balloons(tile);
> > -	if (err)
> > -		return err;
> > -
> > -	err = vf_balloon_ggtt(tile);
> > -	if (err) {
> > -		vf_fini_ggtt_balloons(tile);
> > -		return err;
> > -	}
> > -
> > -	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> > -}
> > -
> >  /**
> >   * DOC: GGTT nodes shifting during VF post-migration recovery
> >   *
> >   * The first fixup applied to the VF KMD structures as part of post-migration
> >   * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
> >   * from range previously assigned to this VF, into newly provisioned area.
> > - * The changes include balloons, which are resized accordingly.
> > - *
> > - * The balloon nodes are there to eliminate unavailable ranges from use: one
> > - * reserves the GGTT area below the range for current VF, and another one
> > - * reserves area above.
> >   *
> >   * Below is a GGTT layout of example VF, with a certain address range assigned to
> >   * said VF, and inaccessible areas above and below:
> > @@ -198,10 +37,6 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> >   *
> >   *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> >   *
> > - * GGTT nodes used for tracking allocations:
> > - *
> > - *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> > - *
> >   * After the migration, GGTT area assigned to the VF might have shifted, either
> >   * to lower or to higher address. But we expect the total size and extra areas to
> >   * be identical, as migration can only happen between matching platforms.
> > @@ -219,35 +54,27 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> >   * So the VF has a new slice of GGTT assigned, and during migration process, the
> >   * memory content was copied to that new area. But the &xe_ggtt nodes are still
> >   * tracking allocations using the old addresses. The nodes within VF owned area
> > - * have to be shifted, and balloon nodes need to be resized to properly mask out
> > - * areas not owned by the VF.
> > - *
> > - * Fixed &xe_ggtt nodes used for tracking allocations:
> > + * have to be shifted, and the start offset for GGTT adjusted.
> >   *
> > - *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> > - *
> > - * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> > + * Due to use of GPU profiles, we do not expect the old and new GGTT areas to
> >   * overlap; but our node shifting will fix addresses properly regardless.
> >   */
> >  
> >  /**
> > - * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
> > - * @tile: the &xe_tile struct instance
> > - * @shift: the shift value
> > + * xe_tile_sriov_vf_init - Init tile specific GGTT configuration.
> > + * @tile: the &xe_tile
> >   *
> > - * Since Global GTT is not virtualized, each VF has an assigned range
> > - * within the global space. This range might have changed during migration,
> > - * which requires all memory addresses pointing to GGTT to be shifted.
> > + * This function is for VF use only.
> > + *
> > + * Return: 0 on success, negative value on error.
> >   */
> > -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
> > +int xe_tile_sriov_vf_init(struct xe_tile *tile)
> >  {
> > -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> > +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> >  
> > -	lockdep_assert_held(&ggtt->lock);
> > +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> >  
> > -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> > -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> > -	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> > +	return drmm_mutex_init(&tile->xe->drm, &config->ggtt_move_mutex);
> >  }
> >  
> >  /**
> > @@ -312,6 +139,7 @@ void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size)
> >  	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> >  
> >  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > +	lockdep_assert_held(&config->ggtt_move_mutex);
> >  
> >  	config->ggtt_size = ggtt_size;
> >  }
> > @@ -345,6 +173,7 @@ void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
> >  	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> >  
> >  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > +	lockdep_assert_held(&config->ggtt_move_mutex);
> >  
> >  	config->ggtt_base = ggtt_base;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > index 749f41504883c..1ca5bc87963f0 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > @@ -10,9 +10,7 @@
> >  
> >  struct xe_tile;
> >  
> > -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> > -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> > -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
> > +int xe_tile_sriov_vf_init(struct xe_tile *tile);
> >  u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
> >  void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
> >  u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > index 4807ca51614cf..2cbbc51c101d4 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> > @@ -7,11 +7,15 @@
> >  #define _XE_TILE_SRIOV_VF_TYPES_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/mutex.h>
> >  
> >  /**
> >   * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
> >   */
> >  struct xe_tile_sriov_vf_selfconfig {
> > +	/** @ggtt_move_mutex: Prevents multiple movements from happening in parallel */
> > +	struct mutex ggtt_move_mutex;
> 
> a) if we correctly get GGTT only from primary GT, then there should be no parallel updates ever

This is not correct. On dGPU the migration recovery worker runs a per-GT
workqueue - the GGTT query + shift needs to serialized between the two
workqueues, hence the need for a lock here. Ofc we could blindly make
all VFs which support migration share the GT workqueue like we do for
iGPU and could drop this lock. I believe that is out of scope of this
series though.

Matt 

> b) if still needed maybe make this mutex more generic to protect all tile-level VF config
> or even make it top-level to protect all VF config ?
> 
> > +
> >  	/** @ggtt_base: assigned base offset of the GGTT region. */
> >  	u64 ggtt_base;
> >  	/** @ggtt_size: assigned size of the GGTT region. */
> 
