Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA26BD66B8E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 23:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9136F10E0CC;
	Tue, 26 Nov 2024 23:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jz+fauVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841A010E0CC
 for <Intel-Xe@lists.freedesktop.org>; Tue, 26 Nov 2024 23:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732664440; x=1764200440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lObYt0iuMd5ZP9ihkWh6tBXRjnuYFzFZxCs/Bv8tJ24=;
 b=jz+fauVx3XIlAUhOJFB95ox8ctEBlHBlvSSXOCzN5+LPypp2rWs7Gko8
 BbwEv6DG4gjLvwDOr3DzPe6sGoyadQFFY4DGhwOiPuBbBsxn6bqPx3nZa
 +amr+WWMx58g5KWml2NHP9IhPr/TFlV7Gv1niQUYwU7tJLhjgjN84MiMl
 fRtOf08RgfLcPnbfGrFD54ZvwZRaCsukHSWrbbuTZtTK2yQrrQxsmjlF4
 vY9jTPXGsnI+++ZfWOzgui/7YmbzMVHJCBwK4HKTxe7nc2Pryzht3ix3Q
 jl1oYBAcqNSihjwEpKQAg11ArsXPBp238J8vAUJzOgTD5mPtGT+DANzJ/ w==;
X-CSE-ConnectionGUID: DCMtUdluTTyVco2ZG4xczw==
X-CSE-MsgGUID: wSUqZtU7TKWZskdrhVyUlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="35716375"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="35716375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:40:40 -0800
X-CSE-ConnectionGUID: LmkK0cLBRvK0kEDEi/CXYA==
X-CSE-MsgGUID: uLjQna5ZSHGAvochXLlvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="92086718"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 15:40:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 15:40:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 15:40:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 15:40:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNqN4uHWRA3AdiCkaqptfQYywJpz2w2ZAK3DjPFycZh2CyuL6W25aF18Xn4i5GWoWiPGvbop1UuYFNZ78UbLP11GqpwxHuNRpzeX7EMFyYBduCsJH8udcgVJxRRY2k20shOC6rbAlPGQLp/ZB4lijkjPgSfBL0K2hXbuEl7yZ7rS7wstigjEATTgOud8qW8ioVj7XLekeZvmJLcMBzbTG+s8knJFsqjwEBddTt+gOMyKO/s17jJ6JhKTeiq6BPnODur4oda0tKc4o/eglVHcqQtyaCFsfMWoZ9MbUXi0sz78DI0Y4iubZR7dkIulkYqNZM0O0uXkAVak5Hs3eT30wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CM+AsU3dhO4jWLWnppq1Z8HXoYGi1SrjMcaIzUyqExI=;
 b=BfhsvHA/2JS+hwzt3VNMWpQJ5kH/MLREeGv6koySRwx7irv4CY40+fiz2UNteAzIMT1l+VtSw93621odViF/hCQ0THsClDzL7t1UXdw+nQDaQyuhbzN6aPCQVtmnW21RN0C35SyPrOYrhKT3gTeNjjDvdKcjkLZbA7CA6k7UEZep++gsDwFxsX3le/tZ++2Jg8XLbdLUbE6BPPgotnZtOF3woPGNVST6UmFMKnC5/tpoFZ4wNirw23Ga7/u5viS3b7bYD1Bd/HNhGnL41kGpuhfvM4w06A7rNqGEaRyiNy14VHrS+gc8hZlZagcUaG8O+d5UA80I9iocWlxCJs3jkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 23:40:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 23:40:35 +0000
Date: Tue, 26 Nov 2024 15:41:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/3] drm/xe: Move the coredump registration to the
 worker thread
