Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AE3CCF9E3
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 17:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B964510E0D7;
	Sun,  2 Nov 2025 17:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMesCSde";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFCF10E0D7
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762105067; x=1793641067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nA1Ij1DUCW1yWwTYxsDLeHvtqxhwHrppUiE7ENfWxNg=;
 b=gMesCSdeF/McxSySKDMp1AXn/Wlrd7pIjImdIQQWqcwkE51PGZeYBMrC
 dQz/XB6eK0GTzNVnsrWcIoHp5LDZOrhaSuRY9Ixy4ZoEkuiV3gAOQNHY8
 q1WfJCJodcQHWNhzEysPOEIfjJLO6TjaCZ/jwuPJe2ZVq+dAysTymbo6/
 gWHHXcWPjpOHBzP/wzXPr3epdmJ/5LZFyKgJkl9dPXdO6w2uc2w+jDohw
 FhigZdN/Y062gKKZ/v6bbtQ1O6l7vHXZ0KIayaX7HtQ4Yj6YnQmkv9uEK
 J1sx+tYYDa4veG0VgEQUrFZTSxgmK2v0wuMybsdKYdit5b5JZfjDhqbuF w==;
X-CSE-ConnectionGUID: Evbb/I4FQeKH2usxf1escQ==
X-CSE-MsgGUID: jgqvAi0TSKSz/oI6vVySpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64226142"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="64226142"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 09:37:47 -0800
X-CSE-ConnectionGUID: fPAXyzVrQEa2x2dMil2IiQ==
X-CSE-MsgGUID: ILCAl5RoQnWkVlLh1+jQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="191796895"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 09:37:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 09:37:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 09:37:46 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 09:37:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXmDwS3kBDb9tq3aJ09rSdUJPfBKBii4JBktmRUqR15Z4ub6mMO5KNmzhYI0a4P1jy6L5L/wFHwbhVSfWHEYzUW6Gj60r9MYeDjllGTPXwqD6aXmBBBaQE6SxmxSE8bzk2VBHctyT+dKfzzfO7LRVu8fgEMEFwAC4Nmt8yBGuRq0IKuIszBHNNFBj1AySJN53QNPWkgaVOGRALjQXhAXxHzSAbQOOTAo/Gerop22B92i6GbJqeR+9P3u8tklBS8ht/o586J4jRU1U9ckunDNcmwKyN7PVUQ1yYeL0GDbfSBsGeF6h4kKzGDt6L20gLubmbVZCQilV/8kbQTPU3BlcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH1OBq0REdVLrSkGjRiU3QDyg6qtn+QlqHt+51BvVdI=;
 b=ZZtlKT/VhlBxg5FuJpQX3EFtF7KyL90p8ncVXKerXvI3vEkC1seisu3vE8ptrbJ6Jz2aTRJKXb2TJeJeWXuiMZ7w8VL7bgGYU2ekdvrtbW8XeVlzboJmI9RV7GsKNf2dqPE4wXxB4gaf6HwM/ly1Zfzz0jeZ9OPXs5SsYuvAm5LBoQoM+1lNNtKApYMSJJu1P7M/TriMCrsTACsjGb/AZ0UVvcchnPxHYe2lNByxTG0ViStkbTxCjQ8SmmFTKSGQkRst2XwzZ33G5103SCATBEFUSM5L7zKr8/HKdUP3VTbagz+7xEPgHJfi2V0PBLiwBo2jZ8k1HV0xQlDJgRjHAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6345.namprd11.prod.outlook.com (2603:10b6:208:38b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 17:37:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sun, 2 Nov 2025
 17:37:37 +0000
Date: Sun, 2 Nov 2025 09:37:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/16] drm/xe/multi_queue: Add user interface for multi
 queue support
