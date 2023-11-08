Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67864C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DEF10E18C;
	Wed,  8 Nov 2023 17:18:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0AB10E18C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699463928; x=1730999928;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ICdGdaFSBDkrbR4mTMVHJUkx3TPBUXON7YYrSLWgCxc=;
 b=WlzR3PWMhw0acr/tcoEFPhIsiCGt6mPiObLsRpDmpMQD/h7GtRzw40YC
 VYVMC4bL5AD6mRKplrq5n1JOM3wgYN78Cv7aSPj0+5OGcz7yUmmVWD52j
 xOgda4+wUUvgACJ8Fm9rQuJ1wxPZE7+tU+Vsa3S4tKNlQwMwp035bZXMp
 4skgAOojwl0yfrrVPx9ZwsqoyGGjGprtLpiIxolSIIKTvQ/a5IxXsWxsp
 XE8r3KBgXGO4v2fOAFW4Tp8Xa0vODmL+QI+khjlUrn6mPXgozLywN5j5i
 C/PgXBSdNGiUzOf0pJikyDt100BSLYEZsQ4uc2swqgL0KO1crCKnwzAPe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="386985475"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="386985475"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="763117904"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="763117904"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:15:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:15:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:15:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:15:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9Um2TuHRNVPcR5EYCPUtxo2JXv1UNgJuGLf1vD0HXON0PFpxy4tcLceLQVEoG0cczpKET4o0SPXcVdQQvrtFYmxaJ7Z5oNcL1Rh4GmTOmaOiy2H/QAELSZrERstW3AxgyPX2SGjqVc0rXTttbo8Wb87NkBikc54uGQnH4rZEuf2EsNqrE1SPaXYojQgWZDlEqpxuGaGwadTjmGMSgB+tHxpbacoMMvuEMJVLSwGAoOJVBQ7rZk4JjATsLgvLeDQ4JqzJHRAwpM0Jtd17geUMwcEkuOSzoh/bMZ9AyHCEkKuCq5eZ/dtB8o1E3Xl2CgwUhNxSAMTMbM8L+PGjtI51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZBtFQrs2OQ6eGFsiSHESUdz1X7DnU44ry8Vac70zgo=;
 b=YLA53Of86mOMooqeR2xGeh9w6Um5v7lfJn9Sy77zceN16WivjBOgpvFy+XTNV9XT4ePaT6Zr+ICY8xseo5ynKBBNdSSlm+oZxj5nX7Wa3eSN3COrFCpE45+jxu2ShxFWk0GVY5QAUOrKZdWyyGJ+d+d0EJe7JINic6vW0jDZ4cQCC9u/Kktb7KzPWfRE6ZLVq0WS5jMVInRq1FIRFqXsAByvlyDDf3YzFo3XASixLtqNwiauH8pPv8vj6RzxD/BPwCOJbgOg+FDN6N5ynDyBJy3l4isdzESAdM4IPBMIzRf45awQ4K6f6Rv6WyUtLhDF/CG0qEsGfGHw02pA4/y5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 17:15:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 17:15:10 +0000
