Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBFEC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13C310E285;
	Wed, 13 Dec 2023 18:27:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B6F10E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702492048; x=1734028048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wEVhFGvRRYUybYPdvRb5TW9qIJ5k20Ap4hv8LhUNo+4=;
 b=Rd51dzQ4nFKaqphzxHY4Fs46kqL6nOXcZnlekIAwh6A6LRt0zh6X4nyk
 g49ChgZViwVuzt35Bg8UWFxY5E7pMYXpeS70J9bztJmxI8E8P75jy+knQ
 TJRuib4cA7nYDhU8J25J2pCePeYh8CDYOIfLGHSQjx+U/E0jrCu7BQZjT
 Ar47rDPWt3Yhk9Paeg/s7liPBUTiX3dlDQMIHhXJhjvSvUU//DJfSIaOh
 3H1/cmYFoJKd2aCdclldk16sS2OV3hiamCHXjotUH2aXoBDDW6HSbUzwY
 Jr3BNa7KlKyqb2vICVIvZawZ+vIqtk7ejlsTf0QOrm0TkCCf7Lmbp+uzK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8401288"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="8401288"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1021214325"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="1021214325"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:27:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:27:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:27:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:27:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDSbbJ8aXi1GfB3x0Pr+uo5d2Tx5dVelPavJlNFOgp1GyWfi9wOkQt5/7QDmZUxsXZ3UmR1IvQt1rSEX7ns9PNfYFKawuPIUtyMUEYrHzsyB34Kp4JHnlBhwKLHG8njS/ImD2lhuSqVe2VvwebJpXa1RqFKkNu/Fws+K0ujYKvNoIVUQN0OJTXQywimQqseDa3hWyXur7Oeo6+/zr++vdWqBaWZLcZSuLeehtm7OOEoGjYDUdhZcqmZBZrHXNpezLJUGljM2cAek4odyC11u9hC9lT7NLjIGC6ckxpzNJ/Jwnk65cdmMuzp11XoCR76AcsKYXWkMDpvo1+hLgVpqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzqM1/7XsdBcIMm2fSOQwapn1FTjojgEIWPFkEKai6k=;
 b=IwwKXHL/u02TJcvGPxmYPXE7GLBJvlqy/R5clrDReSi19hxSZtrLvx0HJjsREnge+OgKP/rKZiDbu6PCBR77rvTe13Bpd0rKqk7moR/oSE9Yb5ro02eUCtH3qcNrE0e4O6LrKDURIrl6JM7BtgHbjiqEC+FkHtnQxgGVPn2i4Sw2bITMKVPjfwNjbg/k8jM1DOR4EX1pjFOirIaTbq8BkSqxSO0BodnSywm0JLOYjiNLc7YMr79mfxPKMTI2H8kYy6AMn5w7dMR4DFToyr1Z0gLhcbGwkFMKcXJeHaHCCmGltIvMqlxOMQOGTVEUH50vwcJnYwkJ2b7pBfQeXCdCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:27:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:27:19 +0000
