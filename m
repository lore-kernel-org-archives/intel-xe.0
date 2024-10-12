Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50514D1A427
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 03:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580510E12D;
	Sat, 12 Oct 2024 03:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T28U2qpf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1359D10E12D
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728702115; x=1760238115;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rYgP0tqsUYI7cx8kH7E0q3Emd+0NLZfK8ZdqDoeIPpA=;
 b=T28U2qpfo/ecKi6EtRvFNhlOWa+ZnAMvN5CyIcy78MZ6eIDARkfFSA0A
 pq4i5barVhbOHaCYxY8DuyUI3BgKTiGt9Y5VaoRV9XTRuHpKJknxa6yAS
 QEnwikUQxmJGzPNPq4+nPUOdgL0e3Y1XuL7p7M7q26wSf+r6HV0RGnqXQ
 ES09sK6X+tug79cawBTr6xXWi9EDiZOsHQjl9BPhEmLrR2Wk00vqfolyv
 acdm/01tWX2/G34nP5XYof6oxkZLXJj3+a6fefac7DGBMETblkyLuq8Vi
 bVy0fahKc6FYlidAsHokVdNUPw6MAADlAFVSF8z0YXo+C2VjpfGBMAI9s g==;
X-CSE-ConnectionGUID: gcdMByRBSEWWHjJokec+hw==
X-CSE-MsgGUID: GLIDpOMdSKi6U0yvSWctkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28249801"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="28249801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:01:55 -0700
X-CSE-ConnectionGUID: 5PCC9idmRtC2neHFFDi2Pw==
X-CSE-MsgGUID: 6CLSWLI+QFSru1KWvqMIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77386460"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 20:01:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 20:01:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 20:01:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 20:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fjzl+wvPTHk25OJEvOVfHH6wnGMbg4k3Ym9IZ/SB/DW4OCDl7EYkpxEJ3Az27/DsdzZ63J2hMR5NqXh0wCyWLRVIOKx9ZC+XKz222RvQoKgzYZaXh1xIPH7XrUS+TpdvgKdXQdl5QohHgCTtrv4wMUiEC+Luu7jvFn7GB4tNJ2fdO5+6YKRvGdYrw5gT2g6MIBaIxV6DfMYHWpxDjTV2bYgqqwYtAp68N8Syx7JPJda5fLjlUxigQuBJkIXETNcrZbmT/8R1jvF2kGHC80BJR618+t4wmcIXyMTwYfO7ou16KxBoorQlpbqh8KReI47QQCOfK5M0+r5qRHuP1Af5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTrYB5wF40lgXxwD96Kr/D8fWbgkH6eHhIn5KiGRr8U=;
 b=Gl0I9F++vi9STexjtNA8eJtnRJkXj4Ss2R4mJUH4NEWQlWE/S6DFIq6KzXD/tMMtbTQgPZ5FtqRD8HXh9X5XQ8GOTQYqZLvEsToADvqUdVX6dBibxeRXIjRj91A4puPpn8nKdUbi9WdCbj8RxvaGKgyWgksuHPffHa8EQaZid19hTJ7FNNtZvzutxWZKrJswSEkRNoHqWs/AJ/SOOk78C39EJqkNMt+2q2LoRNX3p/PEHEASa7AjOJ5ZrJveY3pVydN0F27B3avUz8wtM/9Lkpo6Tv0Yt5SdtFy/JdbKQWf4IPx+3DhdN12IxiJUr5k6TWcVubcHPh35iP9yuiuVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sat, 12 Oct
 2024 03:01:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 03:01:44 +0000
Date: Fri, 11 Oct 2024 22:01:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Clint Taylor
 <clinton.a.taylor@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH topic/xe-for-ci] drm/xe/ptl: Add GuC firmware definition
Message-ID: <yebatc632t6a3qysnopru43iz7tnzct2h6vrsxywouvq2icb77@cfhrk4kgjl6v>
References: <20241011163920.7926-1-matthew.s.atwood@intel.com>
 <ctp36giso2dqutyhnqwsr6im2lwyvgh3jvzel7p7fh6pmw4x27@z3xnizpxofcf>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ctp36giso2dqutyhnqwsr6im2lwyvgh3jvzel7p7fh6pmw4x27@z3xnizpxofcf>
