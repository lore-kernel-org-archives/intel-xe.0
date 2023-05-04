Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A2FC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 21:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E8B10E538;
	Thu,  4 May 2023 21:56:49 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0D10E1D5
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683237407; x=1714773407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J05YXskfL0JkzFqbAMe76/jS7YEHjnfNXxlimlh+T8M=;
 b=MNTt39ZPnlKMx47e3acxjn2XbRVScNqNT81/FaG2SV1pIKWUocNSP+fw
 ivsPq9ph4Gh3GHQyjXooEO/os6hbCe+e8fixE4Fpaz/wnqdd6q8KpdGqu
 Fq2ZaTNWiAT9zwrv9F2Q494aShnv0r89V2c/d9Gm7i27xvrzDfidX3dPR
 X58+8ZzQiam98U+7SKhAozyG19tmyyitz7ODDqC4X5jH2f5L2+PtRXJcA
 /b9ujQn+fOv2yghFbkbVphy/Xim7OoD3kzoVZsdOv8K0nlmwgers3BUoJ
 OT/hq8jyikCAzfLSw1cs71XjgCRT8s/L8edMfP92+v2OCUP1JWzjhHx4k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412279979"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="412279979"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 14:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="762132447"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="762132447"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 04 May 2023 14:56:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 14:56:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 14:56:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 14:56:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 14:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwbOOj+2qlUhy8Id1VyiXv4rkWUvSX/KTyoijsPx8P1+cb8vdT+nskPiS7jFZjmeYFjoilWqmi5ify3hZG2CUcH7VH/cOFPK/zHebbi6o8CnVIbbVG6SFF0k87l2sSjg5v9fBVmLJIumJ/6iEquXkwmeyuQ0P0vBJecdpg6/rNClIPsz1V3utLeOUTAJWcRjUuJSTu/TxCfYsLjqngOHOTBAnWuSrT0Wk+ra/TJJuhZ0ZKD2A8V4hcTvT5zcrLr6fl6OlrkZS7heghPJ/wOjhVsRneyDQo4NgMISYdXMjICkXKcvE992R/3DvMz5FcwcrEDILTTbEjvED9XI5EcnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUBaWSkKHZ8HXV3G+kE7MoyaegSMJ52Ra+kgTnjUf2g=;
 b=oN/hmrjbzvllZ1qF/dIADz7PuSP7LfNzbHzXk4L+cq7KdRMCPvxtfXF1ENQSsxgAcLHeCMRvpC+UlUx3xmvCtvoP23duCnzy78SxUnZ/gWxjSMF721kd72yt4nmSzz9+cdn4OQF3gCIS0cnc7C7CPPsx2It/Q/Zg9QWnCUhqsbeDJA34MxQtWJlXhO6elms6hFAsdQHVGDUE1y7IcFsw1qXWDlMRnMPXLpG0aZ2srHCq78bMDbo+1J+dNQinY+7H2peA7RMmZdM+atXlpwHhIh/zKENBn6vBJtTNVwd2o+6dBlqFUzYS6TNNu7r502RP0K7At+MPEdjbsUwvE9ITlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 21:56:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 21:56:42 +0000
