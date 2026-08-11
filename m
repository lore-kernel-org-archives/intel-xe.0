Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC94C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 20:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F27D10ED87;
	Tue, 11 Aug 2026 20:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4Wmsf57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8410ED95
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786478911; x=1818014911;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CpzxXsQRj8tNdHwk20t8FvozQCZZntoy9eUi16/X0BE=;
 b=C4Wmsf57tYU8kI3JdT97ESHD1/057MxQoQ01qvcXPHFcMSLqSK1nom0P
 0i6A8X7ypQpstdYkgbT4/cWbwZCI0+X4cJbCtg3Lte6ErQyUuJZMhqHIH
 LoutXFbhDaYJxa/35grIPgFlCcx7+BzvAYQmJ5NOiXuSdyUJbEfihToZL
 9JoZMEliUv+agEf/ZogqlM+b7yyJySX+YChRwuEO3opmuc5SI1bvmf8r3
 653wB43Fqksif/Jrc7o/7CI6UQZTVvnPNLTeLeEbcMu8UYJgE7SeyEFeU
 8vL+aB1Jed7+ANBm8TDkhgEF2CzS3N4lW25Gd3SGef66xwqv+P5erXsOt g==;
X-CSE-ConnectionGUID: nA7KKdCTQgae1a4l3bfv6A==
X-CSE-MsgGUID: W/QZvYHGTaGIvUtDgLGjAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86781215"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86781215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:08:23 -0700
X-CSE-ConnectionGUID: mmC/8QkyQuKBfpudT3EJcw==
X-CSE-MsgGUID: AV+slJ2NQpO/yKStWBP7vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="267692406"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:08:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 13:08:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 13:08:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 13:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8rPsnhK6fdmqkoBC7Uq3+FTB2WLAS+F87I5dsvCyoiIXnBvYEgZIrRJW9t/5zRTX+3rKuIIyuDJkjg70yN3n4G3TQMe0i2Q8+RAczkDUQ/OR1F32auuEUouToZJZg5ZIUXfMCuJu22RrNWVezWpMZkDVF80GpT0GGB6RAARjDg+6WzhNkhax4zd1NijIC4XVQzFyRpvd4owXhdJ8jUf5PWBRTIDD5l3gW/wWcg9cx8mxId5Y1ylFeVNUGooMYqPzIS6oEg33Q4omzA2WCvcRtBORL/IU6x6x4I470qVTm2nO2NSJe26z2DSM/vY3sQPXhx1xoUbwsw0/f7g9XvY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES2/PugfeYS8wR0HphcTqC5GMW80JJgFDSB9LhdFrbo=;
 b=KyZnidUauPYKBrPzIBLUE14Fkwiea17Jd3veope0BThhDnjew2mly+23wEwk3Fol+BneYqNSJXojWXxnCMG6cB03jCECCUoRo2XtJs3oQnLIyfLRMZ+7v6g447KqPpWGPR9qpqLiy3fDTdoAwNbGZlyhtPn3uSgcklXQY5oL0DDDHTDC5Y6BV1C4ylT5Ov7pLatpssQkHN8kyxZslphI4+clHw18Q2/FTBBzuEP0yke/udmE1fyk0M1KbuWbWF88U1T5p43n3WVAFVdAxCsXcIXC7S6HInL6XTFYCkZl1ahJDGQ7BJceoKmDdIueDZUaY2ChhjxyyFMwKuaq1Hvv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS4PR11MB9601.namprd11.prod.outlook.com (2603:10b6:8:34a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 20:08:20 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 20:08:20 +0000
Date: Tue, 11 Aug 2026 16:08:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, "Michal
 Mrozek" <michal.mrozek@intel.com>
Subject: Re: [PATCH V15 13/14] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Message-ID: <anuBLhouGcnw_rUw@intel.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-29-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811124016.3614699-29-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS4PR11MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a7b49c-2bb2-490d-9f47-08def7e44a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bWHbDiRo6YS+kLtiNocp3DSqlgclfoyFmDZbsFV9HfzPssXD/xQpiUKyaG111wlR9oyrViyPi+tIBwif0lzLhyxKyNRqCtTgblgPD8nlWYdFkAYzdlsRsCxDrAX+016dyjDdEXHhgMH/XLK4hTdc94MecSziB+FB3sD0assCUqj8+9l9sP37xWTMHxbfkxdpUA3HBtaaoGnPwdMCb1SHn1JboZXvhExxZCxDMYRGTgv0BDewAIw2SPwcwYkrCXEe2WGNhrNlyMAABzKxtb70H6aBWmPKM7OSV3rt1bBeKFJ3z/WOFAg+eKTSlYpcMiizGjJn0Rf38mt8kT8iMaw8iBcE/QldqupJLNKAuneLGJwZ2m1hpsIJPCwOhF3RaTVi7/j44B9U37SR7KWB0t7DZcMftP9yUeS4z7rBpt3mtUXUgk2Upqy72okyXZUwyx1sQF5rYw+Aa+WnOLjFvlLqUR+KfYPuhjpE6nCFBqEfAP+5h8Ha1Hkm8cp2iRuU5EGDzTsj2SP9phByArvYpHF6M5sG6I9w6pg8OYeCtpfhti9Uaj8F7hioHNvTQXttR9iTfmXMnqOn8tnmvkQKOZuCesQ1RFGveS118V1OLpBTBRVA0dA/Comrc8WT0Jgs9Dom8UhjDtznpcEPzPKnc1yLf+/aS5SEmYFtt8siNMuL9v0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oT7bYLfkXrVtpkEcQc1EcCmB6CjX4dgF9K2Zgjk30f2RNERynxhIAbLEa6?=
 =?iso-8859-1?Q?lH4nXuBmHlDfFTVgmYZdjrPZ8IOC0WgpsUqXM1NyiIDQ6/2sx94ViSUpbi?=
 =?iso-8859-1?Q?xlTwmMD8pQcL/yxFZsg5FCwZmRafjSuBDwYyU/B3okhjRoOlS3FC5O9K1N?=
 =?iso-8859-1?Q?gN9P8Kxw1bshn75qQ5QKhpf0wCadE2UxzlvSvUAIHUe6XriZSmd2OBOuY/?=
 =?iso-8859-1?Q?FMNpwc8l8yrp5LqRXp41lU4V1E4DFcYKDNo5AdGp0LQChAjH1hn9o2jh0g?=
 =?iso-8859-1?Q?vuuSxQT1K7kKttzBLPiR6DI8HN21SzWhLUPRMtQ8UOd2TM97ET/+TtbmMB?=
 =?iso-8859-1?Q?gkGgLcwbi0BIVxFYvAbglJefeLdUOWLzjroNlrZ3HqtcgNPHjxXLpJKw4E?=
 =?iso-8859-1?Q?vQSZYOg6ER+Bfjapa5TFiiv6BfVpsRr0wXXsbrtJ7sqiOvYl8hAHanucdz?=
 =?iso-8859-1?Q?ZY5CSiW1cXmkaJzu+8QV/s1yoTS5gO79vMmEnjqsUjqC6+OKhYPIG+M5du?=
 =?iso-8859-1?Q?qF1tMswLHRo++iZCPoTwV3cYm3NEu9s/IRF5HqKF0vjRSk6Dsub0CZoISQ?=
 =?iso-8859-1?Q?rlIc6YYk/d0PJeK2BWnpqJRypCp5ViS7KJ1ASjMWE1IQqQNcZvtY5ufTY/?=
 =?iso-8859-1?Q?2vYe3QzoXMvVtUMHVEQJC/Pn1h9BuswVOMQlws0B9TEsbXv/Md8mc3FUYN?=
 =?iso-8859-1?Q?7p01cBcoverVePLoirKIv7uXo/mJRQNxRr6ks6TdkKssMEqtkBZ2mjEPkR?=
 =?iso-8859-1?Q?z38TgiDg3d+cII+j5WYGU12NOhLv/BiYhUJmU/+3Sd8uKvjPdVuhzmxxZy?=
 =?iso-8859-1?Q?xgzwz3Gx2qyLTGII7VlZgySjbV6gx3/nJ1OUua7RO+2KNLOB3Y+zhS1vnm?=
 =?iso-8859-1?Q?7WH03mcl9ylqQsU4l7wnoTjcZtnx2zpHdAkEwsiJFd1FBYQ4S6HdqDbQHP?=
 =?iso-8859-1?Q?4zVPYFelfWX6JGNozuqI8xbrr+lMgmk93spgZeVZs4hLqAE/Bw8DukLhPO?=
 =?iso-8859-1?Q?9FvhykYv88PwNeAJffqcTyQhJxUt+sjzcFxt8GTg/D1Ks1cZ5tofmHmtoH?=
 =?iso-8859-1?Q?qEE7YLSpCs76JqRLuIWIjp9d2MfThms1JQPRI77uQH4I0kvgHO8zWxvjuR?=
 =?iso-8859-1?Q?BednO3NH4UWiz2cYTIbtgS/whrSYerCkQnHFYndQ46DN44eiUfFSwu3u3T?=
 =?iso-8859-1?Q?xXIgTv+QF18njbMaM0O7rJ4O0Ke+J51kTwGqQ7/vTrCtAGEXneY7pYxGYt?=
 =?iso-8859-1?Q?ScuJfc4EPID4ZOG6ng22i81HjhGqLJgW7EspSxq1SeCFGx75I5IeIKqw0m?=
 =?iso-8859-1?Q?7HNA7uVLdfx7w+5P6jNlkYoBh2yP3ge+CUMxd248ubcXpJCusFDxp6nfiF?=
 =?iso-8859-1?Q?oF4Nw+9Qz46G/JffnxVMApXJ4jovfmDfpXfhfW5nlhNnXkupGk86cRmVwv?=
 =?iso-8859-1?Q?KLKmM4BaCEG0KRQxSyG2xxp+uJTODhSfwPgif7GYJmN0dd8epWisfH2Wdj?=
 =?iso-8859-1?Q?g+kKNGmh+BRUlGuNpKXTc6Cgw9GWJKRi5uR85/lTDuEm8SAkr6FZLqIiQ7?=
 =?iso-8859-1?Q?a5qX6uc0ZEaVY7ZdqwRyS0Fv4LIzCiEauGUZM9uK6Gtm3hidg+WX9VdyBI?=
 =?iso-8859-1?Q?MZUwb4fBvWS0x5dUumkP90WnjrGzYrB2ZkIBoCwV1j5IILtX1oL7HLB+ZX?=
 =?iso-8859-1?Q?/xLVUjpOZ5pWUGyLWu+tILDhmOplW+xsIuGFHVehiJRpprYutWlYc+uXuj?=
 =?iso-8859-1?Q?nwagNAQG5eccaYS+154ocjSrTVRFff58FSUmSzb0VRT2A0N7HA5t/bT5yY?=
 =?iso-8859-1?Q?9VnXTNs2vg=3D=3D?=
X-Exchange-RoutingPolicyChecked: SRPrjvd589HzXWTyOB4QPmDOD6RnLKTw7N/L4g1ai3Bove3+LwPyuo+S92I+TH5yHMKlZqtRAVc8HITkkZO7PTST394yO2NxCVI7MFAm6+2ycuRzMOS/Ck8ODE9v5MxWhsrhzbPMB/+r8hwnffWFFAusCKedVTsWUUH/1zqXizJ8yxZadsmFX1w1u2lZ3GDf07HVrb5xqpVoxWVgFJiWzQGwSicUTX2egPAl8blw3n+lWZsCKDYx2W2yua7+X2Nf1v+gkSVfLfTNOV18Vt98ovMof7CPh/nrBznoqTbrMqmGdewHzWEqR7Y9wAnyPkILTtnIApqJyCFoDepXAWOHPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a7b49c-2bb2-490d-9f47-08def7e44a0c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:08:20.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPsNpqbUqfBusAGizKInT5GGIn6jQPQXZ0IdXWgJnGaWgHYo21nnvEy9ES0XDU7p3pSfoLRAdDWS+1AIztxwFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9601
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

On Tue, Aug 11, 2026 at 06:10:17PM +0530, Tejas Upadhyay wrote:
> Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask indicating
> the reason for the ban, rather than a simple boolean. This allows
> userspace to distinguish between different ban causes:
> 
> - DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec queue was banned
>   due to a GPU hang or job timeout detected by the TDR.
> - DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec queue was
>   banned because a VRAM page backing its resources was taken offline.
> 
> The ban_reason field is added to struct xe_exec_queue and set at the
> point where the ban is triggered:
> - In guc_exec_queue_timedout_job() for GPU hang.
> - In xe_ttm_vram_purge_page() for memory page offline, before calling
>   xe_exec_queue_kill() or xe_vm_kill().
> 
> The reset_status op is updated to return u64 with the reason bitmask.
> When a queue is banned but no explicit reason was recorded (e.g., from a
> generic CAT error), it defaults to GPU_HANG for backward compatibility.
> A value of 0 means the exec queue is not banned.
> 
> v2(Sashiko):
> - Use atomic_t for ban_reason to fix concurrent updates from TDR and
>   page-offline
> - Guard GPU_HANG bit with !exec_queue_killed to avoid masking
>   page-offline reason
> - Clear ban_reason on queue recovery (clear_exec_queue_banned path)
> - Use atomic_read in guc_exec_queue_reset_status for lockless read
> 
> Assisted-by: Copilot:claude-opus-4.6
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++--
>  drivers/gpu/drm/xe/xe_execlist.c         |  4 +--
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     | 10 +++++++-
>  include/uapi/drm/xe_drm.h                | 12 ++++++++-
>  5 files changed, 54 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index b2276559c2f6..a21916359e2f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -156,6 +156,9 @@ struct xe_exec_queue {
>  	 */
>  	unsigned long flags;
>  
> +	/** @ban_reason: Bitmask of ban reasons (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
> +	atomic_t ban_reason;
> +
>  	union {
>  		/** @multi_gt_list: list head for VM bind engines if multi-GT */
>  		struct list_head multi_gt_list;
> @@ -350,8 +353,8 @@ struct xe_exec_queue_ops {
>  	 * signalled when this function is called.
>  	 */
>  	void (*resume)(struct xe_exec_queue *q);
> -	/** @reset_status: check exec queue reset status */
> -	bool (*reset_status)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue ban status, returns ban reason bitmask */
> +	u64 (*reset_status)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index cc33ae80e8cf..534e7c4e0099 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -452,10 +452,10 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>  	/* NIY */
>  }
>  
> -static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +static u64 execlist_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
>  	/* NIY */
> -	return false;
> +	return 0;
>  }
>  
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9036f89dff7d..f52577de1ac2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -6,6 +6,7 @@
>  #include "xe_guc_submit.h"
>  
>  #include <linux/bitfield.h>
> +#include <uapi/drm/xe_drm.h>
>  #include <linux/bitmap.h>
>  #include <linux/circ_buf.h>
>  #include <linux/dma-fence-array.h>
> @@ -1593,6 +1594,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	if (!exec_queue_killed(q))
>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
> +	/*
> +	 * Only tag as GPU hang if this is the original timeout, not a
> +	 * consequence of a prior kill (e.g., page-offline).
> +	 */
> +	if (!exec_queue_killed(q))
> +		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);
>  	set_exec_queue_banned(q);
>  
>  	/* Kick job / queue off hardware */
> @@ -1676,6 +1683,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
>  			if (!xe_sched_invalidate_job(job, 2)) {
>  				clear_exec_queue_banned(q);
> +				/* protect concurrent page offline reasons */
> +				atomic_andnot(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG,
> +					      &q->ban_reason);
>  				xe_gt_reset_async(q->gt);
>  				goto rearm;
>  			}
> @@ -2570,13 +2580,25 @@ static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
>  	}
>  }
>  
> -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> -	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> -		return true;
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		u64 status = guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q));
>  
> -	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
> +		if (status)
> +			return status;
> +	}
> +
> +	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
> +		u64 reason = atomic_read_acquire(&q->ban_reason);
> +
> +		/* If no specific reason was recorded, default to GPU hang */
> +		if (!reason)
> +			reason = DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> +		return reason;
> +	}
> +
> +	return 0;
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index c22669955147..5bb66c7b5505 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_buddy.h>
> +#include <uapi/drm/xe_drm.h>
>  
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
> @@ -541,7 +542,12 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
>  	xe_bo_unlock(bo);
>  	/*  Ban VM if BO is PPGTT */
>  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		struct xe_exec_queue *eq;
> +
>  		down_write(&vm->lock);
> +		list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
> +			atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &eq->ban_reason);
> +		smp_wmb(); /* Force all queue bits to be visible before killing the VM */
>  		xe_vm_kill(vm, true);
>  		up_write(&vm->lock);
>  	}
> @@ -553,7 +559,9 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
>  	/*  Ban exec queue if BO is lrc */
>  	if (q && xe_exec_queue_get_unless_zero(q)) {
>  		/* ban queue */
> -		q_to_put = q;
> +                atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &q->ban_reason);
> +                smp_wmb(); /* Force bit change to finish before state change triggers */
> +                q_to_put = q;
>  	}
>  
>  	if (bo->purgeable.state == XE_MADV_PURGEABLE_PURGED) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 509202a7b13e..1600e8f0885a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
>  	/** @property: property to get */
>  	__u32 property;
>  
> -	/** @value: property value */
> +	/**
> +	 * @value: property value
> +	 *
> +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a bitmask of:
> +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned due to GPU hang/timeout
> +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned due to memory page offline
> +	 *
> +	 * Value of 0 means the exec queue is not banned.
> +	 */

I have the feeling that the documentation result will be better
with this block documented above, in the struct doc, along with
the property value.

Could you please check that?

but the patch looks good, so one way or another:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG		(1 << 0)
> +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 << 1)
>  	__u64 value;
>  
>  	/** @reserved: Reserved */
> -- 
> 2.52.0
> 
