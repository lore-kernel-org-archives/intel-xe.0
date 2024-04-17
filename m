Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ABEC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 22:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ED410F8F6;
	Wed, 17 Apr 2024 22:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRA+Nvps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1936210F8F6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 22:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713393751; x=1744929751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b32B6PiMaitJZ0vGb6i4vORPSYy5DUPv4JHpVokwdNY=;
 b=ZRA+NvpsbPwqO6mBxDLVMBJz+RBbxrupB4+Y1ogDq1eNdjm1mMTst6Bl
 HzgOKOFkJFn9oNuogjbkWuCVfQ8IXsef4yumYjY+MkXqdL7k0HTCDfW9Z
 t1M0+S+i6UGxlJIeufwCedQ8TEL8H+i8P/Fi6+YtyZfiv3lrdB0IG+mXI
 8aYY5OpaIwZ+P8RHAczQaJ1+f7Y0FtWsxemuKO3ma7pV76JjgBVYP6Y3f
 bTwe/xszNl6I7bWdZtVIHYleyZkz/qJPuNeed6pHz53/sHkjt7lVPIGfV
 2QJKywarVcmU1ThXve7Gr58OoC/C6hFczzZJkibYbkaq4bcDeEYJPyY5u A==;
X-CSE-ConnectionGUID: murdACn4Rqi33TzkwvoAxw==
X-CSE-MsgGUID: WQVrecDvTyaO6dliESqAGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19472264"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="19472264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 15:42:30 -0700
X-CSE-ConnectionGUID: vMCJDFY3S9m9ctjGdYuU6A==
X-CSE-MsgGUID: 6CPOe/f8RDiQ/YUSEgQyqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27352151"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 15:42:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:42:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 15:42:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 15:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQG71ny4+M63FdaMd3Fy7z5fZyXnmO8QssEFv9MmMDcYV3lYHnMw452RayG41HVG3VRV6dy66ZeoMO9ov+IvVTUp3zUE90n2aW8/h7cxV4EaXkIEHJHjUfF5EksGpzR6H9LLYQv0e1RT8w0ehotG5/mD1JW7c/aDK7pDzRbD7mP2Tt4oIHu99R0abq415mdZhHNuOUwvkohRFcbM+vnaZfXTE8qkXmSWRXBK7nDTE23QGeZicWr2+Df528NQ3yiu9ipUMOWwjFISYERswNzObcZoS8H9Xfb755RWUb6MX1Kyar4kTERsvUJxBan0Qrcqvp3pT3TNupZz1ptzUaayqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2DIczDS6iQvZw55FAb9z1mSe9Dal5DxsCibg+Vi8/w=;
 b=SnRSMsDwCdqeuDmwyR07iR1FvHnzABkHoaV973Lx3ZhFGzqObbH4wLIMKCtIb6CBfgxFQ2Q1fIA9vUzEGptkPA3SE0L0Br35mePoNh1pptokk48+87o8j65PaeD34p6RiGrckYjKwIkLr6H3Hmf7On0BjmC3TcMBB3H+00D7/4gDSVItGh/1VrUZjts94iuNVxCyhGduFh5eHLlFcTV/oXtlvPcqzKMr7qyqZRqAQxGvb+Uy8uYKSa8yXw9yjhMXPF1t5B0MLFSFT3qm5g8GunUlhNT0yJC20WFlYFeCTgUwKzpueVJLl8y2oPGwPbmDUd12TbLT0SbFK/5XXlTZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Wed, 17 Apr
 2024 22:42:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 22:42:22 +0000
Date: Wed, 17 Apr 2024 15:42:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/gsc: Turn off GSCCS interrupts when disabling
 the engine
