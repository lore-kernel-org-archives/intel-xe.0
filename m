Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B5C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED3310F11E;
	Thu, 27 Aug 2026 16:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax+V9+IX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7053C10F11E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849942; x=1819385942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EmZhGtaOzMRYjwv11sFaxwjsa+ghGqnogXufK3W4UxU=;
 b=Ax+V9+IXh6OKdgIf9uK6/EKm2IeVmXmdISMsybw4aqGDeofHJLfzsmqj
 67MwpdUBZnzfbaNKtlagriZWXt4macZSIYtFLbO/DUoJNKNG0hifS0IkJ
 hRodMar1d5pPt7b01YrPyw8xIlGDlxcr4niB5CscIo7Et4hgHGpc+5fiM
 dWdME9jE3TgjCKoZ8zVWf03g2hfQwgZN8o31xdBKlcL2EUuTq7vq5FYbz
 +RSA78g1fLypM9nCOgmo3ajavFzHi8/B/UTZR34EydNjC3PaKzwawywse
 4qij6OFEOpBjQqwkk5JrfPx8X3X2HXzgZ+lzMIkEiVxq4v1H+d1WyLbk0 w==;
X-CSE-ConnectionGUID: d5hvB5zpRQqlQOSJ97wIIQ==
X-CSE-MsgGUID: MPCULlr4RqK7haSK7/5d3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="98953545"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98953545"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:59:02 -0700
X-CSE-ConnectionGUID: rvTiMzArSUi63QPrxkuI9A==
X-CSE-MsgGUID: T9ZMDcR8SaG2GBFV+49Dog==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:59:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 09:59:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 09:59:01 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 09:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrzno5tutfe8KS2BYTjhI3a+PTQYqBFqqEnIFLLfYgfhwEi3CBI1/yzyy7cudJRfnJ3YADJzYxB45aGvfXL7Q7p+9KrVM4Z6NqiKoJPt6qYDaD3pXQErFPo5gQiYz0oJQQbvY31WPvsrIdKueDRVFFAParkRVMe0SD6eCv9PR9r4ugrNKRgUorbDYEfQ58FPZS6YdbE2fTrv8KHJtI7C40G0ZVj959jxzoOZRWq3FKvjZwTr4YmYnrrHazmT2iak4Ut3xAtw+1DRGp0zvI+L7z+YItZ97Dp5Pz6aXRXy06RDsXy1G/+Dn4EsBCTRY3bkMXLdBoJykc82yv8+KwVrfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ATS05c7mnMzInE+k4QmXbLrKf5R4r1e70CU5jpfQSw=;
 b=xrRWZtc9T2pIqYiydEVQDN7kRKwVyZOvg5QoxCeFF7pP3+iXKXOkHi2vLxj592zzeqcFlAtl47uWjtBU2oFjH26mbLrwkN3/sidPoy/xGGTdkY1jKyZIulY/wTjpxKh9nRGiqGfKZhEq5GpGeVmV6Gt3iprNmjRoDdtXilXq+guX9D728PNeY/h9vpZAJGwQycZ6X7ymJtt478bZd9bfLEHOJRffvbs09VCGKNFTuw1b6Qqrn5DWpPtOxsDqmDkaU3FUt9syp1q+cp4xG/N0H5fiSFSEGsQLD4zZSpbP8ydnZK7vEED2flROiuqCcgcgeYZ95/D8QKSzdDwZTmiX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 16:58:59 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%2]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 16:58:59 +0000
