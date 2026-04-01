Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C823010FCADC
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 21:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7550F10E068;
	Wed,  1 Apr 2026 21:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJkwGpYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B4610E068
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775077695; x=1806613695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XQr57mcsnxYD2lEPLxlu1kEHQYe5mTZFiSRYZEoizOc=;
 b=oJkwGpYWVZoS8tnYvwUV4ZFSRO6ehoujcEhNgldLc47q5fXr5u9s4VrX
 Hg+rg/qBvZmZywred5UOEig/NbM/l6xjdwVa1zfXAz+wPBhBUEPMvwiqE
 PVhykMkj4mcQGpuO5VMSFPnLsnxSbwuVPv791eScTxtc3ksT1kFQzsREw
 9RXUsn7niTN14shKNNQKRQIVPVmD4YHuCQGZcDbB6DRuEt2lmwHyOMSNC
 JTqeAz4jmegr7dx+49fFyeOxQC6zyGWmL2Z+5TQspt/90fJ5nYVGy55Pz
 +w57bOHVtGacDX2DexMgf+xyD08O78aLJQpjwnw4ajL1qQN1+1ke01WcI w==;
X-CSE-ConnectionGUID: kGCtxJ0wQFO2rhKzjrKr5Q==
X-CSE-MsgGUID: PAqYFCBNTQWV5nwYfy4CxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80016844"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="80016844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:08:15 -0700
X-CSE-ConnectionGUID: 0o9pO8r3ScaIT33E8GeCnw==
X-CSE-MsgGUID: C2SQAWwqTTSy9JINRC6FmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="220133838"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:08:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 14:08:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 14:08:14 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 14:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9NG8rzg874MO0f8bGFXzH6K1vIVxtvqVBtaxcFbkcaxHj5XJq74mYoda+EVrKXe5Fex7IzDVrVPIWryiR+kpCt/nhn7Jkr96j3aMUslJ/kTcuMtWVnA+RW+/KxAUyBBwZvsKpexBL+VvK6V/uRYn4PFsJzs1CL1GlJ4cw9ryPOU/J2MW74qUVc+gPcNzb4ezSBTflemJ3H7FxlAzdekv/HkQ6iDCd58Wg6XXzwQumUao2Ss3BZuUnUdoJ1p7dbnsVrLcyreWzcvkivCy14/y60NNj+RJQ5i8j0sILolU410yObgx1Elj2ddoPikFEzz+q8ZwEY7tDliEmPt0a/xSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GxxMpKCzGwRyA8KtTANHFa5Yh2+YB1VkZi5tJJ66QQ=;
 b=iKLzbsTx/1B0Jrp9mO2xst8ESDhxKd9OwTuLtrGIkH0lo80vTmv0hOdiCeunMC1ev22sF6tOa2p8Jse64KY7i5ncJyXCDO1eVGk9ax3089ECwMU8537ZZ18QEfdo9xJoJ2AW0V9qEJSXfflI4SE7yNADMlYjaD6w4dkv8PudkRcbPsB5DhBBMDpe4sbv8SwzUw1RtqkwcEwyh5Gq8ky5kQ0rcX1oBZ0CrWAl/Pf9zcXGz2vHmv60zDyqpl0tZzjWFedpXgVwkIn6OZ5p5QY2B27rs3GBDa+HFGDTzyQzYUJuj1k+KCxlLjky4ztxDU2YJW0K/Hk6OxmPwLENlBmctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 21:08:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 21:08:06 +0000
