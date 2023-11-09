Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDD7C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 21:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E69110E92A;
	Thu,  9 Nov 2023 21:57:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA0010E92A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 21:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699567040; x=1731103040;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MMXYtLaZ25DespaZ0BJIcjbG9NEfHqFhe9Yau/ZXkMM=;
 b=L2FeCez2GpUl4AWgCl/oklBjJCb4kFE5TSNOcBdWXzTy6fak+cPAFxkb
 KUCiw9TPvEZ2vqAQZGnXtQeCJAkXcvb1uALqdSH7U1q5LEKRPqbhcz1v8
 RTBf9Tppqzo0EbJp0KKlSru6LiZHYqH0r3R6lsF8iIwkvZsJqTIapKQo2
 LPGw+mebe6yxIH2eDqBZzez9RTUPKnRmpTSPO1QShLrP4acSxo/AGsIOL
 8U0GBEEtv6qelRcODoKfYehknWUoCQq7SyRMu5NfwNoKIDmEUaskvbBy1
 aqsZi2PTTiBgTgw8oGPf4wlZGl7gK06+tNk5FVd1zyUrBoxP7n5RlPGLQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3118677"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3118677"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 13:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1095007511"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="1095007511"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 13:57:18 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:57:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 13:57:18 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 13:57:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/8nHtG1grXfvJlLjeSuIzQPDj+LQtZ8dm+ImI5fFLBM3wnSrCpk0l4lgwaDT1jlRTAJ323+SoXbHGqbO5mgn5EpQQmYuHTrQbcIpUrQMxgXyiSFigohOdtGZiwSJzOdMYjc1Sc65SDGCSnnGWUJFOQFxi76Nuw4XxN4WL4GKbhnAs4me8+eSSoPpAkZg9fYaaxvB7dpXF44MhyWjMYoCGdv05R6c67RtnNDFbpSw9lM+4vSgAptv9pGfgAuhxBUW+nrpu3muPtu210jdGAU5g/8K2vQt4doJkJoA0R7qhv8+kGZZqjTKzzSzdBMERGe8KhEikNZHALkqnNUIZLO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOoVPlCJV8P2PMT1ssCs3NOGzcuJbCBbHdtJ2R719B8=;
 b=Fn2o2fpBz1GXv+1cijb+lkZMdM8jn+A7uBaY703Rve7xpdViqorAoNlZAlTZeLad/OLhHBLH3PhYZg5lDYiwofbz7YQkAYCStIJ8nRhU+lIcusGPB88xOVJh0biASQABy9/rKek46OaTjElHYs+9NfjgDAs9MZR3pnYYrQwsQQ3y3Q3HTFor+dliGR5CCMClU2m+HPRyaR+wmNLvAt7yPdGxfPeWAFzMlMDKavYGlElCsZpDZnGnEmJm0MSlCRUiAhlQ9/qEk4NxnLyMi2XrfAJWd3HOgFlgemOLKmSeU4vSM8pm1zNTRjOmF3o31ar71riR5YF/FMafRG0qKX+fHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 21:57:16 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541%5]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 21:57:15 +0000
