Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F41CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 17:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D660C10EC9E;
	Fri, 17 Oct 2025 17:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LL7dTYkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B5F10EC9E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760720682; x=1792256682;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KOuh6LM4ZsAV+5fpdH3IluJ97R7OIk6u1zHTmvx3Q4I=;
 b=LL7dTYklLP+9caMEIuCJizHI6mi7ClwUqlMzHZ+vj+0oNxzmmgafoC7v
 iojNF4xA66eoYN1guZWSqRNJBAYhAydp+gqmB3uLpLtmxduRrSFm0IGve
 JOPhPVdC93ZGpU3gElFOHooAMj/a2YZQ62aobVDPqcSqbRmyRpHVEzMe8
 iGxpkqBZRZlCQyS8/p7XNicL0a3iDuwXzJ8W/Yy9NjtLRNJEBdPQ6Eh3u
 Smfc7bd770Cn8iOBLJCsQCsjRW6IBfQczGV5RXjRfGT+mi7ZD6VUauOvN
 5mlda5McYqFGKaIzH2fvcCTov7VnqD/VMvnS802w+NzG7Rx9RKo6xyv6C w==;
X-CSE-ConnectionGUID: /j5zvbppSRqojoNG1bi05w==
X-CSE-MsgGUID: +JgVE2GgRw6LoHgal2+gSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62857229"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62857229"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:04:42 -0700
X-CSE-ConnectionGUID: cJHX9AyRQnOzaGPM1jo9Cw==
X-CSE-MsgGUID: 0gzaNUudSGmljxNnsdngKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="187191648"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:04:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:04:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 10:04:41 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8neV+PAlscSN3atWxTy4b5vz0R7QwcP1DQYXZECtixQBPr15bPXozAZ93b1jwhtV4pV+wZSt2Mi4BWdezcPwRsHrh4r2vCAPgy0YSqKxySzWegpkqO8CXW9eTwIzg8H+kaFGESSFOpBfFQYvE3mRVooRvKuK/G5h0Tpu8+3M8SS2gucMm01CVUy6cuEq8fu6PBAznQL1C9EGEHqykTG8NkNfcjmWYqZNNvvJAfNRGPd//MVuHKbi9la1ioF9RhiWOU0zZ2p3TskP5hnS1mkTNK7Ut1oE0ppZ/oexEbYpVrUcSY+rQEd0bEgEkjpeeZYu8b3Y1D7lnbKTimBn7JDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mai11jt/3KWFdI9xElCk78Tf5Am+eSuItBscJ9+ZPWA=;
 b=a5w3O+usQ36rANWEso2ZJZIQmFlM/Nx8+yZaJCTkgv3/mw22rZ4lCcPR2Blia3zz77fCAVlJ9vx0HE4EsHh2flihGCzcMJWBgYj+Q1IIcqXuPEenXe7S8MePgOjlboy8xv44FbadWFF8tf7lBbf7yCb7ouoLiJggtJbJzj4abEIxTQv7601u5bEVDMAb79ljU1UWHQIgBsTuqaPk/kpgA3md9SWQmUsNaJ3tpaB7vy5wb1p8QfUf/02QLhN3CQvgMVQpON7D9LZO3tb+M10NKl+zHXh2/8xhZZMZsfWnL5ATTX8fRKTJL25spX1WMSIatpt5Mb0dTtR9IQ2BNfMsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 17:04:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 17:04:39 +0000
Date: Fri, 17 Oct 2025 10:04:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, S A Muqthyar Ahmed
 <syed.abdul.muqthyar.ahmed@intel.com>
