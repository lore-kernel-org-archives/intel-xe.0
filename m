Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFDECA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 16:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EA610E07F;
	Mon, 18 Aug 2025 16:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHeR0Dvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E386410E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755534850; x=1787070850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fh+hrO7u4ET5PPncEMn6z7SA451Rg3cGzTSpo+T7aXE=;
 b=CHeR0DvbNcpUH/BSMXhG0i1ossqeawS22h4UJL0vMGFyZJCPbhOYhIkd
 gdgQWDkMl2K8IWmAWLPN9j3+fXptWftKRybnSnuqLOVDq6WHcM668uSvw
 kHoMWsuX2iWzBpPiHqnHCLXKewk+JhjeJH4M6HgBRN0ZcPrpd2Xt+ovQX
 9D6MVrEfXmlwHZqDybcGzNMs2d/EuF6mfCTwNJCufFuS3Bvq+DdxdzsgV
 Vkxo6dFkiqSD5mQ/PLKjo2ZddFP1DZon2yhd3bFC2bhNd7yVCLPKkF9yi
 AIOrsoVQrt3DHD+zm41pxTj437TR9CCAResF85fQJKqFNbYx8YRJ8vbeH w==;
X-CSE-ConnectionGUID: 7PmdBd0hQ1Cwi/hjQFeO4g==
X-CSE-MsgGUID: /IwZp0QfSCyXgQjkNiXIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68860175"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68860175"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:34:09 -0700
X-CSE-ConnectionGUID: /mZpnHhCTHSRFlOmONhfIw==
X-CSE-MsgGUID: a3cXZHIjSU2Wd5yZuvoeWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166859924"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:34:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:34:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:34:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.87) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:34:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8amhBhsjU12ZXsq/vfV+DVOxqdCdRKUljElQV0NHo95JKpX79TLWEMncTEc8//mVC8BqhjBRBCyX+ZupkGCyJ40UwsYJPFh9GYhLEjYGRZg0uHpJg/hi4mb9OtMajc35GcKkicnEBhrqird+SzdKBtsCYW8m0m+H5F4uyoSqUGelqxrpFIRvla9oBsWa+Wb09jBgCyqN/KiRGfTU9VhU9ocBRjBenY1uhMkfyDKI8N9ozYJWw+ilrUlJV+nYnCoevE369WRolvH0zTcuJfSYejoNAGFmE3froCzMKuoqTbg0PVcJ2FC/JLDAvcTFQ9WJL4gvmqX3/fbL2/vafWQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqWjyZgqLWYo1lqA52tTpb+BCcRmxUmsnJ9/LdYjxbA=;
 b=Zn3CE0o0tL44MN7jO/7tPH9iNNNIcRuo9NHJx0+ldpkyihsGFMSK7bDbbFwRs/tT5uWit8n+4A5kKtB0AJ9htzuVD6YpazfhdTAU78tiBY5YhK5U20WVDHW7zo93kpifP+7cXdji+108E7axUBFv4U/Uxz4LC1+08SK+Iiqm4sFQHDGHoSKD9FQO+nLOdDsw27znR2vZ5RwN4PCxmxzfuqkZndNNZfNDcdlR/qeFGRpcwlGiriv6meVe/OYVnvyPDPRlWFHhbuvYcxG/zdj1u4Xzs0/VbYt9vU32ZTYy5G3NtCY/TcpnIQeoB8klOH/VXjtoX2nhPVTanlSDzuOyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8065.namprd11.prod.outlook.com (2603:10b6:806:2de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Mon, 18 Aug
 2025 16:34:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:34:04 +0000
Date: Mon, 18 Aug 2025 11:34:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood
 <matthew.s.atwood@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 6/6] drm/xe/kunit: Extend platform generator with PTL