Date: Thu, 4 May 2023 14:56:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <jgnnfqsrrh3iqyc3dmdo44kpft4z6s46lyxjqifrivgsfv36bh@hxzqtxlea3ia>
X-Patchwork-Hint: comment
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-8-lucas.demarchi@intel.com>
 <d7865dca6ea77cfa8274129f584f2074e7291894.camel@intel.com>
 <dikz4xlzc6awvlu6rol2slga2nernci2zmhrnsz5qpksgi4br2@locnvrubd734>
 <ffbb8d71931f4aec77b4b148463272d3a6dd9be3.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ffbb8d71931f4aec77b4b148463272d3a6dd9be3.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7c307c-9536-45d3-2b86-08db4cea7241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5gP4IPTSWr42bzjQYDiv6ItiwsZrTMtMY5Qx8BiyfOcH8mEOEhsRO5Ief5zkELbiCPq701fcR7q53f8HXt3cryKxeU4lTaLurBgdt/suBpWyUl5DypwzRDe09TshMESv1//oC1XdkcYXanrL9HhaxHtHZEMFTR9D+NXvAbvau5vsEARF9UmyK/Fi82799VRt4EFV8w0H27I0AzymqNBLpfcrWi6IQvByqVZlAZx1ByvNjlCO89sUfEU16ssSIGeJIYhwj8Ot9EviOBQO5PaKLzQja+YVWD29gFLKQdB39O3fHLGF8itAGjWLft7q2vXhP8BMVOhIY2J8/vh5M5J6HyE6rgt+NV0joV7uBSY/C2zdEPoPlFQyTHut+iqgPmnglkx4Engoe2VavAjJRMQedEgF+4xsx6U6dgEGfULDHjUkrGsqjnl2waBNgGuxexC0p3nbrpYiU24AkOCeiqdACJyJs+P2TpJsRp9KN6z88xnUTP6UFo4AKB/Hj2Ybc7nLv1JIG8i+2oiBRLx0+iJH0ztqNozRq2KX0qSZQK/35L5oCRY0Pbi3S1ItjbuopXje
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(6506007)(5660300002)(6512007)(9686003)(26005)(186003)(2906002)(83380400001)(8936002)(8676002)(6862004)(33716001)(6486002)(82960400001)(41300700001)(6666004)(54906003)(66556008)(66476007)(66946007)(86362001)(6636002)(38100700002)(4326008)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5E2wa947WymXwtymVF1OvWRSOQfmB5+02bHKjlUNRWF/eHyVJaqJeMdqI34o?=
 =?us-ascii?Q?W9eFjgphef+1+IEMcMO/MeeR1xAfXpSMV4jCcfecZAkWfel53GPZlOO14j7y?=
 =?us-ascii?Q?ITJSg6hnNecAT2aoB2Gzb3QBMxgXsNNOJFuBP5ys4a92xDNQNqiKaYxDBbDg?=
 =?us-ascii?Q?DQ6fqHESk4p9IDamjDDNFwIMVAXib4g7t4q+HaaQPfs24yJn8nbTF11mVYzg?=
 =?us-ascii?Q?obP3NJg2eIbI7DITwBpDjVQbfQ7tfgFtCBQZhxHueq3N23cnRZP6MEG5J9js?=
 =?us-ascii?Q?SaCs3pgQ4pZVR8vrQLbBgHtvfkEda0kuVQ0Qz15hFK+4DHx3gQ0fjZQZU89q?=
 =?us-ascii?Q?JV6VWukMKNN2mKSooIBMmfZoVBpDiRVErggjb88t9BUhXbBia8mRyYghsHSX?=
 =?us-ascii?Q?Qbf9WLKYpFu2hxDkpwumolDDCG8sSu9o64qHTMFcqh7V4xbp8Tbb9Eq7zOJ3?=
 =?us-ascii?Q?nB+d7n/rQt67KjNiJlu15DPZAshSf/BKDSDDAqf4s5qolICrHghdalV+APQ0?=
 =?us-ascii?Q?7A9kVGl3qwPsfvQyeCMPHjUXPRxhvlH6csGjcgZNpwq67ynJF1bFu0Tz+Dwa?=
 =?us-ascii?Q?M5I4bPrL/ff7/s2Yo18wrJ1jF7LMA1pIBNpAvwGCIQkM8bdL/TX59Tpi87it?=
 =?us-ascii?Q?hiZAgZvIgKYfqbgqizoFi0jkCVAYw+7+NlobQS//5kWHl1WNVZ3PePYRoHLL?=
 =?us-ascii?Q?6NQKXKfo+3FyPENdlzh6krWmN33n+sx/CYbnWRbY+YxsanTnOjpPyWzA/Ih3?=
 =?us-ascii?Q?QyBXlg5tFuoUXcT7WeMKTgEF9i/B9TkjXf/ESKbcc9Lo7ahdL2+lpCV+V7j2?=
 =?us-ascii?Q?FpFE7OrCKxjtvqQvkIbYKd+ohnHjNNqFLDU27+cMiGGhOJz/nwOIKA8G5+Th?=
 =?us-ascii?Q?dg26THKVuczfLUlVgqpcpR7l7ivD26LzTXcFUoRGwVxo76nHESJQrOwfCRXZ?=
 =?us-ascii?Q?rZvq+CWQ8/tnmIjOV+M/6/mideTepXGyPTbVp4sSdKGrfTAickIxupC8LjjU?=
 =?us-ascii?Q?U8aGQLSS9raf0gRZCpH5ZcAy4u+B8JMa/6BsbyMX2gFssbsQNHAMGn7P4kA6?=
 =?us-ascii?Q?5ADiy6Z/pr01y4DR+OFy7JF+EL0gKLId56lo8sCQaJAqbrV+ivkUJ57cfCeS?=
 =?us-ascii?Q?rA21ySTzKebeZHdULdC+uwcOphwhGlf7HLNUkHvPjDO3a9Qq7A2bpxgd7uZS?=
 =?us-ascii?Q?8bMCA0Ed+HmtDGgPEy/i/1xH+ittvxWF5S0JSfjxq9KDFvt4x/YeGvwPGaAN?=
 =?us-ascii?Q?actiL1+XdS09Aw1/fbqE4W6P3Bx8JGnlSBzQ8CIUi5iH+bC0lrqDs9CdKVu6?=
 =?us-ascii?Q?5cr8ZtjpDgiEplcHvzids2Q/o2cgIyGPzMkCu7VyzBB/4OZLzp6dYNT8GmWH?=
 =?us-ascii?Q?du85mVSWYplzWpmW/iyCj7L3QYtybycDF8Gbhi7jwdF8O3RXfZ4T9y7yIB+X?=
 =?us-ascii?Q?VM/XM4VZBTgjf8lx7s48BAtLLBE6nbe9CsFs9Ktc7ylevao3tViDu8cwfsxy?=
 =?us-ascii?Q?SceNf5uMtpXE1i8xDnLwNH5Xmje+UH/vhUGeTp3sbbT9tPaBZ8MkT5SA34/0?=
 =?us-ascii?Q?spRkuRGrwIMhjfZJgTBQT9hgkPVjbvsNk6DYZ3Hs/IR43MdHCqo1Xu/U4F+P?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7c307c-9536-45d3-2b86-08db4cea7241
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 21:56:42.7761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQTGgek2WvP3gm1purjnXlwfYans+P7SpDBdhCuP7qa8j1RYHX4PHKDsreR6i676oBAWBdOlb00ALo2JI7jwcU3oWgEwhAjXgV+Q752HAm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
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
Cc: Dylan Baker <dylan.c.baker@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, Mark
 Janes <markjanes@swizzler.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 12:37:05PM -0700, Jose Souza wrote:
