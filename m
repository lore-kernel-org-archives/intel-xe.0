Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6219CC0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 10:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1141A10E137;
	Thu, 23 Jan 2025 10:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCfv68xp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0968010E137
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737627981; x=1769163981;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GWnIZkkNxDR33DU6ovtFJt6iJyxjdAPTovvfE1/SAhA=;
 b=fCfv68xpvLZBUjQuxwEwhAY+zorkUBzBx7InH3mjMF1Hclg7rq1MXflE
 cxtnRCKmLdUKZIGANvQ4ZEz6EMLflzkF9nLGbgxHXC3wBiWxhl4mP0hHN
 T2JHouVgiWEQHwRIWYO48EEidPLtMxqUw06XK+UmOzC4H3XQZ4egcpKq0
 dcDCtx3FubjCEt0hjuerGwOmQTytdcFe+n+PjHrdeBxHi4LaZZSDXbqve
 z9TznvyM6SL7YFkU75OWgRG6ocjSAbY5cwHL7VlnBgUrBQ1udADGD1k9n
 2owd6LMPOAovOyhkQMfsUvEEc9qAaKZOuXYjoupBlt6UzC/N/0Q5Xp8Dq g==;
X-CSE-ConnectionGUID: jAdswIGgRAapiYmX0h56mA==
X-CSE-MsgGUID: ssM2tMXDS9eic8XEtESSHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48617846"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="48617846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 02:26:21 -0800
X-CSE-ConnectionGUID: PIjlnDxmR2yU5N+ej02EWA==
X-CSE-MsgGUID: J5/JeJHESbOp3bEYd39rcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107964457"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 02:26:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 02:26:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 02:26:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 02:26:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeCY6XJ5DHqSHdnLjxuzFCwFPKOVWEx+CwHBGcHn12cF3piB5f04Ny4yQ6ujtQU+2KcFkga85zw9IlMA5Lms2KRJZiSL3gvKwNOc7cNdPrOQ5mMhQn3H6veEs9CpZPt+cYVgyYGkKVq+FehgwXiZB8mCBu/v/P5iNjlumB8Jr8/xfBj5u07R61MvqrJvB18KCuqIuhpxpq3XP8M1gQkV9QsaMpulbDONVUROTMpN/utZpwMIBAcuDUNIXme9aoJ/d7ehhja503E3BvDhtcYotoO513GhhyszhUCMu+cJjmX7nxY3lVf7LHjD9ZImlVcG3zdcmT1TqoQXp/ixbRzWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaHo1Ew13lrUI7CNRjTT/EHQDa6zL7E0/W6mNOtMdVM=;
 b=fuynF7ClCROLtULmTvd7RyRNpmUABpbOhaOcjkUKDzfMokdIaanDpn0eMiN9dvlyJ/sPE64AFO+tM98nBUFKpHaOGV/+MN43gzi2LEQvgDwkt9Q05HS9Kt8bAQXWpVGJ6M+UX31F8OINLxZdplTONO4oRYwM4bvxgP4kQu1z2UAy6Y4y3V76Bp0TgVxRZtkejy3/9tk0tMKvTAxOXUhaPGm+bKiq52/D/kxfhwLetfebFWF1lRQDcbB+xHMu2vLJmyHKxeh1o4mcQi2G8WUFAHP6drEp5CH2ApAJtgVWtO1+JLK0B7FNg9zYB33/pkZt0SXMeyKnDKw8mhdC6+OzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 10:25:49 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 10:25:49 +0000