Message-ID: <Z0ZcmZZQ4x9Pns9w@lstrano-desk.jf.intel.com>
References: <20241126191857.2583429-1-John.C.Harrison@Intel.com>
 <20241126191857.2583429-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241126191857.2583429-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f46910c-6aef-4bc2-376c-08dd0e73b9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pyRiPxHtcVxbG1+H9BqHYrjOxtIU6Z8NgGj9KGPWe7rHCS2/MmAvHTZLdEfw?=
 =?us-ascii?Q?CuFmc0ZL72tScf4WCkWLdLzH8xB5jfYGRhTN8PhZULgBRvmA447xQ7nrsWp7?=
 =?us-ascii?Q?mr7OultXb6pJlelE4/n7tjbgV88AzjrH0unaRHdhps6qeide20n1ba6MRg8x?=
 =?us-ascii?Q?B5vadnsYd5kD5RyTzTNKUeVH7MaeHOC5c6lTmGZ3A7HXhYpWtB3iEt41eFvi?=
 =?us-ascii?Q?PR1C05ksV+3MQoUeoNjbkYVYPc1zqUGokVXZwpBhOFYvgrEnj4gP8OXtMkdT?=
 =?us-ascii?Q?/hChu5Tyyh7XVPlsyLG+AzZzVjrY63VskpXpJ6ukclC5ASI0+qpXS1A2E1g5?=
 =?us-ascii?Q?zy2v/MThOrVq4EJdYvJssLuWJRTd7dLSMTZPiIs+08sdSH1zqPXT3yOP0eRn?=
 =?us-ascii?Q?DJei8zhaphob3XhRB7HdQbQBJGDp2UkH8MLCYxarDmEs8twaThr6xFEGiPC/?=
 =?us-ascii?Q?IR2Zvq11f5aKKbNK9ay2junQV02pvYvbl4l0twCREIzU004MLDgZBigZ2PiI?=
 =?us-ascii?Q?s3Chpq8vgIjd1IBXlxx3Cyc1U9yqKL0Z54495ch1t/Cry7Lv9wxYcjGOB/jN?=
 =?us-ascii?Q?NO6kbjIkfq5c/NHugJVR2lgKI63UF64mYZXG0A7lNtXbgUK13OJHB6CRk/X0?=
 =?us-ascii?Q?Jvjk3W656zZuPAJ7MpukhnEFPkxWep4wkt7YD4mcBRDGgHjDYoYtRtvf4kaK?=
 =?us-ascii?Q?M4gkRV9YtU3PG4gL+JB3A2Ve1ijaw/018hvoNk1y8v8yL+34BovOXD6qnbCN?=
 =?us-ascii?Q?IXAvhwVW2Cr2aekVOQ4Qnm5avFUm7sTNBiRdQ/yJnBalbqfLH6pUptuXUHls?=
 =?us-ascii?Q?sYA1lX+CvUDwXGOjK0Iygr3gAd6s/X3iq7vbWKZ0ETuqzhkAhSW9TEfmTPDb?=
 =?us-ascii?Q?YodLPLFVZVeJmoE8Lbbcx/0uZzGEj+jW4WqTrHI6P2U08qJAmvb8qGxt6It+?=
 =?us-ascii?Q?3iELOOnvP8AylAcAzrBazpXgNWvFe0R3ogn/U8Bh2Cvr2AFtFQRog4qT3WMV?=
 =?us-ascii?Q?5AEXHsXh+NQcFB9cnFyxspVJFIgl0HevW6Rgr1IjUrAzMtwR95NCEMJIbSU/?=
 =?us-ascii?Q?a2v5fclfBOC8vqR0zr0ZaJdhDLHQ/aWmL6vqVGbeLDBfEXHDc+sIBx8GJN2h?=
 =?us-ascii?Q?ZTQgMAEW7wbdPW8ETiXetw3DTRy2hjXIm1HZcRDHk3X/nUFsL1zuvMtqNydH?=
 =?us-ascii?Q?DGRcSwVFiuNcTHINy77o+KqeJtu1uqoc1Nd47bfo/WyV9OBEq5M6g2587bk9?=
 =?us-ascii?Q?fD67YNhbiYFiBvEuFbM04t+u4sOS3n+f1Z2BXaCA86vKcHoIGPtdVcR+Ci8r?=
 =?us-ascii?Q?fnSKMqKhqQiEK/HZQz3g7vabJ6Vgs21TVbn/v3U4liUMzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7RDhrzJBCnBMhjJIivYLF5+POO9K0NLS6O1IgrvfYbcQBOcxpjPozST+WMKw?=
 =?us-ascii?Q?Cbk9WehDXMhRyNhEVj44xnoxdReXN2pm8QVnMyrSwYBh6UBsxE4Ou/t4gERq?=
 =?us-ascii?Q?Z9YQrygq2or+8uDsDNQQEbmzGk3Ldn3eBHRac5vrPjC4N1hF8o0jWhcQOgAK?=
 =?us-ascii?Q?J2jHxoZaPqUh+19jEz1vyredHfmGeJC8dT0PuUSEBg4py+it50vlboDZTvhK?=
 =?us-ascii?Q?Uqo6omFZ9lGE8qo1recE6FsW6/goQGkBwneFJGmfVVQZ/aSjZC6TbEuwKP5w?=
 =?us-ascii?Q?6TQdNMN8M7wVTRjEKCM6T7eJC3l8RpMFQYVyenV0hauwYFRVGZRqG92J3plk?=
 =?us-ascii?Q?yCUWeg9PiPHLC9AtFuQUyUdlPqIjoQrT/94reNaldRIVf6rc2lC9sM6e9v5S?=
 =?us-ascii?Q?VyfO9vxnFJhdS6w+KCobyLvYUMXZKnlfiIi7ipExDyirjFi5+BI4fG3eEWH4?=
 =?us-ascii?Q?SWQZvm0siSgwEnxmdHRujH+PhA/PVLjSDF3z+U0PQCK6J0pMZXfMsucm78zP?=
 =?us-ascii?Q?jlzl4CarSG/qBAHyd6jiYHRwkwZGKAJrm99lnQ38j6B4yY0Solh4K4MNGtWl?=
 =?us-ascii?Q?YJV8D3iJdjO4EzFp/7C8/LebO7RSv2u2apGhVpy6zY+u2qyaqzclLiS7wzZI?=
 =?us-ascii?Q?lpYIPtwGVSDG2Pvqlby5ZnxaiHQuSf3/glWcZ1W76OC28e09Ce8RRCVXqKVH?=
 =?us-ascii?Q?Cev6M7VXaRE3Xkc90R+OfxjV/WycwfdH82akkpC7SmaNqx3Sv9TdZ5soFBDM?=
 =?us-ascii?Q?tjzOeLNe4GXyv/9UajfyetPljZcLRMkmUGHFBT+lStElDjdcQVZoUAVbWXHb?=
 =?us-ascii?Q?fyh5ZYSO8ii83XI1PaKI0XPVcIF0SK+64IQwvthERsJ0KCQ2N+5i/ClT0PzA?=
 =?us-ascii?Q?lwgVv3gRAVy8fPVxa4SjS+NvbDb/WKrkVE/Hu14j+bfzMkeNFgXxAxmdeAal?=
 =?us-ascii?Q?+kibpe5ft4G3PQbL6Vei5K9tWZ45DTJd+lYHcvS3K/vTmOvIZioE8FodLZw2?=
 =?us-ascii?Q?vTedaWOswQ5o0MskxjahG112nzA1NI/qxI50eDaW76TQ5vWxPoFsV2UJ2lbk?=
 =?us-ascii?Q?7MSXkPaVr3j0+nCeZyK9Cw17n83K4W5xHKEiKRD5KvT/uFRquLir8jW/fxee?=
 =?us-ascii?Q?qp9PaLNd5auTxDPrmlraxRhZwEIo4XjQ7UP5wMKHWiCuW0Kq/xtJoW6MwnG5?=
 =?us-ascii?Q?TQr/wG10TUAPm3w83oS1KSjp/Ve5edvRPzFSCYIA0m3uVi2WU33eg1UvEoFJ?=
 =?us-ascii?Q?hozjiG9jKQeHeGQdh3EiUEbeKf/HU5sXdzn/cwY1dL+U5371vQr6nbPcWVub?=
 =?us-ascii?Q?KFdMRtI3GpoPlsV91GK24Dn7f/sbIqc/esKed0cmj9mpqQHHdXa8TAeexYBR?=
 =?us-ascii?Q?tHNtyEZEhr+qHGt5bcpWiZEZvBMRKFzCeHfkkJz4t2UW609FaRpFHQU3Jx3H?=
 =?us-ascii?Q?WhIjOJt9iEh5YYdhmAcChgQdPbXbkZtx7Ac3Xueaf1epeLtZfXfpLjFlcpfn?=
 =?us-ascii?Q?bDdHjl2p5dR2UoRF1y0PlJ11JnFMEMhCs3JezINOBhFd0r5aoqMKnJ7BLJKA?=
 =?us-ascii?Q?UBdYRDBinliUzYEPNf+NF+Eb13AFGkRm8Ry5Af3mZJUADNKoyRvo+GANA0Z9?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f46910c-6aef-4bc2-376c-08dd0e73b9b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 23:40:35.8185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtsNGsCAw4NoBOmeWsgaHBHDsQILoxn8T7j6C0uzJK13ZZzcYV1i01AgyxWhScV4i0kOkMBkv4+yi4LKcgvBdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
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