Date: Thu, 27 Aug 2026 09:58:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Message-ID: <apBs0FYndOJF1wVt@nvishwa1-desk>
References: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
 <20260827082011.3370672-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260827082011.3370672-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b631b84-bf6f-4651-96ca-08df045c7d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 3Q0CGRjVAB0xG4vOGjhr4Xh24byQiQL5YNENAajMhKseuFkNn0xSVghVrnf/bEy+UFuWK2jfJd+PT1nQpUafTDQY9nOIObXAMw/bXtIxjYTtELNcBxcCT5YPpNkP0/SbzjwdpedHsu1YW/xHCZEAGk1N7jARy6LsZCKIxdPdur++7Cm5GZrClEfSLXKeMDZe8ZX84rtdPiD+jfsZ+yrnwMPrQoeAmQaN0gEpwZaLsR1OKcW1TcTqX+72mSRQ082vMdy6ZqS6ENik0h0EdhLglVFbtrMICBTHU8Qsc+uRVMd4E6TTBm1dGcvFSYAB4VzMOZLt5uCYZSEYL/aUUgX8FF+tx3oVn0E6lnNj9gKu4FzXL2nzAWsbliXGTR+Hds/4TwkwR2+NdHCY/S/BFlddX5vMnXD3ti9Sn6JG4KLd6WeuXWeOi1StZxkuRfr186qpZfFXWPNJuHRmMcMg8WAlsF+QHW2JRLp/VGXfxTkM6DJFmUNHZMzp01psFB1/QwuuuVh3bHIO6TPw1+WU4fpoSbmFSyMuDa8KuHpPStb6dMP3SWM6oIdsbQ58NlPRMFE71WMKC/fiyP4LCmq4+AXd+qE/FEhWPWmWhu2EyepJ71k2u/IFw+QMj1XHb+l0gRVDyAAap+lHq6JZkPZWfj+bZL5widbUOiewfbWTLp+I264=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IQjiISjMRg+xgdFzPNdQWLjgEAE399XxXSrSgLAA/MALoSOmCTiwVArDIT38?=
 =?us-ascii?Q?JHQLlPhKAidtPCkXAtiolLUJcSfFCtsggAgR1x0++1r87YlVLIs7MlWEXTY7?=
 =?us-ascii?Q?KhRr7v3Rwjg4c4Z5KCNqx13B1eipyVuEafk5uwiJMiUvI0EAnKrcvEkAwBmA?=
 =?us-ascii?Q?dihp8vjLvi/sLQYbTmM2RNBM8wf9kintGfTUidSNcVvJxiVoeIYvCaEWrETs?=
 =?us-ascii?Q?tTKaLHxcaPtNTCTXEPUi0VjHi2Uqp3vilMZKd0eRPJ5GbdCSXIEjnhSp89KU?=
 =?us-ascii?Q?UgJ8D+3M5oQuyjOL84SUlUCvnFJM7yDmxzuH2APZxUAVnCgAkq/BfqzWGFr0?=
 =?us-ascii?Q?O7GlQeVSrcR+uGglQ914S10jHcYai5TGhiAdkhD0zrgiuqgB0Y626Z66Tgqi?=
 =?us-ascii?Q?/icLnrIxm0Z52nLQNPATKucfdUiKOvn+VdZUTzWlSY7RI6ND3uP1A2vAJgVw?=
 =?us-ascii?Q?Q0H9t+gMWUdVLj1+Xhm4b7BgGEHaawOVx3LvXVbPTb42nPUWVnKy8iU4wCzm?=
 =?us-ascii?Q?0qMVknzSOHPoW0K3pz5mzAOdZoL9cw823VbbVzUmhnUCAsdXGvbp0sz12ZU0?=
 =?us-ascii?Q?bfgQEXyXtSDF8GIMCOVZsj7/5ldVhQKHdKVoF/QlWQ+TSKinamKDLx3roOL1?=
 =?us-ascii?Q?9BlZG+3KmIOE2TOFmJv2iJOJmel+uh6esrOhn9hGEqbweXU1iqKgfXGxl4LW?=
 =?us-ascii?Q?De+kGUIQ0zwd1csg7VJjeGyYKgyl31QIsarrENF7am6twrufUYpe/r1E9PZ+?=
 =?us-ascii?Q?UQgZfablyS8Hl++Oe9PX/7t00m8VedXJB9eDevuFUNOUjkxS9XUB2v4BRL/8?=
 =?us-ascii?Q?hjblwcecZxku0q5n2a4cSfk4IMyf9P+GVgP/S33twAjHEbgr9QT33hukAglv?=
 =?us-ascii?Q?hq3QzPMxUR8IkzMIb47MSIDOTfshAGnIkWeb6e4ZDf5MjLU+xvWN6AirmE1u?=
 =?us-ascii?Q?I3FqO89FVpyCUPGwUFMQBxwWo1Wh6gr06UohDtwpxsbX95GAn1Xwj7mIfLvv?=
 =?us-ascii?Q?uxwXML7xblvyPOiXef9vK/rwpE6DBJw67NusnSklD66gKIImBb1y6tHWI8Qu?=
 =?us-ascii?Q?gmEYcTU3s8NvSeDsiR8yM07tG72YY/sflGTKIr3sAE0xzpX6TeoycLMYfqqp?=
 =?us-ascii?Q?dAwGWEeawX96bZPi9xg2ZPOlYbGyef/6xk49rf/DRowfs3zZK7CQPLe9oe21?=
 =?us-ascii?Q?KweOPdVd12Q3Dxv2VNRFrIhEx4Bb3ASroxPNsWTq5QGlPxK+Vfwa20PtjTEx?=
 =?us-ascii?Q?XQh7u+72d5X6v/J3G+I+/LoE4ASFe2U5jP5AC6MAKFyaPh2KV6WFc8yPM1I5?=
 =?us-ascii?Q?KxDC1woh5GYmbK9vkWFP5AovTnxZ3SNccoSHldzzf1opfkkLL4A+J1JgU3wk?=
 =?us-ascii?Q?FYrh6UtQNZQTO2F7S4wyE8V4z0IfF0UIvZU4rINmauJtmd01eAzmvWH7kYrt?=
 =?us-ascii?Q?eXV6L+sSLAPDQKpYhF6uFu4qFZRtyjxdff8G2s0Yh8MfutAfDqqE9FA0J+7z?=
 =?us-ascii?Q?8o7Gy2cqPsapidnp/roIbtVLz8pjO6RzQaxV6x7vvcd05COo812a1Vq+pCsa?=
 =?us-ascii?Q?ydaEd8M/UTnaAazgTLaKjDF/GSE6sbGBvYwqYCkc85ps3WuVsAKfAl41elRc?=
 =?us-ascii?Q?WEabVSIqcGOU8MBmepeebYaeMKr4exnIAcxvd+t2RXPC6T7EWOOZlUxZBNPf?=
 =?us-ascii?Q?8yeQuW4C+PFAAL6GrTL+Lg8VkmgcYgE3oH7s/+3ASX/OL5uh4rt+tSGqC7Ub?=
 =?us-ascii?Q?xihzXYFidHOglyF+JAkDXm3bHLUlyHX4v8SmvmitJDRAthQ2i4vU?=
