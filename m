Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD84E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 19:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B85F10E042;
	Tue, 10 Dec 2024 19:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2BhuUGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1796E10E5E3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733859470; x=1765395470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O5Z2TOqiYsIvph7R20E86OjhGGp/QgMXQ7OCG0fFgHM=;
 b=T2BhuUGPO73SjEjxNAFBsQAn0E6smhuKl9YGDv/ZTeaxDgnY6n5Nbds2
 7fquW9TQcF3hGvt6+b1VXxZ16skZlVGshNVy01uhEHxXenX9iARoWCOJi
 DZs2mYmy+6EJxYDM2ma/sHeEZc+rt9sXrxYErFG5s0zZR6tscO8GXyiQj
 bYPNsLPA40KdQT7wFzjs83FstqjvmKh7PfkoBLIIU19wEwA6rdtVEhvDn
 aoSg6Pf3PgaoojmsHS0vwWvNyphdoJaoi1/FJGvKD0LqsNMtHehu/khtb
 VHP6zq42R9QIDgoS+T8N1UpA/WsDLMza6hRKO50h6NTmjWBLmt1GVK99H Q==;
X-CSE-ConnectionGUID: nZzP3rGSRoS0zIOwfvD/Jg==
X-CSE-MsgGUID: uwDnS6L5QIq24kEQ9Ij4CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33557225"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="33557225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 11:37:49 -0800
X-CSE-ConnectionGUID: R0xfY8W2QKGwdqEVhhi4Vg==
X-CSE-MsgGUID: 9iIY67aoTSupkMO5P8wUWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="96328078"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 11:37:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 11:37:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 11:37:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 11:37:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXxpCAPoz0Mx2yN/O4D/Y6m96aMi9CDJG4R+Zkup63iXXu4ebzXqVaKYYVTxf78iD5Vn2D4lbKNOG8dZxdf5s+xMobRzMkfoLXBTvnEjuYDCw6hz9fynPZ2FsbX13HPhpWCD+wFhwsmDvb08GRaifQvYhYmI4IJHq9Gp3P8R5Q7klHOa+6RCZYMbPTzYZIAtqOjDbTmR/Ef/JmQ76haX23jJNNUznee5iXrMpkIjsrOri/2HuEE1gv1Ce6QsslgTSaoVzMofk8OOW59dhmHe6vWXN/lNXRpVA5NVzmf5/+tw3RBBlTCWjdalOVl3A/H9sAuNR+/2DCcDqB9qH5Pk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4kS/YqOZNRLdrQshUP1eCeqMw/OTAmDu3g11C3qwoM=;
 b=ekauXHlHnRP50h8OUYTqq+HNmfu48/YvJYJWV/ed8BOmdZJgNP9jlobRr1oNMxJymvq/I3d5XIhfyuREZU+SdjcPgUQzhZaW3Pc0ETd5S9qCpA6ho1cJU1r5G/FkVotbfhC+Qo0wqKpvOEv9G4sggj8dLYhS8WcdXJgi+X9gWjJbTTQG2Mjt3T6Sdq1YX6Mb1SexEsWHt2E51fWew/jwA4VfkdlT8KU9RSH512XVvZMiLHR/qAqO7vwPPUK4qTOeynAeDlTY8fhH4FtS3ZCWVOhy2QaII4975m1rw2NeqoIvtLp0gg683GJ8NcxZgceKEUBc/J57+lHNRSdBjnZj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 19:37:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 19:37:43 +0000
Date: Tue, 10 Dec 2024 11:38:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Call invalidation_fence_fini for PT inval fences
 in error state
