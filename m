Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D84C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D33112B37;
	Mon, 29 Jan 2024 21:13:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B28D112B37
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706562821; x=1738098821;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VucZjxldUmeYL0dsRaYhbji6CLRXdnT/3g7TPZxm+fg=;
 b=LiilyGV6ZHp1AwxNk/KfgfzSBhKRLT73y+5DHABQV/1Xg6lQhotopNFB
 8ypnwQbqJNod/VjWLFYc3Ce8mJlvcY6iHR+kYaJDd1z/arrPImMj++NOj
 2q4mJhwbcUWOOsctS53eeWfyvu7vFTrnn7Ak2GwgoRxveTzBnmMZ+yxWC
 yHKpIJmANiIIWLsz7k9X45Sozxc/Ly/nKX7OPPGbNPTyOLYaWg5UFNKCA
 41itdePyQ/jq/6vS4dvUHmDNhnwKUjH0PldysqyAzZ50TJL+kJStlDyFO
 OoqVbb+pPpUMBSEAnUoE66PWthY92uTqtcuMVkRQmsILN9lC1oDGoL1SB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10470118"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10470118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="737530333"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="737530333"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 13:13:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:13:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 13:13:39 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 13:13:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzrn0gDJkTmKQLfQHXxXsJzt/2D0Qk4NRWvDkYWpHixiAwS56b+q/qztlllTpQZgrpaM2XpZxXHIw1X0+V3Mz5MeQeW1ywyDa5rG99zeiQBE0bbp5v4cx+/ztHNCOonkhDQiv+yawIh6ahCK7BeqjBFMJf9BqhJ4ZCtjhohTwcdd6aqtEW71HK1rHbCl4j5pwh+L/KpcUmAENZnLS8GEvbCwj8CYQzin6gDQCPe6lzUPiJrXyU2i0ufVjbohkxG1f6lRL7GsLHmQzkRYHsL/bsC4j9ued5o0IvGnygbULncVnHrr/UNr8lDOewMN826e3mU470Q7BEdZbIZKnlBC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4OGEXhwcPo5un9fbssHEVjo4KX7hMxuFFEXbOh6RmA=;
 b=NDR5YryRvRgD2uuMh8l/97K3C1KDQhu/suNkZDm2N3ZAvVmoOVEtkO6TdYtu53WxqTg/rE/U0rFA/GgykGjWWjAmzVTzqX9zC/0M0+zjJuhHlaK62GE7+POCTFIeebnBm363M8nIaFYbuCuBhnV71Qf0PpOVZn72S3gwpb6vSpOWpXa7qL6XT8OR6N/XGMPrlKMs1L/3AYfy4zSf+AZoSTNt5/+AbYM7peSvBy0Bkiw0pfi6Sk1AZM2lNMH1oK/LCQHR4kLzm6pjLvfd55Pmp/YQevQeODx9WT9NBGZR5ubgyLV/T8oDTsSmo3uqwgDGRNLQTNamAmZjuzzyTryHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 21:13:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:13:36 +0000
Date: Mon, 29 Jan 2024 13:13:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v3 1/6] drm/xe: Add functions to convert regular address
 to canonical address and back
