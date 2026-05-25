Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B3CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3193B10E3B7;
	Mon, 25 May 2026 18:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBS4WaSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A8410E3B7
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779734841; x=1811270841;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zJBuJTEl6Tp3WN9IQuxuIDAQIA9MrAPF5mXMmfCQp5A=;
 b=aBS4WaSvtnsT7JUVQk4eZlsr+NWaiAJWx5urpM2oIYC34MgzG+wcPZW4
 KEydmELZFqFlAa5M2kJIufz1uO44pFbjoqZr74HOCmCwdkNKNtVYb2vqE
 DfMxwczoq88Cb/Lay6TzOxyByiXL2GU87/L3e5dSjzXAWcA9xZq4zgZ86
 c1XBHw4Uqt5KytHegBAkyX4OTpmAB3NBtROdlqEwxsRAi8h5s+mMqEsSh
 Oz7G7JJGF1JJE5yT36eA1kFHLAyGBBOAP2t7T0fXoKMOzWgmdZvtAS9Pz
 msnj9yIiun+0MvFTtsqqYUuu560gUYgNVMfjJalGsgao0h0nZNScxdFSM w==;
X-CSE-ConnectionGUID: xtV9dYN0TTiteNJuK+ua0g==
X-CSE-MsgGUID: bli81oJCRSi/nL5ncx7Rlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80461087"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80461087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:47:21 -0700
X-CSE-ConnectionGUID: u8tiUTGiTpeXAtCGkOL5ZQ==
X-CSE-MsgGUID: fAOTcYvdQGygLaEK22n5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="245961613"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:47:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:47:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:47:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0YqfQR/XxurDuqvkNukG8cXI4RrDIAqt+xhWuWA4KzgrK9h7e6LfrZLNZWEHEv/x8GSZFHJQaREWQDdvGDLlGe2xV3T2uDyaFYSzGjQJMGE0OBKvoOCzHkPyW50SvVUFV25pF+6qHPQQGf3ga977kZyL2FzVFQP8ZOAl0YcIfnx/sFraBKGTtY4+awkBhpD3UZ+09uKPZAXuNX1m0Ffo997MOqZHqAQ1PWyJjBNGzUJKXxgmWZSqwTLArC7x291lFK4b0N34wVRPF7KiNVuoD0W5IxPraobGAma+yN28oCe8xFy5a0hk+mGguRvvOTCtlyh0JxkRI52KygMTXcD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsGDW2kI+dC4AyAS4xC7PgbnkP85oLVtnsM6TMOtX7U=;
 b=HqIWK7h123PEvl9Nsvl2MiqTYhCo31RpQwDuqLWp790JT0FMLeRjmnvuoEVHLCe1XDcUoF2Ypkt4k8drr4XKk3UY7xfDob0Q8Ac6iZKANild+wIf7XTrt9ZYjmQ2azQ7H3kpEQOaTRdnVU3J17VZ6bfhQKom3blFvJQLMGWa7BmjQ5rXl2MJHY3/09oMYczDUkeb2uFJ11XFGcFTW9jStXcjWNUSY3zcyQSEF2jyKqVWrjh82tnhYv2B0dvKg0emqAa2gwU9FDL/PY1h7Ue99+VDFMKuUKnLGc9oFKxhmsNv9JHCoeYR0CxYXpcUZZelp3gaDu0keMWDGkOYTb78jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:47:17 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 18:47:17 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 5/6] drm/xe/pm: Don't access device in init_early()
