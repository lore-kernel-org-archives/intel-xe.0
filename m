Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6006C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6693B10E3CE;
	Wed, 17 Jul 2024 20:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apq//XiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5A10E3CE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247025; x=1752783025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D5QGA158XbDVd6XHOThZeFRmiXlAkywTD0Qr9arCqrA=;
 b=apq//XiRHRmwPGPdYgjlroL0XUDpR8BnoDKB/WMqh4O8yXlKuRRbD+ps
 LX87ADhuTCen+S1qrMi1JhnvxjiczaHUFPpsTExpZ1aOH14bkPkI/X3VE
 L+wvks+fs+e+fMK2YvI3wYt8ks1pgVheQ/5LXVLPNzxI0xRqqz3WFI8pB
 kszsbISlctiFoiOXQQ50yjTieNL2Q5M5Lj3ymvghoPDTZ5y6b7r4BzUvw
 9YB/BwQqpt2kDRl+wJQcjVAqAllR32oYwiEWBqslcLYwn9nsITP/Qq1Fk
 gravsEbNCOsPEM94A32Ap6PCEEujtupk3j1POQzXdXZ1720BNTe1f8aJC A==;
X-CSE-ConnectionGUID: W9OODHXtR0uwLP2DN8TiSg==
X-CSE-MsgGUID: PKpYSoxuREiPCy69ipNI+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12595473"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="12595473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:10:24 -0700
X-CSE-ConnectionGUID: wkWlR3NbRpSu+Zc3rkFYww==
X-CSE-MsgGUID: K+53JoGaSQGoMTjuMamIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="51120486"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:10:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:10:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:10:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNE3i37zYMTUSqgsROqVqiuS4NKztnK+3NAgVuVm1/yIM+YKwJ6gIYuvjvT7AbtMebVf0rFacT8QTgX2nWJ3xdaadS0eeHCVHHWcD18VUJcvt3xBDlwAdZNqhiSedsVRG0478T9S3qEt5iw6BRJuYFPEqLcvcDdGaY8EXk8n/tL2k9eRzl3KCrXcW3MgyM9lnDs96XdPswLcogKJKvP7emDUY1mYZlI7P7ityNufw7PTcvAv6ftVP7eko1An0IDxXsLWi3WA7vgwdZNe3KSp6mxjk8PYbSFpjDJHml9gmFUgx4Moyt36MOZq6mhi73xGVij6QV5hu2xzcAkjobz/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6M7UfH90aScRAq8FOsWOWRS+h0Np2I/G+92scjhJss=;
 b=UhmYjp0E+Jf7iuLXDulgMZJ0enD3fy9JDDACIY+x+aXMEjIO333O5HK1jRzwUv0JpEsv1Z9L2rJ+tu8+8xW9f0wCjahxW20LVnAfsB5/FwOWQxpmH2kxm5v0+u541NDjJmL30/1qJtgmjdJCPX5IJ5J7aRsRSWbcUrxlTPWkev9+Lhf3EZgwBcgOqf8bv79ZcCpymW5x7POWXIT2mo85iClI5CIY/qAOZ+b+l1qqudLG1tP7gLaRCSE/AVh2vfHWdVRSx8kyGUk9W+2jnoG3JWQ0xS4Utqdk9b9LYGDTO3lou49AmrjSTEQ1mtRufBMqqgW/I66GfEQ6c/+8Zyh/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 17 Jul
 2024 20:10:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 20:10:20 +0000
