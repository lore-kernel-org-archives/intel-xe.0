Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4656FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 03:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CE110F1EA;
	Thu, 30 Apr 2026 03:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCDWV0Ve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4EF10F1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777520067; x=1809056067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hTv1wIDKHMyKmmhb8/l9eO8Yxavgg4p5jD0NfQT3luU=;
 b=lCDWV0VeRVWI0olneWhb1T1O/+aPFzQ7GHf+XE9CUD1zNunU6LEC1CZW
 XHlfeVUUUOBuwwxWtLZLPcOzXebHDeP1wfi+ZE0TZMwGudMtxZf9pNM64
 zQ3Gzlrjha69PUZiawCInn0zCZQniW3BT2eSG/l1X6Psm1uvrIvOTSYQd
 n+2p4pbppJ9UwaV+gR49KLsB5MFEYytWDx6H3xXgkF+Igr6idHxv7FrEd
 tpJYfB13EC8+bS+XOxyyzzgZnGWXdqk/S3F/mmccmvUJZX5JkeNZlbTPM
 hTwWORsMrDuKScseHDfmXRkr/Dx/rXtZCkMnNctZFfzKKNR3R6EcBJ32l Q==;
X-CSE-ConnectionGUID: Sw3OKGhxRWC9Jr4F6btDSw==
X-CSE-MsgGUID: Pd+VY0U2Szi05Te9x7vIdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78650921"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78650921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:34:27 -0700
X-CSE-ConnectionGUID: E1U2FpoRRiaz50dR22VXwA==
X-CSE-MsgGUID: zA1Nl5ChSDiMP2i3uu025w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233404896"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:34:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:34:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:34:26 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmvaHba0ZTp7RPyCJ3GoV9ByQTTFL1OWcZqMNvAAmsRzxb6YUZKYtwoTKbn8TzaafZu/bh7KZ9mTiZHOxa97Vw89h7rBlmVkjVI4IQc1kpIjXxV/m6dWCsKKuoUmXw7Kw3VyQkAryznUho/ZBPTJ9aJS5ABGCFCDbWqTv8xQKvPJRR3XL6EYgf6BVCcAoheuNvJhxuXHt8tfNB4fjXBiceM3eDHpR92zY3qUf9X8uSoTAq3wBDOannL+WQHYXSsddXUO5L90x407Fz9djcwCn+aVIEhxV+Gt6I8Xtj8y/wKvk8iIBkQjOEh3AtDdbcdWD1vaIRcMnXucYBpWJYUwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/e06nM8sgOf+tTmOZfJJyRoZ78PfHP9dUv2nf5NUPY=;
 b=gN8cZITILvLPnXarKNAktlWZiB7svYY7fzAEvGDIKi4SIGNkSBTVR9nDwk67XIRLvAaF2GzNVZk+7hveUlo08wSJPbFwAHvywjqqekRgVIePoxmITVhXwdg3N4rLhwGfztkNxBiYSS32zrM3PrSXDct+cJCfhiWmVUHksIh8XqEM68pfhKhVVUZxNtqhGTQQpMe2zTUELlTGizDO36duzjLHq+2QFpkHJmQ2jg+X/WWVC1wH1VLZL1shMDCwyiWb74tHaOHwyfZARdAGsw+3IBv09GHBKzRDjlzmghhW55RZTDWdFOEMS41KA9xoMcYW8qAa7fu1uGUWLqgaRAT3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 03:34:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 03:34:23 +0000
