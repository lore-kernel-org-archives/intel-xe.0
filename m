Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114BFEEAA5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 17:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C554210E2A1;
	Thu, 14 Sep 2023 17:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5C10E2A1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694713247; x=1726249247;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KqmA8in7iKgbW7lATJLBuEv5MAJNmeYcxFnnYGGaiRQ=;
 b=SxpalRLW8Op0Fr+E5XdG+jx/olgqJZS9onlE+rrSx905cXwO42F5QvWj
 CTB6ZinWTtcY96tgkLfM3LQse6Tr9P870f2LgCLc6whls+Ud6/7bPQCp/
 Rab4mPeCb9YnNObCl1TWqS0UDxwia3aNat9PU7h9kPzCROqq48d98U62X
 N/DTN7r1f+9RU5Lbv5gB9VYU0giLsx4gs7/20/9wdSPMdgIjF8DjEy8I7
 ljxd7QnXxzWuSKyY3BWaiLipPrWXlQucADivT4ma4JDFJX+QWaygeO2wA
 HBrBDV7/+fnmUP5m4qmxQhq/SaNNFbmtE3JD3wVT6hBhlBrVhJcX5EiXu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369325320"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="369325320"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 10:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918328089"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918328089"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 10:40:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 10:40:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 10:40:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 10:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDFbi4RkIZ0So+ZmkwZGU/yfKznblA3+Nphd8KuugxRH3/5rG+E4S1hxBvIohkH2WC0uCh2J8LqDOUNU5Hs6vOANuliQa2PX+jbZWzZ5P7969vTqP/ouwp0pcu5SS1BLkcWPS3iUXkGBCuOLW/osqWxZevEzhZHtgP8fFkfkzVuuORncmMXG9S2nBpAo1/dmNa5xYhyiKiCb/LOoQwDIhmh8POremjRz4U9IE56Coixom23oUoCJG6dXz+T9DFnwkmsR8BhbKzna7OIIuEQZSS2FmnH1Er0bTbPnz7rkuVwI0JjPmzZsnWf2FsInUz+x7lJznkHh9oeZo/sB7RFJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQem0Ppy+ft/7jw9xvbnF7IKuWCTWk1yIYq6EcmdBYU=;
 b=Iazfo0/v06VUyeJalA/dH+OQLoQGRcq74LgDT8RM2rCKMaIcv1nXfKX+2QDOM0HTG1OCn+BaK1ojf7z5ASXbu7hOvQAjHpYq9lI5JVnPU0wVmi40P5JsIVBkHsdqusaPAB5ZT/c+wE0mML9fVD+2WO4XfexWj9l1oQ/w6kuoJC8CVi4MjtyYRjvN805XbnnPnfoC1FFKIV6vN1RighY8oc2LQolRSxMBbf0pmUV1a/GnuNFav6cw+wuz+O9NLFhB8DulfMk+QFpljy9zBIXbcgp6kF/43Uio5iLSCs7+pJaZGFi3mouHYt3qYK65yFahoRoHl9LErSop2EnJUhkrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7692.namprd11.prod.outlook.com (2603:10b6:8:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Thu, 14 Sep
 2023 17:40:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 17:40:43 +0000
Date: Thu, 14 Sep 2023 17:39:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZQNFWtaZ3m/gKvVW@DUT025-TGLU.fm.intel.com>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-2-matthew.brost@intel.com>
 <ZQIqzAEKoSPTuDeU@nvishwa1-DESK>
 <ZQIynNeRQLB5ZyBc@DUT025-TGLU.fm.intel.com>
 <ZQI5dVsxMgMaNSD2@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQI5dVsxMgMaNSD2@nvishwa1-DESK>
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: c22808be-48a5-4a80-ef1a-08dbb549b81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1IKJB5rwXUTG2SkC5htgcnrdOmYlGOzZW+bVTbG0R2ynyt5BuD7yrtzOuN7p2W1xKW8T5FDz+zQ3fn/4n11UQQMzgoP5rdD40QlD7XTgjhQhHWjb6HAVQ3wp7DEPx90OzneATRvzYJP4WOXYr+u0YeN7UPCIArUjpF5Mw+ypTP0/ztPkC/1WefPX4DKXTeRJgcmB3JuIqh0+VFc51vP2YfFbQKrYter7b86U9b2FfqnFb+WdL6hapvJCjXMyq6UzHNARLVqDkIvdejfK1QtPZELM38EjEFJwiDAx74zEsQVYekRP6ODgn8hqvVP0zAO9pkWQZzgXcD7UDlVyBGU6KwDyvyn4ka+JT7T/4biWC60XOC9IHRqzGjxLC8L1vjjGDUhMjx9+jR6CifHoXFXP/xV3LtqUt5Zcu5G4xkpqCyPdamShlRxDPMeWzUxlbKDvby+GshQCOx7xnDqPH26ZYGLMYZ42UwKDqepzk/NhoPfmOrGYGedcw66SyBfhJFG/6J3pDSHZ3zDUbUmnukpgT0ABAoGEwnCC6VJ8UG1b65n/kIRP5/Bl20ZFx/L+ERNS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(186009)(1800799009)(451199024)(2906002)(6666004)(6512007)(66476007)(66556008)(6486002)(6506007)(66946007)(478600001)(38100700002)(86362001)(82960400001)(83380400001)(26005)(5660300002)(41300700001)(4326008)(6862004)(44832011)(316002)(8936002)(6636002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fvi1UQAlsbaXlhxVuicDP+z5eK3FyHNANIbDbqbvDxXtUTM4ddOXpNbA6QR5?=
 =?us-ascii?Q?Bg9CKf3tjZDst9OKi8mmmpD3pnGWM9FmXjB/2Zx4fX/DsOCH7dgGn3t9okh8?=
 =?us-ascii?Q?aclbBCk+m7XXcIq+sEhiwUoVkkeMGs0yXFf63rygZ/GfSmOEqwr7/7tnr9xO?=
 =?us-ascii?Q?ZhHQKAhgMPl0qBl2b/6RiQzS90TNCYZ3INgWOlKboF7mFLX9XODR67sw6Ba2?=
 =?us-ascii?Q?aKnPMtSze65PHFIGzdQAxV+oZISG3S/eAi9Ns1Sj/NiSuuYFejdSfJeuXUnH?=
 =?us-ascii?Q?sBk0aq2rS5yq1CWBV6P2LFojBMRlsYqG7c9pE17+ps3p5OkwOMIH2xkZSuG0?=
 =?us-ascii?Q?fm1z5sbBBu18BfwJpAL93KdRBInKY3ltwwF92cr3Cu7eF0DIX1DjV/SeyW9v?=
 =?us-ascii?Q?qyHv3NfvcX6S9bPrWuWfW/spmAp/LeG9UUfKlv8l4/ObS9BehC8tY1QxiHdA?=
 =?us-ascii?Q?2oUdL4z2S54VW2ZDxBeicbNuje1QHx0ryJnV+85fOq2PkM6Ed849iE+cpMlA?=
 =?us-ascii?Q?TgmQ+iNAVRpriNWvnezXyBjGeYw20ohyYt+XuawblLODf140p+9qSQs8pmuQ?=
 =?us-ascii?Q?rWVNcH54hpkmNgqXiic0hFYuCY1nK7/37A5vJQHbC86DbyAQvf1fgQF5Almt?=
 =?us-ascii?Q?W7X3ck7IdArrxUF9CX8ZKAnVCUOA73BBVJL49wAjP6DuyaHs02scWLR0UmRQ?=
 =?us-ascii?Q?Z5vnqpT97wr1Un1VpD/KSRpLbSGrmNF44k7OKdJoqqdo3obizwTZbkE/RBkh?=
 =?us-ascii?Q?fwuP5rB4vnV/zvLrd11Q0p4A/CYJymuTfcQ0Rbdt9vHcWlIS4Rz9y5XGgwpf?=
 =?us-ascii?Q?bd2j5p5+s9HIa2gKUWckc9qers0S4qXOSEnP89xb2kYPKFuhseQVjS+ee1OT?=
 =?us-ascii?Q?79CFM+cHgvhTKJ+XBDQGswLWZAQ3u7jKsppLv1ljQZyuj5qwo4NqYdpC7b17?=
 =?us-ascii?Q?IU2nrk2l+298g7glHN0cZwB7vx9fte0DjYyIsc3dcHcFjELGQG5k8n9ra9sx?=
 =?us-ascii?Q?zUj2bPXfM3kdw5j9T+pPgNJ+HtXzwaE4f2G7kAib3thklYOkjDyXQOLjmKBb?=
 =?us-ascii?Q?CxkHgv5FWfpRtyUmd8Fl85K+/0ln/3dOljNJI93cwPQz1Q9SkyHARm9ZOkeF?=
 =?us-ascii?Q?PxsXHF1jCUcgaZG0hUfujrRtpZdy7vwgArcmA6pswSPpbxYWx2O2iHUPJc95?=
 =?us-ascii?Q?MrxC9NME85Y671sjkaoMKFWJu7F4sQDj2aE2GO29qnSRf3uHrDHCZq/rfK1l?=
 =?us-ascii?Q?CQkzIVeqfW4rdzXDRteFlFdDx6Zb3UKiKCDLk4U/lK6DvEd9EteR6c1x3j9i?=
 =?us-ascii?Q?chSXbDUEM9vXrs+5kJ6ohcGptI59wM/SiMMqoDDDUDAvK9KvovtOVk5bx+ZH?=
 =?us-ascii?Q?QFuLx1NbHrU2kaxvapnGujTUUS6uBFOq5XuVAVgmYe/Cpa6z5im3p81blCKr?=
 =?us-ascii?Q?fBt/Q3n7YogmFe7y0BCUvQ7dOszKV1GVh8TaSMMMSOjk8ipthOMp8JaaV/u8?=
 =?us-ascii?Q?U5XhuhUNloc/7gapI5IhJiOFo0zziW1V/wbT2lmXL11RNJ/ta2VwnogPRdsT?=
 =?us-ascii?Q?ALcJzKLzKkIfTwfHxTYlyVRK/lv8qnOF5Ht96PkNoKsaRh1Pr4//PfhSqD/v?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c22808be-48a5-4a80-ef1a-08dbb549b81e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 17:40:43.0674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPOJb86OFvm+nYuQLnMv1QrUrAELM+bXwTFbTenUsQJGkgCYE2gilmzeFIp689K5ZsaZ0+ktY5fBEwYBlewp+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7692
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Deprecate
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

On Wed, Sep 13, 2023 at 03:36:37PM -0700, Niranjana Vishwanathapura wrote:
> On Wed, Sep 13, 2023 at 10:07:24PM +0000, Matthew Brost wrote:
> > On Wed, Sep 13, 2023 at 02:34:04PM -0700, Niranjana Vishwanathapura wrote:
> > > On Tue, Sep 12, 2023 at 04:51:58PM -0700, Matthew Brost wrote:
> > > > We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
> > > > uAPI, deprecate the implementation first by making
> > > > XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP.
> > > >
> > > 
> > > So, only make it creation time parameter, right?
> > > May be mention that in the commit text here?
> > > 
> > 
> > What? This was a creation time parameter that had to had match the VM
> > setting, now it is a NOP.
> 
> I meant setting it based on what mode VM is in.
> Basically, I think the commit text should mention why this change
> is being done.
> 

Will update the text.

> > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
> > > > drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
> > > > 2 files changed, 16 insertions(+), 47 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 6725157d8c1d..ac392bcf7bc8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> > > > static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
> > > > 				       u64 value, bool create)
> > > > {
> > > > -	if (XE_IOCTL_DBG(xe, !create))
> > > > -		return -EINVAL;
> > > > -
> > > > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
> > > > -		return -EINVAL;
> > > > -
> > > > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> > > > -		return -EINVAL;
> > > > -
> > > > -	if (value) {
> > > > -		struct xe_vm *vm = q->vm;
> > > > -		int err;
> > > > -
> > > > -		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
> > > > -			return -EOPNOTSUPP;
> > > > -
> > > > -		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
> > > > -			return -EOPNOTSUPP;
> > > > -
> > > > -		if (XE_IOCTL_DBG(xe, q->width != 1))
> > > > -			return -EINVAL;
> > > > -
> > > > -		q->compute.context = dma_fence_context_alloc(1);
> > > > -		spin_lock_init(&q->compute.lock);
> > > > -
> > > > -		err = xe_vm_add_compute_exec_queue(vm, q);
> > > > -		if (XE_IOCTL_DBG(xe, err))
> > > > -			return err;
> > > > -
> > > > -		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
> > > > -		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
> > > > -	}
> > > > -
> > > > 	return 0;
> > > > }
> > > >
> > > > @@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
> > > > 	if (XE_IOCTL_DBG(xe, !create))
> > > > 		return -EINVAL;
> > > >
> > > > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
> > > > +	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
> > > > 		return -EINVAL;
> > > >
> > > > 	if (value)
> > > > @@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > > 		xe_vm_put(vm);
> > > > 		if (IS_ERR(q))
> > > > 			return PTR_ERR(q);
> > > > +
> > > > +		if (xe_vm_in_compute_mode(vm)) {
> > > > +			q->compute.context = dma_fence_context_alloc(1);
> > > > +			spin_lock_init(&q->compute.lock);
> > > > +
> > > > +			err = xe_vm_add_compute_exec_queue(vm, q);
> > > > +			if (XE_IOCTL_DBG(xe, err))
> > > > +				goto put_exec_queue;
> > > 
> > > Don't we need the below checks here?
> > > 
> > > if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
> > >        return -EOPNOTSUPP;
> > > 
> > 
> > No. If xe_vm_in_compute_mode is true, xe_vm_in_fault_mode must be false.
> > 
> 
> Yah, makes sense.
> 
> > > if (XE_IOCTL_DBG(xe, q->width != 1))
> > >        return -EINVAL;
> > > 
> > 
> > This check was stale, parallel engines should in compute mode now.
> > 
> 
> Looks like we have an IGT gap then.
> Should we keep it until we fill validation gap?
> 

Let me write a test for this, shouldn't take long.

> > > > +		}
> > > > 	}
> > > >
> > > > 	if (args->extensions) {
> > > > 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
> > > > 		if (XE_IOCTL_DBG(xe, err))
> > > > -			goto put_exec_queue;
> > > > -	}
> > > > -
> > > > -	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
> > > > -			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
> > > > -		err = -EOPNOTSUPP;
> > > > -		goto put_exec_queue;
> > > > +			goto kill_exec_queue;
> > > > 	}
> > > >
> > > > 	q->persistent.xef = xef;
> > > > @@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > > 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> > > > 	mutex_unlock(&xef->exec_queue.lock);
> > > > 	if (err)
> > > > -		goto put_exec_queue;
> > > > +		goto kill_exec_queue;
> > > >
> > > > 	args->exec_queue_id = id;
> > > >
> > > > 	return 0;
> > > >
> > > > -put_exec_queue:
> > > > +kill_exec_queue:
> > > > 	xe_exec_queue_kill(q);
> > > > +put_exec_queue:
> > > > 	xe_exec_queue_put(q);
> > > 
> > > Not directly related to this patch, but now that I am looking at it, probably
> > > the function exec_queue_kill_compute() should be renamed to
> > > xe_vm_remove_compute_exec_queue() and move it to xe_vm.c?
> > > 
> > 
> > Yea exec_queue_kill_compute should be cleaned up. Can do in a follow up.
> > 
> 
> Ok.
> 
> Niranjana
> 

Might as well include this in the next of this series so I don't forget.

Matt

> > Matt
> > 
> > > Niranjana
> > > 
> > > > 	return err;
> > > > }
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index 347d28442701..f73b9e80b25a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -60,12 +60,10 @@ struct xe_exec_queue {
> > > > #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> > > > /* queue keeps running pending jobs after destroy ioctl */
> > > > #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
> > > > -/* queue for use with compute VMs */
> > > > -#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
> > > > /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> > > > -#define EXEC_QUEUE_FLAG_VM			BIT(5)
> > > > +#define EXEC_QUEUE_FLAG_VM			BIT(4)
> > > > /* child of VM queue for multi-tile VM jobs */
> > > > -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
> > > > +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> > > >
> > > > 	/**
> > > > 	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > > --
> > > > 2.34.1
> > > >
