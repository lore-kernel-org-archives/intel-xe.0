Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEFCC282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 20:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061A10E02C;
	Fri, 28 Feb 2025 20:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFWB9ysj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E111F10E02C
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740774784; x=1772310784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UJkUl1X2GlpGjiL6qiP1+cbwO05EFiZ3ZG07LacsS0E=;
 b=JFWB9ysjdybzLuECQcTVPWzGOXZnrCmbAqbEz4WuuqW+GY4UgL3p8nZb
 8NDZJeW3zPJqgR6qZJzfIVNuJW+XWQJK4u4TkwUyWwhePuyZiF2SHskHq
 +JXOjHehm6y1z8u+FhqNRsNs+rgiDEKVAgYMEIcdXhrQZgmo/Egro5H/M
 eFLrhX/yWRvzeZ0QqyS71ELeElutwtRODpwqcGf9TQC5hwpOEW1kKkGaY
 IHpQPLlPtNoA776mO1f5+Rpa1DtHJ18adURglDO8CeFh99x9MgVcgXiq5
 rcX9QgkpY9XqO2WDATrUxmYcCVBSRDLf5OwsxZ4+ndkSxsskztHKpzIRl w==;
X-CSE-ConnectionGUID: T3Nd9fRRQFWGHOn/x1vbsg==
X-CSE-MsgGUID: 5fEYsMruTeeDXLfGSUoEPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45500446"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="45500446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:33:03 -0800
X-CSE-ConnectionGUID: 6DRFjH1VQIm5vg+LeeHQCg==
X-CSE-MsgGUID: +v1QjBaYTr261qpJRSYG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="117934599"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 12:33:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 12:33:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 12:33:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 12:33:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZ1S11xxiWCSamqKCNXegWKOCwaMUmiQn/0Y29amySh+evmPNMsgzAx9iH3jAJrxO19KwpU0G1nWXXOuGEm3kJd7+Ce+DrJPLu1ZZEm5QaZNew7zA0ssDtCeF7V2jl828gUqTw1UkYm+7+y75YQrOKIlgfHdtWbPvXIdooqVkz4n1ap8Ksxo9qGVT3Rlz9p4SjyeHOZn37H5Lg8gmFvLl7oEzexGuzkZNr7AsfUbcVlfvD6cJICY6mXBhrtZ+hUSIyJPZOs/Ng5ZgxoxTn5YUX74xSYjVpOA+ScBCOLoXxqhpz4TO48LUHYsSxMAby+FjzocygCA+oGNOce4HFILIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULQIqbeKVeBjVUqO2eaCROXCs3arypOAzMV6cgTY7GM=;
 b=dndOi4vjBdYvREZYz0R6nuPyjWYR+ytMh++XAbzIdk7WAeQMyDcIDPpLXptVShwJrWIHm6V1orR7Mj9z2xhVMEnvhdaZNXh1mr7UHHdciNZkn6s8fEhSYQbQoVFa4pt9HNar7jFEzU3OhOEmlDgOgXQnamOpb79g+91fbsjxl7HzhXUDxhwIvp+G60QFaakWDitY783NgIq6CI0GZyGeCkAlJugJm3PS+uGm4z9dsZDLWI8OU2Ak9FCp5H43Qpuc5JpTRt7IR/EUlRnkBn5WD2Dv9gy+mJTw+AcdAbhSMF+eIw+SK4xDGHly2AQQ91dCMe6hi3WCMlQtLMdmEXWvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 20:32:57 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 20:32:57 +0000
Date: Fri, 28 Feb 2025 15:32:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Message-ID: <Z8Iddm4HB1O1yY0Q@intel.com>
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
 <a11812cc-bf0e-488f-9701-317ee9807699@intel.com>
 <Z8ISULSSQYvaYIjl@intel.com>
 <f9ffb2c6-00a3-43f7-b7c3-68f8de064254@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9ffb2c6-00a3-43f7-b7c3-68f8de064254@intel.com>
