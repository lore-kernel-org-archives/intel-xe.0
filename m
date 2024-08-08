Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162CFC52D6F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E5A10E630;
	Thu,  8 Aug 2024 03:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AL0Ewm1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F51410E630
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723088831; x=1754624831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hbSQlLTVvMiniNQjPtBMYCOIcNthyGGaMPW8IxvSGA0=;
 b=AL0Ewm1vYnyl67nnyjIOoHugQeH1kqo8+dkMi5KAjKlu85Lqig93k0gR
 3U23ZQvpKank6rYqOnHYqUquksucqbSkmFj2me+m3FQnMOqC3LzyOyH7L
 7V4VB7q/7BgYTy3RBNNYJ31Jfe6nYedhGruCpY8XoiD65D/++fpdyazDu
 gHjWHYvRT1hMbXdoBsW/vqkfnkPvyoQEGYSn7N921xOjMi9c9H4QOkGGs
 u51Fh2q5L+Ar2MCAXaIGKnrlxGamdZNIuvwfJSViDf619tOS/k1csf/8D
 SwONHlKjrfispthknR7APRKQ4h9eHzeMGRfgXWiB/Hx8ndAE18l0wHhcm w==;
X-CSE-ConnectionGUID: mtfVCQXDRSeJaPcsthq67g==
X-CSE-MsgGUID: bK6VQ4QMQbm0qcTZt4rfzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31768973"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31768973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:47:11 -0700
X-CSE-ConnectionGUID: tP/gatbXTTukQmeSKlRYYw==
X-CSE-MsgGUID: cyDKuVwNQDCruNT4U7xgWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61732139"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:47:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:47:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:47:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWI+LR7d4Xolu8vZnDCheNxDP9++khHywzbOCbNvohLx1sS7bpy50k6spVkh9814KdCzcPtbAq9KllRLWUhezcCss+MJeopr82HIO+6/RXb5wJ/hY+XyQOjo6T5La9Vzif35m4CfbFreNS44+PGugWymLdgzJ7mv9x6hodvhxr7UnircLN4ZXaHmoTf0jjo8wpQ02yNfEGtwkmJyEtpGHVs8JCbIy77EWU++hKl5RRlvTI91eAk2mNkvUB9IzgiQTHaF5st2fJIUvkzRW+fndkNjXVXrTANLmH65Fx5qy7s1t2K1qTqKDj3fml89MEngQQm0mju7kp5X1/PBmmCpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5OvWuhwd+AaJ3HTzYvCmTA3fD2egSSxG3Z5hInEvUo=;
 b=kQ7fhTs8MkoXOaXSyNJAbwAtQTI2HtgGySgjBBq5xBYga7nR1ldbkBUHz/b1goZ8CafGkFJBfC7oeILAzL72gl22THCc6ZW1+eB/rp8IPIZ/HmKNEqjdey9yCks29iEFNuhqE40qHjETFjibW5a8SLMLfZaEzdDW1UXmYvsGYpQ2EtCH/OXmxaqlo1mSZZ1pVWXM6kNonVd2eUtDdSs8c7+O7YjEkjPf3zQfczklhCZed2ZLvOrI0KwD2qZGYBckSVnRMSBhwYCBlnYMGxAirfj/UFpU5dRuBHpkEm2kzGA28WJDoCMR95z8GRTk1BPdJyRvxmMv57oIzFHg050dEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Thu, 8 Aug
 2024 03:47:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:47:08 +0000
Date: Thu, 8 Aug 2024 03:45:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 13/13] drm/xe/device: Remove unused
 xe_device::usm::num_vm_in_*
