Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CB8CAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 21:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C0110E4AE;
	Mon, 29 Sep 2025 21:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUajK/0b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F90C10E4A9
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759181157; x=1790717157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PosANz3W4nzZtjFwhjOVWrM9BC8JuLhNwtJnbLtw9Ek=;
 b=nUajK/0b0y88uxxYp3y+GO3h0elzMHE0+/xE7A/vPrtXaNFjjspu1kb4
 VoIwLi9z7hJ3f5SmjXBS5+r0ykDlSd3FbftI/T+PLziGKj8dQOWcSfLkh
 +yMWApF78SNQehw8LEINh4NCbS6hh8rD8JVqdFUy+HMAJre4nRCOwZKyX
 aGVzIpTRIA2V5Sexy/c1tLb43lOaWIouMTXlwFReU2w2Y45iNZar+Xc80
 Cnj4YhbspYye3orlO+E4DOmMMHBpFgDhibeA24L0dTje2tD4IyBan/Coo
 M6j9rDzqm+DqDGHjFuNxjHllwxl+x0QHzgkN5ElH5cidRcjGaSSjAjVV0 Q==;
X-CSE-ConnectionGUID: 5dCkzvI3QjG/U6FFe4aRFg==
X-CSE-MsgGUID: 0fpOzp/VRsSDbqnZ8xaHBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61540392"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61540392"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:25:57 -0700
X-CSE-ConnectionGUID: R66T7b3BRmSFJ2Q/SPuclQ==
X-CSE-MsgGUID: RGFGTf9aRdmKRDDtMaY03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178765515"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:25:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:25:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:25:56 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:25:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3Eq40fV7rnnrUODVYfGeEDwL3hajEEDIIfHGnEnWbomqs+xsLT1FGboVqPEOQ0Eb4l71mnmJBnMwEerSUhhVYjMbNAxFvRrRvS1Y47mu/f2/WZ0Iaoj5riu2ODXhSMhBvofcH5/aylUPjvRnVWsnK2ZpNvIxlbTuDWcmSWKJnmDjJV02FiSWpF3HMLuPqWy3OafqugSNKWpIDF7LWiO1PuGa6snfCjNIYmZQGGEE725pvBZq0KR1uZgAjTNhz4FA3cHkeoLoBkXtyu7oFX1NvZ5MvPt8JcjHjIfZpRgSQ7mChGRNN6/KEsF2CVkZ+4T4yvh2DG1G8RDURstCSBODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArHS/m5jznba9E1Q2KPco5ZrlzphMOcfe5jzYe2OxQw=;
 b=LI8GgjG5AUzi5N6YKDPC5gv1cB07aE5EsYM6jS0PXvpl0znmuXgGE4FbWsGwrXZdlpDhnrS+fWRXgiLZ38KgQ/i8P8wCe2yCQo3ZheSFzyW/BeYUzb06wKXjQvX8nyn4GyVE5jyQcxpo6MYlY36l0ZVompm8x5FP6Q0nR6iOJiQBzoy9R97x3p5Q4pjr5bbmw68oB3Vusa4+kDijh1HgffcjPpWSUgg+VRX6N9qSO6Sa9MZswQvmsMWwy4/LiSeWuqGx5cU1AWpWanFI0ZZozI61HZBTvvhHkNVpxXk2K6o+Tk9L8mFXcobUW2AACvfIQ+Ux89lR7N41/hDMHyrmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA3PR11MB9061.namprd11.prod.outlook.com (2603:10b6:208:57c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 29 Sep
 2025 21:25:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:25:52 +0000
Date: Mon, 29 Sep 2025 14:25:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Message-ID: <20250929212549.GF10167@mdroper-desk1.amr.corp.intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-32-matthew.d.roper@intel.com>
 <SJ1PR11MB6204A152184AE9D2C4A0C5D2811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204A152184AE9D2C4A0C5D2811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA3PR11MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 652043d7-cd82-4457-034d-08ddff9ec42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LGLd8d9xUdS9ZkxoINrnDl0sw+paFNhdG2THUbrB4d87+NEJMQUlpRaPEghw?=
 =?us-ascii?Q?PisZo5MgkXUDWEJGASmQe36/GuFQ/4s4Gv+Tc2/i0UefbVFoTIGbcSGoa9IQ?=
 =?us-ascii?Q?CaDGgQ4bZNSW7zDEZLga5hhpxyFYUExeP8cR8jwkcwptSU6G7Yauc6GOo9Pg?=
 =?us-ascii?Q?Ng/FwnsIkpNRfGfxfOPHT58+rhXAJvXoBGXCe871WEh/FBh4NbHPJgpy5c/w?=
 =?us-ascii?Q?P6LjbzpQSwY/hgUEYl7f2PdU8iP+I/HHOklFos1e22fdHNz7MYNna8T+oY9c?=
 =?us-ascii?Q?FaLrUABiSZ6I/KYJuD87ayGnK9j6kqvl4+c4OmNNJ0XjzsA4Q43Ax0FItcVP?=
 =?us-ascii?Q?0Wb1Ajz0xo27854lX3HtMZT03uUowMEhKyHc+sq+MZUOsmYaPf+TKAH6PWuF?=
 =?us-ascii?Q?bADPiQgAuSmXoiPV5wUYEbSGdzE7TEh2Q3dAVbHSTRsPLyaV+9o5FmjTin4V?=
 =?us-ascii?Q?Y7mToBVaNezGOSvwRVWUXlhG1JbOEjCk9mHHyML+Vj9DiS6u4mSNXdkdXAmP?=
 =?us-ascii?Q?oPVXngp0N0qI9eRAyJq8PdIg5Cgyb5HDpzOBFtjTWMKGybYRNvXxGTLlmYFM?=
 =?us-ascii?Q?s1anE6lhfjytYi5WTuOfY8M2PG3XXHg9EgkSEiFKr9vmVpBFybOK4+s+EYR4?=
 =?us-ascii?Q?nvBrHmBo3Iu5DYabLRHSnqhUIrYKNYRz/CZIehbUE1sTljKbvGEwIFHb6rUA?=
 =?us-ascii?Q?motwTGLAmX+sqlE+5cpMGUuWV2bPM9CD9/iSUU67xc6RcoV1pzcATuYLKf0M?=
 =?us-ascii?Q?zuiSZP8puiURRhi9MLZ01Ya7NbneHOCVEm6WvaM9+FNEoAWG0eP1ddqW8CGP?=
 =?us-ascii?Q?Shbh2tiYmvdPrGoXT8f50PIxLV1sn1hNBPvTyO+aMh7h3gZp01K09bHLpvay?=
 =?us-ascii?Q?DTTsZvkmumTOi/NSxJ4EnSIWy5lcmLZ/K/8v1TlnyOaX6wySJ4gaE79oh2Oe?=
 =?us-ascii?Q?r6YLxJc59w4OyMn9cho1v2rwlicJK/Ty66dX0dTmQf1fU4O7OmP3vlCWv7Zk?=
 =?us-ascii?Q?QjkE83EkYIcMogFr+84xH2Q8+u6/nNtIkPZXIbMWT2+Aw6my5ifDLYiQ34me?=
 =?us-ascii?Q?2DOCs3V6/mmOjWfwVW95IKJlmzApyDRtjqKa8k58NYEEsC9AMEiIt0+zmny/?=
 =?us-ascii?Q?4VewFdleUjdzXN7eTfJfCNyywKDVM8mCAexwJpOI+jtO65vXiTdTfPkxmfD3?=
 =?us-ascii?Q?S+ktCzZJsHi3dskW+TIQCBRBXP7wxO36VxNVciGJlXIJN4X+odLigyTR/UQX?=
 =?us-ascii?Q?QDZz2bj/4rcCzt10PKMnZ+YsjUZzDcqOPxUc/1P1IoluNbBqYBNDaDG/OmDi?=
 =?us-ascii?Q?5dxt6+JroYFSyGU4VKFSpKgJiamZu/Faa40kCJX52WdT2OheL0ClQPKxIhC2?=
 =?us-ascii?Q?5/TBclikYfx1G5PYK7IeNaomx6pLne9bXQdP2/vV1N4K0Rjuyv/Ea8KXt5OT?=
 =?us-ascii?Q?MefnaEl9f8KwgIRs4rhirR0aCCSqaeIb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PzcxT7SJdeHy/qkHrjYBQGl6CkOJa5crO8HfgTk2CUq8XD7Ceu+hbPnqYRAI?=
 =?us-ascii?Q?6DTHaxeZ+H4fRX3WShVrTNrXdVtJ40wtmc536gw6NuSQnmHd+MVmpqNp9Q5D?=
 =?us-ascii?Q?uwMVOonU69rY9kN4Fu19FCjk3zCOBflnywNrmFkGeSRycM5dF5rDquLoMRrc?=
 =?us-ascii?Q?8Wa5GkNNDMkgtv0zytIdrMjEt+EUqoYRP3Jii3w4eykF+sQ+6ire+VoOM9Dy?=
 =?us-ascii?Q?plPPaCsdxyYD6SICB4gG9USHbRH7L5ICwT9ScyC/K8jl1Mhwkb24/W+PMrPp?=
 =?us-ascii?Q?yNUZg0O4V4Rz/jcFjJTjEFClWC6y69TQ5iVdPDa0CSqNpyRA9wIqFVtqhLwm?=
 =?us-ascii?Q?jLATC5RZLgctJAraQy6PAiuETO/R3bhZ4cW1GK5wEcrhuIsZ6yZpHCQ9XJI3?=
 =?us-ascii?Q?1GMhBmXgaZFG77BwJvUiaB9w8IRuPbYVyao6oZl5YwLD/4LW7cEb/6notD4t?=
 =?us-ascii?Q?00rUbh6BVWAvyyYtwAO7jrk/xz5zohpn8v+rVMSJ3jJxzZCnNSmP8kqHUJ0F?=
 =?us-ascii?Q?2JfrdXaixfvZOMwash+wAEW32QN7n46A1wDuvaAZmjnCecb2srQnNO+IyvE2?=
 =?us-ascii?Q?keEPYfhE/7aw73CV8RT6bR31bIsfa/KWie9uoKtNOyHbbzAamYeFLYqeOlrx?=
 =?us-ascii?Q?H3wCptDQFPgMyzMF+U3PfyT8zf6/q9CDO0UblMxzxZY9iX5r6ZRe7QZ+vPhI?=
 =?us-ascii?Q?0ahayLGrkEhroRi3PeSgS1lZhTQV7by7agf/V/NUwxL9qL3Jv1R165TBdgUi?=
 =?us-ascii?Q?9YSH7E3Vx8FSlY0eZkf1HX6t4KE9tc4CMwtprHiBrQvuleVTkfzD8LUJHor9?=
 =?us-ascii?Q?Hka+QXJHZ8dl/6k03ABjv5nWC4adYa7jahGR2bjsgrQ/crriqCAiguxojLwr?=
 =?us-ascii?Q?5m7tvo7aXAiRStUM3ofVaGCTwnhZtZWTEKzD0iEUnKAszoLP3TmbWiu4CDyp?=
 =?us-ascii?Q?X1QlIHHGfLQ6FP7UYvavSl1IqSoIaB78Cq0dMw4naxLQzZKyfR1xO7xQT2sb?=
 =?us-ascii?Q?pHD1ZdmL89spUIxiq3ZbBt551rwzu7YpjmLqC43sQ8jhc2I+OhujUnMlsZcR?=
 =?us-ascii?Q?5INBzwhN8BYvjyAmLpBgFnEz4nzGEiUhyxtnDlxnt4l0s7EcINtgJghq68eA?=
 =?us-ascii?Q?JpBb6aCT6H5UC0qUgf48VUMCIqbCeP/jH2c8+3vMaP9fGRbmg9hZA/S5vcrz?=
 =?us-ascii?Q?yj6Q9QcU+tC+LHG0pKpPLThRwP8Mrac8c/6K+/z0Q1mvf65EA/f8uXO0kYGv?=
 =?us-ascii?Q?goin11WZrf+4IAPbzBBh/5RE2GRjwG7n8wvlUuDjhx0GMrcE+GE5Xv7ETHiw?=
 =?us-ascii?Q?J2hKOBOwOWdbTyKsb+QiwWoYm3ELnQjP178iI6LqxDIDIH+CF83H/EM6NfWj?=
 =?us-ascii?Q?Km3ibxy8mGsA5v3Tgp0niFYcDFGCO2/Sj3vTVZT26tbv3rt/FyIcc+oWI5Yr?=
 =?us-ascii?Q?brxtHvI6ZjfQ9Jf8Or+ljIzFxvo3uVf3ptJfGkxBcRUaukmN8vpZBdSReMYE?=
 =?us-ascii?Q?TO7vpSkGyoGi8eSuK5ADa3wc9YbN9g83hHuhrC95QEQi+dxLLAWd69/xonyD?=
 =?us-ascii?Q?pXy1n5+9Tx6zIFdXwS0NO9LglP6dm0qme0F+TXBhSXkrN1igSbeGiWhVL7Cu?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 652043d7-cd82-4457-034d-08ddff9ec42d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:25:51.9881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+u7cqMAp43tY7zL1dmhZNKlJGnt1Y55/I/jRswAk1WPKpm0wzY7Y9VXXuWh+wy2lDBJSeBF5+TNRlh23YSngoHB2ysP3Yh4ld8g6CbBNms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9061
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

On Thu, Sep 25, 2025 at 10:50:18PM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> > Roper
> > Sent: 26 September 2025 05:17
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> > Subject: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary GT is
> > disabled
> > 
> > If the primary GT is disabled via configfs, GT-side L2 and TD cache flushes are
> > unnecessary since nothing is using/filling these caches.
> 
> Is it because PPC/render engine is on primary GT only? And its going to be same way always!

The device cache that we're flushing here (sometimes called L2,
sometimes called L3, depending on what document you're looking at) is
part of the primary GT.  If we've disabled the primary GT via configfs,
then nothing inside that GT (RCS, CCS, BCS, etc.) is active or doing any
memory accesses (no reads or writes), so the cache usually[*] shouldn't
be getting used or require any explicit flushing.

We also simply can't access the registers (0xb404 and 0xb418) if the
primary GT is disabled.

[*] The "usually" here does get derailed a bit by certain workarounds
like Wa_16023588340, which cause CPU writes to VRAM through the BAR to
get cached in the device cache, even if the GT itself is sitting unused.
That aspect of the workaround is only relevant to dgpu platforms though,
and I don't think we expect to allow the primary GT to be disabled on
dgpu's anytime soon due the extra reliance on BCS engines for VRAM
operations on a dgpu.  On an igpu platform there's no VRAM, so no CPU
writes filling the device cache, etc.


Matt

> 
> Tejas
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 09f8a66c9728..bf99792e772c 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1061,6 +1061,8 @@ void xe_device_l2_flush(struct xe_device *xe)
> >  	unsigned int fw_ref;
> > 
> >  	gt = xe_root_mmio_gt(xe);
> > +	if (!gt)
> > +		return;
> > 
> >  	if (!XE_GT_WA(gt, 16023588340))
> >  		return;
> > @@ -1106,6 +1108,9 @@ void xe_device_td_flush(struct xe_device *xe)
> >  		return;
> > 
> >  	root_gt = xe_root_mmio_gt(xe);
> > +	if (!root_gt)
> > +		return;
> > +
> >  	if (XE_GT_WA(root_gt, 16023588340)) {
> >  		/* A transient flush is not sufficient: flush the L2 */
> >  		xe_device_l2_flush(xe);
> > --
> > 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
