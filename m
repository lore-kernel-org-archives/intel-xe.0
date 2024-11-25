Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA510D59D7E
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 22:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CB910E74A;
	Mon, 25 Nov 2024 22:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrZ6A5Yw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DF910E74A
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732572940; x=1764108940;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=fiKcH9rrLtM2b8k9RT13Uzl355oi/0XqS9N0FLsh6Lk=;
 b=GrZ6A5Yw/COZYOsIKAwcZR6jpGxpMHw5MjWIALufUuCJdVz0TH5i4KCV
 ZNREEL6NyTx63FhE+S0kc6Hf9YJlK0ZeEBoUzWnWyN1UbiYVRQwycql+2
 Gu/xH4rSCDHqLqJOvpY0zbCM2k2IXv6UGmXcn2/oC76s00uaqerGohsub
 NXm00Ztl8xpCTAU2I+P+57lqnFRXov53AntnRhRr5AwfhLb2UsFLVCkbo
 dEIzo9ZTjcSBns1GSoXYV8KxrWz793c9FgZOzw5Pyx+qppht+uYdP2FcP
 YC5SxJz7kSmdDkmEv+vzBOrfWbd+htUlrmNXbOYxcOH5K00FcS5r+gkA7 A==;
X-CSE-ConnectionGUID: eEjzCbAITdOrGUYwMnS2cA==
X-CSE-MsgGUID: mIKObq8tQvWQyN82xNBpCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32834013"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="32834013"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 14:15:40 -0800
X-CSE-ConnectionGUID: tUS7ERB7TZ+Amv2qEiK07Q==
X-CSE-MsgGUID: keWl4FKSTsWhYZKrAFTcZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="91737651"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 14:15:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 14:15:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 14:15:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 14:15:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn638Ud5/FHgKTinwe9RJQt8whlm0EWEVfRCU+kwSVARuXq5aNKWk8eYg6BCXSgtyAyufRZ8dAvHqqrz3Xyi5klsOsUVFTos3CcZBF1oq2ZXX5b2WF1L0kzwwZ//nizElPWZrf4749lz/D1lCKi/VehvXRyzF6zMfTZNLOtMLX5DZ9CW4typVLWT9/1o5Lydqc2VuQVQnEC6AK80vDia8Ek5IEaxluj/rvoOxrst4FF8iymmKeIbchsi4m18jr+DrbnEax/bHUalVFTOyx5aWcTMr8qz9omXePNXebtxzFdzCa2ejVhoL6EP/QD8m/SRxJ31uFlo9+8drPTqgC1FoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cePsnGqX99ZGUNkKOH0daUTz8v+cvUT8dJczBVXORX4=;
 b=yXmRa4sjFgVVqUDs7df+sbxxcMc5CEt9vM2okd7RmxtbBIGis55NkwQqglfZljXP/EeViMoL89OOMnVR5KlqJ7QN/y73ys84svme0y59zzDn0wVrP7yVBsaF6ZKBTXsocsN1dLwEjo7L5bGVgn3VGReXzAL1lL4yD0NAv5D28zDLJqQFyXBKn6Qw9FUZOAnkeXWelcUC9qXVdJ9hx3SSzkYxA5aZe1m45vDpFxnYuILP6cpeYAAcFwoNzx5RSxZUO8OjCdruMdGHYfEtNMFGAyLNJmqnV2AHXXt/qHjPXa1R+o5DMYZys4VeZvLKi1G8BGdjii0VXmeKiDDoPqxtaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 22:15:34 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 22:15:34 +0000
Date: Mon, 25 Nov 2024 14:15:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= success for
 drm/xe: Update xe2_graphics name string
Message-ID: <20241125221531.GP5725@mdroper-desk1.amr.corp.intel.com>
References: <20241125194838.1190599-2-matthew.d.roper@intel.com>
 <173256900956.2985363.9455906455664154953@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173256900956.2985363.9455906455664154953@b555e5b46a47>
