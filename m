Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DBEC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 07:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350110E509;
	Fri, 24 Mar 2023 07:16:33 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793F510E509
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679642191; x=1711178191;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U4PaMGhrOeovrqlUiEh4eCTEPr7NSrChfnUR0+Sqy4k=;
 b=X6X2Vttzl2+r7HjrUPrSSxdMWn6bncDrRWOgQQLMw82+Zypr9hUn5xma
 aoWvQsCwfvOEJ7WXh6OYI0APS+Ko8OmFdOHalnDjJQqo84HLK/m1y3MQQ
 ZwfjVTtDlICjr3xF2FKsCCJTD7fCXi9vuCiX0BimKpPSWbemamyOr+I+0
 1LFqLqqatlJNeqzPjYDU0isEw6i2hlxJbMW6dnr3pDQf1vWhzWFH/vLO/
 KqvJBNs4kXQ713eySMYs6hR7KhXGfu/01jqHBFT5FOPnLjEFx9bAZNwVj
 qbYZyDgOtilTFK+5bmPu22blk96VIgfZnKORyKVRWaDo++sknqEFY6OKm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402298100"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="402298100"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 00:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1012147229"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="1012147229"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 00:16:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 00:16:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 00:16:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 00:16:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 00:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxCXTyZbkc7v5EJ1YR6qehk5z4zKa6mmgFFIFn6AaJ0cl23n8SKyGB8obvI7F0+RwIlgq+AGNYpFbBU8AAV5CG9+vY3e3eFG1IS4xyUZvOpW+TV8/awWzPkljrWcQgTIzL8L/200VkTUkTw+RFb6EgP+HF1OCurObQ/j8z/WvWV2MR7/7pOwmBTdjIH7mmdBFZ/6wqo+p5i/wTsAN2/iB3LO9tgDty407HHIEVKGSQyVGuSIT3gF2VbVASV5D+UK3q627kmOMHXurxcJ9m6vrEPmOHYNfG0b7Gbpc2ShgU7LqGb5eciFx2gRI81FlhwI/YUwvRL8nygwDGGHHhr1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y95ldNuzHSQQ6geeib3EnPsuPionUGM6F5xQFH8QfdQ=;
 b=OqgE40Zzg9K/HIZEEMsnoaDpIlSLm3EdkJpa0oIa494ag1EEDNgWud5NhRfGBmmuIF2zsazXvwsidX2ei4Md9lxMi7+YY3XJlCjLmxDZv0smQQbX4qDIRPELDX+Ej93D4yllT7CkgtI1TbHcMdQYL41AUkEp1bzA+ZhIEjog4c4Dl2EMiWeOUzRUnSxfNrRW1iPezlAAQsqF5c4PpzhSC8XYIzImomZs7hR+X2nGkEqgkWIzLQjihGIxXxra2IFCKkYk6b/aHB0Vqv9EwjVOsYceEUO21BA+l8AlnHORjLz/12GvcCjNj1f5qbQT1lXbAhYvwvDJkaKqCtrP7IsvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:16:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 07:16:08 +0000
Date: Fri, 24 Mar 2023 07:15:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZB1OE5Et7UbIeEb7@DUT025-TGLU.fm.intel.com>
References: <20230321160815.673423-1-matthew.brost@intel.com>
 <ZB09F9ghaQFHLsNx@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZB09F9ghaQFHLsNx@nvishwa1-DESK>
