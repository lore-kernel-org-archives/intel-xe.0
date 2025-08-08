Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DDBC87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A181D10E05C;
	Fri,  8 Aug 2025 17:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqBgqN6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A68010E05C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754675029; x=1786211029;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Nfp67RVzlGKn1TCvqo0PHhLSnyNfkKFz82nDqL912qs=;
 b=mqBgqN6zdU/iEIPkY9Zg+om9pz9zis3fNvDNSUi7uxhCW7DNjMkd4rZP
 g8hJVsF6uuHkaYwKeIsK7HXksSjAehUYM7wf11GVjFJTlG32kApMWADIj
 Y5cDOHBXg7BUzTLsyBOLdetlxkXbyEKDuAwbQ0ir5yXlhW1O48Ap/uPBK
 V1kxahY/b2ncgs9caFoFMtRYAjfYsdtMekebr3AMYOEn3g8FcEXK9LMu3
 KpSuUUx+tZe8pc6yT/DsCzi2bdcvkZnnJCbTSLKCGxOsmScYhBgiwiVRY
 O5bviY5Ovt7hYErafE0LnO6up3fCfB0UorizGNwLMLydSHRg3v2wtwFqu A==;
X-CSE-ConnectionGUID: y/+W1CvmQqeYr+XOLtzjRQ==
X-CSE-MsgGUID: YMorA0WqTaWxCmosYz83DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="67298736"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67298736"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:43:49 -0700
X-CSE-ConnectionGUID: uk7dm5oYT4awr2lSx7KW3g==
X-CSE-MsgGUID: 7zHBDCeJQjeGO+ZP4RNhhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165790381"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:43:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:43:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 10:43:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGjX3A5GY6cB+16nfuYdOmSOKBCb7fFHlGkvH1eOsssDTZB73b+xhnHAOtSSDN3fSK+b38riBkaqpmOqb/dtN28aRuHYBJz76/UORb+sG9B2nxcbwrMSs+iDicDkugWjE8dOcUstxq4yfQ361HjlNvoyGkLiyeJ8I8D2a5HbYeQu4Nv6xGvIkvQXpr5W6XaZ69ohPcxj9BtwA7dxAWRYiCUu15HhSTni4umP90My91svqSl2sT/uRBZ3YHHBGqh1s/tPSWzOPLE2nJITBxrrlnpEVcNm0TxjbedO1JOf/chXLLl5aOdUQMrh68ruBqLcalitX28REJPyJBw0Jkt1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO0GmV8iNw+ujcCAdnOHaR0Lvvl5KGbl04KCt7Vkf04=;
 b=uGQQzBwNQuDbR39QoEHRRFaOar5jfhY/l+viL3RgVN5wbMLDYlGUzXXNQHcvtGbkhPnUEYHdWWF9tfvvvAOMhs5HPXG+W4Ksi9qUIQNz0MxYwOcljYzqUjXSjNj4z5Afr56r4gGGRa3i3WmjeXRycfC2KG528HcMQveRcHWWm84qbqXSyBAU0iMk76mLRRk1FlyuzDKsRSzMm9v02DIESXYCjuaq5t1h4ekwz7Uy+u+6lKTkQGtBbEShizM48vxdXKeARJhGC4AbQXvf0Z3uDlMzUBO4N7yOkYp1YI7WjkcRpC+3CjHijDQgK6KB6tVV4LDxK6ddFyffjX8yAKxXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 17:43:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 17:43:46 +0000
