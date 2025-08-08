Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109DEC87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 19:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC60E10E978;
	Fri,  8 Aug 2025 19:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOa2sYVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8658110E975
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754680089; x=1786216089;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+8GKzvIOfwh3RinCPHnqsyxMHwt2NOrtAKQ8xiI36PY=;
 b=ZOa2sYVKHlJNP/n65a/Yx3TNmjznJ9Im+paxNJidQhZ2Q8TVGZdgySxQ
 YqzWx+KS+GyQdTjhJrvEGW2IlyltJPD3+GxIw+wXQMGhP8Ao79CeQLCK2
 TkX4JJINWddaXik5psiOY2lwLwb8KpF5H5TR7WKiaY8oWn7XRdHXJyMJl
 NhTTG9UxSfjT4jv8W/gjeDFQoHxrpZS8oHcodUkkZlIUkZGRiJGkHMXmu
 2D8Jt34PUuG54UsaZSz5NEx+NHDGeYEzViTlQlJiMwHluDauaUsBf75Gw
 IWrPuUj0/yj56ZScha+MnQd0IEvOKpHdA8t63X4b1bzUUq2WfNMnwgkNk w==;
X-CSE-ConnectionGUID: kQvcXU+SRNuYbUo1VzJJ0g==
X-CSE-MsgGUID: uoL0z68VTT2VFC1kxJkpYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56069532"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56069532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 12:08:09 -0700
X-CSE-ConnectionGUID: 4e7xmLLaTnKrIX6ilMXijA==
X-CSE-MsgGUID: rQhyxSz3TFCFI0SvwGNPsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169625309"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 12:08:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 12:08:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 12:08:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.83)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 12:08:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLmcRb4VrPaDE4/RiMAeSOKLGCqA2qZPZ6BcDoidNWPXRgKxK8KlAluJyGjbtJ/ha6dvNXPR55KJzkHAVo2ih/B+ltwKcjP6K2YkR/xYigMg+fLtkwPFVw0W5DqYytHUcsyHZrf2n62/uMUV5aR/KD/1S+MnwAeEvuxreo9Z3wR6M8liUozelpr0HcwyMDsAUP9vi++3bFpn88Oo4B+pwLt1zk2ela2SbW2mKcchNQNJ/NS5xCIN5a7bsyu3ts4QDs+j4KwWX0UYdRgZZIHwFFP1zZGtftql+YTioC9R5B36Eg1SfmIMZbJKO81nN6r4/YYUid4wG+zKGpKs8lxRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8pU5ggevSVOqOoFQ8ysozqYS8EHa2xSTn9cQjbSyE0=;
 b=bDQ/P4T8kXC5QPjnFFub7DrWwD7Cwu9zcECPH19XMTxgX0c4Ahnjor4+tpGfom7Wk4uMJgIVxsD1xkbDe1sUtp3Kz/oIqfugpyfzJTNhhtcj4bpEpJYpF80tBgG/T89cYc9MhKXN+/XLXB+O10hfQXR22YLBLTrbZY9snAFpaJ393AYjmLPHZouiJFQDgNH9Q0I5mG/P2FBAtXf3bX3jNTxmNqMLk8m6eQXqNAnYvfOvS+IJw/4TeuGXYVTKwDA19bvJ2K9U+DH5hPeWyNgPQrX2ftBnJ4RoaeRZ8097cH8DDO0PuC7dYOl/4HH+lPA/Xw6aIEcO209WbC+e1BrqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 19:08:06 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 19:08:06 +0000
