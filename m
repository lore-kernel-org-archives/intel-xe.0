Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265B9D7879B
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 17:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF010EA03;
	Thu, 21 Nov 2024 17:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apbA+dbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEECE10EA03
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209845; x=1763745845;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TmJ8ix3qgn06x1464ScB7+/YoepwFBpHwsPvfYCil8M=;
 b=apbA+dbEmt9ITbg5GMtv56Mb6emM3vhbQJGcy15+w+FAnwMIJLDxx8Hv
 aluJHcxJR6YJXEzMqnwCbWT0wle6STdgbAae6ws10XYUvXUzNa8iidypE
 0PunL+vlnYAJISFQJKfj+VEZ8DVKbTOtPFLtmy651IbSIdXQG+o5xy0kb
 JdVZvepjzewzt2jmShQW4xijgZNN5MbYQHrpk806QLSvFpSqV9028MGhw
 yB2Z1QNs9XXKWKnoTT8VNXHWkxmPi9QMHxZea0Ap73vIE/0iFz5N8CqV3
 YViMJ7d6Pz554FKG28DZVw6fNM0oXEJnHvoURFfZ51PcyWtnQg/JLfpJ8 A==;
X-CSE-ConnectionGUID: XBTskdLERCCUFOBPGle/Aw==
X-CSE-MsgGUID: hD3KwliZSk2yj1F3cvhSdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32194765"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32194765"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:24:05 -0800
X-CSE-ConnectionGUID: qgWZflfZRw2Ppc+hUpvIZw==
X-CSE-MsgGUID: WGnINcQjTV+7IUx6F4xFXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90480715"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 09:24:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 09:24:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 09:24:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 09:24:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwFvDiSFyoGLCjzfY3nXls97fpk61Wq+yemdfSmXnLipSz9Zk2Kj4feBXkDMTju7AXhdbwMI657Kgfk3QawzTT4Isr/I3VU/ANyKq4VYzivi0+Y5owsQXQGE7wp9BBtUgIAMW2j52Vk1SeXOY0u/YrXAJmcjqnTrReUPr5ZGtmP58DK9mAGI3wqy/XQF5jaRUhJDR7q0HaIRmjl1ABeB9sGOtnxtNFlDBZ4qlJa3+yk7bu3GIQwo56oFLT97ZjoeOwKfskSCh24tF/+Ghckx9H9zYJxo8Pbat0UR94VIK8xGcxlRynYBMfqd9Yl3Wx1+KMoyHMDlhEStS1Ue4S1RrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YKGNiLVvFklncO0XGeCTOB7FewitL0gQeYuaa6wHnY=;
 b=GtQra9577eWRvcZSX+saJtz8tEAcbSCk2d473UAT5e0WkcgZXod6C+SbbpM5kMIu3xlAAJLkXc02EhyKBPUvNYpmkSeValBxYmUYYjrymMw8fI/WiGzxd2/PGXwMcYrqUjYzBB8F+EdS3yrefJXZkWIT6VtqdowopA8mI8OMG1kkpisiYQNgzQ67sBAAYymOSfMlAmAzJi2yHFSBg1+jnd/Tg4zKTgJt1w4E1Eb89Vak8Tagd5WgSw/JtO6EORDWjM48j7f0hbW5KgnnnLXL2hvSqMDmy3EmVSpVL3y3XkPzXTvTzxWKaxo4aIA/d7NKvWPZdE29vRHlGr8nKyx5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 17:24:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 17:24:01 +0000
