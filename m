Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950ADCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE9B10E73B;
	Tue,  9 Sep 2025 13:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2ojIebY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E104910E73B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757426317; x=1788962317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OnQwa1mtr8D9CMIBQIvEORKFCn/q6qVSA7bvo66A46M=;
 b=P2ojIebYJ++PbQULyYCCJRC2AgUxpMgg6jgmo7lJIrahRf7Ypb2QWz4x
 wSJbLjYHVP1JoQX02ZZmwZdUsBNVhFXgpis+LVlxVzOrFHcYnFXwFoqid
 O8PkSaj0JEpYbjEQgejm8ffqVdGfzHL/q1YhQTnk8UDrRHVJFUNgn7uwo
 NC9m0k7RHMzZWH1ATZSFJho3Efj/s/+/D7bvCG+A9+wjIgkhs42jzdZQX
 uE/RHgRfvJZ7t0L+GXR2yQ+X88O+1N4yJLbJCXN93JPiPFH2Ppm6Qw3MZ
 pFiuDtGN79z7Tas7wn/xpQm7I8YKQAXPX2sQv7mMu15YI6T5F1QxcBncu w==;
X-CSE-ConnectionGUID: bHF9swxtRnykGSJSnn4T4A==
X-CSE-MsgGUID: T4teUl2SRt+y/QIKVlso7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59817356"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59817356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:58:33 -0700
X-CSE-ConnectionGUID: 1/Tm1geMRruUZL2/o0N2Sg==
X-CSE-MsgGUID: E+ZKGtLxRXqciMsjtchjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="178316453"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:58:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:58:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:58:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:58:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2A++sf6x1Of3qWGRiVvx2RorJ/c1aW9H56TjE/tRpq8DIjHkocNJYFgzV0jhWgoDDSLvoAwErVr3ISfI8C8rb2MtAZUGDxf8cZD5hp3/23Zgpus2oGiR0tjY8SkrZyIkAtqCb+hCkFN8SMVDvX8JjKZUjHa2dxIATc6lC7mBSml3dR21ZwOWOMU2Yx02AlSySxbCtdTfrys8d9oWQlQ0lQOnWhr15UwWFgQVcsWKAtOY/Vrn7F7ldnL0699qsy4SBk/Ny5cAie21NrI1peUKpwLd0KMydsdvvurm5txSaSmZ1bVzLsRT89skhY8o1O0jj/EGUwkMWsZ8ak521C8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcunkAi3kG8LL2UPdHPKe68zQgnUMFev/Q0rMKE/c20=;
 b=b9CwnZpADp4qpNu1ou2yK1Rb6Dkh+LaPqpWD+0WB3sDeuCLvXnGw5ZTDWTVgygOxyDyOdJTR/D+J1EyEndmLmLofS0qtaUC9NrFAyoa3Uvk6QxB2YeFVgkX8oeaqEvELr9/TDwqug1SMDHBPTKzSzma8LCo4F1LlW67ZtMN2E0+RPtw+1L8bmGnZZqi36lrSS5LFXJ7KdwWnP9JK1Dy/YxcOsiEl1ZYIapUADmSTpT3+agodzbKMpqwDyZrmR90C7r7iHN7RMc8cnR641d+mLKY6n+5wrhithCDktM1fR3nd9nTneZlIYcskFDBfb9PSoN7ok1ET3oucJUYG3tAWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8501.namprd11.prod.outlook.com (2603:10b6:510:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:58:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:58:30 +0000
Date: Tue, 9 Sep 2025 09:58:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Use tile-oriented messages in GGTT code
Message-ID: <aMAyg_4YZ4MRMqxh@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250903213712.6364-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a815ec-d150-48dd-6944-08ddefa8f524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CzFq/rMpdloBVyVCoL1/4qbaOA/Nw1Dw2+dVtOjM9S+C9yHTvVMtgkGbHWLE?=
 =?us-ascii?Q?degRKUDRFAhrcyJUkjoa1Gy/f3iLK9TeRCbWU/ql65V2DTG8ELw+ZHI47I4H?=
 =?us-ascii?Q?XfeaNRTCzKbc4pOM+6EtDGplhRJmbpCCQAlT9xzuh7ewcRw145HIoYaolUjS?=
 =?us-ascii?Q?rxoMpdsYJ+di1NqdbmpkOFZvUsCkuxaM+RuHdH09t55L4+KS1kF38JdEEUt7?=
 =?us-ascii?Q?G32420AK1NzyEeK0Ra2ilp+6RKrbgESV2KTs4AhUBtmy+hX+f7Hw2gJxzyXJ?=
 =?us-ascii?Q?Tse4xsTEtrPq+OhiVznqYUEZD/QzeDwe8rITHXtkegtDSHRiYC0Elwwm6Pnp?=
 =?us-ascii?Q?T0bfVK41hvVCqS5m0Tk4qlyDfHyYm6S5K5HHDiSIz7j1c2WZPEW+tM7C+tvu?=
 =?us-ascii?Q?c0glbjdIOrYOkCdNx+iHT2RTu0dioUxLa+JnNyMlGZugmvayVwtoulB4ORoZ?=
 =?us-ascii?Q?CvQgXZ1vyfOcd9FEkxY/c+h+tMKoEG9Rs0qIKGdRxxBMJb8WLL2LloD+dNHS?=
 =?us-ascii?Q?0wN8b3k/7n3HqnCwrAiNQvSWyaX1W/dHR9BJbItOEi+TZ/R9VAG2Xp8JZNAl?=
 =?us-ascii?Q?Gl2Bsm+K1uYgFanlNmF/+DWrqcevIw9QXT6wSCQdHszS5kZAaOqsN6th3lNI?=
 =?us-ascii?Q?hEmjOlnrvHheVk7bBPXg6m/n+78Cqk9TVWVRP26mwomqZtFhirT7ssahQdXB?=
 =?us-ascii?Q?u3BGqk3x305EYH7sfNwvxMePVM719DNBqttqaqT+ZGajK/hk/F+LilTeBFor?=
 =?us-ascii?Q?3ORtV78eg9EhLMdxr/mgiJYQeCTt0qhYuoOWdztwIJqNqQrbaOiH/rA29Abe?=
 =?us-ascii?Q?fcRwiadKppAvdxOSCffmYbwwwMg5vODamUE+0XbdajJZCFor+HKjsNG/1jP4?=
 =?us-ascii?Q?Zuo9VzHEoYdan9tv2kGHW/q7Le+4r/nfgtoJhpz0n0hSFpIWLdGTN/TKgTVU?=
 =?us-ascii?Q?Bj5HTSUZGPzewQohTOKuBBvgm5hKvBephKKraHTfuEOSZAVBnPrJEf7+Kvl/?=
 =?us-ascii?Q?XTGTp1ABY0T5R1D+jwx+RPiH6+yRE8Fiwcs1dkhp2xvsPWy1q+sfz7G4ylMB?=
 =?us-ascii?Q?pEq5sdNaJg/tKUCbSYGNCK0+RW5uAroXfyy2Nke4Vwp04P8liUG+Ju1+ric3?=
 =?us-ascii?Q?l6he+so6vFsrq4P/UySKWyhFQLayTBa/CbDwD5iY4+pa02HxMaJrOO0nP3yT?=
 =?us-ascii?Q?M07VgDYDtHgknIBYGOnpazoaW7hTAPtZRxQXlac01v3IVgnAwAtFCeYq7pcz?=
 =?us-ascii?Q?hI0y+BPeC+OfM9pMFa1RBJyKW8DFTN5arBKmV/zNJWBXCuwY6uEvA8Ezx1eB?=
 =?us-ascii?Q?XlvGCGMy/OpOtvrsLSpmpqeBcr8RGSrz3Q+KllaHvcT0OJra8n1VA6+NBR18?=
 =?us-ascii?Q?53af71d22hWmNKAt+Cu3OyRgJstiCiZmP7f3h0nfQUUjpdK20vbVvgLLoxwu?=
 =?us-ascii?Q?hbe/yhG8Jbc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MNqQfJquveKIqDzTOKndBgxlMXU4pS7tkDg5HULhmqGP4Q2HjGgQO/0PQgzM?=
 =?us-ascii?Q?+fyHuI94Ty/RYo2RAuUFBUD/Gpqa4LAsKx0X5YHf1GCerctKjEmQccBXFR+q?=
 =?us-ascii?Q?KIdM3rGcuN/Cr4zwR2lj6O3ysWWc7x8xBtD0lGXC5VbFrDdx2JtyTSYJC3Gu?=
 =?us-ascii?Q?3+D43WWytWAM8bwMNqAFSvihaby0n7z1VFJYrz2uU1AqcKUfBeyAg41C8z4e?=
 =?us-ascii?Q?fGHGikgBKpzENna26b3S0e4xDrx2loN9RdpCtITwOQl45oupwnOdNPh2ts4g?=
 =?us-ascii?Q?tAb1PJlCAs97Nbj6BwVV5MbfGpcyJ2kgwuH0tkdRkX9/W1qzjudhgL6DwEhR?=
 =?us-ascii?Q?899Nuff0GsZj+N7rBFBZZkmGU/FCaH/9RaEqEEBFNEhguM3duYXXR3gL06Gq?=
 =?us-ascii?Q?VA7Zrus/I0GFyFet+Py11hvLOhO2hQV9DD9lQ3n+bjM2P6GUfWjLefJQXkc6?=
 =?us-ascii?Q?agmh2wuhWQvcoKW8DQbzC7NQ4rUg3kBymd2R0V/lXsY6b1UYkWOz7vGdTQ3u?=
 =?us-ascii?Q?qcwqzpQME28Y47u2p+7mDAKWZEZXxnro0lwaFkIjeRrURQ4IMe7fXBcvxdAP?=
 =?us-ascii?Q?KMyYoW3qp4MUzgeumcRXIjeQVPTGiPt+cyCTX836ekk50I24YK4qhoTTbuiF?=
 =?us-ascii?Q?1wZhziaXIIujqwWgdRb2OxFznbtjqbwkPk0O4S8PLOJ+E/rFTHA7z6ha3ZFQ?=
 =?us-ascii?Q?zvi9lL/2AaRETi8Qy5HxsZ5WCc574Y6SZTw43/NiiL7F/WuG2Wdk6y/94rvS?=
 =?us-ascii?Q?3NO6IrHsL89zHypOmSSxmi/uvGJprR8rnFOBTRZ/+/811YrTaXdl1S3oykg7?=
 =?us-ascii?Q?+1RZh/BIWl09pBea5fFab7OIEo4fheYnokhsYsWcVyLRxhvUKJZeLXYFkQnZ?=
 =?us-ascii?Q?cYbqzIVscAsiVpYDYcCL63cL1JkDxzi8xKTO7Z7exUVx3Q2R9ATFWtw2Y3aF?=
 =?us-ascii?Q?GivAqgVPAl9XgDTSod1/fZB3+h2dZNA6VNvwxqy7t81wD2mfgsnVouWD+upi?=
 =?us-ascii?Q?3VHiyMZbIBjkpk/va47tmp2b9GCoxL1bXM68ffKWlnQVv6r+7HUpVmtt85er?=
 =?us-ascii?Q?OfNEzwd0Aw9bmZ1W11gWQ7VGghJgkmkykJaM0VkucnpinB0Hd0G8gCn6TWGT?=
 =?us-ascii?Q?e4uqbXBoThKMDDXTo7UbE2Zk0QiR+CqV6M0gstvODdGRbJ6ZGU/j7EqBp42T?=
 =?us-ascii?Q?03hUzPeuCQh81kssUJdf6O2LlgokIJLHFEKRG1lpC4gbsBWvvgsqly6Q1Cwh?=
 =?us-ascii?Q?q7hY6ddpgng+6owljv5q+0h0rAko18OLkpBMq3Q7D468TcfYnUBVRCk8jdpp?=
 =?us-ascii?Q?GpoEEWFUAYbl9oMMcaK3G4hMx3pnJtPdMMsh4ACOi5R9JE2ALaz0F0MviUlv?=
 =?us-ascii?Q?+dawgwB3zSuVFD3aoTdV1s2ISZYJd+V4mTSCnkaTtPDM5XBTM4D3w2XWwIkF?=
 =?us-ascii?Q?dnLVHrX4qXJEYiQ/GoVc/gUqVKs/8pHgyvOJwjdaDZt1w8kpp6f70lLar/if?=
 =?us-ascii?Q?bYpr/HZaxllJOfA3NHIlWuLuWFk6QQdYTYEnIrqJJF7xR8NxvJ515KE+9HWb?=
 =?us-ascii?Q?m9tb35jsvBffZt2mCNP/xB6S5kr9gUJuDmCPHktE5HTQxzJt+WSnn34A1om0?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a815ec-d150-48dd-6944-08ddefa8f524
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:58:30.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OaKI64pEgPmBKT+x5fF8btzONwFJN2Y3jbx/TlMdZEqn8mcq8Phc1ZV49oz4xzJhubYe8vODzP4Ek/628C0AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8501
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

On Wed, Sep 03, 2025 at 11:36:11PM +0200, Michal Wajdeczko wrote:
> Use recently added macros to print tile-oriented messages.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(supposing that the xe_tile_ versions get gets in first ;))

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 71c7690a92b3..6a14bfdef41d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -28,6 +28,7 @@
>  #include "xe_pm.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
> +#include "xe_tile_printk.h"
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_wa.h"
> @@ -269,7 +270,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		gsm_size = probe_gsm_size(pdev);
>  
>  	if (gsm_size == 0) {
> -		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
> +		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -466,8 +467,8 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>  
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>  		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		xe_gt_dbg(ggtt->tile->primary_gt, "GGTT %#llx-%#llx (%s) %s\n",
> -			  node->start, node->start + node->size, buf, description);
> +		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
> +			    node->start, node->start + node->size, buf, description);
>  	}
>  }
>  
> @@ -499,9 +500,8 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>  
>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>  
> -	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
> -		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> +	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> +			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
>  		return err;
>  
>  	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> -- 
> 2.47.1
> 