Date: Fri, 8 Aug 2025 10:43:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Xe.CI.Full: failure for Add TLB invalidation abstraction (rev5)
Message-ID: <aJY3T7RL4kghmfIK@lstrano-desk.jf.intel.com>
References: <20250807203932.103341-1-stuart.summers@intel.com>
 <175460668264.220879.15903130073954149884@1538d3639d33>
 <3b9ff9339cdc046d4154c923aa7f156f18f1d08b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b9ff9339cdc046d4154c923aa7f156f18f1d08b.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc22235-d128-48e2-2b0e-08ddd6a31fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cw8al8JgkDtnbh0BYIx+2FeLI9NxGmCIwiSZGXCu7NkR301pcOcGDJ2dmd?=
 =?iso-8859-1?Q?YacfpVNHTsrtNZrU5KC/Bbcrk2qjnbEFrrl5+qD0qVxPYiWoCn+WAZ8k9Y?=
 =?iso-8859-1?Q?YtbGrsRvSdtZ2dY+7uhURDcd59WQWxYMqoW12p3SMpYeGNRbiqnVZ1Rs7m?=
 =?iso-8859-1?Q?a151TMnQLpKM/44Cxv2QbaiYSNP8PTUfFn9ZruGQAWOwtZHSsX1nKgwe0c?=
 =?iso-8859-1?Q?R9QSpRHWXFMuLYnLytxEcv8Aew5+zKZqJMf5Abdfccj61IL1UYV32RA/Mx?=
 =?iso-8859-1?Q?A2lddt2FevBtZ88ih6YoIypcP9cWgkX8syaOk6S8Idc7t6o2Qh0RhGvgvS?=
 =?iso-8859-1?Q?/yiRwITJ6AMutM80wUg2HCfEaFy/EOfkvTem72dLSCdymCYoiYdYka5Kyu?=
 =?iso-8859-1?Q?PY4zJY410bQ371OoBTvU4+jAxTM4QvCwb7oPv6Gt7ZkFj/eqZV6UmO483y?=
 =?iso-8859-1?Q?QlSnvxLFUaPEvfmTyC0GE6nc5zSqYWqiC4w1eD4Yafb7kI4qWSrckOZZqk?=
 =?iso-8859-1?Q?N1rMrEX0qMfiIa0shwJqKxKgZ4+UwNA4TmmQNubX58Eb6F9aUR/JJanpef?=
 =?iso-8859-1?Q?rN0T8+f9/nDbWgQELK0kZYFxMUfo61/W1Z3R+0tdjP5g6ZYwqU6I83tLct?=
 =?iso-8859-1?Q?ShdaJYBJTmltJH6JnJQFgvfTi6dtlJWLXbjJKFiaTuYqYKczxZN4oPtnsF?=
 =?iso-8859-1?Q?QsQqDU1f5USuGYU8d7h/GREj/9CcY0xBpqUCFWjmYOkCQRHeBQweG5Mzic?=
 =?iso-8859-1?Q?u8KSMx8+KXuDyzZXsmecstJPy62uPe+stCCXGQgdu51SiaxHUwlHv1zizy?=
 =?iso-8859-1?Q?XenV70HA2IdW+XhT5yiSrnWbYrlcM3Kqgs6JESmrzspo6gicklkJvVjnAC?=
 =?iso-8859-1?Q?NXxNIEQPkGDWCSioPQd5oal3gHcWZBjt7t9eZR7ilExbFcn8Mm9pqj2J1A?=
 =?iso-8859-1?Q?uoBikdhccNiX3LbgoP+ccSxPbaMbkR2uRv8TuPFdfEebu5MGmFG0A8dcG3?=
 =?iso-8859-1?Q?+YruZw6/KNrfZqnWz4aXC2ag6OpSX0GcpAwTRR4TxFqEzgJTGjmvP4E1Y6?=
 =?iso-8859-1?Q?zXaTpvsdUu+A7NV+SCKBlGpwj5PFjMqwOsI0iiwE5/K3AH2QltQ/IVZz3e?=
 =?iso-8859-1?Q?fKrlFrbnc/ihHv2l2zeGkeus8brpzuXGNaT6EfgmYcXvgcIs6Uy2kOTx9e?=
 =?iso-8859-1?Q?dL+IhuSBb5g0xOpK/YyhL8psHZzAoGcUaFcoWBCfDBbmr6gZEH8AqKGDdb?=
 =?iso-8859-1?Q?fV03iRt/cGU0f9loiy8pbJ8MqnKTxctWi8nTTbhEiqx0Fqg30zx5HZncnp?=
 =?iso-8859-1?Q?gUQJtRLrvvpLzJye5BtW4LAUsvAtnxvWk9ieFgwu7dO/HKaF7vWB1PfyjO?=
 =?iso-8859-1?Q?pl7YbsJcuv7ShRcS0wzmntClKxdVXy/jq1T+bwi4y3Myzb1QzKKsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gpt/MEx9H6U0wse5LEpEtie0T3tYgNinjqVt3t6hJqWt+xQAslXVYzZLKc?=
 =?iso-8859-1?Q?gRs/07++Z7fvj1xbafaeO/Q4o3jQpZA+PgUAu3bZT+l0RN51H6gS9ohN/0?=
 =?iso-8859-1?Q?h/wjnIEgooy5lvfY+VbYqULvYSZGigh0Q5ejtejnk/PVah4HTNzTR6ists?=
 =?iso-8859-1?Q?xlaOB/2jVZLbnaBZnk177RxEBpqsPNe6HgT+mI1To2wBQi7cTFmpufldv8?=
 =?iso-8859-1?Q?+epvSoA57aw9NOJ/VoIYlgHNmW2kfIny5MtgNq8gr6MkFuvZQ2ExZCD1Rq?=
 =?iso-8859-1?Q?qOeR3wdzYC/psdlBfC1TTpHm4hwcJMYu71NeBNnuJJxzJs5UGGdQUg+xhU?=
 =?iso-8859-1?Q?UaG9MBj8UQ/9fuBrdId3fTrgDyqHb7nww9ipXGwO9Zz7VhcSDxiJIQwSp7?=
 =?iso-8859-1?Q?wVYvE+fdFDWEqeTHzn6cTADS0+RFKY0kKdq6zPVyOOSnceZOUlFuIOcqnq?=
 =?iso-8859-1?Q?w36pTXlntlkL7/LHWd+503hEfOPpYwTxzKMRirRdgyZWp/AFAOyJdmbdTU?=
 =?iso-8859-1?Q?HaxJJOwtdKCgoGAeCKi1IsmKxUxBWqTV/P0nmGYDPQr30Zu5JGA+4KjAPa?=
 =?iso-8859-1?Q?n938o4+AbvaiQ+hXY7WZE00T7fJEaBHyROpA+RhE/8MhjXC3+Kc2noIBDS?=
 =?iso-8859-1?Q?+F+eAJ4CFKYs4CufaDyWWu11I975hGNs1+DePMASGhlB0SdOxNzHNkX1Rf?=
 =?iso-8859-1?Q?DqdsMX+UIPgdLQC9GWxMFtyCjo3qidSf0Ctymjtk3g2DtjKuzn7QAY+uEz?=
 =?iso-8859-1?Q?Ekyy3cHhp1HDMnxweleIx5ldlhWSlHrRdbsyHAqqnKhEbu6GxKb9jRDC2y?=
 =?iso-8859-1?Q?QEMTpKVUHaWuySQMP4+7MquWd1My7WB7GGTZN6IfXelG1/NxW0et4Jd6em?=
 =?iso-8859-1?Q?InB1ta6uY56Qe7y8+0enXLiD5OfIu0y57pd1si7+UqEeKhF3uSSjb0EW0I?=
 =?iso-8859-1?Q?UvLhGlypDaBB5Al/s8bY3052M+eyb9pH4PTcMrhyE4nHzfk6VNoUO8XWNV?=
 =?iso-8859-1?Q?iYhfSJCebYXZgUNXBybm6X+Dz9c3vZg79shEXBC6XMkf5InsZ3FOHZPv9O?=
 =?iso-8859-1?Q?CfEy06pzxVQ/oe4rA0w7T9COZXha0Ep9MnKxre61RrPFoce5VSWoS6y0VS?=
 =?iso-8859-1?Q?G8mwqyR8qoqzTAMOHmW0NYu0GRas7O8H+ce1iZJYx+kj81PFQfpN3UCok0?=
 =?iso-8859-1?Q?TpsKKZ+mPVOKxwVUQRXVMwgCKnZtEGloY8XuwyoUOEeS2DUcXbPdIvb5Ga?=
 =?iso-8859-1?Q?duihx5MvRvRsFzQQfIxUoiJMeJepqgMXOdY5LKF4lC6kWgL21o0NEssLjo?=
 =?iso-8859-1?Q?LSs+phaa8q4IAAtxasetLXVRsRE66PZI5U9SY6FZdEFu9Ul9LL0CHr92bu?=
 =?iso-8859-1?Q?Kn41i06gOaTs7n8nJLtqdm600YC2lexeu+2ESjpdNph1Wyc64oK9FZ9glh?=
 =?iso-8859-1?Q?2knznxY3jy5qkYeWKqFhUYxq3jfjNkTzYKVFcaFogBKQtzEVbAIchqQMWU?=
 =?iso-8859-1?Q?mDUrGeIBCHVajkZInQz6TK4GiK1zN744V2frxftjSHLGk3SDLAEJvDXyoF?=
 =?iso-8859-1?Q?pY+QQ6Cyoa4L/hcDzoC5JoFXtDTLmV4JIHmK/byDt+Z8YCiR5jgA2yWeDT?=
 =?iso-8859-1?Q?0Sae3L3+8qDoIf5YIWnfR599LRN5CraJtsUPv9qySWfZSc5ZUZRve57A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc22235-d128-48e2-2b0e-08ddd6a31fe1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 17:43:46.1036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T+5u7czEhpS1diqMlBDO9SC9abgv+9tpkKl5SpyDkb8Tr1ntdch3CI7bio7L/ZWQkkKmn5m88XZ3LLfb2Tqpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
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

