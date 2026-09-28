Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7555CC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 03:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C33410E747;
	Mon, 28 Sep 2026 03:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIa+DHBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A8D10E747
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 03:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790566500; x=1822102500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/hpdu/CWQ8xY4eAHH/yes8vnsGJ1PfAsXstVhQNs9x4=;
 b=gIa+DHBBtSSk5Bsr7p1dvJ9bq2/sco9nYRpkVtfCa3reTMrUwtAucSUm
 35mqoNeUaZflqD19ybdy6mtsYP+ldKTatgp1SPbBWcIw0+3spz4NsinR5
 DvzvPDVzvjf9aL0HOlppeDJdHQIihGO535stES3avH2iva4ETYlUuZm/5
 QeiFen716fojGQLSuLvHYAZ7MYXA8BR791Ep/qD02UGTJxSSezK7+rFg5
 IvAZvPyC2bP8oH+85CypFYRnHkb3HETkjqGQH8tc6cPHVIoVIX5xUlqAe
 MybSuAmypPbYOojTzmdBR3BuJq+6ciMwyB7FQFjVqw5E0a5BlpwRQVlDa Q==;
X-CSE-ConnectionGUID: FZSHFiIOTQqk0HutTVzfJw==
X-CSE-MsgGUID: uMigpQ/zTsaXGRkAMCka5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90023447"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="90023447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 20:35:00 -0700
X-CSE-ConnectionGUID: mSjwMIdwSA2PgL9JqjQp3w==
X-CSE-MsgGUID: nlYR/5C3TDGa5VvEFDSThg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="279656632"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 20:35:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 20:34:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 20:34:59 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 20:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7OiBMGb+YLYTcqkeZSfX86uDTIOAj0MYIuZP7PnWBpWrgx7f8LqVytmErKhOem3l1V9RExL/hGihQwe2MHPGk9LAKDgwiPFWGOp0y1NmPPXvDF2insT2djAqhGTWDkrkVJ8l5o9aBfd8cy0RvZWJy2tTDDuyI6sXbd/H5jKrZqiEZfT1m9hJ6R6z4QIfMPfZ7RhA4MXHr1kzaLst7f5KDHG+co3mqymuAbhGJVwlQRtcqAqS27gHEvL7ZrZ0ckQ9PMb1P3dun4aYBbvcR6zYJhfOZ+a+3jVLhvw1gz6M1kbcz8RdxOOGPu6CeEF09BnRwCgh3Mw3b/jcfTYJiuSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etT6K6R0T3NYEWdwdUP5u04hSKuMDA7cfJWDNG1fUyg=;
 b=r0tp6elPPTf70m5uHUAC0z6j4OfDpwhNMYgzrn12WP2RHoOq2vAqLUb9K021cH6xems3JkFB08xIaqG68JFuRFb7tBzzaHyJNOMd0baMxTiOwYoyH5nWEBhNverxoeUXKT0dFAR46DIFJsXd4VZtExUuww7yHtY/bRMgsG3ej9YZZsmfAaZ5BK7eFhogQVIlnUmJ3Ei/XQ2yJ97VmkKhL2yR32ltw/nzPBqPVKZLAd2C3duVTvuWnzi8XbCDSR3wTgU/U2VC1vYt5IWXCVZzQyCIRdIG91mBS41l+aa68rUm1gAAgtYGQBTRaH7GRGB7yAF3/vf78mieix9mPjWD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 03:34:58 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 03:34:58 +0000
