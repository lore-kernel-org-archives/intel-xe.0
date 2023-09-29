Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33923E77347
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 22:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED73110E0D7;
	Fri, 29 Sep 2023 22:44:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6118E10E0D7
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 22:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696027442; x=1727563442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UgskhUBWwVwAbME3o9e2FRSDNe5icdDHeBpGWmZfg5M=;
 b=L6XS72VCZZV5DqfGfcb7xp65nafnhIGt2hOFxmuCijH6GVUbQFGxdPQe
 WiE3eMCqjwIv88QD3PlnyI2AafJj0MEZ+3ear0/Bp7W/3ltMUs8jAIMoD
 DEsQYpyhLqIwid1ksHzRNMbSbju2gk2zYOPfuLmyT8fA7x3oEo1oR4foe
 y8zAHBI+axvNa2wT8HARgnFAqr7+HEDXXNQaPJnzV37PjO4rpW0ZX8li3
 Uma3VT+9PCiqtKo1FO8mdjv/rkf2FbXa4tXuA7E0hxKsau1CTKCeVf+Lh
 +Nn9r23m7mt3iWF/y5K8OALQtgzLPJ5OtlFyzwOVnsCiOKfr0I/0BjS7E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="362650423"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="362650423"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 15:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="779406799"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="779406799"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 15:44:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 15:44:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 15:44:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 15:44:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 15:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYzFV/Vv/1Qwm8Jsj3fPbD7C48H22WmFDX6Iy1LGXRNSE2lLu4ufbRspcm9H3GqiJIzFn4AetorvOppq/pH+gqGRQW6umg5zwpsprmcjtBBzR09AeSeI1Qbls1Ch8GH4iTEvKXb6Qkjq5MVF3yk4PaM0jVcSLH5xGj7TtDli8fh5ZmcNmPqVcwZEyIyZOxetNma1X04ZU7loBBmS85cLyqFBlNfCGhUXmW4Hh5apUcLleOeIhCgmM1+6kJKwG52TNZQJQ2PdGu0QD414mQC2pKFY2nWniDbFTsZ2outnit6I2mE/u/66VJMHemmJ1AQFTT/tIz4Dpq9uDTBHHUHJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIG9OTcpuw9+JUocQ/jjKDgOYpKpINVDPdPQpZEOXRw=;
 b=Fk7mNt7KZXD8hYSsMEbT/GOgSnWfYdwLTlM4muJxnZeuGj4xttWo+lOym5OSHuevqR752igCx/Fa5eU/bZdIt2UjYcf5hM2jDAWyA6SUs6kWEiTphuVt3cXq8JBEwZcTfhzlHzEhtn0pnI/0yZn6e18s3Y9wldm0Ne5Sl94qTVgnFBnyFUFGA9Y8chaXvCOuFJ3/NHu6aHgiQQJN3C8TxogKxMjCW86rMWaGfQnAGOVbt88SbK9ELqzIvzr75/eVdf/rvn2y4eHU00+OurwNTnu181MXTC7g0Cp3J4t5BWg9gD5YGCQmFnOgUoIWgESz//C9ZvCcBxHj261dwBx/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Fri, 29 Sep 2023 22:43:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 22:43:58 +0000
