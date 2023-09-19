Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F01CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 21:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD1410E15D;
	Tue, 19 Sep 2023 21:15:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0C410E19C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695158131; x=1726694131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ssrYsHild2fwtNHQppB+xeNxkgLC0diiRXEo87T6+mA=;
 b=hMbC6+HFO90thj4SCgqMQAD1juY/ug/T8SJF+BPbVjRm9YWKcB6fmypQ
 GcWg1MAcMHSb1jTLouEkjZlWtkbcmaIvdfcMcdM5xyw80czZJjTg7NqKc
 Ih0CxAwiM+5Uf5id2PYM3+X6BX3WuT7ApAgp/T7XV6EesNqXWifLuOoRN
 FURcYLW7RTRiM3t0Q5q+yHe1iNYuB1l3ERaEbE88y9R3FE2K9fYF3WN9T
 1c7ZjPlkhWVzuY4HcRveElCaqe11+fsgE+becEzFT+TS5wYz5g1/x6Sn3
 Ca7o5hyOa5b6mN6aKZc8mtT8nEd/MVAfu/7/f+e7rYUXC3gY+UDcOPnWv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466367602"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="466367602"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 14:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775704736"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="775704736"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 14:15:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 14:15:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 14:15:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 14:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw5xSdf79EK8OVDVXY+Snq8LTRs4ntPgz4/BYtb8AADxFBKjotrswyTRGocl4MqOvbZGZwvW2dkWelmNoz+2UKdlkckVZ7ZsFvL5cumB5ny2vZrh0KchPHWzyTc83gh2zJi7ZJzUULiNDtkBD3z/FPpetTmH3ApjJqUtKlIKzz88iZFyXgZcD8C1T37u9b/m7YZZiH9qdpVEPe18AAPaNJiBTcHvA82IJJ54t+8mQAt9PlYqU6mTNAweghrqVvl+euWn5w0NQCqij1ntEdqOGLoSrD4uaUf5s/NkYqcZMFdgeQF7sGC2CqDNcZgn8lht+T/we+Q5NSYQHCaWRBTkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvbIyL40fsScNjCJFpPtpbeyPXxG9gE3rIaM6qBx0yQ=;
 b=k17hC6YSTEuZPWTwQxbJjt77kTE1fZMt0c2GRe/EmkZAZT3ivr3Xfus03iJ1xox3BM+LD7DruKNgNVGojMSxp1XUs5PVx56WLeFz+z1X5VoLpxCmZSkKpQIiUPDu67GjIleAPexTG6gDemXSn5pNTEW46OOLhW325fIsYjtntNQOYA6m2I2P/bUrVzyTfDMv5D+mGCERt7X2gaYMWqbwKmgPmPfzvB/4rW9WxMiLKdN9UYnNbhN2TcYHBdJhWxaTfIZU6kpmKovoaN3VMYZpV5TGVaPKAttSsVCn5py1BlnPKekeM1YHc7TKYN4Bs5HYTmFm/2TwhlAtKwaV7LsMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Tue, 19 Sep 2023 21:15:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 19 Sep 2023
 21:15:09 +0000
