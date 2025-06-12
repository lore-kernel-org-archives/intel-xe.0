Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7262C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C810E066;
	Thu, 12 Jun 2025 18:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1dYSzuo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040210E066
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749752905; x=1781288905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rs7EE0qCE0ONvveO8CWFoRuTNFkhLmlg9RZPtP8is+Q=;
 b=W1dYSzuog71ZqhGZfCkQ9bSDGnGabIuwa1QxkKKc40M52Xh12Z8eWvoq
 QO/7lPoHhZWdpNAvDAO1KcVU5l4AudChzlAAvn5BNI2EPrQ6Ld8GnNjUg
 ivTAsedcruyg15k4eqTvSl1W3GoW8LWqWcFkswX0FZ3aUEJgHYo2HwRxa
 z2NO1tZVftnyfGkA3uKTEej3kCDG5gC4Z5lyi7qM4elVFN7+PZ1yTW7bj
 DwUH40F+GC1nsak23n8KCJn20qU68Rc2PAYP+FgeypMvlkW/tkMB12RO9
 khSIisI9or5g1qVdHDNv3OZx+pMmSIL883wKG1RmIJSBdofuGtkK+Elib A==;
X-CSE-ConnectionGUID: HDKkqEI+RF6NyHae5Q0JOQ==
X-CSE-MsgGUID: wP5ep8DNR4mvoNUDAutqDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69390372"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="69390372"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:28:25 -0700
X-CSE-ConnectionGUID: dW+FVvYyRmW+zcNsDRI1xg==
X-CSE-MsgGUID: N/vJExcGQkSZmSfWoctXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="178569346"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:28:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:28:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:28:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT0igaimR6fNEk30tQ+FttLgp1Brb6l0VWQtbKpNkewdM12OBMNSjink7yhJqlpGlskH8+kMpXaTUi/9Z2FXNGjqXFj29hJDzdbAb0wSMKzuSyU5XRH9aLW0Kg9AT+v8AzmEU2lpsmKX9KWlOVI8jdpW2OcW0ld93cfqtpoatIhcmJfuB1GwRCqwN4qgjnEnUC9aTnP8S7Iu+5vTeJ3hSTMkKGbHt6kUPHO4iJiWjkS3gRMBDIJeFtAi/SVk3REKfLlYUzAEMNOBF+QmxepB3Itjnd8VE7/JhQ+nYPyXQBBRTGxpjxS/b2j3Ks3BE2i8pmjRmmrBtHhc1BGslUsvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suSdUWduvdJ2JSm/a2qjoeTeZ0bGzFCZSC94YSZ5JaM=;
 b=RmypQMcQbyFlkE5jvrHnumKRpfMygRktYVv5UpPzI6aDFnp0KhI1KJWZ8Se7+n6ZkkKLZgtCUCnbFFryX/sRUzaP/MBf4QT1JO5qMqbSMR2GAaqprlp6Ea6stOru4HCChi3RNpXN9cUmNI5uOLkJiFWvKFgudmNQ1aFf5AKHti7ihhaAApGCeQJmC7Z0YJXk2azI+2WLJJEjedLZ+4Fm+WQBo4GTs+bm/KU+/RKj2l458E7uvnGaP+sWDd1fxMc+qMlbTAPsyYOUhz1UMZ4CWKRLYlbcWAyQjKv3DkClNIi6kw86nK1l9sgNcuVNIb01rxJ2Ze+1lf6T2xxX8u4GFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Thu, 12 Jun
 2025 18:28:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:28:20 +0000
