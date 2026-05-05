Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647E2FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 03:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C3D10E02D;
	Tue,  5 May 2026 03:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxRToYxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA98F10E02D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 03:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777952776; x=1809488776;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tci2QSIov+1jCD/wEgNeeywm56KJXGIXgmsRxAjxsDo=;
 b=nxRToYxbUmYjOICRQQwT16kpcwZ55yGqDx7jnHTssgPrdvDHGaT3uFsP
 om3Tjgib76gB1zF8MC0DD+t+7Su0n1an7qYVmT0LKrJ03jAk8djuyDaSm
 hx8wKIdvrLWMGQSHCyv9PPwPNhevK+a+zQMkYfw6U9MnRlPH2ASJSXYw6
 c2k/8YoLpOGyzqY3Oohr/dD8qgC6N7ArCH0mDu40E+lluo+iqKWbgCt00
 DwJ1a1KFl9S/bgveztLpFaqfsMm1cLDkj3vdkAHr7Q6C+Tqs0Ra6rL9Co
 Rx2O+KgP/VgHHB3IZIJIi/eee6qbKE8Viw5UdUzmQzAuwkc4b2KCbsEtG A==;
X-CSE-ConnectionGUID: uRCv6MdnSteSTtznltbjrQ==
X-CSE-MsgGUID: NdtE5h4kStOY+cVQotnK3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96383353"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="96383353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 20:46:16 -0700
X-CSE-ConnectionGUID: Dl4+yJtgSfClk/mjPHzqsw==
X-CSE-MsgGUID: 2oXnuJdpRRm/ZC6C7krtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="234681005"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 20:46:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 20:46:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 20:46:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 20:46:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnmztK4X76BVqfK1ceoWpozeHgzPQKoARV3Sjz8EUt0bOQ7ZDVVtyEYBTz5160+XilDWy37+pOqAWEHfiUQ2xcE5icgaTXCyhu8vK59H4qg8t4/9SCc93IOGd8ALrvEn4tNMlyHujV1ZDnkqW88k3QefZRScsvwIJzLSuBwR+IfhunmBn0vVnoa1yr8VKfB0kOevKvf/CKURzsFzmvFRebBUu86YGmz62TeAdn7hwbTPNbqz5Ncc/n0xTryJ6lEvTQLASoIFY17F75CnEhVEFeWC7KwVwaXetYKq0mnk+hJSbTzYpBUXR6lBzCfTcbTFMjKO4IcooQFhs4CBFHoEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7205M0fT2Za3MhsaXYVGFBmgplujJGIsjPFefLHpOU=;
 b=aVvtvITq0vjQrRSdsVCn2KhYjcTMcSanVHSGjv5xVq1oRNns+VFY7P1OkxZ8yX5d7suyyD5LAz0KGM4rZ5q7vuzh9qUhhbFlsEvSxiznXeBJ4GUGyx0fd5qRXIMKpArS4Zj72f/98uY7vjnxNJ2QzB2Ajh5v0wPO0YkI6bEuFouW7zK+Wr1DBAtyq7sUqUlLxZjmNRMiVvUD/2/dQyVjw8efNaIXH7iCLZ7mTlby1Q2QVTksvUgpmdYkcY/DwOsvHZQUKPvyoq3K/6UtzxoQkX5zuNE1vcWKVjeyF+BJge84RdtH1qPhtfY3/1fEI3i0jDJ5t3DQdFvbRD9Y+a59QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 03:46:13 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 03:46:12 +0000
Date: Mon, 4 May 2026 20:46:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 3/9] drm/xe/multi_queue: Store primary LRC and
 position info in LRC
