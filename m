Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE01C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 19:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2F010E870;
	Thu, 26 Oct 2023 19:31:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA7E10E870
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698348689; x=1729884689;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jyx2uCyZSHy+SO2+d9aQGKSHa7dF2HfwJelmd3lYpuU=;
 b=Vz6nNR8Dihk4TUhgr5e/d8WRvelQmYvJLlrXH637IW4a1Ez2ST+SXOxP
 7vh0rsEfyPQe6pDGxLfsn+HZyCiA0OV8DUNoqKmLjxB1qB8NMewE2EnGo
 rmzqrB7cnsR78cEdt6c+L2Fu3+WFYvGJHl6AyGW2JafgQi4mfIPFK33BA
 9lV9gmhpX5IUKW2Vgu9YlrSET+d1oJAKP4mQGlcx+FRHCsjUn+YC5/q8Q
 0yW1hZtXsPXC+TK/RQp1RHQc1KRspUifVX37ImVzw2FRQkBEXu50zB04f
 hA9THmU1FudR8ergQE8SLAMuUJwND2lSf2exNFPu7LZs839Zpz62/jqMu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372679976"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="372679976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 12:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="709190232"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="709190232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 12:31:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 12:31:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 12:31:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 12:31:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 26 Oct 2023 12:31:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9X6azThDq9durWEb9H/zeRrwUJqu8ZOxBbcCJyUZxnNfer2PODD4pOK4PqmmpMmdVFNkNgclN+maidFY2rMXE6L1I80u6i87PSZkvENKK2J9hpce6ckzCZV8kpAqYVhEi7ZSTXGYdptIvsV6KLiYZcG1LHOmT5d2Kv+v1sT+vslZKFJeobXrqGPidCFhUfvrJHsLeq/2nHrODUS/X1IUDtoEsj8CcQAiZNfy9ZQ0vdZrtdyJwinZB2SkLrp+3/w20owA2glZzoVGDzpEUwfTKWW1wsZbNHQiWUmLaOsLEpycDj4zkfPgGwuChEx39fpRVnOKK8mB9JxTBsmoT1lPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnwODoD+WmH+eNtaz1HWModBCTAQClbNnKkcbPIhPyk=;
 b=K3Bb/SjLvTtKXwqealSZKHO7Yt0WYqMfLrEgBAxILq93rK4FUEDD0Ebu7GmWHb2rHnXCweHnkTGuw/PwO4JyP0uJDGUuNC24mzKD6Oq+sIzySz1LVwmc36jLfTCKdGVpkc9qeoWXB1nkgJwB6FD6KFZwGFM7I+ffcgYZju04oflG3TjjiNOnUoaEvVrCMqManJRJFfhq8nJ6610CJ+NYOXhcqYBqCnMJqvKJesjMnmX9q6uK7TSlc9aLz8c2lahcEkP2RE4XK/oiMTSMc0qDto9Wy2B8nnxHgLw/twsm4IeDAgU6HMtIbYPz3A1zhqQrLu63/wpIBPB12QvU67J5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 19:31:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 19:31:24 +0000
