Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05E8C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 14:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F9510E6EB;
	Thu, 13 Jul 2023 14:31:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A184610E6EB
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 14:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689258673; x=1720794673;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tQyZTFBxJcfrSk0BC+xo0tor51Mdq7sHsfahn4Rsm9w=;
 b=GCc5RdzBys6vrcLuGL56UoWOqXV3yxBBAq1kJo0fV6TGF/cD9N7s1Fd2
 XTLYlao1ByxY/XywiNQoR2YhsSQ6yKKkHIryYwrAuXjH/EYDweri62ShC
 Hj7vIL4X0RN9eyRJGGx8aQ5m6J+STvnUjWxyPafRWFjHprXYrBlpSkJ8d
 J6OUlUxwrfCF0V0XNWpo3GoLcaBJsqMBPekdaLAtFBZWG2SRP/zYQQKRH
 z9I8mLUILFCXmss0N+S5xKqTNmL1e3/CHVGohGIQF4LkkTH6wV1TONS63
 LIpgDLihtG1YiFJmJne3wRZ2rxHH6JfFlrWBGaeKPjx0JY+Bo9sstpx0v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="428965885"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="428965885"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 07:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="846086407"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="846086407"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 13 Jul 2023 07:17:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 07:17:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 07:17:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 07:17:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 07:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLvelcrnv4tP2RMD4nkucwgR/1AFEYj1y5QdhPvfIrZ7Ka50kmIyodW0HI25a9RQHqNuIQKplJFLwnDEct4KRD5GMozpc+9zVoAysNHaTg/jhR41PaOh1tRHaA1aQGEky0Q9BntH8vaY4N36cn2CVj49C6wD9HSMSfEs6nOWA9JofNMu55CVjSTw7SL/70i7gsZXxnOPfLDTQEtpsWn7Io3h1vWavY+URAdTsWyYg1wCte8tHugz3eRFHOjY3J14T08iiaXTyLtzC8ZKoFAiOg+O2fY6WdeWBRMk81+b7wLOAtEmY/ujh0yybtUGw7JfStStoj9mA5UAEP+iCNBZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5Ls/dOknpHySBDHOev4rFf8mw0p93wcjAdMiZO0B4o=;
 b=f94Vk7Ast6FEqHOgVxZ3jDWYezzwSRQ7E/kERrxWeUd94S5EH50XU1lui/3ret5QHQk8qb58Ah1ch9z8amRMQqeUkWgiu3ThhSjoqvX+iST9M5HE9GuUiQ/Ws6eNKLYGGb8vqUMYXqgwbtCS865JLaMr3lxADKj1bk/OMZCJK694IAltO0wxBvyuJwCT7OJbJ1wp5dwNwMJdXmMHL94MQOC5tHS9riR2YdUUrg/Rpjz9atc1hR2qk/t0MdVDG1g5RqUnoShfaaUNqvapxL8nai+Gx6ul0C7toIqc8neJDsTVn7j6gxbp01sQ9iuPbGnBOQH26F1lAT5PVaUFN+NcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 14:17:13 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6588.025; Thu, 13 Jul 2023
 14:17:13 +0000
