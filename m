Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5D1C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCB510EA8F;
	Wed, 19 Apr 2023 19:30:40 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C98210EA8F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681932638; x=1713468638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t4OdAlz5uxJfO5HUUqSoqvSNMB7UbTFhnNmcT11B+J8=;
 b=l4CzMfNThQUtacxJafD7PYg9H1GUg1v1ZWw+I2V3R9WGvMpYHOqPoFGm
 NGAofDGtfN0Ns0gZHg2uK8OEfuUe+WxSpDGzmAjbrCN1itUtJP9kqbDzp
 DJTRTrT21P2WPeqjmw8GfFrCI+qXaNBPmywkAeXGbFyLSLq6FGj7N7mGM
 Vre4+V19MCnikTxzHuwDDJiPUwzGB2qy34GTyrfsexRU+ktWWo4zijGzF
 yzbQeP39BbaYhl34StFsFswsR5gXtj356vYhH4QX1cLjFTMVzHKLKOq/i
 cGnTIP8ozNNieRFr97GUfnl6s3LJ/g9j58tg6c7BWZApJNMloe/rKl0Yz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410774933"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="410774933"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="691626835"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="691626835"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 19 Apr 2023 12:30:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:30:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:30:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYr0WqV/PGLDqhKFKTqiwc9EDD2DNSwLYzxLNAFSdfnyAuYEEkrhwhDU7XeoT+TEv6Lb6ZoiCorPNLFO80qYKMcznEpvzEgxVIlyYiZesM8crYe3ClcSAXWvEIaLraaiz9zC4SPzLf+4TQCWi6uMni5P+tPu7y1NaitXwbeNOCw4z3eUbBIX6exPqNwiqNkHVSEHxIafUglwaybtlVZZOW/bwUpL/B4Dh9WcCo+tpseqWXtGUyLH+tx7BIZv8Gn8x/Uzhpu92JKJ7LzpuufXwUinsSh6+mC5PbnZVpx0t8BOkOLMsC+Law+klHXiNx7onWz3Fya6lk2idRmwm8KyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JOoHP96Od2u7yRWPHAylO8aeMOr78AjDEIF1yAgsoU=;
 b=K4dyAbB/tBIu6/Jqpv2yYwliYk5pHEiWr62+PXqaRgA/pyPxxlK6tARhUIkcfMwhsT3BpQKjRRcyFGiC6Nhz3AxlsKmYTFzIqiy8V7BpG9hHy1DpkJiOJ0S2rdbrW10aulvh1b1yuf618gdXlvDuDWbRO5tGJQpNMDOmg/3IbqZOCQn1Ui7SUXgGxkcF58jt2k1NR9+2vT1ltUSEPlU731LaIDA7OaWqhYf+rpg2EMwtuQieeRL9wCZ+Zk2q5CiA/SDU43F46md2HrCfKAD5nRcL7G1CGAc9wU5H3GhtaBqtEvyJos75xQ4YwsUA4BPOiWI/F0qQaD11ipYtKCLSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 19:30:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:30:22 +0000
