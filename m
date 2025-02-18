Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D77FC021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 16:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B1D10E3F4;
	Tue, 18 Feb 2025 16:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHdeqc7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CECC10E3F4
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739895663; x=1771431663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DXvk/iXV/q2+3OHlBPRpjplhK18yBGc/lMZ8WMF62HM=;
 b=dHdeqc7MJOmKR4JIrwYA3jIQH8lHYkQEQP5HiE5a6aGGgFu6N6gwYjap
 Ukux6TLnV7xkEOJcZPB4ivqe0bTm+YWIJHlrfESBfzOHzw7gn3GBwejKI
 cXx/BKLe9zglsTs+R5ZeZpDtQLYbb+Pn0/ffK3xQ/lYah3SECzBBXHGIU
 cxHwLiIiBGb+Hh5onJADkB6/7DUPJt+XzSLVseb+EiBtLMNzo8ga04/b1
 vpQk1SRovfbedM0trXgM/Q6ajRZTJU3mC2B43fDoeieyM1QQ5toXmTbd2
 CQRVe1XEitnK7RVrPunxLdbMZ+YbQjtl1/28CSvKl5bV+i+r285IXShUV g==;
X-CSE-ConnectionGUID: Sou8SJYkTvCoPTKBQXaXdQ==
X-CSE-MsgGUID: aA97LYgoQIyaQ3uS9BKbjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39835141"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="39835141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:21:03 -0800
X-CSE-ConnectionGUID: QIXqjI9PQdy84TfbjKxF9w==
X-CSE-MsgGUID: aNzrNvVMRY+xxIRpEe4x7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114965594"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:21:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 08:21:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 08:21:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 08:21:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcUnlfwwU1t1jzSBmg679qjI2MRDIEtzrFOtfrDpZicZ2F2QF2uNBb+z+/BbRja2RDRcaZJf+Dbfb5VNkCaD5opqq0y9eNBxdxKf/VqnKAeE1osOSDxvhc1QpCKZPwes86rXFfUAF0OT7JfU3cZY48OODNZR7Q99M65O9f4a+HgSWXwEo48MYvNScbQ4KQ7HMwoUnZoo2E1PcBbJob1DGS9shFYgVOq337Il/6qAt0AMVtsA2OdYCoiepBt1V3+ht1OtT2b+C1hUwSBPSrTPhVVT5CeoocStKFyOMpA0rL/Z0LaXjoPGgdmwRPDMY2GD7a+DJ1IJd9fDJQz2QWRboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8/nDVvyZBbl++VAx14RAAYYjlDvgGizPKQUFovC/dc=;
 b=up8wTnYVVIjFCMOJSvjVUSaVaa8qdkGyhJ5x/vuToxzKOlgBXeXDCqYRvXGb8IyjLlTMh1FaQfSy4UCvkmsZImePlDeGJ4Yc1F3TFosP+bOfNdk0K9+OeB7Sbywg61K/PQGvSHBmkv8GquBlqKDmBH0d625Sgluo8w2etAqjnUi7Xs/PKKac6pLDD/5Y65+TPzKtjhIcx90VRDfxT2z9k6nDUikCdNc+EkaSOwy+1IpNqjpBdeEoHHbIVFb7Sxw4tNz+StvV4dwuUd3CbsiV75R9x3M94zOGbmCc2TggjWoUt7TMNlnQsnANlBIMCzpWBet6sMqiLcbAQji+vmNW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 16:20:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 16:20:58 +0000
Date: Tue, 18 Feb 2025 10:20:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Intel XE List
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, "Daniele Ceraolo
 Spurio" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Add Wa_16021333562 and Wa_14016712196
Message-ID: <7cs3tr2rvhamc57w7nzqcs3ed33ctfy5zchal2ndaqxigdoujg@3r3wwyerqtdq>
References: <20250130055939.282988-1-aradhya.bhatia@intel.com>
 <20250130055939.282988-2-aradhya.bhatia@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130055939.282988-2-aradhya.bhatia@intel.com>
