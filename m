Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF94AC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 03:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCD310E218;
	Tue, 23 Jul 2024 03:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoKQCuoh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6340710E218
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 03:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721706924; x=1753242924;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=v8zg/dKHQQzZqLzwNGGYAjgHkdgrCdZtmtU85Rt/kJQ=;
 b=OoKQCuohtUQxcFJs3Xobcs+B9umlJple7z71+PzZL7p8SahFo2DpigNP
 7tyL/C+V2w6LVSkHOVixsXXWCniWZpVMJKb4q9jiIwA2xyPn4xW8QXPUq
 8NfiwBBrL8tYAH+LD8TN05DoE6KmY65oYXLMKdh7HMocffmi1tKbTCjEY
 SN00Visy8Qyd9kJRXLFkWieqwHnBO14QtuVpBrQ1EkewSMTNih//ZWPH3
 NAAF1kaJnW0Vutr2ekw5Ar1jlaXt+LByHk1jrVpCykni32DrF/fiIF5f2
 KQW5OTWAowy2/SnclSBgUQ/6l4/UMnHeMIu1P6Ysnc8tx+slnvmHWVWzi Q==;
X-CSE-ConnectionGUID: 62OEQ47ISp6J7dZI0IELog==
X-CSE-MsgGUID: U6OWNLs3TGWfVWOVLzmSdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19436090"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="19436090"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 20:55:23 -0700
X-CSE-ConnectionGUID: 3l5R3ESbQA++nEMpGSjAbg==
X-CSE-MsgGUID: WQQMpoDpTLiudEKrF7xfOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="56927152"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 20:55:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 20:55:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 20:55:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 20:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPuk15k4+JWh7b5w22Npd43LOr4OkklkvlHOpqqeIfwu52oow4dyG8M4O2u9drUWp/l9y0wlHv7+dMp1IqdpN+F3kVL7zHbFhAL5d4xt/reLkj74+12BmGAkpYNNhsVrOgVDqiEAb/7WaaE1JbpFTMHpeXm4mCNf0x7m3rrBZSNAwhvOvYlvVPcu+xtBs7stWkjzmnLq5Ib0p3i0C9rBRk12WABEEFNHxed9HsID3FJn9OIKkDMl2EEWR/E3yxCC40qGHDJWK2Ng6pDBPYw86q09JDq1IcL4CW+9q4sEoumjKm2m+jQ/JTTRWr5hsL/bFVKvRzru3wQYVcPwqzfyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmbHbSGhNn9S+T4ReLY5cMOLxKnIPc2GBSxBUHefenQ=;
 b=zKXvKQ1Cdnij9vGl58YCk7bKdUfdRNU/s+JjXTUYA2V2NWVVD5FLgILH3S2fvjm/y3ScpUpCvYMWdw5z/kUtrPGGf15w1v0vMogMMuIlQ3Yw/7QIhu+5VwVPmV2ilQCIdm1TOZ5JF4OHjvIXZKqNGWf8GnvCXlCcwmML9OW6zaThk+/we7C0ToPv/hvtF8dtb6Wany1K+0l83Dj1SumgPqLdgscsGJGmPzPYJ7U0BZxIu7xlSwgC2hkWJ+nVy3rOEjEJ+D4/9DBYmRsTT5Mu3LDocLVdy+cFuK0G5qDut5G5SGfSK/DiBshkzRamnSMQeQJKXYPZ6AqAkpppV+ysyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 03:54:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 03:54:58 +0000
Date: Tue, 23 Jul 2024 03:53:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?=
 =?utf-8?Q?for_drm=2Fxe=3A_Return_-ENOBUF?= =?utf-8?Q?S?= if a kmalloc fails
 which is tied to an array of binds (rev3)
