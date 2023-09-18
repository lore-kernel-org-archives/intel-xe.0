Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7A7CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 15:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D39D10E0D9;
	Mon, 18 Sep 2023 15:36:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD8E10E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695051363; x=1726587363;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QW+BfnJ02oRS0MF/CZv1YBbYtYW6wj828DzQlbOVU2o=;
 b=NOJOYwJcRIUMoE+UA9960EPn3tKoI4wgYFomBl1y/W/+HoVayVaA5g+2
 XkVw7ReSqxO2DfhTnYc/S3xeykNBf8xfBa80G1PNb+ZNmtG8V33GE0Br2
 sxjR5F6xrow/LReaenBAhZQLbwCFjg1xwaKXCi6F365B3kWO5fSluy/he
 8iMBKFof0GtCk2uRGpFPhFPOmZtSSviuN+W3xTtVIg3JZhv9OTEneNvkN
 8/SOuqmw6KdWbQ2iyAPCJ3Ct0JcNEkGgyC4G3dpED461BUrikh1PF3hcw
 2GsOshvucJ04VQ4mbhCFAZKcUJFF1FB1xsTwE1dfaUbYjahW+4pu9CW7F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="410644536"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410644536"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="780935344"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="780935344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 08:35:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 08:35:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 08:35:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 08:35:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 08:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUaLBe0xjWO7L6VXla5xBSAHBhx1SaEi04fYqKTwYlYrRHgElgDot6ZSwl4itnZCwuQxCMX56u7H6XkA6jw7KEb46Bjkaz+fm6I92ztnAxlmHbY22xgNUqNURpav0iXmfL2rRETa56TF6a5b+X1HwlxE9W1GUSffEmRxm61ovPTTmdkp2bbhWYFKESi3NZuJREWl+MDQotF8cg2z3zgTguLhYnD91Eb+TPNPxXX+Ph9qZV8QeHK4mXFzHjUcZAMgGpPbeqjjNtqt2pRWLpT65h7FR32zJOHnZyXGzekXJ95ZMD4Qf2mcH/xHQifuRja1dNgtGP+GxaXKaHYpt0336w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XKsT0yOktt1x/uD0LVb3WPbF+SifQWDnktyAYD+BWQ=;
 b=FWTzg7t9913iVFtoY3/uXGsdVyDtmVhh5zksRWpda9Mz/Np2oYFiyj50vB7wRYc9Q5XDwx+go081YdQVl4gFZd3B8osX19BBe+e1ynNM2YyUHTXrImGfYa4AeUpoIzTd83dIBGXcz9VMw7gMlnV+asaquMGN6Y2U0nyqA0MqZ2+e8CekiW6K07PXEl3RS/AoWrlhHRk1eLQuJatGNMpUi1sq3ufFj/Wd6QB4Mf27Rc45gXfuao7L6hVGSPi6+xnjEmcU4Hj0VbBzk8lnb9mg+ta0oRpjFIw5/mvQYfyuITPqqPUnQudPDOMtF8QKSfMsCySmLJ7uyhDpM3ihnSma1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 15:35:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::457f:dc8a:bfb1:5974]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::457f:dc8a:bfb1:5974%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 15:35:29 +0000