Date: Thu, 21 Nov 2024 09:24:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Add lock around devcoredump capture status
Message-ID: <Zz9s1QINdIZyco1A@lstrano-desk.jf.intel.com>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-3-John.C.Harrison@Intel.com>
 <Zz6pPI/q0hfTfZ3/@lstrano-desk.jf.intel.com>
 <4bc83b58-8f52-47da-a8da-96d8ad6cfeb5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bc83b58-8f52-47da-a8da-96d8ad6cfeb5@intel.com>
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: b4503043-7221-4a22-eec8-08dd0a514a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SiBKsxu2pCBagCt6KhZSRqMBN6fepRiK3TpDYTNOvJjQYg/SaKxtKRxTiU?=
 =?iso-8859-1?Q?0dfoDHZyBwljQ0gQfOJhBfmqPnysfgj+6yv8vgobREL2XRHX1d0FkctgXp?=
 =?iso-8859-1?Q?w5GTqrhwO2HWB/90+1Btj4WUuwh+jh5JLPJ0UHQraze5PKLTdghXiTB0q9?=
 =?iso-8859-1?Q?u9GKKTPMToo4+t6fDFwgWtMnIF1fumf1Oy0GPelwzAs/51bKrPs0I6z/2J?=
 =?iso-8859-1?Q?EjK1VT/Z2Jwe26c/SQfofwQL1T5ASUP4EaRV39blvNrbYmrJi/KsxrHV1G?=
 =?iso-8859-1?Q?lKbZG8yBTpzNNHWf5BOMl0DRXjhOdot8sMcjfCkXXZHObM9bedMtFNSWOg?=
 =?iso-8859-1?Q?V+Uvk6qu/YBdbrwHyzSqn1WsLnAWUao7bsC6NUrIa1T0okpX/vL8+LNBg7?=
 =?iso-8859-1?Q?n+KVJrv99+wPHZxqCSpKCN7j6Y0BEEyCO9b+RlwW9/yV7axaNVvrAGN+PE?=
 =?iso-8859-1?Q?PkA6Md6jui9dRyQIiahggVTTPEmklpwDKUePVTLDxCUz5VA8J3sY5zoIN6?=
 =?iso-8859-1?Q?P4ZN1pbMO8d4oG5/BNoXyDGkzo/96ONZtXqJqazY2DQEJ/83quHBOHIoi6?=
 =?iso-8859-1?Q?lvKdhur01oyKLM6qwX08gwVKillKgr4unZqTf8OEZdpRw1ksOLigaH+On8?=
 =?iso-8859-1?Q?FY8SkmeBp8/kgQexdfYS1e95sRLumxszfuVLXZvG6mCVtkVlXZU22wUclS?=
 =?iso-8859-1?Q?IpZosyEtvaaYSQnS0GbGn6ZTxuDJLJiH3omcn81Pw25tNH17ygPSMU0UVx?=
 =?iso-8859-1?Q?qPXP+mXuB6H775RIPRBSNaO7AO+7NIxQvV+QvYJzYXV0EgIrCkqyBNKs+p?=
 =?iso-8859-1?Q?z6ruhsPE/np2EqU2Yqwcdoej+58wMfYY6nSvlMKsW6N3SMljHEWPak/lkz?=
 =?iso-8859-1?Q?lpoNUxLuW9GUuzhQYj4YyxoUnH/bUQTXT68R0czh9HUsaww/89Y/VKswSq?=
 =?iso-8859-1?Q?UvAAAvH6Ntt+AkmP0U/07VQzx1541x88xHPy3uH0yeHGFUltQxp/JXbCTf?=
 =?iso-8859-1?Q?0hPZAjIExalaJ7Dl6QOgSkfodSzbyyFBQxE+TO5Q9hEvDlcRciwysxjsfq?=
 =?iso-8859-1?Q?UcaP3Koa4KW8OTfx6AAVdsIoPhyKZEO6c8KSjSUsp24UPZx3HR7XECg3AT?=
 =?iso-8859-1?Q?OOTZv4wzjd950ptdasTOtCUH5tj/8zKyFeTwRuwkJsHjgi/Vn+/O0tJVuc?=
 =?iso-8859-1?Q?/6Z2zCZ3i2vgtyvdvIOgTDqCQwiWAJOkR0v0IFOnUTPeVG2XsJBxBm4a60?=
 =?iso-8859-1?Q?a6waYfaT71Uc7ky2wmKSBbHSCbL2mgVPXP9JMN4OS0Hz4D89MK5YFvgrwp?=
 =?iso-8859-1?Q?+h0p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JCowYwnq5xel6BEdLOl16R6UISdIkfY9qPKU1GLHSZ+BSVSZpHR11Uj5f/?=
 =?iso-8859-1?Q?Dy1aAml0EwRx/AoDgmXc7i5whdhKTZKenioouWYhS/5ViRSpy2xBEGMarB?=
 =?iso-8859-1?Q?NiRVlpt9gm12v1QXbkI2mwRgfIBIhKCntvp0lAqMV+khqtiYKC+cWjh1qP?=
 =?iso-8859-1?Q?5wglbwufM9Tn96cyMWmTZ9JU+HKXVRoCGQ1TrPeC+q1cgqhw3uC1Q2VAbA?=
 =?iso-8859-1?Q?3fB4NhTdPfrVkT2qkgQK7Hj7Fid7yHsHGPlHfKqbnlNyB0vZDTJu1D7IwA?=
 =?iso-8859-1?Q?iv35ICYO/xpiOlmeORbPf57KFxp535a9ECK5R9/YI2+Nfbr2CgeLa94Mfv?=
 =?iso-8859-1?Q?tL4skJn16daa9EUpzJDIyFA5cx3vZFlhS6nl/Hxt7MFOGgRG0VsJZaTGWM?=
 =?iso-8859-1?Q?7VE0jF7+r5ebnLYqD+El1afrlrktZRBV5yKV6WKSjXe4ugHpc/7np6dJrY?=
 =?iso-8859-1?Q?LkQTO5ZvnY5akm7rrSW/dKazyM3JXOQMRV4gCjYV/OIbewk60//NUpWMUz?=
 =?iso-8859-1?Q?mhBriw+RnuDvjuvAjPQ/jS0dsq5+38Jdk+/o3z4uvDcSAiUhs8SelWYuD3?=
 =?iso-8859-1?Q?8MV7hHGMuJ09BRIqbgIp2SeCMxat80cB4cVKMcLeJ5Qavi8gaP+BwiUzUS?=
 =?iso-8859-1?Q?4rQeogYc2N98aWR0AIlT5FIQgjwU30CLnMl+XSGLgcwD3qBRue0NZ6drPm?=
 =?iso-8859-1?Q?8DP0MX0aUMc1lofRP3dJeRcMuCZEtoME+cTfLFV7/IfUD1S7NaScvzBqvE?=
 =?iso-8859-1?Q?HP3b8rhcdrZtKfON/bSGj/HByIZtP63G22dDpKVeAip1kHmvrRZIZVC2ol?=
 =?iso-8859-1?Q?1WFFl5lAK8lhdCUr9kLpTPsSqizxf9jTIDzWnmUnafp322zelRlAKDnjzo?=
 =?iso-8859-1?Q?y4rcaz+HupodptBTKi49yxH4QwmToU4rD/Ol2bZCawlw5ywuzov9OkPnQ9?=
 =?iso-8859-1?Q?O7eMm7Q2hmoipefy9heF1fK5Utbp7SwOZKt4xB9gkzjDqNp4TzQLxv81+V?=
 =?iso-8859-1?Q?FtfZoOtnRZA0HEMyCQ/JE7M5nVGJVGFpSslFCRuE6pcsgW7uTwCheYXOp8?=
 =?iso-8859-1?Q?AYDfpqx4Xz9lEkI44jHuMuB1X41u/NxJwgkLRt6pv22sd8rsoUNDSKV9fI?=
 =?iso-8859-1?Q?KGTYkfxCJitUpq4VCB0w37HhM5TAlWaTjDM1beaw4IWLhdZz0VMbAFfE1B?=
 =?iso-8859-1?Q?hnzqZFlcCpt8hQ7o2hUmKgLlpyFMzzi0/UdTjF0WSdsa5fyZmpS+NxmO7e?=
 =?iso-8859-1?Q?jTps3hyrlL1OEDNrzEH6xg3qKAMTz382V5Nfg1yurgcXTPRWg830s3OZyG?=
 =?iso-8859-1?Q?pvPAquh0hheQRnLiHQHzhQL1NKqtoO7c0P08NaP5ba+VRHZSj6KnWK4N73?=
 =?iso-8859-1?Q?ouvgeQRsIe3okq2Rzbqhm36ANpJY7oj3ZxmYp8rUVfy02DOWAVq4rb9Njt?=
 =?iso-8859-1?Q?SgzMOCZvkJvI6m19QKsrKAhtIojTmZ3xxNwJqC/fp6NHfXbmuu6nDxCuUk?=
 =?iso-8859-1?Q?DXT61IzPSqxyrU3NY+AdnkujclVbcq6Bl1Ysn2C0mYuNPKb51Dm7JzwMD8?=
 =?iso-8859-1?Q?YN1HH4PxZkK83GseUHPD21d58x+GRE2r+nMRyL7Zpn+bZvjSqyjjoR0GiJ?=
 =?iso-8859-1?Q?dUxE6BwszxvVXGRIV9dXy1vjqGjqC6CJfBdyg7EayXEMhDsKdqzKXpaA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4503043-7221-4a22-eec8-08dd0a514a6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:24:01.5655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vrf2MgAslnAW9WKB5sIEc7f6UGQpeEtSjOVU8mJYGD4DXu4fFjXaacUu027TDLA71dJgv1iU2ZGwUzQZynQlCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
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