Date: Thu, 26 Oct 2023 19:30:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZTq+PN6IazFPyFiz@DUT025-TGLU.fm.intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
 <20231025173937.197744-7-matthew.auld@intel.com>
 <ZTmDR54qHxBlXPtm@DUT025-TGLU.fm.intel.com>
 <5116fab6-5dcb-be90-09ce-c5dca76a79bd@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5116fab6-5dcb-be90-09ce-c5dca76a79bd@intel.com>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 1151b8f3-adbd-483d-44cd-08dbd65a23ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwioQWu51cpMuD8DJJQOceGEtXdUeyaHZZqNxBIhZdte0PWQoDyMBhYMlhxH9tLWoSM0xHnrY62bC2S1towSfAz2yJbO8jQTSIM27NXiYnPm3ats9+RO2wsX/9pnBJYVEpA2nR1rc8HdBliidA3s69jiVR8cs6dxf+DkyxqCeAjpO35bMR/MBovBTaPR6WUmwBnFxoyYicBr4WTYOav4D0hLceZAXuJ8kwrCgkTkrwmOBUxQXffgtsH7z7nWisE1p01PhuAj/XprSiOxanKuSlFk52SohxkB8cERd6+nJaOFWl4ci668N5TxEcJ/VqQVqAHEyhK00d/s64JZw4d5771+aZkUhnd7e3Ze9z3zEZy79k32IrYuFKtBQ+O9cCSxyaFgrda0FirlvZWoHxhCGupOPwWzlQxVgpPRtJm2+NoBcuvjM1nbOqPS8PH9dqzTHDSPzCZQguOQ8tYK00CofqIon2wKaBAasvvF92ioL6+55F/fotVqt+d4XWVXi9tarH8uIGVvrBH6NRjI4OPTiTPjBTq3ti1nFidpnuSTKnd3HG7S7Sh6s3KLmBwUKQ1fmKffcAL8VWdrEbYJolJTF1/eB2mnp7WMTBUiTTlv0sI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(66899024)(83380400001)(53546011)(6506007)(5660300002)(44832011)(6666004)(26005)(2906002)(6512007)(66574015)(316002)(38100700002)(41300700001)(66946007)(478600001)(6636002)(66556008)(66476007)(8936002)(6862004)(82960400001)(4326008)(8676002)(86362001)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eWb3azVyQUpO+eCStRlMbFhMNADvdTy+hYjTAcmllG51IQDtk8i3pUvyeW?=
 =?iso-8859-1?Q?pWds7Xun3VvYPSDWja7nMmZJ962qIiP33LMxaiAoSYU+ySBxiWUf9R4MJM?=
 =?iso-8859-1?Q?IREj5U+z2h3vI96DTLrqkESupOeHJ7Al/42cZDAFwKoHrVd8Vea+ZNMxH7?=
 =?iso-8859-1?Q?GWmRRnYiPJbv1coBEvyuTcsNpVuy6eVqMTVKqxxPKNw+Y9Y24PV4kYScVL?=
 =?iso-8859-1?Q?lcob1KhX44Nss0oTfWT4HI8vbVIfyM5Ms6WDpUjqdpd/k2DRv7hFjb8APm?=
 =?iso-8859-1?Q?aiiTgIk02OhLuxl0lloE8CKn6BRIL5M5dxJHnT4a0Wm+vkxCgwviKq20hi?=
 =?iso-8859-1?Q?Ykak49xzr/Tgo2ghOqKQCxfAUyxxBTowAngOGwjAckWaHmottm3glsrWxW?=
 =?iso-8859-1?Q?yrhCQtqiqveTZpX7u8AYUQG2co8A/97V+Z2eX6c590FGoSWrw8+y5OAp2s?=
 =?iso-8859-1?Q?l9ypeeZ2vCF5nJ86ThqTskPA22oPQCqGcxUhitdR48ka2eN220buAzeyVA?=
 =?iso-8859-1?Q?i8nOoeVeC+w4xYhJvm189/Grs3aM5qSFp8NmhbGaJjdVbn0aWdiLXqRL+y?=
 =?iso-8859-1?Q?TYBcW/gYwHASznnN50VrqLdn1xVCiOygG8c8oBsf41c62P2BfPjaAUUkBE?=
 =?iso-8859-1?Q?fd2GXj/Y2AUogg9CTZMig8ZXv8LWlmj84KMVX5RButa7msCFl9okdJxa+U?=
 =?iso-8859-1?Q?4kvAjEccL5+VkvLLw8STCEglzhK0W1OOS/tD/SF0hygRuEVHfFiL6fQv5v?=
 =?iso-8859-1?Q?SmOjTlC0VUmkHTzLTKqmfkh5J/4g8Ac5fg8Ox4bR7wdt2jm4CYCLtFC4Oz?=
 =?iso-8859-1?Q?Qrxw8mFpgjxRQPAgZOCfBg3alOoyqgxU+zlIHh0Tl47HWuWMCGEKE9AEbd?=
 =?iso-8859-1?Q?3qPmibcReQbF3AyI52gpE02fKdzThcMM9vFQ389TAjopBJ/FHEybyiQhR3?=
 =?iso-8859-1?Q?zautfm57hlGBtDe3IwVD1Hsy56KjZsk6BsCRocfHoi/Y49R/BZT3yX8u1c?=
 =?iso-8859-1?Q?28e6ypuszLKXMXZcoQ02qvIV//0JxVTL+Z43PC7T0t0+1jY9m6jurU0mSt?=
 =?iso-8859-1?Q?aOBi6He7muVILionDyyS93POgNRi9pQMAUKQL8EPBhr4Bp3RS+wPEtiLJv?=
 =?iso-8859-1?Q?BSMxgf3PLhUzwaYE2h07TjTau0APmZORg4ijfmxoUvV0JnGHnkZXqucmM2?=
 =?iso-8859-1?Q?I0HNdZDXeI3Z3dKc/StTAPAWSqvSMXmv3o/cKQysuT0bIBO6LDBe8lThu6?=
 =?iso-8859-1?Q?cH776nU83WCcMW9kpcaZ3PrMtL8C9RXbcv3fk8Rjc0+MchJDePDHBrSoGZ?=
 =?iso-8859-1?Q?LTNZdxuSdsZ1O6JI88VK292HRsrovEiA03VR+7fzuNnoITjmGkgL45zufO?=
 =?iso-8859-1?Q?xCgo+Ok3L5zDBO23qq9UC2cd7rAPDDir0o0HWGKUiNDOZmXihj0gpQ+mCN?=
 =?iso-8859-1?Q?9nWO2BQYxS5c+iGupo7HM2ecKdinxwpJ5esvjiF6CEAcfBNvb6MB4ylVVg?=
 =?iso-8859-1?Q?lrV4Vr0St2SZjWqcfWWla6dQdGf9TBpvQRDFOsUBgYT9UK8K8+hVOzVWCP?=
 =?iso-8859-1?Q?xItDgFhC6eWz9JL7tKC2tCP4753FOPitkF6wKOnVmksSqosEHCNsZt4DC/?=
 =?iso-8859-1?Q?/BydAzddpMJwQiwgvWgKNVFMjEsM5ORWHVPOPVPRe76jblI8A3J7pPag?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1151b8f3-adbd-483d-44cd-08dbd65a23ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 19:31:24.4927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0ZF3/Zg7BiP0NiQGfoBZLqm8ztGdjI/ZQ9qxRceNCdGUNsNkoninZ7TeuzvBEvY6r5i3jd8gnogKGOWqWfLDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/bo: consider dma-resv fences for
 clear job
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