Date: Wed, 17 Jul 2024 20:09:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <Zpgk+O81o0vki5Rb@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 42129787-4028-4598-0beb-08dca69c7bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IJB3J44YtXk/GoX13GZbuVp0HRUeoim8QLWL6dBbT4T/lQqtMtCr1Ka6eR1s?=
 =?us-ascii?Q?J5zR+hGsPgPvYaAP1AVJhRxw7Jb84Taw24qKdzvhkpChxa2YGc35Rcw0MhUY?=
 =?us-ascii?Q?9BFfuUUJ2y+w5AKZ9tCJMMs0mPxsJ72vMu8cF2KIVTpjOy5VpTlKpeX7FilI?=
 =?us-ascii?Q?KTAm0zRz3yT766uKIkGvzdvGp4Q9hpP1jEvd3uKfhS7R0Aflo+mGF6xc6OBi?=
 =?us-ascii?Q?o3jIH88iFpJkZoEETXEH+3ZFCNM5oAOuuZ6VSGHynKR4hWoAjtlMht1vtQWh?=
 =?us-ascii?Q?g2SyPqG/rgzYb00GnPtUxfAl1TQyzHZGFKkSixy4PbjuGH98q0LhXgmkgJTU?=
 =?us-ascii?Q?iRBEVfuSpu3GezRvAJ+r5qvQuY3rbPuZE/nKr+78UBp5ujIAe6gyQD2HQlSb?=
 =?us-ascii?Q?bSLUn+cveGez5N9vYI0uUlMrJzNKhUR9E5lIVPHGAx+Ky7ba62mbgA181CcK?=
 =?us-ascii?Q?JIiRpu54MkeSgy7rYPEDDDhQSpbxDADAvBBrgIsoPnmEZh1/flB5aM66OtWT?=
 =?us-ascii?Q?LDRWwbjNpLSlk5SdtQBcvEfh7P6fuZk/zRejoLG080ZBEiYHnASUw8PlBQV4?=
 =?us-ascii?Q?CJzbRRKK+PheIOJSDCFDFV3IcZToYHWy0uBbalb66+enV1g+upmCzRF+J+oe?=
 =?us-ascii?Q?KsKPqFK8Z0cToumEDzQ20lHYXVQvUVSIjeYXNE7KajJ7ETCw0eJ4IU74mmLy?=
 =?us-ascii?Q?gJB0JYpHEiuNhdNv/Gl7czqN2LFl4E6ZWlEk43BV34TITzv0rXLVMKLkLnjx?=
 =?us-ascii?Q?k7VA1UWG1f3N5o1Ooqzzgb6jv2VsExfliInyu0aVfU5eeOD9GvasshD/R1TJ?=
 =?us-ascii?Q?uzePww7We/MEgYMDitGbjy7HH8RroiMRLGBY9Hgh6jb+1hEgj6udTmhSxYPk?=
 =?us-ascii?Q?NYRxFDa3DguOk1VYVzoNMwvLnWidlIyhP5x0Z8pB7W3GVRBBwNrlswC8y3b0?=
 =?us-ascii?Q?dtrKkWcLl5eHUm+66EEmLpC+c3P2UjqD82qvvQrgprWn32u/lra8dBx9TN+d?=
 =?us-ascii?Q?nD+9dAUhxH2wwVaQVzyiZQHRy6hKXFROT5/5cZ6MokpNO6Jh1k2Sv4IStMjf?=
 =?us-ascii?Q?X4ulmDn/CRqehOZzas2HSwDg6afuF5pCshEPLWjFUc+YAKnguqq0oFdhTuZK?=
 =?us-ascii?Q?VS+Qk64TCsLcr/axfO3Yn1YHOdcp228vf0VWwqkVXv6ZFRox+8C9q7GuBvox?=
 =?us-ascii?Q?gY9TW03AfNIlio7W8Za35prYrRDjkjcZ1Z1i7v2Ir41R6D1aW4eQC1+/5Gy1?=
 =?us-ascii?Q?SmoNBBnBotEaSkIekuyI+BD47QgHVCmyGtj7Eg5WH3vz651qFfODTGpqldyV?=
 =?us-ascii?Q?9DM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lbLPmlJ4X+NuD/+c2nTwho6VENI3F8WbMw8M7QullzSk9GO0TE2epWMEQHzo?=
 =?us-ascii?Q?5zmtmHqbdLuMS0VmVHOqOLsPDd59te6QiyZKxxtUdgzi2X1Xz3onhI5hOwl0?=
 =?us-ascii?Q?7RHaN52mehUYuWneIgDDhQfcREm2e8GPfDPnABemXEj25tS1TTkptCxLc5XP?=
 =?us-ascii?Q?H808iXTCgU8odkFsTwwiWPYCavkb8GjUyMZ9IcRmmrfF6oQ8nhTVdEyZiKJA?=
 =?us-ascii?Q?bK/4fIilwTjfVXDxwQZKZX4qGTmdUaQMksXCZhvMolCuUGqIowtujgi30K1Q?=
 =?us-ascii?Q?VPncGA6HRzq6Z+o/F1Z3Fz67H7dkSOQ61Nk2UquLFQvYclVaf6hZkKg8tPOn?=
 =?us-ascii?Q?Sq/My8T1fhZdq6QDMH2ImJ9L7ITHzSJQAilZki4xZM7pFHgGqTBNoRr01Ei5?=
 =?us-ascii?Q?zEw+4C+xNj66KWw1+5/kZgmFuYuvD71DB1opQWPfRLVVTllgu0kU+qI3pmZn?=
 =?us-ascii?Q?pvaqaHLqwR+NNUOIqCIdPwJnvtNQRpeN4n8kYt7yiSbVOYa1MPuuV1H1JcM7?=
 =?us-ascii?Q?iKfAqXlxgijUT8cDW+8FBgrlD5uQ4rcR/lI94XiEkIp/8QwEpyfjl3oWVSyC?=
 =?us-ascii?Q?Sr0Dc42/fmBGxUYN3YeYWMoAl1H1BxY1FL8OrzGLZL6UpGITyogONa0lbZtx?=
 =?us-ascii?Q?VVr3YTQB1ZnwTpwJz6IWd8JSCRDx6/B7okYUSkXfwXxndtts0Jny63qgejEr?=
 =?us-ascii?Q?em99SgoNMTG/E8Uz39w7kslkHoaVQMsslBbgfrLQD1vcSTTW+cwkvZI4g0wO?=
 =?us-ascii?Q?Rdi8OhLVoW0uSP0lg0W0GscwKZNWRO9AVHh9cqXB4jQ7dYaeDRJu/eYpcwRK?=
 =?us-ascii?Q?LO36hLtdPtnzZBDcRQWLm5nlaI4NDL8asNo5XSnlroVc2+eukImWbIJWYUfO?=
 =?us-ascii?Q?NlBqbQ3JRZGv1ZeumI39/JUqGnBbIq2V7XS7hg3teqV7XAtCLHq1+TCtpQ7y?=
 =?us-ascii?Q?lFqqsA6d5iHUPDmpV3tTG18roej6D3PgDmvrulDNx++UpzfxYTfP8BCwnV6p?=
 =?us-ascii?Q?7eraIXjpTEQAZzIZNKTE6KocfqXEeDuFh+lE4lnqAySylC7f4QaWTd9wg6il?=
 =?us-ascii?Q?fwdQaqEPVGP7AmL41tUTsiaH6ZhAdUdYRRbIwwJ5+YDsDRgVAJ5Q7A9cltNd?=
 =?us-ascii?Q?C/32Xn7FTzqru3YfK8/x+QO65V6AWn6OKsF4pZ6Z0iuRBJCtWviHjojz+OnB?=
 =?us-ascii?Q?D0gb9QpossQqfjoG/IOjpxwNIxn3r1kcts8LRl4v8LTQHmfIZqlCLUTzF7Fq?=
 =?us-ascii?Q?5UhpI5KRy3WGSsICoZ6Fv5NjPs2aYes8vHoU8k9FjrYauuz9EMGNriOUru/M?=
 =?us-ascii?Q?wfaa10qHSetbyJ9VeRyjoKHYYlrCSTAJEYhMJ7usLPx2fht5/AAK1cfvVsus?=
 =?us-ascii?Q?G2u6Gh6VzY8BcxQh4CVu6chZjCnQ6rPEj2rl/crF3wtUsxAmAGlcXG6S6gLp?=
 =?us-ascii?Q?W5U+2j0Ml03GW/PuC846WxcZQQkrLVrQK1+k+32TihAuM5ZU+hbADAZPdqvf?=
 =?us-ascii?Q?bK0po4Oc75UPM2zaH5ihXif23ON5bgVZ87EieICbVx3AMvnehLNBtahr4qVq?=
 =?us-ascii?Q?Q17LZ7v4fjBYBPOPIMI0W0eEb8SmDQr+dIiUBrcdS8rH6cIyXTHec2vaiWTF?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42129787-4028-4598-0beb-08dca69c7bbe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 20:10:20.1982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMGz4CwML5Lzc2QeQ3Nh9/OfPZFh1vsiHrtzIMSud+bWCcRL+rAPe3eli5c4YMlLfwAopftjAiisMTLHPfNuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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

