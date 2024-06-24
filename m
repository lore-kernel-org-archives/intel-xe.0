Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D57C2D0D1
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 14:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B9510E475;
	Mon, 24 Jun 2024 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5+0lU0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0A710E475
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719240252; x=1750776252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cJiWHaUqTIfDXYjz+oiO3+bVXirJPo7Dw8xJ8pspbI4=;
 b=b5+0lU0+1M/iXDBz+UgjiI5ciPvFA8+DNp/YM0bkIXvpqSXzSl+vioDv
 zKOamMjv93cRsmMMVL8B5pEAmZO+r3aa8YH530vYWFbUtqOmfA7lWFyve
 YpMGVJDnjrLlRc+WKlj1L7cBMMCilkfP1sJNnQhFkJCs0NUKpPMCsDsAI
 UM0ZLm4EtCFPspMLukQ2kEThy2U9FMyA2M71fg87sZ/MplaffuRFveXQI
 pqsZpkplaSy59Acf/5JGy370mC/b1X5qXZF94h8L8fUkLIR1P3PKheqTt
 2EMVUH2YNuIpmmj6nedMwYGf+NjwDrYRaGesLObsdSQzQxh6DB8y0UCeu g==;
X-CSE-ConnectionGUID: dPBPBO6dT3GzVngHEKNlIA==
X-CSE-MsgGUID: YHvs3bkrRLeg1ScoLvoDxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16445507"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16445507"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 07:44:11 -0700
X-CSE-ConnectionGUID: 4V3wE3e4TraUjptmX+AKdQ==
X-CSE-MsgGUID: N6J0KqXpQKyd65k9y0IAyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43410571"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 07:44:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 07:44:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 07:44:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 07:44:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 07:44:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRyKy/h800I/zsxtB7SYVC5g7VNpRPOqjW2NnehoLOrv2U8XqMBKp7nr+DfhvkGklrVVCKqjeR6O8XOAaC6g5nuPhpvX9tcikNrBoTrHKN1qiBC2jeDp8QZSiZupl4Q9JhX+5rx5/j3B7pCY6wyJNCXriKi5KuMz+XJHN3sh1JbttTocF1eXp76ArooxB1msuWwvVnLZ7LHXB3V0uuHZRLc4vLPAvHb7Jk/3ubojKZz0spWqUjDVjhzDVt8/XrgjKrM1FaNZE8/jN8bfzWepkYTvb9IvSAsxGUSzQzUFCL8bgZqbOYsfSHLva6/lL+s3G1TUZ4B11biB/KC0w4ORMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qzqHlNlu61yBI6l0nr/ydC0ciGKWwerwQKE7M+qcJI=;
 b=g69a5Yo0Qsct4eEZ87KzJVRAK9NYdmEQcAqQNVoIYNA46qwNh9ASlUVHdB9M0PPFhaKWWUPUKfgU8HwCDFq5ROR9c7nzTGFVwZHFJUOaqYWlEgbqolf8SaU12qP+gSHhbfyx7Gh3CGkrD2XcGwg3wNzQOzM0FOqkrSmheHxoO6o4lgj9RleHYcHul/Xn7ly8yoS//StDPXr+sN66bq3ZpBq2c7RZH94XvrkrXx9cyIZbdPZhD4VlRF+oqutqOIXob4IXtQ7QWbLGBYsSoKHZNmgYw6xzr0H0Y4i3ZWEx0UeE2Ajt0in0WG3h/uN0bSL3rGTYZL4hJwfYjzYJ83S8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 14:44:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 24 Jun 2024
 14:44:06 +0000
