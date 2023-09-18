Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6BFCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 04:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382DC10E0AB;
	Mon, 18 Sep 2023 04:48:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE65010E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 04:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695012496; x=1726548496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FgjJl8j8nFEGb/SaP2O7R6wFmMHMndCL4nNkssN7i54=;
 b=grIA97nixi3l0LCm84JVlfsyGJDqsMufuKF3WCL8LTVFOtKt/PqcbHlf
 xv9VPwbMS5kAuvCN58JivNoMnP/XVPysaOjz4tdDHqzZnjWxq//zeZu9X
 AmM+Z2qlD6y2oF2QQO9oAD7faVH1PPLIS16jlghmc8gE5ImScimQFt1GV
 wVBFr7i6H5DlyYtpCS6t4KLFnYIl4os2O7u9DoltFspZoNMK7GGJis4JI
 vtO9jBYNnsdsGA+/DVhN/CJU6Gl3vab8U6lvCNTYz8MNBX6wwi4sQOAfo
 /ZtdIwCJBJ4WoPzBus4RoznB8xJ/IfqQ15se06CWlTMsu/Lo4p6hzuPrV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="358980754"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="358980754"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 21:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="780760286"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="780760286"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2023 21:48:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:48:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:48:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 17 Sep 2023 21:48:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 17 Sep 2023 21:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OO2GkSCPoK89iohCB7mbk/9gFwPzZtjeEqgs4ZwcYQYrYuHvL3fDVAlVUVSY2j9iBjI86I0p/DUvsAgVSdoeNQLLko9ShT7sfkYn5/GvTW2aNDcS1jWJLjkl6gJRnXNX8NcXAvH4tMelJgtBexSA2a3EbGSK3+h3J+j830A6Avf4+JvmLPzh53A8mXsJlu4leP22BwHNQPHcNzZR397IczWGoD5jVg42Upr6hRR7KxVcSTpMww4T67i5IOWaRea2SyMWXvmmJggXS6j+TEaeRd4/dKku9g4OFfh4502kH0VHv6o9R38CpOz//lwmpP+ahmjVVCFeG7AIxTWJy1wf3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+Mmu4L8uaxYtqF3XwQMRqi3Ydsslf2mZkV1S8pcnYw=;
 b=CwK8NKS2TSvQtmGWvt7AJCBBwYhb7K/dfip6ZFnMDDI8uLj6Q5cVOrjbbe4jsgTHtycDTSsm6huM/ME2kCip5Oz4imVwATVeaTG1MtOuaLdz7yl2blyyu2Fz+Lw9uAc0EFZb2KbpVJcvOyR5hpHr2SZxwEcDcVpx8vTjTObgPkQNhvIilpG5lTo+KwnIIFS/cxC+U3+cBIgNl/E5FgjJbvXpgdJLzwsRHuYMXtRa6e6OL1B2+DjP7jkoxm4VLpMdAAa+b1ifNm5ZfrQ0/CqsZLBmCbl0EnzTe7KkQZKWuCvT61bVhSxjrqN/K9u7gFwNcjpXB7S9qJHUYnSX5WsbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 04:48:07 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 04:48:06 +0000
