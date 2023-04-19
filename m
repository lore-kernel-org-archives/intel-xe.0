Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFF6C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 23:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48C10E247;
	Wed, 19 Apr 2023 23:38:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93E210E247
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 23:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681947523; x=1713483523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h/4bV4U7Z/7ETkYvnSLAt//5W95z1xwoj3GtWd4BN6Y=;
 b=gv9/QupGdMMY+eSTVZYX4x4PC7rxebxTekn9ARxMS1zxgP/dewBW/Lnt
 YWYX+LBiKOQdJJmxUYWC/fKmGoFY834GUVBf2qEE0evfBV23LswyNpMkF
 diSHmU+A2t2ocF/R5rJVNFM75GxEtNh74AiR0H+xxiwdEmo27VRieoJ4U
 Ez/cKLq2kjbwEWg2HJhT2aLuUmsJwe30FVsMvYlDV34osTePeGnVjqzYm
 3q7hU9otkqFbtp5HIurRTSDGI1AiLAI5o4hp9P8URwXPIIj3zSf4VaHEb
 5hraD/FNaVMt9LQStHQSuP1vemnzwW42mO6RR8IYsozkY2hwZfPrzWYR8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="343068949"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="343068949"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 16:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815798612"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="815798612"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 19 Apr 2023 16:38:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:38:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:38:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 16:38:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 16:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtJKSWNKE0BZTypTqKZmY/T8ttu6px4cx/w/1AGOB6oJf6EJYDSMtYtxCCweJtb/2IvoTx7qE6cjWDyTQ0+tG0KpGSupMY9pcDjaNg3S2ipXnOb39JKUnyRt22qtk7K6L7998OQyGAoK2wSrtOP0UyyjD/SEPc1kh/1+nAtOEeH1zKZaknVDt+1aXE9UdzrNZWiPSq+gIP18H9g3xzioBkvhbcsU9zYW60mMTrCGJKm8chIpTLZluVNt4J831f39sUrmZI13MkaiRgiYeptbvI3HlQ0kMx9CIVISBX0QM4iJtwEKzAs4zeFjN+/XmloycsHuoV1Rt4169pim6mMU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4RX9dF5rcOgRamMFbEdkETc179I36dRGik0MCi2oz0=;
 b=A3exSsAJ2Ci21WpPriMmGbgmTjZKox4Q+QDvjL/YMO11QfryLTgESHEVaKFHCDUU7Lo7F6J4jGQ3Q5mcEy1QGaEaoyGN1kvAgIFT0+UbFRSYX7hOZXIeETw5nVcyLe/HK2PiCWcsDz2PAREyqRfsWwUb2kG2k98FQiAC0O1CfHFChIxrT4PPSBolJwKa7AHU8O6zlXXXja9zLZ0um/zh/bh4se5TvTXt6f3nUC0P4HsfjiJgDM1e9FoLn+gO8j/ga8ALpzpoC+JYo0udi5C3zVr2avnfvWotWS++MLAA4WcbKlEd113oXa9AMFr6+vxdz6zLAaQbWPQ54X0W+T/Oeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 23:38:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 23:38:38 +0000
