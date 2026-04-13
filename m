Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445B6F531DB
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 22:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DCF10E109;
	Mon, 13 Apr 2026 22:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0CqFLXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CF310E109
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776118207; x=1807654207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zbh3kZi+3LIgabbo/Y9DAm8h/PuLYfO9r/FvUMLFzgc=;
 b=E0CqFLXEOFtFEFL4lMHi3b6tbiRcqkcdTuibMDLPybtmc19mmgry+Ov8
 9ZgctgtpBXDrpUWiINSkObObmAShV/giGBd7PkxnP9KO+3sPKtuGjqoOu
 a3ngHJRYAUHY8vJFNm58fZW5M6L9EAKiYBfSZ3Beaamua1+IWoLhsnN9G
 CNhsJUXQSv5b4IAcbHOhK3C+nBox7TS/PRqI/Rs8RleYF8mP06y/bV7bD
 +Y8sqjhYmZT/fYZZS3hxmG6GRuAQjYrBm3yLN1/Y574oaBw4yfgfLsoRz
 EsHvCQnxb/rjyl7P462VdDAInCrL8tKjjAP1wuL4VsCHCmFiqN/KnW/Q+ w==;
X-CSE-ConnectionGUID: 7cKcw2zUR5CTQeqEDUDpXA==
X-CSE-MsgGUID: LdOVpkfjT0+Y+OJ3/PmkCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77176004"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="77176004"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:10:07 -0700
X-CSE-ConnectionGUID: ADanyIQuR8qXBQKutvfSmQ==
X-CSE-MsgGUID: spA7IqYDT2+en8BNWdJz6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="230149338"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:10:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:10:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:10:06 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWCGqM9NbhVfa+rznoHVA2gvHCWsqa5bFZ071412U06Q2patCwVTobA1t8bUFK0JVUTzAB/wAzzWZ7up6UhWqOaP4U4rfOGMz4lTD+JxUYq27VyN1MzU72daNxZlNLdlrgNyL9K2aDgGxTOqsHaUhcNTpZaDcxU93+SImI+9mYwiX3IzopQv3HifVXaAsWeNt/qqdao35ua8rclpuCIPl7ysbWxF/iwDiOmkV4imAMC2zlS4m9oKymos+5PZiSdwckdbYs/ZWXpwetD8TOCJpQS1029tICG+y+608v8vIXuV1Rvb6ZsQNlOdnlfp3RJ04G7ICBvHUzh1fyFxYEgz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip6SrG5/d4DypgWmKl9BwzYufPYC8TM48E5BB/J/3v0=;
 b=c2BogoWk0SO7fCgQEZKfURPgKLlFf0uz3PZ7/joeDoZ8CrNWRHzF8Ymy2g+mJVV8gSwaZrO/HNyLb3FNdk4sKfKmObT8F+0ILX9SUu7r55mnSU062XwUhEwSVH+K7uG4L3EOp0aQQQnT3Hi4veGxYqRyyKNgggr7JuSzzvN4ECmaeFVULbRsSZZszqKdN2ZQyVU48SKJdUc/8EKmC6cPc0v59K1O2NUa4/z8r2hUVUTm5bQqXMaX0vJcgddX2N4pH3K2soveXZ+fbtOdtaykvXPfzkr6b1ShMz+iO6GedQf/+V2ZZe10r2pS7VXeznhWqylIxhYrLZGvd7KOLw7GTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB7832.namprd11.prod.outlook.com (2603:10b6:8:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 22:09:59 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 22:09:59 +0000
Date: Mon, 13 Apr 2026 15:09:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <ad1ptHyrfIg4Y96J@nvishwa1-desk>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0374.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::19) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6a201c-772f-42b9-dff4-08de99a966e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: c1VOFgTc/G28IGsH5H5cfgFVR4OpwXBQz6JtRNTHelhRGL1gKvp1kQAC7Zm1GeadlDzssrjlwv129BIJrPg9JdrM77eAAb3oL324jQwCmkMiZKMnKwAn/Nby/r0otESNf4fo+vnZ6i+FXz8QV3TOMh5tn30vZ/BMYNuP4z5AVLvQ1X0mooyC1rQ60+BGK4hGessrnQpOpJurlYYamTyxoe6PF8TerYjv1TwAfu+wmpubjRLMW0uOWug8deabgzLAnL7thMyAUbG8Q9xKu76taOx6sMou5N8euD71rcTVVPrTQChP4RXSXaQ/GSv8hksQZs7PayM77r+R5hBXXd9WErrlZbpyvEBiEqz3SccT4muU2BpbsMjImPjq/LN0IXPaTmB61JVNxhthi1r5oHsgakZZyZsSTqt0DlljMGp//EIbmatYNDiCvZYlKmUpEPUMQJneA4ObFm8sLYncUi4VZFXsM/k3TfUiUsLuAn4PX6OPxuEy3wKXpfTezRjvArWhvI9uy0b0rIZBqE8B/QTnpvVs4TrRRO9usjLw+mHJBB62IX+DGioiRuzBaP/hDDg/rA9ymnPMj6jX+15XlpeXVStwsdoJ7UXGZ1bX6GyF3qeMIlWptVaVG5rt46Rxy0gNft0z+64Q1TqsX57uEQX3/Xro0bxYRkuzfr/VmyJp2PRovOKUU7iBmuBmbxjmcPipYTw5aKMMfe2rPSQ1hC0a7Ug//rNiz1QjEnRK3R45JCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kf5dg5+gFaykgbnAsieWBUWFugEOimRVAB1dB1Mkp9LDCdRLbPdFB7eAdo5o?=
 =?us-ascii?Q?fcl0R5lbmP4Q6hdwBzODVcISjHmrsx2bRW/5OaHHMKaCJyk6UEdp8iU5eZ+i?=
 =?us-ascii?Q?3wM2auXt19AFOWJD2VrRfniXZyhgUtMC3KnBz9JEyZ7y/8oYTqXk5MsCEUtJ?=
 =?us-ascii?Q?9RSxlWVfZh/T2iyidRXM7aZdgVp8O03qW+qPeqHzOnMZ2VEkB3EhQ0JyIl6r?=
 =?us-ascii?Q?y69CaiLWtQXEvnwgDh4ZADcvOf3KNOEMLmGMfUabv50A/Jl8CfCO1YiJgwVN?=
 =?us-ascii?Q?exFveuDHEaexCFk2I/A7fneaa3u+vFV1rHmcIxswSGsKGZa4M8PcQtgoV/Uh?=
 =?us-ascii?Q?8mG3QHDk01mCTTYwFbSqzVmpQAVuidcQhXZs/UKjdRLU/XBtHRjHwuOXQeY/?=
 =?us-ascii?Q?mOgihv0amKeQXjf6vGLvXReChkPamInSBoooDG+k2SiWUD0GuOj9spMpN0sQ?=
 =?us-ascii?Q?sJgyNXSHKbpEjNT9pSijbqZmDUQ0ry4MJB2bwSrOkGEJ2/pxx6GpsT+mnkhS?=
 =?us-ascii?Q?X7lnHLjDn451jipFBhUa0ugNW8YTuGz3fDgu77yUfh4n6jO7WwnEHVErRhac?=
 =?us-ascii?Q?JB4mdjakuM+R9IyHDr2LoiyIqqUwkwNC8SIIU1JX9hMc1939iGnvgkAFrlF0?=
 =?us-ascii?Q?cOE9sFOo124uoQeyN0+IbvhLOV13lRwkLEQ1quhJkFUou4baE/OzJnOgGVF3?=
 =?us-ascii?Q?0SohVriWFuk47Gb2SvU7keHfg7OQRHqsGLrCuoDX4Z1wHENmaQMwoNW0aWxK?=
 =?us-ascii?Q?zCzneR0BS6Ms2K8S66LoPUTv2wG254y3sgl0TLyLwyUcad1oTKmh2RWFVNbY?=
 =?us-ascii?Q?ZnBiLOP1QOfMMAajM2/eFzcf2ate5Xqky5IT04kdBjgGdwBPJ3IRIlnP0TeP?=
 =?us-ascii?Q?okJH22tJG999nh7XVv/8XHFbmh3rgNaPFYMEt/bJwXx8GCKZpcSH8BEpLtA+?=
 =?us-ascii?Q?Qx+vj1d7Bgr0cJXgjeFTaWyA6bVa8u0ISWbRXzKNrC2Qf4n2jCOoSqY4GnLA?=
 =?us-ascii?Q?H7zcpmzKKbsCH59tbjoW4PZEKvx9aMVr0MHEYti/g/svQBwmLs8XGBAwkFb7?=
 =?us-ascii?Q?fmDxAZwHGLuwWPjhDJfGPzAwRRpDAE/4x3CgM/CpuiSgjYjtfKN0sFAUIMP7?=
 =?us-ascii?Q?VIHq/hOeNF551LCHFIBlEEnGDIAy8VQWKH3CbeKaaoswATJZu01xZ2Hye25I?=
 =?us-ascii?Q?vytjc2ioCAJjLJEW9IaAzLiRW4M1CyDH0ARZqxPg0ttSPv1/ikXHS00A5HRc?=
 =?us-ascii?Q?ykV5Z5M7PjKRtytDyQVvQ4KFJZt9Qh3Y6+Ole2U0ggbpniOUGoNkaXsq3BDN?=
 =?us-ascii?Q?l5Jx6yWCPHkxRWVmu04tkcFDIOreJmVeL8tKFDC10TszvANX0F9fm4PlEmz4?=
 =?us-ascii?Q?QCOD73sY6AzC13zutzlyQslH+twJfnoV5xHKnSyrepoDlziQSAdV+mQQ419z?=
 =?us-ascii?Q?TNJm5Sb7ZnQOuDMUHWr9SmxKlPif+mvH1FAsKDVE9ttla9mS1eN28Bakf3DC?=
 =?us-ascii?Q?22OFai6hqOPbTwai39YTcMV+cc+KjQ+idObuH2qFM4OVXDoqDHJvTl6qKY8w?=
 =?us-ascii?Q?vnhte95KyEidRTVOFm1mFy42PjmwuaADlGwxoJupPy6aEkj5xKtHc3y7vsB4?=
 =?us-ascii?Q?365YukPaDVg2me2DvMztnBXkeFwkir1XqfiruMY/Ukxrs5uEnfPRJITFQF07?=
 =?us-ascii?Q?jW6sLAVdr6YgMTkU8/k0vR0Tx+kMo64AePyk6cgJS/YC7a98ad/9P4YHTL+r?=
 =?us-ascii?Q?2x8njnli50GqBrmNt7XtIFU/d4uprI0bvojG83VA1l7Xw2qDcC7+?=