Date: Thu, 9 Nov 2023 13:57:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231109215712.GA1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-6-michal.winiarski@intel.com>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6e5c04-3cea-4dd5-1ff0-08dbe16ed5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PyOr8bhKb5aDAJe2OvCdMNWnianYu4O3VXglDVT1RHTidy9X/ytJoRH0yQM+vF4+61Rc4REkw9SMXSGbUmlEX8gRLEuVy1u9o+NIoo84LOMsjzptjbYLc7wNe2oedoAdQrX1mNiGCRrYg4cd+OVe4+t7W8k7hpvrwxMRrS7EgYsGjJchmC2Ub6D49cnTPXt6tvUH/QMOS1HTSkUmWicNSlpkIrtQsVVDO55OV3yDIZdMTC0Vs1Wgn7R54YJ1LF+tPjewz0tbh/aV6iZFJg5iti0CVNj+WrJvDTSTYbjv7teFHWoNtGhzkUfYEM9bDIctStRii5RcTd2TjWtmzHN5cGj3YRrnP58AvhXEsiOMoUMf/VfD+Hk1jVcfXYFPfMjBLxOaIUptHQzMASVhSIUCz764iwxLbuUPSmA2DZfpQLaWczN8KupO0VUT8VaniaQa/BUObppmZmu4xx0Rqee/ZszY0zy93sTacyRxrIr9R1wulMVOePVM0gcAbIU0+zZu1xumwhyaqIwH9zydbxav9ZB/6RgyT/3uy3n3XLuZhgVKZy4YorrdhesD6OQzKYU7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(38100700002)(33656002)(6506007)(6666004)(41300700001)(66946007)(316002)(2906002)(6636002)(6862004)(4326008)(8936002)(8676002)(66556008)(6486002)(66476007)(5660300002)(1076003)(83380400001)(26005)(86362001)(478600001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkQ4UFE5NmdyNHJXMlNhY3N3cDlzazhkdkx4dzVkRE9EdGFqUnhDcmJzSVNJ?=
 =?utf-8?B?VHVyZEZSdzZnYk1icWpKS3ZyYWRiZnFnS0ZuTEVWbzd3SVJTQU82OS96Y2Rr?=
 =?utf-8?B?cVZaQlM2NzFNU3dhZE5XY3ZZQWdJUnZ4VUxIVVRWdkRsVjVwUnhMVTgyT2wx?=
 =?utf-8?B?cVBnalg3NFJFNURPaGR3SmFNdHBQR1h2QVJha3ZOYWtHOE9TR3hXR09OSGFX?=
 =?utf-8?B?TVRKT20vaG1kZjJ6Tmt5VWppSXZnLy8vNTRNeDhESlIydlNPeGJMd3pBdkZZ?=
 =?utf-8?B?SFhxZ2NWL2VOSjdmOHJua25SOXhsUXNNMkxYemZjYVV6YVhtbDh6SFp3dDh3?=
 =?utf-8?B?WGFOdjRLdEFCajJMMUNuQWpDNlFyMUJ0THFPUGVJU2EyckxNSlBVSDhqRHlJ?=
 =?utf-8?B?QXdmWnErN3I2UUR5TFo1dnF5NDVSU0ZRV1FoVTNxOCtqMHRHL0ZvZkRPcnNj?=
 =?utf-8?B?eEZmRFVkd1hUekQxN2FXUzBPa0Joc2VCdm93TjJMSG1pdDlIZU4yWFRGNjho?=
 =?utf-8?B?WVNIS1N2eit5SGV6QU1QMVN3bS9udVIyYno4U0tlYTQydXkya2dGYXdCNldF?=
 =?utf-8?B?c0pQOGx4bmVVVUY0ZGExWXZJQXRTNDhHL0lEM0t1enZvTFFWQ3dPWTNHakZH?=
 =?utf-8?B?cjYyWVQ4ck9pZWdldFllT3JrUSs3Y2dldS81MFhFVVYzelF1dFIyY3g5OXhZ?=
 =?utf-8?B?MkYyR25qOFlzVit4M0dnbDdBL3BrZmZ4UEl1bHd0UDArUzAwbjRhREQrTWFp?=
 =?utf-8?B?TXdKNHUzOXRHcXJzU3AzQlNtMHRPMzBFYUYvSHdQV2lvdEZlTHV3ZFJnckla?=
 =?utf-8?B?NWVyUUlUei91aDArR21CTEFUWTFuaU1tR243eEtqVm1ubFpLT21qVDdnWEUv?=
 =?utf-8?B?anJEeEFwZHpUZzBUWEs2cmtVUzhNU2hDaEdCMUU4bFA2em84VThxUm5nNk1p?=
 =?utf-8?B?Q25nMWo3RDVJd0lML0MxRFZGOU5PV2dwMnJnVXIxTkxrT0V2SGhBYWpJWHMz?=
 =?utf-8?B?OFR4UGpSeEVOTXZZRDB2SlpYUlpQZDUxZVNLWGpxN3B1L1h3SkZhQndQVEdo?=
 =?utf-8?B?VW1aQlNCTzQ3UVBIK011SEcyODZLbHVYalFGWDgvMW0wNTR0UmZzSEJ5T1dG?=
 =?utf-8?B?bWlnSW9oK2tlYmFUK2czVWF0VU5GTzVFOWxSU1BBdUcxYVBGblBRS1FFNVpt?=
 =?utf-8?B?a0poOWNOL3FqSjlCQXNqbEFhSjRLQ3JXZXhWZmVNTHY2T1kzL2h4a1BsRDJu?=
 =?utf-8?B?K2t4SGFSNTlna0lrNmV4MS9jcUZFdG05ZHN4VDltQlJtVmY0T0pxa0tadUVl?=
 =?utf-8?B?VUx5NUJncGNVSGE4ejF1SHY2RmlkYVJDeUxTUWx6ektnZ3BUeEhSaWtDRXM2?=
 =?utf-8?B?NVJzdGRnbTY1WUdyNTJuQ1lQNG52enN4UXRPL0ZPaHptc2JjTXNDNVdpUERI?=
 =?utf-8?B?cGcwV2psOVJ2UWNJei9ZekxDSVRXRk13a0dFZXNqRDJqQ3ZnallsYmQvL3Mr?=
 =?utf-8?B?RUJFVzd3KzJkQ2hQMU5odzFnazhoUFlGY2N2N2xFL3JvY0xkU0xBTGpaNHU2?=
 =?utf-8?B?L1gzaXQ3VjRHWTNsUWZKWjlQZXhoTVRoM3I2RXdLd0dLMHVQR1dkMFFJS1lw?=
 =?utf-8?B?TmhiNUhRWFBmVEF3RjFwUGdUZ01ialhFVmNTZ3hHditFSnp4b2Y1RGFlNldx?=
 =?utf-8?B?enVIL0UxdnR6SzU0REp1VlVtM1RlSm1Eb1BCS3ZKT3pVYkdLSFNCSEpjNEwv?=
 =?utf-8?B?c0ZiMitjeE5VazAwdTZoRUZyYjZmeHFMVmxLYzYrb29DOHNDcURSSURBNEhu?=
 =?utf-8?B?aXIxSmFDUkZPOTBXbUVXNHY5MUgvNUZTVE5UcjlJdklXREJMbjUvbG5VK2VL?=
 =?utf-8?B?VkxXajJaelVmbVJybCtLODNGTmhPaGJvdC8yK3d4ZElBaysxYVExREFESzZV?=
 =?utf-8?B?RlJoZ3lpdnFWTmE4bkpWNnJ5aUkydkZWV1I0YVpOTG1kbmc2ZUhqM0RDOGw2?=
 =?utf-8?B?VEJXWkR4QTI5cURCUklaQ1UwTWtzMHRHTXpTYlBkY3Bka1dreHh0NC9DdFZJ?=
 =?utf-8?B?dmVSNlZGSEtMZjVGVkkwRnpTVksvemNDaXViSEwyNUhQbXlMaCszMXN2WTF5?=
 =?utf-8?B?b0tkbU5DdzJ3T2s5bUVJMi8wTTRlOFp0ZG9mVFJLSjVWUVhQcHhSZnZURzFk?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6e5c04-3cea-4dd5-1ff0-08dbe16ed5a6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 21:57:15.1690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNGW4uDw8BKzDcSyk1Vibsbolj1AiAqb+XepjKxFejFmw2ynADgLGmqfVtQCr4FgZg9S7UKMF6Oj4o+nE1h87w0iW4lFB0+rvSmx5xHW4Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/12] drm/xe/mmio: Move memory training
 check to probe vram
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

