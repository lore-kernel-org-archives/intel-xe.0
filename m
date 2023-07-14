Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23006C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 15:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF39710E8B1;
	Fri, 14 Jul 2023 15:34:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB97A10E8D1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689348868; x=1720884868;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PpBixM/KUR5tvENa2YP5KbipAQrpVQVeVU+EM8xKIZg=;
 b=WsVehS9BBqhtLormMdaCQsBqjKSUw8RzyJ1kEjLdiNKe2W+tvhWyeryJ
 2l9E4yF3PTq7ZUNdJw3E5vn8ucKTs/+YX7aw8vPDQW77cCsmOGZq5IDmC
 0r2khdE6d//GEqcRQwHD+KStj5BWohIwttTHdIzFMkwjGlWT6TcoZ9zFT
 l0fviLMTAOwzMkN+ZnMFZHFj+NM5QBxkQYAusxHSadYD22sUr9jsyFr/V
 wSuW88TyAnvBNt8e2mVJ/x0ijFqqBBSOkJ6G6z9+49onJU+PqdJTBRSmS
 xr++4rG7LA1SRcZr1ghx09vTeQtiOfk5nyRLSSxW9PiBrdTUvW3NwvJae w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="451866768"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="451866768"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 08:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="836093257"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="836093257"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2023 08:34:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:34:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 08:34:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 08:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjg62ISxln2MiMwBXMgCOhqSElKOpn8qf0PDHlHw4CmlllPmbVluU+V37B/CLpF+NO2wFtTCV9PuqbmNwDhYfL3ObkF46ZCfjTXS5BX/xY+ZRJ7mSJuYoFYQHix//j/jp2SXAZugpENBRa3zeRSFf9RbtKIZUdqGqdXj8nGAw4BXYzgUKSpVAgmwwzOGrA10XS75zhhFSPe4084GH/TWUEdO33ub9Zl39XjfwXfb3ZjPYk7eOKWAnfz9872nSCRul3CQ+5A82th/UxBtCpZcuBHr6WnlC54U132rilGmMrLlDfh7y6BDCLmjJU2Cbp9vBfkOnBqyw2E+im3DRrTZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaw2UeVWHUC4o2QX3usXif000nm83qvgRT9R3ssxruE=;
 b=CxDm7Ome04xWuXuclayPhluHeUEowzKv9DwD00QReoYguTAZ0vbMDlVJ6OcykFR7dN65Dw/oIdKNifk1Zu1BZU2S3Zr41mW8430YjYp7lGhlfZdofIEDrA35cxbOIW30YZXY8jP9JufOcIzqkT3/tF0AnfhD7hh50BrbBaDY8s2zLT3kTVois1nH8GEj9gx2XQUN5zFvsaikFNqVUBI9YGuwaTRKnzNZuAahBD8/M3zvF8fiXHjqnru5XKk91vJtB/+bE5Lwc4Gp/mM+A9MEVc8J/m9c/WOwSDw3mhEyU8X/AdVyn0tgs9aYjGyzguSYL7hFi7x2eCZJIxjVd5cSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Fri, 14 Jul
 2023 15:34:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 14 Jul 2023
 15:34:24 +0000