Date: Fri, 8 Aug 2025 12:07:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH] drm/xe: GPU frequency tracing support
Message-ID: <aJZLB3MOA7zPCovV@lstrano-desk.jf.intel.com>
References: <20250808161920.3542415-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808161920.3542415-1-s.sebinraj@intel.com>
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c39cf0-11d3-459b-5043-08ddd6aee82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iJvrK8tmQe04zZkq8XWS+WZJiEpioVBKUjwZkN5lJOiQzrOQG76i6JuRuV?=
 =?iso-8859-1?Q?Wuf6efI/z3adbqgb6AIQ30tB2kS5InnV+5Ls1VNhE8KQiVqC4y0JWzfU0w?=
 =?iso-8859-1?Q?fNeYX/v2YEvbNVjFM14tuW4QI6ry4qAEXy4GkYb9sU35HAPg+qhi/qYYtG?=
 =?iso-8859-1?Q?VS9/W2cpq5uIhM9Qm1+1eEyBf6cKbuMCuBR8yUodRlLM9+S88cFyzrFmV0?=
 =?iso-8859-1?Q?uTSN1OBhz+x+75KQvD+aPXQiO3tWv95QBvuFvxhiEWAhgDqJVmKGveNtAA?=
 =?iso-8859-1?Q?utrFgCPjBSw4eU0ehxipteS5qYCezzMj5QumY4RxvBa6WGiAZ63Ye0ZVPz?=
 =?iso-8859-1?Q?qlMVAwnIlHJ3xjWrPsLRIxbIj64xbtmf7ahzkrrb6In12hWFHhVmHK9ZfW?=
 =?iso-8859-1?Q?ffmK67j/5NPqOW0wLEzyXBPgdtnqJGXXmhenlER8FfhaYvSSpU77MigXpm?=
 =?iso-8859-1?Q?ym4+4ma8tRPoNO1ubT0Of4iqyCz3yu03aG9DT7ny6XUc2KSnZp8gIu8c/6?=
 =?iso-8859-1?Q?rYiLv3hfYB+1aLECDEgm9vgYFqcfcssdZeX0+etY5dpY9eH/LKFBYuh8kn?=
 =?iso-8859-1?Q?bYAHmq9f7/zO9eGCKKjYoQ+MInjj0N5UsEDpIW06wROzV2/irBRkJRp8fV?=
 =?iso-8859-1?Q?03h6V6vv9ucy/dwaLwn1Drz9Qg/wUdyNoaBPXH4DI9TBEmhyIytu5ozg02?=
 =?iso-8859-1?Q?4ZmFKlWzi0/EVfSpoGeKOadMelqxYzjshXQfPpjiQiWkmpMMjcNKgBQmIK?=
 =?iso-8859-1?Q?XdCYVcz8nVzqmu96L/FHoENo+JCjS3hsHMBq719eLZuKaye5QNd0RUX872?=
 =?iso-8859-1?Q?ykB1svlKrBht9DZ8nSUdbn+bmk/3tSEpprjv4zLJjM6bFNNCQFBGFjG3V9?=
 =?iso-8859-1?Q?CzF0mMgJIUMvY+w6pu/I1JqNtvUlKma6z3i0N1Rcd2QYqaE8JiPSj/DfoE?=
 =?iso-8859-1?Q?5EzxjreXpm+siRj0iVVy38DkmFcZeIDx0DxZlQV996dirpCL83amX9tHx7?=
 =?iso-8859-1?Q?c1FvE9LpZEiVV9xCinJn5Quau6fiNzpVFpIq9NpI0xetvttm29wCSjAXwg?=
 =?iso-8859-1?Q?3fKIqwhK+y5rh5m8Scb9EE/qQErG4y5IEYuACNUi0bC6JYF72CU6C4Gsbq?=
 =?iso-8859-1?Q?vk7QYpgCq2XvPLdrQ+OPUBaD5bL78x0lxv5X2gs4qCOws5QYHFxlrtFOHG?=
 =?iso-8859-1?Q?wzCOiyrUL+s5h/dStD6FlfcupfEIyEuRrjquY3EcYAW3e7JUcCA0ioAJZT?=
 =?iso-8859-1?Q?roOxAtaSwhPub8Ui36XDH+gBTBTT2XAL0A2HN6WrIRDxZJIQ/8dyR4Lqxu?=
 =?iso-8859-1?Q?pR2OcqHDYrGcpvTMmH/XVwXeqYpd5Lx4lIQHLW3bV9Hi1q0zbYaMIF/C21?=
 =?iso-8859-1?Q?BQSzhdZFmD8QhuvhoKvPUxheXU0dr6zO5M2tI2DQkvRqlYLUAy3D7LDh7x?=
 =?iso-8859-1?Q?HPZazNPtdEgsiLkjEFGN0P5QNcSXjXeDS8ddzD00fFVQ8na/+z/E5OsduJ?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mpBaP+s4an++h8Ys2yDGKgrZeDMkCSIn8x5KBGlG8ZYljglID1Ghoj6EOB?=
 =?iso-8859-1?Q?FS1Ncea9FIU5FmReBO1X0iLIp39Juv3zau6Qu9en4lG+lgdZDCAaOXOI2X?=
 =?iso-8859-1?Q?WBN2y4iehLf+8o6TcnMZ6Ozz+1TLY8hO4WzugLLxB6zb1QENnBen6CBoCR?=
 =?iso-8859-1?Q?2bMeQweQJ1z9xsNsC5kJsbMCYufFDjtBPl8XjtV1m3+91oknOcQwnrKP8L?=
 =?iso-8859-1?Q?M8QMzWTFgioTQji2F+b8f1ZJFLe+eohRwACZD39RdeQe5Y7Qcp+R3NDush?=
 =?iso-8859-1?Q?gPS+lqqFXUtVhd9yRLm5y9VeuiOH4oY5xdqsPOknSII+zYwT2v1ZXO/ZXR?=
 =?iso-8859-1?Q?K8jMeUbntLRF+wfoHDZInUOb7iZiNYNQI8Q4O52REOlTI6HkkZKrQOEVG0?=
 =?iso-8859-1?Q?vVTBl+CH2v0BRq3a/dbWlio9PZ9NFFq2iAkMN8aI1HqYU2Dkr9hI6O76Z2?=
 =?iso-8859-1?Q?4lI3Tb5v2EMltxDvzJybzTtOn9I+DqcmwgL+ZiOjl+Kixy1Nml98HxUKbU?=
 =?iso-8859-1?Q?IMhr4t2/8MlzkkFfDP6uE8AyG3fRp86qa4G3YP6MTcXnN353/nrmMtIrrx?=
 =?iso-8859-1?Q?f/LqL4BfpH3G9vuxcFJhlrVXBxf+h0oJUG5QWOe1Jm/YqdwAlt2XM31lnp?=
 =?iso-8859-1?Q?vX7wvVE2KK9WfGayhQ6gov4Nog/2iRe5ANUKEmK1V5C5k8LfWlvgXNP8YH?=
 =?iso-8859-1?Q?qg9ZAU6e4tw1JKnjHqcOmMgKd2YzVGxC62FbFYObfMPARZUYdvkpzsvfCn?=
 =?iso-8859-1?Q?RNpZ81JL0ovsk8/oCmBfMyHZw05uaC/rXE6/lM6tS+4NU0fxCgL2a1DMCs?=
 =?iso-8859-1?Q?myrQooH5XqFpV5GBF/p+mhv97tRFeAofCGOCH9JyEyFByW/oPC4Hq8AD0U?=
 =?iso-8859-1?Q?JC+qm6PAAuDzrQxbItq+isvt1/yFd9Rb50BLEzFM4rdNV+7yTDkS7tm9sI?=
 =?iso-8859-1?Q?SBntNi/wNfnajoA6VbyvXpYcA1llCe6Bymr06qR0pUp2XfsfmBM62G8AgY?=
 =?iso-8859-1?Q?UxwS26XVp6mg8eLv4dcXuYn1HDFV59NRXG/jvilWALfikM28kf2jSJF+uD?=
 =?iso-8859-1?Q?lbcT7JnMRW+oO3+03mtIwkVTROglYbmbtp+smkW8yTqsnPSgUx8a5w+Cao?=
 =?iso-8859-1?Q?afHfybTO9hGsepNQi+eFFuBylJ0C3C+hnXuYAt4v/XP+tGTb0FklLJMXUq?=
 =?iso-8859-1?Q?S28NKY9b7g6ztG/3GS7hdm4YROqyEtf0WukO+SXcuJDmDLhWQYa4SQuH0G?=
 =?iso-8859-1?Q?uWQDboH6wZNOe/r6+N+FO8ozYBNyhRC4+0/tyl+ExQJyagnFHFrWY2pYLn?=
 =?iso-8859-1?Q?PxsuasCrOUP1mPRPISHeFlGvWDN5D8WlBm9rWUyP33wdqXfC7Th9zx0yYv?=
 =?iso-8859-1?Q?rOqzpQiNXHGeY9VDjUGN8dbiXeBJ/QX4bz35NSWx1ZQ8N9dGR5zdQDvCpV?=
 =?iso-8859-1?Q?h87skiGNLrmkbRESEcu3oFxyJhae7yWGaQ5eGeNhAzeFNMy47lfDVePcNw?=
 =?iso-8859-1?Q?bR6bCfr+XCd0fm9UPMTs1qP3OzuginUxxPIgSMQXWeiSuQderwT3q3xGLC?=
 =?iso-8859-1?Q?OsFSotnXphT0PEZTrkLck9straJMd20Mn6Cxmt+oICav4Ysbupc4EfxhcQ?=
 =?iso-8859-1?Q?WNCLf9AXHc5pcTO/HhE7m0Y0naiK1ruT+Aao/KNii9j0WmtiwMR+utKw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c39cf0-11d3-459b-5043-08ddd6aee82a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 19:08:06.6463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlRV8ER9geblCWJsjaN2QRRmbwODl/hCVrxtbQPzh3HyyuCEtfGC1vRCToBx2vZt0fdS6sNBr8bxiD54gw2TtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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

