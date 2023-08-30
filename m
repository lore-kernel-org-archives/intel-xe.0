Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ED9C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 11:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F3710E4F5;
	Wed, 30 Aug 2023 11:00:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1E410E10B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693393228; x=1724929228;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VM/S9noKq5Mia3YFa4rnlel0ry8Shp+F3tCj7UoOigw=;
 b=gHjCXys4D9AyQNtovcNOQgMNYjYHU9MUs6i5krRwHa7myRjaHq0TXvTi
 QFPLUBibZWgHrwuWqdYpfyECw+IWNJckwkpk+1jlsaMZtEXWcZecI1qV3
 tbQFIcG60TtWnRSAZemTW+QREzcRYu2xyvJ4c4gaaIggS9YWyEgKhTEGC
 uxOA4x4cojUFsSbAWMIHnIW5nwwE3Zq9wCy/sCRhKu3PppFhJClu663L+
 tDRrJ/ylwalCaumhkO8auPnWdjzy+wyiOfx90nY/CkGzTKDs8vnnUtIU7
 oAWPNRr94TW6tBog9GIwQGjVjXPs4cBIJvcq9rd4nPDpBq0RuzDcH1m5P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461985133"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="461985133"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732576776"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="732576776"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 30 Aug 2023 04:00:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 04:00:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 04:00:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 04:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpNQQCXE96zHmPPD7uBxvlv2uV1j8eIFENtoguq/9xpxAiJzW1hceWF6lAi9HrkG0tlg5P3yPkr+ihooQ4YADoqKLM+kYJDbWWZjmFv5SghBR1CJSnJiphtAGXCqoYruz6BOws0CfUsVJMqnULmESQQ2fBdUOtYFHiNF3gq3h2NCj4NCcGwVGmjEnhURcwjhrBkGHyuyDrr0ho6P9SpFoDNTMbUSlOyQb15b9niDR9jq71bTvUQxLlOE/vX+T+K8DTXxSxBrCfQSQAG3frmnvN5beUpIc11UWhEWrYotgZBgt9QCRvnYFFNGak42K756xarc8CFNRtE9IqGlt8S/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXgFAJaRJGHxXwr6uR392hNE0vWyIOrO28C9yQ4RBwg=;
 b=nCFHd2xGToZjH7X6JKgtswQ8n0wc1051JwnyxNn4fe4mA3uyTJELngjVMixGxk6lDw+I+iI1sUEWY7PfGMwLkYNIUGpxl514oHhcBqjHjBq2gw58AW4GPGlPHknqEs+xfUTuP+0K7Bre4tYVNSzlycgJAcM2lxZIKs0YQfqf0d6vlSHM/t6QmEcnA2u6TyldZDaBF05nVG1k5tuLy/VlS+LV7jDzaevApfR+GNjkIPcV/GT+s4Nj2uz2J7CdtPUDijP5+k7YR9/OQwD2R0AMsVYWoejOAKYdJaul28Wj6/Y7he2XWMWqgb9XxtEiMsyW+bdAVKcPAXnpEjGHNoKIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 11:00:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 11:00:11 +0000
