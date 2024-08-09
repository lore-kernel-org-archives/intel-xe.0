Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6538AC49EA1
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 03:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F000810E845;
	Fri,  9 Aug 2024 03:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+UX3Tqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A19C10E845
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 03:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723173633; x=1754709633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GrrhhrAa1/31g/mtmOytVbdMKdbpftnSwPAi571u/qg=;
 b=P+UX3TqzWI+xYdSz1Ha4ssy90u5my7q8I8EgMSbn3wyuHCEcP2ej5BNT
 Dd5Mj9WPy5bLA6PguaNKVwAOFnQTpA5xlmb1UAFMM9mgIhUOQbLFNbUZL
 IEBkBTYtq+Zsy2gLWp4IjuiWWZfl/6vn6SO90AawJm2+erIR7GtAYxCGp
 rXYRHzMRmKLoGTc3DqTgzocKKs2FGtHKv4III1CErA9v2XrhZ3slT5Bpr
 5szjh3pfkPQvkX8KrAY0UTlsi9doGa076ofo/C0+gepRgl8WWCT9EofDO
 IvevOyz4NlJoqA1FwS9adK2+MXL7LWJnYgKWX/oVsI0ez+aHRkWqAnYu/ g==;
X-CSE-ConnectionGUID: bCO/KhFRQ5S3FDxyqPMjWw==
X-CSE-MsgGUID: Yl7C1J/US4y4qc4WPN+3zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38842762"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="38842762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 20:20:33 -0700
X-CSE-ConnectionGUID: BT81r41SRTu9XmxFNyc1Iw==
X-CSE-MsgGUID: v40gR7GJTpWINxky7BNInQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57508786"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 20:20:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:20:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 20:20:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 20:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oT6hgmNYfEVRnT6xfGRK2g+BhJpzebZXRFdJHzDZDzorEIb/yy30LeZyuWMTzxF6T7TSIqwnNwZOWCWEMgBL/yVSO1Kp9Fj4+I/zgs9+We3QoSWCkslBtxCgY5bMI7pJ66M1n1fhoI5FJEVmxOXdTGvQn9140i7rMTtvp2+7LyDcEzIHhcTbaBQqKMY4H7QX+Aq9rZB8lF4wkw/qXMV92jm6hHquBr2K/a9Q1633M5oLs3TCWQgyLCJX9YzG0/NnuMGIh2wUVyniyWerKTYKdGJROhehCdvEprB6p6/jRiMukIouudCnzxbst0p0DNfGg+sbqM+ibgSwDlGN4np4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcmO/I7bhsjGwKMNiX++AHZ/tLeKpjB9OA0aV4Ve7NU=;
 b=s6rpdcH390Ai+ojc5dKjb6XRycBLJ7TlM6gMx7IGo6s4ohpRVfWlsaCfeN9HShU/Io/+zbJ6wQcKVFSrYQHFxqHNhmnjc4/zLFfF4NmyMROV6TdqMS8k6sUMRYoOPxsCOI9vIVov8a1r1mylgzDEfnzzRQfdYjoRQXaND3ZtKPR1z1rh+yahBHah9TTMVg8Kq65lhBvM8nUI3K4Uaj2hQzhCpGCDK80WJwLAFzzozrDVLbuXh9MVPdDvdsoeg2d0YWjlVn7t8zINYn7/MrFPVHk5c6T7u8aLacJ+B0XQEBqKnYjku7DK+q0UNMt26yYck+46tWZZ4HytMpXfOOLvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 03:20:29 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 03:20:29 +0000