On Fri, Aug 08, 2025 at 09:49:20PM +0530, S Sebinraj wrote:
> A periodic GPU frequency monitoring and tracing program for the
> Xe driver. The implementation provides periodic sampling of
> GPU frequency through the Linux ftrace infrastructure.
> 
> Key features:
> - Periodic GPU frequency sampling with configurable intervals
> - Immediate frequency change reporting via tracepoints
> - Integration with Linux ftrace subsystem under 'power' events
> - Per-GT (Graphics Technology) monitoring support
> - Dedicated workqueue for non-blocking frequency sampling
> - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
> - The monitoring interval can be configured at runtime via the sysfs
>   (default 5sec).
> 
> The sysfs entry is at:
> /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> 
> The tracepoint is exposed at:
> /sys/kernel/debug/tracing/events/power/gpu_frequency
> 
> Format: {unsigned int state, unsigned int gpu_id}
> - state: GPU frequency in KHz
> - gpu_id: GPU clock domain identifier
> 
> This enables userspace tools and system monitoring applications to track
> GPU frequency changes for power management analysis, performance tuning,
> and debugging purposes.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig                    |  22 ++
>  drivers/gpu/drm/xe/Makefile                   |   3 +
>  drivers/gpu/drm/xe/xe_device.c                |  20 ++
>  drivers/gpu/drm/xe/xe_device_types.h          |   6 +
>  .../xe/xe_gpufreqtracer/xe_gpufreqtracer.c    | 289 ++++++++++++++++++
>  .../xe/xe_gpufreqtracer/xe_gpufreqtracer.h    |  73 +++++
>  .../xe_gpufreqtracer/xe_gpufreqtracer_trace.h |  48 +++
>  drivers/gpu/drm/xe/xe_module.c                |  40 +++
>  drivers/gpu/drm/xe/xe_module.h                |   3 +
>  9 files changed, 504 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 714d5702dfd7..a2c99c0a01a4 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
>  
>  	  Use "!*" to block the probe of the driver for all known devices.
>  
> +config DRM_XE_GPUFREQTRACER
> +	bool "Enable XE GPU frequency tracing"
> +	depends on DRM_XE