On Fri, Aug 08, 2025 at 08:57:49AM -0600, Summers, Stuart wrote:
> On Thu, 2025-08-07 at 22:44 +0000, Patchwork wrote:
> > Patch Details
> > Series: Add TLB invalidation abstraction (rev5) URL:
> > https://patchwork.freedesktop.org/series/152022/ State: failure
> > Details:
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v5/index.html 
> > CI Bug Log - changes from xe-3515-
> > 76741379fba333222be8a15bebf1e659eb84088a_FULL -> xe-pw-
> > 152022v5_FULLSummaryFAILURE
> > Serious unknown changes coming with xe-pw-152022v5_FULL absolutely
> > need to be
> >  verified manually.
> > If you think the reported changes have nothing to do with the changes
> >  introduced in xe-pw-152022v5_FULL, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> >  to document this new failure mode, which will reduce false positives
> > in CI.
> > Participating hosts (4 -> 4)No changes in participating hosts
> > Possible new issuesHere are the unknown changes that may have been
> > introduced in xe-pw-152022v5_FULL:
> > IGT changesPossible regressions *
> > igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:shard-dg2-
> > set2: PASS -> INCOMPLETE
> >  *
> > igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:shard-
> > dg2-set2: PASS -> ABORT +1 other test abort
> >  *
> > igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-
> > b:shard-bmg: NOTRUN -> INCOMPLETE +1 other test incomplete
> >  * igt@kms_pm_rpm@drm-resources-equal:shard-bmg: PASS -> SKIP
> >  *
> > igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset
> > :shard-bmg: PASS -> INCOMPLETE +1 other test incomplete
> >  *
> > igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_c
> > lass_defaults:shard-lnl: PASS -> ABORT +3 other tests abort
> >  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:shard-
> > adlp: PASS -> INCOMPLETE
> >  * igt@xe_vm@large-userptr-misaligned-binds-8388608:shard-bmg: PASS -
> > > DMESG-WARN
> 
> I'm looking here. I'll report back once I have more detail.
> 