Date: Wed, 8 Nov 2023 10:14:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUtffv/+HZQOpiW1@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-7-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-7-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 371f8dfd-77fd-43c5-955f-08dbe07e436a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kc3i6zsXJbqZR6ustgOOchczHynfPJ7mJ3T5ZSDfUg4V1ZO3UKAnw6ppKec2NrMy1WUBoFQ/Sc/WmxslWblHqVDjFUkZh3mlKZ61TuOEa4WjHV4ZZAG0gcM9E5f12+ENED3p0sf6CglLjUqgSHRdHwzFDZZtxXmU+hKCDFkoF7PbJgfTIPRjAOq6i3ZTJzyeJaMdUBsc366C5oAoXjkLhr2mnbn7ZIeJ6gxbXRvq0Ggyw0Uwe/DQjcKG1Y/0QujfBEONNk7+9WqA0Sxh+QpcrVgumTsdZA+kQ3OlzoXKhkFvN8ztrxCnBo6BYiJi1HQq35vQMAgH3pb7731OFCCOdsuU9nK8ueRmvWORR4l62xTbAElFMs2pro2+vyMvOS6E8LZgdXtkp9J4XtcvscpiG1muZfaXM1WLjSRv5BuFTRvrlSNpbeOVrjdFP58XwRYeZnchjjAJ4CotR0awEPuuE/xjJzZ59JaChchCN46MEeVBHmaVicwwOQMzDEm60rAFsw86l3iCzOmR8498AfP12nM8Z4hbnfVQ90uDY3qiNAPqwnmk3WnY/U6kgr/JtURp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38100700002)(86362001)(5660300002)(41300700001)(2906002)(82960400001)(478600001)(83380400001)(6512007)(66946007)(26005)(66476007)(6636002)(316002)(66556008)(6486002)(6666004)(44832011)(6506007)(6862004)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzQyV01wRFJveUhMVGtBSXpyVnV0cVNROWJVa2VKVHQ4alVlM0VWSlpTcVpr?=
 =?utf-8?B?UWpIL1FsQUFiajdPQjdxWkxIeXNqVkkyZi9UWlBsTDF2RkRTdnVQUmh2TUJ4?=
 =?utf-8?B?RDF3UEZKb2J1b3RuaEtXaUZuVUw4dUlBM2FmT2pMN3U1SWFyTDJlMWVlMkVy?=
 =?utf-8?B?R3pjUnlEa2Y2aEErZWk2ZXUySDNGS0NYM3hBVXluSVRLbUx1SVF1VzZVK2pv?=
 =?utf-8?B?aVVodFQvR3NrTHVjbWROemt3eFEreERnaEdKN3gwQjBUUWJqMDcyZkh4TlZn?=
 =?utf-8?B?TWVSRWhlLzJtOE5uMTRBSkRZSFc1ZER5blZwNXl0ZTRQeVg0bEhKUDdRRHQ1?=
 =?utf-8?B?NURkNHBMZFF0VVJHcmR2T3hSVlFjU3BzbHFJTkd1SFRaR3BtNG9iQm9kemFK?=
 =?utf-8?B?TWExc2JwREhmMGdQeExBVTBnSlNxb1o4VWFsY2Q2R2Jqd0NZSGNRbHdtbjhC?=
 =?utf-8?B?Z3JMOVJPYkJ1dlBKSEhwR25PQW5TTGJQUlE1dEZnYWJ5REZia3laU1U5cUpH?=
 =?utf-8?B?S0xscTJTa0s3QUJRbGlHMTUxUWRtVFNXNnJYcmpyTFFRUEpiZFVmWXh5Uk96?=
 =?utf-8?B?aFBVTmYwL3RLbHJOb3dldW03YTMweDFXOUlXTnE3VTl6ZGNlYWFGbnVvSkU3?=
 =?utf-8?B?WEZPVi94K3BtamJVcVIyaEtTUHYxQTNFVWw5RTRpenE0QWtBVXI5aTJHencw?=
 =?utf-8?B?NDdHTXFUUE93VjEza1VpUXgzTVlyUmc4STJqbmVMWDBORXRCeE9MOEtFc3Vy?=
 =?utf-8?B?L2xKZHVJbHVFRlpuaFNLM0M2RnIrc3JEWmlFL0prYkxGSWlRdEsrVkxXbjdM?=
 =?utf-8?B?QlVkR0dETDQ0Vm5zdTh4cUlqbFEyVEhjOU9DWlJSVUIrRVJRQWdkaUVlYnI1?=
 =?utf-8?B?ZHVGdlFFT1JWZkhMeGJ0NFR6akNqd0N1Y0JodTcreXlZSWR0V2dQQjI5WXIy?=
 =?utf-8?B?YUNQc0JNV0xyWi9YNEpBQWsxNEpRb1I1RHpma3o0Y04zU1NmbUI0a2tQUm1l?=
 =?utf-8?B?ZTNvYnViNVVKb3RkNnp6MWxaNjZ5TlpnQXRFYjhPdU01UEpQNUlkZFdGT1Y0?=
 =?utf-8?B?SzE0bGdOUGMzRTRGOVNlR2JFWm9Ya1kwZHJZQ1R6VHMzSXZkcXA5OVNqbk1Z?=
 =?utf-8?B?a3hBMVM3TFNGNVhnZTB5dGN6OWJ1VGpkNjBBU3RlM1Y0SnlaVSswY0NUdFJV?=
 =?utf-8?B?elhUdjArYzlVUW4yNEYxdWZmY3NhRVEyeDYvdU5hYVpad3RZcFBYdVgycE1n?=
 =?utf-8?B?SU9HZExIR0FLTDBiS2ZYall0RXJwTHN2eEFkTEpxRW9qbmRkbjVHdUFwSzlj?=
 =?utf-8?B?Zi9FM2JYQXZ6WjJacWdYQVZka0g1TGtzSHd1UWZVa1kwMVFpSTFLaXNvZ0VP?=
 =?utf-8?B?MDFVY2FyMjRhYTU2Z2xCbFFMZ1VrYzFnWG1NY3hkMWJmR0tmbjNuUUZ4SUZM?=
 =?utf-8?B?Tks0Yks4TkJUWGp0dDBMTGozOU9QNEw3Y21oTWlXNGtxenkydWlZQVhZdzI2?=
 =?utf-8?B?dGN0RmxMZy81dk85bkVTcUJhME92Z2NGRXg4N3dsdU84VjhNOXFqdy9FV3dU?=
 =?utf-8?B?Z3RITG50UmNaaFVnNm9NZU84dDVYWGl4N050YVppSDIrZlBoV2I0Z3ZKNUxn?=
 =?utf-8?B?UkFoTy9CMTlMNXh6VjVFTlhMMHBDaU9SMU0rWUZwM1FGUWFnNjROeFFEdFhX?=
 =?utf-8?B?czFWdXgyaDBib05ONFNiZkQ3UmRMaG9EZHExdFE1ZFJEeDV2RXc2VTN4akZI?=
 =?utf-8?B?RDBWL1JRWWRpQnppTCtNQWpSWGFYUzI2a3U1QlF3VVp1TTJLR1VJUDYyazJw?=
 =?utf-8?B?dnYwR1dhRHNvbCtmTkJsc3lYTVM5aWRXeE55Q2dBSGYxajZRaUxRdXhMYXBk?=
 =?utf-8?B?YjNNOWlKTThvS1l5dktFRVV0ZGo5VHZ0SHVvWXA0SUdkLzBsR1FsYlRFTnRZ?=
 =?utf-8?B?M3N3bmNDZ3J4NmM5cTRKdm5ZaWZWZGx0Tk5wT21qN1NLUnV5L1R4OFczaThO?=
 =?utf-8?B?dXN4d0ZNaFdRcitKcUhQa2IwNUxFUGdpQTdLTFBabGdPN1hxUDg0d25zTkI0?=
 =?utf-8?B?ZXB3endudVdESm8yMmRuNHBNRWpGL1crR1h5SXVmbTUvdWlDTXhNQXBrOHpO?=
 =?utf-8?B?MjV6MXRWZTJPV1BFNlh5S2lpRk0yL1NLb0hZcXdjSVM2QjM3QTJXTVFxVHpl?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371f8dfd-77fd-43c5-955f-08dbe07e436a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:15:10.6608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdrHk0yns5T1c3u7OXono6KfdBWSAc9MFGdqWcSKCAoJb9wGI3BLqL+7zhBCqxPFP15YKT4pzyPQOEZc7lUDdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/12] drm/xe: Move xe_set_dma_info outside
 of MMIO setup
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