Date: Wed, 1 Apr 2026 14:08:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH v2] drm/xe: expose multi_lrc_engine_classes in debugfs info
Message-ID: <20260401210803.GP2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260330170928.236221-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260330170928.236221-1-x.wang@intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b78b8ed-62f5-4a7b-dedb-08de9032c509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: yNKQZpeBiQuHOdXXi8mAFnxCW6fwUucf1AE3EtriByKR6Z4aP+q0scm4oehLzRkCKoerHEtpYfMputNjcHmDB1g/WHREZeLd9EhhXyWHqk/az/34ENTCOubgSJslk2rrLO2Bsj41x54IiBPk3KLFIxzUiOfNGQLhYojBFNmnFtlOyTxBY2+nb3lSjkrO0B6gt2j6a1Bl4HLToeAnofxu3hWftKM+KwVGWNTHygqzzX/6edHn0+JZqfpAexP4AiNUIv2aLl1R/8s8waHjrIiRHrwd3jknf2JbuQsnnM3fDdsfNuKe1Ijv2Xbav/60L0yuidgWwkhGO8tJguqMI3Tdxfn8O3LCaj1iK6q//026BwgyGFxlrAYnYNv3vE5OeylY1o2JMvGB1Ux11v3BRS9JxjY7iJWwKwmp8dMiOMpbhvZTgupBqvq92yiXtLrpg8ag8lTB/EY/LSKN8mKzpp5sQNEA9JyAu4z41UcTkVOUNYSRA6xdp57xDaNnt0BrFsOxog6cf/Yj+QOvJE2OxkLn6yZPNoR2DW5w4pvqAc7jm3C2uDLJYUx1L3G4ld1bEyxd9bKWyfqTubwxDM/XTQsiSLVKRsd20CXmZqKQvOHPRcD4dZIu4adGCQY3hEj+irDe88Av1AaMNLHxiDuY7zBbQfYV5o8juW0fTC/CtRH7605f9REBR0fcSUKRVOcPfzJgwVreFl4T/9SPDaZqdgCVlftkEksD33uh1leIMx/1fH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgZX7i4Jf4mT00vgmPBqDwEFtSIfy4a7375z1uMag0fF7zBqJOFgGY1uAl3Y?=
 =?us-ascii?Q?Qh9OJeW+rUuOHa8qrHPctHfF7vbPONiarfQVydyOSAVSs6SRi0JWkO9VjA7S?=
 =?us-ascii?Q?qYAgZlANXP85KWp7C9Dn8iCZL5WotVzBCYEb11HoGLOPQ4i7ysUuCFfo1wmX?=
 =?us-ascii?Q?VFJv13JaM1oG/CW8UKuPN5/ykyMI1jjBYOrWVdtlKeoIlrxKSWXQ5noq/ckk?=
 =?us-ascii?Q?nUoyxYJzPYhIMnbe+B+JfWaZnCbGRzhLsGmWa3Hy17/XDGntL7EPQCn6crlp?=
 =?us-ascii?Q?3Q2ysub43L5LKftTd4o4VUxvkd2cfyMKzOxLbWXGTaF7HysoiRPIPZVwNMw2?=
 =?us-ascii?Q?2csrlFyq/kndpCj99wRFhiBVASSoA96+tLpXjOaFHcTFftWKAQTkR9WHbDdy?=
 =?us-ascii?Q?AfaMIPq8WaURGAYhwTtu+WWNQzth6D4+cdenkSTMKQn63+dMyI18NOUykeRK?=
 =?us-ascii?Q?CJQymAPn12C8pagBNrvjllRFyDzz8Ilzt+zrjO7f8A8uXUgzUSZzUzGCvcAR?=
 =?us-ascii?Q?TmH8YjphHreOaEvErTEPxgVuvNOcorCH2C9gIOv1WYg+Q5dE6699L2PwXS9k?=
 =?us-ascii?Q?RHuGCekg7zBOwFBgeI2AKhhdvnS7uonwwTuA178cuPWh67TLjSxM1bXBBEgS?=
 =?us-ascii?Q?htUap4acPUtTUuTQ95tInphfxgUOPrKBklnfMCinob44U9TyHTYmc2tpuNtY?=
 =?us-ascii?Q?3QMaWa+QN69R6WEfMM/2o/fLal93/2HJbSOERhaOzYj/KZi7trBbpxKiZFaj?=
 =?us-ascii?Q?KweBZpp5xbH7+tfME/MajwftRr50Gw2ELFfg3PJ9p2JR1vjeBTkcXnc4gkWU?=
 =?us-ascii?Q?S8BWwaev+7E2A3GrXeoO6mmRFZs4JJ9vDM9sSXBrKBndHc22gQ8w9iXlTT1P?=
 =?us-ascii?Q?MbfOLDU0BMiUh5gyXTRqj2zTnZI0RqZl2N6j1hP8aDq0hukDXbolzajZB1FW?=
 =?us-ascii?Q?0bl9b37XlQQ4ihxa7N2uT/H1CzpJFt94sFkRMFzPjAXq2cBEdXeqaW+YFZgB?=
 =?us-ascii?Q?d0jnQFcuPiAHRfbStCWxVmYp72W+l4jCWBilLQOOlvinC5ttgdhPD8qLQKVb?=
 =?us-ascii?Q?6BlEO0nd7jKdc/IkPmYliRSu6UqYVfwvN3zDYwJI1fkE8ELg2P5BuhHQPdpv?=
 =?us-ascii?Q?ErS6B3RdTUaxwCwXiGwA4px3YgtWmsIDoqr5nzTTGbDXsoDQ+CP6dDMjjekf?=
 =?us-ascii?Q?NH1KVJfZ/HzAznf+D80mniQsiLGk521iMoj3nGTtcmwraPGjbMICOyvg2Ii6?=
 =?us-ascii?Q?XxB/Llcg9GAJ0a63zWTgZTjboVMtmfN3i3qiVd7J89t5rw0D86MBxyYXyP4j?=
 =?us-ascii?Q?DO/nPwA6fGkk7RRqrRgvC23GsDxY228QWHYkgnOF86tV7uWInPCmcMbodv1C?=
 =?us-ascii?Q?tmwo4OJrVvTxihvMa9G3mCOa2Vhwiw1Kii9U4YidBiz81yUzG26CqgFsyldX?=
 =?us-ascii?Q?oYujGUkw9F50js2HOlzZ4g+b3k/7XoL+Mx42oqZekeJLhnWDQ5OROqhI6IGT?=
 =?us-ascii?Q?OuMGRap2fMeS1YwuTB4+givStNr4MIJTmsGsFQ4n9F8NQKh/3MoHcQIs+bsW?=
 =?us-ascii?Q?FWS6AZD4JVHSqy3KIAyeWnVvk1AX0SzI7xutOQ9+MEcQ+84jog+ijvA8FzMU?=
 =?us-ascii?Q?VrCLye4vyqOXYvvX1wa3yCucYvL7kUMihLmnfhlcnTXe3OtK7feSXWj61h35?=
 =?us-ascii?Q?r0Ku8iZqS15iVK6ixNeNkIDmrCa4+kdYfIkNfhM1BjDU5GUWxcYWP0dIg5XO?=
 =?us-ascii?Q?4sg4zrF9Xwkj6ZnVgVViW6o/Oeity5o=3D?=