On Thu, Nov 21, 2024 at 08:56:19AM -0800, John Harrison wrote:
> On 11/20/2024 19:30, Matthew Brost wrote:
> > On Wed, Nov 20, 2024 at 03:22:57PM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > There are now multiple places that can trigger a coredump. Some of
> > > which can happen in parallel. There is already a check against
> > > capturing multiple dumps sequentially, but without locking it doesn't
> > > guarantee to work against concurrent dumps. And if two dumps do happen
> > > in parallel, they can end up doing Bad Things such as one call stack
> > > freeing the data the other call stack is still processing. Which leads
> > > to a crashed kernel. So add the lock.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_devcoredump.c       | 18 ++++++++++++++----
> > >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
> > >   2 files changed, 16 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index b5aebe8fb06d..05f3c9185ef3 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -235,9 +235,13 @@ static void xe_devcoredump_free(void *data)
> > >   	/* To prevent stale data on next snapshot, clear everything */
> > >   	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
> > > -	coredump->captured = false;
> > > +
> > >   	drm_info(&coredump_to_xe(coredump)->drm,
> > >   		 "Xe device coredump has been deleted.\n");
> > > +
> > > +	spin_lock_irq(&coredump->lock);
> > > +	coredump->captured = false;
> > > +	spin_unlock_irq(&coredump->lock);
> > I don't think you need the IRQ version here, or in the other usage. I
> > don't believe in either case here we are in IRQ contexts, or if we were
> > one of the cases would use spin_lock (already in an IRQ context) and
> > the other would use spin_lock_irq (not in an IRQ context but another
> > case can be). Certainly taking spin_lock_irq in all use cases of a lock
> > seems unnecessary.
> Yeah, that was a copy/paste that I was meaning to go back and update as
> necessary but evidently forgot to.
> 
> > 
> > Is there some follow on patches where this changes?
> There will be. Still more re-work to be done for the GT targetted capture
> support.
> 
> > 
> > Adding the lock seems right though and should enable coredumps on
> > multi-GT or from which are not the GT ordered WQ.
> Yeah, with the capture on GT reset I was hitting the race and got a very
> dead kernel a couple of times (because there were parallel captures for the
> same failure - one via GT reset and one via DRM timeout). Not sure if it is
> possible to hit with the current job specific captures but I don't see why
> not. If you had parallel independent hangs on both GTs of a multi-GT system
> then it seems like it would still go bang. Just much harder to hit.
> 

