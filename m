Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E56CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 20:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ABB10E988;
	Fri, 15 Aug 2025 20:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3m+jRFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EE910E988
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755288362; x=1786824362;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2UK1RSaD3QoVcHQCZPSGrEKVZD/8UoecNd3i2HbZqZ8=;
 b=G3m+jRFHcMhchQiA5wEEw17zZLAXvPCHT/Gw/0676Pj9XfGYdyIz+b1F
 /r7Jx09mhSMdTa2HzO0JqvMFZLDrkZRnXZJ3qNRBoFZr2Iiv6MgWD1+vj
 86hTfw/fzcKeRDSP+irjeuYxOXkEOflRJxVdHYKhmohE0TIQv+B05EUqr
 1CYM5cBrViLuL5HghPNNg5KyODKFUjnOXUwD49a3TG4aIhES9Y9UceANI
 E3xbH4EifRVcn72y8hv65amRQJ5ZpVh5s/37dkQJjKKmj1qtK8UGJr1BH
 r39XRDCk7MweU9SVFQAt+hLcfjL1LDmVnaUfEjlwqEXh0vg/0VrXqGOH3 A==;
X-CSE-ConnectionGUID: n5K6YSMVTViY0jgdcPrflQ==
X-CSE-MsgGUID: 5TLqXANjSTaAuN/7jYjm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83040714"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="83040714"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:06:02 -0700
X-CSE-ConnectionGUID: dmzRBNF1QnqaYWi8VXxCSg==
X-CSE-MsgGUID: E1dU+O6oRF63qntT6Z8Krw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166267310"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:06:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:06:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 13:06:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.50)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:05:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM9yyFb/ux2eQZWUW7MDDDvML0pX1hX2/zYShG5Nc4Bo4gFRpSlD+vsRkzA1ulzIKE/hTTsWvrCzw9KCme0yh2PzRWz1Ud4t67j3yLBC6YmxmhV7YQd6bH4+GP3FJ5Hvma+cr76bYeSOHd97m5zTaoEQNSCfOBz3B31+wnrl32BIFF9mn9PTO9mFthyIJJtv7RqsGQm7WOnD6NcTutv2uXUSi2qu34geZlWs+MzFdR1dpHzpjDmAFItcf8NVqcOyfv6+vqLSWTxMw4NG9xG9fZc7LFXd4y1tqIR2Qe28ZZG3k5i9zCwEIgZBfRdVp6ZltnIcqWPVaAxKNauCqfD8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag6DKETyeg1RH/RlQlZbfBBiCZMWLLQrTpe9BPPcAeI=;
 b=NNd3OO5U8DRYr4H38OXWtbMj1c80DtEtSLgIjvF9vl+ZymmAhm19KpyKvSk6mZu99gxUVKT8vZrrvkDEm1iUaLIWj6RMqHivA6vRBtgzJnZfwTEwn68hOn/aEoCE4NWCPLTzEaUSI0YMluDBl2u43zgX+gt0HrlqOcnUkkLAr0qtaXvQ8qWNk/7rN4SbDwdjAI1+/UR3LnJ8wvfWxBgZIZhH9ENMRIUvxZ3O5iS5txId5GEyEm0+g3YY6Ap/RZRcoIRnvCKBEEfdUaVFqT/j2mnwqp83Am5cSKxtNDGlueuzjpcAHeE+kdJo1UueZyzusG+3TKsoh5oMCrGa8xGdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 20:05:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 20:05:52 +0000
