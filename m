Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325A2EF9002
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 16:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A350B10EA51;
	Wed,  4 Mar 2026 16:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzEduhdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0C110EA4E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772641235; x=1804177235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0vkvIac9i/iZb3GobXozSE3quS6Zb2VFV5GGp/y8fjo=;
 b=lzEduhduQp8fMo+B26Cl8MvjaaOTe4tIa3esLMkHUtaZsMGkwPrxGY2s
 Ynbkiu7OJu5dOk4r7zIG9wYP3+ofIqaHHEMGeK520QIVf/fS5rndA3Kky
 jCs8iT3KrEOr7Ykd2Bv+/dmhjtgyP2h2JhFpUtszfqVO7/kTO2LN/pJL1
 24jHECKfAcZkqnrAeRL5EOZ8Q926YO4UmRNviCd992k0IhOPX7nqhybjc
 jhAmBXOrJYGgv/g239TAERycYEwcBSSqvtVgPQm8vvPtUVxHHIVyn2l2T
 2X2QEWVvczy1eWbY2q1MIW3lismQM20cvfk0V+O7HVGRzEa86m9rALlCR Q==;
X-CSE-ConnectionGUID: RswMmdsyQoSKfP5Bozt4SA==
X-CSE-MsgGUID: c+jkSJ2jSFiCWkv8eqwVew==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91279754"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="91279754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:20:35 -0800
X-CSE-ConnectionGUID: ho6m3xS/TUqy+CkrW3vLCA==
X-CSE-MsgGUID: 7VSR4BeGQX64tjy2nz97gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="245022414"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:20:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:20:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 08:20:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:20:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpbtm+Qx1/l1PSVienUgHLAG6u/DhAURVPHzz6MrhVb8VPRwygDZAxQqFR+OCTL9vyV1PJyzINAheVKLTHNYurWBEdiV8ZtAohUC/s+ZUjindIkWBGMc8yMl1PqGJRhO5hva4f6dgRppL3cuG885dfbZqF1Y+u2vdUZ+7AFR05bPoTvgJkvq2Onmk8EYkX0RZfPZ0eMS2Y1DGDs/bhkMwfgPODE3ZGkQO+gAgaY4fvWJhLJqwp6O8thS1ztlZvrscG2vh4I3y/B7JtONha63RG9SwwU9MY4AQVQZx254KcO5yxdSqZlk8oqFLULmGWWGIsLXkbpCuiBUvjuRYOZWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cylyhrXzn1xyquTG/wFiaLzSbGkV6Xz4X6Slc+AR82g=;
 b=QqV6+fzMYqzYPB6RNZOtL7SUEcpOLagSHCuJuDnkbm3NYZ+nWhlgdaB05twMPBntwnYY8ivJgkA0BvbTVvOgdONkGQAeu+ZsS0kUaxb3ojLJeuwkbT84Umhgi2rFbVB235MoCLq16nnHwfd3DhOuBoELueiXjsewKRLt8FDbS9rFW13hjqTA29Ot1Oqe+udb2X7kmcrSN0/tVzUR5AVNth+SAN2KF6y3uH7B4GpYGiLpEyC/eJOZTXE/Lr4w7f+MAn/AXR1KohqGkUUfsYuzCYPtTPfHRscUh53MMIgsAbRryn88N09WAo72VPNED00htUE9KYuiL1ceI2dkj+6SsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:20:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 16:20:31 +0000
