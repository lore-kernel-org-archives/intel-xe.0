Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EDCEB3624
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 19:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E32A10E5B8;
	Mon,  2 Mar 2026 19:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwlFIpOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850210E5B0
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772481082; x=1804017082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DITguC40NMFA0yzptupi9ifbNCt0znQo1wP36J5jNGE=;
 b=GwlFIpOs+kgQN0kBOff2Gf0SL9o5EzbITExyNnwZrvwJq6R/cqqD8eT+
 uYfpSu4ES82I7ET8PaEvfXfGH2ZQlHz3D0w8lwQZbMS5RSHxTl0Hkvqpl
 IQDWXPf3es0FujLYhSiw8RQSTSiEa4jlLPLE0ZYbYQlfP2xIk3mk0+z18
 hTTbuCRRFQ7gD0kqSBLORvyQhxtxE4LFvSTp2pw3F5HUk+7FHf0ZcRWAF
 fsbLPHbxmic50m0v9usv5GEuwjjMMqe5e0Wg9MMmJ9pL2uoQXdqRXQul8
 Erpp5hqiFF01oTRf2Wo10xJNfFp6xzORqIqeYGwXMNMly0F4LEGPN0yNu A==;
X-CSE-ConnectionGUID: E3R9M4vtQMiE7rnDQEAQFw==
X-CSE-MsgGUID: V5kzpJUrQfG8wUMo0C9Mww==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77114450"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77114450"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:51:01 -0800
X-CSE-ConnectionGUID: 7cSpr6EPS06+tLJfOfEF/g==
X-CSE-MsgGUID: ToXGBU8QRLW7IeDNiF08mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="255620877"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 11:51:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:51:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 11:51:00 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 11:51:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcXbIsSm7Ve4ZuhcqKeAqlkmyNJKgeWJMUXt1oC8daHENDeJuicNpfNfDBleTjNeAKFD6LrrwXVju3pU8R0Piw1YgmByYRzY091mBEAauswHoyDsBYI3laCyg59xIgGVmSFLe2jHNoP3hofSueaHw417DgT4En4ds5t6nOVpjZb0C3//Wk+tHSi++fGMini6Rz/5ucLguu3v3AHoousi5YTsmPTWSH2+Cw3+fn0FLVGmREglcIat4vQt1mBeGLCMSIUhW+Gj+WB3nbqDWvl4gNnScEUkhvly8c34o4kjYSzJKdr7kl9cLIxMdbSvmg5PCTfu8wMFSiqJow2/GgSrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUr0KKPmSyNtFnuF/ojxE7gwh33tF0RhnlRlw62Xu0k=;
 b=IjYygy11Vahh1iS/FiyxXRag4rqb4G/VPUSZ2J0yeR2jAO+dK0JDB0EySour97XQhe/QUi4dS0JeXpfJdX3IatzsokbUHVleynPzxRlcvpN92911EhUD/HtWZ0Jb+D9Wt+OG8hnryTseGmlNIaVcDSbDsGXefzKzuv2muCua1TYPNeuSNV8fHd1zviWkSYy2Tx9Gv+3dFmlqNcsrosD4G4K9oze0/iqGx9tBHKvvTH4eRRhjo9leehZjEFMtlkf772+vnA9Ory8WE7kQjO+tH0hKrO6GFNMVpWjIpB9BU9LKcx3PaHwlqp37HkGc6nsepMDysxATp88ZtgkSWeE4jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6408.namprd11.prod.outlook.com (2603:10b6:8:b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 19:50:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:50:57 +0000
Date: Mon, 2 Mar 2026 11:50:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v1] drm/xe/lrc: Refactor context init into
 xe_lrc_ctx_init()