Date: Wed, 13 Dec 2023 13:27:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [PATCH v1 07/14] drm/xe/uapi: Replace BO with GEM in documentation
Message-ID: <ZXn3hDQqyJGFkrPE@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-8-francois.dugast@intel.com>
 <CAM0jSHNbrvP2MyNmT8=n6qE1ZmJw5KA1uBer6tdsFThgKH=niQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAM0jSHNbrvP2MyNmT8=n6qE1ZmJw5KA1uBer6tdsFThgKH=niQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:74::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 488e3943-327f-479d-97b9-08dbfc092446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKS9c8RiYsHic1NUTRCzNHxEOcco50iJIS7YOZ7v+fsDK0w7OME96wyhtP3S0YRxi+maWMjoKiAN5/fMPP9snAa82HL4FBbwlctz6+e1BAozQCbD2/c4D2IqcC7pZ3ERu6d+ZrHqQNVVeW8mQTAdXSsYZLsDQk3u1rAhMkkttwja0/cs4u2vSTouqMB04wc3jNyKdLwGLKg6WsIT4dAZUIwp9m/9OynPprTPydI8I8c2nBLMELwVmnRraxhXOrD7f7iKz8IcUpQbhpNHn4eJ/FYPdXRBzTPR4h8HQGQAGP1IJtJUhmn232YYppQYHr4qws1PwHt6RmVN3ltYM0QJmReqqyI8nH2Ttlvdlfo6P2tuweWdPlVAf4SgXVPvWCP3zKUhZ+3Ia9TOXK/RO+yFCmuTxjtmbasOBRInjDzTXAwVIgQKNi9DRvcepHFKBBhlncFB9bf1nNGCh7NYzfh6S2UkdyxwGq6OUKluV2890Q70tzTneIkgj2Z1kZ6km2L4GQC7nxurpfvfcT/LWObECo71VWtgTfN3mZfxWa8q5FIl8XqoFUOyO2c83Sgo2eny
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(38100700002)(26005)(44832011)(8936002)(316002)(6916009)(8676002)(2906002)(5660300002)(4326008)(478600001)(66476007)(41300700001)(6512007)(6666004)(66946007)(6506007)(6486002)(66556008)(2616005)(82960400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRXzxlkj/s3jJyt42EogrnpLI13IFVWSTDgWLd9VwgnTzTShtSExo8C4wtR1?=
 =?us-ascii?Q?9K2yZpJ3UR+wK+p6pd1q2fLc5HisRl7tjiVSBQ+RykgyMyLidyAgCpTFAddU?=
 =?us-ascii?Q?5AgctZX1So9+V5Q8zlJ//gSfar0LdrYjKBwAtiLu9k2kyssxOi+8eJAPHhy/?=
 =?us-ascii?Q?3GqbTG9RaVBYLlcHw3tkKRNZHqtcyUX/qXbG5RC38IVSvMntkjeOH/YPuWv4?=
 =?us-ascii?Q?v3z9izrb4zug7cErlfxphQOh38iOm/wZKvlihYbrrDDtvXUiENz8ut+lXaXy?=
 =?us-ascii?Q?zqAzosp7stsazAV9RoWYRuQ9W1ZGN4nx5VV8FBts6ETzQzW5X0HfjmlXhyQH?=
 =?us-ascii?Q?RZz6gfGjKgfKWY9A7fPUvlZEYd/oG8T77QuhDBBwamGU/+24nuiakr5UNHRy?=
 =?us-ascii?Q?3k44md1+nSj0YMpW5ddzNNogUX8ly3yLkyQgGYEjSbnep+Q+esG9qSvu53+i?=
 =?us-ascii?Q?wInCVm/kLqkTmT29WHrIkJjShVruU7fHbcFcm2EpOI6QgY0wblw0zUijm1kN?=
 =?us-ascii?Q?cTyr2ejlc3dc9dxN2gQ6vz9ZH25xtqiWoddNzYXru/bZs/C6VDHwiFI1swXk?=
 =?us-ascii?Q?Bx3t0WqW3k3nO2cvJja6dx8ZnMHCzhj4Ljw42/XoncyIilwnwcs3fsnRLm3h?=
 =?us-ascii?Q?L+PE9uo0N3VoMyREZ+5OP7pHmEWi9Ioeu3qx+YUHYY/6pmBFJfLlSUxkk2OM?=
 =?us-ascii?Q?6z4sG0ZqEsY7x1hP4dtpNaaeiuzECMgyLZxhx3Lr3jIIs2OxIc3BYYZwTgnd?=
 =?us-ascii?Q?K3zPycqKujxjLRAvDwxnDZXA7B3X2J0/bo6nHrJLI2psKvmyxq+uS08A7zDq?=
 =?us-ascii?Q?HHmxm07XYjfbDUIzEWj9fLBLw3jzdUR6qRnkCHgqp7+zF62l8JiJkfEvIF6i?=
 =?us-ascii?Q?6SCecr7WspWoc3IRiC2b+7IXiSzsjwLADy6CygU0kWruO7kxG5/o4y6Fh/WF?=
 =?us-ascii?Q?FyJURM3yrSAj/GLxhQpLl2gcWyxb/GKMw3uwPmWSlxT4+51nLEn4JnIheCv1?=
 =?us-ascii?Q?bJ5vjV0JyYljvikUYji2z3HZk+Ro45CfHMVGHQm8ObguERDDT+NXPMsigTl1?=
 =?us-ascii?Q?CISlKZNHR1TsVa8ZFM+g5+fS+Ih7pcD/tLlD13dIyaoDMt8z3T6U/ZGSryen?=
 =?us-ascii?Q?jadk42WQ2MGVLqrI43Rs0IgUK14LPaNcgqPDZvtelUAiv8HdwPL2GTyx5nK8?=
 =?us-ascii?Q?m2ATnH1MDBa2ckZQg48g0kUcxARDBIunSw5H+aEC6QjQgpH3Rs0COZWu+mt+?=
 =?us-ascii?Q?sYCUA4APt/ejmK/ZoYzFY0l10i/V8TVtYdNIcVfznVCRI6KPCXGz/TJEocZU?=
 =?us-ascii?Q?h+3BUE7AP0mdbioJ7g9f7vIunAIWws8I06mRD/QIE0SHTugKO0R42Ydnx7ie?=
 =?us-ascii?Q?Hqm/2U5AX3ja7scyRCI6jbPerXQe7FZbPP2epjc0PKgOtu1XBNAI5N5CkKJM?=
 =?us-ascii?Q?qOjMyRP0M8piwbn82l3d7cvQyy84Nj+DT5UQBJH6ffNh7ffsVGOVQFXqi+fa?=
 =?us-ascii?Q?H4so+17ydNVcYxnnxmDMooTt2xJCFKDqqDRYT04SgGJXQPVniYXFKx36x8Ep?=
 =?us-ascii?Q?sFOBy6EiobbIk/gb4fYjb8vi6H5KZ/Wvt+pITbNvei0kFU6GYxPBY3zs+HmK?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 488e3943-327f-479d-97b9-08dbfc092446
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:27:19.8710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMpPIOpj+gslsTaZUP8D72/iBC7Ly+lDUWmMXW1jDpFIfXgCXhY4t2R5W+wTID7L0sNAy1umY6FE/VIqSiRcAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 02:49:08PM +0000, Matthew Auld wrote:
> On Thu, 7 Dec 2023 at 14:27, Francois Dugast <francois.dugast@intel.com> wrote:
> >
> > Align documentation with names of constants and structs, which
> > use GEM instead of BO.
> 
> AFAIK GEM means Graphics Execution Manager, which is just a memory
> management backend. Maybe "GEM BO" would be better here? IMO saying "A
> mask of memory instances of where GEM can be placed" doesn't sound
> correct.

yeap, Matt is right. The BO is placed, the GEM handle is returned.

> 
> >
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index e608a8e7dd76..f9178fe024a5 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -610,14 +610,14 @@ struct drm_xe_gem_create {
> >          */
> >         __u64 size;
> >
> > -       /** @placement: A mask of memory instances of where BO can be placed. */
> > +       /** @placement: A mask of memory instances of where GEM can be placed. */
> >         __u32 placement;
> >
> >  #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING           (1 << 0)
> >  #define DRM_XE_GEM_CREATE_FLAG_SCANOUT                 (1 << 1)
> >  #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM      (1 << 2)
> >         /**
> > -        * @flags: Flags, currently a mask of memory instances of where BO can
> > +        * @flags: Flags, currently a mask of memory instances of where GEM can
> >          * be placed
> >          */
> >         __u32 flags;
> > @@ -625,7 +625,7 @@ struct drm_xe_gem_create {
> >         /**
> >          * @vm_id: Attached VM, if any
> >          *
> > -        * If a VM is specified, this BO must:
> > +        * If a VM is specified, this GEM must:
> >          *
> >          *  1. Only ever be bound to that VM.
> >          *  2. Cannot be exported as a PRIME fd.
> > @@ -768,8 +768,8 @@ struct drm_xe_vm_destroy {
> >   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
> >   *    tables are setup with a special bit which indicates writes are
> >   *    dropped and all reads return zero. In the future, the NULL flags
> > - *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> > - *    handle MBZ, and the BO offset MBZ. This flag is intended to
> > + *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the GEM
> > + *    handle MBZ, and the GEM offset MBZ. This flag is intended to
> >   *    implement VK sparse bindings.
> >   */
> >  struct drm_xe_vm_bind_op {
> > --
> > 2.34.1
> >
