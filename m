Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E4AC3DA59
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 23:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEAA10E04A;
	Sat, 20 Jul 2024 23:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ef9bDmTn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3B010E04A
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721517692; x=1753053692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RIK4ujSxGQ9r89H+SgDQKjFjDj66WmRJbsY1un47lB4=;
 b=ef9bDmTnd/ivBKdD8Aqp04Sxfbl3ezivHf+2hrNYRlTTLsRH1Ffh+YvQ
 JnPRHKqNaVpONGR5pelYpZhEhwYjfDH1tuMwUNMY+rTNyMberrCmy1oPY
 c5XbOE+0L62xYURfOCELnQW/okf31PrzceFWOaeoDQ1/nZ5e333GqBsLL
 LiTUjUEglTwVkxG/DK6d6+qTl5Wc34RWhbVZoHCK4enNLORCIo9S41VQL
 4jWjmo6+2Pj3aUC7l/XnIZ9rHh1h2qPy9WQYDr7+oumdFd13aZbBf+cIH
 KOPrKBM7QigMuIA6w6xod/+CBY8ftrGChTD1qvzoPWwZR6H9L/Q8shZab A==;
X-CSE-ConnectionGUID: 0cUqIUilTH6tjk4ahTjllg==
X-CSE-MsgGUID: QgOyMZmqQr27xtZwbmSYgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="30539727"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="30539727"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 16:21:31 -0700
X-CSE-ConnectionGUID: y5LeK2yoR2a3g2q/EV4UtQ==
X-CSE-MsgGUID: t6CAyUW1Q2eU0P7Q8VyLGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="74697500"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 16:21:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 16:21:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 16:21:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 16:21:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 16:21:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAIMNZpLWgLRcMeenGsCOpOci9xda6saEDTDU9FpbNQQQ3joa3pDtVfW6uBBkYxwZB5DRWd0KZ2SQXNz2clD76Kvv0Te8fQYW/NvXxUIa2hmaCOXsjAzXqKaDwlX43eShOnFH+UxLJAVZSLeMV6E8kbwcUHBo4A1cZMMFXAxtp0YX1Bd0C13mck5R6By1p0BurE779ItceJk/3ZytREG4Ur38UJxmVhr3ZnrujKZwQvS/pqz2Y72q0hkcox4wDYAsGwhYGP5IrxfAApro/FxCTAwFH/um0EZD5JbmJo3+XKNcHetMxrORwOaKjj6soExwiCTRlAwK754A9MJYvLPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjuRPbP268h21clZxcJ4IHfMNzgxFmXVMdaU2/uDuOM=;
 b=zWC4ZCn1+GoJYgWIHlpxpMpXRj1Moin5XAaDC4f6BXpWEw3/cBwJDE4GJRydhY2nP6N8Ep+QYk56bUpcwS3pxyiGni+wAof7B5FijgemGw7nsal77qnTRRnze1ThDXhWYimm+e0AW+YM3hcl5RNYqj1yMyKvqgheQ9B3pPTZUYpM81aiZsSeTk1CPH4V6NJ8Iia9f/kxjR7nSH4Hk3aUesm4DyiJolOalvJdFDbONcO+pq8YtZO4x7H8eL6/wyp52V2eozrfdPzlrWj9kRta01pzyOSgdsQj/aG2YfsS8TcnOC/okxE/PV4qycWYirkbxMiHVz7tu9ZlQKUU2Df9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Sat, 20 Jul
 2024 23:21:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Sat, 20 Jul 2024
 23:21:27 +0000
