Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86BFC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 12:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A883F10F1D3;
	Tue,  7 May 2024 12:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nja3Lzi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9A10F4D3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715085063; x=1746621063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I387DcsJ6ZObmkkIgSVGtp7TWxNwUaev8MlBb3gpRuc=;
 b=nja3Lzi72qr/NkO+M4Cpevi8cy7gXhE8g8uh07G1xMcyP+yGPzsWCbbv
 kWGAY4fiSKXFEOoeaaZYU+29bQCnCzwaYtv7XE9v6NPAhuD2RqV7TX4u9
 cERc9JXpEgqVJETmkil4Lz0xFznCeEyMOoYMwChnhNl4s4rqRABPx25IW
 Y+wXyuUpUef+osM/OwX+pRR8sZkcNSyGgJxXguhny739DlSZuD9nl+aog
 Oe/L1WSyku+3wR+zDsk03IayETtAEdVBXjLM5Yyb7v1npnHIYl0aoRIzt
 Ub5TpNXZBQ76od4aL3nVfZAeXH7326UgRtiyVrpa25CMmsHqKK3GomQdc A==;
X-CSE-ConnectionGUID: wP2CvSIuQBW3mluS9HIFCQ==
X-CSE-MsgGUID: BagIB+nkSWyNPuT4Neh9LA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11091454"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="11091454"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:31:02 -0700
X-CSE-ConnectionGUID: 5+jruo/lSHWQldUvdIWYgg==
X-CSE-MsgGUID: sbzvqYq8QRS4JmF773O8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="65949716"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 05:31:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:31:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:31:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 05:31:01 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 05:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuqzSFiq5Oc++3gb6OUODP7+6i7UKYV+2f72NMirBWd+vBp47wBq6ytOlkP4J8/gHN9r43besG0rVARRz9Fh64zap6f4EMU+N1U2fQrrp17cenKPOAnXHo/mNcJzGkS5upfF7HOHySe4f2EgpPKXjKu+x9DbZ6TL0VY7/2GEKNbx7zMrTGGghe2qI9ox5QqHVPw3RfzR+YMbFBrBjak2BVGjSc4T9ugnLhFtbe6yp4qhFveMNbf70Mt7wUKITd+HFyXLi5cvaadzem60w0xysneFsG97hEqkFw7GhMNTO0R4gII2bX6Q5M7xAo6mxniS+LILo7Pb1GcITVNpPhA3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2d49JxcpXPaV3TgxjKmyVfNwjpdV+XEC2snVpJXgVc=;
 b=MZL4Qw77xTGhX1pEEj205esQLi8a4Kjvq0ny5X6CxNkkeuntDuJ91JXgStKdFdcsPXJ/Vd6LSXEWGX0f11bPztKLuUN7IbtrnALyuBi30XL6xKffqyEl7unaYmUmzMTJmhhOlGI6pEJujBmQOAOUpXmYL2JCwfhKsaIC2KpotY0m8Cl7vUpU6RzeKRX1SmBFj7jOu839KNTHkX4+WUoJ6dyXcx5swjbTCX/yeOT4bTOi6fTIK9+TITkn1DrV3X/LCwicAJTZLz7oegyKdRmbIHM6zCF02KcGqOXgqIqDKJaoUKAe12um9JloB5Kch82IsgvPtBboCUEvIc+wbETAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 12:30:59 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 12:30:59 +0000
Date: Tue, 7 May 2024 08:30:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Don't rely on xe_force_wake.h to be included
 elsewhere
