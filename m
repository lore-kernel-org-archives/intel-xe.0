Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8411C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 21:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721EC10E4CF;
	Tue, 20 Feb 2024 21:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwHlemDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A8910E4CF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708464643; x=1740000643;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bmw8A1cit+SmzoTFBMJquXnO7BOcwPqOu5jUgZ9mhIs=;
 b=IwHlemDx8rcMaW1GlUk7L18kPJ2iJ05mmJTC+ech/tloXiR6wUNeCSaq
 sN+8PO0jrfbAVTNeEqHZROFKjkdYAmMHSJ2AP/kDtpn7n54lEY6ch/2Wa
 RiqKtFrLoIQn67Bp+ijdE40PnrvSoADqmeUYgQXfAVx2oCLxwnpyystXS
 2ag7afQCT8xp2aw+b2vDL7jZRLEvkwcJ9pyH+WEYkwTBK+kNqDytcH9Zn
 h78VBCA5Zd/+m5n9UiikhDJ4uRGtrjMKbJaZwn2H3LbQSb6kp55530rnn
 A+PP9O5D0kpekBBvRjA//Ld/68MpKvyuNShxYHu+zBGWtLmE2GIxGd5qy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2470090"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2470090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5198403"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 13:30:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 13:30:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 13:30:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 13:30:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYQqPB68cCnm8Qit3kN10TbM0jevoAqL/+++yuxyBZwUExyujBX3n76CADhJ0gNgT50evlJHVUslzEhvMhQtZrTCBRF2c7v7eUAmb/1AxDhzexKYWHGtiZZWtqCtVEsQDN5Ra2+zDGBQKUgHGaWnlcZk/yrCcmDJPpR3ZrkTadmjTh2fSWG/zxjZ2f4q4B4em0eiBFYwH3ZVq6FlOmiuhyBWHrAp2yFdsF64D2fJVFN3FX7KpnVh9HIjo+mSMrnHwj07FxFmrLOPxcqo9T3vSb/bo8yM6wnwhIzl7gos1/QlE1BfsyeXXN3LQDOiM6EuNth7tWl5JLEBIa5nCL4Wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdTU77VpnDoHVd12MpnZK4DaQTKSWn1KJgHqvrX1iXs=;
 b=W6JZapPhLXD64JWFXhGEzluZjJ5BIh/08VLF/7sgdZn+B5IUyzCqabWJcEJd7Gl6agHEOJnkzY/6kiPhSvACLTA+m3g2R3QFPsFeb0B6JPxSDQR4SN/ocAcs2cOJzz/chlvG3NUDTH2DvAmq++r3c+HuYXalzLVmK7vimoBm6D4p2OwCESQBjyLp0dTFrAbiPCHNKW5XKYWYS/sCQhsS927wYVV+R4tX5M42K95GM2zpSQRMJSOrkVOphGjTuKoxJzsBC8XHX+05tsR7iinWhVmVgWuQ6zz/Na1EBYwMrJJz7VTiGV99JfD4bDuSQvNf4wFZuQkOljmcGkzxY7sFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 21:30:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 21:30:40 +0000
