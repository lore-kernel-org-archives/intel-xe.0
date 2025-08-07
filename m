Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C7AC87FDA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 23:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F278D10E023;
	Thu,  7 Aug 2025 23:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUdTosuW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87D910E023
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754607690; x=1786143690;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kKH0KMFg+aAT3HSwOdY4mywBouTzLgGvVNtDZ4gHmZo=;
 b=eUdTosuWhRdsKv6WHPM/2B2e8k+U+eFa4yGiK8uyQieXJkK9xT1KxbgZ
 rEPs5GZKJOMD8CGY23gSKH7o4x7qrAqWdhBF5BQ0U7VslCyMGiNDpR8dW
 Flwl8k4fMyEh59YW2yJIQm8CUgGIGhFBCiOSeC8QKNwPSL9NQ71N12zy8
 +jPcbO8rn1YcWOxpEvZB0eMwdNdubfcN4Z5d/M9ejyGAxqAz4ON4QUAC/
 CaWTmX+w7hIj/bUV5T44VTew1LRqVBKrJwadHy2arbcFBCm4rvUhEMC1k
 RUOvMEK6yUj4SihCgMMAOaSErcsJ8YvfdWIJf1L8z9pTuAUc8SsOn0eOk A==;
X-CSE-ConnectionGUID: WVRsRuvLTP+pv/iUfifWCg==
X-CSE-MsgGUID: kB0uQhtXQy2KSqM+X8sDMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68327651"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68327651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 16:01:29 -0700
X-CSE-ConnectionGUID: gfxFeWqWQGCsw5VTsB74mg==
X-CSE-MsgGUID: jstFkiCoQCuegbwUmGK8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164692519"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 16:01:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 16:01:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 16:01:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 16:01:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIKbkHKllwZkKoplLqs6TrB6TXP13hgy8TXqoDK1eu2Uv2lq/E/PncGE1JcBjhfmNiMTU5yO5cASkAbveftSBSl8gRGFO6UQVHfGvUXZd7686KwdDMff9FRQnMwYTMV8qIZpEEQz6WOUctp0KQJOLL/vksNzCJr0SLQwiUOsQedzTo2CBMWT7JIalnynvoRuYf4oODZF1dMcCLdRF5WG9/oMSQY5D/5tXkvDcDPKT9cogsgNHiNevAQhDeWmP8KnH3bstT+P9uHJEA6pKRhRXfeDQoGQxZ5gVqQghWFxoQwKn8CP5G1q9duVcJv2g53f+8bGWzXJ5yR6iGmU+udNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3MoI3yq7EaNnjEo2yYul9hq3uirFoXNK+Ao2Dn3H70=;
 b=Gpp7tOQK6dumZlUUJHwB+bKRWmGNEiNQKcEVAkDDbxJrN0+euwkyfYvxDrOEIEPJOsG9NuYGtlKsU5Soyiw8mDcI6hMr5baFo/HdABIvfub4TaligJR0zIqQyGMe5Am5JuPXG34FTssO4Ir5rbogradjW1twSwNc9cJs43YA2feUjCJNbdZVzH1fEISvfi+5yX/0Cj6KWr9vtDpxpSxA7WnEMX1aRBXV29lxG7ehxqwkh+sDDyRGs0k5UyHC33hSgLjqmwt7QuwRzMeTDOirEktZzz6nGIubT/z/jK6uJnT88TgypTRwOQw4dkxzF0ttV1lcmhxYwA5extkz10mBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9110.namprd11.prod.outlook.com (2603:10b6:208:576::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 7 Aug
 2025 23:01:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 23:01:23 +0000
Date: Thu, 7 Aug 2025 16:01:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: stuartsummers <stuart.summers@intel.com>
CC: <farah.kassabri@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/8] Add TLB invalidation abstraction
Message-ID: <aJUwQC9U9fqybGgR@lstrano-desk.jf.intel.com>
References: <20250807203932.103341-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807203932.103341-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:303:8d::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 59700c5e-d935-4dd5-641e-08ddd606545b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c9I+dU2r2B8loe4/y/1gyVOJ7obRXg2gFt6JYzBmh6UDKOEzqV314HyuVN4N?=
 =?us-ascii?Q?xJVf3ESpuzBdD71iz1Gp8TLXaS1g7Z9oJijGq1u/+7nfIij6e8efOhMYRIkN?=
 =?us-ascii?Q?suhJY5jVh7gXg3R77QqKaMT+Vsa5jVGyysFnENBrGJLW1Tm4TbxkgdsFzrN3?=
 =?us-ascii?Q?IU8OnN3EbX5WAgNhdNErcdPSNHgMa6QJ08tLiyvpg6PKlFmKC2xJ3Nfz159l?=
 =?us-ascii?Q?yXPHoI3rtcxHP/xzFeUpDDaEVGJfev/XuSowZoRtnkuSQQb8VqFpgjqzMBFj?=
 =?us-ascii?Q?NtjujRim0rK2OVQylR0tUANveJFMYWTqKhZAMy2L0XKryPVaA3T0XPBFmP8V?=
 =?us-ascii?Q?Zw4oe9VaUqhNKtbOEo4+ihG0ph/L6vQqBq3bEDVshwcHoSOSOIpmKdIL/rnF?=
 =?us-ascii?Q?ovq1P+JzLK/knXWEfFAsRycMWvP2u86HmQk2QeHYpd/HAmRaHL9fXlkKsBlk?=
 =?us-ascii?Q?sPTQwnmFxaHjPxZ+opA5BC7jE9nMAK1T/LPKcOmKwyTpvilzE/VYLgxolLZb?=
 =?us-ascii?Q?Qw2MhQDRmSY4qqBD3uxgzK0/vhsuVYVLep8AEyje5PhTH5LYxLg1JSLUdXJt?=
 =?us-ascii?Q?rn8wYBYw/mXL6ELMFcnuP8IglWmMlortoz/aYuSG86zwIJyfy5xi/EVf1F5Q?=
 =?us-ascii?Q?bWrBbLqwxXf5TigVRP35Xvdzcohj5tclxAacMDx7DAZsIkVgt2+aCgn9XOF7?=
 =?us-ascii?Q?klqFNDpKl3QKjy9V2208D0POCiIOOZTSMl/slx+EwyCqwtPilOQ/fa5ZOqYo?=
 =?us-ascii?Q?JIFQ25zSguvrEy2Yr2mBabfBZZBuRVky3vnQuSQcSAJoZONGGHhcTYlWntRS?=
 =?us-ascii?Q?RrkV7mW85Ahs3ap13P6XbwhPv8h4Wi/BojM30RFSdydJ/X20zOW6c3aS1FAx?=
 =?us-ascii?Q?qLh3VuDMCOwoso81/dTJ7OsWU+/QfD2Xpl6VFyKqjBTnxU9d5HU8JTorpUKO?=
 =?us-ascii?Q?+bPqwCGbHd4iOGJPdmOIKK8Yrby9fs1jLmLHwAIm/HLcrNzfcmI/qSJIQNF8?=
 =?us-ascii?Q?Z5WkmaIfvdFKclIbcg7Bi769jpUiH52Rr4/dyoguadJ9By+DCmRib1cOypDm?=
 =?us-ascii?Q?W9EywiMgoVFCNqKxSPHkao8JGzMHsSrhfN4HeGzoZqWS/GOd2Xk1FQ2H4GHj?=
 =?us-ascii?Q?vbYDIGSUUhzb6hHqaFiV1/Gi1tKWGNriHJFS/SGDJcvmcK/6pNH+e8C0TozZ?=
 =?us-ascii?Q?SdNs8KN2rUoEqg/Eo58kKUQkiXWgrKSBL8+sg/vEkKK1mf6R6H5wU3cFyGpC?=
 =?us-ascii?Q?HNLfs+w6W05p+gwkDPq6nLSe3APJpZQyMfkhlmT3jdBO50zxfkPd2cw2n2Gy?=
 =?us-ascii?Q?LAM1LwLCHf9vLP2SJv02V+b3S8uQyUfKpd4uGiJ+n24cjsPNK6PoGwNubndy?=
 =?us-ascii?Q?LtQ54s8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?avKAh4aiSyl1hvM4sioRA5MpPUsO1Pi8yxXSXLk8rGsfFKbbUhP8+Ab0JigJ?=
 =?us-ascii?Q?jaPuf616bgcT/7HRW2PvG3AWOMBkW2Wjo/v5hyjziNZyQi551YhXE0eHq8TR?=
 =?us-ascii?Q?XAoexzBJYamr4grEuBq+30asr/ooRWegx+LcY1wcYzhJcw6jQ5AOKzsrHter?=
 =?us-ascii?Q?kKshfMQ9J8ssWmc53NrgJ7Yv8SFipHf1bI/wRh2vruWPHzXIJ5KR8SVhGyU2?=
 =?us-ascii?Q?3GAvkr5FX9xYEhWxBp7Rb4PD7xzqzP1VaCeRZCgKql0/gVAk2lp9vhJqLger?=
 =?us-ascii?Q?xuJ1yqTPqE1Nc4VLVwX/adXxTFQ9yKqMTP1t6rLXgarhOoySWd3CwfGhCX7X?=
 =?us-ascii?Q?ZHOjIbmKbgPMvY8qLPXoASx4SUVw/f5UlFYVVyc9FR0qX8Wbiw29sGzz0Te4?=
 =?us-ascii?Q?rI/o8ulJyzZwwxh4rc+MkZb9MSITHx9BXg1iwwPYxL43iQGMar3h9pIj4tPj?=
 =?us-ascii?Q?bFS9zNlxOICkzZ2Q6EaUaRgRYY0plBTq6hPC7OAcjbXAVnczHb4+xZrrmjn5?=
 =?us-ascii?Q?2PJC2S49RPvleKmcrqF2n1rnLgiiPIcI4Em0jPt32QvTY5QfW+xKwHCn8BBi?=
 =?us-ascii?Q?7WT3vPPduORGs/Wj1cpksjdQ1sIxB3i/1aPZf3I0fUiZw7HtqlhFeMDde8eW?=
 =?us-ascii?Q?piaEz6fuQh4lwdMqI8gW7WS6OZ4y4F2BP7Z2gf4AQRcFlRsVteQVWkCDvOs4?=
 =?us-ascii?Q?3MlK2qOxefLAam7vBiD8+lNpHQ7oTk/1kGXRL0V0a4bkJN8NSY8vVQrlBUwj?=
 =?us-ascii?Q?he6tfwpRBg5qTEIjJPgWrdjustGmDNdT8WCXr/3i/4SEmI118GXNiDilEBYd?=
 =?us-ascii?Q?n3fsgzr0F5ZaXXGTF5nNa6ZSY+FMy2f3N5M82dMGL7Cr9/60o1GXxAh6awwA?=
 =?us-ascii?Q?5TgbOdxhol6eGZXVVt/Y3WPVxS1o64w1xO1G2xb4+dEbWO5TgbeM4DXviRft?=
 =?us-ascii?Q?U3mv61s7/dO2G+LOgwqaEYrNhSimgNuWnIWl7VMdSM7vDZjW1gSWOd+Y0hqh?=
 =?us-ascii?Q?28vzRBYonOH9iaBXGS9yJd7jBQbz+wPsVaTD9feH5AYxzcneirQLCmQG2Z20?=
 =?us-ascii?Q?lM1ig7xmI1/V4LVrv6aMnExPF3D6glxEK43GRsqtY2lNzXPYsafr2Ds9ENvd?=
 =?us-ascii?Q?zywG2C2OnAGfMAqsjvFLuakfUOMcS/4WS9YsuFZoOyWOQPsNj7isW8NBlvqG?=
 =?us-ascii?Q?Zw/5UmcjoM88VFalZh4sCWpCIPX3Nu/CVwrdwyyYbb1Rb7KGyrt10Gv27tz4?=
 =?us-ascii?Q?bAjaAol8CpSvV5ITUV7zuhXQg9vIgwMj7AxbtCpO8DPYi4LF6Q2PtnvIW2G0?=
 =?us-ascii?Q?yiRV+3Vb3tUmm0yVt7Nisr8i5x1r4p9QEurH17/bHl/BlMt7Xovi0/hCMA3j?=
 =?us-ascii?Q?1RjlSfwujI7EWzA3zDQN/BWHy6r95MHygOUVv4pjmcfoEqEEltjRBKf6rdzs?=
 =?us-ascii?Q?wU4/D3DV5T6QRevOMErnqrPBDzceFm0PONaG5rlTL/M0YFsX+/kCZUzNjbMh?=
 =?us-ascii?Q?5Kfmjg0ufPYyc3NHXF88vEiEx0rJz4MapAfwfhJ35rMWbnX76DKrbMdGnDNx?=
 =?us-ascii?Q?S+fr+Mb9ocO/YJz7/BLAG7URsQyYxvPYn8De8dKDW9YSeF4zMdD3zwWUsIxq?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59700c5e-d935-4dd5-641e-08ddd606545b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 23:01:23.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgmjtUcoTbyfctkWp8omNaFGKoXQYMv7i7XtjKjuIW3xMc1E0YzqCxY449rlQXu7Jq9atzWsPWtxoRJsieDhYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9110
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

