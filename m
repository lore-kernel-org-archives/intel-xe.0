Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C18CF648B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 23:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0310E0EB;
	Fri, 27 Sep 2024 23:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVEV14lr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AE010E0EB
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727478895; x=1759014895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oCYPkyb3/QmKonAE1h/U2VIh4IO/GqP6PGWWCrv4v0c=;
 b=SVEV14lrZW5vXO5l6TavewNoaiBwZEsCZfScvdq1le9PTwIgFPPS/nih
 XlGWwnWfUWAdV6JE6q/eSci0796G5oBzrloBov3K5RF/gcvaPc9VwRdNP
 vYYuEeicBQAGsYlpvGN757pLw4dPpT4abXmZzhc8FCOjJO6NfWRu8zhDV
 77fFHAK/l2RFoy/wKBA85nokUqvy16pEoKnNAYmptiVXWai8tzPdC3227
 9vvj4m2/OqKmo6caH1EXp0O2ik9/Rlt4biVCIyXDlIhGd3NQTAImWM//U
 9AewzauskqqJtukbM2cUfsjvSN0pf6GLvwCVZlIsw6gKxbEMy+g4MeNo9 A==;
X-CSE-ConnectionGUID: yvwfY4+3Tyu2nvw6medD1w==
X-CSE-MsgGUID: SlxwHI6yTrKx56a0dQJnAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26802475"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26802475"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 16:14:55 -0700
X-CSE-ConnectionGUID: 1RxfTALHSleUYKT0Gyy4cA==
X-CSE-MsgGUID: uuUXfoxkQ6KZn6COTSbSYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72993770"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 16:14:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 16:14:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 16:14:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 16:14:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMKUDWMFVBDWUPtw6fO4/rdrvBYd6kq5jKwXYwB1IYJRT6NSRYpWPiTmfeHLsVcREb0umKFcmw9gGhBnOZSHpKeSZeTVo6516DscJWrH1ctN7kBtuC5sqyUPMPFj+qIQBajR8VnXTSURkq3le0gxRThJFfUlT6dfLD/AL+DnPwNI1ISmEIgM6LxEEKIpLokmA5R2eVmPb6Qqrt2L/BB3bH8ARXrjnY36/ZPba1BZncR0hnhswX5H2+JGc+BrsPu9vG/7prpFvWigM7l/6w3Rsnp98mf6Ld9s9xi4Trtt5zOEcLH9ZfmSafZWa6qfwWYpKwEx81q9WucEc6A0dd/K/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4L8Rk2FGhyYIG1LffWdTs54YcGnmuMJarLkNfrPKZOI=;
 b=su/ZCWKP6eN7ySwwUTyhE8LHWyjKJYWJs15PJ5PGQwLARY3AYKOlV0tBldFgYslgSBhil97tSpkQOfGJR87z6R4hol9YJUPR8Bn1wHOxkB51OqSTxeNKybFDnkEKseC0j7mCKLBQMl52//G6mbuIa76UwCSGyVwyKmf8rky+qZJ25I3oyTdrQSHCbs6h3BxyjYh5sc3P81VpA9Z5Yh9m+gqG9R9Ou/B8tIcWH/DXOlMDsMqAsLdM8/dO3ztIw4Gwr/HyU39afuG3DhBeiqQVgrdJ5G5ICKDjKMWlC9swAE5+7eoDBuPwHSwN7tyYbxGbcn4ADnHjeYXyxdBFdeY01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 23:14:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Fri, 27 Sep 2024
 23:14:49 +0000
Date: Fri, 27 Sep 2024 23:14:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/xe: fix memory leaks on vm_bind_ioctl failure
 paths