On Wed, Nov 08, 2023 at 01:33:38AM +0100, Michał Winiarski wrote:
> MMIO is going to be setup earlier during probe. Move xe_set_dma_info
> outside of MMIO setup.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.c   | 26 --------------------------
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 78374997cbf6f..3bcda5626493a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -342,6 +342,28 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
>  		xe_gt_sanitize(gt);
>  }
>  
> +static int xe_set_dma_info(struct xe_device *xe)
> +{
> +	unsigned int mask_size = xe->info.dma_mask_size;
> +	int err;
> +
> +	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
> +
> +	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> +	if (err)
> +		goto mask_err;
> +
> +	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> +	if (err)
> +		goto mask_err;
> +
> +	return 0;
> +
> +mask_err:
> +	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
> +	return err;
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -356,6 +378,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_set_dma_info(xe);
> +	if (err)
> +		return err;
> +
>  	for_each_tile(tile, xe, id) {
>  		err = xe_tile_alloc(tile);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f4cddf2dfa3a3..7329ca73e64ad 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -25,28 +25,6 @@
>  
>  #define BAR_SIZE_SHIFT 20
>  
> -static int xe_set_dma_info(struct xe_device *xe)
> -{
> -	unsigned int mask_size = xe->info.dma_mask_size;
> -	int err;
> -
> -	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
> -
> -	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> -	if (err)
> -		goto mask_err;
> -
> -	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
> -	if (err)
> -		goto mask_err;
> -
> -	return 0;
> -
> -mask_err:
> -	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
> -	return err;
> -}
> -
>  static void
>  _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>  {
> @@ -420,10 +398,6 @@ int xe_mmio_init(struct xe_device *xe)
>  	root_tile->mmio.size = xe->mmio.size;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
> -	err = xe_set_dma_info(xe);
> -	if (err)
> -		return err;
> -
>  	xe_mmio_probe_tiles(xe);
>  
>  	return 0;
> -- 
> 2.42.0
> 
