Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206ECC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 19:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56C910FDB9;
	Fri, 19 Apr 2024 19:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jETJIwSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7758010FA1E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 19:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713554204; x=1745090204;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uq8fhB8KR0Q4sVrPEb4FfIg4WMqmCM1zhs00XTm+Z/s=;
 b=jETJIwSeQqSXpmlWyZVNeeHNaUOkGUmpSh140DVIJfziD7BMutZC1VOK
 pD7ieTaJn4MeDcz7xcYqsPEVf3HvrVf9VVS7gMiI89u3cbZ92LZUiY+m2
 bytpHXb6y5DfDDLVmBr2TmxkGfw8wd7qr4Y6JmIuqU4lBRgwLmcBYaN+4
 FMmnKAmY85WpjELlRCdE1aXnwv1MafG4ar2ww0Wjw1UavGcbqnSpxAxXh
 Bmr490I3eTpIecwNtpC4ltr15zMth9vj68rWYu3WDvzXmrSwuDEvRLtC/
 OS2U8r2AiAcY98juXnPXMJu3uTyuqil/Sm1xlX9brSC2MdEVE9JNcNuf1 Q==;
X-CSE-ConnectionGUID: n7w7Zq05QaKjcP28lTvb5A==
X-CSE-MsgGUID: 4RduWL1nRgCrKHrTp3HGhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="19866671"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="19866671"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 12:16:43 -0700
X-CSE-ConnectionGUID: VIReRIsfQVCN6Yx5uyPNNw==
X-CSE-MsgGUID: Ukv2e1X5S6GFhiQ2SaM0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28238098"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 12:16:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 12:16:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 12:16:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 12:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3PvRxA5EaVXvHTmoqYnC6fnlGJVVil9s850derU4Iu73xMf31s1g7oVz/WJBClLZq5wwPArthrzsQpiA89HZ3TCpsoLsJZGaEyHocz7qf4qTFKgHM6Somw1Zh/MX96iNJGyklwpjR/I2sTGmPkTnW21x87s2N6/RVSLexl0+tw399/YJvxdBXpmTGsRYWsevYD7C0w98tsrPeyxNMUr9kohK6/YAKvyAA0MzXRq80FMFiO6x/q3NcYF/RR68OHjkPmkJK/S+KiJb/2klfFZu63d98m82VdyrSE2UGu35KCa5cOPBXk2fXEVQbu+IhsKMPheqnNm4WQuaMIEx9pi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd9gNyWppNs/yVxDJLSW901DTVWBIbFB88BolrK+eig=;
 b=KJJmh1QrQRuFE7A9QtNrVM3KClRJzQ+ldT2IgO75AJr0Pib7i4zJS5sMDf3Ji+daWCbVlrB3qhkzshOjC5fdL5Sw15To52xthoq312Eof7KXzz7Bwri5o1i8jAFBkWdy0dWtqrk8+WRsiSziFFiZ8+Jarc/mrzk8AXdF8UyHQrmszQHwuhbDNLadS+sKAxFYqE8HVucJkZhyIcJ2YHY3tyv4JwlJkZjvN+aWEjd60y5w5bblSFNYdsEWT5JGKpEL9hj/747zMQO7+3M0M5L2R3b9XO8QQVzewB+VFVeSzcZbddh9kaYM0ke0b517p5adenolpK1AIOHQrwdhpVxoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Fri, 19 Apr
 2024 19:16:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 19:16:40 +0000
