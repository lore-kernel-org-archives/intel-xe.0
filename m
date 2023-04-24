Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5C7C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 23:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A625D10E057;
	Mon, 24 Apr 2023 23:10:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067AB10E057
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682377826; x=1713913826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hgQygn+AxqZKFmk8ewPbPw7H0Av9vNzOfobsym/7/Uk=;
 b=ECJC+XYu6XLLgL4uWnNgeQaJStLSYKnGDgn3TAefo99aE5qLoJgL6MrO
 Ufp8sie1xeps5XJqMsa36fh4lE5oFcC6scfzVUqgAhYCeKQCpZOYEsE1n
 hqjQPUfKIKH4+cbXy8yGTe8+fCYakbS4x3xitDa3ECSfOHegSb3ED3Ffh
 VyBKsHpoacciKz0g+vqPs+/XTaSHB08IuNG5xI7TXRfkzU5Ccc1VeAfct
 CKlfF7QtjU445a0QhCfbSKPwus7BOwlaGjDqT87frop2b3hGKRofrd15S
 rXiaSZ7yq6JIKWduNgsBBLqo+AeeKgTL72z5DK5x1Mnfs3vy3PP/DEmR0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330802585"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330802585"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 16:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="643552813"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="643552813"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 24 Apr 2023 16:10:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 16:10:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 16:10:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 16:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfbUKNaOuMDs8xdm2QcaJ2/Je/vU4U8rn/Oyy3yBZossVA0SK1tMvPT9jnmCR8vqtdkmo+AOpx4IM/Ojjo/xHkEsRhmROvqJ6nyrEUagKLle3upTTLGLV0okNCJPN6ir9FXd7CgLCN9zVCYH69tWZyUOc+kGAX69qOuZa2ylykc9Fb4oLJ3vtC9WQS3sq7zwQP3EPuoqAhQlHT1CKZLrlFQtUCy5tU/kHA6BgHidasnu7a0PszdRQz8PtME1jiMQITKs7LprXZbgdW9IFoCpRNEQqeo0pomBr7jz9eWUbaYHE0ZdlYnueJ4y1uNmqsGUFLzrdQM0VYyX6myxrwtOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Koyo0AFQeHKeydljO0LLkBVqGMDE9B0/0oVhy0IxK4o=;
 b=ZwVhZlcE4Te2bLRomyaj4Wq+9W2JHRiBYfLTLpEY8wvjb9UgwU4r4NtxvMwclrpfBFVZIPIqcqwFAreY2fOD102zFtezX9nM1IDAmSWHRV+9IzpPtsYyAiibFNo7rr3gKXGCAjjHRUPIS4CVNcjmDFg8Xdj+OOxISyY9moW96eeMcOmmQPiyQw8T1V5LVGq9cxcttDtBFDMNHQb4uk7HakxwV7b8lkSlJN166mD8dU3V5qGLSnWslw2l3wfIRorcBTh+bkgsAnCmN86s5VM+KkWAPljNvnADfkjcw0v7g3WirWiuFEzqdIPAEYhbynkNpMdshh6IG9sb/tklblTbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 23:10:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 23:10:22 +0000
Date: Mon, 24 Apr 2023 16:10:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230424231019.GI10045@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-17-lucas.demarchi@intel.com>
 <20230424212052.GE10045@mdroper-desk1.amr.corp.intel.com>
 <rl4znzdiv3poheqpgfx4uvsdqqyg35fo2ydovy4jyu6y42smxw@fxffc223lmfl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rl4znzdiv3poheqpgfx4uvsdqqyg35fo2ydovy4jyu6y42smxw@fxffc223lmfl>
