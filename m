Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3534C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9012F10E60E;
	Mon, 31 Aug 2026 15:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNj+WN+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5C710E60E
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788188399; x=1819724399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K0MbsMaScuCq5CQ8AZFFpKq78kLQSuHiaaY0VkCRL54=;
 b=UNj+WN+H6PWsKE0+K9JVbuCzJjfyP3pcnGg+o7woENEcLTmKe3zG4pVZ
 a+BbPLWCJZoDwBpG4ZotYV0ThpilFXbmYIBOuKGVgV0n+QXsSZK3MTixT
 niSnOfD+9Xqg49OQCxZ0c2iWXV4QNkq2smDYSbg8XkpnOeb7/TvpWQxb9
 EakB+TcUS8YH2aFLwO8yAZuTd/6IdCiDl566/ys74XRWTCh46hx/DMUOX
 XabhBFuF0iY3oZgihWnj2E9DpGYifEuf4/pDgitUMW8EkikOkI+si5dmT
 p/m+4NpW0rlx6khwAP3x55xUx4lmMTnul4OuFM4CL410UazoOG7IlweAN Q==;
X-CSE-ConnectionGUID: yFcTmMxhTG+ayCIm4h+ECQ==
X-CSE-MsgGUID: 9J8Ffd6yTXKrrPQe6++LaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88722768"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88722768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:58:11 -0700
X-CSE-ConnectionGUID: U1ohbbp6SduMEf5ApAgfjQ==
X-CSE-MsgGUID: cTjwc/U9SSiNPEbeiykK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="292314571"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:58:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 07:58:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 07:58:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 07:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF2UCa7l8OpEguNEe3oLFFP4zGlYM3tSbPmMFijopc00J6SVEuT1sb/9MJ4deWLOgq8rr5H3YCK8fHqOAID9Sy75P7aOPxKShcCg+Ky6DigBlRyqLIVnUoZeyxYLlpjck8hxsVFS6JlAcE+9ZmcJvx/jqkBoJSY3MtfKabrHNHymc4y/rd9YOdTutUsHJFQfkaKWyI5pG6nOCdYx48xqWuAp8wgy4PBmM/56xcDFt+fcNETqVPsNOf+pXNPJL/SFmIWLFIwBvuLgPUc1kUJx9MOIYnCt6GyWX6YE6mIfk4gGLLXoQrLE7PFSGlc31JByyADR2B3DdBENTTH/y4RhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X2iZWn2zkbkJtEDzOa2KLwutCfqMUnUBHazwRT/aCA=;
 b=YLG1PHOAhshrOTo5Heubo1TOFxEUF1oJCdOThNjokoWatJP56nr8tC+pncFcbGy7O4JZC5GfhkoVCnHLN2iCPR+Qx2xKLTH1d5fEhrDtA8x8BTzonSn2bfgTq5gVws3U64mRD3jn30h41eCbGFJZSRzbQ99MP+3VdWLEW7VVVOJtPkdTbQiT+Uh4qiZ7fYLM1sJB4tJCL4/r7ANvqimJPI4vGnDNPf4myBJYFlo5a/CnKoRcq9JUasEHkQ2xlbYby/3oqsTzfNjLdmN9IjwbVikTt6T7aGHFvHDdMW/8D1KUJvtg9ppNEwgqyM2oieYevXwskZJiLcwL0o3LQaKdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:58:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:58:08 +0000