Message-ID: <Zvc8ZgwMqe/4PGV2@DUT025-TGLU.fm.intel.com>
References: <20240927003633.92560-1-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927003633.92560-1-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 1549f9be-a2d4-4052-5cfb-08dcdf4a2efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8OyCOO5cI+vS53YljcSW+jEOczj9CTl4MaCxgjE3/lD3pwMYH+eCruMlecJF?=
 =?us-ascii?Q?qep9NaKwbUKwNh7zHK98d6EYfU5LU9zqXs9Ttavh1Cspl9lBMQcby89KGpI0?=
 =?us-ascii?Q?5burvehhIy3ccXzlaKRYF1CwYP7Bem5Z+twRSt3kPoHCbwfbtmUedHLiwbRW?=
 =?us-ascii?Q?+O4uj6KCCQDaDfFwLvmtd4dJMFzywqdEM9bkEVy95eZhrQJ72OMvCuHc7yPT?=
 =?us-ascii?Q?rcd1DtA7m1a4FUwYy+UfvI+rP+PdddErPc8rdZgfIITAxe7t7S4iw8NE17LA?=
 =?us-ascii?Q?4KI7wzAtjLGdaJgTBCvqorhGuW7catDOebkb7qngQHOOoV64DIiBJVTTX9Ii?=
 =?us-ascii?Q?762dOa0xBwtOvA3u0LobgveYD7f0dif2u8RQ1KwTVVSZJ+dZ72cYPT/ETXhh?=
 =?us-ascii?Q?rPUDgEL5+ky9HD6aLrgyuV/+1Egaux80HCGU2vLl18+OdLnQtEvqdEFN00Xo?=
 =?us-ascii?Q?govQf1OYqMTiVv+GLvDi5nfr6Yl/c/i0tDE+qfgR6/41q3WBwvvo4LErczB0?=
 =?us-ascii?Q?NBgwsfEDN7hLROSnUMS0Va/+f1N5yZRup2SrM925JRfclSOFkD1FVDj8I4YF?=
 =?us-ascii?Q?dQAxdAAyxrsVktQKm7Qiny0qdW2V5+9nvQNmOuNMJlISwLZnwq6FiDcMGvq3?=
 =?us-ascii?Q?st58om/nxx7Uf6L6dhqOJUQ0MFBs83Y1/l2tibOKPvDZ3cAsoVto8J2RrYlT?=
 =?us-ascii?Q?7v8lAKHEjFNHzukU7WzBUo8uMJZQ2w7q7CbPFlYcBUGAu2m7QxeffXFUfyN3?=
 =?us-ascii?Q?BBFXuLe+hQ+tAm5OHk5DPhDClhzyizCbfoQBKHPNzmYrQa/futCFNiOPbkaV?=
 =?us-ascii?Q?pTzLYvGS1DMLSPbNfqcd1DnbSZ864Tmp+kPcPw02jZ52unbrC3XI62zuUMmE?=
 =?us-ascii?Q?253NcZuVKsIS9N/Ub/UltKZKwRG35Tj72gbFPJ0htMgz/kBP3cpqItDIrVhx?=
 =?us-ascii?Q?xJyMbCbLPLsUO3FgaWU6HiTNNjx1Rbh6xhG+ipLnXvMs9vAIDepJMIu51kqL?=
 =?us-ascii?Q?kH2QsHKQ5pCDscFctBxCFzxEy/va6e5KUP5XmBTe9L2SGxZqaGn/nwNks7N+?=
 =?us-ascii?Q?6C8VUQlhs6oY15GhH8Ga5z+aBQxzD/ZiCzFcEVZLchdmpOkl2+IcVKTpt55o?=
 =?us-ascii?Q?d7tkAoEugZ5R1I48HUpRtrx/0PZLJs1OrmSg9di5u5X2w3HNQ1s2clYTfToI?=
 =?us-ascii?Q?J9RD39SaD8havjv6PzuGYePEVUlPcBugL0ifaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uyaCMZYFjhKFHFlutGuW4kcBGjpd0Tbf5a0G92Pux/mk/V6f+9zRRh/rw66t?=
 =?us-ascii?Q?yu06paXBzho5a17WKbH+NleWjvhz2NlKc2Y2ewFsgtAny3HVMdbvbgoTfCGz?=
 =?us-ascii?Q?b8Vt8YRJol/ZbNFlTnO/UlLaAFLCcN+HIBmYxn2tKVNRr9fCV5N98WCMEotx?=
 =?us-ascii?Q?hpahKMOFi9eHoPo5fL4VaPFMaJnFsAhvGpHVh8EeoRgSdAJD+Hk9TAJeGsAs?=
 =?us-ascii?Q?ADOLw3KSvFUzUWlGH8jgh/Lvq8yX4JDE2E6q2VKrB4n+VAWYa6dJc/kbb3+k?=
 =?us-ascii?Q?8OydnUGDtOKsi1LUbPd4JaB5HNJqV/n6XY0zT9t8oxQVQvEaxseMXvgmqH3L?=
 =?us-ascii?Q?64B0PX0v8+E9dKKkEFnbncssHSmUvP4DQuoQmgpWWukXx+2GfYsD8oJ7vv3Q?=
 =?us-ascii?Q?KOyEKn17EPCZjNi0r6u3hNppaSBySw0FoeYM1e0BeQGCOj1k4ySEEK0/7ciL?=
 =?us-ascii?Q?Idp4SXg5waXxLQEiLM3ceKbsi0zJOVRlnSJDEnWPBFVIByJ3Iywln+SPIh36?=
 =?us-ascii?Q?EUUVpGadiId6WdgQt5fX10q6gd71p5oNEBBEJNf42+10XdPTdO8rNNxiL0zv?=
 =?us-ascii?Q?vPBC85tpr8G24WpJ32pvMmqT4I8N+NpNKfvvNrDKhfSxeK72z825U710niA7?=
 =?us-ascii?Q?hCkLG4VzGUg67DdzyCmaV0qHnDcqS48LT52YnL6NGh1xh40OetLgpv3+9iY7?=
 =?us-ascii?Q?WNrU7tsKhtRYWBffWE5GstPlqCG0SfBNY3u7NAAG/rYa7I6icBxLsvvPUyrL?=
 =?us-ascii?Q?IocuMPptQyWbVze5kTb9eAsxbiP/xR5AcnJ0dUNfEfm9pAINQzG2J96Ndvsh?=
 =?us-ascii?Q?DZP97Y7R5iXtJTu+W042nAqoQHVhF88iHxy4MKNijBflnuVhJikn5kunjsi3?=
 =?us-ascii?Q?d6uxIVt597PKevRhTcY7MWrOTfoc8MOShlAGU9noyCXpJuWHSkf/43VwuN0D?=
 =?us-ascii?Q?voEqiioCVaRcJJNbi+ApUnd+/6zjAPhkTqgv809Lh3e1y9WCmKZA/9rSwt8Z?=
 =?us-ascii?Q?gPVyJxnCB0f8cEh8G6DsF9aoK22GiOZGS7DwDy6I3viZRElJzVuZybxP14tT?=
 =?us-ascii?Q?Q9z+ethZETOtd6WKzukfFhMzURrKRsrYx1G6YQNvdR/n3OaCKTKxjR6bN+qD?=
 =?us-ascii?Q?ydw5DWzMXiFlE2KckzswBv5avS2rjMVM8gwKbIis288keS2zTV2xAbvTTRtc?=
 =?us-ascii?Q?eyrPGV1lO9MZAHxQRBwXvbTcLNucJ5GWcyKV+f0XzlAovi7LCxmyryho50Eh?=
 =?us-ascii?Q?X8GfznYzV5KOIyZErMpXDag4DHdzuWn8aGWko3hNx/dLJjVmSDOSsY88MnjS?=
 =?us-ascii?Q?vnAwN3km9dD7M9LjxFJ43Q2ZFy6YGc4EAPHVHr3PWUvmv6Wl49GShHXGh4Ru?=
 =?us-ascii?Q?E6yDkpdUWqc6nnRXWpfrb1fsK8ejfW8NpIkLWXPKLTcgaCpN0eaOfMlWYuv+?=
 =?us-ascii?Q?lO2tNipwXZNs0SD8g9KE1okISk6YjgwLKtkFxaemjYM6IEQZfH/u55YVsQ7C?=
 =?us-ascii?Q?c60xbZJEFy24utx9Gt7bPzMxomqIdcLeXsq4OrMJfoBUM2yWrhFWSZO4U986?=
 =?us-ascii?Q?zEO4u6P+xxFt9muAHX84CK+7C3NnmvFcFYv1yxbpj5nWxG2wNdQ3Ma50CCQL?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1549f9be-a2d4-4052-5cfb-08dcdf4a2efa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 23:14:48.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkldvIvmlZtRNV4t6qDtLOmfFcGCVyAj39Y2dA24Ksa8iCk4uZcQtlGyD6EHEjQKGL4am5Ndu4NUybOVF2XkWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
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

