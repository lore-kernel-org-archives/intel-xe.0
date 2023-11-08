Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF1C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B423C10E185;
	Wed,  8 Nov 2023 17:58:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C50410E185
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699466288; x=1731002288;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JUXy8kUCynl3oHoZrd1r7iUg+7DR7n5UdJe56jHGvOk=;
 b=bEK7GZPF+L3sDcM7AA5S3qu7MXz9fGO/s4mlYqWmFsNC+IeMsdb1qBwN
 jI9wL3bjBWBQUsWYpYRpQejMCzKRmwZxDamg6KKWuXgEaXCreygnWz3AA
 VSdMr+EdLIl+wjfEGzIIqll3Ezsgn9EEx1KLiStYA0pRL8DNifuat+2wK
 12tiMC+UmvU4KRMsCvV2mfFZaJDsm4w6VCq843EUXjDnKor2q80ExUrQr
 0dOeCTz/+pW9d4kgkMUlybcQGXgR3FgrKnfuUpIXoM66gw8CwsU0z8ADX
 A/tKQYwxKjOqpP5ILdXxBMTEtstR9yDGDy1n0EF7PSWlAMYi222PmgeZ0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="369160485"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="369160485"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:58:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="4262741"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:58:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:58:07 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:58:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:58:06 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:58:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilZKJTAj+A/nHJgkRN6FIWKMBoA4hd7aib080emFceEhPbAyKjhFGybpvmZwVSO6yKX2DqmWopZ/bkq4fu5mgoRPwXTG7NgmBdq2n5hTC+xEHMaCgILj/C3RYP/I051Rs1Vcsvg+JhZ4orydeNgpc20LPazDEDX8BS6Ztvc5O0mYBnlO+BKEPCLvUDtbgCWMQZ+/qj0Kuoy3Q7AHJ1CCaTdPZucB1CwmC+kLLdZc/YMdOlRvPCzXs/8zeldbtauNivX0xROXRSwO1p0FHtEcZPf5KkoeMtrqoLifVT4noGmmI+m8SvXaJVIblMIFpua7Lidv4ihDc32GDlt8PL9nmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRvqPbSG6ug4L9ANdSRcXSGoNUr1hyP8AxVx5+fk/Qs=;
 b=Cs16aXK4NiizoB6CJ/82E0yw9X7D+Ir5CZUMWQjNQOQk7XfrNwnxYZ5che82EIdn+3lp85CzXY7u2wmAaDGzf5QxJAJ232P6srID3x0iKAVwoqEg6UWFs+e1307jV5h8YNstZ8MYnlW1bT76cmeQM6Rvy+cWWTuqkOq42XROjrPhEZ+FFUfHM1BU5pVEho0awuzZ0hRh3APXkyTazW+M3GaR6ZLtouS3XCQ1FrVmM5I3tJRTEzzQNigYhTvKh5aCpBKtrDYM3I7LIoYCMAq6xR+CXE2UVA+jWnevbQjiVJM8q7CYnlxM8ImlA9QIN8Iv/QlAfLKEygigw+Qk58L3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7172.namprd11.prod.outlook.com (2603:10b6:930:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 17:58:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 17:58:04 +0000
Date: Wed, 8 Nov 2023 10:57:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUtpjMAaIGTunxaz@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-11-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-11-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: e20b3036-2620-4148-b123-08dbe08441b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LL11tXv1D3hqTLgPWuDAGW8S2FXyjGD5jMpVHxsyNFrn3z6KZ7HnSxEBz/nWwZ5ARwt4TVG7RVmaKaq7RQl+tYA0lVBFnGAeEak8/lKuql+QRkVarQRlJSOmIwxSjNrdT6dY/1V2jzhMBPYSJsUmMD3T+GtewN5iLUgDLGhzjIXl4g+lmvtLkFX7qQGXvmQ2RimSxvSdHuoCiEfZt3lrMXzZLzrizlsuwKpKQhJAD1lBf/r9MrdWnKarSA96IKGoV+lgVY8+ztaqBN6k+aPDB2trgk+kr0jd8mvqW9ibtnOQem/J+sXkZv4z+Um8hKiT3YQr4PUrNMBFtDOawC41uHCDyJl587EF8OEFKmE/t8YqGYYw9Y1+q3+inSnWOL9fojvQ8ussCvyREOZVZ3zzmqemN/DHNQWhv/eQp/KVSjANWKTx3nHzBXwyyggOI4SRAqitlMvjIGOD+IS674snVqXwZnrIWAcaf2VwuxP3PqxO5I8hhgFgCPFOBWrzOhJiwu6JcKs4Ll3jfqCkSrJZPHKqYvArZ6zHDWsG+CPrV6NipRAIexbyzM2W8d9/XFHY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(83380400001)(8936002)(44832011)(4326008)(6862004)(41300700001)(2906002)(86362001)(8676002)(316002)(6666004)(6486002)(6506007)(478600001)(82960400001)(38100700002)(66556008)(5660300002)(6636002)(66946007)(6512007)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWo3Q0JINVZUenF5Y3cxVVdYblVaTHpFamU4ZVJpczdjS0E5SjhiQzFUaTFB?=
 =?utf-8?B?dkdzVFRGdGg2T0Y5MytiZGRPZUxwZlhIcll4cWs2bFU3aE44S2Q1TGV5Uk1z?=
 =?utf-8?B?VXNrKzNTYXRCTHJYUE9UNmxieFJTL01wSFU2R016MkhaNWZxQkl3OUdwNWlE?=
 =?utf-8?B?K0dMTktseWZDRy9FandUWUg4bFkraXp4R0djMHZkM0tZQUFqckVBQnY0YTl4?=
 =?utf-8?B?OEd1VDR2NHF3c0wzbHNrUzd4V1hiODB0N3dnY3FVcTJtWXhzdURjWkFNUjVh?=
 =?utf-8?B?VHNsZW0zUDNJeFZvZjArZHJTWHpHeWk4TUdsRHFVbk9qb3YxMlpTejN3ajVN?=
 =?utf-8?B?dFBkdGtJRVJnWG5qV3gxWGkwaXE4c0dKaldSUENzRmc5VGsrWWhUdVg2TnY2?=
 =?utf-8?B?Q2tNdk41bnpIb0w1MkU4WTZOTkJrN1ZYajhOckVFbTRLbTR6b1Rub3R1dldh?=
 =?utf-8?B?MnUrdFdDalZ1L2xKL1N4RkRXemg2emV5S1k4bGNwbXJZZVJYWmVQM2dHTTh1?=
 =?utf-8?B?K25ndldJbENEdG5pQ3A3dmdvTnNsY0xISmp0L2RBcVRLZEU3bVlXcXhJdTUz?=
 =?utf-8?B?RGNTRXpTcXV6WE0yMnkyZW9JOEhFMFJWd3o3bmpOYU5MeXMwQkZXQk1mNTA1?=
 =?utf-8?B?bThhY01US0Y0Z0lCY3dDTzFxc2p1VS9XZ2pVdUt4a3Rkc2llQXRrRU03QXhq?=
 =?utf-8?B?WG13dHVycFZuNDU2Zk1DWldFTExKQmk5RjF5QWtwR25wUFdNamNub0t0Szhy?=
 =?utf-8?B?ODczSUs1VGtkbVJvRmRMd3JFRG41R29wZlBGbUFqSW1FdWpsY1ZkTXNGQ1Jq?=
 =?utf-8?B?UElubSt3S3B6YUdMZ29qWnB6UXphKys1VkozZm1GK25tbmxTV0ZrYzN2L0l0?=
 =?utf-8?B?ZXVKNzlxRUhMdmZNcWpTbTVZZ1ZlVDJWaVJRMmFvTllTM2ExRzAvREtRN0Ju?=
 =?utf-8?B?WlNjRHZjVndqOFhUSEVWVGQ3azh5cHY4VGxWN3hqQVdHSjBMdzZ3Ukd2SXov?=
 =?utf-8?B?cHEwZFc2VWljemM2N2d5cTFGTzE3enIrL3RRbFpxaCtoeWdmeUFSLzZuRG9B?=
 =?utf-8?B?MlNZb1c5VHA3UmtibTBRL3ZtdTJDcEVraERHMUQybC9QVk1WQUluNytWc2Y3?=
 =?utf-8?B?ODdaQVlsVktHREROY3JkNWU3ampHVEpTWU9nVTdiS1hEWTZFODdvQ2VsSW9Y?=
 =?utf-8?B?ZnlLZ2ZTMUt5SGRCWU9RVnBWUkloV1JXa3o5eUUxNmdaSXVhdmZCdm9jWGIy?=
 =?utf-8?B?WDZBb0lkY25VU24zb1Z6ZEowcndaMWtRS3dnN09zcThROWwra1RVTDMxSEQ4?=
 =?utf-8?B?S1RqY29weStGUDVsVmlSMHAwcGd4NVRBUmlPK1prT0FKbkdvYzh0Qm5IVjZC?=
 =?utf-8?B?TjZrUmt1R29sbkd2UkE1aTVCcGdNM094aGQxM1VGUmJZQWJtWHNBZ01FWjhk?=
 =?utf-8?B?L0hYSDlaV1Qwc2c0bjdEZnBnUXA1c0I2d0lXWVFsRnNRQWZYUGVhYVNwNHl4?=
 =?utf-8?B?Qi85SEp1QVJScW1PR3B0SjYzLzR3eTB2ak9qeWtBNC9jY0xqSlp6eGx0WnFv?=
 =?utf-8?B?bXEzOERrZDlRbWJ6SE5tWU1qQll1UDVncnVyWThSZHpHY3JnUmI1bmM1QjlI?=
 =?utf-8?B?VFRZRyt4S21JS2NSS1piMDVFRElaNG9lL3dnYjBMT0VsV1lWMGN2Vm5lc0px?=
 =?utf-8?B?QWZJREl0cHBsbzB3amZIZ0xnYW12bFF6RWVCMmFtaG9PVm5KQll1WUlIelgy?=
 =?utf-8?B?d05wMkFpeEVYaTRnUUJkQmZySDhmZHJkeldEdXJ0Uy84V2hvL3F5cGx0L1Bj?=
 =?utf-8?B?NXlUSVRzbUhKVmtuWkpnTkRrSGdFVGF1L2dvZ2tUakw5VTZNOWZodGZoQ21Q?=
 =?utf-8?B?Qkl6V3JmY29HME1vdGVkS1JXSFhXWTRGSm5lUW13cEROYzdtaENOWEFOZ201?=
 =?utf-8?B?TW50eHNCOUl3WDR3eGRGc1FxU1RtMWNxai9FelhYU2V1UXRORnV2Ykd4dEFr?=
 =?utf-8?B?c1N5TEdsam4yeDBIS0VvaHFMdXRxWHBseHh2T1hjMXkyWVAzL0J5SkNyZzlB?=
 =?utf-8?B?VHlXZmZCb3Mvc2NXOW13V1M4blZmK2w1TThWd2l3OFBXZy91ZVNQcnNIRnpL?=
 =?utf-8?B?TWhWWlNxcGJWaHZQVFFIdzJxdzJ4M2hLdWtOMUJnR2g4eVk0UHJ1eHBOMXlK?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e20b3036-2620-4148-b123-08dbe08441b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:58:04.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YkLleCeLUsxJOUwko/WPUx3OOCmaLkp4sV2DHZHkSGeoP8Hn1tCZB/OBoCiA19faClHbVnjXXlE3BX0EMUetA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7172
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/12] drm/xe: Map the entire BAR0 and hold
 onto the initial mapping
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