Message-ID: <ZjofAG_98Vjv1mqZ@intel.com>
References: <20240507110959.2747-1-michal.wajdeczko@intel.com>
 <20240507110959.2747-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240507110959.2747-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::27) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0116b7-ed05-40d0-9451-08dc6e918cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wqx6a1td9dsQTZT1RlS69+j5Z5AYnBMUAZODqRvX6BypjFZL/H03HiknRefI?=
 =?us-ascii?Q?VqvH/aB+YmM9qvloIxA4AdgRYSj/CILhL76E9aaW2W4na33hC2230q17ejxB?=
 =?us-ascii?Q?6iPpEOFpI+A3xFtCc/8Bw/F2SKXEtHSxA7z/3v1ejiS+EmOOxf6iOuc8fHH0?=
 =?us-ascii?Q?LiBxF2I7qyNBAYmv5fo0X8ZEWCJ0z0g+AM2XnmCUWtXWPYlREIDc6dj8lJU/?=
 =?us-ascii?Q?qZ+7/5JJIJJwwHnUgFHTK3SHhP4x/TvdnjehZ6rp9aSoZ9ipN75IVNc5TW+6?=
 =?us-ascii?Q?kmmNAG8v+fnyKRGC70AZWHTCLBdKZDKEA6PBkuEtO53/KVFhk0mSNB9JlaAh?=
 =?us-ascii?Q?fbfy7fTg1oE6wMUZK/bR7EqD6wQiux+hOi2mNWEsbKDfrJ620t9lc0PRnRyL?=
 =?us-ascii?Q?09+Zo2f3t0FPDxlgexeeuuCwiKq2mLVQuQU1aLGmwTi91KLdwqRIcqzz0EnL?=
 =?us-ascii?Q?49NQIk+gxnA/khSc6IMruza16/vFh1RSbIqvwD8Jf6Lp5M2phKC+hc4DhD+q?=
 =?us-ascii?Q?oTZzg8TgHc2swVi1LC4XjjFWQILI1YYapqSJmqVHWTtBhjDwMxKGQ1H1cFbJ?=
 =?us-ascii?Q?dTZnmZzANM4ZapMXMC1umWJ19QAXHYSngOMiBs3QAoFkTY7GZTjLJWbzDQCi?=
 =?us-ascii?Q?RL9oLostcvjNM/isQuvSMZbog//gWuLxKPwS4QsfgA/WmDCezPZqS3ocRng1?=
 =?us-ascii?Q?LhIYQU4ESoJCYtRY+XgzU7195wE9AQW5PNVph17Ie6dF8fm4IU4HJBaCjYR7?=
 =?us-ascii?Q?zZXagLYXexgQmca39vAkknRYdkwcj3rGdMBV3d99+0nfhNNq4cxPNQ6quT+6?=
 =?us-ascii?Q?hOZ0ppQJJhNDCnyNYB1+FaeOxJ5NiL5CUi5sr4OOyIY3BgFtH6Wmaf6gQcGI?=
 =?us-ascii?Q?N08FU4dHoo3kKo0nkJfJMw49Db+VQQhPYHxR0X+HIIXEzvZQEpfG7AtQXRxh?=
 =?us-ascii?Q?5MPgpI9WbgPNBvKy1h8Yw2jgPX4rsLV0BAjH8TbhvUaOzV28Vqdil9eBCFrU?=
 =?us-ascii?Q?CjNQM0m38nt4ZSoL9Txpx2stDsTTcSCZ4V+5jEjeIx+Y3V9F7a36FR2ZJBl6?=
 =?us-ascii?Q?QZa4sDP6z1Q/7tkmFWIHCH0nSlF37LilPI6nzBgB2fD6QdilYu3/zKQQjOKT?=
 =?us-ascii?Q?X/bxmYCdDRLPn3x/GisMHHAUBAjzmMLt9hB6nKY57fJkjzGb7sAIgAgqzQ7U?=
 =?us-ascii?Q?GTbWTznOEY+5dFU6QHMErnSdg7Vwj4TgsAIarC2Lk7sY9Fgrk6WIenxzYQ6N?=
 =?us-ascii?Q?N7JLhEzcFjTzFkZrRP1bDw3nWTDuIsNpJEmm4xKgbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUJVjeamh11V8MbFxqfSXAfcX0tqb++z/uSqKfvL//M8EYKenRa2DLDMGrJ+?=
 =?us-ascii?Q?69zL4U6rYR/H2rlyPO2MACVeHHAcJjFzCGRsYHzm7uW8MWoEcDlHk6PClqnj?=
 =?us-ascii?Q?DBSxOm9UIXeaxWfQjja67mgXQ3mYFLJrcbstEJO9b7jndSDnmjKJERJzI0vT?=
 =?us-ascii?Q?3lVxWc1zoU3CSBvVTOIgLI46IAntyxvThxTECuPhCKqzIqILnZdnE9Nvy4XK?=
 =?us-ascii?Q?baWVuE18NK51VvTYfAvvVdKJWo93m300m8ROowDMwsoyhXp7W0D46TKMBbm6?=
 =?us-ascii?Q?SHQDA0LqWpzP2oAO5SIPu/gtMUuq37CRH7ijuDRoZXbyGDOPGWMeGrkZWFFA?=
 =?us-ascii?Q?cpTto34jQ+1ahCKTWslpPQEtYwJQt1OdSgzm7NbX1PTn96FKy53TvN0OaMfb?=
 =?us-ascii?Q?CAE32cpEjyWtiCydYLKOnHTBHVUzi/sCrhm91OIXxP+L2ObYReQiTbSdofFR?=
 =?us-ascii?Q?GOUZhGcXXPGdu6Pn1iSufbha7WkmVKkGP4gDDK8nNuqtwTQmLaae2F2ifH5c?=
 =?us-ascii?Q?Fhb9kLUcilAp5mlc2kFuBxFvSj0GXNToE8LLMy6D8yOPh3OwgcfJT4eZJUrK?=
 =?us-ascii?Q?bRdaDAsPmu0XI6w2J/H4ZBntkDF8AuwPoebPzrSYv1IiQDXaaJbyPdGL6ZGs?=
 =?us-ascii?Q?It3SbVPpTJBwjIeDZCV15nSuVz0jwF8eiax69T6pyZmgT8G0R3hU6a3DNWkA?=
 =?us-ascii?Q?ezv7ynvIrPGszv7SXfgHNO0l2p0e0CPn3Gwrj9n8ZnynC00K2krBR5sE4zba?=
 =?us-ascii?Q?EkxrSmZvRCoYgIjvGXDq49441sI8MRm3xvP6sqbFTOSOsq+cQrpzYbLHteg8?=
 =?us-ascii?Q?DkU5pAf73DrVAQxeTMu4YOkRkWPVB8bkCvMc8qVqXTMseMDRmoHHiU7ux+rV?=
 =?us-ascii?Q?7CnxGiRREbSUZ5osUlR+ohKbw+N++ujemfcoL3IV/CgdRNMWdeJm0e9wdv4d?=
 =?us-ascii?Q?tfkB0oiUQS7Ijk6AIjABy1ITnOEpi4fZE5Imk8jDurSeqUUnMuKcHmUBr5V3?=
 =?us-ascii?Q?VN5cPTp9Fsl6O3b+3sJBOZFBaBDKifzPcEhDwlufu40O1X3Wu8bTH/m8mFE+?=
 =?us-ascii?Q?Id6+ScbCTj3oCD4csmovlB/0wu4sLzE9bRipj/7N7GZTVnWrPH8AA9tOeFdC?=
 =?us-ascii?Q?ge4GDv8ovFon/H61egm9CX54NOUe/tuMYRmfkpY/XtPVrqAczrKutElG5x4Y?=
 =?us-ascii?Q?euoxZW8U4C+Cub1Jinvemx+wrhqRKBcynpOmZFrtJB83C69PrGPpeIZ7WHzW?=
 =?us-ascii?Q?tG1vxKwkL2DB834+iuPygidblsEXeuQpfvgBSnsUtB1EgRBGR081eMw6ywgD?=
 =?us-ascii?Q?ZXVT27BvQ8uNyOkDq1tvrmAwNhI8YmesjyKHNaYKlInhpZCDrmPRCh780bea?=
 =?us-ascii?Q?upZ94oS75YtBj4cvgfcuPeud/rtZAgI4Oo8jllYBxVC5J1i/IVT8jP9Sf7cH?=
 =?us-ascii?Q?tq4p4UiK492l4NactNPCEOj8fKieOZX5pYigvowJz8XIiRd5be9X+Z7kd0cu?=
 =?us-ascii?Q?Zt207EFa8BwJcPqExEdsK8NosEQi68F8qVvri08LZYo4AbPMzsDCLLJ2rnVA?=
 =?us-ascii?Q?LTSRX9QbmP3Cvh5kzi/AW71bJ/QM4AnlDySUz3CP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0116b7-ed05-40d0-9451-08dc6e918cad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 12:30:59.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsMB2eY9z/CMRB+W1j6ZR9NBlLgjyxC81oULt0dU8tUQW2MDHqQshvEOxrsTeLhscdPSe6n7RgK+gsIiVsC3aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

