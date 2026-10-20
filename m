Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853D606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ht0EAEfw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCAE10E590;
	Tue, 20 Oct 2026 16:34:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3810E590
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792514087; x=1824050087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jYybbOWM1DaNLdb3znW5TBX2eKd7SMdom9owx/fRqNo=;
 b=ht0EAEfwmakn7S6KmNPZk3NPaqsmEx/tci5GoNEBqpEUicKBeZG4WnPu
 jVDY4z302tYF+0IerF+aoeMEvtUUdZ4n3KB/LcxFbHmkeU8iOSOA3EGfx
 Dh2eXKl9CvGtePO997X3OO1UZuGwW0LIKq4KLAT7X2RgmnxmusnzhuOxK
 poB8x6MBaeC6Dai3pqTgEyMSZKLMf+xj1ATVhjvxieGbT5QiLj+XK8gjv
 tzOwxT55AMWRWbFlGiTkMp0DXb1EADVM5KX2kl3FHLyL0MbRUNhCDIpei
 XJa1VZKRm6IR0eccOT1UIf+4NIdJjpqrc/T+Xbfmgc7W5mH0w6Sge7k1W w==;
X-CSE-ConnectionGUID: JRim0lIvQ3SHGkg7sPI5OQ==
X-CSE-MsgGUID: n4VRDWsqSHmUdjlgGFLS2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1110183"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1110183"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 09:34:46 -0700
X-CSE-ConnectionGUID: KULKelxET8OLCiNriAu1Ew==
X-CSE-MsgGUID: zT9EF2BER52G6dPJacfdig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2751643"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 09:34:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 09:34:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 09:34:45 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 09:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eakZSZdgkyI6DsmMDa2h0PUFLG7IYE8EijjOB1dl6FZrzv+z409l9+1cau9qJ/sZKviXEswso0EEpERCxRxafYmZeVbnwFAEKTeKCQtivxlJsJJHlLf5tt3eAWc/i8OGf2strK7I2htf7KHnKQ/wv1qqy5hFSNi2g6FuvxrXyyVqm2LCICcDc7n4HtSnkl9iTWAqwQVuGsCoJlmZPWMl6WaSoPtkJ2H0kt5w9zU+bSsLrkBOQNVRg0O8CABDsA/iO4m4+H7e5DJji6GTmezZoG3zpDhLjkRmvcq2Z3hrGKQ/I+IkXQOG/ztXdpexK9gmVnyl3GNI+ZjnlNCdQT9zxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijw1goYSDJ7zn+ziD9jSV3hk3yGP+XXpref1co0b9OU=;
 b=j1cPNgwSTsCV3R/aawg53Jh5qZIh/79N6pFQ5tpB42UHLwbcoPbNAU6aXg74Wt0xEqrvpkfb8ICLmoq2x9u1JRPFXLDOogaq52HpvfOfCqQSkz/l73cmuWghf0F4ri2gt3K2771nKM2MI9jhA0mfjpy5ZifXMjtGxEMQpHycFTIh+A9VGC+WUvCWSua0aSesBlOrgpghK2rvZbHFPYGoeTiDHm6QCi4fHw844jwMlLLD/8jx9zF1z3Xz1Z0qoaS4fuCZa46ffiwBve9RT6k4iu6CNyamqI2h6jjHg2YCkzDgKCU/DHnT9RK7dRyXsNtiNNbrHn46i7nbtw54V1xqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 16:34:42 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 16:34:42 +0000