I think you are missing a ftrace dependency too. No point enabling this
feature if ftrace is disabled. Off the top of head, I'm unsure what
dependecy for ftrace is.

Matt 

> +	default n
> +	help
> +	  Enable GPU frequency tracing support for Intel XE driver.
> +	  This adds an ftrace tracepoint that reports GPU frequency changes
> +	  at periodic boundaries (default 5 secs, configurable via the
> +	  gpufreq_monitoring_interval_ms module parameter) and
> +	  on direct frequency change events.
> +
> +	  The monitoring interval can be configured at runtime via the sysfs module parameter:
> +	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> +
> +	  The tracepoint will be available at:
> +	  /sys/kernel/debug/tracing/events/power/gpu_frequency
> +
> +	  Format: {unsigned int state, unsigned int gpu_id}
> +	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
> +
> +	  If unsure, say N.
> +
>  menu "drm/Xe Debugging"
>  depends on DRM_XE
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757..7bbaac7de867 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_service.o
>  
> +# GPU frequency tracer
> +xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer/xe_gpufreqtracer.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..cfc81d4c7c82 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
> +#include "xe_gpufreqtracer/xe_gpufreqtracer.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> @@ -896,6 +897,21 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	err = xe_gpufreqtracer_init(xe);
> +	if (err)
> +		return err;
> +
> +	/* Start periodic monitoring on all GTs using global module parameter */
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gpufreqtracer_start_monitoring(gt);
> +		if (err) {
> +			drm_err(&xe->drm, "xe_gpufreqtracer: failed to start monitoring for GT%u, err=%d\n",
> +				gt->info.id, err);
> +		}
> +	}
> +#endif
> +
>  	err = xe_oa_init(xe);
>  	if (err)
>  		return err;
> @@ -959,6 +975,10 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_nvm_fini(xe);
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	xe_gpufreqtracer_fini(xe);
> +#endif
> +
>  	drm_dev_unplug(&xe->drm);
>  
>  	xe_bo_pci_dev_remove_all(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..760db7cd25d3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@ struct dram_info;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
>  struct xe_ggtt;
> +struct xe_gpufreqtracer_data;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -529,6 +530,11 @@ struct xe_device {
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	/** @gpufreqtracer_data: GPU frequency tracer data */
> +	struct xe_gpufreqtracer_data *gpufreqtracer_data;
> +#endif
> +
>  	/** @pxp: Encapsulate Protected Xe Path support */
>  	struct xe_pxp *pxp;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c
> new file mode 100644
> index 000000000000..6d1941b4a5f3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_gpufreqtracer.h"
> +
> +#include <linux/workqueue.h>
> +#include <linux/timer.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/moduleparam.h>
> +#include <linux/types.h>
> +#include <linux/container_of.h>
> +#include <linux/gfp.h>
> +#include <linux/atomic.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_guc_pc.h"
> +#include "xe_module.h"
> +
> +#define CREATE_TRACE_POINTS
> +#include "xe_gpufreqtracer_trace.h"
> +
> +/**
> + * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
> + * @gt: Reference to the GT
> + * @timer: Timer for periodic monitoring
> + * @work: Work item for frequency sampling
> + * @last_frequency: Last reported frequency to avoid duplicate reports
> + * @monitoring_active: Whether monitoring is currently active
> + */
> +struct xe_gpufreqtracer_gt_data {
> +	struct xe_gt *gt;
> +	struct timer_list timer;
> +	struct work_struct work;
> +	atomic_t last_frequency;
> +	atomic_t monitoring_active;
> +};
> +
> +/**
> + * struct xe_gpufreqtracer_data - Per-device frequency tracer data
> + * @xe: Reference to the XE device
> + * @gt_data: Array of per-GT monitoring data
> + */
> +struct xe_gpufreqtracer_data {
> +	struct xe_device *xe;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +};
> +
> +
> +/**
> + * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
> + * @work: Pointer to the work_struct representing the scheduled work.
> + *
> + * This function is executed in a workqueue context to periodically sample
> + * the GPU frequency and perform any necessary tracing or logging operations.
> + * It is part of the GPU frequency tracer subsystem.
> + */
> +static void xe_gpufreqtracer_sample_work(struct work_struct *work)
> +{
> +	struct xe_gpufreqtracer_gt_data *gt_data =
> +		container_of(work, struct xe_gpufreqtracer_gt_data, work);
> +	struct xe_gt *gt = gt_data->gt;
> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> +	u32 current_freq, last_freq;
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, exiting",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	current_freq = xe_guc_pc_get_act_freq(pc) * 1000; /* Convert MHz to KHz */
> +	last_freq = atomic_read(&gt_data->last_frequency);
> +
> +	/* Only report if frequency has changed or this is the first sample */
> +	if (current_freq != last_freq) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "GT%u frequency changed, tracing %u KHz",
> +			gt->info.id, current_freq);
> +		trace_gpu_frequency(current_freq, gt->info.id);
> +		atomic_set(&gt_data->last_frequency, current_freq);
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_timer_callback - Timer callback for GPU frequency tracer
> + * @timer: Pointer to the timer_list structure associated with this callback
> + *
> + * This function is invoked when the timer associated with the GPU frequency tracer expires.
> + * It is responsible for handling periodic tasks related to GPU frequency tracing, such as
> + * sampling or logging frequency data.
> + */
> +static void xe_gpufreqtracer_timer_callback(struct timer_list *timer)
> +{
> +	struct xe_gpufreqtracer_gt_data *gt_data =
> +		container_of(timer, struct xe_gpufreqtracer_gt_data, timer);
> +
> +	if (atomic_read(&gt_data->monitoring_active)) {
> +		queue_work(system_highpri_wq, &gt_data->work);
> +		mod_timer(&gt_data->timer, jiffies +
> +			  msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> +	} else {
> +		drm_warn(&gt_to_xe(gt_data->gt)->drm, "timer callback for GT%u but monitoring inactive",
> +			 gt_data->gt->info.id);
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_init - Initialize GPU frequency tracer for a device
> + * @xe: The XE device
> + *
> + * Sets up the frequency tracer infrastructure for all GTs in the device.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +	int ret = 0;
> +
> +	tracer_data = kzalloc(sizeof(*tracer_data), GFP_KERNEL);
> +	if (!tracer_data)
> +		return -ENOMEM;
> +
> +	tracer_data->xe = xe;
> +
> +	/* Allocate GT data array based on actual GT count */
> +	tracer_data->gt_data = kcalloc(xe->info.gt_count,
> +				       sizeof(*tracer_data->gt_data),
> +				       GFP_KERNEL);
> +	if (!tracer_data->gt_data) {
> +		ret = -ENOMEM;
> +		goto err_free_tracer;
> +	}
> +
> +	/* Initialize per-GT data */
> +	for_each_gt(gt, xe, tile_id) {
> +		struct xe_gpufreqtracer_gt_data *gt_data =
> +			&tracer_data->gt_data[gt->info.id];
> +
> +		drm_dbg(&xe->drm, "initializing GT%u (tile %u)", gt->info.id, tile_id);
> +
> +		gt_data->gt = gt;
> +		atomic_set(&gt_data->monitoring_active, 0);
> +		atomic_set(&gt_data->last_frequency, 0);
> +
> +		INIT_WORK(&gt_data->work, xe_gpufreqtracer_sample_work);
> +		timer_setup(&gt_data->timer, xe_gpufreqtracer_timer_callback, 0);
> +
> +		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
> +			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +	}
> +
> +	xe->gpufreqtracer_data = tracer_data;
> +	return 0;
> +
> +err_free_tracer:
> +	drm_err(&xe->drm, "initialization failed, freeing tracer data");
> +	kfree(tracer_data);
> +	return ret;
> +}
> +
> +/**
> + * xe_gpufreqtracer_fini - Cleanup GPU frequency tracer for a device
> + * @xe: The XE device
> + *
> + * Stops all monitoring and cleans up tracer resources.
> + */
> +void xe_gpufreqtracer_fini(struct xe_device *xe)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = xe->gpufreqtracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +
> +	if (!tracer_data) {
> +		drm_warn(&xe->drm, "no tracer data found, nothing to cleanup");
> +		return;
> +	}
> +
> +	/* Stop all monitoring */
> +	for_each_gt(gt, xe, tile_id) {
> +		drm_dbg(&xe->drm, "stopping monitoring for GT%u", gt->info.id);
> +		xe_gpufreqtracer_stop_monitoring(gt);
> +	}
> +
> +	kfree(tracer_data->gt_data);
> +	kfree(tracer_data);
> +	xe->gpufreqtracer_data = NULL;
> +}
> +
> +/**
> + * xe_gpufreqtracer_report_frequency_change - Report frequency change directly
> + * @gt: The GT instance
> + * @frequency_khz: The new frequency in KHz
> + *
> + * Reports a frequency change immediately through the tracepoint.
> + */
> +void xe_gpufreqtracer_report_frequency_change(struct xe_gt *gt, u32 frequency_khz)
> +{
> +	drm_dbg(&gt_to_xe(gt)->drm, "direct frequency report for GT%u: %u KHz",
> +		 gt->info.id, frequency_khz);
> +
> +	if (frequency_khz > 0) {
> +		trace_gpu_frequency(frequency_khz, gt->info.id);
> +		drm_dbg(&gt_to_xe(gt)->drm, "traced frequency change for GT%u", gt->info.id);
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_start_monitoring - Start periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Starts periodic sampling of GPU frequency for the specified GT using the global
> + * monitoring interval from module parameters.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data) {
> +		drm_warn(&gt_to_xe(gt)->drm, "no tracer data for GT%u, not supported", gt->info.id);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid GT ID %u, max supported is %u",
> +			gt->info.id, gt_to_xe(gt)->info.gt_count - 1);
> +		return -EINVAL;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring already active for GT%u", gt->info.id);
> +		return -EALREADY;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 1);
> +	atomic_set(&gt_data->last_frequency, 0);
> +
> +	/* Start the timer using global interval */
> +	mod_timer(&gt_data->timer, jiffies +
> +		  msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> +
> +	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
> +		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gpufreqtracer_stop_monitoring - Stop periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Stops periodic sampling of GPU frequency for the specified GT.
> + */
> +void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data || gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid tracer data or GT ID %u for stop request",
> +			gt->info.id);
> +		return;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, nothing to stop",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 0);
> +
> +	timer_delete_sync(&gt_data->timer);
> +	cancel_work_sync(&gt_data->work);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h
> new file mode 100644
> index 000000000000..6f0f88aec2ea
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GPUFREQTRACER_H_
> +#define _XE_GPUFREQTRACER_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +
> +/*
> + * Initialize the GPU frequency tracer for a device
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe);
> +
> +/*
> + * Cleanup the GPU frequency tracer for a device
> + */
> +void xe_gpufreqtracer_fini(struct xe_device *xe);
> +
> +/*
> + * Report a GPU frequency change directly
> + * @gt: The GT instance
> + * @frequency_khz: The new frequency in KHz
> + */
> +void xe_gpufreqtracer_report_frequency_change(struct xe_gt *gt, u32 frequency_khz);
> +
> +/*
> + * Start periodic frequency monitoring for a GT
> + * @gt: The GT instance
> + *
> + * Uses the global module parameter for monitoring interval.
> + */
> +int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt);
> +
> +/*
> + * Stop periodic frequency monitoring for a GT
> + * @gt: The GT instance
> + */
> +void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt);
> +
> +#else /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +static inline int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +
> +static inline void xe_gpufreqtracer_fini(struct xe_device *xe)
> +{
> +}
> +
> +static inline void xe_gpufreqtracer_report_frequency_change(struct xe_gt *gt, u32 frequency_khz)
> +{
> +}
> +
> +static inline int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
> +{
> +	return 0;
> +}
> +
> +static inline void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)
> +{
> +}
> +
> +#endif /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +#endif /* _XE_GPUFREQTRACER_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h
> new file mode 100644
> index 000000000000..8dfb6c442630
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer/xe_gpufreqtracer_trace.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +
> +#if !defined(_XE_GPUFREQTRACER_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _XE_GPUFREQTRACER_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +/*
> + * Tracepoint for GPU frequency changes
> + * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
> + *
> + * location: /d/events/power/gpu_frequency
> + * format: {unsigned int state, unsigned int gpu_id}
> + * where state holds the frequency(in Khz) and the gpu_id holds the GPU clock domain.
> + */
> +
> +TRACE_EVENT(gpu_frequency,
> +	TP_PROTO(unsigned int state, unsigned int gpu_id),
> +
> +	TP_ARGS(state, gpu_id),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned int, state)
> +		__field(unsigned int, gpu_id)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->state = state;
> +		__entry->gpu_id = gpu_id;
> +	),
> +
> +	TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
> +);
> +
> +#endif /* _XE_GPUFREQTRACER_TRACE_H */
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH xe_gpufreqtracer
> +#define TRACE_INCLUDE_FILE xe_gpufreqtracer_trace
> +#include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d08338fc3bc1..2252d0f762bd 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -18,6 +18,13 @@
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +/* GPU frequency monitoring interval constants (in milliseconds) */
> +#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
> +#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
> +#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
> +#endif
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define DEFAULT_GUC_LOG_LEVEL		3
>  #else
> @@ -41,6 +48,9 @@ struct xe_modparam xe_modparam = {
>  #endif
>  	.wedged_mode =		DEFAULT_WEDGED_MODE,
>  	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	.gpufreq_monitoring_interval_ms = XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS,
> +#endif
>  	/* the rest are 0 by default */
>  };
>  
> @@ -93,6 +103,16 @@ MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
>  		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +module_param_named(gpufreq_monitoring_interval_ms,
> +		   xe_modparam.gpufreq_monitoring_interval_ms, uint, 0644);
> +MODULE_PARM_DESC(gpufreq_monitoring_interval_ms,
> +		 "GPU frequency monitoring interval in milliseconds ("
> +		 __stringify(XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS) "-"
> +		 __stringify(XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) ", default: "
> +		 __stringify(XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS) ")");
> +#endif
> +
>  static int xe_check_nomodeset(void)
>  {
>  	if (drm_firmware_drivers_only())
> @@ -101,6 +121,21 @@ static int xe_check_nomodeset(void)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +static int xe_validate_module_params(void)
> +{
> +	/* Validate GPU frequency monitoring interval */
> +	if (xe_modparam.gpufreq_monitoring_interval_ms < XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS ||
> +	    xe_modparam.gpufreq_monitoring_interval_ms > XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) {
> +		/* xe: gpufreq_monitoring_interval_ms %u out of range [100, 10000], */
> +		/* using default 5000ms */
> +		xe_modparam.gpufreq_monitoring_interval_ms =
> +			XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS;
> +	}
> +	return 0;
> +}
> +#endif
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> @@ -110,6 +145,11 @@ static const struct init_funcs init_funcs[] = {
>  	{
>  		.init = xe_check_nomodeset,
>  	},
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	{
> +		.init = xe_validate_module_params,
> +	},
> +#endif
>  	{
>  		.init = xe_configfs_init,
>  		.exit = xe_configfs_exit,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..fd60de38d24d 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -23,6 +23,9 @@ struct xe_modparam {
>  #endif
>  	int wedged_mode;
>  	u32 svm_notifier_size;
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	u32 gpufreq_monitoring_interval_ms;
> +#endif
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.34.1
> 
