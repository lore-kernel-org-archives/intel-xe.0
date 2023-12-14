Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43ACC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777B110E2EA;
	Thu, 14 Dec 2023 22:21:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B83E10E2EA
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702592479; x=1734128479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2kJcMqem9NTIfVLan6AeZzGYfoG3Lvo1jqX/wY089io=;
 b=Dz+Rbwsqd8XPKWTneQH+XK/OCSHJ0xAJ4s5qVem8ZCkIXTDGNfFOyYUF
 7JEf/5eC5m8i2ZaCgMQY+dZ98RsrRiKeA88/GHGlGD6MR/w/PNTLNum8/
 uwAwRWThr9mPOEghWBh5v+AiCW7rmpOxlgGeLX6hzZG/5FQeuWvhgai+w
 jMZ3wQfwXG1iEWbsB3Wk4JW2SABZvu/+Uv0yB1BfoujfbqxB3VRxMSRG8
 AvCgMMY8JYyTOP4qOdxHA4EW8Nm2CUQp6v+445/jhW78DFhGy3U8H6umU
 cvB3hiehP+Emo0P2CU387rXILWva2Ta1rESgVQuMnOjOkxK30vel0F7vS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374702206"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="374702206"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:21:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840441961"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="840441961"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:21:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:21:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:21:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:21:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:21:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1zcIjhszCiAE/Mlu74Nu/FsVN3V0OBGAQUd9RxXCToIZ/W1w/ChaOKnsw2Pwbw/VxfQ5nkqB+2R8wEXh11cQ9M/nVMoZdfZLo+CbUgR7eaSd7/KaFj2eYO/KB97WU3c5VnbNV+SVa/XI9Njb7hqRwuQjGA+TZiuodcrlD04hrNCWW6+sTWtK+oHytFhfQ98BYbQtdZ9dJCpvKcmWCczWUPF56VDdC39/9ILy/CTHv4+Y+sZdYgPwki/gfzoZpxI305OzMPPVbcxAGTJVzq1zhb7wY72/yl8YuxUUhfnvopiqBmc+5fZohUfD+SS8Vx5BwijNt8zmQFgQmKfOzNPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adlIqcpgVC93MFNcH8eNwuaTpl3/ZksUYmXV87U7FCw=;
 b=fa9OM7Cu1ln/UvYGx+u0jgxIKYOKtsWcN1z+BDXEE677z7ha5/Cz4h6Pv2dOv43mMHOc5pCAwn6o1o4vtL2xSQkMBcM7HJniAtAPSPEeOcloN7xS8T5L9kVTxffxNZ/hQ5ImR5eMzrbkwFO5mtOPCfBhoRKPkINojxeHHteSwyL2qfKt87DpXklp3RfBfKUcWEAfMAZAifHPJrP4nOZ1UNBuF4dCgiSguQnSwsutWcsdx66f2iahVMNjVT4Zs1WtPH8qMHV1PEkhVQJHedH6SCeOrlEH0KIRmtE++dufZWUgyDoHn9048QOXqyM3GuBbqKJPQA0B9DwPSn0zWy/9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:21:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:21:07 +0000