Message-ID: <20240129211334.GK5506@mdroper-desk1.amr.corp.intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 384e46f6-dc79-4bf6-0178-08dc210f284f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XENMscKl9tjR8sAzUGivSwnHHNRg3LQe10QLE8H92e2g473pdxk5hq6NVFy8FCX/CXBhfDc+IltyZebTJCWHmXXg1Wndf5mNFRUlF6zNAmYksAG/Fj4T10bBfvGl2D2vWKuvzQ7xRJEZA2TBTD7+JAGMx6lP4csFWdtLLpbg6V+Sj6471uoX+qherw5JiOHGs1xeUIF3xMINHSwcv1BYNeiJzzOjJAZKez1Z0HWMISSrl1VwMLp+QSLGZtCl6joCsCoYH94ufBhtp9QgX6ruPvektsuGIE0gYFDE644BtQXu7NxRVRXOh0ZjUFKiTeQWnkJFqwbl5ZkhldERAsROn7rf5C5gbN1VUq8xuxwF1w2VVt4Gi2HrZsdv3FbBSqZx/x5OFOPr/EmQ0SsG+l3fT4E8UGtpsEzL8KnB3djcBEMCh/ARUokGK62F/S3wonyHIDQn8LlE9+SioVf/tfV69nJPwY+SRtldPNGSF/TsSBKDZveY930QGGp02ERJhCiulePLqJbVKe/gPT21PCSHSk0qgFqLSr+BclCxdZbkD2wGrzuouOSc3pcKrpQrRrdb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(6486002)(5660300002)(6506007)(1076003)(107886003)(478600001)(26005)(38100700002)(8936002)(4326008)(8676002)(6862004)(33656002)(41300700001)(82960400001)(2906002)(6636002)(86362001)(316002)(66476007)(54906003)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Olc5eddQVXkz9/3/se30smOq3uCR422q3JWcr2Lk11Kg/dbYPiOcBmCBEB?=
 =?iso-8859-1?Q?1U6FSf5HuRnRD28GRZZKkxpP6OvzRXoekOCbZses/5wa8NvJ6uuxqGv7YD?=
 =?iso-8859-1?Q?8qoHTuuDGKxKIcEyFFJjMd8uFjIMzkS4YefOIhI3UARm7cyhyZ8GFxzabX?=
 =?iso-8859-1?Q?aS8eyCGSnkkXuAq4JnY3ZuzCRchB+QXWF17X65108cIzA4IU3tQJJmhqLM?=
 =?iso-8859-1?Q?DchEoW3ogUcmJ3xICC2FtFPInH+lfjRrbVgkaMhXKiQRzAD5p2vEOrfkRr?=
 =?iso-8859-1?Q?+IVftJeSFq273RJ4RbHycuBJzGXZ9ITu61SfnZFM85FTqZNNrHbgUTqXPK?=
 =?iso-8859-1?Q?QjaEod+Oa6QtY0/73rgNexkVY8/V1BP0VLWXm/otJ/nA0SrDsJS7AcNHzT?=
 =?iso-8859-1?Q?hsc8I/NzwmJ6h6cRNHO90X2oEpyjw7DQDpuVTPA9LHTC7P6PxaCpF1hOFI?=
 =?iso-8859-1?Q?i26lNuOTwBR2WTAS6LWU39iFIiijXt/z7CItT7XkgZkEmSj9fh9rGACkrs?=
 =?iso-8859-1?Q?HYTVSRpMFS5keLCsQjc9EE6kVixQi5erywHuA5HNpOh1dg8V+/e52/ct/Z?=
 =?iso-8859-1?Q?psBY9fnQeWMHd4sMdtNBGEtCpZ9/JTUNEo90BKppfP1qKLidH4h+dagnp+?=
 =?iso-8859-1?Q?5KzFA8/r9JCmSGYfHcrHS5QkN45elepj5RMTF9rsDV9lWegG2aTSTP7pZC?=
 =?iso-8859-1?Q?kEPRa06reBkeD0kKeCDsaHmEPKeiZzI0dVcnKznXRyCyO6nvdTtCr3hzu8?=
 =?iso-8859-1?Q?6xny6vLbapU/ztARXMtasXO0V/uJuMTaSxjIn7n0VleFDGX07M1dvjuXKy?=
 =?iso-8859-1?Q?aWI+82+cMPxXtL7Zrg2bTmxGVgxGkVp0FqEg4LMEAOflYa+PHONMstHqHL?=
 =?iso-8859-1?Q?0VJL64DpBRyLx9N+GXzdhLxQtdAIZ8XK8wWDVbafQ2QnafewsEIWgyfXim?=
 =?iso-8859-1?Q?E9csVQEErlYgiupRFraeA03iZdRzhgWrh4G4OvNf9CBihjG8jKzTKEAyeF?=
 =?iso-8859-1?Q?xxuctPVV/PPLfLO2ksRoe7LkqTBSU2NnpeKBMzFHpQr9loBk9eLHBMzxG/?=
 =?iso-8859-1?Q?o7gW1xRzlKgjLUI/gm3iwiCjLqrOaLWKmLhA9Z2OGBsoS9zwYCyKD+p0E4?=
 =?iso-8859-1?Q?Mr9snZPQj5eJHk8TbNbUJ3X8KcHMyTUsKRyaemgMOtDhqXppjvwrHajeAp?=
 =?iso-8859-1?Q?zf83sTOKN1o1Sg8kvv+37nnXJyPgy6r+1Y+BnffPXUjr/8hRIH5ZDdpLGQ?=
 =?iso-8859-1?Q?QzL1VVHNBfuAhmykrrLqNmeiPTyq8whMzkc5yfCH+2o6pUOZMDAPAWrEL/?=
 =?iso-8859-1?Q?8yC4Gp8zyZwMpezizmbqPjvTafZneB/O+WZTRjV3jqc5m8JuuuPrPY4RIe?=
 =?iso-8859-1?Q?OwO0AucWkrPZFMpSg4UUXJmlkVjO7rIPecxWd/q7alJ1YVIiAq5qxKoOrT?=
 =?iso-8859-1?Q?fzT4ZSgALTa9+w8FE80DVaHKwlPxKvQL2aibPr/kN24stYatqFW/BeL8g0?=
 =?iso-8859-1?Q?jIeM+8GfZtjOQtHzKKkwNLYGIX/bjxTBCjoy3ywQehzMrFbBzVzdaZCIDC?=
 =?iso-8859-1?Q?d1kfQ7JuutfcQG+rUrVEmICJR2rRVE+9MySlDVT3FC7B0OJhKqwKdMQRcf?=
 =?iso-8859-1?Q?ErqVX51xIOWTt9sNvT0Sg5reFnYnZrQYR8F1gVkb23CfkG67tydb6LRw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 384e46f6-dc79-4bf6-0178-08dc210f284f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:13:36.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxFGdCbEC+WAYGmwOeXVLor+jT7Dyf8JxMv+XUs6cde5cTWJJlVZjyJQpSWjBpgy+z5TaUkeLiGUI+ovM06FEh7oAwmwqtM/VlTcSwDdp/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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
