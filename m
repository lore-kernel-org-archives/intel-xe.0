Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22C9EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 15:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF6E10E421;
	Thu,  6 Jul 2023 15:03:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5210E421
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688655800; x=1720191800;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QqvvEPC4K+W5jhsyVzVapPqtHntclNqyWEQP75kxsA8=;
 b=COYTj/Va2n0wLlekhXWRNM9Je+GqBev4dMAdXTXIIuWk1TDidCvXMe/h
 QDErfiaKxLNasO7+hLiDRMn9KnaiN6/eV2NRyR+sQylu/JVrd2xqUC5z8
 0HkKvpRxJRYmkpagba5FqMi0Bn5VEybgXf8WG8d1zs/mDfo54Zga3UGTj
 iuMNMQzDZdUQJRTA6eDLwwIgLf85pgcifHHtZaAfiDDTmAjAAzaLn6d1f
 eIrVpcBp4Uvw6hXW9GBA1IzyThs1PQNK9Htt8Vk8gK1k7WTF38ob4ZV6l
 X7e0WdFAyjCuTjpHaXRGDerlU6YI/tMdJl049SIPE8hUMJfEf2vi0S357 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394383719"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394383719"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="832977329"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="832977329"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2023 08:02:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 08:02:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 08:02:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 08:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBzfQY2oYfi67QLH+jpY6V6uq/dlvnrAWc25z+V42nn8fSkTdSXZAhTKlpQzgl/7ZsXUJR0p9tqyDj1OoV4pZYVoiszbiCt4xgy0099/HRfaoG0azkEXcvSxy4SVYytXQ1TdA3KzXpjyRDfmazqVT7ZKEmSdxUltYKOUcZzcUAVv2AjzaQv0LAmA5ItUjEcbVbnljrKLdnr5ymYJNa1LU6fPjivxccF/I0zQ/UHfvoWD0G7RHTS34mP8bDoV7OPXyQZAOd7uRbJnNxO0yQ2SLTMyUPWjyuxOASJ/Q6WUuEPWlLgJx7V4Eh567YRNpa+ZHZAH7qcptaLfNEuzuZcNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjdbEErBIIBGJXrBbPV3JJekdpaltbPuWUEws8S7zqE=;
 b=fFHk/dwN+2BxifIjPG7zMAFhSUHL1Bxp2G+ynelARlJezpx4UlePWL/5VmwhjPWOzapolyrIDIOKuOXIwp68bwyA9whEEn7UcfAMm0WT8/rm4+GEz+G5knXK9z7LUU11syVmJDHHu5JqE5uI3SQPrHxZ4yPEQ44/+uQa1WQHdXlGx5e1E4Yw8IIXdJ5ZNlOYmOK9r+Oj60qHH0xBJo5sA18le51BKHRIhIwy6jtxfphRyXtqlnwCh+5M3XeP5ZAE9KT4GZ8bJrACRWNn99fNllQI5Kg+PLoZ9FYsTeMmmE7WTutJBMjvwzdVto9uooBxRkZAN58nwh40VEO8RNOa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 15:02:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 15:02:37 +0000
