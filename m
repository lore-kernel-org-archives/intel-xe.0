Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED83D2629E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541B410E097;
	Tue, 20 Jan 2026 20:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9ZIDP9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22E310E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768941366; x=1800477366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9WQUSwC6Fm1/51Q8XEZf1eG1yNPXF0eecOQNMY7tZFA=;
 b=J9ZIDP9hicsW+7X8sN3RlaOzgk4NROE5k0jvgqVze5hD50X+aRuQ9Tti
 2T2loD50xQ5sQMdd4yCZLKeiZMXtJC+4xUyKnoMw/U8dTL6qqdVIom7WN
 FlrKz1gkbDOqPTrUGFugl1AmYHADhsvgXbXyhMo2HfIbfDNwlUUWuFIAQ
 xaDH/TaunllTI0wx6EIjk/Qs3iNGp8cuKCMoDvaTMwTWyxKfhWQImYgA5
 FKU8V4rB96X+kVVD3Rl07I9+PB6MBFYdraBySPPQi7DVVyNnzsIvWJf9F
 WBxmQAhVMqwJjq4ijDJqeYuO29NgsCtbqezf/48xreyboaO9thlemUUfz A==;
X-CSE-ConnectionGUID: UyV+7xzqSbqvWiGgPoDDsg==
X-CSE-MsgGUID: LeSp47GcQdKpzNV1sxZsKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81271776"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81271776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:36:05 -0800
X-CSE-ConnectionGUID: uhapACkJR1awKB6JC3+zoQ==
X-CSE-MsgGUID: norGlQVeQr+dicsFIajMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210378631"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:36:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:36:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 12:36:04 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:36:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFBpPHLYzfX8BSMQvddoWq0u2aqu98nuT+ZHRkvfA2uNDSVl076udJ5BzSRDGqMUWBZA/ocEo5ONXEcoqqf7Se/Z/dMpzVt46Kedxv7rd8LNcej5LerSUusdZMb5lsB5ZN2GJFAF4diXJewn3w4nK0uoVqRTgXh+rumLbM6D0vJNI1qMEvsnCLPyMmmOYPSyhZV3W7G0KkyL8vDLLJni8VU+uzm7SIEgtaJzPqP3JBw2ki6jfmQuDFii0Chp+vB0IbezN7vDTpe4k8RxVk55oViJ25+EqidhpLNqy2K9TdLjEjFMsVswZfj9KvnZNPtD6tgG2B5KfjSC4n41fecGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3LMX/Ph2g1mIEDAkHuWsp7nCyteyyPALAj/nrAdZu8=;
 b=RWxjHNA2kr2cVRNPg/gcVNt161mP34RtOLmHAG4HfnCAUOBSChbjeNzzX3qe0dQdjk8U430DLKcCFnF7nsHmOFUg2aOarExgRpg8q01CgebBLwP35MD88NR73E097sNw7JR127DLDK0y/bv2T7CeS6g9SEEuRY2gIoi4na61SWwAywPoVoB59Vv6GmjcLN9DdYOHmx3M8TRuLKYqAR6kIRyvqExlzYg6czjQCBlA0RuptnwQ/fUxmAaSK+Wws+/1Rm7/o2nKNtNgcE/hwvbuoLONhkZJc8+doms6i2vebgWULfNEu2FIATVZaJpfYMFsJC9HJ2iXeCZtjg2aftuVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 20:36:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 20:36:02 +0000
