Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C6CCFB44F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 17:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B57810E214;
	Mon,  7 Oct 2024 17:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3IiuCDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FD410E3EA
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728322873; x=1759858873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3sfoDz4xgznf6IdZ7qpqe0PpAN+wzL2xpaVyGPT50VU=;
 b=B3IiuCDbFDao0ySmbo5qvp2N88GpzshAiNIqXH66dr002aiyBCuk7Mwr
 8p1RpH2sfOM99TkUgb6HNOY+lfNQBX30WCAFlfH9UlxkLewwQwUAhEkpI
 rGIcp7Ur+dWtZ4TZj9Ao50grmvlQsQYPBN1qbKjRlId+KeoDraDASnooP
 60aeHmMsWY/6Ssy72mXcQFketP2KhcOCnOCTj8Qx6/ZFuzM64VA7nKvdR
 2l+V300WC/3o3sieX82JaN+9PYOHExjjdqMn7CpbTifXFd7f6DTiMUf7H
 317/u2lYa6rQJlCyBRgw09QBu89feR1j56ZJDU9RUgudbC0Qdn0BQKUiv g==;
X-CSE-ConnectionGUID: UfioCzjRShCas03/X2l6jA==
X-CSE-MsgGUID: r8O3PsvOQIyFLbkcmxUyNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="15105926"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="15105926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 10:41:06 -0700
X-CSE-ConnectionGUID: XIldtWzLSGOcw6S4HzY0Xw==
X-CSE-MsgGUID: jmmlVn3VSYurHCBZZ/Aagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75385182"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 10:41:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 10:41:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 10:41:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 10:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI/l/MXH8xvJlE32tPEfmtR8wwDX3+IiT0irpxXiOZvr+reogzIcA47FeZJaVKIH5c8deAgQkhtt8XDV8A78hLX/joLHAc0nzqYnMw59B6aym1d5mt86cH29MpRaXj/IE4NGOjN6Aqrjd7Iu5zaMjqtshQcHArcNmnLIISTEEjLctHTm5F9jR17MeaHiEhMcFvKcKr6yWjQP374gQPIZGedj45+stPeXtzkzKSwf754jiGclGAxooDsDtNLxjijLFXiGENPi3/0qEabmPVCc5Jgyv5n8/Huo79Ln1kL+5HjVXDq5Qmgr0inp8mosfw9TihMWSicfmvYM4i5n7mSvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCVKq2z7JL8J5wRqevtuvfNtpsPleHOAxUnZeaN6Y/c=;
 b=ogNUnycSgdg+Yg9bGxUWA2sJbE9QBKyN3ZsRoXkp72JuppbYNYHwe0mg9OKrjZ3lE1TXQnsUsOHFTC75HPPwqBXoIMHqBajVF3XNiyX7WUiQJPhQY1wC6szi3agjcs8r8hlVd8lUJAHJIBGoaRMcLIv6JTY1rr6OyGln1kRzcOqEO36pX6ZGnqXuAWMJgCwnRKABenDh7uH+IUefmHabVlZcKMyezeG3r6O/p2bmPcRGfeSVfevkpaTetyVO5cpeNEqVomk4lPn+mwIazZexn8K5ygeoeEn3pY2B1VVsoV+CqJZyvD2lHLU84s7QIsIYqINIgPITXEcfflmIX9lTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 17:41:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 17:41:01 +0000
Date: Mon, 7 Oct 2024 12:40:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 5/6] drm/xe/ptl: Add PTL platform definition
Message-ID: <7lpqbqs63avh5q5pyvvva6wck3essawbmer5chypxu6s7cor6p@aoghwp5lbsr6>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
 <20241004220550.94308-6-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241004220550.94308-6-matthew.s.atwood@intel.com>
