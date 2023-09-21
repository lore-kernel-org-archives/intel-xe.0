Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A04E7D0A2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 18:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278A010E16B;
	Thu, 21 Sep 2023 18:33:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2674F10E152
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695321185; x=1726857185;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dVOgCua7EIlr9yQiZgXEllNqRQXUPnCZF4Y5+qKfvYE=;
 b=nGJE0eDQd2eS3bXXlCTHzEwU5tFmTwwBHmun8Lk+olCY958Pv76Sw0mm
 aLmag08pruz3fdVbjuipXSFMhsHFdOV35mBUiFcEzrx22Ik1bnkqzm/FC
 ZJqpuT3okNPQ5H0VZcReBDvucemnyimpjCLFeJe/oynedzCexf7FCYaf7
 HiDCP72xCMAzTxev0XuFQStIbnvZ8ae9006kOl37jerSJBAkC2WjbQgLt
 CVHUNp0E2+6NewVbaUkJYMR4ME5sBi4e5BtxO6w1sFdbEaR7OoaMNaDS+
 zSkmFTZlbEzaNm+JpIVXlrZR2yof1LQi1BOOyPF0enxq404V6KdlvaMPw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="380525652"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="380525652"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 11:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837395351"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="837395351"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 11:28:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 11:28:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 11:28:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 11:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHprkJOxHbc65i6nG8TOyQNy2i1d5N7qbEnAoQywav1F8wNLiVTeBvPULVXeE8dLaGo9ypBS/VSqVTZSPELazcVlE08sjbGhIPCqealQLPHaG4bdM6g6JRvrs9tx9ofSfH1swFNDjo33oZnOduyBlt+9AZkecjzJ9haJMeIHRmmJ6SQMtYRWNYtVBxg8x09l86cAoawEQVCJRUiUCeScffa9NOnFhDvxMYTeHYyYlaF+MnXCaFVl5GM5+nZID9k79Daig7j2rkVDCh3cyKSDIbxCYpALPf5K+rq3bQjE3slNYBhcQEqtIQ12+wy/D+YpemwYyXkNZPsrBwsVE0no4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHIb2wCGSfX8BvwK3NQOPEVYnPMccCRg91qYYhe6W0Y=;
 b=LIFuHwRUTr7qcy6d4KfYlTD+j9kb/LYl9FC0iiq9mFmMMbW4MldU6w+XX/kUCGabB8BuB0ZFuH+Zutk+wGNzfv1mpTcaTmWL/EtRCSMYmIoSFT+1YCs22opVIsxkX1Vfcq/sANIXz4ppL3kEDk4oBeLDjf9l3Yam+9LgUTOTzhM4sbLLVshNLJqkJ1ii3C9P4oLwK2sVAwW4dv5eYTNPwJ/y5Gu6dCswDKDw9dFdp+1kbi6QzVkDzhPFliUd6tuTVcYJ9qrszNvPDRF3k7D4anAjQB0N3PXQRFx/G4B0ZunGEdjlWs0qswU9q2uKd/tT/n/DfWWSau56BQGEHrVzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 18:28:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 18:28:40 +0000
