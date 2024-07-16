Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DDCC3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 16:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1A010E7D3;
	Tue, 16 Jul 2024 16:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAGmcdDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AADE10E7D2
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721147592; x=1752683592;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7oPwbSeNxhAv4Y/r9xKJM593v8T44qctp+CW3uh0VMU=;
 b=FAGmcdDk9UKQ24vHSNLSrIrLS6UMtQVnfcyJX6jRhDu6hhkGl3F/Tvol
 iMIgN0Il/hetSwG/D8b8Vy3zn/j/cH044gEI5q/sXa1wnPGBSqKwWdWxB
 KUjKJSr0oAx2ofV5AAejO1xrFtRL/iUAd/WnCvHdOJF7lrQ0MAl81+IZl
 qI/jC/2mwVWwJxr6zxsF9XWxFvL3ERGdQ4exf7+5uWely1lK/UMRlmblo
 TeOLOmyX9AJastcaSE1Gmynkbx7KjJqgUmwCTI2v0exZHEAP/iGJLBrCY
 HEY+nlTGL0wezNYkRAAM7/DYUGEUe3NAGx5mXY14OV2S0X2TvpOY2ieqg Q==;
X-CSE-ConnectionGUID: DZyADapyTRCzPtbYmVU7Fg==
X-CSE-MsgGUID: rx+BPjjRSHS2d/g2XaPVIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44025171"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44025171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 09:33:09 -0700
X-CSE-ConnectionGUID: x7QpkdhgTZexK6IdxXPwDw==
X-CSE-MsgGUID: urndchqhShKBWhL1MWPrYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="54304621"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 09:33:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 09:33:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 09:33:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 09:33:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 09:33:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGfL3jEinc/A2xY34IYwQrkOBW2pIEwX/Z5CDuKLA/Fva1I1LARlEv9DwhVW3qoR8lEVJ0/x1cRkrAoz+6ZPqdupu1aZ4RbwdUndwXUJuOXyOnds2suv3xCokvGixWp/ORtku3B7pIov/1m/0EYq895Z98rYZVrMcv2dMs1bfIo8vos4sgIPGYA0EnfHkPduXiWwb/GbT23Mz5fqAfwBfuwpf16gYfO+fPV4pTAV+7e4ucd7h2ww8EcAeiwV0OhkbtI8jJ3KCkWAiz7KLCXn3Y2wPuCrm9EtBaSOnteAzGBiBGxZWKpEiJGm4AUFFurdJBvI4yrtQIiT2FlrR2kAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2tIS3+Ad3s4+DMpBt6JgisNypLNZKdQIwCBmdddEZo=;
 b=ss3PstOGq+ehwOAwJuJXi2jz6mXzafGoPFEy4zH6APEZZdpKoADuxyq/XsnTEEBJp0BOIgLtDqzV8Ex45dvTTusWv/YOeHvx/y0OCL73ehVCR494+M+nHzBBkceeyI5nQOIbignlVA2ILh4ud+lgduUu75NF5mnMgiZz14YqISzUNDtM1KbERVQLCzjKgtcItXptCEopqVzlMV62JNErFSGio9N30p+Y4YyTesQUhjWP+2VjcLyxT9QE701UH0SHzs+QAG0U6M8ewTrHWksTrAyYz44UA0yQodc84EPMPwBSVbgXoSnhhbL1y0nj5PWfO5ERkx7PvBjJD5/sHpuXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 16:33:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 16:33:04 +0000
