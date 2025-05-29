Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819F6C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 23:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6C610E1CD;
	Thu, 29 May 2025 23:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KboDN9ho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D7410E216
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 23:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748562115; x=1780098115;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jYq8NiBi77vq787SWMfZTOxAPgB/XsvY6g6OgFUar0I=;
 b=KboDN9hogbbT+R84aYRM7U0B2AS6gX7tL8V9J8Pg9KTSPlrT2VZJfovd
 NdYtDKrlmSIrJ3icS/3ckoj7EQZFhMCqeZmEer/L1q2Ipnq21Cg3yP6yX
 X7tYT9kFsxOUEXnj4iJJ2LfM30kmGBrLtBtfUjeG1Vb4sWPO9Q5Wy0SBK
 +25NPMfuzCaN6FcOVbt2utbfyuB5Xn6M/WuX40HHHqEHmAd1HLU4ZTumA
 IYooWkD9xJpF0LSH3VyINTEtROn4KAN+ZZ9x79PLIR1s9Ogx6UToXO4yZ
 3IWOOXMg/P0fDZXuJnHIJfaW9PoaFlY5GuSMPGKGsnL1TDDI7qFLJjNvl w==;
X-CSE-ConnectionGUID: HZ2FcRU7SwWn0AopQ7juPQ==
X-CSE-MsgGUID: FhjeJ1nMS+yGN2E/XBpnTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49888592"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="49888592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:41:54 -0700
X-CSE-ConnectionGUID: KJ6R/ujdSxuTG6JibfjSVg==
X-CSE-MsgGUID: +jrMQg4/SpGoMaSGKizQXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="143617511"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:41:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 16:41:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 16:41:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 16:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZ2OrK9UlB3Qfpq1aFEySYX205+KAO4P+vcrvcDD7Fm7hJmE7Yqs2zeVEbUnKuOYTsDeKWFXK6RHbejy0GqLg3iTM6y1lJDpT/0KYkqpAMqC8IUbH1EIL+FNDOoDMOhtTs7+mPZjiM1csOhrR+gQuzmxDZLo2m/b1E/GLZ3tch4txOCJznw9opRs2/xZblcXaAQmbzyum7GTbJe382bp6Tmg13VIJjDcxwuMEIdXVYFCSH3rhgClV+kH7+g+bHlN0TxikVtCVE84IRD+RVMzW8XmNNeDqzLrLA59kcUPunfzsdO7h6f91YzUYpnkWOEXofjRpMmPRSLoxKhdzKhe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFhMHQ7+ryoH9BvT+3P6AGYwOm9OaeY+6pdB1dzeoOk=;
 b=TNT66npA+9tIUKS7yRk5/ojeh/g7o1OBB4uMrrpZvY53+mVRbt8AgrwcixdtO/+f44M5LS648HfyPdI+Lqgf3YYBtlmRsQ8OlvubMA+DsXr3IeKKd2INge4MkTktnVQs/ZkeWc58rnm5omm9FLIYRQTBB92qEDWiBZVf+zCP7qWTUmlNcPx4xmUcAEloHXHUXb4rEe8V9d50ntTSKRmngQYOVqcAs4qs60m/hENVY72LGy5QK8xplKjwtEO46JloY+Z9nZisbVpImvAI3NK5SgPpnrSmtDDg4yfVRT6QbOLDQZ9ZhHhQRttyWSvhMY96fKlk1lKEPTuHh72KvS78eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF9623118BD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 29 May
 2025 23:41:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 23:41:10 +0000
Date: Thu, 29 May 2025 16:42:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 13/19] drm/xe/madvise: Update migration policy based
 on preferred location