On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> Add helpers to safely add and delete the exec queues attached to a hw
> engine group, and make use them at the time of creation and destruction
> of the exec queues. Keeping track of them is required to control the
> execution mode of the hw engine group.
> 

Missed a few more things...

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0ba37835849b..645423a63434 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
>  			xe_exec_queue_put(eq);
>  	}
>  
> +	if (q->vm)

I think this code path can be called GSC exec queues which don't have a
q->hwe->hw_engine_group. So I think:

if (q->vm && q->hwe->hw_engine_group)
	xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);

> +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> +
>  	q->ops->fini(q);
>  }
>  
> @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, err))
>  				goto put_exec_queue;
>  		}
> +
> +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);

So this only called on non-VM bind exec queues. I think techincally this
wrong as VM bind exec queues can use dma-fences plus the copy engine. I
plan dropping the copy engine for these [1] and I don't think it worth
fixing VM bind path with mode switching if we only are going to drop
this requirement soon. Let me just respin [1] and hopefully we can
prioritize though reviews so these two series land at roughly the same
time. 

[1] https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5

> +		if (err)
> +			goto put_exec_queue;
>  	}
>  
>  	mutex_lock(&xef->exec_queue.lock);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index f8df85d25617..4dcc885a55c8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>  {
>  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
>  }
> +
> +/**
> + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +

Also assert here this is not a VM bind queue (e.g. EXEC_QUEUE_FLAG_VM is
clear).

> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +
> +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);

I don't see where INIT_LIST_HEAD is called on group->exec_queue_list. I
think that should unconditionally be done in __xe_exec_queue_alloc.

Matt

> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> + * @group: The hw engine group
> + * @q: The exec_queue
> + *
> + * Return: 0 on success,
> + *	    -EINTR if the lock could not be acquired
> + */
> +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +{
> +	int err;
> +
> +	err = down_write_killable(&group->mode_sem);
> +	if (err)
> +		return err;
> +
> +	if (!list_empty(&group->exec_queue_list))
> +		list_del(&q->hw_engine_group_link);
> +	up_write(&group->mode_sem);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7f2d27c0ba1a..ce59d83a75ad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -9,6 +9,7 @@
>  #include "xe_hw_engine_types.h"
>  
>  struct drm_printer;
> +struct xe_exec_queue;
>  
>  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>  
> +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> +
>  #endif
> -- 
> 2.43.0
> 
