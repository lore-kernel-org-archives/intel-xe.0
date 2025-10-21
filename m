Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52A5CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 21:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89FE10E315;
	Tue, 21 Oct 2025 21:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EC21Cjcp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4210E315
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 21:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761081972; x=1792617972;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gt2PZnDSQvE4NioNBLdnDK7FvrGvV7uvdNwhC+yUglo=;
 b=EC21CjcpSr+NFox1VXnG40Eq04AxcZC92DwOjIatMpzH9C0+YxaX1R1u
 tjcx19Hv8E5M/az/ACbCu86KHSCvRmEwWBKgdg7T4wRkGN/py1Exh9be+
 DrgthzGLgwMBbYgpwvPdGE1bbJPc3JfmLWf8hrXkTV3z6v/A3bObQBoRW
 YM75dcOA7nJifdt+exkQA5nIXEgjk+YoRaHk6OoEF/ePSUBZkfLDmaRA/
 RonfrwIlk6HrCxZLl2LD+AN3KDGaec+ftMsMCa5ZFnVfspCzBuNVgkLJQ
 C2qSZ6Ifsq3GLjNQ/oDmotlVu7voYYO7fYhrTSYvaaCd/860PfU94C3rn w==;
X-CSE-ConnectionGUID: 0MCcBNwkT1iy1ni0Ae7iMg==
X-CSE-MsgGUID: nLV3BYr6RSeN3F/I2woIvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67084776"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="67084776"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:26:09 -0700
X-CSE-ConnectionGUID: DmNAgYPKRRSqPaT8BW+i+A==
X-CSE-MsgGUID: 8AxkkKyNQHeTBj1jR+5LFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184469729"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:26:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:26:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 14:26:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 14:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx/x158BSLGy5Unw4hiaDwWC4fIcyJSSwtHjg9gakLMAJCvlAv4eqcsC/vgMCGFNVX4NkVx3nSjlPJDIkzfvIJUZb/bDeV/UQRlBtPAGId+U+oqmrVkIE+TGGQcrhztqanXQGWgeT3pCuk1a1qK7K+/+KuC7MUvc+l6tS8rTDP8lTb5kSTVzHlHBYOAgC4kLr1M+vYImh3/K8fTDdA2sbvbTTGCFSDo1us75ZlqApvQ3hDYybYFeiP5WBfTvPiDPIjlW8z0eoLdLqFUaNNLLO1tiovPCXzYKYWWB5IPp1UELX3jx1R0k8GCCbLeNib2sTQT9Xj3MIX+s+I/C4BKwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDG2QPMAKlC1XxmIa+locZPPr9oWeHw5RmCWZNpSIT4=;
 b=lw9KOFCc+umw3fXEba2nBZfgl6TIxACIYt93918unWrbpxw34bzBJCoMB4bjyeVwlzcAkVlpt5HegJgjLgGom0+jWbBiUm7e47C6m9RSLTU/qgyyXMp+5Q9LBxjH7cbvBmC0NbpxUQXbIGn4JoKke9PtJpnJ4a98mcodEEzWtccxxadJqx52jG/FLo4KF2B7VnFXIDW/Lqlp4/0E/0CRoFdDdkLCgdg6cAX95inJxGXU8fhJqom2qIR1EBkOKBpGogSvKhtiNcJs72p6XrB1TjMAyp/fnoaMpQkS1/J4lDqv2A7pk4bHRU7yMDifQ8B9HTlq64gZmUtDgQFPgcErJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8704.namprd11.prod.outlook.com (2603:10b6:610:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 21:26:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 21:26:05 +0000
Date: Tue, 21 Oct 2025 14:26:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
Message-ID: <20251021212603.GW5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015075253.1036423-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015075253.1036423-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ceadc3e-f9f5-4661-03e5-08de10e87193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G8txZ/qfmC9ecu88Zmn7vaDDt2YVUdM/cp+fnD7c68+SzDlREFLRjQxErAFc?=
 =?us-ascii?Q?/NIJBy4mTaMTRj4A4pvxhzMpdjNF6S96T5W7ozmHlMqutPlvNb2jweVajNP5?=
 =?us-ascii?Q?Dj+3xR513qQBntfx8/pzzRwRR724Blmh1tJ+43tlD8b2xVXGuGcyfG+vx6p4?=
 =?us-ascii?Q?amULwgoKpHjF0Te8Ov7lyIZT6NgytH0ncQ8hAtaYJVmZQr4rGmDnw83K2lD9?=
 =?us-ascii?Q?TyHkzuPhkVAqOmO94jmYsc3mfitGAA9/OLHGb3fMBykFpGKFw6FJzKKwikZK?=
 =?us-ascii?Q?sgyHEy+920vIck9KE1uX/+zk/EpkmRXykdTpxt7c6+EazqGL6EqD3ht8TbMq?=
 =?us-ascii?Q?6gxDV0QyAfsXWiJ3uTxY6tHaCZzp53i+yTJh4dOsXxqbxCxxcVMx9dke0ZiE?=
 =?us-ascii?Q?cazHy8tRs+TXv15s6qxpIikfFNzy9oclcxjA+yfuqBo4hT3OpF2BZmO3d+z1?=
 =?us-ascii?Q?o3B22n7ju5oIoGpRGbYxLxi8HGw/bT9CVlZ0FMiKdt8ZkBDVEx92PQWe7Rz7?=
 =?us-ascii?Q?1tio5xuqVWwbriXBj3sTfnQhhFGYLnrVfnJKa3jV5jBOjqfOch+rMmjvdp41?=
 =?us-ascii?Q?o9VRYwoALhXRfMhEA7jxlJKcBFUtCY3xmH3whaKbPMipotWQ2zG96i2f+cO1?=
 =?us-ascii?Q?RHIit5fQrE5MU4o9+CGmNyGW4yvAh7I+4iE4uTbYnR7dhINdCZ+UA3A4nini?=
 =?us-ascii?Q?qT5Tc5txJGY0uzyNvQTcgK4pVQgl6aOu4m8lFKcM73lFwSAQ6FaRUDOK7vZ8?=
 =?us-ascii?Q?SRcV5icmGA3cVBK+wIUUURAGMhH8RQuzt/AJ0Q2tlb2jI4O47FGa+0I4nSoc?=
 =?us-ascii?Q?tkxCZ+ZJ+QraYDes4uaBJozluLw1Qrj3Oa+5EA8B3m/AQjouf/koaD9WoKv7?=
 =?us-ascii?Q?Mxgkn8olgeTbim5KKQyH2GrQMNPYi1xuYMPOeJ4AMJKL6KK9T0M79YcWUNHF?=
 =?us-ascii?Q?PqO0CAdKIP0nlAtPmOKqk9mbOl03DmkNTag/F7zE816sGTvMAOdheaXWtq5o?=
 =?us-ascii?Q?jZOqH2EXlXMvN2EBH+NIqUf+ZyNO13/+/9VI08xeiU2pZbY1/+YRy2Gz9OqV?=
 =?us-ascii?Q?5RGQI35ef/xbHeQ7RZhPHrLiD9wxqyIWI9h4u2BgdriplqoG37N8jL2Ujiuu?=
 =?us-ascii?Q?latnv0Xt2ykP+AlxBack6X18ISQlIPfWKNJlY8Fy3n8STQVJTNLwfiQ3yZas?=
 =?us-ascii?Q?lHzRl+ITFwN3o4muHIJ0JsZgkfrujVSFHaVHAyLX3vfSAo5mbHAxQDpNY/Ry?=
 =?us-ascii?Q?0pXPk1eQeaKW6M9L5WNfePQ2Umi4nK/a4/5fdvotb7TJ3NWabe+YbhQYStTd?=
 =?us-ascii?Q?wH6LXOz41RJwiGXYgn3sf5dYRB/lpaJt+4e9a8yb9b8KeY+NQgajx7JO0hr6?=
 =?us-ascii?Q?3WGUATRps4LFkMgkAm8qWBbwfH6COOW0m9qMCFMfgsd5LEow2gR4Cs5VB6hg?=
 =?us-ascii?Q?t3PbDEen8qNe5eDiOp73m7g1a82nlYxL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8OgrLE9iXHykg4S6Sy4yTwp2MhHJ5WdrEofX2osMNOdb0joGLDzEyjCdea9A?=
 =?us-ascii?Q?DZcnn+pzAGSljy3UHevsf0cxtUUdDBeVfpHZ17+Eh1SLWYWjeupCu+Lm93LS?=
 =?us-ascii?Q?PAEzqlL2RHDrEzotTm6RbbupPFEvW5InEH8Nnie/y7klXcbbt0mT+WN7O/B8?=
 =?us-ascii?Q?rlgX1IIzfMK+2LBBy+5sGDN2IGhEFISQcdyVeVhkmI0XhLX0FhOcjnWzMjNP?=
 =?us-ascii?Q?EOZ4FC8XZ9fALGjsuO95H+qI7D3JAKLoJdnRZMYjBhpk7iKou+yNKIrDRstQ?=
 =?us-ascii?Q?SuCOeKww3l5uNeQBhdvXeo2gPTCrVSTp+oTV+o1LsnVGoH2dC7tU5HC4KW7m?=
 =?us-ascii?Q?fBCWn/WinN9pmzrf6O4ZauyZykZuGz8nouAvvU0R+3tV9mer1Srujy2AcV+M?=
 =?us-ascii?Q?SbqAJsBsJLFm0Ri1ipwP+BJwRQtlTK+QbGO6IMtNMxYMTuo397oeclzeN/Dc?=
 =?us-ascii?Q?3NM2GFMETO5yn/kfzktyo0NMMETFKBuWafe3EGZtI649AqVKzJcwCF//jfwq?=
 =?us-ascii?Q?0zinGvlqA7PQMzuoJlJCu7I7Fk3IMHlKq0OYIdhzSumNvfCSOLFTUbjw4KNl?=
 =?us-ascii?Q?3iHlUo7AsBGl85LVD0SajvrWxf8qm8+DBWVa3bgONrTYOwaCgdyBkPCUxiYg?=
 =?us-ascii?Q?SKTn/A9vDVG4GwFnlnBEHFlpAxDjzGyawwwTromnq0TLykf/XE7JbBMcAZEs?=
 =?us-ascii?Q?IozddWFBhnPt8ymMfSok2kDxEyeKip+bM08g5W5FXNOCHoMM29Gcvo92ZxnB?=
 =?us-ascii?Q?6SQy5OnIviK9Cz/zq5l2FC+cdRHZRf4g7WyFDJU7qng+ieYLFY9p/M4NmUTE?=
 =?us-ascii?Q?kKAZ6Gun2XCe7w2lf21w8d0wHoqvwC2E691QSqlJ+jVJlghjGlZdvZk7noLh?=
 =?us-ascii?Q?/mUH54nExtEyC161fs/po8BRFiK0nbsWIb6qX80jlnZ2Hb0vR9oLOyExaElU?=
 =?us-ascii?Q?g7YHyYaCWFxAV7TP534/ET64ybhLllFpu3C8Smgaag0F3UdA2YnIOAOfU9Id?=
 =?us-ascii?Q?+2wkw90170OvZJR/W3y1x0Zl+cJLEa9mjA220nu29WaVpcD39Lxwf0fwxHtW?=
 =?us-ascii?Q?HGre9CPdXTh2NFdYR9a1A745LlFxmgX6L/BtlIOqFIKnYSC8gfgoa0KCp7Ni?=
 =?us-ascii?Q?JQF2JNotPJSLBw/a2lvUfqPF65GIY8LqX1RA9SPHOBb1rJSYeZFLp6YKt4Y/?=
 =?us-ascii?Q?/446Losg8F7JpNmnRZS4n7XQLEQC0GMGa2zcE/ic47pY0vZz3i1niNZam2cm?=
 =?us-ascii?Q?1LqHua/MSMjM4QxwSQbqpe526++bissDWSEFncBcg2b7t1kbbDku7RJBP3B5?=
 =?us-ascii?Q?cVG/S5L21I1YJGn8zLB73eVLfjlTx00cNQjlz40++l6UDkqzN/qV1EHfNzHt?=
 =?us-ascii?Q?NJJ+L88YQ4jDnVo9Z4ixGvzdGgfDwb/4YEAuWlOLFlBSXGltecxfwlRiezTU?=
 =?us-ascii?Q?DMvkgtuCzBG93DrVWl4LGbH7NPNUIG3rwdC9Gh9Cqts0Aje8Ib1vYH7meJA8?=
 =?us-ascii?Q?b4qYf3WudRNBALlaiwSVDBJwiNEGqlx0NAsRy+F6fRMI5fg+KOsAucy29Ihi?=
 =?us-ascii?Q?HMXvYkFd8zHx7wPD41i2Nti3XtcFzWW1IPbxGbT3SShrqC/vD2cAySBAYxq+?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ceadc3e-f9f5-4661-03e5-08de10e87193
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 21:26:05.9145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qMQXf6j4j7LQK1PWNAPsOuNw1B0BH9GzTqEF2ZcLBSG7k+BlRJjyLbWiVOFxOQ7myBRXIUlc0E4s3k3IlYfnxdmQ2vJhKaG5w9JwUkMwB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8704
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

On Wed, Oct 15, 2025 at 01:22:53PM +0530, Nitin Gote wrote:
> Apply WA_14024681466 to Xe3_LPG graphics IP versions from 30.00 to 30.05.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 51f2a03847f9..f680c8b8f258 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -168,6 +168,7 @@
>  
>  #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
> +#define   FAST_CLEAR_VALIGN_FIX			REG_BIT(13)
>  
>  #define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index aa1b69f48f6f..1cf6b65f3be7 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -916,6 +916,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
> +	{ XE_RTP_NAME("14024681466"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), GRAPHICS_STEP(A0, B0)),

From what I see in the workaround database, this workaround is a
permanent workaround that applies to all steppings for all of those
graphics versions; it shouldn't be limited to A-step hardware.

We're also missing an engine class check here.  This register is only
part of the LRC for the render engine; we don't want to be trying to
program this from the LRC on other engine types.


Matt

> +	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1, FAST_CLEAR_VALIGN_FIX))
> +	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
