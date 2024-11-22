Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0164FE65D2A
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 04:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D6B10EABE;
	Fri, 22 Nov 2024 04:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h58h0b9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C2810EABE
 for <Intel-Xe@lists.freedesktop.org>; Fri, 22 Nov 2024 04:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732249440; x=1763785440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gWPiVcurMRwAF8RdKIdsRu75UxBa296pgPYHIFgz3BI=;
 b=h58h0b9UG72SllqCMJTn8+EhLEwL5Eqa2PPJjDxyK4LvicZKPlOGTcVC
 Epv7EQUWg+PD8+nOpNX8ZMKRZ8/5+nSY7HDH2LRL6xfpOuS44iX+o1X4a
 DLnPiW+Nn7lPc1CmbsUoiGZqapWuUT0zuT1VUmFzC7RYqYy0h8q1CQUfz
 tLMLqz545+vglcgCI6FjW/s4BW8KMCxa6fa7jXhzbI0JO3sGlb0bLAv+U
 PEjkJc6CUmZfn3S/QWz464e0Tm7Sn0/4/rRvC7VmpUU6n4B+zle+yOmBm
 Ebv4atfuCM+ENjJDw6rDyHNyCsIVAO07VMCIsAuEzVkSLdDiR64179oxy Q==;
X-CSE-ConnectionGUID: nYk8450zQWqEknXBIIMz7w==
X-CSE-MsgGUID: KnC5dTH2Tp2Y9lQn4pPmYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32451872"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="32451872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 20:23:59 -0800
X-CSE-ConnectionGUID: n/6M4v9gSo2vi4Ga+iJc6A==
X-CSE-MsgGUID: /tEe+9PMQhaOFpd/5mUz3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="113740824"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 20:23:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 20:23:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 20:23:59 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 20:23:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgqWkcUytzoIHEcslCwYfeYklY7R1Z4SGabBmZrmY68ePpq2Ss2WQvXEoeJpJvpJ1oMsUOGGDdTpBVU3Tu9BKhUoscqlloFZDwuTOhnDLu4cHUEFxo5s8W9OPp4SkFoBkWPiF1MUmq0XlWWHsfrUx4jx1a4RtBSBaUOX5m7Nu63s1NcLa2aJpXSESB0NrbbOKqJphdggRJjZqX63ZHPAsksCCcoBjdBuwBEXBcQZ3Lm1+TOaMHKsXPkFcO2jYsl5JcaDT+pqz5K9Fek85KXoJ/JJlU/eL5LPegE4Vq3tcNKnMntZ3C8Dm0mZyAnKAClZk2YbbiXlq3PkP00BXXLBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPzAx147ipmAZws9mdKrY+U91LpEcBlg36SnjkSsg7I=;
 b=f3rPZokedEcbyWO6xHNyuzOrRcTF5ZZAUX+T9gtmjjJvFy8F5oJM4UcKmOz1bpg0YarVFbX9aCZ59OImYNnnDL4Yb0u61v3aHEuX7SEdS78i8l8MI0HcR/XFQpQBYcbNkPYjzK2W285/2uZvXGneC9m1FRR2yTbJUhMGsrh5wpTRA7rJ+NvZ+Xp5vN9d7kEEj+87fczs0CykzleLy+pIwQpBy3+Vk9S1EcpqUYWtE/SxigC/oD1t2uu6wH1vKc/+KSPqzSFQc06nwcTTe0klYsxeL17PsHblzM7iNVDOVrVJdpA+UZpsiqfo9g4omC4d4Q5iopv0ne986SbyGeOyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 04:23:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 04:23:55 +0000