On Thu, Oct 26, 2023 at 11:04:11AM +0100, Matthew Auld wrote:
> On 25/10/2023 22:06, Matthew Brost wrote:
> > On Wed, Oct 25, 2023 at 06:39:40PM +0100, Matthew Auld wrote:
> > > There could be active fences already in the dma-resv for the object
> > > prior to clearing. Make sure to input them as dependencies for the clear
> > > job.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_migrate.c | 10 ++++++++--
> > >   1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 009d728af762..896a6d8398ea 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -980,8 +980,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > >   		size -= clear_L0;
> > > -		/* TODO: Add dependencies here */
> > > -
> > >   		/* Preemption is enabled again by the ring ops. */
> > >   		if (!clear_vram) {
> > >   			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> > > @@ -1010,6 +1008,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > >   		}
> > >   		xe_sched_job_add_migrate_flush(job, flush_flags);
> > > +		if (!fence) {
> > > +			err = job_add_deps(job, bo->ttm.base.resv,
> > > +					   DMA_RESV_USAGE_BOOKKEEP);
> > 
> > Hmm, so if the BO is private to the VM new memory allocations for VRAM
> > (triggers clears) are now staged behind the entire VM being idle (e.g.
> > no execs, no binds inflight) and since this is a kernel operation all
> > new VM operations are stage behind this clear. This seems very, very
> > expensive. If there not another way around this?
> 
> Can make this USAGE_KERNEL I think. It's just the move fences we need worry
> about and not the userspace stuff since it hasn't gotten past the initial
> clear, I think.
> 

This makes sense to me as all user operations should be scheduled behind
this clear. KERNEL is likely the right usage.

> I don't think we evict between tiles, but rather just VRAM -> TT. If we can
> guarantee that all copy and clear jobs happen with the same queue, and the
> order we add jobs is the order they will appear in the ring and the queue is
> always tied to one tile/VRAM manager, then I think we can drop this, and add
> big block comment here instead? But I do think adding USAGE_KERNEL here is a
> good idea in general.
> 

I think if a BO is a VRAM the evict of that BO will be on the same queue
as a clear. We probably can delete this and add a comment? That being
said waiting on the kernel slots really is not a huge deal either as
pretty much everything else that will use this BO will wait on those
slots anyways too. Waiting is probably safer too.

Matt 

> > 
> > Also on compute VMs this would trigger preempt fences which would not be
> > ideal.
> > 
> > Matt
> > 
> > > +			if (err)
> > > +				goto err_job;
> > > +		}
> > >   		xe_sched_job_arm(job);
> > >   		dma_fence_put(fence);
> > > @@ -1024,6 +1028,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > >   		xe_bb_free(bb, fence);
> > >   		continue;
> > > +err_job:
> > > +		xe_sched_job_put(job);
> > >   err:
> > >   		mutex_unlock(&m->job_mutex);
> > >   		xe_bb_free(bb, NULL);
> > > -- 
> > > 2.41.0
> > > 
