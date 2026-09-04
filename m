Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F58C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 04:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4660B10E049;
	Fri,  4 Sep 2026 04:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lllSU7Sl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C806310E049
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 04:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788496418; x=1820032418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YYDCXCxAjyd6EtX17epyyg4KvYUoHSgN0hY/IDICv58=;
 b=lllSU7SlL0T1/mpQnyL16FydZFz4I0DGCeRQVMop2tWRR1oYEax0ruNy
 PVQq477Bp9tAzOe08u5ytqWkPtH0A2Qi5IqoeefiP2w4CRxxKK8g4u3+H
 u2K6ycviK4y7nqrBBwNqWlXCTPo7KW3HJxhBb84HXStO9HOQF96S/1fgC
 xaOXsiR9S1kVu7bt6qHd89LkvoHBaWp7+bpRPhe/IENwLG0XhVkx17XHa
 MBXaLFoKA2oN/2pxWK5JXWB3ltoZBqZbTFp/iGX1WkTYtC4ZP8qDY0xdH
 1TLFQjBYHYhmk7twuphMHdNG1T78ca2+o7QNNr1tR6njKfI3dqvBPkKCy w==;
X-CSE-ConnectionGUID: rcsorRWTQsKchHgDvm3XoQ==
X-CSE-MsgGUID: Yb6ob3OMStmvIMk/oxegZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91506100"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="91506100"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 21:33:38 -0700
X-CSE-ConnectionGUID: UHTM/F80QgWQoZPTv29fUg==
X-CSE-MsgGUID: 8DZXIYrtT6Stquq55/Znkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="269915730"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 21:33:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:33:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 21:33:37 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl3NDEoh6o/mRYQjCQOu4TBKo5hPJ2YxSdUrkexEnW0GsVoCk0IJAQcv5cwZYTYp21qKFs5r4Hmh+3Uc/1JBbgF8J/iHYqRysdKOdvcELGHFHp/aI9AV7PNzlvo7vipgqzst2BaI71KnNyca0WiFeIfG62ytCRzKnYcyX9vmS+j04Z/TPLwzzLPZuS95iFkGKj+ER4UGfIlLAx1vMpWtUexg2hOe6JyDWPsskg8jiwFqtUeMqZRmL2b9wexdgZjnoeifKEUbYf/Tdk1ONhGK8/EqNKm0iuVIQM3JfjD+e1d3TwQj9NSln3n4+CLbNeRP0UBL5eVCnlVIjtP0NmqqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01p3vJ5KZ2XBwkUj33HQiWckt4iOmDaaR8qxNbOjfdo=;
 b=A//XJLB9gVhbZgidutl+SeHjgBrme//UP+OZx6LE/IeD9Tdfjm7U6Ypn/hDqaVPnxsKiEm7q27PVtMAciGZ9QDjF1Ps4w04ULURu3PCygiu0NUU/hhzjhBnSZsfRE8dbJ4uZ7urKX6TZR5zrVfxGLPtHEzgz61G997c7Cex/RQubaupQ/O/ZTC7TxxDwSRZSfvBa25kp6YEIVDTJjjlHD/24/R7ngCSRL6y30qM8099xb8XJIwD0rT3P5AYY0FfkheHqkCfwAFAj6VCwI6QZpTjKqdRBIbYvH4usXM2Oa7p2dPCxgrXufB75d818CWhqu8/ISOtRI0DCBdPWqOR5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:33:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 04:33:29 +0000