Date: Wed, 29 Apr 2026 20:34:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V7 04/10] drm/xe: Link LRC BO and its execution Queue
Message-ID: <afLNvfQRu69FgHyf@gsse-cloud1.jf.intel.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-16-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260416074958.3722666-16-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9d8d58-166d-4486-4fe6-08dea6695f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: /HcRB6F7mreN1H/1Z26YLZ40erpMaWEPi4EujJnMeMNlWrCeCyz/fyCm7RGcimerHe8KuV/tecSK+G9dtFkuWxRfiaNd5BmLqFOw4jrECBygVnDq3fQMSf8Mr2LPD/pDipaV2tZ0MIIDazHDcOm3P6y96OCbtrvJ2bww1Uzdc/SVnPWC6ifBreC/vE75nupaiuwH9hJMOXvaffHkrkrkFaqYBgXfdgKb4MUHXvtBvbYXFSs2GvDZL+2lDwAPV6FWdULtiPX0xsxFoGCZap+1Snc/fU73nH1ywVWTOlH8s1eKJXSFEzcovjcPQYxkHE46ZwDLsQySCqN8LCzmCjOBNHjSVWj6uRB8TFBywNF9zL3Ir0SeJi3Ev/zWJJD2qkwba5VJ3YUG4WubdGM4AipCln+/H9D+SO8uE+tobfeIZRs9zTmbUE45n/ILlGbhioyLiR8m0G2lSJYkREbud5pxCRCQKttrJYdNJ9pVkr/kTrO9uixIB3KXnI2GGtnGDhvCkkAD3JrJ+O1xHjKU3xlTvoYQ3X8CBeMAvo4P0Nop+9kGGMuuP6AScqePNsrYSuOv8TiGeVQ46r9lw6BknFU5l7M0zgBoJLFGnrVN2dAyNXW/lBUFwWm94Vlo8bt6MpBjajU2Z/L+cFAsWzDGSMpZyOBvJIEEZ+NOOQP9GNetsNBsire9FnF0AHTAztQg1il/WFp0UWjxSLnxikkl0Ffor/1U7OeQSc15EQoaf5Bwd9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C7igpairbMAO267i5u5tvKc29znVSdeQdyALnb4K4fI33yhekgzn0Jq9YmSH?=
 =?us-ascii?Q?1wv6aVaDAei8/sSkz37/U29hdtjE/j5DnlE/x9lBBQ9sfmJyN42YuC46jOD9?=
 =?us-ascii?Q?BbgMhF+yb3R/kN8oBe5wJh++3ily+BxHfcRXSBE/dZx51z+d/cRXELL79/I3?=
 =?us-ascii?Q?oiyqXBlyJN+KA3rhSbnpTh8uuXvv8EHe2vnZ+ST+ePuA1lXA4uqfWzZUOVY4?=
 =?us-ascii?Q?PL9/ZFIKK19YWLxRkG2HEeuqerfXxhwN8EJYeRVBnY2M7I++gZpaTntaFGGH?=
 =?us-ascii?Q?ACFbIdtXajbjiDLPCrOjm4BVdcbzqSt8m0X+XQdCOqJOQcdhIHMLWEtndN90?=
 =?us-ascii?Q?QliJjm6YPyEwaREJ93BAVO2/crBz9gFG8tlG0Asik6MvGvCRWs2Jk/IHMu52?=
 =?us-ascii?Q?WvUfX97aSPQZKTMDo8Qv+KcG7R78GTPLJ/Vsb5YBWY0VV1bi7St+Uqb9S+l9?=
 =?us-ascii?Q?EXNwubZWEKD+y2vy3BRr1qZSnabPywtwpo3RGZ8WZ8azdvMvr1AbGUH7k4b4?=
 =?us-ascii?Q?GyaSqeAgasuiw4PrVGFR31CzMakRbQ1UKiatAz+bdPDGU6lv7DyTqKqXkLZU?=
 =?us-ascii?Q?pLwmca2IiaweS9q5ItiQo8IVgvysivTQEbCXRn0P41eHCrQiAWUSGXjcOKlO?=
 =?us-ascii?Q?8AE29/c9DbrcZ37z72JeUYDWH/CN+RIQImBdlRU8f96benaU+fE9Yd3Jh8bP?=
 =?us-ascii?Q?LPNMWqcnG3xRYHqCTHWotd1l+xjJV9ZoTKt9Hx/U0D7dE7K7x0f4oxCPXpRT?=
 =?us-ascii?Q?nWQ5P3IXEbw5fpkfxsB91TDmkuJ7S8M5QEZpZ+wHRA2qa6kRUkI7mGOvBawC?=
 =?us-ascii?Q?MwIR4vdi1GKy/yZpVvylRLeDbwuMUfmQPZE2d41/jljkamacDQ1JjTd/LDkp?=
 =?us-ascii?Q?FH3kVw9P4avO70Wk97zEdQcCkdNx8rJiBrTJ4dPrEyeLQuloV7WOgS/P7cQh?=
 =?us-ascii?Q?VZyQZ2qXIHJnnXTGyvSEdPqpKpwUcdT3qOgfn+rwMfOzfNDIxUh2FybNj4BQ?=
 =?us-ascii?Q?Mihfo+D/MYV/n5o2lLYsBAIrWg+w60z6p9Coz6V7ImG9SeS8UbCP4FBEboKD?=
 =?us-ascii?Q?jgNUKnRCxhe9fi3GNQNiLG2lL9HhnD31AYzbWsHXNz+vtaHDASCqFc3szg3m?=
 =?us-ascii?Q?VSUYGhbyt8KvBfrFs7tUysB6DSvUXYjDXjI0jk+eZwkgc/RsVa7znGga7vv8?=
 =?us-ascii?Q?UjHYsxJWspCoPU6ZeAPGXZWxG8Vx+F5oQ9t0yPjDw64y7biUHRllYqdBBwiL?=
 =?us-ascii?Q?8Pd6TtCg69a9ek1BMe2ThLyAoabtLbtuO3jbXkWUi2i540ZN35iBUMR3L/dD?=
 =?us-ascii?Q?B42YM5ioepDttzAP1FwIlvRdfTni6iIPEEAc2xLehRzsOaSxDaQVROxbeG2Z?=
 =?us-ascii?Q?ZL0jvtirMhiFwJfbmc+flbTWc8HfTLglY1MhXQjkhuRZFa1N27FF13ocnCYK?=
 =?us-ascii?Q?T+p0KKwo5ptXnIDU5SCZVMqK8SDi3tgXOg4ghvUxrKTCKGaRWd6wbBH7bKvn?=
 =?us-ascii?Q?Q9UwwcxNxREZSeizEIy5v0m7VKGkZM0cHJSltc1pUCHinssozoftCv8a+IHH?=
 =?us-ascii?Q?udTJ5y6yoKDbxmnJyAuz7Eq8yJbP/XQkqfSqTxnQHxHyNlXWAWKb3llB5XCr?=
 =?us-ascii?Q?q5nYR2x3Kljobw9d2B1E3xIqc6xbJyU/XGtv7rKW3QO+gj5NX7y5rIDHh62G?=
 =?us-ascii?Q?yQfaT3eUIGGFlr54LQ9kMPWESfPvNpD1kZplh6/TSvqYcPhHPk5PQ0snAUDE?=
 =?us-ascii?Q?FHGZNZ/KFA=3D=3D?=