Message-ID: <afloAo3OMhrZxVMK@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-14-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR06CA0050.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::27) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 42db2cd3-f796-4673-0434-08deaa58da1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 78BynKKE4kY4HZljw94xb7hD5dqcHAWo+5YVk4Xn7l2UTgYLxMal660jIWebzW/ZptbT16CRQHRgkekgAm3ahkaa/4hAL8/h1vIS5u6gLwpK3DLEPpxQ/CPZrChAa7o29NFPIeqGOjw8rxPGYqiyOwNOaIdctoWXb+0f2RIU1yPyQHstRVO0jkVHdmkSoHYp4aubeMP5JZcQKXIFb7YqCkQqSh4M/+AqwHyJjK7Ss0vgW+knrO3Z8X9IMF9XrYmcwEhRNXNiVDFzPrQ5Ewlzq/umAwLMTIrY6jvmy3E8UP6zOhmJz7tgi5DuOR7RU7svEwj20YucSGOhmDO9RxQ33V2gNnvZYRCpTtTWOm4r10sgwUoYLAIcNFrin4gBR4NztQXnQfZrxKqo97My2zGQY5AIiIllNC8s247oD75Ywg7jHTT3Ht6rx1XH9Rj0pYrV7/rhTMEuXCTeBPqbxnukF1gKfk3VW+sboJHoe87cIKgOzgK2DWwiDsEjkrb2qna7gY80s+VehrgnOzfn2frjtxllnN5va12CNfSIQoEhzW253Blegj27JL/QIDjZWCE3R5Bey271yZzwfK4If0F1mLdEWBdCojSpb1JSlmGQNQ43bRJKpk7aVg4LcLsrNL4VWCvOvSE5P+Wb0FY1DgkwDs9HUyVJYk5Y4irh+45hP/39WGN1T7kfkDaurz/HdTcE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bkGPoKHmlgeVt+6wz03+zFrhHp8JwM5YTmlfYGQANUgdGcgqLB0A3KBNIUE6?=
 =?us-ascii?Q?l/tJxXFMRVkRvudK4uR+n1f9pyAfxa/mJFUoxwkU3o5nP1rwksLCe/l5f7l1?=
 =?us-ascii?Q?BmNhZ28OgANzzLjdg/kKE2FHgJp6pvpwI70XBeS2oVvhipTYTQhxqNgYRbNF?=
 =?us-ascii?Q?QFgsTd3IZwv4liFhNym4TeiAhbCWzTydhUo4QPmKyp++2oOkLIglGE0O7Ebl?=
 =?us-ascii?Q?zD9SMnGEs0i1nMIr8wDl6xfp2YRpbnQ4uJ0OEjNX8FjboOnCklU78ABAJMqK?=
 =?us-ascii?Q?mZ4FHXP647cJJQAut3ZrPiOADc8Dk6Lu8OEUuSf3UcqUQxGc8F4gnTnwa9yc?=
 =?us-ascii?Q?dREkLPoVB4vzMdxud0G/vvadveFWWw7cQWI7aQNNa31x3W3g192icNDCR0tt?=
 =?us-ascii?Q?o0j+bYuwW/c3rlqcAOueD2MQRCsAe3BqrBa1ssQCdAYegmf4OtSQWA23Nwqm?=
 =?us-ascii?Q?N441zvth93u0FynOya92eBrQS03ovdQRnkd5I9AsDtcXOZSDV/1+7AP6BKUp?=
 =?us-ascii?Q?n//RvTu5PirBQuKAuC3p+SV9OwYuCQoOps0bvnzTwa/MgRgr+nKapGO26MHd?=
 =?us-ascii?Q?Jm8EksVyPtqtottzv9U03525JqVk1v/7ToSYwrWkVovUZj25n1eaa2eCIsb3?=
 =?us-ascii?Q?SIKgVFeTgxyw8B7YEcTJPfuPmdGJypzlLnZzAdIngq+L1LdnPV8dh4AsuM0/?=
 =?us-ascii?Q?ZBE+2dPEOhcpBpeGJGwweLv2DXAOllCNMV6WSfjG6CTTX5PdePyEgl6ZC64e?=
 =?us-ascii?Q?+7FKhQt93M0X1BWIro+M/iYoLm1LY8tU+4jevh2lz2x/pPhL7VTXjs3XLlUM?=
 =?us-ascii?Q?tginHjOXIkUglf+XeBp3Mdb4aTBBfwhmwXUdvX/Wi6GkhNPh9K8Rh8nAnkOc?=
 =?us-ascii?Q?SwWCBFp7yeaT3DXF2hQOMqv9rEN2lDso+Q1wns5jB/kdIJzPt1NPF9eTI2Qo?=
 =?us-ascii?Q?YND3YpfwX25gB71lkKGkStKJ9vB7FDx9G0V1+u0UFh5SNwFfGxu40DtWh9qg?=
 =?us-ascii?Q?Yk4n/0431jN8RdqAL/reNYZwi7xJMfJjuOF3LgsGFKFQt2Vp1j2LPx/s5xAc?=
 =?us-ascii?Q?6M4+J+o90w7ag9/ZZjEVuLZ4OS9U054N2rBTF2B+gjInllG1Fdz/B3wT8oVK?=
 =?us-ascii?Q?BMUXMcA5mYy8aYapwtAv0jZkD12wzW0Av3Fccz+/31uQNk3fwzJxPipjVWOf?=
 =?us-ascii?Q?CPcjmBOXOB6PpkkI2Sqx9DtBTE9IKBUASvDscMvgqR8ElKuwHUlTEtVyGmma?=
 =?us-ascii?Q?fkzoBZVrnF3NAORyq/nLCWETK1FMmLcz98ipig06l3Qb8cb+JpxiHCZW7y/V?=
 =?us-ascii?Q?b4VKN1/Lcg2PxSWA6C1LN1YuVtfePxpY9T3jxjBWp6c7l4m2CC3fNmfR1uZS?=
 =?us-ascii?Q?v1JNAeRU+TX/QmaCApHf4uo3tmWijeTQZV88+TAY6pekUvigEwVQVKxOMFMH?=
 =?us-ascii?Q?Gn/DTiPFKiHck9McZa9SjgwDkcu/C79Ur4PWEagqWb4hnNNSQROGeM5J9qaC?=
 =?us-ascii?Q?pZmodlFe7zAZHvd4JalHt1ZZvEXdwinrMo4ORLRfJ3p7V5lS+5Wk1t8SACX2?=
 =?us-ascii?Q?vDrxrG9zUZch95dotr7lignm26iocAPSjCRB8ySEKl4nTv0FNgN9MCN0EuF0?=
 =?us-ascii?Q?7TOFweuOvRYV2KLztwAWXoa6mbiAhxNiMF55wCasxaHmZOWKE1e/OH4vOVo7?=
 =?us-ascii?Q?QQEjHqJ+Dx9rt9IgyFEm5J/uvdDiZlLnL2E4k7xTV/ZbNn8zrtL32lH2/Cbr?=
 =?us-ascii?Q?x92zbh+H6c/OKUzkHDFWqWoTw7KXFvKgMHIVd8+tuGArKiV9uhcd?=
