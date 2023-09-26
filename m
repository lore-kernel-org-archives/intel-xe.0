Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A63FE7E644
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 15:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37B4891B8;
	Tue, 26 Sep 2023 15:34:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F97891B8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695742481; x=1727278481;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6EZ1ZHwBewrlGKq3OKsspQJOLipP2cf59Vjc0f9AZXA=;
 b=XJA9ETVPYvLADc+q/KtIp02YO5jgi/YoLhEnkVntEdQVgHOs1fHIz+m4
 HrTERn0XYxHBa9Du+hYbV65bT5ZRM51E7XINPEZPACGzt6xNEtU9MI87w
 uecc+eL9edZMi2MCZ914QYluqXo11qaU1+vfU0E1pGmsA0d1nVMyvDcPu
 X2F4wohJcfLBatZCYnIqBfkP1PDP5nHhv2De6Iw7SiXvXdHALCaT9rvfQ
 MhVxoyIuXSpkViAnYmDqkQHJ4OPKPMdoVWK6nKjBe6D0oejdi6+fEVNLU
 bWtTeB0LcPHrmAwP8dt9EoK5DV2v4+7eQXORw+6MNlsZno8N7QXYc1fuu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="360973321"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="360973321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 08:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778169902"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="778169902"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 08:34:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 08:34:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 08:34:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 08:34:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 08:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frPVtBuDeu2/UuVfhxvPsCDwHLAEzAHyiNie1i4foNyBpoW3YCVBpr/N0xUgGHwmB7sqwO0tC1FPlZLRXxqddStw6naFOeGueFjKyqmjnQturrAC7bLTFpN77Wa4MkHevRJZtRTm4IKq5oIarjD4wnrQTvFWRb3Xe6jyvs1BE3CfHVF55CnKcHrnFe/XBZdAVeiIDO2KiSCabiaNADB+jdR42WwPgSt3/uBoFM5pTXKW1Kxv+7hPMx+44sQaxlAtBY1GpqzBsRPClfZ1IcgEUqMlQjKdzzQVmGN966LhpAIoPrHzjOIvk/uXeSke4vtWSxmywbXgpmDejEGOkwC8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5heFd66hLk8Hgj938ev6hq+WQI7we/jCawa87fjMdQ=;
 b=RHiqdYx73BhI32P/rbZrUDOHYtVW2C60MXpTpVqk7EBXVn/IXzijGOwoooghuOZeyPXaPV+WiEYXiG1on9EDRAScHO5ZwYi7kT0stgnH4Oo7ldBDYMQi5xZTHaS6UGt6Y7xmUhylTOiCwdOpvayoOvZqRyQ8z/tHPkoqryaASD9C3r40ccxtaEzq2iyf1HDk361uo2BBDh4eLlWGAqyaB/RfM45p9goelFX4fikksf2fX0YdJ50D8u6ydaQcahqSz+xsxBAItbmqTVBBz4Eu6vco59IDbqavvX8ccjcM4TG6hmuWixWsJZofvuAQs/Z1PUBh9aS0Fz88eGG+rjCtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 15:34:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 15:34:21 +0000