X-ClientProxiedBy: MW4PR04CA0280.namprd04.prod.outlook.com
 (2603:10b6:303:89::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c5830c-6562-4ef5-b6f2-08dd50383a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/3ypc2+uDkyklw2XgiyIHjgAMrozgt6NzDUfWbBVoO8Us/B+Ds4odyK3Yf1P?=
 =?us-ascii?Q?I6jWSJYLP6Z4VoPP0xQoVDJ7sR8StEOe854IgMI/b8IIs+KssyJh4hP+qk9+?=
 =?us-ascii?Q?8FASua9wZLgCuBHN1RRgEkdhHE3tY+pMSpSqx5f1vpdtAy3sfnqQcBaRmp0x?=
 =?us-ascii?Q?LzVQ+Zt+qApfMae1DscIVSTcEoai5Fq2oMXgLoHQdvTFpvJ3XJLoIRkoxDQ6?=
 =?us-ascii?Q?f8NpKECSzyaV48MWZm4qqVp1L/RC1FkmY09Wi0FCIryosGD3clpilJmGpdtD?=
 =?us-ascii?Q?w0cjYCjsAciO6mDKWRNv1HCynC4dIEanWJej3Yz8TykXV9azxBcOqtgr8NS6?=
 =?us-ascii?Q?xujsb9tYP9KNiX1z4E47G+X1PYCjEz3vmlLFKcu6wSs5dwLMtdNC+39AHvB5?=
 =?us-ascii?Q?RHmG+kytreUNkFOfQbIqto64TkDBC9MAyQ4QmzpNd6tm8TrwY29PL0QQMdl6?=
 =?us-ascii?Q?YsLTWbw1+IeowpiWgQnLNWSWWSmCsgy6+U/uSEiBlLgzgI9OEItgFu3QZ/YJ?=
 =?us-ascii?Q?4gdMa9HSEb+x50n+y8zdit78ui6ycbQ3X0+I5aYxRVXHI4HgkkUKYppfMgbt?=
 =?us-ascii?Q?bEAgWbaohXH4xSKjxm+XOG+RrTXsu2X0KWdDxOgIG0YJFKwZSHMdK3RgegEy?=
 =?us-ascii?Q?UKEhSnd+FGQebBxA0moTFhBmOEsk24JMq2JwBxTlJU2fYG0Qukt4KqyxAeXz?=
 =?us-ascii?Q?KREwTn6nhOWUnyQk7usBIQGCOSvI3O0z5U6ivSUE6POzkMy7geuy6FFmZuqS?=
 =?us-ascii?Q?UR66q9RlR+E1txegCoh3LOEOY226SnezIWRDdZeihOysjAEgeQJXQuBv9JWu?=
 =?us-ascii?Q?lpqglVXk/h9woY2RozhFoJVY7JNuPE8dITjbRiqfCqUjJmHV5RsI4oV018IG?=
 =?us-ascii?Q?q3IPzzIIwHWPuB5dqVqXDPr7FjNumkcKhFM8nYfD4YTyPC/EXd727uNenMq+?=
 =?us-ascii?Q?rdaittVxZXS0Beg5q4NMMdlDbiiVF79hLg1KvoU5uqId+EFIa4R/ZNzxFiOF?=
 =?us-ascii?Q?MFzAvT5/JVnHQsyvU6Gvq1HWVObCwcaK76jiVm3prL+ooGsTl/5QncMdf4p3?=
 =?us-ascii?Q?Yk1ybNbNt4rh4tw1H8/FKNa5+/X5SFKSq6QrOV+MYMb2WQQh4t8F7yfu/nta?=
 =?us-ascii?Q?tKyzNDch3OO+IfRW7qgIAvY1GblPbuPVPIsK7F1hY4dkMZKcQcMZj9iTMmdm?=
 =?us-ascii?Q?XtyX8wo/6+y5Sa+4zZoBS92qdq0OGfNz1bCW9Eav8tzydvPFvAvHR2s+Cfjx?=
 =?us-ascii?Q?+M2WQld7adU9LTt9VdyEFeuT1cjYo5Z50TDUus28z2NAZ6mAGUPZsTCpXnSa?=
 =?us-ascii?Q?n3j/SCGX2QFaIUH/vsjyNY8URKVs1Pzv5QMZoCBN3vYjOB3lzrxXc4FMFKGc?=
 =?us-ascii?Q?SUhgbQjCbHCoZXCyQ/LLxnktEFde?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4G0VwOuX6il6jflIGywPpwGDzWgg7QOisAOJnsXLS0pFmleDtTHXWhuDK0DP?=
 =?us-ascii?Q?PKzes2Bhv2TLkwhH+oGSNRlUOoFiAIKKVhXjn1vM2AGS+Lsfss3Q0A2Lu3Ar?=
 =?us-ascii?Q?v4HD2LUZaxqXoD5Vry9W5Azq66l1YO0NatJn1pOu81UojjKkcL7hkQMr3ct7?=
 =?us-ascii?Q?yBRPzi70XqehhdvDfG/CpJ3fkERWMO6j28WGrEl8ORDZSHSSt5wiCRojH6Q+?=
 =?us-ascii?Q?AZyVpzn3TUVRW01UuTEj/D3Phml35vLfgjXlqQUtPNS5MIOYpK1JxGa4J/Hn?=
 =?us-ascii?Q?Tb725HLBenZAc7XUexWRLEq4jIEMlgrqrO2gMlOWfoy7Z6WLwLXmL9jyc73y?=
 =?us-ascii?Q?/ky8jSvMNS1QkU1qntBCBID6aRwTP6SiKTa6XPZb9+Q2UDwJLLXscUcIBdBy?=
 =?us-ascii?Q?qMXIjlUhQ30zSGHNcQFeFjTLQ0OZJ3JaElEb0n1QQSjgIpM62QkZoTMBzxgp?=
 =?us-ascii?Q?UpaX/6QiiwH/faCj1WK+e19uY1KiwouLpceqyB3ptcZgiJCz5neQRX4ye1/n?=
 =?us-ascii?Q?TIn7KueQNP8Rd45LpA2yzXEc0fHotxbSQw4P5zH5jRnvQkqkOo/x1NZaTkxJ?=
 =?us-ascii?Q?Cwg58ebFQCQevUjpPAFjPP1XXikLCjOYUfUEfNhpT2d5sQQT1UhxY+o2ibGj?=
 =?us-ascii?Q?7RQ9r2WFHlunklwyHlrTze+dFfzRPLyNiaTMH8PjP1Md8+sDKRy7EOFa7mn7?=
 =?us-ascii?Q?vwvSf9L9axgygmGqP/1TuqzE4b7UKs/kUzlVkmzHES1HijqzjOsB5X0ip539?=
 =?us-ascii?Q?U3ZH97H58vOAO5uIfJLbYc9NWpttb4TNIa5Pz4/jCqB4M6pellIBPZpJeOsa?=
 =?us-ascii?Q?HV73/KjZdRiyEUP0g1Lg/2to3/ZFLQq0EoPYF91VPH0ErIJ4Ptkk+zq5sdBJ?=
 =?us-ascii?Q?c8AAYfV+m3U6zPKjjgT+R+td90eN/1VN3O0u8pwr5fAmvIJNvM6G3g8/OzBF?=
 =?us-ascii?Q?/Qs3KlRxkW60FVTtciDRbyDKrDLc9EmdpULfejoSy8bX1CJI/qf5ZV++FbRb?=
 =?us-ascii?Q?UoGxlrnnvfv80tgSurTdIZMsTbyWzzHWIo2R4GEZa/VLcetxMV79lmcQ1Lln?=
 =?us-ascii?Q?kujEzUF32qqBmMVmAw270JDIgzBhcsR19m0fRxqpW4/RuueVL1A3BU8C4O6d?=
 =?us-ascii?Q?Nn7Uma3UhmHV8iQ7vfJvfkcqKyXG6Xp6ZMfiMBg+cyAdAYZ+iBWwwObPfboa?=
 =?us-ascii?Q?kX4AQlwPMEZILAHkDnF6jwfb+gDuLvPMFWgS2XWKwvr5EaPFn8ty5GJ7shgQ?=
 =?us-ascii?Q?AQfEk6dY6US84pnwVGwijiiTEmpBo6XfIsboEq/NRbvkLG7n2fv4bxkBnIpb?=
 =?us-ascii?Q?NSmQKlQrKRG1Uh5imAwIw4tzQkplppdqE5p+49YFoC6aXECrx2L3g+rf2iV/?=
 =?us-ascii?Q?y01Y2+8XYnyDbUpqAmPuzB6s9MbiqUDlK4rZCeyTGBczYf71WZyTgJoNxt+M?=
 =?us-ascii?Q?24uklCVWmLt7sR6AnBniRPOs1tzgMk045zVp4IUNblhd6vBKtpGdPqTnTuKH?=
 =?us-ascii?Q?ry88KBjyZUGR+1aF2DsS9chs03k6IhqhrizBdijURYoIZ5T/oOM0jNj9B3fg?=
 =?us-ascii?Q?vQ6KxZcQg01ZhDynysMFxkRG8Eqcp9G+EYk5V6KQZ/xU1zOjE8SkuUybYHpV?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c5830c-6562-4ef5-b6f2-08dd50383a26
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 16:20:58.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4/HXro9T4k9Cz32auxiTzbn8h8wZAyY9iN84Iwd467fZ0InDQ/7D8TAuZOVuEClCFjHNI3oTjEJihbbS3KcA0j9t03vluyAx7kXqa0j4R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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

+Daniele


On Thu, Jan 30, 2025 at 05:59:38AM +0000, Aradhya Bhatia wrote:
>Wa_16021333562 and Wa_14016712196 are permanent workarounds that apply
>to multiple platforms. Wa_16021333562 applies to platforms ranging from
>TGL (12.00) to Xe_LPM (13.00), while Wa_14016712196 from DG2 (12.55) to
>Xe_LPG (12.74).
>
>Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_ads.c    | 2 +-
> drivers/gpu/drm/xe/xe_ring_ops.c   | 4 ++++
> drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
> 3 files changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index fab259adc380..e7c9e095a19f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -342,7 +342,7 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> 	offset = guc_ads_waklv_offset(ads);
> 	remain = guc_ads_waklv_size(ads);
>
>-	if (XE_WA(gt, 14019882105))
>+	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> 		guc_waklv_enable_simple(ads,
> 					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> 					&offset, &remain);
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index 9f327f27c072..29cd7b548493 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -192,6 +192,10 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
> 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
> 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>
>+	if (XE_WA(gt, 14016712196))
>+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>+				      LRC_PPHWSP_SCRATCH_ADDR, 0);

