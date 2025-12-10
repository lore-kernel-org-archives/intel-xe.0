Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12304D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 06:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C0710E0CC;
	Wed, 10 Dec 2025 06:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/NxarIw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED5010E0CC
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 06:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765347572; x=1796883572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JMtApJvdvv3WJsieqGtjerUSixYJkpoHzIbVZtGH7Zo=;
 b=M/NxarIwmAWqWCt/O8la2zXIRRu+ywVQas+qVmSKT82TvzYGvWlA64tv
 AfQVlRiC12HeEv99jvNFnQBgUB+tee+ThL/qOdsAkwVJbdY0P7QvezQXc
 J4dU3t3N6OE/+NpQD9PDK3Vsy3AwirVZZhd7KtKXIG84cWmLIlAXuMcBO
 WIg3PqWlMqORs5z4t6lJkAzKDuvVEk6CD6fGAp20f/bMbVcxM4wQ7l/5+
 i4q+ZJpa2VLthvKLJOUjzDR7zDQHXxUYdl73qwttFDvGPYCKGbAoIF4Wm
 O9eeyvE434t2zvfCgxr5l206rgv5Jfhaf6F6AT74rJ8H9j3nNOcCn1VlV g==;
X-CSE-ConnectionGUID: qpTa6+pcREybsZ8ovDir4w==
X-CSE-MsgGUID: ZJ34K6hyRx+AxvbfTDwgDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70932613"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="70932613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:19:29 -0800
X-CSE-ConnectionGUID: 4NW8yfRGRVmQMSMWaISbWg==
X-CSE-MsgGUID: XTaIAiW5TOWVksN6TtHLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200853155"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 22:19:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 22:19:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 22:19:27 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 22:19:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbizMqaP4dxRo9dkYUNKEsuHOw8hpJCwURmihz6T1E23yLr5NmCmeDJKt1W8cTKcLRnC7cGw3rNLT1rFd61i7B2VRk2M9W4NoDedOKYEHnEmF6QreJNu8IKHhBO3IiOoDovvkUOqCvybuv1SmrYoKTFYM1O/JXH8X2yb2uxzFOojovD099ANK/xTOqJMaaHbKsHW3POJM2MZzaSu7mE1AJj10vJseUYQWEh7QG0i9bJmS93/NniC7rkjRh46nXIDylPpROcTWpGf6a40hiyQvQeINQWXLPpcRFeYY9x/M+tx9Gzr7+sMBCuM5WJsIdJsx/11YbZSgz6jdM7sAb4qUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJs1jAdkqlQ2JzEv2bIKkkJqWtEi4ZXd9xdnIS9DChY=;
 b=oEEDWQjjWFWGRtgJ+7q94L7qXo6AYdDlPHjSFy9RyB2sWMm/N5QK3FOHVkCHHkZKEm51QXODdnqDmweFF85lfV8tIgS+tiQER4MHvd1mYcuaaceIsdcVj1xlJ+lAjuEi4d7Cxif8ACu7YRTSRSU1XMCaGfqZkyUzmsC94Yd53z7hwtjGV3pQsrWaqG4I1Qcd1zxuNLxmxtVBYh8254Ap8T2iw7ID10tfSeXDtRIQh1SZZBsf15erljKg8skMJtIGCxcvtBlyzDUbLC/E2Ngkf4RE2xJzMY5n+i3awXtGXtQ37lHTYIBwjn/cjEP//9dxaPjVnpQ0L3D71AUuoQB8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8452.namprd11.prod.outlook.com (2603:10b6:a03:574::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 06:19:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 06:19:25 +0000
