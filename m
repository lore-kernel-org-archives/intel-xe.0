Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9BFC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 00:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B3310E22A;
	Wed, 13 Dec 2023 00:58:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C6010E22A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 00:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702429093; x=1733965093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O04EjHKYrvp/x6eAkHS3+pqkksEICX6+rQKmJppWYQ4=;
 b=EKEgJwYoYMx8NsvFsCIeCIo4iv4Ks4brFAQpL7uKiNhg9oUve/jaehSk
 azQiPmRvXU6rwiAEQNIRveaWCfZ3Ioe85pxUsNxI5NwNC5f4B4a0KfQLu
 lYiLOhDIBuXCIqqMI5PhB2GV8uYHkaV2t68DQa+4FwSISpkj3NAUomdxJ
 Pl9PYRukDBKBqGIY6GRTIcTP68R3nvrT33s0uAkqAP/4QVH1kmmaGPvIF
 oAmTLx8RJswgQY/ecIkX5WSH8TFF5oBsfk1qmKrF4eLqru2CvZU8kTGT/
 R/U81NQF5rNKWmgJSzS6Je2zoQGEx+Ed7JqVlgiwneSVIFr0kM2K7jStQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392071448"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="392071448"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 16:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749906403"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749906403"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 16:57:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 16:57:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 16:57:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 16:57:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPwu5xFXDWke56IPDYuzA/FLntFF0bhs4SGbBcT7eRIkXURuAa+CRUsiAgr5cZMNGIEdywmJUIZwJfZ/5IbkFr/DQlzUDLmFWju5xY82HNl5cZ5N1yVra0Obna5KIaU1OsA1AsRx1trUioIkk5OOK1ja+kBgcLSTIgpr8DomCn2EaUqLt426Uf7eOZYfg7iTRTjHG7I7UwZozt4DGIp1LoQbdBMu5cordJ/lmaM3TT0Jldg36QErIgiAoxU4d/+cyujwJlgr6l/Pxc12aYUlua1MwcIANx9WzWlbEVXXTEdv/igjv/lKLs13Dkkw2cp5um+z6dbADgrAVha6hZNneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tcO6iqjKrN5TxhL8dFjiFqZ4fJuhjLgHd/bOk3D6vk=;
 b=oHOfKNR3fFhZQvnXxqLW86XjDuteEyTbfsacJRMzM0ngbcE76g10Sdnm61M7F7mcGBCIG6w7DVh6rz1k8uyWu2qqbhOgPnAzK250miqNzohKBlIerrQB2eaSxp8f69iFS81A4NEewjZPAaEjfGC2QALTp1KC/HVm3zi7NtyyC7dh5G8gRh4SJUHYlsWvgM3Ff9VmfEpI7yXEDscO9o5sbIWBLRZ6L3qedSqoTM8fIctenIowTxeqfeb0T15HCoE4NpDYZRRNISK0g/XE5SW+lqgvXXPCUY5tp2fk7i08VraNON75RhmmHFRzUD1I4l0XMLur2ReK4OFcAIXvavttMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 00:57:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 00:57:53 +0000