Date: Wed, 19 Apr 2023 15:30:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZEBBSS8d4uoW5KfS@intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <stwod2pi444nbt4isgkexorrgvtd6tixn62xezymbydjwdpd6b@z2obzqwxeh2x>
X-ClientProxiedBy: BYAPR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b280ca-5297-4b4d-189c-08db410c844b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fdG2M3Tuja7xJdfJ8o9TM3IjkYPUZE4an74YFbriszGsxEHdgNRgoaRqYGmmt7nn1mgizAsCBJ2TrjwIQdBM8eK+Sn2yzxiXA5APXfyOU1mxczTIY4wERA8BNIYlyARNRWRy/FNydJXmMZtsIzLksFr0Lt7HhwdyaXJgD0nTiVhnL/6nUx5gTdsQP340yx2rqT6U0eep7W8ZN1GvWhXF4cykjbVHSRu2XNu9Vg0Wj04C3SjKHQNcvdjQrgIBPJG2JSA2YkkxjqzFL66RjL1x+cyuLMSCSczoA55o5OCxV3dhn39Ay/jgJ81H+3kmwz1w94C34gtpy0FC0ejQrm5Bt+o5+mvyV5RNgosTsOIGIhDf+Jli76vIN2tkguvwovozpE/Vl52W85Pk8ErD+/NiNarV9ySARQ0OMS14OJwGUtWUG7vF9lv7Kk5H0oT+mj1m+05G1ZSWjV23z2MKcBkM3wyp28LI7QYZZqnD72U7gfOHl18D5hKOvaB9R9pvPqnz9nzaiItqKCuoTx6mdbe0iHLLO/FG42HJNPJFpYTu8sldx4UsdfPWmD85v+6Rqngl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199021)(186003)(6506007)(6512007)(26005)(6486002)(6666004)(2616005)(5660300002)(41300700001)(4326008)(2906002)(316002)(66556008)(66476007)(6636002)(66946007)(8676002)(8936002)(37006003)(44832011)(82960400001)(478600001)(6862004)(38100700002)(86362001)(36756003)(83380400001)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5Jp3y2Vt70lS1K1OeoI+1e1VEvUXlEb2OQxnCG75/pR0of5ksp1Om6Lt8G0?=
 =?us-ascii?Q?eFnTLrvX5Y1ULpAz8pKkIS0/runLLUQAxBlyUs7MI4Y7ecYQNUfJ+LGMhaZx?=
 =?us-ascii?Q?oiu4Qlmqr6a+tROyheXbA/ZFUpLXKNn1AJ5mTdNL+li/GsZgshe4J9KrluTB?=
 =?us-ascii?Q?URG7WMp6VyxEKy3Br8qZ6o/fXwZcwuw4izsSr2ZihvK/LqXucaCgwK8FKSlZ?=
 =?us-ascii?Q?Io28rB/gHYKCydOTyCb85uKdxC1DEsO06Vj7UCm3Zk+wtnd40IzRBCy6RZHI?=
 =?us-ascii?Q?owBcGraajhylvBcua/g55miyPNvLyQlpFhkDG1R3d/+75wpiRusK93r2lc03?=
 =?us-ascii?Q?OV0sDo2hzTXD6mqHQGKu0nHuCF31jl9pm0j2Hm4KsgmwXlJePTtpVRuFBXMt?=
 =?us-ascii?Q?JOVdHOno7+ASWFB3HcE97ldDkuX6zEYqXWVwrS/ax0BKjmZPelbtPq3yxT/f?=
 =?us-ascii?Q?P5X/1Xe+D5XlIh9Kl/uTrl6ysJ4qSTOuJo7Yy9TKzKTyD+ZqPKkhz5at16Bd?=
 =?us-ascii?Q?9lpV9fYzWzAAYchLMCpEZXTZsAfVbWdUaWlDA/qDABIzs6a35T5YxIy7svAB?=
 =?us-ascii?Q?yd3O41+6qmK1+hBRpSNL1Zq74lHcYXVGgwhxW73Y+MrOVavpjls4dldoiDsK?=
 =?us-ascii?Q?1VHvft8m16Kalsm3AnqyPl8IopT+emZRhcHfklLB7rbgg+eqfFmYNaWtrCrl?=
 =?us-ascii?Q?qQakROMCDEEGYDynlXShcSaH0WTmoBsQIBDzTOsq+0xPAJxO6SL3V6p3XJpL?=
 =?us-ascii?Q?t74dY6qIE2Z/1sjljrsIhxj3VUUvGVBohNcfQQyVhbLXgHKbgn2xN9Nc29R7?=
 =?us-ascii?Q?HilITOu3z3RCxyQL0ydvVa0gRQHfiubNiyaPhws/AUfUzqoP2j1XE0bXCA91?=
 =?us-ascii?Q?fhCaRdx8ssci/hP3fOtMm8pZZSLCvAvqlyrGJJXlcEkl6JrzfolQaI0IpRUJ?=
 =?us-ascii?Q?LHJmjYXHuOevNeFXeyb1r6vJPhcpQcITaVPFq22AGeA9Mfhmw3X7I5OziO7Z?=
 =?us-ascii?Q?XTHW7Jjd9/QQffWmvJCTDIGsJtpKwjHgClTAHzrOKuzJSoU26HsKK7t9oj5l?=
 =?us-ascii?Q?hDe3XAaylyVa6K2f/uxqxuA7pJXuXUg8WS9OoDot0Go67uYBkuEBRG62N1VY?=
 =?us-ascii?Q?mTWCIhHYrT4pLl/fWHe6DYp3c7bRKuu7j9LOYVYpzVKZI/5Cpfk8EieQTf3w?=
 =?us-ascii?Q?Qb/5yL++fhbxDgZ4s/Z7kDveftTuO/DqUc4ZZUeGDcPTvEGdWLa+cOQeWDDg?=
 =?us-ascii?Q?uET+P2U3Fmria2svx3YAB7QcVxSMXzJcqmPdWD8G7KnUkrRc2cLBjSFJMBup?=
 =?us-ascii?Q?J+smLL084HM6pdgO+nhOzmHDfuoH8871/Q2/uG+at7wemYJ09+IfCh1Oa3ia?=
 =?us-ascii?Q?NQkQufAJs097XbacoYZ1f7dWJcpiccAQAfuu2UfISTkutjxMBW6137A9ooMD?=
 =?us-ascii?Q?+PdIBybhZmwOszoClucP7KhYhTQcRJHNPKsJCBUExVyN6YbFuxtYuqaHw2Qw?=
 =?us-ascii?Q?cT281gN9s0v6ZdRnVuVTgUMooiHrhbKgmJOi58ZkQ96bMmYsH8ShM0sO9zFv?=
 =?us-ascii?Q?KLsGQQAc6u9oMhDLAYDIEPJsJmVjG47ARBAS5/RG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b280ca-5297-4b4d-189c-08db410c844b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:30:22.1225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yHU2mVY9oNJn7TV5XI8Fqt0FrI6IMkpxzN1cTisoEBZNC1NagKFYzIB2hs2kMRcumFVbJtLGEtEag35Fo21cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5630
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 11:49:56AM -0700, Lucas De Marchi wrote:
> On Wed, Apr 19, 2023 at 10:33:45AM -0700, Matt Roper wrote:
> > On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
> > > Stop using i915 types for register our own xe_reg_t. Differently from
> > > i915, this will keep under this will keep under the register definition
> > > the knowledge for the different types of registers. For now, the "flags"
> > > are mcr and masked, although only the former is being used.
> > > 
> > > Most of the driver is agnostic to the register differences. Convert the
> > > few places that care about that, namely xe_gt_mcr.c, to take the generic
> > > type and warn if the wrong register is used.
> > 
> > The disadvantage of this approach is that we don't get the nice
> > type-checking that we have in i915 to catch register misuse at build
> > time.  Instead we wind up with a bunch of run-time checks that only tell
> > you that you used the wrong register semantics after the fact.  Wouldn't
> > it be better to keep the strict types and let the compiler find mistakes
> > for us at build time?
> > 
> > The only real problem with using strict types is that there are a few
> > places where the driver is just trying to refer to registers/offsets
> > without actually accessing them (e.g., whitelists, OA register groups,
> 
> that is not true.
> 
> > etc.) and the strict typing makes it harder to provide a heterogeneous
> > list of those registers.  But I still feel the benefits of compile-time
> > checking outweighs the extra complexity we wind up with in a handful of
> > places.
> 
> I disagree here because the strict type checking is only checking for
> "regular vs mcr". Add "masked" in the mix (that has been a huge source
> of mistakes in i915) and you already have 4 types(?) to deal with.
> 
> There are also places in the code where we want that "this is an
> mcr/regular/masked register" info to be used later. See how the reg-sr is
> handling that.
> 
> In the end I believe having this info encoded in the regs/*.h is
> sufficient to avoid the mistakes we had in the past.
> 
> Any change in the code triggering these warnings has a very easy an
> actionable fix.
> 
> If for some reason we want to only differentiate mcr/normal as strict
> type checks,  then I think we need to provide a better struct for the
> places that don't care about that. Something like below maybe
> 
> 	typedef {
> 		xe_reg_t reg;
> 	} xe_reg_mcr_t;
> 
> but reg.mcr still being there. Or going the other way around:
> 
> 	typedef union {
> 		xe_reg_normal_t normal;
> 		xe_reg_mcr_t	mcr;
> 	} xe_reg_t;
> 
> but xe_reg_normal_t and xe_reg_mcr_t actually having the same defintion.
> 
> Lucas De Marchi

I honestly liked the approach you took on this patch here. Getting rid of
the i915_mcr is already a win by itself.

One case that came to my mind though is some time sensitive mmio operations
like display inside vblank areas. any runtime check could potentially
increase latency, no?! If that's irrelevant time, than let's move with this
but if it is really a problem, then explore your latest suggestion here
with the compiler doing the checks for us seems a good alternative.