this has a build time conflict with commit f0c06677d110 ("drm/xe/pxp:
Add VCS inline termination support"). AFAICS it should be renamed to
LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, right?

Looking at the impl, it seems we should also move it earlier, so:

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index eec623ed0f562..839a19aa46f46 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -177,6 +177,10 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
         bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
         u32 flags;
  
+       if (XE_WA(gt, 14016712196))
+               i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
+                                     LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
+
         flags = (PIPE_CONTROL_CS_STALL |
                  PIPE_CONTROL_TILE_CACHE_FLUSH |
                  PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
@@ -192,10 +196,6 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
         else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
                 flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
  
-       if (XE_WA(gt, 14016712196))
-               i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
-                                     LRC_PPHWSP_SCRATCH_ADDR, 0);
-
         return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
  }


because of the rename and all the other flags and calculations are about the last
emit_pipe_control(), not this one we are adding.

Lucas De Marchi

>+
> 	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 228436532282..ea72bcc02e1e 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -43,3 +43,7 @@
> no_media_l3	MEDIA_VERSION(3000)
> 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
> 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
>+16021333562	GRAPHICS_VERSION_RANGE(1200, 1274)
>+		MEDIA_VERSION(1300)
>+14016712196	GRAPHICS_VERSION(1255)
>+		GRAPHICS_VERSION_RANGE(1270, 1274)
>-- 
>2.45.2
>