Date: Tue, 12 Dec 2023 16:57:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 10/10] drm/xe/vf: Add VF specific interrupt handler
Message-ID: <20231213005751.GQ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 781ce4b8-8e93-4c75-4f4f-08dbfb768979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: grdMJtnKOOh17EIuAHSbltrcmB3JF2mL5+PuZTMKXtRoyZc+U0nC6oIOUMosZzJn/wdnBd/dILYVJjCil7Cfg4FcbCNPrbdO3dgfoX4S4nPTvK9Zsw3ehgkp5lrLMF1KBLR2lmpFLpqjG2jpSZP7NFiZi0qPM+Kp0fOI8a9gkq2B4oi58WG73XttgwG3kJH71T1fF7VntPdhj2aU/4rGc8ZgqzsZkTLnhnJCMDdI1+Mh1nMOwp1N73dxSMP/DJ2rEuyzx34IAjaGbZUL3vKAL7Qxg0csbZhSUZvPINfnhw1BrOm6vW63JaWbKVEz3Q5sfjedglWbk0YqACXoXx8h7yaBnwyhseueoJHlUAgb5IKzn3MpeDmDgQ9Ltf045qOOl8jLxujcv5row5pYfhLfP68ewBF7HoXs1UIpQ2a576mjm5UjWgio4sNy36QAVzC/f593icwMK8y0XCNGrO3Dsofyot+slyAtTZmnnm/H7qHImHlpPHFiuBWwD/A7DLwsEZgr7YJQsFfCrKHBciDbX3RbiEOFHf4kkz7LIAdQELVCA2DdxMUHXwNt8t7kUDWC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(6636002)(66556008)(66476007)(82960400001)(86362001)(33656002)(83380400001)(478600001)(26005)(6512007)(6506007)(1076003)(6486002)(316002)(2906002)(38100700002)(5660300002)(4326008)(8936002)(6862004)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1iJhQciYq1tC1Wni8Jyg71FBTiz/Z1YaFwy4OwEmDIJ+u32ybt0Co1ZBeYH?=
 =?us-ascii?Q?N8ZcWTgZHE8z4YWFnNgMOYsekmb0n3Z76POsX/iOb+xoXjuZhA6Hhl3gf3mu?=
 =?us-ascii?Q?/W2KfLdwV1BqebBblKNaEObfE6xkuDsoK0vSMZL0X0KD6A7JeBAAOxSUeqgf?=
 =?us-ascii?Q?knO7I0Er8c/DvWzSyV3Z1qZH3Gc3zXEKOmUANe06hNqsf7Magekw/F75fLWb?=
 =?us-ascii?Q?hmpbds/zDAkmoUyw9w9vjwiYhNKrChNUfq+ojgHRdlUbORQuvwAcCQ9IgGbL?=
 =?us-ascii?Q?N4Fc4mboZvnozSjul5mc+LqTiJTIliZjPAwpIwOX7HKseeJ/+cqQlIMMfRwL?=
 =?us-ascii?Q?fjf4yCpAEbEll1omnQl2RVRfdvNsMoNM08Fh6sEoHNHFT/CXixtwqVl1QuzP?=
 =?us-ascii?Q?sX9Vx4JMb1iBWRgbBkgeTpQi+Ir9MgMwX3PdqDEBpaXDxGkhfX+7XKX9YxCT?=
 =?us-ascii?Q?Xgx4UHXlz1GABpQ3cZz6VD6qnSCNIDruHWP3/sZLVs+RW2c7LMRf4jXJrv4m?=
 =?us-ascii?Q?GA/Y/0V48KZkZHsV69RRMebsJPMwquDQJdNTQCXi2pQL6ck+9K8XuRXuOO9g?=
 =?us-ascii?Q?pJ8AsXsV4Iezf5Dj0lwwTgST0/a1qTnkMY9Ff9hkOlQoTKJ3dHpJnomaLeW0?=
 =?us-ascii?Q?kZGy/IwuGU3Mr5lA4XJRTl2iCYzBPmBmyiSba25OzZeAsYcV9VBJEwEMSixA?=
 =?us-ascii?Q?lBsWoSVmjqDhy3Nw+apZEauCdd5vzXQyHho6f4EdF66uvgVhHq91JbVRxJHg?=
 =?us-ascii?Q?mabcvy5D19D10RFIu/Ocn5qZYiBggb7u80MzmX0NI+73wM9FzEyJktr5UQfW?=
 =?us-ascii?Q?uDEwrOyG8Ce/eW2ShKDrwlOA+PHw9BeLS/6RR9rK3im3S32Yd2HgrDQmQ6DN?=
 =?us-ascii?Q?AD5y0quTrUyQwEohmM2EihTvIFyj7wAXZ0XHkNdXPxXCDAKEG3dQnLktXGXT?=
 =?us-ascii?Q?nmgrdqcjA3i6gBKtZtC0EbPjl5KTpMWNJaGuitv+oJqjHUTc0aZKDhJL8EiO?=
 =?us-ascii?Q?5cnCz+zB522V/kDG527COM2G4Fv2mS0vIAvGyiXoTNz5BE41VI6o26/g3Pdw?=
 =?us-ascii?Q?c6X5LaPxjHMdZ0eYYUA5pyFr0wyJlKdSbbe1hLzONcdIoAIEVnYhcsCei0DK?=
 =?us-ascii?Q?kEk8UwdQmNqSQFKMbihv5+vapsVDoTiRoL2VHl0UcYw2GPK4iLoW+Q+QBQU+?=
 =?us-ascii?Q?I5t4FAcNl1LiZjuQd//fqcJdAS+Eton3ikAqB9w4QAUB0H45QSEWsfjpXE2I?=
 =?us-ascii?Q?qzcl9SH3G4ke0+LDbSjyUYvzEErocWZvjhgI6djYN39XKv4ZwZV3nQZ/8Ur6?=
 =?us-ascii?Q?RhYGTCSWCTqaWCmnKsF/ac39JqBCjrvZ9rjRBxwI4RY7TPkLO1J8x5AGMH6e?=
 =?us-ascii?Q?aYjEZOjjCbYPI3fKDZsD6W2NEhkVJY8mnZ/372w/8fO/wg2+6LpwmlZ7+0dj?=
 =?us-ascii?Q?ZuhNszy9LdfT4WYz3XN+Cs+sfoCWzVOeurLxjFba/ihjKRWa1/iEHTOL+c/b?=
 =?us-ascii?Q?cABavwWy0GHXbN3f016DxKPpeKCrIxOyhiE9pGQUXVQDqqhxVL93KPFDkEU4?=
 =?us-ascii?Q?ZbrMFu6WLYuhTmXEYTXwAg7Q8HNoJIgBdrjs6QkMWZ5lwZBu1nr1wVVCiih+?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 781ce4b8-8e93-4c75-4f4f-08dbfb768979
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 00:57:53.5379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7gEzpyy15O/X9LKq3bNPjdWYezYQVyOoYN8j+nLa5WxDB6tzC9YkHqGEKFqkIuBvFYvsKIBRFpbqgA8uXLaLsN8qIpIIc+RLWhuqar1+aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:00:54PM +0100, Michal Wajdeczko wrote:
> There are small differences in handling of the register based
> interrupts on the VF driver as some registers are not accessible
> to the VF driver. Additionally VFs must support Memory Based
> Interrupts. Add VF specific interrupt handler for this.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 71 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index d1f5ba4bb745..907c8ff0fa21 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -17,7 +17,9 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  
>  /*
>   * Interrupt registers for a unit are always consecutive and ordered
> @@ -498,6 +500,9 @@ static void xelp_irq_reset(struct xe_tile *tile)
>  
>  	gt_irq_reset(tile);
>  
> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
> +		return;
> +
>  	mask_and_disable(tile, PCU_IRQ_OFFSET);
>  }
>  
> @@ -508,6 +513,9 @@ static void dg1_irq_reset(struct xe_tile *tile)
>  
>  	gt_irq_reset(tile);
>  
> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
> +		return;
> +
>  	mask_and_disable(tile, PCU_IRQ_OFFSET);
>  }
>  
> @@ -518,11 +526,34 @@ static void dg1_irq_reset_mstr(struct xe_tile *tile)
>  	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>  }
>  
> +static void vf_irq_reset(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	if (GRAPHICS_VERx100(xe) < 1210)
> +		xelp_intr_disable(xe);
> +	else
> +		xe_assert(xe, xe_device_has_memirq(xe));

Isn't this going to fail on DG1 (version 12.10)?  I don't believe it has
memirq does it?

Of course I don't know how much effort we want to put into these older
platforms that are just temporary development vehicles and will never be
"officially" supported by the Xe driver.  If we never enable SRIOV on
those, then it doesn't really matter.


Matt

> +
> +	for_each_tile(tile, xe, id) {
> +		if (xe_device_has_memirq(xe))
> +			xe_memirq_reset(&tile->sriov.vf.memirq);
> +		else
> +			gt_irq_reset(tile);
> +	}
> +}
> +
>  static void xe_irq_reset(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
>  	u8 id;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return vf_irq_reset(xe);
> +
>  	for_each_tile(tile, xe, id) {
>  		if (GRAPHICS_VERx100(xe) >= 1210)
>  			dg1_irq_reset(tile);
> @@ -545,8 +576,26 @@ static void xe_irq_reset(struct xe_device *xe)
>  	}
>  }
>  
> +static void vf_irq_postinstall(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	for_each_tile(tile, xe, id)
> +		if (xe_device_has_memirq(xe))
> +			xe_memirq_postinstall(&tile->sriov.vf.memirq);
> +
> +	if (GRAPHICS_VERx100(xe) < 1210)
> +		xelp_intr_enable(xe, true);
> +	else
> +		xe_assert(xe, xe_device_has_memirq(xe));
> +}
> +
>  static void xe_irq_postinstall(struct xe_device *xe)
>  {
> +	if (IS_SRIOV_VF(xe))
> +		return vf_irq_postinstall(xe);
> +
>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>  
>  	/*
> @@ -563,8 +612,30 @@ static void xe_irq_postinstall(struct xe_device *xe)
>  		xelp_intr_enable(xe, true);
>  }
>  
> +static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	spin_lock(&xe->irq.lock);
> +	if (!xe->irq.enabled) {
> +		spin_unlock(&xe->irq.lock);
> +		return IRQ_NONE;
> +	}
> +	spin_unlock(&xe->irq.lock);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_memirq_handler(&tile->sriov.vf.memirq);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irq_handler_t xe_irq_handler(struct xe_device *xe)
>  {
> +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
> +		return vf_mem_irq_handler;
> +
>  	if (GRAPHICS_VERx100(xe) >= 1210)
>  		return dg1_irq_handler;
>  	else
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