Message-ID: <aaXqHpWezRG/DYTW@lstrano-desk.jf.intel.com>
References: <20260302082757.3516577-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260302082757.3516577-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 82805b56-6aba-4244-3f24-08de789505b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 4D3NeDTzzW3tTiuL//XX2zlxBpEs8BnxE5APJ/bfZZE4uVjXWr+Ay0Emi2+W3Pj3Z6cvz1nyeTAyhKwjO/SPS184NOCZf0NBRBAvrA3rSeX5H5Y/d3/7WA1wwwP3yNdZpedXenvYxRB8eBCQU79V4IQdZ8+bhiZDb5grjXK0ZKHzFZyiWGwyjnHHvDNAS7qJz3k6X8clNBLlQhYhwaE2HCPFRxErQMsnAZ7xnlL+bEyfghvqdkBe1wUEpT6s+dCEh5+edhrIj0wSAUYfYNA641EoSKzDt2zOUm+CWxLkw6OcOUoQ9Cpn3AsNoRWBq6Fhag0IapzevG8IXXpxV012EyO3toN9KNX4XPSm29M2UDGTQhHZjUEAtDhGjhs2j7Y8EjHb1tUTzJ5qX4MagWER3zQts44V3W9aJiDqGRBXE8QSsWOIAHZOO95EDGaw1m0bwDLnZCYEcRKU9DJaE3DrDRp3VeSbjNWqwmcqdNJz4H9zch/SSKGa0GvyfkHgveqbU/B3yKL3tqgSQdSfP4k82N8KrAeryjEecN2zAcIuJ8Xm5SsMd4EHY5bfaUZO9YtLT5vyO5EGkNDnbywsEgLlD6J3BCNHAiSTna4Mv7MZz3CBgyZ92172dLyssRU4ZcNC+qF7eZSnvjyLF7Jj1TQdf1wGjKY67r9Yk9YQWkCg5HHFCHKsR2OmSDtdUU8s7mxSQT+6NFMYWuvtT/02Gve3DtsM1mcrOUxc3bDJHISrq4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fy6ZzGKt6GVqhKuVgWvLg6IcQzvj3LTgNsE3e4scJO+HMIUm1bwsyEXOAKFq?=
 =?us-ascii?Q?YfZZrIXfYOosdKCg+9xjt0ygMCX2mZvwTn/+eVwDlMkFonkKtdGagE67MfAr?=
 =?us-ascii?Q?Kop9Td+S9Fs2EREIwzJLl9nOfHe3lQ4PFmPaQRbOkuXpuY4WFVCYqBURI32Q?=
 =?us-ascii?Q?+b1sQHR59LbFjw9KRdzS4PgP8MR87gXuGmc7TideJQ57JMbcQeygrxLoVyZH?=
 =?us-ascii?Q?3sVIF2rsxJEmkdCIji3zH9fxualtA2ttlFzSafAJldce6uXHLvvKIYuK/3Er?=
 =?us-ascii?Q?+VB6CGwXgif5niRqSJ4At/gIME4nSKnXKe4YuULhFkhJcgi2UqpGDx2AgYUl?=
 =?us-ascii?Q?swXsPsIYAjZR3mtE/jBRKJeSSEGJdJHLk8v4x5HPflMRpNgOAUDezqV2uoqQ?=
 =?us-ascii?Q?L4PRVBW+eXBq38NXWmii14zupUQozNLTFXoQz6u/bPkm4o4fXZhuKRpttnx8?=
 =?us-ascii?Q?5QdadnYb9rBeZFY2Yqn98/nA0jUiXvsOjjtctP82seP9rtKnk0HC/Mxk5Glp?=
 =?us-ascii?Q?VhF7XSPqvYm/xiKhuEvFVlGnZTUykDXNrKWrSCo4BAHnYEAhAQ214CkCPRFV?=
 =?us-ascii?Q?BMyZJY+tWyE3CcSDi0LcGIAtp4RNSfyCQRu0r15p7dhy3OI79PUlQiEp6sur?=
 =?us-ascii?Q?93ZmyvN3MD2+U9CLbCzptuxcQm8+wLRfV66MFUuokqX9acCwXYacjCH0I9c6?=
 =?us-ascii?Q?DR938crMNmtgY3f+x7OeXaS9jzaVRNc5esGS5mcl2fVbjjspfKb74zGuXrom?=
 =?us-ascii?Q?6Oh+P65Af24Iw9q7YNWLHN9nZ5+QIMfEBEjLFvXikMDc4Ev95JIUtAUk7Q4F?=
 =?us-ascii?Q?HbIxhkinVjeFrl2Eng8bMBN8hkXuQxGVxhNQBCozp1keMq+W30zmxguaA50F?=
 =?us-ascii?Q?LqQ9u2J8mqjH+r9yILrox0wFolewXZg1g9uFR5ZlN3nDGYXMxGjMqnW41h63?=
 =?us-ascii?Q?jz4BopnQV52iTOHtka0L1/0Np+HlWjOsfSw/PzJU3YPRzHABV3VxMG3L1f9U?=
 =?us-ascii?Q?+iZJ2z1us5i/FZB+zXX0lrgBIX30QCd+d0PgYUSmGUkeRT312uxcN3lZkwCK?=
 =?us-ascii?Q?tdIuyUuMYgiqBcz8BjOS2mcQcSF5rHzAHyOa3C8mY7uZr2RNwEZ1vT28TVBY?=
 =?us-ascii?Q?tcAhBAb6ryUJ0LPyab9SPkDpwZYTxKEXcmCKAo8/MnszAlVpwCxesCkLHPmW?=
 =?us-ascii?Q?InXneulkCfod90zex2CFiM7Ma7CWrfQoFIWpUz4ZfFOc2UuSEhsi8zDCVk9T?=
 =?us-ascii?Q?xwpz6z56OlmQpKZkQqTvQNSgjAGCoiR2w0o8PoWnsbW7yZRMqr9zjcjW2OqI?=
 =?us-ascii?Q?GZt2ifnRszQK0ID/8YzSko1cWUZbgB2nIW8hYzCdwOuK9Ae3Cd3UlKAovUA7?=
 =?us-ascii?Q?HfriKvO0zf/oGCkiDant2bONus5c7v5vM7B5K9uOI6UPZphn94esF94OBhIa?=
 =?us-ascii?Q?X69sAmr/VXzhRR5ETSfQzSiF7nyMGoBQIGlO1blJLeLc+fWhYlOca8gEHElS?=
 =?us-ascii?Q?i2PwNedLM5Ayiz3McgJMPxK1JM7EvcFPlDgWyOClEbjX3KdXY3yvC7dSPm63?=
 =?us-ascii?Q?G7sdOtX6ulcuEp7fhHmLA/HQQA05BhVVOm7eZrHQPpVlISOfa+7hsQ9ni2R1?=
 =?us-ascii?Q?jnWGtEbYRoP++Fo+yELAlYeNnaGYh1ocZ3KqJK4aj8QClO5KoW2esBDBoSnf?=
 =?us-ascii?Q?n34YQUWqp+JzE0xGj6q9rd+uPY5QuoxjEpeRDQB+zh6DwlwdejoQh6hJJYbR?=
 =?us-ascii?Q?Xgfh9lx+sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82805b56-6aba-4244-3f24-08de789505b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:50:57.5894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNoiLiYzgV5+lWNYqgC07je6iOoXNGXhlmOoWLTH+cxiDd5eENqiiQ4h6q2WEsX54zRTNcj1M0cs7AT9c4deQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
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

