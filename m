Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601E2C5CFC1
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1518E10E3A7;
	Tue, 11 Aug 2026 23:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAepAIf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2717B10E3A7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 23:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786490859; x=1818026859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H23OUHiB2cs1udBEQjLxoo7PRc+ihw5IDN+G9cPv7Sg=;
 b=bAepAIf5DB2zbfQLXzvbihuf4HDgRKUO4M4dcinIWrAWROnSCrOP59Yq
 9DX+zczVCSJ+iN1WURaTUD6KdAWDdh0tw51Uawa6U1APbFBe6y0dJA/kB
 unXrgOPLYTVMPITc3LC2nHHIaU+nK2+hfRnHQ6G9hVR7G+NvRujxPuOCJ
 M73bfedgQ7HOokddTq8mdiSPLNwql2hzOVZmta72xveMlpqKYIohIP03k
 Ti1fgX5BuJ+UKUn/+6t437/tPeEgV/LzKm62OtzN2avp3RIQNOxEwCTti
 eDpHtx33clNT53n2MQ9jmcS/W7ThFRy2GoDnfyETnROvmZv0aOICSETE+ g==;
X-CSE-ConnectionGUID: UZMlfmfoSOKkq9syv+6jCA==
X-CSE-MsgGUID: dWHpMotkQce8xWG5CKOOMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="74572447"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="74572447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:27:39 -0700
X-CSE-ConnectionGUID: uU0Pks7ERQWsQHhB1nkXNw==
X-CSE-MsgGUID: t/pL6znPR66kfj03OwwDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="265467564"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:27:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:27:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 16:27:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Psyz6L1xy9nm2oUXZgkPqZJAsNQf4Hcui0Iv8OcWgLBn+6/cdGeJRjwpXCLnFoGQQnqjNANSvsziNsGushOvs6p31lwJG6nEcKH8biFNjl4WiYBtIM9dxHegfGYzlYVvfxZAgEmnLSrmf+vYNMTOER0uvdlFk8qmMfrG9aXt3jFXp2kqDAdovqoEod9/fmDsHrmGwW4jTsx8UV7oHq3Pa7A/PkECRMpPUlp2CGvxG49HADRoAne4ggfY2t6z+y3i9eLWgor01IYfiZE3tc5QUWxTO7PpSGl4U+jl1ucb8f8pwTTntiGpi5HHezkXhTvMZZ9JCzn2kA3R9EEC/lDk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGCjVYKSOsLiQ5NaZatsqq+FHkGKuyZz+442bEh/NOA=;
 b=MYRQ5WZEiaSycFrKFe5aavpfyQJttVotuFeUZcAl43DVP/buRa0jbEUygI7woot+muO7IaMegScyLp9vEiCEXvAtqEJLrdZkpurfdcGGRU5xA7ia6PCHKJhwamfPIwg1JeRna6svf1imL8e0t6vsUYFOt8FHNqaLIuYsIrU0bOghjs53eLN4QKSjr3D3IN+oy3l/vdMRluRaUOKHq1GhMBLTH2lLsLh0pnJ5n+7C2GJELe/EmHbXiMda9pJue3UJI5oE7ZjAd1ppEK3d2liT6TeTJhLxl70dpvOmfCGoRhP+3CYjUsDsQR1hpnpguzUHH3IWqa4ln1YW1wI22ej55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6973.namprd11.prod.outlook.com (2603:10b6:510:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 23:27:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.011; Tue, 11 Aug 2026
 23:27:33 +0000
Date: Tue, 11 Aug 2026 16:27:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Remove redundant full pagefault queue check
Message-ID: <anuv40Vzbfe7pPwJ@gsse-cloud1.jf.intel.com>
References: <20260811200906.10400-1-michal.wajdeczko@intel.com>
 <20260811200906.10400-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260811200906.10400-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:217::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 1898b41e-016c-41e1-5b57-08def8001e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: W99EZU07IosNUj2o2s0Eui6hp9mK+PotS6kJTb+f4acfM7xDn7YAo+hyOLKG7M8tms4GKZmU+lHFd+CGRyfICIwpNI4e2MQ6/qpKDmDMDLOF92a/wSAogkmCcffvAoVfN1jFS1vogOryK27Nt/G3WMHjxpSnWx1XHnv39fHjPdA755KAZeZ4qxIH78/WO7pxQ72HD8E61bJdSuN+6pz0i6VnfQ+iJhRsdkcO6trb/Os94yfPA2OazUfTFRvtMVAim7SigASXJ+OoLwqsy2pF94lBBlvKQEurGnMcGBvhpn5+j5iJ1qH1IFQL4tUuLcAvSUVyKvsCtElLIoIAD8d5Aumq22XZ4edjkX9njxr/DxYdT5JLL0OwCh6msp3QumnPugZYhuS881Wx0JLmqslnqkryjOGlGZTPGGSeqsenapGGad4rF0lU7/Emisx8cj+H+wQFYBW/S9c92vh1CAGXxGFHxGsT3TSnC9q/5Vjq1mIK2LcgyUDmXHRKzvpohtcZvGsX1LdnNK0sxzrWLsKGJBXE2LkkSWuvKnxopBeeodmEaN2aF/F9gqNBNBsfP7cV99svT2TcCwA4MXscb/SRsKJ3YcFSbERST8WwrvVY2sFct+1yKqe1IxatVFJZA9JK0PJImrICGr2HgxmHhAVZt8LzBqP/iEeDKQIwa4Aweus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9m/weLNhipn0CDHljhT9FVFAn0zhSoon+4fFfB7sLqV5SF66TN6wokElDylO?=
 =?us-ascii?Q?wup1mncV3w/WRsAj8E7y2LvPRGh29ZSlLXsI7iZWq3L2uju8Ii07sKi0n25g?=
 =?us-ascii?Q?lvlTEbOsBHRh+un744FNim8BiqmYBcrA9gJUvp2SKTATEi1ZCQoeHZOAtFrG?=
 =?us-ascii?Q?+pL/EIynLqjUWFK15uc4HYj4FKjgxB3R3e+ioha3k4jRnaftpfL2FTjV1NAO?=
 =?us-ascii?Q?nG47i9Mkwu1gmyNCp8cDYlOrdfO/9nFAvSp2mW3BOhROQwZVsXIS203MuLkB?=
 =?us-ascii?Q?XhHQ+bplyKlDLDn5+pZ53aaiaFtHbgnQkq5LFdnbWrVYdPOqOtZB0q0vL+KH?=
 =?us-ascii?Q?OkgJY5e2yoLnisvGD40dvuWJJogr6Bs+ZAFqcQGUGNWOCqr4cbuL01S6ZkVJ?=
 =?us-ascii?Q?k45FwIrXcPQ7fwKOEiBLy6oJqZ+hAXhy3VjwS67etlY2jdqAnddPog7Tyx6B?=
 =?us-ascii?Q?Bj92sXPNGWsWdE8A1KlTGGafHLdqi8qotc5c+5oHfHogdQeTiyqJVF1OCQ2g?=
 =?us-ascii?Q?776CxV8/9EZwdwne5fewG1WBf4qkmibmXt99K/CkRwg0nIJ1sM/xD56rAi6w?=
 =?us-ascii?Q?gADWMlUw8HGMX0PVgA4ZxYy35EnQhDxNaC3ijEeXXFQbjfoWTZEK3StAh8w/?=
 =?us-ascii?Q?+X+EVDbqS6Sg6WY0v4IrAoTQQ+rLJyoBVThwtJ0ZIPORTg6Q11ahcywp+3uV?=
 =?us-ascii?Q?GZ42TEiz6D3JvIrFyhEuQIEgPQ0mKefbKof9ZTxcLbnzh4GNtA7LyAuq8bHH?=
 =?us-ascii?Q?bAWq3A3pman5qcIxGqsV9wA2vngOyoUpDcikK2lmBZs9hbe9qcm0D/daUXDm?=
 =?us-ascii?Q?7U8OOQXje3lVinAZz1nQxgg1TViW6TULzrzI38QkcP9r3HLtl8eIHsTSFykq?=
 =?us-ascii?Q?8NAQ01qr2YhYK25OpPrU3USw/2vigS7KUdsaYM9vbdA+3Snxx2Qp/5F6AAuS?=
 =?us-ascii?Q?HquvUbhNjYEDYNbKupVOxImzn7h9rTsj6EomHyf6+08pE4nBA+/6ayGoBOic?=
 =?us-ascii?Q?L7hN/psUnC3lN8Y9lVujc68WrUiNhAbYUowilQnm8Hyv6KKuBHnNH70/ZuUH?=
 =?us-ascii?Q?IvdD6NW0F9AmbF9Gqvx5tJIbKNr3UDHPSqXuI7Wc1gJuqwe5SDGP80L9qeFX?=
 =?us-ascii?Q?0JNV7nSGrXRTiP0n8TSV1mh4zHW0Yg0nuQXaGHQ1XPq09MzqK7uA1ArnL0xA?=
 =?us-ascii?Q?50BbOis1mTcuJ91V50ujoPvjvRpNHKAGx45+ZQQfKK0l+Vy1gDXpW7ngRzmP?=
 =?us-ascii?Q?xOv22vqtGnYxKg70sFCVJAQnwiwk40dd9ZgEu/BSXl/mcSXCpkfX5qS+5gHu?=
 =?us-ascii?Q?FlHcyCmXpbMOJKR1+uSz9Re4XW2kzQvfca29IjSxIMYAJ58gucCIvtgakaTu?=
 =?us-ascii?Q?aBTUhjF5Dkexlgq+ywvxBGcsfXdN3OpvtqgI6afSX5dXnqTA5dL88b2ZSov1?=
 =?us-ascii?Q?4PLDqpIKVWZxVc136dGMQ3DsYHtGQL4vQVVY47OJsikUPYRLfvuA3iDzbxl4?=
 =?us-ascii?Q?pqeNNYFtdpSlSPZfKxlU5hpCZVGw67tNzbmxrHVU356a/1OXtfDDId0FTyNT?=
 =?us-ascii?Q?d55S/G+cDsiP+FDFL/UXF3xf9p1lMFv9BWUBfmlIngyqR+BQWvxWB7cL5P6L?=
 =?us-ascii?Q?3VHIqTi5k6ByHhWqm5ff4jAWJ4jB2Nxvwcuyyt3PYQPSlVnugd2153eJxrM1?=
 =?us-ascii?Q?BTLKlXlgiecISnp4g5Nut/QfaGc2KK/cEEnPWl3X1pUPSYuWQj2zepXhqrTi?=
 =?us-ascii?Q?9twNqRrJzrNfwqsSAaNR9WczZC5cYAo=3D?=
X-Exchange-RoutingPolicyChecked: U0VwlYeyQUi0/DIpwr3JCmErUt2R5veVKucbOnTxCZtZ1bGRbNdvssZIM4/YfPCkgapQtVao0NEAmXaqBqvuemJfpoJLyIUx7de2D9lvGqaUZaqgG3bDO2oWBTmDSqkieRcIXR5T10lnRozjFKV1+XJkupKGpN288r/VQxGfqPqyzuHJjmQ/JnbqPDgnCaPtw+9TFtKtA/ku/pDBl0GZA+/CoLi5jvB29gN2arnbIjfSsHdz6Z0euEFA2Zh/D6ICIhM9akOTurPPAmORaHusP9ygrrR82NemagOFS8riJWTwckUJD5mfekfxlzLiBCSClG7qZo422pBuF1RUKBiRMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1898b41e-016c-41e1-5b57-08def8001e97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:27:33.1881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTu6dgsPlaiT2FWqJpd+SleVgqiUy5IH1rJihACuJ1iRGifdE6g/SkhaboYDmTM2r1Dky8HcQI5n9fKIVFaXIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
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

On Tue, Aug 11, 2026 at 10:09:05PM +0200, Michal Wajdeczko wrote:
> There is no need to check the queue inside the pagefault handler
> as it is immediately checked later by the xe_pagefault_queue_add()
> function and we can just look for the NULL lpf entry. There will
> be also already a full WARN triggered, so no need keep drm_warn().
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 45 +++++++++++++------------------
>  1 file changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index cfb65621baec..7e829c61387f 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -864,41 +864,32 @@ static int xe_pagefault_work_index(struct xe_device *xe)
>  int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  {
>  	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
> -	bool full;
> +	struct xe_pagefault *lpf;
> +	bool empty;
>  
>  	guard(spinlock_irqsave)(&pf_queue->lock);
> -	full = xe_pagefault_queue_full(pf_queue);
> -	if (!full) {
> -		struct xe_pagefault *lpf;
> -		bool empty = xe_pagefault_queue_empty(pf_queue);
>  
> -		lpf = xe_pagefault_queue_add(pf_queue, pf);
> -		if (lpf) {
> -			lpf->consumer.next = NULL;
> +	empty = xe_pagefault_queue_empty(pf_queue);
> +	lpf = xe_pagefault_queue_add(pf_queue, pf);
> +	if (!lpf)
> +		return -ENOSPC;
>  
> -			if (xe_pagefault_try_chain(pf_queue, lpf)) {
> -				xe_gt_stats_incr(pf->gt,
> -						 XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
> -						 1);
> -				if (empty) {
> -					xe_gt_stats_incr(pf->gt,
> -							 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
> -							 1);
> -					xe_pagefault_queue_advance(pf_queue);
> -				}
> -			} else {
> -				int work_index = xe_pagefault_work_index(xe);
> -
> -				queue_work(xe->usm.pagefault_wq,
> -					   &xe->usm.pf_workers[work_index].work);
> -			}
> +	lpf->consumer.next = NULL;
> +	if (xe_pagefault_try_chain(pf_queue, lpf)) {
> +		xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT, 1);
> +		if (empty) {
> +			xe_gt_stats_incr(pf->gt,
> +					 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, 1);
> +			xe_pagefault_queue_advance(pf_queue);
>  		}
>  	} else {
> -		drm_warn(&xe->drm,
> -			 "PageFault Queue full, shouldn't be possible\n");
> +		int work_index = xe_pagefault_work_index(xe);
> +
> +		queue_work(xe->usm.pagefault_wq,
> +			   &xe->usm.pf_workers[work_index].work);
>  	}
>  
> -	return full ? -ENOSPC : 0;
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.47.1
> 
