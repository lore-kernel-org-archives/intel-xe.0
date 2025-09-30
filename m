Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AFCCCA468
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 14:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1576810E5E7;
	Tue, 30 Sep 2025 14:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHWeS95k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508E810E5E7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759242993; x=1790778993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cOybLtQDIiI86i5VCgZM8Da936apI7VVD7XnR60ICws=;
 b=LHWeS95k1oea+2o8VaKF2ieUIu3M75ubMJaHMyDMis2CiVVTW3ro2LTb
 iUDW8t/OxrkfTj4Us0HmX6Tv+PEBBWlKXFN/ONbzbyrVyNql/o7HxZr5I
 8CWgKZa2wdScFzrLkJOp04Wqt0OLqh7SI3YM+q+j9km10r7RWs2qO9zRh
 VI4acTAUuGWM2DNr+yOT2qOKEgYimGqHSC9vDQ3apArwK1O3uQz1pPt1J
 4ZjWpD/Ihpg12a+si2fq9N3ravb9S4c/heAmRaRReb/kFQ4n3x6I/hyc6
 l2VDGmve2FgPiiI7r3yY0ERHHWmDkjIP6VrCdQJJMrE0Ur9FqulqfFdGe w==;
X-CSE-ConnectionGUID: VFUygp3QTd+zu7wnza+22g==
X-CSE-MsgGUID: daMvlvFSRGiofHjXphtRag==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72927204"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72927204"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:36:33 -0700
X-CSE-ConnectionGUID: vdMWrh6FRCqbyvBVlBX5cg==
X-CSE-MsgGUID: zFbFsOk0R8acGcKOuN02lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="182553898"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:36:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:36:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 07:36:33 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWVnJrh/uylpNWBDC2t20d50XICyk1XVr9CxCvPr/44u3in80a5zkDBimiG9Xqkl2sW1eTz4NX++R5i/85suPGcblfCXnEObmjq7iYdFW0qVjTfR202LPWOrVvNJpywWF1t/EoDaZiPPzeS9ETAVtqyErlRn7g652SjMW/WYoi+QFsjO+Jem2W13Wx+LLixQVdvB7b6DmesTuUp5hz/EHx/10ZTLElpKaLLiAF9KHzr/UaupP+3tQvxtqsVlky7ce77qYUPf8DoIp8MkFUwUcWeIvQXEYz7WITp3OzkdJQgLLxkqUwy9MOBH11/CWQL3UAMetta7jWB70inrVrmDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CKOs8kpn3Yvq/VslrnyPtPOaa45JzeU+WaDCpZ57yk=;
 b=EtnO94OLmDlMl4HuvCGPnD/kP3K0o9d/UShpp53w/TLxVkad4iAWrvxhzrClNAmtgle2HsUup+fEWJ8xb/np3Lx0sI93VZnJPGvEbim/40I1ufs9HjHINSeYg1JDekiT30o0Kq78SDXoFc0OEcDHSZ98GpUzVyKK3IjyNeW7u23P3/KkfIqEnXNzbN3Kym99sDeMqoaSbqGwmYCYuUgj2QAQG9zkgHSdKxBmBq/aEn1YYH3v379VTiCE0fg4km3f0+xsRxOytZZeKCeNxI1w0lmwODXTa0uwqCLh4W1w3XPFGWTDiB2lrfCZ6WbuP07b8L/Xyi7bQkN9R3rnDrYu9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 14:36:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:36:30 +0000
