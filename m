Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1869BC83F15
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 19:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4E10E595;
	Wed, 30 Aug 2023 19:29:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E53310E595
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693423746; x=1724959746;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tA69n3twEy/HH3FxfCTTlOhhIxZ+PwEnxGc8SI/CBko=;
 b=Y/9zsgvDKICnIjr/S8nyBYSb2GiJtMY4M9Y67y2qTRof3ItRD54zl7sB
 pOOP+qZ3lQuEsfeCPfseVdCwUlh/tc5hYU9hhb3Zd9CLEqvB1DXFjV+dF
 EjIix6aKje6xt4bzQlpODefoQ6f0k1Ho6wyv6g5E/Fv3KmiiK683cEbbD
 uonn/YA0AQKvjGLdFtmy83RGrH/N+DGxNYPIUVQ/jzMC2qIVHGHoPq4nR
 Ocelc3NPEUaNEd34SQUk8ykAoUCrkgNrjWc5zYCFMI2dTu71Agw7MTeB5
 yvYAlV8W/AfbKJnJkAXnEHZWqJz4ZNlVp93uymuSTrXAS3FTwb7uxXMvC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365936729"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="365936729"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 12:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774214214"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="774214214"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 12:29:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 12:29:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 12:29:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 12:29:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 12:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJQcqdETRHTvoU7RQWLl4/qTzNYavSPKIdJS7WF5gSCIWZoUd3PmU1VdGR3n2X+zX8n2VbJ0wIhSKCP7crKCSNzWOALgcfed121ax6MJwUJFFHdBBXnJJsMgK0fgFX7G4IR+/yxuJ338yOo/MJ2wN/RJfEkkFtz+vxyWcmmwIyPcUsE4F/sQQYssn/8d9Fhagcg2AntQ+kqijNkgPTCxxOmmRTRV4idiKsYwB4XLMTVTn2K1ALb+7raSmdUHwpgKnl0CGwxs/PKOqXtSEcanFsy7qMql0tC49NKkyW0kY7JZ+488NUq6tkM+JIsI0p1cF8Elg1gl8GS6pnVKmiQUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSBcbrz6bZh5FI8VoV6fVpVNQx8meAfVMVd1c4nsJFA=;
 b=KZPnw5l/AH5igtfiQ6P+VR3/OOMEQof/0Jk5Dq2NmvUI19hSJXK3qN7158wm2PpMDlPgvn6tX6aIe/VeYby84rWsBBGen74tUewXp2iZJgPxzR7jh/XdZCKKNdHcDpvAsZhK3qpdxp8SHi/XPZonLz0yyzJHd8tJw70EFuWz9+zbU1PXegjqFFTD2+IKRewklvQME5YBOOra4z/lluBcLeZVvBR6TSRdK2AxBTT20IJC9IKZ32S/6PdtBikE8C+AQQmr+IYyhT8RciNowwm7W5WcYvdGW5ug4cvXs2Mo68S/eV0v0kwZv4kJv/EYKiINj6xiqT2x/X8+yTA6VPvVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Wed, 30 Aug 2023 19:29:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 19:29:02 +0000