Date: Fri, 19 Apr 2024 19:16:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Message-ID: <ZiLDB87VSgVrBnFA@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-7-matthew.brost@intel.com>
 <SA1PR11MB69913C608E671B3214835367920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69913C608E671B3214835367920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 148b4609-cb66-41e7-b35c-08dc60a53d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z85IEWnrtXNhABWDJpbvVLmPPfquJW0S1CBMMZhw7Xagbg461GGW5ToCC9zr/PzM79VYSsGu3UCqk/vtOelqlGGBj53nXS9Dp5iGMz2csmy3TN5z9qeD8dL2C+SF5KlE7h6Ta94geJF9jzVyW1MQvmErcfstsERFN4uWqnd4bykVscnswuKRCnslLnUUk7VDzUP3RyCgYkC6pS9tJmV76KrEm3U3mlpjYNQtZ4tu0AKu57K7FHqvxbTHR0MR2lGNGdJ4yOf03LP2Hg7rEnpswQGCuHADPZEgyWWGnlyz4LuJ15tLDowBVbaecm5Vs18RQTF3wvVJkkZva8h9GAatfc4xt6dr8qPF4wttu1oyCbokCrxtNkNWwWpsrZ5fp/8Ldqnn1dGGIviOqfZ3wwna3A9bVScNbTlJ3102p3vCg1NRCPfGDzWgEn6f6shBHuk3mNGyAbSwSLP8m0XdkrNp3MLjK40SlGoLopD3o6OFfS3714OdLmyMiV9xS5P4KggcIX1hr9Me21pATD1/aYaK7tkKAP3es81MHLY4X3dgErC0dcM5nKfY66CqUPN2qJhyzasNAIodru/wOBCzfzd4dYQFbAu996FT2ec9s8c1eK556HtkrZSgSKK/De2zUbOPGUVAWR6mxbqLnPg4Q7gr5aXrsY67beypzPjgNA76mek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QWnAtDG/E09HSt8/By265EMX0CNQjF6l6gGeRiGNz9Ml244OiDh/6QRvJHeV?=
 =?us-ascii?Q?omaACAMiCc5oVXNg6cx3oTYsuwvcR2V2dm8U95ODce7fHxVB8QXZdKuB/jbd?=
 =?us-ascii?Q?4ZllZYX/CjSdYWrp7AUN9aY5ENm9Rhv7PAPYbns35ZRz1baqo1oAuNRQSl0A?=
 =?us-ascii?Q?YyLAi5SSYcMD+lngDd3ximpL0kenNtA8d5lLkQAVQRR8sH4/jMdAqBDsqf+5?=
 =?us-ascii?Q?qCVIq+5V3evqRPBBXVZSeFioWscZiLWbnGFVebIHa81xlg7RTzUqnOaRm/lC?=
 =?us-ascii?Q?kwE3ZwTinW2+ehFCl36gq83rkJSBdPKe2n5N7kEnATfcZmHIJHWl5kqxBMSN?=
 =?us-ascii?Q?JmWE2QanOxpoG+gSgFfsHhm2641Fnmd868YI4seTBL04MxYsK0+G39/upudN?=
 =?us-ascii?Q?xvyHJPx9k5PIXQBanYhvkL8PS9NEhEG8cK2KRmJA36ABeAmZYEyekHjOM1Qz?=
 =?us-ascii?Q?V2Qbif9HqqPlb6N6dpO3sHDkDjKDgGXPOFe2B+eh5B/cGoGibOHUEoLAoKpO?=
 =?us-ascii?Q?KZza89aNhfLTynf4Q59l/lHgpCzvuvTGWpOcy4CV9tB/G1bLBEhYrORbQ7Pk?=
 =?us-ascii?Q?0vKnQCoE/94vY5GpfiAcZ/uzdutfPJNKq7Y46ArEUvgWSC3LidIPUQehQDUc?=
 =?us-ascii?Q?v+ZDnwntwAuwru3Ue+kZVxxaSfem3wPA2Yqf5D9bXkq5VOnIuhmxzXMHI92H?=
 =?us-ascii?Q?H54CLGk/YK4zRGmrneOg73B6JiSFs3g7IznZ9P5SfngavI1tNFBcJ+afUR2W?=
 =?us-ascii?Q?biITnRuDRAhmpMTRSBK+hjr+LeYsOvu5SBCYOW/BAx1I77J05jx1zAQABwde?=
 =?us-ascii?Q?WnonUJs5+huzvStuL2UWAjeB04I+06eI87RqIGKMjgt5IV3X/JxuiGSNsIhv?=
 =?us-ascii?Q?AYk165+oKaKC48hHZEeTuMUUwz7oZkOiPhHQ/cyVV63oOoCOAMtfbrSMXGVr?=
 =?us-ascii?Q?Ehb/R5+DFRqoYW4s7o+XXfEnUoZxCD+zYsnVZqlpUuX+z5cP/xGRQLptOZ9X?=
 =?us-ascii?Q?Kr0EOAOP0GK3kY+ZP4WQexDkiNxOGVTzXHoKbWqUFT2OkIJL4hlKr0uUTqSx?=
 =?us-ascii?Q?SJ6XdoeYPclNTodZvids/BK0IRE8RNu8O8lSryij8ZLkopL1s5X5bbNDVqo6?=
 =?us-ascii?Q?z87O1TuFOGFN82jHWlBUo0FCnGNVveTOaaPoYcSy1/PXHDby2LTaS3BP0ZCh?=
 =?us-ascii?Q?e4+EXETQWRJnRaKx+iqUW7sfUbvQ1c8fLshfRgG6t2gCrsDSrzkSZQnsKjED?=
 =?us-ascii?Q?uXNgbm2wtiOT+IdJzGJzcOaq2hGba3fQMqUN4Ob+Ek2jWT9rCbGVa2evL345?=
 =?us-ascii?Q?M3qOevS/id4R6asi1wnepuE30dUJRqMPSg6zjJcIGRl7SFhfhIYIVp0TuWWj?=
 =?us-ascii?Q?2r4FBaFbeaJtP1YKjIle/jhvszOo9KJFWJ3szVnJFSDLxu4bgGSaZ57bMghy?=
 =?us-ascii?Q?ytuauYZVHUMVj7ri1lBDSM+fOkaT4m8XpujuHTwrS1XTfmr9f/YjF/VZrQIH?=
 =?us-ascii?Q?PXbqciy/IKCcOuz/t+KNq8yFCWtuMjNCEZjvec7u8cNjgQP/iZppXCoqQWbj?=
 =?us-ascii?Q?3FJjoSyd/X3d/yrVsjwqjViFfYo32mUKVhgnHa2oGD+nMzaFdF4wnZ1HcylC?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148b4609-cb66-41e7-b35c-08dc60a53d8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 19:16:39.9530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyB8nq+0XQULHot56+Rz4Jeb5O3FPSR0VlAXvwm+uL+Duoyi8nslWEE6Xrb/9nzHdBWBcED3F02Mny96W5cJfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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

