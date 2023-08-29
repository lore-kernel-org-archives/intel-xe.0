Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA3C83F14
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 08:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774DB10E027;
	Tue, 29 Aug 2023 08:03:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E67410E00A
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693296215; x=1724832215;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B/nzlz9gHfPRlNKgTS8PRMcel/akaTiXEQwyuXhDD3I=;
 b=aiRBENGXSZ29WT+jQd6vSKy+e7fPvt0jCNIZr12DxoKvD2BJMgMcxb9u
 lpSWPbCOcZHKmoM+TcsOkcvTdEp9EZPY9TjTwp5Ty6Up6NHxSkBXUuAhj
 /tARQu8ouRG2EpHNwBqM7fajDx8iiWotCXhiChLEZrWPmsMVAUhWxN+cU
 Jakc6CaXHJVwrYnq1owjr9H2yk3x4hBD0ML+yibW4B63ka4cnpNIZXhv1
 53p6EwLb41WGZ8hn2vfNt7rgcNJWxh/DZzWxWWylT0J2hRArllJx01Fu0
 8NaiJORCh8EHFe9iUXOoPspbxxsgGllqRA4YVHGTtk2EUdWsgSQL4w5aR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="360304941"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="360304941"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 01:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="732125204"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="732125204"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 01:03:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 01:03:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 01:03:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 01:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM69lB8Lvtedr4Ope37Ic9RiNFaYsgHtEpcVR1sXAFB/sBh4OIDwZS5aE3DjnvsvAbEGZJe5EkX6ZWB5L/fcudebf60mrAnefOUtwdcUWri5RRinhpMZaJxHQdWfy768OIyCMf6NR0CqOcYQ41UstC91oZbot31eTTe8KKZvRsl53n4RNu8zFI3j+t0lxkfKHCrii8O+t8jhcZSfAaswL5VEkAPWrISTPWsBNoWXcOaf+leWQ5jcZFMDxH1LXTN5Rdx8TGKR+zRRt3+xVFF17Vqm+kjw6s4VQGHQcu9ZYrT1XamjWfZ7JRe9dwg0BcbWThv+1ovlEFs+/E64y35ULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh/KNBd+zHzkPG40SJqhBKrRW7CYb5I/XvXH5is4tmc=;
 b=CrFznjuVFKlcVI5GoWyv7cdVMozxifr2oyXODEDZ6n82cIfYyIlfqvDe9m5r8DEdYqkiVgxUmOEzdgIBs8jZphNMOBJC8uiokOxFurwaJRPNt91oAZ4bJY06xeCrZSGYBzNw+vRY2pWwCkeFlL7Lr+6sIAJIypsoMsDzKhf2646hzHk7XX+M7Sz4zjBvRP9tcwPXwTIT++2KTHnkyjIOoowLLszGCW/lRifPik/LMAErIHI9bUpZ3Y12iGDeWuSS0tmiEF72DDNwd9JGD4HwisLg3f7CQLAYeB2R9JZZl7m/yb2bW+K94bcm0/CkdvMnxC1TWd4AqhzvPQLf5bbf/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 08:03:15 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 08:03:14 +0000
