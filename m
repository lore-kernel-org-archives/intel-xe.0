Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC92EB64DA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 21:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9A610E17E;
	Wed,  5 Jul 2023 21:19:33 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B03510E17E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 21:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688591971; x=1720127971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2uTnY12+HTPrl0PoWChMTyFQA4j7hzWwdHzB9nBGPWc=;
 b=n/1o4VVnPqHWziDfhUxvCvT4BrBGKDscUYyt1phqN4HXsWo7hIreVcQX
 7ETnCBlcmZNW/pvPz3wXF5fn4yOYHNe7rwVg9KEikGuZQB9LxBCrQ9t+U
 E8FJ+mrBGF5gpzbYfmHKe6d7U5R/ZrIZRNGaBqJ0vNqSFCekzEb+vsJ5+
 E/svVbrUA0x2SblrHerxyiB2gdQaJK+xTKqrb9O1bzEW/pW/pdfuGMtcr
 BgwTO8RwNBgONdFL8hrDt2/Os5/I0bj1Lwu/wICMnPsAYva1PwYDx9zZE
 22LYztZsP9Mas/MUg0xDJV6PZnVXDxFHIWti4BI0JJVjVSzVZ61SG7LJ2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429487444"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="429487444"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 14:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="789298521"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="789298521"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 05 Jul 2023 14:19:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 14:19:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 14:19:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 14:19:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD8WH096CogEsP16n588gnYx7UkT9A95EvRaAQOWryihFhHVuvhQb4S8tPeppgnDAQEuqX7M8d9WVYTMHzDMH28OSn+8A/zsNk+bh3yCWYTDIPLlupx4KnP7TkOBR+U9oZCbjhuzL/kQfMeXLFrIOKVzMybjlgCU357n6s9LJtrR6vmsFEJ7voESoY2PVGULmdKwmVq5m9rY5ZC078LlCyASQR7D1zC2jYxDAo5NFNjuZXfGk1KgitY9XSB+1DmiNBS6dZNEinpSh6Fb7YenGI3YDetauP8OuYvytNtlrBfWmCqpZjUw8D1W4dUuNHcnKTJf8bK6RypzyFFGIJ5yEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DyKp+KSZ/ZpmT1L/UhtPf+xUdxix5wENfiHJ9Fv06Q=;
 b=YmWjlgM07/VQjTMAzsNYkE9qQeevXXNvEPkIfAgsL+uIfJO5OXnTQ9qssLbJnDQWsjaYFyX3TOuZ5hzaWmsDSA4maEdn49ZJmfmvcC3COJzKKsYHOm90vLvHgmUUSqlL/HSVdKqQ2f2Y38kN+UtX6W6b+P7N/1uFg//kgKeO26ro+D92lRe2XAa4/npphbOcaTBBFwfzI6cgzgJ2t8kxuD9TLzT3TfI7UJG2JZWF6W1M6qyPHpMmW89ow/FjiARO7hNespWas7tpA6VOtOQ1sol/oeb0Jx3aVdCzLUZ07wK+iNvFRvkbWsgWurWLt9S1HE9FjiBxmva8ZvrAeiYumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 21:19:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::e666:2e79:d3e6:67c8%7]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 21:19:27 +0000
