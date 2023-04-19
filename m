Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9362CC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 21:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B810E1EA;
	Wed, 19 Apr 2023 21:09:35 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A6F10E1EA
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681938572; x=1713474572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fv0E70xFsCHkK6lV9K96LJSCJCKcDg/I5MXR9XEJkNo=;
 b=LkbOikr9mgcIqxcBAAZGslanmOx2iUJXSle3KK2HeZMWkvVWzjPCpDyV
 QTITtfXGdnhqFJ3zni+zZhRbln+GSTxm/ErPIp9yK/pGRV5H937P0ygxa
 UTyMnysl3l4BFd5KGxSwZUaideEqBW8DrZQhRyaciyiGGRxIP73Dg8XCb
 W3e5Ddr2iB87cN1I4qngWcK/akCOxgokvqpR3KsX+rezdK4A9WkJBGbKD
 lEFeTfIQHbwGsj+m1a24F6nanaMnhML5BPNTrDVVZhezKGX5iyUlnh9+r
 nFBBc+543dJFBidR3K77C+3BxQggv9pmqafZqOwi9OJ6lgHoKkSXiH++r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348316159"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="348316159"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694223961"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="694223961"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 19 Apr 2023 14:09:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 14:09:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 14:09:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 14:09:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 14:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmQdjyRy3c2EifakHRiW+TumaLIfWjZXcTIvOLLGX05GXVrMrH4OJtEzH+XFTrZp51Y8NrDkWmse/RBUL9TQlj/Qf7dsgHfGBXfV8Od18Oa4LP9kPiKdgy0129X40iM0UMKErTJCD53WUdaUhEbKmYipYn18eHrJTRaUxm8QKKm4kuc5nk/FCel2VKiSwFPJ14dba+wEr5g7ZXKT0dNqa2VD5M/0yfitRWxH4ecxn+mIzk6d2WVfIcLjulKHCiRhtcXzABvauc3v2/Du+TIYtlz32+8aDBg6xKZ4DD9T+0Z/KG0/N3Oy0naYmuuZZn0oEcVfrz0xzqu5KshTsA6eSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE67giDwjplRhDwnMKBpu0KISdd9CkRya9f7HcTaHQ8=;
 b=ayfHDqaq+6PkfQJ+oK6M8T68AU27xRfrfI2pfb55a8k6ejVEgu/l4v8novbD5CoiFZbz/ZXQPdOGtbn4fCJEB08lBiNxlUi9Fr1HyY411mbMUvKcrJMj26ZVK27XHkQPn6CUPC4rt8ANHl9Lq5xoKcNqm5aBdPSHO4481Ocx9UkNQHkt7+2/t/y6LGQUanzqShDlfYGvPF5EbXH55kl5t69wvN1DZ8L/YgDkGQy4fPebtru2gES5NO5vmq7j+cEMYx06iFNuLYA4C196hIMyAuTHsIejRkqaVjs6kEOLAsFXVUohC98O+TyR2ithtCvvhaEDvf1KZAelhl7o/YXLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 21:09:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 21:09:22 +0000
