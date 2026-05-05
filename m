Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCEBFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C15C10EBDF;
	Tue,  5 May 2026 18:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Icod5YKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECF510E0C6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778006713; x=1809542713;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B+BaD4zHBrkZAstXvOM3H/TqcUyHmpj/oR9dsoVmt5s=;
 b=Icod5YKufIU3GwzpMeWBjJcmiE4MQW3IPg4nuxrKHYosVEKI0SXaX7E8
 CZ+4D2vfoLtdRpE6vLxMJd8kOlzScQNEg6Z+J7x20q9xseVE5hrckwZTa
 Bl8uDGVLd2IK/VHmxvrxg0bjBcHa2QvJtX/cN4k4KTw6RBmzCsEXYbgr9
 6gWfAYlYnJnO8mYnsBCamh2OEOQblcQu487mDjcSEtNyKPo7RYT554Ojc
 saPsYACwxkcnl9n+gbMAm+vjHa7hQoiVMSWNJJljOAvsnFUm7mz2Yk7X3
 5EFmHxDr4nTs/LKDOQzysktagwENQC1FoVb4kMDFZCJ/TzDXNL5uXCLGi g==;
X-CSE-ConnectionGUID: kDdCoYPuTkaTC5VHfaNCFA==
X-CSE-MsgGUID: spOghgXFRg2qxR76z6tZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78938557"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78938557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:45:12 -0700
X-CSE-ConnectionGUID: iMkzFooUS9W7KFQ8qXIlNw==
X-CSE-MsgGUID: YEeHd7AKRU6S5LNEP23I7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="259243640"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:45:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:45:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 11:45:11 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwMBf2EuugKyQbwHCD1zdfSJIm9DEH7Z5SNb5MrwiT0qMQK5qI95kMabVjB7kbtRy3IDwXZ4KXEDzoLrjt/FMXebRFAP1ZFVzaXIf7Gu2E42oh9vC95XW0JvuUyorMh9I3d8xdvtQLj7MxTAJXJ6aZSzO4wsUS/Yo8zn23TOCm6F2MO0e4bcwaGLyEBCELzhP1H2We1fTPTFn/lFkd52xXm6xs3IRxtALlBgFiI3o7WfdkTq5OMBiaRKaajllBETltaS5wf1M9ELoLmUbinYZqnCPkP4Gji/HZWg1OapgKj6aHgklyoBkbsRSzZyxKyrlM7emiSMPsggUGoi/rud5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5HdvFYtNTy2y/kBCC388cz5eDuutBuEbTUfvnHmTkU=;
 b=SdJ7tv3a0moFoh+J3JbOkxePetLAMnRPoEdohwtLukrUs24/Yt4H1cqFFWVDw3diNroGHz5+ANzSAi/OVvFkubsIfuMV02EUDrFpD3MS6g+eZAl4J8REDE2qcfXaOHQp5zdmk+0COqzdKZDzOsGiT5kt4VNGkHkOKDRl3+P6FZYqYD5TIKsN09cphhGxUeO0EkWo9usb1inxh5XoUJBZX1+ts2o6w24iNtajcqKHe7qmXs7glVv2frrCJDjU44C3EDrAWSSwxVLrc8neXu11YkRSTCSGRCxBK6uXIkhdIMHOj/lqhT/DVW3wLvMxK4V8xGyQj5FyQKAlYAhnYhRKDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 18:45:04 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::715e:202c:8b30:1f56]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::715e:202c:8b30:1f56%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:45:04 +0000
Date: Tue, 5 May 2026 11:45:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 3/9] drm/xe/multi_queue: Store primary LRC and
 position info in LRC