Date: Wed, 5 Jul 2023 14:19:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <20230705211923.GP6953@mdroper-desk1.amr.corp.intel.com>
References: <20230630100059.122881-1-thomas.hellstrom@linux.intel.com>
 <87bkgw5xix.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkgw5xix.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c453e8b-a585-4d2d-ace9-08db7d9d832b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lSGWqE520P98nLkOPglm0kvXADgWtJUIMm/CBkz4D9yIdE+/ESeBrx8ee6yuCEWvW/ZdM1T6jf7ZFFiYfvm/MGy5/k8qZJFrmc6nNhsP1wE6KaA8709aoZsOitg90GYLpmmAnXFf+Mqtqp3DdZ/sNy4dO5DDBRsf8oJlzCmV+hy9KSG0pV+NWqWWsPnpKmSdWFYDEt3elq/JhrBQu8ZnhciFQ4TMJlJQu9JNQRJWYDRf0dMRgG3O8Fg26ibZBh6cNftghSUSuvzKlOKc3XH1HcMrylZEKwxd9zmmcxOzheGAkIc+S0/Z+G6wtzD1yopScj49aWjuU9DtugXGZUNDwS6Jc9BHEek3MBzovnCanURn2f7f0J3vdY/LcPqH1/wSsfKAELffYSlMc3usY/+mQPO6FPlPkFf5d2yu7EdHz3XM2d8h3rijBlbqmwUDqwPwJ56YzsnCJ7HfabvYbHvOFR0QrEi+ttE2EoZ9Av2m7T7cccc2U+w5Kbhp0V2R98kXqKDGGeLwnp6yrzP8htxV30dYGqFWRMwpQgrfm1aChKleYMFjMXt1IcbDv1sYmyvd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(186003)(8936002)(6862004)(8676002)(6506007)(26005)(1076003)(2906002)(66946007)(5660300002)(41300700001)(82960400001)(6486002)(4326008)(316002)(66574015)(6636002)(66556008)(33656002)(66476007)(83380400001)(6666004)(54906003)(6512007)(478600001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t5JrwMEf1/2Ltqtbh8+IHJ1SHzby4BtvEbUKmNyS2dft2yqhSndXhf9rue?=
 =?iso-8859-1?Q?AszqdqGhFpWnTmp6eQh2LOMUIEbAnUqnoNjW6Pa8HfUFEqjPW2TzCsivN0?=
 =?iso-8859-1?Q?4VXfWZC7d6xCgni9dORKz3ZoCyUaH8vyCMPEHDOVjTwyEy1vmgll8sI9+s?=
 =?iso-8859-1?Q?lv2IMm7ToqhxAMIvZBhio7tx5pgbtA7ecYWZ3R9Fx4ofhV5AjGR57EOGWi?=
 =?iso-8859-1?Q?uQuIsjPawzpT4huTrfTXZ1tQ13+SV4BVcjWWP9cCKQUSKp/VifI91Agjd3?=
 =?iso-8859-1?Q?p+AQo4PrAKW8EOsGrVE0PzYBx7rv/JK6D7pmsE26mM+5mnxott+gLzzaem?=
 =?iso-8859-1?Q?K9grwM53zxKUUS9YBlrGoO2O90qUgAkxD9O5khfbcRhp4IQG22O2KatRFH?=
 =?iso-8859-1?Q?X/uSXliFkx9Uyp5f/W51dsikBOPdvcluu1AmSTdlgEhMbmOVPRY6lnM2OT?=
 =?iso-8859-1?Q?g4MjLneS5SO+8ztIdGgWURUPrOhWeL4gwZILmvaONFhaYSy13coRY+TNPE?=
 =?iso-8859-1?Q?E+MO4wMMKw3ZD8LlSZyO8oirM0ms8HVJx6TrSslxEghE46kTdrA5klMv0h?=
 =?iso-8859-1?Q?GjXniOwd/L3xS+Y2b/oudxX15G3F10muh5pC7uPgeS1ukKAe0PI+SddInN?=
 =?iso-8859-1?Q?eDbOmSwIFiyHtrxOV+eqL86/ZP6arVZFirCArkI0KfZqGWbypOwmEWu5hC?=
 =?iso-8859-1?Q?8ZaX9Sc52xP/KBzRh2na0uk/mHiedFKV+u4BBnH2WqF1zcc8UVBu5Lc5X1?=
 =?iso-8859-1?Q?Ln7JCjTfp2IaiupVHhqYm84FqBVFALCfWzjl3ZgyAYmSlJnKx1lQNLuQX/?=
 =?iso-8859-1?Q?841fEbKhC28XJZDBfZpJSq3MBjE3dQbArRwnANf0ga+FZrtBBHawAlmNX0?=
 =?iso-8859-1?Q?KYN9boWWXqkqqcUEMJGYqs8pb0Yxzmuci9qEN6kQkul1VNDxjbtVeIi27g?=
 =?iso-8859-1?Q?cSn9fQI14QxlJMnz0aDhywfOpscrFkK1EFsMG3z9FS773qCNvKcGWncGPk?=
 =?iso-8859-1?Q?LZYW9OJ0XPt2IkkDE0Wfl+MU1TKcn77jgVi+J8ke+F2sopRS+bLN2HU7+e?=
 =?iso-8859-1?Q?k9dvPzZeLv+pSia7uaGKeRxPEofkcZxJJ0C12t7hWjqj2K68eNLGUcW6Qm?=
 =?iso-8859-1?Q?GgzXVz4ANVnP8ae8vC3befsPR7MhjAmf1INQrSrkW+iec1JQKgxWDmP/kp?=
 =?iso-8859-1?Q?H4cyKozjW0z0FnUSyQBVd26Yv/thrT/hJl7+VLXrmAHl+gzEVnjYzkSbXS?=
 =?iso-8859-1?Q?6AhKrF1WF9UzjT4JXz6ztdIhoilrqRBsVyw/yckUhaGQygz9Ehz5DFlHn+?=
 =?iso-8859-1?Q?nXo4l42VMO+5Kl98OOhdnWErn5JeNM0UxJnWWKab6wVNrSG3f2AwwrbrxY?=
 =?iso-8859-1?Q?3wts/WvX+OxrBt4IX8QHneu3tmBWsBpe6WArvJo5gQviHmVORP/7bBMfRP?=
 =?iso-8859-1?Q?ZosjsAyz0ukCUhy3DLRrsDYyDM8T3mmi7gCVK/U6aAxQnLob0bKt6z91Xf?=
 =?iso-8859-1?Q?JlMonkxV7EN1exsIuCAUIHDICFNZClzhZxUwZ90JRYe0uM2qOeSeRPrzKn?=
 =?iso-8859-1?Q?tHFCw2aaKunEj4b90UoAAlBrC8+njPIkwEaiNPWk6TliJc67P1zHicjGZx?=
 =?iso-8859-1?Q?dMjA8ylsr3Ll5hjH/vRUtAmDKbAuNSw+CUj27gJIuYDzrJvvyHknqEbQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c453e8b-a585-4d2d-ace9-08db7d9d832b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 21:19:27.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bC5h9IPaD/EwxBDD5B9Arw5u6Z0jTFVEXJNXEAtI/c/WbI4l0rK6/nRvwsXY6TXdv9idO2mgrfO/7J6atAXffe8SPSnfXWJPxaRFceseu8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6619
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
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
Cc: intel-xe@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 04:40:54PM -0700, Dixit, Ashutosh wrote:
> On Fri, 30 Jun 2023 03:00:59 -0700, Thomas Hellström wrote:
> >
> 
> I have a question about the toplogy query below. I am not hugely familiar
> with why/how this particular struct was chosen nor the history here, but
> anyway.
> 
> > +/**
> > + * struct drm_xe_query_topology_mask - describe the topology mask of a GT
> > + *
> > + * This is the hardware topology which reflects the internal physical
> > + * structure of the GPU.
> > + *
> > + * If a query is made with a struct drm_xe_device_query where .query
> > + * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
> > + * struct drm_xe_query_topology_mask in .data.
> > + */
> > +struct drm_xe_query_topology_mask {
> > +	/** @gt_id: GT ID the mask is associated with */
> > +	__u16 gt_id;
> > +
> > +	/*
> > +	 * To query the mask of Dual Sub Slices (DSS) available for geometry
> > +	 * operations. For example a query response containing the following
> > +	 * in mask:
> > +	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
> > +	 * means 32 DSS are available for geometry.
> > +	 */
> > +#define XE_TOPO_DSS_GEOMETRY	(1 << 0)
> > +	/*
> > +	 * To query the mask of Dual Sub Slices (DSS) available for compute
> > +	 * operations. For example a query response containing the following
> > +	 * in mask:
> > +	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
> > +	 * means 32 DSS are available for compute.
> > +	 */
> > +#define XE_TOPO_DSS_COMPUTE	(1 << 1)
> > +	/*
> > +	 * To query the mask of Execution Units (EU) available per Dual Sub
> > +	 * Slices (DSS). For example a query response containing the following
> > +	 * in mask:
> > +	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
> > +	 * means each DSS has 16 EU.
> > +	 */
> > +#define XE_TOPO_EU_PER_DSS	(1 << 2)
> > +	/** @type: type of mask */
> > +	__u16 type;
> > +
> > +	/** @num_bytes: number of bytes in requested mask */
> > +	__u32 num_bytes;
> > +
> > +	/** @mask: little-endian mask of @num_bytes */
> > +	__u8 mask[];
> > +};
> 
> So typically to consume the above struct, userspace needs additional
> information, specifically 'max_subslices' and 'max_eus_per_subslice' which
> was included in i915 'struct drm_i915_query_topology_info'.
> 
> For example to consume 'struct drm_xe_query_topology_mask' I had recently
> to write the following code in IGT because this information was not
> available through 'struct drm_xe_query_topology_mask':
> 
> 	/* Fixed fields, see fill_topology_info() and intel_sseu_set_info() in i915 */
> 	i915_topinfo.max_slices = 1;			/* always 1 */
> 	if (IS_PONTEVECCHIO(xe_dev_id(drm_fd))) {
> 		i915_topinfo.max_subslices = 64;
> 		i915_topinfo.max_eus_per_subslice = 8;
> 	} else if (intel_graphics_ver(xe_dev_id(drm_fd)) >= IP_VER(12, 50)) {
> 		i915_topinfo.max_subslices = 32;
> 		i915_topinfo.max_eus_per_subslice = 16;
> 	} else if (intel_graphics_ver(xe_dev_id(drm_fd)) >= IP_VER(12, 0)) {
> 		i915_topinfo.max_subslices = 6;
> 		i915_topinfo.max_eus_per_subslice = 16;
> 	} else {
> 		igt_assert(0);
> 	}
> 
> So, if we are going to expose 'struct drm_xe_query_topology_mask' as it is
> above through xe uapi, are we assuming that userspace has out of band
> knowledge of 'max_subslices' and 'max_eus_per_subslice'? Or should this
> information be (somehow) added to the above struct?
> 
> Another option (which sort of works but only approximately) would be to set
> 'num_bytes' field in 'struct drm_xe_query_topology_mask' to actual number
> of bytes in the mask. At present it is set unconditionally to 8 in
> query_gt_topology(), irrespective of the actual num bytes in the masks
> which is basically (again in i915 parlance):

I'm not sure what you're saying here.  num_bytes is set to the actual
size of the mask data returned; it's not hardcoded as a constant value,
although in practice it won't change very often since it's not tied to
the specific platform you're running on.

The size of the mask may be larger than the true set of possible DSS/EUs
on a given platform, but that's expected.  For example, if some platform
can only ever have a maximum of 4 DSS, but we tell userspace they're
getting 8 bytes (64 bits), that's fine since the upper bits will always
be 0 and can just be ignored.

Remember --- this API is not intended to be give information about
platform theoretical maximums (e.g., "Foobar Lake will never have more
than 23 DSS") since if userspace drivers actually need that information
it must come from the GuC's hwconfig, not from the driver code.  This
interface is exclusively about conveying the fusing information of which
units are physically present on your specific chip.


Matt

> 
> 	i915_topinfo.subslice_stride = DIV_ROUND_UP(i915_topinfo.max_subslices, 8);
> 	i915_topinfo.eu_stride = DIV_ROUND_UP(i915_topinfo.max_eus_per_subslice, 8);
> 
> If we go the 'num_bytes' route, that would be just an implementation change
> not a uapi change.
> 
> Thanks.
> --
> Ashutosh

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
