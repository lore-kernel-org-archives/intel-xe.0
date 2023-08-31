Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C55C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 14:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DC010E0E5;
	Thu, 31 Aug 2023 14:44:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7574C10E0E5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693493067; x=1725029067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P1kgt3MFvvBB1e9a9uavKCQB0+glDQmMb54FgvjQjxU=;
 b=YlW8Qalrwb2HkYORIye7GYEutxxV8cdJ8ajxVBLq3280JeSKEQ70qPRr
 mIecfoDqSAmpFUrErFzzibdmiyLN0VTMrFsuMHNtXmK+VJCIRuXJMf0W0
 xKYg1iALjb0aXfTupd72wQLoNAszf3cgJzbvbjaZv22veU7z/qFr/mNpV
 3cinxL1xzBx0ywGIcdczOQOt5gG7Cjs/hz6bPbu76E7PpzMinLcX+lebV
 gZNRIYsGtQdFRDWYa9hfQI9aVa9znC8WIjUcoU5pUQFD7JPw3NWPF/ecu
 98/7H02HIp1wXcyW66PFifhovnx84ej5cpBETZuGt1zwPtVMHj4jYZrLU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="360984155"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="360984155"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 07:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689374992"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="689374992"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 07:44:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 07:44:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 07:44:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 07:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq0VFrGSn/yEOXy6ta2BjED5bKYVDajlombg4tjA9aJ4OJlfNVxj/7CCdhkD2aX1te9Tkxm/V57HquUm4FMy5x2II9casHN08n6xSxcLj2G4mOh2EcFvQ08m4p6yWr7iJZtqLzsLUhXNcF2awFO/tn0TR7p1ZeNbmxqMzgdvpGRpGVHmAMjq9usd8QEdkp4z894OwQeHy48JOcBf+6CryVjfUiEZHgoqKchVAd/K4/OwH1E9EfnQEhUU7yGQSUV5QVF9ovASePIE6PeGfTuhV3r573RSdtfpEPtbsUiLjgNpUkr8mn4cn7O9ekgwZjABuyoKvAx8ROVPlJekeGgImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfMJ/4c7KeLS9K6MKnf2AEuuc+VGwXlQoXfK4ZPqNmo=;
 b=i/dawEIb0QBqvSdKkGw65eBSUk35fWAJT/yVvNtx+zXO+Y5FdUTC5R4im2rIYxNNhk/zJnq6QEZILfNIQm2yYyaUEvkE2lI/CHh2tbKyqG9j5QxBx3isTwxcxm9sGk80ANfLaAmxL7c7g/W93PY+gXSZWYhKSXfG4iduyNQhpce/Iv1GywglF87T7RD4ZGXdV0GVRcUjsk907XGKAOK+0YGVeynwB4seCCti8Zy+equY8TW7/H3ufIw0NXh/YCMTlUWRAQoWajZKJYhtfsk/KMv8jenuiFvxhCPUx9YK2YGyUB8ZRsKJjjCmpbVQ7dcLuEDmmXEiKP35eeS152noJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 14:44:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 14:44:13 +0000
