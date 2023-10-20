Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F76C0032E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 19:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F6B10E5DF;
	Fri, 20 Oct 2023 19:45:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5E10E5DF
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697831107; x=1729367107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WuI8M4L6utssjuw8DSfKmV6BL0YlJFdBDNvYJlDBRII=;
 b=caynROnLHWIBwYvKSm5Kj7uif9XyJ9nXBvi5ZhE7Ri3UyOC5OPUz5Dk4
 WpV1t+ruEZW/m18BWc7+jHkcYK0JlENOWONyCZC0W7XdU+bOmMVVM9BD5
 Mz1g6FHay9qpuBnOsMtM4ywChLCF2njtlcuG6/uNZZPmbKI4vmcXkftKW
 Np9R653AYgLKEiuzBmSwt3zFA4zSsGJnREGmSkiormO1nOFS7PTrgOJRq
 KfmEyasTJ32dttarPJ8W1GZUO9nLtBtWV6X+zS1570lPKAmy+PIFN6zeW
 ug4TJe4iUrdstOx1bpDoETFOuyJNTrhUtUmUMhRRpIO6WjKMLayzWAfgl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453040465"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="453040465"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 12:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="757560613"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="757560613"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 12:45:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 12:45:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 12:45:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 12:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYzEWBn5iFsjKUh389g38X1gdrzlXyxn7r5PKZLF6GF9XHKtuMxs4l4uPDdzSx1ewkiOazCuk4rWCUurxfmNlYRVHw3H/aMG1r7vshQiqGqhsSnpY5lzcJ54A0T8X1CIOGViVS7y8anN2hRKN+7KvDvt8wmFZpR3xGBNY+AkvkLMDGHnkgOlTx52EGlk/OjDdwZYlGdCL88D5B2djZGw8hZ5OPwVlwsVxnJSqxIAdS9WYfo0vwPfls956ruK8+0nfxRLpQZoewDfidm225XPdxezrqvNzZzU+3fj+XeDTntS/eWcXIvlE7lFJm9TeeUhX2FlzSXfq6YHs+iF3o51lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRSGVmmmSfjWSkBJFDZIC/ufHR3hxW7J3vaf/sbo8fg=;
 b=TbFYmSGME+nGJXhCjVV1/QAkLvUPiKJRlu83G+CHxxrdzFXp7tnXZ2Oz2Mcn1f/Osa6iFaRz98ZrXJy3d+YZ0ai8kB5IR9bI+BzoRRUULH6hIG0M9rrFuM0vftctNA+ANqc9oxobKeHogodxnw4LMfhKgQdAk5jgEDK56V9NMLRtFcoxleIzvvtKEgPIl/inUV9ndaTk+CfoFD7OSvtCJwG0FvIG6DBvKgNID+Lt/zehPCKRGxKkXDwaJ52Mglrpcsn+PCQy3skCmA+LBBw98kOmtNgHKaGAsMhDwFZjKNBRBprCZFd/N4agf4MjfuIxRkniazRmQ1NP+WSGNf9lMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 19:45:00 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 19:44:58 +0000