Date: Thu, 21 Nov 2024 20:24:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/xe: Add mutex locking to devcoredump
Message-ID: <Z0AHf6spKHWkSVMo@lstrano-desk.jf.intel.com>
References: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
 <20241122025357.1398385-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241122025357.1398385-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 992925f3-7c88-48cc-1da8-08dd0aad7a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8QHTqZMtYFPb2aSDB51EnWLrs7FBJxfPkHljpRezpqgByIlW3ZNOdxkFtDMQ?=
 =?us-ascii?Q?NwP5wL3lS+DIfD+rXmqs7E/sjj84SPEOourHM92D5s0fvfxRqiFN5f+Uh8sF?=
 =?us-ascii?Q?Os+Saeh7JMNPt2mAX2ZWW/Lh+kiTZd9iUQmuBSly5phvC+W11TeeEMqTSvB4?=
 =?us-ascii?Q?SLv2PzUJg7zG524siMOVhyrBIl1pniaiPs4kKgIqieG98D3BTh3YCYvg0nFJ?=
 =?us-ascii?Q?bdwSEZYho3U7wk6C1RdBdzX57auVBEr8gf0QYclX3jFkYWPqG0dpdcj1OQsu?=
 =?us-ascii?Q?m6hnDREdijsueb1yKwxcWlG1r0rMpkhC8oTqKlfqYsn3Nf5FgxzykWmv9pmR?=
 =?us-ascii?Q?78+N+mjEL7L/tKzxo4txW9DZko45C/5VYmO8c4ycCKFAjkGynzj+ivIcDo1e?=
 =?us-ascii?Q?Lm4ov0hNFce47Dt7yPLRtwl6MMxFAZfD/LeHCsKieewjdl3PV+9EAvXhfqmF?=
 =?us-ascii?Q?r2Frov8lPZAw0ezgw9EOko4HyG89YcfJjFfRZM+gF7MvEeAvIB2RAO671TMo?=
 =?us-ascii?Q?rVQGZxt3HtcchCIrgARbjSyw8Kj/67iejNt9N0zFTPfBMdiGZYKhPNH1eyu7?=
 =?us-ascii?Q?SfiaqPBYtMXFI9J3xcjqwwts4nPRe478c9lIovqSvFLzev0rqesUpgKlZnQW?=
 =?us-ascii?Q?ShuXVmw4KMvhAolceket+CgIXzqyvWZ9SQJPQGMqovLykJ73YdzLUeUNhrXv?=
 =?us-ascii?Q?I6vbLZLNmoZ1RTmxoxIBoUp8z1ygSKnyhVApfhoHupOLgyDWYFDyLUBTORXJ?=
 =?us-ascii?Q?unb9ccH2mE0yySyK5N+mOeIMMQXhRnxflrxjSAuLFRCElXVpJ2K4GQ75i0Af?=
 =?us-ascii?Q?sY4J6rEsdfUawUmsywObeu8X9Xj7xu8jnBWtM4/2+1Yc9Y/DYLRHZIRCjPjT?=
 =?us-ascii?Q?t9MLUZ2YYSqU7o0kD/2+m2q6O1FuhsVSk8jvNzsQZnpxlLZDnUvF8s4QjcrF?=
 =?us-ascii?Q?jTyvDGYwLU6sRgAbs8EJPNv4Mhy0YOlnw03WgsvXL1lsq8PyeYUJw7PIj8C3?=
 =?us-ascii?Q?U155b+11WB6V9R9OILXwlb5rqKd7g7QCN3Oh7KN/2YbHVSIzgGG3DsaRFQ/H?=
 =?us-ascii?Q?kH4YpeCxDpx1tnbMD5n4ZvVIfEbJiGiXuIVsLDRbJKXyPARLfcm6NWbeGvPw?=
 =?us-ascii?Q?0IsLrmMlT0v0WSbNKgPVJ6g9Xigp5Dg7DhRLO3LuuahKpDpnhVqRnpKfUFLt?=
 =?us-ascii?Q?lykfO5TPsXOcE9/SoE4eX20Q3/cSgy5zwyBfK+60YkRYxt6BuaHFJMjZYZzx?=
 =?us-ascii?Q?ejoeIo2GwlDYQwza21nS0Fe1TtlJjIa2VGUbRGGanrIuGXqp+o9Lg79vjOTs?=
 =?us-ascii?Q?y9UJSpBFJzIz7mzCn6pbkO1v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?53fv3F0F8oDFWrrVETKbVMMKV1rQw9lYBEzsVGF1X5M3Nv0zgzjtI1fTx/1f?=
 =?us-ascii?Q?UWrgofmMnlAAvCCL1r2VMsvbbLXA044ostpwRL8NBQl8r+V9fJ0ClwRfO0+k?=
 =?us-ascii?Q?3BDi4Td4ueXfb2fqJycEF7HCr54sRt55Fr5dw7VXVIPcgv+oMjj/0MBgP9qF?=
 =?us-ascii?Q?upO77rFVwcJaSeRp4qs/m8nC9Tbi6BbiI/lyU1jLww1MIqf4WtvVn6BtwyWK?=
 =?us-ascii?Q?ua1Pq8G0tPEBsjJrUC544rs0/vgL4iA+cfP4VFHv+SFpOcEYXKm9Fi6cQHsU?=
 =?us-ascii?Q?/wIxvSMfSAq9S/K36qmxfb7wzq34o3KjrTNaf2UXxxvb3dOJUEJxfV7FByiD?=
 =?us-ascii?Q?FV5XX60+ZE9EJJGfJQxgCbzxOngF75V162dij76j96g+KE2mHDCGwEevMkcB?=
 =?us-ascii?Q?r+z/RXImupE4xoNSIsz0vMLHzYvPYFlOkkM/WYP84iY+nU0UB1FM3csWtdIh?=
 =?us-ascii?Q?6b/zMNjJufZ1YNK8IzNH8FY59N9Z1+vgX9ZChMtVCvSabmPR0dADy8zTaAVX?=
 =?us-ascii?Q?+BTWt1DBGBCSsz1dOb2VNzWqZOx4k/OUhl1UNjlZ5DuIc+dJy4jUyRuWZHHK?=
 =?us-ascii?Q?JPklAW7nCkmm7NGgnTCHCw79AEgSTE5QETyNr/Ecp3IqTASBWMvoqXaQx0tS?=
 =?us-ascii?Q?WTCUskzZKgH8KTV484vFRyQr2XLoG2Y+rwpV6McZNnUn+hqpK2+msPB5aOpr?=
 =?us-ascii?Q?0SkvXEFvr2Yvt+MzJHTFayE9QtrWJbSbvOFvaZnfqQSIXKOENjkWnSDjkR0E?=
 =?us-ascii?Q?Dizib7WpgNgM5kYq30LTRTT/eiw6HFPOLI674RKAJfLqKLpMLkFHSD/sR0D0?=
 =?us-ascii?Q?+FzoBlowxALCC2GTfH8+w7SGxjvyZQRvK1Xm8TC7xXtY3HpBAlZIKNDZ3Kax?=
 =?us-ascii?Q?2LmTUfX32od2moVtYSTbHz/FG8bNdeoIcdEmGrOUD2HwXd1FUNzXOmHHuhGP?=
 =?us-ascii?Q?GyH4NtXfjPYb+c69z81CZEgy+SgBVRLaX/kQC5FuPPrulh+/g5TFSsY3gfTf?=
 =?us-ascii?Q?onARbPUQU32d1WlpcSI648JpX7UL/Ns+9LK62TRCmNINWO10tkDTFo1qX/tF?=
 =?us-ascii?Q?HzO5LT1Ozty57FjSipdwC87ylE4c0tjXfUogd7+BS402/XRJ5pfyuHxOj/I5?=
 =?us-ascii?Q?i916UzYyC2vSA3vHeZ0DDxILLdmKa9yB2B/J+fgyOMWQXCEtbsh7euA97YAs?=
 =?us-ascii?Q?7BmE9mP+Pk+BWAeOvtu4AwJFK/Wv+ZL0lprXqmLzFkhRjQgf2u2J7ku8STSG?=
 =?us-ascii?Q?37MXyjRcmVmr+9TX2NM+8FDlUMxkrRpChZzWBSWHnsg2DQELLCjLF+qjLpA5?=
 =?us-ascii?Q?ufXUkN8Bu6iDENbNnkHcsyD5I5AupJRfTSp7FwECy+IOXy3kjTcubrQd0opv?=
 =?us-ascii?Q?xSYveM8W8W6GtXXXw/oV1vvZ8XZRKIW63H7U87wwbDT+0uOPV4tJ70AbTkN6?=
 =?us-ascii?Q?0U4listU1yCW+zsDV9i20bcW2v8HMIi+bCzJfzr97r4r+J7YsqruMrCnnAUg?=
 =?us-ascii?Q?OPVO8iggLlN0sqgNdDrARm6gxNTDZ6Cmzxe7TYT/LfoxoWG0beEZFjnzWxtX?=
 =?us-ascii?Q?oN+cNAae2Gz9gyMfrs28y0oEEkqx/uAWKOXEFiw6LLZmcl2eRrayf/ntIvVc?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 992925f3-7c88-48cc-1da8-08dd0aad7a38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 04:23:55.4027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjwx8Hv3VsuWmdAz4JG4jQ61eXVZBsxOgO/MKk89smnR79hKHLNduZecNXFPo9CS8LVpi/hCAXBFPRFyFuc02w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
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

