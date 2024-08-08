Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB59EC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 23:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F7110E614;
	Thu,  8 Aug 2024 23:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xj0HoXrU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDF810E614
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 23:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723159869; x=1754695869;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m+0jMCu4H01D85E3Pj5LgKVDOyPgygInn3lzxYt8LNU=;
 b=Xj0HoXrU1yZZ0WD0QZlUjp6G9fTYZB0GSLqaGbqAk06mzN1eBLdFqnuZ
 5hP9sqFS7ljxRoCb/xkqso3fQ/NUWMiDJMQ3fXKCbOckCJqUoxgjNKCPu
 rZqZf2KTj8ZeOFvLKVNE4uaoZTdlUelDaMj3xN75/7Fhf9nfqq+Dan3J7
 wMwa8jD8Xm16UghCBnV89PfZMC9x6w0g1yY8tolbEPfoPHwJE7EW/3wqd
 TgBgf4hJlYMvWj1EdN8eNJdKkGT17VKM5nWkAJkl0kxQT/cZ7l4AvaNVz
 C87COaQrpNf6Y5LBTmX4+ht7XGwmof1/Tfe5/eS+0ncFr9xq131wbFKil w==;
X-CSE-ConnectionGUID: ihvp7SKNQuCzXa7WKnZ+Yw==
X-CSE-MsgGUID: gp63Dg7xR+WGYy8YXHewfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="12925536"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="12925536"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 16:31:08 -0700
X-CSE-ConnectionGUID: 6y+Vo26rSLOYEOGbeuyuwg==
X-CSE-MsgGUID: VlhYzPENRkKNs4lkYDbSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57299312"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 16:31:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:31:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 16:31:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 16:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngMK4cVlLZVVBjHJRilCxF40+WBDgqtdgnLHE3xow2/wGX5gBgHhS9Sus5Zh93Gg52Rq8MkpdKNJs7RVTdjY/cqaXylq+8JlEZo7GdhQ8wFUQg4zIQxxNJInngLsjI/dgD1Et2JBuH3pKvGKgYNQ0Mi9mBVkcJkyYrds2bcnonfANSs16yZmuZe1vPg21qy39oml38LD/TPzjagvBxX5ieeMDGXfHujKdYP0de3xJaJog13hRPaXCTcVCnALYmFhDCDLoFoUNAIbxCFSAfQdNm5uRmz12yP1nBtoUwpwXm6/tFabk+UogOjlkdkaLtkqS/RdmGUVL2rfJWz25lFpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COq6fDu2Kw3AWsK068IR9aGXoNZNyVxoaENUBS+5s80=;
 b=TQTPVq7Qvk23ppadGkhyh0EYlfSFWqhOtyCWGcVmS8LA0nf2yInRq4vgzKmeyzaBbtihjg0UtjZLNze/EbR20Hwll1PMrMaFitP5KM4PfbbKkRlGROWINejcJGZNT1bMfw9EV2qsptZA9zVBaItbLOrdNqkTDhFTXvhhVjESs+ZmP9nArVqbAyrbEE0c++Z4Z3+pvwHZTo20RtE+Fi5Ts8cBShpwzxbcSulFdxg91aTU+vAKOeh2COhaSGi0pme+pI+f+hZUPvAHlSEfgntON2oaa1S6YmT3N9Znczg59VgIPI6Qcp0QSsN67c/Gq15DTr7+hSmZ41bYdG7bx2MM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 23:30:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 23:30:59 +0000
Date: Thu, 8 Aug 2024 23:29:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>, "Lionel
 Landwerlin" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 2/8] drm/xe/oa: Introduce 'struct xe_oa_fence'
