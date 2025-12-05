Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0562D2CE1B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 04:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C1B10EA03;
	Fri,  5 Dec 2025 04:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd8Tzgs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8FE10EA03
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 04:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764907800; x=1796443800;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e5rgRzG5ixUxS88IWXQP2D1hCwL+l8SiQPNZMk8ZBKE=;
 b=Wd8Tzgs6uf508RycmDyzFQs5G0bKCA615hCYya4pIJPuTRkzZn1cCjNg
 FNtipMTrRzV3M3iL79+mI6XKDdKqEmAB6FgGHf9dsjmalHSd2Sw0/pwi0
 nht1jtHRSeghz1+eSQoBRhXBOTrd/KQMksVuvLaaSvjsmTerG3oK2J6kd
 GWInamuVY+/tcH8+xtiSLxc3H6l/doDByzkb7Znmz+fAtlyrSVqy4AAMc
 Ib7wdA1DKwo+YMNVon6mT7urmfsJu7lDFtgxT6o713IjLR+BOkGesAajh
 lcgQBcQQUZDSsT3dOH02aTgZiCr8OEiXHJ3qorxKSjYC2lUGTobT3hqH3 g==;
X-CSE-ConnectionGUID: CfVqdWxSQquV3YjqD7WvLg==
X-CSE-MsgGUID: qEMDZR9sSJmXx2w0MvvmwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77262844"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="77262844"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 20:10:00 -0800
X-CSE-ConnectionGUID: ZNelrJFHQwqzSNIMkRBtaA==
X-CSE-MsgGUID: 7XH7b+yhQw+9xjam8lhi1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="194479514"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 20:09:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 20:09:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 20:09:59 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 20:09:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK2yXudrm3+Thq5DgQ1vHF5Kc/DH1RsyRrD7KqYM4DyxX58MhurmVRZHH/+/mEJ7h5b7K/IxqzqglSTaj/wvZCunpKbkrnvD3wYBig73FQwuGcbXIgzr8WuMmjxuvbDaK2YlA3K3BUTpPs7L7N7W51BmYVMzcY0D4EXx5EA9YFnHLgSZJczGAg5x5WQ0Ox7J2mtW+lUN+vFdfaowGg52PSK6wQBgljtjJx6QU4c5C5ncN9a2f035OPvOhlburXoCWsSkYeqjnkIj19mw1fyy+6KSXfWATVxAqa23e5yPlW9PQYoi2YuF1S0mgHdkSypX1qGS0DpJSaGoZK27IMDu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAQ8F9LPEF31iW5igOu7T+l2j9Z161NJSAWGS0xQ3J4=;
 b=nXpJcAM7s/ueU1OPsfkb6T/w82ttFUqVIB3inWjbVIkuz0p/C3xewOSDH8URUVQOEn7WJHH7vlsuQxoNZ5ZEK7+0PfZIO6eRa98ubZFOEV0+Ua+jqcbJLl7K+/MBZYW3dJPC9sZYCE8GC90x4xc3EKMyAJt/unJm8ZTiCO8MWQm+66TKQTC9RDWHamtDhqqxJHjuzjalVpgdt9npxREbJm426Gje3paSFlTuIkbAfblSWd5uMrTRjkVvLBYh4EHaaJCgLePX8Q/h59EPbqzMxGZxU7WmhBCqgCvJnLJlZapG948svWodvvruxn8qAL+l+Nf/r55E/NidxUJELJzaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9250.namprd11.prod.outlook.com (2603:10b6:208:56e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 04:09:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 04:09:57 +0000
Date: Thu, 4 Dec 2025 20:09:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v9] drm/xe/uc: Add stop on hardware initialization error
Message-ID: <aTJbEulTxUNFySK4@lstrano-desk.jf.intel.com>
References: <20251128213411.3184051-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251128213411.3184051-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:303:8c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a0d565-39e2-4b3b-db2a-08de33b4269a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h0CBQ9SRH5Aorh2ynQWs9uot4j5wqIlQni0IUYRQvgEpW7J7z6XWFeSkUUEz?=
 =?us-ascii?Q?iIn6hwgdxcTK1OKRvIfGYX69j5We2RTdW+RwdftS/X4nkA3uuBSiH80rebNX?=
 =?us-ascii?Q?6dRu2VZMJa8JmV/hbPtjQWPPp7cl7ECc5CkouwIT6LnIINzfqogWnNDYv5P/?=
 =?us-ascii?Q?u/I/3RXHk54N5b62Qa5nzNo368r30jjx0zikd3zy7oBScZEitG6cDs3KiONR?=
 =?us-ascii?Q?mzao1npjoVQ2Ha4krtiGfmxCnJuQPA8zZUODJPngmL88oIP2PQ5zr3ZbEJlu?=
 =?us-ascii?Q?pbphSToMNNdBYp3oNFk8AVbw0M1TXoffsblkz1rCY43clJZN5qeyQN7dEqYX?=
 =?us-ascii?Q?INnOZeSAFd6Ya58FI/dAE20KmZ1ogkVNPKF8sYLJn56LRDZcseo2IL5qFp+D?=
 =?us-ascii?Q?2BAJ3QDCsLE5Zq1BTuR/CaA2o2qaoQzgGjIpMz7wxGwrLey8m4eTsCA3cTU/?=
 =?us-ascii?Q?Th9VYrp1iwTIi3HvCKFTHGC3UgKC7hGZycU07D4N1Rz/GuaVQhN9tk90/AP9?=
 =?us-ascii?Q?qvJIshmPHiWmxfOGwrC/J2irGGEwh6k/JrtKHpKd1TD1sQS4SQWwn4drLJlV?=
 =?us-ascii?Q?+UWSUEA0XS22Lo1Ni/mjo8p7kBnefNo8IQ25MyHu6n7k2dGB0FQPHUwv2rtA?=
 =?us-ascii?Q?C6/OfPC9/M7mEOG76T+Yi5Fz9uCS3oq2MilUYqnJYEL7mwOohBWHddV+nWTU?=
 =?us-ascii?Q?1L3tRb8i36lg24yOAVfGGvwij4XuQc5IvgzTI+HS4WKpqpOgZUlTMMwfp3bm?=
 =?us-ascii?Q?afPfy/WMS99pfRd5fduviYQEwdWw+UkO39EXbJIVoFfc1lXRm54ynOe3kjpE?=
 =?us-ascii?Q?hs+ZulIZ1Yo5VQoIFrtcrxUCm5zxpMCC8JtqzNo73+QXRMzSa0Q+VnfNtHwO?=
 =?us-ascii?Q?e3lXNU72q/lHMvwsQdXs9GrAbEDmqCuZc1rMrV+qNmcPRw5f+jxBE7E/XmB2?=
 =?us-ascii?Q?eRe3EEWRrv1uF/PxRBRrCWG2F0TTtPpw2VwMcQVNZDBBUiNfE9bBL2IHEAtr?=
 =?us-ascii?Q?XnWujj/nTpT0p4IujWWVU3olpIl8Lz/14oP5aDiLGggXc/LEabLsejNtJvba?=
 =?us-ascii?Q?XBznrvVzI6hJaT5WwLM0sKeAiqrcfO809ta7rSf2T0gE3H5YKjQ4V3uFbaUZ?=
 =?us-ascii?Q?aFghttaljW+O/k42v4LR4oQZwmzLneAHSx1HioyPkz2gGRiXXWIajArTHVP/?=
 =?us-ascii?Q?VDq+tqrWsusRsQDBqpGupA5bQygPcV7ZLK1IN4TLKis/UhyE6Fgnl+Xe8N7+?=
 =?us-ascii?Q?tO7bPsI4BPm3krZdHppGPrpF4wLJ03nLfGmnw3Dw532/pPQJyDq+cUr8A1E3?=
 =?us-ascii?Q?/uM+XeybcPszYkI9FzI6vMy8hJJWILK8525nJhMdGdQO5wS+w+oqtYqsKI/O?=
 =?us-ascii?Q?HL6BdzpRnobWMZgYn9Hw9C+wP104uI07qH92oegUIJZ5eu7G65KW6Bh14RmF?=
 =?us-ascii?Q?AmstqhyV7GLHwpG30KLwxClryJ6hxBAp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tda8CoFYmyoIwypKTNmsCsp1z+q7NaB/Vem2IKx0nCakHnTyA8DVJVYNJkQP?=
 =?us-ascii?Q?/42TrnE8vQzXeRONLlH3Zjqqphc7DWpNP3g+5cHuuopEQGRYh/l53MSSf5sC?=
 =?us-ascii?Q?xIgHYbKQgnTvmRP/GQqnuURCO04odPffNJhs3IeXNrrl/awZSG4FQosLk/qT?=
 =?us-ascii?Q?lh9y/MYzcc9SOeRhpx6j5gSsnAuYdIZyuSl7nibJH3w2OFLqTsNtpmNeO4CA?=
 =?us-ascii?Q?uI6K4Z7IbwnlKYPYMnVgQW+WFuSyrq5+1vWriesdRrykywoIfI7RXziKboU+?=
 =?us-ascii?Q?NsKQhhD58lkx7RgT+FVKb1R8uLVY8qHONZlPG2Ddr4HMPBiTwW1TkY4wIYwT?=
 =?us-ascii?Q?oK+pdmcR/CSwMRYU5sA+hf7eDBEZS+WEBj17BqWcA+Z8fkjVMPYVcbxOrztU?=
 =?us-ascii?Q?prKrj5f7OKPukI87R4P93+VDsa4gMkkgW8W1Ho5i8QnbciwO/8N5K1kC9utP?=
 =?us-ascii?Q?fbwRY8mtL+1TNBpFvdESM7W6r5A7IvZNP2Kgeqh1jPvS40nfWwTRak3L6Wf7?=
 =?us-ascii?Q?xOHWpkUu4gcZfepSyR9iLRvPMzWUUNNdCtCCHtF2wrPZ/Gm3XGb0ZqJhCsPC?=
 =?us-ascii?Q?WnhCvXQeBr4nu/in927hHkfydTiM8dToh0RhSNgc91EKl+j8WP20UVtlTvpr?=
 =?us-ascii?Q?Zuulpob3Do2+JYQQff1MgINVjFTQVigvEtCI29KVa+yKJ8uE8nVOpb1mwJ2+?=
 =?us-ascii?Q?bYDtDwz5isTIyKilAUXzn3mQHwcUWo6mR2I3C8WBVPmSIWwiUUg1awL9B5xI?=
 =?us-ascii?Q?j/DjmfJJwu8Yg2/mdeL6Poe3ZZAHSXKklpH14KOGhbQyQDErufP5apPrSCvY?=
 =?us-ascii?Q?aaZdmq+nddBsI3gfTDGXBvwXm3+JjwaRiIQUmBnIdkssJ4C/DQ7Z0l9iUN1/?=
 =?us-ascii?Q?wMGFWLCUinvss0BYxUuf6OroUHA23eVcsRkWqcPk58tTsybvJJtQy07gOGVM?=
 =?us-ascii?Q?1UwYw5sOPeIK2IuKpkGbemd5UuxFZ+91TVdR274KKE+O6BgKGN1z9diTybyX?=
 =?us-ascii?Q?ybkl8N5fqODdD1ej8dxV5oqQwiegf8xXQn/JG/F7oa3R5NzMpPqx+cDVMn2w?=
 =?us-ascii?Q?BF67DlrOiyauY6fjhgDqGA8sKLvM/1g4fRszWvE7ZJOJuhpVWT4bHCijGuYh?=
 =?us-ascii?Q?xp/8moIsKKXML2U7Ys4Elm054Gu3SxO45Uh/Dh8PzFQhNzxy2B9aX24seU1o?=
 =?us-ascii?Q?Xk546NHk5zR0MGc3BjTNGLC5ecrmYahC5mJehR6h9oTNMoZWYw78Wzs8Dkam?=
 =?us-ascii?Q?O+oXWFzoeNTW8hEsj9nemgvbYFzbM2o8ftWhac2gVkB973DhgehB6M036YJ8?=
 =?us-ascii?Q?vI7vdJuCONIUVnLDbIspM9Lk9D/aCB+raVSQOnKus/lJ7WVw64S4vnqpUJim?=
 =?us-ascii?Q?Z0oOtnBRbSwjQoRivamqxuVp02rkIay167PIWoj6BGvxb8aZsELEo1O43BSp?=
 =?us-ascii?Q?ZZXNzDTRIoxy3gfH/icYI0kKNbySi/OQC4d5JI32/ripxgmAC1dCY2W4Zz2P?=
 =?us-ascii?Q?2DDDG3HXGmT2bLesz/xo9zWyQy+nxaelZlRO+KHl/dFcf4gr46ibRvXH3TbP?=
 =?us-ascii?Q?O0LNCbeTA3EtTJW7b4vaAj5Yk+72QncO9tLtvrCv+cEFy3DN4tJEl1heSp/o?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a0d565-39e2-4b3b-db2a-08de33b4269a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 04:09:56.9842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5STN1SkbPp3ta8t3N72WMz94uq7bJzCDiPcdnuAK5AR11t/jEcFmnJGdb4zhGDgKy3oHHO0gZN6PkGpLgikHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9250
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

