Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1C6C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 22:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF3A10E316;
	Mon,  8 May 2023 22:35:27 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D587110E316
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 22:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683585325; x=1715121325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pRdkUgJKGMmIqm/cWONJ6WRy0TeRMecuF2+M0yFIAGc=;
 b=E0I/q5yzg6OspXnVB7Wcqgtp4DEFKmWOqxMAiS8nBSfWF25H4Fzlfz+q
 FuhlnRIil0NanJyuQuScBnuA54mxcYjaWJ9Zx0TNixbHOJTVcwVecWBjC
 05+/LN6AdmsFnyuKdOonIIm0OLzsZkh85yqe4fjP9oralRZZd6w3OiuGu
 P945WAwWJdewC1aIrkVWuz4PNsWxh3nP4RSyI1tk0uEny9J34fnb4Y1ZE
 PCwP0VYzuU158Ts39HlwRGP4IhR4y/U6RlLV+yp8MU/JFE3gKB//wNXnK
 nXhUgm55+5+6xYdCi6Zxbo/MeLrNlQ8Bp6sabUdKCh+4P+8kptURySh5D A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="338994938"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="338994938"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 15:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731454352"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="731454352"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2023 15:35:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 15:35:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 15:35:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 15:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgfeT5y0kOppTvOL+cjOOThgdVldKn3IcyF1X7C3D6A0yHhpofWJxWLJ8h0Jk13DurlnCIEoIKhzl7hXX5s/JKVI7vv19jaf8yaTnSxmb+Qel6hmu5KuT7TBztjocLlApF5iK6HJ7s71aeLkQBfc5Gt+MbmdGLIL0JqdO9b/poIx7fSDoeM1PVjiQRVVMdlpwhmq7pXo4cntP19NpBU6MdubvrnBLh+hSBhjHc98jmXHSH+rD2j6PT0mnyxpojacxGq4b9enGXEzPMoV4RamXVqblqx7e0XqlflXIhVYQKFr0ak+9GDItkbChOJts36T34EWQteE9+FocJ2eBXEoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nt5SahHMR9Xx4KkCezRsQklwRkmLrWSAKuxmW8L7N/8=;
 b=MiUOmu3O4FOv5c8GEBo7yWpn6mCl7ib9RWF7PZU9iDdqqGa7VTCNupMvrrZrBIZXS3e4m1C929NBbPqsF0LZp2vR63VHAj9EqJhXiric495arzZY7dcqoc6hu75QPShdskWeJF2kFsrbFkEmT9xP3J0ukET0RDOWwW835tgZUK6pP+aFDKBsTMBzZard0xUGTrkl4dvJtJiu3joLZCTAna1pFP3dhApZ9isQ4qaQNUj/+1WctzkoWSWeWCAfl4vpQ/wezd372ZsRKkdzX4nsmElN3+SV75SMyu+9qQisPeAc2QnMEYC0Z4Ku4xYPSm1d+VtM7I1tnAoAZmTgvlhSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM8PR11MB5574.namprd11.prod.outlook.com (2603:10b6:8:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 22:35:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 22:35:22 +0000
Date: Mon, 8 May 2023 22:34:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZFl5Cp4qc0AXQgD3@DUT025-TGLU.fm.intel.com>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM8PR11MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: ca68116c-93d6-4527-ad7d-08db50148206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: soFUrCwb/caMTI89S4IxJhDIcloAIcrg6CqPh558m6XpO+i9ixkE4to9VDWC/UO/N5XGxekCOyloTOyihWu65cUVP21f+nteqY/i+B1iT0IZ1DbvkdoGmMKLYZEU4PNSvnemdya/0RG5Xm6rR55qJlDyiVMibQukwJXK5i0DM22bjUSX6/OTIOGL4QQuErwdjeJJPEP3OdU5IhJKfjCzbKoz4XgU1zZWtTOwdOJBOumKRD0rKtlSgpF9F9Lud307wAbWPWJwWOC81npJl62flW2KjnBglP4eJzE1L6mYWWCv1NTQkz6PKucBfajqN6Ni7xayFVgL9q10tBprNqns/CHw9/jfSbJPawWa0/8oM0B/sbVNKT8tzsqbGbW6zeilS4AASRzAjBl0mfJCMp4YMa7/+UffDVYKQubTcfOu+ck68O2ZKvBD8sCDqSDnKJWUM594VGzl2A6073yHNzmsbOI3109CaPvlgCKTEw0Yl8AAXXTvFstFIm7K9i/KRyj59h+9ssek+Khs8ay14Dr1AAado4mbyV6Lw6X9vpbVueYTgsZLdjEVE3YyX78xFgle
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(66476007)(66946007)(316002)(478600001)(6636002)(66556008)(4326008)(86362001)(6486002)(5660300002)(2906002)(8676002)(6862004)(41300700001)(8936002)(186003)(44832011)(38100700002)(82960400001)(26005)(6512007)(6506007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eFGR0oG9FKfFibT+57bkUzG3xqbuDP0cjgBlehhvS9FXt1ivM8NB0T260okH?=
 =?us-ascii?Q?/HVGK1oXPqoVzJVp5eAXrCIskwR+lHexg7D7r9NVLT/NYtJ4wBOCxz/NwmQf?=
 =?us-ascii?Q?fWeuFjjTOLZWUQEBe9SSyioJqBhYZ5C/G5gsJXWAFMgfUpKgy97SqzFvKWEV?=
 =?us-ascii?Q?1POnTnIBB6Nayy5xV+H6nQXTCov36y0VXpby4KVd3bvtJSEKqwFUAzv7YMXO?=
 =?us-ascii?Q?yvQEc9wVbmtktM3bHdq6sQzpd3jOQJLmxPkrr111UjGxWG7e319q6pP71mot?=
 =?us-ascii?Q?s98+rp5NNaScNH48mF3+NkX4SS4SblATURvUwgZBNOuQWJsgH3SN07SBDljj?=
 =?us-ascii?Q?6x+nEyOZ3qBMMo0QX3zhX28j2xPMO7h/EyQuQZwZigoHmTRtaq8yhJ7pFZAd?=
 =?us-ascii?Q?eObIEo418HkRgp9eeWHdF5btt/C//8l4+8MCmuhufxk0vxJUDq9irryU25Rc?=
 =?us-ascii?Q?wsj5BeN6GxmTC53OlydUWMHLsTSzkOCtSpeExCKki0U/H1dcJmbawxtQLp12?=
 =?us-ascii?Q?5GFmdXRpYHin+WsdvZw0oTeX8OlcbcSU6Jx2MzZ1X4cv+JbFcuq3mWSd7qs7?=
 =?us-ascii?Q?+LKgSzYkfeWFkF2ovdT1ltfh/jyLzbtHVD69gMiy78erSmkBJmjRCKQLOogH?=
 =?us-ascii?Q?XwKg2pq9dLVVAMeFIBy/CNJZZwkwtPWegg6viHta7eTU19t3rpLB5Ig3w70o?=
 =?us-ascii?Q?C8WmzEJfCu3gy+LYlWsE2y6MRj1mm8TqXbbfb2lpdwVtFj18s22o9HSCQoW7?=
 =?us-ascii?Q?DP7I0budGvrJThM6Chyn9gMF28b1OIUC8W557SyDqYKiqgcfzYlRtRmrKEWG?=
 =?us-ascii?Q?oVw+l7Z3+tVYd77v0zzAflDsokINdnL8vxFEBmoFXiJY4Z8Sk7JAlTJBpJQc?=
 =?us-ascii?Q?7pyP2YWi+f3oOpoW7TVBK3eeAsfMKHoo5ZqRN4EWxJArv1cuwAWb/OcsgEdX?=
 =?us-ascii?Q?fLwTY66IAjQ1RuHJG5DGdseRVcqP5QfgDo1e8oqEqBrw1WnPl5CVD+ZvBcvg?=
 =?us-ascii?Q?s550QN6+pEfMW88710N+8C+n/FGVVdwdzLHus4ZfJAit2a1u5jO8+D0NRRXm?=
 =?us-ascii?Q?urnze+ToKMQTM1o3PQZO/3q8w4AYpcZtucB7TZM7aJIHtkAg0at8azYn+RT4?=
 =?us-ascii?Q?NqV56o1UYcubiueXgIRTrnxIp0Y7uXbByA9VlfHHgGvZDigNJ09LNSFh9CYN?=
 =?us-ascii?Q?enk9XteNzGTM+R3JIKt1Gyp0A0R4/Cy0zvZ7ukcaD2nIPfdxlmjGyQbBU+On?=
 =?us-ascii?Q?YNoJpqAxM7PQw/5UpLIWXbZYrlrkfx0S2vN2+GDGNcNv2STTkg0ywmU8q+Bw?=
 =?us-ascii?Q?PCoFvNLn1+ZmSK0oSSz92AtPUy1jz/zvBmIPFED+P10YQFog01++/NH+GGX2?=
 =?us-ascii?Q?j5eVaKqghRuoCt1QQE51ViDgJSJfRBtr+G2RI/4WhMgGti9q4R8nFM/isvGP?=
 =?us-ascii?Q?/luUoWF2VOIq7blFkK2j1RjjnKgdb1Y0VhgTZNJeU6ohNbNRAKsqCGa7RMvL?=
 =?us-ascii?Q?TG7agNkVJ9c4NE7mRkX+TXVPbV0mvgGhnLuQ6n3fNmbSOKHJPvBsm+RRN2as?=
 =?us-ascii?Q?26Juf77h+s48MefSZD0Abl2NmaHOOMOx5bX8GWx+8ZESIa+seKmOfCpvqiUF?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca68116c-93d6-4527-ad7d-08db50148206
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 22:35:21.7683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFl6tIlcogW+NKiEtHo/5/CaGw3NmKsThKpJgk3YQ9I/q3dkvWIEGiye5m25da8h+vVW3zYGKeyhz2XtrscQZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5574
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: Handle -EDEADLK case in preempt worker
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, May 07, 2023 at 11:27:30PM -0700, Niranjana Vishwanathapura wrote:
> With multiple active VMs, under memory pressure, it is possible that
> ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
> return -ENOMEM.
> 
> Until ttm properly handles locking in such scenarios, best thing the
> driver can do is unwind the lock and retry.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 91576cec000d..df1214f00a06 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -10,6 +10,7 @@
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
> +#include <linux/delay.h>
>  #include <linux/kthread.h>
>  #include <linux/mm.h>
>  #include <linux/swap.h>
> @@ -508,11 +509,15 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  		kvfree(tv);
>  }
>  
> +#define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> +
>  static void preempt_rebind_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
>  	struct xe_vma *vma;
>  	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> +	const ktime_t retry_end = ktime_add_ms(ktime_get(),
> +					       XE_VM_REBIND_RETRY_TIMEOUT_MS);
>  	struct ttm_validate_buffer *tv;
>  	struct ww_acquire_ctx ww;
>  	struct list_head objs;
> @@ -637,6 +642,19 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  		trace_xe_vm_rebind_worker_retry(vm);
>  		goto retry;
>  	}
> +
> +	/*
> +	 * With multiple active VMs, under memory pressure, it is possible that
> +	 * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
> +	 * Until ttm properly handles locking in such scenarios, best thing the
> +	 * driver can do is retry with a timeout. Killing the VM or putting it
> +	 * in error state after timeout or other error scenarios is still TBD.
> +	 */
> +	if ((err == -ENOMEM) && ktime_before(ktime_get(), retry_end)) {

I'd combine this timer with the userptr case too (-EAGAIN) above as that
can livelock too, hopefully Thomas agrees? Let's get his opinion on this
too.

Matt

> +		msleep(20);
> +		trace_xe_vm_rebind_worker_retry(vm);
> +		goto retry;
> +	}
>  	up_write(&vm->lock);
>  
>  	free_preempt_fences(&preempt_fences);
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