Message-ID: <Zp8pVzT1s6uZwgl3@DUT025-TGLU.fm.intel.com>
References: <20240723011702.1684013-1-matthew.brost@intel.com>
 <172170588083.358660.4676618066064291401@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172170588083.358660.4676618066064291401@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:180::42) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0ae16c-46c1-408c-16c7-08dcaacb3887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8WIC4HPqKaXHNzYNza9vUgcs5fvgJ7f+MpdJg3ZgCVwL6T/QeiL7P2gmoTo4?=
 =?us-ascii?Q?Sqexj58F8I7hP8YMYaSYoMwKH7/srfEOammHTgtq8+NF+sqlHdCSlqACJMPh?=
 =?us-ascii?Q?3OQuZeWG+ii8/OlJsO0t3w65j54ifCj1wYlUg6yNUjRvA5VbxlAAwsxXglpi?=
 =?us-ascii?Q?vu4OV5rg/WC8vINxgwAd6zaNpD70YlWVSjpG34MStx6HBL8e1ifhtrSZASBl?=
 =?us-ascii?Q?Ek7rdUJ6HlEZbe98Ax5fET33tb/7yAGN0tJ5ANC4kpz6ay98asl18Smw6g7W?=
 =?us-ascii?Q?xFRpn0mUSm2WruIcuElZMmggfKpP3HW5MWAxxRBdergt3YYNFIArfKCDTRM4?=
 =?us-ascii?Q?Z0iBRCPU0n3itEjrAkTk/N41j7625/MlFLpilrZoJYhwPGCbPZZdtUoCFYlb?=
 =?us-ascii?Q?m6VfmtpRw2FVZHNcMTCeYYj2fc8zkzLALZvyn4XqsdXxbC5tfyIe6VaKE57N?=
 =?us-ascii?Q?xcSa52qYTCf5ocSGAUS72/vkjbTmEaB1aXPyTDPCi3Yc1QLjr22oseQ30tjS?=
 =?us-ascii?Q?cmPsjiELaMSsVBZucFbIL/28qkoP4EhhngHUvTtuZ7+8w7qDk0MehPElsZrH?=
 =?us-ascii?Q?CUN8cydz7fuPiRuFCHS0Q/B0ScqpgSbECGLRTBs8hZFPB7DU7xg5AAEu2WJb?=
 =?us-ascii?Q?IsUdFVJufeIVqQPyZpPlc4drjyRgfLDeGNSMgpGyou4W136GpqxoOrS8IVRU?=
 =?us-ascii?Q?1p6RhTNQjH9zh/v7XMxWoZCNRntRsZlyFy2++QskTurCqEFCYUFJh1NG2BnH?=
 =?us-ascii?Q?Yc29M45SBfshER/wIkntuvyDqzJmCtAMZZS4OabWRj0Sshy8ZzIwOyXDZnu+?=
 =?us-ascii?Q?otkO3KnClYuX6O21sfnWn/ya5wM+VH4bp4qxVPQYMqqbjIqB4Bq6+jZf98WD?=
 =?us-ascii?Q?ctpXe3qtYa/6o7jk+2kee2HjxOv3FZY5jW8AiVqAKEPvAct5GWlVdutt3tgh?=
 =?us-ascii?Q?19mPgp1LzSZISR9PXDibGFZ1N/GEG1TpgKsGOPJtMOq28AUzPZOh1R6k3xoh?=
 =?us-ascii?Q?w8jlxDVx559qC6gS0t4xtUm6R1KajODHQiGWrPs9dCfis6DwCAEwMkbf8FkA?=
 =?us-ascii?Q?KSBN3hKuljg0+ANJgGUGCb77eaoqpXvthuvh/SQhenVxQleUDKGRAW+/SVy5?=
 =?us-ascii?Q?e6P4wZJIj5iAc00Qch5t1cwZZlkUWFXH5DmU1dF7S26VmZfDGaCh70bF7pi3?=
 =?us-ascii?Q?54SrVk2wfOUhgl2LtfAmWIzZuT3ud9EqLcFF7+xxI563kAWhgf2hNSiN+c18?=
 =?us-ascii?Q?8omuSvGKhrbsgbU37yYIqpelsHZnkT4shid73PWtzn50VVL4aEG9ItQgWN93?=
 =?us-ascii?Q?u0E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9KpUv+/TSObyp/KPIBaopHObgzrxPZItY92PiXLwfpFyJUrJQPkYag6RbCeP?=
 =?us-ascii?Q?AzHrMwY0XSpZI77ADIEyHGe067muoNgpkiMRz8Bc1TMRJJP2tVSWD//xEllD?=
 =?us-ascii?Q?SDLm87d5WII3Aiicom8Zmt53PW/WNA2Bn7Ce7bDfoT/HfqcmbwmdVHY3mOXd?=
 =?us-ascii?Q?3xYZ0LXa87NQXP1CI3VVoXy9O4u1rAn2Ye3SisM7KBu1yiHKaRDiJsEqrczu?=
 =?us-ascii?Q?uj2U91wH6lMFNkt73Nve4dbFA04MBT7w6oO12f+6J3XU62kCuAUkNyuwoxqy?=
 =?us-ascii?Q?Jrwj2TYlZhuoog2lNHdrMz1U3ubOQ+cWVA+nIkyMVCTMK36DYDTJQXopPLHh?=
 =?us-ascii?Q?QsV3mu6nDyzwUEQt0NUygbV+kCDnFdMaVebwIrojAFirNZOLO4b6r+7kgYG4?=
 =?us-ascii?Q?5bVzVfRvvzeYilo7sWTXH0EIn5/4kEempGeEMcmiRig1Gj5s5uEzewxESto+?=
 =?us-ascii?Q?OjM8ZOcTT4oUQBoIWQjTmxv5+EWCXFBCr3CwKRzTUtSbYFJT2UqucXj56XhI?=
 =?us-ascii?Q?I1eHZ2MArxYMvAtpuQaZnJefp+DlObgSjnspPhHdyckPG8PrDnseNvTciPWa?=
 =?us-ascii?Q?grOgstjk5i78EoDM8lksC78u03E/poDdCoVepQkiybNXg6A2WsER2/PCkfew?=
 =?us-ascii?Q?M7r9/T/GeN+a0ZnvYQvPNUr4l17HrX9G2xuKUjU1WAcfMUmBADckuJfG8heL?=
 =?us-ascii?Q?nKlBqFP80tDF20SAwzzMbq5EMcfykzTQX6ma8p4ZzmBb5i1SYGZ/deSHMC1Y?=
 =?us-ascii?Q?/VdBpK0OroTbTumWtcOTV2kaF62PJCnPeoHI7KzZp/L0DdU8nbqI+RB6NP4S?=
 =?us-ascii?Q?kyCWwvc0Us3ATcjE5GgyG0RjmWtP/cc5GceDd3G21jxgZz3WChoSQySlZlHM?=
 =?us-ascii?Q?fVw5uI0HG1msdfcjcCMa/Uy3J4Flax00eqv6/7x0D9ue6NpFe72AwrT+6feg?=
 =?us-ascii?Q?Qc/CbExUmXwqDVZwSBI9sqsVAGM7znoilzdV83GafBZbj6tuagGA7Zs+DDeg?=
 =?us-ascii?Q?7tqGwZXrFzCoZr8nnCGKCdP/mGvg1v8eON41tFt3VSiBlKXFmQQRFNGNxu1S?=
 =?us-ascii?Q?+TyZNdYIt+ALVI6CrlcXHXB4C4Y0s0z7eJWFFWDrijB09eZY6vVxR+l5Bnrb?=
 =?us-ascii?Q?Oy/gUxFHonHMuTZtcCSTxvnm1hzt1aCSApwttKT3guQk18Lw49aP8Sna5hFj?=
 =?us-ascii?Q?U0TsQ0fwD914lv9i9Y0GJjGm7SERPLBm91RCiZ4U1Rz91GhdUVsqS+Qj+5R+?=
 =?us-ascii?Q?GApX4WH/6AwcMWL8ASw+5TXb0OkhUJWREFvKv22Yn4GXH3acASS+zKbJU2pq?=
 =?us-ascii?Q?sYeKl+dwmlKKwR83HWXkZQNWPhPnI+8N+TMr4iFs3Nb/3LIYZzosoB+t6DW/?=
 =?us-ascii?Q?/Tso3kNGr5CW4JzuExoLE/XtO9WYG9LoSf0cJ4QpmM0dZYd7SDElp+jBjFie?=
 =?us-ascii?Q?UfEcv5PmfwI1MERiYhZmzbuifmOw+EKYPQF5ZeQU4/bqZmmmm7YOt6Zbq9Yz?=
 =?us-ascii?Q?pUaBOTBAKfwnXhbv18xlFxKXrXJk52ME1LwjP4WP/eBDnbXG8e9jig6JkU3t?=
 =?us-ascii?Q?R7wYKHMQFIMawD2Tg318Ad5yG/g2QIDbERBI4K7SzUKE6mEqEW9mk9uQmR8K?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0ae16c-46c1-408c-16c7-08dcaacb3887
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 03:54:58.4521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiPPNE62CgliPgHGxXOfy01TEO4FCq7zbFoGorfFmD0lZ8CZY9WSAKTk5BvQkP4Y1bm3zNi9kIPLeXM1NS3neA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
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