Message-ID: <aQeW37i2h0UdLkBx@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: a68ceadf-7765-4f03-5403-08de1a3683cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jJx9OfXccYOIBodkGBebzZvTBMUyjZwJd+CDjidylivZszko1O+yhWGtpoQ1?=
 =?us-ascii?Q?efrsZUZhj01zL/WkwEzP0CZm1E4xWsiz/ORdICpxsM5cmn6TLY8XIc6VrGua?=
 =?us-ascii?Q?whWWFXIt4a++EY1OedScMiLNWC61jUvmDzxSgmiF+6eWL1kf51erpRETMYm/?=
 =?us-ascii?Q?NIqm7x411braGFUn/V+9txPoJsjnicVY+tD8ehB53f4QCFjyN7cawCovg9WV?=
 =?us-ascii?Q?3LIy6qPnJaat+97BUVLfDArumX7R62OYZ4WYbEBxV6QmRgcU2TbfD4js61O/?=
 =?us-ascii?Q?q8ncXLC/JkBsUDex1zNy2cw8rTG8fT1AMw0s6I5p6p+YCNFICW0tRNTTKCwc?=
 =?us-ascii?Q?4pHSfq/ddT9R9rO3y237ymK5sJKUqfuEGQ/8+1a0LoyNVhbWmD9VGZ2XfBmW?=
 =?us-ascii?Q?DmkU7equTiFBSYvkqokmyfRrqO5pk1Y0W0lEeVgAHnjTkrU4vp09HsxZrmF0?=
 =?us-ascii?Q?/tRj1n8o7hARKJvWpDkrHBEseW7DmdDXgFYRdAoqUVOVXKHtFT9SyQUkPaU2?=
 =?us-ascii?Q?sqPiQrfdNto7W08k1wo3LAZyywN9GL1pAcKMGO/6/4HdFaAG7eY49TjYHQa0?=
 =?us-ascii?Q?iYr2O8ySF+bbbR3ohfQcYsKndCt3DMX6AQZyIbC7MVNmTb9m8/AHPpTQoNyd?=
 =?us-ascii?Q?tmMrL0DisNiun7Z4ZAyxiza1sv0Mbk6YpF0F2uqIK79ZouisgWW43H12z3NT?=
 =?us-ascii?Q?kgU4bWa5fVpccFmhZTssBa4wQXRxFQ61O7c9SIFux0+v/ITqfyzBa7l9RDsp?=
 =?us-ascii?Q?uAvzvqyxE0wNidSEGdwdvX4WN+66TxuoFiEw3sxbPnFdsFa6wXUlXLXhCNNn?=
 =?us-ascii?Q?+eOLBahc8iMyi0UMZfA/1KOzP1PmC9ORWdh1hUgIpt+DbLiPrbiaGhwmPQEx?=
 =?us-ascii?Q?DM4uJGIQlugvFrjkTJk+yXHgOfmDeL8W/OjdK7yb8qWLg132bhxmu3kdQ5nr?=
 =?us-ascii?Q?+WPbriQvJusmGYYKZZCMf2Co5IRVQr5IKQbRBtXf0f+nzMr8nB7Jw0h+ash2?=
 =?us-ascii?Q?wJzW+h2JIX0MOuNfnFbL3WHKGvhC8aYuUWg4nFndWdiR6sSceEYwblVJCS9h?=
 =?us-ascii?Q?qnKAheWijyr90pIAJaszD+DexNM3ArP0Jrp+u2pjs7R+BWEQKVNv8xZSX1Ay?=
 =?us-ascii?Q?xADXvkMSpKnIWuK4r8OCSxTJMo2NBH24OhTiCUqI6FVz+hzNugO0MKdV7Unr?=
 =?us-ascii?Q?PfnJbNyUpE/7AeZnC8SrENxXMS4C0E3r6U5opVH/k0MKQyDc3tOZN7IlrL57?=
 =?us-ascii?Q?t/u9dfo0vFlEm643Zb9+B6Ij4IGYs/tW93xgesdlkhtVxCUWH5qfGvsCkREP?=
 =?us-ascii?Q?OJugzDujibb6gDX/VKJAcvEfm9BtCJLtAwnDDM19PAvlOzbq8ajZoQV5inXf?=
 =?us-ascii?Q?4Ol7wX3/GYL+GwITshFH7AEVbl+otGTlyYK2655EnainOwyb9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hbGfH/+4IUucb6NmQ65hxrGAWLJicoGUL1+oU5GcRclwkyeEB2RvGGbgBaBZ?=
 =?us-ascii?Q?qCuxK4bCmgTUZgMk1+zmqNFt4d3xHyREJ1Bg85QElKoapQVUxCEfCDokpRab?=
 =?us-ascii?Q?+uvFVOF5biLCeFJyFW4xwA6s8h1M35IH7JpOh+Fuc2ILf43z/Lx6wIN3wSuW?=
 =?us-ascii?Q?CZ50bcFrKVHkIVyome5IeGYLcQW/P2vPRSacU5Z56BEPqOknHvgft4HYF+02?=
 =?us-ascii?Q?IhIs8y/TexPR6RK6tBt769rSIqS6gEHeOvVc0KqpLM6v7DZiHPN5qqdE7nRY?=
 =?us-ascii?Q?4zcUPaIEFHeDepdxw9g/yudQ1i921DrEPJr2D1oGtYNYUMmRe0iIgmb2zEli?=
 =?us-ascii?Q?r/3qQ2UwVdnIJ8QQcvB+4Z58PozgBSzLrotU5IRpOff6aL/+S8a3LzOAPYnv?=
 =?us-ascii?Q?r9qBb547Xibfzni0xa6qtpoFZX2ToEQi0EQ29YUpSMoIfVUtr47Jk5loR4L5?=
 =?us-ascii?Q?W2S6WtYIWljDUnfq9dkck6wYlTfCqgaWYQx+i0ruJVWjSjJntpU7ZH/388HC?=
 =?us-ascii?Q?P/kcXRoJMNy2ng8K70cQdsBLkFW76e+J0LWDdr6jOXv38ODTknYkfwOc2hHv?=
 =?us-ascii?Q?gIhBc5phJTSgFTBUHHWaT+/TXrMZaTShchxApcbWZ7RT6Pdal4iLiu8X0j/k?=
 =?us-ascii?Q?OMp1+7bjlz88mfxSx/SuuQB+aBb2tL6gvs7WRcx0SCoO6KijhBmHeGrSUTpG?=
 =?us-ascii?Q?1mFZXn8jx95n2USTsCZ2rUlrLg+ibyKWnyopGtS46OLVbXupx0aZHCmkSW+9?=
 =?us-ascii?Q?vmTF4tNPjgDuCXzIo2Rm/4acjUipgXwHxlNMEdzzFSCT+IavtgzFPHKJDbcy?=
 =?us-ascii?Q?rz49AmN3OorfNXFBPpfL0XGUoBDZQfZkaGvTKRrSTgCm3xuPK9rzBTEAHK8d?=
 =?us-ascii?Q?Fqeqt7YJ1WWq6zGbg49Wyf1BSW4D4JCv4itAnhxqOjQmEk1w0tVfuG9OdHVI?=
 =?us-ascii?Q?Jm7sRxCq4/z47q2RC81t8QTx13eItVebUMkCoX3Cc4dFWuCqEVLJLIEHODHn?=
 =?us-ascii?Q?LvPykmxhV4feQfRpSlkLVMaXa2iqogiy7o9csPcU9h6bbrVVDid2xC++fpGo?=
 =?us-ascii?Q?wC6HY39HD4Gz7l5TrtedfdmCBtBqGScKMCaUCFVzcXSzC4MKZZlxIXsBSXFr?=
 =?us-ascii?Q?D/M3yG9whekPWtu/PPtYjYMUHGtx0bZGd2oLTGh84fJUbSvdC6fa/vZc5oDD?=
 =?us-ascii?Q?6GpX/n3fC1UhmXXy/886IQ8RascODgQVi8o5381cgcL3Ij/Cl8/k5tYSMmXc?=
 =?us-ascii?Q?v4RAOwNKwP0YU8RHvjIW3wTX+g8x9bPhr3qubzd1gguu+RhRwXX8OQeUK6LC?=
 =?us-ascii?Q?7pjBYwOLLanFq2S+50hqjqQ+fXyLd2CwlbcYm9IX+OpRiTg3bPFO324gt/4v?=
 =?us-ascii?Q?wLDCSSrSomFAXqBMUvoGWOs4hFggAc4JhF+I6pvD/IhV+hKPA8f5K46HNqNJ?=
 =?us-ascii?Q?fi5ZBIKxdOVqtPias/emj67u4szCSczzYM3a9NT4DBLidw3r27aN15Gg+ThT?=
 =?us-ascii?Q?/Ctvlx05AEkbs1c1ncEfo4yIivoAI9Ax0bu+xwgWrFqWvJ1IdBBL+CMP2570?=
 =?us-ascii?Q?4oOTJ64Twcg/+LaE6zlCG0z0hyKMvUfJqrF0DS92xSvxT2/R8UddLlaeUbMP?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a68ceadf-7765-4f03-5403-08de1a3683cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 17:37:37.7783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WShSwXLvzmzCJZZcqSBr6zAUsqip+vUQiNvYY0sCd8nID6HOIjeOHQAP4aPDnDhbxOQKr8pCQ0Y51SdpsH5hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6345
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