Agree this is certainly possible to hit.

> > 
> > Maybe also add helpers like...
> > 
> > void xe_devcoredump_release()
> > {
> > 	spin_lock(&coredump->lock);
> > 	coredump->captured = false;
> > 	spin_unlock(&coredump->lock);
> > }
> > 
> > bool xe_devcoredump_acquire();
> > {
> > 	bool acquired;
> > 
> > 	spin_lock(&coredump->lock);
> > 	acquired = !coredump->captured;
> > 	coredump->captured = true;
> > 	spin_unlock(&coredump->lock);
> > 
> > 	return acquired;
> > }
> > 
> > IMO - this makes this locking semantic a bit more clear.
> Not convinced. There are exactly one places where each of these functions
> would be used. And acquire/release doesn't seem like the right terminology
> to me. Especially when the release is from a totally different call path.
> The 'acquire' is an internally triggered thing by the driver but the
> 'release' is in response to a sysfs write from the user. The intent is
> really just alloc and free but for a singleton entity so there can only ever
> be one instance at a time.  However, the above code is not the actual
> alloc/free so calling it that would be wrong.
> 

This comment is more about having a locking semantic that protects code
paths rather than data. I think having a helper makes this part more
palatable.

However, now that I've written this, maybe it's better to just use a
single large mutex that is held across xe_devcoredump,
xe_devcoredump_free, and xe_devcoredump_read. Looking at the code, I'm
pretty sure that xe_devcoredump_free and xe_devcoredump_read can race,
with xe_devcoredump_read possibly dereferencing a NULL pointer in
read.buffer. This mutex would also need to be primed with reclaim, so I
guess it wouldn't be held in flush_work(&ss->work) or
cancel_work_sync(&coredump->snapshot.work), but everywhere else in the
aforementioned functions.

