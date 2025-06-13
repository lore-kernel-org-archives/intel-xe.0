Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D0C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3A910EA48;
	Fri, 13 Jun 2025 20:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGCS1Jio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5627E10EA48
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749844963; x=1781380963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0APd68wK1UMhFXmiSlpIls+NzwrVuOujecNaMk2sXfE=;
 b=KGCS1JioCNaHZOQ8c4t6CDYgj571el77zSz6bjCeTtXACOUYEDgMIhFo
 rO5kmHgXXBbDLQad0Zhbm71GVgR5L6tqAdqMeoJN02BYa7SgseDTYwaKb
 XqhKu9xsmCt7BQg/1VQVIFtn2/MqJvu39d3yHbaYr9nkog74ZGDZKep3i
 bwKBi4go0ey+eFhho4RGKgPP4ndQWa54cthZi5UiEN5VvM/dCx3D7EHKK
 AyERN0ZS7IgXliEaVr+WgZYCT6iD3S3HnZGaws8g5B+Q20wBRU52hF88d
 RrgepBW1i2wAJ4GoXbx+dsQVKZ1G7qp5GBvydNnw0KNk5cdigE/nfA8Rr w==;
X-CSE-ConnectionGUID: 7P3Q2VttT9a2vhHw80TDYw==
X-CSE-MsgGUID: 6uu/o8F8TSCgRhCyW4sk/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63422047"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="63422047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:02:42 -0700
X-CSE-ConnectionGUID: AG8V8CZeR/yAn6Uyq3TXyA==
X-CSE-MsgGUID: d7EWS9NFRjeOuq5yVEmxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="178803109"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:02:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:02:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 13:02:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aqb9zx+x5UohDRzHMlWMwTZJMlud88zkoA8uRczM9Wk7Cz2/v++Wq/Gknjyp5zlX1kT9mxYwG6uyyEgw0qg9HbuOiWa2IIUA4bhqnReh6lcDBP52HSOwO5aVdUcoOkup1pK34mGl1SHfcFxjlQYYWmgvByz9rUrD9lI+fMgsDUhIn0Oxb25Yq1l4bg/l/tH4zOVa/9qs8MeukjWc9o7NzN/pdDVeGUjVxwhD8Pugls7LaWR4Ot6++mNOwIqASNxLypKVK4/rVsLjPwndRnAzuzuWjxIt17WzkH8Ag6jtpcn4/a1O8vGZTsPosOB6WvImhbbXayPt1uzYG4wSG/x/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ+QNdf3gg/55EnBiWTDPqa1/5GvHjgHHh/rY7jmKAQ=;
 b=AUQhEQGwxEdiU40WGSCEjqXr7taGiXOgQZcgbEhhLB+gl2DedbPfuPKb9YaCvDpFRPq7mmHeMc90CU+qXRFKd2O54RzJukgHOZaAbp6TsI24Kwo5iupAsOmi9bb89BAhW5loRYl2XIXtxKjw54H+gSwHu0VzDJs+f5w12qS4/dGbBQ6VK1T0DWkIxgcBHqha2wl69PJOkZhe82E2xoe+E64or5v6H2TIXq6k9YrZ03sCjEitdICIjTBVlead3AUwSoRHHbIVh/na8RZNamEs25O5O4iSe5sCSJ8jVZeIo/weRQ/vtGvBjjOsxLRfpRlu69iCjuo89t5v/u7S4EtKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPFC362E0A4E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::854) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 20:02:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 20:02:21 +0000
Date: Fri, 13 Jun 2025 15:02:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/tests: Convert xe_pci tests to parametrized
 tests
