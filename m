Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6DDC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 00:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E98F10E14E;
	Wed, 13 Dec 2023 00:53:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8532110E14E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 00:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702428779; x=1733964779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UBRakK35D9KtRp6dg4N2mlcVtVOh7TTSMQT4ALvj2Vs=;
 b=C+yyNA/1CHEuRJ+LzzW2iWhYY1g1E8WfFiB9d6NjSKFBuFLlFltuufzS
 mBat/kaXVP+/OM8BFZ367x2D0HRZtmUBRcN2wE/iqpOTR5vVOvSuIr5a5
 5Sc4YqW8Fx6t+d8rRQ0ewEvSOKJl/CHxMuRrKOy7h5JZ5zuQGMMdFoP6I
 F7FaXIykad3uwfblpyRGdP2OmtzoWEPgDeoqlSNqmGvIkx72huBlr62bB
 E85OP74qC+MPnF+/xVZ65fl+KeTmpdaIZMRSfoo0R2Gxh/6Ag7jLJ6zDD
 z9Tn82tmWIvI9YDlsm2UDGFS0F9yUDfXclagAjSQCe5tPkdyRH4xVaWvb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="385311192"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="385311192"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 16:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917474408"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917474408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 16:52:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 16:52:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 16:52:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 16:52:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXujzDBhD0UZILZeKmSX9jsTn57R7NDBd4hLlIl6o+PZQu37nWDPj/I14RGEZBPlCGQVEiKTSyXRJiNQULJeB6t/+TwNUqPQYn5/f1wlgsAr3P/vuuNqXAwcFnHG08W37/gdbxSyb7YIYy/2kwmSfnCUTH+/QES4j3nD0ahbuf7eaJBIYXKbKToAuODj4RQ5hsYQqT8f2lnFaz1MuiJEOXlTVS6GyKZHevZ8BjRIsM8Bx7vFUFDUZtRdqL5FFV+AofZexjwYc33xpAz/OqZ2NUd08rVM9dq05WgLXouq/umdorU+Uq136yd8PhHhfa1wUyElZL3WLQxs1jWB+TeC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/4aDNRtKcaihf3jK2vA+aoD9ALsF0X9u8yFjvcvE+E=;
 b=IEe1YrXUyESGentvqXw6CT+oZ8chj61Oc0o/5rRGBYIlA00RBy7BaI8aCNRwZAhEw/gKVCnKJxZYPtFaoWtfz6DbzqV9JdecE2CPniIkITlDTLAQ26PTQqCgzdVkXzwATHjUCAF1Qn1Id+t4X/uiTPPUGJTpLRo0V6kZ5YDg/XymdEKQaAd3Y1mE5E8Hqj3FJe/qJfryJhYLz6pku1RzZshogFbDMDZqBXh4SV27IeHKSArKQhbOvnrZN9zf8s9KFMdtNzw3mzyr9pY82WLljlyubm7MXIbqMNZDmn35dG3IOawmCTFRkSftIQMqGEQv3EBOVahKwbIIIOZjgtvUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 00:52:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 00:52:52 +0000
