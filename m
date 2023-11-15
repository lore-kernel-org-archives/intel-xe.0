Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD09C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 21:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FEB10E26C;
	Wed, 15 Nov 2023 21:43:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AEC10E26C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 21:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700084595; x=1731620595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GsjPaGPC0M7dqIqD9yuGbbesfkPxyu8ovZW5jLdT+Gc=;
 b=fKT9KpD/tr5RhR0Vy7hzwYfGjmS63i0siFnLb9IuHHhe+H55DKs5+HcK
 od6Rj93V/lvgQnfXdSH7k1mdPU1Nh0LvbZccEsAkkcrKMIrNFoCxDdU/G
 rjGGDchu5LUZWVlsEM4gvnL8KVOXr+F6worXb7SUJvWcIujAoVTxL0v9P
 x+MzF08MvozCqzHm7cTQwuCerfXEquba9VKUvp3xEwIgWGKQc9ZYQ1GWg
 UjC0Pl97TjEZolaonIsMkgMipPcwGpjk5HCt6OP3zLsLx5e8VCAvqjlDQ
 YNZPUZ8L0Oz/lH/hb8HgE+E7b3opyDVjTetHBHE4HKohc2c7582zoyYpX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4080581"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4080581"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="13335029"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:43:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:42:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:42:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:42:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP7QZ80/Afj6/76UtFB5OSZlypbmRBd+0jGfEjlfv7mqDjQKixR0pJPFyYhD4j+P3rTuQhFKLlVvi5NfEaOG1sHa9x+s9Q7ndLLEPV6EmVZUO379XKxaIwcH/O3Kx9BbVTGzRBp57sUt/+W3ZJEsL9soHOsGISPvOJRa0/RTthUuU9tR5VE3Sce1U2rzGw2jrKIlJWEQtp6sUFHjcq/eLPVaLn+d2DyFFV3VAu5x17sb+rjtIPdfckISe8wyfDlybrnZuAVBpi0EUdiZfQygHe95oNsSDwHSsgngkJOucTxY/w2BfbveFHsQViUgsoMVEHLfdDB3F7kuzQZ+40HyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4elq8uRR+9UAlO1flR7PbvDt5QDqwOr4OMf8bC74MZw=;
 b=Y5My/Wwc2VZJTzagVg7IFhFlETeJ1YQ8SxMxxgeyZlLHH8Vzbucypyz0wKYmehlpR3jKZIia2m/TAhPsrrMXKwQr8YzDl1CAbXmwHEBaGQ0LcfSvuh2knCXppjhtSyU4i6POnqEj4lKwi2T2RxaBf+mlE1cJVVCmjC+e9lj517u6oYAV1N4J20/5/STLoNTPMzwsyxsEcrcNw+YOHJMkzOAbtDWWEzNY1TJ0Y3Sn0zlFRqS/g22CaEJNGO6Y02pQ4kg/c0e0Kf05LWI/45+c0Wtnkt0JNoCyfBtgfHmLN8KgZtZoWBOMlDwcoXOlrDIAgpanOA6cKL+xaxDSkvabLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Wed, 15 Nov
 2023 21:42:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 21:42:45 +0000