>On Thu, 2023-05-04 at 12:30 -0700, Lucas De Marchi wrote:
>> On Thu, May 04, 2023 at 03:30:48PM +0000, Jose Souza wrote:
>> > On Thu, 2023-05-04 at 00:32 -0700, Lucas De Marchi wrote:
>> > > Let xe_guc.c start using XE_WA() for workarounds. One workaround
>> > > couldn't be converted due to no support for function hook checks.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_guc.c | 40 +++++++++++++------------------------
>> > >  1 file changed, 14 insertions(+), 26 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > > index f7d32b744247..eea5ed015282 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > > @@ -19,7 +19,9 @@
>> > >  #include "xe_guc_submit.h"
>> > >  #include "xe_mmio.h"
>> > >  #include "xe_platform_types.h"
>> > > +#include "xe_rtp.h"
>> > >  #include "xe_uc_fw.h"
>> > > +#include "xe_wa.h"
>> > >  #include "xe_wopcm.h"
>> > >
>> > >  #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
>> > > @@ -136,29 +138,22 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>> > >  	struct xe_gt *gt = guc_to_gt(guc);
>> > >  	u32 flags = 0;
>> > >
>> > > -	/* Wa_22012773006:gen11,gen12 < XeHP */
>> > > -	if (GRAPHICS_VER(xe) >= 11 &&
>> > > -	    GRAPHICS_VERx100(xe) < 1250)
>> > > +	if (XE_WA(xe, "22012773006", GRAPHICS_VERSION_RANGE(1100, 1250)))
>> > >  		flags |= GUC_WA_POLLCS;
>> >
>> > Just a suggestion but would be better to have the workaround rule defined somewhere else and here only have 'if (XE_WA(xe, "22012773006"))'.
>> >
>> >
>> > Mesa now has something like that.
>> > We have a Python script that generates a JSON file with workaround data from the workaround database API.
>> > During build time, another Python script generates the intel_wa.c file using the information in JSON, setting a bit for each workaround that applies
>> > to each platform.
>> > In runtime it get the bit field with the workarounds that applies to running platform on given stepping.
>>
>> that is one of the alternatives I shared in the RFC. There are
>> some issues with such approach though:
>>
>> 1) The condition is in a totally different place tha have to be checked
>>     to follow the code flow.
>>
>>     The upside is that if the same condition needs to be checked again in
>>     multiple places for these OOB workarounds, the condition doesn't
>>     need to be repeated
>>
>> 2) Not possible to encode conditions that are not platform-centric or
>> that needs to be decided in runtime (e.g. if an engine is fused off or
>> not)
>>
>> > In code Mesa we have 'if (intel_needs_workaround(devinfo, 14015055625))', Xe kmd would probably need additional checks like 'if (engine == BLIT &&
>> > XE_WA(xe, "xxxxxx"))'.
>>
>> yeah... that maybe solves the issue (2) above. We'd need to leave the
>> non-platform checks to each callers. And maybe follow the same pattern
>> for the gt/engine/lrc workarounds.
>>
>> >
>> > This solve the problem we have were workarounds are left enabled in platforms that already have a HW fix for it.
>>
>> not sure how that solves this issue though. We mark the stepping in
>> which the workaround are supposedly fixed.
>
>Mesa problems was with permanent workarounds, a example:
>
>Some workaround is required by all gen12.0 and dg2 and was implemented with: 'if (gt_ver >= 12)' but then it was fixed in MTL.
>It is pretty easy to forget to update it.