Date: Fri, 15 Aug 2025 13:05:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Untangle vm_bind_ioctl cleanup order
Message-ID: <aJ+THgPk/OHRFoqB@lstrano-desk.jf.intel.com>
References: <20250813101231.196632-1-christoph.manszewski@intel.com>
 <20250813101231.196632-3-christoph.manszewski@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813101231.196632-3-christoph.manszewski@intel.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: a9cdbe68-8eb0-454f-2d7a-08dddc3722df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ycYUEj2PydCNOSVqe7Gsp2grSqO0Am3ZgezHmqiF+NheKA9QRtb7d/0xOBuG?=
 =?us-ascii?Q?/00QuLkOARpNtNWV3Nvjr7+lrIxEuP/YwOR00ZX4mrHdQWqu6eEnIurG4KvR?=
 =?us-ascii?Q?3Bex6DHgmJOG5dElzxIynZD+i0X43/uEtqD6UupxXZTCNgfxPpl61BgCkQNL?=
 =?us-ascii?Q?o/v+NknqXe8wOU+ap/zh3gYnH5FT/vnUeHwo/oYZ9SwJoNxBMC5k+47sovpL?=
 =?us-ascii?Q?6n/1hX5hT5T97Rsots4u4bFtK5u2TV4eFxjOlzrTocYO8pWcqafz3hLRs1Ni?=
 =?us-ascii?Q?HOsBlw9fgW8boJvR4qhpvMPy7wP/1Z/LiNHmcE3/YyLxC8AR3kiOL/juxNpN?=
 =?us-ascii?Q?gizDKBnLkuJlcldKZXVMf3EAFht8CS7LxDyBTdOld6b5GE6UK0ftqAygnqBi?=
 =?us-ascii?Q?LCTVK1Cx9hvZBu3+LrEJJ2IC3lJVrAvCdPsQAqKqItx1w+cKQTjR181LSv6g?=
 =?us-ascii?Q?GncymH0pWvuRnbo3AV/1YYMt1sSmNp8mWbr+QBh53t8Zn+JW8ik/RoXGnLAh?=
 =?us-ascii?Q?JY/iSilCgTxpHW8tsOGeh6JQsBCXIGtvO1FwkQyWmcuVclhXxqGEGy9AqVoX?=
 =?us-ascii?Q?CqAGsGTd+cKl4BFAlexnrrFein/yuPEvXQ9NlYTCd1jUA3OfdbWtrx2KzYjk?=
 =?us-ascii?Q?mD2T1VLIoBN9ENTbx8V03m2a/tHqZrbTo9jmmDZ7MBmiTpxAE1ZlFHO/kgMU?=
 =?us-ascii?Q?GgBa92iJQkNVLZ1dZem+Im1ljyugmIWcn1/sBGwrW/IXVRTClNTP515D/LXq?=
 =?us-ascii?Q?KPPpF00kehXp1El0PXGOocoUHhZiKbSRhyzGiYmPVT3CefGVpn89V6zff3gU?=
 =?us-ascii?Q?N5petEt7Jf5vSqy1ZbbEnbV262Wm7bSYdossrS+oUqSFYFr+8k/wmqLfMUyC?=
 =?us-ascii?Q?g/zme9RTHFLS7bJi06aCpBgvz4nmmhqmp6n2knyX9jWDMrIIWazXvierUVru?=
 =?us-ascii?Q?ktCSv5FCIukw7AJXFkjD1yzg5tKPjni4/4lMn0kq5lZ8HVF5C4U1VoN3NNje?=
 =?us-ascii?Q?P4KSzZwImXD4DcTmENSa5QJ/2rhGz2bP9hxL9CCg125c0R58zDxy+QNYZos0?=
 =?us-ascii?Q?TGafDSObokrpkwbc+GUqHiJdxnu4DStN5gzo2UrUjd4KVAg1Z8I8KWWq74H3?=
 =?us-ascii?Q?aowmhZCdUdRrsbfEuLuegbpaM/Ct3gF6xxfX+lNYNMYbDRJIq4dDDq3m/yTe?=
 =?us-ascii?Q?eN56NVhBsYoKLklmPdG4Xw24XHR207uLTnjjI+UChJ7ODTTikkVzCWHZylpS?=
 =?us-ascii?Q?6iBaS/pF2fEDb32grnqAVzW1yfGJmtAXWUEr9oQOnmhCQn7Myf/VISG1g2Gw?=
 =?us-ascii?Q?N88TaTLOp6N46RTZR5HQ/KNUNou0ZYNdXCZoj2xgbru1Wg/5wdXGquV76pUs?=
 =?us-ascii?Q?VS0mzjggonC/XCgY8OHjlknV4jajm15GPd2VUVFF6656MIS9KQdIkPBQEEYO?=
 =?us-ascii?Q?hCdybsOjveI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NzwPUYz0h4qlw+9eyDQ8IITVyMytngBmErVlCuBz3K6vcTbl5Ujp/rSZuKW2?=
 =?us-ascii?Q?TtIrFkzrI6WR0QLaxsboBJnK51ORRUK0eHiP0Yfl6r/Jsr0cJopdu/kETzmN?=
 =?us-ascii?Q?3yqbCV2GhIKvv0XXLod+Ng2wNP9eh2T6e+H/HcxN6GAyQuIQDJLCy6hZp00Q?=
 =?us-ascii?Q?unRvXZ4GtJoTvyL7Ofj2RlPtZpAYCjOFJOfDrab18IHKx/p++/UtRqu9KvgF?=
 =?us-ascii?Q?Lb2jZFfhlkAvh8PYeEehKA14ZUP3+ePwDQZeslyjqR1BmWdUk7L/73VzjhNW?=
 =?us-ascii?Q?rk03+R5PMPcMNEndrx11mUtBU9pW3sPTh4tXeVzJREm3TaDNPPAmCUqfP4Dl?=
 =?us-ascii?Q?pX+q2KlK+87OVQGiD9f97I3jmuW9PDEPILf2JkxkNEB58NHAOT4iBREAQ+0F?=
 =?us-ascii?Q?EfSZSQEgGEcoWQxL5+mk57brcKHgciJ4O8U73loW+x46fXCV/6Yywg7F5kt0?=
 =?us-ascii?Q?aOYO3jg9sfigEEp+lIBUPO4JAlmQkkrw3bKlRuUXv5kxTUcm9Mt9//7mdfn1?=
 =?us-ascii?Q?3K+IF6PWasrEHZEdYO70ZM1u40dz76NtpK1CnCshFSOW4QbcIJ+kWQtlmbIO?=
 =?us-ascii?Q?NkyNS/OmGFZDUxL3On+oZveNSucZ6KSZ224NFZBhhXSr1BI6P0asmsyBLoKS?=
 =?us-ascii?Q?dWpZmMimoSu2zfR+SrgH2qrTeCYMFgFZqLHjMV83nI5peyu2Sp0zmkcYqYs4?=
 =?us-ascii?Q?j22dpGPhTBt70Oq4ucD0JVZPoq3WTo0aZrDuhDcgeKtYhIIQNf/OKzqsNhc3?=
 =?us-ascii?Q?vrOC+UDY/JAujqBc70PydAwZa9y01/3qAtx/sLtT/d+QCYPm7QPVzDaodOQA?=
 =?us-ascii?Q?YqFpeoQ9dhcqG1Rup9dQhRHLqaOIKQKVqFYYwKUezunVPHZYBbtkqPRyjypU?=
 =?us-ascii?Q?HabBbeqqc6anZ526jUojGP4y6unwDrCM0G9DDr8Yx5HVv9O1v2Q5JXSrlz8r?=
 =?us-ascii?Q?ggkKZTEDMRrEMgzA5vv30qCfeQWhUf0LJBtFrB3dR60k/1PLZl0iNSzA0hUg?=
 =?us-ascii?Q?yB7a+/DInQsGfbEBCX/XCmtUDd2/mBp7dihC3DbF5oJ0IXFrUhW9hAdDgkp0?=
 =?us-ascii?Q?0MM23Y5PTS8OhoZv+C81sE3j/tjOvfHwBPhAJISut8utGltUTI21/Be1G1nJ?=
 =?us-ascii?Q?2JWZ5/BpyOJNyzcIw7R6WzoYuvSl2WiJg7VkMMLdC7MhUeoXQhOShUkiq/JA?=
 =?us-ascii?Q?8uzdZpw9kgyc0pHjIWQ5+06288rJzr+NwZASirmIB5rqiBCOX+J4+R3tehYD?=
 =?us-ascii?Q?LCUj4sl/JnGNS4wm4hZK6ylGppVb2lJL87bhTiXMin7QVVZOqZJsQDe8Wx8j?=
 =?us-ascii?Q?E6lJvjwTBytgHL2wuB0bda+CPqJ2VHI0O/nQKzLw2KC7R8hf9k/RD9p4yEFX?=
 =?us-ascii?Q?+tK1BF4D0pkn0eMiz405ZLDRvfpJl6mZ8WLOureDA00gyuV+qt+k+SVZroXV?=
 =?us-ascii?Q?h6WViCY9r0kO2Cb5ICEXRzqxzm3ulZYn9bFjFZulAln149N2yHq2zwYisGJn?=
 =?us-ascii?Q?RvxaGcNTw5l7n6nPDrNnr/R7gPdE+kw6HTIalfvz8JN2AUSIONYOAX8qWa9c?=
 =?us-ascii?Q?+51PSUAfLFK05XwUbPt5lUXVghAARstecqNG/YZIbAQZ671RgBk+AA7Q03ZF?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cdbe68-8eb0-454f-2d7a-08dddc3722df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 20:05:52.4945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlgjwK9povzacywkbruiR3wwJ2kQpwmuVjaWpCSiiij8FztEIaGa9EIov2g/ihxxbk7DckN13armn3yI3xdLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
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