On Thu, Sep 26, 2024 at 05:36:33PM -0700, Paulo Zanoni wrote:
> Caught by kmemleak when running Vulkan CTS tests on LNL. The leak
> seems to happen only when there's some kind of failure happening, like
> the lack of memory. Example output:
> 

So I think this patch is correct that it will a memory leak. I'm going
to fix it a slightly different way though. It would be great if you
could tests this out.

I doubt this would cause any major problems though as just leak a few
pages here and there.

> unreferenced object 0xffff9120bdf62000 (size 8192):
>   comm "deqp-vk", pid 115008, jiffies 4310295728
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 1b 05 f9 28 01 00 00 40  ...........(...@
>     00 00 00 00 00 00 00 00 1b 15 f9 28 01 00 00 40  ...........(...@
>   backtrace (crc 7a56be79):
>     [<ffffffff86dd81f0>] __kmalloc_cache_noprof+0x310/0x3d0
>     [<ffffffffc08e8211>] xe_pt_new_shared.constprop.0+0x81/0xb0 [xe]
>     [<ffffffffc08e8309>] xe_pt_insert_entry+0xb9/0x140 [xe]
>     [<ffffffffc08eab6d>] xe_pt_stage_bind_entry+0x12d/0x5b0 [xe]
>     [<ffffffffc08ecbca>] xe_pt_walk_range+0xea/0x280 [xe]
>     [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
>     [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
>     [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
>     [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
>     [<ffffffffc08e9eff>] xe_pt_stage_bind.constprop.0+0x25f/0x580 [xe]
>     [<ffffffffc08eb21a>] bind_op_prepare+0xea/0x6e0 [xe]
>     [<ffffffffc08ebab8>] xe_pt_update_ops_prepare+0x1c8/0x440 [xe]
>     [<ffffffffc08ffbf3>] ops_execute+0x143/0x850 [xe]
>     [<ffffffffc0900b64>] vm_bind_ioctl_ops_execute+0x244/0x800 [xe]
>     [<ffffffffc0906467>] xe_vm_bind_ioctl+0x1877/0x2370 [xe]
>     [<ffffffffc05e92b3>] drm_ioctl_kernel+0xb3/0x110 [drm]
> unreferenced object 0xffff9120bdf72000 (size 8192):
>   comm "deqp-vk", pid 115008, jiffies 4310295728
>   hex dump (first 32 bytes):
>     6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>     6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>   backtrace (crc 23b2f0b5):
>     [<ffffffff86dd81f0>] __kmalloc_cache_noprof+0x310/0x3d0
>     [<ffffffffc08e8211>] xe_pt_new_shared.constprop.0+0x81/0xb0 [xe]
>     [<ffffffffc08e8453>] xe_pt_stage_unbind_post_descend+0xb3/0x150 [xe]
>     [<ffffffffc08ecd26>] xe_pt_walk_range+0x246/0x280 [xe]
>     [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
>     [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
>     [<ffffffffc08eccea>] xe_pt_walk_range+0x20a/0x280 [xe]
>     [<ffffffffc08ece31>] xe_pt_walk_shared+0xc1/0x110 [xe]
>     [<ffffffffc08e7b2a>] xe_pt_stage_unbind+0x9a/0xd0 [xe]
>     [<ffffffffc08e913d>] unbind_op_prepare+0xdd/0x270 [xe]
>     [<ffffffffc08eb9f6>] xe_pt_update_ops_prepare+0x106/0x440 [xe]
>     [<ffffffffc08ffbf3>] ops_execute+0x143/0x850 [xe]
>     [<ffffffffc0900b64>] vm_bind_ioctl_ops_execute+0x244/0x800 [xe]
>     [<ffffffffc0906467>] xe_vm_bind_ioctl+0x1877/0x2370 [xe]
>     [<ffffffffc05e92b3>] drm_ioctl_kernel+0xb3/0x110 [drm]
>     [<ffffffffc05e95a0>] drm_ioctl+0x280/0x4e0 [drm]
>

How did you get this output? I used a couple kernel tools but I wasn't
able to get output like this.

Matt

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2877
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 42 +++++++++++++++++++++++---------------
>  1 file changed, 25 insertions(+), 17 deletions(-)
> 
> PS: I'm not super confident that this is the right place to do this
> since I'm not too familiar with this code and pointer ownership
> changes a lot here. Still, this patch seems to work on my system, so
> it may serve as a good conversation starter.
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d6353e8969f0..212f7de645df 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -921,18 +921,23 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
>  		if (!rebind)
>  			pt->num_live -= entries[i].qwords;
>  
> -		if (!pt->level)
> -			continue;
> -
> -		pt_dir = as_xe_pt_dir(pt);
> -		for (j = 0; j < entries[i].qwords; j++) {
> -			u32 j_ = j + entries[i].ofs;
> -			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
> -			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
> -
> -			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
> -			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
> +		if (pt->level) {
> +			pt_dir = as_xe_pt_dir(pt);
> +			for (j = 0; j < entries[i].qwords; j++) {
> +				u32 j_ = j + entries[i].ofs;
> +				struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
> +				struct xe_pt *oldpte =
> +					entries[i].pt_entries[j].pt;
> +
> +				pt_dir->children[j_] = oldpte ?
> +					&oldpte->base : 0;
> +				xe_pt_destroy(newpte, xe_vma_vm(vma)->flags,
> +					      NULL);
> +			}
>  		}
> +
> +		if (entries[i].pt_entries)
> +			kfree(entries[i].pt_entries);
>  	}
>  }
>  
> @@ -1564,13 +1569,16 @@ static void xe_pt_abort_unbind(struct xe_vma *vma,
>  
>  		pt->num_live += entry->qwords;
>  
> -		if (!pt->level)
> -			continue;
> +		if (pt->level) {
> +			for (j = entry->ofs; j < entry->ofs + entry->qwords; j++)
> +				pt_dir->children[j] =
> +					entries[i].pt_entries[j - entry->ofs].pt ?
> +						&entries[i].pt_entries[j - entry->ofs].pt->base :
> +						NULL;
> +		}
>  
> -		for (j = entry->ofs; j < entry->ofs + entry->qwords; j++)
> -			pt_dir->children[j] =
> -				entries[i].pt_entries[j - entry->ofs].pt ?
> -				&entries[i].pt_entries[j - entry->ofs].pt->base : NULL;
> +		if (entry->pt_entries)
> +			kfree(entry->pt_entries);
>  	}
>  }
>  
> -- 
> 2.45.2
> 