X-ClientProxiedBy: BY5PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: a38068e2-e76f-4a12-8db5-08db2c37a3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGeazOBxG9zBNx5eknI0k1F6/2cdZZFVEM14cfAozuzDVA90zDKF8Cx5HCQxH623X8QUL2ihClwHeKLW5FpyyUZQijgmUah/Hd1ASL88F1xgASiBMyjckUkCLCSZFt6uyvAj9Q7Zh9PBNoW86hR+OO+BiMK/xyD8+bv0hBIG8R3K0EhhI+deN1+2eIusbVz/XzV30im+qN/o5M4ye815gi0jl2H5qKBgACpC7uOK9/txUSQuSXNWqbE38YwanZ3TTMx+9uQ6WfRF++To/t56Eu02mWUAfAD/QJ7M3KIXjIID4qyVGcsFpUWFKG1uHEqW1z+cPJEtkNEnRx7eDmCrNMMq67m1iOw9P+611uR9wnklWvQajAJBDDQdjx9+JqWruImadqmnUkz4Kksr12UH8ULBaw3YLAnPa39qVpD4buVh0FDILB+yYR2lp6o6fALJRQyae2IW41CzFJP2Ggfg+3JJNZ3GELRQnPhRNPXhkJNM+cH+AZTbLQdKLM6EyZqftd2YV2uY+wU/CaFIAD/dSuJEZKm16bOshAS5RxaoKwnsIa+DSYUAf56v5bn4uTedcwbSl0JDZ5LUiw4DuDRBsiEio5uFbzkedMTPq4RALM6g+2NhGR8ZzlEeBgyTgOi45Y5d43JfMNP63vhaXh5F7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199018)(83380400001)(2906002)(44832011)(478600001)(6636002)(6486002)(6512007)(6506007)(316002)(26005)(186003)(6666004)(5660300002)(86362001)(38100700002)(8936002)(66946007)(6862004)(8676002)(66556008)(82960400001)(66476007)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O88oq9rlCjSHNaXal2vJ5zD/KE6BJq5lsksHJrKsIHFYhte2AS9qQD1uelye?=
 =?us-ascii?Q?TvBd8mwi+nwMtFEABpnHq7yEQKMrdkarEDTDVm7XYiR14weG2hYbjGVuyfBc?=
 =?us-ascii?Q?8bB5sq0seUNMSdTefpwWu5iZT8rMcikglWJiBzC1GO6iR+5ZeWr8LMiGPIyW?=
 =?us-ascii?Q?AOZfubANcH1KiolIEYZ4CS+SK/Fla6f5v+yijV3DBnzVf9jOQqvBXin3kiOe?=
 =?us-ascii?Q?7S4zrrWyR/mg7kasolPMo/lepJIioGvvKqt82KpqgTxUsSxYZlWDH+sdYw/x?=
 =?us-ascii?Q?6QoLD4L5BZBkwbi3bUmzxISVx4r5qzWVqjatc1OzQRs0vzoJO2phXTIP00yP?=
 =?us-ascii?Q?BN3wrd3CcEfs8yPdwRGrpJZ4t5C+Od/d7LLfi3Ydfr61I5mnFTdHpiDGyyvX?=
 =?us-ascii?Q?6pSJHDJ48ane/O1qy34nnrgczls37iQNlqIZCleNPDLIvhVBdL2cWMT0cqH7?=
 =?us-ascii?Q?C2iG+aMYgck7rQ7qyCnYJRPAW5+/uJlhNWnVzWqQ7ZdS72aIoIq1+rhAt/AN?=
 =?us-ascii?Q?BJvn/atU96KU/Hh+mVoYl7v2Vwtk19gz5BZ5KAIqKE4z1o+dMoJQp6D0qIR2?=
 =?us-ascii?Q?nTlQhBMo4yOe8YdI5dIWNRMMSYvidOh0RT4ndUqTu8a4hN0OVwH7IXNodVh8?=
 =?us-ascii?Q?cZVkWN/trmr4+W7b0BuY9thRtgJvIPBm54SASeYrjwcv9850W+BIDfVF5oH0?=
 =?us-ascii?Q?Cdr2Z5wdMgpkscf9+2gxoHspXYCYv65NW9Bq0+A0FrWcFoiqLCE9ftak7Tar?=
 =?us-ascii?Q?bU1NS3o8Mz444KtXSz6MFCO7zXAv8fPBX22o+fKVTT3nWeJ5s/eOGRyAN6WS?=
 =?us-ascii?Q?K4HR1wlrS82Z72AIN0AGF42FxwQyegSlMrNjM+sJXql3aUMcmTlQsDdL7Akh?=
 =?us-ascii?Q?SkOknysNDXuGHQCDp5NnL+lhg8+mLa34tJKoyDQsvBNPEKSciOEKoCxLybsN?=
 =?us-ascii?Q?0QhxGAjXF18MNHgxNF3eO/WMgS5NmJW54SvYNyBGTAU+zRcBpI1WAlzfeXet?=
 =?us-ascii?Q?4bU3Kr6ptNr3750prpyJJXnjq29GDtjVeX6Fm/xzTscB0LNigCRRvsCTC4VV?=
 =?us-ascii?Q?5wugicsoSl2iuHIvXwk79VtM+dSMfWxGN9ZZdGXTOy+B+n3Mb1T437jusuGq?=
 =?us-ascii?Q?wHRnhkq6BoZr5OKlPAduWgyl+SQwvUTyckmOhQviPii+kgtCL3o8mhODGtDX?=
 =?us-ascii?Q?GX83C4MmrehLcraA4joIEBGF9BSme42S0qAQtTsDtJMgtvSwvxarXCllQm3H?=
 =?us-ascii?Q?RYmvLIwQyHC3xdknRT1Hsdu8eIjpNbSR7N4OTKNG68/qKnJt5qWy7r1Z8aFw?=
 =?us-ascii?Q?wWd4SRpS3IiUYnU8E4P5R9wvJNKAd57sf8+DrAr1NYhXNM3SN+hctvuTRd3O?=
 =?us-ascii?Q?Idagf+P4Kw+BW36vVqUFnoe0/c6ZrtJS9uKMiZKoyTrPny9I54PInIxNboKt?=
 =?us-ascii?Q?+goivZxXkG9CwRdLzcfSzrUTFvP0sraPTlEsWQzb1PuxCmPkP7YOeG6tnCDN?=
 =?us-ascii?Q?0RTUAMpL13nAzLQyiZouiGbPLEgtMfEqVF9w0KPE4p6oXqbYF7rq47q0hI73?=
 =?us-ascii?Q?LZZkafYzbX9dkmbX1te3VNxDbxWx9cF94Yr+AyI6/kXv3RP42QD+AboroK9h?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a38068e2-e76f-4a12-8db5-08db2c37a3cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:16:08.7131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1lm/cGDetpOrC9HwgYDY+f2+MUoZmvKPa+L2H99f51mglLC4tr9Ox3fAZHRjp2aYK8l9j6ChVZr/iOSqP7QmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Decrement fault mode counts in
 xe_vm_close_and_put
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