Date: Sun, 27 Sep 2026 20:34:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <gustavo.sousa@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 00/16] Add new debug infrastructure for configfs
Message-ID: <arngX+7ix5t4ccil@gsse-cloud1.jf.intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:303:85::33) To PH0PR11MB4792.namprd11.prod.outlook.com
 (2603:10b6:510:32::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4792:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ad842d-c327-49b0-3f01-08df1d11782e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|10067099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: WkXGPy1IwkdDY0YqCBiOUXi/2ZTwnU07ks/2MDQV/i7xa6Al55TFWJqFomiSInGcyBL6d/msrn990oHz288NuL5f5VKdjcX2rMaCOKXlsfcviToq0YsDFWp2qr7t8ajT2lJaKcpWkccYnpomantVccT5viOaV/drKAoeK64K1k25Z6JFkJ1iOrDJq+yyIcVeE6cWj8hu5+ZgpkokPo5fDYinoYsCv7NTphCEPT2mgYoUB9Q2Q2Ll0R1ifdPubyw7oFBvJ9XkY325H8ExUz5vupbveHtAqlkGId4xw7hBVkTMxLAGgojlACYhiQ4r55To5jxeVE8XtPM8KJEGLBad5yRtNxFkVLyJUPL9jrblt37DkYlft1iBogKbpl11vhmhPzieh9YBun0uXrLLONl40B0PtZGrjrZK+bJeRAvvfk2NwzQyIS7LHsyVAplsrd9NaZ4sKN5hzLj2LpdImkXSpH33lTRAODOW4PhNslJwT4r2/lOX3ACOcJkvx1nQFielI4NyOeP44UOeOKbTYyZ3ExqPrHbGXJyswBGGi5J1h5zFOLgMyRTm80YlDiOM3uDERWZMgYn5Egr1whw1Yr/pc5HDol70r4KKfIIW4r0EgZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WmhXw3XB4LFXd2i2DqaBRdNzyF3Zwr9nebbhmgaBnnY7xOGe/dC8UnahKrY2?=
 =?us-ascii?Q?spl451rNRyN9y9HKrPBkxKKoszljsyaKd9t9KKmz2EHqPB9NZyUNTVhnNTTD?=
 =?us-ascii?Q?S+PwnOO1XpckjX5gTavphRps0QY0WZccTD5jEIse/Vm0UMF0KkkmrgU49Ou+?=
 =?us-ascii?Q?AU7ZQRl+zLoreExdetws0621baLWCpy4jEho2Y71P88+0rEaGYL4JJW1vpd6?=
 =?us-ascii?Q?urV8cMoKmpo6TvEXryERzUkNygTpaWkszD/4gKfqiOqLnRkeSsgzp9qaVQ+3?=
 =?us-ascii?Q?SnMf4SXXGKTrRLXxU1zbYkdItVsfzyZDnjKY8K9dTtr0TwOZCQzEaF3SfLSL?=
 =?us-ascii?Q?cquVqmUDdv2kCEBs34Q3MB3fzqEwKSsVcUsEnOYxQSoM0f1lrpIVxqMQSSF/?=
 =?us-ascii?Q?jzJOYtG6q4WrQp+KM/UE+BAmerVaNBk9SgVL8QCSNtfH9fSUT4SU3fHYH5La?=
 =?us-ascii?Q?SuKpbcTfvGkTYVreS6CMgeyko/GHvWHvBglZfqkbXX8dg0I/RdeKtfhV5kcR?=
 =?us-ascii?Q?HO4rgHvRLVxPX5U+0VplFQ//2XBHm4gUiTMqP4pY/92z+twgDnetJpeE3jwO?=
 =?us-ascii?Q?yDuf10Nq5df/eTgpE4LBp4JvZsaZpwGVT7y+dHoequHeUiNr6tQiDAMv3L6X?=
 =?us-ascii?Q?Av4qIHWP9X/HckWw04lXg6d8Nrbme1gvBcHRb+Wn0ITZQLLLAWHZ7MiklGGs?=
 =?us-ascii?Q?Nk/bx830sDhxs6S3tWOJjsymdAyDvdL58bK1WDc6NxZemXcx2S0yyLDoBvYG?=
 =?us-ascii?Q?ChoKzYTszz8d+7khKeZHGDu86j8kQtcgiKgoojtVFofABBZX1MA8DJ5HqHFj?=
 =?us-ascii?Q?kYpQeItjDkLy9S5mSQEZQq8l29+U4Hg8QbhgXKuypaLgx4y+CAaLqh7mVMoD?=
 =?us-ascii?Q?9kYLa1pxn68IyCzCb36tMkZxTpLRtQiE49UICdsz5EFdkaF3HJ1VVaDJsIHw?=
 =?us-ascii?Q?Q4YFJfLbzyI97QijtG2GXbA+mcBpB9Kt2pzlqTQBeRTxxRXWazCVk9+CwlhI?=
 =?us-ascii?Q?L9sgOPo8OzvGrcaTdMG3OdFt8AuqsbkfJWPk87hvqYF2PiLKIe7w8rGN4Mc0?=
 =?us-ascii?Q?Mm017daFXXEhRpoG4gyBNvaNS00Li+IUQgPlLNf4znab5y2KW5fR36G3rsnR?=
 =?us-ascii?Q?2g5rgl1/f72Eijo7GQEdFrEglXhglRk3fq5roWQ69GOScqBOdPYhea3HUvSv?=
 =?us-ascii?Q?V5I1vYKJvxVKUw7mpETNcXme989hH+uKZ0wRnnXzTOIzfWOlsuimKv15Fy89?=
 =?us-ascii?Q?6IRLdZ1VDdWWnmNn93v30VLRMsaGDEXBnGfKQYVVbYBI34e9FNXDaPpMfdJh?=
 =?us-ascii?Q?RFrLRDotWOZMKamfhFbRvL8hYAzeZqa4FePk8SbOES0nLLZiqlBzyrHmjRtB?=
 =?us-ascii?Q?s5yCgN7qK1CsMKvB9+bBdt5ATqYpizKb4dWuJmFC4ND+JHsmdaeNyof5cGd3?=
 =?us-ascii?Q?+i/gozqPTKTglewaATQFru+6oOjPGmj1JfftFEeUTLbWitIVG48jJur53DKY?=
 =?us-ascii?Q?NX/55ee9TL3TUzhp+oYF3coa+Bq4jBQOZEup3US+Q13IO3gU7tM2clC6r2Bx?=
 =?us-ascii?Q?YQ26NVEKaRtRvkalVs4B4eyuqiVJA8DIiBDYYrA6TauEGfr1tvF2od9YZ233?=
 =?us-ascii?Q?R8biP/kbJhgfZ+YmnqV+Ca4imxf/R2xpmbijHS1QOWF9Ilbli+KrRxB7zk7y?=
 =?us-ascii?Q?c0ZU4eR8nvIfdMPDLB4H4AVvLVHVbqi3pI4xXy7xTU47N0v2hZ39S4WybK0E?=
 =?us-ascii?Q?IMVZWDNpl+FVeGobErHRztRB9xmTG68=3D?=
X-Exchange-RoutingPolicyChecked: ZKOaVC6CHXcZURv5twnzlq2HlwD05s1eKZTXaaFVTGIW71jGbp5bWyZuv4Y7v+HIZWV++FqxG3kaiJKoUnYAMvqAbIWw0nJ+06Njc/RAyXJbsNB7AHfocYYfA/Jekc/fH0dh1WFkeiRCvOH61/dfFzAMwsV9GFqjQyOKtwGO5+Ha3i1xUKF1Q4suvOKL1ZTRQ5s9VPTOiBAxcvZzsoWag2LTILXFM+4CJQTIvoEcSCnHllO3q16tjiA2HU0nDAS9uVtC9SbDBFqctABAWHHeuFguDrEbZkPnwzswyx6h6rDtPUlA6nWRsPh0TVuDGo+RxoySgiO6FRhyLAXe6vZxfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ad842d-c327-49b0-3f01-08df1d11782e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:34:57.9579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wq4nfSBZ5dVEhDS6rRW+bHEIgiGi5yrpFXIPoskPjZiG6ewlcNKWLC8vCTbfaQYSujSECxc03mkTXggzW1LAZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2026 at 11:01:19PM +0000, Stuart Summers wrote:

Thanks for the work here. I was going to look in depth but immediately
have a question.

> Add a new configfs debug group. The intent of this structure is
> to allow us to separate ABI facing configfs entries from those
> which are purely for debug purposes. And it allows us more flexibility

Why not use debugfs for debug knobs and keep configfs as a strict ABI? Is
the reasoning that everything in configfs is considered a boot-time
configuration?

In the past, I've added debug tunables as module parameters that
probably should have lived in either configfs or debugfs.

I'm just struggling to understand the distinction here. What really
defines a "normal" configfs setting versus a "debug" configfs setting?
For example, let's say we have a tuning parameter that a knowledgeable
customer may want to adjust. Where should that live?

I'm not opposed to this; I'm just a bit fuzzy on the rules and the
reasoning behind them. That said, if we can't get clear rules then I'd
say lump everything together.

Matt

> in how we define those parameters used for debug.
> 
> Add a new infrastructure to this debug configfs group that lets us
> easily define the parameters in a quick list. This is primarily
> useful for simple, single-type parameters such as enable/disable
> features or simple values passed. For more complex parameters,
> we will still need to define these separately.
> 
> Pull the GuC target related changes from [1] to fit within
> this new structure and add a new definition for guc_log_level
> on top of the existing module parameter (to ensure we aren't
> impacting existing users of the module parameter).
> 
> Note that the debug parameters here are all to be used "at your
> own risk". Without having in depth knowledge of how these impact
> the software and hardware, there could be unforeseen consequences
> of setting them. As such, they are all wrapped in a
> CONFIG_DRM_XE_DEBUG configfs option.
> 
> In terms of the patches here, I'm sorting the existing parameters
> by name/type. I know we have a few other module parameters that
> could migrate here, but I didn't want to overload this series
> too much, so the focus for now is on the existing configfs entries
> and demonstrating the new structures with the GuC log level and
> target parameters.
> 
> I used GitHub Copilot with Claude pretty extensively through the
> process here and attributed as such. Happy to answer any questions
> around this. Took a bit of time getting back to this series around
> other work, and in that time I was playing around with a few different
> models, hence some of the patches are showing multiple of them. I
> tried to attribute each as I was implementing the changes.
> 
> I also decided to drop John Harrison from the NPK patch. It has
> been modified quite a bit from the original, but more importantly
> John is no longer with Intel and that email address isn't available
> any more. If it makes a difference here, John and I had both separately
> implemented this same change at different occasions for debug. The
> one I used to start that initial series was cherry-picked from his
> latest variant.
> 
> v2:
>  - In this second revision I did confirm that the guc_log_level
>    module parameter is taking precedence over the configfs parameter
>    and ensured the other parameters seem to be autogenerating and
>    working as expected.
>  - I tried to address all the review feedback from the first
>    revision, [2].
>  - I also did another pass on the sorting since there were a few
>    discrepancies I noticed in the first revision. I kept Gustavo's
>    R-B on that one, but would like an ack before merging at least
>    to confirm the patch is sane.
>  - And finally I moved the getter functions into the X-macro
>    generators so we can autogenerate more of the similar functions
>    between the different parameters in that debug param list.
> v3:
>  - Address a couple of comments from Sashiko around GuC log level
>    input checking and proper guard implementation.
> v4:
>  - More review feedback from Sashiko addressed...
> v5:
>  - Move the goto to a return (more Sashiko feedback) in the GuC
>    log level setter before moving to the X-macro solution.
> v6:
>  - Make the autogenerated X-macro function names more specific to
>    avoid naming collisions (Sashiko again).
> v7:
>  - Fix the couple of pre-existing bugs called out by Sashiko in
>    the prior rev...
>  - Make CONFIGFS_FS a required config for xe to avoid issues with
>    stale values in the fallback getters.
>  - Renamed disable_vram_page_offline to enable_vram_page_offline
>    for a more consistent naming scheme (this was a new configfs
>    entry added since the prior rev).
>  - Converted survivability_mode to a u8 bitmap to allow for
>    extendability in the future. Only bit 0 is defined, so the behavior
>    should be the same.
>  - Added an enable_media module parameter at the end of the series.
>    gt_types_allowed is debug-only, so this gives production builds a
>    supported way to leave the media GT alone. The modparam takes
>    precedence over configfs.
>  - Adjust the sorting to be alphabetical for the documentation
>    specifically (Matt)
> 
> [1]: https://patchwork.freedesktop.org/series/162087/
> [2]: https://patchwork.freedesktop.org/series/165879/
> 
> Stuart Summers (16):
>   drm/xe: Guard configfs attribute reads in getters
>   drm/xe/configfs: Fix out-of-bounds read in parse_wa_bb_lines()
>   drm/xe/configfs: Copy wa_bb out under the configfs lock
>   drm/xe: Require CONFIGFS_FS
>   drm/xe: Invert vram_page_offline configfs attribute
>   drm/xe: Make survivability_mode configfs attribute a bitmap
>   drm/xe: Sort xe_config_device fields
>   drm/xe: Split out configfs data structures
>   drm/xe: Add a new debug focused configfs group
>   drm/xe: Move debug configfs entries to xe_configfs_debug.c
>   drm/xe/guc: Add configfs support for guc_log_level
>   drm/xe/guc: Add support for NPK as a GuC log target
>   drm/xe: Add infrastructure for debug configfs parameters
>   drm/xe: Migrate existing debug configfs entries to params
>     infrastructure
>   drm/xe: Taint kernel when debug configfs parameters are set
>   drm/xe: Add enable_media module parameter
> 
>  drivers/gpu/drm/xe/Kconfig                    |    1 +
>  drivers/gpu/drm/xe/Makefile                   |    3 +-
>  drivers/gpu/drm/xe/abi/guc_log_abi.h          |    8 +
>  drivers/gpu/drm/xe/xe_configfs.c              | 1056 ++---------------
>  drivers/gpu/drm/xe/xe_configfs.h              |  124 +-
>  drivers/gpu/drm/xe/xe_configfs_debug.c        |  899 ++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs_debug.h        |   48 +
>  drivers/gpu/drm/xe/xe_configfs_debug_params.c |  158 +++
>  drivers/gpu/drm/xe/xe_configfs_debug_params.h |  194 +++
>  drivers/gpu/drm/xe/xe_configfs_types.h        |   60 +
>  drivers/gpu/drm/xe/xe_defaults.h              |    6 +
>  drivers/gpu/drm/xe/xe_drm_ras_types.h         |    4 +-
>  drivers/gpu/drm/xe/xe_guc.c                   |   14 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c               |    1 +
>  drivers/gpu/drm/xe/xe_guc_log.c               |    3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |    1 +
>  drivers/gpu/drm/xe/xe_lrc.c                   |   39 +-
>  drivers/gpu/drm/xe/xe_module.c                |    6 +
>  drivers/gpu/drm/xe/xe_module.h                |    1 +
>  drivers/gpu/drm/xe/xe_pci.c                   |   20 +-
>  drivers/gpu/drm/xe/xe_psmi.c                  |    3 +-
>  drivers/gpu/drm/xe/xe_ras.c                   |    9 +-
>  drivers/gpu/drm/xe/xe_rtp.c                   |    3 +-
>  drivers/gpu/drm/xe/xe_survivability_mode.c    |    7 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |    2 +-
>  25 files changed, 1615 insertions(+), 1055 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h
> 
> -- 
> 2.43.0
> 