On Thu, Aug 07, 2025 at 08:39:24PM +0000, stuartsummers wrote:
> This is a new collection of patches from Matt that has
> been floating around internally and on the mailing list.
> The goal here is to abstract the actual mechanism of
> the invalidation from the higher level invalidation triggers
> (like page table updates).
> 
> Most of these were brought in unmodified by Matt, but
> I've done some minor rebase work here and there and
> added my signoff where those rebases seemed a little
> more extensive.
> 
> Tested on BMG locally.
> 
> v5: Make sure seqno_lock covers the prep and send in
>     the later patches (Matt)
> v4: Replace CT lock with seqno_lock
> v3: Minor spelling fixes and added R-B's per updates on
>     on the mailing list
> v2: Start the series with a new patch to drop the
>     explicit CT lock (Matt)
>     Pull in the remaining patches from [1]
> 

Gave it look, lgtm, assuming CI is clean I'd say merge at your convience.

Matt

> [1] https://patchwork.freedesktop.org/series/151670/#rev1
> 
> Matthew Brost (7):
>   drm/xe: s/tlb_invalidation/tlb_inval
>   drm/xe: Add xe_tlb_inval structure
>   drm/xe: Add xe_gt_tlb_invalidation_done_handler
>   drm/xe: Decouple TLB invalidations from GT
>   drm/xe: Prep TLB invalidation fence before sending
>   drm/xe: Add helpers to send TLB invalidations
>   drm/xe: Split TLB invalidation code in frontend and backend
> 
> stuartsummers (1):
>   drm/xe: Move explicit CT lock in TLB invalidation sequence
> 
>  drivers/gpu/drm/xe/Makefile                   |   5 +-
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c            |   2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                  |   4 +-
>  drivers/gpu/drm/xe/xe_gt.c                    |   8 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c          |   1 -
>  drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h      |  34 -
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 604 ------------------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  40 --
>  .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  32 -
>  drivers/gpu/drm/xe/xe_gt_types.h              |  33 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +-
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c         | 242 +++++++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.h         |  19 +
>  drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
>  drivers/gpu/drm/xe/xe_migrate.h               |  10 +-
>  drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
>  drivers/gpu/drm/xe/xe_pci_types.h             |   2 +-
>  drivers/gpu/drm/xe/xe_pt.c                    |  63 +-
>  drivers/gpu/drm/xe/xe_svm.c                   |   3 +-
>  drivers/gpu/drm/xe/xe_tlb_inval.c             | 419 ++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval.h             |  46 ++
>  ..._gt_tlb_inval_job.c => xe_tlb_inval_job.c} | 154 +++--
>  drivers/gpu/drm/xe/xe_tlb_inval_job.h         |  33 +
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h       | 130 ++++
>  drivers/gpu/drm/xe/xe_trace.h                 |  24 +-
>  drivers/gpu/drm/xe/xe_vm.c                    |  66 +-
>  drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
>  28 files changed, 1083 insertions(+), 925 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
>  delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>  delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.h
>  rename drivers/gpu/drm/xe/{xe_gt_tlb_inval_job.c => xe_tlb_inval_job.c} (50%)
>  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_job.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_types.h
> 
> -- 
> 2.34.1
> 