Date: Fri, 29 Sep 2023 15:43:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929224354.GM2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230929044959.3149265-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929044959.3149265-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0c59b6-df36-4ed3-49b1-08dbc13d911c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +QAvFgIY5Kw2/hT/YWohLHuyrIuX0TcE3CcmJbJHL1sX/G3J2saF5zxKPOnR2qsyELjUWdpScDbxHyXQ2Q73qIl5p3rh6TdyPksRtb9a3/8fa4eldTpeB+MbZOMYqyz+/nv5VxEi0jpDcCc9MQiucSze/EDMh3+K2UAW6i5LHc6M1rmSIiW4vG39aoaVkVAC+eSErMOhtoAYd0hOI7FMg6L/WiPF9LCWHJyI6K38Bdg361WSFKbPvOnVwJvK7r8m+HN6jcyIfsuF6w7xtUPQSzTj+q2Kp2OxyMbcS8MCQk0mopc/IdEypst+ZQYglSEg0lzabhgePcsd+QZR/l40fl2QSTywm/HmqiAyeQAYzKjfQsk8GHjUqZOsmidHBJMPg5tXtT6UF08JQ7+qVpJe3OZ9emTFEfsZTN/fDQsdq6g/7Wv4XaADEaP7njE/j8J/ki86Q+YBTCigkY6eyDDu//0zT7UrmB07BElLIkjom65ofrGdLPNNDjca++useDHOhTiDRSjbgeWs7hwN3KuvRD2yN+rIyp7BLGoI6S8yPLHokmCugBZpoUPvCtnnrBdL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(478600001)(6486002)(6506007)(83380400001)(8936002)(26005)(66476007)(41300700001)(8676002)(66556008)(1076003)(2906002)(6862004)(316002)(66946007)(5660300002)(6636002)(4326008)(33656002)(6512007)(82960400001)(86362001)(38100700002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8n5R9oOM/NSclX+9qapBLQNxTgelPapL8ZrSNSWL5A/4oDn8w3V6QRGw9BiN?=
 =?us-ascii?Q?1FMUgux6vefyygxPrf5VkBfy2dk1hjLBDs5usGk/GsWlv4CXyj2mS7fjTo1B?=
 =?us-ascii?Q?cTh0xBnMhXHyioZBjLPU3BjDBnIpYx46GxjCqma6ytJJOBNcBq6F7zO7HaQ4?=
 =?us-ascii?Q?3X3NBdEZJWCPf/FB9trOjrNT66VBPQubcUpALJqqM4K4lXdXe3R3ury5dbrv?=
 =?us-ascii?Q?aECLViZ+nlIg7m/Buj0xs0WlRl2+waHU9djluze7eDec6ceqZwnVX5xSiP81?=
 =?us-ascii?Q?Mv52C4NIS5JgHBF9NxmQtaiXsKFQX1tQKnkTKjoCWDc5hCeWBBP5obrKAwYx?=
 =?us-ascii?Q?eN9krzY6cfvBftvgb2E9LTGueDgOeKxvk5vasTmegX/iEPTJ+8urc/soSiIP?=
 =?us-ascii?Q?E9cZkx7yPaWukT+WcDMMjUuBJRNZIAmKg7QRyyo7sQeuHPGW6iBl5xQRqQOF?=
 =?us-ascii?Q?st9ljzWckNBhLIls1RenoBXVy2ezItRWrVKH1+3w/pVitW4CHrpNQpMvVczD?=
 =?us-ascii?Q?YX4YigG5RyQkJVWCkO0O0JH0COTGrGorVG6Rmlsex2vGURuV21vjv3aYVuxU?=
 =?us-ascii?Q?gPUwoGeL/jINn3ju5F4jXxOO/L5fSgfn/H13DkI+fzbc1WdVTJE6RYY/Xsv/?=
 =?us-ascii?Q?n69pf5wkOADVbFsYFR0PPuULXtc77GepSNFt2xsfnQ7zPB/TA2dEahtDi1yw?=
 =?us-ascii?Q?kfQ+8UdzXgnJAqUZBGvwVk68BKX00tbm0bLNRp96pVXyor9HTJDkjXreaTPo?=
 =?us-ascii?Q?OgNyUL0HdXAlSTTPnBTUwrhyWjIPfTtw5U2ZEAPIozOkBRrI2FE0Hc+P4FEA?=
 =?us-ascii?Q?Rc56fXK1Pa4+nWK9sI44wv78RvONCbtv5WZSEjBgb8h07BEYddtk/8NMBcKT?=
 =?us-ascii?Q?9mTqicb0I44Q8rUWe8+rMeLyahnPaoku8zCaNRzB+D8Rc0mH49FvMxC9bYIg?=
 =?us-ascii?Q?hhAeiJoWBJwHkFmH05TzvMbHz+5EEWoiP8WvkRFlaZ9/dYwwTt19a0Ao8BBV?=
 =?us-ascii?Q?mXxxLEmmJZBp3xd0T/oV7jb/aLWdj839bruWpvJpfpK5opk3U7Ss4ucm8ZzW?=
 =?us-ascii?Q?MvcNrT4M9MekLQUYxeNqvxgGgMZ4XlEZM//Zvo86EhB4FEZ3lQi1P5Nnnhz0?=
 =?us-ascii?Q?il1fa9FHqmkDGy7FbG2CH/5y310a/MgQQbRScgLPF8zQWzlN6IvZ18EN6StB?=
 =?us-ascii?Q?IBnygavaR9PeF40b576TTYxa1CcHWXHmHNLoeHv2OXAzggpWffZSKEF0L500?=
 =?us-ascii?Q?fvE/1xwavD91bm/WlLEGZr22u4xUOraeBJz2K647YZzNmAc3DEjLp47nQZla?=
 =?us-ascii?Q?iSrW9NfbQgE5D1Ksexu+ciUdkfAhE952HNvYqKUsBH25YzE7JSVigeDsjEqU?=
 =?us-ascii?Q?RVHR5S/EL7wQrfRYiNS78IX/XhupTdI4RpDSLb4XRr7Di3so4Q2y/vxZ7c78?=
 =?us-ascii?Q?raxOpvMheReP5GCe5g4hVRYZ1/fzAY5DIfAAYzga7d3MRiFqmHpl50CWGQFI?=
 =?us-ascii?Q?pzI0CxkmrlYWawcD/E8zQ0QH/g56hZLBGl0KlBoTxVp8fTfKmeJev1eP6BM1?=
 =?us-ascii?Q?zX6N8OyVDSWrCyXR2p3ZV66BhfqXkq4baPjyaxU7drpo3jfnsVV8mo6KcAKp?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0c59b6-df36-4ed3-49b1-08dbc13d911c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 22:43:58.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/xFzcc40W7u0EHAwY8OZJ5xUOiptqWZBZiy4qPnuPlD7jyg9ILOQlJlZDmseLlJ/TfI9dnFlAjaQLfRMbi4ziqorM5nyIALCcsrMnFUZ3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Extend reserved stolen sizes
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

