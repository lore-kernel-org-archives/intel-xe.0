Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795ECC678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 22:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226B010E592;
	Thu,  2 Mar 2023 22:34:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6D10E592
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 22:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677796444; x=1709332444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1WOmcIkJg6qAyqJIZnY1I7S/MmwQyb7Oyj7DQCK96dM=;
 b=h+V3UIOwbtH0FtNNPk3ZaR6KLan/6U85estKIGkx9270C1uQKCS9nLyT
 Onq5xypmZvq0NuMdMQjKsNiR5z/b8L+QbqXakLl96596v8Gi7WekZjouh
 mUBLbDiy5yhIb5zLMtoXIUSDF9/eNWihKiPVb8gjjaxDO5cirjcL8X/5N
 eHOJpDwIZgn8w/nAoynPW3wQV/x7TQg8iJXCsTGEaMkciBj3s/hjBe9j4
 JFZmplnsdjB/QhvM/SyYKqNM1tgvvwLJqWVWipMlx0XAqTEmX5tb9Dasi
 ygtnNq5FDvXNLhO1SFgcmLyS6qnJQF6M4Yy+e2Vpo/p6uC+XGpv4Uojw7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="332357482"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="332357482"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 14:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="652583995"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="652583995"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 02 Mar 2023 14:34:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 14:34:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 14:34:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 14:34:02 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 14:34:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adGzLNOjMLukPbRAdy0us3CJakqa1a+5xsopaf5aYYsP/jBX7MFONg8PcxsoAHqvcMUvtGYXPLs9WVoR7i+Sd8Ml5N7/aO0dF9nnbQ/P2KMub77b0jPPtkBYFxRx+Mj/HPazGGEELSKo3PjeHJym1po/8HQf/mfEs7V8+u1yVlj79/B/eo+hKMfWEX/hDU6gy1fp8nrfo/1zLieLMT7MdLV8VpE3p0YhM/YjegwqkVY99JqBKf5d93YY6s1N31gu+01e81AC3wK35dDnnSngGEZWSamKJdofFVXVywTnKjynrIX0Z7R/wpekAq2kDp27XJjUojbZFTTFpLT4232EEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94aACOunCaZaXVNX4cz/bbgqh7kfW6AizhFEykaLuFs=;
 b=AotNlwOKX3p16ZeEoKnBDbd9liCguY6YkJDYOW/HabXS6h7ivBeldsxubJpP21LNHuI5qjPVcU76/HTfm6gf6yVE3HZagvnz0k3IutO+Y9xflxVy5aD3P1i30C9W91is3WoWdvfzFuFasBITUlOVN2lUpmc1kzUgaYsJo89Lar7ZDG8Q1FJaCKKMSvqu+z4exYsu8BNfhS0XsDna8/SY4eF5+hqQ8+dEn/KO9b6DSpH2TOAnsOFfrq3qMzz7IH3rWXhe+CO0sdGT0corh9nQm8/bVAVZ8j7Lru0p2Qb8lLaDVv780BXcPSB219Ih5bEdcEV+AbNGiuWL0vfB4JVZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 22:34:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%8]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 22:34:00 +0000