Do you think that would work? If so, it seems cleaner and would adhere
to Sima's locking guidelines [1].

Matt

[1] https://blog.ffwll.ch/2022/07/locking-engineering.html

> The implementation is more about back-off-when-busy than regular mutex
> locking. It could potentially be done with a kref thing and inc-if-not-zero
> functionality, but that also seemed more confusion than just having a
> spinlock around a simple bool.
> 
> John.
> 
> > 
> > >   }
> > >   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > @@ -310,14 +314,18 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
> > >   	struct xe_device *xe = gt_to_xe(q->gt);
> > >   	struct xe_devcoredump *coredump = &xe->devcoredump;
> > >   	va_list varg;
> > > +	bool captured;
> > > -	if (coredump->captured) {
> > > +	spin_lock_irq(&coredump->lock);
> > > +	captured = coredump->captured;
> > > +	coredump->captured = true;
> > > +	spin_unlock_irq(&coredump->lock);
> > > +
> > > +	if (captured) {
> > Then here...
> > 
> > if (!xe_devcoredump_acquire())
> > 	msg...
> > 	return;
> > 
> > >   		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> > >   		return;
> > >   	}
> > > -	coredump->captured = true;
> > > -
> > >   	va_start(varg, fmt);
> > >   	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
> > >   	va_end(varg);
> > > @@ -342,6 +350,8 @@ static void xe_driver_devcoredump_fini(void *arg)
> > >   int xe_devcoredump_init(struct xe_device *xe)
> > >   {
> > > +	spin_lock_init(&xe->devcoredump.lock);
> > > +
> > >   	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > index e6234e887102..6b776abd8bf4 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > @@ -80,6 +80,8 @@ struct xe_devcoredump_snapshot {
> > >    * for reading the information.
> > >    */
> > >   struct xe_devcoredump {
> > > +	/** @lock: protects access to 'captured' to prevent concurrent captures */
> > > +	spinlock_t lock;
> > >   	/** @captured: The snapshot of the first hang has already been taken. */
> > Protected by @lock.
> > 
> > Matt
> > 
> > >   	bool captured;
> > >   	/** @snapshot: Snapshot is captured at time of the first crash */
> > > -- 
> > > 2.47.0
> > > 
> 