Date: Wed, 30 Aug 2023 12:28:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230830192858.GQ1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-12-matthew.auld@intel.com>
 <20230829213629.GN1529860@mdroper-desk1.amr.corp.intel.com>
 <48e3dbb9-5b1a-93c4-7c6d-ba372baf8087@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48e3dbb9-5b1a-93c4-7c6d-ba372baf8087@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f40d90-a527-4ff3-6a3a-08dba98f5d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QR+M5MfRXcXH66+w+TSiSliU6RbTnpsG1LhmGIFBw6Fu84cpCR7no5DHHMvbUHVGnSg6X82ZfSBjfnWXDpER1+sCn0uLFk2Ax6U66Da6LdNp2EJ/FkGa8H79/TJnmiSyBdI76MoXpmQCenFlRBM5kAO7LiWACdZSSctVeJjwGClKRgROJa6VyvlOi09LA6ASZnJTuuCCDcsYSZrfIE4Nu6wuKGBPyn1bFegPSeKCdiLBH6TCNhTdeE73jUc+L46umzePb8dOlo6uTT5HLtd4kxifpnRaHvCcLU2x7j20OQJ8894r1VSQt/0oaHISpKBB6SoodSbMnOd8lVgqFT3eeJ+Uc8YqrDpqEvDomRES7tc5lYe9qAWDMKAf6EA2k6oeTsidahmwwuJ/gTDWnFzgaRGssL+DunBE/qwgji7ZAeG0pU2JcUW97m1lf0qNCcOw23tZSWfPLI5bBaf3eid2g6jXoSuPDEJZqIUfOmaYDQb248ZBtY0iXOZcvTZIbHeE93IqygeHjtV5zApHiKFuIfHmurlGgNCG2uDOjgkV2q+szB+3BN8qYAbhv/s6AJ7i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(1800799009)(451199024)(186009)(6512007)(6666004)(6486002)(6506007)(1076003)(86362001)(33656002)(38100700002)(82960400001)(478600001)(30864003)(83380400001)(53546011)(26005)(4326008)(8936002)(54906003)(5660300002)(66946007)(66476007)(2906002)(66574015)(41300700001)(66556008)(6916009)(316002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0VrCenmxd5G4ybMh+8G58aeji5679NczKX2dwkATRw/l6lZQLdNRz5j28b?=
 =?iso-8859-1?Q?YPnuoX2fRDLuWfm7NBE/UQ54vv5A5ktciHP039f4vfV5Q5FsYRJG4Ikx8l?=
 =?iso-8859-1?Q?fSY/hPYrzi4qVxp1TqE/UMiSZjLOpemZP2Im11lHeWIY1/ood3L6RRuNhN?=
 =?iso-8859-1?Q?o8w8JT4r8YvhbSwK4XKy0xzErfqe/W+13MZNoyOUM7uLHpXeFT6YcqRl6j?=
 =?iso-8859-1?Q?5SicAgjKGc9pqtSa7sl4lZ2UHZXzgY4vd4vq0nOTGKTtQq1BA6/e0Wh0rz?=
 =?iso-8859-1?Q?VA6xW21k1K4HwL/bdWLXmEFS2gkqkdEjrURBvT4de5a7FGdnV7pRGlmOPs?=
 =?iso-8859-1?Q?+UsPkBwSkBB7lcZOGZNqO9+ABEYng9Fq6mirZB6DwBRjTz5vcjQDcnsI3M?=
 =?iso-8859-1?Q?nVB7rS32IPb/1xHZSUA/RFoU47bqlbPp5n619TqJtdgcAdw5pbIGCbDWb5?=
 =?iso-8859-1?Q?ZqWlQvLHIlNLIZGKNvfrEMDmfqfr7SCrjxq4JFVwCCaYxcKrJVa6w1OctO?=
 =?iso-8859-1?Q?SwQvosCefAFzPZpY46vcbXKFY3B2kg4zSSx36hidIM8en+a9/g7epTvFkH?=
 =?iso-8859-1?Q?UPWzwIcZwZun//TV2iMo08qV+hcj1WhB/zt43Xb3cZ6pgwchRm/GJXWd2y?=
 =?iso-8859-1?Q?tf0vjC59SiISUZesl/4uddjuDeKAk7Iizmh7rvD6zRPICaZlgPhnNBIa44?=
 =?iso-8859-1?Q?rvyIfxYLiYho9VfvtgbqFNO5V2uTNHPOWNaDXd3v5xLEiONFBj7uxLT9Gt?=
 =?iso-8859-1?Q?929aflSsyJnJkaPQv8VLE+rfe+qE6at5ITz6/B46TIeeeOmmN+4mq+Ry3e?=
 =?iso-8859-1?Q?uWoeSdnqIX3qmThF5cHX0Vv3sS4W7eSUJBllOlZHikrg51+PXxgg8RnwHu?=
 =?iso-8859-1?Q?VZndfGSmWUygwdvzWYScQq6hSrRriah2lUg139VLMLauf6PIxQzepzNrRR?=
 =?iso-8859-1?Q?v3iEjH1wsgAz59zq4ejPDwS21MUxd8+NfyryMcDuuLx3IdOOeFQg1xCbGu?=
 =?iso-8859-1?Q?yM2eVvha7V9nOGUtNib8pS+NoE0SlW4X60Mp7Qjs6cEY8/j4hB1WfJUUN1?=
 =?iso-8859-1?Q?grovBeY9hinbk9b0bK3Elz/tYdw5WnP41SWIHe03nTGBfYEaeXGFcbmAmO?=
 =?iso-8859-1?Q?7SlQwjT6IyAYsPFs1IOxvwCOmsFH0/3q/h0GJGwwr94Pt60vzRgrcyj8fo?=
 =?iso-8859-1?Q?XFoFwHSIRJhiXIbsg1wA0+K8NHn9faw2glH0PbDTiFK5kf+BTqn5xBw90r?=
 =?iso-8859-1?Q?7axRQnACFPbJzr/2/98ZOJJDPMCakXePlZFTWOK4neRGoRgYd/UGpAJ58z?=
 =?iso-8859-1?Q?dGHzCA3PAhq8y0fjOA4aC17pZz4ix76nC2KPvqGgHO9LLPWFmI2DhRD31c?=
 =?iso-8859-1?Q?CoLAw4tNqe4+zWclw/BHDy4l46YpxLF/R45CQ2D1393+RHtONQfdHaxDFn?=
 =?iso-8859-1?Q?4lHKk5gz4wQxVdhSbOK5IuPfreYJe9SDWfxzJPj8RBB9SXgKXMlxH9Qq7s?=
 =?iso-8859-1?Q?TcqT0hlGtCvr7V52IsrmFHRUg1oFtPN8dSlloe9TeWf+gzUXFhD8PJRfXt?=
 =?iso-8859-1?Q?s2I3VZS2TMh2R2Ei6UZYaQqjhndgxXQav/qrB3vcIsdJ8Cs27jQ2mSvsNY?=
 =?iso-8859-1?Q?OWS8nkHQcQQCXOQXc1WHgVKWKtGQfmKY9woDDth4WMRIlJS00MJoYlTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f40d90-a527-4ff3-6a3a-08dba98f5d6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 19:29:01.9141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPFyJZ9M6siBLXhZsef4piUi4uiCzngHlpEJUL9TEKfko3JXhBno4F+0eyUEtr6rOqFOWIQ4aYGrnTdDExl77d/dVHbAIwaB2cA//46rIdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6889
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 5/5] drm/xe/uapi: support pat_index selection
 with vm_bind
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 08:38:13AM +0200, Thomas Hellström wrote:
> 
> On 8/29/23 23:36, Matt Roper wrote:
> > On Tue, Aug 29, 2023 at 05:28:46PM +0100, Matthew Auld wrote:
> > > Allow userspace to directly control the pat_index for a given vm
> > > binding. This should allow directly controlling the coherency, caching
> > > and potentially other stuff in the future for the ppGTT binding.
> > > 
> > > The exact meaning behind the pat_index is very platform specific (see
> > > BSpec or PRMs) but effectively maps to some predefined memory
> > > attributes. From the KMD pov we only care about the coherency that is
> > > provided by the pat_index, which falls into either NONE, 1WAY or 2WAY.
> > > The vm_bind coherency mode for the given pat_index needs to match the
> > > given coh_mode that was set at object creation. For platforms that lack
> > Is it actually important to match the coherency mode?  I think one of
> > the main goals was to know up front if userspace might be using a
> > non-snooping PAT setting that would let it bypass the CPU cache (and
> > potentially read old, stale data from a different process if the
> > buffer's clear value is still sitting in cache and hasn't landed in
> > memory yet).
> > 
> > If that's the only concern, then I think it should still be fine to map
> > with a non-matching PAT as long as it's more coherent than the one
> > specified at creation, right?  E.g., if the buffer was created with
> > 1-way coherency, it would be fine to map it with 2-way because userspace
> > still can't use that to observe the previous contents of the buffer.  Or
> > if the buffer was created with "non-coherent" then we've already done
> > the necessary clflushing in kernel before handing to buffer over to
> > userspace to ensure the clear value landed in memory, so any valid PAT
> > index should be safe (from a security POV) after that, right?  Any other
> > problems that arise from mismatched coherency would just be contained to
> > the app possibly shooting itself in the foot, which isn't really our
> > concern.
> 
> We also have shrinking to keep in mind: If content was generated by the GPU
> using 2-way coherency, and then a copy from the backing page is done with
> the page mapped WC, wouldn't that blow up? I think requiring consistency

