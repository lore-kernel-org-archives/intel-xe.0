Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97373C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C13C10E008;
	Fri, 24 Mar 2023 16:09:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8D310E008
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679674146; x=1711210146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IKcxn/4sKjW5czK3PJJlg6HdIIEWl0Aifhv0I/te4P0=;
 b=TrbgAnq+PiZMNC5HtQf07PWkj/EaotZfOwtbzS1Kxr/qJm9OziRCeEoM
 PDJAVff0TVm/eg7b/sYjWRPHIz/pv2rCtN6m3OWxoGn5qHtQYMX1glYWj
 120SlRI/LHv5onIB9VBIgM61yaDdlvk7Hnt9GWUvg4ZwQA9uCZq3OyWmQ
 46GrPPoTBYLHqs6uDV9CWxlfFh85TK1A66eULuVCqGHqIeLuFohmAVy0Q
 BacN9xTj5rfaHYcr+lCoRE0QDsUG6cPBc9J28jR9sfr/Buai2d6WmMZ3D
 +lDOinYOZmewR/PG8SZ9d+7KJ8KAYBqFvlqggtET00bd6aqukCrz7g9pO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328237571"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="328237571"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="713121975"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="713121975"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2023 09:08:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:08:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:08:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 09:08:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 09:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDPsCTOybGW7lSNWuyLRP5Gy8ofGWf+MfIv8zLBXrwsudk8M9JRYp0bW8sjix5wIkr+AtHr7UyiClsy4quK8h9fn5hcTLQ6LMqYw/CYuynIzS580UU3em76EJeyQ/Ku+f/XpIcuQkjF+RH748s4HSRFZ7CYSBVkksdg5b7I0Tcpl53Qg00Umj87DQnd2+kBqK7m41bToZvQZL0kKzcK8JOMWr+rR88GL9tFRsT9+G+FxLyNlW9BLQyrZ/S1yEpbMXjqSsfo4sQHySlI+NzOMi5De5pGGcJZFhupYp9UdkxckfCNaWMPT7JHi0z5NLedc5fWHkrF5h+YFyDTT4gKLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiS8AfBeeu6up68Dijlh8GES4ElmWySEOKlnMOu0YIg=;
 b=SCBBgd/lgi10uKb3yAQ1PBLu9WaqY6yhDA+xL6GCPFGrniEawOZPeh3/6cFq7fzErW4e1INZr5tHEOsRbr1BNoi7vltP2kwdicR3BOaGx7SspGxPlFMb1boDH71BR7JuldOUj/q8PwiG2o1/g4rQo/UnOc6PRpGsHO17+sz/XN1rX1shb6p3x13rQ1bj5PWQZtHZoNU8kz9e6Yvs18osqL/ukJuoCCi3Te8LMDPvYfJrqnmSrO8C9U7zYJCM5a5GKXDGhtJEpcyyWkk4yQ4rNmQLjipgCj88fKUNaVc3fTyJu5J6a2bdOIC1bJp/fs4UnN3Z9U6YG0IxWBoKajhZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.40; Fri, 24 Mar
 2023 16:08:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 16:08:24 +0000