Date: Thu, 12 Jun 2025 11:29:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Default log level to non-verbose
Message-ID: <aEscoypK8ziqxqOi@lstrano-desk.jf.intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
 <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
 <276c2f6c-c5db-49d1-80b4-6aaaf527bf60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <276c2f6c-c5db-49d1-80b4-6aaaf527bf60@intel.com>
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 707c5ba0-c166-4fda-8db1-08dda9dee849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wc2EvA7XzqRhXoBFF58lkWxuE6TwK67fFxW0Ive8YVlQDt2nOioO6b3y0H3v?=
 =?us-ascii?Q?pQOJSZMw6NuzUUWYWb2uMbjPoN8LRX90hd3jz9u6F8SjDfd4zojTCiLPHJoc?=
 =?us-ascii?Q?7WYN1PxXWbCN5DOQSNoZCSd0kaCQ2SNhTU6yp4REKK6NyVkoxVv4SPlQjZAh?=
 =?us-ascii?Q?j7YqSj6WlQ2mud3RL0zDJ0mPEdqtT5SuwSxxPjTaBLT0NMSflQfaGlUy7vKm?=
 =?us-ascii?Q?VMXhrMK7L/ZEDVtQ76ao5MPrfl2Cmuz3SzcMlHiFMURH6YuIGrgDxBDErwL0?=
 =?us-ascii?Q?XYkPEsJAE/AoIIf1V2h2ziBuZgM//ST3rVZjvr31oMrNjyKyzlgWCmQ5yeLL?=
 =?us-ascii?Q?26JdfBIPo2xtDTxHcxbb+V/QQufaxJX2Wz1Z7AbtRhTlP6Yil3FZEH+jcILA?=
 =?us-ascii?Q?ava0lVkhtBT3woGgYc3/wr/mROuso+TkPpS7ImdyTrCxX6VSu4OJqTldLhhu?=
 =?us-ascii?Q?FX+XzYZZfC9J0h/38acTTxbOnmw3TLpTCXeZR1Pt+RDt657Vx4uwfVdmCxHq?=
 =?us-ascii?Q?IJ07IUTM6SlH3LzGLdSupexiOxe51Eb82O654XV0w/NbrBVViJDlSz0D+ri9?=
 =?us-ascii?Q?FQrvSAg67Tndu7KTJs6w25PrZgUWCQOTX1g5/6/5B7x/ug6+I3gqdc6NoL8E?=
 =?us-ascii?Q?vfyV5EmYoIB87ws+AKYMjrKjEjMmWUVBOUXEl/EoBpt3xQ6WisLjM7IWbgS2?=
 =?us-ascii?Q?/mnyxD4Q00RLOZU29BlEuW5Tt1awgY0l09s+l1Q0GJmiHdHr90SZxA7EQY7F?=
 =?us-ascii?Q?XQqSsNRkPCZ9LG4KZC+xHnBwOuBpUKVJ0DxaBfrP87fpWTkiXuJD7cgAHoIN?=
 =?us-ascii?Q?kZwdsv5PS3AzYP59IxcpCH0k66X8+eKSciAJjEHp73+BuXNbDatw0EduU0Kt?=
 =?us-ascii?Q?vLhcqkowgTWNtANXm+WIn/Irrf+tPN0M7ilj7i+7XQBwLzf+QF63gkvxU6Yl?=
 =?us-ascii?Q?pYSnVMMkqwlndapSkrdeI1QQ3LKkP2tI1kvKR47bsyjM8GFXiz6DrnwSKpCW?=
 =?us-ascii?Q?qV/NHLdLESmFtgnXlRUtupJ39Y+BuhbZ3Xekj2EckJ4l3WSvfsIj8UJqVvW/?=
 =?us-ascii?Q?h2NYfI63AwLzNW2NK82Kh83dKWbky6KMfGOFOSYoLLy+EAXcP09hkBsA0NgS?=
 =?us-ascii?Q?ymuIkQM4uHQhXVaQRRyPwG9T/bo2C+N4EuT/h7EyODmZAB2GnrTNnvUIKVHy?=
 =?us-ascii?Q?HLzBOBruNawOTsyYKXyNaP0WF04NDigwnErsQK8Py0R/bh8pP56Ht5vB3Fet?=
 =?us-ascii?Q?VldqCMWwOsxVQ4Bc7VHo38PsztHRLnwDGqx7QegH5nJ4He0SngdZqqxIWNli?=
 =?us-ascii?Q?DqEFlOWPAf+crHRiKk+WGWhBFtGCwB3dFkZxfwYKDp7rwuA6s3FIfUEq77Bj?=
 =?us-ascii?Q?HnuEbUpXo1FY5VXb5wJsZalnYg3xfhWnIuG2xI0zh5Rr3bD3XAXWSeHsLC2p?=
 =?us-ascii?Q?Brn4wIVDRYY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yQtXVdU3p0uZHLsjn79Mx5UfE64ZcqywCEDCWhC2Pmsr1rXGkRCRgBp4A3dl?=
 =?us-ascii?Q?HdE/lqz0TL1q6MU8clF7/QG9ZyZ3JxvovZk5DgkFas35TgXSwCbkaeAPhKF4?=
 =?us-ascii?Q?wk8sj2UQtYlxQfeEkoAF/2u9Jmgj4TMTQ5EtvLC7DcvLvbMhHjy+JShQ1fJx?=
 =?us-ascii?Q?50miUh+rP3IRAeFzmhmW0Nf5Zn+i7/G744vtVInKr4OuEfM1F62LSUsEzltK?=
 =?us-ascii?Q?UybUuQdS8m3AJ3GER7N9eXAMXUpyY+xA2hbgzFEcMjR64H42uyfgjajePfMY?=
 =?us-ascii?Q?XDZyMxqyXVtkW18UAl8JWRKEWLjLwrmDtvNgY2fKNV7Q13EEwBHwR/7eWgz5?=
 =?us-ascii?Q?FFIZbvPZTyVDt5X7uAh0QKi/UQS4jMhf2hwjiwXSIyVUzDIyw/3RRV1gVN3z?=
 =?us-ascii?Q?EuC5qqmUpO4XT3wX5YAnfT8lT4rTjWE1GecLZ5BmDTOpaHBufHuCj4GKcf1Y?=
 =?us-ascii?Q?JFIkESca4mXFCjklMH3HCMhMc6r1z0wfjOSSPqumVzEdjRyhOZnFojLWKg8v?=
 =?us-ascii?Q?mspslx0YHdeN5qFXGOh6xrXeZ0BAvvZY0BiQy03ehmUzNnB2GYCN+YI1qLGA?=
 =?us-ascii?Q?0pUj2B8fambnU2e4u+RcqpT5hpGbSjHZCp4PCvzrlxYzYPQ4lJ7Lhv11lSnA?=
 =?us-ascii?Q?HzktMs55jCo4qae5YLyFaPpOUuCydCGPcCeCO6fXThYkLC9IjzpfIZ3IGr2T?=
 =?us-ascii?Q?uR/6jnxzs0HZDhRwP3XngX5Fa9FPcQIzli3/1bLtozOaSb6H2TsYWsgVQ43W?=
 =?us-ascii?Q?Y2g8rytZ7Rj4642uQ8oge6FRK7awWrVRAXi5064ptUtZWwGt8akXsQH5PGHk?=
 =?us-ascii?Q?LyHXDLTcLgT/S+LMxMuGRD0GYe/o+FRNZNWVwSCoiqn4xJS2pgHC01OnKxTV?=
 =?us-ascii?Q?vmEpQCy1YBWsy4YjNdsj3t9TZ7ImA0LoWsRSmzBAmQfCoAIJ4kq4r51lQRhR?=
 =?us-ascii?Q?gOqlG3PF2k60Y4Gx6nEI9KTIrHr9Bmw37kZKNkKZtcaVEMSx7oYC7O1IFqbe?=
 =?us-ascii?Q?PObd/nRjcCqg81sE2XxjKAEkDsx23t7mIEWyosPdolkwJPK7DqcZIDek+FAz?=
 =?us-ascii?Q?oKSX+gtu0VKTj77DjDhiNYqutiou4YwQ5HpOwBAZdyIiO2mpc9KR6X1/4lJr?=
 =?us-ascii?Q?Gxas3DE1U3U1vzdGdC367NcinUhcOFYTCYupzERWFOQP+yS3AQpjkkNBqbDp?=
 =?us-ascii?Q?BZdjaaZOMH9xvbB8UPwTfhrR7haSY9KJUcpHwG3yHhZ1ASQ2gzZD8qCrLkWs?=
 =?us-ascii?Q?JORRw996TiPY5eD6V5Bc46/gh67T/tXASCRyxIcHaQDFHgZ6xP61wkg0jfwE?=
 =?us-ascii?Q?68c/zoxQfvcbC5JWQEZ/9DMGYEiHXqvml0aAQFQ88L8cKLKl167DCx/1ojlu?=
 =?us-ascii?Q?NCnUY5EHDI4Lax6F+wInCgEs+pi0qpiZl5YzAl7pVuJ8nh8I2/k8nd+EFCFV?=
 =?us-ascii?Q?jIb1cQi0Ty7DYoJMxJfJirx6Nuh7P2VVnRFsGw7ryxxPLbhVpGXw2YKe3cxi?=
 =?us-ascii?Q?PZSXWVMfDsr7DJwTlWS+EcN15f2GzlHlMAZ2yAeCiGGBNyTKZPNpLVDHHu6b?=
 =?us-ascii?Q?gS+nJUGqOUXqbObzyQiC+7vNeOx4z485CEXMmLgWkDPEpniDGf5cTi5//zet?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 707c5ba0-c166-4fda-8db1-08dda9dee849
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:28:20.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/wwmqBq1Im3i7/vafJDCM8/6if3wa9nm0/QNcRY/DEQlDpvSVZapao/mkzSAQTnQAu4pjR1zCKISjmcXLCL7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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

