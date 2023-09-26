Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8EAE7E650
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 16:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB3810E41D;
	Tue, 26 Sep 2023 16:56:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409D410E418
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695747396; x=1727283396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sXEAX7dJassKSUpG1PYBBH/CqSp5uf7s2ZUsjRuw7us=;
 b=ZLONVg1iGQeQl7rQEzTcrjEkE24vRKLhMBwgIGNG7DPpV4FHmnBDFTms
 m5bQ8mrXE3y8/coq7t1CWZ5dOJ9m5QvHjepmIhWo7NVILDYjTt1m2eRvn
 dNiE1bqxap5oCByEI1RTtNO/Bcdh9sm+a+hqclJvucFW/n/sGdiMYHznW
 LkFX3RJNuyjVoV/5+ACJNOynj37xdEtMVcuzvK65sY+uED+vCvrMywK+q
 No9Ue9C5lC7MPWmaA8CjGBQdDYRbztyCPvFjoMAZ+FhPQgIQ6q1dtt/WH
 Y3NV0loU1bWZiTXiJcKjOiKXf8BB9wWacP517u2SPhgejvCX4C+yd418j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378894393"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378894393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778197705"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="778197705"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 09:56:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 09:56:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 09:56:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 09:56:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 09:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L15PsIvdgR3200RF7iS3g5GNMnjzXCc71VE/jq1eZv3N0LP+AzdbW4ubUCY7yNsg5wFHhNa3FElApY6B8em7TNL987uyzJy1XGTkqCy3Ln6eghrhjmG13pvWPFZG12avHPkHnJ1PtDtHdP6pKNyhLQAzHUUFbrkreXSmNNIWiYeAukyKaejoq4enl7XxZ/qxv2NKFuXRGBAAhh6bfzPWkvV5Gh9RU/DWeijyv4PEvguF9kLULLXNZBqMkNA+u/y5ZQYRtmeilGQOl5UGnUDYRlYT/2HG66NMwGdDgT8cyw0xhp3FQ0wrnXfyVSHSqcuzcBjpaiQ8legb5gD338H8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4kLVxH3QXZwy2dSXebvtuZWocWWmTBi0Z7adpBMp54=;
 b=mpQB09+8Jvnk7PtnETV7edIS6VTWHS+mENI+V0LXl60RnPkjVb25cBzh1FWI9f5FLsPpMOGB/ApdVU9Z0cLmvRE7FzvZBkFLDXBFmKCCz3AZO0fiXeq09fGxlSj7YXNkBp+K77cs3QhOlliJk4t+8T5hYK43lAa43drgAFz+yOfsSCzuiOEhkGyl8opU1WGg8AMPmBnirlDPnwBZlUUBwByVWkPKkJi2vVlEAEFDU/VcvM64BJ0W9wHYJJY/ydyx5iboN4mcPsbxR5x4EHj8hHj8TV1QkP+dnUPTvWvVvHSKOlL6LqPvm90X48s09lJQgCoX0T9ugMORAocazOtH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 16:55:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 16:55:45 +0000