Date: Fri, 24 Mar 2023 16:07:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZB3K0PjzD1LWD7u0@DUT025-TGLU.fm.intel.com>
References: <20230324012329.1195977-1-matthew.brost@intel.com>
 <20230324045311.h32fyw7mh6o6eyic@ldmartin-desk2.lan>
 <ZB1KSkvCngrSs3bR@DUT025-TGLU.fm.intel.com>
 <CY8PR11MB69406B340F0DD44161F3B691C3849@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY8PR11MB69406B340F0DD44161F3B691C3849@CY8PR11MB6940.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: d4cabb36-de37-4ffb-2787-08db2c81fe92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 227PPRnuFnrhwIIbS0urCIl71yBtO1VJlhVWViKGk6fXMfFOv5r4UBtxVzDbuBuMv8KXRmKvHWOIl+tIRS4ALJpaqjZftnHS50jp3cdq30kNPuvyAxylaqkA7MrnT3vOV8n3l14FDFTwbXooMM4ZPyy/7Eq+qpAhPM/sMXeryLQQAn4TG6ngwr2mdi01OmZhvQc7X67/VeWjm3Uewx5pOHqctcpsxbrK7MmyinPD6DQs6F/6LaF+wBfMuFbfPIQwM4p6dx92XlWlh+/XikEDcCjnydwvq76BBEZaCZWDDPU0ZdiVZCRFN+OHD28PqkvK14aft1CpNzF4xZqo9LIdWBeoBfNbHk8+afbzt7f5JQw8UT79StTaU2XQvZqu6bQ06iM7MwBCILzQgfhUh4QBvJHQLK7IKVGLnY+dLEh6rFv6LAEPyrEeLJS75mfpme6m2ivsKaVHaAn30n3dvV97mpOPy3EQbyfJF/CHzF43olJ+oY0BbzMCusqTuVR2GYLqEcdnUkLvkRryxTcz/EHhc1UXj9LIf5c6pMRt2bUL//Oh/qnaC2NMYKH/0jADXACT7aW65tyg6VIQF7um418wd+nnhHs8c8awd0T3+1GgPxpDrknx+hPHt2cLwOi1hgUkn1iUExs8q4N242J9xjsfAoFJF6q8c2m1nR3YYWoJkZK3lQdQASujf1TzvzptLlLg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199018)(26005)(186003)(53546011)(6506007)(6512007)(6666004)(83380400001)(86362001)(38100700002)(82960400001)(5660300002)(316002)(6862004)(8936002)(6636002)(44832011)(8676002)(66556008)(66946007)(66476007)(4326008)(41300700001)(54906003)(478600001)(66899018)(2906002)(6486002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UPbyfjU/31y4ngyz6ysF6HpuG8Qe1QVFMzqaqEEB3BZFGAliDLjNbrRrqj/Q?=
 =?us-ascii?Q?SOgo5eNazWWE1C/jYqg4d4fxkf/62MY+B8apthGaDGQDgxFle9/FdlRyOvVl?=
 =?us-ascii?Q?45O8trErB/vmvESswAUBxl+VT5y/ss5kbqA5uOrXs3o8zwWeLzyBf6iuO7no?=
 =?us-ascii?Q?n81GLjbgFaT4wD+BPoILwR6SpKN1OUpeK581Ec9WajT9WIspkihLVUU6xcNB?=
 =?us-ascii?Q?ROnO74f0wRdWYtb7TJnAkZe+NzY+fUVM7cNyO6w4hPFEKT9rIUBdPagnOUBH?=
 =?us-ascii?Q?NZQ26B2M87MszVVi618kXTuR19HHqs1mAUH/A6tRbNfBF/HMR99vTmdcmnq2?=
 =?us-ascii?Q?y+UN511Op/h6Mf7paZ9jjZ9y5AM1Q0TmEMAozJk9QOFg50sKf16gljLVy23S?=
 =?us-ascii?Q?jBAqKhoa1iy0LvMMVMsaYpNLUzNNUICxDcotDH79Ws2DdVA0Vc5TZrTXnqFE?=
 =?us-ascii?Q?hURmmI5lEE1mAnpjiXs6ssV269fyj5yFwGNVRGdF2lxJcObVQQoSjBIuknfy?=
 =?us-ascii?Q?vKUdrRw30YHhfXPoWRaF2YiymkploCRYw6JvA1gwX8qaRN4+MzN4ZRyTMKt1?=
 =?us-ascii?Q?IR4/nk3Ppc3qvERzXed29e96sqI/nL3z4skmV40az0BieBPysexxKcix8wzX?=
 =?us-ascii?Q?Gs6gukXdGJIEHh/W+rrAXGM1ubHFY1a3/yup/CO9ZO4lH9BzJkfUfP7e9uBv?=
 =?us-ascii?Q?14l5Ja7R/2BoBPSIrnR06nUW8If5xEOCB0FWpQcEdxKvLCJPlP9iG1sEgWli?=
 =?us-ascii?Q?2ki7BVV5v25ZwPIKG2HCixRWJVcjrt8J6FUK7CO3ZL2t0bN/iy1Q5aUqAN9b?=
 =?us-ascii?Q?KpaMAqXdJcqNf8xitUKxexiBKPqYSLgq0Q6XC0IWXEhwNnbPtIQ+RyhDPiBf?=
 =?us-ascii?Q?DY57vyubKk0eR2xV54H6sHpeRe+ylYZQD3ndPhSgOQskXtaGxF3mnq/trMRA?=
 =?us-ascii?Q?aQyYYoagI1uFWN+c0k7WtIK6jsZ9SJMOqEhlImxF8TEb1q5E47860OfMPvBt?=
 =?us-ascii?Q?2byDevWWAUAPnQH4N9/D2iha+JBAmcEizNkHquLMTNNSXDicrNY7UtEX59uH?=
 =?us-ascii?Q?/XGbIF/7DIFMXdrEVN+/Q3w0skv7QZVnZgh9njyDimYblRv/Srvy42iIvnBW?=
 =?us-ascii?Q?RUUAWeuvZTMn78inS/lwL9tgG1shHQYq8p0bZ9SQh4zLsiR4fsckMOUQWdJC?=
 =?us-ascii?Q?Hk+vTiQkZJf6wfEaAtStkZgFP0NGWcKb+9uOIX/dc5gzrE7mq6bH4fYm4m8M?=
 =?us-ascii?Q?i1i0ykGwnNJuUItjmbawXyOAvGC2fMyNtdQ9pB6Tth6IqifWCuyUg16GOboa?=
 =?us-ascii?Q?rlJOHXf/igBtGeeZDiCYa+WX9nsa16ht4+xeyw8ek8lKvasYv/NvWtqFGk6w?=
 =?us-ascii?Q?fZHtirl3by22mZIm1cMvQRvzte0dDFhNctereWRzob9HHv+1JBKx0b9RAhea?=
 =?us-ascii?Q?srkZcRkwLU5Z4CT9+PZj9eK9w+lHgABLZNxqHWlu1S0EURMGjxBTzQRjTb8D?=
 =?us-ascii?Q?o/4HZ5MN1W+tz19yMbulDOC7hieJPdijZYbnV1vlrTKFrg3ibG7OhjHAACHj?=
 =?us-ascii?Q?0IzxLBs3zjA/1VUofPd+UAUGjql7OpylQnHlJRZFROa6RmV3ELtyU1nwLDk3?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4cabb36-de37-4ffb-2787-08db2c81fe92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 16:08:23.8638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91W8mO5Hclx17NrKMzYqlsnb/byTt+azQx68NQNXRhJmAkLkVuLlXkqIi3QvZ53kRoZ+d0GR/q/1iRdi+HJVBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 09:29:10AM -0600, Chang, Yu bruce wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, March 23, 2023 11:59 PM