On Thu, Jun 12, 2025 at 11:21:38AM -0700, John Harrison wrote:
> On 6/12/2025 11:05 AM, Lucas De Marchi wrote:
> > Currently xe sets the guc log level to a verbose level since it's useful
> > to debug hangs and general development. However the verbose level may
> > already be too much and affect performance.
> > 
> > Michal Mrozek did some tests with the L0 compute stack for submission
> > latency with ULLS disabled. Below are the normalized numbers with log
> > level 3 (the current default) as baseline for each test:
> > 
> >                            Test \ Log Level                        3      0      1      2
> >   ----------------------------------------------------------- ------ ------ ------ ------
> >    BestWalkerNthCommandListSubmission(CmdListCount=2)           1.00   0.63   0.63   0.96
> >    BestWalkerNthSubmission(KernelCount=2)                       1.00   0.62   0.63   0.96
> >    BestWalkerNthSubmissionImmediate(KernelCount=2)              1.00   0.58   0.58   0.85
> >    BestWalkerSubmission                                         1.00   0.62   0.62   0.96
> >    BestWalkerSubmissionImmediate                                1.00   0.63   0.62   0.96
> >    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=2)   1.00   0.58   0.58   0.86
> >    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=4)   1.00   0.70   0.70   0.83
> >    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=8)   1.00   0.53   0.52   0.78
> > 
> > Log level 2 is the first "verbose level" for GuC, where the biggest
> > difference happens. Keep log level 3 for CONFIG_DRM_XE_DEBUG, but switch
> > to 1, i.e.  GUC_LOG_LEVEL_NON_VERBOSE, for "normal" builds.
> Note that this performance is understood, although it was not realised quite
> how much of a hit it was on this benchmark. The impact comes from logging
> around context switches. The logging adds a few microseconds to the context
> switch time. In general, this is not noticeable as the context switch time
> is negligible compared to the runtime for the workload itself. However, I'm
> guessing from the name that this benchmark is specifically measuring context
> switch performance with empty workloads. Thus it is the pathological worst
> case scenario with regards to the impact of the logging.
> 
> Anyway, not logging in release builds is generally a good idea and better
> benchmark scores are always good :).
> 

FWIW, a page fault benchmark from compute showed 15us better latency
without GuC logging in my testing. That involves context switches,
multiple H2G + G2H, and the page fault service. Pagefaults are certainly
a case we'd like to speed up.

Matt

> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> 
> > 
> > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_module.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 1c4dfafbcd0bc..4809afa7ce3f9 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -20,7 +20,7 @@
> >   struct xe_modparam xe_modparam = {
> >   	.probe_display = true,
> > -	.guc_log_level = 3,
> > +	.guc_log_level = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? 3 : 1,
> >   	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> >   #ifdef CONFIG_PCI_IOV
> >   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> > 
> 
