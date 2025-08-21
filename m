Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210F1CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 22:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12D610EA3D;
	Thu, 21 Aug 2025 22:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9r9KUMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C63E10EA3C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755814399; x=1787350399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vEC8QvyKKgm1yMkOqdpVco6lgB1OowONjTPHuCtYwJY=;
 b=V9r9KUMXBOU2CrINI4pCvi9m1FoPT7WmZacXvofPMqN6L827iyt7s2pX
 7aWpxMk8iE5GmLP7/6Gg0ImeRN/PQ/8WPy1xUqMlZH3TxnBqOBi+JQoY4
 XTfaNBjWq+JV/GjybRcUiSKE+zqx/A13ZebxgEly4zKCmvdx2YdTgTc3j
 tc/5ZO73AmcSAGZPfBzT+GQ06KuLbefERXxSHQjmBNsVT30xMaDg4jrN+
 XxtV+64GmHd737lnTZ9PlvEbkhR1el0DUtAJ7Ty5iAuuS2kjwx2oLajtN
 5O32yJP9PZrKavgRzN7NpyLRWlan4KbTsyyevfskCj4yGPvjcwaG5M2ef Q==;
X-CSE-ConnectionGUID: HdLN87EWTA6/rcbOxdFj6w==
X-CSE-MsgGUID: dlM8NOVRTQOnV69BEEpXfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57140910"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57140910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:13:19 -0700
X-CSE-ConnectionGUID: kASUEbF1T7Sim6eeOjVbRw==
X-CSE-MsgGUID: EuuBw7CHSQe4mbKybZC0eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="167766447"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:13:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:13:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 15:13:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.54)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgWjtwJ92thWof6ibN94/a/ss3HUOQgHXF+siNTR0reSMFIwOQN2NY9TWQEqG0K0Fouh7DJzytF3n6Hmh3NsKqCElVuZav40Gy/lXyuenSI0UBP2PgNblxO627xZPyK/fZhTy1WjmZ4bPQicyN1YeLcvr1h2RtC70Yva6vqLbSIsJ3xI+PsWaRXNc6hO5p+jq07T6W5LdgDDR1TGkfPCFdCTMjIbiVvuVvrBAW+zvepCrruKEpoG0K79DuIFGpqVm5imuBzKUQlBHeReq1Nag33Ia3tHyAJaxzdTjQSSQ5IvRcN098fFzV3nwAkfcvClwsbEIQyMFkFM3Q3O45xjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVnhkLQ8sBgX1lCwMqlXmWbDn46BMA8nfDp8w2cjDVg=;
 b=UTqEpzcCYckCWl8tbQfEcM+78qXCGl4OTjtKet1gL/4VuX+2E6fcWqIZlM0/j2akmB7davOlWJdDclc0ehjvhgNqzyuTLlpOCSSK9c1oQiS2RfO7FP32wJK07k5AeaCvIIEC8rcwBJF5KMJI3yw/VKzp7Pf/RZ+MZmIUMzFlxIUhdUl25ZzK9iIgfkcqYEPlhTkZUsrYvStKaT6PRfULuGwOix2kH44RWBwo5Wh1jqL7nNKgcpxpCZeqliJbF681cwF6Xc7ME701LGpuNm0GLjPKtjLFJjL5rFVzxoyFenELbFD0moriYG82QjE7QlOywu08HgZd7PdQWaM/hWe4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 22:13:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 22:13:15 +0000