Message-ID: <Z1iYsIzpE6pUOco6@lstrano-desk.jf.intel.com>
References: <20241206015022.1567113-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206015022.1567113-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 808dd2ff-aaef-418c-5981-08dd19521da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iOfWa2E41tnGpmC8NDnbCaatCnTqxe8xr0pDFOuO92ob1x/gsEzq+IAss3tU?=
 =?us-ascii?Q?fRu6CKnm/z+IUZYQetz9jBRnLMZ8lSArpyCbEE1W4qh56IjO+vTH+b1rT307?=
 =?us-ascii?Q?OnBmmto2I2driWgUgrILY+4BfaqGSNeU2zd2ye/tyEI1nF74Xwxz6HaJDnlt?=
 =?us-ascii?Q?w9vH3zq55PnFJKZbvy1qL9QMuUqGYUIufojE/6bEfvbv8cGw9o4bTijeJjq6?=
 =?us-ascii?Q?ZSe5VkBf90MlGsWvg1Jz5MAIp49wLbI7qY4ZF7E1RBy19ru0V62shRkJpLSa?=
 =?us-ascii?Q?ZAuWrPYAQkIJoAz7ct+07jHAaLQwbjXKIjEelEyeQINT/McbSlCdgbrtk+63?=
 =?us-ascii?Q?TLRS7Gap5ypYhXHKLZuxBMXbF4YfinlzezOUBJlouJjnvsmAVDz8QE+2WdUD?=
 =?us-ascii?Q?rR3vjcr6X8Sd6GYXZGm2orZTBwk0hR1R+a12m3VRVxhGRIe5i8MaNiWQgsw4?=
 =?us-ascii?Q?mFcJa33F2OuezB19okNJLCL+R+qJXXZzy4sdxYwuDJdvOEDT/DCCFlDp8RS2?=
 =?us-ascii?Q?qbLdwlJuKnGcuPsxIzZJJRZXTEJnim3hj1cruLMENYfBuE9hKfCr8v45wn2u?=
 =?us-ascii?Q?Kd0REm+fxU7N3hd/t67Qq9VuTQjBX2t5Fhueyu5/MKbdAFNjMyXSvzp3zxpX?=
 =?us-ascii?Q?gXLpKpN2lX81FOOO2lP/feAIBYQmmooKbG/Xinhs590fKeN0aUn1Si1gm4kb?=
 =?us-ascii?Q?3n7SDA67Q2ww2OfnnR3onjo6O92MFkBVba2WFuAaGr+Ui6ZWQ6A8Bw6jAhbb?=
 =?us-ascii?Q?0Pzs/rjvlmcobi7O6avbYqVRG5kSxFeX+s1pq+DUbQcxtp3rNVleDAkkZp4V?=
 =?us-ascii?Q?Fj8uKySOJ88OGGJUi8EH5P7aNOfsxjpiaSoyufaPvzO6Kq/4UB+djzI2TxvD?=
 =?us-ascii?Q?4IxNg3t/QWvWJGMNLmGp7oY0i6OBZpCcC9zIWjFPY/YeMl9/wMhyGlR6IUA+?=
 =?us-ascii?Q?65pmXhxrfHTogaUdYIy81ZJp6mbuzEakxJnWanucgGwaWkA80buC2JtTQ+yy?=
 =?us-ascii?Q?7zDy04DZyVSWgRaSzZYlP47ZTxEE9uLsc7kxeyTFBw9Qlsuc5pVJutUaIHs/?=
 =?us-ascii?Q?7yu9XOygr+XMSjPrJILoGv3bDUUmwTG+joX4AEQHbAzQNBJoa+PXKyh/7xTA?=
 =?us-ascii?Q?csKfsGM2cHilRYTNtkD/naTV1yv0sXy5QRp3vZQbTFAw/DyZU0fr46v4mFgV?=
 =?us-ascii?Q?IwIru+Ghdn8KK6935MMFgfhEsjeOM3B1cC7WC2qJ57uCIzXpBZJF943f35mB?=
 =?us-ascii?Q?2bmpSjE+Oh57+Y6P0SGYa8ec2lKFs+nu8p5n0G/cLmeo00c11EDazbdnsSn5?=
 =?us-ascii?Q?aySTVXxHqeY9YYrgwy2LGJb9FgrbYWw4kBdHBtOZzdVKJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbLdBk0VfaCuopURORsUkvTwaAcxDPZrpImfHdrHh3i+1StxWXytfjVUJTO2?=
 =?us-ascii?Q?bUlimhg2a4ADiaijqaxMFR61YpR/hvvrW/fPPa4h2tQAEcm4BPJ59iIBS4ia?=
 =?us-ascii?Q?Isot7vvIcHbxCKU+VaIcBcjWqYC+ScOtWxhtN+YSBKF5tHdUuMSayj7FEQEC?=
 =?us-ascii?Q?sd+wGGB7wFRyLqpOZUjMYtANdlZXrif8bWL75xQ0zE6f3g9f6+Vdo96a90Lz?=
 =?us-ascii?Q?wsZpM0fH6PFfZjgkDmZ2bxm1803zaNuAmgKjGF1ztwEVvfWNvHP/en/6W13c?=
 =?us-ascii?Q?kavhay22MuFBzAY3VhAuDP4Y+e9uzhxe3lbqUL0Rb61FpHS7zfqC2TD9Or8n?=
 =?us-ascii?Q?XYiPbt6vsJd1+yyh2UcZ3Ztq74c2iI4TNFvWvZMpTbfOpH1l84YkY8livENR?=
 =?us-ascii?Q?X4hayiJzN3AehleJ2j2sNHx+LiAwtsbId4ZNmz43R55U2rVdWgeu528lvxZV?=
 =?us-ascii?Q?WO5r+Xxi5swKpryK8P0FZ9qQVn323B41IZSzYsRW48e2Uw4rkexKSmjMO2Oa?=
 =?us-ascii?Q?W5ETDRc57oPowkO4spHegly1BJzvmoKhMhImPqEF2/GaOufcNzz2vfEZQA1S?=
 =?us-ascii?Q?8cJAkBnDdYYIAFJbUHxAg6srodpJqogbsm8xmWC8r0ZxOAHmOoHRu2ljMfD/?=
 =?us-ascii?Q?MuJJs20p+s6Yjm90zKpOEKcIZJTDnoNvogmVN552m+0/w/TWORzzXPaNn3x1?=
 =?us-ascii?Q?G6AiUqFhBTwSnaU0Ej1OcMHRipl8SPpkI+MdxxLKRpUvLwiFguzCZ6GQCkAC?=
 =?us-ascii?Q?YcAER8/cTUbwuS/sqgrAiqMQQa7updR7Ru7DyxWly+VM2QN8zVcco2SxFfcC?=
 =?us-ascii?Q?ZMywN/l5Pl8DIInn7ruLySFY7CDv+a5BXfpN9Wb7RIyRtc87jPRuhkUH+S+S?=
 =?us-ascii?Q?u5UoJu2cVoTWBqN2jNBCc15KDYqkulA8Sq2HmcRDN7nG90cn+65DAR8eLFoN?=
 =?us-ascii?Q?vETB3VN5BZRDSonnWZEhsHRdWpZsqICXHV/Dm/MxlkcDuPbNHrfc7Eh8ULk9?=
 =?us-ascii?Q?50jLMFGOjWzKIBCVahp8RruCYcOnptGwa62jBchC2rXVRPs43fqZ9ylI3ro8?=
 =?us-ascii?Q?P2c6Ko3VvXlslwdrG7rxDm3lT8N1Qfs27/mqRr/4DZ6W5k+mkgbbHtiidaJ3?=
 =?us-ascii?Q?VSRgY+pTnadYiSeVOHoZzTY6f00l3j4egS1UdmXmpje+y1BE25GtCG3YkODK?=
 =?us-ascii?Q?srw/PwHUrHShsFpgkyUd5q+BCX++g3yWmHkBA7JJMGtkL5AWz9S0nPkBlhCv?=
 =?us-ascii?Q?tnokyZuQdE4SeKwUrsQ906vs9Br3tSPdeIGbMXzU0NfJUQhuO184sifgh9UG?=
 =?us-ascii?Q?poObfw5dxw8X7jc8PdARutaKK2l39KBsmq3tOdpW91eVQD/otDKhCj7jlmXQ?=
 =?us-ascii?Q?p1ZujjzKMT/yGZzrLonl1z+w1mkW9QPJT+keZl86X0LMNYRWZgTeCPSc5j/8?=
 =?us-ascii?Q?1yPo5cDhmDujrX4xwgKfT4iwPY/lKgKXwvfy4MS/InjbaT37vpvUoOjlKS15?=
 =?us-ascii?Q?M14Dg4Pc0rpLam23KYh/1p8RgGQgv0TPvUjcNZRs5PYd8I8IQTw34Yt1stkh?=
 =?us-ascii?Q?CHcl3ZMq13cYlVxe8Ut/jg/KApka8cyXFG9vEDdZ/h+MISt8m7Qb8wYvGJHp?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 808dd2ff-aaef-418c-5981-08dd19521da9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 19:37:43.4270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNlpLhxFDkuUJRDfZZgB9xynl+7AlCpDMmEE1QAHr3MzW4MFKQ21PDqzyyQYA+G5PlJwqp2thUcV0T/DVwWw+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
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