Message-ID: <ZrQ/bYsqaJyiYSOP@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-14-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-14-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:40::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d1f986-c60e-47b6-7a84-08dcb75cc6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jK8kFYD7IxDP2HHg1ywOyUG019P4ThaclDffCpvxjN4K5WFyQQMi87bOqLQo?=
 =?us-ascii?Q?+u6d6hE7Ei/xyghC/mis/WVD88k7e9b30q+AukqEPyJ6/D94Gu5DNIdoJBWa?=
 =?us-ascii?Q?qwkJLLg4BOhK6OoOg42sHkc86Aj8auRROsXZBzpbSu04pHz5e1p+XLFbc/f9?=
 =?us-ascii?Q?1lnaOl9eTmMqxfq3CXXNdHUtv4rAPK9KkoFDIfyhBpEpUJDoLSDXjuvmpCEg?=
 =?us-ascii?Q?Sya35AuJiw9Lr98Pq3MU/Vghv9jqRzBICGuf6Ge7L/FxMHTrmgAMTYuG6BNJ?=
 =?us-ascii?Q?+QKjWqstXBHyfCSVlDk54zU0nYnNFF6kNn2CJYp7BkfWjIi7VNQXfv1Znm1Y?=
 =?us-ascii?Q?WlZW1/XUMsDqwjfQJ/+A3RoaiA9ue5rDwR8oVxIw4IKjEPFYHuGOEB9mj3pe?=
 =?us-ascii?Q?XTF7pM8bxDwbUwcDb4q1RuJbPAgd0pcw1g7P3nHo4nhJuwns4f4HyPng6uCx?=
 =?us-ascii?Q?NqBlQ8i/jSsyaHhnnmAbWnS9304IMkResULrq9O3f/mbPhxZ34NzFtu1rM7r?=
 =?us-ascii?Q?5HSWm2BaUOuU/HY2KRJ60PcCW4XeZ2RfwZtUesMIA1cY7ntOIb0ZPYNJT19n?=
 =?us-ascii?Q?M3zUi8iL/kCAywUCwZ/fePwyk+XPd8J5kJWDYaTvgvRn643pv6lCuHYNg6YA?=
 =?us-ascii?Q?9tE2nLiDYFSfw85f4D4e/o4HazLuOkQJJsJexOOx8VlzSYmxaxfHuxrJdY4O?=
 =?us-ascii?Q?0kkeaLPZae7v0ZSc0IqnMlRHSI4izuRi/JHq7AcTPyv8DfLAwaXxVdwp7gX8?=
 =?us-ascii?Q?zv1K5FoSlL2SFhNiFoX/G+3Qma3Q0AhcyXYYLu+YnD63s/DTiaJEO8bU5wUC?=
 =?us-ascii?Q?E9K7+OhOwVWkP3knUP2OMdn8Og5KkQcG7BLAvdoFVM9iqZCB6WBeJGBbMJDO?=
 =?us-ascii?Q?CRzbZvG9uF1qjwGRN9aBhOwC6sFi6nBdbocSgmO7kpugKLO4IcuqIbFG5iTF?=
 =?us-ascii?Q?U0/vX37qps9Z+M6psJWMJGkzA/8IRxfruPS9cyRwhhdaFZuT39felT5onowv?=
 =?us-ascii?Q?N09jV1/jPDaMxSj/WtsyhjFE8YcZmsLOGJzJ5EOqpZzG/WW7UNz3WCDef/Iu?=
 =?us-ascii?Q?XaGk5n4TRwC3TIB2U3rbUoEMf4a/TLijAW0SGBrY6aF57ozerTsKr2zeyQXO?=
 =?us-ascii?Q?/N0GG4rqh3N9H8TPFeO+OE3jbWmGc11US7BsGPU2AuzWiF629rEDaRbzuyKU?=
 =?us-ascii?Q?UUd25+lnLn6geGXXmaTK4aadgtji4TWH9RyHQsw6r2IzDKb83KZqeJej9nzF?=
 =?us-ascii?Q?s4E7Q+IJhgLeWaOcjuUjbqKkwDhZgSqVUwqhDuMgcbHxxKO8FmHcHR55Cy5u?=
 =?us-ascii?Q?ua/soKik0feiH4gMgO2sS6dnqRG4Lk8ReBUPo3L7KkW6kA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K5jUwsdEx7hFDWBf2lUB/30/sotPFjvWhGgLPXmc3yk6o82/cK5g5Mi/+Phl?=
 =?us-ascii?Q?a6ZJd0VjAm9nTzhDTHgMHq/VPXFM2ubowBhpFvrMOYVIWyRr3pFlIqaa4oyP?=
 =?us-ascii?Q?F5W+rxDD1wKsjHzC0MraRoGpYy2Q/rbiE2yu+weUTQ7+HR5EM1eyrMEXTM1F?=
 =?us-ascii?Q?uP732v5wYDclE7HtRQuZKnqjzsk2SXigDbMOL/3tXMZMM+gPnofysddZGK+e?=
 =?us-ascii?Q?fwlE5rtYpfZYwQ4CsDCKqzZAxc6Bko9VC3iTgWbSaahVZScThQ937VF1wUC1?=
 =?us-ascii?Q?jpN/Vu3QvEw/5siNd1+tbrxXhGKB/AYZtyfU2BMrvwS+Ddwdh3Sb0iCjkgBs?=
 =?us-ascii?Q?uXDQDGgLss4H1OigXnwwkHEGEfaHba4k9P7/4L4Ms2uAET1H9/0tZWHyS9ul?=
 =?us-ascii?Q?mIFBG6E9nHZu0xGtpGWAGZfHuAiOr86LqswXsoeA96oNG1nCHMnB8zYt9Hla?=
 =?us-ascii?Q?J1Unq0myftlq1HqGkd+y2qO1SGXuR5TKINf7Dvm4E92sJ1puH0YyiACZ7CXS?=
 =?us-ascii?Q?f+xj89wk8dXMn0+w74vuUINsw0hfQRnuZl6sRIiw0suAw4LifnSEpyi4o0aE?=
 =?us-ascii?Q?o1UMTmLolHf22Jf+SMQgIlQZ2mXBGqZKjJsDMOWCoJcH9Iwpz8tTGZseqehK?=
 =?us-ascii?Q?9pHDbyTiDdezrXnNDuZ9Qw0KPXduU1mvPnYDKn5f9QQt+I+sZ72YMd43HbAl?=
 =?us-ascii?Q?UxqCMCFtAvQUE/gKb+l1LYHwwk3dBZ1gfKxZX+dQOzBYjd16kqUWaSwr2EZX?=
 =?us-ascii?Q?5+prkC+bwnxXFKSXpJ71LMweJK5VXq5zyz9TcccpB4Fr5zTLgScC1dsJrHHu?=
 =?us-ascii?Q?AAUcQf+pj6/yVGM3ZliBKj9f36TrCKVHlctl0v4X81N30ADkE0BMMcRXPcVI?=
 =?us-ascii?Q?k5rz2GfHt3V2D52OxjJBO7GMUJ2tAzIDKGbv/ho6tsgOCmHNZXOWsFKTyjjt?=
 =?us-ascii?Q?Z8ZH5mB8AxVMyCSyV8vzf6jYkJ2szpoykB6BXAMS5mM8AhbKoc/obSjEZ8Rz?=
 =?us-ascii?Q?UVd0Hl26+78mPM713a31TsSpA49K3dZpTqnSCqXzyC18HY5nZFEaCTMFKcYN?=
 =?us-ascii?Q?F+TlgVbtcWHGiVw5e2aFaOBpWHAi/bIbvc3atCYIPEd4cqlcKUXxMxQVWP5b?=
 =?us-ascii?Q?9sc5dw4t6lTAc3Kns1CRcPfIEZdAbQWSLcVgrsvjECIb2Op+6vohRMch8Gdw?=
 =?us-ascii?Q?30oM0K4gzOpVBsrrcPptXOJvWkhc5hQKRPsbv8kgqdnUtlVuaFwQzbL8Fm+7?=
 =?us-ascii?Q?U64xnTzbupHlXP75Qul5rttKp2XTsWCwVzjCSuckWt//NsJc6ULjR2BK/VMa?=
 =?us-ascii?Q?KOB62eZouDqyMKBmKxEHh3BAtldI96tx9X7svOiU12QLdaDoUucxKAuMzNfT?=
 =?us-ascii?Q?XDkOmEeBx3vGICGVr4BvYXGrzWGKnJvzdq+NRmlbWoE69Ub+u0IZHnD/Lm4B?=
 =?us-ascii?Q?nJ6U01bs0CbZv6wOTPTsfNFRZWngsBH4AicvSc8gWsyeyTFCLl9jJflPMMVe?=
 =?us-ascii?Q?KW0TmqGqKmdfnDM1DjroHOnr3cwZ0Z4d9Su1JoemsZN2o/x4TaruMqawxDhr?=
 =?us-ascii?Q?S57GANI8SjFwFEEsl44CYtAwa+YjSCwjOnjyQsKyKuVlkbpeZs8yeaXXXUNv?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d1f986-c60e-47b6-7a84-08dcb75cc6d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:47:08.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOly70V4lbI9gfQTDzPUPLbDh/BqbH6zF1geuxBC6RL2UpoSuCuVJLcy3yQ2bHHOsnOsdb2LLwEUA/HshtKsTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On Wed, Aug 07, 2024 at 06:23:42PM +0200, Francois Dugast wrote:
