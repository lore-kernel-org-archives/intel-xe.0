Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E9DC25B7A
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB77610EAB9;
	Tue, 21 May 2024 10:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxUcGEp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44F010E853
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716288042; x=1747824042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Su3WZRordnDhYMOAv9MWKQgwUBsY92qdNoid8hOvJaA=;
 b=DxUcGEp0K0C5o+xcLxD+7beHUe8r6aiMIeehGeldYro4dBG2hU1ngAxc
 Ew/ZDHtpq3cCNBnogdee23sntvOj5LMQPAXj0itk889bipiZuGtdA6Q6y
 Gk4cN+3WIFy/dAPPCRpefCK9Fn2BvJbDRPYaj2PaqsU4nentp4E6w50zR
 fVuFRJG7FyQqHnMvQr2Cr9Bp//ASKLF/yLGBQZvSveOQ7oCVaiuQM1+TR
 KWBE1qdIELpSawdJH7pllvcKLkn6/5rjaxUwIqpmtyI9JovmfwYqJJ4bG
 xPOwmZCgQnfUp59vYuG3iW0B9qO4bGVRpN20kDk3X6tmyinVFnrJAu7ZS A==;
X-CSE-ConnectionGUID: zoSWO6NWSUKo1/f/8OJF4g==
X-CSE-MsgGUID: K6iwH1/RS3KMcBKb5RJb3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12695274"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12695274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:40:41 -0700
X-CSE-ConnectionGUID: mZYMEkv+R/S8nn/GgdmJzw==
X-CSE-MsgGUID: lWPGYuo7Sxa1i7UkFogsnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="70292936"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 03:40:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 03:40:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 03:40:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 03:40:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 03:40:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpX3okvOJ6bfZcI8pAUMUrjq5m3n4rDlQhI6ke8jVeYbctT4S8HmsDdG/vhFadckeCHQ7iIfeqDzSm0t6w7dqqOaVAUm+LAoi9RcIVpYJBDrkx/LYhZbYtzPg67XZICXegR54cvHvLZRKbwypu57eea8nAmE1vezM93N35YrX2zYcNfHVsiZ9tWMjOJD6PQqxaSD+sZh+jZWQCIpcKIsAam5LIxK/NCBYdMsbPi+eaOjff8O0mfsCiuQL+WCt467Q7OTfSShNKU1bOmk3MvB8wMb/Sr6zU1FEMp0Y+P+Y8BqXa/NNM8KCrXPPjblEHBJQ6WRa/v6V+IF5u7IqA8+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyZMcDoXkJSNFISAYFC8OwoHWO/DqwxFNLE3uUpwPPI=;
 b=EKJmvzj+yy+5/VpMJW4iB/t0G0O3Z0ulFb/Sm7wPra+Il0QfBkD1IhpfQFgkuuw/LqQBCJHsmB+KaPLDtsCIKxzLfYp1VHbAQS4kupeog6AoulIZ+cinWdbYJtEkl8iWWBW+rbQlkgY+C/IGXlhGDpXJ9UxDIZsEdAd7EG5p8nWakSrLXH997w4pQoo/Wat6iMpLf4ip+kXhCRmK9jpeWAjSCOFitjAY6drrlAzNMWmiyvrC8l25PstQVScHY22O3f2hjz9A37+QUB89bgis/5vXDYEmEzCpkPpcW9uPfkUwHhTJX8iScw+1dfrOZVayNAjHDbHxnLusg5rQ7YzqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 10:40:37 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:40:37 +0000
