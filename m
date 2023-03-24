Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6260DC6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 07:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2914310E50C;
	Fri, 24 Mar 2023 07:21:22 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9406C10E50C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679642479; x=1711178479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k+ithXjD/4tYcwoqMgQgphbBtP7eiLoPfUHYVwTAEos=;
 b=Y61FzE2GNk0E/dMlJ822rvK4HnsVWnKR3jn+SadAkGakfiaKFOXyb174
 iwL8M4GUfdzvVH+/jgove3j2xoLi0LPRZjHjwE2laFyDDqpcRU1AN7zgi
 Eni+Wd0kqqrd8NwzSsAkChr1dP4jeAvbrk8qDmY5Wg58zuiJLYjzyAhCq
 K5DA5QvN8MNzySU8Z3CZbjmX11/OJOycv6e3Rm1h026qxXWMi1W9pZO9o
 Nkwyhs83r+hZrigP1XwuMyx91I43NEXjNWwpu65PE3OseWmQjZXXY+DSY
 XfUs7yMqk4yUs/rx+pWcBz3V2ldA5vwrp+Rr4G9BbtFWJrD6oMqU5SSfR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328129011"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="328129011"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 00:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826145424"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="826145424"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 00:21:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 00:21:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 00:21:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 00:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwhdRAcApjnLHczuIFQT3/Hkr+khEBRXeM3xIs1J2Y0CvsQSU+kAFPg6XNPZestDrd8b8L/M1alYj2yGvhRUy/jonAXawM84k0Mmi1kWGi7XPI7SeyTNR4krT7M2GhZfnJSbMGkfUxjSp6A3Fx24Syum96X1xOLVMF4yWiSZP1Lp5zBpKCYXJzzYjXicbs5wRUPSQFiMrAs8l74TvonKna1LzCUtK4ocsxL/BhE+B09IeKpqXjn+n9JidOPajFykBVF+bDFM165mavfvnPV900pCb+tYL39x2kRwlNtes0SGt3kO+l845IpaohAdxOq6XNZr8aUPTzcBiEZuf55g0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8NORukbvUxI1cy9EJjm+OqJyBqcwsze5g4XsA/SGWY=;
 b=cWuwOyR+p4U754TZ+qj+d5B3EA1+WI4G3oRZ+IuBlF+yYcM4DYJZvCPg6BUEgAmdhDMaykEL9aeJeCInlKzE7x1EY6hpPGGMgbcOr6ABYuTIIyifE5t9rHX6p/lc3lYebrQhBXs8XbL//TMeCpmYZcpNTDrjsYLRn3WqyfwhoA55+1EHa0LgVUFRgCAwolnRfKqCOjV9+vPoWS9DyuQ2eAhn35Dekp6ySXD++feLVKZmNsZ/hvG7g+dijowbmzaQM0LtMXGNKxo9QGI/axT8GIwG3imPhJxjl+WCV05tzIYBxRLaPkpoP6ysK/72JMJdMmPOO7fKE8mg60WF+PnkXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 07:21:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 07:21:13 +0000