Date: Tue, 9 Dec 2025 22:19:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Message-ID: <aTkQ6y+ydM96tsqx@lstrano-desk.jf.intel.com>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
 <20251210014517.3184135-21-brian3.nguyen@intel.com>
 <SJ1PR11MB62042A41A4F6B342ABB9A87C81A0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62042A41A4F6B342ABB9A87C81A0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0217.namprd04.prod.outlook.com
 (2603:10b6:303:87::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f2f8e7-917c-4005-9e2f-08de37b41122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?93xAGS0IppJFxL3nwp7QnGP9TIlv8uQHl37PW3JqrhJNi0Vpr8pG7KQKxlrA?=
 =?us-ascii?Q?/9W702m95FkRNlNnw3zL/b3C9BaEnqi5JcGY36Rog7k+F44qbGjzWNC5nEho?=
 =?us-ascii?Q?0j5eJAd5KXo1VwzHmHz37/fGGgTwD6LcBlAwdYIN+Je/zliJgkZuKqWHyzgy?=
 =?us-ascii?Q?c2+oooGKgM0pk2IPziAjEniGO/RKEMdxZRa5hb/+vgbceIUFifvAV8uBRG/H?=
 =?us-ascii?Q?Wwf8crGheJNcLsypilF163FbNqy8IBTwlefbfWYspqbRJUAKdt0AacHMWk+l?=
 =?us-ascii?Q?/+3PynDATJYhDVWpmO8fxC3FBPZekRfedalzJQBO7jfgSw3Y/s09IsHSZxY/?=
 =?us-ascii?Q?tjH+EqruxaY5+hznJqHOgm5f/nvbtWIoB+lU9HNKg+Ly0RfAUwUq8b6AtvIs?=
 =?us-ascii?Q?Z8WS74lEHQWlVTFlKD6wEq+GPh+SqXXzg7gJsByivWGZTEkORJeK1SAaac2/?=
 =?us-ascii?Q?pXzzfGHp+Hdpor9xHVI/xsz0k7huzFXCMW6CXilNM0q72eNqA9QLPFFXfGit?=
 =?us-ascii?Q?GGhyMZASJKhaHm/AXFB2l5payj+lqfZaeIJMFZz5JAnx0IXMZaYirXUPAx8+?=
 =?us-ascii?Q?pBG6BwuSMQRYOczWNvWSnz/Vw3g3r3KAKhe0kB+E6CWMRd8NUhipj94yTXHc?=
 =?us-ascii?Q?xTyFMtmd3CkaB+YdgLYiphvo7wK+9BpokgM2TsianlbolYot3v56+1TOPpYJ?=
 =?us-ascii?Q?CE7ztPpDQMTGMeqyjimdYTa9yqBMtf56OAsMd/9Fg0oVCkLX51dlSQfCbmaO?=
 =?us-ascii?Q?5XwQw1iq6xo9DcpabKXIx5tR2KbDtNW/QQKemE0WJsTq8xhWpQ3TJMkHw8hb?=
 =?us-ascii?Q?Gtv4Ik+KrlFf5bI90W9ZDZiJc/pZ7TUw1S3ibtzETPoDv2svY1r7Kriix9lG?=
 =?us-ascii?Q?YOJrujmzuOTTLCnyZoAo3NxxasW/MZH4nDEXqQ203TcvtXuS7VSq3cYODwtL?=
 =?us-ascii?Q?yceUYADxKMu5PBLc5RVqUED3I/LhWSipr391JIyrfj1JvHlUSDmmPa1rg9LV?=
 =?us-ascii?Q?R1jfM9lsBKvw0knrqGSUfwanS1UMCfRKyU+xaANXs30hX4VtNe5+BNq8jOsp?=
 =?us-ascii?Q?BxLfCXKP2IlyGf2aws8tqjjCD52jN9UEA2GWZOjyZmpmxh8jRPksKzECLrxP?=
 =?us-ascii?Q?E3x76LBHPt5Yc4MxvCBJhzkXu3w09JVKKwJc4vu0q9S3Lw5BBnHE8QO7JIXw?=
 =?us-ascii?Q?Uayo3pkoXnw4169bQYwxxkAjlhMyX0+TvrGpUGaKECWPKhGTjlt1fb8QzpF0?=
 =?us-ascii?Q?J28ESyATzXQH1yGVh2/ewH/Tow1nLf0rPKfxB4sgw4vM4GsCTWtys02Nslwq?=
 =?us-ascii?Q?gKhXi9HloxM2sjkypRR3/6KH7zPFpHUrfb8Jj3fMXM2bQevrSu6mGXry5ovu?=
 =?us-ascii?Q?U1wzoH4/Z1JvS4bVP8Y84gRBYLeRcyGurcFvdbhbLa0j4n0sL91db81EGF3P?=
 =?us-ascii?Q?M7IF65EmwJfn7tlkxb6SNL89yRi56IzW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lt9bVOKc6Tleu06GPxzb4nGiKJAyx1YWxes07DdCyOOwjklp0PBqohA4iMt6?=
 =?us-ascii?Q?ziQoEmdg7jgePbr7mAh2cGS1O6nTcxNChNZSTXq5UB8ecK5jCqdI+Km13lwn?=
 =?us-ascii?Q?/VFmnPf24efvT4a+V0GPsgXFdQy9kE8si7Zr4vFG6RHVMEBy7a6iIeY//doX?=
 =?us-ascii?Q?Ict6Ch4v3Vd9rQzUZMuqJ5iaqI9G2KsXZ6pybqY3B3vibPlEjATdSDAZp3f3?=
 =?us-ascii?Q?C+aklse+bHyzv8ykT2bpbW5c6T/O+Wu1/gJXyD/sldTFyYG/421G8iLPSI7f?=
 =?us-ascii?Q?zVFTpImnQ35IFvskhgtTqrZzE2MLU3cmTZPA+JuV4Q5FRVMFxB01vc6DMVem?=
 =?us-ascii?Q?mHWdnVP28ZpiL6GDEFMtnDv6qEXQhcnGt3F4mYKmFFAsNYg6YIxYHLgUUlbD?=
 =?us-ascii?Q?sq4qGMfRivJstGai64/yFex+SYasT4sFA6EpgNJAKm6syPlN/Mbp+wysxfmm?=
 =?us-ascii?Q?EGX72+nJD4CYvXeL9Gyh9ZgpTElKyKAwdH6ngs8GRhjFCKsajysuv/KFkln7?=
 =?us-ascii?Q?mPcOfvG3uO7itjRAj1UTIO/Gd9OQ1ATMsHK43QVqEJAyzbfXj212vcl3tAH+?=
 =?us-ascii?Q?paSjO/nkUZXa4eIDp4QUYn/ctQD0NycwCvhmOkJyD7OUrThtZB4QeuVoaVxJ?=
 =?us-ascii?Q?ZWWiwLptynf40ZHC7n2Zrl+6cBxKml0dqzAIJLWhsKymlRUiYnWgRri3ARSr?=
 =?us-ascii?Q?6FeDHIoCtdh2k4L+P8Pr+haWfWsIJuwcEsfBYPStE4dKtVmikt/bFDiDqswo?=
 =?us-ascii?Q?bfFqMgsrCBzrvuTHsig65unIp0au7cEfriWmPAqhLmjT8pQebx5NaBazcMWB?=
 =?us-ascii?Q?x3rz5RF0qR5vtCC3Nf/k3LNEuI+TdIJfGGMkz/OoP+68w3z8fOOdvjW6hHrk?=
 =?us-ascii?Q?WP/CkypNvJCBKGnN0fqHq4tSkmp1baI06E6H3MP+pybU0MdjGW+rMA8HyJZP?=
 =?us-ascii?Q?8N/WlwX+2mvXC0nzs9udV7ovlzLAu0EO0fodCzzZy+VMMi5yF0lv2/DsnRPu?=
 =?us-ascii?Q?kB3tzBRYTMAQ+SVklFjUdPoNO/cSokv24bpxfpNHU4oJj8b9Q6Mslci0u5FQ?=
 =?us-ascii?Q?WEOeAggfurQ3kYFmNzFT7gfcblj6saklswKqouTgPjQNbHiWVGPTuNYFouUB?=
 =?us-ascii?Q?mo5WSFVFoInW7i88nQZfWwfxm+89jLNovK1Ym+nGUOKNGOfbqcCzMOS2y3yv?=
 =?us-ascii?Q?YBEr60UCTmI8uDCoadzQZR0L9OQ5SRIkuuR39V/cUAhZQ44DjlUxotAAJgTc?=
 =?us-ascii?Q?oPupKiLMpqYistGYccfSzCOsXoy/7HZTa7xcGlEWJptNm3vDAUSHqN1F0Gjy?=
 =?us-ascii?Q?iXi3Oa43zI1KSU6ShpF7PH3o/bT9W8Ys0HrEFsqSKrsHwov1mm7FIxdPcZG9?=
 =?us-ascii?Q?dZSJ8l4Fzh0oo7WJ4NwSENXCLLllfcr/ktVzzESM1KBiIPvu3Is+fkKoVyli?=
 =?us-ascii?Q?T9tJRvj25Nm7Qn85cnZP8cr9+Jw2w61yM9oSnTkWoZi3NMZ3/6Xm+72YwMdt?=
 =?us-ascii?Q?wADSEUmkGMuu/60dn+ObKrpPYx6OjEvA/OiZ8v93LrRiaRk1NwFcpB2Je19W?=
 =?us-ascii?Q?D+q+6u88Ml+XmZL7K2JMvVGXWmelFL1G2jiXi/ypA5JbAVCs7n58N/tIT1Tn?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f2f8e7-917c-4005-9e2f-08de37b41122
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 06:19:25.6040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rm7jKcQCE77spcBK70aPvJL8mKV2oknfx/X13we2rmtn8DjJnpPy/LNWE/YBcU+sHvKEaAz5rVdStQNgt08IpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8452
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

On Tue, Dec 09, 2025 at 11:08:16PM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Nguyen, Brian3 <brian3.nguyen@intel.com>
> > Sent: 10 December 2025 07:15
> > To: intel-xe@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> > Summers, Stuart <stuart.summers@intel.com>; Auld, Matthew
> > <matthew.auld@intel.com>
> > Subject: [PATCH v5 09/10] drm/xe: Optimize flushing of L2$ by skipping
> > unnecessary page reclaim
> > 
> > There are additional hardware managed L2$ flushing such as the transient
> > display. In those scenarios, page reclamation is unnecessary resulting in
> > redundant cacheline flushes, so skip over those corresponding ranges.
> > 
> > v2:
> >  - Elaborated on reasoning for page reclamation skip based on
> >    Tejas's discussion. (Matthew A, Tejas)
> > 
> > v3:
> >  - Removed MEDIA_IS_ON due to racy condition resulting in removal of
> >    relevant registers and values. (Matthew A)
> >  - Moved l3 policy access to xe_pat. (Matthew A)
> > 
> > v4:
> >  - Updated comments based on previous change. (Tejas)
> >  - Move back PAT index macros to xe_pat.c.
> > 
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_page_reclaim.c | 32
> > ++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_page_reclaim.h
> > |  3 +++
> >  drivers/gpu/drm/xe/xe_pat.c          |  8 +++++++
> >  drivers/gpu/drm/xe/xe_pat.h          | 10 +++++++++
> >  drivers/gpu/drm/xe/xe_pt.c           |  3 ++-
> >  5 files changed, 55 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > index 0cce5ad2e33b..fd8c33761127 100644
> > --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > @@ -13,8 +13,40 @@
> >  #include "regs/xe_gt_regs.h"
> >  #include "xe_assert.h"
> >  #include "xe_macros.h"
> > +#include "xe_mmio.h"
> > +#include "xe_pat.h"
> >  #include "xe_sa.h"
> >  #include "xe_tlb_inval_types.h"
> > +#include "xe_vm.h"
> > +
> > +/**
> > + * xe_page_reclaim_skip() - Decide whether PRL should be skipped for a
> > +VMA
> > + * @tile: Tile owning the VMA
> > + * @vma: VMA under consideration
> > + *
> > + * PPC flushing may be handled by HW for specific PAT encodings.
> > + * Skip PPC flushing/Page Reclaim for scenarios below due to redundant
> > + * flushes.
> > + * - pat_index is transient display (1)
> > + *
> > + * Return: true when page reclamation is unnecessary, false otherwise.
> > + */
> > +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma) {
> > +	u8 l3_policy;
> > +
> > +	l3_policy = xe_pat_index_get_l3_policy(tile->xe, vma->attr.pat_index);
> > +
> > +	/*
> > +	 *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
> > +	 * Transient display flushes is taken care by HW, l3_policy = 1.
> > +	 *
> > +	 * HW will sequence these transient flushes at various sync points so
> > +	 * any event of page reclamation will hit these sync points before
> > +	 * page reclamation could execute.
> > +	 */
> > +	return (l3_policy == XE_L3_POLICY_XD); }
> 
> I think you do not want to skip anything here as far current HW capabilities concerned on upstream. Though normal flow of transient display flush by KMD driver will flush, you cant be sure and you need to flush full at page reclamation. The idea of skipping came because of HW capability to flush which is not there in any of upstream platforms. Probably we can drop this patch itself!

