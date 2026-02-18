Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02DDE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B179D10E325;
	Wed, 18 Feb 2026 22:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kd3cRTIO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7562C10E325
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771453511; x=1802989511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HH6zOuKr2L9o6jroOXdVZk8BcwzPxIHiYt6bFaAe8Pw=;
 b=kd3cRTIOx2LAqqlzQHXM8RSP7I9CB2aOXh0TzPAUihuVQ7spx6n0ZiSS
 t+wEW8708imV+DA4w5Rl97UHv9fFVRx1u/9Kah5uiADdRDjjcRyWzITwC
 n3fNpE0fX3CO7YGfwuhWppMSDC62cf1AVcPEb7gZQNtEDj46AxS2yb6QN
 Ek0+nhc9ftBRl41TbkEw/1KNYyElYYzxreqpbn91obH/MkPrKwRFEQxWb
 QTQ9mVwPWqdCCnmW+TBLx5Y7VdgVDX0ukCEC2ttDplAfREcscsZLGDgv6
 eLV+wn52zVvbUfsrOt223+ZLFHxujlv2EtaW/B7Tdr4mE6HW4CS/tYvgz Q==;
X-CSE-ConnectionGUID: bnzjR/VtS/ylSooWdHMWzg==
X-CSE-MsgGUID: EPg4GzoORwi1la9nIa74Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83903321"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83903321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:25:10 -0800
X-CSE-ConnectionGUID: 7DPfKNgRS+WMzG4wbCBrVA==
X-CSE-MsgGUID: OyJsL8S/Sl2atn9ijOHKjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214333453"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:25:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:25:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 14:25:09 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:25:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vs3Tw8YMandnMfmVxVT9ZIHAqqE2L6AdB3MmI2RS7ieYXP5redGkwhqVcpJBn+a0uZyrC+ZwOYlqNfmOQTL4QoTAkvOrkLvZ4ZrKbfapEv7gpWIKOuIBJj088cowfH/9TepJHMzM0jAmAk81KgPsWYgLRon2Ppok4Wwfbio5l+SMnVp0IPmoJryuZbkuO+ii+SkibOipZ8HOkE0JJhAedF6NL7F4VTRBFI7SARmGQkPgmnPR8Au3Zz6S44WKZ8O6Ka1in+qC81F4iyRdWf53YWgV0Hreso5V19QHJ104x724sv/aJq1iYGjFaFLSrZxb4cixPlct/Ts83n1eBatoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocR3zBx0dGBHKxlbXl3xU9ZHugfrGemOBQYh2xcSsAE=;
 b=UgUjUUqFkb0JsBGNyvFZnIxUgtVjJbiiw0yIHVbsNbiql6nQJum4ofsBGabtyWJ/rzcVqFMdgf9peLGTu6adTAYX3P1w0rpaxPJKitIuNkcb0htv3D9YpbR9qKrsCCqBPBOJDTIiLLE6gABAZqA76KqR4bV7QTpwJx37pFSoZeUZmwuK9VJbz2FOZ4vQrLah3ouLYeYpA6K5eIAnfx/T9/IsegYSOYLUKCy/4YZTcMuXHXVpXD+ZM+tn3IrYUx03agkQfjfOcWvpJgtWmzN5LFTA6TKVwVFSfMw18puJ/+xQBrZ0jtQlwQr1pTUczupHVzNwa/S01QksabGy7JiHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 22:25:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:25:06 +0000
Date: Wed, 18 Feb 2026 14:25:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/xe2hpg: Remove SRIOV VF check for
 Wa_18041344222