On Wed, Aug 13, 2025 at 12:12:31PM +0200, Christoph Manszewski wrote:
> Change the resource cleanup order to align with reverse allocation order.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6fd28b205453..c86337e08a55 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3567,7 +3567,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>  		if (XE_IOCTL_DBG(xe, !q)) {
>  			err = -ENOENT;
> -			goto put_vm;
> +			goto free_bind_ops;
>  		}
>  
>  		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
> @@ -3613,7 +3613,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			       __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>  		if (!ops) {
>  			err = -ENOMEM;
> -			goto release_vm_lock;
> +			goto free_bos;
>  		}
>  	}
>  
> @@ -3747,17 +3747,20 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  put_obj:
>  	for (i = 0; i < args->num_binds; ++i)
>  		xe_bo_put(bos[i]);
> +
> +	kvfree(ops);
> +free_bos:
> +	kvfree(bos);
>  release_vm_lock:
>  	up_write(&vm->lock);
>  put_exec_queue:
>  	if (q)
>  		xe_exec_queue_put(q);
> -put_vm:
> -	xe_vm_put(vm);
> -	kvfree(bos);
> -	kvfree(ops);
> +free_bind_ops:
>  	if (args->num_binds > 1)
>  		kvfree(bind_ops);
> +put_vm:
> +	xe_vm_put(vm);
>  	return err;
>  }
>  
> -- 
> 2.47.1
> 