Date: Thu, 3 Sep 2026 21:33:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH V21 00/15] Add memory page offlining support
Message-ID: <appKFu13lcW6tJ7x@gsse-cloud1.jf.intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:303:b7::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c763c26-3e8c-409b-0089-08df0a3dab3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: SGHCu+FGmLSqe2MO+zoMuzp9zEn0wGCI36uWT15Ia3mKf5WxGaM2fi6jFe0hSxXhaBRJrvv0qMZP7XKHfZvMprXcMPtjlj6fIJL31wl1/WJdKrqbVOZ/jiC9NMaBW2oCFFdSJAmsESUbsxNECeDUFDD9uuqkpalNPlW1tdMIFhBmQtKuswnmqIBjTTlrl/w4l0AGl9R7Gy86jivcZ6jt3QvMB+3Eta2eoeW6ytTkarBUsEovxXGpZjpbNTLIZPc82TRFm8Cm6nuq2mAmpYkuLTytYEq+IbYRADLZ/UQL/4QRQmNfwX+JDeLpIrZ+quYY7b3fvXHDgBxz1uoEU8TywCtyxmpWXqzd7byGlcyd2CS1B+sAN1durYUwohNl+zvv9aOUGT0IAj+mmamKHfNzGn+dMariXxoRiWuNRO1VN3/ifjARX9wWnC0DGajb1myGj/oUhuaTcQAbgxJ5FLcMfOWczhWtP6dNWtOEoLtxaao+ftPCcdwo0shAy1n1dfmhESfiGRqAESMqmmAQVq0RLv1PaBfTP/Gr0GEfENl83FID9nQaZFJ+48nm+jmBL5zFkH5g+QggUN02ogx7nlEy+uFGYfo5KPYVnpLQsFI9/2/C1/u7BDXfIi2UgIX8k/H9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kg5kbHk61HvotaEqetwDp1vCyAoPlZkwJQNKkR1MhCBCDZj8xo0hSXoo8LgU?=
 =?us-ascii?Q?ku9zLybQaUa5Ot9IrxT3MjcEdbOza2jcu7Tvore7gsxpdr54FkSNMAtD0xyi?=
 =?us-ascii?Q?8/ekg4iyH1FWGZ652jw8vPKda6P8XoF2pClOzE1uA8SUXmSGTcIiiER4enfR?=
 =?us-ascii?Q?XqmrezUVleesXppA0SPJHeDaNJDD1wX/b9S3tHGaMBckixj773EkCZmOYQUg?=
 =?us-ascii?Q?KUg6cU1FZeZYWiNk6HLngtfiZBosmCzkkoM6h1hZb2V5Fs5sgBSnyWJvFdvv?=
 =?us-ascii?Q?04Y/muh3n6w+FFi6q6T2rKFEPqTvODFBTJnzoXHXHYGl/BSOeFobLib1Hvte?=
 =?us-ascii?Q?c54D3FsqZ8XvACFWdPDj1BvNduYu1PiZOSBR+YKJA6oid441H62IE/MVNhv1?=
 =?us-ascii?Q?jFhgZMp7iju/Y5iXmfmdnhvpZF2b8f0xtMdBxWA1vHu3LDm1xxDXcmhYS1w7?=
 =?us-ascii?Q?8sCptq9TQWdjP+zc4W0F64b3vidfkVHoHrhh+pqYblnCs+M8LUlxeT6lxJ+W?=
 =?us-ascii?Q?cCSGUq/MrcG+aGm+q21Mhg+CXmbKBioVb/KJsrDrXUur0turj4ux6pX3K9Uf?=
 =?us-ascii?Q?bxniZ7ChkZSdTOs2P802GlpiivWhRfZqS+P52rbReA7LIDz5sKzk7gAvM/3d?=
 =?us-ascii?Q?ELfcCLo8dotAmLVePrHf5d/ANBtyEmt6bOL6xivR0avBorwJ73VN9jQwEvm+?=
 =?us-ascii?Q?oDUjJQS1h6IpiqcRrmR2t+1/asBu3OfEAKVq1nnZRuAsxsH0Q4fGIqHqDjRg?=
 =?us-ascii?Q?ouPwntfB7X6EhDdJcbNSTRppToakWYts0unJpj9W2+SSeLLRiOFGKFP5o1qp?=
 =?us-ascii?Q?KstkXpXsjTFRCH1s4WUOa3BfEN2agsWKaVg8IKMvtk0CB77UjOlwTK0RiahA?=
 =?us-ascii?Q?XEOoWdAEPIXrG+Rb4P6vEKzjI4hbY3eZJX1OsNdF8KX6/++UG4JjBYjo/Wyz?=
 =?us-ascii?Q?rfYdL9605m6QWjkV0nTvVYsXrn10ZJgqfrwuJH3RNVWuojALZWY3gVdKtH0p?=
 =?us-ascii?Q?zPRrC7ru1ZVuEV9wIsD+GNagjz4riP2MjmHc6iapz8HFNAB5RF3eA1lBfXKz?=
 =?us-ascii?Q?1wSYgKJ6cLnTq45+6lQ9qy+5l/dhmxgyBCRYf3cpBxqXMa86wfC9rjNVDd5l?=
 =?us-ascii?Q?WuKiSn3I5mw0TUw9+6dKTFkjDGBYAMqoDbvkTvErqHSEQyYItRxxa4AfZZzy?=
 =?us-ascii?Q?tLEwc3bYTniCOe3KElASc7gRS2quwNvCxavhwT7kPqThloMBiV8kzxzqxEJg?=
 =?us-ascii?Q?Sb6bD5Mz4n1yKrpS8fb/0yM2qwFZYJAoZ7bjcUwXFerTyMg2KGBRHtB0JHOA?=
 =?us-ascii?Q?W7pgHJxARwDi9zmLU7lg02VUHfOM48yNC5wPuzc8MGLamCalAv8pJ1ttQg0Y?=
 =?us-ascii?Q?DNHWPjU2kXu4pCcpsuUy858TBmB2zCQOKKGeFfxX6z3ph+3rs85GoUqe1nEy?=
 =?us-ascii?Q?DUaRE9uNiXQfzO9Db8gOJiUaUbItbgU6MK1eLGshm51OPMyDseLtJ1huZmpJ?=
 =?us-ascii?Q?8LdygEpDVDdjk4dsBgc70CIAtr+KHTSx22mJCnMGGVSxpJILDJ1xzHcRedsn?=
 =?us-ascii?Q?Mamd+ZbVggYK00UB3H7pT5eHSjXS2Z6jfNf9wrn5hWSRQN7XKL0BOHpbk4Lg?=
 =?us-ascii?Q?1flPdyryZY6NRDWSwFQo0ZPS6ftveWTxL8+FdmZHphWAtgwFHmaTiKV7ULv2?=
 =?us-ascii?Q?YhZBdsi+7lh4gF4vZ/TR6Ide3YMyrcQ8rbCsJP0nWDunozX/9hXM1ERSSTYq?=
 =?us-ascii?Q?Dh/BxDNS+thDM6invcPPn+6pfjREmik=3D?=