X-ClientProxiedBy: MW4PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:303:8e::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce4430d-b983-49a9-e368-08dce6f7357b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DU+ab0Tayoi0fVgreZOp9f5fOD3VR/aQHhQdOJhwMtvoGVZ05UrFkpvZa5S6?=
 =?us-ascii?Q?SQnotzTRRdxoU0tlj0eKH4abaiIQljgS7s8HjZ0x9BMyKjiLo79uEWTkTbsF?=
 =?us-ascii?Q?IXI1buElGRKNwdUBeNT69CGz17aVSqWfx1O4fzzM/qL0bhbsVIMAWfnmX6cU?=
 =?us-ascii?Q?3q/UZD28tCSYOGPbKlezIQ/JtJ4KE4zn4gKcoJ2eiGv1vgIx/vRhcHJjd9Zd?=
 =?us-ascii?Q?9JPTEYYoxN4lAOxWpWLSFHulttnwjR9ExlBY5Sq1y7GLGaGgaLcZUSvQITWT?=
 =?us-ascii?Q?t/X14znfgeuiGzH8o146tnYk+S+0eTRS8hwnrFBgBtKRuHPZTgJG+8sGQj+t?=
 =?us-ascii?Q?xljHKkIXdUsVopc0Ml2ZDqqsaYB1J6SuF1IYyfRK/MX7cNG+YxDKnvKBMhzX?=
 =?us-ascii?Q?F0yqR04y1iQCK1cwBAUniwIg1gFY96La0EJTjFyzbnG8O2fCJSHgqAvrMzu5?=
 =?us-ascii?Q?6QLXjQd9d6ZtQhg3hckuB31dp7BHggbhJo98/qCNu8pPa22ahHlGv1ZUsjPf?=
 =?us-ascii?Q?4Mf1Mw601C53AficaEl+qMLPGXxqTnHrKD6BY1UkGQrK5Ou480EUDIBMELqP?=
 =?us-ascii?Q?PTwLcj3gAw1vfB182kf6wM21vjQeuxmPEdH47jS1xrmEoH4ZJslVLbMdhEBY?=
 =?us-ascii?Q?9dKh4tdeqdxjLGMHHzL2scFP5+T+jMRRCvmZC0zdDtNeDWljKvsrRE8yAQi3?=
 =?us-ascii?Q?XVXGnTca3D0sjZ21a160Qtm91Ib4xeebNnX2chzVW1KcWsEvnz2VjwYp3eEx?=
 =?us-ascii?Q?06zPD194KuAzpMlcQQkTVHQFVgYUW0/8715YIY79vQk1F7uj4gxUsyPtpyUQ?=
 =?us-ascii?Q?Qbjz2lzbZFD3vMzVYiFy3jyd7y8WJ28WZp2vvUrBPMAEcRG2OYIs+6yLc4Q7?=
 =?us-ascii?Q?E86yf+73kOZ4R/0LOJuONMsNoSbb/oMHfx+VLOsUSHVxE18/lX38JL5HSXJq?=
 =?us-ascii?Q?JCNxnyxAYmFxJeU49kAnMJeKyZCVBHRLvGRfL5KLkcPpm5tN5GxjFQxoPamJ?=
 =?us-ascii?Q?VILDX6WRYD+AN3EdaEvkQAmlMD1b+yGw1W2tTN6h412g7QYI6Y+b15WJVvo7?=
 =?us-ascii?Q?xaGacsibpAGSCiz4M+4fJrd153IQNYCxh9V3kLlr1VIjqCbJvSiLdho/51nu?=
 =?us-ascii?Q?kMYf4H/qSTHBxD9Qtky+PvMGC5axI4XkaOeNni+UZLu7f1I+YtfPa6V2MXee?=
 =?us-ascii?Q?YqrnqhL5gBmLb9yW/7/t5/m0QL7vwNuJkC4CyAxlvRsX8P5OwYFDquIm1IAK?=
 =?us-ascii?Q?Ivquk5s4nJ69HatijS7J4fc5xKTuLjbANt4gs5eU3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EPDMAI3hRauRXUErJDFc6UGWrG3pSHWQ3DeB6NbsQbUTjEs52iChxKST5Bg?=
 =?us-ascii?Q?TtjyRx2mJUWNJFljsJU5wowqCXA8fNG8wOPr5QHwu4yl/U9AKQ/ojM5yWXdX?=
 =?us-ascii?Q?V7URkn3aSDpHEXwRkPUTcDOvmfhbJR3p7vns+lz4FYPTAWwhvkowgUn/u+jN?=
 =?us-ascii?Q?8erV7kIdEGFhLgwKS7efWPDHnDoTj+GVuJGwjtD4oEwuQoceFu7jwg8Fg1jG?=
 =?us-ascii?Q?PWldahTh5zaggLwP5WoNmysyCLc3Y842Twcn5EUZf5vr+aw9Xi3dIl7LKe+F?=
 =?us-ascii?Q?0Z4bB+bSqvFpLJEDuOm1U9lIcEuP43OyXflFGVeXmtqYDMGNtnAMdnUenWSW?=
 =?us-ascii?Q?ypEfKNgV/shD1QzqGvmDf5YdaMvw9551m5bdjxvGrR8j3eO93HSye6Z1wNFC?=
 =?us-ascii?Q?WmWwa5b6NDIW+ruHoAIayIxbs6JM6t/pBVAUPRQBVOuQbWRuhXONdd+JJdR9?=
 =?us-ascii?Q?FgQU3t3uloxmiDL5yjpOatSETlbF9ehGv6k78lDwt+JdXRj+49WFOK1tW6IO?=
 =?us-ascii?Q?VPCufrmX7Xnx6K5bE2zaY3dgVSz+smXhxi8yRDKqwAfToqx8HxX4bjBVDCKc?=
 =?us-ascii?Q?YzXcFLO6hjkxp4El02o1Sw4zUzR2iF7ZqSaIAhdmUjD+u1VzS7IDwjthentH?=
 =?us-ascii?Q?dUCM9N8er9EharnqPIO61ErHxFKJjJn0Z6cH0UDdMlidGGDpHQth74Wqn/Yp?=
 =?us-ascii?Q?cADsreRzBOB5pm2Mf0oKr1319Z6lT3AnYZUS7t4qpgqNFZPyWq3Ign0pgf5l?=
 =?us-ascii?Q?Ghl+669iAoZ57MV2MK5sYg88m/zMZfy0LkbmCSU6oGM0BPt5h/IJWKs/cKWg?=
 =?us-ascii?Q?RY8PFQW26dlSxD/15qH6j/TO5duCvdkCOQ+KduOxZTXVM44GYz+gLqEgLMaL?=
 =?us-ascii?Q?AjSf0XMol4DpqwoM+K7OHMAaRRbBbyOltxrilo4ACg3UklJMGlP491fk9F6D?=
 =?us-ascii?Q?CJpSJ70JyW86yTUxy5FJ/j+OnMfEuZrgKaK9cjT7c6pdp3v4Zpp0qzPtl8ef?=
 =?us-ascii?Q?KHVY65MHFVYsF7Y4y/zfBryeOZuo+xuZN21O2TwXEbUvtT9ONBIMV5Dn98Yd?=
 =?us-ascii?Q?kqLSAzKF3mA5GAQeaLxXRGxysHeti5LkxJ9DG2Hmstvil8hlX6jOUMhldOlA?=
 =?us-ascii?Q?zFgUymBv+hCyKYCY8HKq6gTfjvZfLf1pj2V5Xg3JvIH/NBnQJdJZRaX9+05k?=
 =?us-ascii?Q?s+BZg8Djdz1Ix1luFb0MwV0blapUgHC+Cy56N7YZnE+xtWO7YGOZLMLBF18m?=
 =?us-ascii?Q?AO8FfKyvyamh0lhiAL1qHn45GZXEpLZ3gL12FQRCG5jNAA0uYt9PG2JtDtWe?=
 =?us-ascii?Q?Jv9FC8adeFX06GM1Xt2ELbptHPmG+OtLBzYewjMGQO/NjJLRQdjccowDlCJv?=
 =?us-ascii?Q?MbM+7N2ZEFfCsWJBUdVA89IRUOpCpVlOUBgIW5WwpwcO7weBhqYTO8P6VidA?=
 =?us-ascii?Q?yHXZGxGF9od50kPrCcY4fYkmuF06Wrvf5XvtiYnWSB7ltdCH8rPa6qYWVjjT?=
 =?us-ascii?Q?nthGAcxG/xKYaaKFC4pEL4Pu+C0FziBAcdqtBsNeKbkYdAFmoYSSh5mYHYQt?=
 =?us-ascii?Q?Vmu/mYuRl7xqWfoftW+SOLnXvZctgOJfJIFtroTndO8FnDl/T/Pmo8uqisVc?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce4430d-b983-49a9-e368-08dce6f7357b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 17:41:01.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcGHb2sE7nTeamIjUqjMVmV12vzwlfMLOyLQVGvVpi08KAm+djBWabgtzKS3PdyJeAzix08CxICQU6O8mLp9BHW/czgioLp0y9J5cl/U9Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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

On Fri, Oct 04, 2024 at 03:05:49PM -0700, Matt Atwood wrote:
>From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>
>PTL is an integrated GPU based on the Xe3 architecture.
>
>Bspec: 72574
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c            |  6 ++++++
> drivers/gpu/drm/xe/xe_platform_types.h |  1 +
> include/drm/intel/xe_pciids.h          | 11 +++++++++++
> 3 files changed, 18 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 6b2dfe4b305f..c7711f6aa095 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -355,6 +355,11 @@ static const struct xe_device_desc bmg_desc = {
> 	.has_heci_cscfi = 1,
> };
>
>+static const struct xe_device_desc ptl_desc = {
>+	PLATFORM(PANTHERLAKE),
>+	.require_force_probe = true,

Can we add a .has_display = false here? I see we have several display
patches on the pipeline to make it work, but we don't want to block CI
on those

Lucas De Marchi
