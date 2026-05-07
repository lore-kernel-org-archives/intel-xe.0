Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1EECD342C
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7083A10E281;
	Thu,  7 May 2026 01:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeAb+4L6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708D710E281
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 01:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117982; x=1809653982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kJ5sOt1h2Pt6QB1jysCzKtg7Y6r0EC/UghKaUn0fmjo=;
 b=JeAb+4L6rwRFW+7i/xPmTQgmGYxzy9d5bB5tua/+dLuBltI4tg9khT+8
 pzEeim+nDVBM5zeXGNofZettnFZswBQt2TO3OEa99DqS+LSgJDPNpHIku
 easZmH7BMeImAlWWFGSRQBP14iPLv3xUbsUl9Ce6Mcw3IIDj+cR9JpBzX
 sTpOA0kGRjxoi0HwmCOWFLG6o3gaFSLVvm5VZ3rh78FkKGkZjuDeyt1Vd
 Jiz0QfLcosRbpvsH0Bch8l81URiFJ2mhrpOXYYAEHfEwb7qVTt/65r96U
 4zjabxjzu9GyPlaZq8CeDB4uroKREgRpSyQhWibNpAgPZmmLpRo3MQqea g==;
X-CSE-ConnectionGUID: 1WZFxhUfSTyARz863FaKhA==
X-CSE-MsgGUID: rk0ngnK+RS2KlFLNl9hUjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78955409"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78955409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:39:42 -0700
X-CSE-ConnectionGUID: /9hf3EgKS/ebmcLJavw3ng==
X-CSE-MsgGUID: Zu8ttd+aRZSHC37mXW8fPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="235468784"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:39:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 18:39:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 18:39:40 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 18:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD3JBWiaDwBeve8fkXd8xAO0r71zwplrJ8XN8nzDMJeVt0lhaZSVCEzvpP8kCzOIcG6BbIKwomg8VVee+r8kaWOpsmagt/MNBt3TA54A1xFTvjaBIScQB/ohHxjxUXTQ6IkLnLL9JgyI93yiVt+nLDOjFRMNL9qTNZtU2l98JMr27sCejuBikxA9YQZJDyUMrBoTDe4KhwfZWnXj3jXC7EtIwItSe9Cs10GhWcIPpQ7QhyT+VhfHg0kDitX5Qnbt1mjMDtyYI90MvZnf7o43Kie20hv5r6lWUnTk3aOaL71l6jHqrfc45B1eRDwrjKUHZYk/DZXEIqE73BEkyLgjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpZjvaXJ0DKDAoGSI9o7dfcorgBATOcq6McdUA4+H80=;
 b=KP4U3YxIZYOb9VU1Zqk3tfrBLWQ51nJ7jy652jJrVUdJ+OKIkNpj02ri9BtDM6D9xADuogLFnIQ3KBSMljWqsXABxKKFLWklkRPe1LpnLrzL4F7yQDG579Kwwhl5z8kW39lBJ3+j+8SFEm6siGcYgPQSUq2maKCoVq2f3goEKLCAct/Al16HHca/P50WQe1F5leGjv6et9k84oXq6rRuhnC7pm95HieV9F6k9tlBlHEUjR/NHBEpUj6LsQaI/a7T0jzCuJSA/Nv8Jw7vqyb5CJJuV7/JZfH7mjzJR75bqHMQNX2ob8S/ObQpuRM9qzCGteqWcDZoh9OHqaQ83xS5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 01:39:34 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 01:39:34 +0000
Date: Wed, 6 May 2026 18:39:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v4 05/11] drm/xe/multi_queue: Store primary LRC and
 position info in LRC
