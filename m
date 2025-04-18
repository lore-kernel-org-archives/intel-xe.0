Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF8C369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 05:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC3D10E074;
	Fri, 18 Apr 2025 05:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTgE77Xy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1C110E074
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 05:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744952755; x=1776488755;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qWn2xGpDOYJ4N5t3QvtEtH+iR18SBF9XZyDXZhfrDLc=;
 b=YTgE77Xy9YbUjzN3UCI0w+dAZZIo89eqgK0BO42h4jJNTBMAPKcKZGvK
 jJ1NmX0zIjr5OVt0HnEInA0opxcf+tUOSQcbGi/wvQC8W4Dx7RBl3hQvz
 pfqblR18aQo7/sny+HeeUPj/uKKQIG1i7e6OooQ6wUp/GF/oCQgoPt2IV
 SpKVAYg0M3MQZkcIdc53W0jkXlKliSixWBBCumX+8f31xdO24OqdMEKli
 f1RXe3vLEuTzm0SjqSh/eHneHhxxZ3+mZD54lFCg2OfyQgjFk+kw/lbKL
 i2ngR4zh/Oq2MypFM1Aw929IKB7J0QjK+cEHL9o4VkfaB+oHnvhqBlYS/ w==;
X-CSE-ConnectionGUID: kri+xwYUTlKsCtAP5dllRg==
X-CSE-MsgGUID: QWZ0JtFsQ+qfb01XofLmdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="63984299"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="63984299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 22:05:51 -0700
X-CSE-ConnectionGUID: mbOUGPn2SyqYNapaHfslJw==
X-CSE-MsgGUID: 1jXZj14tRBuaniq0Mnq+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="135987289"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 22:05:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 22:05:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 22:05:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 22:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXqPprdgquF05qE7vjEBEF4GU3JjgI0XMzNvDreBAS4wlwFIH2jNGUHXKZ+0FwsiPho1o7a3QiQDXewgdAzwhDVyBbaatEpKxZr0xNYSGNPrTsnC7XoVjLDUtalxjiOhnruBQn/eJTkmRLbooBNK9Ih4tsuMeh+KwXdHapGdtcvfC5fG4ahq0fPVDLmZ1rw1aQ/DyT0avYTT8dfpV7yTKYD9RaV77oRw2kOTMPeq76eclL82/dmIDvIHVCwQxGAAcmfV1XCHYfiSlKU+iOu+YgvQoubmJwTWmGEyjdUrGyb2Ld95SljzKAuGLGDRJMkVAnvaVRFyyFvti8be31LSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvL1b5eWl5NvvUTSqVMMp93Z07XaYIEHUsJoya/JjAw=;
 b=mmS8fvR/zBAhmyz65w2iJ83eUm/YgDrA4oJ948tt4nNZ4COqF9S6RyyjFZXwhZXBodbPjJGxmQJAuyA5VOJtqYscXyAbXXRquA5L7e2CSnvN9DxFyPjDW7TKshNpCDlIPy+qKYgIyHpBg3ioBQZW23xqLEYiQZkEVSMNy8UIhD2l4XJRJHgCrp3LOBVjkjJ8dpriw/ObO9cI/t28C+AQNapl5+AwupOobSnSH4vc4vzwV09ciHENMs0t3gxewfguLsieMWi+c2MBnPqLFmPCb046QjrV3aVNhGbNNZei5BVbYi7W+uzX1zG2Nj93PdNZvxrmg2hahnelb+d9fNT6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 05:05:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Fri, 18 Apr 2025
 05:05:46 +0000