Date: Sun, 17 Sep 2023 21:48:03 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQfWg99descr2POc@nvishwa1-DESK>
References: <20230915232021.2241094-1-matthew.brost@intel.com>
 <20230915232021.2241094-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915232021.2241094-2-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dad627c-affc-49e4-95b7-08dbb802730e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VMZZWvWorBqqjUcEDVOV0AdB+HR7Vb7L+0y6+3uS5GeZj2uXmDdyLIfrcZy80w3s0WBNRmfqW8x0Yvi/SuEDWo2SZXGbAd0XEpJSfwbe4U1ni5rMhDpiCzrXe3u1f3O2XejOn5afeJngE9l62bGimidUJ6vPEJ8TJAU7pcJLzdpnLl1WnSnFy7b7ryZOOAxd60p++TkIvjXV+GODDz4+L7EtCvlKr6EjfkMc4L4MHDZhp0DjehSyuoF5KtfVhW3aDNN03fDX82eb+7oCjwM4kAI+U2WOcDSIEXfn7jKHApu89g0XxviHcXqV9jWrbTTWe6xfPLvIkkpyd7AvTwYGHmZ49FF/UFP0X+aM6pvdPBdmHt7Q7B1g94VA8Tnw3DFGkiGwEZH3qPcdK+xFjiORbaYqG54g2plMTghhG4JQ42aiV2j+kF3eQA9vgybQJRZ1ntPOMo1IFY73y/eyFFBUN4Ko1xw+rhTlIbuFlb3l5fV8aVvAgIfW+Fsgnq0e3RRRULhedwWL8OXEXHXRDA0cOXv9l1vqQDzyXHFsmxFAHCsx9JQzsO+4QQuabffUei63
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(86362001)(38100700002)(82960400001)(26005)(2906002)(9686003)(6512007)(83380400001)(478600001)(5660300002)(8676002)(6862004)(4326008)(6636002)(316002)(8936002)(41300700001)(33716001)(44832011)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bzjy2GXoqR4yokh7wcupvQW9nD6SJlIiwrQe7FzIejxepr2GfD+5lLrN6uKk?=
 =?us-ascii?Q?C8f1HaqXpCO6PqiZPIy76U6r7KxSfIJfIey/TT+ZQdveVKrre7CgO1+Gj6br?=
 =?us-ascii?Q?Wf+RtI2GAMeZoKL4vLYN6V+wxcOD8gte4s+EAmJrcE5wVMK1N/Sz6mmHicg0?=
 =?us-ascii?Q?NswSxP1ZjMw4508668Md8PwT2ZJMLqjWhGA8YKd8fZzXbuiW7mjR5/+2Y3b3?=
 =?us-ascii?Q?S/3e7EHIpQG21VV7YitCGzorFWSHjQh4ho2BunJlPMpj7EGK5dq0NWcWyhGU?=
 =?us-ascii?Q?4aOKqhRJtsy/tpiDzjkKhMz6UqHDAMnMBY+f9lTyG6nhta0YwLJGRrVifwfv?=
 =?us-ascii?Q?l5D6IOkwf2brag6PoLz+QQWuffPG8CkJyUCuDM9fV5BehqaqPLhAgaUrpC7q?=
 =?us-ascii?Q?4hBcmrQMX5m4esGDGR71PXG4zncaXerk6tIz/ETsXo0eCOqA2XT1187epgS8?=
 =?us-ascii?Q?CyTvClORiCHXoJSqIj4stUlSczTD2YA4nQRr2g1XGRjYNT3KNxek70MGWRv7?=
 =?us-ascii?Q?vruBoli8ImMNUeZuOCVsU6L4/bAYEhKDO+pmcPqV8B3ulqMUmxmno3iDQIO/?=
 =?us-ascii?Q?KVVToTD4+jkaYD5T/T0yiIC1egdvRQRBjN5snf5oXE+YlgjyMrgM2fS7QEiT?=
 =?us-ascii?Q?XAhH/00pV9M85RD1kN410wQDwqJxlAOZWxrarYJs8e/u4pxXz9rPKIRKgIWZ?=
 =?us-ascii?Q?N06p4611b2wT2E04Nxi9S1pS5tzR90tXcLhSaRIzGkbOTf610p1PpDN2rskd?=
 =?us-ascii?Q?M6vN0qq6rbKgX9IGzE1iuMZ3FIn5bVHZs8qpf1jdUFMelC5f4xMiKCTnWqz2?=
 =?us-ascii?Q?ls9BDN71YmgXS3pbDgMsgxdSLCgwwTUC5DKTJQ2yq9KPYp1ABGqyg8/M88aW?=
 =?us-ascii?Q?eh+4I48YOwSH1aYE95NJww5InHoYOZAjtMxYSInWs69qw8CPUudAAHPOR2Ws?=
 =?us-ascii?Q?vT/g0gGU7UssUhnPt6Y4j6HSDnsUuDxjw6XakNgLaBsAAXFyY/zt9HCaLbSl?=
 =?us-ascii?Q?OeX4sasYn6RvjCNrvUMXHYErXtiUcb6CUl95qngV6Jha29HDlBcGCqwDuhXl?=
 =?us-ascii?Q?3ug2ujIqcS3I3rfY5TlZDhVZOZxcjfJMihncmyvhHnkLjGhUICIDYX8u/OoN?=
 =?us-ascii?Q?qK5W+Lx2xsi12HnXl2NUmyp2VoONZVEamNYnYkr82ty7EIzh+0YvMkfNilbF?=
 =?us-ascii?Q?/9Jr9gc9UWe/9HWPybktp73NBtPZCTtFgMHw5zkkMwgiaP2OODGJCeSwXaxa?=
 =?us-ascii?Q?POgzIbtirKqjFaqavinaWAIFuP8JpekwmbKoJs71P/brVoWk1+eCNAEspVLQ?=
 =?us-ascii?Q?pjpPsGv5srq0jiR1BFS7JbpkqhT2cpit3QbPFgvmhob80Vh/u6yKST1C4fCH?=
 =?us-ascii?Q?hdZMlBEXHj6IJuMZMFncTd1zyPdQNmqKFe7/nS6X97nu8/vlNC6rOiKMpih+?=
 =?us-ascii?Q?QZJ3bq+Lljbtd4eUSSQKsH0nynnk8pa2ZiojbwvI3NEGSPFt4lwQmoSkIC2N?=
 =?us-ascii?Q?YdlcqGBXqqJeLC3PggjC6bPIY+shliGxw5+krAyUlD2aUBqXQbUP/ykb6QX8?=
 =?us-ascii?Q?hsCPFMzMqsUMHmitYi6U6oXf6YpZ/GCagnkJ+ww0CewP1pVPQQsSj6deCaHf?=
 =?us-ascii?Q?NVAHnCyn6zXhjN/lix4fbpE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dad627c-affc-49e4-95b7-08dbb802730e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 04:48:06.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dx2k7RGU2iXYiVCowo9ONcHgdvaulr/eSJ0a0B3yRQve7NDDGYNc02gUg9vIYwNf/bcXFHySwXKzkyW5zPfuiAGVjs7r4gFXDN8hz1uxANS45EH3Re9vB6eX0BJePR3r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 04:20:20PM -0700, Matthew Brost wrote:
