Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68891C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 13:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369AD10E84D;
	Thu, 18 Jul 2024 13:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONZqOoZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A921E10E84D
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 13:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721309756; x=1752845756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tq+vJYSmHwOmHTFEyGXYqVpl5k/BVBnpN43CR01PMts=;
 b=ONZqOoZBlcRILc1+uDoN1PEeodwqbzD6Ajnz/06pUF1LaBbsL079VChX
 jMHEmO9fj4yhl9/bfYUAF/F8ImEa37hj0xu7EwP5/DyL/sE32mFsticn2
 7CPYNP8PUPb/c4esDhESEJWtWZLPHEZIz5TRD3fvxas1iMkNLNZx65lUZ
 26/cWZFtpeh7pLZY3wDBpUWGa1DQV13EcfcGfNnoIfLAgNtH6arYIuxGP
 YLZCkH+tKyT/AbMInethXrYczZAsCPAADMSLp4lpZyVJXAd/V8fD0/7Xo
 XbZ0/GfgK8MrrIEU2ndyfUZIQbECkQdKcCZ6oG4e5A08yZ0ylt3wU3ndW Q==;
X-CSE-ConnectionGUID: 6lToZvPvR/m0dJ+SXXw5VQ==
X-CSE-MsgGUID: vgm8EMAhTw6P4vyUXA5rcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30030839"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="30030839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 06:35:55 -0700
X-CSE-ConnectionGUID: n222TdbtSY+SS52zjZq1lA==
X-CSE-MsgGUID: /dCNSgKCT36k2Fe28yGBag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50489699"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 06:35:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 06:35:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 06:35:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 06:35:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 06:35:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXuV4gHjMxIFsjNxBzpf38BxeFOICkdThBAkRsMWaHNj4MLUczVDzth7rT/p4JGbFf1DJJTe+bj7Lp4uXThUPJnBecrZUlSJtxGQM//FHlYl8hCPA8fZdd6T0evLcqOb9qibWry+O/+t8CcRSvvuCYeVdFSsOt7jIN4uY0lIno2lDrAd5sRJVQJXs93v6f+88moE/DcSPJpT8EIXHhEe8tj8cT4Cd4O1LadrN6fHWSewKo40T+sXUbDKZqnbFw+TjES04uh0Zhau6XgrF+sWkRngEOQm4FeiXXpavh9YnTA1P+nyifi43h4FKDpVAV3rMsAM7jd/BbJ0cOI9GQEq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJRR0+cv7jCgqhtVNv9U5PCzkfRqZpoRqPpQcXePeec=;
 b=jelD6TOIGSCCat1UV7hZnhOy6KRQZDnqADnM4UjdBoMAVkH0nY82nd767Dh9Qq4/iQV6XQgT+95mu7uwdDuJA9Pu32XZ0e0Ys0Et3cQZPtwy3eEqzdd97UELI55r+jqyklddhOaAFuVejLFDihlSwGLVw/xwaM7oXy9y/2kwDNoMZFbewF2I4MidLily0VCOlsoW9+r6LDahl+KjK4LBEhC0hnSmwoJjCmlf8JuyU3juN/Di8kn7XFexcM0dvh57ehP2lAiimLb0qVUFurN7b8TPZZggjKKZyMi7XocRM0QtBGwIL+xJ+VIaGt4hlccsbW8xMnnjfwXZjWwqlweCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.33; Thu, 18 Jul
 2024 13:35:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 13:35:41 +0000
Date: Thu, 18 Jul 2024 08:35:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe: Fix use after free when client stats are
 captured