Message-ID: <5c2ui4su3cnaf3ngviufnhaz5o46p424q2ep7egpwpoqyx6ixn@sq6xzzx2vdy2>
References: <20250613191938.1980-1-michal.wajdeczko@intel.com>
 <20250613191938.1980-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250613191938.1980-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPFC362E0A4E:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b4d63c-6c75-4ecd-dfd8-08ddaab534f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CPDCtiMn7yQDHRzTsNZrLi2V0i9LSl4S5EyE0w5XqJa3vQ1aSIM2QiSwy+7T?=
 =?us-ascii?Q?c9U1xRkcPP8uay+7zEjZRynCN3qiRDPmWGJ3MqrBezrTo4ew8H+ml9f4j4pM?=
 =?us-ascii?Q?5IWAZk+69hFI3R5gjFS/9uv73E+dLqOxYWbtKidQn5UrNdzoqyQvDHBIW/om?=
 =?us-ascii?Q?5p5Pyl0uZ7FWCeB9TyI7iGHS6iBMoDzDN5GuB/3HCB7J3jIv9f3mz/lFbuq+?=
 =?us-ascii?Q?dBZm67v15Hv4v9/mCPA5B4muXfDWMh455u5C50BTk3g0uYoTw6BZPknXgVGZ?=
 =?us-ascii?Q?BqtzVVLcMUq1tsdqC4ulcso/cf5fkWkuNKefcTFxalw5aii4/BJDhCgihY1t?=
 =?us-ascii?Q?AU+MEk0XKWIVHIaTkLsaZXCXgFfSsxGBfNH2yqomOOHvlfAmDM/OxfI9OFFm?=
 =?us-ascii?Q?RAI9XsUh71vtTme93WIQ1J6aQCKK7v4n61ST5YHUxckIvKAIfd1BClm7aTQx?=
 =?us-ascii?Q?eqwoWC6zVJC3kUFsqro5CRpp/d2DiulnKHjeWTD5gpJIBuabzceYpedIRkuf?=
 =?us-ascii?Q?Ei3MLLQWg+5loLZkb5qqAaicMaBiGigg0RNoEy6ngzh9XKRN8UeeABponlro?=
 =?us-ascii?Q?WNmRu/DUF9eQbqP8L2J5CEl57s4vfHjXOvnk6/o5sxOqmKKSghVPkYCq/KUz?=
 =?us-ascii?Q?9ZSbgli0kHxbRrqj5nM/sUdpnc1SetjcHjSgckemUn5qkO9l5mp/Pn4Z8aB4?=
 =?us-ascii?Q?LaxzfBa9JsNTDbpNEKlUGSN87wdAVjEotwH0jA3I86bmuXurg6gJcboI9yhJ?=
 =?us-ascii?Q?SXM5ykK7Hj/ecqs/xbINCN4mnKELKtjqYpcMxYipjZKksbUO+oKaFgwN60CM?=
 =?us-ascii?Q?6R1KA25GEYK3qMGmXs7QoCFJpnSlfUXFg2QET3T9CqIDYvaFjY+K+AogJeEG?=
 =?us-ascii?Q?dbCoVZqw18KOtT+PcRu5K/WvuFkLyq1h3NTCeN7CFH8K6QhgrbhNGy1cB+Uz?=
 =?us-ascii?Q?n4Q2+ho0yuJG6rVxZvtRIGErrd9i+HSwP1/u8q27W6DVpbbYUNhx/NXAdUje?=
 =?us-ascii?Q?JrMToUWhzyw+iQz2lfHG2Ek+E9XRenfwFfg4+E+AS/w9GfSE4r/946x+i383?=
 =?us-ascii?Q?Ifkvf0yk5XWFJDTQBknRxfg3kqm43RgDCeJ0jPMv0CAllVRXjiqabFBJQqZt?=
 =?us-ascii?Q?A7YD2ml57ixin3W6llhrqbC6AgUr3eH221vWiVM1Nh9RI0urma3wJ9Sh0qhy?=
 =?us-ascii?Q?3EeJpDH/jNUqxNi/slYvv8MoJg2Xf8VpJcRsLbkOLljlj7EOLxf/lPRDsp7y?=
 =?us-ascii?Q?WSaxHRbBu0dBBaQ4ajT0T3SjFB5oXUb1w7iPIWt7wp+ChNNkxHQzvkR4qNQq?=
 =?us-ascii?Q?6CHGKj5hDt/73AuKgmdw2SFUkOSL6g8zlnCWEEjdk7I6eQ+khzNuKZot5I6Q?=
 =?us-ascii?Q?eFh87EXS+o4JYPfYYGbUwc3DLp7LcJJKn9JUB3MxDrXYKcam59kiqPBxLQ+g?=
 =?us-ascii?Q?gUzhadpjGpM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?81fdWzCcFFuWOTc6+lmfH61jqX9vnJEOxZb0AKYKefW4bs3xwXJJGlrnK6Kt?=
 =?us-ascii?Q?VIu/ZVFtUnKZJtRdaWST/IYhXA5UEZ5/X/gjNgWNJV2aryyKo6wS+rK2yq/f?=
 =?us-ascii?Q?s3bKTErZOLImYn/6tp+ehx1vPeDoAYMEd05FMFlV8iQvrX11oFFYzBw4YdF4?=
 =?us-ascii?Q?+4Th07FFz4WBn5PXI5A2zv+ZuW2d7cLV+sug9PsadElnSJVSJ4Lm6RxXmYOX?=
 =?us-ascii?Q?sZVMfF09L//Y9hozfD8kVXQPmqJnT+ob0oURhwh8S5VFg4Qn+Y1GzfeyRal/?=
 =?us-ascii?Q?hwtF8y3mvPVg+FVj2UjvSimhfOXq7/H47exEFbIefjhN7dgy74vI0kt7mKVn?=
 =?us-ascii?Q?Q/fkSWwNy0rC2+tTcGojzOnJxQFk8yzBD2AI9lM1CFvjplkYMZPbgRLBUw2/?=
 =?us-ascii?Q?IAlHOGhRFcB/Vct+n8eu143s1ISi/aTqnX+CoIps79VUEGnR0aXniqLSLFPp?=
 =?us-ascii?Q?XG+Wb3dgAMaDCAFp0d47BHWuSThxUn5wwA9mHj9jYcGaGwjKlTRHQWH6N1ZT?=
 =?us-ascii?Q?EQ7zY3dFVdILYsZJe3BzNg3xn0f+bVRTZr66XLhE59YgrZuYm7buyC+lQHOq?=
 =?us-ascii?Q?OLmsIY2sYOZyFcrDp9q0gTw4Qy8tw5LrP7I7xQ2E+6lG4VOz+0obhHwElGq1?=
 =?us-ascii?Q?4MXtMItNL6aHTh9heaxndfWv/xo0Io92c+2uEI1or8C3iqZQz7gt3GPKLKHG?=
 =?us-ascii?Q?+pQJn3mHZtXyO587EA4/1vHQGmsR745hdECkL6Dg4yJMAoCeUKimrbgMd41y?=
 =?us-ascii?Q?XtPFkNpDIhxOIZt+4dY0Wny/eRsBe3PiQO16Z/XlYQjvbxGPmWJht7IpZjK0?=
 =?us-ascii?Q?ukVk9PibK1HJ2y1Gw6Qh4kUuKoouHTCAoGvhlHXpV3xVWxZKc+ezXzVWopDx?=
 =?us-ascii?Q?xTy7dRrjv28W0D3GDVAq5e4E3+beSYb+WFMt4emfjpkEbWhuzQZb2d41BMR4?=
 =?us-ascii?Q?ESamlKM1t8AC0cl6WwsENgyPrGe7Ryi/lKN7OOc6GXmjlV4s68/z1rIrc7Jl?=
 =?us-ascii?Q?LE5DH32Wp4DWGGmaJ0cy+ElZa1b1N9Ud5qPJ5uwYQUXpGj95LAFpBpcdpRgp?=
 =?us-ascii?Q?Ovl2Os8WGPz8v1pVlbCNAqf9L5q+M6iM0wpNAHW8iC6PffQwhDDNeLCUVr/p?=
 =?us-ascii?Q?wuZC4hcrYNQFoaI0ZFg9GQQTi19FcEpLBvMmypNdzAWbUBSl8p0RL8OeDTe5?=
 =?us-ascii?Q?sxYRHDbSTa0uf7pgd8lKkq9Nb39YGORBm1wTDdB2kZ9r86tpPJUtC3YkfWk4?=
 =?us-ascii?Q?f9ljEKIQOyp07hsCIR5YLYetdCPs3vLKccvaZRbnKXxnDP+MHzYKDztS8EjN?=
 =?us-ascii?Q?FheBn2wkr/OSBPblKQE11CaIDz8/xpk3X0WdI7k/IsmtYZEXnWLFM76CmN3G?=
 =?us-ascii?Q?d/wyAnut1QPBd+ekEP9X6YNize2mOWE7+5szztfHULk+qV3V6uYZz6opIEmv?=
 =?us-ascii?Q?5B/Lwk2Zr8S80zpS6506ZSTF/B3c5HwqXdVsbvmd6U6cp47MYhWX3utVQJKe?=
 =?us-ascii?Q?9WgfnE7/hcfV7p9uoWUP6uut3vYQXw4QBoSm6Kwe8DhUMowU2zcHCpr23LaG?=
 =?us-ascii?Q?9Fp2mYJ0fwARc2daA2SFL53z8qXzrM3d6zyO8PWPyon4zT+cPUDUiBmW/JGm?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b4d63c-6c75-4ecd-dfd8-08ddaab534f5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 20:02:21.3223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqIGLdxF/fDUJ2q1wqO3e3PzjvCgLVBQh2/fJW16r18jqczikw2QeyeRSNWeIkdPyA3I3RBkBgEHIzgA/l7yeFekRoKvGmDuVmbkwKK5FoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC362E0A4E
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