Date: Wed, 19 Apr 2023 14:09:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <wylzxo5vm74xlkfzm6pvv5zdwmh4tfmo6yal3k6epd5nc4hgwr@fa2dekbabk2z>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
 <ZEBBSS8d4uoW5KfS@intel.com>
 <whic2z65emjgsfnnnpyh4hmmfdzb3jtjsxjwzxdlq76nu2s33d@36gc4ex4qghk>
 <20230419202431.GK2825255@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419202431.GK2825255@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0039.prod.exchangelabs.com (2603:10b6:a03:94::16)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9e5545-2b21-49cf-d597-08db411a5914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lwzSYdXRQi9mu8iPZFN3JVBNEWSaHxtqf69DNlLxZIr6jzhwkioemRDvFy0KrchOJ9A+jx0EUWUGc6oHl2Ep7szlG82ymH7mIBWnyBN9t3LNiAdcBnhUj0qiMDZuzf8GrpGRELLEmtpjZMkcAy6Z5tH3iADrpMjV3/yWMe/s1cU7LeAHMnHiUHGYAz8tLef7BlduO8pIb9FHISo4QUlXAh/3dCvigt+vGqVjPlbwo67XRzrdJeP3Rc+nvXhHa5bCoiba+10Xn2hMerPALuOaSX4gOMwJi8FIz9HLyc3YXRx8GYcelfbHKhIidOtbBOkymT/3ypJFhZz9C+XzalAv/PZrJ6XfIBqn2V/qG7X/FxZfcy3j0cNnUDQ3a9HL6dS/h7UNTHmL/FfTkmuNCgdlGZN5Ilyxhsu7tJEIrkauEe+b4OZ6vG+Cv2+CrdyIvb5fnY2ErZbwYNwRhFL6TZ2r5/XXUFCCaiTo0W+Ev5iJFf73W9t0xRwA09gLDmtvOtfLGd7uW/rjlXE3tQtJWPmQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(6486002)(966005)(478600001)(86362001)(83380400001)(186003)(9686003)(6506007)(82960400001)(26005)(38100700002)(6512007)(316002)(33716001)(66946007)(66476007)(66556008)(2906002)(5660300002)(8936002)(8676002)(6862004)(41300700001)(4326008)(66899021)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EiGf3Sl6Wc6+lGpG4mcmdh2ivvOmftSx9YxDIfj2mnGELcc+bB1Ld4QQMrbq?=
 =?us-ascii?Q?EsTTL7jWnqdFRdqtRLIUmUhqpPSrQVeMoe5xnDYYJnVQbeDQJtj41497y9wB?=
 =?us-ascii?Q?ULiCVhtusRsTUsYGJMPIR9wE84dWthAxD5yNIDMNGqnqw4e1m3HZ1nC6G25x?=
 =?us-ascii?Q?90jNuKpab3dv0sXP/rmm0TPiRirXsvArdBKRuHdxp/jGiQoiVlhmizBQWpD6?=
 =?us-ascii?Q?hUyMrodB1Dz8vmHHRGaGfAF2M52ysEv0qrdj9ztIb1l+8qzYAbFULUfHukJ8?=
 =?us-ascii?Q?wVtjFOpByTskVHUb/e9z2/ZRf/Sm40jjor/yt8dyqqnF/5l59euW1nzbKfqa?=
 =?us-ascii?Q?TLqNPiWLHrqqu083DGVP+d52xF5B58UmCPS2BQ39eDHtifBEX77lBvvSYL83?=
 =?us-ascii?Q?RTEwk31ddNfy6K2RicFHvwBjqiWK/BJtVt+5DSjWg8+5sAnD335xdNKrGukr?=
 =?us-ascii?Q?F6TVUlH/e7/nT9aN8tyyKdkX8AVxHMTEoTQQQYkC9ByQ3kY7qKqRokZIx/Ci?=
 =?us-ascii?Q?1kCqDL6uUEzeJleMZ/1NESS65+YiDEPwtw1/Y5awvhgNyvm26f7tH3s6vuuM?=
 =?us-ascii?Q?taoJIT1KwPrQsSoRvwD7NwCxUrvpA6o61P6o1D3KY7HE5waudan972kE7Aaz?=
 =?us-ascii?Q?yeLRn4l9UMYpqzxO89osG/dAbEXhvmYaE34FAWs1EpWSLwa8P79ZQesf4Sxo?=
 =?us-ascii?Q?M987amDy1moPl6kZ6k7o1XR/WlV0CTfmikhO1f+936lbCVp1jGOYeo3gyTZ3?=
 =?us-ascii?Q?/DYDrZWDHgRqo45vKOjfb5GKDs+G5SN8HevDOs1BP4QKobSbrLVimRCm8ADm?=
 =?us-ascii?Q?xn+0OLH9wKZiAJ9+fMdO/avkSto2szvnrW9JF1+iYRjE9O92YDRAfWVCMCIO?=
 =?us-ascii?Q?RzXmpiIhzpMnLxwkXzRN7yEN1sFVJ3ZlDJyp6oChFnlR2L/nJc4RU6tQ85Le?=
 =?us-ascii?Q?TAyUAcGUkhWVO+BPyHUlVccJFnDOCXwVAJAHG4RY8HRhgp1W2ZGNpcFn3u3b?=
 =?us-ascii?Q?eoMJmVS+l42oS8kiQRQ/1pCkUWAnoahNWfaUkVZF0sY10Vu6+XnaHYjRCOAr?=
 =?us-ascii?Q?aYgBPYijSomko38xWTBQBJYnS0dhiA0bEfKtAo7P0WiJ4ggPzjDk0Ntpz1JM?=
 =?us-ascii?Q?24J/uzMAWrY0YzfPoVZLHP8zudbbYtQgV10eT4Dl4DC0h+TvBpKS+DY1lKvV?=
 =?us-ascii?Q?V9g0rZA7/hq2Lmg18g3Prkfu/qL/T0MutN1UEhH9lmma6k/2Vm/t34WExerz?=
 =?us-ascii?Q?2TYCySFXUe9Ro8lM3x/BCnfQynNpG4M7iXxriTdatIRYVx3bgdj7VvAHQQij?=
 =?us-ascii?Q?bTSjJ87Wa6bs6oQPJOcKWaaFBIFtpr/wS2LOVWIfV3PWrh72VM5KSRm7tY35?=
 =?us-ascii?Q?8JXpjHorgRY1hXs0tb1gdfkIWDyy5wpmrKMl0WPpyZ1QTnIJ6HWrDf5ev0w1?=
 =?us-ascii?Q?CKMDOyTyw1DSRQtUeOMbbS2EltgQ3AgcRvFyXN06rCgvIlh8jg+yVdFPBHqw?=
 =?us-ascii?Q?pI6Ouge/IoYIqBuqVB4R5jRNxgMFel0R/PCLiI/117zmWu9oXEyRze5SDG2y?=
 =?us-ascii?Q?5uoExFDSsszCXGNClUNHmVTFwKQ9Wi5UgzLBIro2Q2Wjb+ZQ0GL7Hjm3j0ov?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9e5545-2b21-49cf-d597-08db411a5914
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 21:09:22.4762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qfW2MA3QA4KsHgyeyHJausRmOTz5Q9lnXXHCXZimTfCXxnPm+FGPIfX27dsew+i8fR+pwne8VlBnl2KMLiDraYgcPuHH0ZJxTOlQrAXn8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 01:24:31PM -0700, Matt Roper wrote:
>On Wed, Apr 19, 2023 at 01:19:49PM -0700, Lucas De Marchi wrote:
>> On Wed, Apr 19, 2023 at 03:30:17PM -0400, Rodrigo Vivi wrote:
>> > On Wed, Apr 19, 2023 at 11:49:56AM -0700, Lucas De Marchi wrote:
>> > > On Wed, Apr 19, 2023 at 10:33:45AM -0700, Matt Roper wrote:
>> > > > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
>> > > > > Stop using i915 types for register our own xe_reg_t. Differently from
>> > > > > i915, this will keep under this will keep under the register definition
>> > > > > the knowledge for the different types of registers. For now, the "flags"
>> > > > > are mcr and masked, although only the former is being used.
>> > > > >
>> > > > > Most of the driver is agnostic to the register differences. Convert the
>> > > > > few places that care about that, namely xe_gt_mcr.c, to take the generic
>> > > > > type and warn if the wrong register is used.
>> > > >
>> > > > The disadvantage of this approach is that we don't get the nice
>> > > > type-checking that we have in i915 to catch register misuse at build
>> > > > time.  Instead we wind up with a bunch of run-time checks that only tell
>> > > > you that you used the wrong register semantics after the fact.  Wouldn't
>> > > > it be better to keep the strict types and let the compiler find mistakes
>> > > > for us at build time?
>> > > >
>> > > > The only real problem with using strict types is that there are a few
>> > > > places where the driver is just trying to refer to registers/offsets
>> > > > without actually accessing them (e.g., whitelists, OA register groups,
>> > >
>> > > that is not true.
>> > >
>> > > > etc.) and the strict typing makes it harder to provide a heterogeneous
>> > > > list of those registers.  But I still feel the benefits of compile-time
>> > > > checking outweighs the extra complexity we wind up with in a handful of
>> > > > places.
>> > >
>> > > I disagree here because the strict type checking is only checking for
>> > > "regular vs mcr". Add "masked" in the mix (that has been a huge source
>> > > of mistakes in i915) and you already have 4 types(?) to deal with.
>> > >
>> > > There are also places in the code where we want that "this is an
>> > > mcr/regular/masked register" info to be used later. See how the reg-sr is
>> > > handling that.
>> > >
>> > > In the end I believe having this info encoded in the regs/*.h is
>> > > sufficient to avoid the mistakes we had in the past.
>> > >
>> > > Any change in the code triggering these warnings has a very easy an
>> > > actionable fix.
>> > >
>> > > If for some reason we want to only differentiate mcr/normal as strict
>> > > type checks,  then I think we need to provide a better struct for the
>> > > places that don't care about that. Something like below maybe
>> > >
>> > > 	typedef {
>> > > 		xe_reg_t reg;
>> > > 	} xe_reg_mcr_t;
>> > >
>> > > but reg.mcr still being there. Or going the other way around:
>> > >
>> > > 	typedef union {
>> > > 		xe_reg_normal_t normal;
>> > > 		xe_reg_mcr_t	mcr;
>> > > 	} xe_reg_t;
>> > >
>> > > but xe_reg_normal_t and xe_reg_mcr_t actually having the same defintion.
>> > >
>> > > Lucas De Marchi
>> >
>> > I honestly liked the approach you took on this patch here. Getting rid of
>> > the i915_mcr is already a win by itself.
>> >
>> > One case that came to my mind though is some time sensitive mmio operations
>> > like display inside vblank areas. any runtime check could potentially
>> > increase latency, no?! If that's irrelevant time, than let's move with this
>> > but if it is really a problem, then explore your latest suggestion here
>> > with the compiler doing the checks for us seems a good alternative.
>>
>> the additional check is inside xe_gt_mcr.c... I think the additional
>> check is negligible compared to the other operations there, with each
>> access to reg X requiring other 2 mmio accesses to take place.
>
>The super critical checks (which don't exist yet in this series; they'd
>presumably be added in a follow-up series) are the ones to make sure you
>don't try to call xe_mmio_{read,write}32() on an MCR register.  Doing
>that can lead to all kinds of subtle bugs (which become even more
>problematic on the more recent platforms), and unfortunately that kind
>of mistake is what people are going to write in the code 99% of the time
>out of habit.

I'm not sure when that would happen... when the next GPU changes a register
from normal to MCR, we rightfully updated the header to update its type
and forgot to change the calls using that register?

Currently xe_mmio_* receives u32 and we just do FOO.reg, with reg being the
name both in i915_reg_t and i915_mcr_reg_t. So, right now the different
types are not helping anything.  I'm planning to add xe_reg_t to
xe_mmio_* and have a companion xe_mmio_raw_* for the cases we use a u32
(one of the reasons being because xe_gt_mcr.c itself also needs to call
xe_mmio_*)

How does the type protect us against "daily task of enabling the next
generation of GPUs?":

	- gpu version N+1 changed register FOO from normal to MCR.
	  we didn't notice the register changed. Type doesn't help
	  because we are still using the old one.  If we did notice,
	  the type would only help if adopted the approach "change the
	  type", build and see what breaks to fix it, which is IMO
	  worse than a git-grep approach.

That would mean the hw changed a register from being MCR to being a
normal register which is more rare than the oppposite: a normal register
becoming MCR.

Even if we do the strict type, it doesn't protect us from such mistakes
when we have a normal register becoming MCR. We will have this:

	#define FOO	XE_REG(10)

and will continue to happily call xe_mmio_* even if in version X of the
GPU the register is now mcr.

Hence my point: the header with the register definition must be the
source of truth on the different register behaviors*.  The additional
type checks only help in some cases, and make it harder to handle
others.

On the other hand, I think the different types would be handy when/if we
have the following:

	#define xe_mmio_read32(reg) _Generic((reg),			\
		xe_reg_t: xe_mmio_raw_read32((reg).reg),		\
		xe_reg_mcr_t: xe_gt_mcr_read32(reg),
	)

because that would eliminate an entire class of bugs, encoding in each
call place what is the right function to be called based on the
declaration in the header, with no additional overhead... 

Lucas De Marchi

* https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/204 and ideally
   be generated from the spec with proper filters in place so we don't
   blow out the size of our headers.  My goal is to clean our headers and
   have them in a state that would be 90% identical to something
   generated by a script parsing the spec.

>
>
>Matt
>
>>
>> Besides, there is no such user in display/
>>
>> 	$ git grep xe_gt_mcr -- drivers/gpu/drm/xe/display/
>>
>>
>> Lucas De Marchi
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