On Mon, Mar 02, 2026 at 01:57:57PM +0530, Raag Jadav wrote:
> Currently xe_lrc_init() does two things.
> 
> 1. Allocates LRC bo based on exec queue parameters.
> 2. Initializes LRC bo with actual context details.
> 
> Introduce xe_lrc_ctx_init() and split these two implementations for
> better maintainability.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 142 ++++++++++++++++++++----------------
>  1 file changed, 79 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 84360fcdf743..ebab5d78f7cc 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1438,65 +1438,16 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
>  	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
>  }
>  
> -static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, void *replay_state, u32 ring_size,
> -		       u16 msix_vec,
> -		       u32 init_flags)
> +static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +			   void *replay_state, u16 msix_vec, u32 init_flags)
>  {
>  	struct xe_gt *gt = hwe->gt;
> -	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
> -	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_bo *seqno_bo;
>  	struct iosys_map map;
>  	u32 arb_enable;
> -	u32 bo_flags;
>  	int err;
>  
> -	kref_init(&lrc->refcount);
> -	lrc->gt = gt;
> -	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
> -	lrc->size = lrc_size;
> -	lrc->flags = 0;
> -	lrc->ring.size = ring_size;
> -	lrc->ring.tail = 0;
> -
> -	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
> -		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> -		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
> -	}
> -
> -	if (xe_gt_has_indirect_ring_state(gt))
> -		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> -
> -	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
> -		   XE_BO_FLAG_GGTT_INVALIDATE;
> -
> -	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
> -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
> -
> -	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
> -					    bo_size,
> -					    ttm_bo_type_kernel,
> -					    bo_flags, false);
> -	if (IS_ERR(lrc->bo))
> -		return PTR_ERR(lrc->bo);
> -
> -	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> -					     ttm_bo_type_kernel,
> -					     XE_BO_FLAG_GGTT |
> -					     XE_BO_FLAG_GGTT_INVALIDATE |
> -					     XE_BO_FLAG_SYSTEM, false);
> -	if (IS_ERR(seqno_bo)) {
> -		err = PTR_ERR(seqno_bo);
> -		goto err_lrc_finish;
> -	}
> -	lrc->seqno_bo = seqno_bo;
> -
> -	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> -			     hwe->fence_irq, hwe->name);
> -
>  	/*
>  	 * Init Per-Process of HW status Page, LRC / context state to known
>  	 * values. If there's already a primed default_lrc, just copy it, otherwise
> @@ -1508,7 +1459,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
> -				 lrc_size - LRC_PPHWSP_SIZE);
> +				 lrc->size - LRC_PPHWSP_SIZE);
>  		if (replay_state)
>  			xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  					 replay_state, lrc->replay_size);
> @@ -1516,21 +1467,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		void *init_data = empty_lrc_data(hwe);
>  
>  		if (!init_data) {
> -			err = -ENOMEM;
> -			goto err_lrc_finish;
> +			return -ENOMEM;
>  		}
>  
> -		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
> +		xe_map_memcpy_to(xe, &map, 0, init_data, lrc->size);
>  		kfree(init_data);
>  	}
>  
> -	if (vm) {
> +	if (vm)
>  		xe_lrc_set_ppgtt(lrc, vm);
>  
> -		if (vm->xef)
> -			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> -	}
> -
>  	if (xe_device_has_msix(xe)) {
>  		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
>  				     xe_memirq_status_ptr(&tile->memirq, hwe));
> @@ -1546,14 +1492,20 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
>  					      __xe_lrc_ring_ggtt_addr(lrc));
>  		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START_UDW, 0);
> -		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD, 0);
> +
> +		/* Match head and tail pointers */
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD, lrc->ring.tail);
>  		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_TAIL, lrc->ring.tail);
> +
>  		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_CTL,
>  					      RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>  	} else {
>  		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
> -		xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
> +
> +		/* Match head and tail pointers */
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, lrc->ring.tail);
>  		xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> +
>  		xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
>  				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>  	}
> @@ -1602,12 +1554,76 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  	err = setup_wa_bb(lrc, hwe);
>  	if (err)
> -		goto err_lrc_finish;
> +		return err;
>  
>  	err = setup_indirect_ctx(lrc, hwe);
> +
> +	return err;
> +}
> +
> +static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
> +	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_bo *bo;
> +	u32 bo_flags;
> +	int err;
> +
> +	kref_init(&lrc->refcount);
> +	lrc->gt = gt;
> +	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
> +	lrc->size = lrc_size;
> +	lrc->flags = 0;
> +	lrc->ring.size = ring_size;
> +	lrc->ring.tail = 0;
> +
> +	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
> +		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> +		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
> +	}
> +
> +	if (xe_gt_has_indirect_ring_state(gt))
> +		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> +
> +	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
> +		   XE_BO_FLAG_GGTT_INVALIDATE;
> +
> +	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
> +				       ttm_bo_type_kernel,
> +				       bo_flags, false);
> +	if (IS_ERR(lrc->bo))
> +		return PTR_ERR(lrc->bo);
> +
> +	lrc->bo = bo;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_GGTT |
> +				       XE_BO_FLAG_GGTT_INVALIDATE |
> +				       XE_BO_FLAG_SYSTEM, false);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto err_lrc_finish;
> +	}
> +	lrc->seqno_bo = bo;
> +
> +	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> +			     hwe->fence_irq, hwe->name);
> +
> +	err = xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
>  	if (err)
>  		goto err_lrc_finish;
>  
> +	if (vm && vm->xef)
> +		xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> +
>  	return 0;
>  
>  err_lrc_finish:
> -- 
> 2.43.0
> 
