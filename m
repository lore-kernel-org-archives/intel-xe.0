Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ECCEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 20:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D66E10E687;
	Fri, 16 Jun 2023 20:52:26 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131F710E687
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 20:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686948744; x=1718484744;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1ayDC6bnNHt2EfCKS/MFe/9z+ERguK6/WXD5I92ucIc=;
 b=HN4n1kkbTk7a0dQga0ac08SRoTB5WYP4u10cNnjv0Kskd60F+Xu/IcOI
 2Rgff/E38+lWLD2MiIAipAkuEGx9tXzyMm2ZYIuhdP96Fu5nyoH27KUB7
 GxaPIotnWLWjfcyBAKjFVrcIu6psreUMcHpfX99MI+06NJO4DvUL4cIzz
 LVLVz7BbJR8X6EeZHIhRThIaarh5ZWzYA8S4XFVTBqRtVbVnwWE3Xn55A
 uV3hg2ruVbeoeic3KkSMQJufiesfaikNSob64sb/pllLyJK1ECa4oLFh6
 TsJIEGN+dbN3NlG/zoC1sVJveO1ZlcwmLPhVc+ubdvlzZU7e75cCfLdX3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344048623"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="344048623"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 13:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="802967371"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="802967371"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2023 13:52:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:52:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 13:52:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 13:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVzeri3eH35THfdsWtO+Q5IyAslMDMxcrwySOWbFI5wGbDrCf86kmeq8fQk9e1lqc9Gbp1ehx0qqsWXy/v6SGsmdTuM8xwJJAZYJXEyNzhVW9RI7gXm3IbRZWUtGTOO8bYcNx/CJKxTSRrdq9aUGHtUk+2F2fh7EZHRmHsGpTuHnnTkx9w4NCfQYFKDejK8Olz0un3gD12myCM7gF5oMF/rKq044o8gAq7okklEzvyQyhCxsB5QkdXxpfx797ilg9iqUnYII9GlAefq2oHaqvH691/deYyI2nhXLtZenlfCvgTYNZDj1iXNfm2AIqmfB25s5KfEtAol2ewezMKDzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cagot/8JW6opnBdCsIpBGB4YqdiclhRBESa0YSPio6g=;
 b=BqtuWxNiN1SOriNtNz4a1IfOYdzUp3HvF+nOCg9WKCwTlDHv+oIS/vSFxCsIE7DqHNBkzbcReCiL8l+uC4A/6erLBtiv6Deo8mWthaeIpfauzRt7DGeb4nxum0Kf5Z2erIhe92/MH9JxqWF0rH2I/1YkoKX24Ut5etbPQjWnbEMzZ3hsqn7Scl7vhK9OF6SMZ6kVI/t3U1Nb9lAOJFh3XRDTq4r7CDBQIUlyyEemHZja8D3tsKZsv/hTiuofCVDzpy3ndicPK6o0nVljtcc3Xu03pLXyfWiFQEAfjUrYCgboSjLwICZ0KOAjZfxJ0wgNNWGzzqLzATxudpav6bwyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 20:52:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 20:52:20 +0000