My understanding (which could easily be wrong since this isn't an area
I've done much work in) is that on dGPU and non-LLC igpu (MTL):
 - A GPU update done with a 1-way coherent PAT setting will invalidate
   the CPU cache.  Any type of CPU mapping should read the correct
   content at that point, as long as the GPU's caches have been flushed.
 - A GPU update done with a non-coherent PAT setting won't invalidate
   the CPU cache, so CPU reads will need to be CPU:UC or CPU:WC to read
   the latest content from memory (assuming the GPU caches were
   flushed and/or the update bypassed the GPU caches).
 - 2-way coherency isn't actually supported (even though there's a PAT
   index labelled as 2-way on the MTL table, it's misleading and still
   behaves as 1-way for everything except atomic operations).  Maybe
   this changes on LNL; I don't remember off the top of my head right
   now.

I believe we always take care of the necessary GPU flushing
(PIPE_CONTROL or MI_FLUSH_DW) as part of our post-bb handling, so it
seems to me like using a CPU:WC mapping would always be safe on these
platforms, regardless of which PAT setting is selected at vm_bind.

I'm less sure about the exact semantics of the older LLC platforms; it's
a bit hard to find the details for that in the bspec.  But I'm not sure
the PAT really matters much at all on those platforms since the
important cache behavior was mostly defined in the MOCS on those
platforms, and the MOCS would usually override the PAT in cases where
there was overlap.  No matter what vm_bind PAT is chosen, the CPU
handling needs to be conservative enough to work properly no matter what
the MOCS might have done.

> here is reasonable also keeping unforeseen side-effects of future HW in
> mind. Or do you see it as blocking an important use-case?

I don't know of any specific use cases; the userspace guys would
probably have a much better feel for that.  I think the current proposal
here at least avoids the biggest problems we had in the past with i915
(where 3D/media content generation into a buffer needed very different
cache behavior [in the PPGTT] than the display scanout wanted [in the
GGTT] since the two now remain unrelated).

I suppose even if we don't need to be so strict about restricting the
vm_bind-time PAT selection, it doesn't hurt anything as long as the
userspace guys can live with it.  We can always loosen the restrictions
down the road if/when we find it necessary.


Matt

