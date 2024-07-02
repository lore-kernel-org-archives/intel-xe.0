Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E1DC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 20:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AA210E688;
	Tue,  2 Jul 2024 20:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVXE+uwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB38710E688
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719952141; x=1751488141;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OUZ0n4VcHBsYiJ2e+Ho49jKk3wmTAwme1Gi4NukRDZs=;
 b=dVXE+uwrsId8UAMuSefaxaFSOg6754tI7KNQBfsTkZFWQmETdj1ARVx+
 Qusv0zuQFIQnlirXHJlQJFeFxCWGqSev2Sf9fZnknqucH9A9r0s/JsH+J
 g5asAcmC8qsdOongme9zpFu4sWFMqDrf097jMijYrsOJ6aoF6DuTw5237
 fK5c4goX0mf9wSNGq+GKt3twxR1oiDFs3TfmWoZFR0sWl5m5JYcZlShrJ
 sbHcLy6rgtlLweBhBuYW2dvOEfv/D6ASuYaRV89fouzSeJNPqe1n+8ZuW
 H60V6aabFBlw8jJydNyxa6SPk9yr7QDOJf4Ah+f4W6tE2FjUFSDEHKE1M w==;
X-CSE-ConnectionGUID: pRmOXiFJTqWl5DZqqGZPtA==
X-CSE-MsgGUID: KKqRmY68Tm+WB152A+nfyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27828950"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="27828950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 13:29:00 -0700
X-CSE-ConnectionGUID: y2CSkeyhT7albctAzsVAGw==
X-CSE-MsgGUID: qH+QH+hXRVKpLsqfYsqkyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="45884614"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 13:28:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 13:28:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 13:28:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 13:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPksxzeII7K4m/FJ/xRajfnu6q2RI9TDhbP/BFegmK87fR2nd/fyQiixfaIukt2nAmD0FbFe7iFugKVSt3j/6oPVR2tIzVPZqF+zjZVFx6zNWpQUy9WL/hSNvz5bSTq/YPXvZqPePhr37GLLbsLRq/t8coqRWrqysZt6ccXiM649DuPR/Uwdsw8GhNWuYM9S6FbpoozF5+BzdJllkx088CRjokCRFtnYIcPz7fXQ2oBgx5gM1OOXosFu5ISj9+hvsOoe7bgvCtNs6hr4Wj3VU2Iqg5YjJV/rYioKC+jetTcSB7floP1Luuci0eDtThH5rh07BquEihP9M4dXjhaogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAqVHgs30XvMDO0ud+whVjIYaCf6dXClvghE6r1BV4U=;
 b=hXcSezz2UMI2k4ugiRnUelM8dPBY9XdKcy5HNZin8Y0LLU7B1u3p56rYb1p6fPLqystBwhcfQMhTgnqs0Ai+Sl/vVIPmzbYcz0lcB7FFVGxLwR9TDaw5yEMhnghlKZA5XpWn9HU1e7NnXLpbP4DiLXvRIpHvtKUrp6gCIlNz666xvz2crL5qjYvs+Df2el8pxljtuk9dWlmMH9V6+Vvo9SttNOIil/uID8vMiaS2u777X0GdzBvmXPwSgK0ohr5IEaTbDXmI3fqDTX6rasBja6oUQfqtYdbYq9RrRh725z1lX4AOJmplnR22kN02BPpajM3YORJH4SYLIVNEpkAXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 20:28:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 20:28:56 +0000
