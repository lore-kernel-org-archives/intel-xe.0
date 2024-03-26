Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67879C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 18:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2557710F1EB;
	Tue, 26 Mar 2024 18:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBXYUD0R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B4910F1EB
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711478947; x=1743014947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PTgDkCNaqr+x+Y+t1K+hYbyU90yDTU2R9lP6fP94v7s=;
 b=bBXYUD0RVeSwOgHJoVWRoXcK09Jz+BNemaU+kdvBcXLhgTMnY3aVv5z2
 p7qJ4Hzc5/SvuyiRkvhBOQLPpC6etwzH+rIdgTMIJbUlLLDmnRxIsE69q
 8U3DQRyPVfjnfVygJlfFuRMZdpQLPBruebFKq4xhSQkp3VxJXrAG9HaES
 S2z+2667WCUyjuK+x5gAZVDFCK+5qjf0q/GF4F3bLT6i5c7n7ZH81O6Af
 nvXGPhs7NO6JyTA/xLPoGCq/vOT7wAFcV/SEYYGcW7mfDya9YELdrNGxj
 UGEP+GtCPM0q73/WLUNszcXv5OdrGIkaNaNgUpA15tqmASwnQ28f4xhXx Q==;
X-CSE-ConnectionGUID: mwtDf7Z7R8mIr8KLfP+Ehg==
X-CSE-MsgGUID: gyL/C6KrSWKODJTJnVsFgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17936760"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17936760"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16491023"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 11:49:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 11:49:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 11:49:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 11:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLJMvuv8s/Cfmvcfj0jp2U6nFbShJcH/4h2gnjdc8U01I/N0vF/QQST5w0vmCjESxiI372WczYMtDFrTx3AfTKiUsrXSPpXy2tsyXeVfd6rd2nDwIxswHOjOQut59q2KsYRqYDRJkwbfUeCHyZ6C10jaQLPIRfq9pYNRoYBaHiwkCghJfutEAuWFSP5W5cqUqkxxVshfdjohhC/tmW/uKgoInau/gG8wt1KUjXXL1NRyGQQGXS8bePWXCEMJo0lBIdFuBI/wnHLH1aCCA7lYzEDPTPCnwFAdPTzYivVpA9XEQDmV3OylYcbLYN1Sh4gKnfvqfdWB6MSqolhGzvLhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhBJH3vS57F3r++xsdI7ZRQI1aUCKN5/0DjdBsK6oIU=;
 b=couz/6Pxei1uT78me+MDaqBmUMFLK7+d/U61AwieDXu3RLoDn1RJeGwmb+2RKkKciP2sJwaE1ovouVS3c/M5j+1ms3Ww4YJerSLEF6f0lkWP4JXrSzc1u4DDEThbf1ECVotzxqBA3BlAKTvUo22UOuCoYomeTybcpPeTlQ+2dwG4ui0DCSrjSoVfEfJhIX9RmZVMyVwBdHj6CyPA6pRy2RAHnKRRvNTZpFYIeWDP4MriDWjpjUMoJ1xn+2n9A1oMG8RpXaqKSvYdwi7u57MHwK+WdAPLHW3QqOXaIcyA+kd3Hyyw3fM0AsXDVmMKdKtcnErc0JTZX/Cc3z1xbU5BtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 26 Mar
 2024 18:49:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 18:49:04 +0000
