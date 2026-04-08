Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27801FD5F77
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 04:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C424410E33E;
	Wed,  8 Apr 2026 04:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngU5I96c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDCB10E33E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 04:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775623691; x=1807159691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=poRkucmjki21leZX6tap0ZSwCKTHJ0n18x10ftusjpk=;
 b=ngU5I96cXOhVQFLzqdD9SLtLb+4gcctlhPCUN6Kg4NU7U9GG2ArB9hM2
 ltRnpS8W8RTdajpCLZF9CJsMSl+fJobWZecuqDFTrubVqyNMQMBw5Lgbc
 MCA0s+8Xm8golB4GCldvUMqqcjgfIESblkOTUxLtnFxg1wVBPK9YiKfyS
 UVrAwSnd2g+RQMoITjmqjHwHH2sCtB7BQ8nc9KdRXBBqm4SeQYpQxazEj
 5v5i8dkYFfXUzzLQRsrZ1Sx+gDrsP4dVALTCk9YLT9B756MfYHpUfkaNH
 foudpgatUofDcHI3GWshDbiudrdIbGSPgQbFDm7pQGOWWiLfQKvhTleY7 w==;
X-CSE-ConnectionGUID: C0xhU/1NRk+1bVzIQ2RI4Q==
X-CSE-MsgGUID: fyP6+m4bSdSFY81KckDB2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76318133"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76318133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 21:48:10 -0700
X-CSE-ConnectionGUID: 3feFVhUZTxu78aawpu4P2Q==
X-CSE-MsgGUID: I3NSKiLlQCKQ4M0oOwgSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="221812760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 21:48:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 21:48:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 21:48:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 21:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3YgC9Y8ux2sz1z9zo64MhUvAcpLZ+Xi7Z6v8bGwC0deoPMCS0f7UxTI5vep6dabtTku7Qje47G3OQwfQfsZ2Nt5FXwniIuXpn8atO4mA0hnwuY+LL0ob2ldWsNpi2WwAOBKfrtbwA8YVtp7JrkaPD/qfmqxTcuDb5eShquCMQS82KpjHlO3ecODyAqkjIyFKXPV5pmiiZdiHFeh7UZorjL/+DQs5EIccp5J+EvaM/LAmf06ipt2sNky+iqBmxxhGKzqZyBbD0soW1CQ93rxgDWeYAbYCTEIm9k6ip/4B0D4WI9sWF7ov8dpNMj+Esy1LiVipd9tjL69ny43+PAOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry1WILtk5BneQy70Dhczq5ncaXHPvp6dW4CV3cXhqoo=;
 b=cOeIiy9IIQXXemD2gEKvHSvk2KEDLy3r63cSrWjcEfVmZx4+/2Qkl1hbrH8Th2JQivnx6YT4yDiXVUtbkqWhuucPpiQdC7B05P+99aucoxJ+5EE7CivLJVhsB49HoM5CQd5otOENB9gwjxafsjVws3tc9VD9Rca4hrarFsSIvEMvoIV07P7/prcyRLYfMxSBawpTzXFDdMBHFDP7gbDwExIeXfUB+XZxbAEnxIFvrqxzeBPDZBS3pzvfDlXqk5w/WIrja5ESQ5DCS2k+gnJAyofjaVKlnj+d6k9OinPMxfAb5h9Kz7oD82tgGyFEC65S+5dEIEPGNeC0FAMFiiS8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 04:48:05 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 04:48:05 +0000
Date: Tue, 7 Apr 2026 21:48:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Fix error cleanup in
 xe_exec_queue_create_ioctl()