Message-ID: <ZrVU4ZSaicZU1UNC@DUT025-TGLU.fm.intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808174139.4027534-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: b9354588-2851-4997-a516-08dcb8022903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T6TnQHQykf/EX4seu8OQnjjl0xiCxIraRKBwlYC90NruzErj0WKj8PGaUkSO?=
 =?us-ascii?Q?a0tp7GSt6YGWF3k4SkdrTljE896pGQzZnVs/49Nsb6Si8BCmma5hR5jthajA?=
 =?us-ascii?Q?Zw395nChCcWLooHOSLJlPVxlzBU4uEDkoKy34ZOB0hFWyisiZwLK67IaZfoR?=
 =?us-ascii?Q?F+pDGGwQELce1NsU6lUS4w61nKDo4vu2nsSjMLYmL2fHot3ojWQQ0Mh1Kv1C?=
 =?us-ascii?Q?pgSH5jsocOzbqiXNM/BcSjnTamJXgUrQorlrYQhCZXiPrXlpUb0T9zsiyR1p?=
 =?us-ascii?Q?V5upiB8FsasDf/p/HYA0QZNUsb0/w5UQitVp88PZE0DP12lX4LU4jFL5xHdf?=
 =?us-ascii?Q?qvjIeGdDl6ZCSlxkSbnzkpyzgbqLAkEvFyOWhW+VTMRneLccIlmRr5CaCnYq?=
 =?us-ascii?Q?3MDBeoKvblhc6odTA6667oCeV4BVJAOekiplUNYzG1NAhNyLVHaZMAhLSHJJ?=
 =?us-ascii?Q?4YxJ0X53joHKAky8UkAFUWkHxMiUCOy61tMU9Ho0Uwkk04RKiXEnz1gUkzi7?=
 =?us-ascii?Q?cfa3Q/rACg8Iyp2ULLzB0/i6hNy70urDP/8JeKokTVEziCGXljXzCUgYkFt3?=
 =?us-ascii?Q?PAsV/LObDkzZtgPMUlZGNLgKUXkfeWmuIlIgYw3AqZ5dYtVSfOG7NRjVAueX?=
 =?us-ascii?Q?DS+y/dvSm/SiqqMk97zbTS25zoT9EEaVyLorDGG8EDUmBlNgyfLmJ64DU3si?=
 =?us-ascii?Q?UDik8vSX74xw4ss3dcwj7PnTkc9oiJJdup2ecSP6EvbzwR2VSsfkW85fRQi6?=
 =?us-ascii?Q?bsThjR62dgrvxTsPv/zGE4Gx6Sfp6+oQygM8xRi/t/cOysLlVn+D1cV3WChq?=
 =?us-ascii?Q?qhY8u2qmn8JjEtDZqz/RcZpLHWLAhaAl+jxWq6ZmX951bjkFQlF6wdaj0CyF?=
 =?us-ascii?Q?BMavYzWM6o0pNHmc2moepkRsxPXL6XZdS1dBcg92dGvLPxurFlmdWYfsLRAY?=
 =?us-ascii?Q?EYmQQtMoROO/r4NGgpnxrEhmJzEZaZZXj4mpjHLeM9PYGuKpmH9Fz5zgjmj9?=
 =?us-ascii?Q?hpriSVd8PXYoPn8a7fKjbOSFVEdyjg4IOz2H7znEkOT+nnPsiG+5veDlXEgS?=
 =?us-ascii?Q?pb1ul+rq7Yj/ltryltUhQ5ys0k1OJZdjwjG+h7J9G5CPZ555OyRRYYOFjm32?=
 =?us-ascii?Q?SCRtuaysr0ovJd6XNS5/8HoLaTwt33SytwLYgrDum4szegDHZo5WjED1MTqb?=
 =?us-ascii?Q?X2aROYzPtSGIwrbRFKLO8mlvQmkkaI/JCwOyPbCUzGAcr+DNouxKZgLLkUJW?=
 =?us-ascii?Q?reoqR/1g+nBx03i3JNxc+Dsue3unXpbAqVBY1zHvk+ruFbGrOfTcqbqKAeJr?=
 =?us-ascii?Q?Nsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xQl7Ot/wiUeXWKN/NpbsCpuARgzNUVZvB/vPxUeGKMWovHvgvIfeN3XJ8GD+?=
 =?us-ascii?Q?PHwcSUmbB54YGb6JW5e68v2CZCOlxll62lQEpG4RwMWC2BVVHtwICUcRs9bX?=
 =?us-ascii?Q?62QdBz00rOS0x33BMK0A1jxceNVY0f1mE+2NugxeHZAiqe+SVKV0gPKGh20J?=
 =?us-ascii?Q?xUiyWFISChwRqTZsnKZlfIwh8ZWNJCPa8MQciyiA345WXXEpJN41dgAenYXR?=
 =?us-ascii?Q?wKGPqYTIgAkGW6r2ArIy8TFXGaZyyLKi8hKxGkEW6iACg3/tS7k5mY8/iA23?=
 =?us-ascii?Q?dUpJza4yrnGItUxH6UQeKP8i0pTRZUTT587j7Cas9TKcmVPaSgFFkDhMmmdY?=
 =?us-ascii?Q?KNvqeMj5CoE8hXYwhpUAq5NuHfsKVZsOVHbAIxegxdldUluKymCHnADRvNto?=
 =?us-ascii?Q?7WCivGvY0MIzl7miLA73PIMK3dhDJVtN8G6h7mPUvldi29cFycSlIENVbOIK?=
 =?us-ascii?Q?tQaXW3V3LhRmVplgcyJtNMzzD5g3dU053OW4utoCE7ozKLJEDw9IU9fPivRF?=
 =?us-ascii?Q?3vGsoChmPdNlvqDWSkJ1NHUMGFMwQdX6Kw1qxbu2JF4LHoLX73+p5zINTWoD?=
 =?us-ascii?Q?BU5mohMPFZ6rbMBsDRLtm4AmFt6ZysQVzBuQsy39Hy4rXbu7laKz5+YR/gWd?=
 =?us-ascii?Q?5g0rEha1ipUXyMM0xmpBedfnsxv8xwEW19EhPveW58B1NYFQkLwlSpppYROv?=
 =?us-ascii?Q?SwG+ExpGaev/5iFdlM+DoZL0j47pzbCi5N5kA+6lG4ou9sJMs335DivTA3/T?=
 =?us-ascii?Q?H4J1xt3q8x+I6U0L1Z2y3ZWYUqA/awZsQMQnFBNWMGDuiT3TLprskjGbopi3?=
 =?us-ascii?Q?/zfRdb8qbWm90xwY4dey/qkY1X4/gE/EVYXK8xwb7k/w+7wi1bbCJ3uQhzCo?=
 =?us-ascii?Q?yln67DHP4eTiKCdQhkwK/lBRs16HNBgQP9yZKu/5bh+2KNyNiW3+FS2yIlJ2?=
 =?us-ascii?Q?vLgsjb4P3UfoYosoxfqGqu+ruAyoQA1AerOm53A2SKR0Nuf1zjdpwsYO9H47?=
 =?us-ascii?Q?AM0vhTBfIIm1KHR7pwxSakqdiPQPQ35UAe8NPdDmnOFbpr2JcNxEuARb3v+q?=
 =?us-ascii?Q?Xy7W2TeXzHi1LtY21SFThwU1LQ450hb/a4Qs36tsb13EXdvYuGjkL4RTNJfV?=
 =?us-ascii?Q?tT9U45P6oX0DQRGx3Q4fiOp7oRGKjXGi8JOFf+kgoSJPoSpCB4Lq13endCzv?=
 =?us-ascii?Q?aNh6zExToB2iwviTS36bceKzulUqIx0lvPaNZzp6iHyjlqX/iEFqZKIZkgXI?=
 =?us-ascii?Q?FlKpXr3FInNXE+3S5/zptrcvz4DcgIQValQXHx3lR95Vuh5aXqxSuPWjKWEs?=
 =?us-ascii?Q?rN+U7ecYjVMzlFjOgQksC9XLzdioDTNEjx58VSiXgGIq3cQD0Ek7HJ7C0qRE?=
 =?us-ascii?Q?0IfeVLfaglUqXPetWmZzNB1ExW3uBO/X6BTL0crzHLY27xZA8sfjdIqziQfg?=
 =?us-ascii?Q?S4pbFq9Si4TveCUebp/Je77unNsvp+LHydc9J6KR/VsKRgembXeONpOkh1nf?=
 =?us-ascii?Q?KOCRkMu7yJU5qkMhezpe1gAEVrIyrIDSjqR/kjyhVmuiRU+0OomXG3zn3wZe?=
 =?us-ascii?Q?glXgDI64jSWdtpXFFqxczknBUzi/eCb2MySYZQp2waoF3xJzpzjKAIOwNQfk?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9354588-2851-4997-a516-08dcb8022903
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 23:30:59.8473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kWpHus840j7TRyeltlveKR7drEnAuslmCABzJlHgb8KF2f9IfKft0hhOB+SAKwpzoJU3aROEFlHJ/c/CkFoGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