On Thu, Nov 21, 2024 at 06:53:57PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There are now multiple places that can trigger a coredump. Some of
> which can happen in parallel. There is already a check against
> capturing multiple dumps sequentially, but without locking it doesn't
> guarantee to work against concurrent dumps. And if two dumps do happen
> in parallel, they can end up doing Bad Things such as one call stack
> freeing the data the other call stack is still processing. Which leads
> to a crashed kernel.
> 
> Further, it is possible for the DRM timeout to expire and trigger a
> free of the capture while a user is still reading that capture out
> through sysfs. Again leading to dodgy pointer problems.
> 
> So, add a mutext lock around the capture, read and free functions to
> prevent inteference.
> 
> v2: Swap tiny scope spin_lock for larger scope mutex and fix
> kernel-doc comment (review feedback from Matthew Brost)
> v3: Move mutex locks to exclude worker thread and add reclaim
> annotation (review feedback from Matthew Brost)
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 32 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++-
>  2 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index f4c77f525819..376583a4a42e 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -207,16 +207,24 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  
> -	if (!ss->read.buffer)
> +	mutex_lock(&coredump->lock);
> +
> +	if (!ss->read.buffer) {
> +		mutex_unlock(&coredump->lock);
>  		return -ENODEV;
> +	}
>  
> -	if (offset >= ss->read.size)
> +	if (offset >= ss->read.size) {
> +		mutex_unlock(&coredump->lock);
>  		return 0;
> +	}
>  
>  	byte_copied = count < ss->read.size - offset ? count :
>  		ss->read.size - offset;
>  	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>  
> +	mutex_unlock(&coredump->lock);
> +
>  	return byte_copied;
>  }
>  
> @@ -230,6 +238,8 @@ static void xe_devcoredump_free(void *data)
>  
>  	cancel_work_sync(&coredump->snapshot.work);
>  
> +	mutex_lock(&coredump->lock);
> +
>  	xe_devcoredump_snapshot_free(&coredump->snapshot);
>  	kvfree(coredump->snapshot.read.buffer);
>  
> @@ -238,6 +248,8 @@ static void xe_devcoredump_free(void *data)
>  	coredump->captured = false;
>  	drm_info(&coredump_to_xe(coredump)->drm,
>  		 "Xe device coredump has been deleted.\n");
> +
> +	mutex_unlock(&coredump->lock);
>  }
>  
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -312,8 +324,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>  	struct xe_devcoredump *coredump = &xe->devcoredump;
>  	va_list varg;
>  
> +	mutex_lock(&coredump->lock);
> +
>  	if (coredump->captured) {
>  		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> +		mutex_unlock(&coredump->lock);
>  		return;
>  	}
>  
> @@ -332,6 +347,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>  	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>  			      xe_devcoredump_read, xe_devcoredump_free,
>  			      XE_COREDUMP_TIMEOUT_JIFFIES);
> +	mutex_unlock(&coredump->lock);
>  }
>  
>  static void xe_driver_devcoredump_fini(void *arg)
> @@ -343,6 +359,18 @@ static void xe_driver_devcoredump_fini(void *arg)
>  
>  int xe_devcoredump_init(struct xe_device *xe)
>  {
> +	int err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
> +	if (err)
> +		return err;
> +
> +	if (IS_ENABLED(CONFIG_LOCKDEP)) {
> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&xe->devcoredump->lock);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index e6234e887102..1a1d16a96b2d 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -80,7 +80,9 @@ struct xe_devcoredump_snapshot {
>   * for reading the information.
>   */
>  struct xe_devcoredump {
> -	/** @captured: The snapshot of the first hang has already been taken. */
> +	/** @lock: protects access to entire structure */
> +	struct mutex lock;
> +	/** @captured: The snapshot of the first hang has already been taken */
>  	bool captured;
>  	/** @snapshot: Snapshot is captured at time of the first crash */
>  	struct xe_devcoredump_snapshot snapshot;
> -- 
> 2.47.0
> 