Date: Fri, 9 Aug 2024 03:19:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 04/11] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Message-ID: <ZrWKqWnYBBQFCyxX@DUT025-TGLU.fm.intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
 <20240808184220.1715625-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808184220.1715625-5-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 753fd81f-f46a-4dce-4aac-08dcb822381d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Iuti9wEv7Wvh13FYNgnfmgJH/53JZv3URvzBgStyzVJMYSVZLJe2IowUpYy?=
 =?us-ascii?Q?9cuSDZC2Qo85AHyatwCxKempnNH7Zz37ILIaMs71LyFng6agEIIE+0t8NNau?=
 =?us-ascii?Q?FD2Qran1x4M1t425r0maG1S0F2k7XJ615/HRecRLMFN5xGjQ3sPDjR1wApdb?=
 =?us-ascii?Q?ZunR9Hbi2Ibc4JWfKuHnYluZmJ9pYAQYFDcEoZ0lxZfB9euwyMYKX2ceXreS?=
 =?us-ascii?Q?BlsTKVk9+xA1ycz+rB7xma2mk24W1rr7eBUipS7mgONaknBn/YtEi+X8dQz0?=
 =?us-ascii?Q?jvUWlI30AZepleuoR04Jy56CEDarV+VnPbDCgCw/PtuZd33miuTkkpNl4L4W?=
 =?us-ascii?Q?sMREbo6Nd7vmYpixoGeO10tJr7B/NCa51raEgBrY/FM5f8Hsz+iD09YWbJuY?=
 =?us-ascii?Q?kQj2fIjYnac0f3gGdhh/VdZBYQQp3ErXwYMGyULNx8rcejKvOPk2p5mYn7OJ?=
 =?us-ascii?Q?c2YbQf9GDquqx11DTH4a/iXufPd+w4oAxbew1/GN89ImxdOPr3R/GeqXrlYX?=
 =?us-ascii?Q?ifVmqBJduFk7+k5VMoext7yZse61pfE5ZTvt4Th46G7/RLrPPgiMmfw5CGXG?=
 =?us-ascii?Q?+mGkQZB+LDFbMTsnn2MbpH1/Y2Yl/0KIl8+yvdWiq/ocsze5W3IYuYjMIqo+?=
 =?us-ascii?Q?q7kxW+xlouPUDNEIE4mdVf5iz1Kli4f+S1hcN3iTvSN2XmI3t0NCc7rPhwRh?=
 =?us-ascii?Q?HVaE8OtKQboUq9zi3m4Lh7imhlBEqrVXSqDHqKu47FOwTR2l822qSMoELxOM?=
 =?us-ascii?Q?J+6E1+xVC6nGlv/I6ewmK43hYH5xl+mWI6Gk/m7cIDcmwqzOXFgKRWA7+PS3?=
 =?us-ascii?Q?NBxAaBUjNUWadSaQd5PYttZnOQM8i9s245OzIG/BQRgKAi8O3muvB53EOyll?=
 =?us-ascii?Q?P5Ys0v/bWEOOgQi59SuJBEi+YGcZtfOwLzebWcFhOPd0NZUDe26W9Go3Kz3+?=
 =?us-ascii?Q?9ABQlxTAZVJqc/lEpKm3ie/V3Nh5Mxa8Sz557CdZ+FQnDzAwfVv+hyMfsMHg?=
 =?us-ascii?Q?tDtGSTycdVi6ccJ5Urec9MccQUPNs4KW0yH13BokApQLm9V+HQTq3V0/n8GB?=
 =?us-ascii?Q?bdAmj13QHdKuHJi+t7mglxu++K/70l6n3pDJwGE3gIqj+PrKxr2nbn2Ej4Pg?=
 =?us-ascii?Q?pUljNQQHFJ/Uk9xkBy6AWG/3oS6iruROdzfBqKiKbH9MWeFsc86m86bJSe7L?=
 =?us-ascii?Q?4VBJazdHcw05JZhHGgG7TPXjaqKmXqn0lDkKO3hWwQ4ksqN4zNaJYnWghCtn?=
 =?us-ascii?Q?obhcVVq8aGgYRYwjwRzVhYKaQVOxxZ0A9vofinl2HTXxJjFc7HttwHODrVUw?=
 =?us-ascii?Q?lqOZ4hPfitBhuqqsyRvGNHOVquztQQaFMS8YYwTeO7Dm+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r//ym07US3WJqoNMbY7enlbNx/nP2pUvxIB1oZvbuvVPMaJ5++hS0dFaandE?=
 =?us-ascii?Q?XQRmQWqNdVZ5TEDXcuuHsfchtYAZdivCBsBRGnr1UFtXoPrxHK29CU+ki4vi?=
 =?us-ascii?Q?9Ebesm6y3Y0Ss9FbY3QkMZvxs77nYGqeZPiILqw31N/7Vz51xR3nYTNof+st?=
 =?us-ascii?Q?U6XME/sbLXEQlv5RZ8t44QrcCHq1UzRpOk1bRr+ZYtOKp0rAzWPWZI478scz?=
 =?us-ascii?Q?NHubK+2w3xMWC7rpAyxjEt/ggXjSKRjWi1txWv2IePHzfwcg3zfRcXbdfRGc?=
 =?us-ascii?Q?mSAXk2ExSS5k/1ptnYWnX8WCe5UWRKkX5wf+33/FCe1HXxkgAlwPqeynqYB+?=
 =?us-ascii?Q?quFfGCRV/qKP52gFWOmRnt8tB7DeUpF9bHGFCu6b6iYMsOdv6bZk4bEiNPSQ?=
 =?us-ascii?Q?QlAOPeXREEF22q9kCaieFWy3JjlXYmEOvQ7KRVj1AMDP4bDHdwjEh/5rtIrS?=
 =?us-ascii?Q?He9Yaju0dwEJmic5hSzyRFqlKReAeOKZB/QvYJF7FyaE9Bb3sjFWzbLnwCJZ?=
 =?us-ascii?Q?RveiecEFm1MK6jSETQQd27RxObxFOW1vYuDFhQsc+2RZfFlBoKxUKsIqSGkt?=
 =?us-ascii?Q?9njQtey6eSO6lLb+baS78ltZMdTmX4ty7PHzN2imyVXh3bIM9Lu/ZmQcAPPH?=
 =?us-ascii?Q?PkX/OIT6wO66GPu/l89MVtZPCuoa97t+a0+Vf05aavWYXGZm77mnzzUL7iM2?=
 =?us-ascii?Q?7HU27IxNzvvQiNfs3zAb8dLqTRs3f3HXlVPY6ZTtwppZG+It0n3dI09GjguK?=
 =?us-ascii?Q?2GdJCM2a3msJM2zxujdZh/Y62D9zSIq4LQhhG1C5P+38nz5NzpXmjWrUrjJd?=
 =?us-ascii?Q?grlHX4lxqLMqKrODfteac4i7qC34bKnic05S7dBFKg5s/tfPTkDmU52wioUP?=
 =?us-ascii?Q?GfAjxiEGW+GopSXgY1Sp78NpekGumeVS/Y+eQMFHi50pH/oRbuVA2w/aT4cX?=
 =?us-ascii?Q?0Bhj5fXCeRu4LtZYWw2htfFS5i+OF0laqoc6rPNKCILmB4o4r2VywAsW4Nn5?=
 =?us-ascii?Q?Rl93Q3hAYro8AXfbGnlT3k/aKBTbrpw1k1teM0vZn245ekinSjhtBMGngve8?=
 =?us-ascii?Q?2kEr+TADMltDWxcr3SacUjLW1OpjctNG3D1uFN+PYSb0X+c2UntoRSxqFlAS?=
 =?us-ascii?Q?E9xa5BVhI6+EL1c29tisaHy3iEC4pMqEhXf6yk4YUH6pv2Nsy5yF0+5O501U?=
 =?us-ascii?Q?n+NY8lfOzIgOoGaecb4FoxYs/YNg2I4xXN3khBCve/meIcefFsBJTLkuB2Wp?=
 =?us-ascii?Q?exse78SJuJ255f3jteF4lhBNpsHWLu1EqNVevdQE/HfswV86wumlBxHaWR1I?=
 =?us-ascii?Q?YGgW3neYshWjLVu9Qc8mA+ECT3fjR+jh1tlJi7HmC85pgRt8fAlwjn+Q2KdH?=
 =?us-ascii?Q?U1NBCaw0TmlHQl2DwZ4Ft3j3c5QXToKjHyRI3wdWQnPczxT35RHgCWpI8jvd?=
 =?us-ascii?Q?3yszuLLiASw2/cf1VSGocsEhXGOUqhL8EiDN/G1e2UM5IL4m/Ja1em3BGnH+?=
 =?us-ascii?Q?oct34cQK2qtAKN7jjP2olF/DNGk5fN9l8g8qDIchxJJcNY9gjyR4QAWkLXO+?=
 =?us-ascii?Q?x0Eb686+2JJi8DGyTlN1EVoaas99S0R+3NEVG//PmAD+hvtKcEJFBH+IV0mH?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 753fd81f-f46a-4dce-4aac-08dcb822381d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 03:20:29.1456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmtT5GxxlUYG5qYHl51OIq7FHKeuTUti/G/vgoduWf3i86Hu1oFJ6NO3yPIvX6fOndLGweTLGAZr2lwbf7ycag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
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

On Thu, Aug 08, 2024 at 08:40:22PM +0200, Francois Dugast wrote:
> This is a required feature for dma fence jobs to preempt faulting long
> running jobs in order to ensure mutual exclusion on a given hw engine
> group.
> 
> v2: Pipeline calls to suspend(q) and suspend_wait(q) to improve
>     efficiency, switch to lockdep_assert_held_write (Matt Brost)
> 
> v3: Return error on suspend_wait failure to propagate on the call stack
>     up to IOCTL (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 36 +++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index b362af7ffab5..8659332012dd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -166,3 +166,39 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
>  
>  	up_write(&group->mode_sem);
>  }
> +
> +/**
> + * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
> + * @group: The hw engine group
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	int err;
> +	struct xe_exec_queue *q;
> +
> +	lockdep_assert_held_write(&group->mode_sem);
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		q->ops->suspend(q);
> +	}
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		err = q->ops->suspend_wait(q);
> +		if (err)
> +			goto err_suspend;
> +	}
> +
> +	return 0;
> +
> +err_suspend:
> +	up_write(&group->mode_sem);
> +	return err;
> +}
> -- 
> 2.43.0
> 