On Thu, Sep 28, 2023 at 09:49:59PM -0700, Lucas De Marchi wrote:
> For xe2, besides the previous sizes, the reserved portion of stolen can
> also have 16MB and 32MB.
> 
> Bspec: 53148
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

While looking at this I'm trying to remember why we don't need to also
use the media WOPCM field (13:11) from this register?  Is the media
allocation already included in the value we're reading here?


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h      |  2 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 32 ++++++++++++++++++++++----
>  2 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 8a93ab169e04..dbb0ea1a585e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -69,7 +69,7 @@
>  #define GSMBASE					XE_REG(0x108100)
>  
>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
> -#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
> +#define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
>  
>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 6ba6b1b7f34b..79fbd74a3944 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -86,6 +86,29 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  	return ALIGN_DOWN(stolen_size, SZ_1M);
>  }
>  
> +static u32 get_wopcm_size(struct xe_device *xe)
> +{
> +	u32 wopcm_size;
> +	u64 val;
> +
> +	val = xe_mmio_read64_2x32(xe_root_mmio_gt(xe), STOLEN_RESERVED);
> +	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
> +
> +	switch (val) {
> +	case 0x5 ... 0x6:
> +		val--;
> +		fallthrough;
> +	case 0x0 ... 0x3:
> +		wopcm_size = (1U << val) * SZ_1M;
> +		break;
> +	default:
> +		WARN(1, "Missing case wopcm_size=%llx\n", val);
> +		wopcm_size = 0;
> +	}
> +
> +	return wopcm_size;
> +}
> +
>  static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -125,10 +148,11 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>  	}
>  
>  	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> -	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
> -				     xe_mmio_read64_2x32(xe_root_mmio_gt(xe),
> -							 STOLEN_RESERVED));
> -	stolen_size -= (1U << wopcm_size) * SZ_1M;
> +	wopcm_size = get_wopcm_size(xe);
> +	if (drm_WARN_ON(&xe->drm, !wopcm_size))
> +		return 0;
> +
> +	stolen_size -= wopcm_size;
>  
>  	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
>  		return 0;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