Date: Wed, 4 Mar 2026 08:20:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v18 6/9] drm/xe: Move aux table invalidation to ring ops
Message-ID: <aahbzLwVin5O5Yqj@lstrano-desk.jf.intel.com>
References: <20260304130314.6084-1-tvrtko.ursulin@igalia.com>
 <20260304130314.6084-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260304130314.6084-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 7085a8a6-2efb-4d45-d897-08de7a09f46e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 2goDpGbJRpYFrPfBlTIx3BOkV9Cuebnn6JpwXDqwlPeLU8GpOoEEzWkMSpCuGYgR7wLeBOH64coNKD7dTXXJERkSeZGkV7rafUuwrO5kRMWGQH3nVBkY+NNjWQUnwA3pcDxqVvAlT9Ef+bAvzdInxh4ipwUshY94Crrk37b0lEW5S1xFFY/iiYSCW69CjKqW/peUEJxxtTOPZVAa5B1uXSx4sYZgpfPYXed8VCmUpKCYlinWwVe5jK5WaYJfCufxP2vloSlgLIzFwFubp1vB2vs9FMWh5ggB8oainXPOBtY0y2r0NbJvCogzAWTHrNVlNjf2et2uCkPZd+/BgrCKdrErr9QsCI77Z6P1rJUeMTKKSALq4jPtJHdkg34HNWMG8LOeMrqPseW7euQkfjOwreJsp6LOB5VUQEIhhGWSfwG1PjGo9tAjNHib4uALtVe++MjCmFRfHpv3/Vna+rExVTSEwUrxle3goymaLvYjrcE8JcWG8TlgwlK1eRJ7f0Zkqd/xIY10+EjzGxc+BIHze4UkDvN1SdDFeuSxps7SYRAdSDhtdMD3omfSXg6dz6MVRKhlOtkDZUfUYNVcaqFlD8fHwNz3OsVS5osGTVc9RCByntNFjlwQrxihI0+a2XFiYnxhIIxViP5y2x1ICOz0g9+uLVpcTlPO22kDSWpuJklJxoWRYgAkvAfg0LiseS82qY5hivxMIT0N92Ndn7N6ZOHyY/ro3vYQBaFXiUICe3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n3Eq4cnHUUmoCyWoFCewQ2T0DnOrzRzw/6iCIlXIuL96/zOLXicTb7n6QWAT?=
 =?us-ascii?Q?hl2TUUUG61LI7dsEg6wG23OOaCL7Zw9jHs0yx1A1xM/uXm2AbsH23UxKL8Ig?=
 =?us-ascii?Q?b7pisTyadlidXnj4/W5zQrGK6dE2wtT5Y4mNJGZcCM4LjBIxTVV+Cv1ogH3q?=
 =?us-ascii?Q?7SYj9R+h0DICD4YBNHdhtG6gzwlyb/SwKERe/Gt04SQsiqY1QyYD6xh/2lu4?=
 =?us-ascii?Q?+DTOMRupkvv0HCtlkglR5LwR/dUj6s3NKjO6/vzBRxVplv4QylfIfXQdMP6W?=
 =?us-ascii?Q?+V6tezm+VHPLUO5I30cPk5LAA0J8il256ao9gnHYTk9UADfE+86L7AJM/f7Z?=
 =?us-ascii?Q?5pbWTHpDNmMfizQTW7xMbPpiofTYaoezajd5Tp+cjEQ/mbNQrFtERh2iKsII?=
 =?us-ascii?Q?W9TAOorE2V7VHEbNhTEEVWPzDK81fFxsy9soxrQi+d8tUo6O0xL7VJYTrLIQ?=
 =?us-ascii?Q?zATGoWat8+TJN7NhGV54OUuvnSdqWA1+2dpW4dP1bw+rOyJfAyTcv7B1bIQP?=
 =?us-ascii?Q?wRMqecxRdefcGPiC+w1x85yxfgtHSl9tbox2ruGQCHa++eQeVF+8t6J7QG8u?=
 =?us-ascii?Q?Zua47kMaMVnXnc5XGhre8/NS22S++0Cs/9fw6Q4XGrFxGObtOeLiHd0Nldje?=
 =?us-ascii?Q?XlMjmsP5Le4L2WLIm1Sp9FQHThTfyBFbOoBKHwnqyI+R/FQuIKLBpPCDZibD?=
 =?us-ascii?Q?Sz+IMQFiiPh7aMmesGj2PWjd6uoShkd/3k8vYHvUDy/AubKcVWqxQwrNF3q+?=
 =?us-ascii?Q?eo1rpvFQqzuzMgbLLGVzBdj3lxEuRYxEcyttTdIo91jBOjtBKCQkLjxbr4NI?=
 =?us-ascii?Q?yeGxxhXPqpplWUyRVjRfSCAeXyU5EfTlEKEmX6k7PMa70rOwj2lFATO6hdtG?=
 =?us-ascii?Q?hI8OQc6ygdSedGVL3WkkgMLM9ATOKc+KY1xD70owuplaYJWv8OCpz3ghPEgZ?=
 =?us-ascii?Q?OfiJ0joOvd0C+dkk2z2p9sFKtKmZ9H8R+jkUpGFKmPu1PEHNRWlVvcPSWQU3?=
 =?us-ascii?Q?nJXdu9aqmTG5QK7u6snjzXk2TQHxqFeNpXTQOUkkLmgy7WrQr7bjQoc2Jxq8?=
 =?us-ascii?Q?88nWhrWkNPLwEdbEttFUvgvSTum69Veujb7LLaybLaLtZDrXGYn42+EYwZgj?=
 =?us-ascii?Q?YyZVhgK1Yn9GXgqEsnEJIrHzx+vVlUeUGeF+VjLw52Ackee9rO60Uhtp4pWT?=
 =?us-ascii?Q?SklKBC1Ss7d0FaXus2/0VqlYx0c5MPj65ebdxYkKOabM8rVHb30MhuuUPLx+?=
 =?us-ascii?Q?2Ez1pUdjtM+ZOm6RYmAo92XML2+RqMERZoi0FxJ532/vaJWkhwrgv8Gi5ZAp?=
 =?us-ascii?Q?cqO0wnw7j3qr9kVC9RrMMXZ1d5mM9Kr10DIF3qRSteJb2BdkUxaCP6klC0Lm?=
 =?us-ascii?Q?5n2Av3A2agIoWMalwREojNFF+AdDnMzbv6FstrAzeqRpcgai2d/qG7TtdJVR?=
 =?us-ascii?Q?ozP2iU8HRZM8VNafA1fJD3sKF8rpyTZjRbznq/A0N66D0QlspTVc71nt3pIJ?=
 =?us-ascii?Q?EzuJIgt0fggKXcVWfYD1eCdRmTq5n1MTzcNgI6NYRD34mBwkxpDyPjQJdIXK?=
 =?us-ascii?Q?LlbtI+m+U7vPcoztmJMgmgn/suy6Fb1/0oEH4ZC8AKQpZvjsDSlEnu0gb5e6?=
 =?us-ascii?Q?3BUC1yQa2B4ep5wf1M7doXGxZMcCD3yVZS0aWzYWV9mkLW9agUsGO84KX2eF?=
 =?us-ascii?Q?nq3vYa92F8RO9hmU/ZJrt2MTYuO5oBfheXzRpfyhkR7LnPC6vp6VIdIzQNNB?=
 =?us-ascii?Q?MqJKTWW8Gn9SkA6KDdnorZ9oxcycdSQ=3D?=
