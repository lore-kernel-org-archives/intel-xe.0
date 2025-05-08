Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F184C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 18:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1405A10E95C;
	Thu,  8 May 2025 18:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlEYlJ9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C7710E95C
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746729613; x=1778265613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nvdSIt6hY3B8pn2gOHYjfzCZCR21ysX3hM4WhwlS5r0=;
 b=RlEYlJ9siwyNpw0FWHU9R9SCtzymFodokk/O6SIP3VZceqiLX4HW5UIj
 SMqCih0WN2zJSBMm2gYxFr0Aw6hm+GNOxFkRx3AcDTrhQQwb7B843n5t8
 bGjko3eFhrirfmFrNuRk37IA1yEFiJ1VDvB6spgmLQcopAKCjKXPZlZNn
 S5unYvct6CVpMpL5uPM7+Guo/LDlaNJ2fcd3nB8E3xb66z3Ktg8670AU+
 CEtd1pHLMYG4Bub0rYOHBBmTB/t4iDhADNNEIxPXoPsnftvQUXNhTsXJv
 RoJlHrE0BObMkb8glcg+n+6blyDHpDWkF9RC7cBjNZXV5pHSHfx4zaXGR w==;
X-CSE-ConnectionGUID: aHv/s3fJRuy8Ijpnw3aimg==
X-CSE-MsgGUID: ZKgXCA3iRi61mB6VKaBLcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="65949605"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="65949605"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 11:40:13 -0700
X-CSE-ConnectionGUID: I5AvKpGcRQqgPTvH75OWWA==
X-CSE-MsgGUID: bmRomhWYS0C4+IdmXnLcZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="159679129"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 11:40:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 11:40:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 11:40:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 11:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOrdBf76+/rRjNF74RprcKHxlQ4MCe8IcnRDEQ3D7Ak1xuMYJsf/wJaqU2NVdwyY05u0xCgyXuQ7MsqR0KY3jIg4faX7a/gKj7GiKezAQmusmJGeV/aEdeZTJJAMlIBBuDmtP2g0SCwQHJIdj92SYm72lgtXktIur2h1gRgkSHgQKODd9JbNJflvlYDAKSpgX2vtQPm4jEcxKZj35WKGV9poKuS0AhgbtSfxLXwW3z0SY0X7txF0rpd7Af0J/xgVTVcvD3Kusoa3srLhmxTok+8ajMeNLctaVSY1MY7bVMUWiUVrH/4jX/gq7fZJakDyxZ5EEmFW0NAdAtufLMQcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/K5yMXndRHfj5xbuKa/dI+Gw3wSoZL3iDGNpaAs0T2o=;
 b=MDhYHpm4kA+3G6O9HYhHQKqY7YDNeitDJzXKA4aXVKMcAm9oxfdIP856TpWkSbfQfsUb830EGOGwWOqBM3bMkfZNcCcSzN/4T9jv+PkjgytEfkd6jwj1KMSkfo4h0d9ZU+Z0zCwsnyPULtsWnSdvJGciToHxNxhif4k28bv0kwm02UYr3sV363sAa8WJliGpPv3wF9A+pmAuKizCDTSOQeroxyTVIrw4TljsmxNzcI4DoHCOQojjgWsI8cWLBRWpclAWKV/yotqBOqOhJ8mnbXgFnKcf282Y25sX6RSPfXSNfEVDXbOVoychYmwA7qFsw/I2C4HMgJm0Da7wd6Tvdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 18:39:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 18:39:49 +0000