On Fri, Oct 31, 2025 at 11:29:22AM -0700, Niranjana Vishwanathapura wrote:
> Multi Queue is a new mode of execution supported by the compute and
> blitter copy command streamers (CCS and BCS, respectively). It is an
> enhancement of the existing hardware architecture and leverages the
> same submission model. It enables support for efficient, parallel
> execution of multiple queues within a single context. All the queues
> of a group must use the same address space (VM).
> 
> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
> property supports creating a multi queue group and adding queues to
> a queue group. All queues of a multi queue group share the same
> context.
> 
> A exec queue create ioctl call with above property specified with value
> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
> queue being created as the primary queue (aka q0) of the group. To add
> secondary queues to the group, they need to be created with the above
> property with id of the primary queue as the value. The properties of
> the primary queue (like priority, timeslice) applies to the whole group.
> So, these properties can't be set for secondary queues of a group.
> 
> Once destroyed, the secondary queues of a multi queue group can't be
> replaced. However, they can be dynamically added to the group up to a
> total of 64 queues per group. Once the primary queue is destroyed,
> secondary queues can't be added to the queue group.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 191 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  30 ++++
>  include/uapi/drm/xe_drm.h                |   8 +
>  4 files changed, 274 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b57d7c2cc94..86404a7c9fe4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_file.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "xe_bo.h"
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -62,6 +63,32 @@ enum xe_exec_queue_sched_prop {
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 extensions, int ext_number);
>  
> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
> +{

A little incongruent with xe_exec_queue_group_add/delete as those
functions are blindly called + check if needed in function, compared to
this function checking at the caller if multi-queue. I don't have a huge
preference but I'd at least make the call semantics consistent.

> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +	unsigned long idx;
> +
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));