Date: Mon, 18 Sep 2023 15:34:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZQht+LbhnhRkxTg6@DUT025-TGLU.fm.intel.com>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
 <20230915233445.2241554-4-matthew.brost@intel.com>
 <ZQfXuNiC5mqwrvTp@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQfXuNiC5mqwrvTp@nvishwa1-DESK>
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 2879cba6-bf11-4918-9e1a-08dbb85ce374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6wm62/J3kBqZlMCK04hUlgH3d/jmuqLyTpTjtT+1ea8rKH8fLlIk9bEmgT6Ljo4jzipt7Qk+R+lIYA9fZKb2tObpOwMsVuN0dlRnVkNbgZ5x/zb58A/BDDOQ4iqQjhDZC1FXL6hCFGQyjeZNWtDnNbgkI9d1tMI+SAiWCXIYmK8rLti1ppnjsGDbXXjtYIO25ZwdDI15QMsrl2suW93ZrnODNK/A+sm8Blj02CJPzuOT2D0FOYCxapPoI2TOZGjLrQdCBoybSJ/NhWoZF8dEQ4a+1f2acvxkm7sFpmxxsO7b4upN4f7kR2Jw34wCpBvM5kN1PSK+/QDHPI7VQaY8mm6rVApfv+KoaC6XVrIAjABQxdCpz2aWyrUady32Ct1sw1Cs02trOxmDQfQIrywAhLTnQcX7uf/4f9LPpz6AKMDAAz+0L3aDtmH8UCgfYYZrOmlr0L/SWP1X6Qui0Ys13zcBVZ3CV3TaQRmKJo3hUBafoS4us319Kgao3Wx+46iXYSEdkJ6LKcLwBxUggEqwk0GfhF0qnn3kNYcLE0cvo2w5IdSrsIiZMJVCWrrAzYTfk1a3u3aqeETzyHb4wRx5KGo+ZHZp8iDmLBDXsMQoTvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199024)(186009)(1800799009)(82960400001)(38100700002)(86362001)(6486002)(6506007)(478600001)(2906002)(44832011)(66476007)(5660300002)(66556008)(66946007)(8676002)(6666004)(8936002)(4326008)(6862004)(6512007)(83380400001)(41300700001)(316002)(6636002)(26005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?59j1LtHHQsZ2ZAX4IPrBrBvjh0EZa6FpBPjzH9HQtxSLDaBdavsThzR6jxoZ?=
 =?us-ascii?Q?3ry7f9TqSq2x+Q8b8/xFafMDDnugsx8MPHURw+SL8CBOaQi4Wq5lcmFDLh0d?=
 =?us-ascii?Q?5VZrivNqqyPPm5vVrYmYC8JQ5eZoRU6mLHqTSuS6d+ugB1Qp7RqDnOU0RxbN?=
 =?us-ascii?Q?yK77JqpIM2mU5yDDaVfNIu14ZkwQVPwL5SbI3cMciAPvW0C3PiT99/IoZ3no?=
 =?us-ascii?Q?bwuIyIYLf2TCC4sY1jyGFT1owwE2lKpJAxmkDwcP3nQs2ham22pWyXp5TulJ?=
 =?us-ascii?Q?zWT0NiGDVQ4es+ClBY1NIuh05PVcJ+W5TlLgeyG08L9iPOtNHLQipm0tst9F?=
 =?us-ascii?Q?sesnVM06iGH+sZ34LaQlxaBBMmKcCbu6cuJexrwQnv28VA9rGU3ib1gaDT4s?=
 =?us-ascii?Q?4CRGTDyReOoNFmcpbmLxd/7oYjm67qB0WWD9o3bA1tyhUBw/s85zqVq8pz2j?=
 =?us-ascii?Q?HxmwN9ekdsjkoFr62/wmEJ1vGY8/H7KlpTYOdN5M6cQfNvXbtcK8k/bbJz7e?=
 =?us-ascii?Q?uyGhP2pAq3xrRTZBSAZsnYj7hhCVWcrrecnWCzhdIEGys0rlBYMZRlF5RxL8?=
 =?us-ascii?Q?WjkGjDsl+xh08ZAB5UaBAYuM+Edyhk4V3xTRKMMj8Z8eI8JAIsW72qCkfAei?=
 =?us-ascii?Q?vOAEZ/HhVMPkZAXMYhrzRDGFXluYBykCbCSW6qui2b1cKivdV4dCZHmsTazm?=
 =?us-ascii?Q?dIvyX/emJDer20z2pQT5VlswxmdslRClObZV7F4ELydUr9N4Re9GED9JlzgF?=
 =?us-ascii?Q?f0ankV5tAgZkC8WhOd64Jm+CzEApJMsiI53xKtEmi1hX84klpA57ZuZTcXfq?=
 =?us-ascii?Q?rWS8zzqqdy5zYWsokRNegevQxPoorwPtNoYUsdl+R7Ux/nid/p4VJFU7DbTT?=
 =?us-ascii?Q?RatAoXVJ8T052UyTo07NCORisckQzzuCbygSie4AjHLDexhwpQeSMYezpDZy?=
 =?us-ascii?Q?Nxoh+l4i60fqNFC/Zn7xjV2b+LCc1lV+0r+/Cl/mrMmEDYvVtAbwhUbJif9X?=
 =?us-ascii?Q?z0r8r/q4iPYqKYLkodf9VwtG6ewZZUkLb+hpW3FZ6JXlfd5Ki0efJPgH5Drn?=
 =?us-ascii?Q?ozGeYGpW0bPAFpDlSigQPpSO11MvvOPn7YVybDWG9g2atxEO6MU+k4iMMR48?=
 =?us-ascii?Q?fd8nR9Ed44r1O6ii4cVJ5z7urqQIqXV3j1c7DeYkEt8Nuu75+5KvmponrGtD?=
 =?us-ascii?Q?x/Lq63bdlmfI7SMlDp4kHerD9Tk35ljnfM5KMaTry2XR5fpV4HVkEeSayrAZ?=
 =?us-ascii?Q?zmEnz0u/SA1Q7nA1x/3GqTsxk4eil9/g+FN+zo5cjAH0HJ6DrpLmeMmcZyGu?=
 =?us-ascii?Q?GcCw//Dcxe88Zoa8w02M76u5dab+ZamfDLx3ghOvMRjj1NocRI1jH8j+fT1k?=
 =?us-ascii?Q?QuKnsLzsKxcPJn/6bhk0QoQRY5cs0QbQ43bc+EU9NDWWWnNOyGhvkcQ8I9//?=
 =?us-ascii?Q?B7OlhQzpvHcIiS9u+zKtlaZ7rz2dvYlco8q2Kj49N3DOK+WBV1IevrGF4hlH?=
 =?us-ascii?Q?BDbDFC2gw+pusqlTkVRbyEE1teWfiVauqvqPJyfp7LnuazPaG5C6StiIjxw0?=
 =?us-ascii?Q?uZIjXZyhhLH6mpVW1Ph8iJO2v71i5lAsJ4PYGPDvmSgo1GJbtoXRaQVsmG7M?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2879cba6-bf11-4918-9e1a-08dbb85ce374
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 15:35:29.7229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rIpPLFt46vPWK87gE2m63YJHEYjUUILU7/X5Udnn52rrBmH45YF0YCtZZfC1BhlWSoWV0zU9vS6VbR2jAItmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] drm/xe: Rename
 exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
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