Date: Thu, 31 Aug 2023 14:43:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZPCm/gDS1xGwLS3P@DUT025-TGLU.fm.intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
 <20230817043148.740495-4-matthew.brost@intel.com>
 <ZOVHBhN+zodryU24@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZOVHBhN+zodryU24@intel.com>
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed5d03e-e71a-4bd9-8ad9-08dbaa30be3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLFtugAi9lHPrEt0UCdk+fgDOO15CpbB2HVszEoiiu+dKw1ySsR3vnno/C8Ob/7yqCrPhgzmvNkJspzrpTlim6jaMs0fz1Zn3KRsznPP9DyE7m7Uxv0qwjnrtQvyXAqKwTgOiOnikXAypna2MBHOcPJGuehN6tT9oNgTKRmNL2WkgM8SJYcT9zEzLqTNA1+EYjVHSvrgbTH/t2oLqO4DFFPa2dNOCdkQqCLKHpjTI8868g86CX2LRZKqrWriZh2iCmh+WgZqTfQwMXXOeBmCy+G67NdUZFseNjWiDSd7g1BijMyAtNH/JZPUNU+IyKqtwFhRVDD0D/TxDyRBFiteDDww8quyOSEBBW+rbQFRSuIx7EuTNqKfCnTKBUw/FUNcbpJY+fjdOfxxh+KqNh6QPDSRBSm3Jr48iIJLVZp5dK7mGQ2H8OAUJNXYHXn6EnMnYoUp03cOETc8S65pQ/X343eDST5PDiv2CESWxngx1+arTKWJeafH6iSdvP4Vh0SQzYjQ/EIe9bZqzkq6hESp8wuedQyPL2uhMJE2u0vVc+97FeYaW4jeceu8V6v9ZMiu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(186009)(1800799009)(451199024)(41300700001)(38100700002)(26005)(66556008)(66476007)(83380400001)(66946007)(316002)(6636002)(82960400001)(478600001)(2906002)(30864003)(86362001)(5660300002)(44832011)(8936002)(6512007)(6862004)(8676002)(6506007)(6486002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fGWgYo+w6T+BIB8OJBEoQMlLPCot5olnGVE02iDcXWLsdjGTUPXvn0D5B4Bt?=
 =?us-ascii?Q?FPrBHqCi2yjbH9a+uSqvdk7Ba0eWJFsl25LFUUgpSHdkZDvT1Pr49vl8dhMj?=
 =?us-ascii?Q?4CbUSaXbNh84Y19S/xC+BYi+GUxFd4aoVoquHgp5Ck7RdKC9lUtiWxZo9Ry9?=
 =?us-ascii?Q?AnWPZfsTaVZMqzFCGV19UY0M4KjidUiGk9wAYSm2QD1rNovN/WJVsB+qhbrq?=
 =?us-ascii?Q?ZXnuiqKkBJY7KRC/GlzrfUw990QCj+GApo5IG8S/7P0WzYLPNyhWK2vck0rM?=
 =?us-ascii?Q?ESbAXLh2oup7VlnEUQ5RmVYlZnbjBk5kOzcVlf1H01+NwGBnr9NeXn5IMyeD?=
 =?us-ascii?Q?DW2AiCNwSfQnllj9IjWooFgNKoRm4NqLuYifDsJIMksrubcHFnD266ZpPqMJ?=
 =?us-ascii?Q?Ypq9dPQhXm6ELK1CywOGbNKbFFVEUDuSGvIVZ/tFfePJWGiSxlQQ9ctkVwKE?=
 =?us-ascii?Q?LyA7BBXtrdBVObhw0PSONPDuNnG58MkWDOTbPBU3Ok5sb0W3QRH67Ed1cBgk?=
 =?us-ascii?Q?XnYJrMYrnZGfx2WSvfs/Pynq/Pmsf9bR4ehk3tGI7sLnLjCfruN5Wv4j0iUh?=
 =?us-ascii?Q?lBFBp4cqkh6y925pOczEDVjuY9vZoxZMBNq+HDoS7A9vDU+ftz/y78td6rMJ?=
 =?us-ascii?Q?R7teu67RjtCgmluwRKP6SnfueLR0GemqUhCk3/GHoHmTBBZ4SQNxjoPUXMrr?=
 =?us-ascii?Q?JFPB9J0MSGrhs42aCPN33xar/UG73Z+xtebQ6vbrGc6UVlZ/s4Jamv1xBdCZ?=
 =?us-ascii?Q?mtF9fhkMHJFhHsO00puXjS9eN/FY+8/UBUG7ZmYC1xEVac7RGsLCjZTlEkM1?=
 =?us-ascii?Q?8exHzooqiUGyjCIu9MOWm4VFr43HnuFVr+O1p0DiQ2y5AMEJUyrbetq17jLT?=
 =?us-ascii?Q?fq2RGUYkJYp4Lny4bjFkv0DPKOfmUSUNi4N9x6Qfmj6wYem5BIqfhrn7+Jvy?=
 =?us-ascii?Q?kfNJ8R/+7nlSZasxY5DcQY5UwxFahiFi72zS+bZzOk6tQzAMTcCZnkYusNc7?=
 =?us-ascii?Q?GDhpLwuGjhzY6HHbcnWchhzljZykqx5bSp625BGwhUZG4BNtpX3I6LB6cNo6?=
 =?us-ascii?Q?xaSjxRFCyqpGIgVSQVquP0azPmBnWZu1eoODsVa+C6rr3HxOLpeByD/3NBYT?=
 =?us-ascii?Q?16k0BPRRuRbEy+5h70MXwOwvM9pb/KgPOfqtHosi7LGTSMdLNb9jLXbmwNVO?=
 =?us-ascii?Q?rHC7rCU812tGpPJEc7oBDWhKWXMlQkW0MVsX5NZJynTGcM02a+i3d1twdLZx?=
 =?us-ascii?Q?bcFOf77RtPhlkdw+8cq62vWNDnBnDlg1WHL9ubeWhRDuFG2OjNp0jwKGp1Nq?=
 =?us-ascii?Q?JJg5JnZQ/AbUd/ILUHA9bvJxZPmr12lesl9kP4ZL1W0PWBJdDZ//Rx+INR3t?=
 =?us-ascii?Q?OohNiA3S/nMdXiS+jM0K2aeeiSgqv7+KMENa4Weo2f2iZjnKXEep8b3iaKdX?=
 =?us-ascii?Q?WsMLuXv1VFWj6ZQfBvkNdzEpgSJ3A77P0dZk5lUMpq0xjhanr3MaKgjTJ7Qk?=
 =?us-ascii?Q?6JdVLtMcMfYKnKaaSRCNEuoFGJFbHbFnDMkzOM+DYIgSatsN9DxsGNpVzR3E?=
 =?us-ascii?Q?v+Ejon6IwI7Ux8373G+zEBJDckktC4+gNokI5ahCVETXzDZVGFGImJintypQ?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed5d03e-e71a-4bd9-8ad9-08dbaa30be3c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 14:44:13.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIm1Ro/2rDc82DG9LwCOrKF1TVcDebOq0S3LjbvKVj/io/AH8Wm9ExCCBL4gwXLM7dCaJkycoIAaZ790VHN7aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Fix array of binds
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

On Tue, Aug 22, 2023 at 07:38:46PM -0400, Rodrigo Vivi wrote:
> On Wed, Aug 16, 2023 at 09:31:48PM -0700, Matthew Brost wrote:
> > If multiple bind ops in an array of binds touch the same address range
> > invalid GPUVA operations are generated as each GPUVA operation is
> > generated based on the orignal GPUVA state. To fix this, after each
> > GPUVA operations is generated, commit the GPUVA operation updating the
> > GPUVA state so subsequent bind ops can see a current GPUVA state.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 418 +++++++++++++++++++------------------
> >  1 file changed, 212 insertions(+), 206 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index bd20840616ca..2452e24fbc81 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2426,24 +2426,73 @@ static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
> >  	return SZ_4K;
> >  }
> >  
> > -/*
> > - * Parse operations list and create any resources needed for the operations
> > - * prior to fully committing to the operations. This setup can fail.
> > - */
> > +static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> > +{
> > +	int err = 0;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		err |= xe_vm_insert_vma(vm, op->map.vma);
> > +		if (!err)
> > +			op->flags |= XE_VMA_OP_COMMITTED;
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> > +				 true);
> > +		op->flags |= XE_VMA_OP_COMMITTED;
> > +
> > +		if (op->remap.prev) {
> > +			err |= xe_vm_insert_vma(vm, op->remap.prev);
> > +			if (!err)
> > +				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> > +			if (!err && op->remap.skip_prev)
> > +				op->remap.prev = NULL;
> > +		}
> > +		if (op->remap.next) {
> > +			err |= xe_vm_insert_vma(vm, op->remap.next);
> > +			if (!err)
> > +				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> > +			if (!err && op->remap.skip_next)
> > +				op->remap.next = NULL;
> > +		}
> > +
> > +		/* Adjust for partial unbind after removin VMA from VM */
> > +		if (!err) {
> > +			op->base.remap.unmap->va->va.addr = op->remap.start;
> > +			op->base.remap.unmap->va->va.range = op->remap.range;
> > +		}
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> > +		op->flags |= XE_VMA_OP_COMMITTED;
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		op->flags |= XE_VMA_OP_COMMITTED;
> > +		break;
> > +	default:
> > +		XE_WARN_ON("NOT POSSIBLE");
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +
> >  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > -				   struct drm_gpuva_ops **ops, int num_ops_list,
> > +				   struct drm_gpuva_ops *ops,
> >  				   struct xe_sync_entry *syncs, u32 num_syncs,
> > -				   struct list_head *ops_list, bool async)
> > +				   struct list_head *ops_list, bool last,
> > +				   bool async)
> >  {
> >  	struct xe_vma_op *last_op = NULL;
> > -	struct list_head *async_list = NULL;
> >  	struct async_op_fence *fence = NULL;
> > -	int err, i;
> > +	struct drm_gpuva_op *__op;
> > +	int err = 0;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> > -	XE_WARN_ON(num_ops_list > 1 && !async);
> >  
> > -	if (num_syncs && async) {
> > +	if (last && num_syncs && async) {
> >  		u64 seqno;
> >  
> >  		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> > @@ -2462,145 +2511,145 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> >  		}
> >  	}
> >  
> > -	for (i = 0; i < num_ops_list; ++i) {
> > -		struct drm_gpuva_ops *__ops = ops[i];
> > -		struct drm_gpuva_op *__op;
> 
> I got a bit confused here. why we were iterating on the op list,
> but suddenly this iteration is not needed anymore?
> 

The loop is pushed to a higher level + we commit the op each iteration of the loop.

> > +	drm_gpuva_for_each_op(__op, ops) {
> > +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > +		bool first = list_empty(ops_list);
> >  
> > -		drm_gpuva_for_each_op(__op, __ops) {
> > -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > -			bool first = !async_list;
> > +		XE_WARN_ON(!first && !async);
> > +
> > +		INIT_LIST_HEAD(&op->link);
> > +		list_add_tail(&op->link, ops_list);
> >  
> > -			XE_WARN_ON(!first && !async);
> > +		if (first) {
> > +			op->flags |= XE_VMA_OP_FIRST;
> > +			op->num_syncs = num_syncs;
> > +			op->syncs = syncs;
> > +		}
> >  
> > -			INIT_LIST_HEAD(&op->link);
> > -			if (first)
> > -				async_list = ops_list;
> > -			list_add_tail(&op->link, async_list);
> > +		op->q = q;
> > +
> > +		switch (op->base.op) {
> > +		case DRM_GPUVA_OP_MAP:
> > +		{
> > +			struct xe_vma *vma;
> >  
> > -			if (first) {
> > -				op->flags |= XE_VMA_OP_FIRST;
> > -				op->num_syncs = num_syncs;
> > -				op->syncs = syncs;
> > +			vma = new_vma(vm, &op->base.map,
> > +				      op->tile_mask, op->map.read_only,
> > +				      op->map.is_null);
> > +			if (IS_ERR(vma)) {
> > +				err = PTR_ERR(vma);
> > +				goto free_fence;
> >  			}
> >  
> > -			op->q = q;
> > +			op->map.vma = vma;
> > +			break;
> > +		}
> > +		case DRM_GPUVA_OP_REMAP:
> > +		{
> > +			struct xe_vma *old =
> > +				gpuva_to_vma(op->base.remap.unmap->va);
> >  
> > -			switch (op->base.op) {
> > -			case DRM_GPUVA_OP_MAP:
> > -			{
> > -				struct xe_vma *vma;
> > +			op->remap.start = xe_vma_start(old);
> > +			op->remap.range = xe_vma_size(old);
> >  
> > -				vma = new_vma(vm, &op->base.map,
> > -					      op->tile_mask, op->map.read_only,
> > -					      op->map.is_null);
> > +			if (op->base.remap.prev) {
> > +				struct xe_vma *vma;
> > +				bool read_only =
> > +					op->base.remap.unmap->va->flags &
> > +					XE_VMA_READ_ONLY;
> > +				bool is_null =
> > +					op->base.remap.unmap->va->flags &
> > +					DRM_GPUVA_SPARSE;
> > +
> > +				vma = new_vma(vm, op->base.remap.prev,
> > +					      op->tile_mask, read_only,
> > +					      is_null);
> >  				if (IS_ERR(vma)) {
> >  					err = PTR_ERR(vma);
> >  					goto free_fence;
> >  				}
> >  
> > -				op->map.vma = vma;
> > -				break;
> > +				op->remap.prev = vma;
> > +
> > +				/*
> > +				 * Userptr creates a new SG mapping so
> > +				 * we must also rebind.
> > +				 */
> > +				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> > +					IS_ALIGNED(xe_vma_end(vma),
> > +						   xe_vma_max_pte_size(old));
> > +				if (op->remap.skip_prev) {
> > +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > +					op->remap.range -=
> > +						xe_vma_end(vma) -
> > +						xe_vma_start(old);
> > +					op->remap.start = xe_vma_end(vma);
> > +				}
> >  			}
> > -			case DRM_GPUVA_OP_REMAP:
> > -			{
> > -				struct xe_vma *old =
> > -					gpuva_to_vma(op->base.remap.unmap->va);
> > -
> > -				op->remap.start = xe_vma_start(old);
> > -				op->remap.range = xe_vma_size(old);
> > -
> > -				if (op->base.remap.prev) {
> > -					struct xe_vma *vma;
> > -					bool read_only =
> > -						op->base.remap.unmap->va->flags &
> > -						XE_VMA_READ_ONLY;
> > -					bool is_null =
> > -						op->base.remap.unmap->va->flags &
> > -						DRM_GPUVA_SPARSE;
> > -
> > -					vma = new_vma(vm, op->base.remap.prev,
> > -						      op->tile_mask, read_only,
> > -						      is_null);
> > -					if (IS_ERR(vma)) {
> > -						err = PTR_ERR(vma);
> > -						goto free_fence;
> > -					}
> > -
> > -					op->remap.prev = vma;
> > -
> > -					/*
> > -					 * Userptr creates a new SG mapping so
> > -					 * we must also rebind.
> > -					 */
> > -					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> > -						IS_ALIGNED(xe_vma_end(vma),
> > -							   xe_vma_max_pte_size(old));
> > -					if (op->remap.skip_prev) {
> > -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > -						op->remap.range -=
> > -							xe_vma_end(vma) -
> > -							xe_vma_start(old);
> > -						op->remap.start = xe_vma_end(vma);
> > -					}
> > +
> > +			if (op->base.remap.next) {
> > +				struct xe_vma *vma;
> > +				bool read_only =
> > +					op->base.remap.unmap->va->flags &
> > +					XE_VMA_READ_ONLY;
> > +
> > +				bool is_null =
> > +					op->base.remap.unmap->va->flags &
> > +					DRM_GPUVA_SPARSE;
> > +
> > +				vma = new_vma(vm, op->base.remap.next,
> > +					      op->tile_mask, read_only,
> > +					      is_null);
> > +				if (IS_ERR(vma)) {
> > +					err = PTR_ERR(vma);
> > +					goto free_fence;
> >  				}
> >  
> > -				if (op->base.remap.next) {
> > -					struct xe_vma *vma;
> > -					bool read_only =
> > -						op->base.remap.unmap->va->flags &
> > -						XE_VMA_READ_ONLY;
> > -
> > -					bool is_null =
> > -						op->base.remap.unmap->va->flags &
> > -						DRM_GPUVA_SPARSE;
> > -
> > -					vma = new_vma(vm, op->base.remap.next,
> > -						      op->tile_mask, read_only,
> > -						      is_null);
> > -					if (IS_ERR(vma)) {
> > -						err = PTR_ERR(vma);
> > -						goto free_fence;
> > -					}
> > -
> > -					op->remap.next = vma;
> > -
> > -					/*
> > -					 * Userptr creates a new SG mapping so
> > -					 * we must also rebind.
> > -					 */
> > -					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> > -						IS_ALIGNED(xe_vma_start(vma),
> > -							   xe_vma_max_pte_size(old));
> > -					if (op->remap.skip_next) {
> > -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > -						op->remap.range -=
> > -							xe_vma_end(old) -
> > -							xe_vma_start(vma);
> > -					}
> > +				op->remap.next = vma;
> > +
> > +				/*
> > +				 * Userptr creates a new SG mapping so
> > +				 * we must also rebind.
> > +				 */
> > +				op->remap.skip_next = !xe_vma_is_userptr(old) &&
> > +					IS_ALIGNED(xe_vma_start(vma),
> > +						   xe_vma_max_pte_size(old));
> > +				if (op->remap.skip_next) {
> > +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > +					op->remap.range -=
> > +						xe_vma_end(old) -
> > +						xe_vma_start(vma);
> >  				}
> > -				break;
> > -			}
> > -			case DRM_GPUVA_OP_UNMAP:
> > -			case DRM_GPUVA_OP_PREFETCH:
> > -				/* Nothing to do */
> > -				break;
> > -			default:
> > -				XE_WARN_ON("NOT POSSIBLE");
> >  			}
> > -
> > -			last_op = op;
> > +			break;
> > +		}
> > +		case DRM_GPUVA_OP_UNMAP:
> > +		case DRM_GPUVA_OP_PREFETCH:
> > +			/* Nothing to do */
> > +			break;
> > +		default:
> > +			XE_WARN_ON("NOT POSSIBLE");
> >  		}
> >  
> > -		last_op->ops = __ops;
> > +		last_op = op;
> > +
> > +		err = xe_vma_op_commit(vm, op);
> > +		if (err)
> > +			goto free_fence;
> >  	}
> >  
> > -	if (!last_op)
> > -		return -ENODATA;
> > +	/* FIXME: Unhandled corner case */
> > +	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
> >  
> > -	last_op->flags |= XE_VMA_OP_LAST;
> > -	last_op->num_syncs = num_syncs;
> > -	last_op->syncs = syncs;
> > -	last_op->fence = fence;
> > +	if (!last_op)
> > +		goto free_fence;
> > +	last_op->ops = ops;
> > +	if (last) {
> > +		last_op->flags |= XE_VMA_OP_LAST;
> > +		last_op->num_syncs = num_syncs;
> > +		last_op->syncs = syncs;
> > +		last_op->fence = fence;
> > +	}
> >  
> >  	return 0;
> >  
> > @@ -2609,58 +2658,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> >  	return err;
> >  }
> >  
> > -static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> > -{
> > -	int err = 0;
> > -
> > -	lockdep_assert_held_write(&vm->lock);
> > -
> > -	switch (op->base.op) {
> > -	case DRM_GPUVA_OP_MAP:
> > -		err |= xe_vm_insert_vma(vm, op->map.vma);
> > -		if (!err)
> > -			op->flags |= XE_VMA_OP_COMMITTED;
> > -		break;
> > -	case DRM_GPUVA_OP_REMAP:
> > -		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> > -				 true);
> > -		op->flags |= XE_VMA_OP_COMMITTED;
> > -
> > -		if (op->remap.prev) {
> > -			err |= xe_vm_insert_vma(vm, op->remap.prev);
> > -			if (!err)
> > -				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> > -			if (!err && op->remap.skip_prev)
> > -				op->remap.prev = NULL;
> > -		}
> > -		if (op->remap.next) {
> > -			err |= xe_vm_insert_vma(vm, op->remap.next);
> > -			if (!err)
> > -				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> > -			if (!err && op->remap.skip_next)
> > -				op->remap.next = NULL;
> > -		}
> > -
> > -		/* Adjust for partial unbind after removin VMA from VM */
> > -		if (!err) {
> > -			op->base.remap.unmap->va->va.addr = op->remap.start;
> > -			op->base.remap.unmap->va->va.range = op->remap.range;
> > -		}
> > -		break;
> > -	case DRM_GPUVA_OP_UNMAP:
> > -		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> > -		op->flags |= XE_VMA_OP_COMMITTED;
> > -		break;
> > -	case DRM_GPUVA_OP_PREFETCH:
> > -		op->flags |= XE_VMA_OP_COMMITTED;
> > -		break;
> > -	default:
> > -		XE_WARN_ON("NOT POSSIBLE");
> > -	}
> > -
> > -	return err;
> > -}
> > -
> >  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> >  			       struct xe_vma_op *op)
> >  {
> > @@ -2878,11 +2875,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> >  	{
> >  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
> >  
> > -		down_read(&vm->userptr.notifier_lock);
> > -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> > -		up_read(&vm->userptr.notifier_lock);
> > -		if (post_commit)
> > -			xe_vm_insert_vma(vm, vma);
> > +		if (vma) {
> > +			down_read(&vm->userptr.notifier_lock);
> > +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> > +			up_read(&vm->userptr.notifier_lock);
> > +			if (post_commit)
> > +				xe_vm_insert_vma(vm, vma);
> > +		}
> >  		break;
> >  	}
> >  	case DRM_GPUVA_OP_REMAP:
> > @@ -2897,11 +2896,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> >  			prep_vma_destroy(vm, op->remap.next, next_post_commit);
> >  			xe_vma_destroy_unlocked(op->remap.next);
> >  		}
> > -		down_read(&vm->userptr.notifier_lock);
> > -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> > -		up_read(&vm->userptr.notifier_lock);
> > -		if (post_commit)
> > -			xe_vm_insert_vma(vm, vma);
> > +		if (vma) {
> > +			down_read(&vm->userptr.notifier_lock);
> > +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> 
> wouldn't we need to clear the other new commited flags here?
> 

No sure what you mean the commit flag is per op, we unwind any ops that have been commited.

Matt

> > +			up_read(&vm->userptr.notifier_lock);
> > +			if (post_commit)
> > +				xe_vm_insert_vma(vm, vma);
> > +		}
> >  		break;
> >  	}
> >  	case DRM_GPUVA_OP_PREFETCH:
> > @@ -2990,20 +2991,16 @@ static void xe_vma_op_work_func(struct work_struct *w)
> >  	}
> >  }
> >  
> > -static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
> > -				    struct list_head *ops_list, bool async)
> > +static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > +				     struct list_head *ops_list, bool async)
> >  {
> >  	struct xe_vma_op *op, *last_op, *next;
> >  	int err;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> >  
> > -	list_for_each_entry(op, ops_list, link) {
> > +	list_for_each_entry(op, ops_list, link)
> >  		last_op = op;
> > -		err = xe_vma_op_commit(vm, op);
> > -		if (err)
> > -			goto unwind;
> > -	}
> >  
> >  	if (!async) {
> >  		err = xe_vma_op_execute(vm, last_op);
> > @@ -3042,28 +3039,29 @@ static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
> >  	return err;
> >  }
> >  
> > -/*
> > - * Unwind operations list, called after a failure of vm_bind_ioctl_ops_create or
> > - * vm_bind_ioctl_ops_parse.
> > - */
> >  static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
> >  				     struct drm_gpuva_ops **ops,
> >  				     int num_ops_list)
> >  {
> >  	int i;
> >  
> > -	for (i = 0; i < num_ops_list; ++i) {
> > +	for (i = num_ops_list - 1; i; ++i) {
> >  		struct drm_gpuva_ops *__ops = ops[i];
> >  		struct drm_gpuva_op *__op;
> >  
> >  		if (!__ops)
> >  			continue;
> >  
> > -		drm_gpuva_for_each_op(__op, __ops) {
> > +		drm_gpuva_for_each_op_reverse(__op, __ops) {
> >  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> >  
> > -			xe_vma_op_unwind(vm, op, false, false, false);
> > +			xe_vma_op_unwind(vm, op,
> > +					 op->flags & XE_VMA_OP_COMMITTED,
> > +					 op->flags & XE_VMA_OP_PREV_COMMITTED,
> > +					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
> >  		}
> > +
> > +		drm_gpuva_ops_free(&vm->mgr, __ops);
> >  	}
> >  }
> >  
> > @@ -3384,14 +3382,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  			ops[i] = NULL;
> >  			goto unwind_ops;
> >  		}
> > +
> > +		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> > +					      &ops_list,
> > +					      i == args->num_binds - 1,
> > +					      async);
> > +		if (err)
> > +			goto unwind_ops;
> >  	}
> >  
> > -	err = vm_bind_ioctl_ops_parse(vm, q, ops, args->num_binds,
> > -				      syncs, num_syncs, &ops_list, async);
> > -	if (err)
> > +	/* Nothing to do */
> > +	if (list_empty(&ops_list)) {
> > +		err = -ENODATA;
> >  		goto unwind_ops;
> > +	}
> >  
> > -	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
> > +	err = vm_bind_ioctl_ops_execute(vm, &ops_list, async);
> >  	up_write(&vm->lock);
> >  
> >  	for (i = 0; i < args->num_binds; ++i)
> > -- 
> > 2.34.1
> > 
