Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BC4C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 13:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C3310E643;
	Tue,  8 Jul 2025 13:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foMnRVmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C99E10E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751983186; x=1783519186;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hMpIShwEUIUSStisomiHfBDWGQ+DMXsbeflefMUcinw=;
 b=foMnRVmPb12b+lctqTW9r5cYSPwvwW8NzeB8PLp3BtQZEm+8ScVHI/nv
 Q/8zN9Vs638H+Qb/MueXs/+sE7vhjHxjN/8wG/EFehJGTcl+F6Wy6Ei1s
 XmgQ/90QM7BqOlu5HVsKx7TmVmxaaZK9L/HgQFSl0ZZY6vSU1WU7vL8Ky
 DgcB0sg4Xup2vpV4vSQmJpfmXMt5eDso+qLxy84OleAS4fOtzbZoR2Jso
 GJlGC+lJtu56BKR2z0OQnftjNAy5oAXNRdrqQjYw0vg5n5l2kGQeMuRwH
 cTReHjdewk29p+WoQHCiOxLwVppI7HRro4ZF7UFvva2to6rocN0FV8Vf4 Q==;
X-CSE-ConnectionGUID: jJTgu6QaT+mxdofymGvUvg==
X-CSE-MsgGUID: mtHTgMoaRy6hiQvGSYaOTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65573137"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="65573137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 06:59:45 -0700
X-CSE-ConnectionGUID: zWbtRvnjTVuwpx5UwqKe+g==
X-CSE-MsgGUID: nPKXqrKSR9aQ2rBEjC/I1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="159543187"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 06:59:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 06:59:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 06:59:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 06:59:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqj8NR+yfAi5I0kOSiFI/es92zUwLEJ7exEGNbGJBoTqABTlSPMfPegHUC5AaoosAQRuczvMAElDZhGyGLeLdDqUtVSlJaCJdzpOz7XPDkElB4oPosDhmvLF7lSodkanmstU8xT0aXkZjFifEX+Vtts+tyGTbkJrhJPPedztNJSx6sjLIzsbcyOhYIcOYuMaBOXGJTGjjSJrH7UX7KTaPBuoTyTsmppecG84atgf/9jHJCkcVZPWrDdPLHO2HeCaSS+miW8JnXFHPUukDZKJx5rr+iCVyclFT9RAo7/b4lIvxUivNAmJ3DED4KV2Q+LVeHbOb0rNWYZkaYkHOAk64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSqbOXu7XjiF5V+9vixuOoMATfhZp0EfNKWpM/YOavs=;
 b=m3YdCJeRKVC+mLgztcDsY5t9IMJwm8s6tjxklAukS3zrjo+wFu/q3BoVQTDSDU5nVgfZxkIHHlvfZcfbxT9kCACHlJZnNyTzBFG4SwuW2mcyQs79fP6foKmcJ/7DeFlh+c0LVtovIAx6LWOobP7/AcO1ZJ8fRBbRGpC8ILhVTm40jQvLhJHezuv/pfJbe4DI3BVgbQ4h572N6dCW/lkpDQ8IEGYtiXEWlAy6uVsBYGIgzvnviHQUsQZxd0Wn0/oS/0X+z9OW3tTyuiRJ7PsL/Gs3oQg6BAvN2tltJvjUi9FF9b2s+m2vrqLjIphuFA1cWJvqJljnAxjy3p5Ty5HXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 13:59:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 13:59:12 +0000
