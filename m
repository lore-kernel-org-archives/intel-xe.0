Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAA6C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 21:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6BE10E4A5;
	Wed, 17 May 2023 21:26:02 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154BC10E4A5
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 21:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684358760; x=1715894760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xr4SMfLU3FbxVMxEzqfB4BGM54jIqtFRH8eqR3Ckplo=;
 b=YD4lfojPmx5jOGk+b5W5Aq7m0m2pSc6Vul7suiso0gZCDWPf3SF/vL9j
 BtfovHsP7TF2SI3X6g9eaLzsDfG4NinLZJ3UT7xMXT+tdJMn8oHNtPXbG
 u0SUzA4Twd72DGMz4x/+UpKZTKGSAIHyUgs6mUVVTpR5gyV0ncsE94HBb
 1yiDD4XWrYcUtnX5i6ElUPT8b0fvNV8sYrnJgbvholQZLVz0mn4TCEydK
 5ajGpng0TtVo6MLRoUYP39ALTQlfo9EGA46+MKK3SQD/iQf00IafnQhPx
 ftUPyqLjUZcEZ1MS9IptSkK7U7ApHtp+MYft06G7x/N6RQfHtjYMz2tQN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351897110"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="351897110"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 14:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="771590369"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="771590369"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 17 May 2023 14:25:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 14:25:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 14:25:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 14:25:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 14:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5w0XovEtNjNtoOljsVWtvI8WfjCiVvj5PM+P2VGAIOWF6nD6kktHjRmnAZ3+fNNXyKlf4tuQXwor0N+PC2d1dC/tAhXxiVN6t6INC0nIrIunHyfioEOhPtNfrYZEaAVG6qK7WmWvYPj6j5DsnJvNc9VFA9r3jQPQYBTz0qACu+qFF0YNKpUQMfpUu/WeTD8bAGjZjf0QmwkUDrSbHuZHjxuGtrDf8iCA0zA8TV6JkoJ3iW1YzwPPT35ok4fxu0ArRTf0jGHi5fAyjbJd/t4h44oNNbjBLawkCIwSCxQ8QH49TYZY3pBwouI5ZOVmsk2thtNnMte7zRoN1/KHn42Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRcyLaz83PsOmDDU5U7KSAwWkZHq4sOyukM9o3OBWU0=;
 b=WQiDqgTkzxiK6ga2+6ghHUwSxF2ChPAmEdDlx+IqOg1/Xsmz7rPqjz0808aJOZQYmSuvsXZGbjZQcLz3EJO4rMRUT9CHUtxsMm++b+D4Pn6d88HEbpgW+d1oae6/80o4T3GeS+40OarBFl0u1w4EbWTlx7yA2P5uj6e3pnBUkEWUC/NUlq6ZEgDV9z3DHAzay5qxqFShI6gSPH5LXXv2sjcXJC/F3eRAsFSdQ/W11GZEvZaNIbrc076kcQdeptPmatSmDlwJzygzjKRzYQe3Y4ZzoZL/jZ4+YRhGV/3/urrPxUlq/LHwT7+xaeunZg8U/+mk+oKs/dC9Qa98z3hXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Wed, 17 May 2023 21:25:57 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 21:25:56 +0000