Date: Fri, 20 Oct 2023 21:44:45 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZTLYrc6OqL-UfWlX@fdugast-desk.home>
References: <20231017092908.84177-1-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231017092908.84177-1-aravind.iddamsetty@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 515df86b-3d66-4f45-8e50-08dbd1a50a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yrOtvtMs4xcmasbij5zZJ9yOf+tl/TRJpqU+1MXhzL99DVJiBUN91HS4WJMEOmiP2CCE7iYPvzakbLG1U/66l2xPva2e9WaI04abiB3gkLkrO7ZMUhkgNlehhuSX0H/VdPvGqCP1nMpP9M7YX2jSyWNevn2/JofmH7LRj3ekAkiN+p4V9q+KTlF35tTCwhByWQMXtUJWNJipPloTP6GO/YVaOEfvEFYb5eOA68t+3KZ5XJmYdcnZkJJSZJixZIDw+go6d0V2ivFonLFuKfYR616Jc8u/X0TzovYC/TKaEI5P/R/98K3Vjz2M5/yBCKYfQ6be9iyDSgFbvYiFk8liazmc0dGHsipHas+dZdL6c6mBcTE/hvxLLFKahxwVs9xa1R6jAiZY+70sVTjMamHDldqquli4a25gS4iK5C9YN8PWT8CHtH5IktS4PA1LcA82W2ChPv5IyCsPXe9SX24q/VHP95fXMIYj2GHveaA2KasE8AqAysYtVEPoJhBSAP+4RN8WlRiNOZnDYGQXBKUjjmmBpLyMfKdM/Lm2jP2VrlT9pQNfZYPiipl9AXhELSWk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66899024)(8676002)(38100700002)(8936002)(4326008)(36756003)(83380400001)(26005)(82960400001)(66476007)(66556008)(478600001)(54906003)(6486002)(5660300002)(66946007)(6916009)(6512007)(316002)(6506007)(9686003)(36916002)(41300700001)(86362001)(6666004)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+IwYgfIyqNCMUqkXp6yAHPUf2QexTkWLVLVkybIi51pZlaI7iFOnQwFgOYyc?=
 =?us-ascii?Q?ql3N3iqVSpq7uil/ha/FU2D7y+DwLmjM2JEc5Mk1IHQFCbD45peovRRtrMG4?=
 =?us-ascii?Q?PfOiXQMLGSpXbcX6Ofr/famoOIhM0ja6HlumM/Do3Fo+l55cYICaCklxbuY+?=
 =?us-ascii?Q?pVlSsidJeLFCCURPK1R+drEyZdd5dP2nuc1xT3CA+BONpmOhsLqQrIOeFePU?=
 =?us-ascii?Q?YCjlD1Sbn+zo2J6rfykk4JpZ0PQq6TY8F4PLmmIh/SDe30OgqndZ1RAs11WV?=
 =?us-ascii?Q?HpTrp66gXQKqWcYWL8ptXFegOweJdSutBttao3B5BoMHhk55XvHkNm9XnEbk?=
 =?us-ascii?Q?85MN4zIvbSHayXr6Bie/I+/PBis9mn+FlXtDBNWx9LtVExb3I/1M71Ifkma6?=
 =?us-ascii?Q?rJwJeUIMX6egenVciqezhioMmDzEf9PBeqeToiThvHEK1LiIiU6Phr5FKi/v?=
 =?us-ascii?Q?E5/5tJdGUH13PzZtHXDg2lCBX78AGbBybFNL/gaDgtD4U3DuJDyYQ19D5Sv/?=
 =?us-ascii?Q?vjOLMZR35dI16U8xNIR/B+ZhQUPgmOGMrQcRVAi4eRPUagG1oYoUmP6kLfSw?=
 =?us-ascii?Q?Au+w2jtH2baGYy2pVx0t3RVuomeaNaW57b1+UZecmWvSPaC7/kPjgTcFzzbq?=
 =?us-ascii?Q?5kOxDbcQCOUKFf5h1GsZHXH0gQeTByIFJrT9uFPmpBQ7LmQees84qJHjY2Ji?=
 =?us-ascii?Q?xjHbPIPmc316uKhr5hw86qE/AQyorVHw4LVIn41gs9xGRE/Cv65BEDOw+nJv?=
 =?us-ascii?Q?jgqJ+wPLGWrtebkQWt1eUKmfA/0NnViehj5lFQBg6Ophi4GbY0e+4kkew2lo?=
 =?us-ascii?Q?OBhxEnXk2mlQ+Xal5PHcOTAfGJ6MLXnkp6ztdJuEERvKfnlKVJq75FX3KtOh?=
 =?us-ascii?Q?e1JDVocspyewwaZIQevdxMw6AcbcXwzgbsGrW7/TUFTIo2gHweWjeXq95JsX?=
 =?us-ascii?Q?uUQEqwrJ3TL74QPIrb5bU+sriMXYkkfDdaRXXOb9t2m9aFnNomSNBb4YmvMe?=
 =?us-ascii?Q?7msTriDbXgDfv3zeTKkFqQHkuD6PO5jgFbnokcX0FZ/6zoToLFzMFY8nNFfi?=
 =?us-ascii?Q?DH06usB7ZMbDfYI5E0fUA6ltRi3CmpgSl1CWrq2rk7pmi6PpSY4Q+DH9HSdl?=
 =?us-ascii?Q?vEbZRXdicVTuR+QPBohX2Vl1YpD6w6wcnNFVxVNsErAaz95plSnylK2X3TkG?=
 =?us-ascii?Q?gqtd+rGGJTw/f7ROPbf3y70zGigKbKy4bw1QaPRgOmfVvOIbfVicOG06ZkIr?=
 =?us-ascii?Q?0ivXzHgxDpsYIrAINAF8S2ljhWCNRPIVTBXMoE3oPD0OCBnrBTa9GK3P05UI?=
 =?us-ascii?Q?8SIKyEsG42ooTXw0kEOjU0Pi+9jQRGDcSPHtIpZrBUxsYpQhKGF8Ny9tUP4E?=
 =?us-ascii?Q?MHID1x1HmxdLGEG1Hi9ABCfBqFgxEy7fpdfx4xg/M5wQWZhmzQBFn2BFrM6t?=
 =?us-ascii?Q?8kvLnRfKYnN8REv03k2ogqV4lJwg/zSME7Ve4B05VsA8M8gTtApqR732dMR5?=
 =?us-ascii?Q?+NYhlc0mro8y6w0XUV+d9d6iwpu7ODsWXt72QQZbXtlAk3Lj+4j8eyf6VaBE?=
 =?us-ascii?Q?uPmiBbR2KpNvzTysDNka6s3AYz0NyZpjPCBtjEzhtHsYYZnmxHv2Yemm6DV5?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 515df86b-3d66-4f45-8e50-08dbd1a50a80
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 19:44:58.8544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/WspFZCPYBw/T8hNEHYfnUIlT0+gGnipH4ath0Z/I/No3DmmAClGEl+92C5ejYVoivTsavqlYTtffClIWpYwmnhkRpUJexRu7rT5IULUp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pmu: Drop interrupt pmu event
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 02:59:08PM +0530, Aravind Iddamsetty wrote:
> Drop interrupt event from PMU as that is not useful and not being used
> by any UMD.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c       | 18 ------------------
>  drivers/gpu/drm/xe/xe_pmu.c       |  9 ---------
>  drivers/gpu/drm/xe/xe_pmu_types.h |  8 --------
>  include/uapi/drm/xe_drm.h         | 13 ++++++-------
>  4 files changed, 6 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 61350ed32c61..29f539f1b94b 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,20 +27,6 @@
>  #define IIR(offset)				XE_REG(offset + 0x8)
>  #define IER(offset)				XE_REG(offset + 0xc)
>  
> -/*
> - * Interrupt statistic for PMU. Increments the counter only if the
> - * interrupt originated from the GPU so interrupts from a device which
> - * shares the interrupt line are not accounted.
> - */
> -static __always_inline void xe_pmu_irq_stats(struct xe_device *xe)
> -{
> -	/*
> -	 * A clever compiler translates that into INC. A not so clever one
> -	 * should at least prevent store tearing.
> -	 */
> -	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
> -}
> -
>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>  {
>  	u32 val = xe_mmio_read32(mmio, reg);
> @@ -361,8 +347,6 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> -	xe_pmu_irq_stats(xe);
> -
>  	return IRQ_HANDLED;
>  }
>  
> @@ -459,8 +443,6 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	dg1_intr_enable(xe, false);
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> -	xe_pmu_irq_stats(xe);
> -
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index abfc0b3aeac4..318bbc9c1c9b 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -114,10 +114,6 @@ config_status(struct xe_device *xe, u64 config)
>  		return -ENOENT;
>  
>  	switch (config_counter(config)) {
> -	case XE_PMU_INTERRUPTS(0):
> -		if (gt_id)
> -			return -ENOENT;
> -		break;
>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>  	case XE_PMU_COPY_GROUP_BUSY(0):
>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> @@ -181,13 +177,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	const unsigned int gt_id = config_gt_id(event->attr.config);
>  	const u64 config = event->attr.config;
>  	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> -	struct xe_pmu *pmu = &xe->pmu;
>  	u64 val;
>  
>  	switch (config_counter(config)) {
> -	case XE_PMU_INTERRUPTS(0):
> -		val = READ_ONCE(pmu->irq_count);
> -		break;
>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>  	case XE_PMU_COPY_GROUP_BUSY(0):
>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> @@ -361,7 +353,6 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *unit;
>  		bool global;
>  	} events[] = {
> -		__global_event(0, "interrupts", NULL),
>  		__event(1, "render-group-busy", "ns"),
>  		__event(2, "copy-group-busy", "ns"),
>  		__event(3, "media-group-busy", "ns"),
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 4ccc7e9042f6..9cadbd243f57 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -51,14 +51,6 @@ struct xe_pmu {
>  	 *
>  	 */
>  	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> -	/**
> -	 * @irq_count: Number of interrupts
> -	 *
> -	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> -	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> -	 * occasional wraparound easily. It's 32bit after all.
> -	 */
> -	unsigned long irq_count;
>  	/**
>  	 * @events_attr_group: Device events attribute group.
>  	 */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 24bf8f0f52e8..be43ef0b92e6 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1041,7 +1041,7 @@ struct drm_xe_vm_madvise {
>   * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>   * particular event.
>   *
> - * For example to open the XE_PMU_INTERRUPTS(0):
> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>   *
>   * .. code-block:: C
>   *
> @@ -1055,7 +1055,7 @@ struct drm_xe_vm_madvise {
>   *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>   *	attr.use_clockid = 1;
>   *	attr.clockid = CLOCK_MONOTONIC;
> - *	attr.config = XE_PMU_INTERRUPTS(0);
> + *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>   *
>   *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>   */
> @@ -1068,11 +1068,10 @@ struct drm_xe_vm_madvise {
>  #define ___XE_PMU_OTHER(gt, x) \
>  	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>  
> -#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> -#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> -#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> -#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> -#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
>  
>  #if defined(__cplusplus)
>  }
> -- 
> 2.25.1
> 