Date: Mon, 31 Aug 2026 07:58:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V19 00/15] Add memory page offlining support
Message-ID: <apWWfUQ+SA/F+8Rv@gsse-cloud1.jf.intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <apWKAFsHP9XLMOHn@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <apWKAFsHP9XLMOHn@intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5025:EE_
X-MS-Office365-Filtering-Correlation-Id: 66eaf48c-7208-46fe-30c6-08df077044b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Q3wsCJ6EGWFVUMKcRNXAdIxIawGgTtdfcqHrlDBCyURwxh1M6nXVOWHS6ZIl0pxNslTakzFXkea40rDZm2UnIoGCwHZRK5FyueCgBWXxslwEIAk+5CoxHhcDLvb395phJYH5YXDxse6FMDwZH3BedabNaZBhfKaVBx+Px/cOShP+99+4FxsUS6tnrYk3z5NusJTdtg1tO/TGaTkujAgtzBzMOZ659wofXGE7sSEnHs7Wi4r9gh5MaiMRNzDTgaliloaLt7MeXFV5QA2972bwYxcSL+5XwnmTsys7GQktHNq0zrhOE1k30KBm8i1IKBRiU/TtyR3oMWZMtoDpcruiBE8Uv23R+rDsGy8/DMoqU0wH/pwuYiQvEkjvfpJ7wvMdGPkcLNz7G4Ygs9YIyIEW5LnIPB5SIAwplK8nOb9fKWOIRv34BiVgHX9hOUUsFQKprE3WgDk3IG1PZnxqvy5wvs245NDrJvI39YSW/vnkJ3TSoMdBmB6oPTd/8+UV0IqA5cQ98aqRSuXCJLC5ku/9lFwQc0lr6GMNd248/rZfgwY5UJLXxkfywkzI+Qx5fYU19Jg5AsecG3Tqhslveew1ddCeTQCi0T+GSnpY/lsPOhzJ0YA+aEM2NCF1PPTW/fll
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O5vgloGGyG8TjqBRmV1fowJNZuT+fQHuc7uwEAhf7IhIrkYQwnafvO/cRx6/?=
 =?us-ascii?Q?ibeeSH9yi02x4TO15b71uP68O8YxMfJHRQcFGkmJvZZxCngRVoitWJXNxuMW?=
 =?us-ascii?Q?SdZrNs8+V1e8ULOCeao72bHkUs1Exjpznesk7onuYi5qX61uOwEGjMcxqrxt?=
 =?us-ascii?Q?fmnHB7/btFpVDFWdmAv8HfTh9zYzSFu4bMxhNRq5J64dDsybgN9YdYzaSWZt?=
 =?us-ascii?Q?aLVLEN28ALjYxlMmN7rVGZS6U0Ws34W07hliOI0O6l4ae5PMjzGum5c8d61N?=
 =?us-ascii?Q?08kS5ffbqkS/54QIgKWn+qLQSmB2atSXs2dLw+bRN5jdUuasuF68AFlIUJ3y?=
 =?us-ascii?Q?87aN2ukk/2RXaG1prptbSDONhSIB7SGrZqA9qvAOXUn+cX/pE3kH0jUxIflx?=
 =?us-ascii?Q?0KF8FD8O2eZaoedSVADD8MvqRNiH2IXGNwtGENxr0EcFBQ1dj3Nh/TvW6ptp?=
 =?us-ascii?Q?Se/8j1nK6tMg0VHFCwK5ZjzOGzUM1KV1YPUhq1y+bsZDsMNFHEKo2HfCh1zK?=
 =?us-ascii?Q?/HbTnK1gbNRWWxgHtuNu4VSW5OEMNnmx371hP1qZ/M0GzhxnDNR4j8+tmRo9?=
 =?us-ascii?Q?RPL259TKuMruB3DH6gTPa1FAra81yjNbRRvcZGPLemCuh0qs/VNkyOYfllxX?=
 =?us-ascii?Q?Ly2dCnRcweq5US2pJ0fuCxVmCoY1duyz2JXGemP5JjzqjvWuoJnRNXk99lfv?=
 =?us-ascii?Q?Fo2ozBASZDNg/b8MohmgHGX+NWlOYfmqyMt1OgYRpcgUHZI0eCaOfxfRAaKa?=
 =?us-ascii?Q?z3hndOfaw3wGbLB36L3sFtZS7Z6UWQSi1rqWgtsTwRkCzJet6+1ywxTf+lx0?=
 =?us-ascii?Q?mIc+SmnY9Hunztga6LfQ1YJdkXMdAJCED+QWD7xxn+3uLFOKTgVW5d5uHLvP?=
 =?us-ascii?Q?k90J5xcWY5X3aipfkiMkh09Lk2Rq19U3VW8m7JqtjwHczOKfiHvLNUeyHZB1?=
 =?us-ascii?Q?HDOqqHNSdFTgVPGGShOke6lpOEYmBDs8ImUAzbSp44ALU6qUljsbrtU8WcOZ?=
 =?us-ascii?Q?D7VBPdfAsrz6I+quIXA+G2i0b9uqMeDtxxS040Q9Ce+JF1iP/oyc61dABfJd?=
 =?us-ascii?Q?R6WShIJny6cuJApD3gNhoXzINxnl4YSNVsSJFScGD7ArI481E8SajjdQJ2ra?=
 =?us-ascii?Q?moIYeRFYacEhCW1Z6wsnDx8Ep0y6p0th0WRGXBu7/cOHuR/ySsCKNomBCCWk?=
 =?us-ascii?Q?Yr+VQtENi1WCZHVfACbg4k/i+9QOxPRVxTqvI79ErO3LnBU1+oKO+JBEy9Hr?=
 =?us-ascii?Q?4iVJJxfuiwsblHl/jW7AgrImrY0Fj4mOYuV7TJKFA3PwaeAIm/wpMCFRQKor?=
 =?us-ascii?Q?dMY0yPC6I3NI5E+HRxBLiriP5c9QJX6nagTlVSGdvjBxy3FCBmFZJ1w3HJNC?=
 =?us-ascii?Q?V/SDdyk9Eu2JK+3qR3yC2saRMDBex/3BCNN3BBt/N037SwB3iHabFl6ds/Es?=
 =?us-ascii?Q?rZCIZbHfNMLrEX/jOOi6eHaBnjbcsBNrDj0XMmSupJiLier5pgF5UeDcmPo0?=
 =?us-ascii?Q?HmTbMG/xGXKftvcNtF0+pbZ4O9DnDQ1Vdj4osMrJC9qoj6ilTbTe4AmiBeo4?=
 =?us-ascii?Q?mzJT3xWm0hqmlYPUv99izFDUwfNPj2OlswIJWJljIG6FmeXkDzIiuyVd52dk?=
 =?us-ascii?Q?HHtCN22WwUW22ikhU4xFT+LaKDrjI3QNN25FEGPiCwYyP02RnCRFm8vDQ/zE?=
 =?us-ascii?Q?ZYJWjMen9P5M25zP9Ph9LGU7zXP7SRFXze6i4EDVkKefkDKEHn8VIoUvVwru?=
 =?us-ascii?Q?d2ibAJ2Iag=3D=3D?=
