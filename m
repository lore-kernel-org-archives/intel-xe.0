Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C35C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 15:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB15910E890;
	Thu,  3 Jul 2025 15:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiBeV4we";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8B810E897
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751556788; x=1783092788;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NRG1yNqrFE2bT8nbTL48fMu+abLiV2i9RJ12x4DU6wE=;
 b=SiBeV4weBXudCs4H45fGUH1tEJSiFEDrYTiOYUI4Lr/uVPozWtA2pxnF
 oSqGQkvEQRfLCIUhEOeXm2n+4+d5NuYLfFyXlL77d9jbz67kz0z3JNac1
 6AlhXhdrQC+Iy6FLH8MzpSLZVEyz/8NsPyHdfxEWK9W9LxnAz/dPFi6hb
 tVhJVcERT51wZ2Ke1OyUq7ICcZ62nt4NSB8u1Dv4w8VFFr+X8qWRXsx2B
 1QQAWEpsuakQ3PFFI41SW2yTmDOyGgc4jeWmcadlzh/ebp1YDsAwjcSUv
 cXm+Kiyh4P2uYsw6LE6P8S2a5Cj3eL5b/e2hrQVk/cVJD47nl0Tf2FLje Q==;
X-CSE-ConnectionGUID: mkCgjOShQ0qjSj8sHM6eeQ==
X-CSE-MsgGUID: 8RCnm4c/Tti1n8EKX7poyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64487694"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="64487694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:33:07 -0700
X-CSE-ConnectionGUID: Qrgc5V0ORS6DqPsTPO5Eiw==
X-CSE-MsgGUID: HZbJpNXtSHewEALIcoGSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154525752"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:33:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:33:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 08:33:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:33:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8vu3Ltqd+xx2EonJx37AOCxh04ow6RbLxbFK8RNqPayS7e2hsGtZzDVKZwp+ZB/MQ0cJ5o/+aEJJ7HAcxevzYRnZD9SHrEM5yIeojTnQsUh8a4voocGmMAcApKXBwqAYHBwHLg9SJoVodBuDkRTLuEOeWLK/qZMogzsdd1/rL0o7gcP/oCkKZDGD0pcsA71TjzvwZHuJmgFosUEJKE2hTWlO5UJnYJ3Hfs1Psi/iatqflobsXQMLeDDrUsPuwizHBbkoZUHAFqlSAZLi3lNRljIjZq18PVn9gAylqAluTf1Y0aHGFS0ufOCdP/ZEgk6aFWaNHWv+nwCmkMj4YQGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS6vOLNGpG8K4vcDNVvqsiwQ/1Bjnl8bOv8ua1QDWLg=;
 b=afGZ5PUOGDewxWDGyp97Op2okSOaq9eHa0oiBAhx9yvTM0tBxXSQEEyIrGRfDGrXPiLj8LUHR5Dfn85gT8AB+uKndC5N623DfMllFI6fwT9D6RMdCEsLAv43sab0ToLsCL3jITCxkJSvUYadaqmZaLc10YrIgfkgT7BKKhH7jEWZ3FJ8VsoBTSZou470LE6Vk0wmfAzj8UPswg1V2mhUZlnbsKDTpnv9jy4XlLN4qGV4cVZSmiTzBOz9tEb1UgyFQInmRdMIzO62/zvISd6oADcUKZ0GEzGtO7taNyEd5/4wnmQazCXAZm0cyu3izlzb7j+cSdQQCAvbVy///jIzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.36; Thu, 3 Jul
 2025 15:32:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 15:32:58 +0000
Date: Thu, 3 Jul 2025 08:34:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Release runtime pm for error path of
 xe_devcoredump_read()