Date: Tue, 19 Sep 2023 14:15:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230919211506.GH233750@mdroper-desk1.amr.corp.intel.com>
References: <20230919144111.32702-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919144111.32702-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BY5PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::47) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ddb6e4-a613-4ecb-7787-08dbb9558150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSfdv683DQhJRAH6lk2n3EyccsGvx2I/ldY8RlEH/ddqxRVC0Ch5w7D2keHkqCTX0Y7o4hR6JHmkIZDhE/9px4d3jTU2qy8Uqy2GifKiCgt9g5RKGjfzVbhDt4GWZROJLRfjVIARpAEwAgzgyqaFp6lzasG0YXXbilqJtX3SkMK/ecrdSAkPSl1WilBihL8Ilm5LBsR0IeqM5BqM7+QdT47lu5peA8IThvcMQuZbI6l0lzS1YQ4NnLYCVZEfjhySB6dOt7GdOZKe1x5YsAQUs7f/FAe1lxZrQoBLpq235kYfCBVD9d5W6AF36BzNLspJ4CqVHDmrKYUVEF19U5uR3NovHt4zTW0aEgxOBXIR4iUoBTUUl1GS0M4rJio+1h1YewUgtJmQ7OOE1PA4+z5CTOx1GEdgKo4Q8CnKq5BOXmRjRXb3xLtxslR9wR2d5axZWm4vz1rdEf5X2JDHQjk9H6MHtvO1Hi/CsY+T+ZvaaIfApsi6m6JlcLyVqiV0S/pSF7Osg+Asso2fUMGeke+l7yt0YhQlg1gkJi0qnmDsgtKg4qTJFbbicWaf25YrJde1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(6512007)(478600001)(83380400001)(1076003)(26005)(2906002)(66556008)(6636002)(66946007)(316002)(66476007)(8936002)(8676002)(5660300002)(4326008)(6862004)(41300700001)(86362001)(33656002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/C5tqXbQP1haktf2jg2X+48/4iPq+lQ9AuoP+4YHHq6BugEyj4nesYsGRDUm?=
 =?us-ascii?Q?HwjxdBJ1dgDsCHvWxkmDza9PgbZCn4pbhqDZs6N0KsJnV69iK8+IdCwv9y56?=
 =?us-ascii?Q?J1jI7kHBc2JGnX3MdBpUsSsXCj14/HsBYlX8OuoFTavp43eGbHzS2ktqWfvQ?=
 =?us-ascii?Q?pTWXl8wVb7c8jfdDUgTHuMkjOBzXa5HSwOXqQlg1dg2rCk+jc9OW5bSE9RJs?=
 =?us-ascii?Q?lD681W9UELtTAeSEkz8nP9ya4ydRBv7ZU8gObLiil6bHm0xeGj/+hnyenBh9?=
 =?us-ascii?Q?BieKnH3ypBxve1mrUcXtmTTCGDw1b0ewGNDZoKtJo+tFXlezVP/pKLaJ2/5m?=
 =?us-ascii?Q?9Z68C6d1I94akTdj8qWeCEVzmINdS6053cx8VG/BYjG2lPuTX0WmUg5Wgmwq?=
 =?us-ascii?Q?VRHiSLNi3f4Sfu1LQ6sCRzKijm3yJvw3RZ8F6FrPjgCLDBdZsXgu8N9mhyvm?=
 =?us-ascii?Q?t4e+hRUB201GhcBSJ1QXJzjQmAOGcLLnKBPRVA+VYR7nfjBXnjYJYaQ4m4/A?=
 =?us-ascii?Q?3sXxZsHF1IZ+govZaXkvKrhU5W96gmaKgBOEUZ18JnMuAsLSZf0qPVos6tdN?=
 =?us-ascii?Q?Fm2lUV0xBINgwVdZRHrxefEjx1RF34h+/s6PHkEVZXmAfk6suFOjoiSqee5q?=
 =?us-ascii?Q?mK6t4nXXSr42X3d8CCZAMz362ND+emIfZUArkfPijTXVLUGXRZW42u/y17a6?=
 =?us-ascii?Q?9Ep7Zkp/HTCM6I/JPXgjHQ5Hjw4tf7vicJgaM8Rj6ub10am+IqgIclMTaZGa?=
 =?us-ascii?Q?yC3QuM0s7TjCLRpHYOco1cFfpaLAkQ3xrHAalnpHgto2DIE67lQMiigBM6MC?=
 =?us-ascii?Q?iWEeHc+OWEHWdsUzdVBMeqvZDdj4+UQvh9QBaEX4GPDydRwqEOlLh6qm13GU?=
 =?us-ascii?Q?eYjFcxl3An4yNclX8a3SpwvdJRbhsCPwfB36qbpnDG7fg6zhV0QDIPyYj3a5?=
 =?us-ascii?Q?0UkraVKGKQcK9YeNcxfhKrBO2SGs4KCS4npBy+nXA6dkYDa2Ta4hulbQZt34?=
 =?us-ascii?Q?ZjvwBBa4qN4h+1Bmqs2QhHpx+73Xp2JaLXAgJrZAJMo7dZdiJAQemlPZ8qX6?=
 =?us-ascii?Q?sK57OH3/7VvamG9kLc1w01IzDHphq4D+LHDTMpXf/RHkIYzs1TlQro5mgvEe?=
 =?us-ascii?Q?a/ZBZV299TTO15Jk/V6Irf4uXnT/7DT7BB4fuplKjWQ0O+yNmFmfaVWiZOBr?=
 =?us-ascii?Q?hemKB37zM08SzemgV0ZqJniO6+Pj73SOBzaOzutSkZ5W8+v1dDVbtSfaaVsN?=
 =?us-ascii?Q?jOKBDUclbrO9Q6YIX+sMC3W1KsRh0RXiXT1UW3094OdO/Vzdd+TEAVCRtpGX?=
 =?us-ascii?Q?2BXD9J/i2iJzcanKT8MHcq9hZiZkf6Ed9Qbfq+rMkSpXifdZIfTc9tvVmiNc?=
 =?us-ascii?Q?Iodn4xpgzFl4I3pEsyhhKCPLIbXVt31MBfSPX6tgctwpJr7a6pR+u64Z0C7V?=
 =?us-ascii?Q?Y7nLkODwn27NJGrnHW8W2RlqadedaYqepYioEw+Ilg819IBzq5bnRKmIPUtt?=
 =?us-ascii?Q?UMmD4Iyvkv3x1bwBOiruCkpecZoQx0a3kDOQSP0otBgqqdZzfOHpymPSgmjo?=
 =?us-ascii?Q?rMc8Qgg5rdBMvJl/LrUjdpkk7/9oyE+RxrjhQBdqUGe4VBOgi+eVvm4PTiEl?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ddb6e4-a613-4ecb-7787-08dbb9558150
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 21:15:09.7173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aW1jFNKKWmJiNbKJizgv6/bzMS83AqJ+rZvpaj27xmd9WzHvM6zKB+mqTO4aZLqfMvUeoTMlkUWn/ZR/B1HpgeFkedaFvjrZWhD9h6aMJIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: Clear GFX_MSTR_IRQ as part of
 IRQ reset
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

On Tue, Sep 19, 2023 at 11:41:10AM -0300, Gustavo Sousa wrote:
> Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
> behavior. If we do not properly reset them, we would miss delivery of
> interrupts if a pending bit is set when enabling IRQs.
> 
> As an example, the display part of our probe routine contains paths
> where we wait for vblank interrupts. If a display interrupt was already
> pending when enabling IRQs, we would time out waiting for the vblank.
> 
> That in fact happened recently when modprobing Xe on a Lunar Lake with a
> specific configuration; and that's how we found out we were missing this
> step in the IRQ enabling logic.
> 
> Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
> 
> BSpec: 50875, 54028, 62357
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index ccb934f8fa34..3746e9204e48 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -456,6 +456,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  
>  static void gt_irq_reset(struct xe_tile *tile)

As noted on the i915 patch, the bits in this register correspond to
tiles rather than GTs.  And in Xe we do a much better job of handling
the two separately.  You probably want to move this to dg1_irq_reset()
and only reset the bit that corresponds to the specific tile that was
passed as a parameter.


Matt

>  {
> +	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *mmio = tile->primary_gt;
>  
>  	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> @@ -463,6 +464,9 @@ static void gt_irq_reset(struct xe_tile *tile)
>  	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
>  						   XE_ENGINE_CLASS_COPY);
>  
> +	if (GRAPHICS_VERx100(xe) >= 1210)
> +		xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
> +
>  	/* Disable RCS, BCS, VCS and VECS class engines. */
>  	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
>  	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