On Thu, Dec 05, 2024 at 05:50:22PM -0800, Daniele Ceraolo Spurio wrote:
> Invalidation_fence_init takes a PM reference, which is released in its
> _fini counterpart, so we need to make sure that the latter is called,
> even if the fence is in an error state.
> 
> Since we already have a function that calls _fini() and signals the
> fence in the tlb inval code, we can expose that and call it from the PT
> code.
> 
> Fixes: f002702290fc ("drm/xe: Hold a PM ref when GT TLB invalidations are inflight")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 1 +
>  drivers/gpu/drm/xe/xe_pt.c                  | 3 +--
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 4e9f89392160..665927b80e9e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -65,6 +65,14 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
>  	__invalidation_fence_signal(xe, fence);
>  }
>  
> +void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	if (WARN_ON_ONCE(!fence->gt))
> +		return;
> +
> +	__invalidation_fence_signal(gt_to_xe(fence->gt), fence);
> +}
> +
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
>  	struct xe_gt *gt = container_of(work, struct xe_gt,
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index f430d5797af7..00b1c6c01e8d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -28,6 +28,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>  				       struct xe_gt_tlb_invalidation_fence *fence,
>  				       bool stack);
> +void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence);
>  
>  static inline void
>  xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 684dc075deac..65c3c1688710 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1334,8 +1334,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
>  		queue_work(system_wq, &ifence->work);
>  	} else {
>  		ifence->base.base.error = ifence->fence->error;
> -		dma_fence_signal(&ifence->base.base);
> -		dma_fence_put(&ifence->base.base);
> +		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
>  	}
>  	dma_fence_put(ifence->fence);
>  }
> -- 
> 2.43.0
> 
