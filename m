Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA69EEB572
	for <intel-xe@archiver.kernel.org>; Sat,  9 Sep 2023 15:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8E10E13D;
	Sat,  9 Sep 2023 15:22:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12A610E13D
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Sep 2023 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694272930; x=1725808930;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3jeGXfwQ+y4Wh5HSj6NmtLO5SB2MiNzccSGhSKCwyRk=;
 b=fhBF/Q+yg5xK0px4QA2aF7Tc06auRk1+IzwevFSTHPazEx2VIpK4cEMX
 W1Ll+KC/Lp8nfTuPJhLfiO3UEd9Mu0L1r9nNkv6u6E76xAgUsyCy9Q5uH
 ySB1ECIV6mRRA/pj6EYmGZbznl6wa97r/CydrWj+waZT4Ibsjqx5aS14Y
 JjY7eoM+ThitdPI8WRImTQBdNDBJ2ul049FPyLi3qim4SZOOQgkotXh5p
 opAXIArM2EhEsHkWHNCudFvIrnXVSO3c7+Thm1+e0WgCnQA2TvWvr+4q0
 H5ouqL8IjRh0Pz2rXgC3FcaAsRqeSk6eTt7hQTS7AC9peoCh/M9TUf0EG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380553801"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="380553801"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 08:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692576496"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="692576496"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2023 08:22:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 9 Sep 2023 08:22:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 9 Sep 2023 08:22:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 9 Sep 2023 08:22:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 9 Sep 2023 08:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beOBcL7y5rvzK2lVy1laGxfUddKQRUzjLG4louY0zDJL1LfOZ/Y6d7eguPWcm7Lb1qWwLyaaXxLFrAQZJFn0qmVENqdV0tMUeS1Ni3zkhkrHZzRl4Zo6uOWrgTkqJVSLemA5v9subffSGlbgL2VOb0KsAUuEJRZj1NtuxGM92yo0NcexWtV2QSz7S+JwK4vN/naksPVHt85sdLPHXnCa+02pyXBJiySImXIJ181SU6eDhpQrUKsNg0noa/ZqQahMJb4rRNBuAYGS/t1B50pV+7AXUooD3xNCjf6nW+QdOQtPomx9ckTadlXnaNul63QzfcVk2i2Cj24a/ixY/AR6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFKgJQ7vQA6dt1iz+ncQuY+AeA9UCu3o0TSg64kZDQE=;
 b=bNpFUgoFreA65wBXhR8gq805ySbQhkXiY0HhIEm9shh9ZMc72yXQntr2iLRoBAkJp9usINBnBUPGdcmiY3o6J1Sei6haM39z8F4VDYnSKVex/ekdhs5G6K2G2WWVYyOy7RkMz0o7rZjcaEA8veD/Mlu4nEIH5brljRMhhKUg+FNVx+vpFqYEDqzrpEueyOC/N95v4k3zFfNsMqpitq6z6CySzuMEeOHHFavXBwPR7+xLQE6S0U9qpT8eL9pXC28TQXw96smt/0XSrL0LCG4p/KK6aV3eZYI3OlYgLH7T/Gb0sNFzVkZ7vDLQYqprd4Xhp/KkUMZQCoVoN2QKNxeuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Sat, 9 Sep
 2023 15:22:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Sat, 9 Sep 2023
 15:22:04 +0000
Date: Sat, 9 Sep 2023 11:21:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZPyNl+qH+ycopGlE@intel.com>
References: <20230909052153.1669790-1-ashutosh.dixit@intel.com>
 <ZPyMCEmR+v6Hjarb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPyMCEmR+v6Hjarb@intel.com>