I'd resubmit the CI. I scanned all the failures and most are
weird messages from the core.

Matt
 
> Thanks,
> Stuart
> 
> > Warnings * igt@kms_dirtyfb@psr-dirtyfb-ioctl:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> INCOMPLETE
> >  *
> > igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge-nomemset
> > :shard-lnl: SKIP (Intel XE#4943) -> ABORT
> >  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:shard-
> > lnl: ABORT (Intel XE#4757) -> INCOMPLETEshard-bmg: ABORT (Intel
> > XE#5530) -> INCOMPLETE
> > Known issuesHere are the changes found in xe-pw-152022v5_FULL that
> > come from known issues:
> > IGT changesIssues hit * igt@fbdev@info:shard-dg2-set2: NOTRUN -> SKIP
> > (Intel XE#2134) +1 other test skip
> >  * igt@fbdev@unaligned-read:shard-dg2-set2: PASS -> SKIP (Intel
> > XE#2134)
> >  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-
> > 1:shard-adlp: PASS -> DMESG-WARN (Intel XE#2953 / Intel XE#4173) +4
> > other tests dmesg-warn
> >  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:shard-
> > bmg: PASS -> INCOMPLETE (Intel XE#4912) +1 other test incomplete
> >  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#1407)
> >  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:shard-bmg: NOTRUN -> SKIP
> > (Intel XE#1124)
> >  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-
> > 2:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +167 other tests skip
> >  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-
> > dp-4:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +23
> > other tests skip
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:shard-
> > bmg: PASS -> INCOMPLETE (Intel XE#3862)
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:shard-bmg:
> > NOTRUN -> SKIP (Intel XE#3432)
> >  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-
> > 3:shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +13 other
> > tests skip
> >  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:shard-
> > bmg: NOTRUN -> SKIP (Intel XE#2887)
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:shard-
> > dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#4212)
> >  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:shard-dg2-set2: NOTRUN -
> > > SKIP (Intel XE#4417) +3 other tests skip
> >  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#4416) +3 other tests skip
> >  * igt@kms_chamelium_frames@dp-crc-single:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#373)
> >  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:shard-dg2-set2:
> > NOTRUN -> FAIL (Intel XE#3304)
> >  * igt@kms_content_protection@srm@pipe-a-dp-4:shard-dg2-set2: NOTRUN
> > -> FAIL (Intel XE#1178) +1 other test fail
> >  * igt@kms_content_protection@uevent@pipe-a-dp-4:shard-dg2-set2:
> > NOTRUN -> FAIL (Intel XE#1188)
> >  * igt@kms_cursor_crc@cursor-onscreen-128x42:shard-bmg: NOTRUN ->
> > SKIP (Intel XE#2320)
> >  * igt@kms_cursor_crc@cursor-sliding-64x64:shard-dg2-set2: PASS ->
> > SKIP (Intel XE#4208 / i915#2575) +54 other tests skip
> >  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:shard-bmg:
> > PASS -> SKIP (Intel XE#2291)
> >  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:shard-bmg:
> > NOTRUN -> SKIP (Intel XE#2291)shard-lnl: NOTRUN -> SKIP (Intel
> > XE#309)
> >  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:shard-dg2-
> > set2: PASS -> INCOMPLETE (Intel XE#3226)
> >  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:shard-dg2-
> > set2: NOTRUN -> SKIP (Intel XE#4494 / i915#3804)
> >  * igt@kms_fbcon_fbt@psr:shard-bmg: NOTRUN -> SKIP (Intel XE#776)
> >  * igt@kms_flip@2x-flip-vs-panning-vs-hang:shard-bmg: PASS -> SKIP
> > (Intel XE#2316)
> >  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#1421)
> >  * igt@kms_flip@flip-vs-rmfb:shard-adlp: PASS -> DMESG-WARN (Intel
> > XE#4543 / Intel XE#5208)
> >  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:shard-adlp: PASS -> DMESG-WARN
> > (Intel XE#4543) +2 other tests dmesg-warn
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:sha
> > rd-dg2-set2: PASS -> SKIP (Intel XE#2351 / Intel XE#4208) +3 other
> > tests skip
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> > :shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380)
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> > @pipe-a-valid-mode:shard-bmg: NOTRUN -> SKIP (Intel XE#2293)
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@p
> > ipe-a-valid-mode:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +6
> > other tests skip
> >  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-
> > x:shard-adlp: PASS -> DMESG-FAIL (Intel XE#4543) +1 other test dmesg-
> > fail
> >  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-
> > x:shard-adlp: PASS -> FAIL (Intel XE#1874) +1 other test fail
> >  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#651) +3 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:shard-
> > bmg: NOTRUN -> SKIP (Intel XE#5390)
> >  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#656)
> >  *
> > igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render
> > :shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +3 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:s
> > hard-bmg: NOTRUN -> SKIP (Intel XE#2313) +1 other test skip
> >  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:shard-dg2-
> > set2: NOTRUN -> FAIL (Intel XE#616)
> >  *
> > igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-
> > b:shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
> >  * igt@kms_pm_dc@dc6-dpms:shard-dg2-set2: NOTRUN -> SKIP (Intel
> > XE#2351 / Intel XE#4208) +30 other tests skip
> >  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:shard-lnl: NOTRUN
> > -> SKIP (Intel XE#2893 / Intel XE#4608)
> >  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-
> > 1:shard-lnl: NOTRUN -> SKIP (Intel XE#4608) +1 other test skip
> >  * igt@kms_psr2_su@page_flip-xrgb8888:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#1128)
> >  * igt@kms_psr@fbc-psr2-cursor-blt:shard-bmg: NOTRUN -> SKIP (Intel
> > XE#2234 / Intel XE#2850)shard-lnl: NOTRUN -> SKIP (Intel XE#5784)
> >  * igt@kms_rotation_crc@sprite-rotation-180:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#4208 / i915#2575) +52 other tests skip
> >  * igt@kms_vblank@ts-continuation-suspend:shard-bmg: PASS ->
> > INCOMPLETE (Intel XE#4488) +1 other test incomplete
> >  * igt@kms_vrr@cmrr@pipe-a-edp-1:shard-lnl: PASS -> FAIL (Intel
> > XE#4459) +1 other test fail
> >  * igt@kms_vrr@negative-basic:shard-bmg: PASS -> SKIP (Intel XE#1499)
> >  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
> > drm_xe_engine_class_compute:shard-dg2-set2: NOTRUN -> SKIP (Intel
> > XE#1280 / Intel XE#455)
> >  * igt@xe_eudebug@connect-user:shard-bmg: NOTRUN -> SKIP (Intel
> > XE#4837)shard-lnl: NOTRUN -> SKIP (Intel XE#4837)
> >  *
> > igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race
> > :shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
> >  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:shard-dg2-
> > set2: PASS -> SKIP (Intel XE#1392)
> >  * igt@xe_exec_basic@multigpu-no-exec-null:shard-bmg: NOTRUN -> SKIP
> > (Intel XE#2322)
> >  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:shard-
> > bmg: NOTRUN -> SKIP (Intel XE#4943) +2 other tests skip
> >  * igt@xe_exec_system_allocator@once-mmap-free-huge:shard-lnl: NOTRUN
> > -> SKIP (Intel XE#4943)
> >  *
> > igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck
> > :shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4208) +335 other tests skip
> >  * igt@xe_exec_threads@threads-hang-fd-rebind:shard-dg2-set2: PASS ->
> > DMESG-WARN (Intel XE#3876)
> >  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:shard-
> > dg2-set2: PASS -> INCOMPLETE (Intel XE#5531)
> >  * igt@xe_module_load@reload:shard-dg2-set2: PASS -> FAIL (Intel
> > XE#4208) +2 other tests fail
> >  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:shard-
> > dg2-set2: NOTRUN -> FAIL (Intel XE#1173)
> >  * igt@xe_pm@s2idle-exec-after:shard-dg2-set2: PASS -> SKIP (Intel
> > XE#4208) +125 other tests skip
> >  * igt@xe_pmu@gt-frequency:shard-dg2-set2: PASS -> FAIL (Intel
> > XE#4819) +1 other test fail
> > Possible fixes * igt@fbdev@pan:shard-dg2-set2: SKIP (Intel XE#2134) -
> > > PASS
> >  * igt@kms_big_fb@y-tiled-addfb-size-overflow:shard-adlp: DMESG-WARN
> > (Intel XE#2953 / Intel XE#4173) -> PASS +4 other tests pass
> >  *
> > igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size
> > :shard-bmg: SKIP (Intel XE#2291) -> PASS +1 other test pass
> >  * igt@kms_dp_linktrain_fallback@dp-fallback:shard-bmg: SKIP (Intel
> > XE#4294) -> PASS
> >  * igt@kms_flip@2x-flip-vs-panning:shard-bmg: SKIP (Intel XE#2316) ->
> > PASS +1 other test pass
> >  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:shard-lnl: FAIL (Intel
> > XE#301 / Intel XE#3149) -> PASS +1 other test pass
> >  * igt@kms_flip@flip-vs-suspend-interruptible:shard-adlp: DMESG-WARN
> > (Intel XE#4543) -> PASS +8 other tests passshard-bmg: INCOMPLETE
> > (Intel XE#2049 / Intel XE#2597) -> PASS +1 other test pass
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:s
> > hard-dg2-set2: SKIP (Intel XE#4208) -> PASS +170 other tests pass
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:shard
> > -dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> PASS +8 other
> > tests pass
> >  * igt@kms_lease@lease-invalid-crtc:shard-dg2-set2: SKIP (Intel
> > XE#4208 / i915#2575) -> PASS +81 other tests pass
> >  * igt@kms_vrr@flipline:shard-lnl: FAIL (Intel XE#4227) -> PASS +1
> > other test pass
> >  * {igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-
> > drm_xe_engine_class_compute}:shard-bmg: ABORT (Intel XE#3970) -> PASS
> > +1 other test pass
> >  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:shard-dg2-set2:
> > SKIP (Intel XE#1392) -> PASS +3 other tests pass
> >  * igt@xe_live_ktest@xe_bo:shard-dg2-set2: SKIP (Intel XE#2229 /
> > Intel XE#455) -> PASS +1 other test pass
> >  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:shard-dg2-set2: SKIP
> > (Intel XE#2229) -> PASS
> >  * {igt@xe_pmu@engine-activity-render-node-idle@engine-
> > drm_xe_engine_class_video_decode0}:shard-adlp: FAIL -> PASS
> > Warnings * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:shard-
> > dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#623)
> >  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-
> > 1:shard-adlp: DMESG-WARN (Intel XE#2953 / Intel XE#4173 / Intel
> > XE#4543) -> DMESG-WARN (Intel XE#4543)
> >  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#316)
> >  * igt@kms_big_fb@linear-32bpp-rotate-90:shard-dg2-set2: SKIP (Intel
> > XE#316) -> SKIP (Intel XE#4208) +1 other test skip
> >  * igt@kms_big_fb@linear-64bpp-rotate-270:shard-dg2-set2: SKIP (Intel
> > XE#316) -> SKIP (Intel XE#2351 / Intel XE#4208)
> >  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#316) +2 other tests skip
> >  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#1124)
> >  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:shard-dg2-
> > set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1124) +8 other tests
> > skip
> >  *
> > igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> > :shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#4208) +5
> > other tests skip
> >  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:shard-
> > dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#2191) +2
> > other tests skip
> >  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:shard-dg2-set2:
> > SKIP (Intel XE#367) -> SKIP (Intel XE#4208 / i915#2575) +2 other
> > tests skip
> >  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:shard-dg2-set2:
> > SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#367) +1 other test
> > skip
> >  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel XE#4208) +3 other
> > tests skip
> >  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:shard-dg2-set2: SKIP
> > (Intel XE#2907) -> SKIP (Intel XE#4208)
> >  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#455 / Intel XE#787) +7 other
> > tests skip
> >  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#455 / Intel
> > XE#787) +1 other test skip
> >  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:shard-dg2-
> > set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2907)
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#3442) +1 other test skip
> >  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:shard-dg2-
> > set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel XE#2351 /
> > Intel XE#4208) +2 other tests skip
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:shard-dg2-set2:
> > INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel XE#3124 / Intel
> > XE#4345) -> SKIP (Intel XE#2351 / Intel XE#4208)
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> INCOMPLETE (Intel XE#4212 / Intel XE#4345)
> >  * igt@kms_chamelium_color@ctm-0-25:shard-dg2-set2: SKIP (Intel
> > XE#4208 / i915#2575) -> SKIP (Intel XE#306) +1 other test skip
> >  * igt@kms_chamelium_color@gamma:shard-dg2-set2: SKIP (Intel XE#306)
> > -> SKIP (Intel XE#4208 / i915#2575) +2 other tests skip
> >  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:shard-dg2-
> > set2: SKIP (Intel XE#373) -> SKIP (Intel XE#4208 / i915#2575) +8
> > other tests skip
> >  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:shard-dg2-set2:
> > SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#373) +9 other
> > tests skip
> >  * igt@kms_content_protection@dp-mst-lic-type-1:shard-dg2-set2: SKIP
> > (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#307)
> >  * igt@kms_content_protection@dp-mst-type-0:shard-dg2-set2: SKIP
> > (Intel XE#307) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_content_protection@legacy:shard-bmg: FAIL (Intel XE#1178)
> > -> SKIP (Intel XE#2341)shard-dg2-set2: FAIL (Intel XE#1178) -> SKIP
> > (Intel XE#4208 / i915#2575)
> >  * igt@kms_content_protection@lic-type-0:shard-dg2-set2: SKIP (Intel
> > XE#4208 / i915#2575) -> FAIL (Intel XE#1178) +2 other tests fail
> >  * igt@kms_cursor_crc@cursor-sliding-512x512:shard-dg2-set2: SKIP
> > (Intel XE#308) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:shard-
> > dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#323) +1
> > other test skip
> >  * igt@kms_dp_link_training@non-uhbr-mst:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#4354)
> >  *
> > igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:shard-
> > dg2-set2: SKIP (Intel XE#4422) -> SKIP (Intel XE#4208)
> >  * igt@kms_fbcon_fbt@psr-suspend:shard-dg2-set2: SKIP (Intel XE#776)
> > -> SKIP (Intel XE#4208)
> >  * igt@kms_feature_discovery@psr1:shard-dg2-set2: SKIP (Intel XE#4208
> > / i915#2575) -> SKIP (Intel XE#1135)
> >  * igt@kms_feature_discovery@psr2:shard-dg2-set2: SKIP (Intel
> > XE#1135) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_flip@2x-flip-vs-suspend-interruptible:shard-dg2-set2:
> > INCOMPLETE (Intel XE#2049 / Intel XE#2597) -> SKIP (Intel XE#4208 /
> > i915#2575)
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling
> > :shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#455) +4 other
> > tests skip
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
> > :shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel
> > XE#455)
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> > :shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#4208) +5 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:shard-
> > dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2351 / Intel XE#4208)
> > +7 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:shard-
> > dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#651) +13 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:shard-
> > bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +2 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> > shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +2 other
> > tests skip
> >  * igt@kms_frontbuffer_tracking@drrs-suspend:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#651) +14 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:s
> > hard-bmg: SKIP (Intel XE#5390) -> SKIP (Intel XE#2312)
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:s
> > hard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#5390) +2 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render
> > :shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#4208) +11
> > other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:sh
> > ard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#4208) +15 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc
> > :shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +2 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render
> > :shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#653) +20
> > other tests skip
> >  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#653) +8 other tests
> > skip
> >  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#658)
> >  * igt@kms_frontbuffer_tracking@plane-fbc-rte:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#1158)
> >  *
> > igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:shard
> > -bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +2 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:sh
> > ard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2351 / Intel
> > XE#4208) +4 other tests skip
> >  * igt@kms_hdr@invalid-hdr:shard-dg2-set2: SKIP (Intel XE#4208 /
> > i915#2575) -> SKIP (Intel XE#455) +8 other tests skip
> >  * igt@kms_joiner@basic-max-non-joiner:shard-dg2-set2: SKIP (Intel
> > XE#4298) -> SKIP (Intel XE#4208)
> >  * igt@kms_plane_cursor@viewport:shard-dg2-set2: SKIP (Intel XE#4208
> > / i915#2575) -> FAIL (Intel XE#616)
> >  * igt@kms_plane_multiple@2x-tiling-yf:shard-dg2-set2: SKIP (Intel
> > XE#5021) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_pm_backlight@bad-brightness:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#870)
> >  * igt@kms_pm_backlight@basic-brightness:shard-dg2-set2: SKIP (Intel
> > XE#870) -> SKIP (Intel XE#4208)
> >  * igt@kms_pm_dc@dc5-psr:shard-dg2-set2: SKIP (Intel XE#1129) -> SKIP
> > (Intel XE#4208)
> >  * igt@kms_pm_dc@dc5-retention-flops:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#3309)
> >  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:shard-dg2-
> > set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#4208) +3 other tests
> > skip
> >  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:shard-dg2-
> > set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1489) +7 other tests
> > skip
> >  * igt@kms_psr@fbc-pr-primary-render:shard-dg2-set2: SKIP (Intel
> > XE#2850 / Intel XE#929) -> SKIP (Intel XE#2351 / Intel XE#4208) +1
> > other test skip
> >  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:shard-dg2-set2: SKIP
> > (Intel XE#2850 / Intel XE#929) -> SKIP (Intel XE#4208) +6 other tests
> > skip
> >  * igt@kms_psr@psr-dpms:shard-dg2-set2: SKIP (Intel XE#2351 / Intel
> > XE#4208) -> SKIP (Intel XE#2850 / Intel XE#929) +3 other tests skip
> >  * igt@kms_psr@psr2-primary-render:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#2850 / Intel XE#929) +7 other tests skip
> >  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:shard-dg2-set2:
> > SKIP (Intel XE#1127) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:shard-dg2-set2:
> > SKIP (Intel XE#3414) -> SKIP (Intel XE#4208 / i915#2575) +2 other
> > tests skip
> >  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:shard-dg2-set2:
> > SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#3414) +2 other
> > tests skip
> >  * igt@kms_tiled_display@basic-test-pattern:shard-dg2-set2: FAIL
> > (Intel XE#1729) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:shard-dg2-
> > set2: SKIP (Intel XE#1500) -> SKIP (Intel XE#362)
> >  * igt@kms_vrr@flipline:shard-dg2-set2: SKIP (Intel XE#455) -> SKIP
> > (Intel XE#4208 / i915#2575) +4 other tests skip
> >  * igt@sriov_basic@enable-vfs-autoprobe-off:shard-dg2-set2: SKIP
> > (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#1091 / Intel XE#2849)
> >  * igt@xe_compute_preempt@compute-threadgroup-preempt:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#1280 / Intel XE#455)
> >  * igt@xe_configfs@survivability-mode:shard-dg2-set2: SKIP (Intel
> > XE#5249) -> SKIP (Intel XE#4208)
> >  * igt@xe_copy_basic@mem-copy-linear-0x369:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#1123)
> >  * igt@xe_copy_basic@mem-set-linear-0xfd:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#1126)
> >  * igt@xe_eu_stall@invalid-gt-id:shard-dg2-set2: SKIP (Intel XE#5626)
> > -> SKIP (Intel XE#4208)
> >  * igt@xe_eu_stall@unprivileged-access:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#5626)
> >  * igt@xe_eudebug@vm-bind-clear-faultable:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#4837) +14 other tests skip
> >  * igt@xe_eudebug_online@debugger-reopen:shard-dg2-set2: SKIP (Intel
> > XE#4837) -> SKIP (Intel XE#4208) +7 other tests skip
> >  *
> > igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:shard-
> > dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1392) +1 other test
> > skip
> >  * igt@xe_exec_fault_mode@twice-userptr-prefetch:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#288) +24 other tests skip
> >  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:shard-dg2-set2:
> > SKIP (Intel XE#288) -> SKIP (Intel XE#4208) +15 other tests skip
> >  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:shard-
> > dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2360) +1 other test
> > skip
> >  *
> > igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:shard-
> > dg2-set2: SKIP (Intel XE#4915) -> SKIP (Intel XE#4208) +175 other
> > tests skip
> >  *
> > igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck
> > :shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4915) +238
> > other tests skip
> >  * igt@xe_mmap@small-bar:shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP
> > (Intel XE#512)
> >  * igt@xe_oa@mmio-triggered-reports-read:shard-dg2-set2: SKIP (Intel
> > XE#5103) -> SKIP (Intel XE#4208)
> >  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:shard-dg2-set2: SKIP
> > (Intel XE#3573) -> SKIP (Intel XE#4208) +3 other tests skip
> >  * igt@xe_oa@whitelisted-registers-userspace-config:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#3573) +6 other tests skip
> >  * igt@xe_peer2peer@read:shard-dg2-set2: FAIL (Intel XE#1173) -> SKIP
> > (Intel XE#1061)
> >  * igt@xe_peer2peer@write:shard-dg2-set2: SKIP (Intel XE#1061) ->
> > FAIL (Intel XE#1173)
> >  * igt@xe_pmu@all-fn-engine-activity-load:shard-dg2-set2: SKIP (Intel
> > XE#4650) -> SKIP (Intel XE#4208)
> >  * igt@xe_pmu@fn-engine-activity-sched-if-idle:shard-bmg: ABORT
> > (Intel XE#3970) -> DMESG-WARN (Intel XE#3876)
> >  * igt@xe_pxp@pxp-stale-queue-post-suspend:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#4733) +1 other test skip
> >  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:shard-
> > dg2-set2: SKIP (Intel XE#4733) -> SKIP (Intel XE#4208) +1 other test
> > skip
> >  * igt@xe_query@multigpu-query-cs-cycles:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#944) +1 other test skip
> >  * igt@xe_query@multigpu-query-engines:shard-dg2-set2: SKIP (Intel
> > XE#944) -> SKIP (Intel XE#4208) +1 other test skip
> >  * igt@xe_render_copy@render-stress-1-copies:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#4814)
> >  * igt@xe_spin_batch@spin-mem-copy:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#4821)
> >  *
> > igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:s
> > hard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4130)
> > {name}: This element is suppressed. This means it is ignored when
> > computing
> >  the status of the difference (SUCCESS, WARNING, or FAILURE).
> > Build changes * Linux: xe-3515-
> > 76741379fba333222be8a15bebf1e659eb84088a -> xe-pw-152022v5
> > IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >  xe-3515-76741379fba333222be8a15bebf1e659eb84088a:
> > 76741379fba333222be8a15bebf1e659eb84088a
> >  xe-pw-152022v5: 152022v5
> 