Message-ID: <afo6ru4u83dDRJFC@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-14-umesh.nerlige.ramappa@intel.com>
 <afloAo3OMhrZxVMK@nvishwa1-desk>
 <afo4axPANAfvgzW7@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <afo4axPANAfvgzW7@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: e89bba66-ee05-4aa9-b7bf-08deaad66bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: iJUAerBJE1O1VLQzZeuLS1M3/82SrelA9jXBG66qUkHDl8+jU5gnucnd0oP2I6h464uqtspf7xdNDKpKVvS4fvtStIWlk3ctpNS6eBrqjrex0+KZmQbxmva8Wo1974At+QbQUJguSrtsNGaKUyZVVsKb/Cilk7qux7++gfcLbWAQkiAklJu7JIQunwTpD83+gq8O+qkTGCpsa2C6xdg+N3LOg+u9Uzryh03yZ15kffACDK95YzzrHIG/ujtcq/NoRVyKcvf+H9H2myCOrfVvkF4+RtXadXDxmaQKLUgDiFFkf/NTpsnP1s5XwWQrzSKqOtGdLgtYE8clQJRHCbaWnllU5FcqgZ6aANAVbjix/0zlM/p8pYTp1XXmQ8lpVW8j9+psIUodp6bIK39XQph+F8sFnGn86NHkRNRkyOfsXvfeVmHfYeJuJbVyocYBX8hSA/DOFrsSu/gzX+qZO1f16YLSN7uKzwnJwRYwCqgsekXGl+fMG8IghePVJGpzsKPeMqq1lDIipQZTYOMLLBHRrFKu+R2aX0aXWDXviTcLSofxBWcbdU4MC8euKHvAu4JpjY49pbc6hDmsdFZsNeC+U6tR1Yn9nDtNAmOTWJI6K1wE3L4JLjmtfYBrxgCH4oY+ZEOO2Cn3ifvshqlrzU05so+I2aSQ52O6n/EF6KhGTAR0yHd/hS3IwN70qw3Tzpdg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U9evYp0li6bGq4xbV2GrzOYagovrPkWhtq92K5HrV4lplXQsd/Wkijc8aoOP?=
 =?us-ascii?Q?q9pHyTg/YuanO0RLL5iOo5eosexN6gMeoETABHjIsXYIdIIh2IeTrdBHFKSQ?=
 =?us-ascii?Q?uBsKNvMskT+WdZ7rII00VwCu1K7jmhbZEpugicGcOtowyVjAfr3RNjHovipV?=
 =?us-ascii?Q?S+I+w9DdJ5unSMB9fSfbUd8+Vwm/P8vcAkF20HhAzA+ek2zJTpERFCv8Fgl1?=
 =?us-ascii?Q?dkxx2bFfXGZ4rreptsjc4z0XBXmESzsY219u/RlD2nhQQB/verBAP+ixSZO/?=
 =?us-ascii?Q?D2Z1tRg6hDoG9hPv3rBWxNrlqSdzXJO3UJDVkj5CJKO4qKdKXc/0auWpg0tz?=
 =?us-ascii?Q?B3xC7/6r37I4zDWwD/dLZTU2hQ3VDtyPAniIlITAy4p1bObDPtWNxvioTfbf?=
 =?us-ascii?Q?6LclYj+CzfQIDM4THC6l5zsR+1qB83sxcqyP4IYuJ/xlUAbz3dTDgiz+u7RL?=
 =?us-ascii?Q?WmOiQv6MpLsNIyVJvxVpW7Qxst1AI3ueq3rYUltEamoY8JEy4ZVpLGLhxN+h?=
 =?us-ascii?Q?CGKsKeymD/eYfuTIuMYDhjK1P/pAsbq12kdFTY8VGq8d9Vnm7s8ly/PGqFSI?=
 =?us-ascii?Q?ue7vcUsijXh/Uh3lk9vvPMTpQiToqHOcQLwQg10BxRQMaJvgNkHW3RC322mT?=
 =?us-ascii?Q?YWailQIPXaf+kl9C+hbeSsxg3Gaate4G/HMceI/g9aOdf09G1O8kaeIONBj2?=
 =?us-ascii?Q?RB/R/Rrc7wb4kFvHi3yWLXt6VXV4FzMTmhlPxg4D2blphzTkziu0Fz1nSY5w?=
 =?us-ascii?Q?sAtgwVai5aHR12BSnkUOzb9quKdsTt3srMPHLA4g9vWe7p504/iZYqz6fXN8?=
 =?us-ascii?Q?pWWb9nNWzw15jvMv7jDc7rEr293VILxm2GMjAhBnuQ6lE3NHI1VEeuts1Dt2?=
 =?us-ascii?Q?gCFb/a98G6cvrRPM0w86nRk7F0TqbJ59v93S13SuRYQmvuY57/UhpKP2iO/T?=
 =?us-ascii?Q?t/Yj1Cpa9uEf89NtopjsSrc/u99f4cp23nEHbF5VD1yOxGZH4zd45v33JH/V?=
 =?us-ascii?Q?/Z1yDHL8gKCI+3nAJs2gRmovLXpGpXPJv7uFrc/rCldfsoB5M4hYWDnlPQk7?=
 =?us-ascii?Q?Z65lp7UEYqfJAQdYvuDoxSpENlsTKHYq8sDm51qtenj9jIEq+Rnv7VTXLNkX?=
 =?us-ascii?Q?fS3SrzpQRfq3hF6v6gvXp0kXNU+mDgGUj3FCpyShlVkvw+EPDwjjeBNxZDIe?=
 =?us-ascii?Q?n+Z779koXkPQ+k/ewbfm1cpNkMNtVq/2qrPqVe69owRcBC2N3aYWUQrr9vX1?=
 =?us-ascii?Q?FZ9nG3poYF/6ruoV9UNJOU16mr5Dns+MyturdgadriQ7f6r5pteKtM10Vyj4?=
 =?us-ascii?Q?dauXQiOGCNkvX2UlmeTmJyq/i+HpwfMNB2ffpIJ9mo0ZRZyQWxVubNyW1zGu?=
 =?us-ascii?Q?4ZWtcw0bAIxRj8kAnQacoKswNv4D53vYcSeFcj8/VlV9spUjRVkT5r2S4OuU?=
 =?us-ascii?Q?K4QtUotIEblRth2moMlr6skMG8T7QEtJNjWehTCJsMarcf4a7DtQdU/Q2GiU?=
 =?us-ascii?Q?XpTyQCFuGjHp8YxoMwdfNz65EgXXGxlb71Jj0g4GIggJeEH8QCEojs8I0RB5?=
 =?us-ascii?Q?QViXdJDTKW9R86o4pTsK3UXzJqSAixP3BzgwakBkfGkZ669dZF9ixyKigM4W?=
 =?us-ascii?Q?R/xAnPm8YYMW+xBWu9/d/Y8g3bs80yz4/DU+c/QkFaqKoiHIl8JiJ0vJBC9i?=
 =?us-ascii?Q?p5E9ge7A7ZenNRA10CFW5z9i/Ih7pQ8sYhaHc+yLTrC4FCxz2LmtivaQ0Nf+?=
 =?us-ascii?Q?Ng5m9cNVyQv5ktfaQ9W4hSmoDu4p3PADyvYipw+hLD5RUaflyPfj?=