Date: Tue, 16 Jul 2024 16:32:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/vm: Keep the device awake for TLB inval
Message-ID: <ZpagjxFtmdhsIka0@DUT025-TGLU.fm.intel.com>
References: <20240716133855.12015-1-nirmoy.das@intel.com>
 <ZpaVlInvZh0XRUMH@DUT025-TGLU.fm.intel.com>
 <a53141c6-7dbc-4558-b134-01dce242e704@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a53141c6-7dbc-4558-b134-01dce242e704@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:74::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf24470-5d6e-445d-3b8a-08dca5b4f741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UTjTQqHnN7s9dUX1EiVoGg5AjJMG7qLHtl1VKdQVdvipqorFlhznZ3FArm3C?=
 =?us-ascii?Q?OFMrfh0xXjuIv3sTaAx3rRQ/lmVNkGnizh4rXOp3x2AQBub54U6ArXIeW0xu?=
 =?us-ascii?Q?lKFx86539+BaipSWFL9GIcx8sM5/JRu9ma0m03W8QTV/tg0XiJGSCyBVE+BR?=
 =?us-ascii?Q?ou5eejdi6cocyvXb+p7oYStEf+Xd6/0Pqrxfq8ojK5yh1angJra+lc53+w4w?=
 =?us-ascii?Q?aJmmisakPPKL4bB+nIlG1/a3yNFFC9Jzv7oK0frHlLLkA62W8RNTzABeTyeV?=
 =?us-ascii?Q?pWVx8DUR1lt9Nu0s+eEjbDbxkZa7DTlW/AI7WDsYAO1b4OoZ7XODMLLd2ynE?=
 =?us-ascii?Q?WnShv6nI+Gbkifd0KBpHm4Y+F2j4c+4S/xcew1ZdZmqx3tH+G9y1+rh6yn0w?=
 =?us-ascii?Q?ubbcZBJKaREZARMf0K0e966noyV+zWuhUvoOE9+bo9Z7JagErpViENGFJa9K?=
 =?us-ascii?Q?mTXmDVFYesf2lDbrAxD3qi12UJMViBlSWdaX2Re/VW8Rw2CqOGHyQcKrqped?=
 =?us-ascii?Q?Kd8Zpjay3X2ql2tqFHgvthRRoJL18/pKLXDvI2yvTFCuhG37+cg61KGO01Lq?=
 =?us-ascii?Q?x6Lrdw+l8C7OVcUh40MqLy/ufmloutSa3ciNoxxg7CdlX5e8qncg/nne3lWe?=
 =?us-ascii?Q?PMcrU7KIuXmSLfhX0/w3b9afuolQ+uA5G1ZMr5p6ycfaes/ZL440ZabC7+Eg?=
 =?us-ascii?Q?81KMJ7wyJ8OCUHBgfnruvaEXviqOJ2fQjavsAqA/sohX/4POzKBpY4Yxvywj?=
 =?us-ascii?Q?aCBIqCkSZbqiFbRfX92VJNiKIwWg/T9/AN+W2sMgTMeLbIOM33u2QngeXl+W?=
 =?us-ascii?Q?RLq4+wYtZGAkV2kgJMqUTJoJOiKVgJBGgDoIjsKyz3/CYy8slmvLrBs4bn8x?=
 =?us-ascii?Q?CsLrDXRZTddSW2IM2r+gKU7rFWkp+eL6ok71F6s6GO9AW3ujrLt3Y1YP/0Kq?=
 =?us-ascii?Q?4+MI0XbpRlAZlSbAKKh4wtPdmgLsh1P86BL91KAJ+EZAQZ7IzSJcXsCV4ITF?=
 =?us-ascii?Q?cOc8Du97wGHUgrpf2MrqPcztDtxbaB7w/rM1Fkk+teUjqGIaCWFUwsortDI2?=
 =?us-ascii?Q?aNS+YWDIfoh6thEkYgzJiLe370EEgGy3NyhbC90MU91t4JpzG/X5wWsm4xxK?=
 =?us-ascii?Q?S6sfaoLSM+HvthHA6yQNygX+CkrnupALkcNIkVhM7IzUnDO0vVMgd8X5hwx/?=
 =?us-ascii?Q?BXt3HZUu19qOnrPwRKL+bQ+ubk6NBCYDNuEe7NxNRNxVaXgOO/dnRSfFTn0M?=
 =?us-ascii?Q?GpCoVpbGaA8FPkcOzG0jqxRKUtyaL1QLxkwLFzPDKkpZ+mcpttzzIwSawzrd?=
 =?us-ascii?Q?zfs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvwzI/7Ku2r+aTkBfvQVSUnGunsAZ18DGfnKZ9AF5m3aUdsFeFuTzYwdNAtF?=
 =?us-ascii?Q?12KXUrLFeo/FJoARekhvHF3qH6NUAylm2w/0mAf3HO64RxlK691d3AKXC0ib?=
 =?us-ascii?Q?43nDmFYCI0J9Fnb+rDSxpKUJ90i1rUsmpNdYBR8XCffd89MbsD6homedQu0P?=
 =?us-ascii?Q?G/qZ1c3vEw1vijNhUBNuWoAk6sAkC/nQCHu949FqLaWijo6IoW87vuPBrKQG?=
 =?us-ascii?Q?fOS/rYCS3jRdi5rt8Fl+6uB7t0bSbkovR4NmYhwro5IgX0Ksr6u7fZ5zGrWC?=
 =?us-ascii?Q?esylMifSqhCZ0Air8WhsJb6evkYBPRLH1d9Z6l6ve891ERewA2NvRxdqoIwQ?=
 =?us-ascii?Q?VtVfWvzKD3g/l8kLWluIgHj0gBwTsoZNp1jc7M7I3ZUwqAdHC3HG4uSzLfyk?=
 =?us-ascii?Q?zuI1/8v6XzT0AbRqcNhEs+udrm66qw7OXpaE+Gr8Xb4I0B4KAV9DHXDYgnjH?=
 =?us-ascii?Q?hTZsrqkzkZjBQHLKf980iRJ1DeyUI2rMk8geRzj00S9XrCXK80kbBhv310ef?=
 =?us-ascii?Q?CH/xOs3lMjobsf7a34prGUu6i8X5pMO7DMa2zVgPWzN7L17rAzHk5+isSAep?=
 =?us-ascii?Q?kQ9jO/+y25AMAuzVhsXcfZEkJbWa8YrY51uywLd34XPDWm00CJzTAtjqiR+H?=
 =?us-ascii?Q?ovgGjDZba/aBUVYLhHc2/SofvF6xTFeX05YGXyNDBNTlLo/F5/zhtut0G3GR?=
 =?us-ascii?Q?F3N4R4Vs3iFZwXZgHI7Qb6Ky0NH/gLGfPzQ+05G+pUV7rqjnuRAT1qPcXaM/?=
 =?us-ascii?Q?TJrvu8q7A/t8kjT1lfEuqnJMEw6gsT3cDckicqh5mGHN3Uqe+lmUREnviT2M?=
 =?us-ascii?Q?rTo94b+q3ek/nYsK4laAibapNP9BOScByU/4a8q9jOCqU5t3NK1K0UZprSn3?=
 =?us-ascii?Q?yBgBxVL8j9bnZvuA2eEKUi1zVXquM4MEw6Tm/FHarL9/6V5FTZR0HQgZHJ9X?=
 =?us-ascii?Q?Ft7Z1m+q+8ukYPe7hMw7olSnajgVU5Hz3fKCdo0vbZC9623NsPKQM761ax4H?=
 =?us-ascii?Q?mrbY8Y+PM0NuJ9Ld+OU0pPd18ph31sgn6WU6TF42hFguFxqj1wqC6u3xkuS/?=
 =?us-ascii?Q?tZKXsE+1MB6zgE8wfA4BfSGrM3ZRc/d6m2YeeNbsLwk0A0ejHQ+fRYuamny0?=
 =?us-ascii?Q?JTVLD2DQIXxxJj8mf9YrtUu5jAgRQYHvpoq/WTVQ+6LWSXA9IJKJS9nhxoIc?=
 =?us-ascii?Q?sKZBk0OTQxhRuO0Dov6sB0jtofTIYeyZJ+XeuWVt1jjwSFClnwdWRkX2sRLi?=
 =?us-ascii?Q?QmSTvSgS7ZSyYmCQkH9j4v0FC4g44w82CZ/q2SW7ko7nubtXjUDtjKRvmNSJ?=
 =?us-ascii?Q?mEv+2VDKYhbMg2TAu+M3BFnBQYekSUWY/6cMUaV9Kvtvx6zDbVu5ix951q+U?=
 =?us-ascii?Q?RW9vKkXJy89n1NX7OdJpnq3Kkv5vP+h4L38kgxewmNi7YqJUPlB08pOKEmVH?=
 =?us-ascii?Q?6bcu3hKN/M1adWDawH+oZYArXfJkReSZ2pzmUj9WWX3Kpd+u89Mt/6JhzmM9?=
 =?us-ascii?Q?+mdKjwjH33szTje7zC17yEwtty4mHI4IxvMGTSswmWuXTOX5/PphzsxII0/I?=
 =?us-ascii?Q?Hj8AAgLHMmiyLuUcij+jT9rbg1pFnfqF+NkVXC3f3dqLZuc2Cxm6HW+N/ks7?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf24470-5d6e-445d-3b8a-08dca5b4f741
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 16:33:04.2023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhP9Jo5cBaV5EEPOSX6bg+zawZiatNEOc/dPViyZo05pySP+v8siX0eBhFQchKcjIkPqAKDaEGa5NzH6WloGtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
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