Message-ID: <aDjw8rFTnR/AfvKW@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-14-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-14-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SA9PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:806:6e::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF9623118BD:EE_
X-MS-Office365-Filtering-Correlation-Id: 63231120-5501-4137-9232-08dd9f0a4a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mie1TiIKuRjT0jDtm6eFts9wFq5SmQlyH/bqu9mqI8CERKvHXQL2ny4T0BtX?=
 =?us-ascii?Q?T7e4FOdvikKAwbJUNWgqL7DtboVXyu1ZQjjMJcv6TOmsbbnO69KabJJtamkU?=
 =?us-ascii?Q?uPITERg2Rdj6iQ2GIxQSBa6OBxiRYPBuuQ/FOOnspSBEEPzUEigsINaA3C5w?=
 =?us-ascii?Q?tQyDD4cDcTwTSxyVw+pSbsvBgjPXRysCWnIn6Gd26i8VxcLAUgQ4bREqT42B?=
 =?us-ascii?Q?NyNt2X3xhX+2VVdTDQ5/fCxwMcKAuSOqgbYD0y6pcbJvkyFzyy0Z37uaVc5d?=
 =?us-ascii?Q?KR90y7tS0Fl8YYesd8aSf8rOxAouyws8/LiSvSERG7anZHKAg0qyt1Mw5C56?=
 =?us-ascii?Q?L6HhqlfgoxNRYhflx5SsOViD8keU1O+pRvOdl824kHAVR3nOQaWt/ee042IX?=
 =?us-ascii?Q?EYM9NLJEJ7u7t4Fh9hCFo/QlEdsisWZKkuiis4nx9clLNUW32sO4P/Z6jeoy?=
 =?us-ascii?Q?hTf5itZNznw6EMomRf8jq6EjZq8DnIICLeKqmWu4f8T+OdLu4EZm8H4h79jx?=
 =?us-ascii?Q?Pos9z8IWEzntMwjenZJYB2apv9jcYJFJsMFfq0jDcWAtNQyp+xt5RHfJqxxc?=
 =?us-ascii?Q?u5ECES8NN18MMUZNNwm4SJP9twCy5eUlvQwVCjnMIpzrq96oii2flbUZBQyI?=
 =?us-ascii?Q?kpxIFMjCqxyPJK5I0BX109Qi0fltayvb8mQU+TNuxXnOYVzPN87HTAh4UT5K?=
 =?us-ascii?Q?zfkt+JB3b9wOFF2y1THS72haPsdBmIxy+tovcdPe5cAaZeQ10PLmSrlj1O5q?=
 =?us-ascii?Q?95hcdhXS2zVaFCLQFufka5pisenxJDjcEyJBvY/e0fpDDKwt2uG4L0+r+qe8?=
 =?us-ascii?Q?+A8v0lbnGVyGrRfYwIjM7YySxuLQohOMbT9twhtkpz6bDaUzClhhIz2eDj2w?=
 =?us-ascii?Q?iAj3eQhF9bjR7s3mpu7RzR7cx8b3rvDXcED49iXhq4qdlYP0BYQfk1RYyI5l?=
 =?us-ascii?Q?LA/ymPsoAyLRf27rIKKkyhia6gkMfa9MsFyXi6iKElTxyvRdxav8eEOYIu40?=
 =?us-ascii?Q?ugMUwafE3zZz6+pQq79Q1GCXWcmhVEf5j9kbqNT/FjUA2ShDM85gO/U3x3Go?=
 =?us-ascii?Q?/guwrLbjSPZIcGs/MLBCi+FtTqLbAVySR8rwBLvPVGOYjh5geCFjNTfHQlWQ?=
 =?us-ascii?Q?V3xdCSDTvvmMND2VHZxkVV2ehMmZ7xVaa/F+eA/SfCLYKssoSr2/2m0Vw953?=
 =?us-ascii?Q?x1hOjIu6PELAme5Zk+pGlBUvRjVAwmSRhQfJPVCGSP6wpVYYjuk3Ll4G5TX7?=
 =?us-ascii?Q?d4qq1b7om/VlayaKvU+/03iCC9zxm6BvcVfTTdHYcQxu3eS4dS8rS+PYf/bS?=
 =?us-ascii?Q?Q8/beBwNQysyDo/7PsN3sibRiUVXaOlDWzS+PnycEji8bbK/urxiJUI4H8zN?=
 =?us-ascii?Q?tEhx9Ca/mA2imyMUpkP8yC+MWzFi7F9ZFuXm5QWHvJvFVqX+gImubkg7u7U1?=
 =?us-ascii?Q?sUj/drCjIIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h3j0WCOa1mVXG0P3ZQwDPFyK6LOLQjC2+p5WGTZfrjPYNVKuzQJRtMpfESwa?=
 =?us-ascii?Q?mERZHdltm9aSd8Hp/581ST6L7tWkkXN5q2LG8lFZ6epuEQPO0si7g1+DhGM+?=
 =?us-ascii?Q?2f/XDzyM4OPy4OoXhKWLBzucByxfvAUcA2NunfuAPHZDJUxdcHG1Ozr1ZAGt?=
 =?us-ascii?Q?skPlLAUpXn5Xd1Fld99z0EnMXtg0T8dHGDPEmRTirZQAe+kP9iQvBIlff+8L?=
 =?us-ascii?Q?9yz+0ohA9fMW9mJWxGX87PbUrr0nOayAriwFEWQJSPsfXo8YEioFZg1eI0aH?=
 =?us-ascii?Q?D2+GaB78bN6T9QfnuVFyFuVKxiDyx0dVf/AHa2Zkuvijo8Avj/BgaxNrUPga?=
 =?us-ascii?Q?+0CwNsKncDxjr5kfOkTOnXhFLKIiCE0Dh/yO1Nc7w5x+c/YADXirFHVMOpto?=
 =?us-ascii?Q?C5y7YirlSnCJbthK3KK+J7J6DERxWMnECHGbchnPB4FHYI8Wf/XWc54Dlu1e?=
 =?us-ascii?Q?6PEBhZYFTiM5ldxj7ROa4bylSgOH39PfCtyqAPlDnOHCg3vApZr4ujQpCubY?=
 =?us-ascii?Q?1FFVtoSf58wRgcjctbWNn2g4BlY6wGjaGGBrmLjyAF9pJ8QEu4lgIHm40M3C?=
 =?us-ascii?Q?lg+kxUY5edlwCFzAbjIVMl5DRQP7laS2SfAXPaCAd1i1S1U2RPyL5SxfG4JJ?=
 =?us-ascii?Q?BaJvlJKP1NyiBfG94FCfzpq1WeWSDqkGol6WxZ/0qgJ+Q19TRukiD1foDY+a?=
 =?us-ascii?Q?aakqkCfOxcuIIygUjBwux6XLcvfLoiEvyCPgV2Eh+szSUVSqyHaRaViJtOXV?=
 =?us-ascii?Q?Wr7z0GAQtf8eEtPBXbK2mOVhzPUN9ZduBtV9EwS4zb2fp43KsOfQr1jiRgoE?=
 =?us-ascii?Q?6+fCAywY61+y0RhSMlsd1ynuBKLcpRQfy5Pljmf7VIQffkTFd1gCS8PM/Qda?=
 =?us-ascii?Q?5WXE+LOwZPY2zj+NDqv9WpLI7C7gDEJgrbxi3uxJwZRI9SDJs626toiytYO/?=
 =?us-ascii?Q?TWZTateH7DVYl2H/BFojAK9U0pU2OyEYzGrHc/KaSJaZUmVZ12qeBW/mCsbL?=
 =?us-ascii?Q?+FNoRduyqDJG3YWE2YqrfvUsjlvYS959m6Drh+YyYOnPt5lVXEIwNRYFuHzD?=
 =?us-ascii?Q?7jd2g1H0JOx0LHZH0jmfU0dpOam+NeAMKEZC1+3KqpTQWnnnaiFjQIZ1P48L?=
 =?us-ascii?Q?BxvJ/MnJwa4aCLw+b4GvcNVo2vM8toQSuMQ9tTrhUavivj0M+V/P61DZ0b1r?=
 =?us-ascii?Q?+uJpnGucM6Rj6zq8F7SSFjtaoO6Moqeyph0y7lLhDvCMeQq68cRWI/rg6t2B?=
 =?us-ascii?Q?rAt0HPfyHPtalJuNiV3p9dqKe+wACHFrts3QFIy4qEFTb81QONYPnDSUlZXY?=
 =?us-ascii?Q?WazMjVLEfTDYhia8uNeybEQVaj5ORzSK9VCbAQ4hH7xSk3pfgedtQEAZgU3M?=
 =?us-ascii?Q?EKXTo+9LdZodfEBOaVlV83J706c9bH7hK+56PEVB5APrEUfIeBLWWYjWTTBQ?=
 =?us-ascii?Q?dHDzcGEa9gQQniZHfPOrMgJd9JQUdm5VfRUSh/POrr6ZeABZFcAFADHBXDqI?=
 =?us-ascii?Q?AzGCB8ZAZwyrQUJVYH53YQqtlm5S2Hm5UDLkYkmjSY/EEC19WmDjm8oKKFhf?=
 =?us-ascii?Q?EllXGx5ywb/6lNq38l60jbvbo6Y0rzpF1aEmrwU+oIDhsm/uQhtKD/sIc0j4?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63231120-5501-4137-9232-08dd9f0a4a77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 23:41:10.5704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWeOhVi7M39O5byocCUthsqEy28RuRPn+WDznrBBkjbCK5flY0sVltXpVowYXignIBe1FoyJ+XlBydJxcGJ87g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9623118BD
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

