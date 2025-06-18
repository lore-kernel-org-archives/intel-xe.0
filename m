Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4D5C7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 19:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B710E46B;
	Wed, 18 Jun 2025 19:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zzc2zn4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3988110E46B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750275510; x=1781811510;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2WGS+Qi5vA7wIwjSg3KtUacmwsvt2YKe8cxwiQCI1uI=;
 b=Zzc2zn4lmxcML/QhA/8uDZCOQSXp2/gTL2b6OoocYUKLQYJG/LaCajPf
 7w+UIRlHooZVX+hNlxVtT27H6fbhS49VYQDIopPM3Xpz8BOXR8q1kmkZt
 ltYkiAb19oUkTHQ81+PhgG1YjN3gdPVydpSMthO6pyJR8gOsaPSLoID03
 d1TRbmp2fFIh+c47PbqQb4Moe41xHXWtW+RkMOQDwZTwAudiLMSTvkdxu
 CruOAILqhVuJXZb/KLYViiIiMqUFEPohiAzhOYNcpverpWhu2/s8mTkfw
 zK7PpVNfOU8gILXdbVxGmMOiuLlLanhZA33kQMEstKpodj2fBV8Bs3Zvb A==;
X-CSE-ConnectionGUID: fI7WN17BRz6wUnMCFkIxlw==
X-CSE-MsgGUID: nev1Pg/mTQiCg5dVrQXBHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52215042"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52215042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:38:28 -0700
X-CSE-ConnectionGUID: zEsJOFdXTYSSHtsHkdD7bA==
X-CSE-MsgGUID: rKEt5hvGReuO7Qj02txm0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="173704870"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 12:38:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:38:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 12:38:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.48)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 12:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwH7iDEmeEKLQ7gvcXdY0Z5vPVOapYqWR6mDfdkMNB15bOwgZY8xLb7GY0H/iGGUccMxoxIYY+LAGTXH06gE+RuC3W0dm58HBcjSTC7kuXGn1pQFiu+Nc/PytGn1H45g0GAGi7Ez9lYg0R7UoIvDloYGQ5Y+yEHJSoOIc70j0qHHbY7Bmw3EqVkhAqCfnOQUr2vfHEDQ4ZURG13T+PN/SSaIB1jN4dWXaPrCLCBXFMQn7RkUJVtPGFxkeVWQEX7tVJIhFVdl4W9dbC4gtcpBBqsBldezHpyy64EV64CLy9IB6nCeElyyl7g8g4Yfdw0Qra+4AuGOw1sgz5F8Itvt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBrIvQnuVJ/q+1BDVD/CVH5V7F5Vd6IvJyhWmLz91QA=;
 b=kf4qU+ekBB2fx13qbHaXXzC5czBOkBf0AT8x84gJHA76SrsYW/aLoe/A7OcMLI2mo4u3nJ+tNc3uJ9KCMJvIsVLNpjWl6sALhKdX4gf6jnQcavdYN2xedh75jLI+Hn3jg9pcQwsn+w+BSs4npms3yiAld2eFPLJY3L241vOwKwLDEzcXM7AWkXHqKn3S+RZsRbAmgSSyrI6oQi0zhU6hsgRu/PdEplnmXGTprFD2AXPFmhatOfSXzq6Gs0gYHKGYgMDHJNrtMXvHbw3siaCQ+LJI4tzK/t2rspQnU64m7B4vinjqmIQoaMyQ1gMizEowBV5RAQuYvCEE7LpmWtj9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 19:38:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 19:38:10 +0000
