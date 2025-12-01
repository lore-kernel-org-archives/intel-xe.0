Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4E5D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 20:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7102610E483;
	Mon,  1 Dec 2025 20:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjixyzZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5E110E483
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 20:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764620014; x=1796156014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3o4NpR2RmKvVLb0zevtcwzXtxtJJ8FxlDtIfTPVc2/E=;
 b=JjixyzZK0dpi+AiaSXpvm5WuHzKxqXgfY4hswRGVNzW7pCdqwpSKAdMP
 C6a1dXrmDnYRuifAZAb2hlbReFw2eYQ+GyUgeM4V/1S+PbNfeNGqsFfy2
 feLx76HnmnnzCBz1E+vVu8WodxtBx6tr+M12D5uaYI+kHX8LPJa5Jrnqy
 iZlGa7vr9trDJ9Ei9rXk8LJI3HHsY0mVBJdEVHTDFs3HChaADefRXLJ8R
 7JJvov8xkgQ3CYCV2cSdbeYol3HCfby7mn8xIW0JaNK6BgmoLbFZ6wzsS
 B2DZ4tQ9dwywW0hnuxh51c3HBYQZlf8LSJNuumWqa7TDcy7HlkNW9Om+R A==;
X-CSE-ConnectionGUID: j0ZJLfwZSIWILGraKGEnOA==
X-CSE-MsgGUID: IQjtaQyKRhiXj8FBwKyU4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66531329"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66531329"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:13:34 -0800
X-CSE-ConnectionGUID: ttwT6uoWQNKGBrFkimZ+kg==
X-CSE-MsgGUID: WA3COV2aQR6KbA0/CuH+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193441759"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:13:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:13:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 12:13:32 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:13:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIGielOxaLLNgQuMcQfE1qkj+eIjacx1i1aTn4VAg702YJvnO3vBGYbgz/Ip/9aUblPrLzjXFS9CL5qmUJctRalpVZPHCbiPVvTY32cGJ5BW4Lt6lx+lbqnEbOVzWzQMaCbzNn922+H/5OJvhD/Xj/d1xzQhG+9rTmMZGl7rRsAwomVf/CPdwBpt0s6ONEI5I7MWPP0vwd2bVjP8jkIH7DhcOSeIBGkn1OFv3M4F6kLJKJ+4rIUyyBuoCt+/QXDxSJcc6Lksnk4LcU/wNonQhnbAVCL1GPQmfEaLcRdJUi6fj0idZdbpJbyJ+zjFEAjy9UIRGQW4iEtGOMH7w+nsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StvK1h0bmPOP/U7MfSyyBC6A9Bwwmye9STU5vwZoqwM=;
 b=iWhgayPXFP4bf+OsceVkOmKo/IsruOF/PVItGaCGPND7eEpCgpor7n/gSZ/nRkVhCCHvbZXq5D31yIxIk3fZtyzDlm6BRdQpLjAbg7BrTYprEokS3s1mlxujX/K/kGJpwVWpSetySkC6M6aTeBvdywg83Y/J5Gn3xUlPIArKL6rtQXlL9+To4V3hD7Lg+mxz7XiDm2hyT/nmC1fwjHamMI1vj7YALUTC7NglBZR8uVFVedUongupn6vGTH0wHxZv/5ao3wxD5hSLXONmoVN9wQeqaRNyv9lR48UWy8B4KpLBMMhbDVQKqQaR+PbTeSw9MD5q2RVCmz8iDjiaa+XepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:13:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:13:30 +0000
Date: Mon, 1 Dec 2025 15:13:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <badal.nilawar@intel.com>,
 <ville.syrjala@linux.intel.com>, <karthik.poosa@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe/pcode: Introduce PCODE_FALLBACK_MAGIC