Date: Thu, 6 Jul 2023 15:01:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZKbXXqugzXFjCPsP@DUT025-TGLU.fm.intel.com>
References: <20230630175804.1096370-1-matthew.brost@intel.com>
 <20230630175804.1096370-2-matthew.brost@intel.com>
 <6f79cea3-2c88-868b-3869-3014656cd5ad@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f79cea3-2c88-868b-3869-3014656cd5ad@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ba17a6-24ba-4c09-c110-08db7e3208f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJ9cSaAklHGm1r8/EHpeHGWwl169iGQUOCC9ptoDD236g4cmp9/Qs/RRc5zpmP67xTr8ZQnJKJLU4BfkeO6i0fknwUnM+tiaHy7Qe0t7koekKtBuzfqX0RzX/1m7qIoGjiGVSj/ApGhjeXs6H4qfHJzskTTxHxmIYG9HRqqXJ5RMgXV7JTCF8MRMJgddCCpJFiK82fvDwDXNjhiLpBLpMS2q4BnMB3Es+dLx137Y8DRXmS40fsOhqIjI7QtKMpouQvbBU3vMplI6LvBGqGRBG/4akCVazD+uefZufvvXirR7jh6DPLTl3+Y8HUFuajM4n6clXbgDnemv6C2bC3e8QVaIfStcAqPDUaXq6/GstPzcFWbPeVbD0J8oEUw3MgP1V6V3NJUt82xke9lmAzJ1jsA2ArWDucKViZGkR63i0omGkHgS05hMc1PUFXzbUKSrQmmKadYGIX78Pd87XHQKioBHfBwaKxTWEgzXZwsyad77XqJ3uS7qKIDjTnyE6cx7J6pKo5b4TBvVO1tSdovoVrlt9mLYPOzOA1HdmIqeS1+e0g0EL8ajcTFvppNRpyam
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(6486002)(478600001)(6666004)(186003)(26005)(66946007)(53546011)(6512007)(2906002)(30864003)(66556008)(41300700001)(5660300002)(316002)(66476007)(6916009)(4326008)(44832011)(8936002)(8676002)(38100700002)(83380400001)(82960400001)(6506007)(66574015)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tOX5shF1ju2cAxMlNx5E3ALXMGlaZkGEiarrN+x8D4CE/H7OVSb+wjhzbp?=
 =?iso-8859-1?Q?22H8yAluMOOnWWomiN4xfpyggN+I71dnZfxY/TuKh6TXx1ijVL0hABsq2p?=
 =?iso-8859-1?Q?M6ui/s3wnmWGrhsLiXzS+SEvdbtTN/aFqilxid8/B/jmv/uyw8XWI3F1+p?=
 =?iso-8859-1?Q?EZhkIZCz0Q6lV9N9BMvWrQrDHw9Cda8ma7hTHwVCsOryLo/h6QGKJkcRJK?=
 =?iso-8859-1?Q?HFCgLP3NDU5CI97S+AbqNo0GED4uUnPSwECN09GN8nS1e5CqQAKk4t68rj?=
 =?iso-8859-1?Q?h/MzB+nMBEyntZgqWeATEOwoKaCOl+Y21IjFYM+DxmaYlYq6x1Ag1imid4?=
 =?iso-8859-1?Q?+78ZW5JLwbGfsD+jc3RRnBQ2N48u0UgxtLoVFa403OkG1OM1hFfvYbmCwa?=
 =?iso-8859-1?Q?DQWixfWzN0VNPLpR3CR1jc8p8HjUPv6jUmNLUONDVoCrR5E29iOCeC9bW6?=
 =?iso-8859-1?Q?mSNjTff8Yw9Oj240CUNLnfbvgY93qjWGky355OdzS5YBEEI3MIbMwHXYZG?=
 =?iso-8859-1?Q?DpALpqnQvsieCge5/8KA4u5xBLvgNMiOA2DBAJAoNde9AopBAS/ES9SQj2?=
 =?iso-8859-1?Q?J6OyyOTd0ExLdkk0Wy0M1VfUVE7LTL6Qr+Ysmt2cGn43orG9z0Y1nj7jo3?=
 =?iso-8859-1?Q?tpvr2UoTVBiUwHCw9XeBLJKLfh3H6DaGaeGU67egbLi/zdsaoj6Y1JrKgK?=
 =?iso-8859-1?Q?7L0Gz2ZwF9ofkRE702GFsowb67zUHBnAw06vnxJxGDmqgHSDaVI5vhQQci?=
 =?iso-8859-1?Q?5nRc4jJFE5JXz9ttIKvEaZLnb4lQnwSz2iZdfjLRtDCPhSeme+nVBrj3gZ?=
 =?iso-8859-1?Q?in1AqFQwlp2QFxpL9/YRHSd8nceALCkbRW6DbWMCyvW97Q+g/msS7HIy0T?=
 =?iso-8859-1?Q?0V9AwZNXcVFuqtSZIajK+Uzgmb3bRtDECnTh/Ve5w6eU4L2ih8NjDmEBPm?=
 =?iso-8859-1?Q?omQqSDwke1ZfX3yL7irrFAeVQoXgn+moYsWmBd286mmyB/JBr6IHsPjZmv?=
 =?iso-8859-1?Q?CG7IB4RnDrog28byMpTTD62pr1oL6mvpIGOgoxEZyXnMFNAGno0aUtQpZg?=
 =?iso-8859-1?Q?550DhUBM91V+4jQwvVTMr4nIzic3O+t3jpQHl6wm6nW59VwGMvLHPx1L9l?=
 =?iso-8859-1?Q?Fm/QYDd4ssBa6SYiNXN2WaXJ7jdFJtViLZhYA6s6/xQXpwtFpKXkV+2NGL?=
 =?iso-8859-1?Q?OA3fNtACyDWtbjIPW42CSUVP9mn93TnjFa5ezhcYmkvIm6GWL6ivxh/l5g?=
 =?iso-8859-1?Q?BEsd069Nj5KCLhbvlNnJ9uMZSxGC5DqhuAbPX2nMbBeSVgS739yf4swnQB?=
 =?iso-8859-1?Q?Cjb9J6+pHFmBnK+kC8TerAFzm+US+AFx4q4rLawJpgqQV7v/PfqnDAG5Ee?=
 =?iso-8859-1?Q?8UFAngRh3zpP5qNkOptCtHDORc/8YDDFcTUsbgPhEvxrbbNqJ4Q7TchbAr?=
 =?iso-8859-1?Q?HLllIsf7dp6btQEwiJsyzsfpHY8DQjtAp/EcHOoJgCYup0qKk3MXDWTqQD?=
 =?iso-8859-1?Q?O94tI0xjtdm1SnllNo4xvo9OXeoLElWAfgvTm/ItldG6XjS8BHnHCQPAm5?=
 =?iso-8859-1?Q?bmn2o2LeHqV7k6Nmd3/xkPzhjlFwJ+QXbq7sTwEkf5BflqVJteciNjSElE?=
 =?iso-8859-1?Q?rhN/SZcNOl4sahkBAyHNxeFXzjXNJxuCVra67oOYVVPagIjXd0mll7vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ba17a6-24ba-4c09-c110-08db7e3208f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 15:02:36.8325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv7vKdxXVFIXOy931WhgRJXNxkpdAFlqsZ+e+pL4P4yDGDdAkQGBBezkMYrjaeRapCTuBTe9hjobzOqS2SuSWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/9] drm/xe: Ban a VM if rebind worker
 hits an error
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