X-ClientProxiedBy: MW2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:907::35)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: f96cc493-41aa-4f03-73bf-08dbb1488593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNyzFpMjfMgRuNY+TG6/c8kcDIgAgZ65NLAwdkUr9CAgJ8h4S373LYHUzS/+MBhqeAzRedQpry+yAHq4A1/lq/mWmG4dekrZ2cl00CLVnfiloC8DyRSB3wY61f68LtGAl82MeOez+ctpqYUTKbVk8bFvJHPYXUF/7Ho7hFlBuAkQLVcA1BvWlo2gQ2gGuOQrVFYlf0Opvwm4/0aotvTgUBShWMpM6rPvdEZrGEBfQKFC3oYVUiOgDgE5lublQ8itvqlRGOfoPxqGoGpvI80o6oz5dj6AnsCssnf2QcZweprBoe3wLjbyJG6ePazWjMGqyMvZOJ/qc/8byLrjlk3ubUQMglhzqgqIIAjr1Yp86zUEBSjQ9ylLl27WM/bFMO+6L7V2zu0rhi/Zia0M5Km0GRN5Yd6GWWeRujeCaE6dePYlKF/DNxKFPOXO7hWT676yjCGByxgtgjPzsorQEWwPgA7R2zdEncqw3kNITLv5KNCOxchnpSYuxjHYEghvsbSqbm3Dh76H0+ZO2B4fs/t66aFW8mc4FmVc2EBgrHX6UDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(346002)(376002)(186009)(451199024)(1800799009)(6486002)(6506007)(6666004)(6512007)(966005)(478600001)(83380400001)(26005)(2616005)(2906002)(44832011)(37006003)(66476007)(66556008)(66946007)(316002)(6636002)(41300700001)(5660300002)(4326008)(6862004)(8676002)(8936002)(82960400001)(86362001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?efeHJBDkuRJLFAF3VJi7/pb3dDEpLmG/bhVVNwp5owD+zz00LJolPORI6Haq?=
 =?us-ascii?Q?96mSxtcq/P8CHPu8YER4PB2JWiGtnd241ybGq/QsBb7TWGADm+GKm6ke/xpf?=
 =?us-ascii?Q?IX9Ng4b/NyxjyaP7bAqpFlsG0Qkijvtx9RtIowsWHPPIKayZRpLlFIlv0dxi?=
 =?us-ascii?Q?vM68xaNTJFLih7Kg5pcBPg/kq/UyH+nJXIB6WgGEVawNixCjVL6MPCjkSCXc?=
 =?us-ascii?Q?oBh8lczR1NdY7VsY9BJs3ULIraRaIaesuh8fV9KBROz0UaGIGvdZr1iVLfZj?=
 =?us-ascii?Q?e+hewZIXEP9fX43Wc05+E63F65aKX34w5u5RnTux1WJ2FIhLx2RoSRn4l1vs?=
 =?us-ascii?Q?+0I0s5DmQdHbZ3dVtp93WERehywXVqG25B3ZPjEW8KoWx2l+wWNkCyecNRlT?=
 =?us-ascii?Q?hOYHmxy8c1Gw7rCRtKiQV75ykZKJTXtLQx9x4c57Pw+t+/h2BJmLuPCv5uNV?=
 =?us-ascii?Q?5euQNUsml/t3ZuZS5sA73lDpGF1eBHFewI9KTja/vxGpCr6eFA84J+nAgdYd?=
 =?us-ascii?Q?TBVyQ/1hK1jWBWreJ+Ul0KVSoQ6qBE518Qlt9eq6uIu8LB4bF8ez9hLWqmNF?=
 =?us-ascii?Q?FR9L/ARCkRsvohriZPiZKjlwFVvg7u2qk7vFOFT6I5QrbJ57XlUz+RaHbAGE?=
 =?us-ascii?Q?7f6WvhY5izzxSlf9EsPaXTKOaIyYFok4fql0frerXoZYp9COiTFXF2y8x6gy?=
 =?us-ascii?Q?kBrKSMv4jv/CjkLHdFiq0JwMua5TJYOVgCQQ/3MWiUel7YlaP7RGiSjvgBIJ?=
 =?us-ascii?Q?YDOI/Ig/ZK4wyOs7LZS2nlIVxh3R8XeJP/fhWFwUI5XU0TBaSXkGpGzzP0zl?=
 =?us-ascii?Q?r7g5+NuWlh8zDM+cdkRSw/opkm7C88kSlM8KhRNkyoebjYH1YKi9ANCcNGXg?=
 =?us-ascii?Q?MqgjI5KPOFP9nCazWNgQYQb0tjZSmSaK/l5gtp9lJWGoVsqQdQOsm2ZEvBjs?=
 =?us-ascii?Q?LCbQE/UcwZcCCEP07h+Amp703QeUnup5fNDweE4+6ymECnQb+qXBj3b8/fAp?=
 =?us-ascii?Q?TYY9d1snpcuCy7AcP0uqk/PYXehwUacpxdLcQKbenTtE12/vX58ws31oIZ/s?=
 =?us-ascii?Q?zUBNb3UkApKIsNVkLQmE6CjIFkgtWL8CdJWghICgSNmTup5Qd6ZtG6ustUCl?=
 =?us-ascii?Q?MbtgKJJtU7aZ8RNCaR2ttIhggQA0Mo9KVMNFyFRPBBFZ3+42fzw8VkGIVWRz?=
 =?us-ascii?Q?ZRm7NWU7gTt+McojPONCR0LP067DWJvm4hB11wrztqtfFG7pTBpvvWOsnx+b?=
 =?us-ascii?Q?cUZVZgpiu7RyPzhHi7HI2P/V9w23tiYw7JrFOxWi6bmtcTtj77jyQ7V4H12p?=
 =?us-ascii?Q?90l/ijnK05mkvXrBUV4cDbUC3ljs4JdBMrnGSS+L6tBa/KkfDKE37x7e8Mkb?=
 =?us-ascii?Q?nHgjs8TckFOMxzSHVQ//e7Pj3h6RsYlxFXfBNFCgKc5D+2uYSVHbXqvIw+Wy?=
 =?us-ascii?Q?gsPzJxLN48s9F0XZirLaB9OTJIm6XgqlBKZsq3+q+hL4Hb/hdXKp3/z4XZ2I?=
 =?us-ascii?Q?Q6NYXeuuimC68By8NPeqnVYBBbpDJ56zITR+D8Q0xyqp19f+IKTi2xRA5L9B?=
 =?us-ascii?Q?zE2dI0lUEXMn/Cceo1A4e2Ap1B+LtEo4jcS31alC71V1gvNPYdCeQ044rLVV?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f96cc493-41aa-4f03-73bf-08dbb1488593
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 15:22:04.2229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o16qcu0u1yfEsdCT/HZR76okVvO1SD5/gh3FyjmRNGuJ2PwCSFF5kHJRM3dS31uaFqd3cI3bmOtYqhabn8D8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Use common
 drm_xe_ext_set_property extension
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
Cc: Francois.Dugast@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Sep 09, 2023 at 11:15:20AM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 08, 2023 at 10:21:53PM -0700, Ashutosh Dixit wrote:
> > There really is no difference between 'struct drm_xe_ext_vm_set_property'
> > and 'struct drm_xe_ext_exec_queue_set_property', they are extensions which
> > specify a <property, value> pair. Replace the two extensions with a single
> > common 'struct drm_xe_ext_set_property' extension. The rationale is that
> > rather than have each XE module (including future modules) invent their own
> > property/value extensions, all XE modules use a common set_property
> > extension when possible.
> 
> What about just killing this entirely?
> https://lore.kernel.org/all/20230908203302.449041-2-rodrigo.vivi@intel.com/

hmm... or maybe what we want is a mix of your patch and mine.
Let's use yours to kill the drm_xe_ext_exec_queue_set_property
in favor of a generic drm_xe_ext_set_property
and then mine goes on top killing just the
XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS operation.

thoughts? I can integrate and carry your patch in my series if you are
okay with that.

> 
> 
> > 
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c         |  2 +-
> >  include/uapi/drm/xe_drm.h          | 20 +++-----------------
> >  3 files changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index e44d71c679cc3..fc44249f13372 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -459,7 +459,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> >  					    bool create)
> >  {
> >  	u64 __user *address = u64_to_user_ptr(extension);
> > -	struct drm_xe_ext_exec_queue_set_property ext;
> > +	struct drm_xe_ext_set_property ext;
> >  	int err;
> >  	u32 idx;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 1d9aa5c40659c..36c39589b0036 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1915,7 +1915,7 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
> >  				    u64 extension)
> >  {
> >  	u64 __user *address = u64_to_user_ptr(extension);
> > -	struct drm_xe_ext_vm_set_property ext;
> > +	struct drm_xe_ext_set_property ext;
> >  	int err;
> >  
> >  	err = __copy_from_user(&ext, address, sizeof(ext));
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 00d5cb4ef85e7..1338a64d42854 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -497,12 +497,11 @@ struct drm_xe_vm_bind_op_error_capture {
> >  	__u64 size;
> >  };
> >  
> > -/** struct drm_xe_ext_vm_set_property - VM set property extension */
> > -struct drm_xe_ext_vm_set_property {
> > +/** struct drm_xe_ext_set_property - XE set property extension */
> > +struct drm_xe_ext_set_property {
> >  	/** @base: base user extension */
> >  	struct xe_user_extension base;
> >  
> > -#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> >  	/** @property: property to set */
> >  	__u32 property;
> >  
> > @@ -518,6 +517,7 @@ struct drm_xe_ext_vm_set_property {
> >  
> >  struct drm_xe_vm_create {
> >  #define XE_VM_EXTENSION_SET_PROPERTY	0
> > +#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> >  	/** @extensions: Pointer to the first extension struct, if any */
> >  	__u64 extensions;
> >  
> > @@ -681,20 +681,6 @@ struct drm_xe_vm_bind {
> >  };
> >  
> >  /** struct drm_xe_ext_exec_queue_set_property - exec queue set property extension */
> > -struct drm_xe_ext_exec_queue_set_property {
> > -	/** @base: base user extension */
> > -	struct xe_user_extension base;
> > -
> > -	/** @property: property to set */
> > -	__u32 property;
> > -
> > -	/** @pad: MBZ */
> > -	__u32 pad;
> > -
> > -	/** @value: property value */
> > -	__u64 value;
> > -};
> > -
> >  /**
> >   * struct drm_xe_exec_queue_set_property - exec queue set property
> >   *
> > -- 
> > 2.41.0
> > 