Date: Tue, 26 Sep 2023 08:34:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926153418.GI2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-7-lucas.demarchi@intel.com>
 <20230925231443.GC2706891@mdroper-desk1.amr.corp.intel.com>
 <pimoze2aaab65ggqf7rkacnx75dxe32ltjw5uswnttejlw7wsi@gignzc55kh3u>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <pimoze2aaab65ggqf7rkacnx75dxe32ltjw5uswnttejlw7wsi@gignzc55kh3u>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d45c3ec-1c09-448f-8e1d-08dbbea60e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2h5LaWXmNT+ZKowMc8sQucD1Pzm2EhLJzIoG6E19Sz9zSXU/3dd4CH0M57q4Qe+ADQ1+wZqdOheDEffWWz/0BxIUfD8T++1rUmw5jzhbz9zmwsH2TMhbUP667NYYLfbo0XocdBZRvnvkHBaL3Vw1ubxlIhahT31liNu1lztb4RhHYIgRR7zi3EorFYxZImpdlr65zbUBltrokFWy2UwuoybwU5moAuSJ3NRBCgmhbuuUcZv84+tW/vv5p3sHleJlEULgkFqGyO8B6qSvGSzLwF52RCOZK6wBfudjAB0PDhLPKWkhs3gySaOvPyo7p91NDKXp8IVzeTFzTAzUcGp7/Ak4ulztt1h9fBaPZDqvLTC7Hube4II3DAxtkjqQGY/oEhx9kyowtx4Tli2NZrRPkHOt0lc0SxhDOcJjWRlgpZCWeZCLquOaBOrOaVPTKp66IKuDfWz6vxQWdSHKnq1l/EayHHCXmvZd+w5CSfosxZS1MoKErPYr25xW705EfunhIQQVuuu1B9EcIbpMF9R/2312CNcr95hT4hdA+s6eOmfr0bMcc8RUHwnVPkxTKlm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(316002)(5660300002)(41300700001)(66476007)(66556008)(478600001)(66946007)(6636002)(6862004)(4326008)(8936002)(8676002)(2906002)(6666004)(6506007)(6486002)(6512007)(26005)(107886003)(1076003)(86362001)(33656002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DLryTZjJHhwf5D+0J1ltgS4NMy3D6dQ6lJ1r6yCFcCm+IJWJZaOJ4zGqh6sV?=
 =?us-ascii?Q?aCBJUIdtVm6Fakw0Qpm1TpP9a1geJ6zlEBx10JdqW4lT+GnnFKeqHUKfn9dE?=
 =?us-ascii?Q?cb9KUIqhXl/1ZgYQc+VsO7lj1MjZa/M9c/Cg8I4kOl/MmAQAhB4Bss4UUxwC?=
 =?us-ascii?Q?Bptwq1j645zfBhhJXgl6SHyyPwKaiplE0A28dhsFL9Nvf/hIIN3a4C+ELcrC?=
 =?us-ascii?Q?BOldFfJY2hmR1WtDsUXZAau+yTxh4NwUaaNMSMZgmsp/a3Jh0Q4kOvvPCJOv?=
 =?us-ascii?Q?Y5QxoRETmMjsal0tRMoFQ9IOcSiu7oPmgdpATQNzj5xhodQNdkeeG97EmNZS?=
 =?us-ascii?Q?MBxqBEn6mmQz/JmKdZthEzV9YVtQ9+htuOxwOtWUeKKPqY9mGwzKyBguhH6h?=
 =?us-ascii?Q?0DTEDAgctftgFnpN4GbtCDgsJkZ3DO8d/Et+eGiRZQCrnaAsxWJF+qI2q6Cr?=
 =?us-ascii?Q?HngtHixZXyf/HbcvZHk0mbnita8m9L4HqiqG9TZLgT5rHDeeeqW4P/V55Ptc?=
 =?us-ascii?Q?/qjUECc806ulMQZ2QGF/+oHqU77GdIK9xW3PhI42vhSNsI3yGlBLab8AcBC4?=
 =?us-ascii?Q?YAuI4x+2+TZHWHhYrPZGCJTujjPfXNaZAue+iX51pPpgSSp/EpOxB05vcn/2?=
 =?us-ascii?Q?j2ZfdxEaK2CH5Hy+FXKsqYWJFHLP7Yg5ll136s04f7Q+UBmnbmkf1GybfTjw?=
 =?us-ascii?Q?NV76pDV39pnBgmMl3jCq5lmyHKG+pTL9Q8sNMco3fXkJY3CSRr4YqOyYfxvt?=
 =?us-ascii?Q?HcV8Jtkl1RY61EDKpbaCrwP7lcWe5EEBF4LgDYKqzaeBf/j7UObHNVeqGMIW?=
 =?us-ascii?Q?u8aX3gvQdNojrFTFVp0h+i0SHZUDAG5jJkccrlDW6p+Hqd6tdMJdwwv0R0rn?=
 =?us-ascii?Q?0OWirvXfb1X6NVTj6Rc9VrgEVqOFcw4NNKJvvvjH6EsdrMJAjrayv2aNNOuk?=
 =?us-ascii?Q?Gw3DPmfFPsIBuL0BHPZGRxQepGENniZ6kzYQy23ngae38NL9lUgZgAD5a6ml?=
 =?us-ascii?Q?PAuRlw2MMm1huLeyT+0H6xQuy974fUDrs1/1YVETHXXodbDHWvjQwdUxlUq2?=
 =?us-ascii?Q?EtnJNdSaGdp4im7XtTWE7AP5tcB7T8cLH6M8mob8+x1eoJ5hR25X6nUFT92X?=
 =?us-ascii?Q?ONqnElzeqDeafWb7PE8Q0g4PKKImo0tvN9Ait7DyqYt/PqkE0xGXKy2kE8cg?=
 =?us-ascii?Q?CNxVx0S+rqB7eALwy8THzgLwqVNoUJ7/jFWVxTRS4EH+9tC6abrtA63YW/tG?=
 =?us-ascii?Q?aQwDH8wVvVtvnAADgeWO+uPM19GaoQzqRbQuHr8Fhlu28xx9SqFa7kL5Gj0M?=
 =?us-ascii?Q?lTQl43TgF2lr4al+hBXhDgEnqrtksMRQyRHZ07EpWC2/aexlBhVitdVO/rp8?=
 =?us-ascii?Q?gfu78aDq1gCEtJcpPWNHlT5fV34BcyUaOGFIwpUV1mfe0SSm1FanPesz/DUh?=
 =?us-ascii?Q?Bpz7/U49+IfTPx/HNG8FMh8Phlw4j+8paZ5pjpwFfLT1DNABjoKdwQ4La0r3?=
 =?us-ascii?Q?GQBCProxOqkxQjR/beTuZ5vPe/ycK1nq8nzSsR3/FjMKx7xGI3Gxk9qYhytu?=
 =?us-ascii?Q?vM1HVsWKvRykBac44DwPxYoTLSCEpeRS3HCx/HfTEyq0SjHNIWC639EEx4qD?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d45c3ec-1c09-448f-8e1d-08dbbea60e08
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 15:34:21.4113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHUVwl9xa0IPxB/9jMUnK3zvjWXRPqS2NttOzjEaTLQUf5nvaHMSm2JPyNjB6KAv3EIdUtswRPsz8fb1jnegLildxp80uaLKSS8QweCIB/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
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

On Tue, Sep 26, 2023 at 09:43:51AM -0500, Lucas De Marchi wrote:
> On Mon, Sep 25, 2023 at 04:14:43PM -0700, Matt Roper wrote:
> > On Mon, Sep 25, 2023 at 03:10:46PM -0700, Lucas De Marchi wrote:
> > > Some of the PAT entries are relevant for own driver use, which varies
> > > per platform. Let the PAT early initialization set what they should
> > > point to so the rest of the driver can use them where needed.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> > >  drivers/gpu/drm/xe/xe_pat.c          | 9 +++++++++
> > >  drivers/gpu/drm/xe/xe_pt_types.h     | 1 +
> > >  3 files changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 98835ee058f5..7d0f2109c23a 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -15,6 +15,7 @@
> > >  #include "xe_devcoredump_types.h"
> > >  #include "xe_gt_types.h"
> > >  #include "xe_platform_types.h"
> > > +#include "xe_pt_types.h"
> > >  #include "xe_pmu.h"
> > >  #include "xe_step_types.h"
> > > 
> > > @@ -342,6 +343,7 @@ struct xe_device {
> > >  		const u32 *table;
> > >  		/** Number of PAT entries */
> > >  		int n_entries;
> > > +		u32 idx[__XE_CACHE_LEVEL_COUNT];
> > >  	} pat;
> > > 
> > >  	/** @d3cold: Encapsulate d3cold related stuff */
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > > index 86386633e206..966b63252735 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -108,14 +108,23 @@ void xe_pat_init_early(struct xe_device *xe)
> > >  		xe->pat.ops = &mtl_pat_ops;
> > >  		xe->pat.table = mtl_pat_table;
> > >  		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
> > > +		xe->pat.idx[XE_CACHE_NONE] = 2;
> > > +		xe->pat.idx[XE_CACHE_WT] = 1;
> > > +		xe->pat.idx[XE_CACHE_WB] = 3;
> > >  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> > >  		xe->pat.ops = &pvc_pat_ops;
> > >  		xe->pat.table = pvc_pat_table;
> > >  		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
> > > +		xe->pat.idx[XE_CACHE_NONE] = 0;
> > > +		xe->pat.idx[XE_CACHE_WT] = 2;
> > > +		xe->pat.idx[XE_CACHE_WB] = 3;
> > 
> > These are the PVC indices, but they're not correct for DG2.  IIRC, DG2
> > should be using the same ones as xe_lp below (although it looks like the
> > bspec tagging might be messed up right now...)
> 
> But that should imply a different table, otherwise the index doesn't
> really make much sense. Looking at i915 we have, for DG2:
> 
> drivers/gpu/drm/i915/i915_pci.c
> 	#define TGL_CACHELEVEL \
> 		.cachelevel_to_pat = { \
> 			[I915_CACHE_NONE]   = 0, \
> 			[I915_CACHE_LLC]    = 1, \
> 			[I915_CACHE_L3_LLC] = 2, \
> 			[I915_CACHE_WT]     = 3, \
> 		}

Where (what branch) do you see that on?  drm-tip has

	#define TGL_CACHELEVEL \                                                                                       
		.cachelevel_to_pat = { \                                                                               
			[I915_CACHE_NONE]   = 3, \                                                                     
			[I915_CACHE_LLC]    = 0, \                                                                     
			[I915_CACHE_L3_LLC] = 0, \                                                                     
			[I915_CACHE_WT]     = 2, \                                                                     

which also matches the intel_gtt.c programming below.

The table you pasted should be the LEGACY_CACHELEVEL identity table,
used for platforms that don't really have/use PAT index.


Matt

> 
> drivers/gpu/drm/i915/gt/intel_gtt.c
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> 	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> 
> So, it's effectively:
> 	I915_CACHE_NONE		-> GEN8_PPAT_WB
> 	I915_CACHE_LLC		-> GEN8_PPAT_WC
> 	I915_CACHE_L3_LLC	-> GEN8_PPAT_WT
> 	I915_CACHE_WT		-> GEN8_PPAT_UC
> 
> Does this even make sense?
> 
> For TGL it is:
> 	I915_CACHE_NONE		-> GEN8_PPAT_UC
> 	I915_CACHE_LLC		-> GEN8_PPAT_WB
> 	I915_CACHE_L3_LLC	-> GEN8_PPAT_WB
> 	I915_CACHE_WT		-> GEN8_PPAT_WT
> 
> .... which seems better. /me confused, maybe I'm reading something wrong
> here.
> 
> Lucas De Marchi
> 
> > 
> > Matt
> > 
> > >  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> > >  		xe->pat.ops = &tgl_pat_ops;
> > >  		xe->pat.table = tgl_pat_table;
> > >  		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
> > > +		xe->pat.idx[XE_CACHE_NONE] = 3;
> > > +		xe->pat.idx[XE_CACHE_WT] = 2;
> > > +		xe->pat.idx[XE_CACHE_WB] = 0;
> > >  	} else {
> > >  		/*
> > >  		 * Going forward we expect to need new PAT settings for most
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 64e3921a0f46..bf5000499251 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -17,6 +17,7 @@ enum xe_cache_level {
> > >  	XE_CACHE_NONE,
> > >  	XE_CACHE_WT,
> > >  	XE_CACHE_WB,
> > > +	__XE_CACHE_LEVEL_COUNT,
> > >  };
> > > 
> > >  #define XE_VM_MAX_LEVEL 4
> > > --
> > > 2.40.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
