Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957E8CFD2E8
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 19:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3431B10E0AB;
	Sat, 22 Nov 2025 19:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wu8l7FLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9D10E0AB
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763839979; x=1795375979;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d/uYtofxDvrI4YokdzFrWcvLf3pwSWtTpaCphgIawLE=;
 b=Wu8l7FLUDjvddVvcYMfdL1p/lHA/w7dOujLsLPt5mzwrewr2hPiWjGUe
 X86BMQnaRcnrOa76t7eIQr6ayiP1QZGxjWEHM9L450cqae7Lq+Po62kpx
 k2P62p4Q92Lg2tFytS2WI3i4U8msOYYDMMK+6FDr38McKRZYpFxrwj/zN
 2zoaGKAfAtgx2L88hceT1FYPW4pPpftgXS+WCmBXxapcs8hbVOkF1OGmf
 mBjttS0CqI5UTPsvcQFpas9CIIBRGQi7gi9RENK68Q2A44vWlmA8W+jhN
 3RR4/qSjnnrGHaltRQwxHojvTcNJr9SHnMtA2hCDKme3MWLVx8kSW3Kqd Q==;
X-CSE-ConnectionGUID: QnAc6ZMLRDqe/81bFdXfeA==
X-CSE-MsgGUID: 5O9evNqsQPKT/WBJZl5Twg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65851964"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="65851964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:32:59 -0800
X-CSE-ConnectionGUID: D5k+dTAyTnWeNFCCpIwMMg==
X-CSE-MsgGUID: N1R26idGRb+2SANrf5/H3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="191155818"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:32:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:32:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 11:32:58 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:32:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+/00UFwb25kajSKxm61RIB351JQiRZO6NYU6eYUWDSUh7Q3SbeJZ48BpzFNiVoq0OMPpxWyItkOZ2ymkdvFwyRNYuWbS5rvimWCsuWcCUHj4PqokdHk1J8jwzBZIraHfhNcohfxI0VXTHRSzKZYtw0FAdAfo+LcWePe/WRDZNDzSL1aHDppns/5JZR43K/WN7KRJn10W/ldr7IrElnQM/SvLB9okvTVlTTNqcyNP5ekXyrBzQRPtS7CWmlI+EfmsbfWfn7LAzmEORm5neYCqfs/4ZMbVdCSIwKaWdjDt7mI+jjG2dihcKZAr0APIA83xmGwhVxkszgLR3PVstsMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bupVCUSFpNHWxfyfir9gYaxmVqAtO5OnNBcRnZ6x9wg=;
 b=JaOLKH2HsHt2BtRS/MlrNsVZcm67C5MLUIGCfzD2Vx/Rvz8bfwnnLH11YkdsqVzcMm8yhALhfmPiWitBUkEcO2sRd2GcquLeCZYlr7BSLkhw7jGdJyayoQwU1hhvlxmCRpvYqlAhG5E6q2K1OciZFR3d3j+qUjnrsS5C3g39inMazf9LJhFgp+pI83DFBxNbnkIo2faGOXUEjjJ7T2PzH8/h/205VSWK6LWYg5ivyiQqUZsevGlKpr6ktASc1tbFYBFeSuHwJLRLuEnAVjxXXLbGcY9pm/x3ZUus+x0X1zGpdpax5V9BXHomIBfOqMgTBQv+0GbB9DdItXZR8dfwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 19:32:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 19:32:51 +0000