Message-ID: <afvtU7iUr4g3Y96-@nvishwa1-desk>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
 <20260506223500.3769614-18-umesh.nerlige.ramappa@intel.com>
 <afveRR-TNmiAdCFx@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <afveRR-TNmiAdCFx@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 148e4bed-a380-4767-52ce-08deabd97e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ktBgw6pAaJQIoEU75LVtBtMwWIHniJn5VjK/Oe5x49jm8BkYiBKeTlljplPPzaEeuHIbB5ErD9iLAnlB7I7No8qWgOvEoBBqJ4huyjIdu3hXL3F2bm4Bo3qUIRBxpegOxE7S0+6jms+RR+OojE+FeRo/OwdZ/zp/9w4l/FSfbyegMIiKhzfnFAu9OxCZ+x1R1tlu+4aEYxBYq/Uo2v3/cCRJein78ykqcTeNj0C4X02/xQbTK7LGqk4NxMYVL01HQC1TabAbbsHbM/6d5OfX2JcP68zHtVko8Ug0qYywovLs9jkYVcRQtWBQ3UPyI1rrNHlMaP5D43NgQy8v/fP/Gkzi8cCC/x3AgKOvORIzxOIm/46Aksdpqi/7HOPSmTWf/rASdxD56rwWF0hDmouzqsxeNoEGt1T+tvy6motwNTxtyrRWGJT7qRwuumgLRE8/FHnmb3q5/6WtK05V+ltrciBeWOQqx3xK++jqveij5M/Qs9wK2eZPiBW6ovjcl1tSm32oMD1IyzvX7X2FEwnNjDzK3TQLXzLMt+3/rIl7aTQWun8BvzFjKkosKn9FTxwZ5fr0FqyDDbRBOkZx1XFxVIKbjmfgdIgJm086k+ADL9pVQOAWmdvh9aKvwCwEpKYT0FHdopM9uIVgonTcJexn9560BtodE5cDP/CCDrYTpO9igY2pjIpulosh1BxdMaeA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SQC7xq7ZWSsXSgNBprgivqRKxm4s1+iz0OutRkeMx5Q6WcEtagJSgcgXObyR?=
 =?us-ascii?Q?yFLn/53ObdDnX7MKlEfNq2bM1x5rstEmLTkwWA/Qvu5bFp6lygVISy1B7kdV?=
 =?us-ascii?Q?CqEJ1HX5vPVlp2KmhYlcAllZscz/5cut/2bHHhgsXmJ4O5QHLfeig89DV7Xo?=
 =?us-ascii?Q?PuBurgMOESW4w1SgsxaVDg9tMKV/9QDP07bpuVRRzzl5SR0PUa8jV+EknErD?=
 =?us-ascii?Q?fNaFlMt8caKgHlYkyBH0gLfR4PgZiJaFCjPKCSyTBq4Za2yQIY8YnorCwu/R?=
 =?us-ascii?Q?IzjieXtmRUkiWPthUBf5cMqjix+iDsOir/LJkyI+Aagx/xYPnbkKYBnlFgNs?=
 =?us-ascii?Q?fptuke4lVw41X90QRABhY+DTzDm8H+UBlBVsPU9VBrr/iTHoxxOgd1wqjgL5?=
 =?us-ascii?Q?l600xtbdhxAPl1R41tKRmr7t9I4+fDnrQYbCGwDQ/9QZngvJK/xUkmqG1Lil?=
 =?us-ascii?Q?l+EmfVM//yEKq2IrrXeAFSCzQxk5lAMdDB4CtRLDqKDp3Cq4AHhuCfmuRNz/?=
 =?us-ascii?Q?pu7Vn5jR2AsZHrslVr/HEWGCwGt96RF+kBHhi0piBZitsOSuQecMX8iTFP/b?=
 =?us-ascii?Q?ecgFqyCPL2IYgIbGFwsJj8c/Rj/eoplOrOWByzV4uzx2VrPo5IztK/pwz/iI?=
 =?us-ascii?Q?heyYhCA/KGXAipoCEHxMC/QRjHPWNQ1TBnZayvsCxFipYyv+/XYopemSOvsU?=
 =?us-ascii?Q?Z0rh4Um3MYhqdN+Tbkxx+y5dgeDeMuKezDewIN8bDnAN/uaR15esVo3NRzkq?=
 =?us-ascii?Q?wnJeR+2V4hWozDpZbUaRS1rxq2ofS4HyztSnNn1w4VQSKRBXo7BbPCMlVlkY?=
 =?us-ascii?Q?d4l4P05qikff5UIRkzMGSsgRb6AbdEKCA+rBQPfJLyP8OLpZTgsongxxBeza?=
 =?us-ascii?Q?3XgepbYoT/Xr1Ry4HaVGq3GIdT356ysMHB0FkkCbVXejvfag5IoanB+gEXCe?=
 =?us-ascii?Q?13HLzt55CJ8ghtX/i8QsEvv6K02DCJvZj/u+mWtxSbSmyBaFefOXXKJop7n6?=
 =?us-ascii?Q?gXv4wXGNMkAaTSFdvnRFR8r1lxS191KbXe3QEvVEZG1g3WGqz8QC3h/IEegc?=
 =?us-ascii?Q?ER7R6UR5bsJaRiBY8CeUdGSZthjrp2urVhDFVBVxmYp32STYPbPWEHlqD2Y0?=
 =?us-ascii?Q?ic6+Xl+/s4aL8AcTHLR3PfrK/i4w9I61+rDlbjBqda6Yg8C6YWAVd2vn7mwk?=
 =?us-ascii?Q?A2TKWDf4xM7p6Z28kNGzzwzVOiCRAfIOClmrfhOGYz0Q+tfcCQgj9k4LK+HP?=
 =?us-ascii?Q?h+Ns4ELbLPmFUrDWIvDdm6l5JcNH+4D/0Ijb86EZmuP1YnRoe+zdjzLfs3bB?=
 =?us-ascii?Q?fVHnfKOOvXuf+YtpHZHQAcO8o5zGbC8/3MfsBRz8yYefntDnS3UZhKxCxFsj?=
 =?us-ascii?Q?1hYRnsv5uQf2h/XNpwtGO7+p6iad0M0GZHB9bnL8y+Fzg/8YG35vrHWF1zA1?=
 =?us-ascii?Q?kq4HQIB3iRVruK0deKWaeeiGElRZZH5n+K3j//A+GrUEqVOKj5CtUDGZb/fu?=
 =?us-ascii?Q?vhqapvrsO+1bxQ/z+Fi7MgbEB7dpFNqbLz2iLoPVhwCwrbpuWpCHXIL+6Vrm?=
 =?us-ascii?Q?3sYj/DMOcMKAUzN2eCqOYa/lmoULYTn7B0/0a1F7FWaHlozIyaGU1A1pxFmc?=
 =?us-ascii?Q?zrRcNBQflwwQdSBDyvftfjzV5Iau9HbLJ2J6SgOAw1AqPOCXm06ynixRqz0b?=
 =?us-ascii?Q?ujkpjYu6cikQ9CAFzMgUkOt/SySgc4h6gj2FpiyOW2Ok/+TPdYQHKJ5ow80d?=
 =?us-ascii?Q?q/KTcfjqupdkuEqH/iV/L8VQi3+1PoXyQNDwDh9SkB1qt64poByl?=