On Tue, Jul 16, 2024 at 06:25:01PM +0200, Nirmoy Das wrote:
>    Hi Matt,
> 

Outlook reply? Prefer a Linux email client for the list for proper threading.

>    On 7/16/2024 5:45 PM, Matthew Brost wrote:
> 
> On Tue, Jul 16, 2024 at 03:38:55PM +0200, Nirmoy Das wrote:
> 
> GT can suspend while TLB invalidation is happening in the background.
> This would cause a TLB timeout when that happens. Keep the device awake
> when using fence which doesn't wait for the TLB invalidation to finish.
> 
> Cc: Matthew Brost [1]<matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das [2]<nirmoy.das@intel.com>
> 
> + Rodrigo our local PM expert.
> 
> 
> ---
> Adding strace here for more information:
> 
> xe_pm-18095   [001] .....  3493.481048: xe_vma_unbind: dev=0000:00:02.0, vma=fff
> f8881c3062b00, asid=0x0000f, start=0x0000001a0000, end=0x0000001a1fff, userptr=0
> x000000000000,
> xe_pm-18095   [001] .....  3493.481063: xe_vm_cpu_bind: dev=0000:00:02.0, vm=fff
> f88812a00d000, asid=0x0000f
> xe_pm-18095   [001] .....  3493.481093: xe_gt_tlb_invalidation_fence_create: dev
> =0000:00:02.0, fence=ffff88811bf3d000, seqno=0
> xe_pm-18095   [001] .....  3493.481095: xe_gt_tlb_invalidation_fence_work_func:
> dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=0
> xe_pm-18095   [001] .....  3493.481097: xe_gt_tlb_TL_fence_send: dev=0000:00:02.
> 0, fence=ffff88811bf3d000, seqno=93
> xe_pm-18095   [001] d..1.  3493.481097: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
> 0, gt0: action=0x7000, len=8, tail=44, head=36
> kworker/1:2-17900   [001] .....  3493.481302: xe_exec_queue_stop: dev=0000:00:02
> .0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
> kworker/1:2-17900   [001] .....  3493.481303: xe_exec_queue_stop: dev=0000:00:02
> .0, 3:0x1, gt=0, width=1, guc_id=1, guc_state=0x0, flags=0x4
> kworker/1:2-17900   [001] .....  3493.481305: xe_exec_queue_stop: dev=0000:00:02
> .0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x0, flags=0x0
> xe_pm-18095   [001] .....  3493.756294: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
> 0, gt0: action=0x3003, len=5, tail=5, head=0
> xe_pm-18095   [001] d..1.  3493.756470: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
> 0, gt0: action=0x3003, len=5, tail=10, head=5
> kworker/u32:1-17912   [006] d..1.  3493.756535: xe_guc_ctb_g2h: G2H CTB: dev=000
> 0:00:02.0, gt0: action=0x0, len=2, tail=2, head=2
> xe_pm-18095   [001] .....  3493.756557: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
> 0, gt0: action=0x3003, len=5, tail=15, head=10
> xe_pm-18095   [001] .....  3493.756559: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
> 0, gt0: action=0x3004, len=3, tail=18, head=10
> kworker/1:2-17900   [001] d..1.  3497.951783: xe_gt_tlb_invalidation_fence_timeo
> ut: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=93
> 
> 
> How do you know from this the device is suspending? I can't tell that is
> happening. I do think this raises a good point that suspend / resume
> should be added to ftrace as that is useful information.
> 
>    xe_exec_queue_stop() was coming from xe runtime suspend code. I am
>    pretty sure about it but I could double check it.
>