Message-ID: <20260218222504.GV4694@mdroper-desk1.amr.corp.intel.com>
References: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL4PR11MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd97917-77ce-473b-5747-08de6f3c9193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2GfBldx7hEVLfkocSov9I+klV1NC3NwoL3qJyJQxmVTtdpUTQ0MiwRYLAUiy?=
 =?us-ascii?Q?L1dxOrQ2c2uXyG09FsYwFzmwD89z8uuWqtivavNbGLmjE2FLlJpeS4NSIleg?=
 =?us-ascii?Q?zOvcIPvivYSzj2kYyvb9GyXL3Bgm9mBViorPx998lW9cAHKG9pvUR89yeJOX?=
 =?us-ascii?Q?VR1nkJHsE+t+uXuw0XfeatCYcQnQY4Ra92GfVCHuT4H58Jg9j3F87EN70yxx?=
 =?us-ascii?Q?9NwgqjKUhcL8to90Vsu6syv0Vm0Z77UIBw6V+Q94cEUMSHrjQZ1tr5BGnRtz?=
 =?us-ascii?Q?rYwslmCEmnaPWhmmntgNCdSaiz5EVJbGQRQF8EcK7zcolu4QDtO3a5bFwtLS?=
 =?us-ascii?Q?wnfgnn8E/29Suy4e9sdqZhOTKzOE6iECM3FnnISdofaDDxbyld09s3OrjIkR?=
 =?us-ascii?Q?vEekVYjLJ3a+KahGLL+/DgAnJoJxaWJcuoNrcHlg1SxXGWtn9azOR+qNV0G7?=
 =?us-ascii?Q?wNszEsTQvj1ehM47ZuHm4Jl+R5QTYKRDA6LOOlcb6g3tmV1/Xap9WoYL8ZDf?=
 =?us-ascii?Q?J7aVvxO3nXdvdY+I+/R1U3Dosq5Ylcpl9sAj7dfg2PwwQwrFA8wYY7AuVpBA?=
 =?us-ascii?Q?KJDfOAx60f3WJRKzvK3rAbt2MHnI322F6gp1tOEc+9L2WjpGXR+fVFlWXuMf?=
 =?us-ascii?Q?MNNankqpZzkFOGqtVZ846NJg4LFKetCvfWQ5MTwjH5lGd6Us8znaJxi8UAzy?=
 =?us-ascii?Q?dI9+4JEMgIJf0O+waAAHPoOxXsUAuO+YAd7UMx70oA5fz1Fq3uCxa8m/NsOS?=
 =?us-ascii?Q?HSL7sPvS3yc+QxG+ieTSdWxzkimDAvlmq61ikw2yEw90INrZ0uoFc5K7z1yl?=
 =?us-ascii?Q?gORtmZXY+pmayOMfCjdW3hIBiw9IqNZlEV0whlLJjkChgFmS1ImvjawdMKKO?=
 =?us-ascii?Q?+ehfyu335I/cIs+hdgCytK/P8AO1U7KFpnn3fevVlx5DYRq4TMd9UmSiZreR?=
 =?us-ascii?Q?yzFf6m9EG6QPcc34uJRI58S7lmvZzlnA3xn0+lgXhpjC8HHpIIbZvgiODbcY?=
 =?us-ascii?Q?TyK7oebpKG7YTj8+NzhFKfzg3ZNUTrQApMDIQJpbuqDG0fhFTiPNpQlts93J?=
 =?us-ascii?Q?0PnkU4VCO1f+wUcEM8a0RDGuJ2yMp1MdxPsfVP2YfrPzPkmNG7euhFZKO0k7?=
 =?us-ascii?Q?gIF3Dx/uTPZj/lI7yh8DnukavZKOEV94kCbychjt6bqCBSsUhaRaXDPbWl5r?=
 =?us-ascii?Q?8G4pZcWDo2nWwyWllHsETbzk9/gkDGLkKejBq7SvaZ4fk+ihmwZW5mcrL6qP?=
 =?us-ascii?Q?vyOAz9CvgCbKj691Xry10YssCVZIPpEbHhgTSujLwSHfrOGE1i5u/TGmYlYV?=
 =?us-ascii?Q?3lWLy6/L/XPSzOCifEjZlvNFAtmNOsFykkjon2tMXSzzPC2iDiEUiV0sfMXJ?=
 =?us-ascii?Q?cKcSh30Gq3vus/5V3rrL8jNRAIrfsLVNs+u2ZEu0TTwBa6BI5Grs5JDln4fk?=
 =?us-ascii?Q?gqbl0kyHnIFZ2/3whklScPWezBcZHMICPWvP3WA55AcZysRknakggSZH8oLg?=
 =?us-ascii?Q?zcwrDHWWFmIEIFOI7SoRA6doRRV0y6ZZxC6XuA36ATI4jMqoekxfcY8Exjxc?=
 =?us-ascii?Q?Fs+5tEkADNmAetdQ0Qc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oh+Ogg4zVsQNcpwCVY6V8hW4pIA9agKiwj0V9ZjNGDMm700mnQN+iWO3bMNb?=
 =?us-ascii?Q?k+jkr/14XlcOC4wIIGF/A6JGGB9w6Fq+KFrooCQky5gj4cvx3XGjs0W6hmjO?=
 =?us-ascii?Q?Supf3CgxWUTxm4VF3G5Zo1rISCwQTh+lXAmuYkAhTqHXnW+WMJV1O4UdLePj?=
 =?us-ascii?Q?CvnfcgaaTJalJXV3m9YU9sSp8nWfoX/X6xT/X+nTuWTPM6P+Zzhv7vVRchzI?=
 =?us-ascii?Q?mMSUkORzyc41DyzR8yVGLYeY8u6EfQK50yNp/KJ5SY5JOCzQHysZvYdtB/TI?=
 =?us-ascii?Q?owPPUdrb9KZHmAa+fvwhzGAA4Yt2//ZANxGq291C2a20sXHwzpnBcFa7oTg1?=
 =?us-ascii?Q?5sv7M7+mkEq2KAAfyLrkfgezaP+VpVLOGSI+LXfhOs2Onv0iJ3+wtSOfVVwY?=
 =?us-ascii?Q?PsLIRe0sEADpcNauUgFvt6rFv1/N9X7iCqjg3NVGVdRD7jvH9yj1DAYWdyiN?=
 =?us-ascii?Q?I7QwKiO+ApTcsRDDGtLlKJpWCJzhQoHlUBFuRBrgyuqHxamkI3gyHkH2y5ih?=
 =?us-ascii?Q?jeYsgc3SRkQ6wM9B3JifdZAPpwOx/9moR/rdR5gA7yFUHvYX9CwNCtV2Fxzj?=
 =?us-ascii?Q?8mRg+H5e0N//N+XltWXz+nJ4lucyWHaj6+Dz74mznFQIcIItNBig5ytvwShq?=
 =?us-ascii?Q?+5IL6ahFR3hZ5hgjtGosEZP6gPW6t5LqK6AW5uWlzfS7X7Z+FXKePoMf20PL?=
 =?us-ascii?Q?p2NMMH7YL0/GvhTGUSAgxm6d9KQy4HS+NeAnv2vnvLPktSDGOrjAFgunt/hS?=
 =?us-ascii?Q?EwTUTkKFPqyAUOc8nPvGJHEDqwWQYO70exDrXu9/AzMer1rabGdBcXqpj8xM?=
 =?us-ascii?Q?O0jrfb7AXINY5x21aC75X/ZyOdeVo6C8Jk4DEAZhVyEIHEWko4Ghr6oQDZ0X?=
 =?us-ascii?Q?gUrB51kjdZbzgUMV3dN1xLu3Jo91BpX99qjTwG4TQSW1abJ4JE2UxY6vJyqW?=
 =?us-ascii?Q?5zlFesIu7MYdOhxg9qUhd7D8MxBqsBDCKD/IRnglS1Dav9aliaW3APJ3H/mG?=
 =?us-ascii?Q?hugqOAztUWlQy0jcFEfkot2GHUw5L0vjEdbNZHTzIN+P9DuLSmtw/gl8mlLq?=
 =?us-ascii?Q?mgcRmzuboz/9X6LHrdleALr8iPpzhNfsMMa9kxUhBX5a1qoeqp+KXzJcU4SB?=
 =?us-ascii?Q?dCXx8B4jLm3Mmdqq0vxziykrQJXYe74Ygm46JGmzkGKvJydR7AUoMN6+AH1b?=
 =?us-ascii?Q?hCaKI10sOdgVOQ4IafboGVXjdH0wbtIiz/i4Yex+p/x1XkMfbSAYRfJ0l3nO?=
 =?us-ascii?Q?RrW4plGxoPQyq03lpZ6gvhvJK7ZHBtRA4bi5TpQ345q3BdVmDFaiTmkDXhF7?=
 =?us-ascii?Q?VBaimsadRzBibeFn/+eK9FdFDIv9MeaN9H3Zy7g4fmkI8cc1INW1ui2HoRB2?=
 =?us-ascii?Q?rLYIC911dTJYw/oLRh5z9eFL40k3JVvqW0IF5TyLyx/JcAMYYNefDD/ATWFo?=
 =?us-ascii?Q?ntb0OoNUWv9tq9qujHR/QVG4GR277sX1eAYZbDLjBtM29TQ2m/eHFHaYIilr?=
 =?us-ascii?Q?DuV2khPiy/5QGb8gRaX+BguTA183HXIrc7SRn3AYBwNNZ0xYf8gsYTVWRLh6?=
 =?us-ascii?Q?zgnZD4GHuiI2hPtUM4NmtChIe93ORVvl+E3k1+V+Jt7sCVGo8C9FpBdaRIGt?=
 =?us-ascii?Q?Qfr2ba/3sVV/IkI6ovKHL1VMHVjHPue4Q5Is13H/uIdFSLEv0e+/Z8Yy01+Q?=
 =?us-ascii?Q?bIr7uw3x6aCSuJUjLaOYoZLYe+WzW3n7IHDyImJildeUiMYUzxLZSonb/HbZ?=
 =?us-ascii?Q?h4ZWUj85M1tYf0gRo9Q+4wZTuQCaoC8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd97917-77ce-473b-5747-08de6f3c9193
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:25:06.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTG74jq2f4y6JMpYz8cH1j6jIj42Jybi1UrbbFQMCpmmH/JGn3OtXfGVbldIT3WbpQYu7oZz0kLGJQpM7hzwe6TTijAtip2frhSjGZV+9dE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
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

On Tue, Feb 10, 2026 at 01:58:25PM -0800, Harish Chegondi wrote:
> Engine WAs are not applied for SRIOV VF, even though they are processed.
> Remove the SRIOV VF check.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 1e8d61ac581b..c9ca74cb77f1 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -626,7 +626,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	{ XE_RTP_NAME("18041344222"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>  		       FUNC(xe_rtp_match_first_render_or_compute),
> -		       FUNC(xe_rtp_match_not_sriov_vf),
>  		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
>  	},
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
