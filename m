Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E253DEE020F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E56610E114;
	Wed, 13 Sep 2023 22:08:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3943210E114
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694642911; x=1726178911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=drJt/Sv/oY0eZn//Z1fAWQuWDlSyo9ONQ3duZ2gwoNY=;
 b=cqSaP1D0iOIkKr66W9ewwsDWQ62/WPfbl8WQyEFIKhsj0j81ygqnm2Bz
 pR2CFLTZZ7KMHoaUEgac3V5jov7Of4zIWMllg9eeOCATCS3C/XufaYoBx
 CDWgnMoP1Zbei8XfdoxBO5Lsd+egevPuOawKbKtoQM9XkbarnOSTKJ7Vk
 aoDjF8ZYakHJli/+2QqA6HXOGwa9QJS6pOyFYQhrOhmJDw1aVxT05CqzG
 8pF85WRMOJZ0hOsclFJL/MBzB9CeXfIKzbw5cLxiwVNiOi/vDzh8ePm1u
 OPrDfT0y/d3ckq7RZrOWubGN6UP5RV6EZhZ3hbTnFFWkeQgGAzCnhjZJc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="358227529"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="358227529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773642870"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773642870"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 15:08:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:08:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 15:08:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 15:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7F1kmEW2GNc7qXKp+WMJdvKI+fu8Di8DCRk618S5iZHUja+dD+iehe0sreK4bykZLm5Dm2See3hPDH9NI8QX4Vwmt1Kwx2uCmABGe67/16jFyFF7iomTgxwzRWxFHisu8ijOU5FA+HoLx880JvriLGAq+TfC3PQZH2J4UXxAFr4xaSvA2Y0QyKvcv/rQDg+Tf3ZjuAGWuXVX61EsaTgtSH/L5Anlri8MGneHeKmVQIl4KV0rQbA4HYA2pDnPDptz5OFpspFrOIVGFjMSAMvqMJIziFsSeOZtyqHoJWXtNfJrSAKJsEZ7noQv27cMM2/h2EY1jcLi0LC5WXXNXI2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlugB1KYNIZOTkDEPjYa/xsyQZtaaEh+PZRlkm4EH4U=;
 b=Oo2YvveMIQK99O7lZWs2tvCZ1kkw4PPTOMTa8JhA25aDj7Z5k+FFlnQQGqnJ0trMnhSuHonLY1d6jJuX0adIg3ncIGgfOXuooIDEtJfxVX6C14aDbJkDqNX2vvT2pd9t9yagebTfST4mIwGBD515ISeb0D/wJ98U89iyrHduJBe2ptIsnC30AIxx95k1SV3YYSy/Da8kdq+sF2sJ3hTBRgmd2xyxzEc3dPNB+WxAa1UfnRl5TRITNWczvsh+33P8A+luB3+86pPeFZS2QgK6Ytziuo8jA1tKatcitnReO42t3sd9ScvBILnj5RUiUuxmIYFPYJypjKGcQNvu0OQEuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.32; Wed, 13 Sep
 2023 22:08:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Wed, 13 Sep 2023
 22:08:26 +0000
