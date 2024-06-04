Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26628C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 21:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD80010E0F0;
	Tue,  4 Jun 2024 21:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVvJyAM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37B910E0F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717536076; x=1749072076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jdg4Jlaehzlg1Sdny1oEhBfDEubf1irCk7w6WqOzGmg=;
 b=DVvJyAM6PdI0ORsBW5ThBD6I1GJPrdNnoZY8JQDU+GrYQop11U01Mbiv
 OzT1mjZvVptTvO4HyrDRR0WK5bhLlI+LK03LERCdJke50m3d/LYoWVr82
 RCacMB+IyVEJF2gsw8qdSxf6eUkVmQ4t6nqUuLBEg58F1tbzE+vEVZkoh
 N8uc/k5inivzPDYIjqQJOJEUPSIw04q9gyrKl9ylf4fjaQ8P7e8HFX9x5
 bKA5Z4GYclS4bD5o5iGSUNBGaV1e+zwIc9P7+jRuehM7RYRWa5EuKtKB6
 ZiKtMvq+a+NRjvqYG96aJtT18spKFN03da18/QiV6/PkpA7nJrE4sLZDY g==;
X-CSE-ConnectionGUID: 6Fg0sGjNQey0x0Gflq+5pQ==
X-CSE-MsgGUID: MEE0kyd3SfGAvpOpZ5ASdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25518025"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="25518025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:21:15 -0700
X-CSE-ConnectionGUID: Hw0mJpmYQ0imXm4qw88TfQ==
X-CSE-MsgGUID: mLlTo/9jTz2Tnz7lkD8+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41917232"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 14:21:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 14:21:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 14:21:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 14:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVqEuKjyVRCtay8WE1nfK7iaoBZ2Qn/O4rbs6lrl9nCyCXnWn/iKFY3DwK2YTpkNRddnC7+ACfFrREYGkURc9tasugcV0L0IDmOgajT/sS4u8TWGO/XgoIOOO3w/6m76B1WMrahJhMCbADUsZ2lWwalUKedMTEdYegP8XGRMmFSeZ6l2ZaxczitFcZdNv+WBLrdgKzAGeDkDyNNzoQYLcf+wDOPBN8aXQuNRXfRzs7KFx38/PqmVzQFXlNCqwBUX6Dln3QiXEKJ1DzeK6YeGMKBMTWaoCvdTvbwqrs13L7WEmjAwWjPCUjsKGqbmPLI9v+nlopgAqJ4nRdoN3TIrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jdg4Jlaehzlg1Sdny1oEhBfDEubf1irCk7w6WqOzGmg=;
 b=fQQzl0IdT+pboOUmewQ1htFbNaqK2o1b876QdcMxtazc3I/1nEVwcHsuCS0T0zL+7WTLaHVX/N3+tdtHcrA0IKAjEuvScD4nUaXIrtseirfjr4sNxQhQ8cUB97ZZQdP9/2ja5AKrhZ19k9nCtJ5cLxiaoxLlgO9KJzm+4mrqIeFpYLq0rOfhiohfyx8MDenuNSo+XA9jrE6oMSIkDNJ0YPeXkuaafvc+JXH5eYhLnfTlFpEF/Zu8vU2fLQX49tHrw5Ut5q1PFyei3aDHtlZKPSdWSkY70OdxRkehm4KlQgnnKtZ44SBLjXpboXrpiElN+UbndNcQlURmyW7ERijBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 21:21:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 21:21:12 +0000
Date: Tue, 4 Jun 2024 16:21:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, <gregory.f.germano@intel.com>, "Vitasta
 Wattal" <vitasta.wattal@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Add PCI IDs