Date: Thu, 23 Jan 2025 05:25:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/oa: Fix locking for stream->pollin
Message-ID: <Z5IZKcUpYwKMPVbc@intel.com>
References: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
 <20250122040204.3239397-3-ashutosh.dixit@intel.com>
 <Z5DHG7-R3pRmSmvx@intel.com>
 <85frlafcy2.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85frlafcy2.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:303:8c::9) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2d0a1e-bc96-4eca-fc67-08dd3b984dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3bbDffn8mmA02n7MrFKyC16EIR7w8uauQImHHf9pBIMdsWsnlRyotTVpX+wc?=
 =?us-ascii?Q?5GTFFy4Y9riRHJv4Yc45eRUL5OKrTeuOIRbIrGwTp/dZz09/dFy8v5sagF4r?=
 =?us-ascii?Q?uQ/lw+7IWnGE914yfNJ02rhKYEUwdNTSUXmP/qCbZLgs71qiIo1MY49FCyTa?=
 =?us-ascii?Q?GRcl1UIGhg84OVURQqV190PVfGykB1CeCj1O5ga6wmzYVWdRV/WU9qyyI1Yy?=
 =?us-ascii?Q?IbCthvrnyHRdDbMjZYGHfIqlJAhsrTMlsMocM+PvEuSa8FBTEu/Qrj6lCvCf?=
 =?us-ascii?Q?A0JV/0utoZ4mLHqovqx/D6cmxRsAqSxY7fpoMuBN1W8C9HNAxoRe3CJzkcSH?=
 =?us-ascii?Q?wx/H6Txl9AYm7IocGw3BZRsYI4bSoJTrwIXBIJ2F4Hc2PHp3/QFlo765huWc?=
 =?us-ascii?Q?mGN7njvFih+lkGySi3HnFr2+NjENGwmW55fq/g9BugI4i20mDf5LyaqR/vD8?=
 =?us-ascii?Q?8pSo+Xpt53aO+DELh85eFuxgKTyp24HypAGRqUbKQSV187cg/8LBqsFf2diT?=
 =?us-ascii?Q?dEUnvoXjwDraAju6gZqN+Ml/cl5swcrmfNQ0s9j1TsH7sq2jv2ZSkcKrWC1H?=
 =?us-ascii?Q?+FkYK6nQjXjiruuw6N3epYYYdWsWs0Ku2ZJ+kPJ0QZeNoyiUjqJXNUf3WK0d?=
 =?us-ascii?Q?YMMzjtcQHiX8fGoogG44za8dxRn37RmP9xDG8JdSTctR032MXMEn4tFoEUbK?=
 =?us-ascii?Q?9xhMKbqtqW1nv9bPZFy2A++Pw3KhtCWe5jyUodKvet6GonkUMSSqKELUPs/8?=
 =?us-ascii?Q?vhyINghgKrxprzstETS4aekCtpqbbzhA3Ty8o5+9WBbbktM07wrCQQWrs5EP?=
 =?us-ascii?Q?7jAhK8/bfwrj0MlYsXLo5g8fmphBxE3nOtMqEZvUnSQaRJokKGGYBdARRK6x?=
 =?us-ascii?Q?DowphSghVjtamVbXhBcTBMoyQiMsVTOhBQedtAT13cFF2WXYiTVCh8F0fgQj?=
 =?us-ascii?Q?Puhg3YbNSEmoYwY/hKOB+pVQtq5VnW6k/f6LZ0ZkhYYYkIHL1uWN+4x/cC/R?=
 =?us-ascii?Q?S3TgtP/V/a4wBNOKOr/r0T1LoaVPqo8wfBsuLkpfDGnvre8jikg+Pa27Fht2?=
 =?us-ascii?Q?pHpdn+X+X0hhOo0kCqrCKVfB6330zP/+XHxdLPd4tjvTFlFnMgf2rWvkrzbn?=
 =?us-ascii?Q?XYdXHHu7wfIqI8FQPbPnj7A4dBuDVYoauPjGJdUmD5x00KjLf2uwEhrNWiYf?=
 =?us-ascii?Q?EOMn459jsZrFiIn37FDqTXGpbaEfMU3sKwIHbRYdIH9pKotkoDRsXxuwCxmQ?=
 =?us-ascii?Q?/2Ro43st6WKBXM5Y4WWrZD6272h8jGLPUNQ2wdoMZAH6eYz6z//po92rGNBt?=
 =?us-ascii?Q?2+kspN45iIDQjGaEJXscjGCfAynQkvFyUezfxalDx7HqaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AoC2sFvBOz7F8MNe1a7kXXvzHwbKz2YONMlKokFS1YTXO0zK9bk5Cs5PdA2h?=
 =?us-ascii?Q?mA6yhdkRajn0Cz2piqGM8No89V2XeD3IzV9/vQSnOmRU/zyGfcBfU/KBLuRA?=
 =?us-ascii?Q?lvdbho1rvdlZbF8tlVdLyzS+bBqcMuf0SYLLnthZA60w2E9EyWzecHqBVljV?=
 =?us-ascii?Q?e74nK8JXwZEKIYMDEOUgqxPVGBR6/nlBikRndwRKkUzqIKermeNh3RBJEpvO?=
 =?us-ascii?Q?u5r6AWnSPeeZmJoAOpmX81bGpABCTMQKgJcB+FTAM16k7IxLtpK0DDACNa8O?=
 =?us-ascii?Q?aEqtfi9nZxft7Kz2uC7pPhROfSKwl2YvmjM0A0tsm3oQ/ASq3oP8Kb5FvNrO?=
 =?us-ascii?Q?Lau2/YmquB2p446vIQqfxNuIRi++Qvohrvu1ShHB9g/JXYUGTHN2IK1hjZLk?=
 =?us-ascii?Q?6GmHIFVnQ8yY17uNVuLL/x3oS2cnIiwPU1sUAYCZ5o0brkoG6Vi//i1AgRN9?=
 =?us-ascii?Q?ZLv8zRj7RJGsjmK8+39VLhQ4EGErhC1Pdw7YtKqvQoraEkwAi1Ydu4nJ7W2J?=
 =?us-ascii?Q?z/8dM0AgsxuutbWfWIH2uqXc0wdOBcaVn7Y/zX6DyoQozjaUUR4aE6Zhh3Hy?=
 =?us-ascii?Q?YPQSYYVWB4GeSW5EpfPkvD/6udBXTIXSDfWvjo7ETmehZZ8g94kI5fv2POnZ?=
 =?us-ascii?Q?i8tbkZ/B+L1KVFPk4cW9TCHMdageUF89la7g8XiAATZgKRoIvsgVxJ0Xm0VX?=
 =?us-ascii?Q?qQcMdHpZMS5TqIaewWkEtkq1NmErWVRPRv/kTbEG47Gj7a723T58r6ce3eUo?=
 =?us-ascii?Q?zuYw10tKd7QtPU+nwPivnMn373aUZL/UYgLLmZNmN/vtSqQCpnX3Qd3FD6P4?=
 =?us-ascii?Q?lbJjPIoLfa/MXmE8E/qwfN22QM3SKn6FPT6Q1ecv2jLoTiRSlCrfLfv7OrTA?=
 =?us-ascii?Q?VwTmmzw+WKHRuLKCjjaLem514gyBcdwRpCjJhBFXvF/m2WPP0AGRHKCy4GJa?=
 =?us-ascii?Q?l7n8dmYf15BG1SgJyqk1ld2jdhPQ3Sy+O3j0ZZ+rH7SeR7ntk9MySFC60efH?=
 =?us-ascii?Q?F3OLUHM+1zSAbXkR1Fj36VMrsJda05iyX1nnuEC+nlCn92X6bzNMDRI+RCs7?=
 =?us-ascii?Q?YAgR2X7qBz0Vb+/fCCuQMIPZ/dMsjFmgcVeT4/qWCSKIJYW4YqE28F3OQ/xz?=
 =?us-ascii?Q?hLtvtiOWedvXfmIFwh88ReTA++GDE5z+sGaQw4xwOEo7sqpeezZiQanAP/FG?=
 =?us-ascii?Q?JVNgcrXRnsRdk7BtB/LAjWT6WSpCTHZER0yFyBSEg83AtUmpRDyJr7jMxy8I?=
 =?us-ascii?Q?xqXJesYomtlBcJ2RjvKhG0PBpxezt78+cKbmVmvDEYws/xln3/Nx7tEkbPYa?=
 =?us-ascii?Q?fgK9IgDvsuNcUXKO2VKZAp9y2GEWGeF0HKuJ2Kqpyl2IisggcSlVpuQHgZAI?=
 =?us-ascii?Q?2yyG00DlcBWm/StrCp1FUYWqQRPozzUx8CSB6CVTGGXpP3fSEfzvcpiRXhZ1?=
 =?us-ascii?Q?190zU8XCEFqGyjiHiEVnDu85IAl30eYopOoCzW9fjOXGk0RSxd0FU/UrMXbu?=
 =?us-ascii?Q?TWPMhNv437Kg36GbdZgAUyTuqxnoNvQKVD0be+mFyOmmPzbJUly4B7lSy/P9?=
 =?us-ascii?Q?6dYxjSvjKgEPcTlzgJ140cfx3A4yYAHkSUd9nJDIavg2EzmLb8mz6vBJkvUo?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2d0a1e-bc96-4eca-fc67-08dd3b984dec
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 10:25:49.1424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkyUb3qIVpyQ8wla2vJkNIUIe2LzWeYWjdO/sdipmWz0cEawUtvGt0ArDIq7F1Oi8mz9ha8hnsuiJ73OpXburg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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