X-ClientProxiedBy: MW4PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:303:8f::12) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f245079-6e6c-4298-4ca9-08dd5837161d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2T6iirlqIJjpFt6Ut9OOrbogGwqEoRQlr8BnJeTPCfNULQOgOPoUXCWu4Zjt?=
 =?us-ascii?Q?w49rJzWkSH3HUwer46fRdhCqNyhfoPHpVMdxwm0U4mnLm+SsNJ4nQg8fxptG?=
 =?us-ascii?Q?RB17VV1JeYr/8c6s28VOz7kalY7GtUo/EREfWVOvcZeitCo+EYcjQRqiK/c5?=
 =?us-ascii?Q?NSLPma8ovjR6P6+yr9K6mK3uO8D4O93ezVI8Wj2EVczQXShkHnMZEQNyHCMk?=
 =?us-ascii?Q?s8XSxWSykkVZuCW68povdH9HXmCL0wq5vZICPl5xDmhaouLfcd0eGBpEom9a?=
 =?us-ascii?Q?9rkei07+mxKTazXON2hAKT8RvjdgINi3tvRxRH5bpyp4bo5rj231lRzz/KG4?=
 =?us-ascii?Q?uXb+0JLAFwls/78sh3K+lzfbW8i01oRdgvfH8uTY5Wecca3Ulg1ifI330NJ0?=
 =?us-ascii?Q?XgBdhG7jUxCEFQB/FFqUb/28IJBE02H0p65FeeR4pB1DVc0MNNxn1AD4PVDg?=
 =?us-ascii?Q?/bmN72T+5YmGGJlS9GZp8PT79Cr1wBL//1Qy81LaIaEOw2xR8mcooEHvg9dV?=
 =?us-ascii?Q?hIouco6xqc5rzbZPO3LurlvuNdO1O3bzb3s9BlO9o0syCrUgHus7eDcXqXCP?=
 =?us-ascii?Q?WiEuAcy8KQVIpU3SWEc0WY6bg2VAmgMMVFmMdriU5Lbk26UEV/2oAgGljuM8?=
 =?us-ascii?Q?/zPe3t2BX3oKTThj82wHzxa83TwZCPI1i3d/zRgoWrsuCfZ7evh9cqfp+eGU?=
 =?us-ascii?Q?JVXyxALiMdsMogoWCfxDqtdOZbtqJRPB7Cuet2iq8ZKNk4hh7jWD4j8keDeB?=
 =?us-ascii?Q?bs7MPPZmdAZcS190B84OlqM+X8oOc65/GshhpRp017gRpuxfNwm7hjl4SbsE?=
 =?us-ascii?Q?3bQuxFCybOgF7IB2IOKDSAhyJCZLqPj1NyKBFJGFx3wDnLgCwbCmiQW3gsLY?=
 =?us-ascii?Q?2FFzaRyo6O0k6bp4OsOkJhhS/nZkfDtetiIriTqpXrUls1sUY+gdgZ9OUTGs?=
 =?us-ascii?Q?AuTHwhxiV2zAZIIrDX+qyT65MT2DgKPP4zskBVgUG9aaIYexrhEF8xcDfhlN?=
 =?us-ascii?Q?3973eujRv5Dgtg1VrFFD9zroBllBmpdfKpvDBJU09TyyqM8W+ab/8EittgEz?=
 =?us-ascii?Q?2t3zKkfvU01QuMc8tHKcksHdsqICL9gAZqHfYTljU0RwdoFMowaLpyCEE+tb?=
 =?us-ascii?Q?KetjlQQDa+Lkx5rytZE/IWcSTBQ0HG/rbyCvDtbqBlXxNMO/T5oESO7I0+hh?=
 =?us-ascii?Q?2tdo81lPM1bAArn8/iyot059bfAynmKUXul9vYbTlBDolPAMocfuu9cLOgOu?=
 =?us-ascii?Q?nqjL1HqkHvFyEQ87myL2t+0dX15W5sMh7Xbp3fGJ+o6lD0CYcNPpE7rnnfsf?=
 =?us-ascii?Q?5vAbl9s/2sDFi2O6DufYPYoalbbDWITWiapXKUawODSNX3rNMCOm+xoQASlp?=
 =?us-ascii?Q?5fCgIZPpRGYwKNd5NcgsCrHpZiba?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KVuvOqncUip8Lk9AxrEMo6IVUb44Y5oogcHtw0yhHik2S4sJnMzU/X00F0E1?=
 =?us-ascii?Q?iJqTN+NPlqv5SB6ApqpbErnNdVg1jnVnwGT5/omZTvW0SLwZuXJN6A70GWk4?=
 =?us-ascii?Q?v0o3CJpyYCToVg+0zg14ejugSPssw2WpauoZBnrMv6PNdeh4QVtMfjlKEH+A?=
 =?us-ascii?Q?Nul55OQRc8t7wQmLvXAPBlRtxSwSxghbyEU48DA96cG9D/QoDLn51JTXyWMD?=
 =?us-ascii?Q?PYEVGgdmeezg3E+OQ7Q1+OUrkeobtVwJbqcmnJ+5CHsEIgcsH9rqb53wDQ5o?=
 =?us-ascii?Q?NMmG10QfbRlwgH24xnQWJuRItltR0Nes6dZvxPh+VC0j9zjurd3jFNsfo2uu?=
 =?us-ascii?Q?ZgfJNosoEj4mHeGkb7AzqkUMlpT1mqi2Sw5pugtr+2Vyy443jK1FkIoEoTbs?=
 =?us-ascii?Q?14RVRn01cVbdocI/4czACsR1X0bfCulVNcz55oKRyrqcDTJG2AQpvYPdxCIo?=
 =?us-ascii?Q?Nfd29NgG56KvUYHzYhRnNCTjJPfivoxRqzRVGcrUuQzTrypE64+/ryxiwQpE?=
 =?us-ascii?Q?I+yxfp2SHWQy3TWBah8RRH/dYnq3sijjcpX83Jjjzmvwvso0xEUpIpvcd3+3?=
 =?us-ascii?Q?KQqMVWYhEmnw+WdBJIptR0NpPS3CfAOFh31c8aYjMVonW1IJkm1U5s78Vqiq?=
 =?us-ascii?Q?SpfCBp1uYGRDxz/ptoS9DoxkNrF9DFW5C8ry3CLzcNYYiOjtlFkZ+aSry/h+?=
 =?us-ascii?Q?3NIUgADPhYY/T8WOgoJvegXfsdl+Sk0iNNremai58nyHIrkXdF05dNVnYoTG?=
 =?us-ascii?Q?vI+eU3xyIEX/V1/hFLAT09Bnzm0ld2hNj2hBBrDAL3oaKWzRgLGif7QNcTJ9?=
 =?us-ascii?Q?hsHD9jSJlpXBzX+Yjrx3Znjykwp0x/gTnlq4MDuBDdGFEW9Fub8PBnyv++sp?=
 =?us-ascii?Q?2P79X0z7QKhNtVql7iIuxQX4Kl+/wIMoq5E3M0fNJCVllcdlg9hLkq6i2wTV?=
 =?us-ascii?Q?wSoSNRNUvg/A4SR7gvtQM73XJAiM3SBbnsQ2meS7SWG8/q2ciDkaI1KmP+9J?=
 =?us-ascii?Q?DPMkpLgh41G6NUScc49PieOLyjSrbYOeGTbqtmQfsmAUCHmpx2ohJKd00ifd?=
 =?us-ascii?Q?7pulM9b9PbdOipq6Rfy+735Q5+n/doWyV+T9ZFr7vhks1KkAa6sdZjzcZ30T?=
 =?us-ascii?Q?jaPu7wpxtj7Ske57V2EvaWIBdMvquFC8w6JQrAOzjslUhDOhy2OAQh4wWOuW?=
 =?us-ascii?Q?gPtxu7kcISMQy50nm5vqYu/RsIe1iPjuklUf+gABjLLMoHwCxQu4h+fSsMC/?=
 =?us-ascii?Q?S9W0k2wL7fuF/QJyGq8b/1AYp3rJZ7crmkjjhGxUE2KInzCucrW4mO3nCbWH?=
 =?us-ascii?Q?uG1y83fQksejXzoI/FrwOoP/Y9BfK9z/UkwKFrpb6YU3qt8wDDrLZaYLgXM+?=
 =?us-ascii?Q?NY31se5hUtfdlo1bOeqHVZtsqh5RaMn3Tz6N62EYldDd9MM2ecIvWDKmEBrv?=
 =?us-ascii?Q?8Rc1OdjIE0L/qaCQrVsn47rrQS1KOA7Ep6p8r8gDxJB7Vcq5Rc1rAVlze8cM?=
 =?us-ascii?Q?FpPql+Nrxb/CmA1yXOuV8CBlwlpfQ117jNDv//sgKvAhHbCTwd5LLWHr7n7E?=
 =?us-ascii?Q?2pEwi3ZzaOMabE5EwIgTf49mmu2Zr/wuNAytGMnr8t8yg0CPrKr9KGZ3IvN5?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f245079-6e6c-4298-4ca9-08dd5837161d
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 20:32:57.7258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efNca99THDB6wvDkeQsu8iHvgri2tg6Nq5PMoS02M5U0MbM749n1Cu0VnYNKg4dIzy+Fg0RN81IhqsRuUn3A5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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