Date: Fri, 24 Mar 2023 07:20:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZB1PRMW0fmWvuVs3@DUT025-TGLU.fm.intel.com>
References: <20230321234217.692726-1-matthew.brost@intel.com>
 <20230321234217.692726-3-matthew.brost@intel.com>
 <ZB0+yQ4RbWJkwwOZ@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZB0+yQ4RbWJkwwOZ@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:334::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: a5234120-9886-4362-b26a-08db2c38593c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QX+yV1E5kAiPA3uYTEWQkyq/d3XztaIHKM5yTYB4sBBmkOZk0oHpmtXiQqOQsPxb2u2/nm/ZEaGM/8gAADMvHuWeoNie8yRMQ0E5TluUDH8U5x5+OkOB7gdqDGcJUCudpJMGkHYDCPwUViEjHG5VdDVQ020NGc7QV+j6caJSfmWtjzKfEtn0XMVuOq7t/TfZBA2nboJ+m4GPbjBN8nMmhAQ50Uukos3s8V9TaFxMn6wuImIG+asJWpTpnBbz0G9qoFU/6ElJg7kNMEjDA4dzXvG44D5DkMFc3icSsEBprDgFrZ1OfpJh2X0uNDWNUR6f5hoP6x2D1Vj59KDMvD/RUPMoKNVSn5bmfdetSaSplfotrqvANQA3hPcGcWcO4HjaVhC+RssQsZ++95X4Fx7pZi8pJEiBaQhktcEu4tz/fH9NireuEWUHq/li1cpLcZgU1+xdizFSHNxCxEk7J5HP5YVrlER0jjRJcf3N9VEoBDpwpldy2v7SzNDg/JL1yZgX7hIstYaWNZ3R4tU3YNzpL6GqqPHMrLczGn9qztCz1VT90AqhvQrBOXE9xlyr2pfhmJvmdNCSse6os80MstEwu80BqbiEQun42rDbMR0PhFxZFX6UptZwmADX9DTQ4zKuSFQdrg+A09eYFV3TslCd4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(66476007)(8676002)(66556008)(66946007)(4326008)(6636002)(41300700001)(5660300002)(44832011)(82960400001)(316002)(6862004)(6512007)(26005)(6666004)(6506007)(8936002)(186003)(478600001)(83380400001)(6486002)(86362001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1oRSDKiKpp9vjyE/riLMmct8WS8FZekM8BX6skX8g3utiGaGL70zx/z80vFh?=
 =?us-ascii?Q?guU5lhTUq/jjGhfqScDdMOetTkp+Dmk8Rn7y5ByItoZ8w+8jfNdKTqrBpleW?=
 =?us-ascii?Q?HRSmi1PaFtoo0MmMQupnK1BVxBlqInD8VTXU74g/ainIQYD1gCoZhjZPtTmR?=
 =?us-ascii?Q?hJ6mdHkBwwX91tt7Pdabbnnq4KuCOhKilgo9haobzMCyvq06w2yJMOfPbhW/?=
 =?us-ascii?Q?xdy8tlS/+Re3FRIznPn0vNRiHqHAbNKjq2/PgR6BvelJi3Gayd33a5tJCuyc?=
 =?us-ascii?Q?tfLTbt7benCP6FkCnvXwAZ9XLwY6Xo1a6TyzJ/8dxiMLsTfQcAl8p9OWVjy0?=
 =?us-ascii?Q?I+Qe2ZKnbAT+BJWxcHl5jIZWXo+T6EZ4d/M3EjMetBErAX7YDfAtQUdHwrV6?=
 =?us-ascii?Q?OnQDiq0CKrfrhYYGAelgAbK3Kfm6kH76ZPR3YIhFKKUZaqYB3Aon6ihwNfXp?=
 =?us-ascii?Q?DOLgPvN5MP1Eib0SbnvGPhZyWNutH5idM3RDWJdeVRsWFbw597Lb7d68LlLX?=
 =?us-ascii?Q?/6a/jri5zrs2f5ePF7QZUNcvpNU9TjR1MR1HbhIPvTphH0X+DS224iSVaF6+?=
 =?us-ascii?Q?p0wtj2XpwQ1fk0Bdc9Wg62gwhdvQdxD2WpE2d3IdO1rBLB+oyQoVeCsRm6dy?=
 =?us-ascii?Q?ggqFaLUOEca1zo5GWJNVcYrl79wEYGfBHtOZm5q+MmEl2FfOltTihOt0gOl4?=
 =?us-ascii?Q?J8BVvn2DvKgpYzEKGiT2EzRB3wxUSqQKfozxgL4XySvh3ZSaqtgQyscAe1Ht?=
 =?us-ascii?Q?9XPwZA2v0qXhUCfVto2Qv6DVHfgtkvQ3sGaojG96Xri29iHaYVwF21UHw9YG?=
 =?us-ascii?Q?WtuuLQaxfawLvY+u86tjY1/Cb9I+ZPCQ8qqHlyvypG/ltmZWrP1nBzcgfSzJ?=
 =?us-ascii?Q?4aW0li159ejXUSQ6T1pNdviUhpUiVvywAvE7RYmLruEvji3FJv8IU2CBtD9n?=
 =?us-ascii?Q?tTImKGlF4KF0sWq2XcCtPIEjcrPVGqiT00RZU06v+NcYtUVyPENLpYxOg4a9?=
 =?us-ascii?Q?AZ3T0YtrPY3zD5B9ZfTgdsbxZV8mUUAEQnNguoO/cLcbRrvJRZ6pRL1Hmd9J?=
 =?us-ascii?Q?M3KY1PPK4mT0jFvWY/ZtTwO4gZOilgJgZnuioSCWepc6jlSjG3l49ExhMwG5?=
 =?us-ascii?Q?ZKSKxW3FlMKvOuRtkRfqqNPqaR/WFSzgd5lhWykDM55cSzFns+S0GhXU/VkY?=
 =?us-ascii?Q?7rx/GHROOUBX5b5+yNQx2hsqFsO4QYvJaFTtjXO0LEG85IX6hTanUT6IMjeS?=
 =?us-ascii?Q?1+oUL3647qOM6pc0rQuwpNfSxNdkAXEQINcHHKN+J349n7EDx4Z9hYHELIMd?=
 =?us-ascii?Q?6Y16LrGg43T/Lj8BVW16nfXqRWSB8KqoXqzW8nATDi0vPPq9UHdcU7tYHkOu?=
 =?us-ascii?Q?fGUxH29CUqCApDlPgbA57LeBtngfnFCSe8E7GZ7IEesAO9vwMW4ruddAL/Cj?=
 =?us-ascii?Q?QJTOys4fEtORSDk/+nSm+eY1XHNKO1R6QrJ7OZMUB9xju11ahrRFolx79s5P?=
 =?us-ascii?Q?uW5Hyxo5yT5MpeP6fuIj0AHkYkGi7FtvYuMgaOaED8W9VMmbNetN7r2kKcQN?=
 =?us-ascii?Q?XjkEQpZFf89HLBjEQraKjwET497CN/jYFvyfiXWOMdilOCSgEaPkr/dVR1xs?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5234120-9886-4362-b26a-08db2c38593c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:21:13.0935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHcJgchKtfPLNjiTUgtJBXe+mri0A2WadOYHALV/4I2mKWss3izEa3RGYJJsM7bqvwLcLgfLKh0QI/bulA8sGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Move in fault mode / non-fault
 mode check to xe_vm_create
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

On Thu, Mar 23, 2023 at 11:10:17PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Mar 21, 2023 at 04:42:17PM -0700, Matthew Brost wrote:
> > The check for fault mode / non-fault mode was in the VM create IOCTL
> > before VM creation and not under a lock. The increment was after VM
> > creation under the lock. This is racey. Move both the check and
> > increment to xe_vm_create before actual creation and have the lock for
> > both of these steps.
> > 
> > Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_vm.c | 45 ++++++++++++++++++++++++--------------
> > 1 file changed, 28 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e7674612a57e..965cad81b02a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1060,9 +1060,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > 	struct xe_gt *gt;
> > 	u8 id;
> > 
> > +	err = mutex_lock_interruptible(&xe->usm.lock);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +	if (XE_IOCTL_ERR(xe, flags & XE_VM_FLAG_FAULT_MODE &&
> > +			 xe_device_in_non_fault_mode(xe)) ||
> > +	    XE_IOCTL_ERR(xe, !(flags & XE_VM_FLAG_MIGRATION) &&
> > +			 xe_device_in_fault_mode(xe))) {
> 
> NIT...is below simplification any better?
> 
> bool fault_mode = !!(flags & XE_VM_FLAG_FAULT_MODE);
> if (XE_IOCTL_ERR(xe, fault_mode != xe_device_in_fault_mode(xe))
>

Sure.
 
> > +		mutex_unlock(&xe->usm.lock);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +	if (flags & XE_VM_FLAG_FAULT_MODE)
> > +		xe->usm.num_vm_in_fault_mode++;
> > +	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > +		xe->usm.num_vm_in_non_fault_mode++;
> > +	mutex_unlock(&xe->usm.lock);
> > +
> > 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> > -	if (!vm)
> > -		return ERR_PTR(-ENOMEM);
> > +	if (!vm) {
> > +		err = -ENOMEM;
> > +		goto err_usm;
> > +	}
> > 
> > 	vm->xe = xe;
> > 	kref_init(&vm->refcount);
> > @@ -1182,13 +1200,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > 	if (number_gts > 1)
> > 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
> > 
> > -	mutex_lock(&xe->usm.lock);
> > -	if (flags & XE_VM_FLAG_FAULT_MODE)
> > -		xe->usm.num_vm_in_fault_mode++;
> > -	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > -		xe->usm.num_vm_in_non_fault_mode++;
> > -	mutex_unlock(&xe->usm.lock);
> > -
> > 	trace_xe_vm_create(vm);
> > 
> > 	return vm;
> > @@ -1220,6 +1231,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > 		xe_device_mem_access_put(xe);
> > 		xe_pm_runtime_put(xe);
> > 	}
> > +err_usm:
> > +	mutex_lock(&xe->usm.lock);
> > +	if (flags & XE_VM_FLAG_FAULT_MODE)
> > +		xe->usm.num_vm_in_fault_mode--;
> > +	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > +		xe->usm.num_vm_in_non_fault_mode--;
> > +	mutex_unlock(&xe->usm.lock);
> > +
> 
> Perhaps put these counts increment/decrement blocks into functions
> instead of duplicating them?
>

Sure.

Matt
 
> Niranjana
> 
> > 	return ERR_PTR(err);
> > }
> > 
> > @@ -1843,14 +1862,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> > 		return -EINVAL;
> > 
> > -	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> > -			 xe_device_in_non_fault_mode(xe)))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
> > -			 xe_device_in_fault_mode(xe)))
> > -		return -EINVAL;
> > -
> > 	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> > 			 !xe->info.supports_usm))
> > 		return -EINVAL;
> > -- 
> > 2.34.1
> > 