Date: Thu, 21 Sep 2023 18:27:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZQyLEw5Hjr30eWJy@DUT025-TGLU.fm.intel.com>
References: <20230914204053.2220281-1-matthew.brost@intel.com>
 <20230914204053.2220281-6-matthew.brost@intel.com>
 <55c806c5a41472fd063faae222ef74ece36945b4.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55c806c5a41472fd063faae222ef74ece36945b4.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: c6528330-e92f-4556-6f6d-08dbbad093bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8s2D4gYXbr+QeN0ljH+DI/WM6IzmOIMc5L6AzF9QLTQYSeV6k1fD92MXiFc6Gweh9aJkIcI1VoN/oiPTjWlRNYmfrdDZd1pxpRqTXaGykNf9IQ3jQCNwKJx3nr/quOQcNg8gW2KvGfaxGW18dSUF2W4rIizze805KKpoUtQR747rofdmY9T7T/Gei1tjJbFQ5CcN7nZ26NESFkJGdoeMDw+PiuF9xH5r801WfHZy2rgb+rbKIBi2Pa2g58HkAlrh/FjVPzRG6a0s4kcV/M9eud2GXtf+3Bv4/6B5fTU5uPM1rBGcwVCkeEJkDt0+wjpdK/FzaqEWXJBXu6blD8YZ0/saVACjLbBJhzbVRPs4nmc33tJp3csl1gECMWyy2iCXqaa0rIH3QR5/DYl/zyVxRl29ZEfCRgE8zHCWhLWfCXWUX+WzZ5nxra1h5cU8QZJE0/rJv/TGx7znpyhgaKoBDCXWI2shtYvkvxJlpAItmfS6HjsYsCupcwFBeI2QEYySyeGH9Q+HRQrtYqVQJz/kxXXkaXKYRgzDCwkOhx9i9llRAvDk+smPCXu4WqoUWIa0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(8676002)(66476007)(66946007)(6916009)(66556008)(316002)(8936002)(44832011)(5660300002)(4326008)(41300700001)(6666004)(478600001)(6506007)(6486002)(86362001)(2906002)(83380400001)(82960400001)(38100700002)(26005)(66574015)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AUWgW3sXyGuuTzQ8Qcbjuvb8s5FcEJZU60uiuU+K+FHKVQ0FbNMdEPixMQ?=
 =?iso-8859-1?Q?GZKwPZA9V5Y/Lhh59eBuaTVs/B3jWxw9v5TskalnYYT8/LF9Fh+SNN3suT?=
 =?iso-8859-1?Q?pWRQmty5Qb3qsId5g1l/Ca54/VPmUK8O822VFuQm+eFoR0hRAPHqPQPqbc?=
 =?iso-8859-1?Q?seJdvrNRSAc5IStB21PxYmAO7lg2UTFjJo3RSopEGzqTZ1dnf+gNvHX1Fq?=
 =?iso-8859-1?Q?Q6TOYiLuhP7PtXaiYkkgzay7MNbyJwVHr66qc3HeOwP2b7EuyYTWZtS3jg?=
 =?iso-8859-1?Q?2Lx/a0Rz18QX4kASk1JMfPWoO5jIRId+tZ412b96s/LDDHdxfGnpu0/SIG?=
 =?iso-8859-1?Q?PXz1STAz67YPHqe23/VQkPaVLp5FzZdNqYCagoK+HLaBKvC69zjoPqKcvJ?=
 =?iso-8859-1?Q?iW/nTpNtaiIwsJW4mNY2Oq1cbgdd/D9yccIrQfJXIVgue8Cm7tslWjAPtT?=
 =?iso-8859-1?Q?W0BEavyGR7BIGLO583um0d6QTlX57wb5OtHQ26a1ropV9LD7fXAxs8qGNM?=
 =?iso-8859-1?Q?Hwg8boBizyClv+BEdhIT4Jt/xrOH7AZ7MgM5J/8uMTNDTWFeIrx1HisOx2?=
 =?iso-8859-1?Q?aAMFXqWztZwxpBNnBL3Cs/mQdUUzuQPhj/I0lpbeo97RfXc7ZtIoWj0vHC?=
 =?iso-8859-1?Q?6tjzmyhs2WT0IqgHOGv4eo+Lq2i76ny5CPM6NeTzI7HLAHI8+k7kNk+zP/?=
 =?iso-8859-1?Q?UWOUsuZITqM4enO2P3wIZ00pjP2oxvM/fHMuHJmcUVbl+qiPYISTFQdOJk?=
 =?iso-8859-1?Q?8wU0us/AE2mAw3L2iBhF+V3qGT0koz1hJBI9MVBMN9CJ3+ClE8rhy83apR?=
 =?iso-8859-1?Q?DtVLvJuYdID412h3j22s3vt5bJK5EN2PNB+5KBOd7sLKOKLNGp2EHd/RB5?=
 =?iso-8859-1?Q?HM1B8Z6N1hbcvFoRLhy3aLaFNS+cXEO4rrMsGl/h71AhOtKQk8VkDkr2uK?=
 =?iso-8859-1?Q?Hph30O7HRBjPyNL71/qNUnGexgdN36FaDGMExN7cr/i/tjS9WnGtBp3Ttq?=
 =?iso-8859-1?Q?Du1mNejdQN6FCVaUxhPuC11Kw6Nd5DLMhiLZ9ChQnrdDB0ffImJjg1e+y0?=
 =?iso-8859-1?Q?AsiS9TINOUJ+TKLqBZaXUClhE8yb9Cg/eHmhMMYpPh9nxHtdHyBMdQxIsD?=
 =?iso-8859-1?Q?stmZt03hIQxCCYG8MUXuinXMDwR8EGNyzG1qxO14HwGM/7Dud5zm6BHGWJ?=
 =?iso-8859-1?Q?IcFstRFKTaCS69dIMsYoJRyRPJsoZZ9fRpmu69OIUgLTIbTngwnIV0UqQq?=
 =?iso-8859-1?Q?dTlZjS0gtdHwQ0hzthz0aLQO70WDmTr1iP13+q528ukEloDS5UUfHh+E9n?=
 =?iso-8859-1?Q?UF41eohYfR4vKXSQ/EgP7S8bClo/DbzxkTTqGvdDppvEkg54oiKoDVMBjX?=
 =?iso-8859-1?Q?KRArHQLYTAt3lRkFvOOGj++8lKFjWs1toxPjvgH84yIjF/2JVHmhXbzUZ7?=
 =?iso-8859-1?Q?xbUy3WPFWHg2uzRVFcV88G2R7jNVqSi6Y33cxt6aW88kzrCNqHsTHMJ6Sj?=
 =?iso-8859-1?Q?ylIYZOcuPYccRkEdQpLn+jRu7u4yPA+iltJSu1neSDN7x+/KxoiOUKnKrh?=
 =?iso-8859-1?Q?qzH2nMoyPYgPrQCOosOM2nf5XRrBa8VoYM9Fgl0thAlXMDLbpFX2R3S9C3?=
 =?iso-8859-1?Q?r+zmpQjJIaK3aO2Roz08loUB4pmhw8tJkUS06rVLHFqjrczuQRP0gthQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6528330-e92f-4556-6f6d-08dbbad093bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 18:28:40.0003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3DT5+IBPwgxHeg9XrtFdy7ntR+ODhrxWGJIhVx4b4zNnd/5StPalvoa9Ag9tWxwU/F2i9RizfFDPcaZwLFEkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: Allow num_binds == 0 in VM bind
 IOCTL
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

