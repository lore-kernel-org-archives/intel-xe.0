Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAD9C4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 21:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC78710E0A3;
	Tue, 21 Jul 2026 21:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoKUZlBL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D920B10E0A3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784670195; x=1816206195;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FlvSTXsMaJgp9ymloCVBYMWJKirZ/m7CSWSWsBg4d/k=;
 b=XoKUZlBLX6SPhWvp2h/aBBzEIAX/CD9EZzfdKuNc1Zbz6hvKORZifTQj
 jhdsyt0JrII/x+LeRrsemq7kxELAZc8Gd4GncrjC6BXLVDsS7ZxTVx2uf
 1kxn4oEyIzUB3vzuRkQfMp1KZxgIybH6S7PAk44zhYSB+jG44o4GClMZL
 tXqUZTMSpZS9NV+ogVsDcoIOCOwn8YNzHlLS+MlJ18dlpGJptC3WElDJG
 b7Wtg2HxVBtXV+BWBTl6dv4hotCOzakH4q9ln2ZyqMsT2HlsK18Swa60V
 qoEDjZ+AgPQ71olL7dJXk3NsDamg58YM6onuLLUEZf01qD5Nnv/EHvh9m A==;
X-CSE-ConnectionGUID: v4N4NkbETG+1GbvnhGtHKg==
X-CSE-MsgGUID: 3xagxVPsQxaEDTz5wwSDmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="102702935"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="102702935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 14:43:15 -0700
X-CSE-ConnectionGUID: Ut5bPhG5RXe7Mrz5XSSHqg==
X-CSE-MsgGUID: nJQxrINfQH6WXpvDAcqMRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262159393"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 14:43:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 14:43:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 14:43:14 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 14:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr3AwIsIgiCfrSFInMfuzWYqtu3UHBolb3+UoTizr9DlKqRr0yFwl7ZefBIN/rq/+ij18TP0IR2yrhxnp1gjCD07lI15SPGk6nZdMiczbE9sgxhYqXYnMU/9xNBo14jqMt4rmwm7GG8KLbuzlewbT3FwjblfnYWJZO9PMfuVHECSlCTdvB1zAfTH05RWHowmrFpKfg8zPB1QvqK+bKTfA2qBZ5+/OJJ/0Eczo+aexF1cT5pA9ubHEke9ew804Z2Qd7VO4ohzsD89kEvXLivLmV+xv9aHB5gz1Itdnt5Kmo7Gy5o+wfRcPeDXLR60OH4+TKVk8AGPVmsUCMcVs/s+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSz04CMuu7Qfdo75HsGIM9EWmm803eSZuyo1VET/OLo=;
 b=SwRCva4ddy3Juq8eM+x3d9zHtdNNvk3vO249KSnghWULT88doaUQIcOutuQem2MM9U4guV1QFeV3D1r84M/BjSaNN3dbbt9g+TLtTG7zPhTCm5EmzhPQ1AK2zYradu6vhvp3lSkwDj4EeuTv6ALPy9R9DcOgLG4oYJbdciwfT9OlowGz1tEbY3YTM9SzSIlIzSPjV1CTqweS3QkySFvT6xIP10MnBfqLBc7zI6iMmhwm0eSzkx/rlWepfAi3cfOnufouOHkBWetiuTb/F7mNpe1wse6A2PugJR5a+ZAzWABxJjzeWVyuIEUXOzCdmXDJYT7ZYQbyqjhjUazGuW6x9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8301.namprd11.prod.outlook.com (2603:10b6:208:48d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 21:43:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 21:43:11 +0000
Date: Tue, 21 Jul 2026 14:43:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe/vm: Remove redundant INIT_WORK() for
 rebind_work in xe_vm_create()
Message-ID: <al/n7K7D8f8s/4Lv@gsse-cloud1.jf.intel.com>
References: <20260721205516.4058959-1-shuicheng.lin@intel.com>
 <20260721205516.4058959-3-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721205516.4058959-3-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0372.namprd04.prod.outlook.com
 (2603:10b6:303:81::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cec7ee-e62e-4c14-51b8-08dee7710fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5uIiZR3z2osPGHccxqvOriXtomev5QsGf71SSIZcyQGVzi+kqkmWg7QzMd0pzidzqMK+eQnONmisJXJUyRaV3zImGk9JE5QduZDVwYRYAs2/Si8K9+5aJBvboTGYapLVqnvyfrM7JE3eFRTxRQrKk6ioMdD0SQDiNygeKC/+Q7tc18qzOVcCHzQxPADJ93+Tu93FFCDLc6p2pZ7I4uQZCUrCAR5p3+yI369B1u1gKbm/M9atxLx+V6mh9WxMHJHS4BaoKr1BpTgzsQRMXc5twHWIRm4XLcql8TCK1uZ1TaKFFT0pPRTV0rVLGmCsnl6Bdk4aK5tA8vHIgtLhZunlAz3Yd0sWN0LySIGPp8U1ytnEFlwcMQNJSQ2fmyrl1uwK7KSFv1JlAzeoJKYcs4fuAE2Hf9FwajalXrnY/v3WCgZfs2ktn3i2zam1pGsqiqRfJ4t9WW7vW19bN9TK0q5CqRWncWQZF5Z+DwLbMYb+bDC+T5CE26SGBlHzJh2lOdZZRyGzlI4yhs4lrNngSD8SG0XSh3s90r1aueo5eAmYAmf27jaDC54iPa1Zqjj5e5rmHTQEcub+/YVs1hH9juVhXFpNY9FC3kmoMkxWLPd06NVg8SodQ6QTaGYNssnXzSRRKXEFTjVGLh8sYcWdc35nhhdOMwfI/1C6lHDdQGC3gYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+ofaGzv9203SUqWEsTEwb2Ui5HDMQFeTp9bJojuPKZrPkxNkNm5FDS2sjy?=
 =?iso-8859-1?Q?RWOnu4sjfPgx23rLP5Fq85Ng6x1HOIISogub1PNaDHLihzRvwH/M7LxscO?=
 =?iso-8859-1?Q?X7t2606hYSDs1QduDBGauGQOWlmrHealSwzQzq4+qq8VzH8fCyi27vpF+D?=
 =?iso-8859-1?Q?5k3q50M8RjrRkJLteWElU/38pEjqwObhRyyJSEoC1vj6nC/crErDIvTs5i?=
 =?iso-8859-1?Q?GHzJXtrVwXfc1lxFw9T/En9dRTJH7XNigCd6vwq9OsHN7kuEghS2kiZD96?=
 =?iso-8859-1?Q?HqPQRSoEKyLp0FFpOqN8sbLdaA9Z7Vs410L6dgZpfliv+cyJq91YuHcMR1?=
 =?iso-8859-1?Q?ZVzeyRJQriZbgKOyQFaQh/FnnZ1vf0rUKDCInGzsPOXFBshf8AR27fpi92?=
 =?iso-8859-1?Q?Ua5RctbUTxmkrYDXOd7FRhBdEau8rmMXrrIGJyEbpkKnNydqFPVlbdmHtn?=
 =?iso-8859-1?Q?4dRk45oslfLKQMieKfaf44sYzO9a/7kOfRiAsqQG7orvDnFyArMoO7q/jO?=
 =?iso-8859-1?Q?wM8aCNtCxQIvLOihOhpPuiHsW5jjRurUwKwM1woRUE8CkqKqHze4zP8eyv?=
 =?iso-8859-1?Q?jRp4IedhW+V3r73mwnFGjRb3j2MqUHgrYQXui11VfFW1McHCOk/0D3WZMD?=
 =?iso-8859-1?Q?d+tCrQN7K+5q3XQ84J8nN2vBFOC/klNWEg43nJSSAvHjtQMxifqPQUcrv2?=
 =?iso-8859-1?Q?LcGanVXzXWKr72wzvGSuo1UVgHdgdgYbAwk5CS3qSVzLYMG8DT7RQQA8ea?=
 =?iso-8859-1?Q?DCERSW5snsdRcykqaWqesQHJyMpRBXXDllcgPKW1Pph4Aq+hMorL/75Vi0?=
 =?iso-8859-1?Q?467EvPzqUg/xwEmidjC3eeeY770thdPs0sQp1WSWNbVQZAlxKSpNOxb9r8?=
 =?iso-8859-1?Q?pqDDbcOgdrqteNeYNhSy5RK8Ld1IvCz6JXAolvmgEsngZKDXpirf+wQKTY?=
 =?iso-8859-1?Q?ul9wDbolriP1V8dH6xOV+rj9JsHPouAYU6ZPUnH1ipNOroNYCC/+UZHeXM?=
 =?iso-8859-1?Q?iujYZtyIRV1j8s7bZZsj+y84KDvim97HNvQsBP70vTxvJPLtlfh0V0TCS3?=
 =?iso-8859-1?Q?bdXWLvZx6m69lqMHxrzhCRDlRpsC3Zs2NfZ/m6kDvt5SsyggMjYmFfmSjU?=
 =?iso-8859-1?Q?BiyKEji3habiuAQqfeWjNrH+6VNMmKSXdQkuW8wUM8q9YnPU8ZWYsmi/Qz?=
 =?iso-8859-1?Q?jUncAe9l102RoVBZiomqBM5l5hURn28JVV4GdwByZgJRA7xroNCIHgNsnr?=
 =?iso-8859-1?Q?9yv2Ug3p2NPHjcAV+jDR/xccpCSKm+Y4Whr4foOHUKckIRDsISUwFOvDO0?=
 =?iso-8859-1?Q?ewgVxVzV4QnMqvdwELGuG8C3ZBeLyGpmLOFnKzUfpHZMYJ9Gbjq/9n+SUb?=
 =?iso-8859-1?Q?APdsQidX9rtG84woY4wUddPWOagOoHQxYkazclbH1Euo/emCd5g0TBYH5x?=
 =?iso-8859-1?Q?KZwJsp7USoPnbjtWOHGV39h2z6gVQJYxYzXwQK1g6y/4XmBFAdkkGzK1SD?=
 =?iso-8859-1?Q?oMYl9Wk7ZpG7jbExLMia19rIhVM1I8z3EQmTAsZWfrdh0mQLZxdjDz8haa?=
 =?iso-8859-1?Q?qfW2K5OrFbXyehrdUG47gJUzYRMmvTDUV2yq0j0CkmVStDrvZLERxDUZXE?=
 =?iso-8859-1?Q?eoPHr3fAMwxOi6x5FVPXReN31ZebiS/f/VQ1BS++CqZbEzGEMJ8iQMll6v?=
 =?iso-8859-1?Q?lpUDO0U1SwMJwQuUOSyM9obtbVdsYAfvparLIiVJku22+6uvTGKFS5bAYG?=
 =?iso-8859-1?Q?g3J8F2ej3JVYgEkeanASWGcYqNImLpgF0i58BrK/xdQYGhWLA/x0mnfJ8R?=
 =?iso-8859-1?Q?4xYeR+khiiA1QI67Ra7Xg3MA58jalyw=3D?=
X-Exchange-RoutingPolicyChecked: h7BOp6e/C4myu9SsqnGPkpiMe9WvyGkQxT76R3SmgqyLfsyLiZ6H6SWklqKYLIfaTevuLWpSnabozgbfoQ1Bz1Ari+bdHokWZnL6gIkt57dHccqvOltWA+kaQY5CI+sshEMkZ9JcU00pDX8dhsaugaMU/zY5+Db1dCHGAAhVh1hoFBLSVELkMFGqaRqJEf1GSlQ4XGhLTIKnFZEEq0aLL8SEBMiY9Iiq7IpbT3B8EOxkwc9zUdIpkQJJSJ/S2zs17TbIgBtBJNtJ7vjBdfo2n+9ABsB6RzXvzBNUPJcMcbCwm/IG+eDZt/CxqXv4JixzJuWVZbnguwhq+Zb21vfGrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cec7ee-e62e-4c14-51b8-08dee7710fa7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 21:43:11.4353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybr19an18A+Q2Iqg7SYSHWuKHIj5oDDM14qV6CcFfFKQNXjKhlDBFCv/XLVNinEPmNPkMbz/dk6jKB1YU2pnXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8301
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

On Tue, Jul 21, 2026 at 08:55:15PM +0000, Shuicheng Lin wrote:
> xe_vm_create() initializes vm->preempt.rebind_work twice for LR-mode
> VMs: once in the LR-mode setup block before xe_svm_init(), and again
> inside the xe_validation_guard() block. The second call is a no-op on
> top of the first since the work is never queued between them, but
> re-initializing a work item is unnecessary and makes lifetime and
> ordering harder to reason about (e.g., any future change that queues
> the work earlier would be silently corrupted by the second INIT_WORK).
> 
> Drop the duplicate INIT_WORK() and keep only the batch_invalidate_tlb
> flag handling in the later LR-mode block. The single INIT_WORK() call
> in the earlier LR-mode setup block remains the sole initialization.
> 
> No functional change.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 83f35d8f5323..cdd131f7c7cf 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1765,10 +1765,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  			vm->batch_invalidate_tlb = true;
>  		}
>  
> -		if (vm->flags & XE_VM_FLAG_LR_MODE) {
> -			INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
> +		if (vm->flags & XE_VM_FLAG_LR_MODE)
>  			vm->batch_invalidate_tlb = false;
> -		}
>  
>  		/* Fill pt_root after allocating scratch tables */
>  		for_each_tile(tile, xe, id) {
> -- 
> 2.43.0
> 