Date: Tue, 20 Oct 2026 09:34:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jia Yao <jia.yao@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use a dedicated workqueue for VM rebinds
Message-ID: <ateYILtvzWfEkwoi@gsse-cloud1.jf.intel.com>
References: <20261019230142.1112281-1-jia.yao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261019230142.1112281-1-jia.yao@intel.com>
X-ClientProxiedBy: MW4PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:303:dc::24) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ae1a63-2183-4778-4b4e-08df2ec80ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|261009223027099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: CCzAaHfYmCJ4U4y2yqA0cJfxAQx2Qq1jDrqzDI0dqt0D1KBZyYMQQnQFhyA3OTf79GJw5LHyQvciz3ls4EMaNZjbh+kmKG7FTC0ay/lqLO0q8HUXWpFgFSbYb32mxJKikoL+saTGl8xS3nVeT7vD1KgbCjQ/Zkxhb6T/5KIhg68pyyyC7w01pnvsGLeKbd3d6bpIsqm/NMfWCIt2I8O5tCaTuUl9iaO0Bk3/B7IcYPlsh7BPtXRNk9YI3rr/xt6f43/hDo6psy2+vfYaTXG95N6x+BePZW0ZPWrKq3LxcFjZ8Qd9U3hzNYhccZH87rYAPyMpSSVn5BuEZuqYsmVsL8x6U96olxAT5w/Mx4NdBjVLGomDi5mohWqx59vOXNmDnffFLHnamhyUk0Umk0fNfB9CbmYkIR3b1lon5XqaqLk/vl6Mc4uB9PZZlOCNCQwWHXJUYkAcOrUbZYV7jFKXs46hdVBqhgWblQNlSXje2jOTwrQ9ZycLrqYnPt9Nr2SSmtMTDDLSy0C/KirusT421VsB2H8Hs9vDDwdEhyOACzHr/Mt5Vt7vy5Tq2jeYz/IbTVMijaRpmiEfnxkiHVmQQd+LFyabFBB6mIOG2aMud4pftpfQCNTxunGCIvVrMaCyHuG5zoI5J3R4BNBvIqsfEjwnLpnQTmYpECK872QS+XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(261009223027099003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TiQHzyDgjdO6XBlWCSRoQKYF4jv2or5mQpfg5fnpDyIilrzC6bBo9rL2DT/c?=
 =?us-ascii?Q?4rJiv2J1bxht2sXn2uNpiuEYENFR1cQx1J3e28xKGbBaYfbS84s0UBcnfy6N?=
 =?us-ascii?Q?9m8agkfYm5hE6+uyRvFcD+RaWIjEdVgcOpnfPwMxHQYKgql1ejpr9ddXBM36?=
 =?us-ascii?Q?RDzOsby5otctMjnb9iYRdgAYVBb2YC/91PZQvikfBSsIt2qHec9TAy68TbHP?=
 =?us-ascii?Q?fLNO+7yh9EhZr8+eIhvcjEQCKH66xEXxPIGSrzCtQqNEs/hcbyi1yhVIleWb?=
 =?us-ascii?Q?6yJPvkgeNow8E4AyBcbFW3WN/Jv5GFNFKE63UHhwvsOyQk9Z0kVYtXRGv4Q6?=
 =?us-ascii?Q?w2wIbkR3oqThgHaxtJKlv2CZtFisZKvDqSZQwxRBIrMNHG5oT7+k1JhCwovD?=
 =?us-ascii?Q?ytANxKhnaK3DwWzsFaICirTZlBnUvkfmIZputDXjZbhxCeiVl4DitRGFn5K4?=
 =?us-ascii?Q?7eTonAQ0IJ1vfrxvz2rDbLSCFJ38TxECM7S6Za9M06+oer2mgRL9stdhuiPf?=
 =?us-ascii?Q?o4p095yFi9SSHFuzJ5SgOu2c+gyKq+kl1gP+yU9NxQoNU0fkltG7QGC/rpVI?=
 =?us-ascii?Q?56q4ltVa5IfqKCWe5303S9xG2Idu/UKyU96yJmhsMLPYNYTjh1UJN20bmF3p?=
 =?us-ascii?Q?9OOyjsKlRW77q1OXoHceZ3EuVr2IyxfrHmYIppj/llu/7VrY0wAQbT+Er+ye?=
 =?us-ascii?Q?WWGVhYl4DS3fGzlKvrl9kVkHDeebJ78t0uXZHS5rdWRVp0u9+QOnuP6jMH3Z?=
 =?us-ascii?Q?V3NAkB2FUiF83CJpW8E7dJwkUkuFFNPQfz37kaL5EyGCDJ3FHvOZkR6DnPyq?=
 =?us-ascii?Q?IIUIJP/lvHbKRukrWmqcFlwje+ggXmulVO9pHryWzWmMI6l5M5VQ+0ZEs6nj?=
 =?us-ascii?Q?DKj+IBDYnOJkzx/Slu6quDHfZpQl0LbTJlquYg1udIBdcPd3mUL3lruyFvVo?=
 =?us-ascii?Q?eEuEuqzETwcWtQJlJkNkzIGlXYiptmtD7N7AYZvfJsfF03HTLur3b3/eDnbk?=
 =?us-ascii?Q?xfk4RHB+UheHvw2piAe0Vb0u8jzx3SQen2KiUNja400sXiV8JEkRBG9LIZjL?=
 =?us-ascii?Q?Qm+FDm6ZUKf4TT/W6QLSy8Vm64rvap3nUAsrYrlveQft1RysnRuDUQca/SbY?=
 =?us-ascii?Q?bPDnr8B6JYLVb2dWAECCdsp06T217NknWhaL/9v8q35rA8yPbJL8viiAum/B?=
 =?us-ascii?Q?L/cQZf9pqDPfQ+Sz0Zogywhh2jrRLbtEpO87T6R8OY/kc/WgBA45ZmVXmHLb?=
 =?us-ascii?Q?hdCREWAxUnp0dhrUPtpzcxr4nI3Y+emaA4BpPTgwFy7ouLhwLrxw1Squp0MK?=
 =?us-ascii?Q?6A3eVNU983SI2yJiJfzUMqVGQHJ4G2e7gQt38ISYXi9FORkrGRUVUae49sAU?=
 =?us-ascii?Q?1AIYQmiW/NMIwUCLCZPBAnuyv0/f7xx3C2GK1iWwy5GthoFNuH9ZCdna7u0G?=
 =?us-ascii?Q?T7oOb2iJRxclLXqupyf13/4s4SpTwVUeSSlvZanvGE6K4aLcdhzD5EHg3iFx?=
 =?us-ascii?Q?T7fVYoh+4WIagYVZSvhLuvBEY2Q/X1MzKAYN7okxFf4+bti28m1jAWQ93vRU?=
 =?us-ascii?Q?qCdq5+5PPDDn3JIkJ0BE/z+w9Bo+KEEtNfl15onE6yu+LxybjBKoSZ1yuNC6?=
 =?us-ascii?Q?hYebObujKm9H4LHUeGFna5dTXJLlB6gYGy598CrRUXV4dib00nhVxZLWpmDQ?=
 =?us-ascii?Q?3TuGT3yGz5vMKuQVKOGEb7kCpVpO/eWQbIs7YxznuGVlpI4IZt/2Nu8ZHu6a?=
 =?us-ascii?Q?jt1/T2+Org=3D=3D?=
X-Exchange-RoutingPolicyChecked: kWQMiKgh5p+HlIjGV9AUuVuAfklZChbHzefpPAXIGf0dEuyqClJm2IqT4MSxdxxw+Vf9cU/ISAmkOU77RjraT6n3Qc4DPFm2NODdHyH+v75wO2PtX7zM4lApR0MFI/26e8bYYOFk61NZZNVLSTuGw2S4bk75ZK9Vvf8GfLblT+0hxvWs87//DgEfYAAWE0ub/ImE0WbSQtPF0zmw/hR5uoXFqdLaNo9FOOJu7oY3P10rJvJ/eu4ciZy4gclzU03DugOwtDKJJnHJGk2vS5Z7+DCr4/Z0tfLYaXwg1H7O3prJGvNrEl9puGzcpP3GRBenWkmqUaeuqsTu4N2Qaep+AQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ae1a63-2183-4778-4b4e-08df2ec80ad9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:34:42.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSimNNb48jD6cYvp9lHCBuDWW04XU8BCALdk9ccIOjYmN51zJzl9VC/rmChsjyidk+lDX/D9nO+HhhVDj/UuaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:01:42PM +0000, Jia Yao wrote:
> VM rebind workers may block while handling HMM faults or waiting for VM
> fences. Running them on ordered_wq can stall user-fence notifications
> and VM TLB timeout work queued behind them, preventing forward progress.

I don't see how ' VM TLB timeout work' is related. Those are scheduled
on the GT ordered work queue. 

> 
> Move rebind workers to a dedicated ordered workqueue. This keeps rebinds
> serialized across VMs while allowing fence-related work to run
> independently.
> 

So this isn't a deadlock rather just a delay in user fences signaling?

> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 12 +++++++++++-
>  drivers/gpu/drm/xe/xe_device_types.h |  5 ++++-
>  drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>  drivers/gpu/drm/xe/xe_vm.h           |  2 +-
>  4 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index db0b883322ef..f1dd4b7842a9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -385,6 +385,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	if (xe->preempt_fence_wq)
>  		destroy_workqueue(xe->preempt_fence_wq);
>  
> +	if (xe->rebind_wq)
> +		destroy_workqueue(xe->rebind_wq);
> +
>  	if (xe->ordered_wq)
>  		destroy_workqueue(xe->ordered_wq);

How about s/ordered_wq/userfence_wq to make this clear what is used for
and nothing else should be scheduled on this.

Matt

>  
> @@ -515,9 +518,16 @@ int xe_device_init_early(struct xe_device *xe)
>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>  						       WQ_MEM_RECLAIM);
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> +	/*
> +	 * Rebinding can block in HMM or wait for VM fences. Keep it off the
> +	 * queue serving user-fence notifications and VM TLB fence timeouts,
> +	 * which must be able to make progress while a rebind is waiting.
> +	 * Preserve serialization between rebind workers on different VMs.
> +	 */
> +	xe->rebind_wq = alloc_ordered_workqueue("xe-rebind-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
>  	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU | WQ_MEM_RECLAIM, 0);
> -	if (!xe->ordered_wq || !xe->unordered_wq ||
> +	if (!xe->ordered_wq || !xe->rebind_wq || !xe->unordered_wq ||
>  	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>  		/*
>  		 * Cleanup done in xe_device_destroy via
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5553415afeaf..705c487e3c6f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -387,9 +387,12 @@ struct xe_device {
>  	/** @preempt_fence_wq: used to serialize preempt fences */
>  	struct workqueue_struct *preempt_fence_wq;
>  
> -	/** @ordered_wq: used to serialize compute mode resume */
> +	/** @ordered_wq: ordered user-fence and VM TLB timeout work */
>  	struct workqueue_struct *ordered_wq;
>  
> +	/** @rebind_wq: serializes compute mode rebinds and resume */
> +	struct workqueue_struct *rebind_wq;
> +
>  	/** @unordered_wq: used to serialize unordered work */
>  	struct workqueue_struct *unordered_wq;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e7f421a43516..88b4f6b19fdd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -501,7 +501,7 @@ static bool vm_suspend_rebind_worker(struct xe_vm *vm)
>   */
>  void xe_vm_resume_rebind_worker(struct xe_vm *vm)
>  {
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +	xe_vm_queue_rebind_worker(vm);
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 06138c3c4315..25c8760e2392 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -259,7 +259,7 @@ int xe_vm_validate_protected(struct xe_vm *vm);
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>  {
>  	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +	queue_work(vm->xe->rebind_wq, &vm->preempt.rebind_work);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