Date: Tue, 2 Jul 2024 16:28:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Prevent use of uninitialized mutex
Message-ID: <ZoRjBeJFLrAorhLR@intel.com>
References: <20240701231529.2582452-1-vinay.belgaumkar@intel.com>
 <ZoQm1JW_22Z1ZNET@intel.com>
 <e5e80301-f68d-4301-9dd6-cf49fe441884@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e5e80301-f68d-4301-9dd6-cf49fe441884@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM6PR11MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: 6068b20f-3925-4229-0754-08dc9ad598d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z3g3XiCH/XZGHBU8GwBalctknX+skAopHsnfcylf7tnbsmqlakaK34nMJvDr?=
 =?us-ascii?Q?U07rGrvzo8TPoclRt/XXGTCfgBOYjH7e/Y4ZUfn2UNzUf7TQr1KJyE6aaEzb?=
 =?us-ascii?Q?3rx6NGf1e3fxDf+iAZtSukId3SzpluN0oMTZkcPUUdoWGthcUoYLT+Mbtvq3?=
 =?us-ascii?Q?k7KvYL+5OLIHZiO7ZQhF0qD42u2In6wKOEzfLpnec5Q4x9ETEHiuaWZ5l9//?=
 =?us-ascii?Q?KOkJzl9Os5qCPSfffkRaF/2udpKVuOYOL9ZpNLRrGz6wRbPym8F1K5S/4ekR?=
 =?us-ascii?Q?3xkjpu1Q06FNzmfeZiad2eBmuAZSjL0KxDcBnZNWKxRQBD6TwRvPodR/Fwi0?=
 =?us-ascii?Q?2ZjQH3I3elmF7r5kb5mq837FsrxVmHA7YaYz2udoAwbntIO2wo70HcJVKE89?=
 =?us-ascii?Q?kNP38P24j3rvJ0IOcn3/7+9l591Tf8xZhTVWnB91NZrntjQPxxXmfS1cYek+?=
 =?us-ascii?Q?5JSw0q9JkUtmVjU9ya6glQs7wcRZXW7d33/rpvdetggnbkdP5i42KNRisgH+?=
 =?us-ascii?Q?oTPbZw14dXeS8Ckp3x2sr8dXgYOu501HfB539xMuwgul4ufgPIOhwMV2SzoI?=
 =?us-ascii?Q?3Ry7KEmd7MUvyYbmMIwOSn+GBgeY/l4GNE3itoFVRLx2IPFXlNiN6pE4poY2?=
 =?us-ascii?Q?yh4bqYHunDswVS4GAZ1TlHuQKL4GhQr2pOwQO+MtlHP4GltWiNXUsv2jbZMo?=
 =?us-ascii?Q?HcFlO8veKTkVtx0ZuV62oc7tbHOEDQjaexPXaAyYbPjx0UQTLs0a+ng74Byb?=
 =?us-ascii?Q?vRZsc0MQ8piFubV7qaI3T1r7ydPqT3tWMjcBE9MKskniYG84ihoO6eTRI7Vd?=
 =?us-ascii?Q?UU8aaBWFm+9yE2cgi6mA4LX3oDcuN6q/Qa1ZN/ZF4i7EcYdrDbvcyMrpJ62f?=
 =?us-ascii?Q?lnUyG/dodLQ5vtS77D7g0UDTs1ZwSxaG6BNjUp2VslYw2D7elXRaDh2wuYK+?=
 =?us-ascii?Q?bAZ/nLf4Zod1QiKCPcvuKLJ7sAIfF1jHIRdJx5utgPdW1ATFc8crUFu612EI?=
 =?us-ascii?Q?QuB9OZFumTj6QNsDaFDNb1lvluEUiDN+Mqm6a9do7Z45gKGW7JxPKEJbwcEh?=
 =?us-ascii?Q?5HAQP8PiH313aN88evd9nAVV5Pz4pTZ00iYrvcbHpN5AfsWlqGfABZAfyZ73?=
 =?us-ascii?Q?jsB8uL6j7mpl5d1s4TYhVjrfpx8gJym+GUJsFnfDJyfDUWvQ5QQhkKXav533?=
 =?us-ascii?Q?jKIbcS6uzgp0g6u+NJ6mbXmbZH1uXOqhnGcoRdKJb1YIGXeRp8sCs9f/6W4d?=
 =?us-ascii?Q?jIWIAeg1liy/BcAPbSp+2t487rfn88Gq6OUVdd2EAs7tiBa3bnMrLBgilAKI?=
 =?us-ascii?Q?hhA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dz0OdVJtREAtSwQhM5mCpYJzshTc6diYuwn2QtRs5IwgxFFRuvSBKcxM4cKh?=
 =?us-ascii?Q?qzOrYRz8upRGluVi6jhxFDJj1CUeC+P1x8ywXx4P1TJFl0kO+TjQVXZ+N44d?=
 =?us-ascii?Q?vNT3IuTByKd4OokJRILGnQKqa9Fkj/wdbg9TIwXx/AvOOqGAbSq+HGr8Pv7i?=
 =?us-ascii?Q?IU0vQUs+G0Y8YaNemxDG3XtcHVgYQY3OJrScyhDpSqxgZhtipzeRsWe9Qc88?=
 =?us-ascii?Q?JY6KkmvWGh6rDRkbhVGTNI+0Bd33DGJx6S9gY/kmvYBD/+s1+WtN8ukYphRG?=
 =?us-ascii?Q?3+bIdxr1vjSkE2pWlpLPkrf0r+MHV4bkQ8+s1bAFHWPOd6WyLzHpYXs0uSf4?=
 =?us-ascii?Q?dnnvgVTDDtNKXfp8F4/QLAWYrZhiweLHMvU30GdmG+s98AHWrcHZD9QNEndH?=
 =?us-ascii?Q?LxddG2LRkE8eObNNT7cWTs+T8VccQpn6Jud8NC1nt5XvBtMN91XUM5hyTRHv?=
 =?us-ascii?Q?SA505/9ZCIgP9GXet/QKGZXc8xnT2DFRP33iBHUmbOFrOvZ/qIUTXa8nbUKz?=
 =?us-ascii?Q?V/YQ7Y5AY/fWpcki+l6GFkxpsB4yPj43QmrrHWrKnJr77YB1aOjz8rWiBMXS?=
 =?us-ascii?Q?jf/C1oUwMGZ3EDpoUZjSn9Lrc1fBRF5JexSCYz2QSeXt0O1yAxRc7EEjrVlZ?=
 =?us-ascii?Q?mgkv/rcXuvVvy4PvE+QEDPnimKnB/3mlVYMa1V2QxHlDsJTiE2M4PJT8Y6ga?=
 =?us-ascii?Q?jiQ4SPANt9CnNmljUcEEfNvsGHBoey3YzHRBYXlP6k68YU7h7W0AhZWXENu4?=
 =?us-ascii?Q?STRWrJyg1sAAPZrTOUq3/AGnKd0a7N1G6DGk1nNR8/WvBzayvgzSweiHT6zC?=
 =?us-ascii?Q?GaEMMvYd5nNMpsZ9XH7A4PAi3AmrZhedV1e2ottTu3KUfgDVieHkeH5SUZ/r?=
 =?us-ascii?Q?bD1o1FqRyW2Y/1OU0LqXMZI1FugjTOMG6hP92LPM5CjXO/KDu3McfjlkeOdg?=
 =?us-ascii?Q?y0elIsE8T34yyp1tKqy1Fmb9L+sbOO75Xj5TGl0q7f6gv1879l7KHUjnxF8A?=
 =?us-ascii?Q?4Mohl9Pm8CFa4Rp68m1+VwwU+JzOnqfd+YWbjy4sajT54MKE2oRSn/52V1tP?=
 =?us-ascii?Q?mttCZwIeiHWTGgRC7reNfCyeWugJCGhg/McPAXjkG8U9bszdkeb97SbtkxBO?=
 =?us-ascii?Q?LQRjjPpOGhwgmL6exLloevGhSfcafRd5Q0f2sGd2E1CPk5anqGECNnFSrvJt?=
 =?us-ascii?Q?To2WmPH2nCGSM7Qg5nP9gXYkISCnCwBePSAzbNgkzjZk01JrGqrMRxgo55FT?=
 =?us-ascii?Q?HYkck1f5lEBiThLkgq3Fmq9MHEyJjyiPjAj3jrGIN2jI8dsmTqC+9qg4/zj9?=
 =?us-ascii?Q?j2V/0vOio+e8C/516Hq8VPNLBaVVJ8g//GXP/q4Dq8f7EZubkm3kic0b3c9P?=
 =?us-ascii?Q?fjOHMmttjRPWpoOrXCpSlqreewWHvbvwqwP6lnH1WbhrxiZpBmg/IguSPZtp?=
 =?us-ascii?Q?0C9sJfMWSIuXgPcxYow6hHLxGZUrYk/RbrvBit2Gp/J3Oql5Dk8gaVZYWfqG?=
 =?us-ascii?Q?X9BVY2UFYOrsFEPcjOAuQgoypxXSclaevAFl+EKw7M1STX9UXAdLaGaKLJDQ?=
 =?us-ascii?Q?8zcnr1Idy4NSdqIyksRwWZFwMsGlwGJHW/7B6mVemN2JsvUUEuNE6giLr/Ze?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6068b20f-3925-4229-0754-08dc9ad598d5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 20:28:56.4606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWxoaKCmz10FW337WPSgq8fEJYXuuSJv3wQYA5kKyK4qKTnlo/IlGoI2oZQkreooLiCQFtpy0c5R4KepKoLdyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
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