Date: Tue, 30 Sep 2025 09:36:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: TileAddrRange registers are being deprecated.
Message-ID: <5ykaubzgqhyg3cqvpzatqtsklmbrqmkx274i2cbzqg2bhjlqfe@5epgjzo3bwka>
References: <20250929201222.337295-1-fei.yang@intel.com>
 <20250929201222.337295-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250929201222.337295-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: f336e64f-7990-40c8-7506-08de002ebebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qSvgm2QQlpHqerVaQnnPF8t9WJdcffVeNcWloXHPdfCAGNAHbXVgj6A6t3sD?=
 =?us-ascii?Q?kGCHlVov+ippi/dIddc8i+kCr01n/i3rvTixctxmNcuxv8sOrRfn7/2zPFx1?=
 =?us-ascii?Q?cu3VHoCs3f6eevvNOPW2h8Kvs10R/PzyxfuJlX4I1DDQujU+CyDp1ZKHjm6k?=
 =?us-ascii?Q?KrNFrNq18e5TMxFL6kiVs+i5GnUcDFkCXfU28BjERPZQ9UJ1EQPC/rlaNVof?=
 =?us-ascii?Q?quzkZGgUAdMtrv0BBr1SYg3Yl/Jal4MKwDSTR9KBPgozMH1B+llN/5gGjfbr?=
 =?us-ascii?Q?APDHdIotMBL36Zy8134hvdXGKuvJRHUzZpBaS3VD356/KVjsmHcq/u+2ijxx?=
 =?us-ascii?Q?dCigxPoHM+D5rM2guHBT4eCSWumA2A+914j5nJsLiOrGUt8TWJJNgznfYoE3?=
 =?us-ascii?Q?E8y0MGIZq4u7ub/SQBksMISGcN9kJ9WxLG92PgKlKkGa5OW0pKzWT9tGUikm?=
 =?us-ascii?Q?hmah1UcW44VHCSDJS1WJ2Dc9gelkO0iAoRWn5RC52qf8CW4XaaNpt1bxU9bj?=
 =?us-ascii?Q?0BX9VrJ+nC/omdrTDsvrSYHWuL6yuKNlg7hddIPX3B9ScaBlyQ0pTLpITRyV?=
 =?us-ascii?Q?ZyoOHT3WvBbXA61/6LLWmjHGSUcJawyX6WZeK153P/i2SPK65airD539qG8H?=
 =?us-ascii?Q?QpAKk/QPBl+Da06uSyl/bkHY7vDS6UuuRM0YxIgN6F6TH5KFsz8IwMMZOINY?=
 =?us-ascii?Q?6P9nJoqqarrPCi1GithJmRRE02eNLGzlaNaANn1o1VOrpdGRoukvrpGhPRrL?=
 =?us-ascii?Q?ObaJhHiX0bZ9dEgMtJqjvvbSAKgdvKXqb4ib0qB/YCS2kCUuJP2RdXNWI0Pb?=
 =?us-ascii?Q?cKrt4IthKjBEa0bSilaeb1l7q5riUdahOCZKAx78xm4pSzh7NkQCM9tP6kPh?=
 =?us-ascii?Q?FMlMdJaN4tLTFLzY7HWdz3zFEPG9cK+3YhwlxlZCaxjpkb/Xprvl3O6NJiGM?=
 =?us-ascii?Q?WAr54E157gLm2O45uWgQHlqiP2WV+YXA3CmKggSR/z4qNJnfsl+DqVLlTOaK?=
 =?us-ascii?Q?xNtHVFpp/TINJwYMsqdwNW1viZg+Mlpo/2eU3JwZ0EqWgGqqFvQZAZzj/lFM?=
 =?us-ascii?Q?ayEixJymTRMqBNiOXnxe5vjUGoiScvD3ejgTGzVPpcGVklFPAwB9EteC6Hri?=
 =?us-ascii?Q?1IYX+EXj9956iWr92QbKAEsIzzV8GIfm0pW3AgxAvOjBE8Yqm2j0Rgyz4Gxz?=
 =?us-ascii?Q?6YDBQPH+NwaNN6gEPzmN1UIyRuImW4LCq5HXPGDjwKqT02sQZjm+1FJLao8S?=
 =?us-ascii?Q?yueVTAvEjzCW9RMcONvcCAIFt2sELxOhKWUwFoXVoPis5gHrMyRxP6953ofv?=
 =?us-ascii?Q?xX/jWEXzdAqEyr96vwNqaAd5MERXxnjzrOyQmVefsJ6ZPSekj6FTcerk3xbP?=
 =?us-ascii?Q?MAgG6UZJvDuLPj+/miIM0lq7wCViWWEcY0uQGUEN5VO1tCco3A7G9bc7Z9cK?=
 =?us-ascii?Q?DBcUgd5m0E//MV75hlR/2S57mtBSBVdn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8HJ5kxmEydjjmymAUQSCGU5tBJd2VtjGUEipqWVMN1IuZFGS+9zTPzMeqxy1?=
 =?us-ascii?Q?bqi/UbuMw75vZSaLXAuAWLfIqz/zLeqB0HWNDMtDPUHFq4rqnFyprM0WWIoo?=
 =?us-ascii?Q?j+ok/MEWVolwauah6SDqjAQ2kEKcwlhMAbSXlgasFWGc/pg5CG9D+b/RGzzG?=
 =?us-ascii?Q?Q8YRq0G9hpHqR6wsHOqv/ImEIzgeKFrQI8HDbIYJW7NGMTvg0xzBKleJhp12?=
 =?us-ascii?Q?6u5W1bfW6CZ3SjT51HxSiCv3MBPN8uaGQopPGNtBGGlWxcRbAVymwVWgswIR?=
 =?us-ascii?Q?YYhhedjIGcp4dfeBU5zFTIlgj+tacWATJMOG44WDQWEfFClXpNzm+gbU+T4l?=
 =?us-ascii?Q?N9lbSdZOvIreSS25tmini/NWW5cdM/Mx6hFBUJEz6YESK7m2Jp5CnyDSohu8?=
 =?us-ascii?Q?eGcAfhVIp6qNHMgu9ljHODrlKtBsogo+pn4oDIayWZxMSS5BmHSEhXoOrErP?=
 =?us-ascii?Q?EcM7Qy3rVEdrZthVLY2UcyUHr6LrP2WDiFh2pFi9hVNXcAIIXAzur0BlxuZK?=
 =?us-ascii?Q?Wm48DJ1FZIRJloaRmNWxWVOc58UT/FGpLvT25Ay82tF4A6KD61Gc9Qw5lRQk?=
 =?us-ascii?Q?anRkjl7FhpmSKDTJn2N8soQOZWtFSKr8sc6hwv+TnKQQ+xATOA9ZdcGZPYwF?=
 =?us-ascii?Q?jMGE1mHEssKswfaAg3mWgSsPsoLGldYFyy1hgeyJMrI1ZvtD6r5trGAdTTL1?=
 =?us-ascii?Q?jwcpKv/TJPyAgoFCGVgs+wdghzHTE3ZZd6sa9vOmWpX5sQP3L4MHXGj2HAil?=
 =?us-ascii?Q?GW8ZJAyf8CdeDDslg2thURcue5svptu5OVW4BBvaorcl2PpkQm7alo1a7n2O?=
 =?us-ascii?Q?GzJaAUR74F7ce2zrC3nwCfsJRe+rIWtdtp+U1lNh46qrec7vo8ifAol+1YED?=
 =?us-ascii?Q?Q6ShA9j6U6ZD82Sh4BF+tnVz/gI5khMq97VAj5QcwpO+A1r3GSFasXPFCT5W?=
 =?us-ascii?Q?dGs1D3e4/Ya+hJ0C2PfQMuJKwe/2guo900jdfX5fZBg+lrcU/Bgu1lqRNn43?=
 =?us-ascii?Q?aaCx3LA1CL01q80oBKn+mNQOkion3aXk5iHYqIDv5eSHGxOTuxbJDzyCcGhU?=
 =?us-ascii?Q?ZJv84r3e/1BGIzSdbC4q4Hk07aEgeDGVs4WNm45xFBPJ8HEpxaWwPF0vdbEz?=
 =?us-ascii?Q?UWKmpkh+f4FabEjVpJJvNq6rnEIrOEo7oO+9MP+yd3TtS+dqUCvW7F5EeTA6?=
 =?us-ascii?Q?nIkgrCr1C3qcsB+mkzVf4vpHmzNNxvp/QLJkLaVOrSy3OYG+FpXbFWt1sBKB?=
 =?us-ascii?Q?Xiklnw0URuXLJdaPIMOGYAMa4kmG3Xtl660J5uTQbCBvhs10J6CWkw4jq/HB?=
 =?us-ascii?Q?K9t7cFUVGJ/aguUGDOY9b3Zzj3bhqxgmc0zYx54F1Hvpok2Mbs5veqsTlGmE?=
 =?us-ascii?Q?fniQCF1bIOtDXBR/dgz+8tv1iuEdSjHh2frJHl3VucUdoJaLP2onJgNCuzry?=
 =?us-ascii?Q?2u1V89Lnuxp2EmAz7SranC65AjHg/vuVf3zjVdDGKZRNbZLznhC2znez/GWs?=
 =?us-ascii?Q?x0AMofwxR8+4xSXQ/jRdllEaWP2TDQ5L/XQEGQyc8pfoHGXEz/0LhKtcuxu0?=
 =?us-ascii?Q?1uDX+Z9hrqk3PZHMqTK3SE3C0qqN+ju2/aGMUJyh0wo+Qe/4hxQOSnVs7PkL?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f336e64f-7990-40c8-7506-08de002ebebd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:36:30.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVZYOgQemCd7jWRVqP48NjX7u79lDulq44qcG8GaoEMx9C+6hkrMGX/63jmjbFKgYZEJ1fY9V9WvrsI1R0TiUunmIFIx3rmFLJ7Jcm8/KeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
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

