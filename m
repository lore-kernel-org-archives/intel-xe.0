Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5984FC7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 00:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C43310E160;
	Tue,  9 May 2023 00:14:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF8910E160
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 00:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683591268; x=1715127268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1w1L0PRsRZxYig20UpHbYxS+X+E33OHqksNPtabXdGs=;
 b=OVUCCjUlzPFvpP5RT1m1y9LuqF6mwJxOszEGfcGvOE7hhq4G/0qTfr0t
 kbLu7rDbsDGa+YMOJqjYQnt5yFHM5QZoP6xQBtKyAHY4bwZLW/g5leHj+
 LXTXMMvgJ63oMbiE23EG/ccjW1fQCe0qQAIPUNA8Rz8UE3td7NWVnQbWE
 Dk5F6R9+QPWK2hy45FFfPC2n4OB2qaEo4KrOUREsF2XTP7RyOxtgPrs+C
 9AHSRu329RtxIJjAMJWBzj4Gh051su2FtppHviZ7RAw98Xeqz7sB0OSdx
 Hec8Cj9Y7/wpPa6LnmnpumQDRnYu4/NdATrS9bm0dOQgm+T6pRFtYRoW7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377874535"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377874535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 17:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="872972948"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="872972948"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 08 May 2023 17:14:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 17:14:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 17:14:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 17:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5C15mVB24o811d6HS2OmeQvDtpli0siHJBJT9T6rRgIJ0UWCKXoRw6O8zK131y4RF3UrAR1sfEWWNkJFfhBZo/mBDJYTlr0t6rvdVxhOU+MhxvyAf11RUb+jQKVD4OYo+yTzcZs8S3h/NaL0ozC9OM0A3NITc66aLtlcCO1W4I/BadabNix4vqGKvBlPv0eewQQctbygi6UysRC/e3ZC7uHjkpFTo5u/rfgDuN3/CoJEHTF5xzqDF4/RRs2MQyORRk9p8ImoAXYVOpcZEQbFnGZO5MXCUpbF6v4unIoKwDKjfq9lpYE1cCrYKxE/YUHV/fRJ7ORiwwSbaSrAPzpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxP/SkiskIA/ZPHvlPReReQlEKAHvM1OjVT6Vp8FnyE=;
 b=n8z1uMGZmLXq3s+TJx9owLVmL3o4v0kfRLgtFSNAAkiI2wHjswnoMpuEiThjN5/E/C4hHht/DPZNQuYjJ5oTBjbGiaOtExqJerEZxFplKrQ0EzedtEKI3uI87grHvY9ro3P0lYoZ6JfNCa1K2uoUwY9zwcWNASEIzaoFzgXBAQZ5aX+0cpPQkNvgsSBmF0hO4P4RU9gvk4AQd4YknV9/q9QtdyQxA06dr4HnZXOnDmM8X0ytLD2SiusMuBPwb6ZJd29uSl2dEOvZju/FWJrLjG61aMtTi3PrKdJH4SzXt4R/UVOhJOvCEU1yJfyjxJu3zYXUwg6/18NlTFk0Abcw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 00:14:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 00:14:24 +0000