X-Exchange-RoutingPolicyChecked: th0sQBIztqzqGACPKuIVvOjMYrORbh5h9sJIH2BzuTEIXGMxj3JpFhFKA+UzCBqjD7js/YFwGftcLp98vnzfdaG+lBBZIWdZJBi6Z80p0+a2YvV2IyQcGfqvPCpEaNCKieYcYcXZTZQb2y9NIGlecMlnUN3LfShjZr7AXEtxdpuadFmbA+Dp/htqjXLK2UjbW19R9MeJXTOz6FX0LTnehe8txetBCCRG6q5nneCYTQFrswdbW8AYvZXrrhyuj2JZ8ApVQTTKrZ0CxRn+wCc7O8s12xyNop2cKoIQK4flV7JmMZE1OC5IXSlvB1IkIGVEvOWpuQ2Lj8i+rJodaHXmMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9d8d58-166d-4486-4fe6-08dea6695f3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:34:23.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbuBYA8K54TvlihozJQCKwFeHxtnUhc0VF7IWfCcdDlUeMZafjOPVWyyZgtT76xhoMK0mydzebs7w1jMa5xAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

On Thu, Apr 16, 2026 at 01:19:53PM +0530, Tejas Upadhyay wrote:
> To establish a link between an LRC BO (Logical Ring Context
> Buffer Object) and its corresponding execution Queue in the
> drm/xe driver, you need to store a back-pointer to the queue
> within the BO's private data structure. This allows the
> driver to identify and take corrective action on the specific
> queue if the LRC BO encounters an error (e.g., memory
> corruption or eviction issues).
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h   | 3 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 9d19940b8fc0..a647b775a65c 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -20,6 +20,7 @@
>  struct xe_device;
>  struct xe_mem_pool_node;
>  struct xe_vm;
> +struct xe_exec_queue;
>  
>  #define XE_BO_MAX_PLACEMENTS	3
>  
> @@ -40,6 +41,8 @@ struct xe_bo {
>  	u32 flags;
>  	/** @vm: VM this BO is attached to, for extobj this will be NULL */
>  	struct xe_vm *vm;
> +	/** @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise */
> +	struct xe_exec_queue *q;
>  	/** @tile: Tile this BO is attached to (kernel BO only) */
>  	struct xe_tile *tile;
>  	/** @placements: valid placements for this BO */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 071b8c41df43..632c9603afc1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -386,6 +386,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  				goto err_lrc;
>  			}
>  
> +			lrc->bo->q = q;

I think we need a comment why this is safe.. Something like:

/*
 * The queue ref counts the LRCs, thus it safe for the LRC BO to hold a
 * pointer to queue without reference.
 */
lrc->bo->q = q;

Multi-q comes into play here... So I think the assignment
should actually be:

lrc->bo->q = xe_exec_queue_multi_queue_primary(q);

Then to be paranoid in xe_lrc_finish:

lrc->bo->q = NULL;

Before calling: xe_bo_unpin_map_no_vm(lrc->bo);

Matt

>  			xe_exec_queue_set_lrc(q, lrc, i);
>  
>  			if (__lrc)
> -- 
> 2.52.0
> 
