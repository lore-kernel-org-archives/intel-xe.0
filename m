Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2AAC3DA59
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jul 2024 02:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654F10E00A;
	Sun, 21 Jul 2024 02:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQ466ras";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5F510E00A
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jul 2024 02:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721530167; x=1753066167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X4TuAYgC/L9qez5svi/8KA3MZtY+FGKus/N8+fEw+fE=;
 b=XQ466rase55c/LuyQrQO8g5lfN4Bxouxaq9QWhDtJ4WBUZkVec+Iwvst
 eNgGYgLdZJx0plp4qqUZ45nHGRwsn14VFVHc0JuHwDayJkB9AAZNBr1d8
 GVkYorqqaE45tXQW2G/jPrZ2Y9d6GMV/o/5qCinTrHD5h6DePLLFRrtIB
 jGOzJqtjbYDk62zZqkyIvlR+Vb4gv6W0aZ/mRetv4pIbHGaLYUuXWnaH1
 ZyGXzDvY73HCcPXSvAMc3026I4eeHlcIILPhohUP6upZUnCIhwGQu60NJ
 Eyrm0FdpuE6dXYggIyct4rG62UNj4GIYzU7FPHe86CiLVqD4YEhnZrjzT A==;
X-CSE-ConnectionGUID: j6jAPRxEQvyttopBsWrTVA==
X-CSE-MsgGUID: qezN+FKkSU2IMChuquAhTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18964120"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; d="scan'208";a="18964120"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 19:49:27 -0700
X-CSE-ConnectionGUID: jajBuYwFSYm2LZ+Mdkd1nA==
X-CSE-MsgGUID: LldhY+sOTjGKiX/L1ei3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; d="scan'208";a="51474626"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 19:49:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 19:49:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 19:49:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 19:49:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 19:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzhD/sXup/py3pd7mmt2O6VI8/OcsXfL+S+psNWOzz3+Bev8yFSC2aNvqrSPGGAntPqvT/sBTjK4fGto4zqBRruhwogtHX0p3FQues9Lh33XGDI+H79faufDzPm/fMTTgcz1wWIWNZKM5LHvA8DlBUGvUPD/ij5cXOzuoks50qXqn4A4BHY/0Z7KdHILQNLrQf2hFqSDSlsVLej5P3abywrROuPNpQIUmJ85PB/Hud5O0KOIsJq4zP0nfNuqmygkudKUDEBow17IvDb+I5gRswl5KPi5auRriEHGynIyt7jerJgHauqS2RE/JJZUr5Cqm+Xqq3VEfp5intYHF5RPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgRKTZ0LU0qG0Oug6zFKo2AOkztpZAauiAQJtBvNNXs=;
 b=M5odqXvgJq11us/5UYoaBq2eskoW0gvEuE/YQhN0Povdf0467zFqII4MLU7FywiiQqjD5AKqBhusBkwSVf6BtahhpBJ0y0obWJwrqdd0rClcimqVYVGnzt/En7LkhlVCoq8BRMobiiQBBD/TX+htABqfxnZEwXmqSBsv051JYammAJA95470LaRJs0YvGH7jSlT0jwBGf9BFO5zNxGAZ1WHmveZMzzQmj4k9/DXpeydUHvhu18/LVZeTRuFkVQCJBEmvbG/OzG2UnGpv+/T/J/CzhN8mT2Begv80t9Z6t/7DuqcnD8KnaWIkT91tV/yJVJghMW/3+9U8H+peg6QxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Sun, 21 Jul
 2024 02:49:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Sun, 21 Jul 2024
 02:49:23 +0000