On Wed, Nov 08, 2023 at 01:33:42AM +0100, Michał Winiarski wrote:
> Both MMIO registers and GGTT for root tile will need to be used earlier
> during probe. Don't rely on tile count to compute the mapping size.
> Further more, there's no need real need to remap after figuring out the
> real resource size.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Good cleanup.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ff968ef611cac..8945c601e1c54 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -311,7 +311,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>  	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>  	u8 id, tile_count = xe->info.tile_count;
>  	struct xe_gt *gt = xe_root_mmio_gt(xe);
> -	const int mmio_bar = 0;
>  	struct xe_tile *tile;
>  	void *regs;
>  	u32 mtcfg;
> @@ -325,9 +324,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>  		if (tile_count < xe->info.tile_count) {
>  			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
>  					xe->info.tile_count, tile_count);
> -			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> -			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
> -			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
>  			xe->info.tile_count = tile_count;
>  
>  			/*
> @@ -374,17 +370,17 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	const int mmio_bar = 0;
>  	int err;
>  
>  	/*
> -	 * Map the maximum expected BAR size, which will get remapped later
> -	 * if we determine that we're running on a reduced-tile system.
> +	 * Map the entire BAR.
>  	 * The first 16MB of the BAR, belong to the root tile, and include:
>  	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>  	 */
> -	xe->mmio.size = (SZ_16M + xe->info.tile_mmio_ext_size) * xe->info.tile_count;
> -	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
> +	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
> +	xe->mmio.regs = pci_iomap(pdev, mmio_bar, 0);
>  	if (xe->mmio.regs == NULL) {
>  		drm_err(&xe->drm, "failed to map registers\n");
>  		return -EIO;
> -- 
> 2.42.0
> 