Date: Thu, 17 Apr 2025 22:07:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Refactor exec queue deregister
Message-ID: <aAHd+UCjSngaQlBd@lstrano-desk.jf.intel.com>
References: <20250417180629.16418-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250417180629.16418-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0168.namprd04.prod.outlook.com
 (2603:10b6:303:85::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9bb5a4-44b8-4c71-ff9b-08dd7e36ada6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nVeHju88RwiHSq6heqMmdahDdZMU2Dcfh8jJ6dz0q76ejJecUnr+AYuKXkrh?=
 =?us-ascii?Q?iVlzjWYStuHwR7b8qVLEgahXPIl+qkPgFNwJJd5d5WRGyIyhZvwbfZjbnvcq?=
 =?us-ascii?Q?AiVdZZBl8NE00OIJe7cADdarSHDhOyhsY49FjG5oHS5b45giLi2dtG8D8+P5?=
 =?us-ascii?Q?KmpOIDgbVo9vH53M2V4FgKnYi6AMdsxXIbTAg013vxhsutBlo0JsT+UUg4d0?=
 =?us-ascii?Q?Ge02y07XH5LALJTiqXMrRPn3Mz7GgGY+ruc8JNFt9mDRs/ktnEfoBn59bWWi?=
 =?us-ascii?Q?XvOT+sixAEvuP0tLY5AmpC2Z/lFznGQJmxus9mVtT8ucf+8zDFWmOMZf6+Go?=
 =?us-ascii?Q?PA9VmpaGeJc7qst5LqAFBuiojgAm9lQfVMct/G3mHEVYsuDf7P5PGtak4EHE?=
 =?us-ascii?Q?RJbUR+Dt1X9CVVQC/xIW42s6wBxksOb0jfIsA01nA+IUtbFEOo6NBGIsI2cL?=
 =?us-ascii?Q?BHSMSYF4Lzl8FMEPLFTDv9kXPX1I6vB5mpSBOmvhRuh8PDS51tZoAc77gEQt?=
 =?us-ascii?Q?jJ40w0lw39IVijQBDskhBQlTlYK/mb3DcUcsOmkU3WNRku3kpjIEDLaYlVIN?=
 =?us-ascii?Q?b4NthbaWHtdEC5j9m1ddkx40ax4NIkZkUFA04B2S5nvdSNnw9RYHMXjK6VJD?=
 =?us-ascii?Q?P9czoyjaIeNOqt489STuuQE5D3t0e0zMGTEjB3w+UDQrtVNfRw+Pl1ZqdWKT?=
 =?us-ascii?Q?YT3L4nvk5N+IIkZW2rvYUvnwS5yJrvvr+I5mImTMeP19pdlbS6+JP3wxtjwN?=
 =?us-ascii?Q?d9hp6oe9ABfFt4+F40g7dSzyjHfyJK6K/wC/CN7gZWcxnYiJkm3CRsWN0wWr?=
 =?us-ascii?Q?K3yn+TG8w6oi8KAJeDUvYh5MsRijyr9Ojhf7qgn7UhKgM9abZAi1/d0OT1mk?=
 =?us-ascii?Q?88vVgrUHuodhEqCpdWlSXZ+XbmqH8wgLbCK1sKxkYOZ5WCJzS7Um/bpeab5X?=
 =?us-ascii?Q?mo/nNe3x7Zesi3oJR7b7iP8iOxNsWlRJov8LLEYDorCiBRbehvB4lWmd58HM?=
 =?us-ascii?Q?vxhCSB5AeN+njx8TGtfKMx6Mvr5klLQLFMkdtSzjUb3vwIKfeQZAZmFP9+dc?=
 =?us-ascii?Q?pUh5V60YCzBzri5+T51Xe/YPJj6W4wmiVTAWqWZ15IqTul2v7Iw71whJ2g0o?=
 =?us-ascii?Q?TSWKKR9gZFP2sIvmFGmICkw3KibQls5IuEvkJDaYsnzA0WZ+iuOG2X/vbkO0?=
 =?us-ascii?Q?ldVAY5fRM9XeeUUikcX1QhmXoP6xIP13zGa5iEFA9T1XDcvqTHsConMobRDm?=
 =?us-ascii?Q?VanbG6OAGTXaXeKzSLg5qZDa2G+kJyRtO7ft5XyJWabusw3+RohTE53EbBRV?=
 =?us-ascii?Q?4TJfzL3kaXhmtGCHv5A+wmbnCTRNJLS80phh/taGVmYVbwcQxJAH2A0UVrKZ?=
 =?us-ascii?Q?IDZKj0zakeD/j9JjYs/t449t8Ren4mj2i27FpXzZmD6DJL83FA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSC27vQzqjqFoMUNEZrpizkvC7gIKyTc5zrw1E94/eG+U2hKd2rl9N62DrEc?=
 =?us-ascii?Q?6uwmusTxTEcHrngnMhzc+rp78C+/FKf0xh2/onXWj6+rgWpl0Vgr5YXnfwWl?=
 =?us-ascii?Q?XEpGmUgGBSDswGE8WLh3WQuRRSXyDNob2MO32ubooFh9IDwafUn6YU3349cM?=
 =?us-ascii?Q?7aWYH6xAQMLHHgX2QAkI8X1+yd7X4sav6E/BmY0jeXUEuIyPfzHB7jduOBw9?=
 =?us-ascii?Q?q8VXGXDPVNgpE1CyDpf9rEBaQPN2w2HwWFgASyk6utsm6LjN05uVIzaKK5WI?=
 =?us-ascii?Q?4Hd3uDJGRDD1K4WL3dkEpYW/xe7C6ZV5U++Bm6P+quy4YrVCCXsZEEL3Y8pV?=
 =?us-ascii?Q?wl4pMVYha45QQextdNu3GQWHAQkXFnbHQV3TpCizEDvy0XX3D2mS11FCR4ZE?=
 =?us-ascii?Q?As5eK4JJc/zxrBOHAmtT7bDKvDIIo6fcCpo4iq4gbRNwMfRFhuYI7nuB622D?=
 =?us-ascii?Q?zpQ/i6QMkPwoCFjbIzs1V5VR3ACUvg79Pt0p43n65ABdRqBq2+J2cJQo0Pt+?=
 =?us-ascii?Q?ZEqhzXwV+qt9bfKOQ5JCdKPyaxK6ue73O9DlJ2WWp5FVt6z06mnr3mzkVGfH?=
 =?us-ascii?Q?F22iD5eyqX0EF/ZqQX2kIz9UVA49/r2W6sbcnwJxolBxYp8tMZT/KmG1zO5W?=
 =?us-ascii?Q?D7aRdSKIceWB3iuKMSqZQF8ryA2HIxRMyApiN+DCAL2dSfQ12TAI/unktHWa?=
 =?us-ascii?Q?dI6gEpkMUZznGL0UaljsV0mHOe3weKX7LQr9/HsxFxnS6ufG3d3lDcrS0eR5?=
 =?us-ascii?Q?/PiFwwgO//umMuDQTaboTdqnRQfOM6iokxTQg5xyDyDgpPWilu20ex3J2Gpk?=
 =?us-ascii?Q?wDn6M8FgdpHhh6wbYRvepHFx8k5v3rq++OoG+xDAelRCJgJolVBrA36782pU?=
 =?us-ascii?Q?lROASbjVA9WgHxYcAScHNjl7+6pwsoDihWaKwiAKKGOoywe1D63/FCrPRqF5?=
 =?us-ascii?Q?gktCGjxbKAeIYPM0BvE83/YYL8RW3IHq2WnhYKG65V7Cr7lkF8FX5LSgCjXJ?=
 =?us-ascii?Q?aGh1A1ZuIlE5Tr/QciCupPjTFtjHL77rdIX5DY241XlOLXAhhTo31Rc8FOL2?=
 =?us-ascii?Q?E2tdsozchvGDZmaUYwNdIc63deOOr41YDiDYwE80RXPfDlZDodPG9RV5UXW+?=
 =?us-ascii?Q?vDlUjpKoP2RMf/Mt+du2kP67CZbyQo32Y5SqL2ydR7NCZzkMVJKLG0Da0LMV?=
 =?us-ascii?Q?gK73qGOSi/kql8cdNdqQWIx8v9H1J6RwbQIIgivVaXm2d9GqmRPkzdGs5pZW?=
 =?us-ascii?Q?X8y2PUgSLXR5Ew7juJuxmPdqyW6l3j/xuYRRz8NgpEd7ZKC6dtnldCQ0jfIo?=
 =?us-ascii?Q?2sdIQDLPwfpAXRO9HoJmTStnV3TuydJu+Y1YVAay93oZJ6IXtrrPQHd2EKdE?=
 =?us-ascii?Q?OJRUrEgQjk5zbjwQuFmMP435hxpahrLLizuEABVWZApsTXdh22xAqxdYc9ER?=
 =?us-ascii?Q?4zDV3DzPdNsYJvc9uoUI+Ytf9FwyYuA782L8X5q2FEGwoqq8FFdHDpKYWjAE?=
 =?us-ascii?Q?u5e3zkBYSTnQygFaCgFy9l72JsxhmA9jPWgMB3JP/KWGrJvD9dwnO/hBfjE8?=
 =?us-ascii?Q?my/biPXU01GaftTd0MRkLg4cm7FZscQhxtaN9U+MvV8CHS4kXSjRM4ttLws0?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9bb5a4-44b8-4c71-ff9b-08dd7e36ada6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 05:05:46.5305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuS+QbPQQiZdipc5XsI2ykaSMjnR6cTlL12V6u0dpWhRXzGOO9HJqgzXQj44j2AIwFSUFyMR+qZBQiOVk4hjRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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

On Thu, Apr 17, 2025 at 06:06:29PM +0000, Stuart Summers wrote:
> No functional change here, just combine the two similar
> routines we currently have for submitting the context
> deregistration to GuC.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 62 ++++++++++++------------------
>  1 file changed, 25 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 813c3c0bb250..42c709729352 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -568,6 +568,30 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	init_policies(guc, q);
>  }
>  
> +static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> +		q->guc->id,
> +	};
> +
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	trace_xe_exec_queue_deregister(q);
> +
> +	if (!exec_queue_destroyed(q)) {
> +		set_exec_queue_destroyed(q);
> +
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +	} else {
> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> +					   ARRAY_SIZE(action));
> +	}
> +}
> +
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>  {
>  	return (WQ_SIZE - q->guc->wqi_tail);
> @@ -1026,25 +1050,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>  		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  }
>  
> -static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> -{
> -	u32 action[] = {
> -		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> -		q->guc->id,
> -	};
> -
> -	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> -
> -	set_exec_queue_destroyed(q);
> -	trace_xe_exec_queue_deregister(q);
> -
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> -}
> -
>  static enum drm_gpu_sched_stat
>  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  {
> @@ -1213,7 +1218,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>  		set_exec_queue_extra_ref(q);
>  		xe_exec_queue_get(q);
> -		__deregister_exec_queue(guc, q);
> +		deregister_exec_queue(guc, q);
>  	}
>  
>  	/* Stop fence signaling */
> @@ -1857,23 +1862,6 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  	return q;
>  }
>  
> -static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> -{
> -	u32 action[] = {
> -		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> -		q->guc->id,
> -	};
> -
> -	xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));
> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> -
> -	trace_xe_exec_queue_deregister(q);
> -
> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> -}
> -
>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  			      u32 runnable_state)
>  {
> -- 
> 2.34.1
> 