Date: Tue, 21 May 2024 12:40:34 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Fix xe_guc_pc.h
Message-ID: <Zkx6InF9xYgkHsLh@fdugast-desk>
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
 <20240521102828.668-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521102828.668-5-michal.wajdeczko@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0113.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c845ba6-b75c-470b-c276-08dc798273cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TFiVJuZ5Y+VWnm5anvCC8k2U3NbicRfK5uHIpJK7i2u1MoUxNyTd276v/mOj?=
 =?us-ascii?Q?8Rm2NF5sD1Yn+Ic8LdZw2CeaZqbfQdJJbV1bdaXQ9C4pynk8c2gaHSyFTSuz?=
 =?us-ascii?Q?i56pbGheOh2VLhnntqMEa70PSe1lo0mt4urAOnpr0F5vkkqHKQPJSuxQ0gTM?=
 =?us-ascii?Q?KZQM7jWKw4ngY7AaJwo1lOdC59b8Su9XbWVgcpLUzqdzr7h+73r7Ttw6WePf?=
 =?us-ascii?Q?8ox6stgCvoVAgn6VeM+xQSDWEHtcdp1fHj7An41hC3l2jk2AWuE4w+RIQq96?=
 =?us-ascii?Q?WKQYBOyPt0WUUk0yrIvNNaVHPHSIcy+8OrE13vdodKCYbzYjlye9KkEDHjNx?=
 =?us-ascii?Q?rEnTJ6GyD4hwzQN51wQgPd+Omyota+EwWIby5RmNwqZo/Bm/J+4M4OqF5bsZ?=
 =?us-ascii?Q?ThA6DPlUmb+6UGD+XTYwFaz66mDm++it3WRIC314N6n0giw2Voojd+J/B59E?=
 =?us-ascii?Q?vPjy9cgvTIAT16aWZM6RbPWhBzI67ezOFbmLGSQebCK9ZaxXg1sVx1FuWEmy?=
 =?us-ascii?Q?YRzuOtqg21ZU7qTPywZkyZzaiwgu97hLgiZ3MEc4UaHjusDspJeAoz4sd7ba?=
 =?us-ascii?Q?7r9zgI3nQ7Tsh4rFBwxH1kfk0qIKle/qym+tlJLiJRwKBkru4JBQ4pT6Rka8?=
 =?us-ascii?Q?xxoyDKYSwQPMhjKTOAihJFeEfb1YvQO7+WnjqY0XnhdiaXtbztrWjNfVCBez?=
 =?us-ascii?Q?CxZFBPcsfHyxI0iDJu3JOjuNRV4DTKvJAB4GpFex4MaZyN5XjxS75kkBeF4s?=
 =?us-ascii?Q?nG92swG5QbbeVgG/BYXGcwiAlKljCsXDT1ppNMLr0RhV75eZ9X6Fy3soc1ax?=
 =?us-ascii?Q?nuzZxjYy+dKpuCc2hCpn7pJ0mUfLqSdC76yt0LUsGTNQVdh5A2q7yEl6ZNsJ?=
 =?us-ascii?Q?WHpAyESDF526g+tQYNd04bb1UOscRoWd9RIDqjQuQ4sBVVkMrfKvlbssGV9q?=
 =?us-ascii?Q?g52OfueFm7fgPoeLZO2F/4guwlkwwGwTXcwpHMPs4jof03tCelf2TeUyzF5A?=
 =?us-ascii?Q?siVgLsl7USxIBYupe83A8CvpN8BsnRXVHDCxTy02uhqQvtBzw+XRtkOCTS5C?=
 =?us-ascii?Q?NMM1/L0+sasOLoCa4x+RMwZx10Crt9Zaeh/FH/6qMD+E94D/3a7yhMWXj9Gj?=
 =?us-ascii?Q?a7OEcIv4w/w4lraURLWl6FaKqCrnSSNovHrCfyKn0qom3lv/aywoIjhVjuOy?=
 =?us-ascii?Q?FRj2dylqefYP/1Wc/QK3u1n7Zu7V0HhNGYQ0h+biXMKgaSnBmyANsXT0lsXR?=
 =?us-ascii?Q?szebPMWs7IvEHauJu7+G6P3LzTubcp6zAoIxFNmDWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pR/nbfBBpdocw24FsVuDnukNDikyQLXctiTox+bfgs10iwAtiIMSgKPprIMT?=
 =?us-ascii?Q?/7aszerwukHoGqBlLKUxoalVbyWvRlpn7k1JSSMVRMFFuRHp5AxEBquDpb8Y?=
 =?us-ascii?Q?2qbol5Gq5SFPpD5RSO5KZ13wtmHHqs14/0HaE6sLTShC2B+5BMX4CpSmK42w?=
 =?us-ascii?Q?/sX0T3E+qifsyVX6mZpxoy0U5RYtA2p+R/CG0lQVJz0v/oz4KQxJ9QYCqbQo?=
 =?us-ascii?Q?10vpboEe1MecYowlni2bfPDFjPbE/QrhywW16IYb82cz6rSjRbfKrPAXV4Nu?=
 =?us-ascii?Q?d4Av9Gcea3cRU2h6YrLBkFlTb4WJS4/VhDGpou+UbqJvOzJzMhv4hooPkVL5?=
 =?us-ascii?Q?gYXcynZ1c30/nTFf+GagX9+H3seAXdiuDxT3kGB2DN5vxUkpmfgIxcWD1jHV?=
 =?us-ascii?Q?ANtMZD0pBohrHoiDRsb8r7VAWpskNhUAX8Xbc/tM8lCFP1fm0WHUoFHIEPra?=
 =?us-ascii?Q?Y1Jnw3HdIIZtITsMK3yqCrl9hxu5/2qEh3Mbh7X3jRYdhCLA97j3cBWOi2oL?=
 =?us-ascii?Q?Mvg7734Fp05XcQ7TCT0rMrqHtAB36ObtHOdFdrPBoEABQxfC54RWUj8FVOY+?=
 =?us-ascii?Q?/VA76DY8Z/ggByP4g95cPG+cM2fO70EZsXmHLmr8HogMKHb3bFCFgAehNu+1?=
 =?us-ascii?Q?NzcFMfxzcKm46f4LZHZMwKGdEuT6v5IMeB7pBoQ+UhDX7x42RX0cE7JvbrTv?=
 =?us-ascii?Q?kiCQFAUsUIaBXMFagcftvns0Ru/RuQT/bF6+Uqc8stWonpIjJNU+t/OKpTdj?=
 =?us-ascii?Q?pgPEkt8YdU5QGDH8okq2zkX54GzrHFmcWDQZwA0r+clR5POjtxXGS6Z4ssOp?=
 =?us-ascii?Q?LZaJhHIz7brx8bWWTy69p2ouv/ZtQXzLR/HGo4UhJCyCyWcN5UR7ceN+qlVA?=
 =?us-ascii?Q?wWKYdvuur9L662t5LZOFUJWe38lXqGrZtKn83ci3qL+Sd+Y11ojUcwmZOzUT?=
 =?us-ascii?Q?IeSHFf33oARMn9rmaWV3GUfVnyPKR6vP3mpZ0kUO1eaSlv+KwNwXcswMTql4?=
 =?us-ascii?Q?FiziISF8+g31R3IQ/qUUD/3e+OxEctOlBQyKVOq9nseHGM7lHq78/YF3eF0+?=
 =?us-ascii?Q?oGvAuBGsgHXlWHJucTNn0ExCtINKU9ZRh55fGQV3bZAGzLNPIvYwDMb6gyiK?=
 =?us-ascii?Q?JrNU3OtxUmPeAs8+8kPghbu7vGDN8JbECE+1IVnkK2u965Yc/LVAFULtoRk3?=
 =?us-ascii?Q?cpwKj5R7VKI4C7nSZCL+T0CAhvOGd+WG4AE0yvH0vo8lE4LYOV8jYiU5lINi?=
 =?us-ascii?Q?3WVK17aWfIQhGGIZ01yedaaeHskIGxTXWdNJlZnkLc/I5VoVj6497bKaIow+?=
 =?us-ascii?Q?9F0wc5sa7ANIi0PZZGC/7+VCwJ1IioDwjdBQVYgFiWxIedwMu9v+aVsMpv+n?=
 =?us-ascii?Q?ZQ9y8USJCsMsNaTHcmH0hhFTdkhtOA/pMYw6EwEnlcJ37J16oc9+pVDhc6NW?=
 =?us-ascii?Q?A3O6Le3wkf4xq0GiuyAlMGSjtrnvk/3EO+MafNLPd7nEFnyJjsqGvgfOT8Eq?=
 =?us-ascii?Q?cMH8Ziw4zxyYshiJAODGACwLHC5UGqtsW/a5UtMzDAzH5y4jp/5kewh0ikLM?=
 =?us-ascii?Q?Lnc7bfTuwN50TUkNUxQ5ahHo9W4/zGidTLWltT5hmqS52ILTld9ihuxasv7/?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c845ba6-b75c-470b-c276-08dc798273cd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 10:40:37.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgWWoGBXC/zs5FyqkxJsglu71nbMzXYjREKnSNDAnO/ASg5FsoJ//8idW4STzz5ms1MLXwFdlYo5yseI0PCIbB3vj48QLnCLzD/o3WISHyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

On Tue, May 21, 2024 at 12:28:28PM +0200, Michal Wajdeczko wrote:
> Prefer forward declaration over #include xe_guc_pc_types.h
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index d3680d89490e..532cac985a6d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -6,7 +6,9 @@
>  #ifndef _XE_GUC_PC_H_
>  #define _XE_GUC_PC_H_
>  
> -#include "xe_guc_pc_types.h"
> +#include <linux/types.h>
> +
> +struct xe_guc_pc;
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
> @@ -27,4 +29,5 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> +
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.43.0
> 