On Thu, Aug 08, 2024 at 10:41:33AM -0700, Ashutosh Dixit wrote:
> Here we introduce 'struct xe_oa_fence' which will contain the fence used
> for signalling xe_syncs (in a later patch). The struct also contains the
> work struct used for signalling the fences. Otherwise, this patch is a
> simple refactor of the previous patch. In this patch the work function is
> executed synchronously.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 73 ++++++++++++++++++++++++++++++--------
>  1 file changed, 59 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d842c801fb9f1..f97d64ffb460f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -90,6 +90,15 @@ struct xe_oa_config_bo {
>  	struct xe_bb *bb;
>  };
>  
> +struct xe_oa_fence {

See my comment here [1], quite sure this is not needed.

Matt

[1] https://patchwork.freedesktop.org/patch/607602/?series=137058&rev=1#comment_1104294

> +	/* @xe: pointer to xe device */
> +	struct xe_device *xe;
> +	/* @work: work to signal that OA configuration is applied */
> +	struct work_struct work;
> +	/* @config_fence: dma fence for OA config to be applied */
> +	struct dma_fence *config_fence;
> +};
> +
>  #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>  
>  static const struct xe_oa_format oa_formats[] = {
> @@ -905,14 +914,51 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
>  	return oa_bo;
>  }
>  
> -static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
> +static void xe_oa_fence_work_fn(struct work_struct *w)
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> -	struct xe_oa_config_bo *oa_bo;
> +	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work);
>  	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> -	struct dma_fence *fence;
>  	long timeout;
>  
> +	/* Wait till all previous batches have executed */
> +	timeout = dma_fence_wait_timeout(ofence->config_fence, false, 5 * HZ);
> +	dma_fence_put(ofence->config_fence);
> +	if (timeout < 0)
> +		err = timeout;
> +	else if (!timeout)
> +		err = -ETIME;
> +	if (err)
> +		drm_dbg(&ofence->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> +
> +	/* Additional empirical delay needed for NOA programming after registers are written */
> +	usleep_range(us, 2 * us);
> +
> +	kfree(ofence);
> +}
> +
> +static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fence *config_fence)
> +{
> +	struct xe_oa_fence *ofence;
> +
> +	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
> +	if (!ofence)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ofence->xe = xe;
> +	INIT_WORK(&ofence->work, xe_oa_fence_work_fn);
> +	ofence->config_fence = config_fence;
> +
> +	return ofence;
> +}
> +
> +static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
> +{
> +	struct xe_oa_config_bo *oa_bo;
> +	struct xe_oa_fence *ofence;
> +	struct dma_fence *fence;
> +	int err;
> +
>  	/* Emit OA configuration batch */
>  	oa_bo = xe_oa_alloc_config_buffer(stream, config);
>  	if (IS_ERR(oa_bo)) {
> @@ -924,18 +970,17 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>  	if (err)
>  		goto exit;
>  
> -	/* Wait till all previous batches have executed */
> -	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
> -	dma_fence_put(fence);
> -	if (timeout < 0)
> -		err = timeout;
> -	else if (!timeout)
> -		err = -ETIME;
> -	if (err)
> -		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> +	ofence = xe_oa_fence_init(stream->oa->xe, fence);
> +	if (IS_ERR(ofence)) {
> +		err = PTR_ERR(ofence);
> +		goto put_fence;
> +	}
>  
> -	/* Additional empirical delay needed for NOA programming after registers are written */
> -	usleep_range(us, 2 * us);
> +	xe_oa_fence_work_fn(&ofence->work);
> +
> +	return 0;
> +put_fence:
> +	dma_fence_put(fence);
>  exit:
>  	return err;
>  }
> -- 
> 2.41.0
> 