X-ClientProxiedBy: SJ0PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 827fb17b-3175-41c5-2403-08db45191453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+22xL4ffj+iFkTPOrf0InN1VJgysaIBw8A6o0CaRGgKpYvxbxx9HuLf2gzf1yfCHQA9lQoOeCHOyckoD7/KfxGfageUf95858KPyy5lXoVqonDbMV8N190q/3lTCLJx5zVZDsRdDYvKKFd0XN2+WOc8Ti2BoYGC0s5wgU/vrlS8jmBf+d6k+4cwxrTuOF2fDe2gnYzCKa84HxQH6sEnywV+9RxbUY0N9hhm4sTOIKGRDT6MKmjLuMjYS8CkddGIKCT6WAAbLNG4U/grbW7+rjuGL05VwIudz7LMYq/HKtWhU+jk/pMP02YYf/Al/9cJB4unoeX02wgmhYbEdG0OZ40z7Awso4QQGHSJcStZ2lfeztRsJ4Ay03CZujNcczU4SUFzxSvW5N4kylh0O2hix/CpSYsmxRdr5ak7qx1uQImdb4xJ1EIBQ00jlhQKiNm1H3/AgwPJ9PCrboZDyc0E6j/vYJkK1dxMMSuW2KTGRIlag7s/6pPwNB/xBQgqPek41yR6mIDiQicsBJWkTqotrsjwR4VXKdEwoIqvvd8luiGddo6MiCTCO0RtI4bsrhw3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(66556008)(66476007)(8676002)(54906003)(6636002)(6862004)(8936002)(478600001)(66946007)(38100700002)(86362001)(41300700001)(2906002)(316002)(33656002)(4326008)(6666004)(5660300002)(6486002)(26005)(6506007)(1076003)(6512007)(186003)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7KAF3lOT2Eth5L8Xt4WZdaL4MYP0hLKJHjezG3edb04bUDfoGmv8DDVK0jI0?=
 =?us-ascii?Q?6Fv6AXT3Hfy7hdV8nCihVsVHHBFwM2/jXefD5fhM1n0iduXYy415lFMdbGxN?=
 =?us-ascii?Q?v3BoyhGAXU07hunvRp66njthKvcFckZMmVjEfomPps1B78HcZE39e6EHnbc4?=
 =?us-ascii?Q?E9rH7dLd6NE8yuCiXtvPHMuGMMVQ4xtYjh+e6qitdomg22rEJlg5OMQ0iWL9?=
 =?us-ascii?Q?igFrNg5/fSM7eW0/qpSVs2AUCbWpYdzfQg+g+eTXGFWpQAUb5LiszvGQzpja?=
 =?us-ascii?Q?sH70cQwe7N6FSuCsH2VVauBJ3t8Tm7o/Nd5P3pelW6NadAI1PXC3IQCQ79iF?=
 =?us-ascii?Q?MrBk0SpIiAwg8qvcIAdpS6/p8EC+mN6HrIuHdQx7I9q/7rHKFtdG4MQ1bmge?=
 =?us-ascii?Q?k5JgYC0Hk/6s5fROs87FK8hgAUBpTr5uiyVgHgnfhDWadOJ2PCYzneNGGqPJ?=
 =?us-ascii?Q?sAt5H80lL9UkqEcW5zf6a6r8W5MHw3LpEmELEqGRpRa7zAvu8XzCPxinkKr9?=
 =?us-ascii?Q?ZtUOFXVxDpUQv0bh2bpkzzuJANOUsX7uvJW2nFB6ttJdM5/tiMujnePfNFGo?=
 =?us-ascii?Q?h/wGOjAt4dxb/XiLy2U7aaGnLZXc/y/F9RlHREz+gWr9Q25aHu0vaRXwgz6B?=
 =?us-ascii?Q?ZwFM9B1LAFXPxp9K1yLGree6OCWh9S1oKyH599K73RkvhE12uV+6Vb0VKwab?=
 =?us-ascii?Q?x+GrbqnsBOYit8/xUWOoqeICbprz9PRh5uGI23bYPmW+rpXZVNgVhYO8TVU7?=
 =?us-ascii?Q?CvH30V9WxuZq0l03UoqiqgZ2rBHIRJ4IAaphqn6D0CrGxRphFEmBWf22FOJt?=
 =?us-ascii?Q?AmFyajA8cFMITYA62RpiP+8MtrERwmrJq14bDzGiKfJOl1/ZPEBdoUaoZzOu?=
 =?us-ascii?Q?c4LWNbclYYpjmnBD6fEtbRF8lFsiBhn9fDVq4vu3mLb8FQaNvlxsWL2Pfzt9?=
 =?us-ascii?Q?zBTeCShfHVAWuWF5HAASnlB4+0gDcJKK6G03kDq2JuYgEkfNehXWVtvqqltS?=
 =?us-ascii?Q?zqpmC3Oa0V43QIqZ9qBWGvJ/hX2bctruWExyoUDVYD4rhnI4BSJw/Vd8pt3J?=
 =?us-ascii?Q?c2xZnhsrYyjwDodh7IehjguHZ8LG+R04ALL0qzC/Vl8mGt9nGsRydDETLI41?=
 =?us-ascii?Q?X4eochDUnsUqwyNhyTUkGTeoQArLcYiWMPoUPFsSPtFzNJmToBuNE1mSIUPM?=
 =?us-ascii?Q?7IbDwhQzN0h/MEr4jekk6VzSc1ZILsGEKbaWQk6N/Zl7bUzz01bN3+PT3d0U?=
 =?us-ascii?Q?aFSdysbwJ1uQTcc9CUt7W9uKt0ktXeV4zxSJc7tszHJZPRG9u4WtfYf3cVTy?=
 =?us-ascii?Q?tdokYoy8VkM/zfeZGtfBO9Y9FbrzqDp6w1M41TSHq5zInNIf4xfEDWczIb55?=
 =?us-ascii?Q?WLG/YytLFD8dZM8zkEzpSZD4wsoo/DF1QGdC89nro7/b0y2FcF9mGGDn0zHT?=
 =?us-ascii?Q?h7CO7BvTe6cWTc69nrH9UqsNnuQTW3S8aILqpcw/+pWDvzi7GviC/BInqOFb?=
 =?us-ascii?Q?VqaoAs4ZIbf3wQdHOXTWb9QQs7Fdnljyy/+/yspjxwMzPRoPl7wMsuRzwzFh?=
 =?us-ascii?Q?JdKuQbJnici4Asanyj9GUDPFGwvazoiVgtxQ8hSfFrwt4ZSOw8WOhZB7cnso?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 827fb17b-3175-41c5-2403-08db45191453
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 23:10:22.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciBEkNrd9Im6kPpk/SQhuolCRFFfEMbbqgFN12jU3Les6bkxsCfw6r0UOzuxb3Or/4g+lcvCmaq4pHv6RFTSdRGuShM8JGek2yvgid0BibQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 16/17] drm/xe: Plumb xe_reg_t into WAs, rtp,
 etc
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