On Tue, May 27, 2025 at 10:09:57PM +0530, Himal Prasad Ghimiray wrote:
> When the user sets the valid devmem_fd as a preferred location, GPU fault
> will trigger migration to tile of device associated with devmem_fd.
> 
> If the user sets an invalid devmem_fd the preferred location is current
> placement(smem) only.
> 
> v2(Matthew Brost)
> - Default should be faulting tile
> - remove devmem_fd used as region
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c        | 39 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.h        |  8 ++++++
>  drivers/gpu/drm/xe/xe_vm.h         |  3 +++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 15 +++++++++++-
>  4 files changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 743bb1f7d39c..8b6546ebac72 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -791,6 +791,37 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return true;
>  }
>  
> +/**
> + * xe_vma_resolve_pagemap - Resolve the appropriate DRM pagemap for a VMA
> + * @vma: Pointer to the xe_vma structure containing memory attributes
> + * @tile: Pointer to the xe_tile structure used as fallback for VRAM mapping
> + *
> + * This function determines the correct DRM pagemap to use for a given VMA.
> + * It first checks if a valid devmem_fd is provided in the VMA's preferred
> + * location. If the devmem_fd is negative, it returns NULL, indicating no
> + * pagemap is available and smem to be used as preferred location.
> + * If the devmem_fd is equal to the default faulting
> + * GT identifier, it returns the VRAM pagemap associated with the tile.
> + *
> + * Future support for multi-device configurations may use drm_pagemap_from_fd()
> + * to resolve pagemaps from arbitrary file descriptors.
> + *
> + * Return: A pointer to the resolved drm_pagemap, or NULL if none is applicable.
> + */
> +struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
> +{
> +	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
> +
> +	if (fd < 0)
> +		return NULL;
> +
> +	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD && tile)
> +		return &tile->mem.vram.dpagemap;