Date: Mon, 24 Jun 2024 09:44:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
Message-ID: <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: ae462cfd-965a-412d-f069-08dc945c1994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9dCto+Ne6SpsaCvknV7/ia09c02SBJq8Jbt+oIXSC62fqGJAjBIxdjiYQuj0?=
 =?us-ascii?Q?6hOphnZLtrUi5VClgqUO3Mhv+K0qweMW1GlcrmQEkbYdpruAJPfCaj9PiWeU?=
 =?us-ascii?Q?aQKD7MgMrwd0N0xN9eOKnbE2yssS4pdIrL/EO0W3NWM1WtG1uRObJxLtbSzL?=
 =?us-ascii?Q?DgUdEgheez3eGv8Byd0RpgEtbWsVDwRGGqzvmdTtx542uVDhAOxpdIehYNAJ?=
 =?us-ascii?Q?eWdt/3WQ9Q0xOzR4XxdEYRtdVmm4Ct1vUVu14qa5NPCNMw0V72anpYoIQxnm?=
 =?us-ascii?Q?jTZG5S4dtp+pkQVSky+YU4+zL9kjRsifJvyy197WH4XSWSxYHUqM7SoAathD?=
 =?us-ascii?Q?lNql/pF2wfmZjUq7INxqicG0FkIJcLBBO2PycAIWboKKBm+s+E0s/Hz0M/JT?=
 =?us-ascii?Q?L1i++neSTZTNm167efqKbzAyBmDcrrwts3ZApddH+FZUkCZVIA9qu+Y1gwZW?=
 =?us-ascii?Q?F6gT0YJN3L+6TcT0wFU/ikrqPEW7cdEDtQTAHziKS4/0MV1mKYqeVToyXWNH?=
 =?us-ascii?Q?Ulb67X3qZ9dcne/axYyNUCxmgFpq5jw/Dr/LEZiwDAFOq2zzquB70ZXrOExf?=
 =?us-ascii?Q?MLCQKnfu2yuGObScru+oINU2iR2BqZNQXJrYo/xTfHrnjcC72rI2XcxOrt57?=
 =?us-ascii?Q?4gtSl9oewSsDaiM+NTB52rgNV9yBbwQeQKWa0Zp+pIexUh5EyVBPVsJa2FGL?=
 =?us-ascii?Q?cO27tTnJeWPTcN7Mhr+hBdkzx132uVUNMhvapPfTnAgZmaaDfLCwMlpoARZI?=
 =?us-ascii?Q?5vB/1u9IkqW5fqM4pGMEI5nx4FA4VfvJq3wYI+SEdZET4WGi2IrLYOR6zhgI?=
 =?us-ascii?Q?GKs8idFAJ1EKXz22Bhxv8Py54FbMKms6V0KvIpc0iUmCN+sTN6bOjRsQP7oe?=
 =?us-ascii?Q?zmnjnS4vSYCJX/fsLwUksFUSqi9qIR3yliAp/0zK/5kt+por93gwDIUDuoky?=
 =?us-ascii?Q?QichMulNPnKShgDMDmavkqRG+qrGFPPH2Z7cLoFbUi368xZ04sxIErNsoxer?=
 =?us-ascii?Q?iK2I+HMQoSQk8HnvY3g4gr/JAhpzxrpuhAI46VWnuKQXCtsrARfjjkUyG1KX?=
 =?us-ascii?Q?vzQ9mhltjRRY6yBJnRp8OnpM7ETOqLU18lTnN13awbzv8tqtEiYVyDae9gRn?=
 =?us-ascii?Q?pzXsOQ4H9C8XKgav/DGA/t6jk4J0VEty1aXQzriAsO2ZYq9Km7/dx9ovln0S?=
 =?us-ascii?Q?nPiHCDnUPHFR33kPvxSzJG96vaWsndDYqJZjuTf+T1NM+dgGIFpGz4nTpnbv?=
 =?us-ascii?Q?JOFdViGzVXBNA5w11Hl7oSvM2y0YNC6Bs1flCIf608LWVGL/99WrTElWpSxE?=
 =?us-ascii?Q?tSmbsu7Z+By4yjiwTWj70Ei4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g2T5Zj2tv2XKMlHn3MddW+/8rWAhM9L906nPoo51+pQigb3JcJuC6nAhiI1Z?=
 =?us-ascii?Q?A3No7Z0SDrPda1ihL9KlDGMbk/mRy2FYEs6j3Bgh/2AYXdEZZgAjk5gxma5G?=
 =?us-ascii?Q?SoXo/SyQxSoavWtTuEKPNuIi5ITObyywnRCAIdYL2K3YDnOAVCkk3QRxkN1w?=
 =?us-ascii?Q?x1wGMiS5OtbACjiWlAobVqO7sHFaV7/3NYFGcep0VjTSizI7sZr8p4LrnzR6?=
 =?us-ascii?Q?4HfI/frbxjyT0RuTKXv/lU+vTQL4H7xQhNl0J9EsNNoM7kyAzbHJluKYLM8b?=
 =?us-ascii?Q?QNRZat71q+x8c/Og235kYETpbazmRupvUNfEw2JQbDWMhgqg1ln/72m9S/2A?=
 =?us-ascii?Q?XQ3s5xzDGjHGTvHTny3MwG3VZyGu1qzPuN3jlmYKWY+iB5AgeXe4hBhOseFG?=
 =?us-ascii?Q?wAKb6e+LFq5cgghuNzsiHufSupJ/qBgFMUguZr1wNplxnjD3His/NYC6tcCN?=
 =?us-ascii?Q?xGRk9y7Kp5eZuVgxYE/+6867CUirOTYSjxSMm1DLlgbe7oBpYNaEwGd+LXtb?=
 =?us-ascii?Q?sr9c35nWiO5Pc3aGa2/K9O+4MYHDRa3CCY3d3kUYiRUqE3Iu5UxYZrlcoVwB?=
 =?us-ascii?Q?u6Ovv2LtCBclqxe3Ilwor7yW5Zz54Tcr+/36dHSzbK+VYc39ynpamLO1JGxz?=
 =?us-ascii?Q?FbUd2aJJn5+vYKbt/fDMIaMoWXC7xRrjYMIfCEDrrlLIKrbzRlup8II5eKmQ?=
 =?us-ascii?Q?ekFN+jV6tOJ+SlTZqA+dvKVmajR1MqHA6oVNZuLMFlwWvQOR+l6pdldIbex+?=
 =?us-ascii?Q?fsNmHE22asULH7BIBvlb0B/kQrJXIrGSRKZoHRQBYFtIKp8FDiQ12v/0YfZk?=
 =?us-ascii?Q?neNW6hBhhqDDzyrIH0QMBpwnuMpnudKOkhgrZCA9uAVIqdwdFCUzJg3NqcG7?=
 =?us-ascii?Q?wvw6wjiOrFGgWSEdI3nhXZpGXtmd9KeFqYz7mOzHnH192BAiC5udn+Hl+0Lm?=
 =?us-ascii?Q?OhjCZeZIwZ6be0NNfdwHCbPONTBEM4X78O4Btu0sLj00L1fc2TeTSIVN6q+f?=
 =?us-ascii?Q?3GqK/xv+G32qCYfg8zTDemNtRIChy/czmQsI5vtpwevKQszM9kMNtt4zZ9kT?=
 =?us-ascii?Q?D5DfT4lE3bg4ZuwAOY04AFQ16zfw/MzbG7ooay4kK6Q1N3V+kCaVcKZhui2g?=
 =?us-ascii?Q?22BHV+brpjKimeTVibuJUyVVaMiUiK5C1+vnk821qeRPceczTKzuAkt4+0Wf?=
 =?us-ascii?Q?NCiELxiWFbQxaDABF4th+i9cJSnFQ3HsnxbetSPHqjJsa5RszNSx/V3LvVsJ?=
 =?us-ascii?Q?CX0UZntTq1Mwk2xUzp32JoBkRO1sp0gfebdkAmcy/knx+A8SZa9rJDrVX/P5?=
 =?us-ascii?Q?x9LqNT4IoLv1A2nijZJBmKpgryyx0exSstecFkoTyydnb9q2hE5Wt+MXyxz6?=
 =?us-ascii?Q?iBlmRNuQhEkiIfhlQ70hUGci0bV05286hE8IYi8ehXT52Nicz+d48airHRu+?=
 =?us-ascii?Q?tjYnn91vXoaowRLjYMjRr2wIrLqGoIZLFstQjkInfXrC6lwjwc8A2mrTacKG?=
 =?us-ascii?Q?dDDbv7pORkuEg++BY0C9xbXZsRXif2TLQN+fMFAhFkF8BauOQnM5XzcXOi+6?=
 =?us-ascii?Q?R5tsh1o2KaWYzDJ5qdcdIMQFpXQKNt5f0NUsloeWQibgF000JCSMpG3dPcj3?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae462cfd-965a-412d-f069-08dc945c1994
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 14:44:06.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8JNfdX+Q7flu3CPss3zRsQZcgS3DJc9jDSzQiVPjzh4StL6geIsOPFDa5NO/YCalwL6pxeiNCR85dMc/g463s5W5002tfq3jDFeBxs40Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
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

On Sat, Jun 22, 2024 at 03:23:25AM GMT, Umesh Nerlige Ramappa wrote:
>Per client engine utilization uses RING_TIMESTAMP to return
>drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
>platforms that have render. While this works for rcs and
>ccs, it is observed that this value is 0 when running work on bcs, vcs
>and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but

what do you mean by engine specific RING_TIMESTAMP? We are already
reading the engine specific copy of the same timestamp. AFAIR just
getting the gt fw was working for reading this register from vcs, vecs,
bcs. Can you demonstrate the failure with a bug open or a series of
intel_reg invocations showing otherwise?

I think the simplest way to show it doesn't work is to call
`intel_reg write` to get a GT forcewake, then `intel_reg read` to read
this register.

Lucas De Marchi

>to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.
>
>This should work fine on multi-gt platforms as well since the
>gt_timestamp is in sync on all GTs.
>
>Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_drm_client.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 4a19b771e3a0..74f2244679f3 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -264,9 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> 		if (!hwe)
> 			continue;
>
>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+		xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 		break;
> 	}
>
>-- 
>2.34.1
>