X-Exchange-RoutingPolicyChecked: Z/JDbAkHrDmxH2hlqec/nE9IeRqjE892M3UiN4/0lwjrp1qscES7G8mphvMPOE3eSTMxDj1Oqa8dQ9zWWdsvImHieIHUbSPircz/jlQ+r0hSssH5n3wUOs4lEJfAmTii4y8mLTYiPSJzJ9LuNQK2JDI/hTIxl7G8yZ6fMYNPPi08+uKhfJtJt5OM6DFDdRBnWdd82GYM38Ap1JO4bIi8ENhOn2/Ic+n5vXJ5Qc1glGhreJ7C0Dyv8A4nUjHMxhlCqC53nDaUakptcxzIDP+dfRSG0quS3Y05wYjkyz+RaiiNbSybTlUPLS3qhaKzVz0FrPZRg77jsJaUmwPDUMH9kA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6a201c-772f-42b9-dff4-08de99a966e7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:09:59.0094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkZl5e4jX1BtEH2xwg61vtCZme0jsjfpZJnJboxv7NukWhVDpdBXDE+w4Z6W6ssDwWgnIVhemIZOsBgBmduvH4UlLL1fcuT1+CEU2CAS5WmB+WeTYxobNkoSAkwEnvEt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7832
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

On Thu, Apr 09, 2026 at 01:37:18PM -0700, Umesh Nerlige Ramappa wrote:
>If a queue is currently active on the CS, query the QUEUE TIMESTAMP
>register to get an up to date value of the runtime. To do so, ensure
>that the primary queue is active and then check if the secondary queue
>is executing on the CS.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
> drivers/gpu/drm/xe/xe_lrc.c              | 122 +++++++++++++++++++----
> drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 +++++
> 3 files changed, 133 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 1b4a7e9a703d..af6af6f3f5e8 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -170,6 +170,10 @@
> #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>
> #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
>+#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>+
>+#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
>+#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
>
> #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index be1030c74e21..1e407a761076 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -21,6 +21,7 @@
> #include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_drm_client.h"
>+#include "xe_exec_queue.h"
> #include "xe_exec_queue_types.h"
> #include "xe_gt.h"
> #include "xe_gt_printk.h"
>@@ -2638,17 +2639,72 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> 	return 0;
> }
>
>-/**
>- * xe_lrc_timestamp() - Current ctx timestamp
>- * @lrc: Pointer to the lrc.
>- *
>- * Return latest ctx timestamp. With support for active contexts, the
>- * calculation may be slightly racy, so follow a read-again logic to ensure that
>- * the context is still active before returning the right timestamp.
>- *
>- * Returns: New ctx timestamp value
>- */
>-u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>+static struct xe_hw_engine *get_hwe(struct xe_gt *gt, u32 engine_id)
>+{
>+	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>+	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>+	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
>+
>+	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
>+			    "Unexpected engine class:instance %d:%d for context utilization\n",
>+			    class, instance))
>+		return NULL;
>+
>+	return hwe;
>+}