Date: Sat, 22 Nov 2025 11:32:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Message-ID: <aSIP4QQRfts2PAtg@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-4-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118090552.246243-4-brian3.nguyen@intel.com>
X-ClientProxiedBy: BYAPR01CA0038.prod.exchangelabs.com (2603:10b6:a03:94::15)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4867:EE_
X-MS-Office365-Filtering-Correlation-Id: 4907d974-a957-4adc-3d37-08de29fdecd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vNsWiSzP1/YaAiK2CWWPhzRJjpoYfYndSDCnO/OiLJ7ajRcVM4d0A3X7ALuA?=
 =?us-ascii?Q?rFFClOQJMGy8JyLjKhKrXqEtwlSsmAOCDYzqgFcbp3bh8k2zwXQom6du2Xl8?=
 =?us-ascii?Q?/JNChcIXXTUfx4YnNHwOdpGvLaHWwJoOYWjORICBVIu9yz7E/QOj1/5wlA6d?=
 =?us-ascii?Q?IeHvPRc4LBN680jQtdMmftNjYDogvX/7q5G4RRi/R9LbbVc21ALU9w04jyna?=
 =?us-ascii?Q?NZ0LD5QtroBawcxoT7uIgNiBnzlurLepsL289Ja1Lm/NK7memhtwV3R4MBwI?=
 =?us-ascii?Q?6RtVg0DtkeneccYpdnAKGMNvEjcYMNUpdJ1g+2PiYR9G2Oe7LzPVCtK42bzA?=
 =?us-ascii?Q?uSTiLiUxMJXFby/SIDjLul6QRnqjQMXylHkYuppA24gVqXJCyGOtSfk9NmK+?=
 =?us-ascii?Q?KzcKnde1y407mlUS6GwYFDmTSX4Ie+jaZOt+RwPpZr4oIi4R7prBP42xt8s/?=
 =?us-ascii?Q?L2F38QwB6tLV+jP/8F9XVyWYnABB/eZ//C69yL/H+IRc1u/haxzlCpIZXBrO?=
 =?us-ascii?Q?sEs8UISECc/CcqGyW2d4DW4U+lfjZvsHcRlhgj6R+pDxd+0WSpMz6JFyfC1G?=
 =?us-ascii?Q?acYYrOXgAQfyYBCbGSnG3nLYkhtgh6sSBK8Y3Ea3XyRhQxDq76F2q7k1VsFl?=
 =?us-ascii?Q?d4/uKElSvhjcIFZq1+ROcT9zxmhcebeBMLZSkBENKwqROkJuc1uigzNwYIiT?=
 =?us-ascii?Q?I3PFVGWNv87NuPnQuEmrwEXCc4YTOdAd+5Tdq9xZcBTDjNxtvBPSm6eVfKru?=
 =?us-ascii?Q?6KqYdMKnkN6HbUR1CNCsdJtq9SVjnTkhpEiEe9oZY9XdidVcqLiz2heX92NI?=
 =?us-ascii?Q?Ei5sDbs7BawRsO7Lq4sUhe5pT5eENaCkZtnHggYQ3/WiQrpZxw8QpOKbe0tg?=
 =?us-ascii?Q?QfOhjV+Kt6dXPJJP2h+0y5WLsiGqw93o04+f8eLueuT36phkFPoelfgjx7Mo?=
 =?us-ascii?Q?lIOd3bI+ttZv12Q/GxAUwd3oKyXHHf+kNWX2GJeB6VqrOBiV6RNTwxmPkkeh?=
 =?us-ascii?Q?3YMBw6+MqmoeKa+r6OIhWlbSK+bQYBJ178TTLTkR6hTnzib8vIT8DYQdR/Io?=
 =?us-ascii?Q?ySYSt+3DW/cQ/i+xBBhl9SmUYie2NcTf2PWz9mEwOL9NDbn1h4li5ZSA14/9?=
 =?us-ascii?Q?I6AgBJVJZqUOzW06LJ1U5CfhXWIMuJXpR7PnHJ0SwiW80BXeV7XPxRR2TEiz?=
 =?us-ascii?Q?aX6usCtsjjdYXcLwdtusewkRU2K7HF1K+Y38NzUtg2lL65rvlXT+6VTqekX1?=
 =?us-ascii?Q?tkgb/i/0RdzfycNdjJsK/AxhesCOiUxKnwHjWwbYYkXAFK9rI5oWZKRvnHrh?=
 =?us-ascii?Q?ifER4L5s9USfbgU7qVGJub7YkSS0ALEU/Owz1cnsPRKRuGqMq3aE0MiEPmVc?=
 =?us-ascii?Q?A9rComFhtwMreaUk3zBx5LtTwXmUjOtE8Avlvi73coZSBpOpgz6IzOFEu7ng?=
 =?us-ascii?Q?3m4UPfzaO8JrR2Emv65FLXMjnzmYudPU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qq6bZDn/eJBn9IOIY1Ya0trn/QBfeTjrdgwDocTqERXXvuy7UnUx6JoLiqSw?=
 =?us-ascii?Q?7Dk0jAeaVb136Ug2yg9Ai1Zm3+pAEerUjF8SQUVEGMPk3u1nNv0Lzbs3SgBp?=
 =?us-ascii?Q?H696WCm5iiruvJQDlfGTgy1SqKmtHjVkU7CTqlobD2yY2p1elaK6/szvo1/Q?=
 =?us-ascii?Q?pc9uz+qkxm0gLCp/81ILesqdS3X5oRgAvx/Rsy1Vm0Nr+LTibDmNduU2D13h?=
 =?us-ascii?Q?d8aWc4tlIvf5sY59hoSh8DrXHjvbYJsR8XgjgDvKV6aa915GO+qfh4xnWDb+?=
 =?us-ascii?Q?TkYYP5RYi2AMVMvbDjlKCDYywNOFb7vkBuPRETY6FWN4OZ90zw+k+iKihYHZ?=
 =?us-ascii?Q?LGtLw3haaJnR/YIVtkcONBhjIkZthnDdrtWDRyGL5PZkKPWSrlZ4AbU7rYhS?=
 =?us-ascii?Q?FS7JwU0JqN9Q82UIO7/duD6XOsxs3fZhPo7lmO6wGznakBNdmEzl782pPHyU?=
 =?us-ascii?Q?yPS6DHleOlr7zMLNulfCV59tYxvrJatEEwAaW76lASfK3p1rIt9vFWL/I+iG?=
 =?us-ascii?Q?VZ66umCq45gYbM056a7cTGjDTpq8AOaoucGvALIOx+N2sDlq6dKYe4maexRY?=
 =?us-ascii?Q?GgtuU6BQCuBAblVErp5ipGfC4pDhP398iC2BWfp7s2ZcTeASKxmDdaTn6vqj?=
 =?us-ascii?Q?3CYoeMtuuYz86ZTXntp7rQb+rX1VCy0yhA168PoGN+wh+d//w3tdcIpkmOzj?=
 =?us-ascii?Q?k2IwIvRkA0BZ2FO3S8XZkONIl3XzGJn3Z/YChuppJUc9duGx4xEHb/z2rrN7?=
 =?us-ascii?Q?AkH3aeXLTZvb/bXiBtclPdAC2sYRzc+CrxxLeg2BR98TZPureFPZ1I4UJ39X?=
 =?us-ascii?Q?oaLTysaP+TF0BJs38ULVcW4PkollMaXfwt0pYcooWS+2DJyNzlvcyFlSZ9pz?=
 =?us-ascii?Q?ytJB6Wc62StjxuuikPKl2PBAf9H9q51nR0ZwsTsKGMY581odJvt4CGEVIbIj?=
 =?us-ascii?Q?3e3LNHRyD6nWyDG6LYZjkro4/ugNWtyVgm4jam1Guv/oCPz3PPyuT+AlNeid?=
 =?us-ascii?Q?pgp5HZHoiqe6P+mpFTV4c9aLa21ykK7VXMd+4yvW+m91CHdoH5iL1YvzO1VT?=
 =?us-ascii?Q?P8u3yrjBBudkvpfGEU3U4chWCOn9xOOpwPHaXT52FcpTFqJLWCIxL/1WmRTZ?=
 =?us-ascii?Q?ANrSx4cKmxdKQfxZwyA3BpGGJUqaETfoEJfeYzXYY7Si+F0rzgVlp53m7Vhn?=
 =?us-ascii?Q?vgR+7b+XfQpoSdwYh70022aQpVoFO+o88zlnMY2x0PC3f7JjOCPMRJTozh4M?=
 =?us-ascii?Q?B347tnGYgZ7T0NJErEYkgpZko8UeeyK+exd5rLeNqIJ3NoZVUjy9sJuCx6hf?=
 =?us-ascii?Q?fr45wAb+EUatMqAlQAB5Vqr4PCO4hPGh9OVk9/8qkWQMwISCVqu/WW7p3jf3?=
 =?us-ascii?Q?GonoJUYF/yyyKsE7lSYcx8IAmEQrHRGbRsIPHyR5MgqeHlQHcWkHyXpXIvNc?=
 =?us-ascii?Q?v7Rt4WWLeC6Eu0jFLVtCQic+yGrlgzvNQyYvyIyrT0+Rk8ada36i6g6a+v0m?=
 =?us-ascii?Q?AFuHpRkgZMtigMXXbzCF099AMF0Evhf7uddeFNUAa4NXz+4buE/qvI8T0lGo?=
 =?us-ascii?Q?UP4x02haArO6XgWNQPGA1uD5i7eAYKf5qItKZ8IgBg+/BCZ6goYd+Z+0cRjR?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4907d974-a957-4adc-3d37-08de29fdecd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 19:32:51.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgJXlc8H9vaAHSpGd0bqubjX+x0u0KVx+ojq6LEgVZAFRrgqrKK3BYvKagiJB4nqXYV49bPPjzpWBoZPFYAmig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4867
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