Date: Wed, 13 Sep 2023 22:07:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZQIynNeRQLB5ZyBc@DUT025-TGLU.fm.intel.com>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-2-matthew.brost@intel.com>
 <ZQIqzAEKoSPTuDeU@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQIqzAEKoSPTuDeU@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a758dda-7cbb-41e9-995d-08dbb4a5f467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3Zmad5KDiWVb+maIezAtSBqqdreEYSsjjJwpfG6WQOT9jJfmBwbZGoveA7ljcZL3obKNTNsCRlyb7mNZimZ+8qmDBALeRHhawdTZJSOnHGKmnrxDLW5dV9jDdHxFS2W8y7dFtr0DZaU7/v/0aRc9OPrTBJ8EE7kSKqGD0dqagxT6EI5BT+8R3bgcBQQtl+GSm0ga2/4xPdjZyOs3aXjFeUG1vfHQ5njmaNoK7+S8TAG2KmQFMRCJcUTW+nn/UJvgy8pWu2FBGieTiwb+mg+pLLatOH3FmOUmggZt//ihMgvJoCYQrpByjSFrtMULnd5ymH+30cQ9hRQ+Q0rHT+FKVJqd1gHLBwHoyioGx3mncGBGi7Hh/wrLrXsipm95MS68jk+Mu+imu+d8zBXWlJZao5NYBDBC7Pkm2pAILwuplXAwR06PGTSyuzkClsLMV07+8DPrYlSJiL7am2tZKcsQOWGoi9NngmO7GijumlQj/qy6/QIyuKG0zs8thNC37XK9LEBnwGeT5aoosIhcsH5j/Pw8/OgT4NBIEJP+LErlYWvbsBYZZcUqTIka9clzCzT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(39860400002)(366004)(186009)(1800799009)(451199024)(6486002)(6506007)(6512007)(83380400001)(82960400001)(86362001)(38100700002)(26005)(66476007)(44832011)(66556008)(6636002)(316002)(66946007)(41300700001)(2906002)(4326008)(8936002)(8676002)(6862004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/v1zH3wKnFZ/DElRcWekwxo8ZyHYWvcKXCQEvG5wElu7kD8UpYWmC1eV18yS?=
 =?us-ascii?Q?XmMQnzaud1vjeSaRWNNJi34L7ufyAlROxuYZcEJ2pHEiXInwfujBYHat3vk6?=
 =?us-ascii?Q?Fl97HmKwUsSUud96cXU4mS09VLojLltqbEsYtIMexwKhn4+FxAdEvS8GLOdt?=
 =?us-ascii?Q?vFYe3ii6AtaC+SZ6fMoqh5neEM56dwG/F+kgHY/jsKimGUxnmO0c708PvoMT?=
 =?us-ascii?Q?nmt+qrAFOMt4jCxOsQhEKRLHQl4xv9ZOJBvEHVxTahpebqS5CFuLlC9RUD69?=
 =?us-ascii?Q?2BK9jomPGh6HwzjY3SLNVML81AWVmpwUTya2J2/ktsMUx75IMsS+f2tSrAwz?=
 =?us-ascii?Q?qLtjJH3ir5m9YaaDPOL067gA3pDlzXddbVzKxmjLHLis5ePWSMRWT0GKq/0R?=
 =?us-ascii?Q?wIyC0CsLgVItGFCt/60v+ZRXlJPSEkGDhl/OMWmbU7Z6zDzvm+o7qzDrsypE?=
 =?us-ascii?Q?AOMRpS7tOBKVWKm/SvUum0sgz6I+mmK7UcmWhiYAE6bSJ8FYVAYq5d4IPpEv?=
 =?us-ascii?Q?YM7mkF0mGuBwc4BSbKH03WI9BvrLf1VB3kpbWVKtQX73qvv7cj30bvitmqOw?=
 =?us-ascii?Q?wGdccCacOZ7vdVl1CgyDno7bzW+fHJM836vz1E1och5bB/eeHuA+q/uGGnBp?=
 =?us-ascii?Q?iyyQDl152tiLSLBJm6yzgAMpAFibiu/vwXAbFEwnGVgquBT7libkCfTuvVq+?=
 =?us-ascii?Q?3D3Px2RogUMtgCBnR7tika4sCa39UOaGD+DpNalnOrJ1WxG5L/ffdNOsFzSP?=
 =?us-ascii?Q?aWHKY8aiM8gwUrmpw3gbS8Z3F0i9f0qZd9FMM6g1awNygDlpcpeeHVa7OftQ?=
 =?us-ascii?Q?+jNLxG4mdbARMQ9KtW/O0re6S+pbHpfRVU+tMBSt5OSLuXyy+jSZqLiH1F7B?=
 =?us-ascii?Q?s2kfyeDM9FJqI0WyUsQJxd+K3pKE0DqIPm4iek3frRc66Kf8nsYsNByMerex?=
 =?us-ascii?Q?52zn4QbJMpxyABlTom2R4ofksPWQFMEYRvEAG2TkG5xTVLAQEv3iw1tp9o4G?=
 =?us-ascii?Q?c0FB3NRlepnTXZjpWLoe8obAwmkfDpyzdT3sOIsDvQK8UoJ2asd0yb2DulIx?=
 =?us-ascii?Q?7MdIvK4dnoHRQCpBFJQbTKgmk8d2mGB/IY70AuEW4kFRjvSa1zVtE1tfb+oD?=
 =?us-ascii?Q?oIsf2thjcgKDoRmroldf5/zALaVYdfoDJwnZ5lJYUk2XN4zxf0+J9OEhgJkp?=
 =?us-ascii?Q?Vt1Z2NG/xNut77Y5xOnnx32iEqZqnpYQhyLxBvGpeDoeL6PKveDhE6ql1gK4?=
 =?us-ascii?Q?YL2uf5bSQfUbDGi38VDj2ER27QjYPEFAjWnBg61nqf9kOle5qmL7om/18H7S?=
 =?us-ascii?Q?1piJ9ws2YCJcltft2kIxXSocF1zdpO6rMTVmq6dxI2iUGVK8CB0SmGd5uVYN?=
 =?us-ascii?Q?3U27UrvvE6qfEF/fk+ThS6H5byU9MMnX+iLQH7gi7db4mkQ6kqoPuGLYm03+?=
 =?us-ascii?Q?v4pPKGNrIcpa7cK7mtJAEqXYMD7kyvY/PhnmxQ8G+SYIg7mC7j2C/QzjuUMe?=
 =?us-ascii?Q?WrZI12gMCLYc2mX2k2XPfD7yL1Skh8VYrO2Hnz+4lTQ4amOwzLRAufib0C3u?=
 =?us-ascii?Q?FsXotNugOLqSoyErHtFgoBXEQa7TeurSd8sdPjDZMEzH4n3F4zCAQ7d/ucgh?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a758dda-7cbb-41e9-995d-08dbb4a5f467
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:08:26.8078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQgt/F68QziGWJXRgn57Un0DIPfhfbveOJ5TEgC34LZc9ZjR5lCrhGU49XjP4z6RiXMn9rXmMlQpgi+E4iQtpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