Date: Tue, 26 Sep 2023 11:55:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <sbjbjpbkep5qz7b3seaqrtooowmi4hxprdq5nh6vxvohtwxwxo@7dl5kk2lwqbe>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-7-lucas.demarchi@intel.com>
 <20230925231443.GC2706891@mdroper-desk1.amr.corp.intel.com>
 <pimoze2aaab65ggqf7rkacnx75dxe32ltjw5uswnttejlw7wsi@gignzc55kh3u>
 <20230926153418.GI2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230926153418.GI2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 237018ac-bd37-405e-bec6-08dbbeb16caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vVr/yP3Li8XrIWhmlhK/FUJypCuxVZX5SAATdm5dvaZjvPRTT0dka/ZKsta5d5B43gxMTv8CF5IyIB/s2sJIsymzt7kGUiopQ7dWs9Yf5ua519+vQ9dCe2FotXFdZKSQRfxS3J4BoPiO276yaSRagtRxz7cONqtFV//CIczR5/WyG7Jbqh8GDbHst2tXOvqWV0Agug9dNlG5aOWwSOcvHxlWQBks/dEm6pAQRB36ll4z1nFKVinmtsO7hNnVmJ9DUPhTHwQeZhBk405X9qTTfl3nZ7idJgdnS2tA/DRGEKJDJYAJmvRAWZA9FQorsWt2VbSJAA4R8j4isehKHYdzjUSz6U8jtRNGxNWRXKnLmKYjk1vd/WxgmeiksIVZV7BpbHqXOjhRxNzuynjIDFCvgRyAismmzD3QpmUYQSNpiUccUHR1EtSFZfI1g0cBftIyGrqwxwxZvH8qVTcwe9CjUi32HqjS4TUHQGEXxwO3Pep2LCJOt58AeP5gqdzmRvac5IJP/Ha2EOBhoDnznSvodDrT8XOjtEa3FjmuKywQwH6FoE5WciH6XubH2KhDMa9X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(66946007)(33716001)(316002)(66556008)(107886003)(6486002)(9686003)(6506007)(6666004)(6636002)(66476007)(26005)(6512007)(478600001)(82960400001)(5660300002)(8936002)(2906002)(6862004)(38100700002)(4326008)(8676002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k9KG2u/XCRxhXOvg0hT8+pidsBilshcJIxS8btac9+xR/rlg6rig4TOd2onb?=
 =?us-ascii?Q?OVkG0zG754rY5aPAc4BABC63+Ejkw2DMvwDYt2LpmgG40X6O49OPSk5UF5Md?=
 =?us-ascii?Q?kod5lu3EqVQYCFAKVV+4dVdW64zlrno5Xasqz2hj6lxhWPiqpalZioMS5mOa?=
 =?us-ascii?Q?yanG4pneWxtxaYtgHzET4QlDIxejpu/2oZq2Ylw6CwQg37p4DbtOVvT2taR4?=
 =?us-ascii?Q?ApI3jKFlc5ULtDGY8GvYxTZE6KDrcvlJ3royC5cLJrHS+nPXyXJvgIRm76Qu?=
 =?us-ascii?Q?+5ejjKI/CznLhNu5Op/5+0n9bfQ4ubbWyiKK3rC2wHWGkbnnqnq3oBBNCHUn?=
 =?us-ascii?Q?JS8y2PCn0A6qfl8ps2MH6xC5PUbgXWobSzNCmXnCJTROEd7L5+iFb+Grfsjo?=
 =?us-ascii?Q?t2sV44NuQbXgzkuMn4MFvl2HQRW/15XZh65os5xJyfy3P/TIlpjHEf/52KG5?=
 =?us-ascii?Q?v8dhdGs40xNuiEiwsP+4Ey8s2IIOPNr3E/CV1Z8gTR38PKYSjoIiD9vqNTW5?=
 =?us-ascii?Q?VTgIy9vkdNgmHuC8w2EYHapkpsbxQkhWACYFLndASZKPcaRtwcqDxD1by70d?=
 =?us-ascii?Q?55oveZnuw7pDAqwuxh1p/ShhDmgvfYl9bUbqUco72XGPOWPEuei8/sVx7Bbv?=
 =?us-ascii?Q?9Cauul/g7l4s3Yrh2WaV9Se4K2jQTWl4t0KblcciUBM+cLKubn3AiBGrCg8B?=
 =?us-ascii?Q?oKK+MOW5eqHHdyzsxCx2eBv150yDou9KOG7RLQlGhO3GqyFg0o66rH/BTvAX?=
 =?us-ascii?Q?4O+9cLq1nEAscNHzK6P+o4fDy5y8uUXnEP8uUKnxcPACR0jYJ0rL0ED9ogvv?=
 =?us-ascii?Q?QS15HMcnqQa/Suz3WZJUSu1DVlAAWM0WjmgK1+3kkLNX4faxEBjw51b8PtI6?=
 =?us-ascii?Q?Oj6vFUbkzhmnUa0+xLypUWmFXv4A9HBlTUoYw6bLxCTbSDcmiAq1CLye59yR?=
 =?us-ascii?Q?UxkVDtIAR8HFmpNHMl86PHt0Vm9eV8e9w8g667y+dpFq184jiVJCDvybaBaT?=
 =?us-ascii?Q?n+dsrySug3rOprT+6SKcGVRbHax7Yoo448itTq8fGEP4YrmlnIH+3aaD8JJX?=
 =?us-ascii?Q?/6WIYyeHPTbMI4SNSb/2pP4S2qQE52w5OTOKkzHuZVtqP2fWEhHusA5pu4ei?=
 =?us-ascii?Q?KQ4FVPt9H/KSyIrivxjp68cWtIx/gswsZnjWIDpjk3nG6ki5A0nYjJlDTAs+?=
 =?us-ascii?Q?xXuz952UKirp9RN8Z8SgGBiBoVtTYgHg2wgHkVpYNxLq+2HKUu7CDJ1cC1uO?=
 =?us-ascii?Q?xgoT/Pf97UCPYD0ET8WCSAJavL2M3WGCVrmAjAcReQIQWgD3rKECAkuHE5Fp?=
 =?us-ascii?Q?BWHgibcfgV4Jlhd3Z45nUPa3RW8wn5ySKYHY4FpG7IbTBCAcJE4fxYer5b0i?=
 =?us-ascii?Q?r8Vbfm8wXCcDvEW8hXLGaIxn1d43dCmnqMlL2vsBICsgg0zgrnynEhKp8pDN?=
 =?us-ascii?Q?SB61z1xnumB+7k9KGStTRV2pFwCaIee40VKglTFuHpfmBOEw6ds60Er4vWON?=
 =?us-ascii?Q?17sFI677gKssUK7lroGqR4CbB8q6qZBUP9vLOMyYSpRbAy6uwSCFIHfBDBhH?=
 =?us-ascii?Q?jrF0Y0Sben8pBwyCFeV5D+7ETSxrRzmWXR0NxOH+t1L5P9SDMsxrj4QFePBF?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 237018ac-bd37-405e-bec6-08dbbeb16caf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 16:55:45.0361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKGgm+JvMPHDMmXPerI4C8EJUx0/49hvqXx8Wr+HUddUk0uBOm6QmyARF05ACRL7Zis3DeZke9CYQqPhpbwznMNWm6PRq3+QNQNOtZtrLfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6245
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/9] drm/xe/pat: Keep track of relevant
 indexes
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 08:34:18AM -0700, Matt Roper wrote:
>On Tue, Sep 26, 2023 at 09:43:51AM -0500, Lucas De Marchi wrote:
>> On Mon, Sep 25, 2023 at 04:14:43PM -0700, Matt Roper wrote:
>> > On Mon, Sep 25, 2023 at 03:10:46PM -0700, Lucas De Marchi wrote:
>> > > Some of the PAT entries are relevant for own driver use, which varies
>> > > per platform. Let the PAT early initialization set what they should
>> > > point to so the rest of the driver can use them where needed.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>> > >  drivers/gpu/drm/xe/xe_pat.c          | 9 +++++++++
>> > >  drivers/gpu/drm/xe/xe_pt_types.h     | 1 +
>> > >  3 files changed, 12 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > index 98835ee058f5..7d0f2109c23a 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > @@ -15,6 +15,7 @@
>> > >  #include "xe_devcoredump_types.h"
>> > >  #include "xe_gt_types.h"
>> > >  #include "xe_platform_types.h"
>> > > +#include "xe_pt_types.h"
>> > >  #include "xe_pmu.h"
>> > >  #include "xe_step_types.h"
>> > >
>> > > @@ -342,6 +343,7 @@ struct xe_device {
>> > >  		const u32 *table;
>> > >  		/** Number of PAT entries */
>> > >  		int n_entries;
>> > > +		u32 idx[__XE_CACHE_LEVEL_COUNT];
>> > >  	} pat;
>> > >
>> > >  	/** @d3cold: Encapsulate d3cold related stuff */
>> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> > > index 86386633e206..966b63252735 100644
>> > > --- a/drivers/gpu/drm/xe/xe_pat.c
>> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
>> > > @@ -108,14 +108,23 @@ void xe_pat_init_early(struct xe_device *xe)
>> > >  		xe->pat.ops = &mtl_pat_ops;
>> > >  		xe->pat.table = mtl_pat_table;
>> > >  		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
>> > > +		xe->pat.idx[XE_CACHE_NONE] = 2;
>> > > +		xe->pat.idx[XE_CACHE_WT] = 1;
>> > > +		xe->pat.idx[XE_CACHE_WB] = 3;
>> > >  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
>> > >  		xe->pat.ops = &pvc_pat_ops;
>> > >  		xe->pat.table = pvc_pat_table;
>> > >  		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>> > > +		xe->pat.idx[XE_CACHE_NONE] = 0;
>> > > +		xe->pat.idx[XE_CACHE_WT] = 2;
>> > > +		xe->pat.idx[XE_CACHE_WB] = 3;
>> >
>> > These are the PVC indices, but they're not correct for DG2.  IIRC, DG2
>> > should be using the same ones as xe_lp below (although it looks like the
>> > bspec tagging might be messed up right now...)
>>
>> But that should imply a different table, otherwise the index doesn't
>> really make much sense. Looking at i915 we have, for DG2:
>>
>> drivers/gpu/drm/i915/i915_pci.c
>> 	#define TGL_CACHELEVEL \
>> 		.cachelevel_to_pat = { \
>> 			[I915_CACHE_NONE]   = 0, \
>> 			[I915_CACHE_LLC]    = 1, \
>> 			[I915_CACHE_L3_LLC] = 2, \
>> 			[I915_CACHE_WT]     = 3, \
>> 		}
>
>Where (what branch) do you see that on?  drm-tip has
>
>	#define TGL_CACHELEVEL \
>		.cachelevel_to_pat = { \
>			[I915_CACHE_NONE]   = 3, \
>			[I915_CACHE_LLC]    = 0, \
>			[I915_CACHE_L3_LLC] = 0, \
>			[I915_CACHE_WT]     = 2, \
>
>which also matches the intel_gtt.c programming below.
>
>The table you pasted should be the LEGACY_CACHELEVEL identity table,

yes, I was just reading the wrong table here. With the right table at
hand it makes much more sense.

Lucas De Marchi

>used for platforms that don't really have/use PAT index.
>
>
>Matt
>
>>
>> drivers/gpu/drm/i915/gt/intel_gtt.c
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
>> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
>>
>> So, it's effectively:
>> 	I915_CACHE_NONE		-> GEN8_PPAT_WB
>> 	I915_CACHE_LLC		-> GEN8_PPAT_WC
>> 	I915_CACHE_L3_LLC	-> GEN8_PPAT_WT
>> 	I915_CACHE_WT		-> GEN8_PPAT_UC
>>
>> Does this even make sense?
>>
>> For TGL it is:
>> 	I915_CACHE_NONE		-> GEN8_PPAT_UC
>> 	I915_CACHE_LLC		-> GEN8_PPAT_WB
>> 	I915_CACHE_L3_LLC	-> GEN8_PPAT_WB
>> 	I915_CACHE_WT		-> GEN8_PPAT_WT
>>
>> .... which seems better. /me confused, maybe I'm reading something wrong
>> here.
>>
>> Lucas De Marchi
>>
>> >
>> > Matt
>> >
>> > >  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>> > >  		xe->pat.ops = &tgl_pat_ops;
>> > >  		xe->pat.table = tgl_pat_table;
>> > >  		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>> > > +		xe->pat.idx[XE_CACHE_NONE] = 3;
>> > > +		xe->pat.idx[XE_CACHE_WT] = 2;
>> > > +		xe->pat.idx[XE_CACHE_WB] = 0;
>> > >  	} else {
>> > >  		/*
>> > >  		 * Going forward we expect to need new PAT settings for most
>> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
>> > > index 64e3921a0f46..bf5000499251 100644
>> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
>> > > @@ -17,6 +17,7 @@ enum xe_cache_level {
>> > >  	XE_CACHE_NONE,
>> > >  	XE_CACHE_WT,
>> > >  	XE_CACHE_WB,
>> > > +	__XE_CACHE_LEVEL_COUNT,
>> > >  };
>> > >
>> > >  #define XE_VM_MAX_LEVEL 4
>> > > --
>> > > 2.40.1
>> > >
>> >
>> > --
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