It took me a minute to figure out where the associated get on the
primary came from - it is from xe_exec_queue_lookup in
xe_exec_queue_group_validate. Can you comments along the lines:

/* Put pairs with get from ... */

/* Get pairs with put in ... */

> +		return;
> +	}
> +
> +	if (!group)
> +		return;
> +
> +	/* Primary queue cleanup */
> +	mutex_lock(&group->lock);

As discussedi [1], group->lock not needed.

[1] https://patchwork.freedesktop.org/patch/684847/?series=156865&rev=1#comment_1257408

> +	xa_for_each(&group->xa, idx, lrc)
> +		xe_lrc_put(lrc);
> +	mutex_unlock(&group->lock);
> +
> +	xa_destroy(&group->xa);
> +	mutex_destroy(&group->lock);
> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
> +	kfree(group);
> +}
> +
>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
>  	int i;
> @@ -72,6 +99,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		xe_exec_queue_group_cleanup(q);
> +
>  	if (q->vm)
>  		xe_vm_put(q->vm);
>  
> @@ -549,6 +580,148 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>  }
>  
> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_tile *tile = gt_to_tile(q->gt);
> +	struct xe_exec_queue_group *group;
> +	struct xe_bo *bo;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return -ENOMEM;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				       XE_BO_FLAG_GGTT, false);