X-Exchange-RoutingPolicyChecked: AJiyuGsxE8KAWEHYE1F7aopjhoZWN9AnhqIk6nZgoIaonzPiCAyX6exizoIQ3p9f66Xa6yD1+ILrceQgDN04rkGGNgj91dwLrSOgpC4xhpYuumoxMmo0Bi4MC+amlVqqOvWJVQQ1qC463NcO+g86yUoQzHfFXt3FhBGc5LjC/1e+SArL5GaHegfpQ7gR8CAIEcOjFbx0uj9rWrGx5yM2YpBGZKkqdXiB54WroSHe1AY/JZFQEO5jI47XoUSjmhPuzSuZMirmDA4tz61hkBHQcLwnxpMlGcksR5vaozen3mV0dvGaOuhz4raEueqkD7sHWqN3lGopkLIV8o9G7i9/cQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7085a8a6-2efb-4d45-d897-08de7a09f46e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:20:31.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVt4jdGwh11PBfEnebHSmh+zBm7xTsn9l/k2sF17WqQmAkwRRm0HgE5Iu5gOVK0ftNMTQLPSUWwiEeUM0Fzg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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

On Wed, Mar 04, 2026 at 01:03:11PM +0000, Tvrtko Ursulin wrote:
> Implement the suggestion of moving the aux invalidation from a helper to a
> ring ops vfunc, together with the suggestion to split the vfunc table of
> video decode and video enhance engines.
> 
> With this done the LRC code will be able to access the functionality via
> the newly added ring ops vfunc.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Overall look much better. One comment below.

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c       | 105 ++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_ring_ops.h       |   3 +
>  drivers/gpu/drm/xe/xe_ring_ops_types.h |   3 +
>  3 files changed, 83 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 596379e6d742..8947b3091873 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -48,22 +48,48 @@ static u32 preparser_disable(bool state)
>  	return MI_ARB_CHECK | BIT(8) | state;
>  }
>  
> -static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
> -			      u32 *dw, int i)
> +static u32 *
> +__emit_aux_table_inv(u32 *cmd, const struct xe_reg reg, u32 adj_offset)
>  {
> -	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> -	dw[i++] = reg.addr + gt->mmio.adj_offset;
> -	dw[i++] = AUX_INV;
> -	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
> -		  MI_SEMAPHORE_REGISTER_POLL |
> -		  MI_SEMAPHORE_POLL |
> -		  MI_SEMAPHORE_SAD_EQ_SDD;
> -	dw[i++] = 0;
> -	dw[i++] = reg.addr + gt->mmio.adj_offset;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> +		 MI_LRI_MMIO_REMAP_EN;
> +	*cmd++ = reg.addr + adj_offset;
> +	*cmd++ = AUX_INV;
> +	*cmd++ = MI_SEMAPHORE_WAIT_TOKEN | MI_SEMAPHORE_REGISTER_POLL |
> +		 MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
> +	*cmd++ = 0;
> +	*cmd++ = reg.addr + adj_offset;
> +	*cmd++ = 0;
> +	*cmd++ = 0;
>  
> -	return i;
> +	return cmd;
> +}
> +
> +static u32 *emit_aux_table_inv_render_compute(struct xe_gt *gt, u32 *cmd)
> +{
> +	return __emit_aux_table_inv(cmd, CCS_AUX_INV, gt->mmio.adj_offset);
> +}
> +
> +static u32 *emit_aux_table_inv_video_decode(struct xe_gt *gt, u32 *cmd)
> +{
> +	return __emit_aux_table_inv(cmd, VD0_AUX_INV, gt->mmio.adj_offset);
> +}
> +
> +static u32 *emit_aux_table_inv_video_enhance(struct xe_gt *gt, u32 *cmd)
> +{
> +	return __emit_aux_table_inv(cmd, VE0_AUX_INV, gt->mmio.adj_offset);
> +}
> +
> +static int emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *dw, int i)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	u32 *(*emit)(struct xe_gt *gt, u32 *cmd) =
> +		gt->ring_ops[hwe->class]->emit_aux_table_inv;
> +
> +	if (emit)
> +		return emit(gt, dw + i) - dw;
> +	else
> +		return i;
>  }
>  
>  static int emit_user_interrupt(u32 *dw, int i)
> @@ -327,7 +353,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>  
>  	*head = lrc->ring.tail;
>  
> @@ -336,12 +361,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	dw[i++] = preparser_disable(true);
>  
>  	/* hsdes: 1809175790 */
> -	if (has_aux_ccs(xe)) {
> -		if (decode)
> -			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
> -		else
> -			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
> -	}
> +	i = emit_aux_table_inv(job->q->hwe, dw, i);
>  
>  	if (job->ring_ops_flush_tlb)
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> @@ -384,7 +404,6 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> -	const bool aux_ccs = has_aux_ccs(xe);
>  	u32 mask_flags = 0;
>  
>  	*head = lrc->ring.tail;
> @@ -395,7 +414,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	 * On AuxCCS platforms the invalidation of the Aux table requires
>  	 * quiescing the memory traffic beforehand.
>  	 */
> -	if (aux_ccs)
> +	if (has_aux_ccs(xe))
>  		i = emit_render_cache_flush(job, dw, i);
>  
>  	dw[i++] = preparser_disable(true);
> @@ -408,8 +427,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
> -	if (aux_ccs)
> -		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
> +	i = emit_aux_table_inv(job->q->hwe, dw, i);
>  
>  	dw[i++] = preparser_disable(false);
>  
> @@ -534,7 +552,11 @@ static const struct xe_ring_ops ring_ops_gen12_copy = {
>  	.emit_job = emit_job_gen12_copy,
>  };
>  
> -static const struct xe_ring_ops ring_ops_gen12_video = {
> +static const struct xe_ring_ops ring_ops_gen12_video_decode = {
> +	.emit_job = emit_job_gen12_video,
> +};
> +
> +static const struct xe_ring_ops ring_ops_gen12_video_enhance = {
>  	.emit_job = emit_job_gen12_video,
>  };
>  
> @@ -542,20 +564,47 @@ static const struct xe_ring_ops ring_ops_gen12_render_compute = {
>  	.emit_job = emit_job_gen12_render_compute,
>  };
>  
> +static const struct xe_ring_ops auxccs_ring_ops_gen12_video_decode = {
> +	.emit_job = emit_job_gen12_video,
> +	.emit_aux_table_inv = emit_aux_table_inv_video_decode,
> +};
> +
> +static const struct xe_ring_ops auxccs_ring_ops_gen12_video_enhance = {
> +	.emit_job = emit_job_gen12_video,
> +	.emit_aux_table_inv = emit_aux_table_inv_video_enhance,
> +};
> +
> +static const struct xe_ring_ops auxccs_ring_ops_gen12_render_compute = {
> +	.emit_job = emit_job_gen12_render_compute,
> +	.emit_aux_table_inv = emit_aux_table_inv_render_compute,
> +};
> +
>  const struct xe_ring_ops *
>  xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	switch (class) {
>  	case XE_ENGINE_CLASS_OTHER:
>  		return &ring_ops_gen12_gsc;
>  	case XE_ENGINE_CLASS_COPY:
>  		return &ring_ops_gen12_copy;
>  	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		if (has_aux_ccs(xe))
> +			return &auxccs_ring_ops_gen12_video_decode;
> +		else
> +			return &ring_ops_gen12_video_decode;
>  	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		return &ring_ops_gen12_video;
> +		if (has_aux_ccs(xe))
> +			return &auxccs_ring_ops_gen12_video_enhance;
> +		else
> +			return &ring_ops_gen12_video_enhance;
>  	case XE_ENGINE_CLASS_RENDER:
>  	case XE_ENGINE_CLASS_COMPUTE:
> -		return &ring_ops_gen12_render_compute;
> +		if (has_aux_ccs(xe))
> +			return &auxccs_ring_ops_gen12_render_compute;
> +		else
> +			return &ring_ops_gen12_render_compute;
>  	default:
>  		return NULL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.h b/drivers/gpu/drm/xe/xe_ring_ops.h
> index e942735d76a6..5a2d32f9bb25 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.h
> @@ -10,8 +10,11 @@
>  #include "xe_ring_ops_types.h"
>  
>  struct xe_gt;
> +struct xe_hw_engine;
>  
>  const struct xe_ring_ops *
>  xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class);
>  
> +u32 *xe_emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *cmd);
> +

I think the changes in xe_ring_ops.h are leftover from the previous
revs and can be deleted.

Matt

>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 1197fc0bf2af..e25630fac17e 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -17,6 +17,9 @@ struct xe_sched_job;
>  struct xe_ring_ops {
>  	/** @emit_job: Write job to ring */
>  	void (*emit_job)(struct xe_sched_job *job);
> +
> +	/** @emit_aux_table_inv: Emit aux table invalidation to the ring */
> +	u32 *(*emit_aux_table_inv)(struct xe_gt *gt, u32 *cmd);
>  };
>  
>  #endif
> -- 
> 2.52.0
> 