> > To: De Marchi, Lucas <lucas.demarchi@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Chang, Yu bruce
> > <yu.bruce.chang@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
> > migrate engine on PVC
> > 
> > On Thu, Mar 23, 2023 at 09:53:11PM -0700, Lucas De Marchi wrote:
> > > On Thu, Mar 23, 2023 at 06:23:29PM -0700, Matthew Brost wrote:
> > > > Some copy hardware engine instances are faster than others on PVC,
> > > > use a virtual engine of these plus the reserved instance for the
> > > > migrate engine on PVC. The idea being if a fast instance is
> > > > available it will be used and the throughput of kernel copies,
> > > > clears, and pagefault servicing will be higher.
> > >
> > > how faster and/or why?  If it was related to being link copy engine vs
> > > main copy engine it was very understandable as the commands available
> > > are different and optimized for certain usages. However below you are
> > > setting to the odd link copy engines + the main copy engine
> > > + whatever was reserved for USM.
> > >
> > > Without a proper reason here or numbers or spec, it's hard to judge
> > > where this is coming from and understand in future.
> > >
> > 
> > Your right, probably need to get a spec reference or something to justify this.
> > I came up with this bit mask from IM conversation with Bruce, maybe he can
> > point me to the spec. Also I looked at the i915 code for this and it is just BCS0
> > | reserved BCS so definitely need to dig into what is the ideal mask.
> >
> Please find the detailed information from the i915 patch below:
> 
> INTEL_DII: drm/i915/pvc: Force even num engines to use 64B
> 
>     On PVC observed gt_fatal_7 as arbiter is out of credits while
>     running Molten Concurrency stress+ 2 HPLs + ProcHot + Warm Idle
>     + Solar DVFS + ASPM + Link Width Change.
> 
>     Its root caused to HW bug and SW workaround proposed to use
>     all even instance engines to do 64B transfer while using
>     system memory.
> 
>     So this change implements below scenario :
>     ------------------------------------------------------------
>     L7  |  L6  |  L5  |  L4  |  L3  |  L2  |  L1  |  L0  |  Main
> 
>     8      7      6      5      4      3      2      1
> 
>     64B    256B   64B    256B   64B    256B   64B    256B   64B
>     -------------------------------------------------------------
> 
> Bug-id: 16017236439
> 
> The 64B will limit the transfer BW. The main copy engine has several backend,
> So it may not be impacted much, but other link copy engine such as the reserved
> bcs8 will slow down to possible ~20% for host transfer. 
> 