Date: Fri, 16 Jun 2023 20:51:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIzLYZft+zX/ZYkU@DUT025-TGLU.fm.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616095504.17084-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: c5989116-ef6a-4c3b-2e1c-08db6eab93c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6xvwykL+6O2IbrVt81hq3AVwPDIHEFg1tDF7OP453O/yE1WOfVQccnhhUOMeuklw9DGdBjYGIskphvXMsbotAsezEjR45ZEPgqQqHzTtcy48t0I9rOsRENx6ufaWf37EspWvBaRJd0OnTX8x3UT1elfNPwftvJYR31z80Yj9ekr8R5KkzEn42SGL2C7U8d7N5PzMYukrxHRzIy2ZO03J3m06xHA2evMPJDmhA+tVd+nRYfzjG8MiXNiOHZ8e216gxQy3Yu0JxNYWqR4C3xK6Xwm3PT+O55GUq0vPzLxwbyA1MJLTlcd255iLZe6xWTxvM8wmkOolqMkX3b/aXjk/+wNoTVeZdZblRcJOEuufY5LR9ww/cSGC2Hc1btesfki1bne+FmKPaM2eSD1KJk9It/PUrI57sDS8blsrwN2hLZQXvD5hCNWU6q+NBg/toAZGQh2/3xokYBUa6g1PmDKPkOQsiC9ozh03J7r5ttUpmcjyNQwUz1R586go+ZC4r2xi+/P9ImfjahFUcV+UlT3t0x2M6c1T9QGrkl7IrNQEpl+Ba6yRMhyqGJ84SbZyLNn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(8936002)(86362001)(38100700002)(5660300002)(8676002)(82960400001)(316002)(41300700001)(44832011)(4326008)(66946007)(6916009)(66476007)(66556008)(66574015)(83380400001)(478600001)(186003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GMW2+wTwzdT4njhRUzdA1IO/bdDKZYjkIYACvNM+Qa5QL9xg7rl+YBOoDv?=
 =?iso-8859-1?Q?zPMMm+I13kmZXPO1rHqnoZfXOG8zKYzeLpr73lq/HmTLiLNN4YSHY1fMcW?=
 =?iso-8859-1?Q?f7RQQzyIDwOs5fxXq2cKgXiGseyYCd7zm+AHDdGoeE5ZPNE94WSylxL3rd?=
 =?iso-8859-1?Q?+VOXzRv6Q7nMHOj41OYw/253IAJnUrhPMFTvuTrU5Ieo0jgzJX9uhFXyUc?=
 =?iso-8859-1?Q?sldDEyb2f8IhdOtGpUubrgCjFt9rY19JWCRQImfTkhrPzsQBtBMRFna6/N?=
 =?iso-8859-1?Q?it/YZm7GBf1w83mqypnmbOd1yUEaPrucNICnjK5fSIZ8RsE9AjtvoGfvwP?=
 =?iso-8859-1?Q?WfNMheldZEgnQ+QmlYdTJGgqPZhWNPj0dkd6cMHugdYl9mv0vEdlZrO3fA?=
 =?iso-8859-1?Q?3yzAOlVQC6x0VJ9s2mQ+Iky747UMBXwuV5A4x6vqLdnN+lO82hsXrRymGo?=
 =?iso-8859-1?Q?wcWfjGvM0W5pZlXT3MXJuqpIFQ/Az9gmBH0H01ZNGI3qZ3WCh5cOTcK2Sl?=
 =?iso-8859-1?Q?QkgJvfetfbiz2NL2APBZ69pV/26+jDksYmJpE0Jg2+ikq8aUaOazteHgDh?=
 =?iso-8859-1?Q?ijjxzoFUmUcMAE83I2MdcpXdglP8sB6f6oyL+SKLOSTdx/5ahaaPRDXCaZ?=
 =?iso-8859-1?Q?OhpobGiIMBCwH83m3YRHVOy8h6Oga6iTN/zHw1JrBMcZfGdPzTRx6CI9Gt?=
 =?iso-8859-1?Q?qdMlY3O8+SBEmGXuy8vjc4UPhYDy1GFI1BqvJb7s7MhmTbFW8BxPfD893P?=
 =?iso-8859-1?Q?uSGT54tT8zToJEn9i6o/pz7Ew7GuUPHmrvFRyzmku6NlQYVRUxBE6hvYYe?=
 =?iso-8859-1?Q?DwX2diX+soUCncpsTjZKroUpp127Bmve6olFT+FENSjym+vb8XvV0mCyJ0?=
 =?iso-8859-1?Q?bjdgZaf48WZUaq2UBdoXOL+QfWDSOURek9o2HT5vBXDn162rpSdXKX0wAG?=
 =?iso-8859-1?Q?h7d0i9CCsKWXpsa5wSwRM6VQPx3hMtgHojDOvnAwAqIzQLUjbXldp2t8XU?=
 =?iso-8859-1?Q?1TuidGqb02bIlobI9T+o+LkK/eNSX8wQdjuaN3s1lwLuF5HBIRRzn2hk13?=
 =?iso-8859-1?Q?p5vDcvFLMEQufWYJhKHvQoPqYXSfmL0vB0iE8OPKUhm5SNwvvGNCq0nNeM?=
 =?iso-8859-1?Q?VPP8bkwN2FgQPtwjLSdgx0nn0SYroHFI4A/Vjmktady8RJqA2ysmp6NIFx?=
 =?iso-8859-1?Q?MrEOoFlV9SZPYwtkB/u4qJWasoM+BvLkE9vJL0YsnU/ml9muGq/IlaIaEL?=
 =?iso-8859-1?Q?XzrQ6sUPX7BhojnxVIOeOVBZp36GWHbij723q4ymScs3YsF/C741qhvtWe?=
 =?iso-8859-1?Q?cm4pGMQS1p7NjhEG+ioNKik43HYRpJ/falHIuf3xX1AcpZuOBqDwiy0xW4?=
 =?iso-8859-1?Q?KBTqZK1Kl40YXr3Ej5VWHZ9K9WAvVwUuu4NDN/eEbN1EJlK32bDjg7/xqp?=
 =?iso-8859-1?Q?hS9B/4fKJ5hh2hJsd10WHvoacP6kULEjIDw/1Rk2Py9qPE0ABCyFZLY3Eh?=
 =?iso-8859-1?Q?dx1/9+s0/W+uYJAUPms2ZkKxYBt2Ykm/dsbVx0mSn/puw+H1QvlyaFqn/i?=
 =?iso-8859-1?Q?vLsHt0gBFRmgG3iEoOOzkg7BTCGEaNW5aIl74G1mwxc+SCXXC7KYHyxrhU?=
 =?iso-8859-1?Q?9PGbLVcB+eqQwker1x99yr00sT1pMBYW2OydsyxKMuJgnseMqYBPe7QA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5989116-ef6a-4c3b-2e1c-08db6eab93c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:52:20.2350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqXL04BR/AdS3nJZE0E23ahQfPcHP85Y2OEZ96xWJloTDFqig2g9Fba/Ud789UzGXIX+FXMBEQuLvUnyxP4XAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/ttm: Don't shadow the operation
 context
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

On Fri, Jun 16, 2023 at 11:55:04AM +0200, Thomas Hellström wrote:
> ttm_bo_swapout() shadows the ttm operation context which may cause
> major confusion in driver callbacks when swapping out !TTM_PL_SYSTEM
> memory. Fix this by reusing the operation context argument to
> ttm_bo_swapout().
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Makes sense to me, good with this is our tree but probably should send
this one upstream on dri-devel and make sure the TTM maintainers agree.

With that:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bd5dae4d1624..615d30c4262d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1154,7 +1154,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  	 * Move to system cached
>  	 */
>  	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
> -		struct ttm_operation_ctx ctx = { false, false };
>  		struct ttm_resource *evict_mem;
>  		struct ttm_place hop;
>  
> @@ -1164,7 +1163,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>  		if (unlikely(ret))
>  			goto out;
>  
> -		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, &ctx, &hop);
> +		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>  		if (unlikely(ret != 0)) {
>  			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
>  			goto out;
> -- 
> 2.40.1
> 