On Thu, Jul 06, 2023 at 12:31:36PM +0200, Thomas Hellström wrote:
> Hi, Matthew.
> 
> On 6/30/23 19:57, Matthew Brost wrote:
> > We cannot recover a VM if a rebind worker hits an error, ban the VM if
> > happens to ensure we do not attempt to place this VM on the hardware
> > again.
> > 
> > A follow up will inform the user if this happens.
> > 
> > v2: Return -ECANCELED in exec VM closed or banned, check for closed or
> > banned within VM lock.
> > v3: Fix lockdep splat by looking engine outside of vm->lock
> > v4: Fix error path when engine lookup fails
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_engine.c     | 13 +++++
> >   drivers/gpu/drm/xe/xe_exec.c       |  6 +-
> >   drivers/gpu/drm/xe/xe_trace.h      |  5 ++
> >   drivers/gpu/drm/xe/xe_vm.c         | 92 ++++++++++++++++++------------
> >   drivers/gpu/drm/xe/xe_vm.h         | 11 ++++
> >   drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
> >   drivers/gpu/drm/xe/xe_vm_types.h   |  5 +-
> >   7 files changed, 92 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index 6e6b2913f766..ada2986c33a2 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -597,10 +597,23 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> >   		if (XE_IOCTL_ERR(xe, !vm))
> >   			return -ENOENT;
> > +		err = down_read_interruptible(&vm->lock);
> > +		if (err) {
> > +			xe_vm_put(vm);
> > +			return err;
> > +		}
> > +
> > +		if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> 
> xe_vm_is_closed requires the vm->resv according to comments in the function.
> Not sure if that is actually true anylonger but if not, the comment needs an
> update, and the function needs an assert.