I'd change this here to:

return IS_DGFX(xe) ? return &tile->mem.vram.dpagemap : NULL;

> +
> +	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
> +	return NULL;
> +}
> +
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
> @@ -823,6 +854,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_svm_range *range;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
> +	struct drm_pagemap *dpagemap;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
>  	ktime_t end = 0;
> @@ -852,8 +884,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	range_debug(range, "PAGE FAULT");
>  
> +	dpagemap = xe_vma_resolve_pagemap(vma, tile);
>  	if (--migrate_try_count >= 0 &&
> -	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> +	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe) && !!dpagemap)) {

See my comment in patch 12 + comment above, I think this condition should be:


!!dpagemap || (atomic && xe_vma_need_vram_migrate_for_atomic)

> +		/* TODO : For multi-device dpagemap will be used to find the remote tile
> +		 * and remote device. Will need to modify xe_svm_alloc_vram to use dpagemap
> +		 * for future multi-device support.
> +		 */
>  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b36f70ab3d03..344349313001 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -95,6 +95,8 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>  
>  void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
>  
> +struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -320,6 +322,12 @@ void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
>  {
>  }
>  
> +static inline
> +struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
> +{
> +	return NULL;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index edd6ffd7c3ac..340ac34936f4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -222,6 +222,9 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
>  
>  int xe_vm_userptr_check_repin(struct xe_vm *vm);
>  
> +bool xe_vma_has_preferred_mem_loc(struct xe_vma *vma,
> +				  u32 *mem_region, u32 *devmem_fd);
> +
>  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
>  struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
>  				u8 tile_mask);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 084719660401..1b31e41b3331 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -61,7 +61,20 @@ static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  				     struct xe_vma **vmas, int num_vmas,
>  				     struct drm_xe_madvise_ops ops)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		vmas[i]->attr.preferred_loc.devmem_fd = ops.preferred_mem_loc.devmem_fd;
> +
> +		/* Till multi-device support is not added migration_policy
> +		 * is of no use and can be ignored.
> +		 */
> +		//vmas[i]->attr.preferred_loc.migration_policy =
> +		//				ops.preferred_mem_loc.migration_policy;

No harm in just setting this for now and remaning unused, right?

Matt

> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