Subject: Re: [PATCH v3 21/24] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Message-ID: <20251017170435.GU5409@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-21-3dd173a3097a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016-xe3p-v3-21-3dd173a3097a@intel.com>
X-ClientProxiedBy: YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 4339e031-f1ae-42e7-0997-08de0d9f41e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?paflowATU3afHa6tYH+A6RKYNIV0ZN3Ll0gWDBGBKq9MJ2bx2ZE7YnwuhJO3?=
 =?us-ascii?Q?cVUidV9R37s4zIamiIagQb+fttJ90jTHTHTYrsgnm7EZTpKgTk7uAmyHpyyy?=
 =?us-ascii?Q?wSQEMoMZH+EhDU7JMxZJ7ZRhMFpf3sy2xgApzr+CGyYtszkYHaGMSW0EcY+M?=
 =?us-ascii?Q?QPLilf53s1KGWajIVPcOTddC4rR7YMaKwK3LkMtZaeFDqR8hbKjPI2xPDsiv?=
 =?us-ascii?Q?WGNhE/1kP+2One/x4PIvc+kWFy5ptnriPVq4YEVyKWVEhaPYRwVeUPPZLN9p?=
 =?us-ascii?Q?XPKge1D1ux+ZQ2TlO2xLECyzcxeq1cXloohQqNKuiETN2mq5G5opkJn0lKq/?=
 =?us-ascii?Q?Uo4Y4kerRuP1E/cvB8chN5UresT1VhhVjDaqdh/4IXHgSU/GvIkk7oxR7OBv?=
 =?us-ascii?Q?us6Il4AJvZVPt+uZ0lJujyAGDvmORZjLzG2ny0BC3+e+9Ts3fLAw5rmEbRfP?=
 =?us-ascii?Q?4YzETUN0bnLVd9XwhKuPkc8TyyXzNxZ+cL6wUj7V7S5pISq4JjX9kz3ESzrQ?=
 =?us-ascii?Q?bLLKiRZTrMJ6yQ5DHW1SkhyPgYiNNjWU4Q+C6O4waR200Zo70UVLcC0SuNmF?=
 =?us-ascii?Q?LyS8wqdiLvniLr2E9Lj5WNPGvR2220koRdDnBF0s1513FQZd0R3cNZCoBqkq?=
 =?us-ascii?Q?rD7k6NC1HwFcJXXGQDah9HNe26+UgonrZKjWLJZJ54w5lzviYchtSiuBeiuY?=
 =?us-ascii?Q?CSeh3aX4IY+8sfNEY/MqtK1HRyw4gBGExlyJpdZXpF49C7Ohkj3IUCznX9w1?=
 =?us-ascii?Q?mSaWpeObKgU0wYsmEEL4MKNpyMu3GUddbmV9a2MHWnPLfo11FOjhzFIMlvC/?=
 =?us-ascii?Q?7/V1BYYqaxFtw4/WuJ3hkNM5A2R1JZIAV0uQLd1Y7O/SgKKdOZMs1DcIZcub?=
 =?us-ascii?Q?9NCOMoo0vytsj088NORMWz5lY5l0jTaKeHqW04Kv57NkdwP6j+d37goj+nLD?=
 =?us-ascii?Q?CnpZcv4H/RZnSwk3r+JlFJFHwvNXI0nKRVbY+jVM381+05zr/FeBK0/VrjwN?=
 =?us-ascii?Q?pj6HRyzGHIux4hWoVqVAyiz/hMAz/kkn3xsRzyPwjdwQPqPeJ75ML8N1+YYv?=
 =?us-ascii?Q?ucFmOaGuCG6nXHg08bqVnUmIep2S1PvxKNY99vSmQbKZeDdwwU2DC+3hgUKV?=
 =?us-ascii?Q?bwUjF1MToDjvVX81E/MHyYar1vC93tCbkxjgTy89xUmKTRQJYBeumBKw2NJN?=
 =?us-ascii?Q?AsABuNx1cYAZyIS9MYTc5iO1/Q3EIBe+KSQMKO52SJ9fO7+Hp6+FqPjTrubS?=
 =?us-ascii?Q?yGqKuBUa5rCDEgqsS2t7Q/Q80H7yEE83dOL67kbo1SGTTZ1F5GPi6cNCrsg7?=
 =?us-ascii?Q?zqPo5PqCgidLs6znnX5A2M/rHFXdFXUr6GFQRQA/J7yGZtPc3mdlB5h8mmpr?=
 =?us-ascii?Q?7KUHH2H8Dni4IvLKCw4mlRxDD0v1WsOtXwJXNN3DTM9Xdi1uGiEfaehhLub+?=
 =?us-ascii?Q?oDggIrGl8yXMzXTojeWdFbVC+9y7BXQD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3N9zzw6FlbnPuQnmmlrpcAsUfA2Xur3sT/i9RS9vwnj14MLsGu4l4J7RnrhV?=
 =?us-ascii?Q?iuVFrv6l0LdfxIZLWQDsZcOahYwux+ive/um7xUPInueZtngebfA5LCAFnN9?=
 =?us-ascii?Q?kqamBdNLWrcgdlo3tzHhZUD+eM2QpWccm3HMKrywk72NQ7MGzyGAZ0C6JruY?=
 =?us-ascii?Q?3i6mDc9OF2oqMGDA3elQ0uZ9bCtPDQZaT46MpYMwMJqkAlXrhcwxubVQGye7?=
 =?us-ascii?Q?zbqFAofz/PL7liiN5f/RXOtBCVoATIV6lFMk5XYX+9/+HsjNq3013Abx/ZJI?=
 =?us-ascii?Q?euuYEGFjXKMJNrwKZR2eTGA3/7LB7a7I/PytPSJIUQb6NkQ5kYTvJF1z/I/K?=
 =?us-ascii?Q?oqUqGQ1TcfqxmTey/Qev0zJPbvn704w2c2z9MNCeGzdrYcxHHTwuHWE/t49a?=
 =?us-ascii?Q?nNFVdrYibeWLB9s79grooW4kRG0LijsM6az9J8mro3wyDxG7tiJejCrekDme?=
 =?us-ascii?Q?/b6sBaFw51yMGooEau4n4c1xB8wtU2O/1hPJ8bbKSIpaj0R42vo8lIx9iQO2?=
 =?us-ascii?Q?cEfQ15GMe7rocblbXmu5d6YvgZ7auttfSiEB/UHJ0/rFEe9nvLKG3FLdM/tJ?=
 =?us-ascii?Q?v8NG1MiWDZcfXdaJxQ1s0CHlu3tAEsrLjlSjiN4S0oUmF8S8EFEZI3GpMDDE?=
 =?us-ascii?Q?ppY4NssSInzWd6c+W0mQj2OrKsnhe8nuv9CImnqOCT28Z9syqXvGE+QpoLag?=
 =?us-ascii?Q?31EwdaIIqKgm+pWUTutjUZAOQMWdLZg2KNZOB3NxhO7BSesPz8S0ilLQqBgx?=
 =?us-ascii?Q?n/lbSthCc9qA/Y6f8H7T7ft6A9gx46YA9N4WtytJ0cL62D5mLENY8Bvo5iWo?=
 =?us-ascii?Q?7CoZUQigFNkoswkRs4KDXmcPDg49yfeIR1+4vJGpwgZkkGmh/ei18/vdiYZH?=
 =?us-ascii?Q?StTJgv5bgrLC+Byd373a6I17Ap1OpCameqbP6WDVrNWYE1IjL7n7Q0CHTFus?=
 =?us-ascii?Q?fKxNAa5oJNS1yfUqDpN2trJTfNQlFebvNDmeHfzsd5YaEZPzD2HQ20NTcgnr?=
 =?us-ascii?Q?OtBPsT5cBBUVI0zAjWRJkQmISDu/TznMgYlAfDcxZS5b3qWdzz4Q0DSFatz3?=
 =?us-ascii?Q?VAPoo5tQX0BogpZm3YHXwmuzigVZxqEmcvnpvPwleEaT8SOb5QBoNiivb1Ra?=
 =?us-ascii?Q?ckBYvFjd7Q1qFRkfH0tmNPZ806kpBKkKmcJ9LCqv6GZXa0Cm82FgAveD1kZH?=
 =?us-ascii?Q?9BJIn1YQyiWQNhzBuUWz/YCaFeGl6YnhDv/wqmNpmTxXxuJbG2F84LNuU+ra?=
 =?us-ascii?Q?EIuMr/jhHYxrphHdmi7llekQIwww4gs4Ai1Ico4d70UkREq/7Q+Q0DrfXGjG?=
 =?us-ascii?Q?zkZdhW0R5O6Hr2M/vAZl9nM+3aWT40L5d6apsBl39KGGWFdYPvPMln3vOddO?=
 =?us-ascii?Q?sRnCsvZWggImbtWApdzKgNghWYTOiRiW0WUk8kq1iC/Q/7iWrOz8S1VkpLaN?=
 =?us-ascii?Q?I07hYSZb0xnDuODlnBFZXjN4pvI1WYTBG9ApPJVdYi7pNu+utXW8YP6H/uJf?=
 =?us-ascii?Q?zxspnmcSB9GFKQv/I2GV7Pa97aeeZg53lH/UWgTjAPWp5pgMpQI8MjKyVHqF?=
 =?us-ascii?Q?hFZyaeTloRN3D7TI4lVT05/TiQO4EqCNXs55aCmVvy17JfZIUS2awnj4E3q3?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4339e031-f1ae-42e7-0997-08de0d9f41e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:04:39.1372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm/pPXeOpA6/zqyp6dVmkN3/9gVZADj6yj5JoXnmeOyyx23yDw8n28mpBfCuFhS9olEwE6ER+lGewE2PHZwwr5atjqSk7jULDIpVvuSk/W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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