That would be a good idea. Any chance you want to try adding some useful
ftrace points to get full visibility to suspend / resume flows?
 
> 
> 
>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b6932cc98ff9..241b7ea00d5f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2700,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>         struct dma_fence *fence;
>         int err;
> 
> +       xe_pm_runtime_get(vm->xe);
> 
> While I agree the device shouldn't enter suspend while TLB invalidations
> are inflight I don't think this patch will help with this.
> 
> This code path is called in various places in where we should have PM
> ref (VM bind IOCTL, exec IOCTL for rebind, or preempt rebind worker). If
> we don't have PM ref when this function is called, that is a bug that
> needs to be fixed at the outer most layers. Beyond that, GT TLB
> invalidations are async and pipelined (e.g. they can be sent after this
> function returns and completion can returns sometime later).
> 
> With this, I believe correct place to fix this is either in the CT layer
> or perhaps hook into GT TLB invalidation fence (Arming of fence
> takes a ref, signaling of fence drops a ref).
> 
>    I was planning to send something more simple:
> 
>    send_tlb_invalidation() -->   xe_pm_runtime_get(xe);
> 
>    xe_gt_tlb_fence_timeout() --> xe_pm_runtime_put(xe);
> 
>    __invalidation_fence_signal() --> xe_pm_runtime_put(xe);