On Mon, Sep 29, 2025 at 01:12:21PM -0700, fei.yang@intel.com wrote:
>From: Fei Yang <fei.yang@intel.com>
>
>Quoting BSpec: 59353, "The TILEx_ADDR_RANGE registers no longer have any
>impact on HW behavior. They now function only as scratch registers for
>communication between SoC FW and the GPU driver, and will eventually be
>replaced by equivalent registers within SoC MMIO space. At that point,
>these registers can be deprecated from XeTLB.".
>While the transition is ongoing, the SGAddrRangeforTile continues to be
>valid, reading that instead to avoid potential breakage.

"continues to be valid and works on all platforms supported by xe.
Read that instead to avoid potential breakage."

>
>BSpec: 59353, 54991
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
> drivers/gpu/drm/xe/xe_vram.c         | 2 +-
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 06cb6b02ec64..89a44198ca9d 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -99,6 +99,8 @@
> #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
>
>+#define XEHP_SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)

as per v1 review, please drop XEHP_TILE_ADDR_RANGE from xe_gt_reg.h:
we don't want it defined if nobody should be using it.

with that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
> #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
> #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
>
>diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>index b44ebf50fedb..74cc04412abc 100644
>--- a/drivers/gpu/drm/xe/xe_vram.c
>+++ b/drivers/gpu/drm/xe/xe_vram.c
>@@ -255,7 +255,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> 		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
> 		*tile_offset = 0;
> 	} else {
>-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
>+		reg = xe_mmio_read32(&tile->mmio, XEHP_SG_TILE_ADDR_RANGE(tile->id));
> 		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> 		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
> 	}
>-- 
>2.43.0
>