On Sun, Sep 17, 2023 at 09:53:12PM -0700, Niranjana Vishwanathapura wrote:
> On Fri, Sep 15, 2023 at 04:34:44PM -0700, Matthew Brost wrote:
> > Much better name and aligns with xe_vm_add_compute_exec_queue. As part
> > of the rename, move the implementation from xe_exec_queue.c to xe_vm.c.
> > 
> > Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue.c | 20 ++------------------
> > drivers/gpu/drm/xe/xe_vm.c         | 21 +++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_vm.h         |  1 +
> > 3 files changed, 24 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 93d2f0591c34..b95b62a2538f 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -775,22 +775,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> > 	return ret;
> > }
> > 
> > -static void exec_queue_kill_compute(struct xe_exec_queue *q)
> > -{
> > -	if (!xe_vm_in_compute_mode(q->vm))
> > -		return;
> > -
> > -	down_write(&q->vm->lock);
> > -	list_del(&q->compute.link);
> > -	--q->vm->preempt.num_exec_queues;
> > -	if (q->compute.pfence) {
> > -		dma_fence_enable_sw_signaling(q->compute.pfence);
> > -		dma_fence_put(q->compute.pfence);
> > -		q->compute.pfence = NULL;
> > -	}
> > -	up_write(&q->vm->lock);
> > -}
> > -
> > /**
> >  * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
> >  * @q: The exec_queue
> > @@ -861,11 +845,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
> > 	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
> > 				 multi_gt_link) {
> > 		q->ops->kill(eq);
> > -		exec_queue_kill_compute(eq);
> > +		xe_vm_remove_compute_exec_queue(q->vm, eq);
> > 	}
> > 
> > 	q->ops->kill(q);
> > -	exec_queue_kill_compute(q);
> > +	xe_vm_remove_compute_exec_queue(q->vm, q);
> > }
> > 
> > int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 03ee6993e7c7..433bdfae6759 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -380,6 +380,27 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> > 	return err;
> > }
> > 
> > +/**
> > + * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
> > + * @vm: The VM.
> > + * @q: The exec_queue
> > + */
> > +void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> 
> Actually wonder if we need 'vm' as input param here as we can always use q->vm.
> If we do keep it, it will force use to assert 'vm == q->vm' here, so probably
> better remove it.

Going to leave it as is because this in xe_vm.c I think it should take a VM argument.

Matt

> In either case,
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> Niranjana
> 
> > +{
> > +	if (!xe_vm_in_compute_mode(vm))
> > +		return;
> > +
> > +	down_write(&vm->lock);
> > +	list_del(&q->compute.link);
> > +	--vm->preempt.num_exec_queues;
> > +	if (q->compute.pfence) {
> > +		dma_fence_enable_sw_signaling(q->compute.pfence);
> > +		dma_fence_put(q->compute.pfence);
> > +		q->compute.pfence = NULL;
> > +	}
> > +	up_write(&vm->lock);
> > +}
> > +
> > /**
> >  * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
> >  * that need repinning.
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 5608e4e33169..813328ad3f7f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -168,6 +168,7 @@ static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
> > }
> > 
> > int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
> > +void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
> > 
> > int xe_vm_userptr_pin(struct xe_vm *vm);
> > 
> > -- 
> > 2.34.1
> > 