Message-ID: <aS325SySM4UXm6aF@intel.com>
References: <20251201102902.362650-1-raag.jadav@intel.com>
 <20251201102902.362650-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201102902.362650-2-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:74::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3dd76f-e5be-4492-e997-08de3116181f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WH8IejpOPoG9M3KIONWDqC2uAdzFU6B2ZQVROaKvx/KFVjHqGMJJn6j9FgeU?=
 =?us-ascii?Q?8AitZRn5/ToFL8FvQWN38FMlzHvKhijtCVuiDbGAi6aa4PDIVvmkWQJhWG7T?=
 =?us-ascii?Q?qtJTuzLPkuUB9Eo1v7es7eP/1nvaZlv7560lP8x4pGaq5wY7a/oMHoklqNZI?=
 =?us-ascii?Q?TSEDzVyCBgg/30m74ioiterZJLAGTxF1U7GTjJ6vBQl/velP9Oc+dmJ7fJ46?=
 =?us-ascii?Q?PbeqqdShR2bsbJsrIVAMcnUhnTo/0jH2yB54a9hzyukVZEdiOZW/3jWbn17k?=
 =?us-ascii?Q?CjEQ60kWEsXtzKJ3EYIjVPoG9rK1a1ab+91DXiS9y6dmIfgxQq5TGZ3mnApe?=
 =?us-ascii?Q?y6vkFwp1tsf3jMjwFKERutuzRHyaN7rb64kJPellr0adDp9O+/HwfGV9sySL?=
 =?us-ascii?Q?tgmL5vryegTLZUDQy3qTVr5NKi7wWQgnHSBHBy9qLfzHaM3C+u/zRaj2nwvd?=
 =?us-ascii?Q?xNY9jgXOaPLefvhRM8TAXghDzUBmTGqTCaHtJF3A16E3UZTv1F21WLHb+4EQ?=
 =?us-ascii?Q?BMhpetOu6coVcXruOsX3kAeCus8P7azE+PvgcjbhISvffQK/h7irMtI6utsS?=
 =?us-ascii?Q?sqRAz7wKJ7r3DsWVp+PC09U4a0oOWkiXgZxa3CgseIpqzT5aBkeAeuUD2+x3?=
 =?us-ascii?Q?kiMYu6R557YxGqjsxN72JZVC/npzSpjefiPHqZhWykNQHFWkYweXLJ0M/id6?=
 =?us-ascii?Q?zX/Q3Lo8oI3z1rUr08kodoaoNCPpgjnJQfYg83+nFOQzpGZMrVrvI06ei6/l?=
 =?us-ascii?Q?xw9qnydxfNJgW+Vr+zp7yBiMGbbEUtw9ACcQ+cdyLH/PfOtOKmNS4G50O6hx?=
 =?us-ascii?Q?JhL2WC6Ndw2yLm8TLewvZE3CAnYbN6UOcmc65UihuIYE5T4YuR9g9i5egEw4?=
 =?us-ascii?Q?GDqtr1a7Ik+oFJO577AA0ibIGHYT83ETCtDsH9ZIw7qNBkz/Y41h09iBesKC?=
 =?us-ascii?Q?xuaGKRkoJUfXmu8xnrgLqA9mIpaELdYD8RMu9mJx0EFL4Oy5LahaN6WpaK6Y?=
 =?us-ascii?Q?Tb7qsTTJ/QdyCmgsNldMJ3v4DRQ5qrcSZBJAl02b2fd21hoo/gb5rKCkW+o2?=
 =?us-ascii?Q?Z/ZhK+GXYRuDuQJQNTSIeNC+1QNgtII5RHrn4/CqKIzam5v9yKrzITiaHzXp?=
 =?us-ascii?Q?kS1FVYqAvgBHIMkLD5lG4S55c85v92+LKEHuzLDxVa2NRnK65iP+pJ5+vBVn?=
 =?us-ascii?Q?eWzHBhdgNUEUFkhyp4sBIHzhtR2u15xXAcMiHBl6HxJluea27M2S/XNNuHLw?=
 =?us-ascii?Q?1bCf5LDVfyeIeA22RNeGJ4df9k1y6Gxlxe/q2Tk0IiV9IamGo+Pgi3qsuSdT?=
 =?us-ascii?Q?zujBgqCgloJksBvZtOGSDOLmCHUO7NO0V3Hj8VOX3bVWnW7VTaTaJ31c5/3D?=
 =?us-ascii?Q?nSFzZk+N0dtLoh5RFOETO+L1yJXJDlfaDFQCPCQoYyP9pbbQBKytmT4l4ZYD?=
 =?us-ascii?Q?IF+ANzCyGw0UdTM3PWhz0O4h31J+2JdZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kSTa6W3e4fp92KwkM7o74y+uhscMmQJSEzcJlaQT8D019ScGiaXVWnYAbtC+?=
 =?us-ascii?Q?xbAFqJAfvV9jSn2I4CTskD5MmmiztJJiPgRWNaeLj8hMSFyq8hGOZ/obx7sB?=
 =?us-ascii?Q?2xjkSDTA1ZWEhS61rtZ6xfXhiPCpqFwSL9fVkmw+lQ/ehB1iHZy0t7D/gzoE?=
 =?us-ascii?Q?F980KfZGkHtupaigSh7tE3UO7jDYfecBUnHHs5pRurK3v750Tfg786MouMkG?=
 =?us-ascii?Q?BX1mVh5uioGnkqV6uRPER8+E1UK8YYFrzQX42eQb1JCobW0ZHOyBHof3nuqP?=
 =?us-ascii?Q?HOXLZt+5o0v2c37eYD7HJcP09rv4vCBilI19OvXU6QsD+DNRpfCOyL478LnN?=
 =?us-ascii?Q?uOqFu5erGahqROFXFqgRwXfBKuDgLLVaMZcElBasnojiY8Z0c03NwmcCNvjt?=
 =?us-ascii?Q?TdBH8q8EhBFW06iXTmx4VlUr2GUT03HdjVSPUfS94IWfTAQjyRTog0TPYdY0?=
 =?us-ascii?Q?Mo7wW6sQoR4pdn9DWgARfxVw397J0CrLOarhZ1wyygV7SlmwPIsbzIuDEVv8?=
 =?us-ascii?Q?J3oszgNZlyD2ar4NkG44IPTwWTSE+4jM5VUUKIeffG1ix8yaeKWXHnoPwZVV?=
 =?us-ascii?Q?WRnr04chnrmnHgDhs3htwtryLEJwOGqE7E5lPg9ZbJQPPtNbnHPs2m4vGuQ8?=
 =?us-ascii?Q?saFM5lu+XADGd8uWgG6y5d+Xxafo7FuullOIqGb2VDNMQq9fIva+KxIHhXZt?=
 =?us-ascii?Q?Hp+eLkTQb7QlOiY725zB1pvFruDJZ9pOGed367EB6myzo6tCEDgdQF8q7wiD?=
 =?us-ascii?Q?K+SUcYe4YW854j33vmuaAbgA2GBsr99uRjDtpYM2+kM3O+hY7yxVu0qQAJuD?=
 =?us-ascii?Q?wT2rTKtnRlCO52tGp9skIO4h0DbduL8XS+REx0baWEjHR5aWgt/s48ULUpXk?=
 =?us-ascii?Q?sALK6znkpXBX67AEjynqNSQnPKt4tt0UrdpfZ3w1sFDHMFc/KhiPR+RFWJnT?=
 =?us-ascii?Q?GKk0JYoQy35BZ1FmbU6qIUnbVMxQARgRKBzDhGClM4rex4jA2+z/gQdE9pgH?=
 =?us-ascii?Q?JVQEEiYEvVtQXc0rzcOxP7udd3q7ZGEm4bjkMcch0gGIQ1OF0Oj4179fsjdk?=
 =?us-ascii?Q?AxchdHhHKl1ijUCwoA35N6gp3SLOFmUS1/ls/MPheLHbYL0Fw4S1Dx4QuGvD?=
 =?us-ascii?Q?DkRcwfBr3QgFICxUBI3vBIXv3658ZSiHcV2tIUZOlzA1jVvBA3vBhb8kpd59?=
 =?us-ascii?Q?e2mIwoXkXHgSQxWMUVsU1da2Y5Ik4JRPR1CGkINDEHt1nygv9ke1R4xSmBMX?=
 =?us-ascii?Q?r4cBAvlGkFLcmiBDHn6suuIqHysjptLdKh2m/VFKoxllVkpzVnduYZ2GPC6N?=
 =?us-ascii?Q?Utr6tZQsmrqBC0ItcLa6Xztmzoz8Zp38UufeLB0aOiuN/TsdmDLzk0m1Vsjb?=
 =?us-ascii?Q?dyqAHN8Gd/U4OxDfr39RjBN6bV1UosfmvV8+r2eFcijuXq7+D+0GkvA593v3?=
 =?us-ascii?Q?9w0WkujNtmLyiEyI9nr/Xl/vp8OQ1m6tiVCDEQclC4kBSSfqO8fuRdvqDlQM?=
 =?us-ascii?Q?j9FmIPYRJSpkZ4gKST1j9uRom9HENHB/98Ymib6YeNLbgPLZhq939qJ2rP8f?=
 =?us-ascii?Q?iM0DB2y/AMJSqxXf79sNRYm0Rq2CxF81FK2x6jn6wKOM0EtzmKgQcpPcNe3i?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3dd76f-e5be-4492-e997-08de3116181f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:13:29.9408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xn1W0oeh3xnTyVxqB6pOkjIOQi99Gsx2R3YFhpAcV3AwFmXTr2kCcj2ux8LTFGPO6uS8BAMxH7k61UjCGoaY7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
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