Message-ID: <aGajEHBlwP0m3BEp@lstrano-desk.jf.intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
 <20250703074105.3461107-4-shuicheng.lin@intel.com>
 <20250703074105.3461107-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703074105.3461107-6-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:303:83::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: cfeb52ba-5fe7-47ad-daf9-08ddba46e38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mc2zL742E7LrVOTO57nVjlRpXj37jEF2mNRmNfnEmjblV6RHL+as5sTxRzYr?=
 =?us-ascii?Q?9TLA7m5JROAqzl5Fdtk0OJdDbh8jynfnQTlsjFj+EfNPYE9HeGzYbdGp9b8M?=
 =?us-ascii?Q?zWrg75CCSHtSonf5j3H4AEFlQAgHcd63VbOI9A7ROakou9fac4UcefblZ8Y0?=
 =?us-ascii?Q?iokj5ZlWqyM3w922m2+/EviHwyI1WQQRUQ8PRH9FtlrfoylfxJnWtTuC+bHE?=
 =?us-ascii?Q?ooBdqEP1WKzcGrYUeYMv11ivFGiU7uqEnj+++wapN477fhjOD1HxbgB95bfO?=
 =?us-ascii?Q?Bq5miu87/N4C8sXG9QJX7zEY+eU00fCcBEMfIH5ZJ3zWR+tk015uuszrp4i5?=
 =?us-ascii?Q?jo5ByhE2QQEy2DgETrJ17mGExbSu0QIHLJDEdu2j5icJDhyurPBU708NXxZi?=
 =?us-ascii?Q?o3R/IVi9gOrHyj1oGbG9GqqVxpitVxMqb38Nea+QbunNeAhs2rHsC41o9iX9?=
 =?us-ascii?Q?XMbXXSqu/bcjnuOgLjQIbCcQnexlr0wADplArpCS9s/zGUsRdEGAgFW7xlvd?=
 =?us-ascii?Q?Gc79W8FIQLRvixN1kQVmMg/czlfGtxUIKxXXaSmzVIp7QUrTCb5Z8egwyaWk?=
 =?us-ascii?Q?ELiNEW+cZf2W6pUuDU0mVPFH5LEwYQInsBltXE4XUTZCMsj57IAgVHVO7WOS?=
 =?us-ascii?Q?S4+EQapuk2tuqwRUAGJ8VqkM8HkOjyroPx96g8doZIlbeIlljPNh1gFD+gOq?=
 =?us-ascii?Q?8aDHTch1aJv9Td1eS+2IK8X1OpWqxx5xONPz12CfyY22DFbj6Q5iM4LZxF3Z?=
 =?us-ascii?Q?vZHQJTTw88DvxMyCNdw5f1tli9fkyJRUQOa0gzTgVU3v9sbpu8ipxlbx9a2x?=
 =?us-ascii?Q?ujTxTj2VCtKIpicTVqsu1jnzaoYBR6w/mGi5MO5QX2xAgAgcYg0guRgVI0I5?=
 =?us-ascii?Q?DCdX+5qcWD6IHcWnjqH20tp8KG0iJDUS9e8K3c/ZWIr6wUw0uXPnrd59eein?=
 =?us-ascii?Q?augOJgMUD8cNZbyhAgP1OQUZV0ATSzQ3WyDD7y4DV0skU35ZzX5ekafwV8w7?=
 =?us-ascii?Q?aZZ5eQkQpKjmlUbZ2b8w9q6C3sD+VpIU4a3hEZIvVKuy7WL6Zw/lOxza5igb?=
 =?us-ascii?Q?g0d5yy8T0uyKylqoVOe/iUMed1+vkJdE2/Q3rcBLGv0abXG8KFQl40SIsGVd?=
 =?us-ascii?Q?rTaW7K+YKR+dcAp1mnu7FMr63Vu9P2xOt3AF1s3Y5mn+L9vV+uTVVrDoNJbh?=
 =?us-ascii?Q?soWCA4MjG2xqZhm70Lyp+aRU776996BeZ3pLCGQuz6o6/Q4+/l9pFp78bZO3?=
 =?us-ascii?Q?+HcX160jMhpHeABsvITzyL2VmIjs+2+bkoKQpnTBS0mwBZOOr/Va+peJ0Njh?=
 =?us-ascii?Q?hoqsKGgsqL+eyJZPa8NI4JhbC2Eud6iu33q3UukqU7Q97NOc8r5HrisJZJgo?=
 =?us-ascii?Q?pTdr34U6gcjlXQNEGy32KDl/v9r5oEVLKpcrnAU3EXQhWnhKaAV12y4vASqQ?=
 =?us-ascii?Q?OiklPjDPWQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FZok74D0c8BFO+OD5j7YL/A6RYKSCFqM0i6AwsvJ9700a6E8y0kj2PIs3Mxj?=
 =?us-ascii?Q?1E91G8z6Z44pHeNkrbi1rLm9GShFQhYN/tdRs1llMy/VxeJ9FDGxwv1c1ZqJ?=
 =?us-ascii?Q?V8AcG3Wimt8/Tn4qNHGWtxOAabyCqlkD+9epxzVpiyMrBNswKO9thvNK0SFA?=
 =?us-ascii?Q?PvEesOuDrHlZBtlgEhp2lQAmwgZ0lNRE6q6t9UzSljXcKc+JR+EfyDMuvyQK?=
 =?us-ascii?Q?DaQt24Rg7doS7YUkO/l6YU6LjFpiyv9kkcDfdIhqsai5x52CFaBUV2Gf9boS?=
 =?us-ascii?Q?pV1wBuwdVR1jcALca95vMYTEOAVnKFjGFDK2+XztUFks8hj1aewn88UaRYJV?=
 =?us-ascii?Q?KSFHfHhUhmBDGreRLVlQ3LHGfxlOezQ2Wc5A+F/RJmSwWhpJj7mzF94olDx2?=
 =?us-ascii?Q?0MaMMYq2z7r2XBdi6OXBCF9DKbI7gOab6S+lgtULeDiofXB0lnvOJSdL5Zzx?=
 =?us-ascii?Q?k97BeOFgBxZPhnG+iI8wsbg2NklOYQaZcUni4i5q47Vp28LLc4uRtmM9C8rd?=
 =?us-ascii?Q?yWOFbJWf5AwMQOevhRdWqmSCjHHZ2fZ0GWXBHf9ErrSf4l0M2fb4rky/y/F3?=
 =?us-ascii?Q?dSjqBvD4GM4B0ncreqVMHC3r2OjykAErEbmY93KoQ5bCpX+Ecebj4j/vDGY7?=
 =?us-ascii?Q?OsU4G0xmnpECvy870T8BnXzr6KMqAm7xCjykBKRJxrce3/4kmjkzq+iwKlmg?=
 =?us-ascii?Q?+TKaJ2EyHYALmIjpzAhRNVe917r23gThtsFeODxwLaIaW56jb93zw2SIgm+5?=
 =?us-ascii?Q?DXfvwcK4L/8GXSTcf8FlJpnRR2X5DiiEEXO43xFPl25aB/205yitvjD84yKO?=
 =?us-ascii?Q?9hRIaoG6Os3lLxDmhzoO0Ci8HmnF+hQa7rTFOzy1jholXdtZZUV+cQzNCxDM?=
 =?us-ascii?Q?CS1wNd0X0t3SkZx0jNjpqBbUoicxCdwB15zrdMHmo20QLgx9zpvIouevPjiu?=
 =?us-ascii?Q?rGQEunWuAZW6uU2cxfwQzjVSCfdzGt1mf7dVOTBGlx8kRdQQpie4CFuN+RqF?=
 =?us-ascii?Q?YVDXUQK0L+uAuskkITUtoGXjmqrU35cjuBhFEj0H+H9LAyqxDGXC0qTeG8s6?=
 =?us-ascii?Q?9svZrgGhEfjURMfk6/CrC3FAqNj4nW76+/tgDE9OTIjs+lk6+wRNeX7PZgk2?=
 =?us-ascii?Q?WFSnIq3DVGw7zdTsq2cV7/z+BLPHtgMXldO9B8jw0ca5aXe8QX13SfL7CXwF?=
 =?us-ascii?Q?9deE28mHCR3MIf/YjDBUkCM9bYsNA4ls1FTT5a7IAyc2M1NcZQ0VDcp/KSj8?=
 =?us-ascii?Q?SgDksGd42+mbrZ725Ha2+MQSqNZYbZvs74sKmj9rlwcjftcegtw0usx0zn7G?=
 =?us-ascii?Q?RKnfQVL5xEj7fg+Bb2VbGulhiMP2V522pHNizbti37hOKMM0GlGG4weK5wmA?=
 =?us-ascii?Q?az5QwKDYJo/6zY3/9tdD3xZv+unplARXI6mmJapF9aXYoc1cx0jZBNsWU1od?=
 =?us-ascii?Q?yZqAj8mLp0xGHq9JTbIsPJzSkOr8S3J2uiVA5G9G1P4s7L4okFEvK8cdFODc?=
 =?us-ascii?Q?7TvMd55I2sB+fVvUrKOoV5BYF+dH94+TnOjkpqdNK2dCu8bcNcVyOFBQpg+Y?=
 =?us-ascii?Q?WwNR8Y5t8B6Y1oKVkeBK1XtIj913/XomMkFFOxjDJ8Ti/y0T4YrY/Z6dYMpi?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeb52ba-5fe7-47ad-daf9-08ddba46e38a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:32:58.6166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLfCdVLnXaX63RKpZ2BNH2/W433JV5ZFBMCi64hnjfvb9xkB79wNiv1SYfOt6q4D1Pl8tixtPWK6lKD63XZC3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