The problem with this fences are currently used everywhere in the
current code base so we'd have an imbalance. This changes that [2] but
even with that __invalidation_fence_signal wouldn't be used in same
places. Thus building it directly into the fence would make sense to me.
Their are concerns about fences signaling in IRQ contexts though. I've
pinged Rodrigo about this off the list, let's see what he thinks.

Matt

[2] https://patchwork.freedesktop.org/patch/602562/?series=135809&rev=2

> 
> 
>    But that seemed too low layer for power mgmt calls. But if TLB inval is
>    pipelined then I agree we have to stick to a
> 
>    lower layer to fix this but probably not down to CT layer.
> 
>  If we choose the latter
> option I think following series will help as we will use GT TLB
> invalidation fences everywhere for waits [1]/
> 
>    Regards,
> 
>    Nirmoy
> 
> 
> Rodrigo - I know we had talked about something like above but it doesn't
> appear this has gotten implemented. WIP or did this get lost in the PM
> work?
> 
> Matt
> 
> [1] [3]https://patchwork.freedesktop.org/series/135809/
> 
> 
>         lockdep_assert_held_write(&vm->lock);
> 
>         drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> @@ -2721,6 +2722,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> 
>  unlock:
>         drm_exec_fini(&exec);
> +       xe_pm_runtime_put(vm->xe);
>         return err;
>  }
> 
> --
> 2.42.0
> 
> References
> 
>    1. mailto:matthew.brost@intel.com
>    2. mailto:nirmoy.das@intel.com
>    3. https://patchwork.freedesktop.org/series/135809/