Date: Wed, 17 May 2023 14:25:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517212552.GV10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e0b2e1-d92d-43f3-0c5e-08db571d4cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gBc7qDDus8+PLJiLa3gkYOLoaSbCip9E2xSKdFsOAW/S/dio7T8iS6hwhdN/k+d+bBz7IHxXu3T8W3mLcd5s48Zu1A5sXxOEXZhVAOlFGjD5GCkXkLyeicybq9urIMjloLKbZBgrw9UAUm2079/c3jnjMehchObkS2h/gp/zJ1nEnbMKDXOHoaaCXHwZYXQ3yjaxZChyaPHKSYPS9o+Isu3sT4eNVOmo8+TuQ+w34LhzJH5ap1DZpPl89i9MAbKnhUUsswV05A3XzF5yy1xtDayCrnIypF6GR5zyXcAY0b41vLBOfPf0MLswC6esTJSC+1WJ7bpqg+feprnOXDOLzikyo2g0p/Z1VKe7W6O/miLHXYspN/PJM93zdgaN4WzShy/CaiZPs9V2vFvpH/lehzMKChMQtHm3vL9qXDEw2G6Ynge618v1A6qblHpWo8mRze1igj8EcvPhyv+RbAMMFiwpfBFzA/sv5DClKedlZ7BhJ80Pbl3OXdL7qhHkew4zmgyorIymDAsUvdwkXJOjQvxUSwy3b+0GTn5XLw54xyg9OLHM0e5BASs4VuEq2BBe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(33656002)(478600001)(86362001)(38100700002)(82960400001)(6512007)(66946007)(6486002)(6666004)(6636002)(4326008)(66476007)(316002)(66556008)(41300700001)(186003)(5660300002)(8936002)(8676002)(26005)(6862004)(6506007)(1076003)(107886003)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i2HesLK84vOntKdqkK1qV669Gwb7XLS3JMIdFUJNpHRmuSbLOcAYlzpxdaQc?=
 =?us-ascii?Q?6hFT2b7d3/9bjgpm19Dk6GMN0uWJjiyEQbkPJ1oqtuBawMxzZ5sptSwU/aBp?=
 =?us-ascii?Q?NVLNjGOpRvROiMSkIQJG/6EsqpQfA/b/QDd3gHurtJOcBjnpBmct5d7SEUNI?=
 =?us-ascii?Q?QwU7dF0iEXb1VUatS3tdrOMrHPorgw9zTSpJ20P7bH4no4kfcWyfTBbCeCi2?=
 =?us-ascii?Q?C06Tx/ibTr8EDnbEtZAwwD1e7pQLXBJwKQXn04CcxMcztjdgSb+/7pUw4tnN?=
 =?us-ascii?Q?OXyyo5iFjYK3C6Nlos9kV12xZGekTz9rajGi8TC5j4ZPZNZ/t4wNfyExvxt4?=
 =?us-ascii?Q?WrQ3DqK97sDc+cjljUsXBoPDkse4+StlZSL1QIZUm6vbtEhzf1QakTwoz187?=
 =?us-ascii?Q?pUilqI+u+08F4nz4sE3WQZhcedHGeNq+vHKolGlelu8flX+PxhJjmz7gNWJQ?=
 =?us-ascii?Q?hA7OeoulejVXRn/s5YYNSqOgEvR70kSGIZbneUAX4xMhl8eJDAx9kLZGB4Me?=
 =?us-ascii?Q?oDP6KHubkrtW5wWQVvYdhn3ucuLSMs/e9aOiWlw4XTmb5g/NCQ0BWi9uZUvG?=
 =?us-ascii?Q?Svi0QyZDFZG20nHm5wtxe4+0ZKLP2pJkDHFX6W3XCvpkn0cVZBOTjlugxz+r?=
 =?us-ascii?Q?zx9uo2iiG2YyFrCwVluYtYDpSr1v3CzkRx17768Kb0zyQ568xXKXMDfgCWVt?=
 =?us-ascii?Q?pA6ndtzvWVwR/fJ8cQicRrhWlLxOUCUPNoTDLRyWDY1TbPQodmtiXvlBBI0N?=
 =?us-ascii?Q?dDxtpXBZO8Wg5YWUsv0ixh4xACjJwLci4iB3+VsbRC9NEUNf+nCJ04F7xYxp?=
 =?us-ascii?Q?+u1qdefHpjR1T8C/kX/gsVw1UoRb8cS3rmfe7LN9wo8eVsHgj2Ogjsoj4Aw3?=
 =?us-ascii?Q?KkMTRsYxgivad1TvuKb/sXt7cPM6efTQ8tQSp3RMBGDyBFuaGhEMPToELXnW?=
 =?us-ascii?Q?lKGbwH+zqR/DWRuJs0y1GHVE2OXDZks0XNiQG4I3OE+FGcSwPZATdoJnJ2e6?=
 =?us-ascii?Q?gEoZ7zHxPCVqiw/X3rG2ST9k5FKs5nhPxcu6VX+QIre8W4AfCbyPwCWiGJ0f?=
 =?us-ascii?Q?etLL5DQ0sgmUkoudguSU9/7SGjDPGcjKa+C18ehArelMUQShtuvT1OnWXUvf?=
 =?us-ascii?Q?I3UKKBYWUEJB6nk7DCnr5/9oE1NrOvljJgsmBLaqFfnJU+wTjhAGhGDw73Q/?=
 =?us-ascii?Q?hSnwKLglNoVbWKhuliCimsioHmQE9Yr6Esrmdw4XMcHTFvwyW3Ca9yEAQP61?=
 =?us-ascii?Q?ikOPDgXu12+Zw1/V8/ntERQcPQAQwX0MpWNhjTh3jVXmFAdLNkYNzmM6LWZ1?=
 =?us-ascii?Q?CY/MUZ+Fcvb/aqmCB+J5uFDruEoF6wFZgcvhENv+qUjVSiu+a65wAinzR1BW?=
 =?us-ascii?Q?fBFElesaxqlqPn312+Imi2/mO9CuC7CUOn85t4anYqUqQFvDK9VZtJVFod9m?=
 =?us-ascii?Q?6hXlAdYR9j+9lOgC6CVII3+Uo8W0NNfZQHfUjGyNnsXriv51jAMOVdJ6pYnv?=
 =?us-ascii?Q?D6gAnln2xtUi2HWcz46FhOqhEcxWvWZFm2apdsXQbI5PgGxKau8rtA/9oavu?=
 =?us-ascii?Q?X/hevk1p+1vbKdjqlwl4U5WZ9uTLPmAAHiaxz49r4lMXNtDmGNj+tHlo5DuY?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e0b2e1-d92d-43f3-0c5e-08db571d4cf0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 21:25:56.2022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLKkqseSDhWiY7zIFJ9UQ+hMErIox00ZFniFg3CER/L3oVXzVm2vrK1fTr5ybfq3YKzfgcaKTJ2VHzC6qun0ZIarEg5tkv7Ge6ZhWmBXypA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 9/9] drm/xe/guc: Port workarounds to OOB
 infra
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:19:50PM -0700, Lucas De Marchi wrote:
> Let xe_guc.c start using XE_WA() for workarounds. The one missing
> workaround is left with a "FIXME" since it's not properly implemented
> yet.
> 
> Also, some changes were made to a few workarounds:
> 
> 	- Wa_22011383443 not implemented due to being an early PVC
> 	  stepping. Wa_16011759253 that has the same condition is the
> 	  one covering DG2.
> 
> 	- Wa_22011391025 and Wa_14012197797 were split in 2, since they
> 	  cover different steppings and we do want to report both as
> 	  implemented. The latter may eventually be removed due to being
> 	  early DG2 steppings, but the former should remain.
> 
> 	- Wa_22012727170 and Wa_22012727685 were split in 2 so both of
> 	  them can be reported as active, regardless if they (currently)
> 	  have the same rules.
> 
> 	- Wa_16015675438 and Wa_18020744125 were not checking by
> 	  platform or IP version, hence making them not future-proof.
> 	  Those workarounds should only be active in PVC and DG2,
> 	  besides the check for "no render engine".
> 
> DG2 system used for test:
> 	XE_DG2 G12 56b2:0001 dgfx:1 gfx:Xe_HPG (12.55) media:Xe_HPM (12.55) ...
> 	Stepping = (G:A1, M:A1, D:C0, B:**)
> 
> Output is as expected for the current OOB workarounds:
> 
> 	$ cat /sys/kernel/debug/dri/0/workarounds
> 	...
> 	OOB Workarounds
> 		14014475959
> 		22011391025
> 		14012197797
> 		16015675438
> 		16016323070
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c        | 43 ++++++++----------------------
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 16 +++++++++++
>  3 files changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index fcf04951a309..07af0d022263 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -38,7 +38,7 @@ $(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>  	@mkdir -p $(@D)
>  	$(call cmd,wa_oob)
>  
> -$(obj)/xe_wa.o:  $(XE_WA_OOB)
> +$(obj)/xe_wa.o $(obj)/xe_guc.o: $(XE_WA_OOB)
>  
>  # Please keep these build lists sorted!
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1b5d0b6ad180..252a4bfe6d63 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_guc.h"
>  
> +#include "generated/xe_wa_oob.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
> @@ -20,6 +21,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_uc_fw.h"
> +#include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
>  #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
> @@ -136,29 +138,16 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 flags = 0;
>  
> -	/* Wa_22012773006:gen11,gen12 < XeHP */
> -	if (GRAPHICS_VER(xe) >= 11 &&
> -	    GRAPHICS_VERx100(xe) < 1250)
> +	if (XE_WA(xe, 22012773006))
>  		flags |= GUC_WA_POLLCS;
>  
> -	/* Wa_16011759253 */
> -	/* Wa_22011383443 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
> +	if (XE_WA(xe, 16011759253))
>  		flags |= GUC_WA_GAM_CREDITS;
>  
> -	/* Wa_14014475959 */
> -	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
> -	    xe->info.platform == XE_DG2)
> +	if (XE_WA(xe, 14014475959))
>  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;