Date: Thu, 13 Jul 2023 16:17:05 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLAHYQC-5y2p2vC2@fdugast-desk.home>
References: <20230713131711.7-1-francois.dugast@intel.com>
 <20230713131711.7-3-francois.dugast@intel.com>
 <ZLADblgo7aS6fTNi@DUT025-TGLU>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLADblgo7aS6fTNi@DUT025-TGLU>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH0PR11MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ddee61-e612-4c23-276c-08db83abda4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGKbWTMHnOQZem2FkyYQi9GRFTOQIFbygARqN4XKMVFwRhZXi3+oWvLM2YjL2FZ6Jv5Zcujeh0ebt4xnSF4Pos4Tpk9j7bCSmuDiZSpH9tznkdkAkHhteUGkgCS71beRfy7nUjGe7FlepQhDUvZ0fKHPZHMvZ1F69LkGsz/guzVJqhXsPxtManal+l7tJlldH4C2wEOYb8NSZnDINzXtXBAW2h5BXDmjOy8o7a8AvxpR8CzFFM1asIgYig1TV71nP9+DCM4hBY1BluG2en2vijMkp9N1ejdkmHvSK0bt5KOf8m9NFoD9HvrXJeMGnVZguzCS9JZ5ZtGoWAqaQxnourZgXOrlP+/5VvC2tGQKsESqge9QUf+KjhHRXpX6k47C3+qEC0gtCf+P887sywNvLj1ZH2n2VhMOQoAt5Ux6a8GkZ+TZE/FSVwSXtYJPOGlK29yEPLUXZ5lwaKyckLiHmPIMppFdgfOyYvK5HKpq0Ow2p1vhGJgQ5TnesCkdniftwhNQwqI4buoCoDEudcWAUvkYP7nxkUxM0465Qh+qy9sTVj1jsFIQ3TBSzVBGuP0qvg/zrf22a0dbbL+BhfdbPpZ4ApGwK/HG3Xzd9g2RGeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(41300700001)(44832011)(66476007)(6636002)(4326008)(66946007)(66556008)(478600001)(30864003)(5660300002)(6862004)(2906002)(8676002)(8936002)(316002)(6666004)(6486002)(36916002)(966005)(6512007)(86362001)(82960400001)(26005)(9686003)(6506007)(186003)(83380400001)(66574015)(36756003)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?swoKWhOrhv6k/U5CV4vHnjsQKN2EhVfSq5ewsBH9Ms6LxJlT9FDg53oOFK?=
 =?iso-8859-1?Q?CmodsjCFA0KQLix1TgMwZpAdSLGbdWXSkA/ORYfhx0UZMOlA1cGiztuIYt?=
 =?iso-8859-1?Q?TQZ0qGuOpqyUks9P7MHCmO/kze/N1ndl9+zCa9OSlA15hj80HBZKP6p77A?=
 =?iso-8859-1?Q?7lRgIOIdse2LqLD5uSRFpHYVKcAU0Cl57xXI+K5picPfdgUwGPfu+nq3NM?=
 =?iso-8859-1?Q?ItfLXTUec4Pq/AkpD9XcErUkzwSQ1IbyTT141h8PMVXRcMFuHf1MbDADrR?=
 =?iso-8859-1?Q?cdJA74Y/FQa1PpXurlrxQpsRCU3Q8eEsfyTXKMPIxO6sFiM/AojNfLr85i?=
 =?iso-8859-1?Q?QC3lIwxOJMtkRQEWTFI0TwlLMADp254vYVJjsAjFxp6TOabqTOFclv/KmY?=
 =?iso-8859-1?Q?Jq5ICOfJ4bchCL8IpURvqbenWchg5v9Dr0TrEqrtZAOp85f/eUHfq+jYQG?=
 =?iso-8859-1?Q?e9swJ7L/rZ55ETflAT+YBxY63GyyRGB+pCWm3JEO9MtuZiaDDAkbeuz9zr?=
 =?iso-8859-1?Q?a6G+BHD6z/05KYbIAVCHqIp9ZXIrH5TT8WZ7b3f0mMkD9JyaXvE69TN5ci?=
 =?iso-8859-1?Q?nL5I7kayLX8I38eDncwoOJdWqbRX+de2HolvbxoouYUeqW1tsDDySHb7JO?=
 =?iso-8859-1?Q?X6Z1FKRAhC5amVnFKpYJ87c/qelIU8TEFxJtMT+7GBMDpo02B6dRcvaFp2?=
 =?iso-8859-1?Q?/ZdbjUmC3KM0o7BtFhq1TLtA2iXmk+s+jrVbIScZCPx18y7pN2kvlv5fIq?=
 =?iso-8859-1?Q?rKT7hvjojsmqTygwZ/HOdbSWtDjHBKTWP4yF5xfzQJFBAn0KPEitxDzllZ?=
 =?iso-8859-1?Q?Bb+owrdSQ8TVtks8w05YVVCoGNldCd0kf7R5kr8CqD07A11LKoR1v2YZNa?=
 =?iso-8859-1?Q?b31SBL1sE0PQdq+VD75ml9rzvgyiZsFPQiiJrk039nbcaTO3X8B+jgTi/W?=
 =?iso-8859-1?Q?VcmiykEqpf4ZcZI1VGa2SZr13AfwBmn4+plNFjLtExjC1U4lZQ/6YalRK7?=
 =?iso-8859-1?Q?TewC3r/vAwln7Yo9M/DHC17nzbiGsZMSlnyjddw33E3L7E07Ct0EObqMXh?=
 =?iso-8859-1?Q?etrl3NLgNu3zz3UPwcFRiq1jhNCYC2G1bNOeekxu6MJKp7mwWMalTygNbv?=
 =?iso-8859-1?Q?eJzfRr2fcGHSS8rargZ33ZMwDm0cs1ala0zE6I3QNyLzEOdj2QObmr7NeI?=
 =?iso-8859-1?Q?E4Z6hMpPDUqbkXu0c8GKmF8FoTWyBIob1gjfwtf+q+nwZfHqqteoqFu5fG?=
 =?iso-8859-1?Q?Qxs8psIfWwhHOLUymN9Ig5bXdJxZbBZSbYft2l2bq0y5Cc5kLHNVmrg5ep?=
 =?iso-8859-1?Q?GTzOo+owuRwFdrm7ppUdm3TPohnAO31P2xA45ADYkZN0NwUAtAgTEieBUy?=
 =?iso-8859-1?Q?RSS09m1+W/tIWE/7YWSXH1gKwvUAJV3JJFoT1JiR2Qeijvt/HIeeLsYcoB?=
 =?iso-8859-1?Q?b0Fbbu92mDtu7w1pbfaQS/0RGTbFemaKxHqCQJFCMbYAgFeWLaCJkmojU2?=
 =?iso-8859-1?Q?Te6tY5dfd4RlIkeb76tfB7Fy+XequzHmz7yMFhhPXlqPv3Uq0hI3jPU4AS?=
 =?iso-8859-1?Q?uJhaMqlNFALm8VdkRsGWnyX3Q6RGF0Xi2xqfPMbNe8BWbB/dzs0ysJjL5q?=
 =?iso-8859-1?Q?raDiQDaIv527SPqAsJ5psrMnf9IMYADIltcdA+y+pg8i0fCJBJsufdeQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ddee61-e612-4c23-276c-08db83abda4e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 14:17:13.1049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQlMRIf43vfvb08DppGL8DoQgggirbngHAu95fFvG+LWI5CzH0tVcCcUPummlrvgwUWlxL43jzO6ZxJzPLDng1heYuWqkScZwOlNF4tbwcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5690
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: switch to using drm_exec
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
Cc: intel-xe@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 02:00:14PM +0000, Matthew Brost wrote:
> On Thu, Jul 13, 2023 at 01:17:11PM +0000, Francois Dugast wrote:
> > Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
> > 
> > v2:
> > - Call dma-resv locking functions directly in xe_bo_lock and
> >   xe_vm_lock functions (Matthew Brost)
> > - Switch to execution context for GEM buffers v7 (Christian König)
> > - Use DRM_EXEC_INTERRUPTIBLE_WAIT
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig           |   1 +
> >  drivers/gpu/drm/xe/xe_bo.c           |  29 +++-
> >  drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
> >  drivers/gpu/drm/xe/xe_exec.c         |  30 +---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  55 +-----
> >  drivers/gpu/drm/xe/xe_vm.c           | 246 +++++++++++++--------------
> >  drivers/gpu/drm/xe/xe_vm.h           |  32 ++--
> >  7 files changed, 168 insertions(+), 226 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index d44794f99338..b739faa401d3 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -8,6 +8,7 @@ config DRM_XE
> >  	select SHMEM
> >  	select TMPFS
> >  	select DRM_BUDDY
> > +	select DRM_EXEC
> >  	select DRM_KMS_HELPER
> >  	select DRM_PANEL
> >  	select DRM_SUBALLOC_HELPER
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 6353afa8d846..aafe69ed4320 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1806,17 +1806,32 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> >  int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> >  	       int num_resv, bool intr)
> >  {
> > -	struct ttm_validate_buffer tv_bo;
> > -	LIST_HEAD(objs);
> > -	LIST_HEAD(dups);
> > +	struct dma_resv *obj;
> > +	int err;
> >  
> >  	XE_BUG_ON(!ww);
> >  
> > -	tv_bo.num_shared = num_resv;
> > -	tv_bo.bo = &bo->ttm;;
> > -	list_add_tail(&tv_bo.head, &objs);
> > +	obj = bo->ttm.base.resv;
> > +	ww_acquire_init(ww, &reservation_ww_class);
> > +
> > +	if (intr)
> > +		err = dma_resv_lock_interruptible(obj, ww);
> > +	else
> > +		err = dma_resv_lock(obj, ww);
> > +
> > +	if (unlikely(err))
> > +		return err;
> > +
> > +	num_resv = max(num_resv, 1);
> 
> Why? If the user ask to reserve 0 fences this will reserve 1.

The intention was to not deviate from the previous behavior with
ttm_eu_reserve_buffers [1]:

		num_fences = max(entry->num_shared, 1u);

But if you confirm is not needed then I will remove it so that exactly num_resv
fences are reserved.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/ttm/ttm_execbuf_util.c#L100

Francois

> 
> > +	err = dma_resv_reserve_fences(obj, num_resv);
> > +	if (err)
> > +		goto out_err;
> >  
> > -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > +	return 0;
> > +
> > +out_err:
> > +	dma_resv_unlock(obj);
> > +	return err;
> >  }
> >  
> >  void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index f6ee920303af..bc67263c6713 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -11,7 +11,6 @@
> >  #include <drm/drm_mm.h>
> >  #include <drm/ttm/ttm_bo.h>
> >  #include <drm/ttm/ttm_device.h>
> > -#include <drm/ttm/ttm_execbuf_util.h>
> >  #include <drm/ttm/ttm_placement.h>
> >  
> >  struct xe_device;
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index ba13d20ed348..32a6e16ec177 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_exec.h"
> >  
> >  #include <drm/drm_device.h>
> > +#include <drm/drm_exec.h>
> >  #include <drm/drm_file.h>
> >  #include <drm/xe_drm.h>
> >  #include <linux/delay.h>
> > @@ -95,23 +96,18 @@
> >  
> >  #define XE_EXEC_BIND_RETRY_TIMEOUT_MS 1000
> >  
> > -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> > -			 struct ttm_validate_buffer tv_onstack[],
> > -			 struct ttm_validate_buffer **tv,
> > -			 struct list_head *objs)
> > +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
> >  {
> >  	struct xe_vm *vm = e->vm;
> >  	struct xe_vma *vma;
> > -	LIST_HEAD(dups);
> >  	ktime_t end = 0;
> >  	int err = 0;
> >  
> > -	*tv = NULL;
> >  	if (xe_vm_no_dma_fences(e->vm))
> >  		return 0;
> >  
> >  retry:
> > -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
> > +	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
> >  	if (err)
> >  		return err;
> >  
> > @@ -128,8 +124,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> >  
> >  		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> >  		if (err) {
> > -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> > -			*tv = NULL;
> > +			xe_vm_unlock_dma_resv(vm, exec);
> >  			break;
> >  		}
> >  	}
> > @@ -153,14 +148,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> >  	return err;
> >  }
> >  
> > -static void xe_exec_end(struct xe_engine *e,
> > -			struct ttm_validate_buffer *tv_onstack,
> > -			struct ttm_validate_buffer *tv,
> > -			struct ww_acquire_ctx *ww,
> > -			struct list_head *objs)
> > +static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
> >  {
> >  	if (!xe_vm_no_dma_fences(e->vm))
> > -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
> > +		xe_vm_unlock_dma_resv(e->vm, exec);
> >  }
> >  
> >  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > @@ -173,14 +164,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	struct xe_engine *engine;
> >  	struct xe_sync_entry *syncs = NULL;
> >  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> > -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> > -	struct ttm_validate_buffer *tv = NULL;
> >  	u32 i, num_syncs = 0;
> >  	struct xe_sched_job *job;
> >  	struct dma_fence *rebind_fence;
> >  	struct xe_vm *vm;
> > -	struct ww_acquire_ctx ww;
> > -	struct list_head objs;
> > +	struct drm_exec exec;
> >  	bool write_locked;
> >  	int err = 0;
> >  
> > @@ -293,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  			goto err_unlock_list;
> >  	}
> >  
> > -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
> > +	err = xe_exec_begin(engine, &exec);
> >  	if (err)
> >  		goto err_unlock_list;
> >  
> > @@ -412,7 +400,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	if (err)
> >  		xe_sched_job_put(job);
> >  err_engine_end:
> > -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
> > +	xe_exec_end(engine, &exec);
> >  err_unlock_list:
> >  	if (write_locked)
> >  		up_write(&vm->lock);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 125e4744fa38..94f59c29ba9b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -8,8 +8,8 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/circ_buf.h>
> >  
> > +#include <drm/drm_exec.h>
> >  #include <drm/drm_managed.h>
> > -#include <drm/ttm/ttm_execbuf_util.h>
> >  
> >  #include "xe_bo.h"
> >  #include "xe_gt.h"
> > @@ -84,11 +84,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> >  	return true;
> >  }
> >  
> > -static bool only_needs_bo_lock(struct xe_bo *bo)
> > -{
> > -	return bo && bo->vm;
> > -}
> > -
> >  static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
> >  {
> >  	struct xe_vma *vma = NULL;
> > @@ -110,10 +105,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >  	struct xe_vm *vm;
> >  	struct xe_vma *vma = NULL;
> >  	struct xe_bo *bo;
> > -	LIST_HEAD(objs);
> > -	LIST_HEAD(dups);
> > -	struct ttm_validate_buffer tv_bo, tv_vm;
> > -	struct ww_acquire_ctx ww;
> > +	struct drm_exec exec;
> >  	struct dma_fence *fence;
> >  	bool write_locked;
> >  	int ret = 0;
> > @@ -171,20 +163,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >  
> >  	/* Lock VM and BOs dma-resv */
> >  	bo = xe_vma_bo(vma);
> > -	if (only_needs_bo_lock(bo)) {
> > -		/* This path ensures the BO's LRU is updated */
> > -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> > -	} else {
> > -		tv_vm.num_shared = xe->info.tile_count;
> > -		tv_vm.bo = xe_vm_ttm_bo(vm);
> > -		list_add(&tv_vm.head, &objs);
> > -		if (bo) {
> > -			tv_bo.bo = &bo->ttm;
> > -			tv_bo.num_shared = xe->info.tile_count;
> > -			list_add(&tv_bo.head, &objs);
> > -		}
> > -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > -	}
> > +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
> >  	if (ret)
> >  		goto unlock_vm;
> >  
> > @@ -227,10 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >  	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
> >  
> >  unlock_dma_resv:
> > -	if (only_needs_bo_lock(bo))
> > -		xe_bo_unlock(bo, &ww);
> > -	else
> > -		ttm_eu_backoff_reservation(&ww, &objs);
> > +	xe_vm_bo_unlock(vm, bo, &exec, true);
> >  unlock_vm:
> >  	if (!ret)
> >  		vm->usm.last_fault_vma = vma;
> > @@ -498,10 +474,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >  	struct xe_vm *vm;
> >  	struct xe_vma *vma;
> >  	struct xe_bo *bo;
> > -	LIST_HEAD(objs);
> > -	LIST_HEAD(dups);
> > -	struct ttm_validate_buffer tv_bo, tv_vm;
> > -	struct ww_acquire_ctx ww;
> > +	struct drm_exec exec;
> >  	int ret = 0;
> >  
> >  	/* We only support ACC_TRIGGER at the moment */
> > @@ -534,28 +507,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >  
> >  	/* Lock VM and BOs dma-resv */
> >  	bo = xe_vma_bo(vma);
> > -	if (only_needs_bo_lock(bo)) {
> > -		/* This path ensures the BO's LRU is updated */
> > -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> > -	} else {
> > -		tv_vm.num_shared = xe->info.tile_count;
> > -		tv_vm.bo = xe_vm_ttm_bo(vm);
> > -		list_add(&tv_vm.head, &objs);
> > -		tv_bo.bo = &bo->ttm;
> > -		tv_bo.num_shared = xe->info.tile_count;
> > -		list_add(&tv_bo.head, &objs);
> > -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > -	}
> > +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
> >  	if (ret)
> >  		goto unlock_vm;
> >  
> >  	/* Migrate to VRAM, move should invalidate the VMA first */
> >  	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
> >  
> > -	if (only_needs_bo_lock(bo))
> > -		xe_bo_unlock(bo, &ww);
> > -	else
> > -		ttm_eu_backoff_reservation(&ww, &objs);
> > +	xe_vm_bo_unlock(vm, bo, &exec, true);
> >  unlock_vm:
> >  	up_read(&vm->lock);
> >  	xe_vm_put(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 6c216350084b..c89b10d5feb5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -7,8 +7,8 @@
> >  
> >  #include <linux/dma-fence-array.h>
> >  
> > +#include <drm/drm_exec.h>
> >  #include <drm/drm_print.h>
> > -#include <drm/ttm/ttm_execbuf_util.h>
> >  #include <drm/ttm/ttm_tt.h>
> >  #include <drm/xe_drm.h>
> >  #include <linux/delay.h>
> > @@ -321,11 +321,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
> >  
> >  int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
> >  {
> > -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> > -	struct ttm_validate_buffer *tv;
> > -	struct ww_acquire_ctx ww;
> > -	struct list_head objs;
> >  	struct dma_fence *pfence;
> > +	struct drm_exec exec;
> >  	int err;
> >  	bool wait;
> >  
> > @@ -333,7 +330,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
> >  
> >  	down_write(&vm->lock);
> >  
> > -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
> > +	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
> >  	if (err)
> >  		goto out_unlock_outer;
> >  
> > @@ -367,7 +364,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
> >  	up_read(&vm->userptr.notifier_lock);
> >  
> >  out_unlock:
> > -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> > +	xe_vm_unlock_dma_resv(vm, &exec);
> >  out_unlock_outer:
> >  	up_write(&vm->lock);
> >  
> > @@ -397,68 +394,43 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> >   * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
> >   * objects of the vm's external buffer objects.
> >   * @vm: The vm.
> > - * @ww: Pointer to a struct ww_acquire_ctx locking context.
> > - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
> > - * ttm_validate_buffers used for locking.
> > - * @tv: Pointer to a pointer that on output contains the actual storage used.
> > - * @objs: List head for the buffer objects locked.
> > + * @exec: Pointer to a struct drm_exec execution context.
> >   * @intr: Whether to lock interruptible.
> >   * @num_shared: Number of dma-fence slots to reserve in the locked objects.
> >   *
> >   * Locks the vm dma-resv objects and all the dma-resv objects of the
> > - * buffer objects on the vm external object list. The TTM utilities require
> > - * a list of struct ttm_validate_buffers pointing to the actual buffer
> > - * objects to lock. Storage for those struct ttm_validate_buffers should
> > - * be provided in @tv_onstack, and is typically reserved on the stack
> > - * of the caller. If the size of @tv_onstack isn't sufficient, then
> > - * storage will be allocated internally using kvmalloc().
> > + * buffer objects on the vm external object list using helpers provided
> > + * by drm_exec.
> >   *
> >   * The function performs deadlock handling internally, and after a
> >   * successful return the ww locking transaction should be considered
> >   * sealed.
> >   *
> > - * Return: 0 on success, Negative error code on error. In particular if
> > - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
> > - * of error, any locking performed has been reverted.
> > + * Return: 0 on success, Negative error code on error.
> >   */
> > -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > -			struct ttm_validate_buffer *tv_onstack,
> > -			struct ttm_validate_buffer **tv,
> > -			struct list_head *objs,
> > -			bool intr,
> > -			unsigned int num_shared)
> > -{
> > -	struct ttm_validate_buffer *tv_vm, *tv_bo;
> > +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> > +			bool intr, unsigned int num_shared)
> > +{
> >  	struct xe_vma *vma, *next;
> > -	LIST_HEAD(dups);
> > +	struct drm_gem_object *obj;
> >  	int err;
> >  
> >  	lockdep_assert_held(&vm->lock);
> >  
> > -	if (vm->extobj.entries < XE_ONSTACK_TV) {
> > -		tv_vm = tv_onstack;
> > -	} else {
> > -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
> > -				       GFP_KERNEL);
> > -		if (!tv_vm)
> > -			return -ENOMEM;
> > +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
> > +	drm_exec_until_all_locked(exec) {
> > +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm), num_shared);
> > +		drm_exec_retry_on_contention(exec);
> > +		if (unlikely(err) && err != -EALREADY)
> > +			goto out_err;
> > +		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> > +			obj = &xe_vma_bo(vma)->ttm.base;
> > +			err = drm_exec_prepare_obj(exec, obj, num_shared);
> > +			drm_exec_retry_on_contention(exec);
> > +			if (unlikely(err) && err != -EALREADY)
> > +				goto out_err;
> > +		}
> >  	}
> > -	tv_bo = tv_vm + 1;
> > -
> > -	INIT_LIST_HEAD(objs);
> > -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> > -		tv_bo->num_shared = num_shared;
> > -		tv_bo->bo = &xe_vma_bo(vma)->ttm;
> > -
> > -		list_add_tail(&tv_bo->head, objs);
> > -		tv_bo++;
> > -	}
> > -	tv_vm->num_shared = num_shared;
> > -	tv_vm->bo = xe_vm_ttm_bo(vm);
> > -	list_add_tail(&tv_vm->head, objs);
> > -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
> > -	if (err)
> > -		goto out_err;
> >  
> >  	spin_lock(&vm->notifier.list_lock);
> >  	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> > @@ -470,14 +442,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >  			list_move_tail(&vma->rebind_link, &vm->rebind_list);
> >  	}
> >  	spin_unlock(&vm->notifier.list_lock);
> > -
> > -	*tv = tv_vm;
> >  	return 0;
> >  
> >  out_err:
> > -	if (tv_vm != tv_onstack)
> > -		kvfree(tv_vm);
> > -
> > +	drm_exec_fini(exec);
> >  	return err;
> >  }
> >  
> > @@ -485,20 +453,16 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >   * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
> >   * xe_vm_lock_dma_resv()
> >   * @vm: The vm.
> > - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
> > - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
> > - * @ww: The ww_acquire_context used for locking.
> > - * @objs: The list returned from xe_vm_lock_dma_resv().
> > + * @exec: The @drm_exec given to xe_vm_lock_dma_resv().
> >   *
> >   * Unlocks the reservation objects and frees any memory allocated by
> >   * xe_vm_lock_dma_resv().
> >   */
> > -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> > -			   struct ttm_validate_buffer *tv_onstack,
> > -			   struct ttm_validate_buffer *tv,
> > -			   struct ww_acquire_ctx *ww,
> > -			   struct list_head *objs)
> > +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
> >  {
> > +	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
> > +	unsigned long index;
> > +
> >  	/*
> >  	 * Nothing should've been able to enter the list while we were locked,
> >  	 * since we've held the dma-resvs of all the vm's external objects,
> > @@ -507,9 +471,13 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> >  	 */
> >  	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
> >  
> > -	ttm_eu_backoff_reservation(ww, objs);
> > -	if (tv && tv != tv_onstack)
> > -		kvfree(tv);
> > +	drm_exec_for_each_locked_object(exec, index, obj) {
> > +		struct xe_bo *bo = gem_to_xe_bo(obj);
> > +
> > +		if (obj != skip)
> > +			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > +	}
> > +	drm_exec_fini(exec);
> >  }
> >  
> >  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > @@ -536,10 +504,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  {
> >  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> >  	struct xe_vma *vma;
> > -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> > -	struct ttm_validate_buffer *tv;
> > -	struct ww_acquire_ctx ww;
> > -	struct list_head objs;
> > +	struct drm_exec exec;
> >  	struct dma_fence *rebind_fence;
> >  	unsigned int fence_count = 0;
> >  	LIST_HEAD(preempt_fences);
> > @@ -582,8 +547,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  			goto out_unlock_outer;
> >  	}
> >  
> > -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> > -				  false, vm->preempt.num_engines);
> > +	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
> >  	if (err)
> >  		goto out_unlock_outer;
> >  
> > @@ -662,7 +626,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  	up_read(&vm->userptr.notifier_lock);
> >  
> >  out_unlock:
> > -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> > +	xe_vm_unlock_dma_resv(vm, &exec);
> >  out_unlock_outer:
> >  	if (err == -EAGAIN) {
> >  		trace_xe_vm_rebind_worker_retry(vm);
> > @@ -1105,27 +1069,17 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >  
> >  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
> >  {
> > -	struct ttm_validate_buffer tv[2];
> > -	struct ww_acquire_ctx ww;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >  	struct xe_bo *bo = xe_vma_bo(vma);
> > -	LIST_HEAD(objs);
> > -	LIST_HEAD(dups);
> > +	struct drm_exec exec;
> >  	int err;
> >  
> > -	memset(tv, 0, sizeof(tv));
> > -	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
> > -	list_add(&tv[0].head, &objs);
> > -
> > -	if (bo) {
> > -		tv[1].bo = &xe_bo_get(bo)->ttm;
> > -		list_add(&tv[1].head, &objs);
> > -	}
> > -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > +	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
> >  	XE_WARN_ON(err);
> >  
> >  	xe_vma_destroy(vma, NULL);
> >  
> > -	ttm_eu_backoff_reservation(&ww, &objs);
> > +	xe_vm_bo_unlock(vm, bo, &exec, false);
> >  	if (bo)
> >  		xe_bo_put(bo);
> >  }
> > @@ -2125,21 +2079,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> >  
> >  #define VM_BIND_OP(op)	(op & 0xffff)
> >  
> > -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
> > -{
> > -	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> > -		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> > -
> > -	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> > -	return &vm->pt_root[idx]->bo->ttm;
> > -}
> > -
> > -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
> > -{
> > -	tv->num_shared = 1;
> > -	tv->bo = xe_vm_ttm_bo(vm);
> > -}
> > -
> >  static void vm_set_async_error(struct xe_vm *vm, int err)
> >  {
> >  	lockdep_assert_held(&vm->lock);
> > @@ -2577,17 +2516,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> >  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> >  			       struct xe_vma_op *op)
> >  {
> > -	LIST_HEAD(objs);
> > -	LIST_HEAD(dups);
> > -	struct ttm_validate_buffer tv_bo, tv_vm;
> > -	struct ww_acquire_ctx ww;
> >  	struct xe_bo *vbo;
> > +	struct drm_exec exec;
> >  	int err;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> >  
> > -	xe_vm_tv_populate(vm, &tv_vm);
> > -	list_add_tail(&tv_vm.head, &objs);
> >  	vbo = xe_vma_bo(vma);
> >  	if (vbo) {
> >  		/*
> > @@ -2596,16 +2530,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> >  		 * take a reference here.
> >  		 */
> >  		xe_bo_get(vbo);
> > -
> > -		if (!vbo->vm) {
> > -			tv_bo.bo = &vbo->ttm;
> > -			tv_bo.num_shared = 1;
> > -			list_add(&tv_bo.head, &objs);
> > -		}
> >  	}
> >  
> >  again:
> > -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> > +	err = xe_vm_bo_lock(vm, vbo, &exec, 1, true);
> >  	if (err) {
> >  		xe_bo_put(vbo);
> >  		return err;
> > @@ -2687,7 +2615,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> >  		XE_BUG_ON("NOT POSSIBLE");
> >  	}
> >  
> > -	ttm_eu_backoff_reservation(&ww, &objs);
> > +	xe_vm_bo_unlock(vm, vbo, &exec, false);
> >  	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> >  		lockdep_assert_held_write(&vm->lock);
> >  		err = xe_vma_userptr_pin_pages(vma);
> > @@ -3338,24 +3266,47 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	return err == -ENODATA ? 0 : err;
> >  }
> >  
> > +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
> > +{
> > +	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> > +		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> > +
> > +	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> > +	return &vm->pt_root[idx]->bo->ttm.base;
> > +}
> > +
> >  /*
> > - * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
> > - * directly to optimize. Also this likely should be an inline function.
> > + * XXX: This likely should be an inline function.
> >   */
> >  int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >  	       int num_resv, bool intr)
> >  {
> > -	struct ttm_validate_buffer tv_vm;
> > -	LIST_HEAD(objs);
> > -	LIST_HEAD(dups);
> > +	struct dma_resv *obj;
> > +	int err;
> >  
> >  	XE_BUG_ON(!ww);
> >  
> > -	tv_vm.num_shared = num_resv;
> > -	tv_vm.bo = xe_vm_ttm_bo(vm);;
> > -	list_add_tail(&tv_vm.head, &objs);
> > +	obj = xe_vm_gem(vm)->resv;
> > +	ww_acquire_init(ww, &reservation_ww_class);
> > +
> > +	if (intr)
> > +		err = dma_resv_lock_interruptible(obj, ww);
> > +	else
> > +		err = dma_resv_lock(obj, ww);
> > +
> > +	if (unlikely(err))
> > +		return err;
> > +
> > +	num_resv = max(num_resv, 1);
> 
> Same question as above here.
> 
> Matt
> 
> > +	err = dma_resv_reserve_fences(obj, num_resv);
> > +	if (err)
> > +		goto out_err;
> >  
> > -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > +	return 0;
> > +
> > +out_err:
> > +	dma_resv_unlock(&vm->resv);
> > +	return err;
> >  }
> >  
> >  void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> > @@ -3364,6 +3315,43 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> >  	ww_acquire_fini(ww);
> >  }
> >  
> > +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > +		  int num_resv, bool intr)
> > +{
> > +	int err;
> > +
> > +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
> > +	drm_exec_until_all_locked(exec) {
> > +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
> > +					   num_resv);
> > +		drm_exec_retry_on_contention(exec);
> > +		if (err && err != -EALREADY)
> > +			goto out_err;
> > +
> > +		if (bo && !bo->vm) {
> > +			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> > +						   num_resv);
> > +			drm_exec_retry_on_contention(exec);
> > +			if (err && err != -EALREADY)
> > +				goto out_err;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +out_err:
> > +	drm_exec_fini(exec);
> > +	return err;
> > +}
> > +
> > +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > +		     bool lru_update)
> > +{
> > +	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
> > +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > +	drm_exec_fini(exec);
> > +}
> > +
> >  /**
> >   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
> >   * @vma: VMA to invalidate
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index eaf11ac8ff51..62a062bd5078 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -12,6 +12,7 @@
> >  #include "xe_vm_types.h"
> >  
> >  struct drm_device;
> > +struct drm_exec;
> >  struct drm_printer;
> >  struct drm_file;
> >  
> > @@ -39,11 +40,17 @@ static inline void xe_vm_put(struct xe_vm *vm)
> >  	kref_put(&vm->refcount, xe_vm_free);
> >  }
> >  
> > +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm);
> > +
> >  int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> >  	       int num_resv, bool intr);
> > -
> >  void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
> >  
> > +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > +		  int num_resv, bool intr);
> > +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> > +		     bool lru_update);
> > +
> >  static inline bool xe_vm_is_closed(struct xe_vm *vm)
> >  {
> >  	/* Only guaranteed not to change when vm->lock is held */
> > @@ -183,8 +190,6 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence);
> >  
> >  extern struct ttm_device_funcs xe_ttm_funcs;
> >  
> > -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
> > -
> >  /**
> >   * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
> >   * vms.
> > @@ -212,23 +217,10 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> >  	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> >  }
> >  
> > -/*
> > - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> > - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> > - */
> > -#define XE_ONSTACK_TV 20
> > -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > -			struct ttm_validate_buffer *tv_onstack,
> > -			struct ttm_validate_buffer **tv,
> > -			struct list_head *objs,
> > -			bool intr,
> > -			unsigned int num_shared);
> > -
> > -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> > -			   struct ttm_validate_buffer *tv_onstack,
> > -			   struct ttm_validate_buffer *tv,
> > -			   struct ww_acquire_ctx *ww,
> > -			   struct list_head *objs);
> > +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> > +			bool intr, unsigned int num_shared);
> > +
> > +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
> >  
> >  void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
> >  			     enum dma_resv_usage usage);
> > -- 
> > 2.34.1
> > 