On Thu, Sep 21, 2023 at 11:32:17AM +0200, Thomas Hellström wrote:
> Hi, Matt!
> 
> On Thu, 2023-09-14 at 13:40 -0700, Matthew Brost wrote:
> > The idea being out-syncs can signal indicating all previous
> > operations
> > on the bind queue are complete. An example use case of this would be
> > support for implementing vkQueueWaitForIdle easily.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> One question below.
> 
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 49c745d53b41..0e2f3ab453ea 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2678,7 +2678,6 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >         int i;
> >  
> >         if (XE_IOCTL_DBG(xe, args->extensions) ||
> > -           XE_IOCTL_DBG(xe, !args->num_binds) ||
> >             XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> >                 return -EINVAL;
> >  
> > @@ -2805,7 +2804,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                         goto put_exec_queue;
> >                 }
> >  
> > -               if (XE_IOCTL_DBG(xe, async !=
> > +               if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> >                                  !!(q->flags &
> > EXEC_QUEUE_FLAG_VM_ASYNC))) {
> >                         err = -EINVAL;
> >                         goto put_exec_queue;
> > @@ -2819,7 +2818,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >         }
> >  
> >         if (!args->exec_queue_id) {
> > -               if (XE_IOCTL_DBG(xe, async !=
> > +               if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> >                                  !!(vm->flags &
> > XE_VM_FLAG_ASYNC_DEFAULT))) {
> >                         err = -EINVAL;
> >                         goto put_vm;
> > @@ -2856,16 +2855,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                 }
> >         }
> >  
> > -       bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> > -       if (!bos) {
> > -               err = -ENOMEM;
> > -               goto release_vm_lock;
> > -       }
> > +       if (args->num_binds) {
> > +               bos = kzalloc(sizeof(*bos) * args->num_binds,
> > GFP_KERNEL);
> > +               if (!bos) {
> > +                       err = -ENOMEM;
> > +                       goto release_vm_lock;
> > +               }
> >  
> > -       ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> > -       if (!ops) {
> > -               err = -ENOMEM;
> > -               goto release_vm_lock;
> > +               ops = kzalloc(sizeof(*ops) * args->num_binds,
> > GFP_KERNEL);
> > +               if (!ops) {
> > +                       err = -ENOMEM;
> > +                       goto release_vm_lock;
> > +               }
> >         }
> >  
> >         for (i = 0; i < args->num_binds; ++i) {
> > @@ -2920,6 +2921,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                         goto free_syncs;
> >         }
> >  
> > +       if (!args->num_binds) {
> > +               err = -ENODATA;
> > +               goto free_syncs;
> > +       }
> > +
> 
> Hmm. Here it appears we reject num_binds == 0? 
> 

Below -ENODATA is interrupted as a non-error which signals the
out-fences on the last fence of the queue. Another example of -ENODATA
is doing an unmap operations that doesn't result in any unbinds (e.g.
unmapping a range without any mappings).

Matt

> >         for (i = 0; i < args->num_binds; ++i) {
> >                 u64 range = bind_ops[i].range;
> >                 u64 addr = bind_ops[i].addr;
> 