Date: Tue, 20 Feb 2024 16:30:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Remove unused flags
Message-ID: <ZdUZ_AaFZQKoO8Y_@intel.com>
References: <20240216135333.6-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216135333.6-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR16CA0019.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: 484706f2-cda3-40c1-fa0e-08dc325b2f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iBM6rk31VcDc1wBr5I8NYLrgrInn22kDUGzRKXl6M6jO7ElHoDoxYE7+XZfyTxrDfY8btjF5B1p++tYZXiBo2AD/U6FzQh7vF0nMUGbvFgY5mIrWD2zWQno+58qwhgfEtkkJoX3OztxUN9bXyP+ncDFEGJl12S/Qy90+mt8ADG6z53KWtALjTcCxoc7T+TTl0PgwM7nKqyFQUICh984d0HCrB7OgMgVIq+lQgMJxnaCa8A6Ak4hrTKRw5E/+eVJRFdbDHn8akxAJY7Y1SEKEzF19k0EWLiT6Crw4XlbN4NTHKsXL2FvDe4ea1JbXac5bIie4gG37cLp3p7f44OUTeXH87/m7h8htLdFLEjzDQ0qvIhPhtLf+PvWzzw04nmQBdgg1ZNxIF7uqTPGjpm3rTCVQr/TJfM7Yy53SVKCy/6fmItnsjokCDvtHuZW7hoavf3JnbcRxG80WKwRXp14ERJGlnmTtIny4xMors5DC0YXnXU2zGX2xjXnVV9CP7aYUSj0cE6wjFIloR7TKT+tkzyCU5DMU4UDWMrzpPWQ1j8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Gs63ZvjCGXfUIekKTbsDfLwp8B1rnrVvhAuiJGRJSLsykNgNsQQ4+0B5Np?=
 =?iso-8859-1?Q?+ylxojsoAf2N5YOnpNhHA/nhNYx2wy3paQqK1zymM3DsiEZa42ngRr4gaI?=
 =?iso-8859-1?Q?7b8sH7QILDONL199y+S1nNqvaUbDHYNReShfUZ90Kx5eQQcEDbM69vaS2D?=
 =?iso-8859-1?Q?qTqltYUc8sdWe6lSlAfLS72I6A4lb9XYzRl4QVbKqX9Q5oGcou8OUKxUsA?=
 =?iso-8859-1?Q?vf+meVMYdtjLiBkOzsRwCaCfFfO6gG/kWFD/Ggl9kL3f9z/kbqmKY4Xn//?=
 =?iso-8859-1?Q?HIVkGjOt7JBOxWjw+JAaJEzESBpb70D8k1Qh50ZzL4HlsNxZ2yx/TlhV52?=
 =?iso-8859-1?Q?GNwF46IGZBPp3Kbny0U5RPuhyLgrPlwT1Iht3VBezEfyuGcwMEF1SwOMhA?=
 =?iso-8859-1?Q?2SRp80DJytPCh0/wJhQTfcywtwJsBuUKtc5Giy/W8CWFretO/fC+sC3F9u?=
 =?iso-8859-1?Q?cWddWYmgVQrgPIHykUlwn1HZFu8jg3rc4/x/ImQSJ6BhOyJ/RCNv4iesDX?=
 =?iso-8859-1?Q?b3uAA79w2+ZwcfV2IKWCJMztcMLdzf3j2DckAhKckurbTI0z2QoXZhSFSb?=
 =?iso-8859-1?Q?j7SwIlIJH2Z2dTLGRgTiet3S0tZBqpUMLdsswx+ItFykfZJP9HTBGCWfTU?=
 =?iso-8859-1?Q?zcWdj1Keyd3ZHt71iFQHa34K+Pl9sfD6LyURt6zUWSttXpA5kXY/UmpZVm?=
 =?iso-8859-1?Q?Z7XY7FTSLTzmbIq1wfhdM6aIeclhE0mC66aG9Bu3tNKVI1mx9kZQBU2rNm?=
 =?iso-8859-1?Q?YwZ2uwb/CurSl6HIB/hBR6qVoKWVuVcR8ZYDmE01sf4hloQzS2GgQ0fziy?=
 =?iso-8859-1?Q?Pq2kP1iBcGI+WJ9A4vsYf4OxfLL5tbAeVHKYOT1t5+dhWigh/nqb2Uhxo/?=
 =?iso-8859-1?Q?bo0mI7UY1umh5wvS8u15N1Nax0cEkpd2Bf5elQJ1zm6I29x5nx3oswet4S?=
 =?iso-8859-1?Q?WPfAc+a6rRzhDnLqMsDGhPqPkGZXEBQFkCn6Rnu2NvfbOULmmcp+nsaL9U?=
 =?iso-8859-1?Q?sBDsTIz7HeUuBf1Rxe5Ko1ppcniK0DJ2tmHhqVCE3HLKXRX7hqOYAl0DxZ?=
 =?iso-8859-1?Q?epQ1ZLIh48bgqL0WfjuSR22JdnR31UaR/5ese0gYHixS1yw0P17FpxMi9C?=
 =?iso-8859-1?Q?BfhsrR+dHx2pBqR+mVz+0OUxzgynQm+thlPbzRIv1ilzeaFdew/UtWkCJS?=
 =?iso-8859-1?Q?kLr3AhGmMZ3az4hN5z1zJolJ4bdEOSH9gJtGRrRC77Ln8pHfeOCFT98giF?=
 =?iso-8859-1?Q?WmCiImDcINZKOHUzZwjnkyjNbDkWG0FQwS9JFg9Itbw/+TPWRMOKp0IqX+?=
 =?iso-8859-1?Q?4IHWatwbk+m2khBSbrrzzYs+nln7fVDUWZkLOQZT1YDFfs29dggJyWA+bZ?=
 =?iso-8859-1?Q?bp7jzpmNjJoF5s7/LtC5ivvEckxUtTYFl8Y3ZZt5GRdPvcDdhaAOCkqeD5?=
 =?iso-8859-1?Q?huqRImIIAabGiJVBXGblsDd38HDkBMQZNZLknUVM4zARx+7pBcsRB60IUh?=
 =?iso-8859-1?Q?5T02N2v0yNNRxsd9ZFvuholMMFO7mi/7xrfPjflmEF+/hdtMJ5i5+FnMk8?=
 =?iso-8859-1?Q?KIjwZjcbd9yjudXPglDqrItoy8x51HOsKH/L3u1Tst6Oms62IrSEpv7nAA?=
 =?iso-8859-1?Q?fhyr4qWag6KXxtbf6RvMCOPCMHSOgRf7mC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 484706f2-cda3-40c1-fa0e-08dc325b2f6f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 21:30:40.1282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIVj+5R0SvrVi3zNAl/6oPW5DPt7uck4wK2bqu/xybXnMZmjBpMpzq+dSnsjhxdIhrACcb0dfZWT6b6At1HM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
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