Date: Sat, 20 Jul 2024 23:20:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
Message-ID: <ZpxGRbMQ3SWAZ38t@DUT025-TGLU.fm.intel.com>
References: <20240719172334.1527484-1-matthew.brost@intel.com>
 <3bf93639-74b9-41ff-9d6c-1911506772a2@intel.com>
 <ZpxE3A6BrzymJZYL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZpxE3A6BrzymJZYL@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:a03:60::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d420c51-94e4-4571-33d9-08dca912adc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tzFO1fjeuH3aCc5NUJaD85WxODAhPW4EFAOS5Y1ZKPerSY9kdMz+4nnvNoCS?=
 =?us-ascii?Q?5VWwFZcX5v0ViBWvyMPc1QBnEmkh7I2fwDUwZAGdn0iycHYABq7ypIGCBwMD?=
 =?us-ascii?Q?0FtVEOJkro0nNbgLVLI+2r0+HKMDOHPqtbyOZEcVQXs4JEDFb6C6wYXxu5qO?=
 =?us-ascii?Q?/pm9DYpAWV6D7EkyUizNslWY0WACKkYpSpnIx3u7eMDIE4O1rgq55tf99J5L?=
 =?us-ascii?Q?8ZJdFVxjnFyMs9OeDYZWP+15JRNMntMClYoo3YHd+9Ggg3NwV/M6tSflIQbQ?=
 =?us-ascii?Q?jHc8N2IEk4qm799sorB4xw39MAYoPNp5yDPccOeRjyWO/3yjvZrOG55DYZmj?=
 =?us-ascii?Q?HTLh5fpwgcRiIv8uLzSE0QA39mqm5UtmqWLhmTLYSPHmK+PVlCQ1CDGkePUn?=
 =?us-ascii?Q?a+peONMO94f84dk7sW+fDfI42LFhVuGx+b718vdTnMs49nsdRUdRMA75uFHV?=
 =?us-ascii?Q?6d3BMxLqMl3DYTSLZbD7LFM0CdSV7ahw2Rg30RSJrsyMhR7ij40hJmV8LfHI?=
 =?us-ascii?Q?akWJa3SqBPIUy8IIlGFZGEyCaa673oXZcLKqIq51xPdzhqSP0Tiwbj5J2ccN?=
 =?us-ascii?Q?loELqZT6XclYZUxyzUex+0MtpCNmQ7HHVA/RrXJhB1MbemUmVckrMWglpehy?=
 =?us-ascii?Q?nkWZrLxpZK1Y6a3x5qPXlDfpr1bnI7mbrs1ST9i5sUqkxq90SdxQ29lyPngV?=
 =?us-ascii?Q?13S9qEB00xwaMVra6n9ZrDz4ZB+CYIvyDEjGhRUoG7/N7V9zZHLpAeHr6QW2?=
 =?us-ascii?Q?pQFR6htaAAUY2owgVRS39ZsvgQmxzTvLG2YMCiqO/REv23XbnVHa7kN5NM4N?=
 =?us-ascii?Q?x8zH3LP9JaR+zktQtTEDjGBJYmfJdICRY6CSo17vkZJKo6ZChykpZcUEzYKo?=
 =?us-ascii?Q?nUfVEQDrDWfsR50PX/FmzDt6bGn88DO8e0/bCvEvmReqYNy2YZbRxJzllsQK?=
 =?us-ascii?Q?7M7+1fyZqTtFcLWq9mgei3/YokSyIjeX5yW1HdLvwd/sjHwAU2eGv1h8qMyp?=
 =?us-ascii?Q?LkBZbu18Echd8wEO7mXmihf1NP3eC8iOl1hKEGDjaT2Nq4d85zJ0wKevlRpT?=
 =?us-ascii?Q?a9eV+PMNLwoQf3eOWnfukgDeRbh9XZhIz1b7j/tAQ2li606X0YxmgTDs35iF?=
 =?us-ascii?Q?oI0ShK59eTSngLBRAxCoFi2q9GwDTr3BoZhk260eRXiuHHl6xdXAWc7+tgt1?=
 =?us-ascii?Q?gfNKE6/eiOcK6pbtVr5Whsh4f0kC3JBEeBsL6AkckLI5Piqd1IL1ge4AUYKy?=
 =?us-ascii?Q?JWEnn0dTxHLynDtIjPwyf+gy2pySl+0zc441BQVSfmzSxtpaBV2b+WsBwEQ3?=
 =?us-ascii?Q?/Pc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kMqdLp1lg1jHFTh0vzmV57U6d5PfUKAk2FdGnXLQmSqcnAg33wahreGjKoOB?=
 =?us-ascii?Q?rcuDZD88/yFQznIPgYOG1ZvpTH2nEmFDoEz8ufAyBb4E13wwcLIYb2kahUZq?=
 =?us-ascii?Q?rA5Hah+AZTfTJZxWwGnFA4I93IKmr4ilJoCJZhNMosc9Lv4GuMZ9fEtiZtuk?=
 =?us-ascii?Q?ece/U6IUKf90+KpbPxl6Xu80CjgXXoTPA6z5fTHQAUewqlqJeWIPd/uUtF8k?=
 =?us-ascii?Q?YDzrI5yzRU5O7bIwCrim7c1rh08rYT287+7uWkwB9gJ/XTdbR1lWVkHnhaUU?=
 =?us-ascii?Q?DjPP6Fyo0ORYeEwfUj5yntD4BDdv+eROXwDLHhL7M9THU8L3CNrgtzdyv/nt?=
 =?us-ascii?Q?bqWtNDvDZxua5s/kekF2ImM62B9G6RUquQbFCucy2QdYSnw5yq5RzCN4N08N?=
 =?us-ascii?Q?pczcGmc4F2Sx040Z1FWTP0Ibn/JbmE3lfOa/wsc3kn49BcYGeDBQjnyIjzFQ?=
 =?us-ascii?Q?ChvUR4+8z1Cq+gfl2AjNS5uJH8CfqKKrLwwtvDFD9XMKSHZn3UkPDgSu2a6X?=
 =?us-ascii?Q?WTEcN4sY0NEEqnCPKokGBNijkqGH2y9azDTvM/7+nMN52J3pyk40CWUJ04lm?=
 =?us-ascii?Q?Jf4GEdVTEPL1jq+P8hMilTVPBJXg9/EJ4VBf+c2Tbm8VrqpT74K8HGQBu2u2?=
 =?us-ascii?Q?K8UnTNXba+jSyG2u0Gmr5m+/lW0JDEadFej1JRQrVcFhbMDyOkdC88ZFf1E3?=
 =?us-ascii?Q?OV30WDSm/dn2aTmZitKiaqlCHrQi/R2P04RCxX1cCc/vEVQz9jmXYV9xvpai?=
 =?us-ascii?Q?YH0k++F+qD4CqTtfHl9dHZZzqIzBFxtVIO96xjniSsj0fF2zLFAykSlBu4v3?=
 =?us-ascii?Q?fy2Wz7yTx2xLJIIyKXfcQelQLPVozZinNrqiNarirLe+fROvvLPOCx9NIi8y?=
 =?us-ascii?Q?cswzxrhduDtkMXNGOCtF2YYCYxU2wo0HnlA1iJljeZ5KQdLhuA+haKC8wcRg?=
 =?us-ascii?Q?Krz4yhpGHczCgnQK/lh0RHItAlv2pbqUj1p87vVCxUkBIcclWG1S+PdY2p8W?=
 =?us-ascii?Q?iLbKVzmRmpGA+oaKYJLXvIzfhelUiyrXdA/UbhbAqf+WXT/Cybm1w8FIam/f?=
 =?us-ascii?Q?Lhy5zaHGuSasCdEZOF6UXu5koBM9CjMLzuppoJHy/C8RgyRuWKileGqBve7z?=
 =?us-ascii?Q?oqztM13WpmpED7hdn0nQbQU4WGBQSRClsHZ/CuOKe2ybPLzW35IW9B9Imj41?=
 =?us-ascii?Q?FngGyQlmecYFMLwRrxbw0wt4lK5MPiPQanAml1/5zB/3+iPKU5iobGque85l?=
 =?us-ascii?Q?9c9DS0tlzCzIz6Lfe1hXlxFoTbqAi9EGA2cmgMuMJ/UkgW0WDGBk6PUDczwh?=
 =?us-ascii?Q?QmxmibVpswsl0V2xxgkWk8J+4GFMtAPhrS7wDLolw/KdilLJ2Pt8m7en1ScX?=
 =?us-ascii?Q?SxgD+w9wClAFn9brRZbuhWtsu0fu0dn6MVBmlodr9LJSLqX5bwu3bA5qZmf/?=
 =?us-ascii?Q?uq9f8OlHobYbLcNr5gS4j2lvixcca0GePJ+tYTulnKFwR9cClU0/hbq4Ztpm?=
 =?us-ascii?Q?vwhm9nnj4azp0/N0noAX2tSV03XU/wRYM/uboJ7mjzISJ9ujHo7kbvYsQ0p8?=
 =?us-ascii?Q?6/4wKlqIrpjMvr6Vpn+Xm1bZWUGpwf6RVa0E3oE66q21OfLuoVErEsIMONvr?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d420c51-94e4-4571-33d9-08dca912adc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 23:21:27.0151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teanFF5NnC1uNHysXlDaxwJF3m8vK8Xt3y5mfImSm3NqJoVViPKavsoCiupuAscKLpC+JeXX6A10aZ3C6zAL0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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