Date: Wed, 18 Jun 2025 14:38:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/9] drm/xe/gt: Inline gt_fw_domain_init
Message-ID: <dt4on4rh7lx5bb3nqsjvhbbtau56w7az4fvwwo2rmfn7afrj7w@oajeptn6izes>
References: <20250617180132.7059-11-dev@lankhorst.se>
 <20250617180132.7059-17-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250617180132.7059-17-dev@lankhorst.se>
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e762ca1-3d40-4bea-e0e9-08ddae9fa861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eVFEKYUlwGNloV8hh/ePoT47TAyPOPYllPmNbLDJsY/tShB3nUOzeJTisApC?=
 =?us-ascii?Q?Ii3fNANrNHYmmPUNsCVWsNAl/D1vf5g2ObeK8pgfj4AUNESqbkFdcfbjkhXH?=
 =?us-ascii?Q?kT3GZhkVDFpIw0T62G0p/ctZe+QMF2amhDPBNSHl4qnG7GSjXcdHV2bZrz1X?=
 =?us-ascii?Q?Y1+FoB6ByugFBTQyBBtgPKTSkECTaror9oGSDaE5VHS12GuVYWJX4G5ftiYs?=
 =?us-ascii?Q?bbds7iPL3AcVVEbTMT3iogktCKCJsNvh3zTNebyhfG8keAxQQFKqVExTsBr7?=
 =?us-ascii?Q?irzSD8Xwl5gnZxyKkeEjDJ6pAtScv1mQbxGq84hmkb1wE8nbpbScX3Ceb2XB?=
 =?us-ascii?Q?q19nZ9vyL/wjpRjnU0tH0I3reMn2Da6FRWdaykVqre1auyRs4fqj7efFOWWu?=
 =?us-ascii?Q?yvr2+51utINl/2cVPzd+9JXrjM2ke71bD+Tc7TSrbJZ/zK+qbDHNZ5nIA32s?=
 =?us-ascii?Q?g+C38vD42LFKSW2yvJkWR72dwru+I5AKUriGfed5KSAru+Kdoi2P3AZ8u8qR?=
 =?us-ascii?Q?y7759Vut68FDggU0akSxSd/KMa6F/h6w5JvIn/GnKpdA1kQDe6H1yM3Tq18/?=
 =?us-ascii?Q?OvA+KI5An3SkUv1ThZisylwTtPrwYmbTxnmwCn/ar2ZteTEgCAs8KmE0P+Rl?=
 =?us-ascii?Q?XqvSsglsX5pMMnu+i5lJ62ZORr7pkamGz7EQAP34MfpmcvNN7FK6Y4HvIqvg?=
 =?us-ascii?Q?sPML3YOiUkySGZY/HNdyg96tpYazYPN+OwK1EVuuSrRdU2AzpEQg4fQ+eWKV?=
 =?us-ascii?Q?G3QJRa9KE5mTrFcZ36XI3h5YazQSI2C4ce90lopTGFt5WIQqlt1Y15QQ+Uk/?=
 =?us-ascii?Q?JPecaf0iQ8lsyNzdexwNQ2SsCExgDxanF+hEMLmkHcNe1Rv6Vbqocd8tWp4u?=
 =?us-ascii?Q?qo4Vh2pQxIteovM0QY1k+z1W8A+hiasu516GUEyWIqKYaqq5JMIhRPukqk3f?=
 =?us-ascii?Q?twPszKe8cLqZzzo/18eIfi7+trIvSj3Uz7AlVriTvf/V1Oemp58k5fzlX9VO?=
 =?us-ascii?Q?YSTQDNVvDTLIQINGhEPnUPHbXnQ/3GeoWpilTf7iRZiuyh3kKm2E8rBesYLU?=
 =?us-ascii?Q?r3tUX8vcGtZQjkiH8NCBe1CitRlt8wrvdQ24ublZCuTSf1vD1L1UHE1Etwkf?=
 =?us-ascii?Q?fFIdE8haMjopilzIUTKaaYaW3nUNtTb1uavVj5mAnGLlUsfyz4Bc9MRKmmUv?=
 =?us-ascii?Q?0JIss4GAa2loMZTX4aB+AIkWLFf4wfwvR3ZlZYveA2juqwazdkkVV2G7onC6?=
 =?us-ascii?Q?PCM4gO7XBPxcheM1WDto2dyypEoElpbY0Crc+KfAaqUyYzsAPOfDp6Dnv9fU?=
 =?us-ascii?Q?GzVl2+xnupvIZrarY5/s9AT5Rqzfm/SMVkYzn3aXK+Xn8FrEGO+POp1EJbUS?=
 =?us-ascii?Q?rW2AKglT4hxx6OzEyexeINr++R3L9NjfLrATDFJJ1Db02KCRtla5bYjnkw9A?=
 =?us-ascii?Q?QDsUNSibP8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wF5S5wWsJduT4XL76u9kjVBZr+ah97ZyYgC1FS5rTsFZ019Kft79dMnAsE8W?=
 =?us-ascii?Q?cgyacp0jETektMZBnY9yu8ig453fnxKevQMNyKplM/NQdTlUA86+saKlCuje?=
 =?us-ascii?Q?amTHd+DkFNr/ktWiNXIFGAKF+wmyAd4zIQSxBaoM5YEuteMJtklGjXWOpRLp?=
 =?us-ascii?Q?8WFhmU3UYuZfFWdzR4zoY0qlgBHP7lzIVj2Uqk6cW3wzAsg0QW7PcHUiTjFu?=
 =?us-ascii?Q?0NzMxE/wOxQnbVWrupPoLoQ8bW8LtU1/+jK0mhnr+f7PG8Z8zj/ygNcqw0IF?=
 =?us-ascii?Q?Pg1o0b6M0sUDQOOol9z30fVzBgoO5iQUYxQ4Bjzu9TInsD3+8jp7Krb1Fu6V?=
 =?us-ascii?Q?ewengegxim2UcCqAWt4a6CfhaqAZjNSnOCAOlZxRj6/yiQKSo7hOKCU9xF5n?=
 =?us-ascii?Q?ZnXKpFjcI5XUHh1qrkxqBgy5Gly+5mvQ/sukv2pcLsCbf/59tvkpijOinZ08?=
 =?us-ascii?Q?BNR3zBwOPDH1bXxyQueCrLCmnBd+aH5oYphxJQvrejqaLPAKATHZL37vEQAN?=
 =?us-ascii?Q?aLu81WM3X1l8Ms6g5EwgL0EFPpOMEVV/JEsw8ahTRyOiJOBw/P7d2KOo3rkb?=
 =?us-ascii?Q?idB193MIu4PzkOkeqsd2gOKqm39XGLOhSquJCH2l1YpPSwMThX7LrN0dLxUj?=
 =?us-ascii?Q?BSJh+osVlswOEbuP0y2feaPl6kLopfzxkTGgplouAdgY0l2h4Io/yMXOrpEz?=
 =?us-ascii?Q?V5VsokqM6efA7Xfh0TpdH6MqeG0V9mfFGwMn/LOK8okIc86aOCE9RLui0WZO?=
 =?us-ascii?Q?7igMxeYAmvmcXDCowecdjE5r2JigEsSJJFl7Tcdsxm3lC0WammXB24SXWvRT?=
 =?us-ascii?Q?7pOip7lA37cAeqe/46j1QdO3pg+9dF5QkcPxp+CWDz4sGJNTkep9cVbffku1?=
 =?us-ascii?Q?jijfDPZi/uXcuFaS22wTynJRVFQRvRdbPvQkqaesu0u/Rsm43f14BZpd1gPU?=
 =?us-ascii?Q?yX8ZuMREYG3qChNBjk6eb/NVJxK+c4b05C3RqDvWcuKEQBHA3cPmok/3QAjh?=
 =?us-ascii?Q?sBdU+CzjjQTfpe2ZRE9s/pbcSmnkMMqO1EFJO6fav7CjsBrNjE5E0tXlA6yE?=
 =?us-ascii?Q?LTDlGmK6GjfsaP6IRZQxnyoPCUdcPD7+DTRgqC11uwC/viqsGJ66Rdb5gPn7?=
 =?us-ascii?Q?gCdV1d3Z2fc7RB7hsEeQW4cYdea2kMS60f8qroi5uP3ajV4eQfgbaXz54uSU?=
 =?us-ascii?Q?932o2ZsY+vjykW8JZoVhlnpTnoNa1h7vce8cwQ5mCEHXZrSx0Xf4kU9mvVR/?=
 =?us-ascii?Q?dd5jjZYwPXAAPJwZDBHPDCewU56An5QdDSQ5aFM1YraTZfXnd3YDHMGOzE+l?=
 =?us-ascii?Q?STXGlgEJq6AnOCvvFW7q7ew7eriDhIs1rAcYRjfYTqAcBa4u65+lbmeO9SQT?=
 =?us-ascii?Q?dnyb1mujyEOA9Wx9DV4vQkZR5Ztj2MKNt/fSN4izfZ76YA0L5/F0SvnVBJeF?=
 =?us-ascii?Q?DosmQhS11AbqAZpDXHQHvWmJJfQJlBcKMCNR6Fz1B8mXiE1ZrN1C22VqRX7B?=
 =?us-ascii?Q?/9h4+VozkENhGCrd791VzK4XyyVvtxqDR9geywJdbef/WzHOdMQJ4KeL4PWX?=
 =?us-ascii?Q?TwcCku/3fhE5iPJrbNEaDOIHKXk0K13S0h+sV/VVKW9TLCFxaTJNTttGMKZE?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e762ca1-3d40-4bea-e0e9-08ddae9fa861
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:38:10.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kOCtXA/vJOmDdHKpbtQH/SYoD+QTQTWz5t2OURdFIu4Yp5NUX7bJ7sA4YRfXsC6FwkuF+savGG7mLmhp1BLQj1zdV8YSKYjOkqSbr7izB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
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

On Tue, Jun 17, 2025 at 08:01:39PM +0200, Maarten Lankhorst wrote:
>Have only a single init function for whole of GT to keep things
>readable.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/xe_gt.c | 100 +++++++++++++++++--------------------
> 1 file changed, 45 insertions(+), 55 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 98360986df7db..1b239d185fc93 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -440,59 +440,6 @@ static void dump_pat_on_error(struct xe_gt *gt)
> 	xe_pat_dump(gt, &p);
> }
>
>-static int gt_fw_domain_init(struct xe_gt *gt)

I think the main issue with this function is actually the name. It seems
to be "initializing the fw domain" when it's actually "doing the
initialization part that depends on GT forcewake".

s/gt_fw_domain_init/gt_init_with_gt_forcewake()/
s/all_fw_domain_init/gt_init_with_all_forcewake()/

Lucas De Marchi