That is wrong, it should be vm->lock but xe_vm_close_and_put needs
updating to set closed. Will fix comment and xe_vm_close_and_put.

> 
> Also see below comment on flags usage.
> 
> > +			up_read(&vm->lock);
> > +			xe_vm_put(vm);
> > +			return -ENOENT;
> > +		}
> > +
> >   		e = xe_engine_create(xe, vm, logical_mask,
> >   				     args->width, hwe,
> >   				     xe_vm_no_dma_fences(vm) ? 0 :
> >   				     ENGINE_FLAG_PERSISTENT);
> > +		up_read(&vm->lock);
> >   		xe_vm_put(vm);
> >   		if (IS_ERR(e))
> >   			return PTR_ERR(e);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index c52edff9a358..bdf00e59e7a4 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -297,9 +297,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	if (err)
> >   		goto err_unlock_list;
> > -	if (xe_vm_is_closed(engine->vm)) {
> > -		drm_warn(&xe->drm, "Trying to schedule after vm is closed\n");
> > -		err = -EIO;
> > +	if (xe_vm_is_closed_or_banned(engine->vm)) {
> > +		drm_warn(&xe->drm, "Trying to schedule after vm is closed or banned\n");
> > +		err = -ECANCELED;
> >   		goto err_engine_end;
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 02861c26e145..ca96a0a4bb80 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -477,6 +477,11 @@ DECLARE_EVENT_CLASS(xe_vm,
> >   			      __entry->asid)
> >   );
> > +DEFINE_EVENT(xe_vm, xe_vm_kill,
> > +	     TP_PROTO(struct xe_vm *vm),
> > +	     TP_ARGS(vm)
> > +);
> > +
> >   DEFINE_EVENT(xe_vm, xe_vm_create,
> >   	     TP_PROTO(struct xe_vm *vm),
> >   	     TP_ARGS(vm)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 3bba957e3b89..3c8a48f9a0d3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -514,6 +514,24 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> >   #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > +static void xe_vm_kill(struct xe_vm *vm)
> > +{
> > +	struct ww_acquire_ctx ww;
> > +	struct xe_engine *e;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	xe_vm_lock(vm, &ww, 0, false);
> > +	vm->flags |= XE_VM_FLAG_BANNED;
> 
> Is the vm->flags member always protected by the vm lock? If not, IIRC we
> can't access individual bits without using set_bit() and frientds bit-ops.
> The vm->flags kerneldoc says all bits are "statically set up a creation
> time".

All bits aside from XE_VM_FLAG_BANNED can static from creation time,
after creation time all changeds should be protected by the lock. Right
now that is only XE_VM_FLAG_BANNED. I can update the comment.

> 
> > +	trace_xe_vm_kill(vm);
> > +
> > +	list_for_each_entry(e, &vm->preempt.engines, compute.link)
> > +		e->ops->kill(e);
> > +	xe_vm_unlock(vm, &ww);
> > +
> > +	/* TODO: Inform user the VM is banned */
> > +}
> > +
> >   static void preempt_rebind_work_func(struct work_struct *w)
> >   {
> >   	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> > @@ -533,13 +551,14 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >   	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
> >   	trace_xe_vm_rebind_worker_enter(vm);
> > -	if (xe_vm_is_closed(vm)) {
> > +	down_write(&vm->lock);
> > +
> > +	if (xe_vm_is_closed_or_banned(vm)) {
> > +		up_write(&vm->lock);
> >   		trace_xe_vm_rebind_worker_exit(vm);
> >   		return;
> >   	}
> > -	down_write(&vm->lock);
> > -
> >   retry:
> >   	if (vm->async_ops.error)
> >   		goto out_unlock_outer;
> > @@ -666,11 +685,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >   			goto retry;
> >   		}
> >   	}
> > +	if (err)
> > +		xe_vm_kill(vm);
> >   	up_write(&vm->lock);
> >   	free_preempt_fences(&preempt_fences);
> > -	XE_WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
> 
> I've often find it useful to have a debug printout here, what the error code
> is. Can we use
> 
> drm_debug("VM worker error: %pe\n", ERR_PTR(err));
> 
> without risking spamming the logs?
>

Sure.
 
> >   	trace_xe_vm_rebind_worker_exit(vm);
> >   }
> > @@ -1140,11 +1160,12 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
> >   {
> >   	struct rb_node *node;
> > -	if (xe_vm_is_closed(vm))
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	if (xe_vm_is_closed_or_banned(vm))
> >   		return NULL;
> >   	XE_BUG_ON(vma->end >= vm->size);
> > -	lockdep_assert_held(&vm->lock);
> >   	node = rb_find(vma, &vm->vmas, xe_vma_cmp_vma_cb);
> > @@ -3074,30 +3095,35 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	if (err)
> >   		return err;
> > -	vm = xe_vm_lookup(xef, args->vm_id);
> > -	if (XE_IOCTL_ERR(xe, !vm)) {
> > -		err = -EINVAL;
> > -		goto free_objs;
> > -	}
> > -
> > -	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > -		drm_err(dev, "VM closed while we began looking up?\n");
> > -		err = -ENOENT;
> > -		goto put_vm;
> > -	}
> > -
> >   	if (args->engine_id) {
> >   		e = xe_engine_lookup(xef, args->engine_id);
> >   		if (XE_IOCTL_ERR(xe, !e)) {
> >   			err = -ENOENT;
> > -			goto put_vm;
> > +			goto free_objs;
> >   		}
> > +
> >   		if (XE_IOCTL_ERR(xe, !(e->flags & ENGINE_FLAG_VM))) {
> >   			err = -EINVAL;
> >   			goto put_engine;
> >   		}
> >   	}
> > +	vm = xe_vm_lookup(xef, args->vm_id);
> > +	if (XE_IOCTL_ERR(xe, !vm)) {
> > +		err = -EINVAL;
> > +		goto put_engine;
> > +	}
> > +
> > +	err = down_write_killable(&vm->lock);
> > +	if (err)
> > +		goto put_vm;
> > +
> > +	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> > +		drm_err(dev, "VM closed while we began looking up?\n");
> 
> Since this path is triggerable from user-space it would be easy for a
> malicious client to spam the logs.
>

Do you suggest I remove this or change the level? I'd lean towards
remove as XE_IOCTL_ERR gives us the information we want on a debug build
of the kernel.

Matt
 
> /Thomas
> 
> 
> > +		err = -ENOENT;
> > +		goto release_vm_lock;
> > +	}
> > +
> >   	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
> >   		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
> >   			err = -EOPNOTSUPP;
> > @@ -3107,10 +3133,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			err = -EPROTO;
> >   		if (!err) {
> > -			down_write(&vm->lock);
> >   			trace_xe_vm_restart(vm);
> >   			vm_set_async_error(vm, 0);
> > -			up_write(&vm->lock);
> >   			queue_work(system_unbound_wq, &vm->async_ops.work);
> > @@ -3119,13 +3143,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   				xe_vm_queue_rebind_worker(vm);
> >   		}
> > -		goto put_engine;
> > +		goto release_vm_lock;
> >   	}
> >   	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
> >   			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
> >   		err = -EOPNOTSUPP;
> > -		goto put_engine;
> > +		goto release_vm_lock;
> >   	}
> >   	for (i = 0; i < args->num_binds; ++i) {
> > @@ -3135,7 +3159,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		if (XE_IOCTL_ERR(xe, range > vm->size) ||
> >   		    XE_IOCTL_ERR(xe, addr > vm->size - range)) {
> >   			err = -EINVAL;
> > -			goto put_engine;
> > +			goto release_vm_lock;
> >   		}
> >   		if (bind_ops[i].tile_mask) {
> > @@ -3144,7 +3168,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			if (XE_IOCTL_ERR(xe, bind_ops[i].tile_mask &
> >   					 ~valid_tiles)) {
> >   				err = -EINVAL;
> > -				goto put_engine;
> > +				goto release_vm_lock;
> >   			}
> >   		}
> >   	}
> > @@ -3152,13 +3176,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> >   	if (!bos) {
> >   		err = -ENOMEM;
> > -		goto put_engine;
> > +		goto release_vm_lock;
> >   	}
> >   	vmas = kzalloc(sizeof(*vmas) * args->num_binds, GFP_KERNEL);
> >   	if (!vmas) {
> >   		err = -ENOMEM;
> > -		goto put_engine;
> > +		goto release_vm_lock;
> >   	}
> >   	for (i = 0; i < args->num_binds; ++i) {
> > @@ -3213,10 +3237,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			goto free_syncs;
> >   	}
> > -	err = down_write_killable(&vm->lock);
> > -	if (err)
> > -		goto free_syncs;
> > -
> >   	/* Do some error checking first to make the unwind easier */
> >   	for (i = 0; i < args->num_binds; ++i) {
> >   		u64 range = bind_ops[i].range;
> > @@ -3225,7 +3245,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		err = __vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
> >   		if (err)
> > -			goto release_vm_lock;
> > +			goto free_syncs;
> >   	}
> >   	for (i = 0; i < args->num_binds; ++i) {
> > @@ -3345,8 +3365,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			break;
> >   		}
> >   	}
> > -release_vm_lock:
> > -	up_write(&vm->lock);
> >   free_syncs:
> >   	while (num_syncs--) {
> >   		if (async && j &&
> > @@ -3359,11 +3377,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   put_obj:
> >   	for (i = j; i < args->num_binds; ++i)
> >   		xe_bo_put(bos[i]);
> > +release_vm_lock:
> > +	up_write(&vm->lock);
> > +put_vm:
> > +	xe_vm_put(vm);
> >   put_engine:
> >   	if (e)
> >   		xe_engine_put(e);
> > -put_vm:
> > -	xe_vm_put(vm);
> >   free_objs:
> >   	kfree(bos);
> >   	kfree(vmas);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 5edb7771629c..47bc7fbb2f50 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -49,6 +49,17 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
> >   	return !vm->size;
> >   }
> > +static inline bool xe_vm_is_banned(struct xe_vm *vm)
> > +{
> > +	return vm->flags & XE_VM_FLAG_BANNED;
> > +}
> > +
> > +static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
> > +{
> > +	lockdep_assert_held(&vm->lock);
> > +	return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
> > +}
> > +
> >   struct xe_vma *
> >   xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 0f5eef337037..76458f8d57f3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -313,7 +313,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> >   	if (XE_IOCTL_ERR(xe, !vm))
> >   		return -EINVAL;
> > -	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > +	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> >   		err = -ENOENT;
> >   		goto put_vm;
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index c148dd49a6ca..286de52160b9 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -183,8 +183,9 @@ struct xe_vm {
> >   #define XE_VM_FLAG_MIGRATION		BIT(3)
> >   #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> >   #define XE_VM_FLAG_FAULT_MODE		BIT(5)
> > -#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 6) & 0x3)
> > -#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 6)
> > +#define XE_VM_FLAG_BANNED		BIT(6)
> > +#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 7) & 0x3)
> > +#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
> >   	unsigned long flags;
> >   	/** @composite_fence_ctx: context composite fence */
