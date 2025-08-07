Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E29C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 20:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF55410E15C;
	Thu,  7 Aug 2025 20:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs0tjZg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E45810E15C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 20:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754597867; x=1786133867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XhMUHfdJL0FgUoEb/fGGXGa42f1AYQ6OMZG0peuHTHg=;
 b=Cs0tjZg6R/PouRt0H///eA2aj2hM5gXWpvBn8UE3FAP8IOZgfPk8WsuQ
 E3eM4/ue4STkBJxgRIHciDRBX7rJ/Ohxrbqyj/5K2PnxMCoiNQNZNA6VO
 K037MnSqRjs75Nk55GvfyA4X1aAnJQzEvvj/rfSG08OuK3tCv6o6Wq5s0
 VHaGWtxx0ZeXwlGCS+DaqZ7mvqzW/5iDMzJ97uHyIHe0FM8NPhtCPhs5X
 KgUHvgaZsPXTw1tZQ1RuoFA5mgMcSvLh5EsBBcdDSLnYpEOtsmlkT5EQH
 LHUz3/FeOA5dxtAPrHNDSzWkuAU4ywo1TymKL55BsuBZZ+06OoHfgyn8S w==;
X-CSE-ConnectionGUID: G68aMLxSTAe8m0gcOjj1bg==
X-CSE-MsgGUID: CafADOetQfazVD4Q3fMt9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74400880"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="74400880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 13:17:47 -0700
X-CSE-ConnectionGUID: 932ILzAQRHC2cQa5OCCf1g==
X-CSE-MsgGUID: q/WRykwESwCIUQqLqmDNkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164665921"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 13:17:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 13:17:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 13:17:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 13:17:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU1ZCRwAMn2XshMXGTA/w0JFqhZVVOZ5QWaKok8HP5oXmyTx7qAoRVhmQ+VI9ygkBE7P/rMzG/GRi/Bl5n8RqsC0VzNS5pUpWV8M6wM8mSkmlI7Rv73zpmw6sS1OIiY2InZOmCLQVgykHvxHg8luChQ3OzQYAUysOs5RFgmEOUSgiarY1M/rCBWwHMmKz4/vnapwSF1APvqSgUVbbIbEcs4bWCPydXc2hstjTJ7cNJA2okEMnFz81OHUFzskW89kbzAgXunQllKiapTb+r3GwNX8jARPETLFlAKBgcgPyLGnwPG6XRWOBXDNwxTeBF816EXctre3oLjDwMboEAW7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlaerfw5wxy3YLUrpDtg0qSIxdpvh5JsDGw2LVD1PN0=;
 b=oTS4YXxT2rZa1WM9y7tSdS1wu0Iul1kTPYZ3KWEvhLnVDgV4eWsYucFkOhxD1uwlBwIAEaC+fD3jdI8aGk7mjtBZ9AsTbMqVYFSQp09BiT4jVG336iCnfxksr+N8EqwS3/vbK4/ljN/UyRZqpqRE5jHc9road4g0oFIVXE8+X5qSyzapMJp1NsfMQRggy8BIr9RRpGrf1UZgLmZEpMz+pU5HWatZzryeOmvjCJye5EGL4fE6f6aeikbC0sFcTiPDVNX4M4fE1E/rv68ZnAq2hGZXDFvzrodofvAuuz9RdoNEXY11243hOYb4C+VwY6aRc89vj1Y3SgYCkerpAaIu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 20:17:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 20:17:38 +0000