X-Exchange-RoutingPolicyChecked: goF3fqGbXiZsUJT4IfcGzpZxdYzaoKwZgVoTW82x286BXzc9X/WI5h6mIXwCM1XmgeA9j+YXl7dBfhvcYWt5a/XMo0/4mur85wBuJ+TWtlYSAK0wA4q5qlXER6QmjoSf2GCF5KN1PpsK1JZgxWqCwcvdSJZJOFx7HkwMBj7DEYB2LZcvMPuTc9AOx1my2fqz1TlbBAoLjsfsOSN/Nc/Gk31gA7Tk9LOPhPr76u2juXpnJ2RjDW1gNI9u/s2b6H3uXZ8gc0QuWHyD6JU2xnYO+J5qPq04efe72xObyo0hyFChZqgUvxAhYs7i9s1e7RqAOrYuo8x3zu4TpVo5GMdkGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c763c26-3e8c-409b-0089-08df0a3dab3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:33:29.3696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hruUzOywVKgUgQd0x3pwctA52bPlk2KDOOSbG4pif51LtVx5NBlETMNH4ndY+ptLmFwSQxbYOwkjeiz9UHrcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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

On Thu, Sep 03, 2026 at 09:45:53PM +0530, Tejas Upadhyay wrote:

This series is:
Acked-by: Matthew Brost <matthew.brost@intel.com>

I was going to merge this today but CI is taking a while, anyone with
push rights feel free to merge this on when CI comes back or I will take
another look at CI in the morning.

Matt 