On Thu, Jul 03, 2025 at 07:41:08AM +0000, Shuicheng Lin wrote:
> xe_pm_runtime_put() is missed to be called for the error path in
> xe_devcoredump_read().
> Add function description comments for xe_devcoredump_read() to help
> understand it.
> 
> v2: more detail function comments and refine goto logic (Matt)
> 
> Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 38 +++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 94625010abc4..203e3038cc81 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -171,14 +171,32 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>  
>  #define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
>  
> +/**
> + * xe_devcoredump_read() - Read data from the Xe device coredump snapshot
> + * @buffer: Destination buffer to copy the coredump data into
> + * @offset: Offset in the coredump data to start reading from
> + * @count: Number of bytes to read
> + * @data: Pointer to the xe_devcoredump structure
> + * @datalen: Length of the data (unused)
> + *
> + * Reads a chunk of the coredump snapshot data into the provided buffer.
> + * If the devcoredump is smaller than 1.5 GB (XE_DEVCOREDUMP_CHUNK_MAX),
> + * it is read directly from a pre-written buffer. For larger devcoredumps,
> + * the pre-written buffer must be periodically repopulated from the snapshot
> + * state due to kmalloc size limitations.
> + *
> + * Return: Number of bytes copied on success, or a negative error code on failure.
> + */
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
>  	struct xe_devcoredump *coredump = data;
>  	struct xe_devcoredump_snapshot *ss;
> -	ssize_t byte_copied;
> +	ssize_t byte_copied = 0;
>  	u32 chunk_offset;
>  	ssize_t new_chunk_position;
> +	bool pm_needed = false;
> +	int ret = 0;
>  
>  	if (!coredump)
>  		return -ENODEV;
> @@ -188,20 +206,19 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  
> -	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +	pm_needed = ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX;
> +	if (pm_needed)
>  		xe_pm_runtime_get(gt_to_xe(ss->gt));
>  
>  	mutex_lock(&coredump->lock);
>  
>  	if (!ss->read.buffer) {
> -		mutex_unlock(&coredump->lock);
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto unlock;
>  	}
>  
> -	if (offset >= ss->read.size) {
> -		mutex_unlock(&coredump->lock);
> -		return 0;
> -	}
> +	if (offset >= ss->read.size)
> +		goto unlock;
>  
>  	new_chunk_position = div_u64_rem(offset,
>  					 XE_DEVCOREDUMP_CHUNK_MAX,
> @@ -221,12 +238,13 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  		ss->read.size - offset;
>  	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
>  
> +unlock:
>  	mutex_unlock(&coredump->lock);
>  
> -	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +	if (pm_needed)
>  		xe_pm_runtime_put(gt_to_xe(ss->gt));
>  
> -	return byte_copied;
> +	return byte_copied ? byte_copied : ret;
>  }
>  
>  static void xe_devcoredump_free(void *data)
> -- 
> 2.49.0
> 