Date: Tue, 26 Mar 2024 18:47:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 09/30] drm/xe: Add some members to xe_vma_ops
Message-ID: <ZgMYWiIxgSA0rc6J@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-10-matthew.brost@intel.com>
 <SA1PR11MB6991A089E5EED8337D6F26EE92362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991A089E5EED8337D6F26EE92362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OikHfFR2Z372K5PhQEArF7hankrOIzw9TvCHaC2T5GSMAMR5F/PJ4hZgargyN+e1dfktRXQNu37NfwVWp/4t22wagdD/uOVAlEm5m+nfxn9mXrnK3YdhDtJkqylI+GMPEiu1vMENhRtTYvx4SHYYPLpgkRHxmcQ5wt36lqg8IOQAm3tWRRKjBgF0YN3q2bwqXUXc1e4SyeaBm1t78yblxS1QAXvx5QelURay/XzHO9hoBkkrgB07HgoG2BwIjZREf3rOccdL80EJ3eFqUn8pm4YpdU0tINQNMkClZLAtqMEhVeHzfphrHRhfzVhu6n59p7EYlaSApf+WUXJn5mi66Z07o6D82tkXSe1A2I9C8xk6Wwfv/jciRU1UyXTutSUZyWPD5BsOliBaiUag6CldqvXGn3fGnm/MyJUvVTl3dym89o/+QGKG2D1BWKVPwtnviUCvkQzDuIHTEFM/T74hLEq/laDFQPp5/eF7ult+FL1rJnDenWpkLoBOyDjf8b5xdWvPtTjvoCC5yc+ljWxtOr1VK1BYo+cwCaaYBB9x6IMuvJvurnuAXi3pYFhdbDqdlTLBl4FVWQOlpSV7l36qLr2PZBnS4brNRPCdWkEUJ5jXDYB1h/hffzW/tdEnW58Q+zpSy+kzsEW7lFmqHSxVERmdQ93km72eDBKM+NGT3d4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPZtSGJJ5dV36zV4jYUklRhWDmD+UUFhN1JBygj4wcUmhzbHedFH/LrAgaCZ?=
 =?us-ascii?Q?1USfYQYQDo8LOQ7JpV9PE1j58e0aMvOddDR5pJIYknZ9KQxxLj+59KNvZ/Xm?=
 =?us-ascii?Q?e/ZRYIdLCbEzOczcOPmij6UljyRoUyZtmKsk9Xpera4L6ygHh+xTLBH9AUsv?=
 =?us-ascii?Q?KknGODyGbWHOzGzB5Ry57zf2VngqtEJ/q3AomLfksCm3NQeMLJOqZLHoWgnA?=
 =?us-ascii?Q?A0pWdg4zkDkOI4dBEXZAOSq2UKZYqS9WLsOJ0LVnSig73fJ4bTp6j74Zb0NO?=
 =?us-ascii?Q?IN5rR35yGBoTfPofEDvB9kIFzTC0JdUO6NVvDrTGdkpJOUl9nIbfOvuN+BnB?=
 =?us-ascii?Q?89mT7tnh9EvPHbTTdLUsvwIxdaJLLHSuBYcWGUwqqWvOou1IYfi+DNXj31Mo?=
 =?us-ascii?Q?ZC7IGEGjzDV5YGWdS3EJdsGn8RtjkmMqRlJfhyThruVpJu6wLr8ZxBe73jCa?=
 =?us-ascii?Q?xB5jBOoOV5CchRP6yNjRjkJaJl0r5lFEAqjR3BnmnqcFFCPhY6+D8kO5FBqa?=
 =?us-ascii?Q?h27nz/a7ZgJQZq05R0r/oRJnAvng29AcbMMr8SHxgYZLRtzB6nbI8ye1p+um?=
 =?us-ascii?Q?TrHbq6nmtCGmrhkM/q4Rv+c6mx831K/Eyr3vOncaviSqpnOorqXIsq/ddRxH?=
 =?us-ascii?Q?9ucsmB68+Rvpo83YVE9JmA37acngigzfjhgeMyL3BZepjEmsucoaa7wa5b8E?=
 =?us-ascii?Q?UpHadTl+F5y+KxsqH9gAaMiNwjFt2P+3TkHmHZBl2ZThhVi2lLHySTeRrDE2?=
 =?us-ascii?Q?VhWT20ZXNfEP7wi+Atl4eqP3POS/r0rodnQNlmn8JHp5MuQjRQbTAju7RN0Q?=
 =?us-ascii?Q?vhja58Ndc9eJM1xzZVyhDc3Z8VTbn0pSQvW8iIy0dT1ZnFJ8dOqWMz5A6Obe?=
 =?us-ascii?Q?rMOu2xUpokP7t5JbxAJZDD7GPvGVi3wL5tdVFdBLq3YIsCHFz5Fe6G5jctS+?=
 =?us-ascii?Q?S5ToNIGi8M4Q9AIWzfeIOKXIAn1m1zB5A57vM/fEhmOB9du/JSgPlCmGuCIY?=
 =?us-ascii?Q?zqCsaJkA1qXPjuowctBDEN6jPkdofMc5fPGM+7HcByfr+ZKFkHC3jnpBj3eV?=
 =?us-ascii?Q?Nchb595pkTtSgyUf1yd2p6LoPYQs4rxgxzO35+TwOdjt7CgPV9AkNzPLKHpB?=
 =?us-ascii?Q?JJtc5SkjSt7kQXIqULliQRso7OTpqYf5QR12rDFaeRNd6AXWpsQ1ctpIRHiG?=
 =?us-ascii?Q?LMDlbzE/CfeeF0JzlYmZfOsFoN1BQkiYtk3Doit0/4OFN/7vVH/x/eyEpYEZ?=
 =?us-ascii?Q?JfP4AS6OUk8y3QBdQCzloDMmsoqnKJ9QGIF7CmXZAIB+NnRNGUFv4ecDdnHV?=
 =?us-ascii?Q?bweV95DAGGw8RiaqLjkw2AS+9VGFAdPLWqRs3yVjrLU0jQIwPdkEQrte5n4e?=
 =?us-ascii?Q?iJP1MutVszKWTnIyO7UzKmaAiU/DCrnzY7YlpW3hOH0KYNNB4EMJZ4B2r5ig?=
 =?us-ascii?Q?ken/5dzeFP8sBp7XYsx8j89w2tNf/ip3FSXz9yB7PHlxFwpKAU2cIgmveKje?=
 =?us-ascii?Q?B9UE2sf+uCmTDD5SpQPEYgMLsz48m56c3fS1SJ/wDLS7p4ry7df2DGQ45MAl?=
 =?us-ascii?Q?YObhWfe0LcPJjRsC5ycnK5fp+KC+l1CNvagHuuV34xC3A0I+BNNMwW2sdVOv?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d875b6-a535-460f-dcbe-08dc4dc568c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 18:49:04.2325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1h/k6npTS3+cEwTqbVfvZrtEzlrjlFmNf5/TpV80WwAfEVVw+IsfMWoFlnSlwSYqqY4Yjih4EyI+oYil7WYJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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