Date: Thu, 21 Aug 2025 15:13:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Message-ID: <aKeZ+JZ3j6hm1vR1@lstrano-desk.jf.intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
 <20250820233057.83894-3-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250820233057.83894-3-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 64dcb002-2ec6-452d-5ad4-08dde0ffecaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T4kECKrhZRpa88HJqYQGvYjps5bWG2+wjEn6sB528DjPMYFgKnt6npUY8PUC?=
 =?us-ascii?Q?LLNTTCtbAoqyrNoyrwzLmdGs06j60E2E5QZ1EHCdu+036SqZR57SAgcSlcHj?=
 =?us-ascii?Q?AGcUf3TyFolkcO64DKje8DDgLNuXepOJtdDW7eUCQjOrmcC7fhgCdavc0hJK?=
 =?us-ascii?Q?MWGf55NfoOtZabQmJrFAUveAQxvAJdzrAfhnw7dtjws31fcKmquy6U3NCk0g?=
 =?us-ascii?Q?9AYcbEkSZ7ESx8ifbvOnQvAunwbGTjqxJ3atTYpG1353/Jrf4TRw5LlXiEdn?=
 =?us-ascii?Q?htbN6qdkV0P/wnfvIoYnWZyz2Ir11S1/8ghwIcdZHDTiohZgZ5RCLo56sT+S?=
 =?us-ascii?Q?mmzltxzGQOHyrqvhaJMaA9ezYVLDfafMQYdhXG0m2NZ0a4Hru9Gfx/+16gcI?=
 =?us-ascii?Q?NmrlYPpdw0bt22jXYBlXpiUAPh2JIZIQl6Zlvr2Vsldmob3d0quHQcpFP5iQ?=
 =?us-ascii?Q?ph3c/wWTEqzIn929lpigow2WdNRUJt7h7HItyGUb3fHn/ljCsArmY8BeLGoZ?=
 =?us-ascii?Q?E2VE56jYwIXLgoFHBFmFHJ4cfvMGoyyNRqKdVKNUmHyLE7PqTaTfhAL6X4XG?=
 =?us-ascii?Q?O+ZFtFF2IEWQcuvIHQEimn7MCl+2yk9gHiYvU9ExxmfAtInTkDQ4aSdS3gsR?=
 =?us-ascii?Q?YufsfrQ+QGHynf2UY7P/e8FtiKYG+IiB/hReWHA/g+jAcaJEcVgpi352lmdR?=
 =?us-ascii?Q?R5IzZ8UJTxbi5U/decxZfMPpreP3jAfjyFb8ZRHxDaMh9qgR/hMgttYpGLuB?=
 =?us-ascii?Q?lVhpcXRJq0GRtsBDxtDxa60O4oPoQuHT1fDJVAZ3+kCV4weusOvE9OUaQlko?=
 =?us-ascii?Q?hS5hWeub01rmyI6ykIgzpP9oF3Qt/08RFU6n54BjxLZfTJjrDCBz8TBUBVUH?=
 =?us-ascii?Q?tPljNU3OvcYLXIaxSnqLPqqltyfx9XnKh3dvxANrFuOOlRPqlpay3uSr558p?=
 =?us-ascii?Q?7EBqIN6MydKI7Nnw9gC9szOhJ9zMIXlzJeI7Abzw6Kyc54YQT5j3ZWBo+EZ9?=
 =?us-ascii?Q?zyxRsdL2SOLUJT8p2qXtRLtDC1UPFQtk7rq7D6eAV5ehnYclmQ9btdKWTu0M?=
 =?us-ascii?Q?W2KG0ED81CxHfjFh/xrMhbQilC/4IGqKSQ12aehllL8rRwFkhTl+F+qKpBjs?=
 =?us-ascii?Q?42TzA+YRygjonOM3vzx/RLfrhJ3KqIMX0xr2+iAfDfgmf75VPukkgvk8W0VS?=
 =?us-ascii?Q?oZ21Xw/t7Np9u9CoQe8Qtj9s/JEr4XfPaxpgRWlJM91BQkSQlgbXa3/L5KnD?=
 =?us-ascii?Q?rEr9PEva3gGArFe2ZvC4tucBaaTcbuust0Y74hK+IOrmbNlOYDNr4M3is1fb?=
 =?us-ascii?Q?+NGS6bI5rSPNsPPAVKRLNl6o6/sYZ9Lr4DR6dHmigxzW5U95ebj/4wpmMuff?=
 =?us-ascii?Q?tp4SbacbeBYf9c+yFAwYyUwnmD5Qa1N5fIOP6+zbRbYrlVyIH2pg/dSJHodF?=
 =?us-ascii?Q?W5myWIbMfmg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zEcv9GfQurKQ0A3z3jEahLkxIyIT81tLhKj1CRD0GyC8alfqpybT+Qb+N/vG?=
 =?us-ascii?Q?LeDiQCghkXxTIo9F/ha9Ki9bp14d9FP/7DPyqUPtOn8/mtH1UcpAUskqiLrE?=
 =?us-ascii?Q?V45AW+0jX6DADN8o0wCu7IEl12xlZFH+TcMXPPBJkWdLBiRF0XePITVABDKT?=
 =?us-ascii?Q?auZzDiUgJ1hUvmNoG+KwplNhqk7W6BRZ6sKAZM0eAnBtNYRnlMS2MX8u7rMf?=
 =?us-ascii?Q?MUkn4qJRxCo+a/7hVN0HXgwnSWtMYDmB2IZI8VMm28ru05SDMllMN2PL9fzG?=
 =?us-ascii?Q?EOauq+aCawSt/ZWEgNbClFncldtubwCbUB5SQu9wDlojlqAaZULcW8Y47Tlz?=
 =?us-ascii?Q?0fnsWAAsd/IAal4ciL0jeou05JJymvFP65cd3iu3L1bnhentVCypOxV04U65?=
 =?us-ascii?Q?jNJNcfX0T1pckYVTAA9Tg74e3MDLXS/Hn74VrGxX1RVMbV++54ZfWN2vWgmY?=
 =?us-ascii?Q?mWng3NlbS+gPG9RB/dReN32tNmTSPVCnfVmIk33Rjs9d9kwNlIci7XJaDlQa?=
 =?us-ascii?Q?sTD321X+4lvBflYLT8kPUWMvSTTIMLgBhKeiOKSrXKoz8fbW8XiefYRPy5UQ?=
 =?us-ascii?Q?Dp4k7x7W4TpixH8oT4VuNt+l9oHqonqqJWLaO9E7tvlQ8YnQ91G8MIZA59MO?=
 =?us-ascii?Q?eYigEtlpyaDhW+ZpArFucxMhApcRISaV4kEFyEcNfDGwMoTygl3gS8gzPIM9?=
 =?us-ascii?Q?dRYxeDJAEcPXmzsFUsfgvkOW22XPnY73fcKwWzMKcHk+6wEGWvO7/3jKqqmP?=
 =?us-ascii?Q?cydzl2Lgm4jcJfMlL2LCmK53r6JF9BUXw7RXZXIn+Xb8YXrquoihp5oY46eH?=
 =?us-ascii?Q?yh/yXR4JtQBVZK4RGlOboMeijn5AtBw0VpdC9dL2Oz8ZQREAuz+TRtUhi7DT?=
 =?us-ascii?Q?mmh2gstF4+0ETdXPvDb5myHrG8k7n/+hGy/uUXTU/0z8qfSG2NAlagxPpEhu?=
 =?us-ascii?Q?fbyiJAhVDJp9TgR5hSsFdJLVcfAMysEsiz92lRo8SR5Q4kn6Daa/O3W5pQDV?=
 =?us-ascii?Q?f8DC1D5TpO01pkF9mS9EjZbIMoFAn7Spj9To2Vt9SHWaPgY+NXusLLXzaXFn?=
 =?us-ascii?Q?5nv69tj/Eem3Wper4wgbhs3QO+ynpUo6Le880ellP93VlmmdZoBRERKcJCf3?=
 =?us-ascii?Q?V5CNt0C26YfwyBeEUsH1tlKIOlPM3bGGIUywLR96QpEXXjuN1y1nuqDB+wSF?=
 =?us-ascii?Q?CuNPVBrXUbCJLd4ZMt7nspnJX/yUcUC0d9ZXuzuqGg/vBsCTWolTjdjnziX1?=
 =?us-ascii?Q?T2bfo4O3K6/ST++Ts+SzO3UiZxAfWIA8h/TkqEM7ck1FP2pGPWxUP1wqIMKx?=
 =?us-ascii?Q?Y/+h1iBfP4ib3nUmRBesznGhoJXjnQCBzBMtLsTEX4gB9vYR+C0WS4Ekwzvp?=
 =?us-ascii?Q?Fr/pWP3Zc5my/gXVbl7xieQeRwmjkNLP/pCy4L5yUpefpM7fMutsrhlmXt7k?=
 =?us-ascii?Q?Q+4tRGNaTFo6FHREpaaDP45sbDtxo8UsMOrYyKnd0YA4YyQvsh66iCml9cIn?=
 =?us-ascii?Q?DMZHXp39Gc2veYzF5X0tKsrj9OM8/3nI2wxbztyst5GMTDB1ffQv9l7HrBdw?=
 =?us-ascii?Q?BU7gA+PfeXgyyUqmAS6FwEEaZGXjcDi5htzRO/HPp9M0FFPh1dYvjnWlXiaJ?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64dcb002-2ec6-452d-5ad4-08dde0ffecaa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 22:13:15.0790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laXBVF1ABwTywsxNOiDDN8VL5vqpO0S/p/PsRalQmnKQlPSb1uCoqm2rIEAVOvlgX6B1eNrzIOb6b0oAhK7D0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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