X-Exchange-RoutingPolicyChecked: R9VqUUnEGItXo4x6MKtWpalfhma9dN1zCtSmo67fV50Eqk6lmf257MxzkxfdTVdoJvBrDcxbwe+XcKAm8Q1+sAbHJHP7oF4yJD7V3i87DgN5UxUmRP8qiboIfarE6cFZtxC/7C7xYg+SnjcYcQxiFWeGW5KD57MDcBPNJBGth2ZzHlwfLWzbZvaXaQSFksUFAvGiESE541TRN7GJtSalubwg47X4fKQ/D8Rs47SytwxMc9wXpLLa5X8mk+Zb2U4ZxUx1Iz53XV6trk1m0E00DbHJ/fhVMlMK8swsans3hJwNGANMEOMx0d5JpILRiZNeu6scgpJwsPuy+gjfgn4oOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 148e4bed-a380-4767-52ce-08deabd97e17
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 01:39:34.6268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avTjuMDrFbCyhb2GHJoavX4S22s423a086UbhHG3EtboGbwdBqknWCoupWCj2+04lRw25h8WhbI4YsBpxeT7YABlGkDDXKplgacuOQbg783iVf0IZmXYIwjMQqJJPONH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

On Wed, May 06, 2026 at 05:35:20PM -0700, Niranjana Vishwanathapura wrote:
>On Wed, May 06, 2026 at 03:35:06PM -0700, Umesh Nerlige Ramappa wrote:
>>For an LRC belonging to the secondary queue, in order to check if its
>>context group is active, we need to check the LRC of the primary queue.
>>In addition to that we want to compare the secondary queue position to
>>CSMQDEBUG register to check if the queue itself is active.
>>
>>To do so, store primary LRC and position information in the LRC.
>>
>>A note on references involved:
>>
>>- In general the Queue takes a ref on its LRC.
>>- In addition, for multi-queue,
>>a. Primary Queue takes a ref for each Secondary LRC.
>>b. Each Secondary Queue takes a ref to the Primary Queue
>>
>>In the current patch, each LRC in the queue group is storing a pointer
>>to primary LRC. Both primary and secondary LRCs are freed only when
>>primary queue is destroyed. At this time, all secondary queues are
>>already destroyed, so there is no one using secondary LRCs. We should be
>>good without taking any additional references.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v2:
>>- Store primary LRC instead of primary queue (Niranjana)
>>- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
>>- Document/Revisit references (Matt/Umesh)
>>
>>v3:
>>- Drop the reference logic since it's not needed (Niranjana)
>>- Move lrc->multi_queue initialization to a later point (Niranjana)
>>
>>v4: (Niranjana)
>>- Set lrc[0].multi_queue.primary_lrc in xe_exec_queue_set_lrc
>>- Set lrc[0].multi_queue.pos in xe_exec_queue_group_add
>>- Include primary_context_desc and pos in snapshot
>>---
>>drivers/gpu/drm/xe/xe_exec_queue.c |  6 +++++-
>>drivers/gpu/drm/xe/xe_lrc.c        | 14 ++++++++++++++
>>drivers/gpu/drm/xe/xe_lrc.h        |  9 +++++++++
>>drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
>>4 files changed, 36 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index 62a75c8fe72f..4647a24dcffb 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -275,8 +275,11 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
>>{
>>	xe_assert(gt_to_xe(q->gt), idx < q->width);
>>
>>-	scoped_guard(spinlock, &q->lrc_lookup_lock)
>>+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
>>		q->lrc[idx] = lrc;
>>+		if (xe_exec_queue_is_multi_queue(q))
>>+			q->lrc[idx]->multi_queue.primary_lrc = q->multi_queue.group->primary->lrc[0];
>>+	}
>>}
>>
>>/**
>>@@ -907,6 +910,7 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>>	}
>>
>>	q->multi_queue.pos = pos;
>>+	q->lrc[0]->multi_queue.pos = pos;
>>
>>	return 0;
>>}
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index b31525bd2a4c..3def999ce48a 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -2466,6 +2466,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>>	snapshot->ctx_timestamp_ms =
>>		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
>>+	if (xe_lrc_is_multi_queue(lrc)) {
>>+		snapshot->multi_queue.primary_context_desc =
>>+			xe_lrc_ggtt_addr(lrc->multi_queue.primary_lrc);
>>+		snapshot->multi_queue.pos = lrc->multi_queue.pos;
>>+	} else {
>>+		snapshot->multi_queue.primary_context_desc = 0;
>>+		snapshot->multi_queue.pos = 0;
>>+	}
>>	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>>	return snapshot;
>>}
>>@@ -2521,6 +2529,12 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>>	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
>>	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
>>	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>>+	if (snapshot->multi_queue.primary_context_desc) {
>>+		drm_printf(p, "\tMulti queue primary Context Desc: 0x%08x\n",
>>+			   snapshot->multi_queue.primary_context_desc);
>>+		drm_printf(p, "\tMulti queue position: %d\n",
>>+			   snapshot->multi_queue.pos);
>
>What I am seeing is that LRC snapshot is printed along with exec_queue snapshot.
>The multi_queue position is already printed as part of exec_queue snapshot.
>Besides, as multi-queue primary guc id is also printed, one can easily get
>the primary context descriptor also. So, perhaps we can remove printing
>these info here as I am seeing LRC snapshot is always printed along with
>exec_queue snapshot. Sorry, for the confusion.
>

With that taken care of,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Niranjana
>
>>+	}
>>
>>	if (!snapshot->lrc_snapshot)
>>		return;
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>index d280e6572398..d0deb916e4f1 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>>@@ -40,6 +40,10 @@ struct xe_lrc_snapshot {
>>	u64 ctx_timestamp;
>>	u64 ctx_timestamp_ms;
>>	u32 ctx_job_timestamp;
>>+	struct {
>>+		u32 primary_context_desc;
>>+		u8 pos;
>>+	} multi_queue;
>>};
>>
>>#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>>@@ -91,6 +95,11 @@ static inline size_t xe_lrc_ring_size(void)
>>	return SZ_16K;
>>}
>>
>>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>>+{
>>+	return lrc->multi_queue.primary_lrc;
>>+}
>>+
>>size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
>>size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>>u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>>index 5a718f759ed6..0a5c13ec2ad7 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>@@ -63,6 +63,14 @@ struct xe_lrc {
>>
>>	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>	u64 ctx_timestamp;
>>+
>>+	/** @multi_queue: Multi queue LRC related information */
>>+	struct {
>>+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>>+		struct xe_lrc *primary_lrc;
>>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>>+		u8 pos;
>>+	} multi_queue;
>>};
>>
>>struct xe_lrc_snapshot;
>>-- 
>>2.51.0
>>