Date: Tue, 20 Jan 2026 12:35:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/6] Attempt to fixup reset, wedge, unload corner cases
Message-ID: <aW/nL/OGSpgzBpQp@lstrano-desk.jf.intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260120201621.2442803-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4PR04CA0330.namprd04.prod.outlook.com
 (2603:10b6:303:82::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 272637bd-754e-43c1-0898-08de586386ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?912Cu6JQ0tPey4LLliVlSSHV5nFm1HzjCOL08ZG89xBLKwvAOfKqPaA+ElAY?=
 =?us-ascii?Q?fFneFhBwkV6ZZowUvtDcDThHNWXA2k4iE6ObFf+MV9TZyhHeXguZC+Kamjdm?=
 =?us-ascii?Q?eBZhDQYsC+Mt01wyGbNUlV9/tnHfh0atBRKnlK8ur5OeHGepan1jB+L8kSM2?=
 =?us-ascii?Q?ajO3q004ib/V8NUw2A6agjuUFgKWAC69dgGx8+CZSXzDuDm0Mp1eu5vXiI1e?=
 =?us-ascii?Q?DqT6CH8X1NHisLpyUM+BYM9SSP7g8zB5nzmnSa05CEK7M0PLSekbXQb40/Ps?=
 =?us-ascii?Q?w+/U7YgzQOJoCmNdPBXEg/vKZ4iVxYU/tZtNEdutp/2Ad2wCo4Mlxe5TAKtj?=
 =?us-ascii?Q?tf8U3l9lXnHpcM2L8gZJbYyaVkVeGSYuLCBz8D/PrcoSggigo9t3AjLp9Zyc?=
 =?us-ascii?Q?YVOwyjsm3mJp3L2poPmcSZVFEkSLtWYSWjs2F3PCSF8KI9IDyhsODP4Ilt19?=
 =?us-ascii?Q?Sgf7VC0p9qJ6IhrkqtvhBXA0OmjUSHg2L6lTW3CKU/cHo/9CgjJgA3JX3bap?=
 =?us-ascii?Q?eDIK6xVt7CsdynGJnf8C24s289WissDUMuZnAs0ciaHKGDns2qIndMcaijJr?=
 =?us-ascii?Q?EAF5gUKLX6a10EdnE1nt0f6ZVAO5SI8rSyNAUhdMcaY6TUKgu/UIL/80MDQN?=
 =?us-ascii?Q?U+Wwr6FcT/e1fCzp40hlPOFV02Yh6clevmgkVgEpoNBRqaCA88s14NCrSN4+?=
 =?us-ascii?Q?6zQraTCOPNZ42f5AVAo+3UPPvploQhL3LcPspVGylzRnR5f02l+c+Qk5pCSz?=
 =?us-ascii?Q?pS5nkV1A7qSzLzfteQq4dZ7TqFih45Md7rkLee/qiH2hmrmD4rLyNJZ+qa1S?=
 =?us-ascii?Q?DcjYSqe0AT37M4zw2ST9OtWjJSTp+WuPZIa/7wOwl7bo8xbV0v9scnVm60wV?=
 =?us-ascii?Q?VLAFtGUZYKj8GMPL1Oq90BVOUv0yTQeV19TBkKqUrxo9LXRjgDQqc7INg40h?=
 =?us-ascii?Q?4PFN3F/nUc5QYeKGeVTFgsw4Ns2geWmfFIRxk30shmCD2XW9bcGoufVCl+r6?=
 =?us-ascii?Q?cxW2QljXfWJWgT5DvsXVGcfbK8mvNI+WIvlwllLgPCpTN60lLbKxOs9nRz8z?=
 =?us-ascii?Q?v0T4p2SWwZ17yX/e7aV/yK9BaFBGt+esAROf4ogrSOmfoSlQT7PVT+l+t272?=
 =?us-ascii?Q?yOQhPqyQFDq11e8qP6KCb2jF9e4SYNqFRqVT3eHqjHrSPl7hTiuUhUl4w0v2?=
 =?us-ascii?Q?8ipzx2ZRdAbBl7s4x7TJJhNQe9evBPJUAdhqxM/RJyHavlUcrHXxY3oQwc3A?=
 =?us-ascii?Q?cXOO2kI+kKj3gs1Qobkgr4WIBnQ2hXLM1aHWrqAbQ1MVnsC1s/a0fkV0Hzdu?=
 =?us-ascii?Q?+9vYtdLRJDy48visP3KnAKOq9bkhB6cxVfrQyktJwgQp6gF8KhDCjmTRNhsh?=
 =?us-ascii?Q?yC7kt9Vil6XSaDvUZZ/ObaqmSMVoK9jf7L3F9HpVYwwL/2ikHDqwiTQhkmJE?=
 =?us-ascii?Q?L1sDoRAaZiloltQUA5KldzLjrBm49p3qHqdLyNrMDH1ywSeuT0bZaacJUEU8?=
 =?us-ascii?Q?/8Rv/X/NY8OJIfVEERM4FEDdJiDPAa7W/Lbc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbz2PxXNNKYN/+wrYN06d/RQFgLfjtxYzLR/vZN/mh/0C4LBQHQulTAwQD2r?=
 =?us-ascii?Q?ukRSGjuGyAbHauIN/rErzLGdqPPaylD3bvemAun590fBnNKMnqMIODGfHDjt?=
 =?us-ascii?Q?E9Y0NvCAnMrCTx0cLnKE9oA/qdLsNzt/hHrcOGl0jPqrQLJ20nXRJ5VzdUjR?=
 =?us-ascii?Q?Xc5wcVHXwgVPBi8D1lxOYnA1ft1bNPA2GYrXg0RktO1pnf7oxEB6iYs40gxF?=
 =?us-ascii?Q?ESkbaCwnnx/T2koA5qHA+IQUZEWzfc5WICbrTZFjQk/3h5g4AjswK4XQPS0o?=
 =?us-ascii?Q?Ilzh3Wl6fiQtF2m6pU81SguZCjucISLJweqVI0xAFOa8C09K2SDJgHu3bmEW?=
 =?us-ascii?Q?ObKNz/O5MFd5DmkzNwYb5j8k1pwbawKpVOg1wnCt1aMbvlloWjqSqRXVS17M?=
 =?us-ascii?Q?toxqWUhvLxo6oteAsquaBHvmcOnT0HXUt7yEAGhn9td5BqZHmcZNpxt8z5ZQ?=
 =?us-ascii?Q?+hochE3yF9XXFxQ9RdatPOkMPmVIY666536xDg7GgrRdohwOdN/TPyZNcki6?=
 =?us-ascii?Q?+2Cd2+bKgeIiSt2kia9LglhnHpMXYKKdx4GGiMsM8dddw6ooaCf/mjYjQ51u?=
 =?us-ascii?Q?SHSuEtEmNfG71loPMiUYudKWPZqOT1lALydORsxYntih9fO/g8sVrDnm+kN5?=
 =?us-ascii?Q?RmQ+QPT6Tzy7DGmct790SWbwVKlKZXVV+pXy8Uxy4zBKQ/P2N0wvRs/XTJ8s?=
 =?us-ascii?Q?xbV23aUKXVmcpx0AgDLKvLrMky1UHnH4lnsaB2Rx0kFxCHrrFi+nKLoa0JfK?=
 =?us-ascii?Q?B0KSuV71lmHEEzcwLAwrBECzHviUfMrp0LUaxCEd6kLmOrfUPCQoeK8jrTKb?=
 =?us-ascii?Q?8UzzPefMd/Zy6YHKMq8tC9hJJZItjSFi4E97fKfOZxUr7hb9bBVzs6shqpPV?=
 =?us-ascii?Q?20i0ygZr/PoLiB+IWLnxjb77eiAuq8R6e9P1fSWKvVvERnmG3DxoHhjHK+9I?=
 =?us-ascii?Q?VsxiqQMsGe8uA2ZUmSD10fXqUs9PbX4tSMDaYPxquF4urzk0CjQI1AbTvK1v?=
 =?us-ascii?Q?PBs7nHgtFkVqDej7dXo7EhdWnHPU83dxqNTKA2KOvG05persH5siMopwySWy?=
 =?us-ascii?Q?JinC65/9M3jSRcWPkd5PDlm4eTK+TYCUeizHEwRR4uQoZ1gx6H1h/VzPt+RO?=
 =?us-ascii?Q?ddSlltv6yx6+LtaUL6Ws5zYbSfEXr1nujOHuVGT/EyiX05Qiqg1U+4t5ZZSF?=
 =?us-ascii?Q?yB3jRpCVZiPCAycKuBUFakwyZq0Cv4E7F+DIKxfZTwBrTmC9XcLbDL2l1Ac/?=
 =?us-ascii?Q?VSq2ZF0SYPA6ZuZWjht/ll0Lq0vjTFq3/jkuaz1yByAEwlFcAddnFSmTM1Im?=
 =?us-ascii?Q?hc1PuUKT3hZ9wViqGC8OGabEQCk+mWFeNMreeBp1GjHTCkdM6VUTSPy9FDxN?=
 =?us-ascii?Q?pJFvsNZxQkKfIcBKLM2rMR5K5LHNQeHr430B9Lr/HChbiAD6AN3HAKbxUdcT?=
 =?us-ascii?Q?Ld3kFO261tUfS6JVqcB5ikLPMhZacp097Y819c1/6yWfbMcAE/jFASF9rJT7?=
 =?us-ascii?Q?p3g7Uwlm+22GVjDnddRTQ2UzNdMTNyYiMfrHqtPTrcWKk8YI6kd0AJu6YvBi?=
 =?us-ascii?Q?/e5WcZMmufzOPYBieTf3X+aDjOgKLXKK3wsxBrR8POos7zJ/EF8ISWwwj5yX?=
 =?us-ascii?Q?Js6pK9GiD2Yp4OnHrWbQA26k5ZxSsXLWpG3ni0CCOAb1K5RbALrfvKl31NaR?=
 =?us-ascii?Q?uYAOI6aLq0j2YC2TRwAD++Q1kRDzit5vHcRiwubfB8BXaD4I918HJ/bAAttl?=
 =?us-ascii?Q?3mOWnkh7cPc5Y2qYTeL2Nx/uEcvVLIo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 272637bd-754e-43c1-0898-08de586386ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:36:02.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLFWLCXrT3E40J5ekTCHn0E9tUInuwg5fG26bsUTIDDxkoUd1uqsdHouaWr9OdqyI8AqvJpTDXL1DeJOLFVDpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

On Tue, Jan 20, 2026 at 03:16:15PM -0500, Zhanjun Dong wrote:
> We have several bug reports [1], [2], [3] describing failures in reset,
> wedge, and unload corner cases where memory is not properly freed or
> fences fail to signal. This patch attempts to address the issue by
> forcefully killing any remaining queues on driver unload and wedging the
> device if not in mode 2.
> 
> Zhanjun Dong
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> [3] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6029
> 

Thanks for picking this back up. I assume this series fixes all the
issues which you can recreate?

Matt

> ---
> History started from v2 (v1 not found):
> v3:
>  - Add patch 3-6 in series
>  - For "Trigger queue cleanup if not in wedged mode 2":
>      Add guc_ct_stop and reset prepare in patch of:
>      Sync with baseline changes
> 
> Matthew Brost (3):
>   drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
>   drm/xe: Forcefully tear down exec queues in GuC submit fini
>   drm/xe: Trigger queue cleanup if not in wedged mode 2
> 
> Zhanjun Dong (3):
>   drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
>   drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup
>   drm/xe/guc: Fix page fault by moving guc_submit_fini to devm
> 
>  drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c | 68 +++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_uc.c         |  2 -
>  3 files changed, 45 insertions(+), 26 deletions(-)
> 
> -- 
> 2.34.1
> 