On Wed, Aug 20, 2025 at 11:30:50PM +0000, Stuart Summers wrote:
> There is a small window of time during the driver teardown where
> the TLB invalidation fence->gt is set to NULL but an invalidation
> worker is still alive. This won't cause an issue currently because
> the tlb_invalidation structure itself is still present. However as
> part of a future refactor, we are looking to split that structure
> out. To be safe, go ahead and cancel any outstanding TLB invalidation
> fence worker thread on _fini() since at that time we are already
> tearing down the driverworker thread on _fini() since at that time we
> are already tearing down the driver and don't need to continue
> monitoring this.
> 
> Add a new _fini() routine on the GT TLB invalidation
> side to handle this worker cleanup on driver teardown.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c                  |  2 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a3397f04abcc..bbf3f4da7f54 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -69,6 +69,8 @@ static void gt_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_gt *gt = arg;
>  
> +	xe_gt_tlb_invalidation_fini(gt);
> +
>  	destroy_workqueue(gt->ordered_wq);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 75854b963d66..170f6c97268f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -188,6 +188,27 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
>  }
>  
> +/**
> + *
> + * xe_gt_tlb_invalidation_fini - Clean up GT TLB invalidation state
> + *
> + * Cancel pending fence workers and clean up any additional
> + * GT TLB invalidation state.
> + */
> +void xe_gt_tlb_invalidation_fini(struct xe_gt *gt)
> +{
> +	/*
> +	 * At this point, we expect any outstanding TLB transactions
> +	 * to still signal through the normal channels of interrupts
> +	 * or MMIO polling updates, etc. There could be some workers
> +	 * triggered as a result of timeouts in those channels, though,
> +	 * that we want to make sure get cleaned up during an unbind.
> +	 * So here, cancel the delayed work, but let the normal fence
> +	 * signaling handle the rest.
> +	 */

You should assert this is true then, e.g., the pending list is empty.

I haven't checked but later in the series when we move this to an
embedded struct, is the fini owned by tlb_inval layer (i.e., it has its
own drmm or devm fini handler)? That would be a better placement IMO.

Matt

> +	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
> +}
> +
>  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>  {
>  	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index f7f0f2eaf4b5..3e4cff3922d6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -16,6 +16,7 @@ struct xe_vm;
>  struct xe_vma;
>  
>  int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> +void xe_gt_tlb_invalidation_fini(struct xe_gt *gt);
>  
>  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> -- 
> 2.34.1
> 