X-ClientProxiedBy: MW4PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:303:b4::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a688114-44ce-4a54-434a-08dcea6a33ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tvB73Q4YG2/xccR2i9k3cEMuhZNOpB2HhY6GBb1FGg0JVGLtkJv+CJ5bL3nm?=
 =?us-ascii?Q?7jyk27eXE2sa78BHfZfevQeghj5dGOkv3gJUS6HaqJ6ArQcPJTJQ5yqyXJ95?=
 =?us-ascii?Q?zTO5ta2S+D5Yxwi4dCYsajXhfwUCuIii3gPfGFBIQL4P+zbnddKTM/DOUzYW?=
 =?us-ascii?Q?0eTPDrQ/nNIXvrs3ve+vYu4KPxUhYO4DB40r/VA14uq4hhiiYBFsX93ui9jU?=
 =?us-ascii?Q?AIrGLi3TH+/Dr6d3vRzXHt6OBVl5s0+Y5BdSJHYPnJaqpUYC0d2URNHEaS3r?=
 =?us-ascii?Q?h6cazPAnPwGedF4EOu2EercuLp55j91KxSn0xta5qMAQf4lHBOnWc77dZVbv?=
 =?us-ascii?Q?R0XTciQGOujoewAnHWizRhD40KhoCcxv82z9fHVS9rOMjw6lMsYozW+qkfPX?=
 =?us-ascii?Q?TtFH1tVjXpAb3CrcxfT/hdGlsBrmGMytvBVW9qGHnGY0mDrgNng2wUh9QMlS?=
 =?us-ascii?Q?LGfXWgcMr0aFdpmm7Mas33J4/QbKuW+ozifRjoad4KXiTteY6iFjjRpDMNFR?=
 =?us-ascii?Q?zmdiuEfe9+28iAGKPqwKtYlEf12POcwh3vDG86aJB8nEyoNOGiikaCBLW8hM?=
 =?us-ascii?Q?snbvrCoV9UtUpmIbqmnE9n4t3OjrXlrb+ICMdMB9nqZveqOEhFVRYY/8yb6y?=
 =?us-ascii?Q?0Cv6DAQVCd4ggdwHo8k9sfHebwdRJ/JFKHtWAs2O+ZOQd+AMHO0SxhmLV4+J?=
 =?us-ascii?Q?kOlbtF6eLf5gYQK3LZbfz4N8Ot+6W+BZiZvEpAn9YEw0a2MWJmNtOAkhQvVS?=
 =?us-ascii?Q?JtJNIrCrcy9A7tRoVgLQfnD8cFkMVYJx/Y77VUDgv4FCb92sTb3W13jcLfMJ?=
 =?us-ascii?Q?/EgF7/g9ykwvavuXyeNXTpLyPZqzC+mCKFFFQShN8Yali8OyjSypGktwuSbj?=
 =?us-ascii?Q?kDfsVE5YyBwOW5EYSAU0WVgkzqjPM/Jf2UHaLh8l4YZKYpDxtX+OigzCOkKD?=
 =?us-ascii?Q?75xsLOmnD4JYEu4VFOa7BFkiufHz2q3W6B7iWmtyZsySbhjV8desQ4Nw+z9s?=
 =?us-ascii?Q?xoUwV+qR90WXf4cIoRgL5Zo6Bzi7pRfrYe0NZCun3HsVPARa0T3BWshlg2Yr?=
 =?us-ascii?Q?MN2QxaM2X1+eM7zRacswzaWCEubbgcZqg8+qjVTOMfBbNbg71SCikfS+XdCQ?=
 =?us-ascii?Q?lG6FGTzVyG7KtbNY2NQukppOVDTGL6X8tGxqg7aau7cYnSVvu5/+1f779M3B?=
 =?us-ascii?Q?MvoUywSfmw+i9QB3Mxfu6gEAhJnYQDR12Ma7US2SkKSj7xjstJ9LCW8wiLc/?=
 =?us-ascii?Q?mnLuntaB+1jbusTaoS9IJtnxGkHQrQbs8kq2UWLgkg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rl7V4mxPG2itiEGrFSx/DJ5JnVzl79VUR7GItgkir/x1Tmu5iUTwQ+eDJUn2?=
 =?us-ascii?Q?wnsGwqvNxhc9sNVg47iVBMN62gPJA0BzlwbKeYHDnVK2KdACJFWHx4mVYlwu?=
 =?us-ascii?Q?VjIn0AfYuQCQTySX1GtxAnXuAI4m44hCPGBRIJVfOxp6l6Y8Z+fn+29bfoG5?=
 =?us-ascii?Q?ybxMxP8DqgHvbTxmeiiqTyw1SB019nYfbWTYmKSZ3zK40ssYQ+BoUWpBx2pp?=
 =?us-ascii?Q?kiMxRIzr5KgZaIsKe2lCaUx/I2k/t2FdsiQbrvVurhwcUhkDklqBYUfAdId5?=
 =?us-ascii?Q?Mn4LUCTkMQXcWl/nFF9n0oZw2aPIx1bRkKTVKRNy9tGtKKLlh+iVhFfi5LHG?=
 =?us-ascii?Q?W2MkhNHI+e3sktdWHU4gDh05rnh5HsfVPUaWJ0ayXPEhc/A5HsJbgI9QdV6y?=
 =?us-ascii?Q?Al1dS7NP6irQ0Ge7KHErEGrEMYhL/1LKYWqhq0hiU0kXIc9LG1gswCrPz/OD?=
 =?us-ascii?Q?BIidhcW8NkhJVXdZMdlbZ5jEz0r9TC/jZHa8yll+D0bjit85VNdzzDQl4HZx?=
 =?us-ascii?Q?bTJVOQGxvsHBCme3iqGyLnFWyAGIVrA2FiDr1CkFrwy7tshPnkv3731fL+7p?=
 =?us-ascii?Q?PpPX4l4flbPgoEhGbwMkY3OyJjaalJGuk0Cs1o1gBdEjJ+4jFFiLbpKoEsXr?=
 =?us-ascii?Q?F/K1Iubftbbe7bdSzP5esywXD5ovq53KZ8j8GpgzDI73j7IH2Uo0dYKXB+Y2?=
 =?us-ascii?Q?/GcVltOFmdI4qb+Tw+UGMk8lo9RAPypp1t3BRAFOUfALh8bCy/tRCVKOkFs5?=
 =?us-ascii?Q?DZ6WoGtaP/Rm1jowo/yhv1f7sFbI/jYnv6Bql8pUmQzeXjU9CUtQN8wh0W7t?=
 =?us-ascii?Q?FJpeJE8Z9ijMFLRf2P2gCxDkZ562Q9ahwbBjMllLQUKeMtctNmZC8/GrZ7Vp?=
 =?us-ascii?Q?Ge6QxqseYN/ezxvqw7SExzn5lPBj7/os8fJEEQVUKyIk6QJk6+V0xLl7g5z3?=
 =?us-ascii?Q?CocbIMOA11c5DboOjmrCd9l52EVFEv0BZvol+N4Wp6Gkej6A9O38N7bFI1Th?=
 =?us-ascii?Q?lbJNEkoj7MEx9sUJs3Z9k7I11Bo+dK5OY8hqszdJ0UVixgs9pWfziCAmYnuJ?=
 =?us-ascii?Q?z3HOlXu/MR0CfAqXLmQF/P4uTLo+g2xRu8XTwRzzpOBSrTN7tTbDCNwTfdDX?=
 =?us-ascii?Q?EKGxJYD/gSdv43zI1sOWsN/F6kB272QYTGhWdeq0/utPqfqhcIjvQ7/Cfcbk?=
 =?us-ascii?Q?fkDMycKrnGJWbB2bq6mGArLJ7KC1+rGKJdW/AMKwrIt+zaJVPpHG1h6j741x?=
 =?us-ascii?Q?D8YU95BJr+Q6o7U+Xy5A53imEcpcOinUvK/4PPya4DjgnfR227f2WzHZ1f4s?=
 =?us-ascii?Q?0JJCsxqkOhwnAvrQVer1mmG6oponayCSPkZ/AWY9WTVB4tWFBwV1Q3VwSdIE?=
 =?us-ascii?Q?oF3setJ++O4Xt7vkHSQV+RI8GTcvlXg4OtbHlKRlBUdLwChsr0k5DEbp/x/8?=
 =?us-ascii?Q?VjMRptlbs4RUz8ChwANV7JCmlnB5Ar5AVoOMZBWLF7qYtiGylOkHx8quwWuu?=
 =?us-ascii?Q?a8xtf3iaoNKNMc06fViE8iIy03uN+HMtillkS63UKzKZTH0rAqwVRgSQoPfX?=
 =?us-ascii?Q?AqA7TIWQmyPHA9d/Fcer2S7rP7oIvouEQxiKfJ6pQ+wSn0o7fwuIFOwBP1bF?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a688114-44ce-4a54-434a-08dcea6a33ed
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:01:44.0231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VyT1by9wfy2SoZSKahm/37m7azoPDw7GnJi0KgkuhYG0yik1W49xPjLIX3jg0cp4FS5zeTJe0DBv5f6i5eiy36qeVspRMCLxL9daFOqpfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

and actually Cc John.

Lucas De Marchi

On Fri, Oct 11, 2024 at 09:58:15PM -0500, Lucas De Marchi wrote:
>On Fri, Oct 11, 2024 at 09:39:20AM -0700, Matt Atwood wrote:
>>From: Clint Taylor <clinton.a.taylor@intel.com>
>>
>>Define the GuC firmware to load on the platform.
>>
>>Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
>>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>
>+John
>
>We can't apply this until the firmware is available at
>https://gitlab.com/kernel-firmware/drm-firmware/-/tree/intel-staging?ref_type=heads
>
>Lucas De Marchi
>
>>---
>>drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>>1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>index 087fb96f707e..555ba12e0304 100644
>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>@@ -107,6 +107,7 @@ struct fw_blobs_by_type {
>>};
>>
>>#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>>+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
>>	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>>	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>>	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>>-- 
>>2.45.0
>>