Well maybe (?) - tbh I haven't the spec on this skipping.

But if any upstream platform correctly reports a cap, future platforms
report the different cap, completely reasonable to merge now.

Hoe about a bspec link in the commit...

e.g.

Bspec: <number>

So we can all get on the same page.

Matt

> 
> Tejas
> > 
> >  /**
> >   * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
> > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > index f5f07e2e114f..0faea29f3964 100644
> > --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > @@ -18,6 +18,8 @@
> > 
> >  struct xe_tlb_inval;
> >  struct xe_tlb_inval_fence;
> > +struct xe_tile;
> > +struct xe_vma;
> > 
> >  struct xe_guc_page_reclaim_entry {
> >  	u64 qw;
> > @@ -68,6 +70,7 @@ static inline bool xe_page_reclaim_list_valid(struct
> > xe_page_reclaim_list *prl)
> >  	       prl->num_entries != XE_PAGE_RECLAIM_INVALID_LIST;  }
> > 
> > +bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma);
> >  struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval
> > *tlb_inval,
> >  						   struct xe_page_reclaim_list
> > *prl,
> >  						   struct xe_tlb_inval_fence
> > *fence); diff --git a/drivers/gpu/drm/xe/xe_pat.c
> > b/drivers/gpu/drm/xe/xe_pat.c index 6f48d34711a6..2c3375e0250b
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -9,6 +9,7 @@
> > 
> >  #include <generated/xe_wa_oob.h>
> > 
> > +#include "regs/xe_gt_regs.h"
> >  #include "regs/xe_reg_defs.h"
> >  #include "xe_assert.h"
> >  #include "xe_device.h"
> > @@ -231,6 +232,13 @@ bool xe_pat_index_get_comp_en(struct xe_device
> > *xe, u16 pat_index)
> >  	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);  }
> > 
> > +u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index) {
> > +	WARN_ON(pat_index >= xe->pat.n_entries);
> > +
> > +	return REG_FIELD_GET(XE2_L3_POLICY, xe-
> > >pat.table[pat_index].value); }
> > +
> >  static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
> > table[],
> >  			int n_entries)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index 5749a488d9a9..d5dadfb7f924 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -69,4 +69,14 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> > *xe, u16 pat_index);
> >   */
> >  bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> > 
> > +#define XE_L3_POLICY_WB		0 /* Write-back */
> > +#define XE_L3_POLICY_XD		1 /* WB - Transient Display */
> > +#define XE_L3_POLICY_UC		3 /* Uncached */
> > +/**
> > + * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_index.
> > + * @xe: xe device
> > + * @pat_index: The pat_index to query
> > + */
> > +u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c index
> > 78e2f037f8e1..43426979b164 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -2030,7 +2030,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >  		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > 
> >  	/* Page reclaim may not be needed due to other features, so skip the
> > corresponding VMA */
> > -	pt_op->prl = (xe_page_reclaim_list_valid(&pt_update_ops->prl)) ?
> > &pt_update_ops->prl : NULL;
> > +	pt_op->prl = (xe_page_reclaim_list_valid(&pt_update_ops->prl) &&
> > +		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl :
> > NULL;
> > 
> >  	err = vma_reserve_fences(tile_to_xe(tile), vma);
> >  	if (err)
> > --
> > 2.52.0
> 