Message-ID: <20240417224220.GO6571@mdroper-desk1.amr.corp.intel.com>
References: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce59493-27e5-4408-61a7-08dc5f2fa55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9l1StQY94ha5cL+OIicIVZPtOX74whDlQvZ9qJbO6A+PmY0uFz7c5zgz3LHHuy2mzRnz890Nw8l34EnYQTiTpD1C9TVtxBv2g/r6gVLqNNWzoVK4p2t/2uO7bTIHf3/oBDU9RqO5LCkmghtzB84FdeGMVBIfOzwfMXZ9zzca/kVDAWbagyFOR+YjV28gXFpFpTzMrKW1Bt3dVpc73jJvUsj68y+1H98FSyQ4Q0Y88GMFmfbdKj3tc28JhqYZa/jJoiIpdeNi44Oih6aheEezajEcnXupMXwRFh67oANjurtasueiWNmBgxkBz39QYWVj574LXpxGQjIrToQ+zjEWcqnOC+PHZUWPaN6I2mpoAtmgdWTr1uIWjMPgZPE+LNc1QGezBc8FSNUKDuQQGq4VExnqKvuJg8+fob6gvLWQpBd24awO5FgUtu8Ig8hhTF+b8fwy6Aot3pxP60ePaiQ8U6Fk1P/16e842w4VMnwtWHdOjZAWZVbzol3ffJK9yIvqsHNcd8+O/O0w+R7aUatL751YQrJe9n1pB1ssek7qTe6iIfjBsEu8FUZ2PwO4JYYWEdCrgAez2TAdLZVX3y6+2KTn83Y1nzzRvLZDrdp9Y6udr/ePeXUlEBPJeXsDisDFNuoXpoWjYRi/W4xfyGQM3nx3onFSmp0rlzuEoagnOeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R70V20cFEX9tHIjldhWA0M7+I0/VlWJTp3oQWiu6+xZZJ90hAOm2Fo4bZrdB?=
 =?us-ascii?Q?dbvL9WzuYYVSO6zl6WhEtv5rjf0ENn7B4AjTp2o5S2s20FOzBbiXwfdj+9P0?=
 =?us-ascii?Q?Yl0XFPmgqYM/vf2pDvR3gpYVpQLyrqYslJ5zbjYllCTYTm1cUD3sN8EKWz+t?=
 =?us-ascii?Q?1Y7J/Ngpwd6YkRiZqMFhtddZ9522BBxD+j6qkUgypkbBrMxDHRpNftrxQWVV?=
 =?us-ascii?Q?xUyqqNDhdp6jehXOYEt+8lypP+gJPngA+1hn4NpekMjMKb1Edmp00Q/1NmxK?=
 =?us-ascii?Q?NShduo5bBug1gV5e5Co4Sz8Rp1hrwEHUwNQSfdxqG5NJvgRA/ov87CC+983e?=
 =?us-ascii?Q?OyTh8JunhkhEDB45FITym5NcSSLJzukaEqdaGO1aY4Km6CFL7GAwAVTFNUsp?=
 =?us-ascii?Q?97u2oAuS1VqHSnwcGgl+3EJKjtqGnBrIbXJI20viMpmNiMA0BevmGcQRWrdb?=
 =?us-ascii?Q?Zfdi7X9m0cw789XYbQS2hU+plqPr9950wXmB8Nsi5C+e6GFdMZj4EjA+cdVO?=
 =?us-ascii?Q?1PEZsMZpQLw63kLM6oX9PnkoJ9A4o/j9LxJAI/Og3cjN6+D9yA1shj0saokp?=
 =?us-ascii?Q?L8GqP2nPT/iVgPDBBmST5oUpke/u7kmxLVAjhJJXrELp4tJJX2iBAdjOZ/LD?=
 =?us-ascii?Q?nUAGgWFh6pEmeMU6HpDi43qmFNiUbDa2qp0GkG79TN3ufkqHncVb4irkNq9j?=
 =?us-ascii?Q?NlGwvmYJlpbb3ZE2qf5ni75JqyJBxc1syyLk4x1feQEYrMcS+UNAfoFy/9+W?=
 =?us-ascii?Q?xKfR3xlB3C1zOt3OTLealNpVGbBYDlBORRWsxvXR6HMK4qHIuQJiPFkSWMA6?=
 =?us-ascii?Q?hc9a1uc8BckxweZGZjxPSfEfLmQCmWlb6Ng879JYyxj/Q+uH/cryYulA/sVK?=
 =?us-ascii?Q?oMPJWMdGCEuBCz7TP3YFRm6zTP/cdVpDrbCtXMVvpFwz9A5ORJVPp+zKt5Tq?=
 =?us-ascii?Q?IS9JHt8cIhxyzlkybU1vGcVpcAK6dV9oX1SAd8NM/KO312xToINRp8W8v2sz?=
 =?us-ascii?Q?HbiMatK6uq8U2F8Q5Z6NQWuxZ5bflA4VBxqLBTXNhaceGLR2O3QGJx4KarJU?=
 =?us-ascii?Q?Bc0LNZ88Em2ORSH5DiWqwIDY6wtgVFYo+RBFIIXBEDcO05WFwaGMak5PU+Um?=
 =?us-ascii?Q?eSHyzDr/JYrVBKH0cgq0tbwyUPPH1V6Sd7Qi2qqgzzgPV6F5pJQmW6dfu5kk?=
 =?us-ascii?Q?CNZy8MzoO0QyMDWrbNM4VeD7ABbkghByvFjfqh3mUw2DC1PlbTqXFcxvGqT1?=
 =?us-ascii?Q?p2VQl03nGKOBVrVC47LisEOokJQhWkI1sV0STHGTQV3nJ0RGXz9+STUa1qIT?=
 =?us-ascii?Q?653WnqMB7rfF8QWB7NSFvZ6XWh6RgNXMIvPg3utnLYMyTrX5tAzj7WQBq8yM?=
 =?us-ascii?Q?Hp23rMH0lhwL/bMfQwzOZjHajjhdkR8mgsOGdKLMC2Lif02Kz7GU1bPSRCkX?=
 =?us-ascii?Q?AAn2lX0IGcAaNOhleXtFjgzblNvd6UeSQsEVSMGClw4rfuUExDsz1fTxTVkY?=
 =?us-ascii?Q?JUir7A4ZKEQnEn/pvGnH1fkIwYpVa0SxPMFrumuNjZrXyiIk1orQmb2nK63s?=
 =?us-ascii?Q?Mi8Wp0LOak0B8pR6cwcvUVzc/HS49IVFoSKQzhThXLwK31dltajuml8zbPHF?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce59493-27e5-4408-61a7-08dc5f2fa55f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 22:42:22.3718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2fD+4dofKXVEjNtmSAF8R6o/lwcVNrDG0UA7kQ96B7I60O7cnCQhB6eKXF21GkEe9VIVuCV6eo7Az4pM7nuhGEcBtZwNIiFhqAYXppzR+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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

On Wed, Apr 17, 2024 at 02:12:23PM -0700, Daniele Ceraolo Spurio wrote:
> Starting on LNL, there is a new GSCCS interrupt that is triggered when
> the GSC engine reset fails. If the HW is in a bad state, this interrupt
> might end up being triggered even if we're not using the engine, which
> will lead to a warning because we'll see it as unexpected. Since there
> is no point in handling the interrupt in this scenario, we can just
> make sure the interrupts are off when we disable the engine.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Tested-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a688bb2d96ce..b9c5690c4d96 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -720,6 +720,11 @@ static void check_gsc_availability(struct xe_gt *gt)
>  	 */
>  	if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
>  		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
> +
> +		/* interrupts where previously enabled, so turn them off */
> +		xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, 0);
> +		xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~0);
> +
>  		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
>  	}
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