Message-ID: <t3iomfnitxsag5zzgphoo2bdw2zqnfjrb65ql7dd23dsgaqlny@grzcncimpr3w>
References: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
 <87mso1cexk.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87mso1cexk.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0371.namprd04.prod.outlook.com
 (2603:10b6:303:81::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 8585284f-d71a-401e-8f39-08dc84dc42b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VYc4n5hWbbPOkTdzWHp/AQZAj+u5yCNVuJEsJyoZcG7Kc5zZwBwwJFowaU5z?=
 =?us-ascii?Q?ID56x3HXjVQOUg74Y/QVT0sgCWnDoe8BF3mnlqUVEvWCiKEj3Jfk+xIiuATw?=
 =?us-ascii?Q?3TI8gYOIkciLqCBXhIUk3S819jdxSP6C6R5pPAFKUCH8HrbGxdlLixTmiZkq?=
 =?us-ascii?Q?fejNlC3cDjkmShMgaHEkEYfwdgFYcZvHH4AdMLa4yiO/xPDfTUhlFmvuuhP0?=
 =?us-ascii?Q?jjMM4DBe0htL/iI0UE8BxqEE3Tkc0AafZ36zsL/F2O5evg5w+htYKp7aINwT?=
 =?us-ascii?Q?y4uHzxgSdDU957Izn2stcoIA8AskAPNZK/Z5IfdWzqF1fLXp554rRIIV9lBq?=
 =?us-ascii?Q?9y1Z4LxDoRDfsLvDvo6I07WKJdze1y3T/awcxFQsROLwSbbUKPJ0h5Pys+5r?=
 =?us-ascii?Q?PsGo2u8DjcXAS9u/z/NM0VPUy7maSYnqF7/G3y2ygXqEXalLKAp54HQXPOsG?=
 =?us-ascii?Q?UZxL8EZNJQ84wGBvfMJAOxTRGx4Yi/H9ZlYgeILwedUHxF/gKJ/zMHg4bAYI?=
 =?us-ascii?Q?Bx/m8vKIDE2VBXipASac3P2vTVJ2aaskun9ohyYO1M6dy6dXaq83wm+50I27?=
 =?us-ascii?Q?Y2X94hdnMejmoVCwPPFXZKDJLh+FLH3Cn9ZaVLZkuTz8ELH3vwJqI21y+0vt?=
 =?us-ascii?Q?/5IpoGZtwawg30DWjwvKj6MoRNDbdetJxCNss/c2eWl+/apWFiZ61HgsssUY?=
 =?us-ascii?Q?p5+stn1W8+Lh6VwEgLy2I+CLvpV3W72kfEwLngb2YOkTMKRkvayWgoUWlujP?=
 =?us-ascii?Q?4lsciILGJOmeVDrkJOdOJaf3HCuTtfzqnA9Z00sDKupLnvhxa1C/sxfG+cR/?=
 =?us-ascii?Q?fIUsQLHxeW0Ni5aObtlMlpDGSkJIzvnUhhJ4cT6X8oFkxiLKCr5yZx/F47Da?=
 =?us-ascii?Q?AxSbzJz2LqD/l0FyMTQKzxVCs/rxTsMtk+hz00SXB+fgd1I5nguuDfHB5zRG?=
 =?us-ascii?Q?o/QY+qQex60r87jPrmaP/NVHCRNXE+QwC3jwSbiIXxmBlU+wSUfyIjuT9bkq?=
 =?us-ascii?Q?qKEknsyewgv0fuv5mH2qIPegjyd5BiAlOds5V1IPY72fxSSckef5wdARHgzF?=
 =?us-ascii?Q?1hcldiHw8481sNglR/4pBn8c5fbsqflm6WszFjzaiPeMLPlqqf76Fh4alFbK?=
 =?us-ascii?Q?tFDgIO2oCR4hCVCZpbQ01A3kLsLeC4VI56H2Uf1BYo0aiEquyojQnsCDGW0B?=
 =?us-ascii?Q?a3QCXjjklqF7+M3Xs4ZYAt8PKXNv2M/bRXe/gHE5jhD1x72/b0ZD/GE0QuJQ?=
 =?us-ascii?Q?oapBNJtL0SJ2aNEONPLFKBnagQOD2ctAeOMDpGqBIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w7fsOcIlib2nExCxX2ZhCvMERECMnZ7tzXsg6xcPMuqJzS7ATqbHk/1knrMm?=
 =?us-ascii?Q?mru1bKXxrnP7rpShH42Bp3Oexj3/4TjEM1NuWVv5zIN6q6ZaTgnQ+B4I1BlK?=
 =?us-ascii?Q?10JndIa1WgNb+/SZCtymvfvUUKo/nh524NbxlV26f5NtpuWhG7GFSubxr2tD?=
 =?us-ascii?Q?XNi1OWZu07Zlj5I9ZgxXuIV0K0kTX71T+F/LySfgbJ6FZqK2uQ9YW3j2P/h4?=
 =?us-ascii?Q?fwLJsOa3NC+qXJhrSggOBO9ESqa/JvF0gSY3slUURE0AGaZu20UQeaR+MvHB?=
 =?us-ascii?Q?3Mm/ql/Lx33P0VSOmRscKAQ7icFB7+qsrKkP6arRz0auUxbXYuYYCWFQaeaj?=
 =?us-ascii?Q?9RRqdmCmbN0hfJC4oM4nyhtJjQ9T5acQ3SYEyEmuzoE28grslRVaH+W/It8s?=
 =?us-ascii?Q?SAIzEck0O50X1sQbKepFDmQ57K/hU9PMrfdGixe123yuaoNV66Dq5jX1ufTR?=
 =?us-ascii?Q?mq+EbH1KW6jl9Aa/DMfjahWdPGwdHJyMyEomfL8oOIzDWdx0pqGChV7ABffj?=
 =?us-ascii?Q?U+PsTY8YZ/W4ggApU0hlFlmtuSsLZM33lFnSKy93KU0xHa3EkJA2mnuoCgLs?=
 =?us-ascii?Q?OSoCTxNpaZDGp3mpXeMYOvbiXPiz5hKZIodpljJyBxsUl9PeI30TTNRUvwjZ?=
 =?us-ascii?Q?6GTi/lox8JLkWJnlFMcuUjzQKGVep12TdSEJ2ukObE6g68VcQHoQQNJGWJvv?=
 =?us-ascii?Q?KmR++SxU+bPAKBHoV1ZrGtwMmlNvHVRNupUvtxbUy54AbucIpn+9RZWW4I/3?=
 =?us-ascii?Q?97QTqHuk4qXGdQEJBR8bSCYrX8yLvwkFErJTpbuVl6BUlok3fr88Qwse9FNz?=
 =?us-ascii?Q?0ynI/jpkWZKcQi711M2jwF4tGSSOHIgEum4CUtTMOjXMWCNUNPKcpJnivHWe?=
 =?us-ascii?Q?Ae4dGiPTwFO29dA8iXaD7wktRnmZiPqlI5/ItlHG6+FdtY2s2ai4y733Ds29?=
 =?us-ascii?Q?dXWecLmAEuHEKE8ZyjgcIHwtl3ueW0vyHGx2YPbPm+ysAKZLNA6LBT3Vzr19?=
 =?us-ascii?Q?+EROH+VLCATgj1bcUTObSa9nOOB/IIGW3VwsU0Q3Qtmb4HMaFiYUqQUuBIuB?=
 =?us-ascii?Q?65nfrIyTrw8wNF5uFocIv0lUTeJyayGF14sl22vNmKvxLlc0s1OAVjw3kF9w?=
 =?us-ascii?Q?HfTg8aFfdmK25lZ55PWe7ZKYQ9tTNtbN62NZ4BzXDSnacIHRIRSxg3of+I3e?=
 =?us-ascii?Q?/Mz75Bum1Mm6EvG7239bcDISRoap8dOe0GzL+AaZQmh/ShV27LPbLXDMwvmH?=
 =?us-ascii?Q?WLzGCJ7M+jIFfudHIHhO37Qgcjr8MJGQM3DznlQLsHEyEa0NEeHJF2t8Qe5S?=
 =?us-ascii?Q?S4wIbqWbJoexhesUaBokUNuGUc75MpAlrVeCRUL9toTx6FmWTIf58XWPpmg+?=
 =?us-ascii?Q?mZWduXbZB/owZfKpf19jymuJ8Hj/+92c78gE7/qzICICe9+rA+kcqda7cBoZ?=
 =?us-ascii?Q?1DrlHeU2wUUwKU7+Yogg3oNPilQl7cmHyXIoeK11MrSJpTF3UxVxjv6DsmWR?=
 =?us-ascii?Q?fj915r2qzjQEjqYC/vqdUqcuj6De5kAvFyHVUD+so3OpafHgSYnNNRC+0m+O?=
 =?us-ascii?Q?qF2MN3l6QAKCq/0xNCsZZfR9tkmRyGaZ8Gu1Z54tKQykliHaUhageev1Matz?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8585284f-d71a-401e-8f39-08dc84dc42b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 21:21:12.8261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bWswt8Q9zI02bPM5Zk2jIJ+9xD2PGw+UuBJ1XAzcBWLr09MnjUZwGcPtwIhf3GpHH2ap9tCpwN++v8Bg8LJcyfpcA6HuyC7xq23JZeUtco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

On Tue, Jun 04, 2024 at 11:03:51AM GMT, Jani Nikula wrote:
>On Mon, 03 Jun 2024, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Add the initial set of device IDs for Battlemage.
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>
>Please note that since commit 54836ee194f9 ("drm/i915/display: change
>display probe to identify GMD ID based platforms") you'll also need to
>add the PCI IDs to i915_pciids.h and add the platform desc in
>i915/display/intel_display_device.c for display probe.

that was not the plan when we started xe_pciids.h. Now that display side
will use pci id to find a static desc, I think there's no point in
keeping the headers separate. Should we unify them?

Lucas De Marchi