Date: Thu, 8 May 2025 11:41:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v6 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
Message-ID: <aBz6yuZV9lxAWmQz@lstrano-desk.jf.intel.com>
References: <20250506230132.1188732-1-matthew.brost@intel.com>
 <20250506230132.1188732-3-matthew.brost@intel.com>
 <7a7385b2d2a81961963e4df4a34ad4c55bd49bfb.camel@linux.intel.com>
 <aBt/QzswRYhm8wgx@lstrano-desk.jf.intel.com>
 <d7e534756f4700d5c20895aca9df9bebf8c303fd.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7e534756f4700d5c20895aca9df9bebf8c303fd.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:303:85::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1e2ea9-d574-4872-426a-08dd8e5fb673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?++JS0JCoMl4hhqA0wFWnfALaqXnwO/cK6RdxekKO8YtcSxEdShi5bVaP0M?=
 =?iso-8859-1?Q?E00en6e403buN6tPm1KnW1EhDnf9shWGvihfNCsLXLpmAjAPV/kb3vAk2T?=
 =?iso-8859-1?Q?Tb7IoJuwkZ5Qm4i6GXrnwNiK339V7JyzVXAEP7C2+iMoqXKvSizA4HvOSD?=
 =?iso-8859-1?Q?Oji5LVxhU0XntiMCIk1Mb1znqTOtAqbKMCVRVS1V58x8u5D/iFmhE23VFy?=
 =?iso-8859-1?Q?D8o6ww4YuaoSafShhF9HqdEvDOcwg5hQGVa7xo5CboA/TvYxJJ7VB07GYr?=
 =?iso-8859-1?Q?ymAZ4AUiSEDvpMtHyO4sbMjI7AN0h5ip42ZeDvr+wtJAPFB9J/e2jrUpL6?=
 =?iso-8859-1?Q?wm4US5945IifLHc2s/29Cy1CTU8G2HdGwfGxMPNFs0Fbf+yMJc/Mq5E6hl?=
 =?iso-8859-1?Q?vEhiNMNxfgjAATnTD52gA+VmbxpQLTsWAt4P+Bt7zg5oPHEKoSLugFkvRZ?=
 =?iso-8859-1?Q?Yy5ch/Log0Ie2n7JWhqczQKqTkoOn9J9wWqmzInsTDXsDnrzYioI7fLv5+?=
 =?iso-8859-1?Q?l7F1G29N/Qu+h2wSKr9IFldYney2PV0ejFxOZKhqLWYxBaJYttlhB8QKBa?=
 =?iso-8859-1?Q?YRVv8YgsNn1q0pOeMjAKOSDOz7y9At7oE4rkSM2kSeDnsHOtXS38/BtLcY?=
 =?iso-8859-1?Q?HB0pxuJTh/O5GktxTZOthhPR8p7LE197uhjPP5ucnTwYxQpGBpKGGHZ3jZ?=
 =?iso-8859-1?Q?VU9GHY0Q4jeUKataEgA8ru1doImBY4SIImv6yZXs9PYvdg/8DtYQsini5R?=
 =?iso-8859-1?Q?Xm0eSI4U3j3YNiv1K1/lwC5aLBRzaMxmmGhsnMgffK4D42g7hzzUDTFtzu?=
 =?iso-8859-1?Q?RqAhoeAUfqu7FsIfHJCtOx/gDjb4FQR6CdSO7tBd9BLVtYrGuyAGwcZ0zc?=
 =?iso-8859-1?Q?v52+L1X+BGtx9bXmsVWJ0NmrUDZdUJ8q8MtuTBVXwPwF2FZXNGIyDh1A/A?=
 =?iso-8859-1?Q?B3C9HJPup1J35OLmjAQso+8FLSI3OLoXhL4Lkg9vtSx57/bLaB3iONcedi?=
 =?iso-8859-1?Q?4ABjT/m6Yo5EDCwDXZ0utUVclKcSoslCDEcO9Fz84bTAtSWQ+Crv/vTBvC?=
 =?iso-8859-1?Q?HsdAHQZ14VF1NBlPeBl73y5Qxtc2M9vNU9N8WD8lUWuzuFXzCTfOepXrCx?=
 =?iso-8859-1?Q?rsLQpT6dUPkyVOdjTkIY7dd7Cn8M0uUbSowYxdbk49lkrumziLRWFZMqit?=
 =?iso-8859-1?Q?yBDyihyv2Ah4C3v9stm0EPejAVwyddICZHR4aPTVZQVctb/vHyzWqtg+rm?=
 =?iso-8859-1?Q?QwgW+KQWWtcscdb2jkRYedISBC8WlfScXoaweM7Se0Byl7ojsfJSX1gnUk?=
 =?iso-8859-1?Q?ttrB2AKlOp6bKrhM0Gn7n6MQbpeN/kTsXpdteYlNNUUse0O3l29TKPfydZ?=
 =?iso-8859-1?Q?XFhN2Gz5wicd0BjGA1RLicuRm6I1jduX+lplIH8dGhWpzDJII5tiCMsVCF?=
 =?iso-8859-1?Q?FSba/1+ImGrI+XN9p/o1jlEFPrQbGAOG2yHgXKm7rs1njZIMVJAgoIgv+e?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wrwnSybnJskfNCS1i0cISwcYNfYx4mtZ1kZDPuqiEsDvwSkY2tdy85bG57?=
 =?iso-8859-1?Q?eFBvnjTpRN7fcIViYEqxomGrZr2R3hsXEI+SQAcEoj2ExAtSz7MNt3pnge?=
 =?iso-8859-1?Q?lZebGLFOJsiIEYjKHXPl+zAFywNTf0vByHgxPSkiNG84UDwtZceCxj2uvA?=
 =?iso-8859-1?Q?bgOFXz/CrQ8rk1bTbgEvoIIDWQ9NtqcWKTzMyRaab06zpcPzByaPJVHWBU?=
 =?iso-8859-1?Q?1EQBGACZLnByS/gCTzPDpgW4jrev9Flf2/YuBaUjqc1K01bQFiRj0Wbi8M?=
 =?iso-8859-1?Q?hl70k2+Mugmpz/S0zrkGYreyBpSwdmPxwSeilAw1LcyeuXqt8SYQqNCEJY?=
 =?iso-8859-1?Q?kSIOBk0oxU5qK5czloYZDzbR3En7OOTThc7cm7eQROkR3cObfdIQ6VEhuf?=
 =?iso-8859-1?Q?EeKbsgwTCutXiMTsV/x8wt+D6YXpTowSNW52/igY4S1wz7GpIm3y/bmaqp?=
 =?iso-8859-1?Q?x8v+bKcjEwboHrE5qL9ZK71YEfu2/jh0IPDyc0+h0Y0kxkg6BKqfNc1GLN?=
 =?iso-8859-1?Q?ukudGCYYYsnxGxW3iCJ7zOPI0wuBtba0Tyy4gWhNijTPdKItElMcsP2Sno?=
 =?iso-8859-1?Q?RRJvR7QFH+HB+Y7oGZjj4GK23CA5QwjpNvx28Z21n2xW8iuN50n8s5hkBa?=
 =?iso-8859-1?Q?ASseXCHyBV9eOInjwfu/1Yp9HE4sP9Z8CNfBbOVTRSZkGuqbwoZ805Hxcr?=
 =?iso-8859-1?Q?CVz1fC1Wdbs7xfayQaHgs0K8a/1yRSt+Gaj5IR0wiSfMB092Q8r9joE8cL?=
 =?iso-8859-1?Q?EDxO2bpCL58JpFzD2TV1KZdDpLq60GH3AetvZr3nv7Y9r7z/nW0tiD6Wtv?=
 =?iso-8859-1?Q?b1Poj+DYBEqZlEHBdIB+IFagTsbmY2fVaTFBu/BcKnBciUX60JVObTaXhG?=
 =?iso-8859-1?Q?VVKTcmBM8DS3Whx0/Hn4s4AQcRNhSlFG+VXbY8cUrWW/vvuVpQxjJr8AwY?=
 =?iso-8859-1?Q?IL1ZT7Zelt9VsAD/7jb/6MQLPZZM3bdBhCG/pojS1sG/Dlq3MmXuM4krbI?=
 =?iso-8859-1?Q?l8eEWsIE5Z7yMibBWf5syvCu8f0r8ydnJf6LwHR/N688PUxZjwM9QhXJ3J?=
 =?iso-8859-1?Q?164o/I4h2fLvTNPOS/sGdcCmncf9DNA66w7BQbvWex0BtYSXj328lqeTAa?=
 =?iso-8859-1?Q?aW31mk1mtxV5smkOYvsrTcfdYKICkmj2aMWr0sX+WTbnChLTtTQXgpQf8S?=
 =?iso-8859-1?Q?zgfxX/oVIRYchyO8ZYW4l6fWVRNUkPottZ2ovAmQeWESKHQvkZYZB8iGTw?=
 =?iso-8859-1?Q?gI1YxjyeyRoZNJXnl8IUi9aIk9heXt2gkyorlJoV9Ij+cOlXdaANGol4/q?=
 =?iso-8859-1?Q?22Pshd4K5FfeM3PinWy1BwEsgpqlqyoNf4JIWdMxENgdvuxLkEXg5eBLwt?=
 =?iso-8859-1?Q?8cgP8c1W/1Tw6XNctbB4HF8IEcjYQ69rTjEcNr59kugVlAHxTuRkukSyU2?=
 =?iso-8859-1?Q?dcegp1EHElaswZgnQ1EDF0VZSft62u3ZXEpJUBodFz8E9wamhhMTLJoxG8?=
 =?iso-8859-1?Q?NnXZ2ZGwFLRHk/2asOuw9gGL8mugcyB44PZ5yT2Rkv3lp1lyGTtIjfuxji?=
 =?iso-8859-1?Q?rVccGFv9cgakbkGzPhLLrr2fn/0JXyF+tN8W76T+mmTB9HUQPCnN/2e54N?=
 =?iso-8859-1?Q?L3dHd+ff85N9+tv+xTOHNQ90xeonfMfKzRzAYxFoSNWIAqNmxlUQoL9A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1e2ea9-d574-4872-426a-08dd8e5fb673
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 18:39:49.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT1N23lLPH/HAM1tEthvFzElaIBWl4uD1S5EfuOcty9TayHtMlYG5Xxj5pHqdBJxXFWMNFPAwEx4lCDYXJOaWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
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