Date: Wed, 19 Apr 2023 16:38:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <xxyuo62qxllxqqznskbjn2fstocbqgxxppme3lbvf7g7e5e3p2@6ojvnkzstvtc>
X-Patchwork-Hint: comment
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
 <ZEBBSS8d4uoW5KfS@intel.com>
 <whic2z65emjgsfnnnpyh4hmmfdzb3jtjsxjwzxdlq76nu2s33d@36gc4ex4qghk>
 <20230419202431.GK2825255@mdroper-desk1.amr.corp.intel.com>
 <wylzxo5vm74xlkfzm6pvv5zdwmh4tfmo6yal3k6epd5nc4hgwr@fa2dekbabk2z>
 <20230419231445.GX4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419231445.GX4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: 419b1c9e-a55a-4c7b-9ad9-08db412f331a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5Aumx2wJP0r79ppz3SdRfljkoH+DKHMOReiM/OnyQ8EMtvLrxnN5HuHiVlHZAMfuW4r6hhaRmpAnvmM7m7CkJLwV6wUoKuaQqd7O0Qa2XOXQdV39oSHoWcbNDqJLkF3MTVsPG43KhmARJcgDABSk5XA8OZdHkBuQt3uAHzkh8hADrJzHaiEkMgMUVd05gMISzWwkiClOUBg6xf3I/d8FPV5Xz5PKPBq4QZ5/LEYHHhyysU/2s3WN5KcWuHtpt8WL0Kiyk7XwBg1A8ZuLvV48KnetDizrUCmSEJWD8qsP8n5nvein3HZzu9nfxbdD9hz8asLEXld6RB6+EUWlWABopx7GNj7Er2cgTniyix6xONuNfyjqRTzPkaRHsHcptly189lrF3PFHun7YcAFjx2jpPD91kuU9lEe9YtF2040NuYGCwbOjCA3I51jJFRDdTRljJd9Lg8IXfxc0orjrY2NvOEH+hS6fvZwUKm+lSH7uCN+/cs+OeuOsexpusjMfFat+/43hcQ2mWiLGjPwWv0kFZMQqZhoHXTXms1w7YdtGC0AK6oSLo8nIINTh5Dk3Xs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199021)(66899021)(316002)(66556008)(66946007)(66476007)(6636002)(4326008)(186003)(6506007)(6512007)(26005)(107886003)(38100700002)(9686003)(83380400001)(8676002)(5660300002)(6862004)(41300700001)(33716001)(6666004)(8936002)(478600001)(6486002)(86362001)(2906002)(30864003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U2B9J/oszRRKORhGL2+7rDmbgExaCwn+m0FKnKfNU5ok/hkq/DXdcmX+Obw9?=
 =?us-ascii?Q?sdwGEjFA5l6JWZqrGI1NUcQZ/jei+/7XJOHCswpuO9mXgGBqS0jPIDuHtCCk?=
 =?us-ascii?Q?Ishu8uUQ0UW5ML0s+dLoy0ynzhJILw6u2NuLdlZoxOM4wEr+AfSgTFwI1dfv?=
 =?us-ascii?Q?JwW32mAV01zI6kiLOdpFP8xD+nPaiL9K0M3jTwLJc+Jvfj/BkT9wNRZxJVDH?=
 =?us-ascii?Q?G8NZOpu+WDXK3iz0oZnFAHfj87b20HP8TWFa/rpIbh/a1dDKFCWrxV0EUWBK?=
 =?us-ascii?Q?EzMLlNA6GBd7wc9O40BCLARL8IfFg9J8PFFV0fpLlj7GuO9+z51/rvsoTsge?=
 =?us-ascii?Q?r9ZPsTnaGtLdN1Q8HQle7hKzqzEjMWqlJjpcYzNg/AGz5eG86a/D95Mbc9H2?=
 =?us-ascii?Q?P2LCfaacWHODLOQoNJ+i3/ZDefdOCFoVZ1eCrc2xR81JE3URT7Fz8X2+VH62?=
 =?us-ascii?Q?O+BAPZKpq+PNGkCSW/xvwAH0H6Pos7mvqJvFLHh6PnnxL1Cruga+CX/C1eKS?=
 =?us-ascii?Q?FgQBEBXD75vC6xrwvDhjfkLAWusbIpNhX/iqUA7lKAznMYADZExJHd2ynK6T?=
 =?us-ascii?Q?u4PeP8xO7eR550pxRbFUBKsyr2AF2CTCTCFHG6twHpavFrJIOvn/FX5tCxzZ?=
 =?us-ascii?Q?s94rPIW91I62YIkveOB0faHMYlta969YxfWQ6tKY7xAujqlQLdfWR9ALS7eL?=
 =?us-ascii?Q?Uh7v0jByta+Sml4NGfvpEtDd2TwKsLYutMEvhGmXZZtar3nPGPWCIiUDYMux?=
 =?us-ascii?Q?1w7NZzRIzsXRgfEJNpVVQ2pAD5NcjugbUPCFVzKTs9IMYNnluACmsOiYQpmM?=
 =?us-ascii?Q?So0vebopEUMurCDGv8n2349JixEpLh4TGQ6XadybRLxCq+9dgptF19ngH0Pi?=
 =?us-ascii?Q?2F2WHRXZI869ZrQkJChv68DAinjzrHAKPxxayS+E20g2ZM5OGO2h3dCgEYue?=
 =?us-ascii?Q?FgCfdL5fgVO6nUk8Mq+g2+IfUy/OvE0rkkPTV6eFZUwIONVHOVl5t6kMUaDU?=
 =?us-ascii?Q?x3ex8SliVMZ1gQdh1ED4AUaQRPBdbdf+berKl/YW4d00+nVIdZHx7n4bE4Md?=
 =?us-ascii?Q?tnrlurxD67sWLdcoMF7MKBNmSgnzZI2TyLQ2TdJB39eeM4i5Vs9cMM+mLMu6?=
 =?us-ascii?Q?MmqO93lH7kN2FKxtEuQZ59B8eaphBkP94RMrF1DErCdmEfI66Keho88ZY7zQ?=
 =?us-ascii?Q?lpEz0R9rTQJff7qt0z3kS/mbgjvg8Bhg0W1dQxAiHF8iqll5vBK4++l+tJ3P?=
 =?us-ascii?Q?m0hOFxB0doOyGVgun9GrChOzBaYfVI9rLlgS/eba49dvMKfSsdCWkgdIsOBV?=
 =?us-ascii?Q?YSDuif7GNo9+AJ+sKiydNaOglFYyra7dy5BSAVbY1cK7or8YJ9I/n0ozj+yA?=
 =?us-ascii?Q?o5oDCWnUqta/LcdGL0k/vExSFqqmQhbESsoxXTpfRfk+k7grbQiSVAXrWmf9?=
 =?us-ascii?Q?RX5ETj2a60aOREzCKPECcHxBShkHOTv+PoS9I2CmPsMbh6wgbr5TONOThq62?=
 =?us-ascii?Q?VcchjNehXPLr96BBeiV0ls3ViUKPJ7DE4YcA+tridvMQ8ohUQ8/bz+eUGZ61?=
 =?us-ascii?Q?NkZY1xtiru+UzIQJiRaX3LPxK5Gxk/knKCZh4iOCS5/iGBvvlYTOzYANV/PF?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 419b1c9e-a55a-4c7b-9ad9-08db412f331a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 23:38:38.1646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA9D1anTesq12k0ZZdwk3gKG5oty2/eHP7hFAHYvPyB5aDOBW3Iffyg8LjIje6yjTuoMJ9okt4++I9b/FYL9TehD7lev/1ad3k+10XN8nhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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

On Wed, Apr 19, 2023 at 04:14:45PM -0700, Matt Roper wrote:
>On Wed, Apr 19, 2023 at 02:09:20PM -0700, Lucas De Marchi wrote:
>> On Wed, Apr 19, 2023 at 01:24:31PM -0700, Matt Roper wrote:
>> > On Wed, Apr 19, 2023 at 01:19:49PM -0700, Lucas De Marchi wrote:
>> > > On Wed, Apr 19, 2023 at 03:30:17PM -0400, Rodrigo Vivi wrote:
>> > > > On Wed, Apr 19, 2023 at 11:49:56AM -0700, Lucas De Marchi wrote:
>> > > > > On Wed, Apr 19, 2023 at 10:33:45AM -0700, Matt Roper wrote:
>> > > > > > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
>> > > > > > > Stop using i915 types for register our own xe_reg_t. Differently from
>> > > > > > > i915, this will keep under this will keep under the register definition
>> > > > > > > the knowledge for the different types of registers. For now, the "flags"
>> > > > > > > are mcr and masked, although only the former is being used.
>> > > > > > >
>> > > > > > > Most of the driver is agnostic to the register differences. Convert the
>> > > > > > > few places that care about that, namely xe_gt_mcr.c, to take the generic
>> > > > > > > type and warn if the wrong register is used.
>> > > > > >
>> > > > > > The disadvantage of this approach is that we don't get the nice
>> > > > > > type-checking that we have in i915 to catch register misuse at build
>> > > > > > time.  Instead we wind up with a bunch of run-time checks that only tell
>> > > > > > you that you used the wrong register semantics after the fact.  Wouldn't
>> > > > > > it be better to keep the strict types and let the compiler find mistakes
>> > > > > > for us at build time?
>> > > > > >
>> > > > > > The only real problem with using strict types is that there are a few
>> > > > > > places where the driver is just trying to refer to registers/offsets
>> > > > > > without actually accessing them (e.g., whitelists, OA register groups,
>> > > > >
>> > > > > that is not true.
>> > > > >
>> > > > > > etc.) and the strict typing makes it harder to provide a heterogeneous
>> > > > > > list of those registers.  But I still feel the benefits of compile-time
>> > > > > > checking outweighs the extra complexity we wind up with in a handful of
>> > > > > > places.
>> > > > >
>> > > > > I disagree here because the strict type checking is only checking for
>> > > > > "regular vs mcr". Add "masked" in the mix (that has been a huge source
>> > > > > of mistakes in i915) and you already have 4 types(?) to deal with.
>> > > > >
>> > > > > There are also places in the code where we want that "this is an
>> > > > > mcr/regular/masked register" info to be used later. See how the reg-sr is
>> > > > > handling that.
>> > > > >
>> > > > > In the end I believe having this info encoded in the regs/*.h is
>> > > > > sufficient to avoid the mistakes we had in the past.
>> > > > >
>> > > > > Any change in the code triggering these warnings has a very easy an
>> > > > > actionable fix.
>> > > > >
>> > > > > If for some reason we want to only differentiate mcr/normal as strict
>> > > > > type checks,  then I think we need to provide a better struct for the
>> > > > > places that don't care about that. Something like below maybe
>> > > > >
>> > > > > 	typedef {
>> > > > > 		xe_reg_t reg;
>> > > > > 	} xe_reg_mcr_t;
>> > > > >
>> > > > > but reg.mcr still being there. Or going the other way around:
>> > > > >
>> > > > > 	typedef union {
>> > > > > 		xe_reg_normal_t normal;
>> > > > > 		xe_reg_mcr_t	mcr;
>> > > > > 	} xe_reg_t;
>> > > > >
>> > > > > but xe_reg_normal_t and xe_reg_mcr_t actually having the same defintion.
>> > > > >
>> > > > > Lucas De Marchi
>> > > >
>> > > > I honestly liked the approach you took on this patch here. Getting rid of
>> > > > the i915_mcr is already a win by itself.
>> > > >
>> > > > One case that came to my mind though is some time sensitive mmio operations
>> > > > like display inside vblank areas. any runtime check could potentially
>> > > > increase latency, no?! If that's irrelevant time, than let's move with this
>> > > > but if it is really a problem, then explore your latest suggestion here
>> > > > with the compiler doing the checks for us seems a good alternative.
>> > >
>> > > the additional check is inside xe_gt_mcr.c... I think the additional
>> > > check is negligible compared to the other operations there, with each
>> > > access to reg X requiring other 2 mmio accesses to take place.
>> >
>> > The super critical checks (which don't exist yet in this series; they'd
>> > presumably be added in a follow-up series) are the ones to make sure you
>> > don't try to call xe_mmio_{read,write}32() on an MCR register.  Doing
>> > that can lead to all kinds of subtle bugs (which become even more
>> > problematic on the more recent platforms), and unfortunately that kind
>> > of mistake is what people are going to write in the code 99% of the time
>> > out of habit.
>>
>> I'm not sure when that would happen... when the next GPU changes a register
>> from normal to MCR, we rightfully updated the header to update its type
>> and forgot to change the calls using that register?
>
>It happened really frequently on i915 until we finally added the strict
>typing.  It's not a matter of adding new platforms, it's a matter of
>just writing new code in the driver (generally for platforms we already
>have and with register definitions that already exist).  When someone
>needs to add a new register read/write operation for something they're
>working on, they'll generally reach for xe_mmio_*() out of habit (or
>intel_uncore_*() on i915) since that's what gets used for 90% of
>register accesses.  If the register is actually an MCR register, and the
>compiler doesn't catch this for you, then you just wind up with
>incorrect semantics at runtime.
>
>Of course nothing is foolproof.  If the read/write is against a
>completely new register, and the patch is adding both an incorrect
>register definition _and_ an incorrect usage at the same time, then the
>compiler won't help there.  Although the fact that a completely new
>register is being defined makes it slightly more likely that the
>reviewers will scrutinize the register details more carefully and catch
>the incorrect definition.  It's a shame that the MCR nature of registers
>isn't documented more clearly in the bspec...
>
>Cases where the same register changed type between platforms is also a
>problematic case that will never be foolproof since we wind up with
>multiple definitions for the same register offset; if you pick the wrong
>definition _and_ the wrong access semantics, then the compiler won't be
>able to catch that either.  But again, the multiple definitions with
>different types will still make it more likely that the developer and/or
>reviewer take a closer look and realize the mistake.
>
>>
>> Currently xe_mmio_* receives u32 and we just do FOO.reg, with reg being the
>
>Right, this is obviously completely wrong and was something I raised as
>a concern months ago when the first Xe megapatch got posted.  I started
>typing up a fix for that a few weeks ago but got sidetracked and didn't
>finish it.  xe_mmio_* should obviously be accepting i915_reg_t (or a new
>Xe-specific equivalent) rather than a u32.  That will protect against
>both the 'misordered parameters' problem Jani mentioned, as well as the
>'used wrong function on an MCR register' problem that was problematic on
>i915.
>
>> name both in i915_reg_t and i915_mcr_reg_t. So, right now the different
>> types are not helping anything.  I'm planning to add xe_reg_t to
>> xe_mmio_* and have a companion xe_mmio_raw_* for the cases we use a u32
>> (one of the reasons being because xe_gt_mcr.c itself also needs to call
>> xe_mmio_*)
>>
>> How does the type protect us against "daily task of enabling the next
>> generation of GPUs?":
>>
>> 	- gpu version N+1 changed register FOO from normal to MCR.
>> 	  we didn't notice the register changed. Type doesn't help
>> 	  because we are still using the old one.  If we did notice,
>> 	  the type would only help if adopted the approach "change the
>> 	  type", build and see what breaks to fix it, which is IMO
>> 	  worse than a git-grep approach.
>>
>> That would mean the hw changed a register from being MCR to being a
>> normal register which is more rare than the oppposite: a normal register
>> becoming MCR.
>
>The strict type safety protects us in both directions.  xe_mmio_* only
>takes unicast registers (after the obvious fixes to replace the u32
>parameters), xe_gt_mcr_* only takes MCR registers.  If you pass the
>wrong register type to either type of function, the compiler catches it
>immediately.  As you noted, it's still possible to combine two bugs
>(incorrect register definition + wrong usage semantics) to sneak by the
>compiler; that will surely still happen, but we've raised the bar and
>made it harder.
>
>Having registers change between MCR and non-MCR between platforms is
>still a problem, but not the most common one based on past history.  The
>much more common source of problems is people just writing new code that
>uses registers we already have in the driver.  Assuming the definition
>is correct, the new code has to be correct too to get past the compiler.
>If all registers become the same type, as you're moving toward in this
>series, you could also probably get similar guardrails by turning
>xe_mmio_*() into macros that do a BUILD_BUG_ON() before calling the a
>real __xe_mmio_*() function, although then you run into issues anywhere
>that non-constant register variables get passed up/down the callstack.
>
>>
>> Even if we do the strict type, it doesn't protect us from such mistakes
>> when we have a normal register becoming MCR. We will have this:
>>
>> 	#define FOO	XE_REG(10)
>>
>> and will continue to happily call xe_mmio_* even if in version X of the
>> GPU the register is now mcr.
>
>When enabling a new platform and implementing the MCR stuff for the
>first time, we do need to be careful to not only add the new ranges to
>the driver, but also to go analyze any registers that live in a range
>that changed.  If there's code that will still be executed that works on
>those registers, then we need to figure out how that code needs to
>change.  We can't automatically assume that writes should become
>broadcast_writes and that reads should become read_any's (although
>that's the most common outcome); in some situations we actually need to
>re-write the code to loop through the various hardware instances and
>handle them all independently.
>
>>
>> Hence my point: the header with the register definition must be the
>> source of truth on the different register behaviors*.  The additional
>> type checks only help in some cases, and make it harder to handle
>> others.
>
>With xe it seems like we have a lot fewer areas where multiple types
>become harder.  IIRC, the biggest pain points on i915 were GVT and
>cmd_parser since both of those needed to provide giant lists of
>registers with MCR and non-MCR mixed together.  Both of those are no
>longer relevant to Xe, so I think the main areas that will still have a
>bit of pain are:
> * OA/perf register lists
> * userspace whitelist (although I'm not sure if we ever whitelist MCR
>   registers...userspace would have difficult steering to specific
>   instances)
>
>>
>> On the other hand, I think the different types would be handy when/if we
>> have the following:
>>
>> 	#define xe_mmio_read32(reg) _Generic((reg),			\
>> 		xe_reg_t: xe_mmio_raw_read32((reg).reg),		\
>> 		xe_reg_mcr_t: xe_gt_mcr_read32(reg),
>
>Unfortunately there's a trap here.  There are multiple ways to read (and
>write) a multicast register and it's very important that you explicitly
>pick the proper semantics to use.  Sometimes you want just want to read
>any random instance's value (e.g., when verifying that workarounds
>stuck), but in other cases you need to read and process every single
>instance independently (various error reporting, INSTDONE, etc.
>registers).  Likewise, sometimes it's okay to broadcast a single value
>into every instance of the register, but other times we potentially need
>to write different values into each instance, or even do per-instance
>RMW's to avoid clobbering other bitfields.

I still think the extra type gives more a false sense of safety here.
Anyway, it seems an area we've had issues in the past and it will be
hard to reach a consensus on changing it.  If we were talking about this
a few days ago, I'd be very sad because that'd meant my plans to fixup
the hacky #undef in the rtp part was dead in the water. However with the
new macros I think I can workaround that and work with both types.

So... going back to what I said above:

  	typedef {
  		xe_reg_t reg;
  	} xe_reg_mcr_t;


Would you be ok with that? The information I need would still be
available in the register definition.

Inside xe_gt_mcr.c it then does an up-cast.
We keep the up-cast macro private to xe_gt_mcr.c so nobody tries to use
it elsewhere. Example:

u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_mcr_t mcr_reg)
{
	const xe_reg_t reg = to_xe_reg(mcr_reg);
	...
}

... probably to be done only in the few functions accessing reg.*, not
the ones passing it around. And then we probably need to rename reg to
"addr" or "off".

Thoughts?

thanks
Lucas De Marchi