Message-ID: <adXeAg7pjf/D1DmX@gsse-cloud1.jf.intel.com>
References: <20260408020647.3397933-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260408020647.3397933-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: c86883a3-f2a8-401e-c1d7-08de952a05eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: lDwq0AL598SaeR66qYvzoISXoty2t8eRW/J3g7JvZNyenKFh9f/2AgjeIn11zpFJnyccD0MqemPrhAPS5sN5wyZ3zCHtmim6B0UC7d2qJGr0g7P7LSUtKc1maX5q7w0sRHfoOJTFh35D3uazEFnzbUyn5MImZfBKS/c4Q6Ktvzien592k3DrREDcexvMHJQ6HqAeWu/A/so+y4ODTX5+Pp45t3Yc7Xp0/gPoEl49ahh0D4ZTw9eokYo1SxPxJ87icWg7Os6TjaPcf2wIwWBtZ9VYtNLrqUXboIhxCWUmL1AtPpmovbAa3X5Yow/t8WYfuuiAS3hP1BvE2WltzppxjqWTXgvolRZMeD4rqXVU2tSl4aRkIyLUaCYFGEhzheqXgAooqVJkHm68Ln8mHyiJ74XzdS023aHJp8SRWcu6F+8td7NeSKSb28xSCxLyFWAQm8fDJM1IEAFYKH0nsic1vshWcW94iV1lX39o7P0Rju7RaTNj/s5rEG2CDtONeQdcRydW19M+YJGiDkzHvnArpJ5FZUu4IW4tf3T6A+NCHky2C5Ir0lsGrzd2+Jzr4fnhexeW2zb+7UxI6b/em1iMXv+NDZez69ZylXi3MyUEPEvtclji4mtskP+qgA4F2A0EG/tmhETydb4AyihYLH3v6upPcEoCNz+6eu5TUkEi3g2hwA3ICq42rtdxxrwUccMw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LEncDQ0wSJH9pqBPDSyxSd1ffh6+AQJvODAnHWmaxGK1GFzkD9nAx0acd6Zw?=
 =?us-ascii?Q?Aq65j36HtQ5YsLx/Y8zjc2r/ew+mZyBvQGsYhQtC2DdugFoKIm8gZPORxMHx?=
 =?us-ascii?Q?EL3wKITuaWqtjxfPGTRgwZrUaiMp4Md6v1ImbspamX/mR0hh7Cy1pD0sLC/N?=
 =?us-ascii?Q?6tVaREfa7tRlTujPDA2vNo+xANSwNSj4/WWwF90CSDaNuoU5JDKjehsQQ6KC?=
 =?us-ascii?Q?BgjJ2vtYrSd74NsY7Y+0Qzn+LO5MvkhpO7aFKlSax0yld7C7C+4pH87YMg4J?=
 =?us-ascii?Q?ck+cw7FxaKXGXIKPcTH0rmyHbaCYucvdNun+ftvfyVL9IGddSJppmKDTGC01?=
 =?us-ascii?Q?Zru5Z2HOqHFVS55mTUX1nDHdnvS+4e8PovjIwFarxYnK/Y0+PNl/IuRKZUX0?=
 =?us-ascii?Q?bUHwyDxXwykKHprFn7PcJKzvnFUmpP79gTGvje2RDYA2R42Y+MugDit5K9De?=
 =?us-ascii?Q?H0ypgrLOQ2KpOyYPwO+uCntHX8a0Zauf73BFVbq0H+MgO7UeAkywJKCJM/SY?=
 =?us-ascii?Q?T/sgFNyEPmy/td2/hBlf/wwNuCPwSSNo5zwQltQpK5PT6jxIojha6oJGA66t?=
 =?us-ascii?Q?OZLCzWlU/wvugBaEVwBtGhx4iEV+wC2ZMbNVk6zFAFvwW72trQmT++1awZWi?=
 =?us-ascii?Q?7PZgcgln8hCH/rl5c1SoNnfJmjii4GwhN7k8thkZZvn+qcTNb/YDxeXk5Lce?=
 =?us-ascii?Q?j+fE4xL4ubxenHfXVeF6GSIvwfa34yXLugTfZBVPiv/6MtqBaIyeWL9/KjNR?=
 =?us-ascii?Q?rYSTctEWO9YImaHEK6ybNTlmUOgjk0Xol3Mmg1TluuHucX4xPM5xG6CxPr8F?=
 =?us-ascii?Q?Jcb+m6O1xWYLtgJwDwH59FAflHLt2kQG9m9rljOA8Xz3yHmttKML6clIiFFN?=
 =?us-ascii?Q?OS+jC86zQ0ssZxZCEUd07zIdnIC6515HiY6dgz83EHnshvqdlhaqnaPY//jv?=
 =?us-ascii?Q?T/fclLrnILfGQ0/+GDfa2BwjTjtVZsPyv99XbcXEor8dgJj7e/6Y0dzb1GCi?=
 =?us-ascii?Q?D/EIdJfSTXYrC/gWU2bw5+Rarqy3HMNQDCnuSHIQ6DlJS+r90vFILDoui3w9?=
 =?us-ascii?Q?DbfT4wOdvpTfy3QEsxbvAuwSJkuQ/DSW3PK1gVmQOTWlf9XOHlyPOAa4l8WQ?=
 =?us-ascii?Q?9nSs0b4foWCCYgpC2Gp08YN9vgN1VQXQ6peblN4uXyeSPFhgKzuzs/2kf63A?=
 =?us-ascii?Q?ABgDg5lEZJ6L8MtAsrVCy5+Svoz9uH/BkVujPkMTvR/BiKo/Drvi77VZ0drD?=
 =?us-ascii?Q?sJRfNaaMeb2mhoUHYQ/pIPdVaekh3QQRBYwrLwpOxMyGzL3LtFi7EH8vEHg4?=
 =?us-ascii?Q?shMtd5U7UnTqpGgWXVoPCUBQoZUsvWI2vrJVIN62CJPBwfEX1Kugp/q09uvI?=
 =?us-ascii?Q?PnJ1giHsVoq9FoqEg1TXxQJp9Z7CIM5eCgk0ZTGHrjMKZYB99YsXQG/b4el7?=
 =?us-ascii?Q?LHHQOzjyZ7xi/ZaqvgQxXpNvwMFQ7dNowmF4c8B+ldD49dIERvZdcj+YdNkf?=
 =?us-ascii?Q?Wr/UZmGD2YENMjryYzW+Y7dfA9g43dZhNTvmZhxF81/FdBLsZTOo0CA+Ubxw?=
 =?us-ascii?Q?j5PD61yFQbbf5UJzoC/U8o1X45ke4p795PDNlggg3uJnnyefcVZT0SkUXy7j?=
 =?us-ascii?Q?XRWK26AO6ScqkZr3BOkub+VqC693Rpg1e1mXY099jq7MzAle1OIv5JXGHpaZ?=
 =?us-ascii?Q?pv5EtnjGuGBis8KjZgIHCUDa28OE3/Cnr1GnNkhg7fVnWUCWV8gmeexS1BtJ?=
 =?us-ascii?Q?k/RFoM1xjw=3D=3D?=