> This functionality represents a significant step in making
> the xe driver gracefully handle hardware memory degradation.
> By integrating with the DRM Buddy allocator, the driver
> can permanently "carve out" faulty memory so it isn't reused
> by subsequent allocations.
> 
> IGT tests for testing this via injecting simple single address and
> duplicate address fault to unit test functionality:
> https://patchwork.freedesktop.org/series/170555/#rev3
> 
> v21(Sashiko/MattB):
> - Immediately offline pages if already free
> - With that remove some redundant code
> - Guard with lock before access to tbo
> - Add kernel doc in debugfs
> v20(Sashiko/MattB):
> - Retry failed queued pages during xe_ttm_vram_mgr_del()
> - xe_bo::q lifecycle fix
> - hold down_write while traversing exec_queue list
> - fix configfs default value + improve confusing read policy
> v19:
> - Sashiko review comment closure
> - Sliting of making xe_bo_ttm_purge() export and NULL handling
> - Remove redundant code in xe_ttm_vram_reserve_page_at_addr()
> - Resolve nit comments provided in configfs and debugfs
> v18:
> - Splitting out the sysfs patch; it will come later once it is redesigned
> - Address sashiko reivew comments
> - Add debugfs and adjust igt tests and fault injection
> v17:
> - Rebase on drm-tip
> - Enforce CONFIG_FAULT_INJECTION_DEBUG_FS for fault inject
> v16:
> - Correct sysfs patches with moving code with rcu lock
> - In case purge fail let next alloc decide final failure
> - Remove addr_to_block API, its being pulled from drm-tip
> - Remove some unused code and replace where existing API can be used
> v15:
> - Split few big patches into small
> - Avoid vram_mgr lock in sysfs
> - fix missing queue_pages counter increment
> v14:
> - Solve sashiko reviews
> - Remove SOFT->HARD offline patch, decision is taken based on -EEXIST
> - Dump gpu buddy allocated patch dropped
> v13:
> - Add fault inject and remove standlone debugfs
> v12:
> - Fix Sashiko review comments
> v11:
> - Add BAN reason for UMD to know about offlining
> - Add support for soft offline mode
> - Rebase and remove dummy lockdep annotation patch, as it merged from upstream
> v10:
> - Remove RFC
> v7:
> - Improve debugfs warning messages
> - Use scope_guard for locking(MattB)
> - Adapt addition of queue member of LRC BO(MattB)
> - Extend and use xe_ttm_bo_purge API for vram pages(MattB)
> - Handle dma_buf_map requests for native and remote(MattB)
> - Address if in never initialized block, set block to NULL
> - Add lockdep in gpu buddy (MattB)
> - Correct allocated_addr_to_block logic (MattA)
> V6:
> - Add more specific tests to noncritical bo sections
> - Handle smooth exit of user created exec queues
> - Break code and make purge specific static API
> V5:
> - Sysfs "max_pages" addition
> - Reset block->private NULL post purge
> 
> Tejas Upadhyay (15):
>   drm/xe: Link VRAM resource allocation with gpu buddy
>   drm/xe: Link LRC BO and its execution queue with safe lifetime rules
>   drm/xe: Export xe_ttm_bo_purge()
>   drm/xe: Handle NULL resource and allow purging of VRAM pages
>   drm/xe/bo: Make xe_bo_is_user() public
>   drm/xe: Guard teardown paths against purged BOs
>   drm/xe/vram: Extract buddy allocation and free helpers
>   drm/xe/vram: Add page offline data structures and lifecycle
>   drm/xe/vram: Add VRAM page offline fault handler
>   drm/xe/configfs: Add disable_vram_page_offline attribute
>   drm/xe/ras: Cache disable_vram_page_offline policy at init
>   drm/xe/vram: Check disable_vram_page_offline policy in fault handler
>   drm/xe: Expose bad VRAM pages via debugfs
>   drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
>   drm/xe: Add fault-inject based VRAM page offline injection
> 
>  drivers/gpu/drm/xe/xe_bo.c                 |  25 +-
>  drivers/gpu/drm/xe/xe_bo.h                 |   2 +
>  drivers/gpu/drm/xe/xe_bo_types.h           |   8 +
>  drivers/gpu/drm/xe/xe_configfs.c           |  72 ++-
>  drivers/gpu/drm/xe/xe_configfs.h           |   2 +
>  drivers/gpu/drm/xe/xe_debugfs.c            |  51 ++
>  drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
>  drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
>  drivers/gpu/drm/xe/xe_drm_ras_types.h      |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue.c         |  72 ++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
>  drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c         |  36 +-
>  drivers/gpu/drm/xe/xe_ras.c                |   9 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 600 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
>  include/uapi/drm/xe_drm.h                  |  18 +-
>  18 files changed, 911 insertions(+), 46 deletions(-)
> 
> -- 
> 2.52.0
> 