XE_BO_FLAG_GGTT_INVALIDATE | XE_BO_FLAG_PINNED_LATE_RESTORE are needed.

I believe XE_BO_FLAG_FORCE_USER_VRAM is needed too, that's new so not
100% sure but I'd check the git blame on that to figure out if it is
needed.

> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
> +			PTR_ERR(bo));
> +		kfree(group);
> +		return PTR_ERR(bo);
> +	}
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> +
> +	group->primary = q;
> +	group->cgp_bo = bo;
> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> +	mutex_init(&group->lock);
> +	mutex_init(&group->list_lock);

See my comments here [1] the list lock being initialized here, but
used/destroyed in [1].

[1] https://patchwork.freedesktop.org/patch/684850/?series=156865&rev=1#comment_1257596

> +	q->multi_queue.group = group;
> +
> +	return 0;
> +}
> +
> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->gt->info.multi_queue_enable_mask & BIT(q->class);
> +}
> +
> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
> +					u32 primary_id)
> +{
> +	struct xe_exec_queue_group *group;
> +	struct xe_exec_queue *primary;
> +	int ret;
> +
> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
> +	if (XE_IOCTL_DBG(xe, !primary))
> +		return -ENOENT;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
> +		ret = -EINVAL;
> +		goto put_primary;
> +	}
> +
> +	group = primary->multi_queue.group;
> +	q->multi_queue.valid = true;
> +	q->multi_queue.group = group;
> +
> +	return 0;
> +put_primary:
> +	xe_exec_queue_put(primary);
> +	return ret;
> +}
> +
> +#define XE_MAX_GROUP_SIZE	64
> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 pos;
> +	int err;
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		return 0;
> +
> +	mutex_lock(&group->lock);
> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);

To consolidate threads [2], add quick inline comments here around ref
counting.

[2] https://patchwork.freedesktop.org/patch/684847/?series=156865&rev=1#comment_1257594

> +	if (XE_IOCTL_DBG(xe, err)) {
> +		xe_lrc_put(q->lrc[0]);
> +		mutex_unlock(&group->lock);
> +
> +		/* It is invalid if queue group limit is exceeded */
> +		if (err == -EBUSY)
> +			err = -EINVAL;
> +
> +		return err;
> +	}
> +
> +	q->multi_queue.pos = pos;
> +	mutex_unlock(&group->lock);
> +
> +	return 0;
> +}
> +
> +static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		return;
> +
> +	mutex_lock(&group->lock);
> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
> +	if (lrc)
>

I think here it is an assert if lrc is NULL? I don't think it can be
NULL unless there is bug somewhere, right? If so, let's do an assert to
ensure software correctness.

 +		xe_lrc_put(lrc);
> +	mutex_unlock(&group->lock);
> +}
> +
> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> +				      u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
> +		return -ENODEV;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
> +		return -EOPNOTSUPP;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
> +		return -EINVAL;
> +
> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> +			return -EINVAL;
> +
> +		q->multi_queue.valid = true;
> +		q->multi_queue.is_primary = true;
> +		q->multi_queue.pos = 0;
> +		return 0;
> +	}
> +
> +	/* While adding secondary queues, the upper 32 bits must be 0 */

State this in uAPI doc too.

> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
> +		return -EINVAL;
> +
> +	return xe_exec_queue_group_validate(xe, q, value);
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -557,6 +730,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -577,7 +751,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> @@ -626,6 +801,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>  						  ++ext_number);
>  
> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> +		err = xe_exec_queue_group_init(xe, q);
> +		if (XE_IOCTL_DBG(xe, err))
> +			return err;
> +	}

Any particular reason this isn't in exec_queue_set_multi_group? Or
perhaps in xe_exec_queue_create_ioctl? It is bit goofy to have in a very
generic function here.

> +
>  	return 0;
>  }
>  
> @@ -780,12 +961,16 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (IS_ERR(q))
>  			return PTR_ERR(q);
>  
> +		err = xe_exec_queue_group_add(xe, q);
> +		if (XE_IOCTL_DBG(xe, err))
> +			goto put_exec_queue;
> +
>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>  			q->lr.context = dma_fence_context_alloc(1);
>  
>  			err = xe_vm_add_compute_exec_queue(vm, q);
>  			if (XE_IOCTL_DBG(xe, err))
> -				goto put_exec_queue;
> +				goto delete_queue_group;
>  		}
>  
>  		if (q->vm && q->hwe->hw_engine_group) {
> @@ -808,6 +993,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  kill_exec_queue:
>  	xe_exec_queue_kill(q);
> +delete_queue_group:
> +	xe_exec_queue_group_delete(q);
>  put_exec_queue:
>  	xe_exec_queue_put(q);
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a4dfbe858bda..8cd6487018fa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -62,6 +62,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>  	return q->pxp.type;
>  }
>  
> +/**
> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if the exec_queue is part of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.valid;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is primary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.is_primary;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is secondary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) && !q->multi_queue.is_primary;


&& !xe_exec_queue_is_multi_queue_primary()

> +}
> +
> +/**
> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
> + * @q: The exec_queue
> + *
> + * If @q belongs to a multi queue group, then the primary queue of the group will
> + * be returned. Otherwise, @q will be returned.
> + */
> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
> +}
> +
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index c8807268ec6c..3856776df5c4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -31,6 +31,24 @@ enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>  };
>  
> +/**
> + * struct xe_exec_queue_group - Execution multi queue group
> + *
> + * Contains multi queue group information.
> + */
> +struct xe_exec_queue_group {
> +	/** @primary: Primary queue of this group */
> +	struct xe_exec_queue *primary;
> +	/** @lock: Queue group update lock */
> +	struct mutex lock;
> +	/** @cgp_bo: BO for the Context Group Page */
> +	struct xe_bo *cgp_bo;
> +	/** @xa: xarray to store LRCs */
> +	struct xarray xa;
> +	/** @list_lock: Secondary queue list lock */
> +	struct mutex list_lock;
> +};
> +
>  /**
>   * struct xe_exec_queue - Execution queue
>   *
> @@ -110,6 +128,18 @@ struct xe_exec_queue {
>  		struct xe_guc_exec_queue *guc;
>  	};
>  
> +	/** @multi_queue: Multi queue information */
> +	struct {
> +		/** @multi_queue.group: Queue group information */
> +		struct xe_exec_queue_group *group;
> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
> +		u8 pos;
> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
> +		u8 valid:1;
> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
> +		u8 is_primary:1;
> +	} multi_queue;
> +
>  	/** @sched_props: scheduling properties */
>  	struct {
>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..d903b3a55ec1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1252,6 +1252,12 @@ struct drm_xe_vm_bind {
>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>   *    runtime PM will be blocked while queues of this type are alive.
>   *    All PXP queues will be killed if a PXP invalidation event occurs.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
> + *    or add secondary queues to a multi-queue group.
> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
> + *    then a new multi-queue group is created with this queue as the primary queue
> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
> + *    queue id is specified in the 'value' field.

s/queue id/exec_queue_id

^^^ to match names in structure.

Matt

>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1292,6 +1298,8 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