X-Exchange-RoutingPolicyChecked: dJQ1XDex/jJVxvriDQBEoiE8PDuBMICy9oVi4LiRA19XuxEKOEMAi5GwUO7mpBx0NOLZtEBSUCjLwa8iMnaIkQaFHOIIFdEGmSg/PozFn/xZn3dYzvvSswCClryNE8KPjGAvOXi8DdfTZlvbboJ7QVaWU0NZZpwgzkEuarp5uMLbo6JlL1YlBx3/EBzNb6fcMWgWxhdQshQzZikJalY/XqJjD+16TM/UUHE53XwEU5j1A335+nDLTjpU76MKaTvf+Wm/C2K8m5ybmg6xm1pKzYbJ+PSlhyUeI+j4h0BizHb945PsS759leNVOYibsWA4YvvawtkdpaNluinr+d5POQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b631b84-bf6f-4651-96ca-08df045c7d04
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 16:58:59.3063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y+BodOrRLzDU0CHpfcXugow5788G2fI93X3m6FE9dS2yB2FpS8bE0/MZktQ2z3BPYyQB2xTdOV+gsWtiXW494r3RWiDArP3Wmg6C12Ou+XsQYnDyGsDn5IGdPsA1Qbh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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

On Thu, Aug 27, 2026 at 01:50:10PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Add xe_tlb_inval_ggtt_full() and its GuC backend
>send_tlb_inval_ggtt_full() for full engine TLB invalidation
>within the requesting VF across all engines.
>
>v2:
>- Refactor with new helper xe_tlb_inval_issue_op_wait() and address
>  nits (Niranjana)
>v3:
>- Avoid TOCTOU issue around CT state (Matt Brost)
>v4:
>- Propagate real send errors instead of masking as -ECANCELED (Sashiko)
>v5:
>- Handle -ENOTRECOVERABLE (wedged), drop redundant -ECANCELED
>  (Matt Brost, Niranjana)
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 29 +++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
> 4 files changed, 76 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>index 046d0655122f..111fef781b2a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -98,6 +98,33 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> 	return -ECANCELED;
> }
>
>+/*
>+ * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engines
>+ * within the VF.
>+ */
>+static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
>+{
>+	struct xe_guc *guc = tlb_inval->private;
>+	u32 action[] = {
>+		XE_GUC_ACTION_TLB_INVALIDATION,
>+		seqno,
>+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
>+	};
>+	int ret;
>+
>+	ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
>+
>+	/*
>+	 * send_tlb_inval() may return -ENODEV (CT disabled at cold boot) or
>+	 * -ENOTRECOVERABLE (device wedged); nothing runs on the engines in
>+	 * either case, so treat as cancelled.
>+	 */
>+	if (ret == -ENODEV || ret == -ENOTRECOVERABLE)
>+		return -ECANCELED;

I am not sure about ENOTRECOVERABLE check here. Other invalidation
functions don't have it, and I am not sure if wedged is considered
mid-reset as the document for tlb functions says for ECANCELED.
I saw Matt mentioned that ENOTRECOVERABLE check might get a revert?
I will leave it for Matt to review this part.

Other than that, patch looks good.
Acked-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>


>+
>+	return ret;
>+}
>+
> static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> 			     u64 gpu_addr)
> {
>@@ -346,6 +373,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> 	.all = send_tlb_inval_all,
> 	.ggtt = send_tlb_inval_ggtt,
>+	.ggtt_full = send_tlb_inval_ggtt_full,
> 	.ppgtt = send_tlb_inval_asid_ppgtt,
> 	.initialized = tlb_inval_initialized,
> 	.flush = tlb_inval_flush,
>@@ -354,6 +382,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
>
> static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> 	.ggtt = send_tlb_inval_ggtt,
>+	.ggtt_full = send_tlb_inval_ggtt_full,
> 	.all = send_tlb_inval_all,
> 	.ppgtt = send_tlb_inval_ctx_ppgtt,
> 	.initialized = tlb_inval_initialized,
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
>index bbd21d393062..7c3bf32d9258 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>@@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> }
>
> /**
>- * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
>+ * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and wait
>  * @tlb_inval: TLB invalidation client
>- *
>- * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
>- * caller can use the invalidation fence to wait for completion.
>+ * @op: backend invalidation hook to issue
>  *
>  * Return: 0 on success, negative error code on error
>  */
>-int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
>+static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inval,
>+				      int (*op)(struct xe_tlb_inval *tlb_inval, u32 seqno))
> {
> 	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
> 	int ret;
>
> 	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
>-	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->ggtt);
>+	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
> 	xe_tlb_inval_fence_wait(fence_ptr);
>
> 	return ret;
> }
>
>+/**
>+ * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
>+ * @tlb_inval: TLB invalidation client
>+ *
>+ * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
>+ * caller can use the invalidation fence to wait for completion.
>+ *
>+ * Return: 0 on success, negative error code on error
>+ */
>+int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
>+{
>+	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt);
>+}
>+
>+/**
>+ * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within a VF
>+ * @tlb_inval: TLB invalidation client
>+ *
>+ * Issue INVAL_FULL (intra vf) to flush engine TLBs across all engines
>+ * within the requesting VF.
>+ *
>+ * Return: 0 on success, negative error code on error
>+ */
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
>+{
>+	if (!tlb_inval->ops->ggtt_full)
>+		return -EOPNOTSUPP;
>+
>+	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt_full);
>+}
>+
> /**
>  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
>  * @tlb_inval: TLB invalidation client
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
>index a76b7823a5f2..665072b4b81d 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
>@@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> 		     struct xe_tlb_inval_fence *fence);
> int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
> int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> 		       struct xe_tlb_inval_fence *fence,
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>index 3d1797d186fd..d77be1aedc91 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>@@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> 	 */
> 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>
>+	/**
>+	 * @ggtt_full: Full engine TLB invalidation within a VF
>+	 * @tlb_inval: TLB invalidation client
>+	 * @seqno: Seqno of TLB invalidation
>+	 *
>+	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>+	 * failure
>+	 */
>+	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>+
> 	/**
> 	 * @ppgtt: Invalidate per-process translation TLBs
> 	 * @tlb_inval: TLB invalidation client
>-- 
>2.46.0
>