On Wed, Jan 22, 2025 at 07:04:21PM -0800, Dixit, Ashutosh wrote:
> On Wed, 22 Jan 2025 02:23:23 -0800, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> Thanks for your inputs, it helped me look at the code more closely and
> clarify some things.
> 
> I have responded to your comments below, but in case you don't want to go
> through that, the summary is that I would like to drop this patch from
> consideration at this time, basically because it needs more changes.
> 
> > On Tue, Jan 21, 2025 at 08:02:04PM -0800, Ashutosh Dixit wrote:
> > > Previously locking was skipped for stream->pollin. This "mostly" worked
> > > because pollin is u32/bool, even when stream->pollin is accessed
> > > concurrently in multiple threads. However, with stream->pollin moving under
> > > stream->oa_buffer.ptr_lock in this series, implement the correct way to
> > > access stream->pollin, which is to access it under
> > > stream->oa_buffer.ptr_lock.
> > >
> > > v2: Update commit message to explain the "why" of this change (Rodrigo)
> > >     Document the change in scope for stream->oa_buffer.ptr_lock (Rodrigo)
> >
> > First of all thanks for the rework.
> > But I believe I didn't have enough coffee today yet, because
> > I'm still failing to understand why...
> >
> > Breaking your explanation to see if I can understand:
> > 'mostly' - Why mostly? Did we face bugs?
> >
> > 'worked because pollin is u32/bool' - this sounds like 'works by luck'
> 
> No, there are no known bugs in the current code in the kernel. That is what
> 'mostly' is supposed to mean: basically the requirements on this code are
> pretty lax, and even if writes into the boolean stream->pollin from
> different threads cross each other, or they stomp on each other, things
> work out. So not 'works by luck' or 'works most of the time' but the code
> works even in absence of this locking.
> 
> >
> > 'with stream->pollin moving under stream->oa_buffer.ptr_lock' - Why?
> >
> > I believe this is the main why that I had yesterday and that continues
> > today. Why are we using the oa_buffer pointer lock to also protect
> > the a stream variable?
> >
> > Why don't you use the stream_lock? Or why don't you create a dedicated
> > polling_lock?
> >
> 
> So, stream->oa_buffer.ptr_lock _is_ the correct lock to use for
> 'stream->pollin', because 'stream->pollin' is intimately connected to the
> same pointers 'ptr_lock' is protecting. You can see this in Patch 1.
> 
> Also, there is basically one 'struct xe_oa_buffer' per stream (and stream_lock
> is a mutex which can't be used from interrupt context).
> 
> So rather than using a stream level lock, we can just move pollin into
> stream->oa_buffer. So it will become stream->oa_buffer.pollin.
> 
> > I'm sorry for not been clear yesterday, wasting your time and 1 cycle...
> 
> No, thanks for your comments, it made me think about all this.
> 
> > > @@ -562,8 +563,10 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
> > >	 * Also in case of -EIO, we have already waited for data before returning
> > >	 * -EIO, so need to wait again
> > >	 */
> > > +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> > >	if (ret != -ENOSPC && ret != -EIO)
> > >		stream->pollin = false;
> > > +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> 
> Also this is the part I don't like, this should be moved into
> xe_oa_append_reports() where stream->oa_buffer.ptr_lock is already
> held. Otherwise we are dropping and re-grabbing the lock etc.
> 
> So imo the basic direction of this patch is correct but I want to make all
> these changes and resubmit this as part of a separate series.

everything makes sense now, thanks for the clarifications and for the work.
the lock might even deserve a more generic name in the series,
like s/ptr_lock/lock.

>
 So please
> ignore this patch for now. I will go ahead and merge Patch 1 since that is
> ok and was already reviewed as a separate series:
> 
> https://patchwork.freedesktop.org/series/143575/

on merging that other patch: Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks.
> --
> Ashutosh
> 
> 
> 
> > >
> > >	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, -EINVAL, ... */
> > >	return offset ?: (ret ?: -EAGAIN);
> > > @@ -573,6 +576,7 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
> > >				  struct file *file, poll_table *wait)
> > >  {
> > >	__poll_t events = 0;
> > > +	unsigned long flags;
> > >
> > >	poll_wait(file, &stream->poll_wq, wait);
> > >
> > > @@ -582,8 +586,10 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
> > >	 * in use. We rely on hrtimer xe_oa_poll_check_timer_cb to notify us when there
> > >	 * are samples to read
> > >	 */
> > > +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> > >	if (stream->pollin)
> > >		events |= EPOLLIN;
> > > +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> > >
> > >	return events;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> > > index 52e33c37d5ee8..5c4ea13f646fc 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> > > @@ -159,7 +159,7 @@ struct xe_oa_buffer {
> > >	/** @vaddr: mapped vaddr of the OA buffer */
> > >	u8 *vaddr;
> > >
> > > -	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> > > +	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers and stream->pollin */
> > >	spinlock_t ptr_lock;
> > >
> > >	/** @head: Cached head to read from */
> > > --
> > > 2.47.1
> > >