Message-ID: <wyzkmtxtqjc5c77btxdqkwktunacu2zrkznb6hcybctlkhgi4s@hmumsekugqhy>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240709002835.3372618-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0334.namprd04.prod.outlook.com
 (2603:10b6:303:8a::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: c55224b0-e112-4b71-4c23-08dca72e8441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GCvRw1dM9F6qz30d2+mqv1vZa9TdKDU77wzP1ddlS+85VPvdPPyiXax5JfR4?=
 =?us-ascii?Q?1+aPHFxSzjCfoq5cT6bjYvlkhoxJde6WshaTV4eBBu99kVjIoOS9fug/qqSj?=
 =?us-ascii?Q?3I5M3jwbz6kwj3E0yVOqKQzWQW6/wP66rISh4n1IxrubEIKbz6nTHbdzkAYD?=
 =?us-ascii?Q?ubetNT/rdrF3psrtWGVV1WgiNFKBT8nwnP6MGaspb8qGyGi2ffoirpHojtQG?=
 =?us-ascii?Q?m4utPoUeQkOnNIo7twQeeA7TvnoOR93TIVB/jpByDu1NQMfTRu+/0Hbdw1de?=
 =?us-ascii?Q?KZP1+yuFp3XooDY2zxhMHIlZcb3b+ajtL1OIfxFDA8QU40JM1EOq6Tp3UNrs?=
 =?us-ascii?Q?YGFF8RibzVuqnaQCr8oerxq4hPSFbHCsAWRWuwEsxWknOywS0Y6FIOkZO6r4?=
 =?us-ascii?Q?hFmCa7Zt4pIG31ZtU8mIS3iHpkovsMNC7PCJvGyKTfJV6lId4FYD0N3RKQit?=
 =?us-ascii?Q?o/JG2ArgLp+jac8/ZX6EeK+Gfa3rkmD2z0V1VYCLtLZ5lfvnfK953JoPxvn4?=
 =?us-ascii?Q?dVh2HJi/UotZGOVE7vb13nc/5pJFIBDJ/LIpxNFXBdnG1D2lMFqy/lvncOjK?=
 =?us-ascii?Q?I45IbcluM5kT4an/MrNXTqZY80pvKmgszknJpnzApoSGr+zlxAP8WkVmr3uN?=
 =?us-ascii?Q?Vp0wjPg6JyeZW8pP3I9EgylGELAaatGGu5vhtnCsaZ6UmHHr2gIEVteLOrH8?=
 =?us-ascii?Q?XeGRXiBL4n8ZAHPwMKn+nwG5L82vqia69r4OxKJCJXrY22stss6M+H25ztoC?=
 =?us-ascii?Q?GPYtEDc1XIea3gLr6D0eAKEqjrejJekMDEArzvYLZAdXyHzYZrcSg1TQ6fb7?=
 =?us-ascii?Q?WETqhchAMyz43QoDybgk0stCPEYY/0drxP13heo8B28UN756kZDx2rSj9cic?=
 =?us-ascii?Q?Hvn7pTIpaQe28byrIZ6H7IUDBz+S81NsJM/R8boXi9eH3vAlVS668wh2zSjS?=
 =?us-ascii?Q?5Ir1eipBa2QtANRiU+kY15iAsVZ4ClqMv3jqQNwcfl3T6WBZd8ZbQdNnl+I1?=
 =?us-ascii?Q?aWwe5EyuqrNVUqiUH3/FN5XRCv2WqenglFYXHyzAhdEb18LmlQSDDqYli8dL?=
 =?us-ascii?Q?FzBbL1gmKEvZENZfLMk0Ob2IVl3hDbS4Lf45aW2fx1tddnEh/HLArDzpo1rr?=
 =?us-ascii?Q?5ngmWRvIGzOCGh/AgasQ47bWzM5iG7Fipf+7z1nQ19+F1QsIuqjm2UqT0Kip?=
 =?us-ascii?Q?Lr2t2vWYtJPwG0YNBGcqP4UD9axKeGeMuvl44GSq3iJUI/A5O/ZUMe5pQPxL?=
 =?us-ascii?Q?JqUbb01thec0lmYtYpykGBXZuELNXoDP/Oz175ED3HTvsm2yY28m+dj9w4MX?=
 =?us-ascii?Q?w26k4MagAWTR+VWau4dmq0l/J7tU6Mj5EHei8YjpHd11vw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IxlDAZfqBGD8A1h47XQHmH6Ra+XxKsWW+78brW7xn6X1oYM6YyeAaM586pS6?=
 =?us-ascii?Q?Y9U1Mf3rTBXV4NY00o3oRAT4Dcvp/cRVH3dUmMlaW2Zz4ynRsUKGEDD5t9EB?=
 =?us-ascii?Q?FVlM3C0/3bykq53Meh1KhO0sz0Y5jPF68Z7BsYeWH7ZWd6ZkdC3pmC1nEsWG?=
 =?us-ascii?Q?fILvuyYQBeUPBRkx/1gEwdFrtiYhspbNW/111+EQ7ePHloYrVzTCpSFU77L/?=
 =?us-ascii?Q?w0Nwk/RrZDLC1PeXU8nUsJvf5xnVQLPtSKVLbfvRlIM4DPQnn7tEmcrAvL7d?=
 =?us-ascii?Q?OgD5zu9M/kvObL9w4VtLt483sawR782VTvS7DRGeZOqUznP5DgO1dnmYUtW9?=
 =?us-ascii?Q?iCJdTeMs9xZ32Mk9vKf468mwNOUZrDsX98tfubBZ/m5kGdbG3XzJVpmIbM4B?=
 =?us-ascii?Q?7piZaeBKPaO4kuwoY1amj+gxcbObFSE7hLyTvDRGA6OyIeBJS+ORoH1ge8qo?=
 =?us-ascii?Q?vo91heN3mVjX+91fh4jf722WrisGFWls2mZcSDp17qkoVETN/8tS2bN1kkPH?=
 =?us-ascii?Q?h1nATQQcRXN6kf9/WN5jb5ANb4J/jbnsvIf3JnfkWfllE1CcWDI+NHY1seSv?=
 =?us-ascii?Q?+EnksFeJeKU0tFwvpuxtXPs4p1wpofJK1zHYrIfmqroDZLCZMyocsQOWHR0a?=
 =?us-ascii?Q?ZvjiNvBtm7Xq6dcOLf/e5lmpIH1J1F2zKs+xhiulXpti74yLKcS7YgXq39kC?=
 =?us-ascii?Q?KH1KYjlXQsKo0gSmfmygenPBpyeM/O5t/ugkXCcnUWy2oBehBgJnogWUU8Zc?=
 =?us-ascii?Q?+8k+h7A62RbO+4ELIJWeO9Us9UdyLskrNcJ4msnwEoptkoEkiNgPF1aXRdkp?=
 =?us-ascii?Q?2M+lEWRPD6Vfs+x++aKbul2qKFyyUz2xUtrd67gTh13DcTPwZinLVe7E9Gkb?=
 =?us-ascii?Q?P5N+EWTeKMa/ri774XrOoJcM2ztp6aIEbRb3J8itb5XRFL4YS1uqnyaI4EGj?=
 =?us-ascii?Q?ijAB18GE4LuIGVQjKjGfeyeowbHtdJY/dJl4iZvqMiARabXJoU0r1JRYHd7V?=
 =?us-ascii?Q?PCU/dsgRAaCsa88hrckbdiwgqGLDCCwwHLxQAZWFvWc0C7aet2zpxENgjl97?=
 =?us-ascii?Q?DJ8mSIDD2RXMQd4vugmfBkTMoOFm0yjmzGzcvNuC76GePxxRVh46f/TL2m2j?=
 =?us-ascii?Q?Mnr3uu8/6nnKYtiLsnkPp0WLpbdSmWTjoeo6xwDEsVl15OuX4PQTAr4CtPDw?=
 =?us-ascii?Q?WNxQ8nSrv2/pXURCuSFQw85ldzPplrO0qnO1uInVgXNKbeR1dHbyQ+FdnDtT?=
 =?us-ascii?Q?fUGkyj78LM8XrBAXUcD9afNNWBCNra8ZG4pLIBE5fy8mlNiTc51uEqvQNBuX?=
 =?us-ascii?Q?Wyp2zanepK/WZt2lTVJEZkOYnCydMYB27PYuuqAcrLauvqS9i/tpoSoGNXz5?=
 =?us-ascii?Q?QhlHLP0wcG+JiJbzvkKQv7dOCm7pXn2fNu9feCubwvgVsTI4stpjqkULkdI4?=
 =?us-ascii?Q?+gScuGAYtNraQYuqki+o0fMOHlT8n4Iw71aahs0ku36iUNOHVtnk3IzawjGG?=
 =?us-ascii?Q?3GleiVVmX4mG06GyFqxHH8zyjTsSjowGtA6n9Mw3kEzpJLY3vK9lvUOMTn/H?=
 =?us-ascii?Q?yZJBV5g1cQRTMnYdPBGluzgpzinfRmjIrDXOftYF3okWPTjbMrveyqGJ2yHz?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c55224b0-e112-4b71-4c23-08dca72e8441
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 13:35:41.1918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njYekny4v+l/dCvClc1ALgok/vK2OSBXZ4PilntrRhpgNGapwHsExys3NOQecR/7ZuyWjwpSFhyheFe9qqZCo8iwVG321lVMVwPrMPPuE6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
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

On Mon, Jul 08, 2024 at 05:28:35PM GMT, Umesh Nerlige Ramappa wrote:
>xe_file_close triggers an asynchronous queue cleanup and then frees up
>the xef object. Since queue cleanup flushes all pending jobs and the KMD
>stores client usage stats into the xef object after jobs are flushed, we
>see a use-after-free for the xef object. Resolve this by taking a
>reference to xef from xe_exec_queue.
>
>While at it, revert an earlier change that contained a partial work
>around for this issue.
>
>v2:
>- Take a ref to xef even for the VM bind queue (Matt)
>- Squash patches relevant to that fix and work around (Lucas)
>
>Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
>Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_drm_client.c       |  5 +----
> drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++++++-
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++----
> 3 files changed, 13 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 6a26923fa10e..7ddd59908334 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>
> 	/* Accumulate all the exec queues from this client */
> 	mutex_lock(&xef->exec_queue.lock);
>-	xa_for_each(&xef->exec_queue.xa, i, q) {
>+	xa_for_each(&xef->exec_queue.xa, i, q)
> 		xe_exec_queue_update_run_ticks(q);
>-		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
>-		q->old_run_ticks = q->run_ticks;
>-	}
> 	mutex_unlock(&xef->exec_queue.lock);
>
> 	/* Get the total GPU cycles */
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 3336a01a1006..69867a7b7c77 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
> {
> 	if (q->vm)
> 		xe_vm_put(q->vm);
>+
>+	if (q->xef)
>+		xe_file_put(q->xef);
>+
> 	kfree(q);
> }
>
>@@ -649,6 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		goto kill_exec_queue;
>
> 	args->exec_queue_id = id;
>+	q->xef = xe_file_get(xef);
>
> 	return 0;
>
>@@ -762,6 +767,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>  */
> void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> {
>+	struct xe_file *xef;
> 	struct xe_lrc *lrc;
> 	u32 old_ts, new_ts;
>
>@@ -773,6 +779,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> 	if (!q->vm || !q->vm->xef)
> 		return;
>
>+	xef = q->vm->xef;
>+
> 	/*
> 	 * Only sample the first LRC. For parallel submission, all of them are
> 	 * scheduled together and we compensate that below by multiplying by
>@@ -783,7 +791,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> 	 */
> 	lrc = q->lrc[0];
> 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>-	q->run_ticks += (new_ts - old_ts) * q->width;
>+	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
> }
>
> void xe_exec_queue_kill(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index ded9f9396429..b5343cdd0632 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
>  * a kernel object.
>  */
> struct xe_exec_queue {
>+	/** @xef: Back pointer to xe file is this is user created exec queue */

typo s/is this/if this/

otherwise,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>+	struct xe_file *xef;
>+
> 	/** @gt: graphics tile this exec queue can submit to */
> 	struct xe_gt *gt;
> 	/**
>@@ -139,10 +142,6 @@ struct xe_exec_queue {
> 	 * Protected by @vm's resv. Unused if @vm == NULL.
> 	 */
> 	u64 tlb_flush_seqno;
>-	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
>-	u64 old_run_ticks;
>-	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>-	u64 run_ticks;
> 	/** @lrc: logical ring context for this exec queue */
> 	struct xe_lrc *lrc[];
> };
>-- 
>2.38.1
>