Date: Thu, 2 Mar 2023 17:33:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten@lankhorst.se>
Message-ID: <ZAEkU2i07snx2Soq@intel.com>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
 <20230301163629.axukda67v4rsqb3l@ldmartin-desk2.lan>
 <Y//caMLc8YAqOB9Q@intel.com>
 <32de8549-1e00-ab70-888a-53f0e269ea97@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <32de8549-1e00-ab70-888a-53f0e269ea97@lankhorst.se>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d012762-e1e0-4d8f-b377-08db1b6e37df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BD91NNW0Kr39/f/Ev4VL++jV7HAGu8atD/3kubvdf7qCXbm5CVCerYJjd5RfsDPeEcrLxNsP4hYs3hYMTGAX+L+bnpGyJqUb7MV0seGjOr9uR28jwX7NsSeunpa3M9wp+HCnmW286JZl9EUyiuw2iSLjAcbUSFxt3Ro9zqUyqs/yU6Ex0/AWlLvJIPCSS62tEP4ID0ATdib+hOf8XR4mAcN+BQY0aMXjE87+6c5R9tdR81hr+hhziB6VrbkmPNCJ+6hEn1Me6QF7fEfqomKRLvKjXa/e184OuxTpes6yMukf9B9f3v3xP2xJbwWF3gfMtFhBr2R83l4xHAdWmqTJeZ462QBiXqimKmYiPGyC10p200PwJsJSdHHhm7vMNw1QWJBeQr19PP34XmLkb0pCwDYMNVas/WBb1932pNsCHBrge/aONoofEPPdUeQPI+YMUtQOxOe0iOrf+vvaSNJXORdzTb7UuwjSeO5keo0Mi5zmmMBgDGMzEePGJd3hOK9YNpWDE349m18HD0DGoQ+Gix1Ij5dR6etqdMZ3J5rqUDxeEpXoLPyZ73XD0xF9C0z8wODGsFfgFUjY2X6V2bn0D+6GTv6pUpFgfYbMrCwZjG599YuopAC6Q50jAIk6vprkQrkfTJr8caV8J6AKBgU/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199018)(186003)(66946007)(66556008)(2906002)(36756003)(6486002)(86362001)(478600001)(6512007)(6506007)(26005)(53546011)(6666004)(2616005)(66476007)(316002)(41300700001)(8936002)(44832011)(8676002)(5660300002)(82960400001)(6916009)(83380400001)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nGz1hCWUkWhheMNb7hTCD/+ybsxmGIpHlFUO/rKQ5/xOKJ3zR8OqGx/cIcHF?=
 =?us-ascii?Q?t+MJWVWVR0VmHCSqN1QScgdUioM3bJL2DikTqRNieoX2iFCvubiGePcisBUZ?=
 =?us-ascii?Q?tZI5BZsrXBrySOuui5uKAZk3gmRYhf9rTOLJT54Tqvip/o+Mc3F+kqU11suw?=
 =?us-ascii?Q?4H3dKRilnRITok9qT4Nt/hcgt3xg5mmCmKe786MP3ono4TNnZEFjhKXw0x4H?=
 =?us-ascii?Q?pdRXPwSJLvIyRNUeoow3dinhkIEU5vVjkihg7KePWK8On04ptX4f1j3hSiEQ?=
 =?us-ascii?Q?6Xy1q2zreCuWOWHbrdZgUnX9+kgLh5Ime6UxQX3Eefqz2RtE1+sz20/aoTUC?=
 =?us-ascii?Q?R4qG9jg8syjob/fqT0638B2ycnr+NQmKX6p8PYy2isSZcee09W8LkR5Me2B+?=
 =?us-ascii?Q?CPRgSKwVn2/5Tbai+sfbyYb9bHWaY00FMiZ6Ov4ptUxqlwhI8gB/Twq8X4xb?=
 =?us-ascii?Q?HaVtGNMohVlGJqDGb5qs3spfVhfgNnSf9SK/Qi7FRKdDy/yqVMvq1YOtJpuh?=
 =?us-ascii?Q?QftKBB7jb1Dqr68Zx41LCNktUF5fWbRGhNgOEtQYls41lPo6HuuBJOTiVkZC?=
 =?us-ascii?Q?SsTpI2ueyBzlMixGsLBYecgD+Xiqi+tH0OHA99j7GnVP/bb/7xgSYkCMS1RE?=
 =?us-ascii?Q?tbeS+cHBvpl0FDiST6Tm+8GYgpHyvudNnfsWNyC8QjRr/mVEBjt8kL3M5TtG?=
 =?us-ascii?Q?HG4oCEM+3Pw+wlrXc0eKutN6Kz40cSTXY19PNEH2M0zgN3SYqksZw2QLTDjp?=
 =?us-ascii?Q?t43/AbdFO6iEkKiPD8FN+4oPai2Mz2rze/BcYRq1lm4Y8DTz4tGYj5Nr6GmD?=
 =?us-ascii?Q?FPj5pl34l0QjaB5MxDPEB7zPQCv6qdLtbsoL5GIMwz8G6lBnzX2P5opWvhFv?=
 =?us-ascii?Q?Ff2kaJZQN8vygyYUsSWA85XNiuNVzzCGqOisKyAdOfomgW8W+t8rQ6nC5wGL?=
 =?us-ascii?Q?4cOjL6P4VgHibmSYyDI60YCg1uBVOw6VChK2BNPZTTQO3fYSSB550JdCrIs/?=
 =?us-ascii?Q?Mo6FlyXL/+B3aK3mnfLz27HMtjOwnv2aFhPCNi5w2l5LnISOntu2oq0KSGk2?=
 =?us-ascii?Q?1l6AOng2SH4zk48f5jeGVLNDvfctnAJDcYqAt2937gSooOvvSzDHg5gCPkBF?=
 =?us-ascii?Q?K7h47gqPv/eI1HOOuWEW/UaelRFl82QO1psHvE4WJ/1ubS+ESTGc7cPpTAqZ?=
 =?us-ascii?Q?+Xcd7fgBJuDkXw58IVlHZsL1eia52fcGs9TpopWi4tb0C3kPK+caRAfl3wtq?=
 =?us-ascii?Q?CoBNfmuF8raK4Hw0np+Q3RdixA1ZMs4awHm+M8e36+xDkPx5oXgb8JH7ujFH?=
 =?us-ascii?Q?gldNXd2dq0WpFhupVWXVWkyfSCiEyOF7XqRHNAtdu5EYGB6jYrMQISyyiUwi?=
 =?us-ascii?Q?yB8vDpYCqPXLPNhqsJMqcvgeQiuJ7uhiFIPJlk+h2VFtEvuUAvgU31HQD9jQ?=
 =?us-ascii?Q?5n+BGZTb3DJqdmgmXhN6njNQXTlLltWPTYYvuiBaxY+XvSJuTDkdtoxMppDt?=
 =?us-ascii?Q?XnUgVm02WmyFERrKnqXrhruagCdMDxZt59lGW2x9UEGsFid7hFTvnErqCvXC?=
 =?us-ascii?Q?sj8Cyi2PVtIIT9vSJF8lWeQg0nXoL27bh4uN7mR10b6kHosKveIO88nqOH1K?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d012762-e1e0-4d8f-b377-08db1b6e37df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 22:34:00.3941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsCpM2U0lXuJNWme6oUWbdASNSDd0zHMd+xiAfYPy5UtzWTdhZuR9LjHfqemCJaBt+UAnkJrQfIbmpXa28UzKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 12:26:18PM +0100, Maarten Lankhorst wrote:
> 
> On 2023-03-02 00:14, Rodrigo Vivi wrote:
> > On Wed, Mar 01, 2023 at 08:36:29AM -0800, Lucas De Marchi wrote:
> > > On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
> > > > xe_guc_ct_fast_path() is called from an irq context, and cannot lock
> > > > the mutex used by xe_device_mem_access_ongoing().
> > > > 
> > > > Fortunately it is easy to fix, and the atomic guarantees are good enough
> > > > to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
> > > > 
> > > > As far as I can tell, the runtime ref in device access should be
> > > > killable, but don't dare to do it yet.
> > > I don't follow this last paragraph. Could you point it in the code?
> > I also didn't understand this... if we remove that we will end up in
> > memory access with the sleeping device...
> I may understand the code wrong, but without error checking by the callers,
> and changing the prototype to return int is there any way this will be
> guaranteed to work regardless?
> > > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
> > > > drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
> > > > drivers/gpu/drm/xe/xe_device_types.h |  4 +---
> > > > 3 files changed, 13 insertions(+), 22 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 4eb6786b11f0..ab179b1e24c1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > > > 	if (err)
> > > > 		goto err;
> > > > 
> > > > -	mutex_init(&xe->mem_access.lock);
> > > > 	return xe;
> > > > 
> > > > err_put:
> > > > @@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> > > > void xe_device_mem_access_get(struct xe_device *xe)
> > > > {
> > > > 	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> > > > +	int ref = atomic_inc_return(&xe->mem_access.ref);
> > > 
> > > +Matt Brost
> > > 
> > > Any reason for not using kref?
> > hmmm... my bad actually...
> > 
> > I did considered the kref, but I can't remember why I haven't used it.
> > I recently was asking myself the same question.
> 
> I looked at it, I don't think you can kref from 0 to 1 by design.
> 
> xe_device_mem_access_get() is usually called with force wake held explicitly
> or implicitly, so we shouldn't need the runtime pm ref there.

But this is one of the main problems in i915 right now on why we can't
enable the D3Cold. If we have any possibility of memory transaction we
need to first wake up the device, then we need to proceed with the memory
accesses. Or the bridges might be sleeping and returning 0xfffff

so, the first one to take the very first mem_access ref will also ensure
that the device is awake before proceeding. This works now without any
error handling by the caller.

Another way to do would probably need to involve a queue for every
memory access or like i915 was going where there's a list...

I wonder if making this spin_lock isn't enough to fix the current issue...

But well, Thomas had some bad feelings about the whole idea of the
memory access handling anyway and was in favor of the i915 approach...

> 
> > > Lucas De Marchi
> > > 
> > > > -	mutex_lock(&xe->mem_access.lock);
> > > > -	if (xe->mem_access.ref++ == 0)
> > > > +	if (ref == 1)
> > > > 		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
> > hmmm... I'm afraid this can be tricky without locks...
> > 
> > if we have 3 simultaneous threads calling this.
> > get
> > get
> > put
> > get
> > 
> > and they happened in this order but the resume didn't finished yet
> > on the first one, then you will:
> > 1. end up the runtime pm twice.
> > 2. the second will pass over thinking the gpu is already awake, but it might
> > be still asleep.
> 
> 
> 
> 
> 
> 
> 
> > > > -	mutex_unlock(&xe->mem_access.lock);
> > > > 
> > > > 	/* The usage counter increased if device was immediately resumed */
> > > > 	if (resumed)
> > > > 		xe_pm_runtime_put(xe);
> > > > 
> > > > -	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
> > > > +	XE_WARN_ON(ref == S32_MAX);
> > > > }
> > > > 
> > > > void xe_device_mem_access_put(struct xe_device *xe)
> > > > {
> > > > -	mutex_lock(&xe->mem_access.lock);
> > > > -	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
> > > > +	bool hold = xe->mem_access.hold_rpm;
> > > > +	int ref = atomic_dec_return(&xe->mem_access.ref);
> > > > +
> > > > +	if (!ref && hold)
> > > > 		xe_pm_runtime_put(xe);
> > > > -	mutex_unlock(&xe->mem_access.lock);
> > > > 
> > > > -	XE_WARN_ON(xe->mem_access.ref < 0);
> > > > +	XE_WARN_ON(ref < 0);
> > > > }
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > index 263620953c3b..96b4f3d7969e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > @@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
> > > > void xe_device_mem_access_get(struct xe_device *xe);
> > > > void xe_device_mem_access_put(struct xe_device *xe);
> > > > 
> > > > -static inline void xe_device_assert_mem_access(struct xe_device *xe)
> > > > +static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> > > > {
> > > > -	XE_WARN_ON(!xe->mem_access.ref);
> > > > +	return atomic_read(&xe->mem_access.ref);
> > > > }
> > > > 
> > > > -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> > > > +static inline void xe_device_assert_mem_access(struct xe_device *xe)
> > > > {
> > > > -	bool ret;
> > > > -
> > > > -	mutex_lock(&xe->mem_access.lock);
> > > > -	ret = xe->mem_access.ref;
> > > > -	mutex_unlock(&xe->mem_access.lock);
> > > > -
> > > > -	return ret;
> > > > +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> > > > }
> > > > 
> > > > static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 9743987fc883..0b8c4ee0ad48 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -230,10 +230,8 @@ struct xe_device {
> > > > 	 * triggering additional actions when they occur.
> > > > 	 */
> > > > 	struct {
> > > > -		/** @lock: protect the ref count */
> > > > -		struct mutex lock;
> > > > 		/** @ref: ref count of memory accesses */
> > > > -		s32 ref;
> > > > +		atomic_t ref;
> > > > 		/** @hold_rpm: need to put rpm ref back at the end */
> > > > 		bool hold_rpm;
> > > > 	} mem_access;
> > > > -- 
> > > > 2.34.1
> > > > 
