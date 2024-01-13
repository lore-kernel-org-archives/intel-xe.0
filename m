Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25025C3DA79
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jan 2024 01:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E504B10E072;
	Sat, 13 Jan 2024 01:13:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3110E072
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jan 2024 01:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705108405; x=1736644405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NHFTZMU6EyEOG4ElmaUA9KKmk00roFPu4Vd6PpJVQII=;
 b=Qm/d7rsG1KdgQYMZeQN28EhAHwhi7QhHQNPLuoNHDmBWHuR6gFizFplA
 5gnJBz4Kf1yTTkdVK0qX/eCpidJfBwA1n9PxHSPbDAuGTc2G4uOBayrIe
 KvhWeEsubOQtGFW/0YPVsEkv0WZT4PuNS/OcpJJsWbjr6fGxnGH8P9+8L
 zCpg1tsLMlMu/BjkDhjE+9Dga/VL1Qn0samQWTZEd9ieADbMjYlZUdTPo
 fNZwEhO1c30CT+H2MFBSsGZhYYJKahD982/gFRWfO/N51VMnvsqjFPOIm
 rHL9uvBiVZVSj7owuG9PPp1hDEgVThpq26aST1TCZHQAPRI/Ww6uX+mAD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="20807853"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="20807853"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 17:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="732744415"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="732744415"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 17:13:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 17:13:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 17:13:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 17:13:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 17:13:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L032g/PZeKQbnY4x2ZCzeH30XD0DXlPjeOajIuTc35qmq81W2U4mJ5IzFjGd/zu6/PGgPmh08C9IoyJ6D91Z2GCM4yVHMps0iK0qEggXvoOEKCoLmKP5GZE89fAgAGr0XBOrb14M5XoA9ftlUWTuQKhVDG2PtpOyeKd7KGv6k+PrPCxNn89ROHFyZrfRnNyEUU+uF7AwUxQC22HphzppWQ4C3Na5Sm+uFIrCiLqWo8hzUhDe3WyQAaWs6X78H0RG8QElDw/HvB7+FE7XXyWtPeMgSHNE9PKezw7NEpRWhLePkGdCIntMpeL/x32DUYtvs6GccDYHXo/EMBjTao1yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlPYtDXb94w58Qdrvd2D+jYbnG+NCTXNyHen4EOlpoo=;
 b=TIUXjTtfBjtwUX6Yy93En2JeRQMO3Ht87Boaq0qg2N+/wRzBFr/I1Z+K482DFdATNHdj8/+o+KN7eNbm2ApGj4rZleNhlE1ql30hSOTKgXrfs2tKym96ZbKmBcKoXf42Ac1qHopXz9YMksFfNfg0sgyLaVPyHTps2r12w09sqIxdajboFfkxi+UPXWZtIlhRKEqzuQhZrVg0o37V6AOZLwrjgJ93QcPCRRqBenrjWrAP5r1L/+SsZ4sNF3Ak/WWEsqyN8qftsNy7+7BOnAZ/Z1cBO9RWma+6ENOkmbxoK/7TaMOr8h/aHtfmGkIqPzDHpiCyDOgvWIGpsqNkPI2Vaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Sat, 13 Jan
 2024 01:13:19 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7181.015; Sat, 13 Jan 2024
 01:13:19 +0000