On Mon, Dec 01, 2025 at 03:57:55PM +0530, Raag Jadav wrote:
> If the device is running older PCODE firmware, it is possible that newer
> mailbox commands are not supported by it. The respective functionality
> isn't useful in that case but nor is error logging, as it doesn't
> particularly signify anything wrong with PCODE firmware or device as a
> whole. Introduce PCODE_FALLBACK_MAGIC bit which allows checking for
> mailbox command support without it being reported as a fatal error. This
> is useful in cases where we want to make functionality decisions in the
> driver and allow the caller to determine the fallback path based on PCODE
> return codes. This is a relatively simpler design choice compared to other
> solutions like checking PCODE firmware version, which comes with additional

If we have the ability to read the PCODE firmware version and handle it properly
we should. This explanation is not valid.

> complexity of binding every single command to a specific version and deems
> PCODE commands useless in case the driver fails to obtain it for reasons
> unrelated to PCODE.
> 
> The fallback is only allowed for command and subcommand failures and other
> failures are still reported as fatal errors, so we don't end up hiding the
> genuine ones.
> 
> v2: Convert fallback cases to -EOPNOTSUPP (Lucas)
>     Use xe_tile_err() (Michal)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c     | 47 ++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
>  2 files changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 0d33c14ea0cf..4078c4aa2b35 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -15,6 +15,7 @@
>  #include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
> +#include "xe_tile_printk.h"
>  
>  /**
>   * DOC: PCODE
> @@ -25,12 +26,28 @@
>   * single and consolidated place that will communicate with PCODE. All read
>   * and write operations to PCODE will be internal and private to this component.
>   *
> + * The usual PCODE return codes translate to:
> + * - 0: "Command Success"
> + * - -ENXIO: "Illegal Command"
> + * - -ETIMEDOUT: "Timed out"
> + * - -EINVAL: "Illegal Data"
> + * - -ENXIO, "Illegal Subcommand"
> + * - -EBUSY: "PCODE Locked"
> + * - -EOVERFLOW, "GT ratio out of range"
> + * - -EACCES, "PCODE Rejected"
> + * - -EPROTO, "Unknown"
> + *
> + * All failure are reported as fatal errors except -EOPNOTSUPP, which is returned only
> + * when PCODE_FALLBACK_MAGIC is embedded with mailbox command. This is facilitated to
> + * allow the caller to check for mailbox command support without it being reported as
> + * a fatal error.
> + *
>   * What's next:
>   * - PCODE hw metrics
>   * - PCODE for display operations
>   */
>  
> -static int pcode_mailbox_status(struct xe_tile *tile)
> +static int pcode_mailbox_status(struct xe_tile *tile, bool fallback)
>  {
>  	const char *err_str;
>  	int err_decode;
> @@ -57,8 +74,14 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>  	}
>  
>  	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> +		if (fallback && err_decode == -ENXIO)
> +			/*
> +			 * Command/Subcommand is not supported, allow the caller to fallback
> +			 * instead of reporting a fatal error.
> +			 */
> +			err_decode = -EOPNOTSUPP;
> +		else
> +			xe_tile_err(tile, "PCODE Mailbox failed: %d %s", err_decode, err_str);
>  
>  		return err_decode;
>  	}
> @@ -72,6 +95,7 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
>  			      bool atomic)
>  {
>  	struct xe_mmio *mmio = &tile->mmio;
> +	bool fallback;
>  	int err;
>  
>  	if (tile_to_xe(tile)->info.skip_pcode)
> @@ -80,6 +104,10 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
>  	if ((xe_mmio_read32(mmio, PCODE_MAILBOX) & PCODE_READY) != 0)
>  		return -EAGAIN;
>  
> +	fallback = REG_FIELD_GET(PCODE_FALLBACK_MAGIC, mbox);
> +	if (fallback)
> +		mbox &= ~PCODE_FALLBACK_MAGIC;
> +
>  	xe_mmio_write32(mmio, PCODE_DATA0, *data0);
>  	xe_mmio_write32(mmio, PCODE_DATA1, data1 ? *data1 : 0);
>  	xe_mmio_write32(mmio, PCODE_MAILBOX, PCODE_READY | mbox);
> @@ -95,7 +123,7 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
>  			*data1 = xe_mmio_read32(mmio, PCODE_DATA1);
>  	}
>  
> -	return pcode_mailbox_status(tile);
> +	return pcode_mailbox_status(tile, fallback);
>  }
>  
>  static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
> @@ -240,16 +268,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>   * not take the right decisions for some memory frequencies and affect latency.
>   *
>   * It returns 0 on success, and -ERROR number on failure, -EINVAL if max
> - * frequency is higher then the minimal, and other errors directly translated
> - * from the PCODE Error returns:
> - * - -ENXIO: "Illegal Command"
> - * - -ETIMEDOUT: "Timed out"
> - * - -EINVAL: "Illegal Data"
> - * - -ENXIO, "Illegal Subcommand"
> - * - -EBUSY: "PCODE Locked"
> - * - -EOVERFLOW, "GT ratio out of range"
> - * - -EACCES, "PCODE Rejected"
> - * - -EPROTO, "Unknown"
> + * frequency is higher then the minimal.
>   */
>  int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>  				 u32 max_gt_freq)
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 70dcd6625680..a5157966478a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -9,6 +9,7 @@
>  
>  #define PCODE_MAILBOX			XE_REG(0x138124)
>  #define   PCODE_READY			REG_BIT(31)
> +#define   PCODE_FALLBACK_MAGIC		REG_BIT(30)	/* Driver use only, not used by PCODE */

I don't like 'magic' code. I don't like the fact that we are using
a reserved bit.
Let's handle it properly, without magic please.

>  #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
>  #define   PCODE_MB_PARAM1		REG_GENMASK(15, 8)
>  #define   PCODE_MB_COMMAND		REG_GENMASK(7, 0)
> -- 
> 2.43.0
> 