> Those counters were used to keep track of the numbers VMs in fault mode
> and in non-fault mode, to determine if the whole device was in fault mode
> or not. This is no longer needed so remove those variables and their
> usages.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.h       | 10 ----------
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ----
>  drivers/gpu/drm/xe/xe_vm.c           | 12 ------------
>  3 files changed, 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index db6cc8d0d6b8..5551912da74e 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -134,16 +134,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  
>  void xe_device_assert_mem_access(struct xe_device *xe);
>  
> -static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> -{
> -	return xe->usm.num_vm_in_fault_mode != 0;
> -}
> -
> -static inline bool xe_device_in_non_fault_mode(struct xe_device *xe)
> -{
> -	return xe->usm.num_vm_in_non_fault_mode != 0;
> -}
> -
>  static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>  {
>  	return xe->info.has_flat_ccs;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5b7292a9a66d..5fb39d991167 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -361,10 +361,6 @@ struct xe_device {
>  		struct xarray asid_to_vm;
>  		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
>  		u32 next_asid;
> -		/** @usm.num_vm_in_fault_mode: number of VM in fault mode */
> -		u32 num_vm_in_fault_mode;
> -		/** @usm.num_vm_in_non_fault_mode: number of VM in non-fault mode */
> -		u32 num_vm_in_non_fault_mode;
>  		/** @usm.lock: protects UM state */
>  		struct mutex lock;
>  	} usm;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7a88c65759c9..d2001a08084b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1508,13 +1508,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	if (number_tiles > 1)
>  		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>  
> -	mutex_lock(&xe->usm.lock);
> -	if (flags & XE_VM_FLAG_FAULT_MODE)
> -		xe->usm.num_vm_in_fault_mode++;
> -	else if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe->usm.num_vm_in_non_fault_mode++;
> -	mutex_unlock(&xe->usm.lock);
> -
>  	trace_xe_vm_create(vm);
>  
>  	return vm;
> @@ -1628,11 +1621,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	up_write(&vm->lock);
>  
>  	mutex_lock(&xe->usm.lock);
> -	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> -		xe->usm.num_vm_in_fault_mode--;
> -	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> -		xe->usm.num_vm_in_non_fault_mode--;
> -
>  	if (vm->usm.asid) {
>  		void *lookup;
>  
> -- 
> 2.43.0
> 