Date: Thu, 14 Dec 2023 16:21:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 7/8] drm/xe: Re-sort GT register header
Message-ID: <ucxhzqlhaiyshaau2ywdgm5d4iwmo6yrsul2qwqmc4l66ox4jo@hq2bmv375cyn>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-17-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-17-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: e68faef9-73d2-4b5e-b57d-08dbfcf2f80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UgCtUUYpCvo3gdKWl2JPnmLNNlDtMOq1AcSUR+f50VE/VaDAGmH/sf8U6f2s0ToyH1CqgPGP+NUnCZpbX+T87a4hfT5E8/6eNHRVve6iwLwykOrc7PJ8+nxMN54nXFxD2Gu3auqxeQHrW9FwwJn19Tohoh8XPUsQEtkSduMT2Nlinr8kEtVK6C7m2GqrWZ8ssrYgFjhDHgn1orJHoy3Bcx3IwcrYmgsBLb/hYSdtylVVttPUe5qh9TYsJ03jypyzxQL8ma+Qnv6wJ+dJoughtCo3nShJDM7qOsvbChS9GeiiN0DuaIMY5ZesKIfyANUR/9jsnxl7x5OM5F6cS0aGNHNZN6DvmTDFZt8UTQ5ZPWDkN1WMDvHVRHWL5X4uOgkpyyn99OehyiMrdWp3HhXL/WKivLczYrIGDRJ8qggpaExLypXMUHvNaM/WTRFsUBPXXJZYp9W2YA/H+hT0jSFELxIfgF8qa0fDSmziaYUhjeisLFyVDSE2AnXoo20plnk81Fvc6N4oGfJEXyXaaZbooFflIn2O/XECMLxr7N/4GsVrcD+SH17XJdPWDvoP7lWT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(86362001)(82960400001)(6506007)(478600001)(6666004)(26005)(83380400001)(6486002)(4326008)(6636002)(66476007)(66946007)(66556008)(6512007)(9686003)(316002)(6862004)(8936002)(8676002)(41300700001)(33716001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WnI7R6n0FM1mB5qPEcXodXlVNfzJuhxIapECySB2XqdH/3bhtkWJRMoIWw2Q?=
 =?us-ascii?Q?wiM95OZBbII596o6Ig4J3LbgauZGs/hu3bZhYInWxCBaKbkXhyvlm8+i+K83?=
 =?us-ascii?Q?GOssEQSjuPQF9FDs5qDc1MkVJGt5Ioh/ZYU8CzSNAXkvXJAoG8s1zRYu8RBv?=
 =?us-ascii?Q?DD+NMU9O2AojMOw4YCYjp3e8EegjDtoN3Ea7K3xoz4OoDn4OfyaqLw8m472N?=
 =?us-ascii?Q?3pHYN3ZCeJBgE0Sl6fJIsqYQO8sqHlDCj6JU3Hv4r8VPvnUVYddcb/N8zdGa?=
 =?us-ascii?Q?Qmg92oR0iXCN5lX4PVevWROzyTDtoMGAZVr/PRsj0lQgYuyp9kifIlLgBKrX?=
 =?us-ascii?Q?1hCGX4F6Cbw9PUw5pfr+SuUtpBDPxSxsOFJWUhSuy69VAR2d8Sz3oXiru+n5?=
 =?us-ascii?Q?dxjrRqWd/kvYrpoBPns0erH5VXxsxQpvk75stnTEja0rW0NK0CL85u4zvN32?=
 =?us-ascii?Q?mrIlC9EdQALtUDihNALeXop+jl0Kv9L7NYFSI4sRlO9yn96QsnJ731Rw1hZm?=
 =?us-ascii?Q?NBJV5c+oUBEEvhdYGc1ltUh+NYStZnEKVGT9ivdp0TIKJhMbvIiSiC4K6/st?=
 =?us-ascii?Q?T0Jk69mU5xUgZWJs4aG3yG2UVh3jvGBmWiSjcBbmn0sYBZMAOqz4TIJ8cflU?=
 =?us-ascii?Q?wHISNnUv4UiHUA9B2rxKyfDVBOIZ/kflqwjFHrcWtXPeiS8gn6ldSIMBmN4z?=
 =?us-ascii?Q?Uma5/1uh53IBNU+xWhOTCmafTYg9Z7QjQ623vQtZ2P04lNx6gxQ8W483bvsT?=
 =?us-ascii?Q?WLlGSVI4O0vnQuiE63+iTJaYSF537YWBnzKUG0DgB7CvHf3La8Ob9/oiGs7J?=
 =?us-ascii?Q?PT440wWfJ5qcqrAQhhuLi/lbnY5kn6AFyQH3ad8+Nj/oLHuUtXGufDEoz54e?=
 =?us-ascii?Q?39lBAVyfFSKJzF+zucAxIxqqNy+NQthVjln+tOitdP1xHVxjHAa1idiCNOy0?=
 =?us-ascii?Q?10VqEx97geteKDVIVUjGICB1T3IK1Q+EHtc4ZL8R8Z50OeZPj9D6rmGyNOgT?=
 =?us-ascii?Q?gUhGC1D4iIWCrBCcCVVKUfAUHOupvxTPaoiw976n/WHNW9HfaUiU2Zn5Lqwt?=
 =?us-ascii?Q?IrRb0klHKCPx523w/S9/1TZb+QSQtZPOBpuNO8nXone4fLDE6R8sL+etkKU7?=
 =?us-ascii?Q?DpNLBQBmr5D1nUUSOVYkOxtmRsC10OiW2PeIYwn/68icF/7XC3KjVnlOdOIb?=
 =?us-ascii?Q?1HCvSPKgAsnzyeLNeikCwe7HQhyxj5mu1AFkbAR6wnb62hVLJ4Ufs9BKdlMC?=
 =?us-ascii?Q?R9qt8HQBtuY/ooIAsqHuoQtGKKnCgvQey6y0J8ff4xVQDL0E5EZkyCs8Vyfq?=
 =?us-ascii?Q?FRgGjRD5Vc2FPDkyifxaOW1AvMG88aB7zY1PWOHr4pOnX09e0qFryeBhzt6t?=
 =?us-ascii?Q?AKjVDxt5/1VbPddObOvOQpW2ZL9HWBhmZWY9Pbz/ATBjzMpeerODySiY9tNN?=
 =?us-ascii?Q?RTbSh0VjHUNNpzQ6+5hemhHxLh6DRQ0RP9ZOfSQaisbyODjHR6f+TvmaQbIh?=
 =?us-ascii?Q?rl08ziduBkypwmTvaFUm7s69yViGL8zWrGv+gww6MDEvAfM81nbFfs1To9Aj?=
 =?us-ascii?Q?HFdBH19hzcts3BOXxTP9CtAZItyM8wG9/9/TobmMToOwfV36Nz2qYzPIdgHq?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e68faef9-73d2-4b5e-b57d-08dbfcf2f80e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:21:07.8750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVLCgnEBZO3aVeaQTwZXarrIAgaMFYAnNyybNMCMbntBblX346SYWfUYYUkoQllF5l/zalArrzmuXDwOdAVojTHtZu08LCzGGJZlLTooHEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 10:47:07AM -0800, Matt Roper wrote:
>Keeping the register definitions sorted will make it easy to find
>existing definitions and prevent accidental introduction of duplicate
>definitions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 58 ++++++++++++++--------------
> 1 file changed, 29 insertions(+), 29 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 2c48de2076a6..d152f0da9d97 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -42,11 +42,6 @@
> #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
> #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>
>-/* L3 Cache Control */
>-#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>-#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>-#define LNCFCMOCS_REG_COUNT			32
>-
> #define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
> #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
> #define SF_MCR_SELECTOR				XE_REG(0xfd8)
>@@ -102,6 +97,12 @@
> #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>
>+#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>+
>+#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>+#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>+#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
>+
> #define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
> #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
>
>@@ -109,12 +110,6 @@
> #define   FLSH_IGNORES_PSD			REG_BIT(10)
> #define   FD_END_COLLECT			REG_BIT(5)
>
>-#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>-#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>-#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
>-
>-#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>-
> #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>
>@@ -162,13 +157,14 @@

missing a hunk to fix MIRROR_FUSE3 vs XEHP_FUSE4

> #define   CCS_EN_MASK				REG_GENMASK(19, 16)
> #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>
>-#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
>-#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
>-#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>-
> #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
> #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
>+
>+#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
>+#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
>+#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>+
> #define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
> #define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
> #define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
>@@ -284,6 +280,11 @@
> #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
> #define   XEHPC_OVRLSCCC			REG_BIT(0)
>
>+/* L3 Cache Control */
>+#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>+#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>+#define LNCFCMOCS_REG_COUNT			32
>+
> #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
> #define   XEHP_LNESPARE				REG_BIT(19)
>
>@@ -360,13 +361,13 @@
> #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
> #define   DISABLE_DOP_GATING			REG_BIT(0)
>
>+#define RT_CTRL					XE_REG_MCR(0xe530)
>+#define   DIS_NULL_QUERY			REG_BIT(10)
>+
> #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
> #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
> #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
>
>-#define RT_CTRL					XE_REG_MCR(0xe530)
>-#define   DIS_NULL_QUERY			REG_BIT(10)
>-
> #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
> #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
>@@ -423,11 +424,14 @@
>
> #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
>
>+#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>+#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
> #define   ENGINE1_MASK				REG_GENMASK(31, 16)
> #define   ENGINE0_MASK				REG_GENMASK(15, 0)
>-
> #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
>+#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
>+#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
>
> #define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
> #define   INTR_DATA_VALID			REG_BIT(31)
>@@ -437,10 +441,6 @@
> #define   OTHER_GUC_INSTANCE			0
> #define   OTHER_GSC_INSTANCE			6
>
>-#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>-#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
>-#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
>-#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
> #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
> #define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
> #define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
>@@ -462,12 +462,6 @@
> #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>
>-#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>-#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>-#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
>-#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>-#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>-
> #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> #define   PROCHOT_MASK				REG_BIT(0)
>@@ -480,4 +474,10 @@
> #define   POWER_LIMIT_2_MASK			REG_BIT(11)
> #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>
>+#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>+#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>+#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
>+#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>+#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)

these and the ones above (everything after GT0_PERF_LIMIT_REASONS) are
misplaced too. They should come before GT_INTR_DW. Other than that:


	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>+
> #endif
>-- 
>2.43.0
>