Date: Tue, 9 May 2023 00:13:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZFmQQB/6TKJoOf7V@DUT025-TGLU.fm.intel.com>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: e05549f8-2d5a-4142-eeb4-08db5022583e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9KNjKpxBJA4+HkwFY4JIMrbiDlGZs+lvpDnN4zn0bysst2bRAFD7cbXwYb3Ir6+/hpEHhwkA9/jLu5hskHyj6zoi+sRRKR04m931XSW1+1A45Z8Y6/EHbtk1EgsREOPwkOk69bocyEZZ6ErTTy1XKeotlqAM/S56ZJgAVIn99ouN7/kbdEir8kSkWNpmHgapeHu1AOkIX7UKlx3qHP22zZIh85hZqoCo3tmg83uiPMD0+OPTnAFkrIFa9uO9LiVPOcIB+CqTAPt1BnJQHZVFAgtzs+Re4+5zRjFa40ywfhnIl1c74/7OV9JwYKz9HaBRGQyGDlFgwsj6gs/skR3/sQsLDIzMBmE4xQ9nT6K+bqjjmrFyUVScK8r4C+/5FbFFGZYRKrjcR9WiG8thuzjiyEGaFcMGx00DTJ2D7y6+j/BM6gXMlVtRX2PTDi4922YSJ1o1sU2vj9zL8aS9efl3175jNOC7TrZwNc0BPLJeVS/89Ri/z+PEM5NKyuzY0kVGQi9N2riXhakCnJdNvXB1TS59ckFNsy80lMm1fda2Ac7FwiolUPWFBFjXKKyZedD1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(5660300002)(6486002)(8936002)(6666004)(41300700001)(316002)(8676002)(6862004)(26005)(44832011)(66476007)(66556008)(478600001)(66946007)(4326008)(6636002)(6512007)(6506007)(2906002)(83380400001)(186003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lxPmYHWHEUwMlJQ7nXYOCD48WX4OhX7OZnVPmga6eI/l7sEy2mU1ZyoW7oNh?=
 =?us-ascii?Q?BA0J/CN4+rPOFiQuVEAKYrJAktIyyayJg8yuqkASgu9NpjUy9oV943B0OVJo?=
 =?us-ascii?Q?2/YeSRjbIdqJQUKlMNiidWKU48irP4eRw9mfFFLuIcCLwKI8E/Amtp0z79BX?=
 =?us-ascii?Q?HjE1GnI59tb78XY+woas0okpb+vrN4vZql8QElagWW2rcrk4BrGI97sz4KCQ?=
 =?us-ascii?Q?cT3kKoQLkujMfpOdgMJFBbHBY2CvpDZmKEJzr7E46Qc7Sxy3NDnPkTzHZ6t8?=
 =?us-ascii?Q?Rs3Z5FkJY7fgXWJ5pXlKkcxTuqBPR1jH7DXiipmeuK49v+FcEE2N/ahV+TTs?=
 =?us-ascii?Q?0P2+WqsdyjVx+ueZnX1hWDPBy7uCm1OHVP9sFtEZBjZ04d18PpIX1m+Sw3eC?=
 =?us-ascii?Q?oIeDCkuywTdQ0HDW02S4xUQMxfD9o0ON8P3H/2ULMucFvie/gXQxMlw5C4fG?=
 =?us-ascii?Q?LClI4Lr6nH4Kqho1fWDiZwjFYQKb/gro7UDb75UmkUfOfIR+MkstWycC4XbH?=
 =?us-ascii?Q?rJn+ziLXlwH7psrXc+uaAuAmz8kl/gSXV2pikHnoQ3ZYK/g1rjeSiy1IVGsC?=
 =?us-ascii?Q?JO0zyFS1pmDvxCyKod3zJKXFd9PA8HrIr3clVWXtygbAzBQIHAlhkuV/T4rg?=
 =?us-ascii?Q?JcbtkS+qtsX3N/ia6wXwi3k+jMhA5ts50QQaVy4vmdgn9/HIEV1dX1E6sKsM?=
 =?us-ascii?Q?We4G1JcBpPxGZouP5/wbwftAhK06ycPZit6BEmvtlkGR5B3OgGqZWBEMMx+9?=
 =?us-ascii?Q?/r+X7G3fyLzFJo0NtYgW8KLs4khrppfD6m3cMdIABABgzdNHItWTgxFt0Lnz?=
 =?us-ascii?Q?fHsrt8Ld3xekijiHzmON7PgQBwwXYa5B+zibLdCrLmKIKH08WrPv82FdHxlN?=
 =?us-ascii?Q?NuxHSvubw7FKQEQToTk4TEMxOHqG/MXKHz8QkFXS8ohkYNH0ei/nhZfvQD7V?=
 =?us-ascii?Q?m95HaPBhzKxSxZI+EL6BSq83Dvpt7DC7LByh9E8jO6+IZSXspTVTF3g2TDp7?=
 =?us-ascii?Q?JbA3owGzX7bcTX9kwiqloD1ZpdmO0OMNlKe4DtEtQAwpCYjRFfDJwifjBx6E?=
 =?us-ascii?Q?yd56z+j9Lp3XOayzyvFVkY82x+OOC+neuPzUj5ik+iv0LYlAYoPeA+bVPvtv?=
 =?us-ascii?Q?g3u3+82Db8nbFpG3DmwfGQvMFkSEWZlLsZvSeqx+rWTM6JN8Bl4sh5urlGvr?=
 =?us-ascii?Q?eGZSFEz2/EnHhMd8dbeepXIN43BULaJmY3JFAkWrC/aokcEMsQSngyQ/fODY?=
 =?us-ascii?Q?NizrwVkdY8E6Xhn6WSny5AwVUYN5m6Alb38y0bNxvlIL3QOMuazQ5daD7rcv?=
 =?us-ascii?Q?xnFIv3X7G72m5Lv0RNIkBirKpkv8Pi4sQ0rTnmslTJZjhI79cUNlYwyV0iz/?=
 =?us-ascii?Q?W7PChil4Izqto3mdQTewc1ZAghtrMFcvfRMetr8sLVmuhvzHM3UZYdZP+a42?=
 =?us-ascii?Q?Ke1TKUaInYtVmfEpROGoKA5IkWGOcENOaXID8tzODr/3Jzu4XXvUUaPagf6S?=
 =?us-ascii?Q?qieetuG8NZtaPXP1Vytnw/JUpeo1Vc08Lxihei8bgfAVLcIUfJasjpvNQsm2?=
 =?us-ascii?Q?+siUemqQUsK8NjDmxg9VDqePBMk4LtfPllC+6vBevdRrI/W1TEXpshwvMHRY?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e05549f8-2d5a-4142-eeb4-08db5022583e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 00:14:24.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mzw9nmu0v12iDGd09T1MtaghTIbfg//yMuFDFeQ2dhvL4gUw/xUlzcX5B6BisRHB1ZYSTpJogP3BpVNHH0XYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5902
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

We have the same condition in exec IOCTL, let's do the solution that we
on land here (preempt rebind worker) there (exec IOCTL).

Matt 

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