On Tue, Jul 02, 2024 at 06:54:05PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 02.07.2024 18:12, Rodrigo Vivi wrote:
> > On Mon, Jul 01, 2024 at 04:15:28PM -0700, Vinay Belgaumkar wrote:
> >> When skip_guc_pc is set and/or this is for a VF.
> >>
> >> Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
> >> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> >> index d88f5e960fbd..f7b468930697 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> >> @@ -26,6 +26,7 @@
> >>  #include "xe_mmio.h"
> >>  #include "xe_pcode.h"
> >>  #include "xe_pm.h"
> >> +#include "xe_sriov.h"
> >>  #include "xe_wa.h"
> >>  
> >>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
> >> @@ -825,6 +826,9 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
> >>  {
> >>  	int ret = 0;
> >>  
> >> +	if (IS_SRIOV_VF(pc_to_xe(pc)) 
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > are all the other accesses protected?
> > likely because the freq sysfs is not available in VF mode?
> 
> in the VF mode we explicitly set info.skip_guc_pc = true and this flag
> is also used by xe_gt_freq_init() which setup sysfs
> 
> [1]
> https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/65336c3fa2cf7f272067be9193303d1ab7c42190
> 
> > 
> > || pc_to_xe(pc)->info.skip_guc_pc)
> >> +		return 0;
> >> +
> > 
> > I don't like this skip_guc_pc... we might revisit later
> > to find a cleaner way...
> 
> +1
> 
> also IMO it is little confusing that xe_guc_pc is still doing some stuff
> if the skip_guc_pc flag is set

indeed, this is also annoying me...

> 
> maybe we should have xe_power component that will relay stuff to
> xe_guc_pc only if GuC PC is enabled and xe_guc_pc itself will be just
> implementing the GuC protocol details ?

well, we already have the xe_pm for power management..
but also xe_gt_freq, perhaps the right place for many of the
raw freq management that is done in here...

and xe_gt_idle for the raw rc6 things...

we need to adjust this layer and leave it really only for guc_pc
interaction.

> 
> > 
> > anyway, let's move with this patch. the rest is follow up.
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> >>  	mutex_lock(&pc->freq_lock);
> >>  	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> >>  	if (!ret)
> >> -- 
> >> 2.38.1
> >>