X-Exchange-RoutingPolicyChecked: RqzbCPcC/2hhmXefs57QJja24hU5rop1ejCN72bb7M0Z1C2XTZWF+sVzn8W/pU7JOz1MLgAYSFZdzlyc4oR9Bp7ErOuvVQy8QeqDbNz8t4Ai3olTOWHFefVZwbiFTXGhkvI2LP8dwJUlxE5LA8Si8Z/+ipstWP4T/sv1m8ePy7EDi6tkK3Tb4nyzJ7mop+7OiafzaTzxmeDCWS4YwpSpPSs9EW5plqCQie3sfTaCxJCrHDfeMVKx7XzAGdKWopEMKUKoBEqR2+zutOuM8nsm1UFyVYVJ3GGsCwqrIaVekhV0gvjPpyjeMQayyV1FIvMvhASPmBmlKW4RKiO+Kerk0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eaf48c-7208-46fe-30c6-08df077044b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:58:08.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WnH1ehDSb2A3+BLqEm7m2r3+GNVHkS3t41uqI4LuiWmXOlHt21QPoOXhltvPL0M1XrnCckkyu5ymLK+wccVgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
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

On Mon, Aug 31, 2026 at 10:04:48AM -0400, Rodrigo Vivi wrote:
> On Mon, Aug 31, 2026 at 12:19:42PM +0530, Tejas Upadhyay wrote:
> > This functionality represents a significant step in making
> > the xe driver gracefully handle hardware memory degradation.
> > By integrating with the DRM Buddy allocator, the driver
> > can permanently "carve out" faulty memory so it isn't reused
> > by subsequent allocations.
> > 
> > IGT tests for testing this via injecting simple single address and
> > duplicate address fault to unit test functionality:
> > https://patchwork.freedesktop.org/patch/748439/?series=170555&rev=2
> > 
> > v19:
> > - Sashiko review comment closure
> 
> I was going to push this series, but I see that there are still
> many Sashiko comments that seems valid in this version.
> 

Let me also take a final pass look at this too before pushing it too.

Last I looked the large number of Sashiko comments was my concern.

I'll make this priority to look a bit later today.

Matt