On Wed, Sep 13, 2023 at 02:34:04PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Sep 12, 2023 at 04:51:58PM -0700, Matthew Brost wrote:
> > We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
> > uAPI, deprecate the implementation first by making
> > XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP.
> > 
> 
> So, only make it creation time parameter, right?
> May be mention that in the commit text here?
> 

What? This was a creation time parameter that had to had match the VM
setting, now it is a NOP. 

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
> > drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
> > 2 files changed, 16 insertions(+), 47 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 6725157d8c1d..ac392bcf7bc8 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> > static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
> > 				       u64 value, bool create)
> > {
> > -	if (XE_IOCTL_DBG(xe, !create))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> > -		return -EINVAL;
> > -
> > -	if (value) {
> > -		struct xe_vm *vm = q->vm;
> > -		int err;
> > -
> > -		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
> > -			return -EOPNOTSUPP;
> > -
> > -		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
> > -			return -EOPNOTSUPP;
> > -
> > -		if (XE_IOCTL_DBG(xe, q->width != 1))
> > -			return -EINVAL;
> > -
> > -		q->compute.context = dma_fence_context_alloc(1);
> > -		spin_lock_init(&q->compute.lock);
> > -
> > -		err = xe_vm_add_compute_exec_queue(vm, q);
> > -		if (XE_IOCTL_DBG(xe, err))
> > -			return err;
> > -
> > -		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
> > -		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
> > -	}
> > -
> > 	return 0;
> > }
> > 
> > @@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
> > 	if (XE_IOCTL_DBG(xe, !create))
> > 		return -EINVAL;
> > 
> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
> > +	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
> > 		return -EINVAL;
> > 
> > 	if (value)
> > @@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > 		xe_vm_put(vm);
> > 		if (IS_ERR(q))
> > 			return PTR_ERR(q);
> > +
> > +		if (xe_vm_in_compute_mode(vm)) {
> > +			q->compute.context = dma_fence_context_alloc(1);
> > +			spin_lock_init(&q->compute.lock);
> > +
> > +			err = xe_vm_add_compute_exec_queue(vm, q);
> > +			if (XE_IOCTL_DBG(xe, err))
> > +				goto put_exec_queue;
> 
> Don't we need the below checks here?
> 
> if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>        return -EOPNOTSUPP;
> 

No. If xe_vm_in_compute_mode is true, xe_vm_in_fault_mode must be false.

> if (XE_IOCTL_DBG(xe, q->width != 1))
>        return -EINVAL;
>

This check was stale, parallel engines should in compute mode now. 

> > +		}
> > 	}
> > 
> > 	if (args->extensions) {
> > 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
> > 		if (XE_IOCTL_DBG(xe, err))
> > -			goto put_exec_queue;
> > -	}
> > -
> > -	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
> > -			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
> > -		err = -EOPNOTSUPP;
> > -		goto put_exec_queue;
> > +			goto kill_exec_queue;
> > 	}
> > 
> > 	q->persistent.xef = xef;
> > @@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> > 	mutex_unlock(&xef->exec_queue.lock);
> > 	if (err)
> > -		goto put_exec_queue;
> > +		goto kill_exec_queue;
> > 
> > 	args->exec_queue_id = id;
> > 
> > 	return 0;
> > 
> > -put_exec_queue:
> > +kill_exec_queue:
> > 	xe_exec_queue_kill(q);
> > +put_exec_queue:
> > 	xe_exec_queue_put(q);
> 
> Not directly related to this patch, but now that I am looking at it, probably
> the function exec_queue_kill_compute() should be renamed to
> xe_vm_remove_compute_exec_queue() and move it to xe_vm.c?
> 

Yea exec_queue_kill_compute should be cleaned up. Can do in a follow up.

Matt

> Niranjana
> 
> > 	return err;
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 347d28442701..f73b9e80b25a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -60,12 +60,10 @@ struct xe_exec_queue {
> > #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> > /* queue keeps running pending jobs after destroy ioctl */
> > #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
> > -/* queue for use with compute VMs */
> > -#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
> > /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> > -#define EXEC_QUEUE_FLAG_VM			BIT(5)
> > +#define EXEC_QUEUE_FLAG_VM			BIT(4)
> > /* child of VM queue for multi-tile VM jobs */
> > -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
> > +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> > 
> > 	/**
> > 	 * @flags: flags for this exec queue, should statically setup aside from ban
> > -- 
> > 2.34.1
> > 