Date: Wed, 30 Aug 2023 13:00:03 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZO8hMxkPtvNK3JRD@fdugast-desk.home>
References: <20230830091717.19617-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230830091717.19617-1-niranjana.vishwanathapura@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: d4db97c6-dee9-45fe-c604-08dba94847e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLvPJCnkj8pi8Ys8kSH88c21zjbkI8uDFdG5GUR106A51tWmxGem09zMDJ4qDq7BvYEEZs9IyGq5GgfSZn2XyPlE+WL+lfso+rB1Ba4rXhymab3LR3qVQ9lPCDTHqPGgG0XPR+zsGJWGaTA/+EA5kpxtL0rO6U//w+QxVn7IDOneNlU1ODFE/bXvqUGiQYoCDRxIwogKnspaKukmuaMZASvAbOUvi7DplcePT+tbQfRLg4Pc2bWTPle0oCfqk7iRxDaiHtazbg18MUfv04rBctal/KForSMi7+bL8BAnA1XcRT0eVWbIoM0UooPE34k/E3fP5posM3x1EHy1AiH+Vv/eeQR+kOi2sZHy8sOwp7oW5SkVVpQj++GePW1cjCXZo4btnwh/MYigxfh/OSVVVc1wU7+XaDHOE53UOFG3noO2+W7hi4fnFL1fbILxBxTmN4RPjlsS8pLTRPs/A+3rgjjB0Npw6urlRwLl1v5sTQMie6vnBG75Ovuk3LGBwpXAXzgmLwjCq5ZCLL95WP2Nx05eaF0QAuTX7J0XDjbPA7ScFUucPZu1dysfJg/pxvxW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(186009)(1800799009)(451199024)(41300700001)(82960400001)(6666004)(38100700002)(478600001)(86362001)(83380400001)(26005)(9686003)(6512007)(6506007)(36916002)(6486002)(66556008)(36756003)(316002)(2906002)(66946007)(6636002)(66476007)(5660300002)(6862004)(8936002)(8676002)(4326008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LKdUtsmAgJq9MrHbsoKVlh3Q0R58QkpmrKh3iCqrCnqAodROInyMCwvYdNfC?=
 =?us-ascii?Q?SgKA52cVVGBYsFr7X0ohQ4donZU9oom+Dajr8L3jnZsNwOzkMmmL6W8E3L91?=
 =?us-ascii?Q?02ey5bZS6ezcWrDEZrufNrOg8HSmCirEn2fd7yKSw+OuP2fRzVIGaEHI9B9F?=
 =?us-ascii?Q?L1Rcj9mdvTijuYfBTGKroVFiFtyt+oZIyTlBHhBb7Ozy37WuCCWDtTm2J2N8?=
 =?us-ascii?Q?8igZB4zY7KZXt4t1S7yCW19P1QSUgQcHuWfLcmdJ6hZGfn4gqXNdLKy743XX?=
 =?us-ascii?Q?QuFEQqeVGeTV7w+lwWGwbmonGVkYnjx/6WwJxykSBAPKNPo5W51MmgpvskMI?=
 =?us-ascii?Q?8wPc86DI/mlgQ67EevWVsSKG0GnmQ1MDUjkieTD1kRvesJlFYkjLSdwBW+vm?=
 =?us-ascii?Q?pI9/ImUUQya4TpnZuEAWtN2k3400x+HT9V1CYRszLjgnjhaIDNkP3rF08mwa?=
 =?us-ascii?Q?vOOiZXupF2E3BGmJzVl/6JbBWMUysUyjubA6t5EmfpaNVTzZ/Ktts1qnzKf5?=
 =?us-ascii?Q?BXaStHMURbyRn1gpdRVYODgNidxzi9clgKFykuHiRcBiTPsgH/MvhlAfPVFK?=
 =?us-ascii?Q?1CHHDkujorPJExGATjaczDIBdd+xqcRwJI8UAI7xQ2v0DDoK7CoEan1fzDQl?=
 =?us-ascii?Q?/EYZODeuq76jXxKZtumBJ79VOjjp+IO5/JjenF18Tv0wm9YH2lA1Sq/srvYB?=
 =?us-ascii?Q?ez9t2ZBRqA5WtTOjWiLbiJCRXsGvJxkpfxIX2IBqpXlX4jEo9GmTBe0R7ck+?=
 =?us-ascii?Q?YRGZB1sOxH2SSuJEcdZWQMFjg6/2AdoptApcmOUcqhxaPBXdEyx207szOLLy?=
 =?us-ascii?Q?gyXyc1yl3/jo33q7ZmFVZI+WZqHW4b49g9jhkQB9Z+5cLN5rwoE7+STtT5vq?=
 =?us-ascii?Q?rkpjw4Vd1Z6Z1xbQgMoj28vHlrhxdiHn5WdjN+TSRhUqqcgC2491wy/m6fkM?=
 =?us-ascii?Q?FFaVyivP9pndl7N0Gg9ffbfx6wo901YPK0OanrsKLiGH2hQg1Wf/S9fsNUT3?=
 =?us-ascii?Q?7GKFojfpifhpTQSARnAxH1t0TJSgGz15xYJMwjg//BjRfH2KAHS/KcaMmTB6?=
 =?us-ascii?Q?lHliFG93UO+XsV1/iiKIAPZ2YwCjyjFs7RU8Gzk+gERSCKUcg3nXaxKA2sGp?=
 =?us-ascii?Q?FuyxKsOWq8YpSTP6vsOZzMsAr+V0T071lrroZPRMccxt/RwFu5A9Bu6vn1hx?=
 =?us-ascii?Q?2xwSIfVUuDXiJf0YkpdFG9qh41qEtc6VLxi5eZ3TjebRuGKp55McbXDQy4VF?=
 =?us-ascii?Q?3dtmN1eKEYB/zGHOt4ZRgJ0r//M2BG5jNpVLyTxH24wy8LTsPg4cZrGgfGjW?=
 =?us-ascii?Q?T56Q/mvlOLwuOEtCInCYIxBaP1VTPMGE3cRegT4x3eVoyrm4xD7BqDYVuVet?=
 =?us-ascii?Q?kT5TX2+/RB2udJOYD4sTu3C0utYNP4rkozm67ViQu8X3HTxI4Edefx7T9Ua8?=
 =?us-ascii?Q?NEdIeNeVNdb5GF3BdYWiudLHQntLHL7zIc6Aju/6cgbXfyMxeCZ1UGHrTW44?=
 =?us-ascii?Q?r9Nr/E8Kyol9cKljscusLkRXXEmcFW5viJqADWnF73uxlOhavydpzqmpW18l?=
 =?us-ascii?Q?jkb73SfIvkqA/VAXXpYsQt+xJl14YdnFJ4bpqEANdDeyW84Xfv9JJVoRtsow?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4db97c6-dee9-45fe-c604-08dba94847e3
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 11:00:11.3351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bko/Kd0rEoazEuhG7XYGgWu4ZJQXw5PbcB4HnHavfHNoZNFWadpD2mC9AcJf3SD+yPqdkePQhs902CzrsmEL+cKEdD4xEQazIK58UWdsgL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8093
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] fixup! drm/xe: Rename engine to exec_queue
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