On Thu, May 08, 2025 at 03:25:08PM +0200, Thomas Hellström wrote:
> Hi, Matthew.
> 
> On Wed, 2025-05-07 at 08:41 -0700, Matthew Brost wrote:
> > On Wed, May 07, 2025 at 02:01:56PM +0200, Thomas Hellström wrote:
> > > 
> > > This is v7, right? (Says v6 in the subject).
> > > 
> > 
> > Yea, I somehow mismatched version in change log and patches sent.
> > 
> > Ok, getting a little bogged down on comments, let try fix them inline
> > in
> > this reply to make sure they look good before sending next rev.
> 
> So since we're not adhering to the drm locking guidelines, I want to
> ensure that what we ask to PULL is at least properly documented. So
> what I've been asking here is two things.
> 
> 1) If the intended usage of a function is advisory / opportunistic,
> please document that at the function header rather than as a comment
> within the function definition.
> 
> 2) Document what a barrier / READ_ONCE / WRITE_ONCE pairs with. Ideally
> pointing to the specific function.
> 
> In particular for 1) I've mentioned it a couple of times without it
> beeing addressed or commented on so that's why I'm bringing it up again
> in case it was missed.
> 

I agree with above, sometimes it is hard fully understand feedback,
hence why I put the updates inline rather than attempting another rev.