On Wed, Nov 08, 2023 at 01:33:37AM +0100, Michał Winiarski wrote:
> The check doesn't have anything to do with initial MMIO setup. Move it
> to the place where it belongs.

Even though it's called "LMEM_INIT," we're supposed to make sure we
don't touch any GT registers until this bit is set (because the GT won't
be fully functional until that point).  It looks like if we move it to
probe_vram, we've already tried to touch GT registers (e.g., under
xe_irq_install) which might cause problems?


Matt

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0da4f75c07bf6..f4cddf2dfa3a3 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -254,6 +254,18 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  
>  	/* Get the size of the root tile's vram for later accessibility comparison */
>  	tile = xe_device_get_root_tile(xe);
> +
> +	/*
> +	 * The boot firmware initializes local memory and assesses its health.
> +	 * If memory training fails, the punit will have been instructed to
> +	 * keep the GT powered down; we won't be able to communicate with it
> +	 * and we should not continue with driver initialization.
> +	 */
> +	if (IS_DGFX(xe) && !(xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL) & LMEM_INIT)) {
> +		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> +		return -ENODEV;
> +	}
> +
>  	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>  	if (err)
>  		return err;
> @@ -384,7 +396,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  	const int mmio_bar = 0;
>  	int err;
>  
> @@ -409,17 +420,6 @@ int xe_mmio_init(struct xe_device *xe)
>  	root_tile->mmio.size = xe->mmio.size;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
> -	/*
> -	 * The boot firmware initializes local memory and assesses its health.
> -	 * If memory training fails, the punit will have been instructed to
> -	 * keep the GT powered down; we won't be able to communicate with it
> -	 * and we should not continue with driver initialization.
> -	 */
> -	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> -		return -ENODEV;
> -	}
> -
>  	err = xe_set_dma_info(xe);
>  	if (err)
>  		return err;
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