X-ClientProxiedBy: BN8PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:408:ac::49) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: afd485d3-13cc-43f6-4f08-08dd0d9eae54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Jw6Bbd5QMeF5l8OtxtQx9FTJs5uTqGIJbdG5BzrM7PwhRXkq5F6DsrRARoe?=
 =?us-ascii?Q?mvPeWnVL3ZFeCiAXuuwEpsLWboUuqZBaA3SdI+XnWOwkJ+DQ5us57GTmW+oA?=
 =?us-ascii?Q?Yi28j7WVb+jK0OHjV3BJ+oa6dhCXErguOozhsIVCAfdN5ssSfAcWqdSkvoRk?=
 =?us-ascii?Q?1yCt1a55f7aENSYJOiWKj1aAOHuKxzAFiUg9rhPZJGzNiMB1YG1RL3QE4VlT?=
 =?us-ascii?Q?JbYyRyNpaHs+Ms4QnT/ZSRJVhLbTHsl5hO6BV1Fz39T9bLpDIU7lnHKBt9HG?=
 =?us-ascii?Q?dbN8FEBxbbhnFuWqdKeph2vEU4mEkCSsbW86AxVqMPK7B/1jQ5rFDlTJYj8U?=
 =?us-ascii?Q?yk4FqP2P1lmdjxiTM7bOKTzgVDBrHk25n+xpXwpXSuXXbOKNK+UFzdpEkpFj?=
 =?us-ascii?Q?m6dWcl/KSbX7HU5SRQsbgZNbVHqbb1zifwzeSqMfpet/kQ7zZlYQtCenksxP?=
 =?us-ascii?Q?/WFUuu7ieHpq+SXHbqhGjJPfvNJvgWAwd5KyTlirn22cI59sn/cRxgUzIsqY?=
 =?us-ascii?Q?z1VZVzl0XC/WMV6rYNkJ3RXmxSgbn6fqoHqxJDv86WsRFtZKhNGjxdZdFant?=
 =?us-ascii?Q?dhBnQmJrAP+REoUwp+TXHOAl3CWuB2J/Pp0rGACujaV/ZvwldIrNezpt0UdO?=
 =?us-ascii?Q?q3BZAgpykiK0MY2lPHzuGlSrZ0MJisJPy2H7Q0C0IpCANqI3Io3he8/CGacg?=
 =?us-ascii?Q?VNysskEfLvQuquS6zFkswUtZ2gFMs6SrGXFvR22F+odpB5Y6UF0vvilV5wXh?=
 =?us-ascii?Q?Gr4GeZ7574y4bRxV+yoWP6KxpEO6Rm/GWhPa/RGwqT/Gt/39qkw6HisUX0uz?=
 =?us-ascii?Q?QZgKycejRMsaZWFqcrH8RkKWqnaDZGdn6C49enl3ivcB0fL/eNpgZcfc5ZUm?=
 =?us-ascii?Q?9i0OOjHJeAfsKH/x8KT1YN1kNY4FhPpgIhEA9ByciZLA7ibfc+98V/cWsm65?=
 =?us-ascii?Q?2hB8OeVeXyGnv2UPNO9b5oJGEkn9YAgaRtjuHKt75ebXJAlyit6FqHflnzEA?=
 =?us-ascii?Q?+jsrbpAsmnQoOzA6iZ8ryYeCCFOFdd96WZKufdTv6LpySEH0PLaOcUUJf/nS?=
 =?us-ascii?Q?fMgzQf8V/dv2fEMBWjy+6mQ3LxzpiV6h27ZWTvZrT1cJMewBuxang29ZlQ32?=
 =?us-ascii?Q?OOSQ9lzseEADvwbxGjkCEH+mix3LJhJIB88iV/F8+sgjFedGoUzTZGZFBTzF?=
 =?us-ascii?Q?6nresFmF/RNCy7B8uC5gZAGincGpQZeJhkuLYgeYdURk+QFLCX76B7iBQkOM?=
 =?us-ascii?Q?/pHBMO9BRWLBltWaFuCvmeM3awSC4MndMDd7bXOhqSsN1K8amxKjGe8O05/O?=
 =?us-ascii?Q?6yM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZPvoeIdzyxR54S0JcvPKYPWZ/ZVXpLa5yy5ytptp/Ktz26DNWoV1h4arqJSe?=
 =?us-ascii?Q?YEwXS9lBtK4OEr+zJjISrVy4O8N0aRG6nLkIL2ksYuAoY5CozP0yrDQNwzNS?=
 =?us-ascii?Q?dAz3E2dLD3HAXtRChoC+Tz5H8RhTSEbhp+LMGg/2j0Zx5pO9v0IvuIMYcqeS?=
 =?us-ascii?Q?uaSG2C6vKGSJZ8PmY0YCNUPv4D7LO5dFcU4h4DGAAdN4uSnajDwzNHXLxnSZ?=
 =?us-ascii?Q?HMNWqxRXZIYA7h4HiP2mwLpK0L7/OsINdStxNW2gGLwc4ZPlmpRz4AZDv5zP?=
 =?us-ascii?Q?yZkjY1/tVcQoi0oCFfwyOboM+Ihaf90Ehv3k27TcDuUqZwetsurw/8liY3gP?=
 =?us-ascii?Q?Fs6AAydpwJgwIJ8rTbeLTJwaCeiqyyLvM712xe1LYjDtK+I1hK6OzQAzrUPz?=
 =?us-ascii?Q?WWWHNNR+nfikvcLEBS0HwKDHvmQobBX+A4y/ar2TOlPPX2KuxxAYs/3IZoLA?=
 =?us-ascii?Q?vKp63/+zYuKPw4+PTNGBRy+FSa9yTpuvcS4IX6uOlkRvD7gwiwROIIUPOsYM?=
 =?us-ascii?Q?IQFefoSGQYy7MvxURa3HqXSQ2Jo1IrvQplKWGgBYuthSwmEm6pB1x1JE+f8Q?=
 =?us-ascii?Q?yd4p2ofVsL2msZLp7pshCN9XU7emnA0/7gDCqUTBe0RKZPCOxyVaL4VzrzJx?=
 =?us-ascii?Q?tlxlNSYS2qaB9ayFSs4YnEqc8yvpUTAnn3B1wC0+ahXxfmibYM+AMicxGin2?=
 =?us-ascii?Q?WKzKQHMhusalFj4ZS9JSUQPqzKKnQgy16KEWXhk+40YF6WtfxYmQsOf00+gZ?=
 =?us-ascii?Q?r3IMXM7yY+jdrtVnwgugWr+joEgWB1KcW+z68Y2uRuRY3oYj07zhhNbRKFpQ?=
 =?us-ascii?Q?JNbL0wj3kVuQzE86z5B9awjXld9AJEIFpUPAv4pr/emyFs2MHPYq6BQaPls3?=
 =?us-ascii?Q?uZLQWnx+JP5rDQxqYOstvhOZ4jRIcP6zIaos/HVO5Ic4A/bpMQ2dUJwt5LvA?=
 =?us-ascii?Q?+dQSCIdn4qre5k5luDp+5DHtl5CCTCkvMnfAZOvEVzrpjmIJCo1IjXCPn9GT?=
 =?us-ascii?Q?vH6gDU4VtodaigmkznwxwQDA9rwXc86Ishjj/PW5HiIINmu8cc0mJDMAaukr?=
 =?us-ascii?Q?YOpbyUz+FYV+5ly13XCL0VGOmNJAz+F1uZ9MPrTZdn1BgYoUKAm27Bkr3/Oj?=
 =?us-ascii?Q?mBd/vDIkAvBAo3OiEtRZf7x55S6pmruor19LTa/SLfmIhBy0AVvh+yW1oZ/w?=
 =?us-ascii?Q?8YzlwSlJgZGDiVkYU4DggsmgXxua/L8Ix5C3VA8C5GHP4Vr3EErUBMYg4BSE?=
 =?us-ascii?Q?69DcAnv181fG1gWESP8vTzB13EK6vgNfHTkWFFytivID/ZAbv4iM1BBhmThA?=
 =?us-ascii?Q?DQre6l6wch12Kej/aWPMTaAxJccOUevKoZjQISKGU/F2p50xcX6zBea5SGYx?=
 =?us-ascii?Q?R+rVmF28wCWTKvYi8d82q7ciBteQq/jY/OQZ+OtjyS0NALw3/inIj5RRCbrK?=
 =?us-ascii?Q?KPaeXE+MAb+FautUo2LQIiUXeTjp7ovE2U3ZR96bdfV8Nac8XQ1k6bzMIHH9?=
 =?us-ascii?Q?YZmaTHXiZd1IwCiT4s5s9QB8CD5598Fg0ehUhGTgvQSnurSBy40eAY5yu9r/?=
 =?us-ascii?Q?v0AT/BW17PmpRCvMvckD/5vdDykZy8Y37HAQyEL7Wu53iKYypr4RHfQflIWe?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afd485d3-13cc-43f6-4f08-08dd0d9eae54
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 22:15:33.9044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EDomG1UmK29N9BJUjZSHj8YK9Clgks4JlZf6V464id8ic9g9fXveamziygTSwn25dHPbvE0yYJH7wPRa1zW0ZrXm9Xkh6pXrWwFie5FVBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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

On Mon, Nov 25, 2024 at 09:10:09PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Update xe2_graphics name string
> URL   : https://patchwork.freedesktop.org/series/141769/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2_BAT -> xe-pw-141769v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Vinay for the review.


Matt

> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-141769v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
>     - bat-dg2-oem2:       [DMESG-FAIL][1] ([Intel XE#3371]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141769v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
> 
>   
>   [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8124 -> IGT_8125
>   * Linux: xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2 -> xe-pw-141769v1
> 
>   IGT_8124: 8124
>   IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2: 2b9104b225382ff5ecb9cba445ac145eaa3f00b2
>   xe-pw-141769v1: 141769v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141769v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