On Tue, Nov 18, 2025 at 05:05:44PM +0800, Brian Nguyen wrote:
> Allow for tlb_invalidation to configure when driver wants to flush the
> Private Physical Cache (PPC) as a process of the tlb invalidation
> process.
> 
> Default behavior is still to always flush the PPC but driver now has the
> option to disable it.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 11 +++++++----
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 21 ++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_tlb_inval.h       |  5 +++--
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  2 +-
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++-
>  drivers/gpu/drm/xe/xe_vm.c              |  4 ++--
>  6 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index cd126c53faab..c05709a5bc98 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -34,9 +34,12 @@ static int send_tlb_inval(struct xe_guc *guc, const u32 *action, int len)
>  			      G2H_LEN_DW_TLB_INVALIDATE, 1);
>  }
>  
> -#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> +#define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
>  		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
> -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> +		(flush_cache ? \
> +		XE_GUC_TLB_INVAL_FLUSH_CACHE : 0))
> +
> +#define MAKE_INVAL_OP(type)	MAKE_INVAL_OP_FLUSH(type, true)
>  
>  static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  {
> @@ -100,7 +103,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
>  
>  static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
> -				u64 start, u64 end, u32 asid)
> +				u64 start, u64 end, u32 asid, bool flush_cache)

Later in the series a drm_suballoc is passed in as an argument here.
Isn't that enough to know if we need to flush the cache?