On Mon, Mar 25, 2024 at 10:10:43AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 09/30] drm/xe: Add some members to xe_vma_ops
> > 
> > This will help with moving to single jobs for many bind operations.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       | 13 ++++++++++---
> >  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++++
> >  2 files changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index a6bae2f5e296..f8b27746e5a7 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1307,9 +1307,16 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
> >  	}
> >  }
> > 
> > -static void xe_vma_ops_init(struct xe_vma_ops *vops)
> > +static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
> > +			    struct xe_exec_queue *q,
> > +			    struct xe_sync_entry *syncs, u32 num_syncs)
> >  {
> > +	memset(vops, 0, sizeof(*vops));
> >  	INIT_LIST_HEAD(&vops->list);
> > +	vops->vm = vm;
> > +	vops->q = q;
> > +	vops->syncs = syncs;
> > +	vops->num_syncs = num_syncs;
> >  }
> > 
> >  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > @@ -1333,7 +1340,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32
> > flags)
> >  	init_rwsem(&vm->lock);
> >  	mutex_init(&vm->snap_mutex);
> > 
> > -	xe_vma_ops_init(&vm->dummy_ops.vops);
> > +	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
> 
> 
> You mentioned in previous review, that vm->dummy_ops will be dropped... I guess this line will also be dropped.
> 

Yes, will drop the dummy ops.

Matt

> Otherwise, this patch looks good to me.
> 
> Oak
> 
> >  	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
> >  	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
> > 
> > @@ -3176,7 +3183,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  		goto free_syncs;
> >  	}
> > 
> > -	xe_vma_ops_init(&vops);
> > +	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
> >  	for (i = 0; i < args->num_binds; ++i) {
> >  		u64 range = bind_ops[i].range;
> >  		u64 addr = bind_ops[i].addr;
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 0bba5543ac28..f6ea4df64e79 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -211,6 +211,14 @@ struct xe_vma_op {
> >  struct xe_vma_ops {
> >  	/** @list: list of VMA operations */
> >  	struct list_head list;
> > +	/** @vm: VM */
> > +	struct xe_vm *vm;
> > +	/** @q: exec queue these operations */
> > +	struct xe_exec_queue *q;
> > +	/** @syncs: syncs these operation */
> > +	struct xe_sync_entry *syncs;
> > +	/** @num_syncs: number of syncs */
> > +	u32 num_syncs;
> >  };
> > 
> >  struct xe_vm {
> > --
> > 2.34.1
> 