On Tue, Nov 26, 2024 at 11:18:56AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Adding lockdep checking to the coredump code showed that there was an
> existing violation. The dev_coredumpm_timeout() call is used to
> register the dump with the base coredump subsystem. However, that
> makes multiple memory allocations, only some of which use the GFP_
> flags passed in. So that also needs to be deferred to the worker
> function where it is safe to allocate with arbitrary flags.
> 
> In order to not add protoypes for the callback functions, moving the
> _timeout call also means moving the worker thread function to later in
> the file.
> 

I'd add a fixes tag + CC stable kernel when merging as we could deadlock
overselves if an devcoredump was done under extreme memory pressure.

Otherwise LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>  

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 63 ++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index f4c77f525819..5d19a4e3d5af 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -167,31 +167,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>  	ss->vm = NULL;
>  }
>  
> -static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> -{
> -	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> -	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> -	unsigned int fw_ref;
> -
> -	/* keep going if fw fails as we still want to save the memory and SW data */
> -	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> -	xe_vm_snapshot_capture_delayed(ss->vm);
> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> -	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> -
> -	/* Calculate devcoredump size */
> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> -
> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> -	if (!ss->read.buffer)
> -		return;
> -
> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> -	xe_devcoredump_snapshot_free(ss);
> -}
> -
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
> @@ -240,6 +215,40 @@ static void xe_devcoredump_free(void *data)
>  		 "Xe device coredump has been deleted.\n");
>  }
>  
> +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> +{
> +	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> +	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> +	unsigned int fw_ref;
> +
> +	/*
> +	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
> +	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
> +	 * thread and not in the initial capture call.
> +	 */
> +	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> +			      xe_devcoredump_read, xe_devcoredump_free,
> +			      XE_COREDUMP_TIMEOUT_JIFFIES);
> +
> +	/* keep going if fw fails as we still want to save the memory and SW data */
> +	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> +	xe_vm_snapshot_capture_delayed(ss->vm);
> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> +	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> +
> +	/* Calculate devcoredump size */
> +	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> +
> +	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> +	if (!ss->read.buffer)
> +		return;
> +
> +	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> +	xe_devcoredump_snapshot_free(ss);
> +}
> +
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  				 struct xe_exec_queue *q,
>  				 struct xe_sched_job *job)
> @@ -328,10 +337,6 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>  	drm_info(&xe->drm, "Xe device coredump has been created\n");
>  	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
>  		 xe->drm.primary->index);
> -
> -	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> -			      xe_devcoredump_read, xe_devcoredump_free,
> -			      XE_COREDUMP_TIMEOUT_JIFFIES);
>  }
>  
>  static void xe_driver_devcoredump_fini(void *arg)
> -- 
> 2.47.0
> 