Date: Tue, 29 Aug 2023 10:03:07 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZO2mOz_lmjiImb0x@fdugast-desk.home>
References: <20230829065614.11923-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230829065614.11923-1-niranjana.vishwanathapura@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 572964db-74d1-4c20-8bd1-08dba866655f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvZQGoWJqb7uYvzr6juLaclLZXDackcZG0VqjRPrubyIIxcKtK3dcouQRG+9uQrLVyCWwfF5yBG8BsvuAPSZ/BavT+GBAedl/1876zFOs28eJEPXSdF2bIJGLycplzgJZgSxefG6sCpBqUuUdhSI+Rn+Ycvx4eiGvIq2QQ2YBh9yyFZfoB0BMOPSx1QaIKBnQaoVrDTVMT9jMSVsdRqHGO+s0dEaclSpb1SmbNJDxoGfmJMxtyeFe/5QsM68dI4XFC1sLrkL55telWQfDz8ZHUP4jPvf464lZ83QFXooK01saeY+ZZDDBXY7LWAIbY+pIqdK7KcyuCbOw7FazRSKMfjc0Rl+jxhcsMieYItJkndpftjCge40JPx/FiR3s+1Arm3mQu+T0UJ8Q1OagJzRMklD7a5Ez8gKN+M5QyLYXS+kuxqPb7D0MlMXDzaJk5qYrY10rARV4UrGd+DFWbJVGQUL0k6QGefOv3bTSQj6Zv2AfWVndAfdsAGtxC9pSrWFG77eihh7mEO5E5EN6S833rcX72QFXm3z+kRtad5UVKF2tLmaUl6ZFMo4USf4ZZx+sEBzRdfLnBhFDX7IWuYaq9ID8rkBGdyy0H0Y2lTnk9tIrTrmzZ52foVyU8x1X4ZC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(1800799009)(186009)(451199024)(478600001)(83380400001)(26005)(107886003)(9686003)(6486002)(36916002)(6506007)(6512007)(6666004)(86362001)(44832011)(82960400001)(6636002)(2906002)(6862004)(316002)(66476007)(38100700002)(8676002)(4326008)(5660300002)(41300700001)(66946007)(8936002)(36756003)(66556008)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZSI/JQNr0/XhMfgy45DE/vAHS9FHlEJdo1GsVMhWORfVNyFB0joitGuCgOlT?=
 =?us-ascii?Q?kVM7MuPava8lpYj8nit4O5qSLzZAxTeOcReQYtJf+OUM+3f4bpRU7dKAPeag?=
 =?us-ascii?Q?57R/+6zWEombOk5ICyRdaIvglJLzPjzYAQvYn1sRAKRaGPmcPXzTbrP5r8YT?=
 =?us-ascii?Q?S7o5I0G2CT+vEH7LKNXaMJdZw5cD5Pl8FZbmTJacM/TQ882xnwwuEC6Rr3l9?=
 =?us-ascii?Q?N1wMQWDDA2TNilvgOtceCuEx47IZVO7vSkqKeJ2UPXTz0G7pI9F42Rnd7JCJ?=
 =?us-ascii?Q?/0xWZLJt7AAZwhvygCZgkoTERfOvubfvtmmmODgQAGhTz9/JOSb9g7Bo7Ez0?=
 =?us-ascii?Q?NuC2torZ5QCanc1kejJc9hBdozRG7nLvk/MwwvT/oQiVHYsXXw2vEm0gFxcv?=
 =?us-ascii?Q?1UqRp0j2YisYFobqeuISnov1+U6Tx/LH9W6DniVyyWnvn+yFFmUlRuWegAVs?=
 =?us-ascii?Q?ZFWXI8e/8asYDzax768LH30iFYELg6r4/pKcTh0tN2g3s7hGY50f53opegtS?=
 =?us-ascii?Q?wRv7lLA42X5a3RmgLpiiKGr33Cxxw7fG0SX8rG5DUkJncGPyNa3q/JrcncE1?=
 =?us-ascii?Q?mffoFR6SngGjVDpiJrpwth2fqXWTeK5PBCrU8Y2pmxAwgIp4FeBg9zKNovdU?=
 =?us-ascii?Q?1zzQxV4Zwb2QeSqWd+r1LiIWcFu5ThVZV5XqUTKoeCJW2qoAFFKUIiMs/X95?=
 =?us-ascii?Q?5y8+rsiUgSaQEikghZcfDb3fKK7lHiibWHVcnrBiviOYr9gUcVLG0JsrZYIz?=
 =?us-ascii?Q?I/ITT7Jgwq+uMmrhLDYK8s/Et7EL8+4QR9Jxjk5KEs87mZKyyek2PGVwApst?=
 =?us-ascii?Q?tzzJB7HXV72vbq/7+ALIAAmUci72EMHhHVTqDvTnqBxShaFOkDqTDwuCNud5?=
 =?us-ascii?Q?TFeUZGNmI/agYSWZ0vUTWw78cADmN2aH+bQN3EGC7maW7GoATMm8vEZ5Q8t8?=
 =?us-ascii?Q?hHNB67N9YAOxdZtZ6GOL6/tUIZaMYlRSs76DxsDakMqsXKt2u0naygINzuWw?=
 =?us-ascii?Q?mjaVbFW0cxa10EVBSRQQVQVFTAU1jxLYYV5h/g2dfDFHh/dgKKx4UaJQdY2F?=
 =?us-ascii?Q?JH+Lh+S1cQvkn/X086TYgYDME0VPDGMC9laZOn/qsOxdBLAzf8F5h3SNQ6jv?=
 =?us-ascii?Q?wEcZQD3ZeKYScYxTh7esesnMXmguezGuh6V/97R+EhuKfcyYMFLfJNpsR9vE?=
 =?us-ascii?Q?TzgPUIL7jkC2TekdGmfet/v6O5tfq4iDT4DGRaTPfh8Ish2m+fWfXeTz6lOi?=
 =?us-ascii?Q?A2UG7CT9Gm75+CzBUw0It/qL4oGBktCgFNctU7jr8AfyUVgAMOW1KXmVZTKi?=
 =?us-ascii?Q?6LfEFr2aPX1oOh4BoVWWgCP9OqsK66CvPtj7oqYs2CiagFBxANOTTI75DuPU?=
 =?us-ascii?Q?e1t/GwuHgoHeKzI0QZ3OJUD/wzrlUciB7bufv3iIoMg7T60vDkLYu/YuO3tZ?=
 =?us-ascii?Q?qoUFyoGqKO2cp0xLu4g3SX+azfcXAmoI7NDhhP7xoC8aaDqZq/1fH3o8CQN4?=
 =?us-ascii?Q?Hl6aeOa/s1t8OrGo49KOlwBodpNAZ28Pm3LiqqpA2cHnE6tKEzDr7PUD8uPf?=
 =?us-ascii?Q?eyqP3MS6b6T9nHunIBJAnh6V1TuYnvQ8DQ7pxuO1Emg2XUir2Ih9ipAp8kno?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 572964db-74d1-4c20-8bd1-08dba866655f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 08:03:14.6453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIc+Cp6b1VIc8HM+Nl9Pmd8Z/biMuemcYvNFbYqRniQtq/xcbIXE9RHO/BAGM1lmqpbYmsEElj/MvWOvO86SbCI3EQ0vpfMijrqiGF5Ef44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Rename engine to exec_queue
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 11:56:14PM -0700, Niranjana Vishwanathapura wrote:
> Rename vm's preempt queue list name from vm->preempt.engines
> to vm->preempt.queues as it is a list of exec queues.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +--
>  drivers/gpu/drm/xe/xe_vm.c               | 32 ++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm_types.h         | 10 ++++----
>  4 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 25216ef93781..66420d31e7ae 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -812,7 +812,7 @@ static void exec_queue_kill_compute(struct xe_exec_queue *q)
>  
>  	down_write(&q->vm->lock);
>  	list_del(&q->compute.link);
> -	--q->vm->preempt.num_engines;
> +	--q->vm->preempt.num_queues;
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
> index 15bff0783ec9..6d556acc30d3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -172,7 +172,7 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
>  		if (!q->compute.pfence ||
>  		    (q->compute.pfence && test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  						   &q->compute.pfence->flags))) {
> @@ -197,10 +197,10 @@ static int alloc_preempt_fences(struct xe_vm *vm, struct list_head *list,
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	if (*count >= vm->preempt.num_engines)
> +	if (*count >= vm->preempt.num_queues)
>  		return 0;
>  
> -	for (; *count < vm->preempt.num_engines; ++(*count)) {
> +	for (; *count < vm->preempt.num_queues; ++(*count)) {
>  		struct xe_preempt_fence *pfence = xe_preempt_fence_alloc();
>  
>  		if (IS_ERR(pfence))
> @@ -218,7 +218,7 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
>  
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
>  		if (q->compute.pfence) {
>  			long timeout = dma_fence_wait(q->compute.pfence, false);
>  
> @@ -237,7 +237,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
>  	struct xe_exec_queue *q;
>  
>  	xe_vm_assert_held(vm);
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
>  		if (!xe_exec_queue_is_idle(q))
>  			return false;
>  	}
> @@ -250,7 +250,7 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  	struct list_head *link;
>  	struct xe_exec_queue *q;
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
>  		struct dma_fence *fence;
>  
>  		link = list->next;
> @@ -270,11 +270,11 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  	struct ww_acquire_ctx ww;
>  	int err;
>  
> -	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
> +	err = xe_bo_lock(bo, &ww, vm->preempt.num_queues, true);
>  	if (err)
>  		return err;
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link)
> +	list_for_each_entry(q, &vm->preempt.queues, compute.link)
>  		if (q->compute.pfence) {
>  			dma_resv_add_fence(bo->ttm.base.resv,
>  					   q->compute.pfence,
> @@ -311,7 +311,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
>  		q->ops->resume(q);
>  
>  		dma_resv_add_fence(&vm->resv, q->compute.pfence,
> @@ -346,8 +346,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  		goto out_unlock;
>  	}
>  
> -	list_add(&q->compute.link, &vm->preempt.engines);
> -	++vm->preempt.num_engines;
> +	list_add(&q->compute.link, &vm->preempt.queues);
> +	++vm->preempt.num_queues;
>  	q->compute.pfence = pfence;
>  
>  	down_read(&vm->userptr.notifier_lock);
> @@ -528,7 +528,7 @@ static void xe_vm_kill(struct xe_vm *vm)
>  	vm->flags |= XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.engines, compute.link)
> +	list_for_each_entry(q, &vm->preempt.queues, compute.link)
>  		q->ops->kill(q);
>  	xe_vm_unlock(vm, &ww);
>  
> @@ -586,7 +586,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	}
>  
>  	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> -				  false, vm->preempt.num_engines);
> +				  false, vm->preempt.num_queues);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -1229,7 +1229,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>  
> -	INIT_LIST_HEAD(&vm->preempt.engines);
> +	INIT_LIST_HEAD(&vm->preempt.queues);
>  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>  
>  	for_each_tile(tile, xe, id)
> @@ -1416,7 +1416,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	struct drm_gpuva *gpuva, *next;
>  	u8 id;
>  
> -	XE_WARN_ON(vm->preempt.num_engines);
> +	XE_WARN_ON(vm->preempt.num_queues);
>  
>  	xe_vm_close(vm);
>  	flush_async_ops(vm);
> @@ -2083,7 +2083,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	vm = xa_load(&xef->vm.xa, args->vm_id);
>  	if (XE_IOCTL_DBG(xe, !vm))
>  		err = -ENOENT;
> -	else if (XE_IOCTL_DBG(xe, vm->preempt.num_engines))
> +	else if (XE_IOCTL_DBG(xe, vm->preempt.num_queues))
>  		err = -EBUSY;
>  	else
>  		xa_erase(&xef->vm.xa, args->vm_id);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3681a5ff588b..9d55cec14165 100644
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
> +		/** @queues: list of exec queues attached to this VM */
> +		struct list_head queues;

To be consistent with the rest of the renaming and avoid ambiguity we should
stick with exec_queue, so maybe:

    struct list_head exec_queues;

> +		/** @num_queues: number exec queues attached to this VM */
> +		int num_queues;

Same here with:

    int num_exec_queues;

Francois

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