X-Exchange-RoutingPolicyChecked: VtenLnTy79qEEWkBBxxSAxjC/4uTBENyynO/0zumxH+v63Z590+89wXtyaw9r2eNUP68RQClpwRo1iKfuEFCvhSOY5AJSaPjlvD3ysn9ZZzKi7HpWi/BrFELuSM9pDM+H0antJgzLlSAEj9arsIR5baEmKIxL65PgWRa2fdZgc2mCx0c0vcJ2+by40MyxQH/XWe3TbzlNdGyqvPeeN6GDywhS8Rutw6GjhvdpWZEIliIKQS+61Z0qAkm2zpZnErnKAzOqp6PigEknwucv+D1mcuENrGwafQx4Wy4oJLCc/EOFgpN9WqtZ5tmSVb3W2QYG2dugrhN4aIlVT+u6QRYtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e89bba66-ee05-4aa9-b7bf-08deaad66bd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:45:04.4310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQdGIicgmOEEEc82voiKvxAs6+tMH3cJ8m02lXuBvr45IiQ9pfLKTVOWdoxsMid/9UeVVBH/YJy15qOR+tcGnqwpmoZuSdGS9MMTLueSgPkO3e2X+n9rVXJnIcgnTxBs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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

On Tue, May 05, 2026 at 11:35:23AM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, May 04, 2026 at 08:46:10PM -0700, Niranjana Vishwanathapura wrote:
>>On Fri, May 01, 2026 at 05:53:36PM -0700, Umesh Nerlige Ramappa wrote:
>>>Given an LRC belonging to the secondary queue, in order to check if its
>>>context group is active, we need to check the LRC of the primary queue.
>>>In addition to that we want to compare the secondary queue position to
>>>CSMQDEBUG register to check if the queue itself is active.
>>>
>>>To do so, store primary LRC and position information in the LRC as well
>>>as take a reference to the primary LRC from each LRC in the queue group.
>>>
>>>A note on references involved:
>>>
>>>- In general the Queue takes a ref on its LRC.
>>>- In addition, for multi-queue,
>>>a. Primary Queue takes a ref for each Secondary LRC.
>>>b. Each Secondary Queue takes a ref to the Primary Queue
>>>
>>>In the current patch, each LRC in the queue group is storing a pointer
>>>to Primary LRC. There is a small window of time in the primary queue
>>>free path where the primary LRC may be freed before the secondary LRC.
>>>
>>>__xe_exec_queue_fini(q); // frees|puts primary q LRCs
>>>...
>>>window where secondary Q LRC is pointing to invalid primary LRC
>>>...
>>>__xe_exec_queue_free(q); // frees|puts secondary q LRCs in multi-Q case
>>>
>>>In this window the reference in Secondary LRC is invalid. While there
>>>may be nothing accessing the secondary LRCs reference, to be safe, this
>>>patch is taking a reference to Primary LRC from the secondary LRC.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>v2:
>>>- Store primary LRC instead of primary queue (Niranjana)
>>>- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
>>>- Document/Revisit references (Matt/Umesh)
>>>---
>>>drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++++++++++++---
>>>drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
>>>drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
>>>3 files changed, 33 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>index b287d0e0e60a..e34601d28520 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>@@ -129,8 +129,14 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>>>		return;
>>>
>>>	/* Primary queue cleanup */
>>>-	xa_for_each(&group->xa, idx, lrc)
>>>+	xa_for_each(&group->xa, idx, lrc) {
>>>+		/* drop secondary lrc ref to primary lrc */
>>>+		xe_lrc_put(lrc->multi_queue.primary_lrc);
>>>+		/* drop primary queue ref to secondary lrc */
>>>		xe_lrc_put(lrc);
>>>+	}
>>>+	/* drop primary lrc ref to itself */
>>>+	xe_lrc_put(q->lrc[0]);
>>>
>>>	xa_destroy(&group->xa);
>>>	mutex_destroy(&group->list_lock);
>>>@@ -275,8 +281,15 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
>>>{
>>>	xe_assert(gt_to_xe(q->gt), idx < q->width);
>>>
>>>-	scoped_guard(spinlock, &q->lrc_lookup_lock)
>>>+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
>>>		q->lrc[idx] = lrc;
>>>+		if (xe_exec_queue_is_multi_queue(q)) {
>>>+			struct xe_lrc *primary_lrc = q->multi_queue.group->primary->lrc[0];
>>>+
>>>+			lrc->multi_queue.pos = q->multi_queue.pos;
>>
>>I think q->multi_queue.pos is not yet set for secondary queues at this point.
>>It is set later in the xe_exec_queue_group_add() call.
>
>Hmm, I recall seeing that a while ago and that's why I leaned toward 
>having a lrc->q (back reference to the queue that the LRC belongs to, 
>but that's prohibited). Anyways, I will try to move this logic outsize 
>to a late point then.
>
>>
>>>+			lrc->multi_queue.primary_lrc = xe_lrc_get(primary_lrc);
>>
>>I think we don't need to get/put the primary_lrc reference.
>>Each queue holds a reference to its LRC. The secondary queues holds a reference
>>to the primary queue. So, essentially, the secondary LRCs are holding a reference
>>to primary lrc. So, I think, we don't need to hold reference again.
>
>I would look at the queue and LRC as different objects in memory.
>
>In taking a reference here, I am addressing only one specific corner 
>case:
>
>- Consider all secondary queues are freed
>- Since primary queue holds a reference to all secondary LRCs, all   
>secondary LRCs are still in memory.
>- When all references to primary queue are released, we end up in   
>xe_exec_queue_fini(primary_q).
>
>In this function the LRC for primary_q is freed first, and then the 
>secondary_q lrcs are freed, so there is a small window of time where 
>the reference from secondary LRC to primary LRC is invalid. IMO, that 
>small windows of time is enough for strange issues.
>

By that time, all secondary queues have been deregistered and destroyed.
So, there shouldn't be any secondary LRC trying to access the primary
LRC. May be we can set primary_lrc to NULL while releaseing LRC reference
which should be sane enough and we really don't need primary_lrc reference
taking.

Niranjana

>Umesh
>>
>>Niranjana
>>
>>>+		}
>>>+	}
>>>}
>>>
>>>/**
>>>@@ -388,8 +401,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>>
>>>			xe_exec_queue_set_lrc(q, lrc, i);
>>>
>>>-			if (__lrc)
>>>+			if (__lrc) {
>>>+				if (xe_exec_queue_is_multi_queue(q))
>>>+					xe_lrc_put(__lrc->multi_queue.primary_lrc);
>>>+
>>>				xe_lrc_put(__lrc);
>>>+			}
>>>			__lrc = lrc;
>>>
>>>		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>>index 97aef0327fc8..3d0bf4a7bfa0 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc.h
>>>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>>>@@ -91,6 +91,11 @@ static inline size_t xe_lrc_ring_size(void)
>>>	return SZ_16K;
>>>}
>>>
>>>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>>>+{
>>>+	return lrc->multi_queue.primary_lrc;
>>>+}
>>>+
>>>size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
>>>size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>>>u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>>>index 5a718f759ed6..0a5c13ec2ad7 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>>@@ -63,6 +63,14 @@ struct xe_lrc {
>>>
>>>	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>>	u64 ctx_timestamp;
>>>+
>>>+	/** @multi_queue: Multi queue LRC related information */
>>>+	struct {
>>>+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>>>+		struct xe_lrc *primary_lrc;
>>>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>>>+		u8 pos;
>>>+	} multi_queue;
>>>};
>>>
>>>struct xe_lrc_snapshot;
>>>-- 
>>>2.43.0
>>>