>  {
>  #define MAX_TLB_INVALIDATION_LEN	7
>  	struct xe_guc *guc = tlb_inval->private;
> @@ -154,7 +157,7 @@ static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
>  						    ilog2(SZ_2M) + 1)));
>  		xe_gt_assert(gt, IS_ALIGNED(start, length));
>  
> -		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> +		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, flush_cache);
>  		action[len++] = asid;
>  		action[len++] = lower_32_bits(start);
>  		action[len++] = upper_32_bits(start);
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 50f05d6b5672..de275759743c 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -324,10 +324,10 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
>   */
>  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
> -		       u32 asid)
> +		       u32 asid, bool flush_cache)

Then here, later in the series PRL is attached to the fence but can we
change that to an argument here?

>  {
>  	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> -				  start, end, asid);
> +				  start, end, asid, flush_cache);
>  }
>  
>  /**
> @@ -343,7 +343,7 @@ void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm)
>  	u64 range = 1ull << vm->xe->info.va_bits;
>  
>  	xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> -	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid);
> +	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid, true);
>  	xe_tlb_inval_fence_wait(&fence);
>  }
>  
> @@ -420,6 +420,20 @@ static const struct dma_fence_ops inval_fence_ops = {
>  	.get_timeline_name = xe_inval_fence_get_timeline_name,
>  };
>  
> +/**
> + * xe_tlb_inval_fence_flush_cache - Control PPC flush at invalidation
> + * @fence: TLB inval fence
> + * @flush_cache: whether to perform PPC cache flush
> + *
> + * Helper function to modify the tlb_inval fence to control the PPC flush.
> + * Other components shouldn't modify fence directly.
> + */
> +void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> +				    bool flush_cache)
> +{
> +	fence->flush_cache = flush_cache;
> +}
> +
>  /**
>   * xe_tlb_inval_fence_init() - Initialize TLB invalidation fence
>   * @tlb_inval: TLB invalidation client
> @@ -446,4 +460,5 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
>  	else
>  		dma_fence_get(&fence->base);
>  	fence->tlb_inval = tlb_inval;
> +	fence->flush_cache = true;

I don't think we want PRL (later in the series) or flush_cache stored in
the fence (i.e., don't modify the fence structure in this series) rather
store the PRL in the job and pass into xe_tlb_inval_range as argument,
NULL implictly implies flush the cache.

Matt

>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
> index 9dbddc310eb9..b84ce3e6f294 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> @@ -24,8 +24,9 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
>  void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
>  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence,
> -		       u64 start, u64 end, u32 asid);
> -
> +		       u64 start, u64 end, u32 asid, bool flush_cache);
> +void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> +				    bool flush_cache);
>  void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
>  			     struct xe_tlb_inval_fence *fence,
>  			     bool stack);
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 1ae0dec2cf31..6248f90323a9 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -49,7 +49,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
>  		container_of(job->fence, typeof(*ifence), base);
>  
>  	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
> -			   job->end, job->vm->usm.asid);
> +			   job->end, job->vm->usm.asid, ifence->flush_cache);
>  
>  	return job->fence;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 7a6967ce3b76..c3c3943fb07e 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -40,12 +40,13 @@ struct xe_tlb_inval_ops {
>  	 * @start: Start address
>  	 * @end: End address
>  	 * @asid: Address space ID
> +	 * @flush_cache: PPC flush control
>  	 *
>  	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>  	 * failure
>  	 */
>  	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
> -		     u64 end, u32 asid);
> +		     u64 end, u32 asid, bool flush_cache);
>  
>  	/**
>  	 * @initialized: Backend is initialized
> @@ -126,6 +127,8 @@ struct xe_tlb_inval_fence {
>  	int seqno;
>  	/** @inval_time: time of TLB invalidation */
>  	ktime_t inval_time;
> +	/** @flush_cache: bool for PPC flush, default is true */
> +	bool flush_cache;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7cac646bdf1c..5fb5226574c5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3907,7 +3907,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
>  
>  		err = xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
>  					 &fence[fence_id], start, end,
> -					 vm->usm.asid);
> +					 vm->usm.asid, true);
>  		if (err)
>  			goto wait;
>  		++fence_id;
> @@ -3920,7 +3920,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
>  
>  		err = xe_tlb_inval_range(&tile->media_gt->tlb_inval,
>  					 &fence[fence_id], start, end,
> -					 vm->usm.asid);
> +					 vm->usm.asid, true);
>  		if (err)
>  			goto wait;
>  		++fence_id;
> -- 
> 2.51.2
> 