Date: Sat, 20 Jul 2024 21:49:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Message-ID: <x7gzb7lqcssrh72r2qqhgjrn2di6jsuqiyggcywt65ejvagahw@t3yivkvvbb2v>
References: <20240719230525.2444543-1-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240719230525.2444543-1-julia.filipchuk@intel.com>
X-ClientProxiedBy: MW4PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:303:b8::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: c590cdf4-3b6b-475f-03d3-08dca92fba23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Lrq9KsVQEbb4KGIeK1bZq5vb6LiN71q6WySYJChRSwg+fgbhwThLKWC7M9W?=
 =?us-ascii?Q?VZEl6vwDMLWB3CapORoLKCfJFFFNweIN7AIR782XsRPS/tkjAEhd1h+gaJfl?=
 =?us-ascii?Q?EwH+TTLTBa0PW4WlYrD8Wvc1JZbF/ZWl/N799feeXwPDAV6Q2U+H72xpQOc6?=
 =?us-ascii?Q?Oi/5JVejfNsxDswnZuaMq62Kk3aFOeOexx5FhYrDpv3Uw2oggZhg8+MV3dwr?=
 =?us-ascii?Q?ulZ11Ysd3ah5omer0KyCwUUVsH0q3mfYA2mbVuWQeoKbFxuM+nz4VHWtVfKU?=
 =?us-ascii?Q?0gMtwgT156JJO7uq8TMN8RfxM52JhD/PUFSX0TW51bD8IR5MKUjmVGO8ffr/?=
 =?us-ascii?Q?aLS96MlogfHO+RXe66VLu+U8IBkZtf9oB15RnEIhwmsYfSQedCwodJgrIwv+?=
 =?us-ascii?Q?SoIuBcixguW+o22oAZa6Ie+T5Hv1TV+inXr0uYgfTX6W4bXvb5eon8ubqs7t?=
 =?us-ascii?Q?5656OMJTcgNKeYDIzihkFpn8H12PaWuNMqcQGQ5zQyYmk++oyRS/j6UmgMne?=
 =?us-ascii?Q?o2F1pOLf6nVjwGHWIOEjdS5Xg17rPUy5kAikusny5c5dFKRs3bXUTWppR8Ul?=
 =?us-ascii?Q?bSKqCZVeEdoTPc/xKCUXI8294FTdgJD8qffsp9zpPP+Ih/lDPhwDat5C2Pj+?=
 =?us-ascii?Q?zg5gGDsKvo4Ls3my8uHMI0vgvnX7Prl3dBvXr2vWv0rVxpJzyP05LIjBqc/o?=
 =?us-ascii?Q?Ir/ZhXnsEk5Oi9pJTW/D2FdGIQtnCx0eoA998rtrCHSRNbs0erjFDpsks8tY?=
 =?us-ascii?Q?Kmi7JUr1RKcMD8zTRMQvPknHHEz1V3P08+dilEYsYL3pdwLAPOC8nk8grHa9?=
 =?us-ascii?Q?g/fyzMQ4hKhJptiVjCFPQoXe0VobQNVz7fS+VRw7SNLNrPOD1h4SxH9x4+uN?=
 =?us-ascii?Q?ckskwVNpCd4754MTQXCeaAfUKx1RrKvlVfv0y6olkMp6izI7Nm+tRb7OoFJx?=
 =?us-ascii?Q?ny4vZlBD4LSOgEaKL2nun5w7PpdzGybMbr4xqA2pvcIzo2CP42Ci/3+vYEND?=
 =?us-ascii?Q?aGq8M4xvvfFcwd8Y7EjLlzG36dhL5xbV0rl7zY+h6lYGZqlW3GffGMweZkKG?=
 =?us-ascii?Q?gk0mRUTq/nQiymoMO+U/3B24xSoFlTat2cro/BSOTam7UXSOW2+GrpCqntYC?=
 =?us-ascii?Q?cDztF7OPx8zXssrUr00FVPD3WAv/X3dBbCH/R0hvPN2Z5S11rkg/nFNJlrQk?=
 =?us-ascii?Q?hXAwHKj/oqlycV8RmYXl11FwScMRDy8xND0OOc7eIfsmDUdu5M2t7MskycDG?=
 =?us-ascii?Q?Df2E0bjlpNmRM4DSFJga6epXnKP+k1LNeOFpi/qael425I/rYw572UbLUCUP?=
 =?us-ascii?Q?40vLS+t4rf7Z/QHMCU3Y1UUmrV2ga6gS/NyUFSn/cZxsvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qhrICf6QC5Q1FalsGk0BNdJdDjYXtoGMFbUp+ds6NBfZ3aY0vRpgm/h49ueK?=
 =?us-ascii?Q?WT3TvdTMMFsMRVgY5Qd1ORb7CnsnE1LBBiyLcZxJvtZ5gb02tO9zZacsi1ob?=
 =?us-ascii?Q?FHzzPVp4M6AiftMeZkidTLibGS8y1Wwp2PBKw6ubbqgiYOA79+tT+wgmordg?=
 =?us-ascii?Q?Cu+Me56ng0A8Kbpqq2Y+uPU20CN26Yj//6wGiBjfQs8TqHnnIaPwjFQ6tQtv?=
 =?us-ascii?Q?7LuChj4PP/oMtyClZAoTzCyB4TIYc+e071YIpySOJxNe3R3iyuTU7Mb/Nt6t?=
 =?us-ascii?Q?hvKRVKEPOrtGLmvaqaVklDDVRP6tkEhkXbsumzXN5VOsKuh+CvjgA/mD3OiA?=
 =?us-ascii?Q?Jx4L/GUxs46UZCzl9wQDtBLbBN0BbAtWZsZag29jRCQxQIRHNzWoS90AS61+?=
 =?us-ascii?Q?S0054DJ59EM0mSY4DS2HzcfeFfpQ66R+HBIzN4QFJMStItQGtDXX8VEpSv1x?=
 =?us-ascii?Q?MZxnH9BIZ9Hz2f/lvNajzvWMej49yAHNViGSal2pghxADzlVDNwqy147FqN2?=
 =?us-ascii?Q?TaxT8cYECZjkGwA3tNfyKJLZjA5pu5GBNkxW5Ef8ZvuqAMg7IEEtiMd+pAoE?=
 =?us-ascii?Q?BptfopXxf1dEc7QZFcHFjbjhG2XViTtJ0RCp9/guy8m1US3o5zrfort9dwTa?=
 =?us-ascii?Q?3HFSsGvuiqvDyolnG5quEpy6b9jgu3MNjkirhl3Zz2/e3A6EQIonl5gANkkI?=
 =?us-ascii?Q?KteYoGfqa26QabByJn0+wRkThLyXiIuyS1oP728aH4j+mzmKaBPDaiVEPsKQ?=
 =?us-ascii?Q?YijBtPpo+v66vZXEmpgSKuPw3GWNhsZYydF13uPoOdTZcdsffdi3m4V8Mlqw?=
 =?us-ascii?Q?wAroQMDJD/cCx1BVwUy99bhzZ81QutJ8XmNiAQVKnUpRkPIS+0bGDuE52tja?=
 =?us-ascii?Q?OjQz3M4w+Gs1Dp1Iyat+2i+Sb/jRA2dcgWV5jVoNY3KI6vKbnPal0JkF3VD9?=
 =?us-ascii?Q?O/uyfvUHDWITWGpYCLJDcOdcod4AU/O5wLTDIXVJOAMBewrwMXwdHo/m9KSn?=
 =?us-ascii?Q?qIPqUTfsem4ex8sy7pQgevfCRwOFg7PBhKlhQlqw0QiLh+xxqX2Qu5xZB9yz?=
 =?us-ascii?Q?KTFV3ObEUPyL8Zlf4QMugBbZaTgrwEG/gFYFz+/tE5g4YlzPHYJn10QzWPCT?=
 =?us-ascii?Q?8ioylQL72fQusI8ewnBhHBZ7UOzaR6s0cITiBJsriDg5zOa9shcLXJ0ZV9Mk?=
 =?us-ascii?Q?aPJM97BlJAqSXIYPy5yenxigEl7faL0kM6mQbw8uCjkUCe34TDP6zuqKvimn?=
 =?us-ascii?Q?k3DpG6kFwAL85dNA+5i/F4Gj/ZhQ20L8w7l3ba80k2CLt1RJSSgSTjFoM6YY?=
 =?us-ascii?Q?pGXbLX8TGpLQl6mX0OZJlQBsscaTn2czh8qHTMRvjDbdTxihama8oVrHEJTw?=
 =?us-ascii?Q?mApP3yfslrvPoedNG7qFpw/ZinzYu9SpzLHEGJsPV7kOTFuvQK65s4ZzwdyP?=
 =?us-ascii?Q?k/k32JzvGG46z7qbK3mxuvZkZvBKw5MYs3X+/08ckNFfMVGy8YfPZ0zCLy31?=
 =?us-ascii?Q?HAYnj6RSnIBPECLJhRp6kUrvoHN1xjV8JhDowok573NzbVNZVx41ZAM0Kism?=
 =?us-ascii?Q?5LSPzCMdOp8nEJafLBRln8yYjeV3ByzZvXrwrsxxbIRX1fAZSWOAluXODxr4?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c590cdf4-3b6b-475f-03d3-08dca92fba23
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2024 02:49:23.2712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMp87ACEWIg2ipSvjP92DjhrVT75nH2uamQPVP4tTaq5/gHsdIGi+rQK7A4OLeX34QJclQgCi0EidRaLSpOSOHBxlYOEhxrrXQK1YRmGgYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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

On Fri, Jul 19, 2024 at 04:05:25PM GMT, Julia Filipchuk wrote:
>Enable workarounds for HW bug where render engine reset fails.
>
>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>---
>This patch is for testing KLV workarrounds.
>
> drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
> drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
> drivers/gpu/drm/xe/xe_uc_fw.c         | 4 ++--
> drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
> 4 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>index 8f9f60b28306..6b30743a2f6c 100644
>--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>@@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
> 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
> 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
> 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
>+	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 1c60b685dbc6..3190bb4ce04e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -367,6 +367,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> 					  0xC40,
> 					  &offset, &remain);
>
>+	if (XE_WA(gt, 14022293748) && XE_WA(gt, 22019794406))

that I think would be a first in the driver... so this is only enabled
when *both* workarounds have to be applied? Or did you mean to have an ||
here?

Lucas De Marchi