Hmm, this workaround was already implemented incorrectly, but it does do
a good job of highlighting a shortcoming that we need to address...see
comment farther down.

>  
> -	/*
> -	 * Wa_14012197797
> -	 * Wa_22011391025
> -	 *
> -	 * The same WA bit is used for both and 22011391025 is applicable to
> -	 * all DG2.
> -	 */
> -	if (xe->info.platform == XE_DG2)
> +	if (XE_WA(xe, 22011391025) || XE_WA(xe, 14012197797))
>  		flags |= GUC_WA_DUAL_QUEUE;
>  
>  	/*
> @@ -169,27 +158,17 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (GRAPHICS_VERx100(xe) < 1270)
>  		flags |= GUC_WA_PRE_PARSER;
>  
> -	/* Wa_16011777198 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> -				STEP_B0))
> +	if (XE_WA(xe, 16011777198))
>  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>  
> -	/*
> -	 * Wa_22012727170
> -	 * Wa_22012727685
> -	 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> -				STEP_FOREVER))
> +	if (XE_WA(xe, 22012727170) || XE_WA(xe, 22012727685))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
> -	/* Wa_16015675438, Wa_18020744125 */
> -	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
> +	if ((XE_WA(xe, 16015675438) || XE_WA(xe, 16016323070)) &&
> +	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
> -	/* Wa_1509372804 */
> -	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
> +	if (XE_WA(xe, 1509372804))
>  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>  
>  	return flags;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e69de29bb2d1..060ff25496a7 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -0,0 +1,16 @@
> +22012773006	GRAPHICS_VERSION_RANGE(1100, 1250)
> +16011759253	SUBPLATFORM(DG2, G10), STEP(A0, B0)
> +14014475959	PLATFORM(METEORLAKE), STEP(A0, B0)

In general we can't match on platform anymore for disaggregated IP
platforms; we need to match solely on IP+version now.  For example, this
workaround applies to 12.70, but does not apply to 12.71 and also does
not apply to the media GT for media version 13.  The old way of doing
things with subplatforms also doesn't work well anymore since we have to
be ready for this 12.70 graphics chiplet to potentially be re-used in
some future non-MTL platform.

A first step of doing

        14014475959  GRAPHICS_VERSION(1270), STEP(A0, B0)

isn't quite enough since it will still result in this workaround being
applied every time guc_ctl_wa_flags() gets called on a platform with
graphics version 12.70.  In reality, we only want this workaround to be
applied on the _primary_ GT if the graphics version is 12.70.  When we
loop around and run the function a second time on the media GT, it
should not be applied since media version 13 does not need this
workaround.  Other workarounds might apply to both graphics and media
GTs, but only specific steppings of each, so we need to specify which IP
to check the stepping for.  At the moment XE_RTP_MATCH_STEP can only
cope with graphics steppings in rule_matches().

So maybe we want something like:

        12345678900  GRAPHICS_VER_STEP(1270, B0, B3)
                     MEDIA_VER_STEP(1300, C1, F4)

that ties the stepping to the specific IP and version.  And then we'd
probably also want XE_WA to take an xe_gt as a parameter so that it can
make sure that gt->type is appropriate as well.


Matt

> +		PLATFORM(DG2)
> +22011391025	PLATFORM(DG2)
> +14012197797	PLATFORM(DG2), STEP(A0, B0)
> +16011777198	SUBPLATFORM(DG2, G10), STEP(A0, C0)
> +		SUBPLATFORM(DG2, G11), STEP(A0, B0)
> +22012727170	SUBPLATFORM(DG2, G10), STEP(A0, C0)
> +		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
> +22012727685	SUBPLATFORM(DG2, G10), STEP(A0, C0)
> +		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
> +16015675438	PLATFORM(PVC)
> +		PLATFORM(DG2)
> +16016323070	PLATFORM(PVC)
> +1509372804	PLATFORM(PVC), STEP(B0, C0)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