but then the solution is not about where the check is, i.e. in the
caller vs a centralized place. The solution is to generate the
version range or platform from the spec.  If we were to move to a
centralized place without generating that automatically we'd still have
the same issue.... which goes back to the issue of having code
generation in the kernel.

 From a quick look at the mesa impl, what I don't quite understand after
grepping for intel_needs_workaround() and looking a the .cpp/.h
generation:  how do you check if the workaround is implemented/active?
Because 1) you generated a .json from the database, 2) you generated
the condition to enable the workaround for *all* platforms; 3) Now you
can't rely anymore on having that definition to decide it's
implemented/active.  Do you track callers of intel_needs_workaround?
Something else? This seems a little short based on the size
of mesa_defs.json. Or is it just because the past platforms weren't
converted to this new infra?

git grep -h intel_needs_workaround | sed -n 's/.*intel_needs_workaround(.*,\s*\([0-9]*\)).*/\1/p' | sort -u
14010017096
14012437816
14012688258
14014063774
14015297576
14015360517
14015590813
14017341140
16013063087
22012575642
22012785325
22013689345

Also Cc'ing here some other  people involved with the mesa impl to check
if we can improve kernel side.

thanks
Lucas De Marchi

>
>>
>> >
>> > Not sure if such think would be acceptable in Linux, just sharing what Mesa have done.
>>
>> Generating code to be built is done in a few places in the kernel
>> I already suggested doing that for the register definitions, but
>> there are always push back.  I will take a look at this again.
>>
>> Thanks
>> Lucas De Marchi
>>
>> >
>> > >
>> > > -	/* Wa_16011759253 */
>> > > -	/* Wa_22011383443 */
>> > > -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
>> > > +	if (XE_WA(xe, "16011759253, 22011383443",
>> > > +		  SUBPLATFORM(DG2, G10), STEP(A0, B0)))
>> > >  		flags |= GUC_WA_GAM_CREDITS;
>> > >
>> > > -	/* Wa_14014475959 */
>> > > -	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
>> > > -	    xe->info.platform == XE_DG2)
>> > > +	if (XE_WA(xe, "14014475959[mtl]", PLATFORM(METEORLAKE), STEP(A0, B0)) ||
>> > > +	    XE_WA(xe, "14014475959[dg2]", PLATFORM(DG2)))
>> > >  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>> > >
>> > >  	/*
>> > > -	 * Wa_14012197797
>> > > -	 * Wa_22011391025
>> > > -	 *
>> > >  	 * The same WA bit is used for both and 22011391025 is applicable to
>> > >  	 * all DG2.
>> > >  	 */
>> > > -	if (xe->info.platform == XE_DG2)
>> > > +	if (XE_WA(xe, "14012197797, 22011391025", PLATFORM(DG2)))
>> > >  		flags |= GUC_WA_DUAL_QUEUE;
>> > >
>> > >  	/*
>> > > @@ -169,27 +164,20 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>> > >  	if (GRAPHICS_VERx100(xe) < 1270)
>> > >  		flags |= GUC_WA_PRE_PARSER;
>> > >
>> > > -	/* Wa_16011777198 */
>> > > -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>> > > -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
>> > > -				STEP_B0))
>> > > +	if (XE_WA(xe, "16011777198[dg2_g10]", SUBPLATFORM(DG2, G10), STEP(A0, C0)) ||
>> > > +	    XE_WA(xe, "16011777198[dg2_g11]", SUBPLATFORM(DG2, G11), STEP(A0, B0)))
>> > >  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>> > >
>> > > -	/*
>> > > -	 * Wa_22012727170
>> > > -	 * Wa_22012727685
>> > > -	 */
>> > > -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>> > > -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
>> > > -				STEP_FOREVER))
>> > > +	if (XE_WA(xe, "22012727170, 22012727685 [dg2_g10]", SUBPLATFORM(DG2, G10), STEP(A0, C0)) ||
>> > > +	    XE_WA(xe, "22012727170, 22012727685 [dg2_g11]", SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)))
>> > >  		flags |= GUC_WA_CONTEXT_ISOLATION;
>> > >
>> > >  	/* Wa_16015675438, Wa_18020744125 */
>> > > +	/* FIXME: currently there is no support for gt checks in XE_WA() */
>> > >  	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>> > >  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>> > >
>> > > -	/* Wa_1509372804 */
>> > > -	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
>> > > +	if (XE_WA(xe, "1509372804", PLATFORM(PVC), STEP(B0, C0)))
>> > >  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>> > >
>> > >  	return flags;
>> >
>