>We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
>uAPI, deprecate the implementation first by making
>XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP. After removal of
>XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE the proper is simply inherented
>from the VM.

s/proper/property/ ?
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

>
>v2:
> - Update commit message with explaination of removal (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
> 2 files changed, 16 insertions(+), 47 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index eee64ba87d50..93d2f0591c34 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
> 				       u64 value, bool create)
> {
>-	if (XE_IOCTL_DBG(xe, !create))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
>-		return -EINVAL;
>-
>-	if (value) {
>-		struct xe_vm *vm = q->vm;
>-		int err;
>-
>-		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>-			return -EOPNOTSUPP;
>-
>-		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
>-			return -EOPNOTSUPP;
>-
>-		if (XE_IOCTL_DBG(xe, q->width != 1))
>-			return -EINVAL;
>-
>-		q->compute.context = dma_fence_context_alloc(1);
>-		spin_lock_init(&q->compute.lock);
>-
>-		err = xe_vm_add_compute_exec_queue(vm, q);
>-		if (XE_IOCTL_DBG(xe, err))
>-			return err;
>-
>-		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
>-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
>-	}
>-
> 	return 0;
> }
>
>@@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
> 	if (XE_IOCTL_DBG(xe, !create))
> 		return -EINVAL;
>
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>+	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
> 		return -EINVAL;
>
> 	if (value)
>@@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		xe_vm_put(vm);
> 		if (IS_ERR(q))
> 			return PTR_ERR(q);
>+
>+		if (xe_vm_in_compute_mode(vm)) {
>+			q->compute.context = dma_fence_context_alloc(1);
>+			spin_lock_init(&q->compute.lock);
>+
>+			err = xe_vm_add_compute_exec_queue(vm, q);
>+			if (XE_IOCTL_DBG(xe, err))
>+				goto put_exec_queue;
>+		}
> 	}
>
> 	if (args->extensions) {
> 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
> 		if (XE_IOCTL_DBG(xe, err))
>-			goto put_exec_queue;
>-	}
>-
>-	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
>-			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
>-		err = -EOPNOTSUPP;
>-		goto put_exec_queue;
>+			goto kill_exec_queue;
> 	}
>
> 	q->persistent.xef = xef;
>@@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> 	mutex_unlock(&xef->exec_queue.lock);
> 	if (err)
>-		goto put_exec_queue;
>+		goto kill_exec_queue;
>
> 	args->exec_queue_id = id;
>
> 	return 0;
>
>-put_exec_queue:
>+kill_exec_queue:
> 	xe_exec_queue_kill(q);
>+put_exec_queue:
> 	xe_exec_queue_put(q);
> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 347d28442701..f73b9e80b25a 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -60,12 +60,10 @@ struct xe_exec_queue {
> #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> /* queue keeps running pending jobs after destroy ioctl */
> #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
>-/* queue for use with compute VMs */
>-#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
> /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
>-#define EXEC_QUEUE_FLAG_VM			BIT(5)
>+#define EXEC_QUEUE_FLAG_VM			BIT(4)
> /* child of VM queue for multi-tile VM jobs */
>-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
>+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>
> 	/**
> 	 * @flags: flags for this exec queue, should statically setup aside from ban
>-- 
>2.34.1
>