On Wed, Aug 30, 2023 at 02:17:17AM -0700, Niranjana Vishwanathapura wrote:
> Rename vm's preempt queue list name from vm->preempt.engines
> to vm->preempt.exec_queues as it is a list of exec queues.
> 
> v2: s/queues/exec_queues/
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +--
>  drivers/gpu/drm/xe/xe_vm.c               | 32 ++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm_types.h         | 10 ++++----
>  4 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 25216ef93781..e44d71c679cc 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -812,7 +812,7 @@ static void exec_queue_kill_compute(struct xe_exec_queue *q)
>  
>  	down_write(&q->vm->lock);
>  	list_del(&q->compute.link);
> -	--q->vm->preempt.num_engines;
> +	--q->vm->preempt.num_exec_queues;
>  	if (q->compute.pfence) {
>  		dma_fence_enable_sw_signaling(q->compute.pfence);
>  		dma_fence_put(q->compute.pfence);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 4a9a46d8a759..347d28442701 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -126,7 +126,7 @@ struct xe_exec_queue {
>  		u32 preempt_timeout_us;
>  	} sched_props;
>  
> -	/** @compute: compute engine state */
> +	/** @compute: compute exec queue state */
>  	struct {
>  		/** @pfence: preemption fence */
>  		struct dma_fence *pfence;
> @@ -134,7 +134,7 @@ struct xe_exec_queue {
>  		u64 context;
>  		/** @seqno: preemption fence seqno */
>  		u32 seqno;
> -		/** @link: link into VM's list of engines */
> +		/** @link: link into VM's list of exec queues */
>  		struct list_head link;
>  		/** @lock: preemption fences lock */
>  		spinlock_t lock;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 15bff0783ec9..9cbf2f63d641 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -172,7 +172,7 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
>  		if (!q->compute.pfence ||
>  		    (q->compute.pfence && test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  						   &q->compute.pfence->flags))) {
> @@ -197,10 +197,10 @@ static int alloc_preempt_fences(struct xe_vm *vm, struct list_head *list,
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	if (*count >= vm->preempt.num_engines)
> +	if (*count >= vm->preempt.num_exec_queues)
>  		return 0;
>  
> -	for (; *count < vm->preempt.num_engines; ++(*count)) {
> +	for (; *count < vm->preempt.num_exec_queues; ++(*count)) {
>  		struct xe_preempt_fence *pfence = xe_preempt_fence_alloc();
>  
>  		if (IS_ERR(pfence))
> @@ -218,7 +218,7 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
>  
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
>  		if (q->compute.pfence) {
>  			long timeout = dma_fence_wait(q->compute.pfence, false);
>  
> @@ -237,7 +237,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
>  	struct xe_exec_queue *q;
>  
>  	xe_vm_assert_held(vm);
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
>  		if (!xe_exec_queue_is_idle(q))
>  			return false;
>  	}
> @@ -250,7 +250,7 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  	struct list_head *link;
>  	struct xe_exec_queue *q;
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
>  		struct dma_fence *fence;
>  
>  		link = list->next;
> @@ -270,11 +270,11 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  	struct ww_acquire_ctx ww;
>  	int err;
>  
> -	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
> +	err = xe_bo_lock(bo, &ww, vm->preempt.num_exec_queues, true);
>  	if (err)
>  		return err;
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link)
> +	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
>  		if (q->compute.pfence) {
>  			dma_resv_add_fence(bo->ttm.base.resv,
>  					   q->compute.pfence,
> @@ -311,7 +311,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
>  		q->ops->resume(q);
>  
>  		dma_resv_add_fence(&vm->resv, q->compute.pfence,
> @@ -346,8 +346,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  		goto out_unlock;
>  	}
>  
> -	list_add(&q->compute.link, &vm->preempt.engines);
> -	++vm->preempt.num_engines;
> +	list_add(&q->compute.link, &vm->preempt.exec_queues);
> +	++vm->preempt.num_exec_queues;
>  	q->compute.pfence = pfence;
>  
>  	down_read(&vm->userptr.notifier_lock);
> @@ -528,7 +528,7 @@ static void xe_vm_kill(struct xe_vm *vm)
>  	vm->flags |= XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link)
> +	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
>  		q->ops->kill(q);
>  	xe_vm_unlock(vm, &ww);
>  
> @@ -586,7 +586,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	}
>  
>  	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> -				  false, vm->preempt.num_engines);
> +				  false, vm->preempt.num_exec_queues);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -1229,7 +1229,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>  
> -	INIT_LIST_HEAD(&vm->preempt.engines);
> +	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>  
>  	for_each_tile(tile, xe, id)
> @@ -1416,7 +1416,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	struct drm_gpuva *gpuva, *next;
>  	u8 id;
>  
> -	XE_WARN_ON(vm->preempt.num_engines);
> +	XE_WARN_ON(vm->preempt.num_exec_queues);
>  
>  	xe_vm_close(vm);
>  	flush_async_ops(vm);
> @@ -2083,7 +2083,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	vm = xa_load(&xef->vm.xa, args->vm_id);
>  	if (XE_IOCTL_DBG(xe, !vm))
>  		err = -ENOENT;
> -	else if (XE_IOCTL_DBG(xe, vm->preempt.num_engines))
> +	else if (XE_IOCTL_DBG(xe, vm->preempt.num_exec_queues))
>  		err = -EBUSY;
>  	else
>  		xa_erase(&xef->vm.xa, args->vm_id);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3681a5ff588b..fd2178dbde3a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -285,10 +285,10 @@ struct xe_vm {
>  		 * an engine again
>  		 */
>  		s64 min_run_period_ms;
> -		/** @engines: list of engines attached to this VM */
> -		struct list_head engines;
> -		/** @num_engines: number user engines attached to this VM */
> -		int num_engines;
> +		/** @exec_queues: list of exec queues attached to this VM */
> +		struct list_head exec_queues;
> +		/** @num_exec_queues: number exec queues attached to this VM */
> +		int num_exec_queues;
>  		/**
>  		 * @rebind_deactivated: Whether rebind has been temporarily deactivated
>  		 * due to no work available. Protected by the vm resv.
> @@ -393,7 +393,7 @@ struct xe_vma_op {
>  	 * operations is processed
>  	 */
>  	struct drm_gpuva_ops *ops;
> -	/** @engine: engine for this operation */
> +	/** @q: exec queue for this operation */
>  	struct xe_exec_queue *q;
>  	/**
>  	 * @syncs: syncs for this operation, only used on first and last
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