On Tue, Jul 23, 2024 at 03:38:00AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series: drm/xe: Return -ENOBUFS if a kmalloc fails which is tied to an
>    array of binds (rev3)
>    URL: [1]https://patchwork.freedesktop.org/series/136292/
>    State: failure
>    Details:
>    [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/index.html
> 
> CI Bug Log - changes from xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b_full
>                              -> xe-pw-136292v3_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with xe-pw-136292v3_full absolutely need
>    to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-136292v3_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (3 -> 3)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    xe-pw-136292v3_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_fbcon_fbt@fbc-suspend:
>           + shard-lnl: [3]PASS -> [4]FAIL
>      * igt@xe_vm@mmap-style-bind-either-side-partial-hammer:
>           + shard-dg2-set2: [5]PASS -> [6]ABORT
> 

It looks like the way we access pid / process name is unsafe, I've seen
this CI failure a few times now. I believe we need to store the pid /
process name in the xe_file directly to be safe. Will work on fixing
this tomorrow.

Matt

>     Warnings
> 
>      * igt@xe_module_load@many-reload:
>           + shard-adlp: [7]TIMEOUT ([8]Intel XE#1961 / [9]Intel XE#2026)
>             -> [10]DMESG-WARN
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
>      * {igt@xe_pm@d3cold-mocs}:
>           + shard-dg2-set2: [11]SKIP ([12]Intel XE#1201) -> [13]SKIP
> 
> New tests
> 
>    New tests have been introduced between
>    xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b_full and
>    xe-pw-136292v3_full:
> 
>   New IGT tests (25)
> 
>      * igt@kms_flip@absolute-wf_vblank-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.60] s
>      * igt@kms_flip@absolute-wf_vblank@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.61] s
>      * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.62] s
>      * igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.91] s
>      * igt@kms_flip@basic-plain-flip@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.64] s
>      * igt@kms_flip@blocking-wf_vblank@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.92] s
>      * igt@kms_flip@bo-too-big-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.20] s
>      * igt@kms_flip@bo-too-big@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.12] s
>      * igt@kms_flip@dpms-off-confusion-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.59] s
>      * igt@kms_flip@dpms-off-confusion@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.61] s
>      * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [2.87] s
>      * igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [2.94] s
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.92] s
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.92] s
>      * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.60] s
>      * igt@kms_flip@flip-vs-dpms-off-vs-modeset@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.65] s
>      * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.60] s
>      * igt@kms_flip@flip-vs-rmfb@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.61] s
>      * igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.90] s
>      * igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [2.97] s
>      * igt@kms_flip@nonexisting-fb-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.09] s
>      * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.92] s
>      * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [7.94] s
>      * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptibl
>        e@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [0.62] s
>      * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
>           + Statuses : 1 pass(s)
>           + Exec time: [8.05] s
> 
> Known issues
> 
>    Here are the changes found in xe-pw-136292v3_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-
>        1-x:
>           + shard-adlp: [14]PASS -> [15]DMESG-WARN ([16]Intel XE#324)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-
>        1-y:
>           + shard-adlp: [17]PASS -> [18]DMESG-WARN ([19]Intel XE#2338)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>           + shard-lnl: NOTRUN -> [20]SKIP ([21]Intel XE#1407)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>           + shard-adlp: NOTRUN -> [22]SKIP ([23]Intel XE#1124 / [24]Intel
>             XE#1201) +3 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
>           + shard-dg2-set2: NOTRUN -> [25]SKIP ([26]Intel XE#1201 /
>             [27]Intel XE#316)
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>           + shard-adlp: NOTRUN -> [28]SKIP ([29]Intel XE#1201 / [30]Intel
>             XE#316)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>           + shard-lnl: NOTRUN -> [31]SKIP ([32]Intel XE#1124) +1 other
>             test skip
>      * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>           + shard-dg2-set2: NOTRUN -> [33]SKIP ([34]Intel XE#1201 /
>             [35]Intel XE#367)
>      * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>           + shard-adlp: NOTRUN -> [36]SKIP ([37]Intel XE#1201 / [38]Intel
>             XE#367)
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>           + shard-adlp: NOTRUN -> [39]SKIP ([40]Intel XE#1201 / [41]Intel
>             XE#455 / [42]Intel XE#787) +9 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:
>           + shard-dg2-set2: NOTRUN -> [43]SKIP ([44]Intel XE#1201 /
>             [45]Intel XE#787) +13 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>           + shard-dg2-set2: NOTRUN -> [46]SKIP ([47]Intel XE#1201 /
>             [48]Intel XE#455 / [49]Intel XE#787) +3 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-
>        a-1:
>           + shard-adlp: NOTRUN -> [50]SKIP ([51]Intel XE#1201 / [52]Intel
>             XE#787) +14 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>           + shard-lnl: NOTRUN -> [53]SKIP ([54]Intel XE#1399) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>           + shard-adlp: NOTRUN -> [55]SKIP ([56]Intel XE#1201 / [57]Intel
>             XE#373) +2 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>           + shard-lnl: NOTRUN -> [58]SKIP ([59]Intel XE#373) +1 other test
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>           + shard-dg2-set2: NOTRUN -> [60]SKIP ([61]Intel XE#1201 /
>             [62]Intel XE#373) +2 other tests skip
>      * igt@kms_content_protection@dp-mst-type-1:
>           + shard-dg2-set2: NOTRUN -> [63]SKIP ([64]Intel XE#1201 /
>             [65]Intel XE#307)
>      * igt@kms_cursor_crc@cursor-random-max-size:
>           + shard-lnl: NOTRUN -> [66]SKIP ([67]Intel XE#1424)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>           + shard-lnl: NOTRUN -> [68]SKIP ([69]Intel XE#1413)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>           + shard-adlp: NOTRUN -> [70]SKIP ([71]Intel XE#1201 / [72]Intel
>             XE#308)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-s
>        ize:
>           + shard-lnl: NOTRUN -> [73]SKIP ([74]Intel XE#309) +1 other test
>             skip
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>           + shard-dg2-set2: NOTRUN -> [75]SKIP ([76]Intel XE#1201 /
>             [77]Intel XE#455) +4 other tests skip
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>           + shard-lnl: NOTRUN -> [78]SKIP ([79]Intel XE#1421)
>      * igt@kms_flip@2x-plain-flip-ts-check:
>           + shard-adlp: NOTRUN -> [80]SKIP ([81]Intel XE#1201 / [82]Intel
>             XE#310) +1 other test skip
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>           + shard-lnl: [83]PASS -> [84]FAIL ([85]Intel XE#886) +3 other
>             tests fail
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling
>        :
>           + shard-lnl: NOTRUN -> [86]SKIP ([87]Intel XE#1401 / [88]Intel
>             XE#1745)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling
>        @pipe-a-default-mode:
>           + shard-lnl: NOTRUN -> [89]SKIP ([90]Intel XE#1401)
>      * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>           + shard-adlp: [91]PASS -> [92]FAIL ([93]Intel XE#1874) +1 other
>             test fail
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render
>        :
>           + shard-adlp: NOTRUN -> [94]SKIP ([95]Intel XE#1201 / [96]Intel
>             XE#656) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc
>        :
>           + shard-adlp: NOTRUN -> [97]FAIL ([98]Intel XE#1861)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>           + shard-lnl: NOTRUN -> [99]SKIP ([100]Intel XE#656) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mma
>        p-wc:
>           + shard-adlp: NOTRUN -> [101]SKIP ([102]Intel XE#1201 /
>             [103]Intel XE#651) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
>           + shard-dg2-set2: NOTRUN -> [104]SKIP ([105]Intel XE#1201 /
>             [106]Intel XE#651) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
>           + shard-lnl: NOTRUN -> [107]SKIP ([108]Intel XE#651) +2 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>           + shard-dg2-set2: NOTRUN -> [109]SKIP ([110]Intel XE#1201 /
>             [111]Intel XE#653) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>           + shard-adlp: NOTRUN -> [112]SKIP ([113]Intel XE#1201 /
>             [114]Intel XE#653) +5 other tests skip
>      * igt@kms_plane@plane-position-covered:
>           + shard-lnl: [115]PASS -> [116]DMESG-FAIL ([117]Intel XE#324)
>      * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>           + shard-lnl: NOTRUN -> [118]SKIP ([119]Intel XE#599) +4 other
>             tests skip
>      * igt@kms_plane_multiple@tiling-4:
>           + shard-adlp: NOTRUN -> [120]SKIP ([121]Intel XE#1201 /
>             [122]Intel XE#455) +9 other tests skip
>      * igt@kms_pm_dc@dc9-dpms:
>           + shard-adlp: NOTRUN -> [123]FAIL ([124]Intel XE#1204)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>           + shard-adlp: NOTRUN -> [125]SKIP ([126]Intel XE#1201)
>      * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>           + shard-dg2-set2: NOTRUN -> [127]SKIP ([128]Intel XE#1201 /
>             [129]Intel XE#1489)
>      * igt@kms_psr@fbc-pr-cursor-plane-move:
>           + shard-lnl: NOTRUN -> [130]SKIP ([131]Intel XE#1406)
>      * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>           + shard-dg2-set2: NOTRUN -> [132]SKIP ([133]Intel XE#1201 /
>             [134]Intel XE#929) +3 other tests skip
>      * igt@kms_psr@pr-suspend:
>           + shard-adlp: NOTRUN -> [135]SKIP ([136]Intel XE#1201 /
>             [137]Intel XE#929) +2 other tests skip
>      * igt@kms_rotation_crc@sprite-rotation-90:
>           + shard-adlp: NOTRUN -> [138]SKIP ([139]Intel XE#1201 /
>             [140]Intel XE#327)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>           + shard-dg2-set2: [141]PASS -> [142]FAIL ([143]Intel XE#899)
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
>           + shard-lnl: [144]PASS -> [145]DMESG-WARN ([146]Intel XE#2052)
>             +4 other tests dmesg-warn
>      * igt@kms_vrr@flip-dpms:
>           + shard-lnl: [147]PASS -> [148]FAIL ([149]Intel XE#2294) +1
>             other test fail
>      * igt@xe_copy_basic@mem-set-linear-0x3fff:
>           + shard-adlp: NOTRUN -> [150]SKIP ([151]Intel XE#1126 /
>             [152]Intel XE#1201) +1 other test skip
>      * igt@xe_evict@evict-beng-mixed-threads-large:
>           + shard-dg2-set2: [153]PASS -> [154]TIMEOUT ([155]Intel XE#1473
>             / [156]Intel XE#392)
>      * igt@xe_evict@evict-large-cm:
>           + shard-adlp: NOTRUN -> [157]SKIP ([158]Intel XE#1201 /
>             [159]Intel XE#261) +1 other test skip
>      * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>           + shard-lnl: NOTRUN -> [160]SKIP ([161]Intel XE#688) +1 other
>             test skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>           + shard-lnl: NOTRUN -> [162]SKIP ([163]Intel XE#1392) +1 other
>             test skip
>      * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>           + shard-adlp: NOTRUN -> [164]SKIP ([165]Intel XE#1201 /
>             [166]Intel XE#1392)
>      * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
>           + shard-adlp: NOTRUN -> [167]SKIP ([168]Intel XE#1201 /
>             [169]Intel XE#288) +7 other tests skip
>      * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>           + shard-dg2-set2: NOTRUN -> [170]SKIP ([171]Intel XE#1201 /
>             [172]Intel XE#288) +6 other tests skip
>      * igt@xe_gt_freq@freq_reset_multiple:
>           + shard-lnl: [173]PASS -> [174]DMESG-WARN ([175]Intel XE#1620)
>      * igt@xe_module_load@force-load:
>           + shard-adlp: NOTRUN -> [176]SKIP ([177]Intel XE#1201 /
>             [178]Intel XE#378)
>      * igt@xe_pat@display-vs-wb-transient:
>           + shard-dg2-set2: NOTRUN -> [179]SKIP ([180]Intel XE#1201 /
>             [181]Intel XE#1337)
>      * igt@xe_pat@pat-index-xelpg:
>           + shard-lnl: NOTRUN -> [182]SKIP ([183]Intel XE#979)
>      * igt@xe_peer2peer@write:
>           + shard-adlp: NOTRUN -> [184]SKIP ([185]Intel XE#1061 /
>             [186]Intel XE#1201)
>      * igt@xe_pm@s3-d3hot-basic-exec:
>           + shard-lnl: NOTRUN -> [187]SKIP ([188]Intel XE#584)
>      * igt@xe_pm@s3-vm-bind-userptr:
>           + shard-dg2-set2: NOTRUN -> [189]DMESG-WARN ([190]Intel XE#1551
>             / [191]Intel XE#569)
>      * igt@xe_pm@s4-vm-bind-unbind-all:
>           + shard-adlp: [192]PASS -> [193]ABORT ([194]Intel XE#1794) +1
>             other test abort
>      * igt@xe_query@multigpu-query-invalid-cs-cycles:
>           + shard-lnl: NOTRUN -> [195]SKIP ([196]Intel XE#944)
>      * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>           + shard-adlp: NOTRUN -> [197]SKIP ([198]Intel XE#1201 /
>             [199]Intel XE#944)
>      * igt@xe_render_copy@render-random@render-ymajor-256x256:
>           + shard-adlp: [200]PASS -> [201]DMESG-WARN ([202]Intel XE#2226)
>             +2 other tests dmesg-warn
> 
>     Possible fixes
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>           + shard-lnl: [203]FAIL ([204]Intel XE#1659) -> [205]PASS +1
>             other test pass
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
>           + shard-lnl: [206]DMESG-WARN ([207]Intel XE#877) -> [208]PASS +1
>             other test pass
>      * igt@kms_flip@flip-vs-blocking-wf-vblank:
>           + shard-lnl: [209]FAIL ([210]Intel XE#886) -> [211]PASS +1 other
>             test pass
>      * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>           + shard-adlp: [212]FAIL ([213]Intel XE#1874) -> [214]PASS +1
>             other test pass
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>           + shard-lnl: [215]DMESG-WARN ([216]Intel XE#2052) -> [217]PASS
>      * igt@kms_plane@plane-position-hole:
>           + shard-lnl: [218]DMESG-FAIL ([219]Intel XE#324) -> [220]PASS +1
>             other test pass
>      * {igt@kms_plane@plane-position-hole@pipe-b-plane-2}:
>           + shard-lnl: [221]DMESG-WARN ([222]Intel XE#324) -> [223]PASS +1
>             other test pass
>      * igt@kms_pm_dc@dc6-dpms:
>           + shard-adlp: [224]FAIL ([225]Intel XE#718) -> [226]PASS
>      * igt@kms_universal_plane@cursor-fb-leak:
>           + shard-adlp: [227]FAIL ([228]Intel XE#771 / [229]Intel XE#899)
>             -> [230]PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>           + shard-adlp: [231]FAIL ([232]Intel XE#899) -> [233]PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>           + shard-dg2-set2: [234]FAIL ([235]Intel XE#899) -> [236]PASS
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
>           + shard-lnl: [237]INCOMPLETE -> [238]PASS
>      * igt@xe_evict@evict-beng-threads-large:
>           + shard-dg2-set2: [239]TIMEOUT ([240]Intel XE#1473) -> [241]PASS
>      * igt@xe_evict@evict-large-multi-vm-cm:
>           + shard-dg2-set2: [242]FAIL ([243]Intel XE#1600) -> [244]PASS
>      * igt@xe_evict@evict-mixed-threads-large:
>           + shard-dg2-set2: [245]TIMEOUT ([246]Intel XE#1473 / [247]Intel
>             XE#392) -> [248]PASS +1 other test pass
>      * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>           + shard-dg2-set2: [249]ABORT ([250]Intel XE#2271) -> [251]PASS
>      * igt@xe_gt_freq@freq_fixed_exec:
>           + shard-adlp: [252]ABORT ([253]Intel XE#2271) -> [254]PASS
>      * igt@xe_pm@s4-mocs:
>           + shard-adlp: [255]ABORT ([256]Intel XE#1794) -> [257]PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>           + shard-dg2-set2: [258]SKIP ([259]Intel XE#1201 / [260]Intel
>             XE#316) -> [261]SKIP ([262]Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-fli
>        p:
>           + shard-adlp: [263]DMESG-FAIL ([264]Intel XE#324) -> [265]FAIL
>             ([266]Intel XE#1231)
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>           + shard-adlp: [267]DMESG-FAIL ([268]Intel XE#1033 / [269]Intel
>             XE#324) -> [270]FAIL ([271]Intel XE#1231)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-fli
>        p:
>           + shard-adlp: [272]FAIL ([273]Intel XE#1231) -> [274]DMESG-WARN
>             ([275]Intel XE#324)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-f
>        lip:
>           + shard-dg2-set2: [276]SKIP ([277]Intel XE#1124 / [278]Intel
>             XE#1201) -> [279]SKIP ([280]Intel XE#1124) +7 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>           + shard-dg2-set2: [281]SKIP ([282]Intel XE#1124) -> [283]SKIP
>             ([284]Intel XE#1124 / [285]Intel XE#1201) +6 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>           + shard-dg2-set2: [286]SKIP ([287]Intel XE#607) -> [288]SKIP
>             ([289]Intel XE#1201 / [290]Intel XE#607)
>      * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>           + shard-dg2-set2: [291]SKIP ([292]Intel XE#1201 / [293]Intel
>             XE#367) -> [294]SKIP ([295]Intel XE#367) +2 other tests skip
>      * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>           + shard-dg2-set2: [296]SKIP ([297]Intel XE#367) -> [298]SKIP
>             ([299]Intel XE#1201 / [300]Intel XE#367) +1 other test skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>           + shard-dg2-set2: [301]SKIP ([302]Intel XE#1201 / [303]Intel
>             XE#787) -> [304]SKIP ([305]Intel XE#787) +48 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>           + shard-dg2-set2: [306]SKIP ([307]Intel XE#455 / [308]Intel
>             XE#787) -> [309]SKIP ([310]Intel XE#1201 / [311]Intel XE#455 /
>             [312]Intel XE#787) +13 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a
>        -6:
>           + shard-dg2-set2: [313]SKIP ([314]Intel XE#787) -> [315]SKIP
>             ([316]Intel XE#1201 / [317]Intel XE#787) +48 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>           + shard-dg2-set2: [318]SKIP ([319]Intel XE#1201 / [320]Intel
>             XE#455 / [321]Intel XE#787) -> [322]SKIP ([323]Intel XE#455 /
>             [324]Intel XE#787) +13 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>           + shard-dg2-set2: [325]SKIP ([326]Intel XE#1201 / [327]Intel
>             XE#1252) -> [328]SKIP ([329]Intel XE#1252) +1 other test skip
>      * igt@kms_chamelium_color@ctm-0-50:
>           + shard-dg2-set2: [330]SKIP ([331]Intel XE#1201 / [332]Intel
>             XE#306) -> [333]SKIP ([334]Intel XE#306)
>      * igt@kms_chamelium_color@degamma:
>           + shard-dg2-set2: [335]SKIP ([336]Intel XE#306) -> [337]SKIP
>             ([338]Intel XE#1201 / [339]Intel XE#306) +2 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>           + shard-dg2-set2: [340]SKIP ([341]Intel XE#373) -> [342]SKIP
>             ([343]Intel XE#1201 / [344]Intel XE#373) +3 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>           + shard-dg2-set2: [345]SKIP ([346]Intel XE#1201 / [347]Intel
>             XE#373) -> [348]SKIP ([349]Intel XE#373) +6 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
>           + shard-dg2-set2: [350]SKIP ([351]Intel XE#307) -> [352]SKIP
>             ([353]Intel XE#1201 / [354]Intel XE#307)
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
>           + shard-dg2-set2: [355]SKIP ([356]Intel XE#1201 / [357]Intel
>             XE#308) -> [358]SKIP ([359]Intel XE#308) +3 other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transiti
>        ons:
>           + shard-dg2-set2: [360]SKIP ([361]Intel XE#323) -> [362]SKIP
>             ([363]Intel XE#1201 / [364]Intel XE#323) +2 other tests skip
>      * igt@kms_dsc@dsc-with-bpc-formats:
>           + shard-dg2-set2: [365]SKIP ([366]Intel XE#1201 / [367]Intel
>             XE#455) -> [368]SKIP ([369]Intel XE#455) +9 other tests skip
>      * igt@kms_fbcon_fbt@psr-suspend:
>           + shard-dg2-set2: [370]SKIP ([371]Intel XE#1201 / [372]Intel
>             XE#776) -> [373]SKIP ([374]Intel XE#776)
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>           + shard-dg2-set2: [375]SKIP ([376]Intel XE#651) -> [377]SKIP
>             ([378]Intel XE#1201 / [379]Intel XE#651) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-ren
>        der:
>           + shard-dg2-set2: [380]SKIP ([381]Intel XE#1201 / [382]Intel
>             XE#651) -> [383]SKIP ([384]Intel XE#651) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>           + shard-dg2-set2: [385]SKIP ([386]Intel XE#658) -> [387]SKIP
>             ([388]Intel XE#1201 / [389]Intel XE#658)
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>           + shard-dg2-set2: [390]SKIP ([391]Intel XE#1158) -> [392]SKIP
>             ([393]Intel XE#1158 / [394]Intel XE#1201)
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>           + shard-dg2-set2: [395]SKIP ([396]Intel XE#653) -> [397]SKIP
>             ([398]Intel XE#1201 / [399]Intel XE#653) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-slowdraw:
>           + shard-dg2-set2: [400]SKIP ([401]Intel XE#1201 / [402]Intel
>             XE#653) -> [403]SKIP ([404]Intel XE#653) +21 other tests skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>           + shard-dg2-set2: [405]SKIP ([406]Intel XE#1201 / [407]Intel
>             XE#356) -> [408]SKIP ([409]Intel XE#356)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>           + shard-dg2-set2: [410]SKIP ([411]Intel XE#1201 / [412]Intel
>             XE#455 / [413]Intel XE#498) -> [414]SKIP ([415]Intel XE#455 /
>             [416]Intel XE#498) +1 other test skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pi
>        pe-a-hdmi-a-6:
>           + shard-dg2-set2: [417]SKIP ([418]Intel XE#1201 / [419]Intel
>             XE#498) -> [420]SKIP ([421]Intel XE#498) +2 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pi
>        pe-a-hdmi-a-6:
>           + shard-dg2-set2: [422]SKIP -> [423]SKIP ([424]Intel XE#1201) +2
>             other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>           + shard-dg2-set2: [425]SKIP ([426]Intel XE#2318 / [427]Intel
>             XE#455) -> [428]SKIP ([429]Intel XE#1201 / [430]Intel XE#2318
>             / [431]Intel XE#455) +1 other test skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pi
>        pe-c-hdmi-a-6:
>           + shard-dg2-set2: [432]SKIP ([433]Intel XE#2318) -> [434]SKIP
>             ([435]Intel XE#1201 / [436]Intel XE#2318) +2 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pi
>        pe-d-hdmi-a-6:
>           + shard-dg2-set2: [437]SKIP ([438]Intel XE#455) -> [439]SKIP
>             ([440]Intel XE#1201 / [441]Intel XE#455) +10 other tests skip
>      * igt@kms_pm_dc@deep-pkgc:
>           + shard-dg2-set2: [442]SKIP ([443]Intel XE#1201 / [444]Intel
>             XE#908) -> [445]SKIP ([446]Intel XE#908)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>           + shard-dg2-set2: [447]SKIP ([448]Intel XE#1201 / [449]Intel
>             XE#1489) -> [450]SKIP ([451]Intel XE#1489) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
>           + shard-dg2-set2: [452]SKIP ([453]Intel XE#1489) -> [454]SKIP
>             ([455]Intel XE#1201 / [456]Intel XE#1489) +1 other test skip
>      * igt@kms_psr@fbc-pr-no-drrs:
>           + shard-dg2-set2: [457]SKIP ([458]Intel XE#1201 / [459]Intel
>             XE#929) -> [460]SKIP ([461]Intel XE#929) +11 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>           + shard-dg2-set2: [462]SKIP ([463]Intel XE#929) -> [464]SKIP
>             ([465]Intel XE#1201 / [466]Intel XE#929) +7 other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>           + shard-dg2-set2: [467]SKIP ([468]Intel XE#1127) -> [469]SKIP
>             ([470]Intel XE#1127 / [471]Intel XE#1201)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>           + shard-dg2-set2: [472]SKIP ([473]Intel XE#1201 / [474]Intel
>             XE#327) -> [475]SKIP ([476]Intel XE#327) +1 other test skip
>      * igt@kms_vblank@ts-continuation-dpms-suspend:
>           + shard-lnl: [477]INCOMPLETE -> [478]DMESG-WARN ([479]Intel
>             XE#2052)
>      * igt@kms_writeback@writeback-check-output:
>           + shard-dg2-set2: [480]SKIP ([481]Intel XE#1201 / [482]Intel
>             XE#756) -> [483]SKIP ([484]Intel XE#756)
>      * igt@xe_copy_basic@mem-set-linear-0x369:
>           + shard-dg2-set2: [485]SKIP ([486]Intel XE#1126 / [487]Intel
>             XE#1201) -> [488]SKIP ([489]Intel XE#1126)
>      * igt@xe_copy_basic@mem-set-linear-0xfd:
>           + shard-dg2-set2: [490]SKIP ([491]Intel XE#1126) -> [492]SKIP
>             ([493]Intel XE#1126 / [494]Intel XE#1201)
>      * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefet
>        ch:
>           + shard-dg2-set2: [495]SKIP ([496]Intel XE#1201 / [497]Intel
>             XE#288) -> [498]SKIP ([499]Intel XE#288) +15 other tests skip
>      * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
>           + shard-dg2-set2: [500]SKIP ([501]Intel XE#288) -> [502]SKIP
>             ([503]Intel XE#1201 / [504]Intel XE#288) +11 other tests skip
>      * igt@xe_mmap@small-bar:
>           + shard-dg2-set2: [505]SKIP ([506]Intel XE#1201 / [507]Intel
>             XE#512) -> [508]SKIP ([509]Intel XE#512)
>      * igt@xe_pat@pat-index-xe2:
>           + shard-dg2-set2: [510]SKIP ([511]Intel XE#1201 / [512]Intel
>             XE#977) -> [513]SKIP ([514]Intel XE#977)
>      * igt@xe_pm@d3cold-basic:
>           + shard-dg2-set2: [515]SKIP ([516]Intel XE#366) -> [517]SKIP
>             ([518]Intel XE#1201 / [519]Intel XE#366)
>      * igt@xe_pm@s3-basic-exec:
>           + shard-dg2-set2: [520]INCOMPLETE ([521]Intel XE#1195 /
>             [522]Intel XE#1358 / [523]Intel XE#1551 / [524]Intel XE#569)
>             -> [525]DMESG-WARN ([526]Intel XE#1551 / [527]Intel XE#569)
>      * igt@xe_query@multigpu-query-topology:
>           + shard-dg2-set2: [528]SKIP ([529]Intel XE#944) -> [530]SKIP
>             ([531]Intel XE#1201 / [532]Intel XE#944) +1 other test skip
>      * igt@xe_query@multigpu-query-uc-fw-version-huc:
>           + shard-dg2-set2: [533]SKIP ([534]Intel XE#1201 / [535]Intel
>             XE#944) -> [536]SKIP ([537]Intel XE#944) +2 other tests skip
>      * igt@xe_wedged@wedged-at-any-timeout:
>           + shard-dg2-set2: [538]DMESG-FAIL ([539]Intel XE#1760) ->
>             [540]DMESG-WARN ([541]Intel XE#1760)
>           + shard-adlp: [542]DMESG-FAIL ([543]Intel XE#1760) ->
>             [544]DMESG-WARN ([545]Intel XE#1760)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * Linux: xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b ->
>        xe-pw-136292v3
> 
>    IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b:
>    b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
>    xe-pw-136292v3: 136292v3
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/136292/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-435/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-4/igt@xe_module_load@many-reload.html
>    8. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>    9. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_module_load@many-reload.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
>   12. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>   15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>   16. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>   18. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>   19. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
>   20. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>   21. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   22. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>   23. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   24. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   25. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-90.html
>   26. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   27. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   28. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>   29. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   31. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
>   32. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   33. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>   34. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   35. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   36. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>   37. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   38. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   39. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
>   40. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   41. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   42. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   43. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6.html
>   44. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   45. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   46. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>   47. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   48. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   49. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   50. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
>   51. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   52. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   53. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
>   54. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   55. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
>   56. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   57. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   58. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
>   59. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   60. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>   61. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   62. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   63. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
>   64. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   65. https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   66. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_cursor_crc@cursor-random-max-size.html
>   67. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   68. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>   69. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   70. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>   71. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   72. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   73. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>   74. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   75. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>   76. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   77. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   78. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
>   79. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   80. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-check.html
>   81. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   82. https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   83. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>   84. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>   85. https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   86. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>   87. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   88. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   89. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html
>   90. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   91. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>   92. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>   93. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   94. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>   95. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   96. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   97. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
>   98. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   99. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
>  100. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  101. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>  102. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  103. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  104. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
>  105. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  106. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  107. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
>  108. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  109. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
>  110. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  111. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  112. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>  113. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  114. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  115. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-7/igt@kms_plane@plane-position-covered.html
>  116. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_plane@plane-position-covered.html
>  117. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  118. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
>  119. https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>  120. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_plane_multiple@tiling-4.html
>  121. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  122. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  123. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
>  124. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>  125. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>  126. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  127. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
>  128. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  129. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  130. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_psr@fbc-pr-cursor-plane-move.html
>  131. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>  132. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
>  133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  134. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  135. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_psr@pr-suspend.html
>  136. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  137. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  138. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
>  139. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  140. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  141. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>  142. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>  143. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  144. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
>  145. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
>  146. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>  147. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-8/igt@kms_vrr@flip-dpms.html
>  148. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-2/igt@kms_vrr@flip-dpms.html
>  149. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2294
>  150. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>  151. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  152. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  153. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
>  154. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
>  155. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  156. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  157. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_evict@evict-large-cm.html
>  158. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  159. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  160. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
>  161. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  162. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
>  163. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  164. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
>  165. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  166. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  167. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
>  168. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  169. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  170. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>  171. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  172. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  173. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
>  174. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
>  175. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>  176. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_module_load@force-load.html
>  177. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  178. https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>  179. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
>  180. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  181. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>  182. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html
>  183. https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>  184. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_peer2peer@write.html
>  185. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>  186. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  187. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.html
>  188. https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>  189. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html
>  190. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>  191. https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>  192. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>  193. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>  194. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  195. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>  196. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  197. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
>  198. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  199. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  200. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-1/igt@xe_render_copy@render-random@render-ymajor-256x256.html
>  201. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-4/igt@xe_render_copy@render-random@render-ymajor-256x256.html
>  202. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
>  203. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>  204. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>  205. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>  206. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-8/igt@kms_cursor_legacy@torture-move@pipe-a.html
>  207. https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  208. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-2/igt@kms_cursor_legacy@torture-move@pipe-a.html
>  209. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>  210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  211. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>  212. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>  213. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>  214. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>  215. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>  216. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>  217. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>  218. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_plane@plane-position-hole.html
>  219. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  220. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-1/igt@kms_plane@plane-position-hole.html
>  221. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
>  222. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  223. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
>  224. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
>  225. https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>  226. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
>  227. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
>  228. https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>  229. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  230. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
>  231. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>  232. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  233. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>  234. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>  235. https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>  236. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>  237. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
>  238. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
>  239. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
>  240. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  241. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
>  242. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
>  243. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>  244. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
>  245. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
>  246. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  247. https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>  248. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>  249. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>  250. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>  251. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>  252. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
>  253. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>  254. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
>  255. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@xe_pm@s4-mocs.html
>  256. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  257. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-8/igt@xe_pm@s4-mocs.html
>  258. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>  259. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  260. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  261. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>  262. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  263. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>  264. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  265. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>  266. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  267. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>  268. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  269. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  270. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>  271. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  272. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>  273. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>  274. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>  275. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>  276. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  277. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  278. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  279. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>  280. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  281. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>  282. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  283. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>  284. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  285. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  286. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>  287. https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>  288. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>  289. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  290. https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>  291. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>  292. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  293. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  294. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>  295. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  296. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>  297. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  298. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>  299. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  300. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  301. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
>  302. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  303. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  304. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
>  305. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  306. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>  307. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  308. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  309. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>  310. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  311. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  312. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  313. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>  314. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  315. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>  316. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  317. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  318. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>  319. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  320. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  321. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  322. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>  323. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  324. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  325. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>  326. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  327. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>  328. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>  329. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>  330. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
>  331. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  332. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  333. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
>  334. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  335. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_chamelium_color@degamma.html
>  336. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  337. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_chamelium_color@degamma.html
>  338. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  339. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  340. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>  341. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  342. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>  343. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  344. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  345. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>  346. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  347. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  348. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>  349. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  350. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>  351. https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  352. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html
>  353. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  354. https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>  355. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>  356. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  357. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  358. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>  359. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  360. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>  361. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  362. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>  363. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  364. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>  365. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
>  366. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  367. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  368. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
>  369. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  370. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
>  371. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  372. https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>  373. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>  374. https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>  375. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>  376. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  377. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>  378. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  379. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  380. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>  381. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  382. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  383. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>  384. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  385. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>  386. https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  387. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>  388. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  389. https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>  390. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>  391. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>  392. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>  393. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>  394. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  395. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>  396. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  397. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>  398. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  399. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  400. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>  401. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  402. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  403. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>  404. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  405. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>  406. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  407. https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>  408. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>  409. https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>  410. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>  411. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  412. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  413. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  414. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>  415. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  416. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  417. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
>  418. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  419. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  420. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
>  421. https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>  422. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
>  423. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
>  424. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  425. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>  426. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>  427. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  428. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>  429. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  430. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>  431. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  432. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>  433. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>  434. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>  435. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  436. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>  437. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>  438. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  439. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>  440. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  441. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  442. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
>  443. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  444. https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>  445. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
>  446. https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>  447. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>  448. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  449. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  450. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>  451. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  452. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
>  453. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  454. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
>  455. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  456. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  457. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_psr@fbc-pr-no-drrs.html
>  458. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  459. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  460. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html
>  461. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  462. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>  463. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  464. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>  465. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  466. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  467. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>  468. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  469. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>  470. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>  471. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  472. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>  473. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  474. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  475. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>  476. https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>  477. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  478. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
>  479. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>  480. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
>  481. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  482. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  483. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>  484. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  485. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html
>  486. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  487. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  488. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
>  489. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  490. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
>  491. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  492. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
>  493. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>  494. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  495. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>  496. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  497. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  498. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>  499. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  500. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
>  501. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  502. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
>  503. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  504. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  505. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@xe_mmap@small-bar.html
>  506. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  507. https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>  508. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@xe_mmap@small-bar.html
>  509. https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>  510. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
>  511. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  512. https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>  513. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>  514. https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>  515. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_pm@d3cold-basic.html
>  516. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  517. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-463/igt@xe_pm@d3cold-basic.html
>  518. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  519. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>  520. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
>  521. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>  522. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  523. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>  524. https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>  525. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
>  526. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>  527. https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>  528. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
>  529. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  530. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-433/igt@xe_query@multigpu-query-topology.html
>  531. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  532. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  533. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>  534. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>  535. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  536. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>  537. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  538. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
>  539. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>  540. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
>  541. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>  542. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1649-b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
>  543. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>  544. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
>  545. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