On Sat, Jul 20, 2024 at 11:14:36PM +0000, Matthew Brost wrote:
> On Sun, Jul 21, 2024 at 12:34:27AM +0530, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 19-07-2024 22:53, Matthew Brost wrote:
> > > The size of an array of binds is directly tied to several kmalloc in the
> > > KMD, thus making these kmalloc more likely to fail. Return -ENOBUFS in
> > > the case of these failures.
> > > 
> > > The expected UMD behavior upon returning -ENOBUFS is to split an array
> > > of binds into a series of single binds.
> > 
> > Would it be appropriate to have some doc/guidelines in the form of drm_err
> > or kernel doc regarding expected behavior from UMD if the ioctl returns a
> > -ENOBUFS error ?
> > 
> 
> Yes, this on the todo list as part of error handling cleanup for both
> exec and bind IOCTLs. I think kernel doc should go in xe_drm.h with a
> list of errno returned and expected UMD actions. Eventually I'd like to
> get this in place for all IOCTLs. I was going to work on getting exec
> and bind IOCTLs fixed up in the next couple of weeks (we have an
> internal doc of required changes) to have it ready for when Thomas is
> back (2 more weeks).
> 
> I made this change as we already have -ENOBUFS implemented in a
> different failure point for array of binds (BB being to large, see
> xe_migrate.c) so might as well just finish up this error code to make it