Date: Tue, 8 Jul 2025 09:59:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ptl: Drop force_probe requirement
Message-ID: <aG0kLU560CgQzyqi@intel.com>
References: <20250707201959.319406-1-matthew.s.atwood@intel.com>
 <aGw9fMCuksw-pPoE@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aGw9fMCuksw-pPoE@intel.com>
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: d826ba51-6332-4a24-cfca-08ddbe279e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MiwvfqQBrmPWykBsYxXt6YskJtWMutrVTJj24jNGXThzzsSOvs85KwR1fqJK?=
 =?us-ascii?Q?yGD1kRuNQnNUXn3tgt4VTBXm9Yw4nWeXP/KaNPkIAouKP40MA8UfZR30kipK?=
 =?us-ascii?Q?4VmgkbI8W8AfR/Mg2PuJiZc+pHIrPO48Q4Gsso2QZ/KmO0YUzOJPh6JWvJsi?=
 =?us-ascii?Q?Qy6TEh7L6LCnJUqe+nzkbFJPIXSbpvkZrj/LbugvywGibxOukkQtcriahneC?=
 =?us-ascii?Q?BzPz7OEr7Uv2M0cQhSneKQeeHthn/CcBgtm3zfe3AtxNafbglvcw7fS7y4ip?=
 =?us-ascii?Q?SBCXpgXp59tcZf/9ccLTV9UDwjfrEpl9Sttl41M/z9LJqPaDGPRzPn5/13OZ?=
 =?us-ascii?Q?52mefjUVISXi7cqP5WOPIkvZeEBO5/dkmUY4r9MjaA21cjm3tvXcZmBdSrF9?=
 =?us-ascii?Q?guuIBJxsPip//i3m96hxy003SOMKPoEptqJ8E8VAo54netm8EJ9kTFIxKwFT?=
 =?us-ascii?Q?n20tJPPsJbXuSIfnaDnVBZWGNdggCZe7wtBhlkGJy5YOgFpbknh/52b0Lwr6?=
 =?us-ascii?Q?prnlpLl0V8lT7on7uN9a8Lszb5UDOfBASr/sG4h58h9iNPxL0+PIX4wwKsbj?=
 =?us-ascii?Q?7UyOV1dkGqp8jJ6jRpbizsW0DzxjFb7GRvFJoJN9hc+h3ixwYZp7xoFHFWbd?=
 =?us-ascii?Q?Y8d7aY7SbSDPDVKKsuhYIAPdWg9yutHpTDlUryTCGW7eZZqQ3N4czavrICcj?=
 =?us-ascii?Q?db1CQ4HGkRMDnn+Fd9tb6PcCsA60CNJR55PyLR9e/tlT2GkxY8JD8Dw2VJOt?=
 =?us-ascii?Q?QzKDuxd2rd+4FPzzVR76Zm7/7++PyGl4yCUcLxv5qJMd1qHHfa4PLNH4rjrZ?=
 =?us-ascii?Q?01MdUT8hoH5OjK+CCMnD4Q5xbcNHpDlgSCqvFgGTkRO0+VH5ih9ronHYj7pB?=
 =?us-ascii?Q?2uzubsqxInf3+hd0DqfChkxwNbX+HaPL0XOtS3BACMQ0Jwm45aAlns0Brd3/?=
 =?us-ascii?Q?mX3ZiFfgTWfRyHqC5Yz0W4V/EwTEF5FJkU/vGmJ3zGgnPm9M1WicsRuM5PL7?=
 =?us-ascii?Q?sVQcrN9cXAdcXOsYqpaeJaRaLt2+q5FpxV7qVzJ6QVRvmtlk62zNvX1+Yw3l?=
 =?us-ascii?Q?jZe2zNsHC0Y0SFpVQaJRfav9kozxMrehny2CpavEjGdLgentJhY+Tm/93P73?=
 =?us-ascii?Q?Tw7VJlsplcrUVz0S3VONQ73uGJ80d2XEicQDjMW+bOTAReq+hwXdBjZAhMJk?=
 =?us-ascii?Q?wqblmLuv3d9YA4i8lJZANpaMMSGozcGgU9a0GrsoJQU1Y5ZAIPIdiH1S4FSX?=
 =?us-ascii?Q?wwMg47GDVfmz3hY1Mj8NagZaLRdAh94Mbe/awEDLLwZ7LRzZEKNBIUI4+FJ4?=
 =?us-ascii?Q?irgenAT/0sw3B0lgWUf4Gen0wSmDDYtljr8bBH56q6AxnCfhXWZZ2NHV9raF?=
 =?us-ascii?Q?XrhtJXf+DUCwdhAQjpdeG0aoBEuFPTgwdN373yX3UG6DKx4TGEeFgJ/t9DwT?=
 =?us-ascii?Q?EnrUX9ivQHY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RSSPsS7dQbdONI/WkZMy8t0S+rgc1ezrlER9EzpAJL3imO+YK3hWuLejijwJ?=
 =?us-ascii?Q?mUpzQuL+11apRERnFKzvxH3d4J1Uz4c+Q+XzC3vP9FHV+RoSmepJprLJeuW4?=
 =?us-ascii?Q?iVMENbKE29rdmNuUF4u57qq92/wfmKbIUgdmA58mzV8WeOp9luT89KjQ/emS?=
 =?us-ascii?Q?L92Y7u1iF5nodgBNo/xQ09SJWLNuSu1mezF3TDIlJejksaLHCJiy+o805Cvj?=
 =?us-ascii?Q?zP8jYdOFyJQFQ6MZtDCcUbRVQ1DeTH0CBiwmuWjKeO+P9RukY3NH2qMk6yks?=
 =?us-ascii?Q?51LwRj+44loZgOjoNuYfq4phCq+IUPkdBPaqOfXqeLWCm1ylELwH1ZjjFvnk?=
 =?us-ascii?Q?y5OdpG6guPjf1mUtEvQ3Mlns1E1O8BF/dbaf89VTce4UBDXacF6tg2L0Oa60?=
 =?us-ascii?Q?OxytB4Vwgq203d5ytXQcDsQcsqMbZPY5YDBzAwnuNRJDlFDpicWEIN2fBmCn?=
 =?us-ascii?Q?r7EpO9f93p6CVQpa8xynbH1nC0b8kIwV5ob8U/qW9uZPEWDZo8QThizX3eJ4?=
 =?us-ascii?Q?5inMJfaW3US+0smgGqbc89TJ4i02hlfzLQXxEvb0G3FD9VEw9/X23YorVeAu?=
 =?us-ascii?Q?imMblCdf3grkb/PSRkngS5sqdxe0NnJ9AMJcmgWRBdc5eQMHSuC9o/MJ54cO?=
 =?us-ascii?Q?SJEouy4DdO1PVDcI+2NOuwmsxFEhBIiN8X3/4nBbCOANrgn76TmV6vYvwl3f?=
 =?us-ascii?Q?q0hLRUfsTIIzR9jUM88mCHNdktHg8DMGINPbdFFu55nYmGIidCPFfuemCKao?=
 =?us-ascii?Q?tCn/Z5AmKcO4l7GNYrBVWSG2wn7sBKpjEUvN/LfU3TGawSbe0AU4llfoxgZl?=
 =?us-ascii?Q?DDvPbvyFZVtacnrlp3fqVAIeg22PksOQUObFCJCbkwG+8z9OIXvRMs7yS/q0?=
 =?us-ascii?Q?0P+xkub98XM4lhABePpJbPO9Yj1tiiNZDkB+cfQriXARz7/h0kDNQPU0YriD?=
 =?us-ascii?Q?6Ro7l3xH3FR+36TJPhVT+kndIAxUKGU/wjbEKHh5/hRkxeXXugmhMfXJae3P?=
 =?us-ascii?Q?oaU+Fce7YYWrMhbT/LTuIxvJlUL6JrXGzGe7Hw8zc3CZ4HHAlwDn7PByyktA?=
 =?us-ascii?Q?EnesZ6bgKL9tNDjpJFrVjs60rWjEIZMDbKEs+OxTDOEbfFAs6/vC6LRZINdv?=
 =?us-ascii?Q?OB+MdM7T4sqDW19h0Q/aQ5dMiJmethOlLTvrQDrU5gKrmeh/Wbka1eneWuhy?=
 =?us-ascii?Q?SnQG+sOsZzE4mdqqfwVdDlwhfXJscwUJK1UapQC3AVLbSeNN6aXDj/uh8T4F?=
 =?us-ascii?Q?ioVPMW3rmewSctHmdXFehT6p0pg7Oa4ai2CYkE3iw6qPMCWWskybA8NaittJ?=
 =?us-ascii?Q?6WzJxcMR9SnLZempQGCnwd5vZw8nHCvUrggL0jOFtvKIP/rvxTle3iRBTtXj?=
 =?us-ascii?Q?/O/se0s7gCCxpPOCLXSdwii+u5chpyY7EIwV9OT+mTNnSaEW+Srdl0T5ZQhS?=
 =?us-ascii?Q?mD9aQQzG0htutX3HwCccxNkG6HmwLyWP3eKbif1hunRaw/X+j+h2LCA1qAC3?=
 =?us-ascii?Q?qX6GzqMOKN40k7x07FBAzleyqjnT4cXOwgLg+SAQOnlsL0q2Ka3EDzccYc98?=
 =?us-ascii?Q?IK/Ih678bUUV0PLaDrHtdGpj8/SG74NstCRrUiZvSeCKtNxvLdwjmiVkAMT4?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d826ba51-6332-4a24-cfca-08ddbe279e0a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 13:59:12.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s84brywQBIesD1ItvjvnkBulvSms4x6pLic/iOrA9i51lYLOM411KcP+wEHbz0egdMD++MAlkE15PGk4lvhOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
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