> So let's check.
> 
> > 
> > > On Tue, 2025-05-06 at 16:01 -0700, Matthew Brost wrote:
> > > > Mixing GPU and CPU atomics does not work unless a strict
> > > > migration
> > > > policy of GPU atomics must be device memory. Enforce a policy of
> > > > must
> > > > be
> > > > in VRAM with a retry loop of 3 attempts, if retry loop fails
> > > > abort
> > > > fault.
> > > > 
> > > > Removing always_migrate_to_vram modparam as we now have real
> > > > migration
> > > > policy.
> > > > 
> > > > v2:
> > > >  - Only retry migration on atomics
> > > >  - Drop alway migrate modparam
> > > > v3:
> > > >  - Only set vram_only on DGFX (Himal)
> > > >  - Bail on get_pages failure if vram_only and retry count
> > > > exceeded
> > > > (Himal)
> > > >  - s/vram_only/devmem_only
> > > >  - Update xe_svm_range_is_valid to accept devmem_only argument
> > > > v4:
> > > >  - Fix logic bug get_pages failure
> > > > v5:
> > > >  - Fix commit message (Himal)
> > > >  - Mention removing always_migrate_to_vram in commit message
> > > > (Lucas)
> > > >  - Fix xe_svm_range_is_valid to check for devmem pages
> > > >  - Bail on devmem_only && !migrate_devmem (Thomas)
> > > > v6:
> > > >  - Add READ_ONCE barriers for opportunistic checks (Thomas)
> > > > v7:
> > > >  - Pair READ_ONCE with WRITE_ONCE (Thomas)
> > > > 
> > > > Fixes: 2f118c949160 ("drm/xe: Add SVM VRAM migration")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Himal Prasad Ghimiray
> > > > <himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_gpusvm.c   |  23 +++++--
> > > >  drivers/gpu/drm/xe/xe_module.c |   3 -
> > > >  drivers/gpu/drm/xe/xe_module.h |   1 -
> > > >  drivers/gpu/drm/xe/xe_pt.c     |  14 ++++-
> > > >  drivers/gpu/drm/xe/xe_svm.c    | 109 +++++++++++++++++++++++++--
> > > > ----
> > > > --
> > > >  drivers/gpu/drm/xe/xe_svm.h    |   5 --
> > > >  include/drm/drm_gpusvm.h       |  40 +++++++-----
> > > >  7 files changed, 138 insertions(+), 57 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > > b/drivers/gpu/drm/drm_gpusvm.c
> > > > index a58d03e6cac2..41f6616bcf76 100644
> > > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > > @@ -1118,6 +1118,10 @@ static void
> > > > __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > >  	lockdep_assert_held(&gpusvm->notifier_lock);
> > > >  
> > > >  	if (range->flags.has_dma_mapping) {
> > > > +		struct drm_gpusvm_range_flags flags = {
> > > > +			.__flags = range->flags.__flags,
> > > > +		};
> > > > +
> > > >  		for (i = 0, j = 0; i < npages; j++) {
> > > >  			struct drm_pagemap_device_addr *addr =
> > > > &range->dma_addr[j];
> > > >  
> > > > @@ -1131,8 +1135,12 @@ static void
> > > > __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > >  							    dev,
> > > > *addr);
> > > >  			i += 1 << addr->order;
> > > >  		}
> > > > -		range->flags.has_devmem_pages = false;
> > > > -		range->flags.has_dma_mapping = false;
> > > > +
> > > > +		/* WRITE_ONCE pairs with READ_ONCE for
> > > > opportunistic
> > > > checks */
> > 
> > Is this one ok? Can't really quote driver side here...
> 
> Yeah makes sense.
> 
> > 
> > > > +		flags.has_devmem_pages = false;
> > > > +		flags.has_dma_mapping = false;
> > > > +		WRITE_ONCE(range->flags.__flags, flags.__flags);
> > > > +
> > > >  		range->dpagemap = NULL;
> > > >  	}
> > > >  }
> > > > @@ -1334,6 +1342,7 @@ int drm_gpusvm_range_get_pages(struct
> > > > drm_gpusvm *gpusvm,
> > > >  	int err = 0;
> > > >  	struct dev_pagemap *pagemap;
> > > >  	struct drm_pagemap *dpagemap;
> > > > +	struct drm_gpusvm_range_flags flags;
> > > >  
> > > >  retry:
> > > >  	hmm_range.notifier_seq =
> > > > mmu_interval_read_begin(notifier);
> > > > @@ -1378,7 +1387,8 @@ int drm_gpusvm_range_get_pages(struct
> > > > drm_gpusvm *gpusvm,
> > > >  	 */
> > > >  	drm_gpusvm_notifier_lock(gpusvm);
> > > >  
> > > > -	if (range->flags.unmapped) {
> > > > +	flags.__flags = range->flags.__flags;
> > > > +	if (flags.unmapped) {
> > > >  		drm_gpusvm_notifier_unlock(gpusvm);
> > > >  		err = -EFAULT;
> > > >  		goto err_free;
> > > > @@ -1474,14 +1484,17 @@ int drm_gpusvm_range_get_pages(struct
> > > > drm_gpusvm *gpusvm,
> > > >  		}
> > > >  		i += 1 << order;
> > > >  		num_dma_mapped = i;
> > > > -		range->flags.has_dma_mapping = true;
> > > > +		flags.has_dma_mapping = true;
> > > >  	}
> > > >  
> > > >  	if (zdd) {
> > > > -		range->flags.has_devmem_pages = true;
> > > > +		flags.has_devmem_pages = true;
> > > >  		range->dpagemap = dpagemap;
> > > >  	}
> > > >  
> > > > +	/* WRITE_ONCE pairs with READ_ONCE for opportunistic
> > > > checks
> > > > */
> > 
> > Same as above.
> 
> Makes sense.
> 
> 
> 
> > 
> > > > +	WRITE_ONCE(range->flags.__flags, flags.__flags);
> > > > +
> > > >  	drm_gpusvm_notifier_unlock(gpusvm);
> > > >  	kvfree(pfns);
> > > >  set_seqno:
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > > b/drivers/gpu/drm/xe/xe_module.c
> > > > index 05c7d0ae6d83..1c4dfafbcd0b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
> > > >  module_param_named(svm_notifier_size,
> > > > xe_modparam.svm_notifier_size,
> > > > uint, 0600);
> > > >  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier
> > > > size(in
> > > > MiB), must be power of 2");
> > > >  
> > > > -module_param_named(always_migrate_to_vram,
> > > > xe_modparam.always_migrate_to_vram, bool, 0444);
> > > > -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM
> > > > on
> > > > GPU fault");
> > > > -
> > > >  module_param_named_unsafe(force_execlist,
> > > > xe_modparam.force_execlist, bool, 0444);
> > > >  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > > b/drivers/gpu/drm/xe/xe_module.h
> > > > index 84339e509c80..5a3bfea8b7b4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > @@ -12,7 +12,6 @@
> > > >  struct xe_modparam {
> > > >  	bool force_execlist;
> > > >  	bool probe_display;
> > > > -	bool always_migrate_to_vram;
> > > >  	u32 force_vram_bar_size;
> > > >  	int guc_log_level;
> > > >  	char *guc_firmware_path;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index b42cf5d1b20c..b487e094178d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -2270,11 +2270,19 @@ static void op_commit(struct xe_vm *vm,
> > > >  	}
> > > >  	case DRM_GPUVA_OP_DRIVER:
> > > >  	{
> > > > +		/* WRITE_ONCE pairs with READ_ONCE opportunistic
> > > > checks */
> > > > +
> > 
> > /* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
> 
> Fine.
> 
> > 
> > > >  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> > > > -			op->map_range.range->tile_present |=
> > > > BIT(tile->id);
> > > > -			op->map_range.range->tile_invalidated &=
> > > > ~BIT(tile->id);
> > > > +			WRITE_ONCE(op->map_range.range-
> > > > > tile_present,
> > > > +				   op->map_range.range-
> > > > >tile_present
> > > > > 
> > > > +				   BIT(tile->id));
> > > > +			WRITE_ONCE(op->map_range.range-
> > > > > tile_invalidated,
> > > > +				   op->map_range.range-
> > > > > tile_invalidated &
> > > > +				   ~BIT(tile->id));
> > > >  		} else if (op->subop ==
> > > > XE_VMA_SUBOP_UNMAP_RANGE) {
> > > > -			op->unmap_range.range->tile_present &=
> > > > ~BIT(tile->id);
> > > > +			WRITE_ONCE(op->unmap_range.range-
> > > > > tile_present,
> > > > +				   op->unmap_range.range-
> > > > > tile_present &
> > > > +				   ~BIT(tile->id));
> > > >  		}
> > > >  		break;
> > > >  	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 890f6b2f40e9..8c0ef55cfd57 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -16,8 +16,15 @@
> > > >  
> > > 
> > > So what I meant in the review comments is something along
> > > 
> > > /* Advisory only check whether the range is currently backed by
> > > VRAM
> > > memory. */
> > > 
> > > (As said we shouldn need to look at the function implementation to
> > > understand that it's opportunistic).
> > > 
> > > >  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> > > >  {
> > > > -	/* Not reliable without notifier lock */
> > > > -	return range->base.flags.has_devmem_pages;
> > > > +	/*
> > > > +	 * Not reliable without notifier lock, opportunistic
> > > > only,
> > > > pairs with
> > > > +	 * WRITE_ONCE
> > > 
> > > So if we assume that this function should is never be called with
> > > the
> > > notifier lock held, we can leave that comment out, just
> > > 
> > > /* Pairs with WRITE_ONCE() in xe_pt.c */ 
> > > 
> > > 
> > > And similar for the other places.
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > > +	 */
> > 
> > /*
> >  * Advisory only check whether the range is currently backed by VRAM
> >  * memory, READ_ONCE pairs with WRITE_ONCE in drm_gpusvm.c
> >  */
> > 
> 
> Here I'd put the READ_ONCE part of the comment where it's actually
> used.
> 
> > > > +	struct drm_gpusvm_range_flags flags = {
> /* Pairs with WRITE_ONCE() in drm_gpusvm.c */

+1

Matt

> > > > +		.__flags = READ_ONCE(range->base.flags.__flags),
> > > > +	};
> > > > +
> > > > +	return flags.has_devmem_pages;
> > > >  }
> > > >  
> > > >  static bool xe_svm_range_has_vram_binding(struct xe_svm_range
> > > > *range)
> > > > @@ -650,9 +657,16 @@ void xe_svm_fini(struct xe_vm *vm)
> > > >  }
> > > >  
> > > >  static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > > > -				  struct xe_tile *tile)
> > > > +				  struct xe_tile *tile,
> > > > +				  bool devmem_only)
> > > >  {
> > > > -	return (range->tile_present & ~range->tile_invalidated)
> > > > &
> > > > BIT(tile->id);
> > > > +	/*
> > > > +	 * Not reliable without notifier lock, opportunistic
> > > > only,
> > > > pairs with
> > > > +	 * WRITE_ONCE
> > > > +	 */
> > 
> > /*
> >  * Advisory only check whether the range currently has a valid
> > mapping,
> >  * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
> >  */
> > 
> > > > +	return ((READ_ONCE(range->tile_present) &
> > > > +		 ~READ_ONCE(range->tile_invalidated)) &
> > > > BIT(tile-
> > > > > id)) &&
> > > > +		(!devmem_only || xe_svm_range_in_vram(range));
> > > >  }
> > > >  
> > > >  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > > @@ -726,6 +740,36 @@ static int xe_svm_alloc_vram(struct xe_vm
> > > > *vm,static bool supports_4K_migration(struct xe_device *xe)
> > > > +{
> > > > +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +static bool xe_svm_range_needs_migrate_to_vram(struct
> > > > xe_svm_range
> > > > *range,
> > > > +					       struct xe_vma
> > > > *vma)
> > > > +{
> > > > +	struct xe_vm *vm = range_to_vm(&range->base);
> > > > +	u64 range_size = xe_svm_range_size(range);
> > > > +
> > > > +	if (!range->base.flags.migrate_devmem)
> > > > +		return false;
> > > > +
> > > > +	/* Not reliable without notifier lock, opportunistic
> > > > only */
> > 
> > Drop this one as xe_svm_range_in_vram has a comment.
> Yes,
> 
> Thanks,
> Thomas
> 
> 
> > 
> > Matt
> > 
> > > > +	if (xe_svm_range_in_vram(range)) {
> > > > +		drm_dbg(&vm->xe->drm, "Range is already in
> > > > VRAM\n");
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (range_size <= SZ_64K && !supports_4K_migration(vm-
> > > > >xe))
> > > > {
> > > > +		drm_dbg(&vm->xe->drm, "Platform doesn't support
> > > > SZ_4K range migration\n");
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	return true;
> > > > +}
> > > >  
> > > >  /**
> > > >   * xe_svm_handle_pagefault() - SVM handle page fault
> > > > @@ -750,12 +794,15 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > >  		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > > ?
> > > > SZ_64K : 0,
> > > > +		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > >  	};
> > > >  	struct xe_svm_range *range;
> > > >  	struct drm_gpusvm_range *r;
> > > >  	struct drm_exec exec;
> > > >  	struct dma_fence *fence;
> > > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > > +	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> > > >  	ktime_t end = 0;
> > > >  	int err;
> > > >  
> > > > @@ -776,24 +823,30 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	if (IS_ERR(r))
> > > >  		return PTR_ERR(r);
> > > >  
> > > > +	if (ctx.devmem_only && !r->flags.migrate_devmem)
> > > > +		return -EACCES;
> > > > +
> > > >  	range = to_xe_range(r);
> > > > -	if (xe_svm_range_is_valid(range, tile))
> > > > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> > > >  		return 0;
> > > >  
> > > >  	range_debug(range, "PAGE FAULT");
> > > >  
> > > > -	/* XXX: Add migration policy, for now migrate range once
> > > > */
> > > > -	if (!range->skip_migrate && range-
> > > > >base.flags.migrate_devmem
> > > > &&
> > > > -	    xe_svm_range_size(range) >= SZ_64K) {
> > > > -		range->skip_migrate = true;
> > > > -
> > > > +	if (--migrate_try_count >= 0 &&
> > > > +	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
> > > >  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > >  		if (err) {
> > > > -			drm_dbg(&vm->xe->drm,
> > > > -				"VRAM allocation failed, falling
> > > > back to "
> > > > -				"retrying fault, asid=%u,
> > > > errno=%pe\n",
> > > > -				vm->usm.asid, ERR_PTR(err));
> > > > -			goto retry;
> > > > +			if (migrate_try_count ||
> > > > !ctx.devmem_only) {
> > > > +				drm_dbg(&vm->xe->drm,
> > > > +					"VRAM allocation failed,
> > > > falling back to retrying fault, asid=%u, errno=%pe\n",
> > > > +					vm->usm.asid,
> > > > ERR_PTR(err));
> > > > +				goto retry;
> > > > +			} else {
> > > > +				drm_err(&vm->xe->drm,
> > > > +					"VRAM allocation failed,
> > > > retry count exceeded, asid=%u, errno=%pe\n",
> > > > +					vm->usm.asid,
> > > > ERR_PTR(err));
> > > > +				return err;
> > > > +			}
> > > >  		}
> > > >  	}
> > > >  
> > > > @@ -801,15 +854,22 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > > &ctx);
> > > >  	/* Corner where CPU mappings have changed */
> > > >  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -
> > > > EPERM) {
> > > > -		if (err == -EOPNOTSUPP) {
> > > > -			range_debug(range, "PAGE FAULT - EVICT
> > > > PAGES");
> > > > -			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > > > &range->base);
> > > > +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> > > > +			if (err == -EOPNOTSUPP) {
> > > > +				range_debug(range, "PAGE FAULT -
> > > > EVICT PAGES");
> > > > +				drm_gpusvm_range_evict(&vm-
> > > > > svm.gpusvm,
> > > > +						       &range-
> > > > > base);
> > > > +			}
> > > > +			drm_dbg(&vm->xe->drm,
> > > > +				"Get pages failed, falling back
> > > > to
> > > > retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > > +			range_debug(range, "PAGE FAULT - RETRY
> > > > PAGES");
> > > > +			goto retry;
> > > > +		} else {
> > > > +			drm_err(&vm->xe->drm,
> > > > +				"Get pages failed, retry count
> > > > exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> > > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > >  		}
> > > > -		drm_dbg(&vm->xe->drm,
> > > > -			"Get pages failed, falling back to
> > > > retrying,
> > > > asid=%u, gpusvm=%p, errno=%pe\n",
> > > > -			vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > > -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> > > > -		goto retry;
> > > >  	}
> > > >  	if (err) {
> > > >  		range_debug(range, "PAGE FAULT - FAIL PAGE
> > > > COLLECT");
> > > > @@ -843,9 +903,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > struct xe_vma *vma,
> > > >  	}
> > > >  	drm_exec_fini(&exec);
> > > >  
> > > > -	if (xe_modparam.always_migrate_to_vram)
> > > > -		range->skip_migrate = false;
> > > > -
> > > >  	dma_fence_wait(fence, false);
> > > >  	dma_fence_put(fence);
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 3d441eb1f7ea..0e1f376a7471 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -39,11 +39,6 @@ struct xe_svm_range {
> > > >  	 * range. Protected by GPU SVM notifier lock.
> > > >  	 */
> > > >  	u8 tile_invalidated;
> > > > -	/**
> > > > -	 * @skip_migrate: Skip migration to VRAM, protected by
> > > > GPU
> > > > fault handler
> > > > -	 * locking.
> > > > -	 */
> > > > -	u8 skip_migrate	:1;
> > > >  };
> > > >  
> > > >  /**
> > > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > > index 9fd25fc880a4..653d48dbe1c1 100644
> > > > --- a/include/drm/drm_gpusvm.h
> > > > +++ b/include/drm/drm_gpusvm.h
> > > > @@ -185,6 +185,31 @@ struct drm_gpusvm_notifier {
> > > >  	} flags;
> > > >  };
> > > >  
> > > > +/**
> > > > + * struct drm_gpusvm_range_flags - Structure representing a GPU
> > > > SVM
> > > > range flags
> > > > + *
> > > > + * @migrate_devmem: Flag indicating whether the range can be
> > > > migrated to device memory
> > > > + * @unmapped: Flag indicating if the range has been unmapped
> > > > + * @partial_unmap: Flag indicating if the range has been
> > > > partially
> > > > unmapped
> > > > + * @has_devmem_pages: Flag indicating if the range has devmem
> > > > pages
> > > > + * @has_dma_mapping: Flag indicating if the range has a DMA
> > > > mapping
> > > > + * @__flags: Flags for range in u16 form (used for READ_ONCE)
> > > > + */
> > > > +struct drm_gpusvm_range_flags {
> > > > +	union {
> > > > +		struct {
> > > > +			/* All flags below must be set upon
> > > > creation
> > > > */
> > > > +			u16 migrate_devmem : 1;
> > > > +			/* All flags below must be set / cleared
> > > > under notifier lock */
> > > > +			u16 unmapped : 1;
> > > > +			u16 partial_unmap : 1;
> > > > +			u16 has_devmem_pages : 1;
> > > > +			u16 has_dma_mapping : 1;
> > > > +		};
> > > > +		u16 __flags;
> > > > +	};
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct drm_gpusvm_range - Structure representing a GPU SVM
> > > > range
> > > >   *
> > > > @@ -198,11 +223,6 @@ struct drm_gpusvm_notifier {
> > > >   * @dpagemap: The struct drm_pagemap of the device pages we're
> > > > dma-
> > > > mapping.
> > > >   *            Note this is assuming only one drm_pagemap per
> > > > range
> > > > is allowed.
> > > >   * @flags: Flags for range
> > > > - * @flags.migrate_devmem: Flag indicating whether the range can
> > > > be
> > > > migrated to device memory
> > > > - * @flags.unmapped: Flag indicating if the range has been
> > > > unmapped
> > > > - * @flags.partial_unmap: Flag indicating if the range has been
> > > > partially unmapped
> > > > - * @flags.has_devmem_pages: Flag indicating if the range has
> > > > devmem
> > > > pages
> > > > - * @flags.has_dma_mapping: Flag indicating if the range has a
> > > > DMA
> > > > mapping
> > > >   *
> > > >   * This structure represents a GPU SVM range used for tracking
> > > > memory ranges
> > > >   * mapped in a DRM device.
> > > > @@ -216,15 +236,7 @@ struct drm_gpusvm_range {
> > > >  	unsigned long notifier_seq;
> > > >  	struct drm_pagemap_device_addr *dma_addr;
> > > >  	struct drm_pagemap *dpagemap;
> > > > -	struct {
> > > > -		/* All flags below must be set upon creation */
> > > > -		u16 migrate_devmem : 1;
> > > > -		/* All flags below must be set / cleared under
> > > > notifier lock */
> > > > -		u16 unmapped : 1;
> > > > -		u16 partial_unmap : 1;
> > > > -		u16 has_devmem_pages : 1;
> > > > -		u16 has_dma_mapping : 1;
> > > > -	} flags;
> > > > +	struct drm_gpusvm_range_flags flags;
> > > >  };
> > > >  
> > > >  /**
> > > 
> 