X-Exchange-RoutingPolicyChecked: rOSva8i3yVNpUmFJu94sKH9xb1kPi7lHRvIhXBJMc1YMfKUmCpYNCcdszZTDOJdSIJizq+BsgayZ7GdZcYjXJKeU9y0XtsHcbZ7c12BpATTGV9T7uKoOPckJ45eB9xxoeK1YA3BwzY6RUce6tyjXSz7XlBYq/48BoUKqkB0aVh53vqRvy75rBiYhQ/697H95dbirTEborzRXj1NHuD6QMC/Oid6J90TG3EfsX74yaQZi+X3NjQiCBMxP3tz2xtMTYCgMqE9K4gE2yrPoGpPMqSAUJxw4NbDAKSAAVRl7V2G++DRtBcMe08bEJY4i6+4Xg/A+kQ5IRnfaE4v63310Wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c86883a3-f2a8-401e-c1d7-08de952a05eb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 04:48:05.5474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cp4ZdDz+govFrSTNyil2c+0cUdL7rTp5pJek2/m9vGOMmnqMqDDzLgQ530vtNgZCTOOaav3SPlaAemPINjkCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
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

On Wed, Apr 08, 2026 at 02:06:47AM +0000, Shuicheng Lin wrote:
> Two error handling issues exist in xe_exec_queue_create_ioctl():
> 
> 1. When xe_hw_engine_group_add_exec_queue() fails, the error path jumps
>    to put_exec_queue which skips xe_exec_queue_kill(). If the VM is in
>    preempt fence mode, xe_vm_add_compute_exec_queue() has already added
>    the queue to the VM's compute exec queue list. Skipping the kill
>    leaves the queue on that list, leading to a dangling pointer after
>    the queue is freed.
> 
> 2. When xa_alloc() fails after xe_hw_engine_group_add_exec_queue() has
>    succeeded, the error path does not call
>    xe_hw_engine_group_del_exec_queue() to remove the queue from the hw
>    engine group list. The queue is then freed while still linked into
>    the hw engine group, causing a use-after-free.
> 
> Fix both by:
> - Changing the xe_hw_engine_group_add_exec_queue() failure path to jump
>   to kill_exec_queue so that xe_exec_queue_kill() properly removes the
>   queue from the VM's compute list.
> - Adding a del_hw_engine_group label before kill_exec_queue for the
>   xa_alloc() failure path, which removes the queue from the hw engine
>   group before proceeding with the rest of the cleanup.
> 
> Fixes: 7970cb36966c ("'drm/xe/hw_engine_group: Register hw engine group's exec queues")
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> This is a reimplementation of https://patchwork.freedesktop.org/series/162714/
> Same logic, with improved labeling and a corrected Fixes tag.
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b287d0e0e60a..4603ff08d860 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1405,7 +1405,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (q->vm && q->hwe->hw_engine_group) {
>  			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
>  			if (err)
> -				goto put_exec_queue;
> +				goto kill_exec_queue;
>  		}
>  	}
>  
> @@ -1416,12 +1416,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	/* user id alloc must always be last in ioctl to prevent UAF */
>  	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>  	if (err)
> -		goto kill_exec_queue;
> +		goto del_hw_engine_group;
>  
>  	args->exec_queue_id = id;
>  
>  	return 0;
>  
> +del_hw_engine_group:
> +	if (q->vm && q->hwe && q->hwe->hw_engine_group)
> +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  kill_exec_queue:
>  	xe_exec_queue_kill(q);
>  delete_queue_group:
> -- 
> 2.43.0
> 