In-Reply-To: <20260525160529.15890-6-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-6-michal.wajdeczko@intel.com>
Date: Mon, 25 May 2026 15:47:13 -0300
Message-ID: <8733zfiaxa.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 208c95c8-cc7b-42da-891f-08deba8e0b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|5023799004|4143699003|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0G7pi+PJIIK3LQVwTQ0RnhZbUCKVbrHivqNsza2KOekYkh/Y3wXfp0SQJdo6c/0DyQWaD/G0mcl52t2XovN71fS/YfYYAVqp2pmcwFKUo17olKMOfFnEpcjqkkerAm1xH4laejf+PG8PRlWTpZVgrrS82ac9K+s2xFl3D8WXaiUZ01qh52/1BiHDD9z+f92V1rJX+Y98wMW9TL83R3wvIOMnLXogrARYnD262XaGEQHi+ipdBtXIdZdvJhpiSlvRo2RgJuvZ/lLZbupS6eIPkzkumf8kq8r71Dc3lirzcR4Eyj7P5Gz6ndAbsy8ExFh41C4TAf6/GDUO/Xd8GXhl1Jj8jHCcJgs1TnPr6jx1wxAsPiRJuckBd+lpziHdDzYOf9dw6UHwUoUV18dHHxl+IACr84/vMeUTNNW1WLdpz6CJG3qF9qtlwRBL97wnWRLOPAgsdRDNmwZp8kl0izxQvU9LfPYDcUXZomxaXagHWQ0bmF/Vf9qcfX7UDAi+hdsrHUohaZ5jF7YIifOl4D9cvSEOfx19tk34NYg2N4m9bSJvGuEHYcOzSGCIrhsOWE4AqJ2lpwIZWy+QaoQJKeO933pplNNhQHCE7wR39nWGMr+bJlToUGbcM3gKdmp5u2hGopsPBwSJMWB+weq/Ql8qKQvbfEgqOlMkClxMS+OxeiQ1+/O7/qazOKPQ3qmVux5I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(5023799004)(4143699003)(6133799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JyJyIPqB4V+lzOgj1fBWpawsw1kBkY2jDFXaShIbr3dYQY+joM5H3Dlw63Ux?=
 =?us-ascii?Q?mP9m6joAUXd5jD6GndbFko1qwjTDtDvZOH4ADaT6csXnv1HvkA8TD8/QuDFV?=
 =?us-ascii?Q?ogZ7J2tovghhb5OU5KKsfF7xnzYecSkMS9SBXYBpBIm8NjyJQEpYII3AKGff?=
 =?us-ascii?Q?nCSPfgwRa/4Oua2FxNwyd7AY4IVNeiHbsYCTveX9j4sl5B79sin4rWKMyXbp?=
 =?us-ascii?Q?mjhd9jsetO2n2ge/IR8N2kfWdfRSYvgPDdOnDw3lPLhBcHyqbDduATf/FOJM?=
 =?us-ascii?Q?g5MFFSAywQdv2LEdXBALFD1mg3kIaqPK4TZMUpmAlOOMci/KpT6Oh/f1kl54?=
 =?us-ascii?Q?Zzsn7wVgrHR8PEHrszTIgOpfnWhRk0GH51IZlLiZiGn4/m28jT/tJNxlmQsS?=
 =?us-ascii?Q?GbfVIEaMfFgiWyxjHFWash3u94EtR2+avnSOL3Z196t/NDePXRML6OWX3YTv?=
 =?us-ascii?Q?A7Ng2bvlA4IfYNRcijmtkmn783SjRhYX8nWpWzYmbCUtm8RlToWfaXQUR6HH?=
 =?us-ascii?Q?io+bmD2iqUVteXwvCEMF7puYHtQZKfQuzUpymt1H36xJeEMjDG/NvhW/6GVd?=
 =?us-ascii?Q?xUl+qWIX75pj2bPO5RiDcLSLZlxFrjTmXgMJW1gCtL7JABVP25xRXjw+bemz?=
 =?us-ascii?Q?Y5JeDHsuSMEn/ZAGZW5OVe5pMMZXeEg/cWpK2stHej/WYFfGcCseGreOFpxt?=
 =?us-ascii?Q?WXEsoa2NP/97IppT+sS1GRwt6M2CnRIjBfr/90nFJzsO2SwcEWGAd6AexAaj?=
 =?us-ascii?Q?dzZw0dfuoTAMpTtWE90VaVCuFBeU5qgj9PqdT1PHCMkk9PopbUhrY6zmRGzF?=
 =?us-ascii?Q?THBhIo8zekSkTbpkicYrbw9NInXSUPdm+EQkhgVQxsWXWZkY2AMZLDFT1uWV?=
 =?us-ascii?Q?UM5oXwC1HvR3qXfgWKRktvpchKJ+KG2ePMuJ0eeiDNFQL1yoI5Fhq6aRl4Ti?=
 =?us-ascii?Q?/Zki7GQuWYsocqc/TH/CzWRLrjPI+NmxYW3DtKvLlvwrXep122HwPp6SDesB?=
 =?us-ascii?Q?s+2+u1NBEMK/gmMrMMc5DmepoQifRGVFMoJlAn381cC7qNXgw1QDOOxlrgVe?=
 =?us-ascii?Q?34VJBgAVtWnRYGq1c4HP0X8kqVYhoGYTeGoKlfKZUCUH+zundb2XBVExUgPR?=
 =?us-ascii?Q?SwSOKovFOIgrdrjTyHb9v8W3JEmeFM8zRFCstxU05fmo8WaYsB1dSjmm0Oxo?=
 =?us-ascii?Q?MIy4WUgL+CbtVSylpX8WU5RDp4kq8pjJCZtRNHo4AAlPf9hbkh3M9Bw+0qzZ?=
 =?us-ascii?Q?T8eKJMTXF8wFyptT01t7ow5w8GPmioMO1Dwg5HCa0ZttDTy4b8vPfIffRKD4?=
 =?us-ascii?Q?Z7Ww8XObdbelCANpb0wonqgOTR/UnhorUbl+YRGyDYtruESnoLTqTPmG2HmP?=
 =?us-ascii?Q?UR2A4pqqdUbTO5iS1QNpaKTufYOGNP+/QjrbnY/fhf+/sMVoJEuzZbxsf7Cf?=
 =?us-ascii?Q?2FXLu5AtRaUaYUh8WVHIYMAcOetvi3xg/fwJfhGmrVMqPyt2XvzGBVaDH544?=
 =?us-ascii?Q?CtdEcVnHNfTKcTn98aMZaMMhNZ/3spm8hSSTklh70uiRVWXxGawsITWXflYz?=
 =?us-ascii?Q?E3+hT6CcQedG+UALHTJ79PYQZQnjULPeMkDV8g3y7TM6P6VDa87Bds9ErwZV?=
 =?us-ascii?Q?AeMja+ePlqbgCBz2taYiHZkpg5KEdC7MohDVJDV6uacjBmJja4HubBItis75?=
 =?us-ascii?Q?joXHeVwH1dVZU6j0DFsYduCvu5yNsEaQN9jlsQ7TP3z1lYOFH9UMX4KLb/T6?=
 =?us-ascii?Q?d2clp1J8hg=3D=3D?=
X-Exchange-RoutingPolicyChecked: sJ7BkvneS0LeydYUZFIzITXHov9BPm4TDoCG4vjdx3xKdgIAaiU5D2XFbaDahcVM21JnUXD7pfJpwe0jN1AoFKCwl3PGmFHbTqJb1oIwjnLuKDka44jDB8puDfardThc3qIOKgUPABDUIdw3EKoGLAIEoxhz4h5SOugztt3/L50ShLV9MU9U9GSROnDMwchp1eKkGwB18DPxlmLuclOmA2FaF2YOBpO+P4CwW+y4h9WEfdXVszmUJulcp1/Tth8OxmDZItNe29EeuL8IJ9tPefQB7SSGSCXNTOx2kMrfDyu0dEerAiO+XAs777GhgOCcSCLiCE04ZZJDAYllhoZb9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 208c95c8-cc7b-42da-891f-08deba8e0b8b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:47:17.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izQSWQs5A4YxFUZvP9rpv0BlYuHF5xKF39WIp+Ps9HadXP7/wwmX5MODKtZChxB61cNoDXT80VdNC45s8+it+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> We should separate software-only state initialization from anything
> else that requires access to the device's hardware. Extract d3cold
> capability detection into a new function. Add simple kernel-doc for
> updated functions here.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  4 ++++
>  drivers/gpu/drm/xe/xe_pci.c    |  5 +----
>  drivers/gpu/drm/xe/xe_pm.c     | 27 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pm.h     |  1 +
>  4 files changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7ba407f73a02..d224861b6f6f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -594,6 +594,10 @@ int xe_device_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_pm_init_early(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6b1a4cb7ccb0..35e611cd2e29 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1167,7 +1167,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		str_yes_no(xe_device_has_sriov(xe)),
>  		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>  
> -	err = xe_pm_init_early(xe);
> +	err = xe_pm_probe(xe);
>  	if (err)
>  		return err;
>  
> @@ -1179,9 +1179,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		goto err_driver_cleanup;
>  
> -	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> -		str_yes_no(xe->d3cold.capable));
> -
>  	return 0;
>  
>  err_driver_cleanup:
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d4672eb07476..5d1a3a26cb6e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -24,6 +24,7 @@
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
> +#include "xe_printk.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_sysctrl.h"
> @@ -349,6 +350,15 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  	pm_runtime_put(dev);
>  }
>  
> +/**
> + * xe_pm_init_early() - Initialize Xe Power Management
> + * @xe: the &xe_device instance
> + *
> + * Initialize everything that is a "software-only" state that does not
> + * require access to any of the device's hardware data.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>  int xe_pm_init_early(struct xe_device *xe)
>  {
>  	int err;
> @@ -363,11 +373,26 @@ int xe_pm_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
>  
> +/**
> + * xe_pm_probe() - Initialize Xe Power Management
> + * @xe: the &xe_device instance
> + *
> + * Check d3cold capability.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pm_probe(struct xe_device *xe)
> +{
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> +	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe->d3cold.capable));
> +
> +	return 0;
> +}
> +
>  static u32 vram_threshold_value(struct xe_device *xe)
>  {
>  	if (xe->info.platform == XE_BATTLEMAGE) {
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6b27039e7b2d..6d5ab09cb769 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -17,6 +17,7 @@ int xe_pm_suspend(struct xe_device *xe);
>  int xe_pm_resume(struct xe_device *xe);
>  
>  int xe_pm_init_early(struct xe_device *xe);
> +int xe_pm_probe(struct xe_device *xe);
>  int xe_pm_init(struct xe_device *xe);
>  void xe_pm_fini(struct xe_device *xe);
>  bool xe_pm_runtime_suspended(struct xe_device *xe);
> -- 
> 2.47.1