Message-ID: <5tij7kz5idrln66bqyqp2rvptxugengd56vg5rtngdszqqeswi@ib27jrcaeyae>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
 <20250801181350.180780-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250801181350.180780-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 18dbd890-5c1c-40ad-c4fd-08ddde750b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qu5E98sZzRObX8Nyes5pOdM3adOVYgdly0yf+NttVakafcRR+dvlFHstr3Ik?=
 =?us-ascii?Q?bWbxck43XPCMUPbS8ibqyLBiwdSpqqpirodNlipCCOJlkiS+M4wM0gKSqeaI?=
 =?us-ascii?Q?RvpT2XC1AfxFpWMU6NccPCgpYlMSP1D9GD2moJYcpTB1jBO6ji3QFOOCiSE7?=
 =?us-ascii?Q?qtdMB1rQ3bJ1P1Pp/6O/GKIPdJnggWyOo7dacX+xhohia0PsbhuKyeQrkcZw?=
 =?us-ascii?Q?gueOZDah3DZw/jGA2E3htdLuFBVHYnheIGruWhEUvOmKfgXpMlPAAucN1B4X?=
 =?us-ascii?Q?RE+dortXz/GGQfQHwuwPP3DrLcNSGmK/Ml2/pBm5HkS2FbLo1c8fYTKZ/ghl?=
 =?us-ascii?Q?hy4KEXRo6ZRbx4p14n7g72KJyxGEQEUUxWFPDjNQfLdjFZfIOUt7dP+Tovnq?=
 =?us-ascii?Q?LIHCi9RC4BOJd5K1wuiwoMf4N0fuzY/CbsGXJowLy64Oh4sxOmzJhc8HyB0O?=
 =?us-ascii?Q?W74r1EaUQ8tgZtUaobqnp3Qp33x5pvzRVP389Hp57ogmJxv0wosGzN7zt+ZU?=
 =?us-ascii?Q?AgHJJlfOLGHnmqOp0TC4uvLBDd2hGGMsW76jQ2jFIpAc4Drf6Z1e7aJEoB0d?=
 =?us-ascii?Q?8Hqt+AgNHT2L98Am8VHBMzWDCtAu4WStThPJFqOOCdUgays0hXR7/ySVnSdO?=
 =?us-ascii?Q?8FttqZrPAdGk5/lD+DodqUb4JsUGokM1dQ8zheIgVBoGIoQJ8J1Ye4DUO6fu?=
 =?us-ascii?Q?fvWR7O3Jwuaypwuaq+qojxgTOrw/wKLN3LDNnC2wQpXZy9IYTveUqRVjZae/?=
 =?us-ascii?Q?hzgyYWlvMp+pC8oQAhTBCuKMhGEylIHX0khS0N4gKsBOMIV+cKaZpr/wOf9l?=
 =?us-ascii?Q?hF7710RTGuh1oEJwjl2KkK+LQoZ9Lk/g+BEAZ5QsrUnYIZ+bSHeBLuPXooI+?=
 =?us-ascii?Q?PEpVyEVDj1q1pPPh8ZsJRFDXdgylAWe+FyhbQbtBPShuoLYMyG7eHedThhXy?=
 =?us-ascii?Q?kfyS71KIXIlbzZfl41ysitzznfUOtrCtj1QIeq8W9iwSBQgrcwI31eygWz4W?=
 =?us-ascii?Q?2yKx89gx1prSetkZ7pAKd8pxD8RVyjkxwkJkJ3HAaGCiZyG8oeLK67ZGlXlQ?=
 =?us-ascii?Q?mdL9ttxYyAysLAKfqTqZBNjs8W1GwHu5QP8cCh+VDJnQ+gOu3weRFpKvkwyV?=
 =?us-ascii?Q?uMDPWRm2wSztgyQBuCFojCcypL9wxn5HZ6FdleW3tZgW/qvl9qw5+sEnHwQN?=
 =?us-ascii?Q?0oF/Mmd6FRuMhvno7/WU2aK/sv0a3arJjazLleph46AWf/NVHnThrpkRB9N7?=
 =?us-ascii?Q?9J6RmcdyL0/oW3vhRM+TrOT8+E6AN/TFYXOkJ5FfyqZV4+ExWOD6hI40ghpW?=
 =?us-ascii?Q?2vcHiZPNamAvy/1imhH/Zdr0SnFx0MGvLx/LONM0bXWZHXEZeFY2SI2rdjQV?=
 =?us-ascii?Q?k1IvU36K7kd8X9PltLisKzOf5ZotrxtFhSfb6Og1CE6k14au+u1cvwhluNx6?=
 =?us-ascii?Q?BSOng325Y9s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hxcVBhOajBGIRsdUEyTUOXAABftyJRs1FDgMxKRG/ZmLhn/K7xq0CVrwhFH?=
 =?us-ascii?Q?IlAVIBUDEMtGtmV1+5wrTweW6HqFqR1yVqflAI8FGnm3PAx59quV2gl8dW0Y?=
 =?us-ascii?Q?3KAO9SfuW+3chj2/ZxSDb2ltcUNMe46vSmmo+RJPCfvLmNN+U6lPqTvBZz9a?=
 =?us-ascii?Q?VEKDFhY//K09kIwM4W125lxB903HmWXS+navOk51acd85esLjDWwJvxMe9+c?=
 =?us-ascii?Q?OJe9gAXCAVfXL9MBu4YvZ+P6cwzf/FQWopVftXPvt5iRQneL82kp4zL6nLCd?=
 =?us-ascii?Q?l+zePezpXidzONY7PsAFCyH5RihfYCgzTtI/GLy7N3czH34Lx7Qdt9hiTAIW?=
 =?us-ascii?Q?nVERJ8mzLaNlm2SjHxhWD7QHnASrI1ggXttfa8x7fRv87Vb++A5nj1EMV3lW?=
 =?us-ascii?Q?DG8MYkDrZ31ogWH4rkDZ9GDmnafifFo/LNqGXx8ncp0im1ik1j1vZHHpOH2k?=
 =?us-ascii?Q?oxFC8qO1CsvfN8l+eJiQd/j5vB+Clyz4b2dvnjpLO9YalpFxF8SvgFIbpRAZ?=
 =?us-ascii?Q?YmM+7bVQUEJe6Bw6MFwez1qoHIUCjotheCpsmqzIWWxPnJHHVcjcgj9OO/ls?=
 =?us-ascii?Q?W3B1ktrARVbfjVKgq5Vl7mo3BFYRuBgfYodzLa4vYg5hbO5364Lo8wjbKjau?=
 =?us-ascii?Q?ONZ2AlqpY8QpWJfbvEC7rgbWPrVnGhc+ih1/NmVYnlXJQ2UZXqcUXKqymD4F?=
 =?us-ascii?Q?t0r1oqEWIfw7pL3bAyclmF4jTw+zZvWKVkbgZxkc14yDb3rsI4FBS1OVct3u?=
 =?us-ascii?Q?jut0yyu/zbKjmEIp4PzMh2qO3Lam9p1pAgCyh1F7avjjIu11q6YsBmK5PXXx?=
 =?us-ascii?Q?H6/5X+D8SCxiNy2QIS8aQyLAqmvvrud4gjjZG7TyxgLwjHs5yBA74LCAlUcp?=
 =?us-ascii?Q?6toH+mOBX8ZD81rKJlQ+s/TWcgFDfYGoEqNSQgcg2Rwl+1ZewcSTpXQ1Jzze?=
 =?us-ascii?Q?XzW689IB4fejtWM+vaZcVfjl6wHMn0Zdej4lUE58gLFE5Apet3t1R52Vkwbr?=
 =?us-ascii?Q?Ly/9s7sgBJ5DOUAtdeAszFD0cTfCGCi9yZae+/Im+9VZv+r+lwK/RCHFRSGt?=
 =?us-ascii?Q?MELEyF3pkc7FBykY+tBKv8DuKompA9yxK3GcFG5Q2wrDudAOAD8MS2PbOMJA?=
 =?us-ascii?Q?dh6NJWW32/+ZY0SNwOVoZ6GGy+y5bUhlfZZkFY7K2vEuDNpE0+MWF2qVcZT2?=
 =?us-ascii?Q?0gJ7RS245hmGorMMKrKdBLdGJcRGY4mvZkGDHEJnliXW0oiKl6vPowETYLQG?=
 =?us-ascii?Q?qpV3TB2Ex1ulSZ4sbGhfyq9OyPzFMAtFRQbMxDUckjSiSOUR/KDEaeMuISzA?=
 =?us-ascii?Q?9Grq+IZZqToU1FrBmN8wXdyjuOdkelFf88plFIdkK4mWiPf90nRGtikkzkBm?=
 =?us-ascii?Q?bxS0tooF8SeOprOn8Gb5MhjsVMaezHmPrBNPtS+K3BDQgmUx9o+HsJVJplL1?=
 =?us-ascii?Q?od5N89iMt92Z6Z355FHleKlvuIABwslAsI0ZQV9+lZ49vNIsmWug96ELpr2o?=
 =?us-ascii?Q?qxA4RNxkSVV7nZ5aChXPAeF/7Xl+7+TaLcOpCh1i50c04ry9ugDZnNtSQdDD?=
 =?us-ascii?Q?VFlcRtplAvUQwUTZTNdsbS9WRwt1kJekKmPc65LzmttuSf6wbq5IdnaGyYia?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dbd890-5c1c-40ad-c4fd-08ddde750b95
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:34:04.4579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnQOrcdb+mON4vgs68k3taGjdy732n7qFkdNpaRugV66mfG9gSLErNtbS8vZKNE+hIEfi51t03dxPcbLvScJa3TdFpIlpP8y/D6TznzryhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8065
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

On Fri, Aug 01, 2025 at 08:13:50PM +0200, Michal Wajdeczko wrote:
>Our list of typical platforms used to generate test device objects
>does not contain any PANTHERLAKE. Add one.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 90c55f72d687..f1c3ea015725 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -59,6 +59,7 @@ static const struct xe_pci_fake_data cases[] = {
> 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
> 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
> 	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
>+	GMDID_CASE(PANTHERLAKE, 3000, A0, 3000, A0),

could have been the first patch.

I missed this for PTL force probe removal. +Matt / +Rodrigo... one more
item to add in the check list of things that we should have before removing
force probe.

Lucas De Marchi


> };
>
> KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
>-- 
>2.47.1
>