On Mon, Apr 24, 2023 at 03:50:34PM -0700, Lucas De Marchi wrote:
> On Mon, Apr 24, 2023 at 02:20:52PM -0700, Matt Roper wrote:
> > On Fri, Apr 21, 2023 at 03:32:57PM -0700, Lucas De Marchi wrote:
> > > Now that xe_reg_t is a type that can be used by xe, convert the rest of
> > > the driver to use it:
> > 
> > s/the rest of the driver/more of the driver/
> > 
> > We still need to fix xe_mmio_*() to take this type instead of a u32
> > before we consider the conversion "done."  I assume that's coming in
> > another series after this one?
> 
> My plan was to convert xe_mmio_* on a follow up, but then when I
> finished this series I noticed the one thing noted in the commit that introduced
> xe_reg/xe_reg_mcr: now the latter doesn't have a .reg field anymore, so passing
> a mcr reg to xe_mmio_* already breaks the build

There's still the issue that led to the creation of i915_reg_t all those
years ago:  xe_mmio_write32() just takes two u32's right now, so it's
possible to misorder those and wind up trying to write your register
offset into a location specified by the value.  Jani mentioned that that
happened a lot back in the early i915 days and caused hard-to-debug
issues.  Plus passing foo.reg in a bunch of places is kind of ugly
(especially since kernel coding style requires that typedefs only be
used for opaque types).

If we really need to keep a bunch of direct accesses into xe_reg_t's
members scattered throughout the driver (rather than making dedicated
accessors like xe_reg_offset()), then I think we'd at least need to kill
the typedef and move to a 'struct xe_reg' instead to not violate kernel
coding style so much.


Matt

> 
> That left me wondering if we just go ahead and do the conversion to
> avoid the uses of THIS_REG.reg or just leave it as is. More from IRC:
> 
> <demarchi> mattrope: rodrigovivi jani next version of my register cleanup
> series will retain the strong type for mcr. I also found a way to make calls to
> xe_mmio_*(gt, FOO.reg) error out, even if xe_mmio* only receives a u32, not a
> xe_reg
> 
> <demarchi> so... the incentive to make xe_mmio receive xe_reg rather than u32
> is actually smaller. I want to do a s/.reg/.addr/  in the xe_reg struct... but
> if we are going to end up converting xe_mmio_* to xe_reg (even with the smaller
> incentive now), then maybe I should wait for that?
> 
> <demarchi> thoughts?
> 
> <demarchi> to see what I'm talking about:
> `git grep -e "\\.reg[^_s]" -- drivers/gpu/drm/xe`  (with a few false positives)
> 
> <rodrigovivi> I honestly don't have strong preferences there... as long as we
> get rid of the 'i915_reg_t' there I'm good... and a bonus if we combine the
> mcr...
> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