Also see xe_sa.c, search for -ENOBUFS.

> complete as it is fairly simple change. Also Mesa has a MR [1] inflight
> to handle -ENOBUFs situations.
> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30276 
> 
> > > 
> > > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
> > >   1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 3fde2c8292ad..b715883f40d8 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -718,7 +718,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> > >   		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> > >   }
> > > -static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> > > +static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> > >   {
> > >   	int i;
> > > @@ -731,7 +731,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> > >   				      sizeof(*vops->pt_update_ops[i].ops),
> > >   				      GFP_KERNEL);
> > >   		if (!vops->pt_update_ops[i].ops)
> > > -			return -ENOMEM;
> > > +			return array_of_binds ? -ENOBUFS : -ENOMEM;
> > >   	}
> > >   	return 0;
> > > @@ -824,7 +824,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> > >   			goto free_ops;
> > >   	}
> > > -	err = xe_vma_ops_alloc(&vops);
> > > +	err = xe_vma_ops_alloc(&vops, false);
> > >   	if (err)
> > >   		goto free_ops;
> > > @@ -871,7 +871,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
> > >   	if (err)
> > >   		return ERR_PTR(err);
> > > -	err = xe_vma_ops_alloc(&vops);
> > > +	err = xe_vma_ops_alloc(&vops, false);
> > >   	if (err) {
> > >   		fence = ERR_PTR(err);
> > >   		goto free_ops;
> > > @@ -2765,7 +2765,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > >   					   sizeof(struct drm_xe_vm_bind_op),
> > >   					   GFP_KERNEL | __GFP_ACCOUNT);
> > >   		if (!*bind_ops)
> > > -			return -ENOMEM;
> > > +			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
> > >   		err = __copy_from_user(*bind_ops, bind_user,
> > >   				       sizeof(struct drm_xe_vm_bind_op) *
> > > @@ -3104,7 +3104,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		goto unwind_ops;
> > >   	}
> > > -	err = xe_vma_ops_alloc(&vops);
> > > +	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
> > >   	if (err)
> > >   		goto unwind_ops;