X-Exchange-RoutingPolicyChecked: M4JgYx7YjzSxv2KYmB3hZ8uXs30o7DuxpMsxJLQ/Bh3e0rTl1xGj+8A/MzPcwp5mUWB+HGrdO+4b2SYHSnMfYcrZuGXr3kySG3H7T0JOzkEqkhIpYXSoaEM+sAcaCEipaO3VQGjJxzq2E0DF6v5qP2/Y05WoQyTybnQRSZ76wgy5AqSc9PAde5vL8Bz1Rd4TmF3nZvniq/CjsfeBAFBvTEaCro/DHmhKT0oM6Hl7oRguKlfwZTRRXBydTNrauw/DouwTEklCzMD5Xo6jQPrLo42+OnLuYAK1sy1R0FkPNO0da4ceojybsm0r7DOq1pFeMKpFSNBLe0dMb6gUbj3S4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b78b8ed-62f5-4a7b-dedb-08de9032c509
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:08:06.3431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 665PXUrwoZaHBRtjlsFa8fhbIFy02cRFYmOoAzI7XUoRYqR22kfF8oN4PLmPSjkXj4GNtGwGI5Q+ydzzM0XJ9Z4dm8rsciylq3KV9W6qmDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
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

On Mon, Mar 30, 2026 at 10:09:28AM -0700, Xin Wang wrote:
> Add multi_lrc_engine_classes to the per-device info printed via debugfs
> (/sys/kernel/debug/dri/<N>/info). This value indicates which engine
> classes support multi-LRC submission and varies across platforms.
> 
> Exposing it through debugfs allows userspace tools like IGT to query
> the actual kernel configuration rather than hardcoding platform-specific
> values in test code. This avoids duplicating KMD logic in IGT and makes
> tests automatically adapt to platform differences.
> 
> V2:
>  - Print human-readable engine class names (e.g. "vcs vecs") instead
> of a raw bitmask value.
> 
> Cc: Daniel Charles <daniel.charles@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 844cfafe1ec7..a410ee971980 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> +#include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_psmi.h"
> @@ -88,6 +89,16 @@ static int info(struct seq_file *m, void *data)
>  	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
>  	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
>  	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
> +	drm_printf(&p, "multi_lrc_engine_classes");
> +	if (xe->info.multi_lrc_mask) {
> +		for (enum xe_engine_class ec = 0; ec < XE_ENGINE_CLASS_MAX; ec++) {
> +			if (xe->info.multi_lrc_mask & BIT(ec))
> +				drm_printf(&p, " %s", xe_hw_engine_class_to_str(ec));
> +		}
> +	} else {
> +		drm_printf(&p, " none");
> +	}
> +	drm_printf(&p, "\n");
>  	for_each_gt(gt, xe, id) {
>  		drm_printf(&p, "gt%d force wake %d\n", id,
>  			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