Date: Thu, 7 Aug 2025 13:17:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: stuartsummers <stuart.summers@intel.com>
CC: <farah.kassabri@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/8] drm/xe: Prep TLB invalidation fence before sending
Message-ID: <aJUJ4KgWF/FjKTCZ@lstrano-desk.jf.intel.com>
References: <20250807193649.55399-1-stuart.summers@intel.com>
 <20250807193649.55399-7-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807193649.55399-7-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:303:b7::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ff9242-dad2-4c98-50d5-08ddd5ef749c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?znFuzxVYjmdpz8TQVjdt6quW3WWn34o755123ciEmEHtrV+W0jkjQ1fPtu2s?=
 =?us-ascii?Q?oEsbjeOS65N8QJVy9klb8CmQtGmBbJX+xsASNgatd8O1Fg8U+nwBE0ce3XHy?=
 =?us-ascii?Q?vX7yRvby9Be2Rteq+Bo3StmujXEZbLy+C3n5B/fiUCvpDNQT/zbOcvVapBLm?=
 =?us-ascii?Q?2HunJFmEJ4Ujorce9Y6NtzG8PlUwrgQQuRdfa16sarC2YdIAWpCVjiAptlU/?=
 =?us-ascii?Q?qxwDAqIBJGm0Lol9AmUNVglHHX7GfANgbChpm/2UAFa8ss2ETcsJPpfvS5j2?=
 =?us-ascii?Q?ooixutIbVeK2o8H7+L+mUVhbf4xvVl6vowTQ8BBXyBjbJ94kWrksuAfVsO52?=
 =?us-ascii?Q?8Dsg1voFyamOS33snZI7g/AqT4D1bYnGi1k9uVt/Tmu6jht9Yl+qHnRPq1Lf?=
 =?us-ascii?Q?j0Q1cCVgQn5iDshlL2+eHkkqt3yxWSR8tXZVr29mWN6QVeTfHxjEDcpK19TU?=
 =?us-ascii?Q?O6g6PTQMH38LZpFtj7dbFJ971fun6Jcke1iB4ON5PBi9WzjTkKrRFLw71hfG?=
 =?us-ascii?Q?pABTth60q1A/A+9iIYZc5RwXKeEiw3T4sxJD82k71UY9e4Fri9w4oNwli57y?=
 =?us-ascii?Q?zYa693d6YZmonIt3A84htcQAwWIfdeA6tuX/QtGLiSFS99c3FfyhQPTenjSL?=
 =?us-ascii?Q?/rN7Tnj9oVBKTUQxe0+79gLztxuIRU/7oH7r5Pt6b82mz1XVmGUm5CSzn5fM?=
 =?us-ascii?Q?qOAec9U/WnE1AkqYnHMnUVDsQSLE3UIMI0gF7j4g+nWrNIa8OTA47RDK1LLD?=
 =?us-ascii?Q?/mIceKRdWavxix40qcdky3Ujdofvzf6ESFk42I2xutDyxhi0j2kgREDMW8EA?=
 =?us-ascii?Q?mM53Pcqhu1p8nztitOYKO/qCGSywSK3tYh5XtebiIfOtyhu4GNebdTEv8l+V?=
 =?us-ascii?Q?x4oevSUMLyFhkReD1qv1Pba7eQr7WbdpEujdkA6yE5Njj5YbQbbuUQGfcKh9?=
 =?us-ascii?Q?ely+T9Sc08XYz2DNOHMKoFLztnMu3TGoYmTkp5Kwdq9MbhdDaOk4nsmZYZ6X?=
 =?us-ascii?Q?DeqqEQDydT9vfDzzlu9SbAo1n56g4s+44Jw/kqhaC3zHpe70lSPrbOPR8bfA?=
 =?us-ascii?Q?8End60BsDflr4nQx5hJdSi+pKleyy+jFc7fM1qVCQd7jwKbLfU2Sy0w9nomj?=
 =?us-ascii?Q?X21kP9oQ17NrU19C2LTwOIt5rKRgybuVNSWv1YKSBqcEgVHVw1tvUuIM6RoT?=
 =?us-ascii?Q?qGtYfJ4GHZaNkEsT6Y5C+g25Gsbn89kJt7NATbe23o5jl6VdKIQCw3ySL8lZ?=
 =?us-ascii?Q?3PHskTA4QhTNEtnLeSogao4S7OJSzDYOuMKBZIiQEnuq4x/20hGzYnbAYn9O?=
 =?us-ascii?Q?OsHUOw1ZpVs2x341LsWVolMJlVXyiQPMgyo5CGLC9sAdO8U6mQa+au5OZ3fh?=
 =?us-ascii?Q?qoiKXbEz0dDTyqEmJGhxaSA4MAjazbCKuSWVthOse/Gdoro2KWnMacJh0Xsw?=
 =?us-ascii?Q?NNn3PttxGEc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fLpgUOmZIgTcrXfTH/MvdsIIKMS0VFDFpNQ7lBvM6LxbfVO/SEfSsgEOJUAT?=
 =?us-ascii?Q?HvyVwLO5NspCyzN2eCFrzOAGAGMi1zx2+m3LvrYbNKyfth0W0wkyDL7NuOfY?=
 =?us-ascii?Q?UeF5FbRyMVanDpTDnK3ld4VjyjlHiHqq/YNWWFjkYdtkzg72lPXV4W8MU//E?=
 =?us-ascii?Q?SQKZiA422RzQyoC7Hj/tFs9i4y7sMIFnGkS1mmJ7tYZVtD9EbDs5umOwdnVf?=
 =?us-ascii?Q?Zw51kTXaOCd7zt33boM06W53Hho8cvTH+ZzgNiM+iTN30MDzVyuMbcc+ZiGE?=
 =?us-ascii?Q?t72buIiGD+RCkjejrJZd/+2z8Z6Ap0zAOcfxewu9CzsRuzlDHe9vquqtnUAz?=
 =?us-ascii?Q?Q0IwT8/DXtIROCGGAcXfLr/KZ0JN4zPwGhuGAfQEpaBmoUAywlX9q0LPxoxa?=
 =?us-ascii?Q?cy7sLlNh1QE88qjEVu8CpJwH4Gns7nkP9ROFuqbGOak7SoLqqASaFvY1rR6P?=
 =?us-ascii?Q?Jdj93vyc1cLdrtqN5IBs71xl19QeaPUSEMUvA6herySxlQsX4c7TAkTe8up4?=
 =?us-ascii?Q?X5UXBrqOeleSGWBxX4YsAkK2uexhiZ/NDfacpgf0Yl8WINYsEB/x8KGQdv7U?=
 =?us-ascii?Q?KgqgDNWs0hyMtuoFpcze5bM0YZuj4IF5PB4uIYbAPBqV5s0qAI4sOWJ+6Jgh?=
 =?us-ascii?Q?zahbCMdnQZNWNxQN/1E8OIJYv7otnZT341wA5cg504gjtsCA6Lu/4ctGDmLw?=
 =?us-ascii?Q?fgHEOiIpmjnEoQcBsF0fLE6yVVfgzAJ+2+rTIJgZ40i7MtbAXCpOsM/pddg1?=
 =?us-ascii?Q?xQFcwFQi/h5GJqrLMWcws9DOxSVzwi2hWVU6F23FfZVGfWwYX6L7SXJjsAVH?=
 =?us-ascii?Q?H+SMcGdu1rq/fLjGuVD91RIHu4gtuiCVVBNMhSp93Vwmls09GzGWPSGV8NLj?=
 =?us-ascii?Q?bDTzm8279VOHA+7SoMPhs8WRCtrW38uELDpGIQdufKuGawWdpFwqygXjDUFj?=
 =?us-ascii?Q?DVU+6GZflWVOwnergJw7GROpHc4ccL7GfLAwVWRbZf+viz+H8mQyUAfF82U+?=
 =?us-ascii?Q?OjNLtE35+b+BP4PEtxQVXw4mv06flTJBkGb7MgOckTQkh4F7qdrfxopvq8Ip?=
 =?us-ascii?Q?E60qMa6Z/NNJ3yCTJqbR69cou5gqxU+hpdM8UhV+y62QueZ6v3mygmV+HBLA?=
 =?us-ascii?Q?n5ssGXmYCFToAYjh1vE9pFGHVOuXEJncwTkrBOVAZCmMdzvvDlI0UsEPnvUv?=
 =?us-ascii?Q?SX/5Qoo9lhtLnQTDJ4b0HMfIbFNBFq8ucWbVjHWgRl1nCSXnrVt6HFlGlYym?=
 =?us-ascii?Q?2LT9/VU6w/KM70R3K70yOk6M4aN7MF5Ts8Wj9xhLx8lg9HailFJY3S0gsLI1?=
 =?us-ascii?Q?o1SyhUb9mR8thV3W2KhKg9UcaXAj1e1LjbAw/LEVzFZrCwyCgt1a84Tr4ghr?=
 =?us-ascii?Q?erNJntHzblB/toBz+wmCa8MEyZavDIS+XnWrospEIB/97rd6C9pwznA8vaS/?=
 =?us-ascii?Q?9Lgsir/9SXA6iREeJM3fTzakZ1G5hM2BXrTwvfl44mU2kd+8hoVaH3oXEjoR?=
 =?us-ascii?Q?L5xFN92oHVNnWufr81xpui4w64G7gJQ4N0ilWRmvcO1KU90Y5EutyE3asEWR?=
 =?us-ascii?Q?v+qTDvCSRAk/t6z+qLyNlRi0dXtEcuas5fo34Hr4CcEheyNJOPhAGDD40Z7l?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ff9242-dad2-4c98-50d5-08ddd5ef749c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 20:17:38.7983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzFdRuDBFd6ry6zR8WstE1rptogcMGRG74zpuvnaau+X2bu9mu+NKu5U0XTznFlHcKzJfeBp+47ERnEx30z2pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
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