Hmm, we don't have this WA, indirect BB, WA pages in Xe? I have no idea
what this is for but for the moment this patch isn't needed. If we pull
in this WA, then I see why we need this.
 
Matt

> -Bruce
> > >
> > > >
> > > > v2: Include local change of correct mask for fast instances
> > > >
> > > > Cc: Bruce Chang <yu.bruce.chang@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_engine.h    |  2 ++
> > > > drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
> > > > 3 files changed, 26 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.h
> > > > b/drivers/gpu/drm/xe/xe_engine.h index 1cf7f23c4afd..0a9c35ea3d34
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_engine.h
> > > > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > > > @@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
> > > >
> > > > struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
> > > >
> > > > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
> > > > +
> > > > static inline struct xe_engine *xe_engine_get(struct xe_engine
> > > > *engine) {
> > > > 	kref_get(&engine->refcount);
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > index 63a4efd5edcc..d2b43b189b14 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > @@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct
> > xe_hw_engine *hwe)
> > > > 	return xe->info.supports_usm && hwe->class ==
> > XE_ENGINE_CLASS_COPY &&
> > > > 		hwe->instance == gt->usm.reserved_bcs_instance; }
> > > > +
> > > > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)
> > >
> > > this deserves its kernel-doc, probably with similar info asked for in
> > > the commit message.
> > >
> > 
> > I thought I added kernel DoC but apartently forgot. Will fix in next rev.
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > >
> > > > +{
> > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > +	struct xe_hw_engine *hwe;
> > > > +	const u32 fast_physical_mask = 0xab;	/* 0, 1, 3, 5, 7 */
> > > > +	u32 fast_logical_mask = 0;
> > > > +	enum xe_hw_engine_id id;
> > > > +
> > > > +	/* XXX: We only support this function on PVC for now */
> > > > +	XE_BUG_ON(!(xe->info.platform == XE_PVC));
> > > > +
> > > > +	for_each_hw_engine(hwe, gt, id) {
> > > > +		if ((fast_physical_mask | gt->usm.reserved_bcs_instance) &
> > > > +		    BIT(hwe->instance))
> > > > +			fast_logical_mask |= hwe->logical_instance;
> > > > +	}
> > > > +
> > > > +	return fast_logical_mask;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c index 11c8af9c6c92..4a7fec5d619d
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct
> > xe_gt *gt)
> > > >
> > XE_ENGINE_CLASS_COPY,
> > > > 							   gt-
> > >usm.reserved_bcs_instance,
> > > > 							   false);
> > > > -		if (!hwe)
> > > > +		u32 logical_mask =
> > xe_hw_engine_fast_copy_logical_mask(gt);
> > > > +
> > > > +		if (!hwe || !logical_mask)
> > > > 			return ERR_PTR(-EINVAL);
> > > >
> > > > -		m->eng = xe_engine_create(xe, vm,
> > > > -					  BIT(hwe->logical_instance), 1,
> > > > +		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
> > > > 					  hwe, ENGINE_FLAG_KERNEL);
> > > > 	} else {
> > > > 		m->eng = xe_engine_create_class(xe, gt, vm,
> > > > --
> > > > 2.34.1
> > > >