On Thu, Mar 23, 2023 at 11:03:03PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Mar 21, 2023 at 09:08:15AM -0700, Matthew Brost wrote:
> > Rather waiting for the VM to be destroyed (all refs to VM go to zero),
> > drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
> > This avoids a window where user space can create a faulting VM, close
> > it, and a subsequent creation of a non-faulting VM fails.
> > 
> > v2 (Lucas): Drop VLK reference in commit message
> > 
> > Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> This patch should probably go in the 'USM locking fixes' patch series?
>

Sure, likely need at respin all of these anyways.
 
> > ---
> > drivers/gpu/drm/xe/xe_vm.c | 15 +++++++--------
> > 1 file changed, 7 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 68ab51f84bed..ab036a51d17e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1349,6 +1349,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > 	XE_WARN_ON(!list_empty(&vm->extobj.list));
> > 	up_write(&vm->lock);
> > 
> > +	mutex_lock(&xe->usm.lock);
> > +	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> > +		xe->usm.num_vm_in_fault_mode--;
> > +	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> > +		xe->usm.num_vm_in_non_fault_mode--;
> > +	mutex_unlock(&xe->usm.lock);
> > +
> > 	xe_vm_put(vm);
> 
> My concern is that something might be holding VM reference and hence
> VM will continue to live after we decrement the counts here and thus
> might endup in a new VM created in fault mode while the old VM in
> non-fault mode still not freed (and vice versa). Is that fine?
>

The VM is effectively dead after this as we tear down all the page
tables in this function, all page faults on the VM are just dropped, and
likewise no execs can be done to this VM after this function. So yes,I
believe this is safe.

Matt

> Niranjana
> 
> > }
> > 
> > @@ -1393,18 +1400,10 @@ static void vm_destroy_work_func(struct work_struct *w)
> > 
> > 	drm_gpuva_manager_destroy(&vm->mgr);
> > 
> > -	mutex_lock(&xe->usm.lock);
> > -	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> > -		xe->usm.num_vm_in_fault_mode--;
> > -	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> > -		xe->usm.num_vm_in_non_fault_mode--;
> > -	mutex_unlock(&xe->usm.lock);
> > -
> > 	trace_xe_vm_free(vm);
> > 	dma_fence_put(vm->rebind_fence);
> > 	dma_resv_fini(&vm->resv);
> > 	kfree(vm);
> > -
> > }
> > 
> > void xe_vm_free(struct kref *ref)
> > -- 
> > 2.34.1
> > 