On Thu, Oct 16, 2025 at 07:26:40PM -0700, Lucas De Marchi wrote:
> Current implementation of compute walker has dependency on GPU/SW Stack
> which requires SW/UMD to wait for event from KMD to indicate
> PIPE_CONTROL interrupt was done. This created latency on SW stack.
> 
> This feature adds support to generate completion interrupt from GPGPU
> walker which does not support MSIx and avoid software using Pipe control
> drain/idle latency.
> 
> The only thing needed for the kernel driver to do here is to wakeup the
> thread waiting on the ufence, which is already handled by the irq
> handler.
> 
> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Digging into this more, I think the implementation is correct, but I
think we could still expand the commit message a little bit more to
explain how/when this winds up getting used.  The description above left
me uncertain whether these new interrupts are opt-in on a per-walker
basis, or whether the hardware was going to start unconditionally
generating interrupts for every walker's completion.  After looking
through the bspec, it looks like the interrupts here are only generated
for COMPUTE_WALKER_2 instructions (not COMPUTE_WALKER) if specifically
requested via the flag in the POST_SYNC_DATA_2 substructure's dw0[3].

So with a minor clarification to the commit message that the interrupts
we're enabling here are something userspace can opt into on a per-walker
basis,

        Bspec: 62346, 74334
        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
> v2: Rebase on split mask per engine class
> ---
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_irq.c           | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 815d5e3d22099..2f97662d958de 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -85,6 +85,7 @@
>  #define   GSC_ER_COMPLETE			REG_BIT(5)
>  #define   GT_FLUSH_COMPLETE_INTERRUPT	REG_BIT(4)
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
>  #define   GT_MI_USER_INTERRUPT			REG_BIT(0)
>  
>  /* irqs for OTHER_KCR_INSTANCE */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 8f2c8d3ae5f8a..e5ed0242f7b1d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	if (xe_device_uc_enabled(xe)) {
>  		common_mask = GT_MI_USER_INTERRUPT |
>  			      GT_FLUSH_COMPLETE_INTERRUPT;
> +
> +		/* Enable Compute Walker Interrupt for non-MSIX platforms */
> +		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe)) {
> +			rcs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
> +			ccs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
> +		}
>  	} else {
>  		common_mask = GT_MI_USER_INTERRUPT |
>  			      GT_CS_MASTER_ERROR_INTERRUPT |
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