Date: Tue, 12 Dec 2023 16:52:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 09/10] drm/xe/vf: Setup memory based interrupts in GuC
Message-ID: <20231213005250.GP1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c173ce4-e153-42d4-8a88-08dbfb75d5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqLMITMTu5F9UxduNZJBoQMxQ+3YCpXK9CHkDg8myknNH5g6fuaLUyW2UzRuO9PeBOCkgBmkDBeRTccdCWHQhlq5epV7Hhx+GF6k4u7b747q2ypoDMv+oc/0kdKgDP6ryQbYCOgZLPp7rzPG8yPa46spqz7C/iUoZujJLEN5gvD3fbI12P5VV3asviadnMUo4811dK55LT8uC/+sy4qrme3UtmXY2Yws0sACPSB7YACX3SEx51tt/aFiuZOR99injCivRpiMZogJp7N7HyKAMRL/whDqisRumBPwfhybux0kYFHs8/9ynN6CvI62n9ht6VA8na+aQl/kwET/ZdRW4qO2xXRDbgwMa/wi9Zco4OqdvRNi1Ez8aQoEWPRFNSWcROSWqaVgL8Wqgzi9J2magy8+QfUUE3pXcL1IQEKy1w7xlRy1uWVsu7h2JViT87HeoQiTsHf1dqXnD3GoedFbsl/86HJFlCfOv5sRb6jNjvXccFNLcxYixHh47WdTo959csLvj3BPTBIRcfQy/dArnsCemGXkuWYi8VNiap/B4brNmt38TnmTbJ8p2iWUGcPT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(6636002)(66556008)(66476007)(82960400001)(86362001)(33656002)(83380400001)(478600001)(26005)(6512007)(6506007)(1076003)(6486002)(316002)(2906002)(38100700002)(5660300002)(4326008)(8936002)(6862004)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IL7N9F7TLcAw8ZH/+l1taAWSX8+3KP6NjpdaY+DXDID2D9GSSQRYJ+D0IvOE?=
 =?us-ascii?Q?Zcs8Yvz0pedscaXkbA+Rsf2DR6kel3F0kAffPpAInf0XZ3ivAFbu1YGcH/lN?=
 =?us-ascii?Q?azDhKEBpLaDkpAgYLI27gVl24sFum+vROdkYDvRvFJL+yuRUYNSsr1xyTqIf?=
 =?us-ascii?Q?+eLQXE7r1WH7aM32x3QT8oiF71QYjo3mB9NQAsdl/TY84LRA+Ptk6pukorPk?=
 =?us-ascii?Q?8RWM2YI1ZAb3ua5kgi8fhD88wKKH6aOGHDJ0FgYKu0P4iWwovcp3lY16YsLc?=
 =?us-ascii?Q?WzNd0mA9EZ1HEZF+AEBM22zJa6nTYLNzdL0cnxCSTo+XQMKBAHCLMrLc7W9g?=
 =?us-ascii?Q?4/uqKaVDbDJXvWTqrwH4U/kPlOpCrC55DEZVkc9lnlTaSqSfkgEhkaTpfzvp?=
 =?us-ascii?Q?1cn1C47tK4318P5Pbyr3KVLT4Vi0C659rOcz3YSBZZTVnDIxwVxpkzvebZTf?=
 =?us-ascii?Q?7npbqO3bV2/BfAa4oFjBBMmBlpz7qDUH5HITWwco4jdZMJlyFL96PVy8Qwh9?=
 =?us-ascii?Q?D4j0HML/tBd5FMElzpD4s2OTZrw3Qi6ES4/WoRDVLEVOLQeN9gd6Fia3Gx5i?=
 =?us-ascii?Q?99cKC6Abtb1Q1JjVMEyt1Af0Mrc+tjc7272AK3/Gjm4+fiRM8gTslcAEEnwl?=
 =?us-ascii?Q?KqySgdL6AYUO9yPaYth+INrYSHDyeeK1vebeVAbPj+OD3NIAJCAeHMgr0fc3?=
 =?us-ascii?Q?lIESlOrVZ8A9YCMbRSh9W0xTfli9ALdRS2ENRp5g9tnFg3cKG/W7fTNCvW1V?=
 =?us-ascii?Q?m5/ZtniKCyWMEkT8tKOChe20w43s1w05PsqPR9A6/XoUPlwZXowyoYpAmZas?=
 =?us-ascii?Q?9jQH74nLJtM+z2AFLtrcX58qg1EBw8JjnOqzfhQfBBJZ72WQY0w1CrGoCOOK?=
 =?us-ascii?Q?KntxaYs1NqADrVRHmj5k9tKwZnmmnqnzDoq1c4w4w/Tj14TvXMKT0MQF9I4a?=
 =?us-ascii?Q?DnbI9+OrLEMyQqAzUqCGmtE671TweZ/zaFX1iTMlz/HifGlGs6Ja6k4BcjCV?=
 =?us-ascii?Q?sACohcUUbrJkdVa9FzNqxj804pgx0GY5+oeg87TudISs9akxH6EHdTmwHY41?=
 =?us-ascii?Q?flSPR9GIVYSpTSpqocGr4f4AzAzPROfZAw9P4JCtVTQSkgrZzhdfXH3cJ0g9?=
 =?us-ascii?Q?6dHM72C454QOrLPR6OgX456IWekeEo6ID1mORlrunAkVg5bLRmOUaF68KKbI?=
 =?us-ascii?Q?E4oLEtmgeJpNPhKly5FlvXFiPKgKbYbxVXGDL0anb4sc+GtoyH3Zx0IfuPbF?=
 =?us-ascii?Q?iLb6H+EdUTZC32Hs9GiIUTDl5Vl71boCDet1w9R1YC/LVs76izMOzerCdO9Z?=
 =?us-ascii?Q?CR73dkCcDAKlJ3wgsOoEGQZFNuM0UYEOgCvK4LwyxN2ogo1g8DrEQHk2dC8X?=
 =?us-ascii?Q?9HKi0E1nVk0xe4swHO4G2oEP2IgY4j/1Ia/4hjtjTFf1gmqS8qD0AR6rWF+b?=
 =?us-ascii?Q?T2fkgjK8K874Rnn63Fdinj8RieIBVKBJ8Nfw77c8LwhtBS8M4IAkM5mB3yHr?=
 =?us-ascii?Q?15r6je7ZPVCCOM34Rq1XD4vazbX/hJOHTGpWY5eaGiiB+4aHueQuUfoFHGvg?=
 =?us-ascii?Q?aCo1pybcx72wPgwBu1WrZKJHz+vxzl5maua/s/7MvR4aiTEfgfGIEtnJnxHW?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c173ce4-e153-42d4-8a88-08dbfb75d5f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 00:52:52.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsMkVmhrcpCYrtEdP0/vbvFo2WuWc2Cwr6YtK0zbh9VfP3nkl2/ONm1bZCCd4lsaEdSjbM+0XFurUS21MKbCBxnCubV2I/h3IRM0J2XzLMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
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

On Tue, Dec 12, 2023 at 10:00:53PM +0100, Michal Wajdeczko wrote:
> When Memory Based Interrupts are used, the VF driver must provide
> to the GuC references to the Source and Status Report Pages.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

As noted on the earlier patch, it might be worth moving the
implementation of xe_memirq_init_guc() into this patch where it actually
gets used?  Up to you; either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 482cb0df9f15..85096741cb3b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -22,8 +22,10 @@
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_submit.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
> +#include "xe_sriov.h"
>  #include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> @@ -574,10 +576,20 @@ static void guc_enable_irq(struct xe_guc *guc)
>  
>  int xe_guc_enable_communication(struct xe_guc *guc)
>  {
> +	struct xe_device *xe = guc_to_xe(guc);
>  	int err;
>  
>  	guc_enable_irq(guc);
>  
> +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
> +		struct xe_gt *gt = guc_to_gt(guc);
> +		struct xe_tile *tile = gt_to_tile(gt);
> +
> +		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
> +		if (err)
> +			return err;
> +	}
> +
>  	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
>  		      ARAT_EXPIRED_INTRMSK, 0);
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