On Fri, Nov 28, 2025 at 04:34:11PM -0500, Zhanjun Dong wrote:
> On hardware init fail, the hardware might no longer response, add uc stop
> to clean up. At driver unload, all exec_queue items need to be freeed,
> change xe_guc_submit_pause_abort to free all contexts.
> 
> This will fix memory leak issue like:
> [  189.997904] [drm:drm_mm_takedown] *ERROR* node [00f0f000 + 00007000]: inserted at
>                 drm_mm_insert_node_in_range+0x2c0/0x510
>                 __xe_ggtt_insert_bo_at+0x167/0x540 [xe]
>                 xe_ggtt_insert_bo+0x1a/0x30 [xe]
>                 __xe_bo_create_locked+0x1f3/0x930 [xe]
>                 xe_bo_create_pin_map_at_aligned+0x59/0x1f0 [xe]
>                 xe_bo_create_pin_map_at_novm+0xae/0x140 [xe]
>                 xe_bo_create_pin_map_novm+0x23/0x40 [xe]
>                 xe_lrc_create+0x1e4/0x17c0 [xe]
>                 xe_exec_queue_create+0x38a/0x6a0 [xe]
>                 xe_gt_record_default_lrcs+0x117/0x8b0 [xe]
>                 xe_uc_load_hw+0xa2/0x290 [xe]
>                 xe_gt_init+0x357/0xab0 [xe]
>                 xe_device_probe+0x403/0xa30 [xe]
>                 xe_pci_probe+0x39a/0x610 [xe]
>                 local_pci_probe+0x47/0xb0
>                 pci_device_probe+0xf3/0x260
>                 really_probe+0xf1/0x3b0
>                 __driver_probe_device+0x8c/0x180
>                 device_driver_attach+0x57/0xd0
>                 bind_store+0x77/0xd0
>                 drv_attr_store+0x24/0x50
>                 sysfs_kf_write+0x4d/0x80
>                 kernfs_fop_write_iter+0x188/0x240
>                 vfs_write+0x280/0x540
>                 ksys_write+0x6f/0xf0
>                 __x64_sys_write+0x19/0x30
>                 x64_sys_call+0x2171/0x25a0
>                 do_syscall_64+0x93/0xb80
>                 entry_SYSCALL_64_after_hwframe+0x7
> and:
> [  189.973775] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: GUC ID manager unclean (1/65535)
> [  189.981731] xe 0000:00:02.0: [drm] Tile0: GT1: 	total 65535
> [  189.981733] xe 0000:00:02.0: [drm] Tile0: GT1: 	used 1
> [  189.981734] xe 0000:00:02.0: [drm] Tile0: GT1: 	range 2..2 (1)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> v9: Rebase and keep xe_guc_submit_pause_abort name unchanged
> v8: Fix __mutex_lock warning
> v7: Clear all queue items by guc_submit_fini/xe_guc_submit_pause_abort (Matthew)
> v6: As huc not involved in vf_uc_load_hw, roll back to guc sanitize
> v5: Move stop flag set in guc_fini_hw
>     Change to uc_sanitize in uc init path
> v4: Add memory leak fix
>     Switch to xe_uc_stop
> v3: Switch to xe_guc_stop
> v2: Switch to xe_guc_ct_stop
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 6 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
>  drivers/gpu/drm/xe/xe_uc.c         | 8 +++++++-
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 88376bc2a483..64e5959bfb60 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -662,6 +662,12 @@ static void guc_fini_hw(void *arg)
>  	struct xe_guc *guc = arg;
>  	struct xe_gt *gt = guc_to_gt(guc);
>  
> +	if (guc->submission_state.initialized) {

We probably should have a submit layer helper to read this variable.

> +		xe_guc_reset_prepare(guc);
> +		xe_guc_stop(guc);
> +		xe_guc_submit_pause_abort(guc);
> +	}
> +
>  	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
>  		xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3ca2558c8c96..a64aa4edc360 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2417,8 +2417,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>  			continue;
>  
>  		xe_sched_submission_start(sched);
> -		if (exec_queue_killed_or_banned_or_wedged(q))
> -			xe_guc_exec_queue_trigger_cleanup(q);
> +		guc_exec_queue_kill(q);
>  	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 157520ea1783..5967b8d9f3cf 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -173,6 +173,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> +	/* Stop guc submission */
> +	atomic_fetch_or(1, &uc->guc.submission_state.stopped);

Can we call xe_uc_reset_prepare here?

> +	xe_uc_stop(uc);
>  	xe_guc_sanitize(&uc->guc);

I know this is existing code but probably xe_uc_sanitize here.

>  	return err;
>  }
> @@ -231,7 +234,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> -	xe_guc_sanitize(&uc->guc);
> +	/* Stop guc submission */
> +	atomic_fetch_or(1, &uc->guc.submission_state.stopped);

Can we call xe_uc_reset_preparee here?

Matt

> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(uc);
>  	return ret;
>  }
>  
> -- 
> 2.34.1
> 