On Fri, Jun 13, 2025 at 09:19:38PM +0200, Michal Wajdeczko wrote:
>Instead of looping over known IP descriptors within single test
>case, without any diagnostics which IP descriptor is eventually
>broken, define kunit parameter generators with IP descriptors,
>and make existing xe_pci tests fully parametrized:
>
> [ ] =================== xe_pci (2 subtests) ====================
> [ ] ==================== check_graphics_ip  ====================
> [ ] [PASSED] 12.70 Xe_LPG
> [ ] [PASSED] 12.71 Xe_LPG
> [ ] [PASSED] 12.74 Xe_LPG+
> [ ] [PASSED] 20.01 Xe2_HPG
> [ ] [PASSED] 20.04 Xe2_LPG
> [ ] [PASSED] 30.00 Xe3_LPG
> [ ] [PASSED] 30.01 Xe3_LPG
> [ ] ================ [PASSED] check_graphics_ip ================
> [ ] ===================== check_media_ip  ======================
> [ ] [PASSED] 13.00 Xe_LPM+
> [ ] [PASSED] 13.01 Xe2_HPM
> [ ] [PASSED] 20.00 Xe2_LPM
> [ ] [PASSED] 30.00 Xe3_LPM
> [ ] ================= [PASSED] check_media_ip ==================
> [ ] ===================== [PASSED] xe_pci ======================

much better, indeed.


>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