On Thu, Apr 18, 2024 at 10:19:04PM -0600, Zeng, Oak wrote:
> It is a nice clean up. See one question inline
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>
> > Subject: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
> > cleanup
> > 
> > Clean up everything in VM bind IOCTL in 1 path for both errors and
> > non-errors. Also move VM bind IOCTL cleanup from ops (also used by
> > non-IOCTL binds) to the VM bind IOCTL.
> > 
> > v2:
> >  - Break ops_execute on error (Oak)
> > 
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       | 67 ++++++--------------------------
> >  drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
> >  2 files changed, 12 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 9d82396cf5d5..8f5b24c8f6cd 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -842,8 +842,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops
> > *vops, struct xe_vma *vma,
> >  }
> > 
> >  static struct dma_fence *ops_execute(struct xe_vm *vm,
> > -				     struct xe_vma_ops *vops,
> > -				     bool cleanup);
> > +				     struct xe_vma_ops *vops);
> >  static void xe_vma_ops_init(struct xe_vma_ops *vops);
> > 
> >  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> > @@ -876,7 +875,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool
> > rebind_worker)
> >  			goto free_ops;
> >  	}
> > 
> > -	fence = ops_execute(vm, &vops, false);
> > +	fence = ops_execute(vm, &vops);
> >  	if (IS_ERR(fence)) {
> >  		err = PTR_ERR(fence);
> >  	} else {
> > @@ -2551,7 +2550,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct xe_exec_queue *q,
> >  	if (!last_op)
> >  		return 0;
> > 
> > -	last_op->ops = ops;
> >  	if (last) {
> >  		last_op->flags |= XE_VMA_OP_LAST;
> >  		last_op->num_syncs = num_syncs;
> > @@ -2721,25 +2719,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> > xe_vma_op *op)
> >  	return fence;
> >  }
> > 
> > -static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
> > -{
> > -	bool last = op->flags & XE_VMA_OP_LAST;
> > -
> > -	if (last) {
> > -		while (op->num_syncs--)
> > -			xe_sync_entry_cleanup(&op->syncs[op-
> > >num_syncs]);
> 
> I understand all the other part of this function is not needed anymore. But I didn't figure out why sync_entry_cleanup is not needed? You still have syncs, do you? They are allocated in bind_ioctl function and seems you didn't touch it in this patch....Can you explain?
> 

It is called in the main IOCTL code (xe_vm_bind_ioctl) now.

See below.

> Oak
> 
> 
> > -		kfree(op->syncs);
> > -		if (op->q)
> > -			xe_exec_queue_put(op->q);
> > -	}
> > -	if (!list_empty(&op->link))
> > -		list_del(&op->link);
> > -	if (op->ops)
> > -		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
> > -	if (last)
> > -		xe_vm_put(vm);
> > -}
> > -
> >  static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> >  			     bool post_commit, bool prev_post_commit,
> >  			     bool next_post_commit)
> > @@ -2816,8 +2795,6 @@ static void vm_bind_ioctl_ops_unwind(struct
> > xe_vm *vm,
> >  					 op->flags &
> > XE_VMA_OP_PREV_COMMITTED,
> >  					 op->flags &
> > XE_VMA_OP_NEXT_COMMITTED);
> >  		}
> > -
> > -		drm_gpuva_ops_free(&vm->gpuvm, __ops);
> >  	}
> >  }
> > 
> > @@ -2904,24 +2881,20 @@ static int
> > vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> >  }
> > 
> >  static struct dma_fence *ops_execute(struct xe_vm *vm,
> > -				     struct xe_vma_ops *vops,
> > -				     bool cleanup)
> > +				     struct xe_vma_ops *vops)
> >  {
> >  	struct xe_vma_op *op, *next;
> >  	struct dma_fence *fence = NULL;
> > 
> >  	list_for_each_entry_safe(op, next, &vops->list, link) {
> > -		if (!IS_ERR(fence)) {
> > -			dma_fence_put(fence);
> > -			fence = xe_vma_op_execute(vm, op);
> > -		}
> > +		dma_fence_put(fence);
> > +		fence = xe_vma_op_execute(vm, op);
> >  		if (IS_ERR(fence)) {
> >  			drm_warn(&vm->xe->drm, "VM op(%d) failed
> > with %ld",
> >  				 op->base.op, PTR_ERR(fence));
> >  			fence = ERR_PTR(-ENOSPC);
> > +			break;
> >  		}
> > -		if (cleanup)
> > -			xe_vma_op_cleanup(vm, op);
> >  	}
> > 
> >  	return fence;
> > @@ -2944,7 +2917,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> > *vm,
> >  		if (err)
> >  			goto unlock;
> > 
> > -		fence = ops_execute(vm, vops, true);
> > +		fence = ops_execute(vm, vops);
> >  		if (IS_ERR(fence)) {
> >  			err = PTR_ERR(fence);
> >  			/* FIXME: Killing VM rather than proper error
> > handling */
> > @@ -3305,30 +3278,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  		goto unwind_ops;
> >  	}
> > 
> > -	xe_vm_get(vm);
> > -	if (q)
> > -		xe_exec_queue_get(q);
> > -
> >  	err = vm_bind_ioctl_ops_execute(vm, &vops);
> > 
> > -	up_write(&vm->lock);
> > -
> > -	if (q)
> > -		xe_exec_queue_put(q);
> > -	xe_vm_put(vm);
> > -
> > -	for (i = 0; bos && i < args->num_binds; ++i)
> > -		xe_bo_put(bos[i]);
> > -
> > -	kvfree(bos);
> > -	kvfree(ops);
> > -	if (args->num_binds > 1)
> > -		kvfree(bind_ops);
> > -
> > -	return err;
> > -

We now fall throuh to the cleanup in both success and error paths...

> >  unwind_ops:
> > -	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > +	if (err && err != -ENODATA)
> > +		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > +	for (i = args->num_binds - 1; i >= 0; --i)
> > +		if (ops[i])
> > +			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> >  free_syncs:
> >  	if (err == -ENODATA)
> >  		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);

The next few lines of code call xe_sync_entry_cleanup.

Matt

> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 466b6c62d1f9..149ab892967e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -330,11 +330,6 @@ enum xe_vma_op_flags {
> >  struct xe_vma_op {
> >  	/** @base: GPUVA base operation */
> >  	struct drm_gpuva_op base;
> > -	/**
> > -	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> > -	 * operations is processed
> > -	 */
> > -	struct drm_gpuva_ops *ops;
> >  	/** @q: exec queue for this operation */
> >  	struct xe_exec_queue *q;
> >  	/**
> > --
> > 2.34.1
> 