On Fri, Feb 28, 2025 at 12:13:24PM -0800, John Harrison wrote:
> On 2/28/2025 11:45, Rodrigo Vivi wrote:
> > On Fri, Feb 28, 2025 at 11:22:02AM -0800, John Harrison wrote:
> > > On 2/14/2025 09:25, Rodrigo Vivi wrote:
> > > > In a rare situation of thermal limit during resume, GuC can
> > > > be slow and run into delays like this:
> > > > 
> > > > xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
> > > >      		 [status = 0x8002F034, timeouts = 0]
> > > > xe 0000:00:02.0: [drm] GT1: excessive init time: \
> > > >      		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
> > > >      		 perf_limit_reasons = 0x1C001000]
> > > > xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> > > > ------------[ cut here ]------------
> > > > xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
> > > > 
> > > > If this happens, this can block entirely the GPU to be used.
> > > > However, GPU can still be used, although the GT frequencies might be
> > > > messed up.
> > > > 
> > > > Let's report the error, but not block the flow.
> > > > But, instead of just giving up and moving on, let's re-attempt a wait
> > > > with a very long second timeout.
> > > > 
> > > > v2: Keep the precision comment (Jonathan)
> > > >       Use a define for the regular SLPC reset timeout.
> > > > v3: Improve messages (Vinay)
> > > >       Only skip initialization if the second full-second wait failed.
> > > > 
> > > > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++++++++++----------
> > > >    1 file changed, 33 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > index 02409eedb914..74cc13012532 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > @@ -20,6 +20,7 @@
> > > >    #include "xe_gt.h"
> > > >    #include "xe_gt_idle.h"
> > > >    #include "xe_gt_printk.h"
> > > > +#include "xe_gt_throttle.h"
> > > >    #include "xe_gt_types.h"
> > > >    #include "xe_guc.h"
> > > >    #include "xe_guc_ct.h"
> > > > @@ -50,6 +51,8 @@
> > > >    #define LNL_MERT_FREQ_CAP	800
> > > >    #define BMG_MERT_FREQ_CAP	2133
> > > > +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> > > > +
> > > >    /**
> > > >     * DOC: GuC Power Conservation (PC)
> > > >     *
> > > > @@ -114,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
> > > >    	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> > > >    static int wait_for_pc_state(struct xe_guc_pc *pc,
> > > > -			     enum slpc_global_state state)
> > > > +			     enum slpc_global_state state,
> > > > +			     int timeout_ms)
> > > >    {
> > > > -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> > > > +	int timeout_us = 1000 * timeout_ms;
> > > >    	int slept, wait = 10;
> > > >    	xe_device_assert_mem_access(pc_to_xe(pc));
> > > > @@ -165,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> > > >    	};
> > > >    	int ret;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > >    		return -EAGAIN;
> > > >    	/* Blocking here to ensure the results are ready before reading them */
> > > > @@ -188,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> > > >    	};
> > > >    	int ret;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > >    		return -EAGAIN;
> > > >    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > > > @@ -209,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> > > >    	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> > > >    	int ret;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS))
> > > >    		return -EAGAIN;
> > > >    	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > > > @@ -443,6 +450,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
> > > >    	return freq;
> > > >    }
> > > > +static u32 get_cur_freq(struct xe_gt *gt)
> > > > +{
> > > > +	u32 freq;
> > > > +
> > > > +	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > > > +	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> > > > +	return decode_freq(freq);
> > > > +}
> > > > +
> > > >    /**
> > > >     * xe_guc_pc_get_cur_freq - Get Current requested frequency
> > > >     * @pc: The GuC PC
> > > > @@ -466,10 +482,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
> > > >    		return -ETIMEDOUT;
> > > >    	}
> > > > -	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > > > -
> > > > -	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> > > > -	*freq = decode_freq(*freq);
> > > > +	*freq = get_cur_freq(gt);
> > > >    	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > >    	return 0;
> > > > @@ -1033,10 +1046,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> > > >    	if (ret)
> > > >    		goto out;
> > > > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> > > > -		xe_gt_err(gt, "GuC PC Start failed\n");
> > > > -		ret = -EIO;
> > > > -		goto out;
> > > > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > > > +			      SLPC_RESET_TIMEOUT_MS)) {
> > > > +		xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
> > > > +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
> > > > +			   xe_gt_throttle_get_limit_reasons(gt));
> > > > +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
> > > Shouldn't this be a define as well - SLPC_RESET_EXTENDED_TIMEOUT_MS or
> > > something?
> > good idea! will do.
> > 
> > > More importantly, Is 1ms enough of an extra wait?
> > The new timeout argument is in ms, so it is 1 second.
> Doh! Yes, I saw that but then completely spaced it out again!
> 
> > 
> > > If the GT freq is 100MHz
> > > instead of 2GHz or some such then the expected max of 5ms could now be more
> > > like 100ms if not even longer (the slow down does not seem linear). As an
> > > example, the GuC load itself should be <10ms but with clamped frequencies we
> > > generally see over 500ms, sometimes over 1s.
> > hmm... over 1s possible? so, perhaps 1250 to be on the safe side?
> > other suggestions?
> I think a second should be good but I don't what is involved in the SLPC
> start up? The long delay loading the GuC is due to doing decryption which is
> a hugely CPU intensive task and the GuC is not a huge CPU! If SLPC is more
> about waiting for hardware to respond then maybe the slow down won't be as
> severe? Plus the GuC load is inherently slower in the first place - our
> original timeout was 200ms with expected values in the 5-15ms range. If SLPC
> is starting from a 5ms timeout then presumably the expected time is actually
> more like 1ms or less?

Yeap, I randomly put a big wait because I wasn't sure why/what.

> 
> You could try running with the frequency manually set to 300MHz and see how
> long it takes. I think that is the lowest we can explicitly request from the
> KMD?

Great idea! Although it can change a lot by platform and SKUs, but we could
have at least a rough idea instead of a blind big guess.

> 
> > 
> > > > +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> > > > +			/* Although GuC PC failed, do not block the usage of GPU */
> > > > +			ret = 0;
> > > I thought the new policy was that any subsystem failure should now be
> > > considered fatal and abort driver load? I recall a PXP start failure was
> > > recently upgrading to being fatal even though PXP is almost never used by
> > > any actual users. SLPC seems much more vital to the system than PXP!
> > Hmm... good point! I have to get back to the board then and have
> > this logic only for the resume?!
> > 
> > If this happens during the probe yeap, let's block because subsystems
> > are buggy. But the case I'm hunting here is a resume from S2idle that
> > is entirely hanging the platform when this happens under thermal constrains.
> Hmm. What platform is the problem showing up on? There are a couple of other
> bug reports about systems coming up in an odd state after suspend - e.g. GuC
> image not loading due to memory corruption. I wonder if it is not actually a
> thermal problem but just something confused due to uninitialised state
> somewhere? Plus, how can you be in thermal meltdown on a resume? If the
> power was lost then the device should be cold!

Indeed. It was a LNL case in a very specific kernel version. Issue is not
reproducible anymore. But with that bug I realized we were actually entirely
hanging the platform on resume and this is not a good approach, even though
the original issue was not ours.

> 
> > 
> > Thoughts? I'm open to suggestions here.
> My main thought is that if the frequency is clamped (by the hardware itself)
> at absolute minimum then the system is not going to be very usable anyway.
> So is continuing to run by using huge timeouts actually beneficial? But not
> sure what else we can do at this point? Maybe try an FLR? But yeah, it is
> probably good to try harder to keep going on a resume than on first driver
> load.

Well, with the resume happening, the FLR could be a bad hammer. But well,
worth considering indeed. I will do some more experiments around and see
our options. But the hang as currently is is the worst scenario.

Thanks a lot again,
Rodrigo.

> 
> John.
> 
> > 
> > Thanks a lot for raising these so far,
> > Rodrigo.
> > 
> > > John.
> > > 
> > > > +			goto out;
> > > > +		}
> > > >    	}
> > > >    	ret = pc_init_freqs(pc);
> 