Cc: Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 10:17:37AM -0800, José Roberto de Souza wrote:
> Some instructions requires canonical address like
> MI_BATCH_BUFFER_START(UMDs must call xe_exec with a canonical address
> for Xe2+).
> 
> So here adding functions to convert regular address to canonical
> address and back, the first user of this functions will be added
> in the next patches.
> 
> v3:
> - inline removed
> - rename highest_address_bit_get() to ppgtt_msb_get()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h |  3 +++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6faa7865b1aab..6172d4f987937 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -747,3 +747,18 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>  		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
>  	}
>  }
> +
> +static int ppgtt_msb_get(struct xe_device *xe)
> +{
> +	return xe->info.dma_mask_size > 48 ? 57 : 47;

Can we just use (xe->info.va_bits - 1)?  As far as I can tell, what we
really care about for canonical form is the size of the PPGTT virtual
address space, not the DMA mask, right?  That also matches platforms
like Xe_LP better where:

        .dma_mask_size = 39,                                                                                   
        .va_bits = 48,                                                                                         


Matt

> +}
> +
> +u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
> +{
> +	return sign_extend64(address, ppgtt_msb_get(xe));
> +}
> +
> +u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> +{
> +	return address & GENMASK_ULL(ppgtt_msb_get(xe), 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 270124da1e00e..462f59e902b12 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -177,4 +177,7 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>  
> +u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> +u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> +
>  #endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