Date: Wed, 15 Nov 2023 14:41:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZVTYmdJKiPJJGRUt@DUT025-TGLU.fm.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-10-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-10-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: de7f1224-3be5-4b96-0571-08dbe623ce06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z8wduaiGrVOpkTb57c1Utrr8CfAzZKeDvgZZGmSQSfHgEg9mAJbezd02LVIhwlf6ElvR+IIOM/WpJzAEbFICG8Yp4fV1H8BI0K2JjFL6PoNjYtc1IkQRWDOk9PmMa0FgWbtPFa/t8Vh0who1LwYcCbf7trDmDdcfbfn8ciYGAFz3dzIyT/m3IejsKMuueiPicJ2Klcbp8Zr1oRLQKbAc75tTZF4Ijh/PEb0DyRm/5ewoJYPhZvfTkXJ6yjXuQZpR9EuP4KZ72PgMj9+8WeVPDkyxwwxpdZ7jEZIcqENGfm4/at14lA1P/2G/RGyjSZ4OWFgxh7sUGBiwVxdGs0ZjSt5k9dGTswzL74P5yV9hGBpkoLLijDIfBMI44ecTCMbTcUyDFW7LDkavVegwJk9+RQwRX6m657XPLEDBrPYOqyKbjQeUQM0My9ZN44vTsVZdt1D675IlndSC1y/iMZDjOkPd5mNcR1OpIEieWINCJJft1tyUUEDWbk4xNkDNiZ5Kd3OWGPwqnf7eEjb988vrdkDc8Y1uIuw+1C4P0niQj4b7DCPqspXWssTVSoPjU1Dv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38100700002)(8936002)(6862004)(4326008)(8676002)(44832011)(6512007)(6506007)(26005)(83380400001)(82960400001)(478600001)(6666004)(66476007)(54906003)(316002)(66556008)(6636002)(66946007)(41300700001)(6486002)(2906002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZGd1NOYmhHNTBuYWMyejlrbUY2UDUrdCtBdWlqcGVwQnNzTGF6a2U3Y04x?=
 =?utf-8?B?RVJmcGhqZzM4aldPaVhBNEhPVlUyQzFNaHdLNTZkVnpkSDVDd3lDUC9SclBR?=
 =?utf-8?B?TVF1VWZvdjNGQldVenpaVnlKYnFldmZVRlVVa040Z2Z6cnNFVXhwUyttWlkr?=
 =?utf-8?B?N2QvZTJNMXFTVGk3Q3o2TmJFY2hhUHhKRzVYeGNxa0YyMlQ1V0tvcDREeVRB?=
 =?utf-8?B?YngxdW5nZ3VGUzVwaGgzcUdFNThnUmxFMlQ3d1lweE5OWUN5VFVVTVlIV1Iw?=
 =?utf-8?B?SFFvcldkbndXTGNTTGt2YmRkQjQ4UHpZSEdMMExjMmI1TlZkQzV1QnNtSDRY?=
 =?utf-8?B?a2lqeVdzTk8wN3lyVjFjbHlqWlpQelBBdTN2QjNqNGxva0JoN3M1UTVpQ3FN?=
 =?utf-8?B?VkZuZjlHcFZCNW50Q1F3VUx6TERlak1tUUtmd0FJaTRzZHBYc3JrMUluQ3lQ?=
 =?utf-8?B?RWU5RHhQaEtxOUhGMHlOcGNXd3E5ZEpTOTV4SjBRdEFYc01oT0d0UE05eHVG?=
 =?utf-8?B?QWxNcUVucFdyZHlONDVOcVZBZXhBaU9HdUR3ZGhIUVhaMThhMnBhZ21Cb01M?=
 =?utf-8?B?UFFhYXZxY29UK0hnWkxQMmdWQ2lHMmNsTkZXWW5yYnlGOEtYL0Q1VGhhMU5a?=
 =?utf-8?B?L2VpeElwYnVlVjFYNk9lT2NKM05FeWFOZ25TYXBES1VjSTRiNWpVbWZuN0Vl?=
 =?utf-8?B?RUdIYjEvQ0owSFZZLzJxN1N5N1FPNWRRaUhkZHJwODJBeFFCK25zQjkzY2hl?=
 =?utf-8?B?OXlyaTFaOGlNWXFtNU9sQ1lTbXhaODcvYktWdmFUT2hmZlF5emIwMUMzaW1Q?=
 =?utf-8?B?N2trYU00OG52T3RKd0JwMlZ1UEZTb2xFWTZrbVdTVFhzb3JMRWdnK1BqQW90?=
 =?utf-8?B?Vjl4VWpCZ09Pd2tsUXo4SDllOUlGWVp0OHdNYytVMFptVUsrRjlpK3lhbmVX?=
 =?utf-8?B?bEE1QWJXWUdUc2J2SXloeDVNN2VheUJOUFoySnU3aUdxd25acWJWazkxVWl3?=
 =?utf-8?B?elJrcENtclk0UXVHbDczSHFuRzFHZHF5Zi91THRoTWlQNlFFVERsYm05aVlO?=
 =?utf-8?B?ZWRuNURRYVRJZ29nNXZLV1BWK2RSTzdVUW1LbHU3bDRqdjJhd0t2SVRhbC9V?=
 =?utf-8?B?WjdnR3UrZVZkYUpiMDNqOCtDcUNLMnJSRXlyOStRQ09SRDBTWGdQVzlzT0s2?=
 =?utf-8?B?TzVoWXN2U1YxTkJrQXZVRWVyUXhuNGk4K29INktBek1jUWc4UnV2Yjg4Vy9i?=
 =?utf-8?B?NkFHODhNdEdGN2pVT0F0KzFRTndWK01zT01pa1QrZ2wrNzFGcmsrYXJZZDdO?=
 =?utf-8?B?S3l4Z1pybTF4czJKVXdSb1lyZUlIbVUvZzk2RDFHbmppTTRheVpHZ3Y2WGVn?=
 =?utf-8?B?bGZXZ0tPWUhqL055UjIwTEdYWThLb0M2SWt3VmNvSXd5Tm95dGhFTitJZmtl?=
 =?utf-8?B?dFh0Zmc1YkR3eEp4TFFlQ216TjV1KzVwMEVzWHhSYWN2RXNyNm9QamNMVTln?=
 =?utf-8?B?YXRtYzF5V09HYmhkd1NMcWJTZzBKZVhnMXRFbDBNcmsySjhqVXlOM0N2dUxh?=
 =?utf-8?B?RS9ZS1YrYUlDSHRpelk2dE04OFRFY0tHVnNtQURlZVovaVpENzhtQm5ES1hG?=
 =?utf-8?B?MXpKdDNXcEFPQlhPdFFid2xqcndTaUxvTFQ5UmlxL3ZNeGkrSDNqcy9GbS9h?=
 =?utf-8?B?dGd3NzJ4SUJlWWpZMytNZG03N0w4eHl3Rnp6anZqRDFoeTdUMkVKZTJIYkJO?=
 =?utf-8?B?RHJqMHNNdjF4dngvRzlTMlExQTZIeGpId1ZLK1NzekY3WlhtV0piOTlVU0pZ?=
 =?utf-8?B?SWRQeGFQUHl5WXBTa29WK1RPTy95aU5JQmtjVmVaeUNwa1Z0d2V2c0ZUbnFP?=
 =?utf-8?B?S2I2cHVqUCs2aFlBWUd5L3RwNWlkbXZXUkpyUkZjOExpUXlQVTdUVU1RN2I5?=
 =?utf-8?B?SDJiUXJnd0FSa3FPeEluTm8yekR6NGl0YjJSc0x2RnhRbTBiRmZYWTBtdU9H?=
 =?utf-8?B?OEFhYmVFY3Z4dE1sT1FJRFdZM0g0TkRtNXVDWlcvd1JhcmFBeWRiVGJOU0M0?=
 =?utf-8?B?cnNERkRCcDVPOE9zazdLcEN4RUh5UWdXMVMwYk5EZHZrSHFpWTNkSkNHSzNa?=
 =?utf-8?B?a1VQSXJMRFIvTG5zWnQzeDJpQXZyLzExYU5IeUdZbjJqTjBGSTRQWm1mWDBl?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de7f1224-3be5-4b96-0571-08dbe623ce06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:42:45.9187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WR4+QDXsGe0hCMGjVmIwAhOMytWM52V8qhpJ2Ygh1optmQWWqyMtMFSKX4cuow3PnWtseMbav7OPfn/BFywZ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 09/20] drm/xe/device: Introduce
 xe_device_probe_early
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:20PM +0100, Michał Winiarski wrote:
> SR-IOV VF doesn't have access to MMIO registers used to determine
> graphics/media ID. It can however communicate with GuC.
> Introduce xe_device_probe_early, which initializes enough HW to use
> MMIO GuC communication.
> This will allow both VF and PF/native driver to have unified probe
> ordering.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v1 -> v2:
> - Add comment to "early" variant (Lucas)
> 
>  drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_device.h |  5 +++++
>  drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
>  drivers/gpu/drm/xe/xe_mmio.h   |  1 +
>  drivers/gpu/drm/xe/xe_pci.c    | 22 +++++++++++++++++++---
>  5 files changed, 53 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3a98e7b502190..6fe669fdf1c0a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -364,6 +364,24 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> +/*
> + * Initialize MMIO resources that don't require any knowledge about tile count.
> + */
> +int xe_device_probe_early(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = xe_mmio_init(xe);
> +	if (err)
> +		return err;
> +
> +	err = xe_mmio_root_tile_init(xe);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -382,10 +400,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = xe_mmio_init(xe);
> -	if (err)
> -		return err;
> -
>  	xe_mmio_probe_tiles(xe);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c4232de40ae08..b80230c631068 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
> +int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
> @@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
>  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>  
> +#define for_each_remote_tile(tile__, xe__, id__) \
> +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> +
>  /*
>   * FIXME: This only works for now since multi-tile and standalone media
>   * happen to be mutually exclusive.  Future platforms may change this...
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index acf6dfca0bc46..8eb19a4bca9c6 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,10 +15,12 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_tile.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -375,10 +377,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
>  
>  int xe_mmio_init(struct xe_device *xe)
>  {
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	const int mmio_bar = 0;
> -	int err;
>  
>  	/*
>  	 * Map the entire BAR.
> @@ -392,12 +392,16 @@ int xe_mmio_init(struct xe_device *xe)
>  		return -EIO;
>  	}
>  
> -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> -	if (err)
> -		return err;
> +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> +}
> +
> +int xe_mmio_root_tile_init(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	int err;
>  
>  	/* Setup first tile; other tiles (if present) will be setup later. */
> -	root_tile->mmio.size = xe->mmio.size;
> +	root_tile->mmio.size = SZ_16M;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
>  	err = xe_verify_lmem_ready(xe);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 9f1a25cfd2cf0..74976af15ea60 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,6 +21,7 @@ struct xe_device;
>  #define GEN12_LMEM_BAR		2
>  
>  int xe_mmio_init(struct xe_device *xe);
> +int xe_mmio_root_tile_init(struct xe_device *xe);
>  void xe_mmio_probe_tiles(struct xe_device *xe);
>  
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c50cc3f7cbe06..a1026b7ee4727 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -537,10 +537,12 @@ static void handle_gmdid(struct xe_device *xe,
>   * Initialize device info content that only depends on static driver_data passed to the driver at
>   * probe time from PCI ID table.
>   */
> -static void xe_info_init_early(struct xe_device *xe,
> +static int xe_info_init_early(struct xe_device *xe,
>  			       const struct xe_device_desc *desc,
>  			       const struct xe_subplatform_desc *subplatform_desc)
>  {
> +	int err;
> +
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> @@ -554,6 +556,12 @@ static void xe_info_init_early(struct xe_device *xe,
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
>  				  desc->has_display;
> +
> +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> +	if (err)
> +		return err;
> +
> +	return 0;
>  }
>  
>  /*
> @@ -621,13 +629,15 @@ static int xe_info_init(struct xe_device *xe,
>  	 */
>  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>  
> -	for_each_tile(tile, xe, id) {
> +	for_each_remote_tile(tile, xe, id) {
>  		int err;
>  
>  		err = xe_tile_init_early(tile, xe, id);
>  		if (err)
>  			return err;
> +	}
>  
> +	for_each_tile(tile, xe, id) {
>  		gt = tile->primary_gt;
>  		gt->info.id = xe->info.gt_count++;
>  		gt->info.type = XE_GT_TYPE_MAIN;
> @@ -727,7 +737,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_set_master(pdev);
>  	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
>  
> -	xe_info_init_early(xe, desc, subplatform_desc);
> +	err = xe_info_init_early(xe, desc, subplatform_desc);
> +	if (err)
> +		return err;
> +
> +	err = xe_device_probe_early(xe);
> +	if (err)
> +		return err;
>  
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
> -- 
> 2.42.1
> 