On Mon, Jul 07, 2025 at 05:34:52PM -0400, Rodrigo Vivi wrote:
> On Mon, Jul 07, 2025 at 01:19:59PM -0700, Matt Atwood wrote:
> > Panther Lake has proven to be stable through testing and use.
> > 
> > Remove the force_probe requirement and enable the platform by default.
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> > Panther Lake is running internal CI for the moment, but running upstream
> > branches. Tests show all greens and work in progress to get the machines
> > approved for moving to the upstream CI.
> 
> I was happy with the internal CI views that I saw last Friday.
> And I was almost acking this patch to move it through, but it
> looks we got some regression there that is blocking fw loading.
> So, let's keep the force_probe protection in place while the issue
> is investigated and getting fixed.

I take it back. Yesterday view was not a bad, but just a delayed view
with pending runs. All the runs completed and we have a green solid view.

I'm just pushed this patch to drm-xe-next. Let's continuously monitor
this green view and get these machines to the public CI asap.

Thanks,
Rodrigo.

> 
> > 
> >  drivers/gpu/drm/xe/xe_pci.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index e9c5d3150efc..ffd6ad569b7c 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -341,7 +341,6 @@ static const struct xe_device_desc ptl_desc = {
> >  	.has_display = true,
> >  	.has_sriov = true,
> >  	.max_gt_per_tile = 2,
> > -	.require_force_probe = true,
> >  	.needs_scratch = true,
> >  };
> >  
> > -- 
> > 2.49.0
> > 