On Thu, Aug 07, 2025 at 07:36:47PM +0000, stuartsummers wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> It is a bit backwards to add a TLB invalidation fence to the pending
> list after issuing the invalidation. Perform this step before issuing
> the TLB invalidation in a helper function.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tlb_inval.c | 105 +++++++++++++++---------------
>  1 file changed, 52 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 995699108bcb..967e5a261bb6 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -65,19 +65,19 @@ __inval_fence_signal(struct xe_device *xe, struct xe_tlb_inval_fence *fence)
>  static void
>  inval_fence_signal(struct xe_device *xe, struct xe_tlb_inval_fence *fence)
>  {
> +	lockdep_assert_held(&fence->tlb_inval->pending_lock);
> +
>  	list_del(&fence->link);
>  	__inval_fence_signal(xe, fence);
>  }
>  
> -void xe_tlb_inval_fence_signal(struct xe_tlb_inval_fence *fence)
> +static void
> +inval_fence_signal_unlocked(struct xe_device *xe,
> +			    struct xe_tlb_inval_fence *fence)
>  {
> -	struct xe_gt *gt;
> -
> -	if (WARN_ON_ONCE(!fence->tlb_inval))
> -		return;
> -
> -	gt = fence->tlb_inval->private;
> -	__inval_fence_signal(gt_to_xe(gt), fence);
> +	spin_lock_irq(&fence->tlb_inval->pending_lock);
> +	inval_fence_signal(xe, fence);
> +	spin_unlock_irq(&fence->tlb_inval->pending_lock);
>  }
>  
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> @@ -208,14 +208,10 @@ static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
>  	return seqno_recv >= seqno;
>  }
>  
> -static int send_tlb_inval(struct xe_guc *guc,
> -			  struct xe_tlb_inval_fence *fence,
> +static int send_tlb_inval(struct xe_guc *guc, struct xe_tlb_inval_fence *fence,
>  			  u32 *action, int len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	int seqno;
> -	int ret;
>  
>  	xe_gt_assert(gt, fence);
>  
> @@ -225,47 +221,38 @@ static int send_tlb_inval(struct xe_guc *guc,
>  	 * need to be updated.
>  	 */
>  
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
> +	action[1] = fence->seqno;
> +
> +	return xe_guc_ct_send(&guc->ct, action, len,
> +			      G2H_LEN_DW_TLB_INVALIDATE, 1);
> +}
> +
> +static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
> +{
> +	struct xe_tlb_inval *tlb_inval = fence->tlb_inval;
> +	struct xe_gt *gt = tlb_inval->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	mutex_lock(&gt->tlb_inval.seqno_lock);

The seqno lock should be asserted here, with the caller taking this and
holding until send_tlb_inval is called.

Matt

> -	seqno = gt->tlb_inval.seqno;
> -	fence->seqno = seqno;
> +	fence->seqno = tlb_inval->seqno;
>  	trace_xe_tlb_inval_fence_send(xe, fence);
> -	action[1] = seqno;
> -	ret = xe_guc_ct_send(&guc->ct, action, len,
> -			     G2H_LEN_DW_TLB_INVALIDATE, 1);
> -	if (!ret) {
> -		spin_lock_irq(&gt->tlb_inval.pending_lock);
> -		/*
> -		 * We haven't actually published the TLB fence as per
> -		 * pending_fences, but in theory our seqno could have already
> -		 * been written as we acquired the pending_lock. In such a case
> -		 * we can just go ahead and signal the fence here.
> -		 */
> -		if (tlb_inval_seqno_past(gt, seqno)) {
> -			__inval_fence_signal(xe, fence);
> -		} else {
> -			fence->inval_time = ktime_get();
> -			list_add_tail(&fence->link,
> -				      &gt->tlb_inval.pending_fences);
> -
> -			if (list_is_singular(&gt->tlb_inval.pending_fences))
> -				queue_delayed_work(system_wq,
> -						   &gt->tlb_inval.fence_tdr,
> -						   tlb_timeout_jiffies(gt));
> -		}
> -		spin_unlock_irq(&gt->tlb_inval.pending_lock);
> -	} else {
> -		__inval_fence_signal(xe, fence);
> -	}
> -	if (!ret) {
> -		gt->tlb_inval.seqno = (gt->tlb_inval.seqno + 1) %
> -			TLB_INVALIDATION_SEQNO_MAX;
> -		if (!gt->tlb_inval.seqno)
> -			gt->tlb_inval.seqno = 1;
> -	}
> -	mutex_unlock(&gt->tlb_inval.seqno_lock);
> -	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
>  
> -	return ret;
> +	spin_lock_irq(&tlb_inval->pending_lock);
> +	fence->inval_time = ktime_get();
> +	list_add_tail(&fence->link, &tlb_inval->pending_fences);
> +
> +	if (list_is_singular(&tlb_inval->pending_fences))
> +		queue_delayed_work(system_wq,
> +				   &tlb_inval->fence_tdr,
> +				   tlb_timeout_jiffies(gt));
> +	spin_unlock_irq(&tlb_inval->pending_lock);
> +
> +	tlb_inval->seqno = (tlb_inval->seqno + 1) %
> +		TLB_INVALIDATION_SEQNO_MAX;
> +	if (!tlb_inval->seqno)
> +		tlb_inval->seqno = 1;
> +	mutex_unlock(&gt->tlb_inval.seqno_lock);
>  }
>  
>  #define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> @@ -293,7 +280,12 @@ static int xe_tlb_inval_guc(struct xe_gt *gt,
>  	};
>  	int ret;
>  
> +	xe_tlb_inval_fence_prep(fence);
> +
>  	ret = send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
> +	if (ret < 0)
> +		inval_fence_signal_unlocked(gt_to_xe(gt), fence);
> +
>  	/*
>  	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
>  	 *  should be nuked on a GT reset so this error can be ignored.
> @@ -420,7 +412,7 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  #define MAX_TLB_INVALIDATION_LEN	7
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
>  	u64 length = end - start;
> -	int len = 0;
> +	int len = 0, ret;
>  
>  	xe_gt_assert(gt, fence);
>  
> @@ -481,7 +473,14 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  
>  	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
>  
> -	return send_tlb_inval(&gt->uc.guc, fence, action, len);
> +	xe_tlb_inval_fence_prep(fence);
> +
> +	ret = send_tlb_inval(&gt->uc.guc, fence, action,
> +			     ARRAY_SIZE(action));
> +	if (ret < 0)
> +		inval_fence_signal_unlocked(xe, fence);
> +
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.34.1
> 