> Could you please comment one by one at least documenting why we
> are ignoring those? (I mean, only for the ones that are not pre-existing)
> 
> Thanks,
> Rodrigo.
> 
> > - Sliting of making xe_bo_ttm_purge() export and NULL handling
> > - Remove redundant code in xe_ttm_vram_reserve_page_at_addr()
> > - Resolve nit comments provided in configfs and debugfs
> > v18:
> > - Splitting out the sysfs patch; it will come later once it is redesigned
> > - Address sashiko reivew comments
> > - Add debugfs and adjust igt tests and fault injection
> > v17:
> > - Rebase on drm-tip
> > - Enforce CONFIG_FAULT_INJECTION_DEBUG_FS for fault inject
> > v16:
> > - Correct sysfs patches with moving code with rcu lock
> > - In case purge fail let next alloc decide final failure
> > - Remove addr_to_block API, its being pulled from drm-tip
> > - Remove some unused code and replace where existing API can be used
> > v15:
> > - Split few big patches into small
> > - Avoid vram_mgr lock in sysfs
> > - fix missing queue_pages counter increment
> > v14:
> > - Solve sashiko reviews
> > - Remove SOFT->HARD offline patch, decision is taken based on -EEXIST
> > - Dump gpu buddy allocated patch dropped
> > v13:
> > - Add fault inject and remove standlone debugfs
> > v12:
> > - Fix Sashiko review comments
> > v11:
> > - Add BAN reason for UMD to know about offlining
> > - Add support for soft offline mode
> > - Rebase and remove dummy lockdep annotation patch, as it merged from upstream
> > v10:
> > - Remove RFC
> > v7:
> > - Improve debugfs warning messages
> > - Use scope_guard for locking(MattB)
> > - Adapt addition of queue member of LRC BO(MattB)
> > - Extend and use xe_ttm_bo_purge API for vram pages(MattB)
> > - Handle dma_buf_map requests for native and remote(MattB)
> > - Address if in never initialized block, set block to NULL
> > - Add lockdep in gpu buddy (MattB)
> > - Correct allocated_addr_to_block logic (MattA)
> > V6:
> > - Add more specific tests to noncritical bo sections
> > - Handle smooth exit of user created exec queues
> > - Break code and make purge specific static API
> > V5:
> > - Sysfs "max_pages" addition
> > - Reset block->private NULL post purge
> > - Remove wedge, return -EIO to system controller will initiate reset
> > - Add debugfs tests to trigger different test scenarios manually and via igt
> > - Rename addr_to_tbo to addr_to_block and move under gpu/buddy.c
> > V4: API reworks, add configfs for policy reservation and apply config everywhere
> > V3: use res_to_mem_region to avoid use of block->private (MattA)
> > V2:
> > - some fixes and clean up on errors
> > - Added xe_vram_addr_to_region helper to avoid other use of block->private(MattB)
> > 
> > Tejas Upadhyay (15):
> >   drm/xe: Link VRAM object with gpu buddy
> >   drm/xe: Link LRC BO and its execution Queue
> >   drm/xe: Export xe_ttm_bo_purge()
> >   drm/xe: Handle NULL resource and allow purging of VRAM pages
> >   drm/xe/bo: Make xe_bo_is_user() public
> >   drm/xe: Guard teardown paths against purged BOs
> >   drm/xe/vram: Extract buddy alloc and free helpers
> >   drm/xe/vram: Add page offline data structures and lifecycle
> >   drm/xe/vram: Add VRAM page offline fault handler
> >   drm/xe/configfs: Add disable_vram_page_offline attribute
> >   drm/xe/ras: Cache disable_vram_page_offline policy at init
> >   drm/xe/vram: Check disable_vram_page_offline policy in fault handler
> >   drm/xe: Expose bad VRAM pages via debugfs
> >   drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
> >   drm/xe: Add fault-inject based VRAM page offline injection
> > 
> >  drivers/gpu/drm/xe/xe_bo.c                 |  25 +-
> >  drivers/gpu/drm/xe/xe_bo.h                 |   2 +
> >  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
> >  drivers/gpu/drm/xe/xe_configfs.c           |  72 ++-
> >  drivers/gpu/drm/xe/xe_configfs.h           |   2 +
> >  drivers/gpu/drm/xe/xe_debugfs.c            |  51 +++
> >  drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
> >  drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
> >  drivers/gpu/drm/xe/xe_drm_ras_types.h      |   3 +
> >  drivers/gpu/drm/xe/xe_exec_queue.c         |  14 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
> >  drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c         |  36 +-
> >  drivers/gpu/drm/xe/xe_lrc.c                |   1 +
> >  drivers/gpu/drm/xe/xe_ras.c                |   9 +
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 510 ++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   4 +
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
> >  include/uapi/drm/xe_drm.h                  |  18 +-
> >  19 files changed, 760 insertions(+), 46 deletions(-)
> > 
> > -- 
> > 2.52.0
> > 