X-Exchange-RoutingPolicyChecked: bv/LIylU6a8NqZKPl0gUyy9fuU7Rv6tfaFsWrWB/TbdOXiv/C8nFkgaaNh90//8NlQmiqO0l8n9bRFSdjcsb+phJ+NGyFjmqD6AgHyfLdNfpWkYqq4zsLAJoqc9uwbhm85m0VF/f4V71EVVhh7asKdrLnyj7cj+l30j2GZKvPluL/8rCpnVOf+xBKmez0qTUQHhiZMo20HL6j102wLaiVAYfc42+FnZM5MOOipgrp1S+7DVlBSbrhw0HbXj2AQwKF+uzzpLON2ngAQyMBeLBwyjGLAvT4FaxCRw+uYdg08YxM/onr8wtTnXLJUvpIiZVdL1FfbGOF4a6npK/emDwmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42db2cd3-f796-4673-0434-08deaa58da1c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 03:46:12.7948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPTBR22xOirTfK0HrBBI1iXN0D+jD4sbxSJpwzlqEGwiSba7JlEo/DpVdC+eZfpgs0XudolrsUg6E/y1d0tW/cY1CYYWdX3iiCiNUI1a8CIa/L3vQ6P54cd2ygaMm7AX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5782
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

On Fri, May 01, 2026 at 05:53:36PM -0700, Umesh Nerlige Ramappa wrote:
>Given an LRC belonging to the secondary queue, in order to check if its
>context group is active, we need to check the LRC of the primary queue.
>In addition to that we want to compare the secondary queue position to
>CSMQDEBUG register to check if the queue itself is active.
>
>To do so, store primary LRC and position information in the LRC as well
>as take a reference to the primary LRC from each LRC in the queue group.
>
>A note on references involved:
>
>- In general the Queue takes a ref on its LRC.
>- In addition, for multi-queue,
>a. Primary Queue takes a ref for each Secondary LRC.
>b. Each Secondary Queue takes a ref to the Primary Queue
>
>In the current patch, each LRC in the queue group is storing a pointer
>to Primary LRC. There is a small window of time in the primary queue
>free path where the primary LRC may be freed before the secondary LRC.
>
>__xe_exec_queue_fini(q); // frees|puts primary q LRCs
>...
>window where secondary Q LRC is pointing to invalid primary LRC
>...
>__xe_exec_queue_free(q); // frees|puts secondary q LRCs in multi-Q case
>
>In this window the reference in Secondary LRC is invalid. While there
>may be nothing accessing the secondary LRCs reference, to be safe, this
>patch is taking a reference to Primary LRC from the secondary LRC.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Store primary LRC instead of primary queue (Niranjana)
>- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
>- Document/Revisit references (Matt/Umesh)
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
> drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
> 3 files changed, 33 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index b287d0e0e60a..e34601d28520 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -129,8 +129,14 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
> 		return;
>
> 	/* Primary queue cleanup */
>-	xa_for_each(&group->xa, idx, lrc)
>+	xa_for_each(&group->xa, idx, lrc) {
>+		/* drop secondary lrc ref to primary lrc */
>+		xe_lrc_put(lrc->multi_queue.primary_lrc);
>+		/* drop primary queue ref to secondary lrc */
> 		xe_lrc_put(lrc);
>+	}
>+	/* drop primary lrc ref to itself */
>+	xe_lrc_put(q->lrc[0]);
>
> 	xa_destroy(&group->xa);
> 	mutex_destroy(&group->list_lock);
>@@ -275,8 +281,15 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
> {
> 	xe_assert(gt_to_xe(q->gt), idx < q->width);
>
>-	scoped_guard(spinlock, &q->lrc_lookup_lock)
>+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
> 		q->lrc[idx] = lrc;
>+		if (xe_exec_queue_is_multi_queue(q)) {
>+			struct xe_lrc *primary_lrc = q->multi_queue.group->primary->lrc[0];
>+
>+			lrc->multi_queue.pos = q->multi_queue.pos;

I think q->multi_queue.pos is not yet set for secondary queues at this point.
It is set later in the xe_exec_queue_group_add() call.

>+			lrc->multi_queue.primary_lrc = xe_lrc_get(primary_lrc);

I think we don't need to get/put the primary_lrc reference.
Each queue holds a reference to its LRC. The secondary queues holds a reference
to the primary queue. So, essentially, the secondary LRCs are holding a reference
to primary lrc. So, I think, we don't need to hold reference again.

Niranjana

>+		}
>+	}
> }
>
> /**
>@@ -388,8 +401,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>
> 			xe_exec_queue_set_lrc(q, lrc, i);
>
>-			if (__lrc)
>+			if (__lrc) {
>+				if (xe_exec_queue_is_multi_queue(q))
>+					xe_lrc_put(__lrc->multi_queue.primary_lrc);
>+
> 				xe_lrc_put(__lrc);
>+			}
> 			__lrc = lrc;
>
> 		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 97aef0327fc8..3d0bf4a7bfa0 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -91,6 +91,11 @@ static inline size_t xe_lrc_ring_size(void)
> 	return SZ_16K;
> }
>
>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>+{
>+	return lrc->multi_queue.primary_lrc;
>+}
>+
> size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
> u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 5a718f759ed6..0a5c13ec2ad7 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -63,6 +63,14 @@ struct xe_lrc {
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>+
>+	/** @multi_queue: Multi queue LRC related information */
>+	struct {
>+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>+		struct xe_lrc *primary_lrc;
>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>+		u8 pos;
>+	} multi_queue;
> };
>
> struct xe_lrc_snapshot;
>-- 
>2.43.0
>