Date: Fri, 14 Jul 2023 11:34:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <ZLFq/DqDGii2mdVW@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
 <20230713132244.459605-13-matthew.auld@intel.com>
 <CY5PR11MB6211EC2CB7C2E4F1F97BB8809534A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR11MB6211EC2CB7C2E4F1F97BB8809534A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d2032e-0c56-4f1e-6c58-08db847fcceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AI73sQeFpoUi00P0J4BaG64L8kQCAEF1ZW9RGidzeonRuunBO1IGrwCCqtEiZ2SpoqwsvLD02l7Rba21FWqsZwZYeRuakX+7+bh5QaKtXnQNmB8Ageh/BoOns9bmi12wpUHFo7iIcF1wtEiFxIPqpQFgLbhIFLesXTit2SHSS+eEt6ZWIWV96jKKfYyO+PtFxbFSnWdy4RL78bJDTnTkPJKazLtnApdkxfwA6yYYaAa4x/8f4fXz3D6KZqJTVWG94PzuwNRkbUB0cxsLd+6GetFSlO6mSKmKbbWCXLrD39w2B0I89Z43ERHYodJ6L+KzVJp9UpMHK+vSWpvgSkJsC4fPCVh844uPK7riJxEvTL1FPJTE3ucKW92ZlcaOjcV2v3kvHcJkC/HfO1S+YZDK+ekSER+iS+Wk8bzJXHjBDv+bcRRBurTFWqEeg6U0iAIoNBxlmUTOwSxdGp0Ku9kkIDx7dJF7a8ooesJd7rcpq6djYvZe7YLz1JBi6i3UL74zDnp91ivuKex7Vd+Tzk1neFC8CepZtNsy4w5TWkCsZDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199021)(83380400001)(30864003)(66574015)(2616005)(36756003)(86362001)(2906002)(38100700002)(82960400001)(41300700001)(4326008)(6486002)(6636002)(316002)(966005)(6512007)(5660300002)(8676002)(8936002)(6862004)(478600001)(66476007)(54906003)(66556008)(6666004)(66946007)(44832011)(37006003)(26005)(66899021)(6506007)(186003)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3KMKoca69MON4qFzfEe2lLK82dYsN3mC/5IKJ3EeHNmVkNazft8oyoXtP+?=
 =?iso-8859-1?Q?ZBj02/73dwZ4Pwg7hOXBiLfksftL0PUKKMuHHboWzpe3ahOyri24TPzs0C?=
 =?iso-8859-1?Q?CJynzUYmem84+MfrlyzvrXICMoKoKwfaInBh6Xp8BSRnEHDQcOUvsq41DR?=
 =?iso-8859-1?Q?9juxUvUAQP1Fn3FJPdSFK6f+TmrZemttx9ii6+lxYWNdEB2h7FtGF60+ng?=
 =?iso-8859-1?Q?sYAhWDHPTkl+IET095Vt2uzXGHTGAzQNvxA7NW/l7ThWpkGFfjsnuoDojg?=
 =?iso-8859-1?Q?CRKAehZ1FT8xt9RUs1CAmaPuO5x+iNHPniokSGMGVnA/qHifwYKBfOcO10?=
 =?iso-8859-1?Q?F4YLXZa9XT2MIAxKKGZMHIAYzAJ5uNT3eR20ScTWf1u7VgturWPfMQ1WvF?=
 =?iso-8859-1?Q?KrVxkzr2mXYLgkQ3FWSRho9ZDbZwDiVDgsorqzQVoybLcYIDz7gcbZxLpv?=
 =?iso-8859-1?Q?rj80GRNuz6AY0qeu9tg8zkY4ptHOykyIzTKiOMTeglHSLcqzeZfiP7fTB2?=
 =?iso-8859-1?Q?YXN2ZmbO5jwk86eifZNHt+95P1Y4TGJoxUxILlCRS6fQPEF3Lye7D5703Y?=
 =?iso-8859-1?Q?XziVvynzHE0o8XRjT/KT5g5mshubnN03X8Ht+B2b2IcIcZsmDOzsoRrFpd?=
 =?iso-8859-1?Q?TRXVz7iNi1Xfz5W2UwGZEHsc3xRdE9Ve7Nv4PXU7f7L+DNZ+TVSOvIFAOm?=
 =?iso-8859-1?Q?XEgl5MnQi4vrhHccoGnynUx5BkMTnqGo9moezKYi8PIu1WXAlD6/1nlaou?=
 =?iso-8859-1?Q?c1aMv9gtcubhtn2Iabkjv0K1p6KMb2OnQYSY9omzepnF4Boxg3kywUIk7C?=
 =?iso-8859-1?Q?J0RBM1tZ0RG69j+KsQz2t8MnbDCiendrwnkiEkq0BC5rXPfza/bT+BBVtM?=
 =?iso-8859-1?Q?uLj8E3xnV6m0ntUvRd1Zu2Kj5BwJQccf88obQWB1Y+mq0kwfqisLJMbQ98?=
 =?iso-8859-1?Q?5B3QpIs0H7xndB5hHakRawGJ52ISdTOHWYEVe71cvFK8aOgQcYMe+c4Ijw?=
 =?iso-8859-1?Q?s1N8sz8A61g9KZMuB7B+wk0AF/NtouYj2tjqJVr9cD0CAnIf9Dy3be5rpx?=
 =?iso-8859-1?Q?clhmH2Mna1+UHnOYl/MT2YCmZ3sb6DHySdfrOFcb4XUdqLqC0mwg95YoD5?=
 =?iso-8859-1?Q?j+1XkCv12UzoN8Hw2gdM4tkrrVVR62XijOwQBRJnohsE5B0VIvz6FKf1+q?=
 =?iso-8859-1?Q?6+5lEYzwYHNhiorkQyXiaSvSbcxy0NVQXUJqrEpvp1E23/oKTeDD03wMk0?=
 =?iso-8859-1?Q?6zi7/JgxmOSPh2jeAhUJYScz+rAfCIRmI7QJg5HAWOzybxszTx9lYTbWg/?=
 =?iso-8859-1?Q?CgQBSO5Yl93nobJdB6DUWuNMGfw+wttvdRVQCkSIdYXy7tyfvIVhDQ/mKG?=
 =?iso-8859-1?Q?b/HRjuXDdbyPd7EXXpFtJekkjeAXV8LwmaxrzKrpMNoKvsjEckqU2lI602?=
 =?iso-8859-1?Q?kL40GedWSubk6bJpPwQQmMsF5sIRLFCkNhyqSTNYxaiA8ua2tEZ8rA+Uho?=
 =?iso-8859-1?Q?4iVxnTGfhbsQnv1E6j3SJ0+IKTXSGakCsUkUc3ZMX9d2dG6QzpYLcUKJOT?=
 =?iso-8859-1?Q?5WqW12IRZkI8Sp03xVyXIDqcRuQlGnZzDUJCbdP2OaaBpnNsirWtvYJS+c?=
 =?iso-8859-1?Q?qGRJr54qrbcrtWo6nLnIVNBlhVHEy7GHs8KHk/vi0+lU2ZRqGowMMLpw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d2032e-0c56-4f1e-6c58-08db847fcceb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:34:23.9560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWpptrcBe0Rj9bs5GXfot09y9ymYbEUlAcHbZG84FBZJjMYaVenP9VyBqwN0J+rbk1mvxWE3kn6c/ZH72Ic0OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v13 01/10] drm/xe: fix
 xe_device_mem_access_get() races
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 01:04:51PM +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Auld, Matthew <matthew.auld@intel.com>
> > Sent: Thursday, July 13, 2023 6:53 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas Hellström
> > <thomas.hellstrom@linux.intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Subject: [PATCH v13 01/10] drm/xe: fix xe_device_mem_access_get() races
> > 
> > It looks like there is at least one race here, given that the
> > pm_runtime_suspended() check looks to return false if we are in the process
> > of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED).  We
> > later also do xe_pm_runtime_get_if_active(), but since the device is
> > suspending or has now suspended, this doesn't do anything either.
> > Following from this we can potentially return from
> > xe_device_mem_access_get() with the device suspended or about to be,
> > leading to broken behaviour.
> > 
> > Attempt to fix this by always grabbing the runtime ref when our internal ref
> > transitions from 0 -> 1. The hard part is then dealing with the runtime_pm
> > callbacks also calling xe_device_mem_access_get() and deadlocking, which
> > the pm_runtime_suspended() check prevented.
> > 
> > v2:
> >  - ct->lock looks to be primed with fs_reclaim, so holding that and then
> >    allocating memory will cause lockdep to complain. Now that we
> >    unconditionally grab the mem_access.lock around mem_access_{get,put},
> > we
> >    need to change the ordering wrt to grabbing the ct->lock, since some of
> >    the runtime_pm routines can allocate memory (or at least that's what
> >    lockdep seems to suggest). Hopefully not a big deal.  It might be that
> >    there were already issues with this, just that the atomics where
> >    "hiding" the potential issues.
> > v3:
> >  - Use Thomas Hellström' idea with tracking the active task that is
> >    executing in the resume or suspend callback, in order to avoid
> >    recursive resume/suspend calls deadlocking on itself.
> >  - Split the ct->lock change.
> > v4:
> >  - Add smb_mb() around accessing the pm_callback_task for extra safety.
> >    (Thomas Hellström)
> > v5:
> >  - Clarify the kernel-doc for the mem_access.lock, given that it is quite
> >    strange in what it protects (data vs code). The real motivation is to
> >    aid lockdep. (Rodrigo Vivi)
> > v6:
> >  - Split out the lock change. We still want this as a lockdep aid but
> >    only for the xe_device_mem_access_get() path. Sticking a lock on the
> >    put() looks be a no-go, also the runtime_put() there is always async.
> >  - Now that the lock is gone move to atomics and rely on the pm code
> >    serialising multiple callers on the 0 -> 1 transition.
> >  - g2h_worker_func() looks to be the next issue, given that
> >    suspend-resume callbacks are using CT, so try to handle that.
> > v7:
> >  - Add xe_device_mem_access_get_if_ongoing(), and use it in
> >    g2h_worker_func().
> > v8 (Anshuman):
> >  - Just always grab the rpm, instead of just on the 0 -> 1 transition,
> >    which is a lot clearer and simplifies the code quite a bit.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       | 61 +++++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_device.h       | 11 +----
> >  drivers/gpu/drm/xe/xe_device_types.h |  8 +++-
> >  drivers/gpu/drm/xe/xe_guc_ct.c       | 34 +++++++++++++-
> >  drivers/gpu/drm/xe/xe_pm.c           | 68 ++++++++++++++++++----------
> >  drivers/gpu/drm/xe/xe_pm.h           |  2 +-
> >  6 files changed, 131 insertions(+), 53 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index 42fedb267454..70f89869b8a6
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -412,33 +412,66 @@ u32 xe_device_ccs_bytes(struct xe_device *xe,
> > u64 size)
> >  		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;  }
> > 
> > +bool xe_device_mem_access_ongoing(struct xe_device *xe) {
> > +	if (xe_pm_read_callback_task(xe) != NULL)
> > +		return true;
> > +
> > +	return atomic_read(&xe->mem_access.ref); }
> > +
> > +void xe_device_assert_mem_access(struct xe_device *xe) {
> > +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> > +}
> > +
> >  bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)  {
> > -	return atomic_inc_not_zero(&xe->mem_access.ref);
> > +	bool active;
> > +
> > +	if (xe_pm_read_callback_task(xe) == current)
> > +		return true;
> > +
> > +	active = xe_pm_runtime_get_if_active(xe);
> > +	if (active) {
> > +		int ref = atomic_inc_return(&xe->mem_access.ref);
> > +
> > +		XE_WARN_ON(ref == S32_MAX);
> > +	}
> > +
> > +	return active;
> >  }
> > 
> >  void xe_device_mem_access_get(struct xe_device *xe)  {
> > -	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> > -	int ref = atomic_inc_return(&xe->mem_access.ref);
> > +	int ref;
> > 
> > -	if (ref == 1)
> > -		xe->mem_access.hold_rpm =
> > xe_pm_runtime_get_if_active(xe);
> > +	/*
> > +	 * This looks racy, but should be fine since the pm_callback_task only
> > +	 * transitions from NULL -> current (and back to NULL again), during
> > the
> > +	 * runtime_resume() or runtime_suspend() callbacks, for which
> > there can
> > +	 * only be a single one running for our device. We only need to
> > prevent
> > +	 * recursively calling the runtime_get or runtime_put from those
> > +	 * callbacks, as well as preventing triggering any access_ongoing
> > +	 * asserts.
> > +	 */
> > +	if (xe_pm_read_callback_task(xe) == current)
> > +		return;
> > 
> > -	/* The usage counter increased if device was immediately resumed
> > */
> > -	if (resumed)
> > -		xe_pm_runtime_put(xe);
> > -
> > -	XE_WARN_ON(ref == S32_MAX);
> > +	xe_pm_runtime_get(xe);
> > +	ref = atomic_inc_return(&xe->mem_access.ref);
> > +	XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
> >  }
> > 
> >  void xe_device_mem_access_put(struct xe_device *xe)  {
> > -	bool hold = xe->mem_access.hold_rpm;
> > -	int ref = atomic_dec_return(&xe->mem_access.ref);
> > +	int ref;
> > 
> > -	if (!ref && hold)
> > -		xe_pm_runtime_put(xe);
> > +	if (xe_pm_read_callback_task(xe) == current)
> > +		return;
> > +
> > +	ref = atomic_dec_return(&xe->mem_access.ref);
> > +	xe_pm_runtime_put(xe);
> > 
> >  	XE_WARN_ON(ref < 0);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > b/drivers/gpu/drm/xe/xe_device.h index 8e01bbadb149..0ce0351d7d23
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -141,15 +141,8 @@ void xe_device_mem_access_get(struct xe_device
> > *xe);  bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
> > void xe_device_mem_access_put(struct xe_device *xe);
> > 
> > -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe) -{
> > -	return atomic_read(&xe->mem_access.ref);
> > -}
> > -
> > -static inline void xe_device_assert_mem_access(struct xe_device *xe) -{
> > -	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> > -}
> > +void xe_device_assert_mem_access(struct xe_device *xe); bool
> > +xe_device_mem_access_ongoing(struct xe_device *xe);
> > 
> >  static inline bool xe_device_in_fault_mode(struct xe_device *xe)  { diff --git
> > a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 26a8de77138a..dcba8bb8f989 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -343,10 +343,14 @@ struct xe_device {
> >  	struct {
> >  		/** @ref: ref count of memory accesses */
> >  		atomic_t ref;
> > -		/** @hold_rpm: need to put rpm ref back at the end */
> > -		bool hold_rpm;
> >  	} mem_access;
> > 
> > +	/**
> > +	 * @pm_callback_task: Track the active task that is running in either
> > +	 * the runtime_suspend or runtime_resume callbacks.
> > +	 */
> > +	struct task_struct *pm_callback_task;
> > +
> >  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
> >  	bool d3cold_allowed;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > b/drivers/gpu/drm/xe/xe_guc_ct.c index 9fb5fd4391d2..e7f7f9b1ce1c
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_guc.h"
> >  #include "xe_guc_submit.h"
> >  #include "xe_map.h"
> > +#include "xe_pm.h"
> >  #include "xe_trace.h"
> > 
> >  /* Used when a CT send wants to block and / or receive data */ @@ -1091,9
> > +1092,36 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)  static void
> > g2h_worker_func(struct work_struct *w)  {
> >  	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct,
> > g2h_worker);
> > +	bool ongoing;
> >  	int ret;
> > 
> > -	xe_device_mem_access_get(ct_to_xe(ct));
> > +	/*
> > +	 * Normal users must always hold mem_access.ref around CT calls.
> > However
> > +	 * during the runtime pm callbacks we rely on CT to talk to the GuC,
> > but
> > +	 * at this stage we can't rely on mem_access.ref and even the
> > +	 * callback_task will be different than current.  For such cases we just
> > +	 * need to ensure we always process the responses from any
> > blocking
> > +	 * ct_send requests or where we otherwise expect some response
> > when
> > +	 * initiated from those callbacks (which will need to wait for the
> > below
> > +	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail
> > if
> > +	 * the device has suspended to the point that the CT communication
> > has
> > +	 * been disabled.
> > +	 *
> > +	 * If we are inside the runtime pm callback, we can be the only task
> > +	 * still issuing CT requests (since that requires having the
> > +	 * mem_access.ref).  It seems like it might in theory be possible to
> > +	 * receive unsolicited events from the GuC just as we are
> > +	 * suspending-resuming, but those will currently anyway be lost
> > when
> > +	 * eventually exiting from suspend, hence no need to wake up the
> > device
> > +	 * here. If we ever need something stronger than get_if_ongoing()
> > then
> > +	 * we need to be careful with blocking the pm callbacks from getting
> > CT
> > +	 * responses, if the worker here is blocked on those callbacks
> > +	 * completing, creating a deadlock.
> > +	 */
> > +	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> > +	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> > +		return;
> Patch looks good tome me from runtime PM pov but i am not familiar with GuC CT flow,
> I cannot provide RB specially for above code.
> For runtime PM perspective.
> Acked-by: Anshuman Gupta <anshuman.gupta@intel.com>

My only take on this guc ct flow is that we should add a debug(warning?) msg
in case we are skipping because !ongoing...

But this can be in a follow up.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Regards,
> Anshuman Gupta.
> > +
> >  	do {
> >  		mutex_lock(&ct->lock);
> >  		ret = dequeue_one_g2h(ct);
> > @@ -1107,7 +1135,9 @@ static void g2h_worker_func(struct work_struct
> > *w)
> >  			kick_reset(ct);
> >  		}
> >  	} while (ret == 1);
> > -	xe_device_mem_access_put(ct_to_xe(ct));
> > +
> > +	if (ongoing)
> > +		xe_device_mem_access_put(ct_to_xe(ct));
> >  }
> > 
> >  static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb
> > *ctb, diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > b/drivers/gpu/drm/xe/xe_pm.c index c7901f379aee..fe99820db2df 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -137,43 +137,71 @@ void xe_pm_runtime_fini(struct xe_device *xe)
> >  	pm_runtime_forbid(dev);
> >  }
> > 
> > +static void xe_pm_write_callback_task(struct xe_device *xe,
> > +				      struct task_struct *task)
> > +{
> > +	WRITE_ONCE(xe->pm_callback_task, task);
> > +
> > +	/*
> > +	 * Just in case it's somehow possible for our writes to be reordered to
> > +	 * the extent that something else re-uses the task written in
> > +	 * pm_callback_task. For example after returning from the callback,
> > but
> > +	 * before the reordered write that resets pm_callback_task back to
> > NULL.
> > +	 */
> > +	smp_mb(); /* pairs with xe_pm_read_callback_task */ }
> > +
> > +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe) {
> > +	smp_mb(); /* pairs with xe_pm_write_callback_task */
> > +
> > +	return READ_ONCE(xe->pm_callback_task); }
> > +
> >  int xe_pm_runtime_suspend(struct xe_device *xe)  {
> >  	struct xe_gt *gt;
> >  	u8 id;
> > -	int err;
> > +	int err = 0;
> > +
> > +	if (xe->d3cold_allowed && xe_device_mem_access_ongoing(xe))
> > +		return -EBUSY;
> > +
> > +	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > +	xe_pm_write_callback_task(xe, current);
> > 
> >  	if (xe->d3cold_allowed) {
> > -		if (xe_device_mem_access_ongoing(xe))
> > -			return -EBUSY;
> > -
> >  		err = xe_bo_evict_all(xe);
> >  		if (err)
> > -			return err;
> > +			goto out;
> >  	}
> > 
> >  	for_each_gt(gt, xe, id) {
> >  		err = xe_gt_suspend(gt);
> >  		if (err)
> > -			return err;
> > +			goto out;
> >  	}
> > 
> >  	xe_irq_suspend(xe);
> > -
> > -	return 0;
> > +out:
> > +	xe_pm_write_callback_task(xe, NULL);
> > +	return err;
> >  }
> > 
> >  int xe_pm_runtime_resume(struct xe_device *xe)  {
> >  	struct xe_gt *gt;
> >  	u8 id;
> > -	int err;
> > +	int err = 0;
> > +
> > +	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > +	xe_pm_write_callback_task(xe, current);
> > 
> >  	if (xe->d3cold_allowed) {
> >  		for_each_gt(gt, xe, id) {
> >  			err = xe_pcode_init(gt);
> >  			if (err)
> > -				return err;
> > +				goto out;
> >  		}
> > 
> >  		/*
> > @@ -182,7 +210,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  		 */
> >  		err = xe_bo_restore_kernel(xe);
> >  		if (err)
> > -			return err;
> > +			goto out;
> >  	}
> > 
> >  	xe_irq_resume(xe);
> > @@ -193,10 +221,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  	if (xe->d3cold_allowed) {
> >  		err = xe_bo_restore_user(xe);
> >  		if (err)
> > -			return err;
> > +			goto out;
> >  	}
> > -
> > -	return 0;
> > +out:
> > +	xe_pm_write_callback_task(xe, NULL);
> > +	return err;
> >  }
> > 
> >  int xe_pm_runtime_get(struct xe_device *xe) @@ -210,19 +239,8 @@ int
> > xe_pm_runtime_put(struct xe_device *xe)
> >  	return pm_runtime_put_autosuspend(xe->drm.dev);
> >  }
> > 
> > -/* Return true if resume operation happened and usage count was
> > increased */ -bool xe_pm_runtime_resume_if_suspended(struct xe_device
> > *xe) -{
> > -	/* In case we are suspended we need to immediately wake up */
> > -	if (pm_runtime_suspended(xe->drm.dev))
> > -		return !pm_runtime_resume_and_get(xe->drm.dev);
> > -
> > -	return false;
> > -}
> > -
> >  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
> > -	WARN_ON(pm_runtime_suspended(xe->drm.dev));
> >  	return pm_runtime_get_if_active(xe->drm.dev, true);  }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 8418ee6faac5..da05556d9a6e 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -19,8 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);  int
> > xe_pm_runtime_resume(struct xe_device *xe);  int
> > xe_pm_runtime_get(struct xe_device *xe);  int xe_pm_runtime_put(struct
> > xe_device *xe); -bool xe_pm_runtime_resume_if_suspended(struct
> > xe_device *xe);  int xe_pm_runtime_get_if_active(struct xe_device *xe);
> > void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> > +struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> > 
> >  #endif
> > --
> > 2.41.0
> 