Can we update get_ctx_timestamp() function to use this new one?

>+
>+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_exec_queue *primary_q = lrc->multi_queue.primary;
>+	struct xe_lrc *primary_lrc;
>+	struct xe_hw_engine *hwe;
>+	struct xe_mmio *mmio;
>+	u32 engine_id, queue_id;
>+	u64 reg_ts = lrc->queue_timestamp;
>+
>+	/* Ensure we are PF, primary context is active */
>+	if (IS_SRIOV_VF(lrc_to_xe(lrc)) ||
>+	    !primary_q || !primary_q->lrc[0] ||

This must be an assert if '!xe_lrc_is_multi_queue()'.

>+	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	/* if primary queue is active, we have a valid engine id */
>+	primary_lrc = primary_q->lrc[0];
>+	engine_id = xe_lrc_engine_id(primary_lrc);
>+	hwe = get_hwe(primary_lrc->gt, engine_id);
>+	if (!hwe)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	mmio = &hwe->gt->mmio;
>+	/* check if the queue is currently active and then read timestamp */
>+	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
>+				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
>+	if (queue_id != lrc->multi_queue.pos)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	reg_ts = xe_mmio_read64_2x32(mmio, RING_QUEUE_TIMESTAMP(hwe->mmio_base));
>+

NIT...Should we make it similar to get_ctx_timestamp() with has_64bit_timestamp check?

>+	/* double check queue and primary queue are still active */
>+	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
>+				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
>+	if (queue_id != lrc->multi_queue.pos ||
>+	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	return reg_ts;
>+}
>+
>+static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->queue_timestamp;
>+	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>+
>+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
>+
>+	return lrc->queue_timestamp;
>+}
>+
>+static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
> {
> 	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
> 	u32 engine_id;
>@@ -2680,24 +2736,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> 	return new_ts;
> }
>
>+static u64 xe_lrc_update_ctx_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->ctx_timestamp;
>+	lrc->ctx_timestamp = xe_lrc_single_queue_timestamp(lrc);
>+
>+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>+
>+	return lrc->ctx_timestamp;
>+}
>+
>+/**
>+ * xe_lrc_timestamp() - Current lrc timestamp
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Return latest lrc timestamp. With support for active contexts/queues, the
>+ * calculation may be slightly racy, so follow a read-again logic to ensure that
>+ * the context/queue is still active before returning the right timestamp.
>+ *
>+ * Returns: New lrc timestamp value
>+ */
>+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>+{
>+	if (xe_lrc_is_multi_queue(lrc))
>+		return xe_lrc_multi_queue_timestamp(lrc);
>+	else
>+		return xe_lrc_single_queue_timestamp(lrc);
>+}
>+
> /**
>- * xe_lrc_update_timestamp() - Update ctx timestamp
>+ * xe_lrc_update_timestamp() - Update lrc timestamp
>  * @lrc: Pointer to the lrc.
>  * @old_ts: Old timestamp value
>  *
>- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>+ * Populate @old_ts with current saved lrc timestamp, read new lrc timestamp and
>  * update saved value.
>  *
>- * Returns: New ctx timestamp value
>+ * Returns: New lrc timestamp value
>  */
> u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> {
>-	*old_ts = lrc->ctx_timestamp;
>-	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>-
>-	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>-
>-	return lrc->ctx_timestamp;
>+	if (xe_lrc_is_multi_queue(lrc))
>+		return xe_lrc_update_multi_queue_timestamp(lrc, old_ts);
>+	else
>+		return xe_lrc_update_ctx_timestamp(lrc, old_ts);
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>index d525cbee1e34..988d360143dc 100644
>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>@@ -12,6 +12,7 @@
> #include <linux/tracepoint.h>
> #include <linux/types.h>
>
>+#include "xe_exec_queue_types.h"
> #include "xe_gt_types.h"
> #include "xe_lrc.h"
> #include "xe_lrc_types.h"
>@@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
> 		      __get_str(device_id))
> );
>
>+TRACE_EVENT(xe_lrc_update_queue_timestamp,
>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>+	    TP_ARGS(lrc, old),
>+	    TP_STRUCT__entry(
>+		     __field(struct xe_lrc *, lrc)
>+		     __field(u8, pos)
>+		     __field(u64, old)
>+		     __field(u64, new)
>+		     __string(name, lrc->fence_ctx.name)
>+		     __string(device_id, __dev_name_lrc(lrc))
>+	    ),
>+
>+	    TP_fast_assign(
>+		   __entry->lrc	= lrc;
>+		   __entry->pos = lrc->multi_queue.pos;
>+		   __entry->old = old;
>+		   __entry->new = lrc->queue_timestamp;
>+		   __assign_str(name);
>+		   __assign_str(device_id);
>+		   ),
>+	    TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
>+		      __entry->lrc, __entry->pos, __get_str(name),
>+		      __entry->old, __entry->new,
>+		      __get_str(device_id))
>+);

Hmm...I am not sure how to map this lrc trace message to the queue trace message
(which queue it belongs to).
We have a trace_xe_exec_queue_create_multi_queue() event, but unfortuanately that
is logged before lrc is created. So, can't add lrc there to match. Not sure if we
really need mapping. Also, not sure if position here helps us in any way for
debugging. May be we can drop this new trace event now (and use regular one) and
if required we can add this new one later?

Niranjana

>+
> #endif
>
> /* This part must be outside protection */
>-- 
>2.43.0
>