Date: Fri, 12 Jan 2024 17:13:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/8] drm/xe/vf: Assume fixed GSM size if VF
Message-ID: <20240113011317.GF45138@mdroper-desk1.amr.corp.intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112152649.849-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 85733713-c665-42b8-7e59-08dc13d4d43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cnQCppLIRoHOea0+xbZCCV3K2qsqquMA75dw4CoNmoXqPllHSdWun6zPzCoefPHctrUm0EKyD0UdcGDJmMbqrRSIAVNqk8GyWMo8K1e1OXt7o0ZX4cdtf/bFTp3tJQX033OhNjENJksDS5wKqj6xvhXggHc5vbdPq3iAC8UH7wf0IYSN7BavqeBxLLODKDeW+f1g5EIBrYFByDJwNIZA/FvJ32pXmwDrkMyLRlKvB922mVXjl/b0bESqN2JfMDhjXidGWRg77YCEO/pch69MfD59NWjZiuw8SW0LiFJ3MCkr5w0PfxQp1BQnYsThgnA89IArE/6mXtdpzNrfuJ8S9DZWYnIu8F+xexWAlt3NgW7GNnySjK6PJNfb5ER9FlKXsJcjcBhLkNEO7sckoHr9dp4NL+5z2BIKMlVfqQoVH/NphIKFn2DLS4eUuOpnpDcUqc2HwRj6HDtVaJ7Jb7t/rWMxt8TjfbquEMQgQNpGrz/Ku+o2xLs3g8U1RBOeTW+lAYHhS9rAeovk+CPtIW6nGu62ZlOr2g+l6VHjs9sWW3Toha3Ka3SU+MDuh1Hb6hAM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(5660300002)(83380400001)(1076003)(38100700002)(316002)(2906002)(6862004)(8676002)(8936002)(66946007)(4326008)(6506007)(6512007)(66476007)(6486002)(478600001)(66556008)(82960400001)(6636002)(41300700001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKqh5u91xF636H4AQVfIcG1YMoHQ8y3GkkjMZO9zJHUjwcn6ucyKzZltBakz?=
 =?us-ascii?Q?EdigMLKNFhMeGfSI4m3wybsNhML97KzmvJZ6Y2f8gr6OzXvHhhhtrwP5Y3jx?=
 =?us-ascii?Q?0MGGgcLpMqJZaph7KpvAfBvRyGZ6cGwJ7x0C8Fs9zXwiwKAnfTeHce5AyUNW?=
 =?us-ascii?Q?NcpazU3z9RPGQFZrxLMUzvRJXiMD1eiwgXF3aR46cQd1b+iBGNgzMe+Y0FHm?=
 =?us-ascii?Q?XN1nrAjLUnJJSj9CmtNCZM7IOfsV2dvixJY0ckdK9fSexSyh1K32TEc8kCnS?=
 =?us-ascii?Q?22tVRfLykRku1k135nTOcsv4bSkm5xGm9GaDg0SERoYv7M6D1SHzNCt03a4D?=
 =?us-ascii?Q?pTHdV2GJSZS2SfXVHz9243N9dPDTIqr8oQm5JH4tweY5/0DON15S6MyqcrkU?=
 =?us-ascii?Q?3y9g8Gap/2cIiG8LOqKCObYEjEEtRds73W3TQLpRhS0CdbIriehs4tChMe/3?=
 =?us-ascii?Q?O++88JgvUBx9U3bpk7cTcTVoCA4OhNSoIYOF8bTtKQKZsxRU4bDaVnfdhQut?=
 =?us-ascii?Q?qJHvFIeVbjNq5+LS+g0sEXIqj9ZMdQRGTIsS3rhyeN2ctMxa8/fo1+gBHa8+?=
 =?us-ascii?Q?ZVFbdmhFGwSZdfqV6SwwFSDZknydesENWRI1X8X/qXeQiF6IM3UqqY165x3K?=
 =?us-ascii?Q?HV1N4mwsiUXL9Drr5Ont/dp1+Xk7jhszmaB8FZryNRbELaGURkTTExRMIjiU?=
 =?us-ascii?Q?j5VMFYSxriRkyQeHivXy+4+Bu8zx8lr/B8O9Utku9WqazwdR4NFAiNQaP3Kz?=
 =?us-ascii?Q?HNJdWiqpkZseJONx6eOHc+Y+01DVFD11IorBUFjx4o7LWgpqa5Bb9HMYtKF+?=
 =?us-ascii?Q?L7D8kknSapyajqwFp9lEM2Y6dgFVf7uUlL67+pGfHXOabJboPJfyFQgMm6Q7?=
 =?us-ascii?Q?OVQadRdGaBeK1S9KEq4GUA9uWYpFENaeAv60+mChZNAZWu25kuNr8Z+rwlxf?=
 =?us-ascii?Q?OCYoiZS1cYCgsaf6LAGu3BpUIcOhLVtLazG3pwe4kzYmh6Lb6tnEFjUGeKLh?=
 =?us-ascii?Q?HJKldUQRthW71fHcEjoYC231x44yJAHSAEnIE3+sjhnZJue2Q1jjyEEHbZIC?=
 =?us-ascii?Q?KRxPcvr2N4aYBUhDMYMRwbscx3Otv0Oh2ASc6tgS9zZ9ya0UKp4mNGFLvhWK?=
 =?us-ascii?Q?e/IiuYk8N5VQT/SrwR7IVAQiZXQHHqWobyXwYiz2k/mWG8/xB8+MA68OWPsF?=
 =?us-ascii?Q?Z3yLvUDjgs3hTG4KH6km5RJVzLoJY16gSHDc3nGnumQZG77fVdtwcXUmhRKW?=
 =?us-ascii?Q?ym6v4GGoKAB88iBm45+p//F5M9vTCJOiR6FMDD0x6Fx7AFPYui5jwJgEw1T+?=
 =?us-ascii?Q?Lh3zXKx14yufUv7m36bQXtzPFubhmlyfd787esy8/w8GdM2NMy+4KwbGbdn8?=
 =?us-ascii?Q?aPFbM3oGuYoUV72uRB6hgFUpukxzZX7Ih/ismGVGn5mr9yuKdDielxdXGZf4?=
 =?us-ascii?Q?7VwCZKRCZgh6c1vhW9DwKWsjOphRhOUD/Mkz4ejXfXhI7SwyLdIdjfGSQ7Sh?=
 =?us-ascii?Q?M1Dfai1PIR84bXGS8QJP/DijIAxRVyYZ3t2tobUwQVjAddGUmQtqgjuY4kEG?=
 =?us-ascii?Q?Rz9GnmjOwHSGo8wpPmx86tWOZHEXRRucjJX96arE7NEu2emjXWwP386KWuri?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85733713-c665-42b8-7e59-08dc13d4d43c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2024 01:13:19.5483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDUHNGb3Kew0cSTbWYoXLC6lITIBezVQ60eDMLfy7XCWMLkaclNwt9kBaFt3Lg2oGFrZxqJeGn9g/rPKR6OHvh5GQM2rBRJnkMftx5mhe/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
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

On Fri, Jan 12, 2024 at 04:26:42PM +0100, Michal Wajdeczko wrote:
> VFs can't use size mirrored from PCI config, but it should be
> safe to assume it covers full 4GiB GGTT.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Matches bspec 70494 & 50588.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 6fdf830678b3..ab96edb058d6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  #include "xe_wopcm.h"
>  
>  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> @@ -144,7 +145,11 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
>  
> -	gsm_size = probe_gsm_size(pdev);
> +	if (IS_SRIOV_VF(xe))
> +		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> +	else
> +		gsm_size = probe_gsm_size(pdev);
> +
>  	if (gsm_size == 0) {
>  		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
>  		return -ENOMEM;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