> 
> Thanks,
> 
> Thomas
> 
> 
> > 
> > 
> > > the explicit coherency mode, we treat UC/WT/WC as NONE and WB as 2WAY.
> > > 
> > > For userptr mappings we lack a corresponding gem object, so the expected
> > > coherency mode is instead implicit and must fall into either 1WAY or
> > > 2WAY. Trying to use NONE will be rejected by the kernel. For imported
> > > dma-buf (from a different device) the coherency mode is also implicit
> > > and must also be either 1WAY or 2WAY.
> > > 
> > > As part of adding pat_index support with vm_bind we also need stop using
> > > xe_cache_level and instead use the pat_index in various places. We still
> > > make use of xe_cache_level, but only as a convenience for kernel
> > > internal objectsi (internally it maps to some reasonable pat_index). For
> > Maybe we should kill xe_cache_level completely and just assign
> > xe_gt->pat_cached / xe_gt->pat_uncached at init that can be used in
> > appropriate places, similar to what we do with MOCS (gt->mocs.uc_index,
> > gt->mocs.wb_index)?
> > 
> > > now this is just a 1:1 conversion of the existing code, however for
> > > platforms like MTL+ we might need to give more control through bo_create
> > > or stop using WB on the CPU side if we need CPU access.
> > > 
> > > Bspec: 45101, 44235 #xe
> > > Bspec: 70552, 71582, 59400 #xe2
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > Cc: Filip Hazubski <filip.hazubski@intel.com>
> > > Cc: Carl Zhang <carl.zhang@intel.com>
> > > Cc: Effie Yu <effie.yu@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gtt.h   |  2 +-
> > >   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
> > >   drivers/gpu/drm/xe/xe_ggtt.c          |  7 ++-
> > >   drivers/gpu/drm/xe/xe_ggtt_types.h    |  2 +-
> > >   drivers/gpu/drm/xe/xe_migrate.c       | 14 ++---
> > >   drivers/gpu/drm/xe/xe_pt.c            | 32 +++++-------
> > >   drivers/gpu/drm/xe/xe_pt.h            |  6 +--
> > >   drivers/gpu/drm/xe/xe_vm.c            | 73 +++++++++++++++++++++------
> > >   drivers/gpu/drm/xe/xe_vm_types.h      | 13 +++--
> > >   include/uapi/drm/xe_drm.h             | 41 ++++++++++++++-
> > >   10 files changed, 134 insertions(+), 58 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > > index 4d6296cdbcfd..bb4c182048c3 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > > @@ -302,7 +302,7 @@ struct i915_address_space {
> > >   		(*alloc_scratch_dma)(struct i915_address_space *vm, int sz);
> > >   	u64 (*pte_encode)(dma_addr_t addr,
> > > -			  unsigned int pat_index,
> > > +			  u32 pat_index,
> > >   			  u32 flags); /* Create a valid PTE */
> > >   #define PTE_READ_ONLY	BIT(0)
> > >   #define PTE_LM		BIT(1)
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > index 5c8d5e78d9bc..7a128fd20a29 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> > >   	/* First part of the test, are we updating our pagetable bo with a new entry? */
> > >   	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
> > >   		  0xdeaddeadbeefbeef);
> > > -	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
> > > +	expected = xe_pte_encode(pt, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
> > >   	if (m->q->vm->flags & XE_VM_FLAG_64K)
> > >   		expected |= XE_PTE_PS64;
> > >   	if (xe_bo_is_vram(pt))
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index 209fa053d9fb..4134c26150a5 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -41,7 +41,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
> > >   		pte |= XE_GGTT_PTE_DM;
> > >   	if ((ggtt->pat_encode).pte_encode)
> > > -		pte = (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_WB_1_WAY);
> > > +		pte = (ggtt->pat_encode).pte_encode(xe, pte,
> > > +						    xe_pat_get_index(xe, XE_CACHE_WB_1_WAY));
> > >   	return pte;
> > >   }
> > > @@ -102,10 +103,8 @@ static void primelockdep(struct xe_ggtt *ggtt)
> > >   }
> > >   static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> > > -						enum xe_cache_level cache)
> > > +				     u32 pat_index)
> > >   {
> > > -	u32 pat_index = xe_pat_get_index(xe, cache);
> > > -
> > >   	pte_pat &= ~(XELPG_GGTT_PTE_PAT_MASK);
> > >   	if (pat_index & BIT(0))
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > > index 7e55fac1a8a9..0bc40cb072e3 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > > @@ -31,7 +31,7 @@ struct xe_ggtt {
> > >   	struct {
> > >   		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> > > -						enum xe_cache_level cache);
> > > +				  u32 pat_index);
> > >   	} pat_encode;
> > >   };
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index a782ea282cb6..54585e98452a 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -24,6 +24,7 @@
> > >   #include "xe_lrc.h"
> > >   #include "xe_map.h"
> > >   #include "xe_mocs.h"
> > > +#include "xe_pat.h"
> > >   #include "xe_pt.h"
> > >   #include "xe_res_cursor.h"
> > >   #include "xe_sched_job.h"
> > > @@ -162,6 +163,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> > >   	u32 map_ofs, level, i;
> > >   	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> > > +	u32 pat_index = xe_pat_get_index(xe, XE_CACHE_WB);
> > >   	u64 entry;
> > >   	int ret;
> > > @@ -189,14 +191,14 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   		return ret;
> > >   	}
> > > -	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
> > > +	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, pat_index);
> > >   	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> > >   	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
> > >   	/* Map the entire BO in our level 0 pt */
> > >   	for (i = 0, level = 0; i < num_entries; level++) {
> > > -		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
> > > +		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, pat_index, 0);
> > >   		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
> > > @@ -214,7 +216,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   		for (i = 0; i < batch->size;
> > >   		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
> > >   		     XE_PAGE_SIZE) {
> > > -			entry = xe_pte_encode(batch, i, XE_CACHE_WB, 0);
> > > +			entry = xe_pte_encode(batch, i, pat_index, 0);
> > >   			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
> > >   				  entry);
> > > @@ -239,7 +241,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   			flags = XE_PDE_64K;
> > >   		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
> > > -					XE_PAGE_SIZE, XE_CACHE_WB);
> > > +					XE_PAGE_SIZE, pat_index);
> > >   		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
> > >   			  entry | flags);
> > >   	}
> > > @@ -247,7 +249,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   	/* Write PDE's that point to our BO. */
> > >   	for (i = 0; i < num_entries - num_level; i++) {
> > >   		entry = xe_pde_encode(bo, i * XE_PAGE_SIZE,
> > > -				      XE_CACHE_WB);
> > > +				      pat_index);
> > >   		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
> > >   			  (i + 1) * 8, u64, entry);
> > > @@ -1256,7 +1258,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > >   			XE_WARN_ON(pt_bo->size != SZ_4K);
> > > -			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
> > > +			addr = xe_pte_encode(pt_bo, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
> > >   			bb->cs[bb->len++] = lower_32_bits(addr);
> > >   			bb->cs[bb->len++] = upper_32_bits(addr);
> > >   		}
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 64713f400d94..019af2920078 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -10,6 +10,7 @@
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_tlb_invalidation.h"
> > >   #include "xe_migrate.h"
> > > +#include "xe_pat.h"
> > >   #include "xe_pt_types.h"
> > >   #include "xe_pt_walk.h"
> > >   #include "xe_res_cursor.h"
> > > @@ -57,24 +58,22 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
> > >    *
> > >    * Return: An encoded page directory entry. No errors.
> > >    */
> > > -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> > > -		  const enum xe_cache_level cache)
> > > +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset, u32 pat_index)
> > >   {
> > >   	u64 pde;
> > >   	struct xe_vm *vm = bo->vm;
> > >   	struct xe_device *xe = vm->xe;
> > > -
> > >   	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> > >   	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > >   	if ((vm->pat_encode).pde_encode)
> > > -		pde = (vm->pat_encode).pde_encode(xe, pde, cache);
> > > +		pde = (vm->pat_encode).pde_encode(xe, pde, pat_index);
> > >   	return pde;
> > >   }
> > > -static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> > > +static u64 __pte_encode(u64 pte, u32 pat_index,
> > >   			struct xe_vma *vma, u32 pt_level)
> > >   {
> > >   	struct xe_vm *vm = xe_vma_vm(vma);
> > > @@ -89,7 +88,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> > >   		pte |= XE_PTE_NULL;
> > >   	if ((vm->pat_encode).pte_encode)
> > > -		pte = (vm->pat_encode).pte_encode(xe, pte, cache);
> > > +		pte = (vm->pat_encode).pte_encode(xe, pte, pat_index);
> > >   	if (pt_level == 1)
> > >   		pte |= XE_PDE_PS_2M;
> > > @@ -112,7 +111,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> > >    *
> > >    * Return: An encoded page-table entry. No errors.
> > >    */
> > > -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> > > +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, u32 pat_index,
> > >   		  u32 pt_level)
> > >   {
> > >   	u64 pte;
> > > @@ -121,7 +120,7 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> > >   	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> > >   		pte |= XE_PPGTT_PTE_DM;
> > > -	return __pte_encode(pte, cache, NULL, pt_level);
> > > +	return __pte_encode(pte, pat_index, NULL, pt_level);
> > >   }
> > >   static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> > > @@ -134,12 +133,12 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> > >   	if (level == 0) {
> > >   		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
> > > -					  XE_CACHE_WB, 0);
> > > +					  xe_pat_get_index(vm->xe, XE_CACHE_WB), 0);
> > >   		return empty;
> > >   	} else {
> > >   		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
> > > -				     XE_CACHE_WB);
> > > +				     xe_pat_get_index(vm->xe, XE_CACHE_WB));
> > >   	}
> > >   }
> > > @@ -368,8 +367,6 @@ struct xe_pt_stage_bind_walk {
> > >   	struct xe_vm *vm;
> > >   	/** @tile: The tile we're building for. */
> > >   	struct xe_tile *tile;
> > > -	/** @cache: Desired cache level for the ptes */
> > > -	enum xe_cache_level cache;
> > >   	/** @default_pte: PTE flag only template. No address is associated */
> > >   	u64 default_pte;
> > >   	/** @dma_offset: DMA offset to add to the PTE. */
> > > @@ -604,7 +601,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> > >   		pte = __pte_encode(is_null ? 0 :
> > >   				   xe_res_dma(curs) + xe_walk->dma_offset,
> > > -				   xe_walk->cache, xe_walk->vma, level);
> > > +				   xe_walk->vma->pat_index, xe_walk->vma, level);
> > >   		pte |= xe_walk->default_pte;
> > >   		/*
> > > @@ -669,7 +666,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> > >   			xe_child->is_compact = true;
> > >   		}
> > > -		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
> > > +		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->vma->pat_index) | flags;
> > >   		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
> > >   					 pte);
> > >   	}
> > > @@ -730,13 +727,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > >   		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
> > >   			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> > >   		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> > > -		xe_walk.cache = XE_CACHE_WB;
> > > -	} else {
> > > -		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> > > -			xe_walk.cache = XE_CACHE_WT;
> > > -		else
> > > -			xe_walk.cache = XE_CACHE_WB;
> > >   	}
> > > +
> > >   	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> > >   		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > > index 01be7ab08f87..1d433a5a96b4 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > > @@ -45,10 +45,8 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
> > >   bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> > > -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> > > -		  const enum xe_cache_level level);
> > > +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset, u32 pat_index);
> > > -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> > > -		  u32 pt_level);
> > > +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, u32 pat_index, u32 pt_level);
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 7eeeed0411f3..34603a7e84b0 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -6,6 +6,7 @@
> > >   #include "xe_vm.h"
> > >   #include <linux/dma-fence-array.h>
> > > +#include <linux/nospec.h>
> > >   #include <drm/drm_print.h>
> > >   #include <drm/ttm/ttm_execbuf_util.h>
> > > @@ -874,7 +875,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> > >   				    u64 start, u64 end,
> > >   				    bool read_only,
> > >   				    bool is_null,
> > > -				    u8 tile_mask)
> > > +				    u8 tile_mask,
> > > +				    u32 pat_index)
> > >   {
> > >   	struct xe_vma *vma;
> > >   	struct xe_tile *tile;
> > > @@ -913,6 +915,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> > >   			vma->tile_mask |= 0x1 << id;
> > >   	}
> > > +	vma->pat_index = pat_index;
> > > +
> > >   	if (vm->xe->info.platform == XE_PVC)
> > >   		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
> > > @@ -1194,10 +1198,8 @@ static void xe_vma_op_work_func(struct work_struct *w);
> > >   static void vm_destroy_work_func(struct work_struct *w);
> > >   static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat,
> > > -						enum xe_cache_level cache)
> > > +				     u32 pat_index)
> > >   {
> > > -	u32 pat_index = xe_pat_get_index(xe, cache);
> > > -
> > >   	pde_pat &= ~(XELP_PDE_PAT_MASK);
> > >   	if (pat_index & BIT(0))
> > > @@ -1213,10 +1215,8 @@ static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat,
> > >   }
> > >   static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> > > -						enum xe_cache_level cache)
> > > +				     u32 pat_index)
> > >   {
> > > -	u32 pat_index = xe_pat_get_index(xe, cache);
> > > -
> > >   	pte_pat &= ~(XELP_PTE_PAT_MASK);
> > >   	if (pat_index & BIT(0))
> > > @@ -1622,7 +1622,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
> > >   u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
> > >   {
> > >   	return xe_pde_encode(vm->pt_root[tile->id]->bo, 0,
> > > -			     XE_CACHE_WB);
> > > +			     xe_pat_get_index(vm->xe, XE_CACHE_WB));
> > >   }
> > >   static struct dma_fence *
> > > @@ -2311,7 +2311,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
> > >   static struct drm_gpuva_ops *
> > >   vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >   			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> > > -			 u32 operation, u8 tile_mask, u32 region)
> > > +			 u32 operation, u8 tile_mask, u32 region, u32 pat_index)
> > >   {
> > >   	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> > >   	struct ww_acquire_ctx ww;
> > > @@ -2339,6 +2339,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >   			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > >   			op->tile_mask = tile_mask;
> > > +			op->pat_index = pat_index;
> > >   			op->map.immediate =
> > >   				operation & XE_VM_BIND_FLAG_IMMEDIATE;
> > >   			op->map.read_only =
> > > @@ -2366,6 +2367,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >   			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > >   			op->tile_mask = tile_mask;
> > > +			op->pat_index = pat_index;
> > >   			op->prefetch.region = region;
> > >   		}
> > >   		break;
> > > @@ -2408,7 +2410,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >   }
> > >   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > > -			      u8 tile_mask, bool read_only, bool is_null)
> > > +			      u8 tile_mask, bool read_only, bool is_null,
> > > +			      u32 pat_index)
> > >   {
> > >   	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> > >   	struct xe_vma *vma;
> > > @@ -2425,7 +2428,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > >   	vma = xe_vma_create(vm, bo, op->gem.offset,
> > >   			    op->va.addr, op->va.addr +
> > >   			    op->va.range - 1, read_only, is_null,
> > > -			    tile_mask);
> > > +			    tile_mask, pat_index);
> > >   	if (bo)
> > >   		xe_bo_unlock(bo, &ww);
> > > @@ -2539,7 +2542,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > >   				vma = new_vma(vm, &op->base.map,
> > >   					      op->tile_mask, op->map.read_only,
> > > -					      op->map.is_null);
> > > +					      op->map.is_null, op->pat_index);
> > >   				if (IS_ERR(vma)) {
> > >   					err = PTR_ERR(vma);
> > >   					goto free_fence;
> > > @@ -2567,7 +2570,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > >   					vma = new_vma(vm, op->base.remap.prev,
> > >   						      op->tile_mask, read_only,
> > > -						      is_null);
> > > +						      is_null, op->pat_index);
> > >   					if (IS_ERR(vma)) {
> > >   						err = PTR_ERR(vma);
> > >   						goto free_fence;
> > > @@ -2603,7 +2606,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > >   					vma = new_vma(vm, op->base.remap.next,
> > >   						      op->tile_mask, read_only,
> > > -						      is_null);
> > > +						      is_null, op->pat_index);
> > >   					if (IS_ERR(vma)) {
> > >   						err = PTR_ERR(vma);
> > >   						goto free_fence;
> > > @@ -3158,8 +3161,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > >   		u32 obj = (*bind_ops)[i].obj;
> > >   		u64 obj_offset = (*bind_ops)[i].obj_offset;
> > >   		u32 region = (*bind_ops)[i].region;
> > > +		u32 pat_index = (*bind_ops)[i].pat_index;
> > >   		bool is_null = op & XE_VM_BIND_FLAG_NULL;
> > > +		if (XE_IOCTL_DBG(xe, pat_index >= xe->info.pat_table_n_entries)) {
> > > +			err = -EINVAL;
> > > +			goto free_bind_ops;
> > > +		}
> > > +
> > >   		if (i == 0) {
> > >   			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> > >   		} else if (XE_IOCTL_DBG(xe, !*async) ||
> > > @@ -3346,8 +3355,25 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		struct drm_gem_object *gem_obj;
> > >   		u64 range = bind_ops[i].range;
> > >   		u64 addr = bind_ops[i].addr;
> > > +		u32 op = bind_ops[i].op;
> > >   		u32 obj = bind_ops[i].obj;
> > >   		u64 obj_offset = bind_ops[i].obj_offset;
> > > +		u32 pat_index = bind_ops[i].pat_index;
> > > +		u16 coh_mode;
> > > +
> > > +		pat_index = array_index_nospec(pat_index,
> > > +					       xe->info.pat_table_n_entries);
> > > +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> > > +		if (XE_IOCTL_DBG(xe, !coh_mode)) {
> > Assuming we drop the unusable entries from the TGL table, this should be
> > impossible, right?  Any index that makes it past the n_entries check at
> > the top of the function should have a valid, non-zero coh_mode value.
> > So this should probably be an assertion (to highlight a KMD bug) rather
> > than just a silent uapi failure return.
> > 
> > > +			err = -EINVAL;
> > > +			goto put_obj;
> > > +		}
> > > +
> > > +		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR &&
> > > +				 coh_mode == XE_GEM_COHERENCY_NONE)) {
> > > +			err = -EINVAL;
> > > +			goto put_obj;
> > > +		}
> > >   		if (!obj)
> > >   			continue;
> > > @@ -3375,6 +3401,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   				goto put_obj;
> > >   			}
> > >   		}
> > > +
> > > +		if (bos[i]->coh_mode) {
> > > +			if (XE_IOCTL_DBG(xe, bos[i]->coh_mode != coh_mode)) {
> > > +				err = -EINVAL;
> > > +				goto put_obj;
> > > +			}
> > > +		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_GEM_COHERENCY_NONE)) {
> > > +			/*
> > > +			 * Imported dma-buf from a different device should
> > > +			 * require 1way or 2way coherency since we don't know
> > > +			 * how it was mapped on CPU. Just assume is it
> > > +			 * potentially cached on CPU side.
> > > +			 */
> > > +			err = -EINVAL;
> > > +			goto put_obj;
> > > +		}
> > >   	}
> > >   	if (args->num_syncs) {
> > > @@ -3412,10 +3454,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		u64 obj_offset = bind_ops[i].obj_offset;
> > >   		u8 tile_mask = bind_ops[i].tile_mask;
> > >   		u32 region = bind_ops[i].region;
> > > +		u32 pat_index = bind_ops[i].pat_index;
> > >   		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> > >   						  addr, range, op, tile_mask,
> > > -						  region);
> > > +						  region, pat_index);
> > >   		if (IS_ERR(ops[i])) {
> > >   			err = PTR_ERR(ops[i]);
> > >   			ops[i] = NULL;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 83a1f87b6537..508679ed3c74 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -111,6 +111,11 @@ struct xe_vma {
> > >   	 */
> > >   	u8 tile_present;
> > > +	/**
> > > +	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> > > +	 */
> > > +	u32 pat_index;
> > > +
> > >   	struct {
> > >   		struct list_head rebind_link;
> > >   	} notifier;
> > > @@ -338,10 +343,8 @@ struct xe_vm {
> > >   	bool batch_invalidate_tlb;
> > >   	struct {
> > > -		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> > > -						enum xe_cache_level cache);
> > > -		u64 (*pde_encode)(struct xe_device *xe, u64 pde_pat,
> > > -						enum xe_cache_level cache);
> > > +		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat, u32 pat_index);
> > > +		u64 (*pde_encode)(struct xe_device *xe, u64 pde_pat, u32 pat_index);
> > >   	} pat_encode;
> > >   };
> > > @@ -417,6 +420,8 @@ struct xe_vma_op {
> > >   	struct async_op_fence *fence;
> > >   	/** @tile_mask: gt mask for this operation */
> > >   	u8 tile_mask;
> > > +	/** @pat_index: The pat index to use for this operation. */
> > > +	u32 pat_index;
> > >   	/** @flags: operation flags */
> > >   	enum xe_vma_op_flags flags;
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 64bc66d4b550..0c15b6f32447 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -600,8 +600,45 @@ struct drm_xe_vm_bind_op {
> > >   	 */
> > >   	__u32 obj;
> > > -	/** @pad: MBZ */
> > > -	__u32 pad;
> > > +	/**
> > > +	 * @pat_index: The platform defined @pat_index to use for this mapping.
> > > +	 * The index basically maps to some predefined memory attributes,
> > > +	 * including things like caching, coherency and likely other stuff in
> > > +	 * the future.  The exact meaning of the pat_index is platform specific
> > BTW, "other stuff in the future" already includes compression on Xe2, we
> > just haven't landed the patches for the Xe2 table yet.
> > 
> > > +	 * and defined in the Bspec and PRMs.  When the KMD sets up the binding
> > > +	 * the index here is encoded into the ppGTT PTE.
> > > +	 *
> > > +	 * For coherency the @pat_index needs to match the
> > > +	 * drm_xe_gem_create.coh_mode, so either XE_GEM_COHERENCY_NONE,
> > > +	 * XE_GEM_COHERENCY_1WAY or XE_GEM_COHERENCY_2WAY. The KMD will extract
> > > +	 * the coherency mode from the @pat_index and reject if there is a
> > > +	 * mismatch (see note below for pre-MTL platforms).
> > > +	 *
> > > +	 * Note: On pre-MTL platforms there is only a caching mode and no
> > > +	 * explicit coherency mode, but on such hardware there is always a
> > > +	 * shared-LLC (or is dgpu) so all GT memory accesses are coherent with
> > > +	 * CPU caches even with the caching mode set as uncached.  It's only the
> > > +	 * display engine that is incoherent (on dgpu it must be in VRAM which
> > > +	 * is always mapped as WC on the CPU). However to keep the uapi somewhat
> > > +	 * consistent with newer platforms the KMD groups the different cache
> > > +	 * levels into the following coherency buckets on all pre-MTL platforms:
> > > +	 *
> > > +	 *	ppGTT UC -> XE_GEM_COHERENCY_NONE
> > > +	 *	ppGTT WC -> XE_GEM_COHERENCY_NONE
> > > +	 *	ppGTT WT -> XE_GEM_COHERENCY_NONE
> > > +	 *	ppGTT WB -> XE_GEM_COHERENCY_2WAY
> > As noted on the previous patch, it seems like 2-way is appropriate for
> > LLC platforms, but 1-way might be a more accurate description of dGPU
> > behavior.
> > 
> > > +	 *
> > > +	 * In practice UC/WC/WT should only ever used for scanout surfaces on
> > > +	 * such platforms since it is only the display engine that is actually
> > > +	 * incoherent. Everything else should typically use WB given that we
> > What if we're sharing our buffers with some other (non-GPU) device?  Are
> > there cases where that other device wouldn't be coherent with the LLC,
> > so we'd want to use one of these?
> > 
> > 
> > Matt
> > 
> > > +	 * have a shared-LLC.  On MTL+ this completely changes (also potentially
> > > +	 * no shared-LLC) and the HW defines the coherency mode as part of the
> > > +	 * @pat_index.
> > > +	 *
> > > +	 * Note: For userptr and externally imported dma-buf the kernel expects
> > > +	 * either 1WAY or 2WAY for the @pat_index.
> > > +	 */
> > > +	__u32 pat_index;
> > >   	union {
> > >   		/**
> > > -- 
> > > 2.41.0
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