On Fri, Feb 16, 2024 at 01:53:33PM +0000, Francois Dugast wrote:
> Those cases missed in previous uAPI cleanups were mostly accidentally
> brought in from i915 or created to exercise the possibilities of gpuvm
> but they are not used by userspace yet, so let's remove them. They can
> still be brought back later if needed.
> 
> v2:
> - Fix XE_VM_FLAG_FAULT_MODE support in xe_lrc.c (Brian Welty)
> - Leave DRM_XE_VM_BIND_OP_UNMAP_ALL (José Roberto de Souza)
> - Ensure invalid flag values are rejected (Rodrigo Vivi)
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 96 ++----------------------
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ---
>  drivers/gpu/drm/xe/xe_lrc.c              | 10 +--
>  drivers/gpu/drm/xe/xe_vm.c               | 12 +--
>  drivers/gpu/drm/xe/xe_vm_types.h         |  4 -
>  include/uapi/drm/xe_drm.h                | 19 -----
>  6 files changed, 8 insertions(+), 143 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2976635be4d3..e283ef3a63fd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -359,26 +359,6 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>  	return 0;
>  }
>  
> -static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> -					     struct xe_exec_queue *q, u64 value,
> -					     bool create)
> -{
> -	u32 min = 0, max = 0;
> -
> -	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
> -				      XE_EXEC_QUEUE_PREEMPT_TIMEOUT, &min, &max);
> -
> -	if (xe_exec_queue_enforce_schedule_limit() &&
> -	    !xe_hw_engine_timeout_in_range(value, min, max))
> -		return -EINVAL;
> -
> -	if (!create)
> -		return q->ops->set_preempt_timeout(q, value);
> -
> -	q->sched_props.preempt_timeout_us = value;
> -	return 0;
> -}
> -
>  static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 value, bool create)
>  {
> @@ -396,71 +376,6 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
>  	return 0;
>  }
>  
> -static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 value, bool create)
> -{
> -	u32 min = 0, max = 0;
> -
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
> -				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
> -
> -	if (xe_exec_queue_enforce_schedule_limit() &&
> -	    !xe_hw_engine_timeout_in_range(value, min, max))
> -		return -EINVAL;
> -
> -	q->sched_props.job_timeout_ms = value;
> -
> -	return 0;
> -}
> -
> -static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 value, bool create)
> -{
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> -		return -EINVAL;
> -
> -	q->usm.acc_trigger = value;
> -
> -	return 0;
> -}
> -
> -static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
> -				     u64 value, bool create)
> -{
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> -		return -EINVAL;
> -
> -	q->usm.acc_notify = value;
> -
> -	return 0;
> -}
> -
> -static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
> -					  u64 value, bool create)
> -{
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> -		return -EINVAL;
> -
> -	if (value > DRM_XE_ACC_GRANULARITY_64M)
> -		return -EINVAL;
> -
> -	q->usm.acc_granularity = value;
> -
> -	return 0;
> -}
> -
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value, bool create);
> @@ -468,12 +383,8 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
> +	NULL,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -492,7 +403,10 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  
>  	if (XE_IOCTL_DBG(xe, ext.property >=
>  			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
> -	    XE_IOCTL_DBG(xe, ext.pad))
> +	    XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 648391961fc4..28b297208a37 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -162,16 +162,6 @@ struct xe_exec_queue {
>  		spinlock_t lock;
>  	} compute;
>  
> -	/** @usm: unified shared memory state */
> -	struct {
> -		/** @usm.acc_trigger: access counter trigger */
> -		u32 acc_trigger;
> -		/** @usm.acc_notify: access counter notify */
> -		u32 acc_notify;
> -		/** @usm.acc_granularity: access counter granularity */
> -		u32 acc_granularity;
> -	} usm;
> -
>  	/** @ops: submission backend exec queue operations */
>  	const struct xe_exec_queue_ops *ops;
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8c85e90220de..7ad853b0788a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -706,8 +706,6 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> -#define ACC_GRANULARITY_S       20
> -#define ACC_NOTIFY_S            16
>  
>  int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
> @@ -778,13 +776,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
>  			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>  	if (xe->info.has_asid && vm)
> -		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
> -				     (q->usm.acc_granularity <<
> -				      ACC_GRANULARITY_S) | vm->usm.asid);
> -	if (xe->info.has_usm && vm)
> -		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
> -				     (q->usm.acc_notify << ACC_NOTIFY_S) |
> -				     q->usm.acc_trigger);
> +		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>  
>  	lrc->desc = LRC_VALID;
>  	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 836a6e849cda..23b7036c8315 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2117,10 +2117,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
>  		if (__op->op == DRM_GPUVA_OP_MAP) {
> -			op->map.immediate =
> -				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> -			op->map.read_only =
> -				flags & DRM_XE_VM_BIND_FLAG_READONLY;
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.pat_index = pat_index;
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> @@ -2307,8 +2303,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  		switch (op->base.op) {
>  		case DRM_GPUVA_OP_MAP:
>  		{
> -			flags |= op->map.read_only ?
> -				VMA_CREATE_FLAG_READ_ONLY : 0;
>  			flags |= op->map.is_null ?
>  				VMA_CREATE_FLAG_IS_NULL : 0;
>  
> @@ -2439,7 +2433,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_MAP:
>  		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
>  				 op->syncs, op->num_syncs,
> -				 op->map.immediate || !xe_vm_in_fault_mode(vm),
> +				 !xe_vm_in_fault_mode(vm),
>  				 op->flags & XE_VMA_OP_FIRST,
>  				 op->flags & XE_VMA_OP_LAST);
>  		break;
> @@ -2714,9 +2708,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  	return 0;
>  }
>  
> -#define SUPPORTED_FLAGS	\
> -	(DRM_XE_VM_BIND_FLAG_READONLY | \
> -	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
> +#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL)
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 5ac9c5bebabc..fe92f9fc766e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -286,10 +286,6 @@ struct xe_vm {
>  struct xe_vma_op_map {
>  	/** @vma: VMA to map */
>  	struct xe_vma *vma;
> -	/** @immediate: Immediate bind */
> -	bool immediate;
> -	/** @read_only: Read only */
> -	bool read_only;
>  	/** @is_null: is NULL binding */
>  	bool is_null;
>  	/** @pat_index: The pat index to use for this operation. */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9..13ac695eee71 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -831,10 +831,6 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>   *
>   * and the @flags can be:
> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> - *    MAP operation immediately rather than deferring the MAP to the page
> - *    fault handler.
>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>   *    tables are setup with a special bit which indicates writes are
>   *    dropped and all reads return zero. In the future, the NULL flags
> @@ -927,8 +923,6 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>  
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  	/** @flags: Bind flags */
>  	__u32 flags;
> @@ -1044,20 +1038,7 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> -/* Monitor 128KB contiguous region with 4K sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_128K				0
> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_2M				1
> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_16M				2
> -/* Monitor 64MB contiguous region with 2M sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_64M				3
>  
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.34.1
> 