On Tue, May 07, 2024 at 01:09:58PM +0200, Michal Wajdeczko wrote:
> While xe_force_wake.h is now included from the xe_device.h, we
> want to drop that include as we don't need it there. Explicitly
> include xe_force_wake.h where needed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    | 1 +
>  drivers/gpu/drm/xe/xe_debugfs.c             | 1 +
>  drivers/gpu/drm/xe/xe_gsc.c                 | 1 +
>  drivers/gpu/drm/xe/xe_gsc_proxy.c           | 1 +
>  drivers/gpu/drm/xe/xe_gt_idle.c             | 1 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 1 +
>  drivers/gpu/drm/xe/xe_mmio.c                | 1 +
>  drivers/gpu/drm/xe/xe_mocs.c                | 1 +
>  drivers/gpu/drm/xe/xe_pat.c                 | 1 +
>  drivers/gpu/drm/xe/xe_query.c               | 1 +
>  11 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index d46f87a039f2..eb67ecf08db2 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -13,6 +13,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_force_wake.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gsc_submit.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 2c060a0d6251..1011e5d281fa 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -12,6 +12,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 60202b903687..8cc6420a9e7f 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -14,6 +14,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> +#include "xe_force_wake.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gsc_submit.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 1b908d238bd1..6d6d1068cf23 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -15,6 +15,7 @@
>  #include "abi/gsc_proxy_commands_abi.h"
>  #include "regs/xe_gsc_regs.h"
>  #include "xe_bo.h"
> +#include "xe_force_wake.h"
>  #include "xe_gsc.h"
>  #include "xe_gsc_submit.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 8fc0f3f6ecc5..a4f6f0a96d05 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "xe_force_wake.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index c3d015a7ac33..105797776a6c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -7,6 +7,7 @@
>  
>  #include "abi/guc_actions_abi.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 8fc757900ed1..d10aab29651e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -15,6 +15,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
>  #include "xe_gt_sysfs.h"
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 2b18e8149ec3..05edab0e085d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,6 +15,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 4780708e5fae..f04754ad911b 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -9,6 +9,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index d5b516f115ad..4ee32ee1cc88 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -10,6 +10,7 @@
>  #include "regs/xe_reg_defs.h"
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index df407d73e5f5..29f847debb5c 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -16,6 +16,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> +#include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_guc_hwconfig.h"
> -- 
> 2.43.0
> 
